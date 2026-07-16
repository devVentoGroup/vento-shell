alter table public.order_delivery_sessions
  add column if not exists access_token_hash text,
  add column if not exists picked_up_at timestamptz;

create unique index if not exists order_delivery_sessions_access_token_hash_key
  on public.order_delivery_sessions (access_token_hash)
  where access_token_hash is not null;

create or replace function public.create_order_delivery_courier_link(
  p_order_id uuid,
  p_site_id uuid
)
returns jsonb
language plpgsql
security definer
set search_path = public, app_private, extensions
as $$
declare
  v_uid uuid := auth.uid();
  v_order public.orders%rowtype;
  v_session public.order_delivery_sessions%rowtype;
  v_session_id uuid;
  v_token text;
  v_pin text;
begin
  if v_uid is null then
    raise exception 'authentication_required';
  end if;

  if not public.has_permission('pulso.pos.main', p_site_id, null) then
    raise exception 'permission_denied';
  end if;

  select * into v_order
  from public.orders
  where id = p_order_id and site_id = p_site_id
  for update;

  if v_order.id is null then
    raise exception 'order_not_found';
  end if;

  if v_order.fulfillment_type <> 'delivery' then
    raise exception 'delivery_required';
  end if;

  if v_order.status in ('delivered','cancelled') then
    raise exception 'order_closed';
  end if;

  select * into v_session
  from public.order_delivery_sessions
  where order_id = p_order_id
  for update;

  if v_session.id is null then
    v_session_id := gen_random_uuid();
    v_pin := app_private.delivery_pin_for_session(v_session_id);

    insert into public.order_delivery_sessions (
      id, order_id, site_id, status, confirmation_pin_hash, expires_at, metadata
    ) values (
      v_session_id,
      v_order.id,
      v_order.site_id,
      case when v_order.dispatch_status = 'on_the_way' or v_order.status = 'on_the_way' then 'in_transit' else 'pending' end,
      encode(extensions.digest(v_pin, 'sha256'::text), 'hex'),
      now() + interval '12 hours',
      jsonb_build_object('created_by', v_uid, 'created_from', 'pulso')
    )
    returning * into v_session;
  elsif v_session.status in ('confirmed','cancelled') then
    raise exception 'delivery_session_closed';
  end if;

  v_token := encode(extensions.gen_random_bytes(32), 'hex');

  update public.order_delivery_sessions
  set access_token_hash = encode(extensions.digest(v_token, 'sha256'::text), 'hex'),
      expires_at = greatest(expires_at, now() + interval '12 hours'),
      updated_at = now(),
      metadata = coalesce(metadata, '{}'::jsonb) || jsonb_build_object(
        'link_generated_by', v_uid,
        'link_generated_at', now()
      )
  where id = v_session.id
  returning * into v_session;

  return jsonb_build_object(
    'ok', true,
    'order_id', v_order.id,
    'session_id', v_session.id,
    'token', v_token,
    'url', 'https://clzdpinthhtknkmefsxx.supabase.co/functions/v1/delivery-portal?token=' || v_token,
    'expires_at', v_session.expires_at
  );
end;
$$;

create or replace function public.get_delivery_portal_data_by_token(p_token text)
returns jsonb
language plpgsql
security definer
set search_path = public, extensions
as $$
declare
  v_session public.order_delivery_sessions%rowtype;
  v_order public.orders%rowtype;
  v_gift public.order_gift_details%rowtype;
  v_hash text;
begin
  if nullif(trim(coalesce(p_token, '')), '') is null then
    return jsonb_build_object('ok', false, 'error', 'token_required');
  end if;

  v_hash := encode(extensions.digest(trim(p_token), 'sha256'::text), 'hex');

  select * into v_session
  from public.order_delivery_sessions
  where access_token_hash = v_hash
  for update;

  if v_session.id is null then
    return jsonb_build_object('ok', false, 'error', 'invalid_token');
  end if;

  if v_session.status in ('pending','in_transit') and v_session.expires_at <= now() then
    update public.order_delivery_sessions
    set status = 'expired', updated_at = now()
    where id = v_session.id
    returning * into v_session;
  end if;

  select * into v_order from public.orders where id = v_session.order_id;
  select * into v_gift from public.order_gift_details where order_id = v_session.order_id;

  update public.order_delivery_sessions
  set opened_at = coalesce(opened_at, now()), updated_at = now()
  where id = v_session.id;

  return jsonb_build_object(
    'ok', true,
    'session', jsonb_build_object(
      'status', v_session.status,
      'expires_at', v_session.expires_at,
      'picked_up_at', v_session.picked_up_at,
      'confirmed_at', v_session.confirmed_at,
      'attempt_count', v_session.attempt_count,
      'max_attempts', v_session.max_attempts,
      'issue_code', v_session.issue_code,
      'issue_notes', v_session.issue_notes
    ),
    'order', jsonb_build_object(
      'id', v_order.id,
      'short_id', upper(left(v_order.id::text, 6)),
      'status', v_order.status,
      'dispatch_status', v_order.dispatch_status,
      'contact_phone', v_order.contact_phone,
      'delivery_address', v_order.delivery_address,
      'delivery_zone', v_order.delivery_zone,
      'notes', v_order.notes,
      'payment_status', v_order.payment_status,
      'amount_to_collect', case when v_order.payment_status = 'paid' then 0 else v_order.total_amount end,
      'dispatch_partner', v_order.dispatch_partner,
      'dispatch_reference', v_order.dispatch_reference,
      'is_gift', v_order.is_gift
    ),
    'gift', case when v_gift.id is null then null else jsonb_build_object(
      'recipient_name', v_gift.recipient_name,
      'recipient_phone', v_gift.recipient_phone,
      'is_surprise', v_gift.is_surprise,
      'contact_policy', v_gift.contact_policy,
      'fallback_contact_policy', v_gift.fallback_contact_policy,
      'hide_prices', v_gift.hide_prices
    ) end
  );
end;
$$;

create or replace function public.update_delivery_portal_state(
  p_token text,
  p_action text,
  p_pin text default null,
  p_issue_code text default null,
  p_issue_notes text default null
)
returns jsonb
language plpgsql
security definer
set search_path = public, extensions
as $$
declare
  v_session public.order_delivery_sessions%rowtype;
  v_order public.orders%rowtype;
  v_hash text;
  v_action text := lower(trim(coalesce(p_action, '')));
  v_pin text := regexp_replace(coalesce(p_pin, ''), '[^0-9]', '', 'g');
  v_now timestamptz := now();
  v_from_status text;
  v_from_dispatch text;
  v_next_attempts integer;
begin
  if nullif(trim(coalesce(p_token, '')), '') is null then
    return jsonb_build_object('ok', false, 'error', 'token_required');
  end if;

  v_hash := encode(extensions.digest(trim(p_token), 'sha256'::text), 'hex');

  select * into v_session
  from public.order_delivery_sessions
  where access_token_hash = v_hash
  for update;

  if v_session.id is null then
    return jsonb_build_object('ok', false, 'error', 'invalid_token');
  end if;

  if v_session.status in ('pending','in_transit') and v_session.expires_at <= v_now then
    update public.order_delivery_sessions set status = 'expired', updated_at = v_now where id = v_session.id;
    return jsonb_build_object('ok', false, 'error', 'session_expired');
  end if;

  select * into v_order
  from public.orders
  where id = v_session.order_id
  for update;

  if v_order.id is null then
    return jsonb_build_object('ok', false, 'error', 'order_not_found');
  end if;

  v_from_status := v_order.status;
  v_from_dispatch := v_order.dispatch_status;

  if v_action = 'picked_up' then
    if v_session.status not in ('pending','in_transit') then
      return jsonb_build_object('ok', false, 'error', 'invalid_session_state');
    end if;

    update public.order_delivery_sessions
    set picked_up_at = coalesce(picked_up_at, v_now), updated_at = v_now
    where id = v_session.id;

    insert into public.order_status_events (
      order_id, site_id, changed_by, actor_type, operation,
      from_status, to_status, from_dispatch_status, to_dispatch_status,
      dispatch_partner, dispatch_reference, metadata
    ) values (
      v_order.id, v_order.site_id, null, 'courier_external', 'courier_picked_up',
      v_from_status, v_from_status, v_from_dispatch, v_from_dispatch,
      v_order.dispatch_partner, v_order.dispatch_reference,
      jsonb_build_object('delivery_session_id', v_session.id)
    );

    return jsonb_build_object('ok', true, 'status', v_session.status, 'picked_up_at', v_now);

  elsif v_action = 'mark_in_transit' then
    if v_order.fulfillment_type <> 'delivery' then
      return jsonb_build_object('ok', false, 'error', 'delivery_required');
    end if;
    if coalesce(v_order.payment_status, 'unpaid') <> 'paid' then
      return jsonb_build_object('ok', false, 'error', 'payment_not_approved');
    end if;
    if v_order.status not in ('ready_for_dispatch','on_the_way','in_transit') then
      return jsonb_build_object('ok', false, 'error', 'invalid_order_state');
    end if;

    update public.orders
    set status = 'on_the_way',
        dispatch_status = 'on_the_way',
        on_the_way_at = coalesce(on_the_way_at, v_now),
        updated_at = v_now
    where id = v_order.id;

    update public.order_delivery_sessions
    set status = 'in_transit',
        picked_up_at = coalesce(picked_up_at, v_now),
        updated_at = v_now
    where id = v_session.id;

    insert into public.order_status_events (
      order_id, site_id, changed_by, actor_type, operation,
      from_status, to_status, from_dispatch_status, to_dispatch_status,
      dispatch_partner, dispatch_reference, metadata
    ) values (
      v_order.id, v_order.site_id, null, 'courier_external', 'mark_in_transit',
      v_from_status, 'on_the_way', v_from_dispatch, 'on_the_way',
      v_order.dispatch_partner, v_order.dispatch_reference,
      jsonb_build_object('delivery_session_id', v_session.id)
    );

    return jsonb_build_object('ok', true, 'status', 'in_transit');

  elsif v_action = 'confirm_delivery' then
    if v_session.status <> 'in_transit' then
      return jsonb_build_object('ok', false, 'error', 'delivery_not_in_transit');
    end if;
    if length(v_pin) <> 6 then
      return jsonb_build_object('ok', false, 'error', 'pin_invalid_format');
    end if;

    if encode(extensions.digest(v_pin, 'sha256'::text), 'hex') <> v_session.confirmation_pin_hash then
      v_next_attempts := v_session.attempt_count + 1;
      update public.order_delivery_sessions
      set attempt_count = v_next_attempts,
          status = case when v_next_attempts >= v_session.max_attempts then 'expired' else status end,
          updated_at = v_now
      where id = v_session.id;

      return jsonb_build_object(
        'ok', false,
        'error', case when v_next_attempts >= v_session.max_attempts then 'attempts_exhausted' else 'incorrect_pin' end,
        'attempts_remaining', greatest(v_session.max_attempts - v_next_attempts, 0)
      );
    end if;

    update public.order_delivery_sessions
    set status = 'confirmed',
        confirmed_at = v_now,
        confirmed_by = 'courier_pin',
        updated_at = v_now
    where id = v_session.id;

    update public.orders
    set status = 'delivered',
        dispatch_status = 'delivered',
        delivered_at = coalesce(delivered_at, v_now),
        updated_at = v_now
    where id = v_order.id;

    insert into public.order_status_events (
      order_id, site_id, changed_by, actor_type, operation,
      from_status, to_status, from_dispatch_status, to_dispatch_status,
      dispatch_partner, dispatch_reference, metadata
    ) values (
      v_order.id, v_order.site_id, null, 'courier_external', 'confirm_delivery_pin',
      v_from_status, 'delivered', v_from_dispatch, 'delivered',
      v_order.dispatch_partner, v_order.dispatch_reference,
      jsonb_build_object('delivery_session_id', v_session.id, 'confirmation_method', 'client_pin')
    );

    return jsonb_build_object('ok', true, 'status', 'confirmed', 'confirmed_at', v_now);

  elsif v_action = 'report_issue' then
    if nullif(trim(coalesce(p_issue_code, '')), '') is null then
      return jsonb_build_object('ok', false, 'error', 'issue_code_required');
    end if;
    if p_issue_code not in ('client_unreachable','wrong_address','access_blocked','client_rejected','order_incomplete','other') then
      return jsonb_build_object('ok', false, 'error', 'invalid_issue_code');
    end if;

    update public.order_delivery_sessions
    set status = 'issue',
        issue_code = p_issue_code,
        issue_notes = nullif(trim(coalesce(p_issue_notes, '')), ''),
        updated_at = v_now
    where id = v_session.id;

    insert into public.order_status_events (
      order_id, site_id, changed_by, actor_type, operation,
      from_status, to_status, from_dispatch_status, to_dispatch_status,
      dispatch_partner, dispatch_reference, metadata
    ) values (
      v_order.id, v_order.site_id, null, 'courier_external', 'report_delivery_issue',
      v_from_status, v_from_status, v_from_dispatch, v_from_dispatch,
      v_order.dispatch_partner, v_order.dispatch_reference,
      jsonb_build_object(
        'delivery_session_id', v_session.id,
        'issue_code', p_issue_code,
        'issue_notes', nullif(trim(coalesce(p_issue_notes, '')), '')
      )
    );

    return jsonb_build_object('ok', true, 'status', 'issue', 'issue_code', p_issue_code);
  end if;

  return jsonb_build_object('ok', false, 'error', 'invalid_action');
end;
$$;

revoke all on function public.create_order_delivery_courier_link(uuid, uuid) from public, anon;
grant execute on function public.create_order_delivery_courier_link(uuid, uuid) to authenticated, service_role;

revoke all on function public.get_delivery_portal_data_by_token(text) from public, anon, authenticated;
grant execute on function public.get_delivery_portal_data_by_token(text) to service_role;

revoke all on function public.update_delivery_portal_state(text, text, text, text, text) from public, anon, authenticated;
grant execute on function public.update_delivery_portal_state(text, text, text, text, text) to service_role;