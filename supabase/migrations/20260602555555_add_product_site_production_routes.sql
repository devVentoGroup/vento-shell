-- NEXO / FOGO / POS
-- Modelo de rutas de producción por producto + sede + área.
--
-- Objetivo:
-- - Separar el LOC que consume insumos del destino de salida de la receta.
-- - Soportar ubicaciones internas dentro del LOC de salida.
-- - Preparar POS futuro con salida directa a pedido/fulfillment sin crear stock terminado.
-- - Mantener configuración editable por tarjetas/dashboard, no por wizard rígido.
--
-- Safe to run more than once.

begin;

create table if not exists public.product_site_production_routes (
  id uuid primary key default gen_random_uuid(),
  product_id uuid not null,
  site_id uuid not null,
  area_kind text not null,
  route_name text,
  external_recipe_id text,
  input_location_id uuid not null,
  output_mode text not null default 'inventory_stock',
  output_location_id uuid,
  output_position_id uuid,
  is_default boolean not null default false,
  is_active boolean not null default true,
  notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  created_by uuid,
  updated_by uuid
);

alter table public.product_site_production_routes
  add column if not exists product_id uuid,
  add column if not exists site_id uuid,
  add column if not exists area_kind text,
  add column if not exists route_name text,
  add column if not exists external_recipe_id text,
  add column if not exists input_location_id uuid,
  add column if not exists output_mode text not null default 'inventory_stock',
  add column if not exists output_location_id uuid,
  add column if not exists output_position_id uuid,
  add column if not exists is_default boolean not null default false,
  add column if not exists is_active boolean not null default true,
  add column if not exists notes text,
  add column if not exists created_at timestamptz not null default now(),
  add column if not exists updated_at timestamptz not null default now(),
  add column if not exists created_by uuid,
  add column if not exists updated_by uuid;

comment on table public.product_site_production_routes is
  'Rutas operativas de producción por producto, sede y área. Define dónde se consumen insumos, qué pasa con lo producido y dónde queda si genera stock.';

comment on column public.product_site_production_routes.product_id is
  'Producto/preparación producido por la ruta.';
comment on column public.product_site_production_routes.site_id is
  'Sede donde aplica la ruta.';
comment on column public.product_site_production_routes.area_kind is
  'Área operativa que ejecuta la receta: cocina, bar, galletería, repostería, etc.';
comment on column public.product_site_production_routes.route_name is
  'Nombre operativo visible de la ruta. Ejemplo: Galletería a cuarto frío.';
comment on column public.product_site_production_routes.external_recipe_id is
  'Identificador externo de receta, por ejemplo FOGO. Opcional para mantener NEXO desacoplado.';
comment on column public.product_site_production_routes.input_location_id is
  'LOC donde se ejecuta la receta y se consumen los insumos.';
comment on column public.product_site_production_routes.output_mode is
  'Modo de salida: inventory_stock, sellable_stock u order_fulfillment.';
comment on column public.product_site_production_routes.output_location_id is
  'LOC donde entra el producto terminado si output_mode genera stock.';
comment on column public.product_site_production_routes.output_position_id is
  'Ubicación interna dentro del LOC de salida. Opcional.';
comment on column public.product_site_production_routes.is_default is
  'Ruta principal para este producto+sede+área cuando FOGO/POS no envía un override explícito.';
comment on column public.product_site_production_routes.notes is
  'Notas operativas para explicar excepciones o decisiones de configuración.';

do $$
begin
  if not exists (
    select 1 from pg_constraint
    where conname = 'product_site_production_routes_product_id_fkey'
  ) then
    alter table public.product_site_production_routes
      add constraint product_site_production_routes_product_id_fkey
      foreign key (product_id)
      references public.products(id)
      on delete cascade;
  end if;
end $$;

do $$
begin
  if not exists (
    select 1 from pg_constraint
    where conname = 'product_site_production_routes_site_id_fkey'
  ) then
    alter table public.product_site_production_routes
      add constraint product_site_production_routes_site_id_fkey
      foreign key (site_id)
      references public.sites(id)
      on delete cascade;
  end if;
end $$;

do $$
begin
  if not exists (
    select 1 from pg_constraint
    where conname = 'product_site_production_routes_area_kind_fkey'
  ) then
    alter table public.product_site_production_routes
      add constraint product_site_production_routes_area_kind_fkey
      foreign key (area_kind)
      references public.area_kinds(code)
      on update cascade
      on delete restrict;
  end if;
end $$;

do $$
begin
  if not exists (
    select 1 from pg_constraint
    where conname = 'product_site_production_routes_input_location_id_fkey'
  ) then
    alter table public.product_site_production_routes
      add constraint product_site_production_routes_input_location_id_fkey
      foreign key (input_location_id)
      references public.inventory_locations(id)
      on delete restrict;
  end if;
end $$;

do $$
begin
  if not exists (
    select 1 from pg_constraint
    where conname = 'product_site_production_routes_output_location_id_fkey'
  ) then
    alter table public.product_site_production_routes
      add constraint product_site_production_routes_output_location_id_fkey
      foreign key (output_location_id)
      references public.inventory_locations(id)
      on delete restrict;
  end if;
end $$;

do $$
begin
  if not exists (
    select 1 from pg_constraint
    where conname = 'product_site_production_routes_output_position_id_fkey'
  ) then
    alter table public.product_site_production_routes
      add constraint product_site_production_routes_output_position_id_fkey
      foreign key (output_position_id)
      references public.inventory_location_positions(id)
      on delete set null;
  end if;
end $$;

do $$
begin
  if not exists (
    select 1 from pg_constraint
    where conname = 'product_site_production_routes_output_mode_chk'
  ) then
    alter table public.product_site_production_routes
      add constraint product_site_production_routes_output_mode_chk
      check (output_mode in ('inventory_stock', 'sellable_stock', 'order_fulfillment'));
  end if;
end $$;

do $$
begin
  if not exists (
    select 1 from pg_constraint
    where conname = 'product_site_production_routes_route_name_nonempty_chk'
  ) then
    alter table public.product_site_production_routes
      add constraint product_site_production_routes_route_name_nonempty_chk
      check (route_name is null or length(btrim(route_name)) > 0);
  end if;
end $$;

do $$
begin
  if not exists (
    select 1 from pg_constraint
    where conname = 'product_site_production_routes_external_recipe_nonempty_chk'
  ) then
    alter table public.product_site_production_routes
      add constraint product_site_production_routes_external_recipe_nonempty_chk
      check (external_recipe_id is null or length(btrim(external_recipe_id)) > 0);
  end if;
end $$;

do $$
begin
  if not exists (
    select 1 from pg_constraint
    where conname = 'product_site_production_routes_output_mode_consistency_chk'
  ) then
    alter table public.product_site_production_routes
      add constraint product_site_production_routes_output_mode_consistency_chk
      check (
        (
          output_mode = 'order_fulfillment'
          and output_location_id is null
          and output_position_id is null
        )
        or
        (
          output_mode in ('inventory_stock', 'sellable_stock')
          and output_location_id is not null
        )
      );
  end if;
end $$;

do $$
begin
  if not exists (
    select 1 from pg_constraint
    where conname = 'product_site_production_routes_position_requires_location_chk'
  ) then
    alter table public.product_site_production_routes
      add constraint product_site_production_routes_position_requires_location_chk
      check (output_position_id is null or output_location_id is not null);
  end if;
end $$;

create unique index if not exists product_site_production_routes_one_default_active_idx
  on public.product_site_production_routes (product_id, site_id, area_kind)
  where is_active = true and is_default = true;

create index if not exists idx_product_site_production_routes_product_site
  on public.product_site_production_routes (product_id, site_id);

create index if not exists idx_product_site_production_routes_site_area_active
  on public.product_site_production_routes (site_id, area_kind, is_active);

create index if not exists idx_product_site_production_routes_input_location
  on public.product_site_production_routes (input_location_id);

create index if not exists idx_product_site_production_routes_output_location
  on public.product_site_production_routes (output_location_id)
  where output_location_id is not null;

create index if not exists idx_product_site_production_routes_output_position
  on public.product_site_production_routes (output_position_id)
  where output_position_id is not null;

create index if not exists idx_product_site_production_routes_external_recipe
  on public.product_site_production_routes (external_recipe_id)
  where external_recipe_id is not null;

create or replace function public.validate_product_site_production_route()
returns trigger
language plpgsql
set search_path to 'public'
as $$
declare
  v_input_site_id uuid;
  v_input_area_kind text;
  v_input_is_active boolean;
  v_output_site_id uuid;
  v_output_is_active boolean;
  v_position_site_id uuid;
  v_position_location_id uuid;
  v_position_is_active boolean;
begin
  select l.site_id, a.kind, coalesce(l.is_active, true)
    into v_input_site_id, v_input_area_kind, v_input_is_active
  from public.inventory_locations l
  left join public.areas a on a.id = l.area_id
  where l.id = new.input_location_id;

  if v_input_site_id is null then
    raise exception 'input_location_id no existe o no tiene sede: %', new.input_location_id;
  end if;

  if v_input_site_id <> new.site_id then
    raise exception 'input_location_id % no pertenece a site_id %', new.input_location_id, new.site_id;
  end if;

  if coalesce(v_input_is_active, false) = false then
    raise exception 'input_location_id % está inactivo', new.input_location_id;
  end if;

  if v_input_area_kind is distinct from new.area_kind then
    raise exception 'input_location_id % pertenece al área %, no al área %',
      new.input_location_id,
      coalesce(v_input_area_kind, '(sin área)'),
      new.area_kind;
  end if;

  if new.output_mode = 'order_fulfillment' then
    if new.output_location_id is not null or new.output_position_id is not null then
      raise exception 'order_fulfillment no debe tener output_location_id ni output_position_id';
    end if;
    return new;
  end if;

  if new.output_location_id is null then
    raise exception 'output_location_id es requerido cuando output_mode = %', new.output_mode;
  end if;

  select l.site_id, coalesce(l.is_active, true)
    into v_output_site_id, v_output_is_active
  from public.inventory_locations l
  where l.id = new.output_location_id;

  if v_output_site_id is null then
    raise exception 'output_location_id no existe o no tiene sede: %', new.output_location_id;
  end if;

  if v_output_site_id <> new.site_id then
    raise exception 'output_location_id % no pertenece a site_id %', new.output_location_id, new.site_id;
  end if;

  if coalesce(v_output_is_active, false) = false then
    raise exception 'output_location_id % está inactivo', new.output_location_id;
  end if;

  if new.output_position_id is not null then
    select p.site_id, p.location_id, p.is_active
      into v_position_site_id, v_position_location_id, v_position_is_active
    from public.inventory_location_positions p
    where p.id = new.output_position_id;

    if v_position_site_id is null then
      raise exception 'output_position_id no existe: %', new.output_position_id;
    end if;

    if v_position_site_id <> new.site_id then
      raise exception 'output_position_id % no pertenece a site_id %', new.output_position_id, new.site_id;
    end if;

    if v_position_location_id <> new.output_location_id then
      raise exception 'output_position_id % pertenece al LOC %, no al output_location_id %',
        new.output_position_id,
        v_position_location_id,
        new.output_location_id;
    end if;

    if coalesce(v_position_is_active, false) = false then
      raise exception 'output_position_id % está inactivo', new.output_position_id;
    end if;
  end if;

  return new;
end;
$$;

drop trigger if exists trg_validate_product_site_production_route
  on public.product_site_production_routes;

create trigger trg_validate_product_site_production_route
before insert or update of
  site_id,
  area_kind,
  input_location_id,
  output_mode,
  output_location_id,
  output_position_id
on public.product_site_production_routes
for each row
execute function public.validate_product_site_production_route();

create or replace function public.touch_product_site_production_route_updated_at()
returns trigger
language plpgsql
set search_path to 'public'
as $$
begin
  new.updated_at := now();
  return new;
end;
$$;

drop trigger if exists trg_touch_product_site_production_route_updated_at
  on public.product_site_production_routes;

create trigger trg_touch_product_site_production_route_updated_at
before update on public.product_site_production_routes
for each row
execute function public.touch_product_site_production_route_updated_at();

create or replace view public.v_site_production_route_diagnostics as
select
  r.id as route_id,
  r.product_id,
  p.name as product_name,
  p.product_type,
  r.site_id,
  s.name as site_name,
  r.area_kind,
  ak.name as area_name,
  r.route_name,
  r.external_recipe_id,
  r.input_location_id,
  input_loc.code as input_location_code,
  input_loc.zone as input_location_zone,
  r.output_mode,
  r.output_location_id,
  output_loc.code as output_location_code,
  output_loc.zone as output_location_zone,
  r.output_position_id,
  output_pos.code as output_position_code,
  output_pos.name as output_position_name,
  r.is_default,
  r.is_active,
  coalesce(cap.can_produce, false) as site_can_produce,
  coalesce(cap.can_sell, false) as site_can_sell,
  coalesce(cap.can_hold_inventory, false) as site_can_hold_inventory,
  exists (
    select 1
    from public.site_area_purpose_rules rule
    where rule.site_id = r.site_id
      and rule.area_kind = r.area_kind
      and rule.purpose = 'production_recipe'
      and rule.is_enabled = true
  ) as area_enabled_for_recipe_production,
  case
    when r.is_active = false then 'INACTIVE'
    when coalesce(cap.can_produce, false) = false then 'BLOCKING'
    when not exists (
      select 1
      from public.site_area_purpose_rules rule
      where rule.site_id = r.site_id
        and rule.area_kind = r.area_kind
        and rule.purpose = 'production_recipe'
        and rule.is_enabled = true
    ) then 'BLOCKING'
    when r.output_mode = 'sellable_stock' and coalesce(cap.can_sell, false) = false then 'WARNING'
    when r.output_mode in ('inventory_stock', 'sellable_stock') and coalesce(cap.can_hold_inventory, false) = false then 'WARNING'
    else 'OK'
  end as diagnostic_status,
  array_remove(array[
    case when r.is_active = false then 'route_inactive' end,
    case when coalesce(cap.can_produce, false) = false then 'site_cannot_produce' end,
    case when not exists (
      select 1
      from public.site_area_purpose_rules rule
      where rule.site_id = r.site_id
        and rule.area_kind = r.area_kind
        and rule.purpose = 'production_recipe'
        and rule.is_enabled = true
    ) then 'area_not_enabled_for_recipe_production' end,
    case when r.output_mode = 'sellable_stock' and coalesce(cap.can_sell, false) = false then 'site_cannot_sell_but_route_outputs_sellable_stock' end,
    case when r.output_mode in ('inventory_stock', 'sellable_stock') and coalesce(cap.can_hold_inventory, false) = false then 'site_cannot_hold_inventory_but_route_outputs_stock' end
  ], null) as diagnostic_codes
from public.product_site_production_routes r
join public.products p on p.id = r.product_id
join public.sites s on s.id = r.site_id
left join public.area_kinds ak on ak.code = r.area_kind
left join public.inventory_locations input_loc on input_loc.id = r.input_location_id
left join public.inventory_locations output_loc on output_loc.id = r.output_location_id
left join public.inventory_location_positions output_pos on output_pos.id = r.output_position_id
left join public.site_operational_capabilities cap on cap.site_id = r.site_id;

comment on view public.v_site_production_route_diagnostics is
  'Diagnóstico operativo de rutas de producción. Sirve para pintar tarjetas OK/WARNING/BLOCKING en la configuración de sede.';

create or replace view public.v_site_area_operational_diagnostics as
select
  s.id as site_id,
  s.name as site_name,
  a.id as area_id,
  a.kind as area_kind,
  ak.name as area_name,
  a.name as area_display_name,
  a.is_active as area_is_active,
  coalesce(cap.can_produce, false) as site_can_produce,
  coalesce(cap.can_sell, false) as site_can_sell,
  coalesce(cap.can_hold_inventory, false) as site_can_hold_inventory,
  exists (
    select 1
    from public.site_area_purpose_rules rule
    where rule.site_id = s.id
      and rule.area_kind = a.kind
      and rule.purpose = 'production_recipe'
      and rule.is_enabled = true
  ) as area_enabled_for_recipe_production,
  count(l.id) filter (where coalesce(l.is_active, true) = true) as active_location_count,
  count(l.id) filter (where coalesce(l.is_active, true) = true and l.location_type = 'production') as production_location_count,
  count(l.id) filter (where coalesce(l.is_active, true) = true and l.location_type in ('storage', 'picking')) as storage_or_picking_location_count,
  count(pos.id) filter (where pos.is_active = true) as active_position_count,
  count(r.id) filter (where r.is_active = true) as active_route_count,
  case
    when a.is_active = false then 'INACTIVE'
    when exists (
      select 1
      from public.site_area_purpose_rules rule
      where rule.site_id = s.id
        and rule.area_kind = a.kind
        and rule.purpose = 'production_recipe'
        and rule.is_enabled = true
    )
    and coalesce(cap.can_produce, false) = false then 'BLOCKING'
    when exists (
      select 1
      from public.site_area_purpose_rules rule
      where rule.site_id = s.id
        and rule.area_kind = a.kind
        and rule.purpose = 'production_recipe'
        and rule.is_enabled = true
    )
    and count(l.id) filter (where coalesce(l.is_active, true) = true and l.location_type = 'production') = 0 then 'BLOCKING'
    when exists (
      select 1
      from public.site_area_purpose_rules rule
      where rule.site_id = s.id
        and rule.area_kind = a.kind
        and rule.purpose = 'production_recipe'
        and rule.is_enabled = true
    )
    and count(r.id) filter (where r.is_active = true) = 0 then 'WARNING'
    else 'OK'
  end as diagnostic_status,
  array_remove(array[
    case when a.is_active = false then 'area_inactive' end,
    case when exists (
      select 1
      from public.site_area_purpose_rules rule
      where rule.site_id = s.id
        and rule.area_kind = a.kind
        and rule.purpose = 'production_recipe'
        and rule.is_enabled = true
    )
    and coalesce(cap.can_produce, false) = false then 'site_cannot_produce' end,
    case when exists (
      select 1
      from public.site_area_purpose_rules rule
      where rule.site_id = s.id
        and rule.area_kind = a.kind
        and rule.purpose = 'production_recipe'
        and rule.is_enabled = true
    )
    and count(l.id) filter (where coalesce(l.is_active, true) = true and l.location_type = 'production') = 0 then 'production_area_without_production_loc' end,
    case when exists (
      select 1
      from public.site_area_purpose_rules rule
      where rule.site_id = s.id
        and rule.area_kind = a.kind
        and rule.purpose = 'production_recipe'
        and rule.is_enabled = true
    )
    and count(r.id) filter (where r.is_active = true) = 0 then 'production_area_without_routes' end
  ], null) as diagnostic_codes
from public.sites s
join public.areas a on a.site_id = s.id
left join public.area_kinds ak on ak.code = a.kind
left join public.site_operational_capabilities cap on cap.site_id = s.id
left join public.inventory_locations l on l.area_id = a.id and l.site_id = s.id
left join public.inventory_location_positions pos on pos.location_id = l.id and pos.site_id = s.id
left join public.product_site_production_routes r
  on r.site_id = s.id
 and r.area_kind = a.kind
group by
  s.id,
  s.name,
  a.id,
  a.kind,
  ak.name,
  a.name,
  a.is_active,
  cap.can_produce,
  cap.can_sell,
  cap.can_hold_inventory;

comment on view public.v_site_area_operational_diagnostics is
  'Diagnóstico de áreas, LOCs, posiciones y rutas por sede. Base para la pantalla de mapa operativo.';

commit;
