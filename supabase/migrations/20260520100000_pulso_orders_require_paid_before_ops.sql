begin;

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
set search_path = public
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

  if v_operation <> 'mark_cancelled' and coalesce(v_order.payment_status, 'unpaid') <> 'paid' then
    raise exception 'payment_not_approved';
  end if;

  v_from_status := coalesce(v_order.status, 'pending');
  v_from_dispatch := coalesce(v_order.dispatch_status, 'not_required');
  v_to_status := v_from_status;
  v_to_dispatch := v_from_dispatch;
  v_partner := v_order.dispatch_partner;
  v_reference := v_order.dispatch_reference;

  if v_operation = 'mark_preparing' then
    if v_from_status not in ('pending', 'confirmed') then
      raise exception 'invalid_transition:mark_preparing';
    end if;
    v_to_status := 'preparing';

  elsif v_operation = 'mark_ready' then
    if v_from_status not in ('pending', 'confirmed', 'preparing') then
      raise exception 'invalid_transition:mark_ready';
    end if;
    v_to_status := 'ready_for_dispatch';
    if v_order.fulfillment_type = 'delivery'
      and v_to_dispatch in ('not_required', 'pending', 'scheduled') then
      v_to_dispatch := 'pending';
    end if;

  elsif v_operation = 'mark_in_transit' then
    if v_order.fulfillment_type <> 'delivery' then
      raise exception 'invalid_fulfillment_for_in_transit';
    end if;
    if v_from_status not in ('ready_for_dispatch', 'on_the_way', 'in_transit') then
      raise exception 'invalid_transition:mark_in_transit';
    end if;
    v_to_status := 'on_the_way';
    v_to_dispatch := 'on_the_way';

  elsif v_operation = 'mark_delivered' then
    if v_from_status = 'cancelled' then
      raise exception 'invalid_transition:mark_delivered';
    end if;
    v_to_status := 'delivered';
    if v_order.fulfillment_type = 'delivery' then
      v_to_dispatch := 'delivered';
    else
      v_to_dispatch := 'not_required';
    end if;

  elsif v_operation = 'mark_cancelled' then
    if v_from_status = 'delivered' then
      raise exception 'invalid_transition:mark_cancelled';
    end if;
    v_to_status := 'cancelled';
    if v_order.fulfillment_type = 'delivery' then
      v_to_dispatch := 'cancelled';
    else
      v_to_dispatch := 'not_required';
    end if;

  elsif v_operation = 'assign_dispatch' then
    if v_order.fulfillment_type <> 'delivery' then
      raise exception 'invalid_fulfillment_for_assign_dispatch';
    end if;
    if v_from_status in ('delivered', 'cancelled') then
      raise exception 'invalid_transition:assign_dispatch';
    end if;

    if nullif(trim(coalesce(p_dispatch_partner, '')), '') is null
       and nullif(trim(coalesce(p_dispatch_reference, '')), '') is null then
      raise exception 'dispatch_partner_or_reference_required';
    end if;

    if nullif(trim(coalesce(p_dispatch_partner, '')), '') is not null then
      v_partner := trim(p_dispatch_partner);
    end if;

    if nullif(trim(coalesce(p_dispatch_reference, '')), '') is not null then
      v_reference := trim(p_dispatch_reference);
    end if;

    if v_to_dispatch in ('not_required', 'pending', 'scheduled') then
      v_to_dispatch := 'assigned';
    end if;

  else
    raise exception 'invalid_operation';
  end if;

  update public.orders
  set
    status = v_to_status,
    dispatch_status = v_to_dispatch,
    dispatch_partner = v_partner,
    dispatch_reference = v_reference,
    updated_at = now()
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
    v_from_status,
    v_to_status,
    v_from_dispatch,
    v_to_dispatch,
    v_partner,
    v_reference,
    coalesce(p_metadata, '{}'::jsonb)
  )
  returning id into v_event_id;

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

comment on function public.update_order_operational_state(uuid, uuid, text, text, text, jsonb) is
  'Actualiza estado operativo de pedidos con reglas de transición, exige pago aprobado antes de operar y registra auditoría.';

commit;
