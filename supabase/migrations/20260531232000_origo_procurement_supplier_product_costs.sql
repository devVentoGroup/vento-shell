-- =====================================================================================
-- VENTO OS / ORIGO
-- Migration: Supplier + product + presentation cost memory
-- File: 20260531132000_origo_procurement_supplier_product_costs.sql
--
-- Purpose:
-- - Store real purchase-cost history by supplier + product + purchase presentation.
-- - Keep last and weighted-average costs from actual receipts.
-- - Support future ORIGO UX:
--     * suggested prices in purchase orders,
--     * supplier-filtered product selector,
--     * presentation-level purchase cost,
--     * direct receipts without OC,
--     * cost updates from received invoices.
--
-- Business rules:
-- - Inventory valuation uses net cost, excluding recoverable tax.
-- - The receipt keeps both net and gross values.
-- - If the user entered tax-included price, net is calculated from gross.
-- - If the user entered tax-excluded price, gross is calculated from net.
-- - Average cost is weighted by received quantity.
--
-- Existing columns used:
-- - inventory_entries.supplier_id
-- - inventory_entry_items.product_id
-- - inventory_entry_items.input_uom_profile_id
-- - inventory_entry_items.input_qty
-- - inventory_entry_items.input_unit_code
-- - inventory_entry_items.unit
-- - inventory_entry_items.conversion_factor_to_stock
-- - inventory_entry_items.stock_unit_code
-- - inventory_entry_items.input_unit_cost
-- - inventory_entry_items.tax_included
-- - inventory_entry_items.tax_rate
-- - inventory_entry_items.net_unit_cost
-- - inventory_entry_items.gross_unit_cost
-- - inventory_entry_items.stock_unit_cost
-- - inventory_entry_items.quantity_received
-- - inventory_entry_items.currency
--
-- Safe to run multiple times.
-- =====================================================================================

begin;

-- =====================================================================================
-- 1. Cost memory table
-- =====================================================================================

create table if not exists public.procurement_supplier_product_costs (
  id uuid primary key default gen_random_uuid(),

  supplier_id uuid not null references public.suppliers(id) on delete restrict,
  product_id uuid not null references public.products(id) on delete restrict,
  input_uom_profile_id uuid null references public.product_uom_profiles(id) on delete set null,

  input_unit_code text not null,
  input_unit_label text not null,
  conversion_factor_to_stock numeric not null,
  stock_unit_code text not null,
  currency text not null default 'COP',

  last_net_unit_cost numeric not null default 0,
  last_gross_unit_cost numeric not null default 0,
  last_stock_unit_cost numeric not null default 0,

  avg_net_unit_cost numeric not null default 0,
  avg_gross_unit_cost numeric not null default 0,
  avg_stock_unit_cost numeric not null default 0,

  total_input_qty numeric not null default 0,
  total_stock_qty numeric not null default 0,
  total_net_cost numeric not null default 0,
  total_gross_cost numeric not null default 0,
  samples_count integer not null default 0,

  last_entry_id uuid null references public.inventory_entries(id) on delete set null,
  last_entry_item_id uuid null references public.inventory_entry_items(id) on delete set null,
  last_received_at timestamp with time zone null,

  is_active boolean not null default true,
  created_at timestamp with time zone not null default now(),
  updated_at timestamp with time zone not null default now()
);

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'procurement_supplier_product_costs_qty_chk'
      and conrelid = 'public.procurement_supplier_product_costs'::regclass
  ) then
    alter table public.procurement_supplier_product_costs
      add constraint procurement_supplier_product_costs_qty_chk
      check (
        conversion_factor_to_stock > 0
        and total_input_qty >= 0
        and total_stock_qty >= 0
        and samples_count >= 0
      );
  end if;

  if not exists (
    select 1
    from pg_constraint
    where conname = 'procurement_supplier_product_costs_costs_chk'
      and conrelid = 'public.procurement_supplier_product_costs'::regclass
  ) then
    alter table public.procurement_supplier_product_costs
      add constraint procurement_supplier_product_costs_costs_chk
      check (
        last_net_unit_cost >= 0
        and last_gross_unit_cost >= 0
        and last_stock_unit_cost >= 0
        and avg_net_unit_cost >= 0
        and avg_gross_unit_cost >= 0
        and avg_stock_unit_cost >= 0
        and total_net_cost >= 0
        and total_gross_cost >= 0
      );
  end if;
end $$;

create index if not exists procurement_supplier_product_costs_supplier_idx
  on public.procurement_supplier_product_costs (supplier_id, product_id);

create index if not exists procurement_supplier_product_costs_product_idx
  on public.procurement_supplier_product_costs (product_id, supplier_id);

create index if not exists procurement_supplier_product_costs_last_received_idx
  on public.procurement_supplier_product_costs (last_received_at desc nulls last);

-- One active cost-memory row per supplier/product/presentation/currency.
-- Uses an expression because input_uom_profile_id can be null.
create unique index if not exists procurement_supplier_product_costs_active_uidx
  on public.procurement_supplier_product_costs (
    supplier_id,
    product_id,
    coalesce(input_uom_profile_id, '00000000-0000-0000-0000-000000000000'::uuid),
    lower(input_unit_code),
    conversion_factor_to_stock,
    lower(stock_unit_code),
    currency
  )
  where is_active = true;

-- =====================================================================================
-- 2. Optional receipt item link back to the cost-memory row
-- =====================================================================================

alter table public.inventory_entry_items
  add column if not exists supplier_product_cost_id uuid null;

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'inventory_entry_items_supplier_product_cost_id_fkey'
      and conrelid = 'public.inventory_entry_items'::regclass
  ) then
    alter table public.inventory_entry_items
      add constraint inventory_entry_items_supplier_product_cost_id_fkey
      foreign key (supplier_product_cost_id)
      references public.procurement_supplier_product_costs(id)
      on delete set null;
  end if;
end $$;

create index if not exists inventory_entry_items_supplier_product_cost_idx
  on public.inventory_entry_items (supplier_product_cost_id);

-- Explicit cost-input mode for the new ORIGO UI.
-- Kept in addition to tax_included because it is clearer for the frontend.
alter table public.inventory_entry_items
  add column if not exists cost_input_mode text null;

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'inventory_entry_items_cost_input_mode_chk'
      and conrelid = 'public.inventory_entry_items'::regclass
  ) then
    alter table public.inventory_entry_items
      add constraint inventory_entry_items_cost_input_mode_chk
      check (
        cost_input_mode is null
        or cost_input_mode in ('net', 'gross')
      );
  end if;
end $$;

alter table public.inventory_entry_items
  add column if not exists net_total_cost numeric null,
  add column if not exists gross_total_cost numeric null,
  add column if not exists tax_amount numeric null;

-- =====================================================================================
-- 3. Helper: normalize receipt line costs from tax mode
-- =====================================================================================

create or replace function public.normalize_procurement_receipt_costs(
  p_input_unit_cost numeric,
  p_tax_included boolean default false,
  p_tax_rate numeric default 0,
  p_conversion_factor_to_stock numeric default 1,
  p_input_qty numeric default 1
)
returns table (
  cost_input_mode text,
  net_unit_cost numeric,
  gross_unit_cost numeric,
  tax_unit_amount numeric,
  stock_unit_cost numeric,
  net_total_cost numeric,
  gross_total_cost numeric,
  tax_amount numeric
)
language sql
stable
set search_path = public
as $$
  with safe as (
    select
      greatest(coalesce(p_input_unit_cost, 0), 0)::numeric as input_cost,
      coalesce(p_tax_included, false) as tax_included,
      greatest(coalesce(p_tax_rate, 0), 0)::numeric as tax_rate,
      greatest(coalesce(p_conversion_factor_to_stock, 1), 0.000001)::numeric as factor,
      greatest(coalesce(p_input_qty, 0), 0)::numeric as qty
  ),
  normalized as (
    select
      case when tax_included then 'gross' else 'net' end as cost_input_mode,
      case
        when tax_included and tax_rate > 0 then input_cost / (1 + (tax_rate / 100))
        else input_cost
      end as net_unit_cost,
      case
        when tax_included then input_cost
        else input_cost * (1 + (tax_rate / 100))
      end as gross_unit_cost,
      factor,
      qty
    from safe
  )
  select
    cost_input_mode,
    round(net_unit_cost, 6) as net_unit_cost,
    round(gross_unit_cost, 6) as gross_unit_cost,
    round(gross_unit_cost - net_unit_cost, 6) as tax_unit_amount,
    round(net_unit_cost / factor, 6) as stock_unit_cost,
    round(net_unit_cost * qty, 6) as net_total_cost,
    round(gross_unit_cost * qty, 6) as gross_total_cost,
    round((gross_unit_cost - net_unit_cost) * qty, 6) as tax_amount
  from normalized;
$$;

comment on function public.normalize_procurement_receipt_costs(numeric, boolean, numeric, numeric, numeric) is
  'Normalizes receipt line cost into net/gross/tax/stock-unit values for ORIGO purchases.';

grant execute on function public.normalize_procurement_receipt_costs(numeric, boolean, numeric, numeric, numeric)
to authenticated, service_role;

-- =====================================================================================
-- 4. Sync one inventory_entry_item into supplier/product/presentation cost memory
-- =====================================================================================

create or replace function public.sync_procurement_supplier_product_cost_from_entry_item(
  p_entry_item_id uuid
)
returns uuid
language plpgsql
security definer
set search_path = public
as $$
declare
  v_row record;
  v_norm record;

  v_existing_id uuid;
  v_cost_id uuid;

  v_input_qty numeric;
  v_stock_qty numeric;
  v_factor numeric;

  v_total_input_qty numeric;
  v_total_stock_qty numeric;
  v_total_net_cost numeric;
  v_total_gross_cost numeric;
  v_samples_count integer;
begin
  select
    i.id as entry_item_id,
    i.entry_id,
    i.product_id,
    i.input_uom_profile_id,
    i.input_qty,
    i.quantity_received,
    i.input_unit_code,
    i.unit,
    i.conversion_factor_to_stock,
    i.stock_unit_code,
    i.input_unit_cost,
    i.tax_included,
    i.tax_rate,
    i.net_unit_cost as existing_net_unit_cost,
    i.gross_unit_cost as existing_gross_unit_cost,
    i.stock_unit_cost as existing_stock_unit_cost,
    i.net_total_cost as existing_net_total_cost,
    i.gross_total_cost as existing_gross_total_cost,
    i.currency,
    e.supplier_id,
    e.received_at,
    e.created_at as entry_created_at
  into v_row
  from public.inventory_entry_items i
  join public.inventory_entries e
    on e.id = i.entry_id
  where i.id = p_entry_item_id;

  if not found then
    raise exception 'inventory_entry_item_not_found: %', p_entry_item_id;
  end if;

  if v_row.supplier_id is null then
    return null;
  end if;

  v_factor := greatest(coalesce(v_row.conversion_factor_to_stock, 1), 0.000001);
  v_stock_qty := greatest(coalesce(v_row.quantity_received, 0), 0);

  v_input_qty :=
    case
      when coalesce(v_row.input_qty, 0) > 0 then v_row.input_qty
      when v_stock_qty > 0 and v_factor > 0 then v_stock_qty / v_factor
      else 0
    end;

  if v_input_qty <= 0 or v_stock_qty <= 0 then
    return null;
  end if;

  select *
  into v_norm
  from public.normalize_procurement_receipt_costs(
    coalesce(
      nullif(v_row.input_unit_cost, 0),
      nullif(v_row.existing_gross_unit_cost, 0),
      nullif(v_row.existing_net_unit_cost, 0),
      0
    ),
    coalesce(v_row.tax_included, false),
    coalesce(v_row.tax_rate, 0),
    v_factor,
    v_input_qty
  );

  -- Prefer explicitly stored normalized values when they already exist.
  v_norm.net_unit_cost :=
    case
      when coalesce(v_row.existing_net_unit_cost, 0) > 0 then v_row.existing_net_unit_cost
      else v_norm.net_unit_cost
    end;

  v_norm.gross_unit_cost :=
    case
      when coalesce(v_row.existing_gross_unit_cost, 0) > 0 then v_row.existing_gross_unit_cost
      else v_norm.gross_unit_cost
    end;

  v_norm.stock_unit_cost :=
    case
      when coalesce(v_row.existing_stock_unit_cost, 0) > 0 then v_row.existing_stock_unit_cost
      else v_norm.stock_unit_cost
    end;

  v_norm.net_total_cost :=
    case
      when coalesce(v_row.existing_net_total_cost, 0) > 0 then v_row.existing_net_total_cost
      else round(v_norm.net_unit_cost * v_input_qty, 6)
    end;

  v_norm.gross_total_cost :=
    case
      when coalesce(v_row.existing_gross_total_cost, 0) > 0 then v_row.existing_gross_total_cost
      else round(v_norm.gross_unit_cost * v_input_qty, 6)
    end;

  select c.id
  into v_existing_id
  from public.procurement_supplier_product_costs c
  where c.is_active = true
    and c.supplier_id = v_row.supplier_id
    and c.product_id = v_row.product_id
    and c.input_uom_profile_id is not distinct from v_row.input_uom_profile_id
    and lower(c.input_unit_code) = lower(coalesce(nullif(v_row.input_unit_code, ''), nullif(v_row.unit, ''), 'un'))
    and c.conversion_factor_to_stock = v_factor
    and lower(c.stock_unit_code) = lower(coalesce(nullif(v_row.stock_unit_code, ''), nullif(v_row.input_unit_code, ''), 'un'))
    and c.currency = coalesce(nullif(v_row.currency, ''), 'COP')
  limit 1;

  if v_existing_id is null then
    insert into public.procurement_supplier_product_costs (
      supplier_id,
      product_id,
      input_uom_profile_id,
      input_unit_code,
      input_unit_label,
      conversion_factor_to_stock,
      stock_unit_code,
      currency,

      last_net_unit_cost,
      last_gross_unit_cost,
      last_stock_unit_cost,

      avg_net_unit_cost,
      avg_gross_unit_cost,
      avg_stock_unit_cost,

      total_input_qty,
      total_stock_qty,
      total_net_cost,
      total_gross_cost,
      samples_count,

      last_entry_id,
      last_entry_item_id,
      last_received_at
    )
    values (
      v_row.supplier_id,
      v_row.product_id,
      v_row.input_uom_profile_id,
      lower(coalesce(nullif(v_row.input_unit_code, ''), nullif(v_row.unit, ''), 'un')),
      coalesce(nullif(v_row.unit, ''), nullif(v_row.input_unit_code, ''), 'un'),
      v_factor,
      lower(coalesce(nullif(v_row.stock_unit_code, ''), nullif(v_row.input_unit_code, ''), 'un')),
      coalesce(nullif(v_row.currency, ''), 'COP'),

      round(v_norm.net_unit_cost, 6),
      round(v_norm.gross_unit_cost, 6),
      round(v_norm.stock_unit_cost, 6),

      round(v_norm.net_total_cost / nullif(v_input_qty, 0), 6),
      round(v_norm.gross_total_cost / nullif(v_input_qty, 0), 6),
      round(v_norm.net_total_cost / nullif(v_stock_qty, 0), 6),

      round(v_input_qty, 6),
      round(v_stock_qty, 6),
      round(v_norm.net_total_cost, 6),
      round(v_norm.gross_total_cost, 6),
      1,

      v_row.entry_id,
      v_row.entry_item_id,
      coalesce(v_row.received_at, v_row.entry_created_at, now())
    )
    returning id into v_cost_id;
  else
    select
      c.total_input_qty + v_input_qty,
      c.total_stock_qty + v_stock_qty,
      c.total_net_cost + v_norm.net_total_cost,
      c.total_gross_cost + v_norm.gross_total_cost,
      c.samples_count + 1
    into
      v_total_input_qty,
      v_total_stock_qty,
      v_total_net_cost,
      v_total_gross_cost,
      v_samples_count
    from public.procurement_supplier_product_costs c
    where c.id = v_existing_id;

    update public.procurement_supplier_product_costs
    set
      input_unit_label = coalesce(nullif(v_row.unit, ''), nullif(v_row.input_unit_code, ''), input_unit_label),

      last_net_unit_cost = round(v_norm.net_unit_cost, 6),
      last_gross_unit_cost = round(v_norm.gross_unit_cost, 6),
      last_stock_unit_cost = round(v_norm.stock_unit_cost, 6),

      avg_net_unit_cost = round(v_total_net_cost / nullif(v_total_input_qty, 0), 6),
      avg_gross_unit_cost = round(v_total_gross_cost / nullif(v_total_input_qty, 0), 6),
      avg_stock_unit_cost = round(v_total_net_cost / nullif(v_total_stock_qty, 0), 6),

      total_input_qty = round(v_total_input_qty, 6),
      total_stock_qty = round(v_total_stock_qty, 6),
      total_net_cost = round(v_total_net_cost, 6),
      total_gross_cost = round(v_total_gross_cost, 6),
      samples_count = v_samples_count,

      last_entry_id = v_row.entry_id,
      last_entry_item_id = v_row.entry_item_id,
      last_received_at = coalesce(v_row.received_at, v_row.entry_created_at, now()),
      updated_at = now()
    where id = v_existing_id
    returning id into v_cost_id;
  end if;

  update public.inventory_entry_items
  set
    supplier_product_cost_id = v_cost_id,
    cost_input_mode = coalesce(cost_input_mode, v_norm.cost_input_mode),
    net_unit_cost = coalesce(nullif(net_unit_cost, 0), round(v_norm.net_unit_cost, 6)),
    gross_unit_cost = coalesce(nullif(gross_unit_cost, 0), round(v_norm.gross_unit_cost, 6)),
    stock_unit_cost = coalesce(nullif(stock_unit_cost, 0), round(v_norm.stock_unit_cost, 6)),
    net_total_cost = coalesce(nullif(net_total_cost, 0), round(v_norm.net_total_cost, 6)),
    gross_total_cost = coalesce(nullif(gross_total_cost, 0), round(v_norm.gross_total_cost, 6)),
    tax_amount = coalesce(nullif(tax_amount, 0), round(v_norm.gross_total_cost - v_norm.net_total_cost, 6))
  where id = v_row.entry_item_id;

  return v_cost_id;
end;
$$;

comment on function public.sync_procurement_supplier_product_cost_from_entry_item(uuid) is
  'Updates ORIGO supplier/product/presentation cost memory from one inventory_entry_items row.';

grant execute on function public.sync_procurement_supplier_product_cost_from_entry_item(uuid)
to authenticated, service_role;

-- =====================================================================================
-- 5. Rebuild helper for historical receipts
-- =====================================================================================

create or replace function public.rebuild_procurement_supplier_product_costs()
returns jsonb
language plpgsql
security definer
set search_path = public
as $$
declare
  v_item record;
  v_synced integer := 0;
  v_skipped integer := 0;
begin
  truncate table public.procurement_supplier_product_costs restart identity cascade;

  update public.inventory_entry_items
  set supplier_product_cost_id = null;

  for v_item in
    select i.id
    from public.inventory_entry_items i
    join public.inventory_entries e
      on e.id = i.entry_id
    where e.supplier_id is not null
      and coalesce(i.quantity_received, 0) > 0
    order by coalesce(e.received_at, e.created_at), i.created_at, i.id
  loop
    begin
      perform public.sync_procurement_supplier_product_cost_from_entry_item(v_item.id);
      v_synced := v_synced + 1;
    exception when others then
      v_skipped := v_skipped + 1;
    end;
  end loop;

  return jsonb_build_object(
    'synced_items', v_synced,
    'skipped_items', v_skipped,
    'cost_rows', (select count(*) from public.procurement_supplier_product_costs)
  );
end;
$$;

comment on function public.rebuild_procurement_supplier_product_costs() is
  'Rebuilds ORIGO supplier/product/presentation cost memory from historical inventory entries.';

grant execute on function public.rebuild_procurement_supplier_product_costs()
to authenticated, service_role;

-- =====================================================================================
-- 6. Trigger for new receipt items
-- =====================================================================================

create or replace function public.tg_sync_procurement_supplier_product_cost_from_entry_item()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  perform public.sync_procurement_supplier_product_cost_from_entry_item(new.id);
  return new;
exception when others then
  -- Do not block physical receipt if cost-memory sync fails.
  -- The rebuild function can repair cost memory later.
  return new;
end;
$$;

drop trigger if exists trg_sync_procurement_supplier_product_cost_from_entry_item
on public.inventory_entry_items;

create trigger trg_sync_procurement_supplier_product_cost_from_entry_item
after insert on public.inventory_entry_items
for each row
execute function public.tg_sync_procurement_supplier_product_cost_from_entry_item();

commit;

-- =====================================================================================
-- Validation
-- =====================================================================================

select
  'procurement_cost_memory_tables' as check_name,
  table_name
from information_schema.tables
where table_schema = 'public'
  and table_name = 'procurement_supplier_product_costs';

select
  'procurement_cost_memory_columns' as check_name,
  column_name,
  data_type,
  is_nullable
from information_schema.columns
where table_schema = 'public'
  and table_name = 'procurement_supplier_product_costs'
order by ordinal_position;

select
  'procurement_cost_memory_functions' as check_name,
  p.proname as function_name,
  pg_get_function_arguments(p.oid) as arguments,
  pg_get_function_result(p.oid) as result_type
from pg_proc p
join pg_namespace n
  on n.oid = p.pronamespace
where n.nspname = 'public'
  and p.proname in (
    'normalize_procurement_receipt_costs',
    'sync_procurement_supplier_product_cost_from_entry_item',
    'rebuild_procurement_supplier_product_costs',
    'tg_sync_procurement_supplier_product_cost_from_entry_item'
  )
order by p.proname;

select
  'procurement_cost_memory_trigger' as check_name,
  event_object_table,
  trigger_name,
  action_timing,
  event_manipulation
from information_schema.triggers
where event_object_schema = 'public'
  and event_object_table = 'inventory_entry_items'
  and trigger_name = 'trg_sync_procurement_supplier_product_cost_from_entry_item';
