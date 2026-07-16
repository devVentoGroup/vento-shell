alter table public.order_gift_details
  add column if not exists card_prepared_by uuid references auth.users(id) on delete set null,
  add column if not exists card_included_by uuid references auth.users(id) on delete set null,
  add column if not exists price_free_packaging_confirmed_by uuid references auth.users(id) on delete set null;

create or replace function public.update_order_gift_operational_state(
  p_order_id uuid,
  p_site_id uuid,
  p_operation text,
  p_metadata jsonb default '{}'::jsonb
)
returns jsonb
language plpgsql
security definer
set search_path to 'public'
as $function$
declare
  v_uid uuid := auth.uid();
  v_permission boolean := false;
  v_operation text := lower(trim(coalesce(p_operation, '')));
  v_order public.orders%rowtype;
  v_gift public.order_gift_details%rowtype;
  v_now timestamptz := now();
  v_event_id uuid;
  v_snapshot jsonb;
begin
  if v_uid is null then
    raise exception 'authentication_required';
  end if;

  select public.has_permission('pulso.pos.main', p_site_id, null)
  into v_permission;

  if not coalesce(v_permission, false) then
    raise exception 'permission_denied';
  end if;

  select *
  into v_order
  from public.orders o
  where o.id = p_order_id
    and o.site_id = p_site_id
  for update;

  if v_order.id is null then
    raise exception 'order_not_found';
  end if;

  if not coalesce(v_order.is_gift, false) then
    raise exception 'order_is_not_gift';
  end if;

  select *
  into v_gift
  from public.order_gift_details g
  where g.order_id = p_order_id
  for update;

  if v_gift.id is null then
    raise exception 'gift_details_not_found';
  end if;

  if v_operation = 'mark_card_prepared' then
    if not v_gift.card_requested then
      raise exception 'gift_card_not_requested';
    end if;

    if v_gift.card_status = 'pending' then
      update public.order_gift_details
      set card_status = 'prepared',
          card_prepared_at = coalesce(card_prepared_at, v_now),
          card_prepared_by = coalesce(card_prepared_by, v_uid),
          updated_at = v_now
      where id = v_gift.id;
    end if;

  elsif v_operation = 'mark_card_included' then
    if not v_gift.card_requested then
      raise exception 'gift_card_not_requested';
    end if;

    if v_gift.card_status = 'pending' then
      raise exception 'gift_card_must_be_prepared_first';
    end if;

    if v_gift.card_status = 'prepared' then
      update public.order_gift_details
      set card_status = 'included',
          card_included_at = coalesce(card_included_at, v_now),
          card_included_by = coalesce(card_included_by, v_uid),
          updated_at = v_now
      where id = v_gift.id;
    end if;

  elsif v_operation = 'confirm_price_free_packaging' then
    if not v_gift.hide_prices then
      raise exception 'price_free_packaging_not_required';
    end if;

    if v_gift.price_free_packaging_confirmed_at is null then
      update public.order_gift_details
      set price_free_packaging_confirmed_at = v_now,
          price_free_packaging_confirmed_by = v_uid,
          updated_at = v_now
      where id = v_gift.id;
    end if;

  else
    raise exception 'invalid_gift_operation';
  end if;

  select *
  into v_gift
  from public.order_gift_details g
  where g.id = v_gift.id;

  v_snapshot := jsonb_strip_nulls(jsonb_build_object(
    'is_gift', true,
    'buyer_name', v_gift.buyer_name,
    'buyer_phone', v_gift.buyer_phone,
    'recipient_name', v_gift.recipient_name,
    'recipient_phone', v_gift.recipient_phone,
    'recipient_relationship', v_gift.recipient_relationship,
    'is_surprise', v_gift.is_surprise,
    'contact_policy', v_gift.contact_policy,
    'fallback_contact_policy', v_gift.fallback_contact_policy,
    'card_requested', v_gift.card_requested,
    'card_message', v_gift.card_message,
    'card_to', v_gift.card_to,
    'card_from', v_gift.card_from,
    'card_status', v_gift.card_status,
    'card_prepared_at', v_gift.card_prepared_at,
    'card_prepared_by', v_gift.card_prepared_by,
    'card_included_at', v_gift.card_included_at,
    'card_included_by', v_gift.card_included_by,
    'hide_prices', v_gift.hide_prices,
    'price_free_packaging_confirmed_at', v_gift.price_free_packaging_confirmed_at,
    'price_free_packaging_confirmed_by', v_gift.price_free_packaging_confirmed_by
  ));

  update public.orders
  set guest_info = coalesce(guest_info, '{}'::jsonb)
        || jsonb_build_object('gift', v_snapshot),
      updated_at = v_now
  where id = v_order.id;

  insert into public.order_status_events (
    order_id,
    site_id,
    changed_by,
    actor_type,
    operation,
    from_status,
    to_status,
    from_dispatch_status,
    to_dispatch_status,
    dispatch_partner,
    dispatch_reference,
    metadata
  )
  values (
    v_order.id,
    v_order.site_id,
    v_uid,
    'staff',
    v_operation,
    v_order.status,
    v_order.status,
    v_order.dispatch_status,
    v_order.dispatch_status,
    v_order.dispatch_partner,
    v_order.dispatch_reference,
    coalesce(p_metadata, '{}'::jsonb)
      || jsonb_build_object('gift_card_status', v_gift.card_status)
  )
  returning id into v_event_id;

  return jsonb_build_object(
    'ok', true,
    'event_id', v_event_id,
    'order_id', v_order.id,
    'operation', v_operation,
    'card_status', v_gift.card_status,
    'card_prepared_at', v_gift.card_prepared_at,
    'card_included_at', v_gift.card_included_at,
    'price_free_packaging_confirmed_at', v_gift.price_free_packaging_confirmed_at
  );
end;
$function$;

revoke execute on function public.update_order_gift_operational_state(uuid, uuid, text, jsonb)
  from public, anon;
grant execute on function public.update_order_gift_operational_state(uuid, uuid, text, jsonb)
  to authenticated, service_role;