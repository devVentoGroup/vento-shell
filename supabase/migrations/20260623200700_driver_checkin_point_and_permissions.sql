-- 20260624010000_driver_checkin_point_and_permissions.sql
-- Objetivo:
-- 1) Separar sede operativa del turno vs. sede/geocerca fisica de marcacion.
-- 2) Soportar rol operativo conductor.
-- 3) Dar permisos base para que conductor vea remisiones listas y marque en transito en NEXO.
-- 4) Crear helper para registrar el punto de recogida de camioneta con coordenadas reales.

begin;

-- -----------------------------------------------------------------------------
-- 1. Turnos: sede operativa vs. punto fisico de marcacion
-- -----------------------------------------------------------------------------

alter table public.employee_shifts
  add column if not exists checkin_site_id uuid references public.sites(id) on delete set null,
  add column if not exists checkout_site_id uuid references public.sites(id) on delete set null;

comment on column public.employee_shifts.checkin_site_id is
  'Punto fisico/geocerca para validar check-in. Si es null, ANIMA usa employee_shifts.site_id.';

comment on column public.employee_shifts.checkout_site_id is
  'Punto fisico/geocerca para validar check-out. Si es null, ANIMA usa employee_shifts.site_id.';

create index if not exists employee_shifts_checkin_site_id_idx
  on public.employee_shifts(checkin_site_id)
  where checkin_site_id is not null;

create index if not exists employee_shifts_checkout_site_id_idx
  on public.employee_shifts(checkout_site_id)
  where checkout_site_id is not null;

-- -----------------------------------------------------------------------------
-- 2. Asistencia: guardar donde se valido la geocerca sin cambiar la sede operativa
-- -----------------------------------------------------------------------------

alter table public.attendance_logs
  add column if not exists geofence_site_id uuid references public.sites(id) on delete set null,
  add column if not exists geofence_distance_meters numeric(10,2);

comment on column public.attendance_logs.geofence_site_id is
  'Sede tecnica/geocerca usada para validar GPS. attendance_logs.site_id conserva la sede operativa.';

comment on column public.attendance_logs.geofence_distance_meters is
  'Distancia calculada entre el GPS del empleado y geofence_site_id al momento de marcar.';

create index if not exists attendance_logs_geofence_site_id_idx
  on public.attendance_logs(geofence_site_id)
  where geofence_site_id is not null;

-- -----------------------------------------------------------------------------
-- 3. Catalogo de roles operativos por sede
--    Nota: employees.role sigue siendo rol base. Esto define roles disponibles por sede.
-- -----------------------------------------------------------------------------

create table if not exists public.site_operational_roles (
  id uuid primary key default gen_random_uuid(),
  site_id uuid not null references public.sites(id) on delete cascade,
  role_code text not null references public.roles(code) on delete cascade,
  label text,
  is_default boolean not null default false,
  sort_order integer not null default 100,
  is_active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint site_operational_roles_role_code_not_blank check (btrim(role_code) <> '')
);

comment on table public.site_operational_roles is
  'Roles operativos disponibles por sede para planificacion de turnos ANIMA.';

create unique index if not exists site_operational_roles_site_role_uidx
  on public.site_operational_roles(site_id, role_code);

create unique index if not exists site_operational_roles_one_default_per_site_uidx
  on public.site_operational_roles(site_id)
  where is_default = true and is_active = true;

create index if not exists site_operational_roles_role_idx
  on public.site_operational_roles(role_code)
  where is_active = true;

-- -----------------------------------------------------------------------------
-- 4. Rol operativo conductor
-- -----------------------------------------------------------------------------

insert into public.roles (code, name, description, is_active)
select
  'conductor',
  'Conductor',
  'Rol operativo para despachar remisiones y trasladarlas desde centros de produccion.',
  true
where not exists (
  select 1 from public.roles where code = 'conductor'
);

-- -----------------------------------------------------------------------------
-- 5. Permisos NEXO requeridos para conductor
-- -----------------------------------------------------------------------------

insert into public.app_permissions (app_id, code, name, description, is_active)
select a.id, p.code, p.name, p.description, true
from public.apps a
cross join (
  values
    ('access', 'Acceso NEXO', 'Permite entrar a NEXO.'),
    ('inventory.remissions.view_dispatch', 'Ver remisiones para despacho', 'Permite ver remisiones listas para despacho desde la sede operativa.'),
    ('inventory.remissions.transit', 'Marcar remision en transito', 'Permite marcar una remision como en transito sin aplicar recepcion.' )
) as p(code, name, description)
where a.code = 'nexo'
  and not exists (
    select 1
    from public.app_permissions existing
    where existing.app_id = a.id
      and existing.code = p.code
  );

-- Grant base por tipo de sede: conductor opera desde centros de produccion.
-- Si luego quieres restringir a un centro exacto, cambia scope_type='site' y scope_site_id=<uuid>.
insert into public.role_permissions (
  role,
  permission_id,
  scope_type,
  scope_site_type,
  is_allowed
)
select
  'conductor',
  ap.id,
  'site_type'::public.permission_scope_type,
  'production_center'::public.site_type,
  true
from public.app_permissions ap
join public.apps a on a.id = ap.app_id
where a.code = 'nexo'
  and ap.code in (
    'access',
    'inventory.remissions.view_dispatch',
    'inventory.remissions.transit'
  )
  and not exists (
    select 1
    from public.role_permissions rp
    where rp.role = 'conductor'
      and rp.permission_id = ap.id
      and rp.scope_type = 'site_type'::public.permission_scope_type
      and rp.scope_site_type = 'production_center'::public.site_type
      and rp.scope_area_kind is null
  );

-- -----------------------------------------------------------------------------
-- 6. Helper generico: evaluar permisos de un rol operativo, no solo employees.role
-- -----------------------------------------------------------------------------

create or replace function public.has_role_permission(
  p_role text,
  p_permission_code text,
  p_site_id uuid default null,
  p_area_id uuid default null
) returns boolean
language plpgsql
stable
security definer
set search_path to 'public'
as $$
declare
  v_permission_id uuid;
  v_site_id uuid;
  v_area_id uuid;
  v_allowed boolean := false;
begin
  if nullif(btrim(coalesce(p_role, '')), '') is null then
    return false;
  end if;

  select ap.id
    into v_permission_id
  from public.app_permissions ap
  join public.apps a on a.id = ap.app_id
  where (a.code || '.' || ap.code) = p_permission_code
    and a.is_active = true
    and ap.is_active = true
  limit 1;

  if v_permission_id is null then
    return false;
  end if;

  v_site_id := p_site_id;
  v_area_id := p_area_id;

  select exists (
    select 1
    from public.role_permissions rp
    where rp.role = btrim(p_role)
      and rp.permission_id = v_permission_id
      and rp.is_allowed = true
      and public.permission_scope_matches(
        rp.scope_type,
        v_site_id,
        v_area_id,
        rp.scope_site_id,
        rp.scope_area_id,
        rp.scope_site_type,
        rp.scope_area_kind
      )
  ) into v_allowed;

  return coalesce(v_allowed, false);
end;
$$;

comment on function public.has_role_permission(text, text, uuid, uuid) is
  'Evalua permisos de un rol operativo explicito. Complementa has_permission(), que usa employees.role.';

-- -----------------------------------------------------------------------------
-- 7. Helper para crear/actualizar el punto tecnico de recogida de camioneta
--    Ejecutar luego con coordenadas reales.
-- -----------------------------------------------------------------------------

create or replace function public.upsert_driver_checkin_point(
  p_code text,
  p_name text,
  p_latitude numeric,
  p_longitude numeric,
  p_radius_meters integer default 100,
  p_address text default null
) returns uuid
language plpgsql
security definer
set search_path to 'public'
as $$
declare
  v_site_id uuid;
begin
  if nullif(btrim(coalesce(p_code, '')), '') is null then
    raise exception 'p_code es requerido';
  end if;

  if nullif(btrim(coalesce(p_name, '')), '') is null then
    raise exception 'p_name es requerido';
  end if;

  if p_latitude is null or p_longitude is null then
    raise exception 'latitud y longitud son requeridas';
  end if;

  if coalesce(p_radius_meters, 0) <= 0 then
    raise exception 'p_radius_meters debe ser mayor a cero';
  end if;

  insert into public.sites (
    code,
    name,
    type,
    is_active,
    latitude,
    longitude,
    address,
    site_type,
    site_kind,
    checkin_radius_meters,
    is_public,
    operational_visibility
  ) values (
    lower(btrim(p_code)),
    btrim(p_name),
    'checkin_point',
    true,
    p_latitude,
    p_longitude,
    nullif(btrim(coalesce(p_address, '')), ''),
    'admin'::public.site_type,
    'vehicle_yard',
    p_radius_meters,
    false,
    'hidden'
  )
  on conflict (code) do update set
    name = excluded.name,
    type = excluded.type,
    is_active = true,
    latitude = excluded.latitude,
    longitude = excluded.longitude,
    address = excluded.address,
    site_type = excluded.site_type,
    site_kind = excluded.site_kind,
    checkin_radius_meters = excluded.checkin_radius_meters,
    is_public = false,
    operational_visibility = 'hidden'
  returning id into v_site_id;

  insert into public.site_attendance_policy (
    site_id,
    checkin_radius_meters,
    requires_geofence
  ) values (
    v_site_id,
    p_radius_meters,
    true
  )
  on conflict (site_id) do update set
    checkin_radius_meters = excluded.checkin_radius_meters,
    requires_geofence = true,
    updated_at = now();

  return v_site_id;
end;
$$;

comment on function public.upsert_driver_checkin_point(text, text, numeric, numeric, integer, text) is
  'Crea/actualiza un site oculto para geocerca de recogida/devolucion de camioneta.';

-- Ejemplo de uso DESPUES de aplicar la migracion:
-- select public.upsert_driver_checkin_point(
--   'pickup_camioneta_principal',
--   'Punto recogida camioneta principal',
--   4.00000000,
--   -74.00000000,
--   100,
--   'Direccion opcional'
-- );

-- -----------------------------------------------------------------------------
-- 8. RPC para conductor: marcar remision en transito sin aplicar recepcion
-- -----------------------------------------------------------------------------

create or replace function public.mark_restock_request_in_transit(
  p_request_id uuid
) returns public.restock_requests
language plpgsql
security definer
set search_path to 'public'
as $$
declare
  v_employee_id uuid := auth.uid();
  v_employee record;
  v_request public.restock_requests%rowtype;
  v_latest_log record;
  v_operational_role text;
  v_context_site_id uuid;
  v_allowed boolean := false;
begin
  if v_employee_id is null then
    raise exception 'not authenticated';
  end if;

  select e.id, e.role, e.is_active
    into v_employee
  from public.employees e
  where e.id = v_employee_id
    and e.is_active = true;

  if v_employee.id is null then
    raise exception 'employee not active';
  end if;

  select *
    into v_request
  from public.restock_requests r
  where r.id = p_request_id
  for update;

  if v_request.id is null then
    raise exception 'restock_request not found: %', p_request_id;
  end if;

  if v_request.from_site_id is null then
    raise exception 'from_site_id requerido para marcar en transito';
  end if;

  if v_request.cancelled_at is not null or v_request.closed_at is not null or v_request.received_at is not null then
    raise exception 'remision no se puede marcar en transito por su estado actual';
  end if;

  if v_request.in_transit_at is not null then
    return v_request;
  end if;

  -- Permiso por rol base del empleado.
  v_allowed := public.has_permission(
    'nexo.inventory.remissions.transit',
    v_request.from_site_id,
    null
  );

  -- Permiso por rol operativo activo del turno/check-in.
  if not v_allowed then
    select
      al.action,
      al.site_id as log_site_id,
      al.device_info,
      al.shift_id,
      s.site_id as shift_site_id,
      s.operational_role
    into v_latest_log
    from public.attendance_logs al
    left join public.employee_shifts s on s.id = al.shift_id
    where al.employee_id = v_employee_id
    order by al.occurred_at desc, al.created_at desc
    limit 1;

    if v_latest_log.action = 'check_in' then
      v_operational_role := coalesce(
        nullif(v_latest_log.device_info #>> '{operationalContext,operationalRole}', ''),
        nullif(v_latest_log.device_info #>> '{operationalContext,operational_role}', ''),
        nullif(v_latest_log.operational_role, '')
      );

      v_context_site_id := coalesce(
        nullif(v_latest_log.device_info #>> '{operationalContext,siteId}', '')::uuid,
        nullif(v_latest_log.device_info #>> '{operationalContext,site_id}', '')::uuid,
        v_latest_log.shift_site_id,
        v_latest_log.log_site_id
      );

      if v_context_site_id = v_request.from_site_id then
        v_allowed := public.has_role_permission(
          v_operational_role,
          'nexo.inventory.remissions.transit',
          v_request.from_site_id,
          null
        );
      end if;
    end if;
  end if;

  if not v_allowed then
    raise exception 'permission denied: remissions.transit';
  end if;

  update public.restock_requests r
  set
    in_transit_at = now(),
    in_transit_by = v_employee_id,
    status = 'in_transit',
    status_updated_at = now()
  where r.id = p_request_id
  returning * into v_request;

  return v_request;
end;
$$;

comment on function public.mark_restock_request_in_transit(uuid) is
  'Permite a conductor marcar una remision como en transito desde NEXO, validando rol base u operativo activo.';

commit;
