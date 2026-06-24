-- VENTO OS - Operational roles matrix V1
-- Phase 1: controlled operational role catalog and site/area matrix.
-- Run in Supabase SQL editor after reviewing existing data.

begin;

create table if not exists public.operational_roles (
  code text primary key,
  label text not null,
  description text,
  role_family text not null default 'operacion',
  requires_external_checkin boolean not null default false,
  requires_external_checkout boolean not null default false,
  is_active boolean not null default true,
  sort_order integer not null default 100,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

comment on table public.operational_roles is
  'Closed catalog of operational roles that can be assigned to shifts. This does not replace employees.role.';

comment on column public.operational_roles.code is
  'Stable operational role code used by employee_shifts.operational_role and site_operational_roles.role_code.';

insert into public.operational_roles (
  code,
  label,
  description,
  role_family,
  requires_external_checkin,
  requires_external_checkout,
  sort_order
)
values
  ('cajero_satelite', 'Cajero satélite', 'Caja/POS en satélites comerciales.', 'satelite', false, false, 10),
  ('barista_satelite', 'Barista satélite', 'Barra, bebidas y consulta de recetas en satélites.', 'satelite', false, false, 20),
  ('cocinero_satelite', 'Cocinero satélite', 'Cocina operativa en satélites.', 'satelite', false, false, 30),
  ('servicio_salon', 'Servicio salón', 'Servicio y atención en salón.', 'satelite', false, false, 40),
  ('mostrador_satelite', 'Mostrador satélite', 'Mostrador, entrega y venta simple.', 'satelite', false, false, 50),
  ('operador_integral_satelite', 'Operador integral satélite', 'Operación compacta de satélite pequeño.', 'satelite', false, false, 60),
  ('produccion_cocina', 'Producción cocina', 'Producción formal de cocina caliente.', 'produccion', false, false, 70),
  ('produccion_panaderia', 'Producción panadería', 'Producción formal de panadería.', 'produccion', false, false, 80),
  ('produccion_reposteria', 'Producción repostería', 'Producción formal de repostería.', 'produccion', false, false, 90),
  ('bodeguero', 'Bodeguero', 'Bodega, stock, movimientos y remisiones.', 'logistica', false, false, 100),
  ('conductor_logistica', 'Conductor logística', 'Rutas, remisiones en tránsito y confirmación logística.', 'logistica', true, true, 110),
  ('gerencia_operativa', 'Gerencia operativa', 'Gestión y corrección operativa.', 'gerencia', false, false, 120),
  ('propietario_admin', 'Propietario admin', 'Administración global y bypass operativo futuro.', 'administracion', false, false, 130)
on conflict (code) do update
set
  label = excluded.label,
  description = excluded.description,
  role_family = excluded.role_family,
  requires_external_checkin = excluded.requires_external_checkin,
  requires_external_checkout = excluded.requires_external_checkout,
  sort_order = excluded.sort_order,
  updated_at = now();

create table if not exists public.site_operational_roles (
  id uuid primary key default gen_random_uuid(),
  site_id uuid not null references public.sites(id) on delete cascade,
  area_id uuid null references public.areas(id) on delete cascade,
  role_code text not null,
  is_default boolean not null default false,
  is_active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

comment on table public.site_operational_roles is
  'Controlled matrix of operational roles allowed by site and optional area. Role codes must exist in operational_roles.';

alter table public.site_operational_roles
  add column if not exists area_id uuid null;

alter table public.site_operational_roles
  add column if not exists is_default boolean not null default false;

alter table public.site_operational_roles
  add column if not exists updated_at timestamptz not null default now();

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'site_operational_roles_role_code_fkey'
  ) then
    alter table public.site_operational_roles
      add constraint site_operational_roles_role_code_fkey
      foreign key (role_code)
      references public.operational_roles(code)
      not valid;
  end if;
end $$;

create unique index if not exists site_operational_roles_site_area_role_uidx
  on public.site_operational_roles (
    site_id,
    coalesce(area_id, '00000000-0000-0000-0000-000000000000'::uuid),
    role_code
  );

create index if not exists site_operational_roles_site_idx
  on public.site_operational_roles (site_id);

create index if not exists site_operational_roles_area_idx
  on public.site_operational_roles (area_id);

create index if not exists site_operational_roles_role_code_idx
  on public.site_operational_roles (role_code);

create or replace view public.vento_operational_roles_v1 as
select
  code,
  label,
  description,
  role_family,
  requires_external_checkin,
  requires_external_checkout,
  is_active,
  sort_order
from public.operational_roles
where is_active = true;

create or replace view public.vento_site_operational_role_matrix_v1 as
select
  sor.id,
  sor.site_id,
  s.name as site_name,
  s.code as site_code,
  s.site_type,
  sor.area_id,
  a.name as area_name,
  a.kind as area_kind,
  sor.role_code,
  opr.label as role_label,
  opr.description as role_description,
  opr.role_family,
  opr.requires_external_checkin,
  opr.requires_external_checkout,
  sor.is_default,
  sor.is_active,
  sor.created_at,
  sor.updated_at
from public.site_operational_roles sor
join public.sites s on s.id = sor.site_id
left join public.areas a on a.id = sor.area_id
join public.operational_roles opr on opr.code = sor.role_code;

commit;

notify pgrst, 'reload schema';
