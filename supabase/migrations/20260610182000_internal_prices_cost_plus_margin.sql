-- =====================================================================================
-- VENTO / NEXO
-- Internal prices: cost plus margin formulas.
--
-- Keeps unit_price as the frozen operational price used by remissions, but stores how it
-- was calculated so NUMERA can audit internal sales/margins later.
-- =====================================================================================

begin;

alter table public.internal_price_list_items
  add column if not exists pricing_method text not null default 'manual',
  add column if not exists margin_pct numeric null,
  add column if not exists base_unit_cost numeric null,
  add column if not exists base_cost_source text null,
  add column if not exists suggested_unit_price numeric null,
  add column if not exists formula_snapshot jsonb not null default '{}'::jsonb;

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'internal_price_items_pricing_method_chk'
      and conrelid = 'public.internal_price_list_items'::regclass
  ) then
    alter table public.internal_price_list_items
      add constraint internal_price_items_pricing_method_chk
      check (pricing_method in ('manual', 'cost_plus_margin'));
  end if;

  if not exists (
    select 1
    from pg_constraint
    where conname = 'internal_price_items_margin_pct_chk'
      and conrelid = 'public.internal_price_list_items'::regclass
  ) then
    alter table public.internal_price_list_items
      add constraint internal_price_items_margin_pct_chk
      check (margin_pct is null or (margin_pct >= 0 and margin_pct <= 500));
  end if;

  if not exists (
    select 1
    from pg_constraint
    where conname = 'internal_price_items_base_cost_non_negative_chk'
      and conrelid = 'public.internal_price_list_items'::regclass
  ) then
    alter table public.internal_price_list_items
      add constraint internal_price_items_base_cost_non_negative_chk
      check (base_unit_cost is null or base_unit_cost >= 0);
  end if;

  if not exists (
    select 1
    from pg_constraint
    where conname = 'internal_price_items_suggested_price_non_negative_chk'
      and conrelid = 'public.internal_price_list_items'::regclass
  ) then
    alter table public.internal_price_list_items
      add constraint internal_price_items_suggested_price_non_negative_chk
      check (suggested_unit_price is null or suggested_unit_price >= 0);
  end if;
end $$;

comment on column public.internal_price_list_items.pricing_method is
  'manual: unit_price was typed directly. cost_plus_margin: unit_price was calculated from base cost and margin, then frozen for remissions.';
comment on column public.internal_price_list_items.margin_pct is
  'Margin percentage used when pricing_method = cost_plus_margin.';
comment on column public.internal_price_list_items.base_unit_cost is
  'Base cost per pricing unit/presentation used to calculate the suggested internal price.';
comment on column public.internal_price_list_items.base_cost_source is
  'Source used for base_unit_cost: production_avg_cost, stock_avg_cost, procurement_avg_cost, product_cost, none.';
comment on column public.internal_price_list_items.suggested_unit_price is
  'Calculated price before optional manual override.';
comment on column public.internal_price_list_items.formula_snapshot is
  'Audit snapshot for the internal pricing formula.';

create or replace function public.estimate_internal_price_unit(
  p_product_id uuid,
  p_seller_cost_center_id uuid default null,
  p_uom_profile_id uuid default null,
  p_margin_pct numeric default 0
) returns table(
  base_unit_cost numeric,
  base_cost_source text,
  suggested_unit_price numeric,
  pricing_factor_to_stock numeric,
  stock_unit_cost numeric
)
language plpgsql
stable
security definer
set search_path = public, pg_temp
as $$
declare
  v_seller_site_id uuid;
  v_factor numeric := 1;
  v_stock_unit_cost numeric := 0;
  v_source text := 'none';
  v_margin numeric := greatest(coalesce(p_margin_pct, 0), 0);
begin
  select cc.site_id
    into v_seller_site_id
  from public.cost_centers cc
  where cc.id = p_seller_cost_center_id;

  if p_uom_profile_id is not null then
    select
      case
        when coalesce(p.qty_in_input_unit, 0) > 0
          then p.qty_in_stock_unit / p.qty_in_input_unit
        else 1
      end
      into v_factor
    from public.product_uom_profiles p
    where p.id = p_uom_profile_id
      and p.product_id = p_product_id;
  end if;

  v_factor := greatest(coalesce(v_factor, 1), 0);

  if v_seller_site_id is not null then
    select nullif(iss.avg_unit_cost, 0)
      into v_stock_unit_cost
    from public.inventory_stock_by_site iss
    where iss.site_id = v_seller_site_id
      and iss.product_id = p_product_id;

    if coalesce(v_stock_unit_cost, 0) > 0 then
      v_source := 'stock_avg_cost';
    end if;
  end if;

  if coalesce(v_stock_unit_cost, 0) <= 0 then
    select nullif(pce.cost_after, 0)
      into v_stock_unit_cost
    from public.product_cost_events pce
    where pce.product_id = p_product_id
      and (v_seller_site_id is null or pce.site_id = v_seller_site_id or pce.site_id is null)
    order by
      case when pce.source = 'production' then 0 else 1 end,
      pce.created_at desc
    limit 1;

    if coalesce(v_stock_unit_cost, 0) > 0 then
      v_source := 'production_or_cost_event';
    end if;
  end if;

  if coalesce(v_stock_unit_cost, 0) <= 0 then
    select nullif(avg(c.avg_stock_unit_cost), 0)
      into v_stock_unit_cost
    from public.procurement_supplier_product_costs c
    where c.product_id = p_product_id
      and c.is_active = true
      and c.avg_stock_unit_cost > 0;

    if coalesce(v_stock_unit_cost, 0) > 0 then
      v_source := 'procurement_avg_cost';
    end if;
  end if;

  if coalesce(v_stock_unit_cost, 0) <= 0 then
    select nullif(p.cost, 0)
      into v_stock_unit_cost
    from public.products p
    where p.id = p_product_id;

    if coalesce(v_stock_unit_cost, 0) > 0 then
      v_source := 'product_cost';
    end if;
  end if;

  v_stock_unit_cost := greatest(coalesce(v_stock_unit_cost, 0), 0);

  return query select
    round(v_stock_unit_cost * v_factor, 6) as base_unit_cost,
    v_source as base_cost_source,
    round((v_stock_unit_cost * v_factor) * (1 + (v_margin / 100.0)), 2) as suggested_unit_price,
    v_factor as pricing_factor_to_stock,
    v_stock_unit_cost as stock_unit_cost;
end;
$$;

comment on function public.estimate_internal_price_unit(uuid, uuid, uuid, numeric) is
  'Estimates an internal price per selected pricing unit/presentation using stock/production/procurement/product cost plus a margin percentage.';

grant execute on function public.estimate_internal_price_unit(uuid, uuid, uuid, numeric) to authenticated;
grant execute on function public.estimate_internal_price_unit(uuid, uuid, uuid, numeric) to service_role;

commit;

select
  'internal_price_formula_columns' as check_name,
  column_name
from information_schema.columns
where table_schema = 'public'
  and table_name = 'internal_price_list_items'
  and column_name in ('pricing_method', 'margin_pct', 'base_unit_cost', 'base_cost_source', 'suggested_unit_price', 'formula_snapshot')
order by column_name;