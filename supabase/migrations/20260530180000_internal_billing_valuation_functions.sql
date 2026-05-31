-- =====================================================================================
-- VENTO / NEXO
-- Migration: Internal billing valuation functions
-- File: 20260530180000_internal_billing_valuation_functions.sql
--
-- Scope:
-- - Resolve active cost center for a site.
-- - Resolve internal transfer price for a product/seller/buyer/unit/date.
-- - Value closed restock requests using existing remissions pricing fields:
--     restock_requests.pricing_mode
--     restock_requests.pricing_status
--     restock_request_items.transfer_unit_price
--     restock_request_items.transfer_currency
--     restock_request_items.transfer_total
--     restock_request_items.received_quantity
-- - Create pending variances when shipped quantity differs from received quantity.
-- - Provide a cutoff warning summary for the future 4:30 p.m. notification.
--
-- Notes:
-- - This migration does not generate internal POS documents yet.
-- - With 0 internal price lists/items, closed remissions will become pending_price.
-- - This migration is safe to run before loading internal prices.
-- =====================================================================================

begin;

-- =====================================================================================
-- 1. Resolve active cost center for a site
-- =====================================================================================

create or replace function public.get_site_cost_center(p_site_id uuid)
returns uuid
language sql
stable
security definer
set search_path = public
as $$
  select cc.id
  from public.cost_centers cc
  where cc.site_id = p_site_id
    and cc.is_active is not false
  order by
    case cc.type
      when 'production_center' then 1
      when 'satellite' then 2
      when 'admin' then 3
      when 'logistics' then 4
      else 9
    end,
    cc.created_at asc
  limit 1;
$$;

comment on function public.get_site_cost_center(uuid) is
  'Returns the active cost center associated with a site. Used by internal billing valuation.';

grant execute on function public.get_site_cost_center(uuid) to authenticated, service_role;

-- =====================================================================================
-- 2. Resolve internal transfer price
-- =====================================================================================

create or replace function public.resolve_internal_transfer_price(
  p_product_id uuid,
  p_seller_cost_center_id uuid,
  p_buyer_cost_center_id uuid,
  p_buyer_site_id uuid,
  p_unit_code text default null,
  p_at timestamptz default now()
)
returns table (
  price_list_id uuid,
  price_list_item_id uuid,
  unit_price numeric,
  unit_code text,
  currency text,
  priority integer
)
language sql
stable
security definer
set search_path = public
as $$
  select
    pl.id as price_list_id,
    pli.id as price_list_item_id,
    pli.unit_price,
    pli.unit_code,
    'COP'::text as currency,
    case
      when pl.buyer_cost_center_id = p_buyer_cost_center_id then 1
      when pl.buyer_site_id = p_buyer_site_id then 2
      when pl.buyer_cost_center_id is null and pl.buyer_site_id is null then 3
      else 9
    end as priority
  from public.internal_price_list_items pli
  join public.internal_price_lists pl
    on pl.id = pli.price_list_id
  where pli.product_id = p_product_id
    and pli.is_active = true
    and pl.is_active = true
    and pl.seller_cost_center_id = p_seller_cost_center_id
    and p_at >= pl.valid_from
    and (pl.valid_to is null or p_at < pl.valid_to)
    and (
      p_unit_code is null
      or btrim(p_unit_code) = ''
      or lower(btrim(pli.unit_code)) = lower(btrim(p_unit_code))
    )
    and (
      pl.buyer_cost_center_id = p_buyer_cost_center_id
      or pl.buyer_site_id = p_buyer_site_id
      or (pl.buyer_cost_center_id is null and pl.buyer_site_id is null)
    )
  order by
    case
      when pl.buyer_cost_center_id = p_buyer_cost_center_id then 1
      when pl.buyer_site_id = p_buyer_site_id then 2
      when pl.buyer_cost_center_id is null and pl.buyer_site_id is null then 3
      else 9
    end,
    pl.valid_from desc,
    pli.created_at desc
  limit 1;
$$;

comment on function public.resolve_internal_transfer_price(uuid, uuid, uuid, uuid, text, timestamptz) is
  'Returns the best active internal price for product/seller/buyer/unit/date. Priority: buyer cost center, buyer site, general seller price.';

grant execute on function public.resolve_internal_transfer_price(uuid, uuid, uuid, uuid, text, timestamptz)
to authenticated, service_role;

-- =====================================================================================
-- 3. Value one closed restock request
-- =====================================================================================

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
  v_seller_cost_center_id uuid;
  v_buyer_cost_center_id uuid;

  v_billable_count integer := 0;
  v_missing_price_count integer := 0;
  v_variance_count integer := 0;

  v_quantity numeric := 0;
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

  v_seller_cost_center_id := public.get_site_cost_center(v_request.from_site_id);
  v_buyer_cost_center_id := public.get_site_cost_center(v_request.to_site_id);
  v_price_at := coalesce(v_request.closed_at, v_request.received_at, v_now);

  if v_request.status not in ('closed', 'received') or v_request.closed_at is null then
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
      'message', 'request_is_not_closed'
    );
  end if;

  if v_seller_cost_center_id is null or v_buyer_cost_center_id is null then
    update public.restock_requests
    set
      pricing_mode = 'internal_transfer',
      pricing_status = 'pending_price',
      seller_cost_center_id = v_seller_cost_center_id,
      buyer_cost_center_id = v_buyer_cost_center_id,
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

  -- Create variance records when dispatched and received quantities differ.
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
    v_quantity := coalesce(v_item.received_quantity, 0);
    v_unit_code := coalesce(
      nullif(btrim(v_item.stock_unit_code), ''),
      nullif(btrim(v_item.unit), ''),
      nullif(btrim(v_item.input_unit_code), ''),
      'un'
    );

    if v_quantity <= 0 then
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

    select *
    into v_price
    from public.resolve_internal_transfer_price(
      v_item.product_id,
      v_seller_cost_center_id,
      v_buyer_cost_center_id,
      v_request.to_site_id,
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

    v_line_total := round(v_quantity * v_price.unit_price, 2);
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
  'Values a closed restock request for internal billing. Creates pending variances when shipped and received quantities differ. Uses existing transfer_* item fields as financial snapshot.';

grant execute on function public.value_closed_restock_request(uuid) to authenticated, service_role;

-- =====================================================================================
-- 4. Bulk valuation helper for cutoff preparation
-- =====================================================================================

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
      and r.closed_at is not null
      and r.closed_at <= p_cutoff_at
      and r.internal_pos_document_id is null
      and r.pricing_status not in ('invoiced', 'credited')
    order by r.closed_at asc, r.id asc
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
  'Values all closed, non-invoiced restock requests up to a cutoff. Prepares requests for future internal POS generation.';

grant execute on function public.value_closed_restock_requests_for_cutoff(timestamptz) to authenticated, service_role;

-- =====================================================================================
-- 5. Cutoff warning summary for future 4:30 p.m. notification
-- =====================================================================================

create or replace function public.get_internal_invoice_cutoff_warnings(p_cutoff_at timestamptz)
returns table (
  warning_key text,
  total bigint
)
language plpgsql
stable
security definer
set search_path = public
as $$
begin
  return query
  select
    'operational_not_closed'::text as warning_key,
    count(*)::bigint as total
  from public.restock_requests r
  where r.created_at <= p_cutoff_at
    and r.status not in ('closed', 'received', 'cancelled');

  return query
  select
    'partial_or_in_transit'::text as warning_key,
    count(*)::bigint as total
  from public.restock_requests r
  where r.created_at <= p_cutoff_at
    and r.status in ('partial', 'in_transit');

  return query
  select
    'closed_pending_price'::text as warning_key,
    count(*)::bigint as total
  from public.restock_requests r
  where r.closed_at is not null
    and r.closed_at <= p_cutoff_at
    and r.status in ('closed', 'received')
    and r.pricing_status = 'pending_price'
    and r.internal_pos_document_id is null;

  return query
  select
    'closed_pending_variance_resolution'::text as warning_key,
    count(*)::bigint as total
  from public.restock_requests r
  where r.closed_at is not null
    and r.closed_at <= p_cutoff_at
    and r.status in ('closed', 'received')
    and r.pricing_status = 'pending_variance_resolution'
    and r.internal_pos_document_id is null;

  return query
  select
    'ready_to_invoice'::text as warning_key,
    count(*)::bigint as total
  from public.restock_requests r
  where r.closed_at is not null
    and r.closed_at <= p_cutoff_at
    and r.status in ('closed', 'received')
    and r.pricing_status = 'ready_to_invoice'
    and r.internal_pos_document_id is null;
end;
$$;

comment on function public.get_internal_invoice_cutoff_warnings(timestamptz) is
  'Returns aggregate warning counts for the future 4:30 p.m. internal billing cutoff notification.';

grant execute on function public.get_internal_invoice_cutoff_warnings(timestamptz) to authenticated, service_role;

commit;

-- =====================================================================================
-- Post-migration validation queries
-- =====================================================================================

select
  'internal_billing_functions' as check_name,
  p.proname as function_name,
  pg_get_function_arguments(p.oid) as arguments,
  pg_get_function_result(p.oid) as result_type
from pg_proc p
join pg_namespace n
  on n.oid = p.pronamespace
where n.nspname = 'public'
  and p.proname in (
    'get_site_cost_center',
    'resolve_internal_transfer_price',
    'value_closed_restock_request',
    'value_closed_restock_requests_for_cutoff',
    'get_internal_invoice_cutoff_warnings'
  )
order by p.proname;

select
  'cutoff_warning_preview' as check_name,
  *
from public.get_internal_invoice_cutoff_warnings(now());
