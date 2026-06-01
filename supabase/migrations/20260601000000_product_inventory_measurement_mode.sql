begin;

alter table public.product_inventory_profiles
  add column if not exists measurement_mode text not null default 'fixed_presentation',
  add column if not exists default_tolerance_percent numeric(7,3) not null default 0,
  add column if not exists requires_actual_receipt_qty boolean not null default false,
  add column if not exists requires_actual_dispatch_qty boolean not null default false,
  add column if not exists requires_actual_production_qty boolean not null default false,
  add column if not exists requires_count_alongside_weight boolean not null default false;

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'product_inventory_profiles_measurement_mode_chk'
  ) then
    alter table public.product_inventory_profiles
      add constraint product_inventory_profiles_measurement_mode_chk
      check (
        measurement_mode in (
          'fixed_presentation',
          'variable_weight',
          'count_with_weight',
          'bulk_volume'
        )
      );
  end if;

  if not exists (
    select 1
    from pg_constraint
    where conname = 'product_inventory_profiles_default_tolerance_percent_chk'
  ) then
    alter table public.product_inventory_profiles
      add constraint product_inventory_profiles_default_tolerance_percent_chk
      check (default_tolerance_percent >= 0 and default_tolerance_percent <= 100);
  end if;
end $$;

update public.product_inventory_profiles
set
  measurement_mode = coalesce(nullif(measurement_mode, ''), 'fixed_presentation'),
  default_tolerance_percent = coalesce(default_tolerance_percent, 0),
  requires_actual_receipt_qty = coalesce(requires_actual_receipt_qty, false),
  requires_actual_dispatch_qty = coalesce(requires_actual_dispatch_qty, false),
  requires_actual_production_qty = coalesce(requires_actual_production_qty, false),
  requires_count_alongside_weight = coalesce(requires_count_alongside_weight, false);

comment on column public.product_inventory_profiles.measurement_mode is
  'Operational measurement behavior: fixed_presentation, variable_weight, count_with_weight, or bulk_volume.';
comment on column public.product_inventory_profiles.default_tolerance_percent is
  'Normal operational tolerance percent for planned vs actual quantity differences.';
comment on column public.product_inventory_profiles.requires_actual_receipt_qty is
  'When true, receiving flows must capture actual received/accepted quantity.';
comment on column public.product_inventory_profiles.requires_actual_dispatch_qty is
  'When true, dispatch/remission flows must capture actual dispatched quantity.';
comment on column public.product_inventory_profiles.requires_actual_production_qty is
  'When true, production flows must capture actual consumed/output quantity.';
comment on column public.product_inventory_profiles.requires_count_alongside_weight is
  'When true, forms should capture physical count alongside base measured quantity.';

commit;
