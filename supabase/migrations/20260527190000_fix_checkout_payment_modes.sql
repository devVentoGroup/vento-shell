begin;

create or replace function public.create_order_checkout_draft(
  p_site_id uuid,
  p_satellite_name text,
  p_fulfillment_type text,
  p_contact_name text,
  p_contact_phone text,
  p_address_line text,
  p_address_reference text,
  p_notes text,
  p_items jsonb,
  p_delivery_fee_amount numeric default 0,
  p_source text default 'vento_pass',
  p_delivery_distance_km integer default null,
  p_delivery_quote_id uuid default null
)
returns jsonb
language plpgsql
security definer
set search_path = public, auth, pass
as $$
declare
  v_uid uuid := auth.uid();
  v_order_id uuid;
  v_tx_id uuid;
  v_item jsonb;
  v_product_id uuid;
  v_quantity numeric;
  v_unit_price numeric;
  v_subtotal numeric := 0;
  v_delivery numeric := 0;
  v_total numeric := 0;
  v_fulfillment text := lower(trim(coalesce(p_fulfillment_type, 'delivery')));
  v_order_type text := 'takeaway';
  v_delivery_address jsonb := '{}'::jsonb;
  v_delivery_zone text := null;
  v_quote pass.delivery_quotes%rowtype;
  v_idempotency_key text := gen_random_uuid()::text;
  v_payment_status text := 'pending_payment';
  v_payment_provider text := null;
  v_checkout_expires_at timestamptz := null;
begin
  if v_uid is null then
    raise exception 'authentication_required';
  end if;

  if p_site_id is null then
    raise exception 'site_required';
  end if;

  if jsonb_typeof(p_items) <> 'array' or jsonb_array_length(p_items) = 0 then
    raise exception 'items_required';
  end if;

  if v_fulfillment not in ('delivery', 'pickup', 'on_premise') then
    raise exception 'invalid_fulfillment_type';
  end if;

  if v_fulfillment = 'on_premise' then
    v_order_type := 'dine_in';
  end if;

  if v_fulfillment = 'delivery' then
    v_payment_status := 'pending_payment';
    v_payment_provider := 'wompi';
    v_checkout_expires_at := now() + interval '20 minutes';

    if p_delivery_quote_id is null then
      raise exception 'delivery_quote_required';
    end if;

    select *
    into v_quote
    from pass.delivery_quotes
    where id = p_delivery_quote_id
      and user_id = v_uid
      and site_id = p_site_id
      and used_at is null
      and expires_at > now()
    for update;

    if v_quote.id is null then
      raise exception 'delivery_quote_invalid_or_expired';
    end if;

    v_delivery := v_quote.customer_fee_amount;
    v_delivery_zone := v_quote.billed_distance_km::text || ' km';
    v_delivery_address := jsonb_build_object(
      'line1', nullif(trim(coalesce(p_address_line, v_quote.destination_address, '')), ''),
      'reference', nullif(trim(coalesce(p_address_reference, '')), ''),
      'label', nullif(trim(coalesce(v_quote.destination_label, '')), ''),
      'latitude', v_quote.destination_latitude,
      'longitude', v_quote.destination_longitude,
      'distance_meters', v_quote.distance_meters,
      'distance_km', v_quote.distance_km,
      'billed_distance_km', v_quote.billed_distance_km,
      'duration_seconds', v_quote.duration_seconds,
      'delivery_quote_id', v_quote.id
    );

    if coalesce(v_delivery_address ->> 'line1', '') = '' then
      raise exception 'delivery_address_required';
    end if;
  else
    v_payment_status := 'not_required';
    v_payment_provider := null;
    v_checkout_expires_at := null;
    v_delivery := 0;
    v_delivery_zone := null;
    v_delivery_address := '{}'::jsonb;
  end if;

  for v_item in select * from jsonb_array_elements(p_items)
  loop
    v_product_id := nullif(v_item ->> 'product_id', '')::uuid;
    v_quantity := greatest(coalesce((v_item ->> 'quantity')::numeric, 0), 0);
    v_unit_price := greatest(coalesce((v_item ->> 'unit_price')::numeric, 0), 0);

    if v_product_id is null then
      raise exception 'item_product_required';
    end if;

    if v_quantity <= 0 then
      raise exception 'invalid_item_quantity';
    end if;

    if v_unit_price < 0 then
      raise exception 'invalid_item_price';
    end if;

    v_subtotal := v_subtotal + (v_quantity * v_unit_price);
  end loop;

  v_total := v_subtotal + v_delivery;

  insert into public.orders (
    client_id,
    order_type,
    source,
    status,
    payment_status,
    total_amount,
    subtotal_amount,
    notes,
    site_id,
    guest_info,
    fulfillment_type,
    contact_phone,
    delivery_address,
    delivery_zone,
    delivery_fee_amount,
    payment_provider,
    checkout_expires_at
  )
  values (
    v_uid,
    v_order_type,
    coalesce(nullif(trim(coalesce(p_source, '')), ''), 'vento_pass'),
    'pending',
    v_payment_status,
    v_total,
    v_subtotal,
    nullif(trim(coalesce(p_notes, '')), ''),
    p_site_id,
    jsonb_build_object(
      'contact_name', nullif(trim(coalesce(p_contact_name, '')), ''),
      'contact_phone', nullif(trim(coalesce(p_contact_phone, '')), ''),
      'fulfillment_type', v_fulfillment,
      'satellite_name', nullif(trim(coalesce(p_satellite_name, '')), '')
    ),
    v_fulfillment,
    nullif(trim(coalesce(p_contact_phone, '')), ''),
    v_delivery_address,
    v_delivery_zone,
    v_delivery,
    v_payment_provider,
    v_checkout_expires_at
  )
  returning id into v_order_id;

  for v_item in select * from jsonb_array_elements(p_items)
  loop
    insert into public.order_items (
      order_id,
      product_id,
      quantity,
      unit_price,
      total_amount,
      notes
    )
    values (
      v_order_id,
      (v_item ->> 'product_id')::uuid,
      (v_item ->> 'quantity')::numeric,
      (v_item ->> 'unit_price')::numeric,
      ((v_item ->> 'quantity')::numeric * (v_item ->> 'unit_price')::numeric),
      nullif(trim(coalesce(v_item ->> 'notes', '')), '')
    );
  end loop;

  if v_quote.id is not null then
    update pass.delivery_quotes
    set used_at = now()
    where id = v_quote.id;
  end if;

  if v_fulfillment = 'delivery' then
    insert into payments.transactions (
      order_id,
      user_id,
      site_id,
      provider,
      idempotency_key,
      amount_minor,
      currency,
      status,
      metadata
    )
    values (
      v_order_id,
      v_uid,
      p_site_id,
      'wompi',
      v_idempotency_key,
      round(v_total * 100)::bigint,
      'COP',
      'pending',
      jsonb_build_object(
        'source', 'create_order_checkout_draft',
        'delivery_quote_id', p_delivery_quote_id,
        'delivery_distance_km', coalesce(v_quote.billed_distance_km, p_delivery_distance_km),
        'fulfillment_type', v_fulfillment
      )
    )
    returning id into v_tx_id;

    update public.orders
    set payment_intent_id = v_tx_id
    where id = v_order_id;
  end if;

  return jsonb_build_object(
    'ok', true,
    'order_id', v_order_id,
    'transaction_id', v_tx_id,
    'idempotency_key', case when v_fulfillment = 'delivery' then v_idempotency_key else null end,
    'amount_minor', round(v_total * 100)::bigint,
    'currency', 'COP',
    'payment_status', v_payment_status,
    'payment_provider', v_payment_provider,
    'checkout_expires_at', v_checkout_expires_at
  );
end;
$$;

grant execute on function public.create_order_checkout_draft(
  uuid,
  text,
  text,
  text,
  text,
  text,
  text,
  text,
  jsonb,
  numeric,
  text,
  integer,
  uuid
) to authenticated, service_role;

comment on function public.create_order_checkout_draft(
  uuid,
  text,
  text,
  text,
  text,
  text,
  text,
  text,
  jsonb,
  numeric,
  text,
  integer,
  uuid
) is
  'Crea orden desde Vento Pass. Domicilio crea intento Wompi pendiente; recoger y en sitio quedan con pago no requerido.';

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
  'Actualiza estado operativo de pedidos. Domicilio exige pago aprobado; recoger y en sitio permiten pago no requerido.';

notify pgrst, 'reload schema';

commit;
