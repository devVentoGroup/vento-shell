-- =====================================================================================
-- VENTO OS / NEXO
-- Migration: Daily internal POS documents from closed valued remissions
-- File: 20260530200500_generate_daily_internal_pos_documents.sql
--
-- Purpose:
-- - Generate one internal POS document per seller/buyer/currency for the daily cutoff.
-- - Include only closed remissions that are ready_to_invoice and not yet invoiced.
-- - Create auditable document lines by remission item.
-- - Mark remissions as invoiced by linking internal_pos_document_id.
--
-- Business rule:
-- - Daily cutoff is 5:00 p.m. Colombia.
-- - The function receives p_cutoff_at as timestamptz.
-- - The document_date is calculated in America/Bogota.
-- - Remissions closed after p_cutoff_at are NOT included.
--
-- Candidate remission rule:
-- - restock_requests.status = 'closed'
-- - restock_requests.pricing_status = 'ready_to_invoice'
-- - restock_requests.internal_pos_document_id is null
-- - restock_requests.closed_at <= p_cutoff_at
-- - seller_cost_center_id and buyer_cost_center_id are present
-- - no unresolved internal_transfer_variances
-- - all received lines have transfer_unit_price and transfer_total
--
-- Generated data:
-- - internal_pos_documents
-- - internal_pos_document_lines
-- - restock_requests.internal_pos_document_id
-- - restock_requests.pricing_status = 'invoiced'
--
-- Notes:
-- - This migration does not create a scheduler yet.
-- - After validation, schedule this RPC daily at 5:00 p.m. Colombia using Supabase cron
--   or a Vercel/Supabase scheduled job.
-- =====================================================================================

begin;

-- =====================================================================================
-- 1. Safety indexes
-- =====================================================================================

create unique index if not exists internal_pos_documents_document_number_uidx
  on public.internal_pos_documents (document_number);

create index if not exists internal_pos_documents_cutoff_buyer_idx
  on public.internal_pos_documents (
    document_date,
    cutoff_at,
    seller_cost_center_id,
    buyer_cost_center_id,
    status
  );

create index if not exists internal_pos_document_lines_document_idx
  on public.internal_pos_document_lines (document_id);

create index if not exists internal_pos_document_lines_remission_idx
  on public.internal_pos_document_lines (remission_id);

create index if not exists restock_requests_internal_invoice_candidates_idx
  on public.restock_requests (
    pricing_status,
    status,
    internal_pos_document_id,
    closed_at
  );

-- =====================================================================================
-- 2. Main generator
-- =====================================================================================

create or replace function public.generate_daily_internal_pos_documents(
  p_cutoff_at timestamptz default now(),
  p_dry_run boolean default false
)
returns jsonb
language plpgsql
security definer
set search_path = public
as $$
declare
  v_cutoff_at timestamptz := coalesce(p_cutoff_at, now());
  v_document_date date := (coalesce(p_cutoff_at, now()) at time zone 'America/Bogota')::date;

  v_group record;
  v_document_id uuid;
  v_sequence_value integer;
  v_document_number text;
  v_group_total numeric;

  v_documents_created integer := 0;
  v_remissions_invoiced integer := 0;
  v_lines_created integer := 0;
  v_total numeric := 0;

  v_candidate_remissions integer := 0;
  v_candidate_lines integer := 0;
  v_blocked_unpriced integer := 0;
  v_blocked_variances integer := 0;

  v_result jsonb;
begin
  if not (
    current_user = 'service_role'
    or current_setting('request.jwt.claim.role', true) = 'service_role'
    or has_permission('nexo.internal_invoices.generate')
    or has_permission('internal_invoices.generate')
    or is_owner()
    or is_global_manager()
  ) then
    raise exception 'permission_denied_internal_invoices_generate';
  end if;

  -- Prevent concurrent generation for the same cutoff day.
  perform pg_advisory_xact_lock(hashtext('vento_internal_pos_documents_' || v_document_date::text));

  drop table if exists _daily_internal_pos_candidate_remissions;
  drop table if exists _daily_internal_pos_candidate_lines;

  -- Candidate remissions: closed, valued, not invoiced, before cutoff, no blocking variance,
  -- and no received item without price.
  create temp table _daily_internal_pos_candidate_remissions on commit drop as
  select
    r.id as remission_id,
    r.request_code,
    r.seller_cost_center_id,
    r.buyer_cost_center_id,
    r.to_site_id as buyer_site_id,
    r.closed_at,
    r.received_at
  from public.restock_requests r
  where r.status = 'closed'
    and r.pricing_status = 'ready_to_invoice'
    and r.internal_pos_document_id is null
    and r.closed_at is not null
    and r.closed_at <= v_cutoff_at
    and r.seller_cost_center_id is not null
    and r.buyer_cost_center_id is not null
    and exists (
      select 1
      from public.restock_request_items i
      where i.request_id = r.id
        and coalesce(i.received_quantity, 0) > 0
    )
    and not exists (
      select 1
      from public.restock_request_items i
      where i.request_id = r.id
        and coalesce(i.received_quantity, 0) > 0
        and (
          i.transfer_unit_price is null
          or i.transfer_total is null
          or i.transfer_unit_price < 0
          or i.transfer_total < 0
        )
    )
    and not exists (
      select 1
      from public.internal_transfer_variances v
      where v.remission_id = r.id
        and coalesce(v.status, '') not in ('resolved', 'approved', 'cancelled', 'closed')
    );

  create temp table _daily_internal_pos_candidate_lines on commit drop as
  select
    c.remission_id,
    i.id as remission_item_id,
    i.product_id,
    coalesce(i.received_quantity, 0) as quantity,
    coalesce(nullif(i.input_unit_code, ''), nullif(i.stock_unit_code, ''), nullif(i.unit, ''), 'un') as unit_code,
    i.transfer_unit_price as unit_price,
    i.transfer_total as subtotal,
    i.internal_price_list_id as price_list_id,
    i.internal_price_list_item_id as price_list_item_id,
    coalesce(i.priced_at, now()) as priced_at,
    coalesce(nullif(i.transfer_currency, ''), 'COP') as currency,
    c.seller_cost_center_id,
    c.buyer_cost_center_id,
    c.buyer_site_id
  from _daily_internal_pos_candidate_remissions c
  join public.restock_request_items i
    on i.request_id = c.remission_id
  where coalesce(i.received_quantity, 0) > 0;

  select count(*)
  into v_candidate_remissions
  from _daily_internal_pos_candidate_remissions;

  select count(*), coalesce(sum(subtotal), 0)
  into v_candidate_lines, v_total
  from _daily_internal_pos_candidate_lines;

  -- Diagnostics: closed ready remissions blocked by unpriced lines.
  select count(distinct r.id)
  into v_blocked_unpriced
  from public.restock_requests r
  where r.status = 'closed'
    and r.pricing_status = 'ready_to_invoice'
    and r.internal_pos_document_id is null
    and r.closed_at is not null
    and r.closed_at <= v_cutoff_at
    and exists (
      select 1
      from public.restock_request_items i
      where i.request_id = r.id
        and coalesce(i.received_quantity, 0) > 0
        and (
          i.transfer_unit_price is null
          or i.transfer_total is null
          or i.transfer_unit_price < 0
          or i.transfer_total < 0
        )
    );

  -- Diagnostics: closed ready remissions blocked by unresolved variances.
  select count(distinct r.id)
  into v_blocked_variances
  from public.restock_requests r
  where r.status = 'closed'
    and r.pricing_status = 'ready_to_invoice'
    and r.internal_pos_document_id is null
    and r.closed_at is not null
    and r.closed_at <= v_cutoff_at
    and exists (
      select 1
      from public.internal_transfer_variances v
      where v.remission_id = r.id
        and coalesce(v.status, '') not in ('resolved', 'approved', 'cancelled', 'closed')
    );

  if p_dry_run then
    return jsonb_build_object(
      'dry_run', true,
      'cutoff_at', v_cutoff_at,
      'document_date', v_document_date,
      'candidate_remissions', v_candidate_remissions,
      'candidate_lines', v_candidate_lines,
      'candidate_total', coalesce(v_total, 0),
      'blocked_unpriced_remissions', coalesce(v_blocked_unpriced, 0),
      'blocked_variance_remissions', coalesce(v_blocked_variances, 0)
    );
  end if;

  for v_group in
    select
      seller_cost_center_id,
      buyer_cost_center_id,
      buyer_site_id,
      currency,
      count(distinct remission_id) as remission_count,
      count(*) as line_count,
      coalesce(sum(subtotal), 0) as total
    from _daily_internal_pos_candidate_lines
    group by
      seller_cost_center_id,
      buyer_cost_center_id,
      buyer_site_id,
      currency
    having coalesce(sum(subtotal), 0) >= 0
    order by buyer_cost_center_id, currency
  loop
    insert into public.internal_pos_document_sequences (
      document_date,
      last_value,
      updated_at
    )
    values (
      v_document_date,
      0,
      now()
    )
    on conflict (document_date)
    do nothing;

    update public.internal_pos_document_sequences
    set
      last_value = last_value + 1,
      updated_at = now()
    where document_date = v_document_date
    returning last_value into v_sequence_value;

    v_document_number :=
      'IPOS-' ||
      to_char(v_document_date, 'YYYYMMDD') ||
      '-' ||
      lpad(v_sequence_value::text, 4, '0');

    v_document_id := gen_random_uuid();
    v_group_total := coalesce(v_group.total, 0);

    insert into public.internal_pos_documents (
      id,
      document_number,
      document_date,
      cutoff_at,
      seller_cost_center_id,
      buyer_cost_center_id,
      buyer_site_id,
      status,
      subtotal,
      total,
      currency,
      generated_by_system,
      generated_at,
      issued_at,
      notes,
      created_at,
      updated_at
    )
    values (
      v_document_id,
      v_document_number,
      v_document_date,
      v_cutoff_at,
      v_group.seller_cost_center_id,
      v_group.buyer_cost_center_id,
      v_group.buyer_site_id,
      'issued',
      v_group_total,
      v_group_total,
      v_group.currency,
      true,
      now(),
      now(),
      'Comprobante interno generado automaticamente para corte diario de las 5:00 p.m. Colombia.',
      now(),
      now()
    );

    insert into public.internal_pos_document_lines (
      id,
      document_id,
      remission_id,
      remission_item_id,
      product_id,
      quantity,
      unit_code,
      unit_price,
      subtotal,
      price_list_id,
      price_list_item_id,
      priced_at,
      created_at
    )
    select
      gen_random_uuid(),
      v_document_id,
      l.remission_id,
      l.remission_item_id,
      l.product_id,
      l.quantity,
      l.unit_code,
      l.unit_price,
      l.subtotal,
      l.price_list_id,
      l.price_list_item_id,
      l.priced_at,
      now()
    from _daily_internal_pos_candidate_lines l
    where l.seller_cost_center_id = v_group.seller_cost_center_id
      and l.buyer_cost_center_id = v_group.buyer_cost_center_id
      and coalesce(l.buyer_site_id, '00000000-0000-0000-0000-000000000000'::uuid)
          = coalesce(v_group.buyer_site_id, '00000000-0000-0000-0000-000000000000'::uuid)
      and l.currency = v_group.currency;

    get diagnostics v_lines_created = row_count;

    update public.restock_requests r
    set
      internal_pos_document_id = v_document_id,
      pricing_status = 'invoiced'
    where r.id in (
      select distinct l.remission_id
      from _daily_internal_pos_candidate_lines l
      where l.seller_cost_center_id = v_group.seller_cost_center_id
        and l.buyer_cost_center_id = v_group.buyer_cost_center_id
        and coalesce(l.buyer_site_id, '00000000-0000-0000-0000-000000000000'::uuid)
            = coalesce(v_group.buyer_site_id, '00000000-0000-0000-0000-000000000000'::uuid)
        and l.currency = v_group.currency
    );

    get diagnostics v_remissions_invoiced = row_count;

    v_documents_created := v_documents_created + 1;
  end loop;

  select jsonb_build_object(
    'dry_run', false,
    'cutoff_at', v_cutoff_at,
    'document_date', v_document_date,
    'documents_created', v_documents_created,
    'remissions_invoiced', (
      select count(distinct remission_id)
      from _daily_internal_pos_candidate_lines
    ),
    'lines_created', (
      select count(*)
      from _daily_internal_pos_candidate_lines
    ),
    'total', coalesce(v_total, 0),
    'blocked_unpriced_remissions', coalesce(v_blocked_unpriced, 0),
    'blocked_variance_remissions', coalesce(v_blocked_variances, 0)
  )
  into v_result;

  return v_result;
end;
$$;

comment on function public.generate_daily_internal_pos_documents(timestamptz, boolean) is
  'Generates internal POS documents for closed, valued internal remissions up to the given cutoff. Use p_dry_run=true to preview.';

grant execute on function public.generate_daily_internal_pos_documents(timestamptz, boolean)
to authenticated, service_role;

-- =====================================================================================
-- 3. Convenience preview for the standard 5 p.m. Colombia cutoff
-- =====================================================================================

create or replace function public.preview_daily_internal_pos_documents(
  p_cutoff_at timestamptz default now()
)
returns jsonb
language sql
security definer
set search_path = public
as $$
  select public.generate_daily_internal_pos_documents(p_cutoff_at, true);
$$;

comment on function public.preview_daily_internal_pos_documents(timestamptz) is
  'Preview daily internal POS generation without writing documents.';

grant execute on function public.preview_daily_internal_pos_documents(timestamptz)
to authenticated, service_role;


-- =====================================================================================
-- 4. Manual operation helpers
-- =====================================================================================

create or replace function public.get_colombia_internal_pos_cutoff_at(
  p_document_date date default null
)
returns timestamptz
language sql
stable
set search_path = public
as $$
  select (
    coalesce(
      p_document_date,
      (now() at time zone 'America/Bogota')::date
    )::text || ' 17:00:00-05'
  )::timestamptz;
$$;

comment on function public.get_colombia_internal_pos_cutoff_at(date) is
  'Returns the 5:00 p.m. Colombia cutoff timestamp for the given document date, or today in Colombia when null.';

grant execute on function public.get_colombia_internal_pos_cutoff_at(date)
to authenticated, service_role;

create or replace function public.preview_manual_daily_internal_pos_documents(
  p_document_date date default null
)
returns jsonb
language sql
security definer
set search_path = public
as $$
  select public.generate_daily_internal_pos_documents(
    public.get_colombia_internal_pos_cutoff_at(p_document_date),
    true
  );
$$;

comment on function public.preview_manual_daily_internal_pos_documents(date) is
  'Manual preview for daily internal POS documents using the 5:00 p.m. Colombia cutoff for the selected date. Does not write data.';

grant execute on function public.preview_manual_daily_internal_pos_documents(date)
to authenticated, service_role;

create or replace function public.generate_manual_daily_internal_pos_documents(
  p_document_date date default null
)
returns jsonb
language sql
security definer
set search_path = public
as $$
  select public.generate_daily_internal_pos_documents(
    public.get_colombia_internal_pos_cutoff_at(p_document_date),
    false
  );
$$;

comment on function public.generate_manual_daily_internal_pos_documents(date) is
  'Manual generation for daily internal POS documents using the 5:00 p.m. Colombia cutoff for the selected date. Writes documents and marks remissions as invoiced.';

grant execute on function public.generate_manual_daily_internal_pos_documents(date)
to authenticated, service_role;


commit;

-- =====================================================================================
-- Validation / smoke tests
-- =====================================================================================

select
  'internal_pos_document_generator_functions' as check_name,
  p.proname as function_name,
  pg_get_function_arguments(p.oid) as arguments,
  pg_get_function_result(p.oid) as result_type
from pg_proc p
join pg_namespace n
  on n.oid = p.pronamespace
where n.nspname = 'public'
  and p.proname in (
    'generate_daily_internal_pos_documents',
    'preview_daily_internal_pos_documents',
    'get_colombia_internal_pos_cutoff_at',
    'preview_manual_daily_internal_pos_documents',
    'generate_manual_daily_internal_pos_documents'
  )
order by p.proname;

-- Dry-run example for today's 5:00 p.m. Colombia cutoff:
-- select public.preview_manual_daily_internal_pos_documents();

-- Dry-run example for a specific operating date:
-- select public.preview_manual_daily_internal_pos_documents('2026-05-31'::date);

-- Manual generation for today's 5:00 p.m. Colombia cutoff:
-- select public.generate_manual_daily_internal_pos_documents();

-- Manual generation for a specific operating date:
-- select public.generate_manual_daily_internal_pos_documents('2026-05-31'::date);
