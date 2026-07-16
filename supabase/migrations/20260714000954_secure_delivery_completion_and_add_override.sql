do $$
declare
  v_app_id uuid;
  v_permission_id uuid;
begin
  select id into v_app_id from public.apps where code = 'pulso';
  if v_app_id is null then
    raise exception 'pulso_app_not_found';
  end if;

  insert into public.app_permissions (
    app_id, code, name, description, human_label, human_description,
    human_group, human_sort_order, permission_audience, is_operational,
    requires_active_work_context, is_active
  ) values (
    v_app_id,
    'delivery.override',
    'Confirmar entrega manualmente',
    'Permite cerrar manualmente un domicilio cuando no es posible validar el PIN del cliente.',
    'Override de entrega',
    'Permite confirmar manualmente una entrega con motivo y comentario obligatorio.',
    'Domicilios',
    320,
    'administrative',
    true,
    false,
    true
  )
  on conflict (app_id, code) do update set
    name = excluded.name,
    description = excluded.description,
    human_label = excluded.human_label,
    human_description = excluded.human_description,
    human_group = excluded.human_group,
    human_sort_order = excluded.human_sort_order,
    permission_audience = excluded.permission_audience,
    is_operational = excluded.is_operational,
    requires_active_work_context = excluded.requires_active_work_context,
    is_active = true,
    updated_at = now()
  returning id into v_permission_id;

  if v_permission_id is null then
    select id into v_permission_id
    from public.app_permissions
    where app_id = v_app_id and code = 'delivery.override';
  end if;

  insert into public.role_permissions (
    role, permission_id, scope_type, is_allowed
  )
  select role_code, v_permission_id, 'global'::public.permission_scope_type, true
  from (values ('propietario'), ('gerente_general'), ('gerente')) as roles(role_code)
  on conflict (role, permission_id, scope_type, scope_site_type, scope_area_kind)
  do update set is_allowed = true;
end
$$;

create or replace function public.update_order_operational_state(
  p_order_id uuid,
  p_site_id uuid,
  p_operation text,
  p_dispatch_partner text default null,
  p_dispatch_reference text default null,
  p_metadata jsonb default '{}'::jsonb
)
returns jsonb
language plpgsql
security definer
set search_path to 'public'
as $$
declare
  v_uid uuid := auth.uid();
  v_order public.orders%rowtype;
  v_permission boolean := false;
  v_operation text := lower(trim(coalesce(p_operation, '')));
  v_from_status text;
  v_to_status text;
  v_from_dispatch text;
  v_to_dispatch text;
  v_partner text;
  v_reference text;
  v_event_id uuid;
  v_gift public.order_gift_details%rowtype;
  v_delivery_session public.order_delivery_sessions%rowtype;
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

  if v_operation <> 'mark_cancelled'
    and v_order.fulfillment_type = 'delivery'
    and coalesce(v_order.payment_status, 'unpaid') <> 'paid' then
    raise exception 'payment_not_approved';
  end if;

  if v_operation <> 'mark_cancelled'
    and coalesce(v_order.fulfillment_type, '') <> 'delivery'
    and coalesce(v_order.payment_status, 'unpaid') not in ('paid', 'not_required') then
    raise exception 'payment_not_allowed_for_operation';
  end if;

  if v_operation = 'mark_ready' and coalesce(v_order.is_gift, false) then
    select * into v_gift
    from public.order_gift_details g
    where g.order_id = v_order.id;

    if v_gift.id is null then raise exception 'gift_details_not_found'; end if;
    if v_gift.card_requested and v_gift.card_status <> 'included' then
      raise exception 'gift_card_checklist_incomplete';
    end if;
    if v_gift.hide_prices and v_gift.price_free_packaging_confirmed_at is null then
      raise exception 'gift_packaging_checklist_incomplete';
    end if;
  end if;

  v_from_status := coalesce(v_order.status, 'pending');
  v_from_dispatch := coalesce(v_order.dispatch_status, 'not_required');
  v_to_status := v_from_status;
  v_to_dispatch := v_from_dispatch;
  v_partner := v_order.dispatch_partner;
  v_reference := v_order.dispatch_reference;

  if v_operation = 'mark_preparing' then
    if v_from_status not in ('pending', 'confirmed') then raise exception 'invalid_transition:mark_preparing'; end if;
    v_to_status := 'preparing';

  elsif v_operation = 'mark_ready' then
    if v_from_status not in ('pending', 'confirmed', 'preparing') then raise exception 'invalid_transition:mark_ready'; end if;
    v_to_status := 'ready_for_dispatch';
    if v_order.fulfillment_type = 'delivery' and v_to_dispatch in ('not_required', 'pending', 'scheduled') then
      v_to_dispatch := 'pending';
    end if;

  elsif v_operation = 'mark_in_transit' then
    if v_order.fulfillment_type <> 'delivery' then raise exception 'invalid_fulfillment_for_in_transit'; end if;
    if v_from_status not in ('ready_for_dispatch', 'on_the_way', 'in_transit') then raise exception 'invalid_transition:mark_in_transit'; end if;
    v_to_status := 'on_the_way';
    v_to_dispatch := 'on_the_way';

  elsif v_operation = 'mark_delivered' then
    if v_from_status = 'cancelled' then raise exception 'invalid_transition:mark_delivered'; end if;

    if v_order.fulfillment_type = 'delivery' then
      select * into v_delivery_session
      from public.order_delivery_sessions
      where order_id = v_order.id;

      if v_delivery_session.id is null or v_delivery_session.status <> 'confirmed' then
        raise exception 'delivery_confirmation_required';
      end if;

      v_to_status := 'delivered';
      v_to_dispatch := 'delivered';
    else
      v_to_status := 'delivered';
      v_to_dispatch := 'not_required';
    end if;

  elsif v_operation = 'mark_cancelled' then
    if v_from_status = 'delivered' then raise exception 'invalid_transition:mark_cancelled'; end if;
    v_to_status := 'cancelled';
    v_to_dispatch := case when v_order.fulfillment_type = 'delivery' then 'cancelled' else 'not_required' end;

  elsif v_operation = 'assign_dispatch' then
    if v_order.fulfillment_type <> 'delivery' then raise exception 'invalid_fulfillment_for_assign_dispatch'; end if;
    if v_from_status in ('delivered', 'cancelled') then raise exception 'invalid_transition:assign_dispatch'; end if;
    if nullif(trim(coalesce(p_dispatch_partner, '')), '') is null
       and nullif(trim(coalesce(p_dispatch_reference, '')), '') is null then
      raise exception 'dispatch_partner_or_reference_required';
    end if;
    if nullif(trim(coalesce(p_dispatch_partner, '')), '') is not null then v_partner := trim(p_dispatch_partner); end if;
    if nullif(trim(coalesce(p_dispatch_reference, '')), '') is not null then v_reference := trim(p_dispatch_reference); end if;
    if v_to_dispatch in ('not_required', 'pending', 'scheduled') then v_to_dispatch := 'assigned'; end if;

  else
    raise exception 'invalid_operation';
  end if;

  update public.orders
  set status = v_to_status,
      dispatch_status = v_to_dispatch,
      dispatch_partner = v_partner,
      dispatch_reference = v_reference,
      delivered_at = case when v_to_status = 'delivered' then coalesce(delivered_at, now()) else delivered_at end,
      updated_at = now()
  where id = v_order.id;

  insert into public.order_status_events (
    order_id, site_id, changed_by, actor_type, operation,
    from_status, to_status, from_dispatch_status, to_dispatch_status,
    dispatch_partner, dispatch_reference, metadata
  ) values (
    v_order.id, v_order.site_id, v_uid, 'staff', v_operation,
    v_from_status, v_to_status, v_from_dispatch, v_to_dispatch,
    v_partner, v_reference, coalesce(p_metadata, '{}'::jsonb)
  ) returning id into v_event_id;

  return jsonb_build_object(
    'ok', true,
    'event_id', v_event_id,
    'order_id', v_order.id,
    'site_id', v_order.site_id,
    'operation', v_operation,
    'status', v_to_status,
    'dispatch_status', v_to_dispatch,
    'dispatch_partner', v_partner,
    'dispatch_reference', v_reference
  );
end;
$$;

create or replace function public.override_order_delivery_confirmation(
  p_order_id uuid,
  p_site_id uuid,
  p_reason text,
  p_comment text,
  p_metadata jsonb default '{}'::jsonb
)
returns jsonb
language plpgsql
security definer
set search_path to 'public'
as $$
declare
  v_uid uuid := auth.uid();
  v_order public.orders%rowtype;
  v_session public.order_delivery_sessions%rowtype;
  v_reason text := lower(trim(coalesce(p_reason, '')));
  v_comment text := trim(coalesce(p_comment, ''));
  v_now timestamptz := now();
  v_event_id uuid;
begin
  if v_uid is null then raise exception 'authentication_required'; end if;
  if not public.has_permission('pulso.delivery.override', p_site_id, null) then
    raise exception 'permission_denied';
  end if;
  if v_reason not in ('client_without_pin','authorized_third_party','technical_failure','other') then
    raise exception 'invalid_override_reason';
  end if;
  if length(v_comment) < 8 then
    raise exception 'override_comment_required';
  end if;

  select * into v_order
  from public.orders
  where id = p_order_id and site_id = p_site_id
  for update;

  if v_order.id is null then raise exception 'order_not_found'; end if;
  if v_order.fulfillment_type <> 'delivery' then raise exception 'delivery_required'; end if;
  if v_order.status in ('delivered','cancelled') then raise exception 'order_closed'; end if;
  if v_order.status not in ('on_the_way','in_transit','ready_for_dispatch') then
    raise exception 'invalid_order_state';
  end if;

  select * into v_session
  from public.order_delivery_sessions
  where order_id = v_order.id
  for update;

  if v_session.id is null then
    raise exception 'delivery_session_not_found';
  end if;

  update public.order_delivery_sessions
  set status = 'confirmed',
      confirmed_at = v_now,
      confirmed_by = 'staff_override',
      issue_code = coalesce(issue_code, 'manual_override'),
      issue_notes = concat_ws(' | ', nullif(issue_notes, ''), v_reason || ': ' || v_comment),
      updated_at = v_now,
      metadata = coalesce(metadata, '{}'::jsonb) || jsonb_build_object(
        'override_by', v_uid,
        'override_reason', v_reason,
        'override_comment', v_comment,
        'override_at', v_now
      ) || coalesce(p_metadata, '{}'::jsonb)
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
    v_order.id, v_order.site_id, v_uid, 'staff', 'override_delivery_confirmation',
    v_order.status, 'delivered', v_order.dispatch_status, 'delivered',
    v_order.dispatch_partner, v_order.dispatch_reference,
    jsonb_build_object(
      'delivery_session_id', v_session.id,
      'override_reason', v_reason,
      'override_comment', v_comment,
      'confirmation_method', 'staff_override'
    ) || coalesce(p_metadata, '{}'::jsonb)
  ) returning id into v_event_id;

  return jsonb_build_object(
    'ok', true,
    'order_id', v_order.id,
    'status', 'delivered',
    'dispatch_status', 'delivered',
    'event_id', v_event_id,
    'confirmed_at', v_now
  );
end;
$$;

revoke all on function public.override_order_delivery_confirmation(uuid, uuid, text, text, jsonb) from public, anon;
grant execute on function public.override_order_delivery_confirmation(uuid, uuid, text, text, jsonb) to authenticated, service_role;
