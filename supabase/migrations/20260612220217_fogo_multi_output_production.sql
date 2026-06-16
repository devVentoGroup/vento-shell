create table if not exists public.recipe_outputs (
  id uuid primary key default gen_random_uuid(),
  recipe_card_id uuid not null references public.recipe_cards(id) on delete cascade,
  product_id uuid not null references public.products(id) on delete restrict,
  output_role text not null default 'co_product',
  expected_qty numeric not null,
  expected_unit text not null,
  cost_allocation_method text not null default 'percentage',
  cost_allocation_pct numeric,
  fixed_unit_cost numeric,
  destination_location_id uuid references public.inventory_locations(id) on delete restrict,
  sort_order integer not null default 100,
  is_active boolean not null default true,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint recipe_outputs_role_chk
    check (output_role in ('primary', 'co_product', 'by_product')),
  constraint recipe_outputs_qty_chk
    check (expected_qty > 0),
  constraint recipe_outputs_cost_method_chk
    check (cost_allocation_method in ('percentage', 'fixed_unit_cost', 'market_value', 'residual', 'none')),
  constraint recipe_outputs_pct_chk
    check (cost_allocation_pct is null or (cost_allocation_pct >= 0 and cost_allocation_pct <= 100)),
  constraint recipe_outputs_fixed_cost_chk
    check (fixed_unit_cost is null or fixed_unit_cost >= 0),
  constraint recipe_outputs_recipe_product_key
    unique (recipe_card_id, product_id)
);

create index if not exists recipe_outputs_recipe_idx
  on public.recipe_outputs (recipe_card_id, sort_order)
  where is_active = true;

create index if not exists recipe_outputs_product_idx
  on public.recipe_outputs (product_id)
  where is_active = true;

create table if not exists public.production_batch_outputs (
  id uuid primary key default gen_random_uuid(),
  batch_id uuid not null references public.production_batches(id) on delete cascade,
  recipe_card_id uuid not null references public.recipe_cards(id) on delete restrict,
  recipe_output_id uuid references public.recipe_outputs(id) on delete set null,
  product_id uuid not null references public.products(id) on delete restrict,
  output_role text not null default 'co_product',
  produced_qty numeric not null,
  produced_unit text not null,
  destination_location_id uuid references public.inventory_locations(id) on delete restrict,
  destination_position_id uuid references public.inventory_location_positions(id) on delete set null,
  cost_allocation_method text not null default 'percentage',
  cost_allocation_pct numeric,
  allocated_total_cost numeric,
  unit_cost numeric,
  inventory_movement_id uuid references public.inventory_movements(id) on delete set null,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  constraint production_batch_outputs_role_chk
    check (output_role in ('primary', 'co_product', 'by_product')),
  constraint production_batch_outputs_qty_chk
    check (produced_qty > 0),
  constraint production_batch_outputs_cost_method_chk
    check (cost_allocation_method in ('percentage', 'fixed_unit_cost', 'market_value', 'residual', 'none')),
  constraint production_batch_outputs_pct_chk
    check (cost_allocation_pct is null or (cost_allocation_pct >= 0 and cost_allocation_pct <= 100)),
  constraint production_batch_outputs_cost_chk
    check (allocated_total_cost is null or allocated_total_cost >= 0),
  constraint production_batch_outputs_unit_cost_chk
    check (unit_cost is null or unit_cost >= 0)
);

create index if not exists production_batch_outputs_batch_idx
  on public.production_batch_outputs (batch_id);

create index if not exists production_batch_outputs_product_idx
  on public.production_batch_outputs (product_id);

create or replace function public.set_recipe_outputs_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists recipe_outputs_updated_at on public.recipe_outputs;
create trigger recipe_outputs_updated_at
before update on public.recipe_outputs
for each row
execute function public.set_recipe_outputs_updated_at();

create or replace function public.validate_recipe_outputs()
returns trigger
language plpgsql
security invoker
set search_path = public
as $$
declare
  v_recipe record;
  v_pct_sum numeric;
  v_primary_count integer;
begin
  select id, product_id, site_id
    into v_recipe
  from public.recipe_cards
  where id = new.recipe_card_id;

  if v_recipe.id is null then
    raise exception 'recipe_card_id no existe';
  end if;

  if new.output_role = 'primary' and new.product_id is distinct from v_recipe.product_id then
    raise exception 'El output principal debe ser el producto principal de la receta.';
  end if;

  if new.output_role <> 'primary' and new.product_id = v_recipe.product_id then
    raise exception 'El producto principal no puede repetirse como coproducto.';
  end if;

  if new.cost_allocation_method = 'percentage' and new.cost_allocation_pct is null then
    raise exception 'Los outputs con costeo porcentual necesitan porcentaje.';
  end if;

  if new.destination_location_id is not null and not exists (
    select 1
    from public.inventory_locations loc
    where loc.id = new.destination_location_id
      and loc.site_id = v_recipe.site_id
      and coalesce(loc.is_active, true) = true
  ) then
    raise exception 'El LOC destino del output no pertenece a la sede de la receta.';
  end if;

  select count(*)
    into v_primary_count
  from public.recipe_outputs ro
  where ro.recipe_card_id = new.recipe_card_id
    and coalesce(ro.is_active, true)
    and ro.output_role = 'primary'
    and ro.id is distinct from new.id;

  if coalesce(new.is_active, true) and new.output_role = 'primary' then
    v_primary_count := v_primary_count + 1;
  end if;

  if v_primary_count > 1 then
    raise exception 'Solo puede haber un output principal activo por receta.';
  end if;

  select coalesce(sum(coalesce(ro.cost_allocation_pct, 0)), 0)
    into v_pct_sum
  from public.recipe_outputs ro
  where ro.recipe_card_id = new.recipe_card_id
    and ro.id is distinct from new.id
    and coalesce(ro.is_active, true)
    and ro.cost_allocation_method = 'percentage';

  if coalesce(new.is_active, true) and new.cost_allocation_method = 'percentage' then
    v_pct_sum := v_pct_sum + coalesce(new.cost_allocation_pct, 0);
  end if;

  if coalesce(new.is_active, true) and new.cost_allocation_method = 'percentage' and v_pct_sum > 100.000001 then
    raise exception 'La suma de porcentajes de outputs no puede superar 100%%.';
  end if;

  return new;
end;
$$;

drop trigger if exists recipe_outputs_validate on public.recipe_outputs;
create trigger recipe_outputs_validate
before insert or update of recipe_card_id, product_id, output_role, expected_qty, expected_unit, cost_allocation_method, cost_allocation_pct, fixed_unit_cost, destination_location_id, is_active
on public.recipe_outputs
for each row
execute function public.validate_recipe_outputs();

alter table public.recipe_outputs enable row level security;
alter table public.production_batch_outputs enable row level security;

drop policy if exists recipe_outputs_select_staff on public.recipe_outputs;
create policy recipe_outputs_select_staff
on public.recipe_outputs
for select
to authenticated
using (
  exists (
    select 1
    from public.recipe_cards rc
    where rc.id = recipe_outputs.recipe_card_id
      and public.can_access_recipe_scope(rc.site_id, rc.area_id)
  )
);

drop policy if exists recipe_outputs_write_manager on public.recipe_outputs;
create policy recipe_outputs_write_manager
on public.recipe_outputs
for all
to authenticated
using (
  (public.is_owner() or public.is_manager())
  and exists (
    select 1
    from public.recipe_cards rc
    where rc.id = recipe_outputs.recipe_card_id
      and public.can_access_recipe_scope(rc.site_id, rc.area_id)
  )
)
with check (
  (public.is_owner() or public.is_manager())
  and exists (
    select 1
    from public.recipe_cards rc
    where rc.id = recipe_outputs.recipe_card_id
      and public.can_access_recipe_scope(rc.site_id, rc.area_id)
  )
);

drop policy if exists production_batch_outputs_select_staff on public.production_batch_outputs;
create policy production_batch_outputs_select_staff
on public.production_batch_outputs
for select
to authenticated
using (
  exists (
    select 1
    from public.production_batches b
    where b.id = production_batch_outputs.batch_id
      and public.is_employee()
  )
);

drop policy if exists production_batch_outputs_write_production on public.production_batch_outputs;
create policy production_batch_outputs_write_production
on public.production_batch_outputs
for all
to authenticated
using (
  exists (
    select 1
    from public.production_batches b
    where b.id = production_batch_outputs.batch_id
      and (
        public.current_employee_role() = any(array['owner','manager'])
        or b.site_id = public.current_employee_site_id()
      )
  )
)
with check (
  exists (
    select 1
    from public.production_batches b
    where b.id = production_batch_outputs.batch_id
      and (
        public.current_employee_role() = any(array['owner','manager'])
        or b.site_id = public.current_employee_site_id()
      )
  )
);

grant select, insert, update, delete on public.recipe_outputs to authenticated;
grant select, insert, update, delete on public.production_batch_outputs to authenticated;
grant all on public.recipe_outputs to service_role;
grant all on public.production_batch_outputs to service_role;
grant execute on function public.validate_recipe_outputs() to authenticated, service_role;

notify pgrst, 'reload schema';
