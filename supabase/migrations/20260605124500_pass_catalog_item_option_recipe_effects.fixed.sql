begin;

alter table pass.catalog_item_options
  add column if not exists effect_type text not null default 'preference';

alter table pass.catalog_item_options
  drop constraint if exists pass_catalog_item_options_effect_type_check;

alter table pass.catalog_item_options
  add constraint pass_catalog_item_options_effect_type_check check (
    effect_type in ('preference', 'additive', 'replacement', 'removal')
  );

comment on column pass.catalog_item_options.effect_type is
  'Efecto principal de la opcion: preference no toca inventario, additive suma consumo, replacement reemplaza ingrediente base, removal excluye ingrediente base.';

alter table pass.catalog_item_option_consumption_rules
  add column if not exists effect_type text not null default 'additive';

alter table pass.catalog_item_option_consumption_rules
  drop constraint if exists pass_catalog_item_option_consumption_rules_effect_type_check;

alter table pass.catalog_item_option_consumption_rules
  add constraint pass_catalog_item_option_consumption_rules_effect_type_check check (
    effect_type in ('additive', 'replacement')
  );

comment on column pass.catalog_item_option_consumption_rules.effect_type is
  'Efecto de esta regla de consumo: additive suma consumo adicional; replacement consume el ingrediente sustituto despues de excluir el ingrediente base mediante catalog_item_option_recipe_effects.';

create table if not exists pass.catalog_item_option_recipe_effects (
  id uuid primary key default gen_random_uuid(),
  option_id uuid not null references pass.catalog_item_options(id) on update cascade on delete cascade,
  effect_type text not null,
  target_ingredient_product_id uuid not null references public.products(id) on update cascade on delete restrict,
  recipe_component_code text,
  quantity_mode text not null default 'full_recipe_component',
  quantity_amount numeric,
  stock_unit_code text references public.inventory_units(code) on update cascade on delete restrict,
  is_active boolean not null default true,
  sort_order integer not null default 0,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),

  constraint pass_catalog_item_option_recipe_effects_effect_type_check check (
    effect_type in ('removal', 'replacement')
  ),
  constraint pass_catalog_item_option_recipe_effects_quantity_mode_check check (
    quantity_mode in ('full_recipe_component', 'fixed_quantity')
  ),
  constraint pass_catalog_item_option_recipe_effects_fixed_qty_check check (
    (
      quantity_mode = 'full_recipe_component'
      and quantity_amount is null
    )
    or (
      quantity_mode = 'fixed_quantity'
      and quantity_amount is not null
      and quantity_amount > 0
    )
  ),
  constraint pass_catalog_item_option_recipe_effects_component_code_check check (
    recipe_component_code is null or length(btrim(recipe_component_code)) > 0
  ),
  constraint pass_catalog_item_option_recipe_effects_metadata_object check (
    jsonb_typeof(metadata) = 'object'
  )
);

comment on table pass.catalog_item_option_recipe_effects is
  'Efectos de una opcion comercial sobre la receta base del producto: removal excluye ingrediente; replacement excluye ingrediente base para consumir sustituto mediante reglas de consumo.';

comment on column pass.catalog_item_option_recipe_effects.option_id is
  'Opcion comercial que activa este efecto sobre receta.';

comment on column pass.catalog_item_option_recipe_effects.effect_type is
  'removal evita consumir el ingrediente objetivo; replacement evita consumir el ingrediente objetivo y debe complementarse con una regla de consumo replacement.';

comment on column pass.catalog_item_option_recipe_effects.target_ingredient_product_id is
  'Ingrediente de public.recipes que se debe excluir o reemplazar cuando la opcion sea seleccionada.';

comment on column pass.catalog_item_option_recipe_effects.recipe_component_code is
  'Codigo funcional opcional del componente de receta, por ejemplo milk, sauce, onion. Sirve para agrupar sustituciones futuras sin depender solo del product_id.';

comment on column pass.catalog_item_option_recipe_effects.quantity_mode is
  'full_recipe_component excluye toda la cantidad de ese ingrediente en la receta base. fixed_quantity excluye solo quantity_amount.';

comment on column pass.catalog_item_option_recipe_effects.quantity_amount is
  'Cantidad fija a excluir cuando quantity_mode = fixed_quantity. Si se excluye todo el componente, debe ser null.';

create index if not exists pass_catalog_item_option_recipe_effects_option_active_idx
  on pass.catalog_item_option_recipe_effects (option_id, is_active, sort_order);

create index if not exists pass_catalog_item_option_recipe_effects_target_idx
  on pass.catalog_item_option_recipe_effects (target_ingredient_product_id);

create index if not exists pass_catalog_item_option_recipe_effects_component_idx
  on pass.catalog_item_option_recipe_effects (recipe_component_code)
  where recipe_component_code is not null;

create or replace function pass.validate_catalog_item_option_recipe_effect()
returns trigger
language plpgsql
security definer
set search_path = pass, public
as $$
declare
  v_catalog_product_id uuid;
  v_recipe_match boolean;
begin
  select item.product_id
    into v_catalog_product_id
  from pass.catalog_item_options option_row
  join pass.catalog_item_option_groups option_group
    on option_group.id = option_row.option_group_id
  join pass.catalog_items item
    on item.id = option_group.catalog_item_id
  where option_row.id = new.option_id;

  if v_catalog_product_id is null then
    raise exception 'option does not belong to a catalog item with product_id';
  end if;

  select exists (
    select 1
    from public.recipes recipe
    where recipe.product_id = v_catalog_product_id
      and recipe.ingredient_product_id = new.target_ingredient_product_id
      and coalesce(recipe.is_active, true) = true
  )
  into v_recipe_match;

  if not coalesce(v_recipe_match, false) then
    raise exception 'target_ingredient_product_id must be an active ingredient of the catalog item product recipe';
  end if;

  return new;
end;
$$;

drop trigger if exists pass_catalog_item_option_recipe_effects_validate on pass.catalog_item_option_recipe_effects;
create trigger pass_catalog_item_option_recipe_effects_validate
before insert or update on pass.catalog_item_option_recipe_effects
for each row
execute function pass.validate_catalog_item_option_recipe_effect();

drop trigger if exists pass_catalog_item_option_recipe_effects_set_updated_at on pass.catalog_item_option_recipe_effects;
create trigger pass_catalog_item_option_recipe_effects_set_updated_at
before update on pass.catalog_item_option_recipe_effects
for each row
execute function public._set_updated_at();

alter table pass.catalog_item_option_recipe_effects enable row level security;

grant select on table pass.catalog_item_option_recipe_effects to anon, authenticated;
grant insert, update, delete on table pass.catalog_item_option_recipe_effects to authenticated, service_role;

drop policy if exists pass_catalog_item_option_recipe_effects_select_public on pass.catalog_item_option_recipe_effects;
create policy pass_catalog_item_option_recipe_effects_select_public
on pass.catalog_item_option_recipe_effects
for select
to anon, authenticated
using (
  is_active = true
  and exists (
    select 1
    from pass.catalog_item_options option_row
    join pass.catalog_item_option_groups option_group
      on option_group.id = option_row.option_group_id
    join pass.catalog_items item
      on item.id = option_group.catalog_item_id
    where option_row.id = catalog_item_option_recipe_effects.option_id
      and option_row.is_active = true
      and option_group.is_active = true
      and item.is_active = true
  )
);

drop policy if exists pass_catalog_item_option_recipe_effects_select_admin on pass.catalog_item_option_recipe_effects;
create policy pass_catalog_item_option_recipe_effects_select_admin
on pass.catalog_item_option_recipe_effects
for select
to authenticated
using (public.is_owner() or public.is_global_manager());

drop policy if exists pass_catalog_item_option_recipe_effects_insert_admin on pass.catalog_item_option_recipe_effects;
create policy pass_catalog_item_option_recipe_effects_insert_admin
on pass.catalog_item_option_recipe_effects
for insert
to authenticated
with check (public.is_owner() or public.is_global_manager());

drop policy if exists pass_catalog_item_option_recipe_effects_update_admin on pass.catalog_item_option_recipe_effects;
create policy pass_catalog_item_option_recipe_effects_update_admin
on pass.catalog_item_option_recipe_effects
for update
to authenticated
using (public.is_owner() or public.is_global_manager())
with check (public.is_owner() or public.is_global_manager());

drop policy if exists pass_catalog_item_option_recipe_effects_delete_admin on pass.catalog_item_option_recipe_effects;
create policy pass_catalog_item_option_recipe_effects_delete_admin
on pass.catalog_item_option_recipe_effects
for delete
to authenticated
using (public.is_owner() or public.is_global_manager());

create or replace view public.catalog_item_options
with (security_invoker = true)
as
select
  id,
  option_group_id,
  code,
  name,
  description,
  price_delta_amount,
  product_id,
  is_default,
  is_active,
  sort_order,
  metadata,
  created_at,
  updated_at,
  effect_type
from pass.catalog_item_options;

comment on view public.catalog_item_options is
  'Compat view publica para opciones de items comerciales. Canonical table lives in pass.catalog_item_options.';

grant select on public.catalog_item_options to anon, authenticated;
grant insert, update, delete on public.catalog_item_options to authenticated, service_role;

create or replace view public.catalog_item_option_consumption_rules
with (security_invoker = true)
as
select
  id,
  option_id,
  code,
  name,
  product_id,
  quantity_per_option,
  stock_unit_code,
  input_quantity_per_option,
  input_unit_code,
  conversion_factor_to_stock,
  input_uom_profile_id,
  source_location_strategy,
  source_location_id,
  source_location_position_id,
  is_active,
  sort_order,
  metadata,
  created_at,
  updated_at,
  effect_type
from pass.catalog_item_option_consumption_rules;

comment on view public.catalog_item_option_consumption_rules is
  'Compat view publica para reglas de consumo operativo de opciones comerciales. Canonical table lives in pass.catalog_item_option_consumption_rules.';

grant select on public.catalog_item_option_consumption_rules to anon, authenticated;
grant insert, update, delete on public.catalog_item_option_consumption_rules to authenticated, service_role;

create or replace view public.catalog_item_option_recipe_effects
with (security_invoker = true)
as
select
  id,
  option_id,
  effect_type,
  target_ingredient_product_id,
  recipe_component_code,
  quantity_mode,
  quantity_amount,
  stock_unit_code,
  is_active,
  sort_order,
  metadata,
  created_at,
  updated_at
from pass.catalog_item_option_recipe_effects;

comment on view public.catalog_item_option_recipe_effects is
  'Compat view publica para efectos de opciones sobre receta base. Canonical table lives in pass.catalog_item_option_recipe_effects.';

grant select on public.catalog_item_option_recipe_effects to anon, authenticated;
grant insert, update, delete on public.catalog_item_option_recipe_effects to authenticated, service_role;

notify pgrst, 'reload schema';

commit;
