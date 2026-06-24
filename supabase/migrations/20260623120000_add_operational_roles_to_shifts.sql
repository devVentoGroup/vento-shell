-- VENTO OS / VISO
-- Rol operativo por turno.
--
-- Regla funcional:
-- - public.employees.role = rol base del trabajador.
-- - public.employee_shifts.operational_role = rol operativo planeado para ese turno.
-- - viso.site_operational_roles = roles operativos disponibles por sede.

create schema if not exists viso;

alter table public.employee_shifts
  add column if not exists operational_role text;

comment on column public.employee_shifts.operational_role is
  'Rol operativo planeado para este turno. No reemplaza public.employees.role; Anima debe activar este rol durante el check-in.';

create table if not exists viso.site_operational_roles (
  id uuid primary key default gen_random_uuid(),
  site_id uuid not null references public.sites(id) on delete cascade,
  role_code text not null,
  role_label text,
  area_id uuid null references public.areas(id) on delete set null,
  area_kind text null,
  is_default boolean not null default false,
  is_active boolean not null default true,
  sort_order integer not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint site_operational_roles_role_code_not_blank check (length(trim(role_code)) > 0),
  constraint site_operational_roles_area_scope_check check (
    area_id is null
    or area_kind is null
  )
);

comment on table viso.site_operational_roles is
  'Roles operativos disponibles por sede para planear turnos en VISO y activar contexto en ANIMA.';

comment on column viso.site_operational_roles.role_code is
  'Código estable del rol operativo. Ej: barista, cocinero, operador_integral_satelite.';

comment on column viso.site_operational_roles.role_label is
  'Etiqueta humana opcional para mostrar en UI.';

comment on column viso.site_operational_roles.area_id is
  'Área exacta donde aplica el rol, si la sede requiere granularidad por área.';

comment on column viso.site_operational_roles.area_kind is
  'Tipo de área donde aplica el rol, si se quiere configurar por familia de área.';

create unique index if not exists site_operational_roles_site_role_scope_idx
  on viso.site_operational_roles (
    site_id,
    role_code,
    coalesce(area_id, '00000000-0000-0000-0000-000000000000'::uuid),
    coalesce(area_kind, '')
  );

create index if not exists site_operational_roles_site_active_idx
  on viso.site_operational_roles (site_id, is_active, sort_order, role_label, role_code);

create index if not exists employee_shifts_operational_role_idx
  on public.employee_shifts (site_id, operational_role)
  where operational_role is not null;

-- Bootstrap no destructivo:
-- crea roles operativos por sede con base en trabajadores activos ya asignados.
-- Esto permite que VISO funcione sin bloquear la planeación mientras se carga la matriz formal.
with linked_roles as (
  select distinct
    es.site_id,
    nullif(trim(e.role), '') as role_code
  from public.employee_sites es
  join public.employees e on e.id = es.employee_id
  where coalesce(es.is_active, true) is true
    and coalesce(e.is_active, true) is true
    and nullif(trim(e.role), '') is not null
),
direct_roles as (
  select distinct
    e.site_id,
    nullif(trim(e.role), '') as role_code
  from public.employees e
  where e.site_id is not null
    and coalesce(e.is_active, true) is true
    and nullif(trim(e.role), '') is not null
),
seed_roles as (
  select site_id, role_code from linked_roles
  union
  select site_id, role_code from direct_roles
),
numbered_roles as (
  select
    site_id,
    role_code,
    initcap(replace(role_code, '_', ' ')) as role_label,
    row_number() over (partition by site_id order by role_code) * 10 as sort_order
  from seed_roles
)
insert into viso.site_operational_roles (
  site_id,
  role_code,
  role_label,
  is_default,
  is_active,
  sort_order
)
select
  site_id,
  role_code,
  role_label,
  false,
  true,
  sort_order
from numbered_roles
on conflict do nothing;
