begin;

-- Fase 13.3A
-- Valoriza remisiones internas recibidas usando precio interno por presentación/UOM profile.
-- Importante:
-- - En v1 la remisión termina operativamente en status = 'received'.
-- - Por compatibilidad, closed_at se normaliza con received_at cuando aplica.
-- - El precio interno se resuelve primero por input_uom_profile_id y luego cae a unit_code legacy.
-- - transfer_unit_price queda como precio por presentación/unidad de precio.
-- - transfer_total usa la cantidad recibida convertida a cantidad de presentación solicitada.

create or replace function public.value_closed_restock_request(p_request_id uuid)
returns jsonb
language plpgsql
security definer
set search_path = public
as $$
declare
  v_request record;
  v_item record;
  v_price record;

  v_now timestamptz := now();
  v_price_at timestamptz;
  v_effective_closed_at timestamptz;
  v_seller_cost_center_id uuid;
  v_buyer_cost_center_id uuid;

  v_billable_count integer := 0;
  v_missing_price_count integer := 0;
  v_variance_count integer := 0;

  v_received_qty numeric := 0;
  v_pricing_qty numeric := 0;
  v_total numeric := 0;
  v_line_total numeric := 0;
  v_unit_code text;

  v_is_service_role boolean := false;
  v_permission_ok boolean := false;
begin
  select r.*
  into v_request
  from public.restock_requests r
  where r.id = p_request_id
  for update;

  if not found then
    raise exception 'request_not_found';
  end if;

  v_is_service_role :=
    current_user = 'service_role'
    or current_setting('request.jwt.claim.role', true) = 'service_role';

  v_permission_ok :=
    v_is_service_role
    or public.has_permission('nexo.internal_invoices.generate')
    or public.has_permission('nexo.internal_invoices.issue')
    or public.has_permission('nexo.inventory.remissions.all_sites')
    or public.has_permission('nexo.inventory.remissions.prepare', v_request.from_site_id)
    or public.has_permission('nexo.inventory.remissions.receive', v_request.to_site_id)
    or is_owner()
    or is_global_manager();

  if not v_permission_ok then
    raise exception 'permission_denied_internal_billing';
  end if;

  if v_request.internal_pos_document_id is not null
     or v_request.pricing_status in ('invoiced', 'credited') then
    return jsonb_build_object(
      'request_id', p_request_id,
      'pricing_status', v_request.pricing_status,
      'message', 'already_invoiced_or_credited'
    );
  end if;

  v_seller_cost_center_id := coalesce(
    v_request.seller_cost_center_id,
    public.get_site_cost_center(v_request.from_site_id)
  );
  v_buyer_cost_center_id := coalesce(
    v_request.buyer_cost_center_id,
    public.get_site_cost_center(v_request.to_site_id)
  );

  v_effective_closed_at := coalesce(
    v_request.closed_at,
    case when v_request.status in ('received', 'closed') then v_request.received_at end,
    case when v_request.status in ('received', 'closed') then v_request.status_updated_at end,
    case when v_request.status in ('received', 'closed') then v_now end
  );
  v_price_at := coalesce(v_effective_closed_at, v_now);

  if v_request.status not in ('closed', 'received') then
    update public.restock_requests
    set
      pricing_mode = 'internal_transfer',
      pricing_status = 'pending_close',
      seller_cost_center_id = v_seller_cost_center_id,
      buyer_cost_center_id = v_buyer_cost_center_id,
      priced_at = null
    where id = p_request_id;

    return jsonb_build_object(
      'request_id', p_request_id,
      'pricing_status', 'pending_close',
      'message', 'request_is_not_received'
    );
  end if;

  if v_effective_closed_at is null then
    update public.restock_requests
    set
      pricing_mode = 'internal_transfer',
      pricing_status = 'pending_close',
      seller_cost_center_id = v_seller_cost_center_id,
      buyer_cost_center_id = v_buyer_cost_center_id,
      priced_at = null
    where id = p_request_id;

    return jsonb_build_object(
      'request_id', p_request_id,
      'pricing_status', 'pending_close',
      'message', 'missing_received_or_closed_at'
    );
  end if;

  if v_seller_cost_center_id is null or v_buyer_cost_center_id is null then
    update public.restock_requests
    set
      pricing_mode = 'internal_transfer',
      pricing_status = 'pending_price',
      seller_cost_center_id = v_seller_cost_center_id,
      buyer_cost_center_id = v_buyer_cost_center_id,
      closed_at = coalesce(closed_at, v_effective_closed_at),
      priced_at = null
    where id = p_request_id;

    return jsonb_build_object(
      'request_id', p_request_id,
      'pricing_status', 'pending_price',
      'message', 'missing_cost_center',
      'seller_cost_center_id', v_seller_cost_center_id,
      'buyer_cost_center_id', v_buyer_cost_center_id
    );
  end if;

  -- Crea diferencias cuando lo recibido no coincide con lo enviado.
  insert into public.internal_transfer_variances (
    remission_id,
    remission_item_id,
    product_id,
    expected_qty,
    dispatched_qty,
    received_qty,
    variance_qty,
    unit_code,
    variance_type,
    reason,
    financial_treatment,
    status,
    created_at,
    updated_at
  )
  select
    p_request_id,
    i.id,
    i.product_id,
    coalesce(i.quantity, 0),
    coalesce(i.shipped_quantity, 0),
    coalesce(i.received_quantity, 0),
    abs(coalesce(i.shipped_quantity, 0) - coalesce(i.received_quantity, 0)),
    coalesce(nullif(btrim(i.stock_unit_code), ''), nullif(btrim(i.unit), ''), nullif(btrim(i.input_unit_code), ''), 'un'),
    case
      when coalesce(i.received_quantity, 0) > coalesce(i.shipped_quantity, 0) then 'overage'
      else 'shortage'
    end,
    'Diferencia detectada automaticamente al valorizar la remision.',
    'pending',
    'pending',
    v_now,
    v_now
  from public.restock_request_items i
  where i.request_id = p_request_id
    and abs(coalesce(i.shipped_quantity, 0) - coalesce(i.received_quantity, 0)) > 0
    and not exists (
      select 1
      from public.internal_transfer_variances v
      where v.remission_item_id = i.id
        and v.status <> 'cancelled'
    );

  select count(*)
  into v_variance_count
  from public.internal_transfer_variances v
  where v.remission_id = p_request_id
    and v.status not in ('approved', 'cancelled');

  if v_variance_count > 0 then
    update public.restock_requests
    set
      pricing_mode = 'internal_transfer',
      pricing_status = 'pending_variance_resolution',
      seller_cost_center_id = v_seller_cost_center_id,
      buyer_cost_center_id = v_buyer_cost_center_id,
      closed_at = coalesce(closed_at, v_effective_closed_at),
      priced_at = null
    where id = p_request_id;

    return jsonb_build_object(
      'request_id', p_request_id,
      'pricing_status', 'pending_variance_resolution',
      'pending_variances', v_variance_count
    );
  end if;

  for v_item in
    select i.*
    from public.restock_request_items i
    where i.request_id = p_request_id
    order by i.created_at asc, i.id asc
  loop
    v_received_qty := coalesce(v_item.received_quantity, 0);
    v_unit_code := coalesce(
      nullif(btrim(v_item.input_unit_code), ''),
      nullif(btrim(v_item.stock_unit_code), ''),
      nullif(btrim(v_item.unit), ''),
      'un'
    );

    if v_received_qty <= 0 then
      update public.restock_request_items
      set
        transfer_unit_price = 0,
        transfer_currency = 'COP',
        transfer_total = 0,
        internal_price_list_id = null,
        internal_price_list_item_id = null,
        priced_at = v_now
      where id = v_item.id;

      continue;
    end if;

    v_billable_count := v_billable_count + 1;

    -- Si la línea fue solicitada con presentación física, se cobra en esa presentación.
    -- Ejemplo: cantidad base 4000 ml, input_qty 2 potes, recibido 2000 ml => pricing_qty 1 pote.
    if v_item.input_uom_profile_id is not null
       and coalesce(v_item.input_qty, 0) > 0
       and coalesce(v_item.quantity, 0) > 0 then
      v_pricing_qty := round((v_received_qty / v_item.quantity) * v_item.input_qty, 6);
    else
      v_pricing_qty := v_received_qty;
    end if;

    select *
    into v_price
    from public.resolve_internal_transfer_price_for_profile(
      v_item.product_id,
      v_seller_cost_center_id,
      v_buyer_cost_center_id,
      v_request.to_site_id,
      v_item.input_uom_profile_id,
      v_unit_code,
      v_price_at
    );

    if not found then
      v_missing_price_count := v_missing_price_count + 1;

      update public.restock_request_items
      set
        transfer_unit_price = null,
        transfer_currency = 'COP',
        transfer_total = null,
        internal_price_list_id = null,
        internal_price_list_item_id = null,
        priced_at = null
      where id = v_item.id;

      continue;
    end if;

    v_line_total := round(v_pricing_qty * v_price.unit_price, 2);
    v_total := v_total + v_line_total;

    update public.restock_request_items
    set
      transfer_unit_price = v_price.unit_price,
      transfer_currency = v_price.currency,
      transfer_total = v_line_total,
      internal_price_list_id = v_price.price_list_id,
      internal_price_list_item_id = v_price.price_list_item_id,
      priced_at = v_now
    where id = v_item.id;
  end loop;

  if v_missing_price_count > 0 then
    update public.restock_requests
    set
      pricing_mode = 'internal_transfer',
      pricing_status = 'pending_price',
      seller_cost_center_id = v_seller_cost_center_id,
      buyer_cost_center_id = v_buyer_cost_center_id,
      closed_at = coalesce(closed_at, v_effective_closed_at),
      priced_at = null
    where id = p_request_id;

    return jsonb_build_object(
      'request_id', p_request_id,
      'pricing_status', 'pending_price',
      'billable_lines', v_billable_count,
      'missing_price_lines', v_missing_price_count
    );
  end if;

  if v_billable_count = 0 then
    update public.restock_requests
    set
      pricing_mode = 'internal_transfer',
      pricing_status = 'not_applicable',
      seller_cost_center_id = v_seller_cost_center_id,
      buyer_cost_center_id = v_buyer_cost_center_id,
      closed_at = coalesce(closed_at, v_effective_closed_at),
      priced_at = v_now
    where id = p_request_id;

    return jsonb_build_object(
      'request_id', p_request_id,
      'pricing_status', 'not_applicable',
      'billable_lines', 0,
      'total', 0
    );
  end if;

  update public.restock_requests
  set
    pricing_mode = 'internal_transfer',
    pricing_status = 'ready_to_invoice',
    seller_cost_center_id = v_seller_cost_center_id,
    buyer_cost_center_id = v_buyer_cost_center_id,
    closed_at = coalesce(closed_at, v_effective_closed_at),
    priced_at = v_now
  where id = p_request_id;

  return jsonb_build_object(
    'request_id', p_request_id,
    'pricing_status', 'ready_to_invoice',
    'billable_lines', v_billable_count,
    'missing_price_lines', 0,
    'total', v_total
  );
end;
$$;

comment on function public.value_closed_restock_request(uuid) is
  'Values a received/closed restock request for internal billing. Uses input_uom_profile_id to resolve internal price by presentation and stores transfer_* as financial snapshot.';

create or replace function public.price_restock_request_internal_transfer(p_request_id uuid)
returns jsonb
language sql
security definer
set search_path = public
as $$
  select public.value_closed_restock_request(p_request_id);
$$;

comment on function public.price_restock_request_internal_transfer(uuid) is
  'Alias explícito para valorizar una remisión interna recibida/cerrada con precios internos por presentación.';

create or replace function public.value_closed_restock_requests_for_cutoff(p_cutoff_at timestamptz)
returns jsonb
language plpgsql
security definer
set search_path = public
as $$
declare
  v_request record;
  v_result jsonb;
  v_status text;

  v_processed integer := 0;
  v_ready integer := 0;
  v_pending_price integer := 0;
  v_pending_variance integer := 0;
  v_pending_close integer := 0;
  v_not_applicable integer := 0;
  v_other integer := 0;
begin
  for v_request in
    select r.id
    from public.restock_requests r
    where r.status in ('closed', 'received')
      and coalesce(r.closed_at, r.received_at) is not null
      and coalesce(r.closed_at, r.received_at) <= p_cutoff_at
      and r.internal_pos_document_id is null
      and r.pricing_status not in ('invoiced', 'credited')
    order by coalesce(r.closed_at, r.received_at) asc, r.id asc
  loop
    v_result := public.value_closed_restock_request(v_request.id);
    v_status := coalesce(v_result->>'pricing_status', 'unknown');
    v_processed := v_processed + 1;

    if v_status = 'ready_to_invoice' then
      v_ready := v_ready + 1;
    elsif v_status = 'pending_price' then
      v_pending_price := v_pending_price + 1;
    elsif v_status = 'pending_variance_resolution' then
      v_pending_variance := v_pending_variance + 1;
    elsif v_status = 'pending_close' then
      v_pending_close := v_pending_close + 1;
    elsif v_status = 'not_applicable' then
      v_not_applicable := v_not_applicable + 1;
    else
      v_other := v_other + 1;
    end if;
  end loop;

  return jsonb_build_object(
    'cutoff_at', p_cutoff_at,
    'processed', v_processed,
    'ready_to_invoice', v_ready,
    'pending_price', v_pending_price,
    'pending_variance_resolution', v_pending_variance,
    'pending_close', v_pending_close,
    'not_applicable', v_not_applicable,
    'other', v_other
  );
end;
$$;

comment on function public.value_closed_restock_requests_for_cutoff(timestamptz) is
  'Values all received/closed, non-invoiced restock requests up to a cutoff. Uses coalesce(closed_at, received_at) because v1 closes operationally on received.';

comment on column public.restock_request_items.transfer_unit_price is
  'Snapshot del precio interno unitario usado para facturar la linea. Si hay input_uom_profile_id, es precio por presentación solicitada.';
comment on column public.restock_request_items.transfer_total is
  'Subtotal interno de la linea: cantidad recibida convertida a unidad/presentación de precio por precio interno.';

grant execute on function public.value_closed_restock_request(uuid) to authenticated;
grant execute on function public.price_restock_request_internal_transfer(uuid) to authenticated;
grant execute on function public.value_closed_restock_requests_for_cutoff(timestamptz) to authenticated;

commit;
