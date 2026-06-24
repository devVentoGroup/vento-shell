-- 20260624011000_hide_driver_checkin_point_from_operational_sites.sql
-- Objetivo:
-- Mantener el punto fisico de recogida de camioneta como geocerca tecnica,
-- sin que aparezca como sede operativa en selectores/listados normales.
--
-- IMPORTANTE:
-- - No elimina el site tecnico.
-- - No rompe employee_shifts.checkin_site_id / checkout_site_id.
-- - No rompe attendance_logs.geofence_site_id.
-- - Solo evita que el punto se trate como sede asignable/visible.

begin;

-- Cambia este UUID si creas otro punto tecnico.
-- Punto actual devuelto por upsert_driver_checkin_point:
-- fecf232f-0ef5-4340-94e6-2c1c80e437af

update public.sites
set
  operational_visibility = 'hidden',
  is_public = false,
  type = 'checkin_point',
  site_kind = 'vehicle_yard'
where id = 'fecf232f-0ef5-4340-94e6-2c1c80e437af'::uuid;

-- El punto tecnico NO debe estar asignado como sede del empleado.
-- Los turnos lo referencian directamente por checkin_site_id / checkout_site_id.
delete from public.employee_sites
where site_id = 'fecf232f-0ef5-4340-94e6-2c1c80e437af'::uuid;

-- Si por accidente quedo seleccionado como sede actual de algun empleado, se limpia.
update public.employee_settings
set selected_site_id = null
where selected_site_id = 'fecf232f-0ef5-4340-94e6-2c1c80e437af'::uuid;

-- No debe tener roles operativos propios. El rol conductor pertenece al centro operativo,
-- no al parqueadero/punto de recogida.
delete from public.site_operational_roles
where site_id = 'fecf232f-0ef5-4340-94e6-2c1c80e437af'::uuid;

-- Vista segura para pantallas que necesiten listar solo sedes operativas.
-- Cambiar pantallas directas de public.sites a public.operational_sites cuando aplique.
create or replace view public.operational_sites as
select *
from public.sites
where coalesce(operational_visibility, 'operational') = 'operational'
  and coalesce(is_active, true) = true;

comment on view public.operational_sites is
  'Sedes operativas visibles para selectores/listados. Excluye puntos tecnicos hidden como parqueaderos/geocercas.';

-- Guardia: impide asignar sitios ocultos/tecnicos a employee_sites.
-- Eso evita que reaparezcan en pantallas que construyen sedes desde employee_sites.
create or replace function public.prevent_hidden_site_employee_assignment()
returns trigger
language plpgsql
security definer
set search_path to 'public'
as $$
declare
  v_site_name text;
  v_visibility text;
begin
  select name, coalesce(operational_visibility, 'operational')
    into v_site_name, v_visibility
  from public.sites
  where id = new.site_id;

  if v_visibility <> 'operational' then
    raise exception 'No se puede asignar el site tecnico/oculto % (%) a employee_sites',
      coalesce(v_site_name, new.site_id::text),
      new.site_id;
  end if;

  return new;
end;
$$;

drop trigger if exists employee_sites_block_hidden_sites on public.employee_sites;

create trigger employee_sites_block_hidden_sites
before insert or update of site_id on public.employee_sites
for each row
execute function public.prevent_hidden_site_employee_assignment();

commit;
