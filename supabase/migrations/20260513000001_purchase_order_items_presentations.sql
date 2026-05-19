begin;

alter table if exists public.purchase_order_items
  add column if not exists input_uom_profile_id uuid;

alter table if exists public.purchase_order_items
  add column if not exists input_unit_code text;

alter table if exists public.purchase_order_items
  add column if not exists input_unit_label text;

alter table if exists public.purchase_order_items
  add column if not exists conversion_factor_to_stock numeric;

alter table if exists public.purchase_order_items
  add column if not exists stock_unit_code text;

alter table if exists public.purchase_order_items
  add column if not exists stock_quantity_ordered numeric;

alter table if exists public.purchase_order_items
  add column if not exists stock_unit_cost numeric;

do $$
begin
  if to_regclass('public.product_uom_profiles') is not null and not exists (
    select 1
    from pg_constraint
    where conname = 'purchase_order_items_input_uom_profile_id_fkey'
  ) then
    alter table public.purchase_order_items
      add constraint purchase_order_items_input_uom_profile_id_fkey
      foreign key (input_uom_profile_id)
      references public.product_uom_profiles(id)
      on delete set null;
  end if;
end
$$;

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'purchase_order_items_conversion_factor_to_stock_chk'
  ) then
    alter table public.purchase_order_items
      add constraint purchase_order_items_conversion_factor_to_stock_chk
      check (
        conversion_factor_to_stock is null
        or conversion_factor_to_stock > 0
      );
  end if;
end
$$;

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'purchase_order_items_stock_quantity_ordered_chk'
  ) then
    alter table public.purchase_order_items
      add constraint purchase_order_items_stock_quantity_ordered_chk
      check (
        stock_quantity_ordered is null
        or stock_quantity_ordered >= 0
      );
  end if;
end
$$;

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'purchase_order_items_stock_unit_cost_chk'
  ) then
    alter table public.purchase_order_items
      add constraint purchase_order_items_stock_unit_cost_chk
      check (
        stock_unit_cost is null
        or stock_unit_cost >= 0
      );
  end if;
end
$$;

create index if not exists idx_purchase_order_items_input_uom_profile_id
  on public.purchase_order_items(input_uom_profile_id);

create index if not exists idx_purchase_order_items_product_input_uom
  on public.purchase_order_items(product_id, input_uom_profile_id);

commit;
