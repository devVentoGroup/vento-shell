begin;

create table if not exists pass.catalog_item_option_consumption_rules (
  id uuid primary key default gen_random_uuid(),
  option_id uuid not null references pass.catalog_item_options(id) on update cascade on delete cascade,
  code text not null,
  name text not null,
  product_id uuid not null references public.products(id) on update cascade on delete restrict,
  quantity_per_option numeric not null,
  stock_unit_code text references public.inventory_units(code) on update cascade on delete restrict,
  input_quantity_per_option numeric,
  input_unit_code text references public.inventory_units(code) on update cascade on delete restrict,
  conversion_factor_to_stock numeric not null default 1,
  input_uom_profile_id uuid references public.product_uom_profiles(id) on update cascade on delete set null,
  source_location_strategy text not null default 'product_production_location',
  source_location_id uuid references public.inventory_locations(id) on update cascade on delete set null,
  source_location_position_id uuid references public.inventory_location_positions(id) on update cascade on delete set null,
  is_active boolean not null default true,
  sort_order integer not null default 0,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),

  constraint pass_catalog_item_option_consumption_rules_option_code_key unique (option_id, code),
  constraint pass_catalog_item_option_consumption_rules_code_not_blank check (length(btrim(code)) > 0),
  constraint pass_catalog_item_option_consumption_rules_name_not_blank check (length(btrim(name)) > 0),
  constraint pass_catalog_item_option_consumption_rules_quantity_check check (quantity_per_option > 0),
  constraint pass_catalog_item_option_consumption_rules_input_qty_check check (
    input_quantity_per_option is null or input_quantity_per_option > 0
  ),
  constraint pass_catalog_item_option_consumption_rules_factor_check check (conversion_factor_to_stock > 0),
  constraint pass_catalog_item_option_consumption_rules_strategy_check check (
    source_location_strategy in (
      'product_production_location',
      'explicit_location',
      'explicit_position'
    )
  ),
  constraint pass_catalog_item_option_consumption_rules_location_strategy_check check (
    (
      source_location_strategy = 'product_production_location'
      and source_location_id is null
      and source_location_position_id is null
    )
    or (
      source_location_strategy = 'explicit_location'
      and source_location_id is not null
      and source_location_position_id is null
    )
    or (
      source_location_strategy = 'explicit_position'
      and source_location_id is not null
      and source_location_position_id is not null
    )
  ),
  constraint pass_catalog_item_option_consumption_rules_metadata_object check (
    jsonb_typeof(metadata) = 'object'
  )
);

comment on table pass.catalog_item_option_consumption_rules is
  'Reglas operativas de consumo para opciones comerciales de Pass. Permiten que un extra/modificador consuma producto/insumo desde el LOC correcto al preparar el pedido.';

comment on column pass.catalog_item_option_consumption_rules.option_id is
  'Opcion comercial visible en Pass. Una opcion puede tener una o varias reglas de consumo.';

comment on column pass.catalog_item_option_consumption_rules.product_id is
  'Producto operacional o insumo que se debe consumir cuando esta opcion sea seleccionada.';

comment on column pass.catalog_item_option_consumption_rules.quantity_per_option is
  'Cantidad en unidad stock que se consume por cada unidad seleccionada de la opcion.';

comment on column pass.catalog_item_option_consumption_rules.stock_unit_code is
  'Unidad stock de referencia para quantity_per_option. Si es null, el consumo futuro debe usar products.stock_unit_code o products.unit.';

comment on column pass.catalog_item_option_consumption_rules.input_quantity_per_option is
  'Cantidad capturada en unidad de entrada/presentacion. Opcional; sirve para mostrar y consumir por perfil UOM.';

comment on column pass.catalog_item_option_consumption_rules.input_uom_profile_id is
  'Perfil UOM opcional para consumir por presentacion fisica. Debe pertenecer al product_id de la regla.';

comment on column pass.catalog_item_option_consumption_rules.source_location_strategy is
  'product_production_location usa product_site_settings.production_location_id del producto base del pedido; explicit_location fuerza LOC; explicit_position fuerza posicion interna.';

comment on column pass.catalog_item_option_consumption_rules.source_location_id is
  'LOC explicito para estrategias explicit_location o explicit_position. Debe pertenecer a la sede del item comercial.';

comment on column pass.catalog_item_option_consumption_rules.source_location_position_id is
  'Posicion interna explicita dentro del LOC cuando source_location_strategy = explicit_position.';

create index if not exists pass_catalog_item_option_consumption_rules_option_active_idx
  on pass.catalog_item_option_consumption_rules (option_id, is_active, sort_order);

create index if not exists pass_catalog_item_option_consumption_rules_product_idx
  on pass.catalog_item_option_consumption_rules (product_id);

create index if not exists pass_catalog_item_option_consumption_rules_uom_idx
  on pass.catalog_item_option_consumption_rules (input_uom_profile_id)
  where input_uom_profile_id is not null;

create index if not exists pass_catalog_item_option_consumption_rules_location_idx
  on pass.catalog_item_option_consumption_rules (source_location_id)
  where source_location_id is not null;

create index if not exists pass_catalog_item_option_consumption_rules_position_idx
  on pass.catalog_item_option_consumption_rules (source_location_position_id)
  where source_location_position_id is not null;

create or replace function pass.validate_catalog_item_option_consumption_rule()
returns trigger
language plpgsql
security definer
set search_path = pass, public
as $$
declare
  v_item_site_id uuid;
  v_profile_product_id uuid;
  v_location_site_id uuid;
  v_position record;
begin
  select item.site_id
    into v_item_site_id
  from pass.catalog_item_options option_row
  join pass.catalog_item_option_groups option_group
    on option_group.id = option_row.option_group_id
  join pass.catalog_items item
    on item.id = option_group.catalog_item_id
  where option_row.id = new.option_id;

  if v_item_site_id is null then
    raise exception 'option does not belong to a catalog item with site';
  end if;

  if new.input_uom_profile_id is not null then
    select profile.product_id
      into v_profile_product_id
    from public.product_uom_profiles profile
    where profile.id = new.input_uom_profile_id
      and coalesce(profile.is_active, true) = true;

    if v_profile_product_id is null then
      raise exception 'input_uom_profile_id not found or inactive';
    end if;

    if v_profile_product_id <> new.product_id then
      raise exception 'input_uom_profile_id must belong to product_id';
    end if;
  end if;

  if new.source_location_strategy in ('explicit_location', 'explicit_position') then
    select loc.site_id
      into v_location_site_id
    from public.inventory_locations loc
    where loc.id = new.source_location_id
      and coalesce(loc.is_active, true) = true;

    if v_location_site_id is null then
      raise exception 'source_location_id not found or inactive';
    end if;

    if v_location_site_id <> v_item_site_id then
      raise exception 'source_location_id must belong to catalog item site';
    end if;
  end if;

  if new.source_location_strategy = 'explicit_position' then
    select pos.id, pos.location_id, pos.site_id
      into v_position
    from public.inventory_location_positions pos
    where pos.id = new.source_location_position_id
      and coalesce(pos.is_active, true) = true;

    if v_position.id is null then
      raise exception 'source_location_position_id not found or inactive';
    end if;

    if v_position.location_id <> new.source_location_id then
      raise exception 'source_location_position_id must belong to source_location_id';
    end if;

    if v_position.site_id <> v_item_site_id then
      raise exception 'source_location_position_id must belong to catalog item site';
    end if;
  end if;

  if new.input_quantity_per_option is not null then
    if new.input_unit_code is null and new.input_uom_profile_id is null then
      raise exception 'input_unit_code or input_uom_profile_id is required when input_quantity_per_option is set';
    end if;
  end if;

  return new;
end;
$$;

drop trigger if exists pass_catalog_item_option_consumption_rules_validate on pass.catalog_item_option_consumption_rules;
create trigger pass_catalog_item_option_consumption_rules_validate
before insert or update on pass.catalog_item_option_consumption_rules
for each row
execute function pass.validate_catalog_item_option_consumption_rule();

drop trigger if exists pass_catalog_item_option_consumption_rules_set_updated_at on pass.catalog_item_option_consumption_rules;
create trigger pass_catalog_item_option_consumption_rules_set_updated_at
before update on pass.catalog_item_option_consumption_rules
for each row
execute function public._set_updated_at();

alter table pass.catalog_item_option_consumption_rules enable row level security;

grant select on table pass.catalog_item_option_consumption_rules to anon, authenticated;
grant insert, update, delete on table pass.catalog_item_option_consumption_rules to authenticated, service_role;

drop policy if exists pass_catalog_item_option_consumption_rules_select_public on pass.catalog_item_option_consumption_rules;
create policy pass_catalog_item_option_consumption_rules_select_public
on pass.catalog_item_option_consumption_rules
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
    where option_row.id = catalog_item_option_consumption_rules.option_id
      and option_row.is_active = true
      and option_group.is_active = true
      and item.is_active = true
  )
);

drop policy if exists pass_catalog_item_option_consumption_rules_select_admin on pass.catalog_item_option_consumption_rules;
create policy pass_catalog_item_option_consumption_rules_select_admin
on pass.catalog_item_option_consumption_rules
for select
to authenticated
using (public.is_owner() or public.is_global_manager());

drop policy if exists pass_catalog_item_option_consumption_rules_insert_admin on pass.catalog_item_option_consumption_rules;
create policy pass_catalog_item_option_consumption_rules_insert_admin
on pass.catalog_item_option_consumption_rules
for insert
to authenticated
with check (public.is_owner() or public.is_global_manager());

drop policy if exists pass_catalog_item_option_consumption_rules_update_admin on pass.catalog_item_option_consumption_rules;
create policy pass_catalog_item_option_consumption_rules_update_admin
on pass.catalog_item_option_consumption_rules
for update
to authenticated
using (public.is_owner() or public.is_global_manager())
with check (public.is_owner() or public.is_global_manager());

drop policy if exists pass_catalog_item_option_consumption_rules_delete_admin on pass.catalog_item_option_consumption_rules;
create policy pass_catalog_item_option_consumption_rules_delete_admin
on pass.catalog_item_option_consumption_rules
for delete
to authenticated
using (public.is_owner() or public.is_global_manager());

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
  updated_at
from pass.catalog_item_option_consumption_rules;

comment on view public.catalog_item_option_consumption_rules is
  'Compat view publica para reglas de consumo operativo de opciones comerciales. Canonical table lives in pass.catalog_item_option_consumption_rules.';

grant select on public.catalog_item_option_consumption_rules to anon, authenticated;
grant insert, update, delete on public.catalog_item_option_consumption_rules to authenticated, service_role;

notify pgrst, 'reload schema';

commit;
