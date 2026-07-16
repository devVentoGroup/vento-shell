-- DATA-001: Extiende las rutas de atencion para distinguir stock de produccion.
-- Terminologia operativa:
--   supply_mode = 'stock'      -> se alista desde un LOC de stock.
--   supply_mode = 'production' -> el area productora deja el terminado en ready_location_id.
--   production_execution_mode  -> 'simple' registra cantidad producida sin receta;
--                                 'recipe' vinculara la tarea con produccion real de FOGO.
-- ready_location_id siempre representa un LOC operativo, nunca estanteria, nivel,
-- posicion interna ni LPN.

begin;

alter table public.product_fulfillment_routes
  add column if not exists production_execution_mode text,
  add column if not exists ready_location_id uuid;

-- FK separada para que la migracion sea idempotente si las columnas ya existen.
do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'product_fulfillment_routes_ready_location_id_fkey'
      and conrelid = 'public.product_fulfillment_routes'::regclass
  ) then
    alter table public.product_fulfillment_routes
      add constraint product_fulfillment_routes_ready_location_id_fkey
      foreign key (ready_location_id)
      references public.inventory_locations(id)
      on delete set null;
  end if;
end
$$;

-- Compatibilidad transitoria:
-- mientras NEXO termina de escribir directamente los campos nuevos, una ruta de
-- produccion toma como modo inicial "simple" y copia el LOC actualmente usado en
-- preferred_source_location_id como punto donde queda listo el terminado.
create or replace function public.sync_product_fulfillment_route_production_fields()
returns trigger
language plpgsql
set search_path = public
as $$
begin
  if new.supply_mode = 'production' then
    new.production_execution_mode := coalesce(
      nullif(btrim(new.production_execution_mode), ''),
      'simple'
    );
    new.ready_location_id := coalesce(
      new.ready_location_id,
      new.preferred_source_location_id
    );
  else
    new.production_execution_mode := null;
    new.ready_location_id := null;
  end if;

  return new;
end
$$;

drop trigger if exists trg_product_fulfillment_routes_sync_production_fields
  on public.product_fulfillment_routes;

create trigger trg_product_fulfillment_routes_sync_production_fields
before insert or update of
  supply_mode,
  production_execution_mode,
  ready_location_id,
  preferred_source_location_id
on public.product_fulfillment_routes
for each row
execute function public.sync_product_fulfillment_route_production_fields();

-- Backfill de las rutas existentes.
-- Las rutas de produccion actuales empiezan como produccion simple y conservan
-- como ready_location_id el LOC que ya estaba configurado en la interfaz.
update public.product_fulfillment_routes
set
  production_execution_mode = case
    when supply_mode = 'production' then coalesce(
      nullif(btrim(production_execution_mode), ''),
      'simple'
    )
    else null
  end,
  ready_location_id = case
    when supply_mode = 'production' then coalesce(
      ready_location_id,
      preferred_source_location_id
    )
    else null
  end,
  updated_at = now()
where
  supply_mode = 'production'
  or production_execution_mode is not null
  or ready_location_id is not null;

alter table public.product_fulfillment_routes
  drop constraint if exists product_fulfillment_routes_production_execution_mode_check;

alter table public.product_fulfillment_routes
  add constraint product_fulfillment_routes_production_execution_mode_check
  check (
    production_execution_mode is null
    or production_execution_mode in ('simple', 'recipe')
  );

alter table public.product_fulfillment_routes
  drop constraint if exists product_fulfillment_routes_production_fields_by_supply_mode_check;

alter table public.product_fulfillment_routes
  add constraint product_fulfillment_routes_production_fields_by_supply_mode_check
  check (
    (
      supply_mode = 'production'
      and production_execution_mode is not null
      and ready_location_id is not null
    )
    or
    (
      supply_mode <> 'production'
      and production_execution_mode is null
      and ready_location_id is null
    )
  );

-- CFG-006 tambien queda protegido en base de datos:
-- una ruta logica activa es unica por producto + origen + destino + area solicitante.
-- El area que atiende puede cambiar sin crear una segunda ruta activa.
with ranked_active_routes as (
  select
    id,
    row_number() over (
      partition by
        product_id,
        from_site_id,
        to_site_id,
        coalesce(requesting_area_kind, '')
      order by
        case
          when supply_mode = 'stock'
            and preparing_area_kind is not null
            and preferred_source_location_id is not null then 0
          when supply_mode = 'production'
            and preparing_area_kind is not null
            and production_execution_mode is not null
            and ready_location_id is not null then 0
          else 1
        end,
        updated_at desc,
        created_at desc,
        id desc
    ) as route_rank
  from public.product_fulfillment_routes
  where is_active
)
update public.product_fulfillment_routes as route
set
  is_active = false,
  updated_at = now()
from ranked_active_routes as ranked
where route.id = ranked.id
  and ranked.route_rank > 1;

drop index if exists public.product_fulfillment_routes_active_scope_uidx;

create unique index product_fulfillment_routes_active_scope_uidx
  on public.product_fulfillment_routes (
    product_id,
    from_site_id,
    to_site_id,
    coalesce(requesting_area_kind, '')
  )
  where is_active;

comment on column public.product_fulfillment_routes.production_execution_mode is
  'Forma de ejecutar una ruta de produccion: simple registra cantidad producida sin receta; recipe usa produccion real de FOGO.';

comment on column public.product_fulfillment_routes.ready_location_id is
  'LOC operativo donde el area productora deja el producto terminado disponible para despacho. No representa una posicion interna.';

comment on index public.product_fulfillment_routes_active_scope_uidx is
  'Garantiza una sola ruta activa por producto, origen, destino y area solicitante, independientemente del area que atiende.';

commit;