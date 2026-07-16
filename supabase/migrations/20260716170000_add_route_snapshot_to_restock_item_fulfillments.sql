-- DATA-002: Guarda en cada tarea una copia de la ruta operativa usada al crearla.
-- La tarea conserva esta fotografia aunque product_fulfillment_routes cambie despues.
-- Terminologia:
--   supply_mode = forma de abastecimiento de la tarea.
--   production_execution_mode = ejecucion simple o mediante receta en FOGO.
--   ready_location_id = LOC donde Produccion deja el terminado listo para despacho.
-- Un LOC no representa estanteria, nivel, posicion interna ni LPN.

begin;

alter table public.restock_item_fulfillments
  add column if not exists supply_mode text,
  add column if not exists production_execution_mode text,
  add column if not exists ready_location_id uuid;

-- FK idempotente para el LOC donde queda listo el producto terminado.
do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'restock_item_fulfillments_ready_location_id_fkey'
      and conrelid = 'public.restock_item_fulfillments'::regclass
  ) then
    alter table public.restock_item_fulfillments
      add constraint restock_item_fulfillments_ready_location_id_fkey
      foreign key (ready_location_id)
      references public.inventory_locations(id)
      on delete set null;
  end if;
end
$$;

-- Backfill de tareas existentes que ya tienen route_id.
-- No se enlazan automaticamente tareas sin ruta: esas permanecen bloqueadas y
-- deben resolverse de forma explicita para no perder la trazabilidad original.
update public.restock_item_fulfillments as fulfillment
set
  supply_mode = route.supply_mode,
  production_execution_mode = case
    when route.supply_mode = 'production'
      then route.production_execution_mode
    else null
  end,
  ready_location_id = case
    when route.supply_mode = 'production'
      then route.ready_location_id
    else null
  end,
  updated_at = now()
from public.product_fulfillment_routes as route
where fulfillment.route_id = route.id
  and (
    fulfillment.supply_mode is distinct from route.supply_mode
    or fulfillment.production_execution_mode is distinct from case
      when route.supply_mode = 'production'
        then route.production_execution_mode
      else null
    end
    or fulfillment.ready_location_id is distinct from case
      when route.supply_mode = 'production'
        then route.ready_location_id
      else null
    end
  );

alter table public.restock_item_fulfillments
  drop constraint if exists restock_fulfillments_supply_mode_check;

alter table public.restock_item_fulfillments
  add constraint restock_fulfillments_supply_mode_check
  check (
    supply_mode is null
    or supply_mode in ('stock', 'production', 'supplier', 'transfer', 'manual')
  );

alter table public.restock_item_fulfillments
  drop constraint if exists restock_fulfillments_production_mode_check;

alter table public.restock_item_fulfillments
  add constraint restock_fulfillments_production_mode_check
  check (
    production_execution_mode is null
    or production_execution_mode in ('simple', 'recipe')
  );

alter table public.restock_item_fulfillments
  drop constraint if exists restock_fulfillments_route_snapshot_check;

alter table public.restock_item_fulfillments
  add constraint restock_fulfillments_route_snapshot_check
  check (
    (
      supply_mode = 'production'
      and production_execution_mode is not null
      and ready_location_id is not null
    )
    or
    (
      supply_mode is distinct from 'production'
      and production_execution_mode is null
      and ready_location_id is null
    )
  );

-- Cola operativa por sede origen, area responsable, modo y estado.
create index if not exists restock_item_fulfillments_work_queue_idx
  on public.restock_item_fulfillments (
    from_site_id,
    preparing_area_kind,
    supply_mode,
    status,
    available_at
  )
  where status in (
    'pending',
    'reserved',
    'preparing',
    'partially_ready',
    'ready',
    'blocked'
  );

comment on column public.restock_item_fulfillments.supply_mode is
  'Copia del modo de abastecimiento de la ruta al crear la tarea. No cambia automaticamente si la ruta se modifica despues.';

comment on column public.restock_item_fulfillments.production_execution_mode is
  'Copia del modo de ejecucion productiva: simple registra cantidad producida sin receta; recipe usa produccion real de FOGO.';

comment on column public.restock_item_fulfillments.ready_location_id is
  'LOC donde el area productora deja el terminado listo para despacho. No representa una posicion interna.';

comment on index public.restock_item_fulfillments_work_queue_idx is
  'Acelera las colas de trabajo por sede origen, area responsable, modo de abastecimiento y estado.';

commit;