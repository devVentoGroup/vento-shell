-- VISO operational administration foundation
-- Adds configurable operational profiles per employee/site and admin helpers.

begin;

-- 1) Site-level operational role catalog. If previous migrations already created it, this is a no-op.
create table if not exists public.site_operational_roles (
  id uuid primary key default gen_random_uuid(),
  site_id uuid not null references public.sites(id) on delete cascade,
  role_code text not null references public.roles(code) on update cascade on delete restrict,
  label text,
  description text,
  is_active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  created_by uuid references public.employees(id),
  updated_by uuid references public.employees(id),
  constraint site_operational_roles_role_code_not_blank check (length(trim(role_code)) > 0),
  constraint site_operational_roles_label_not_blank check (label is null or length(trim(label)) > 0),
  constraint site_operational_roles_site_role_key unique (site_id, role_code)
);

comment on table public.site_operational_roles is
  'Operational roles enabled by site. Used by VISO to configure what operational roles can be assigned at each operational site.';

comment on column public.site_operational_roles.role_code is
  'Operational role code, e.g. conductor, cocinero, barista, inventario. This is not necessarily the employee base/admin role.';

-- Compatibility: this table may already exist from the driver/geofence migration
-- with role_code instead of role. Keep the canonical column as role_code and add
-- only the admin metadata columns that may be missing.
alter table public.site_operational_roles
  add column if not exists label text,
  add column if not exists description text,
  add column if not exists is_default boolean not null default false,
  add column if not exists sort_order integer not null default 100,
  add column if not exists is_active boolean not null default true,
  add column if not exists created_at timestamptz not null default now(),
  add column if not exists updated_at timestamptz not null default now(),
  add column if not exists created_by uuid references public.employees(id),
  add column if not exists updated_by uuid references public.employees(id);

-- If an older failed/local draft ever created a role column, copy it into role_code
-- only when role_code is still null, then keep role_code as the only field used by views/UI.
do $$
begin
  if exists (
    select 1
    from information_schema.columns
    where table_schema = 'public'
      and table_name = 'site_operational_roles'
      and column_name = 'role'
  ) then
    execute 'update public.site_operational_roles set role_code = coalesce(role_code, role) where role_code is null';
  end if;
end;
$$;

-- 2) Employee operational default profile by site.
create table if not exists public.employee_site_operational_profiles (
  id uuid primary key default gen_random_uuid(),
  employee_id uuid not null references public.employees(id) on delete cascade,
  site_id uuid not null references public.sites(id) on delete cascade,
  default_operational_role text references public.roles(code) on update cascade on delete restrict,
  default_checkin_site_id uuid references public.sites(id) on delete set null,
  default_checkout_site_id uuid references public.sites(id) on delete set null,
  is_active boolean not null default true,
  notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  created_by uuid references public.employees(id),
  updated_by uuid references public.employees(id),
  constraint employee_site_operational_profiles_employee_site_key unique (employee_id, site_id),
  constraint employee_site_operational_profiles_role_not_blank check (
    default_operational_role is null or length(trim(default_operational_role)) > 0
  )
);

comment on table public.employee_site_operational_profiles is
  'Default operational context per employee and operational site: role, check-in point, and check-out point. Used by VISO to prefill shifts without changing employees.role.';

comment on column public.employee_site_operational_profiles.site_id is
  'Operational site where the employee works, e.g. Centro de Produccion.';

comment on column public.employee_site_operational_profiles.default_checkin_site_id is
  'Physical check-in geofence point. May be a hidden site, e.g. vehicle pickup point.';

comment on column public.employee_site_operational_profiles.default_checkout_site_id is
  'Physical check-out geofence point. May be a hidden site.';

create index if not exists site_operational_roles_site_id_idx
  on public.site_operational_roles(site_id);

create unique index if not exists site_operational_roles_site_role_uidx
  on public.site_operational_roles(site_id, role_code);

create unique index if not exists site_operational_roles_one_default_per_site_uidx
  on public.site_operational_roles(site_id)
  where is_default = true and is_active = true;

create index if not exists site_operational_roles_role_idx
  on public.site_operational_roles(role_code);

create index if not exists employee_site_operational_profiles_employee_id_idx
  on public.employee_site_operational_profiles(employee_id);

create index if not exists employee_site_operational_profiles_site_id_idx
  on public.employee_site_operational_profiles(site_id);

create index if not exists employee_site_operational_profiles_role_idx
  on public.employee_site_operational_profiles(default_operational_role);

-- 3) Validation trigger: operational site must be visible operationally; check-in/out points may be hidden.
create or replace function public.validate_employee_site_operational_profile()
returns trigger
language plpgsql
as $$
declare
  v_site_visibility text;
  v_site_active boolean;
  v_checkin_active boolean;
  v_checkout_active boolean;
begin
  select s.operational_visibility, s.is_active
    into v_site_visibility, v_site_active
  from public.sites s
  where s.id = new.site_id;

  if coalesce(v_site_active, false) is distinct from true then
    raise exception 'Operational profile site must be an active site';
  end if;

  if coalesce(v_site_visibility, '') <> 'operational' then
    raise exception 'Operational profile site must have operational_visibility = operational';
  end if;

  if new.default_checkin_site_id is not null then
    select s.is_active into v_checkin_active
    from public.sites s
    where s.id = new.default_checkin_site_id;

    if coalesce(v_checkin_active, false) is distinct from true then
      raise exception 'Default check-in point must be an active site';
    end if;
  end if;

  if new.default_checkout_site_id is not null then
    select s.is_active into v_checkout_active
    from public.sites s
    where s.id = new.default_checkout_site_id;

    if coalesce(v_checkout_active, false) is distinct from true then
      raise exception 'Default check-out point must be an active site';
    end if;
  end if;

  return new;
end;
$$;

drop trigger if exists trg_validate_employee_site_operational_profile
  on public.employee_site_operational_profiles;

create trigger trg_validate_employee_site_operational_profile
before insert or update on public.employee_site_operational_profiles
for each row execute function public.validate_employee_site_operational_profile();

-- 4) Updated-at triggers.
drop trigger if exists trg_site_operational_roles_updated_at
  on public.site_operational_roles;

create trigger trg_site_operational_roles_updated_at
before update on public.site_operational_roles
for each row execute function public._set_updated_at();

drop trigger if exists trg_employee_site_operational_profiles_updated_at
  on public.employee_site_operational_profiles;

create trigger trg_employee_site_operational_profiles_updated_at
before update on public.employee_site_operational_profiles
for each row execute function public._set_updated_at();

-- 5) Admin views for VISO.
create or replace view public.viso_operational_sites
with (security_invoker = true) as
select
  s.id,
  s.code,
  s.name,
  s.type,
  s.site_type,
  s.site_kind,
  s.latitude,
  s.longitude,
  s.address,
  s.checkin_radius_meters,
  s.is_active,
  s.operational_visibility
from public.sites s
where s.is_active = true
  and s.operational_visibility = 'operational';

create or replace view public.viso_operational_checkin_points
with (security_invoker = true) as
select
  s.id,
  s.code,
  s.name,
  s.type,
  s.site_type,
  s.site_kind,
  s.latitude,
  s.longitude,
  s.address,
  s.checkin_radius_meters,
  s.is_active,
  s.operational_visibility
from public.sites s
where s.is_active = true
  and (
    s.operational_visibility = 'hidden'
    or s.site_kind in ('checkin_point', 'vehicle_yard')
  );

create or replace view public.viso_site_operational_roles
with (security_invoker = true) as
select
  sor.id,
  sor.site_id,
  s.name as site_name,
  s.code as site_code,
  sor.role_code,
  coalesce(sor.label, r.name, sor.role_code) as label,
  coalesce(sor.description, r.description) as description,
  sor.is_active,
  sor.created_at,
  sor.updated_at
from public.site_operational_roles sor
join public.sites s on s.id = sor.site_id
left join public.roles r on r.code = sor.role_code;

create or replace view public.viso_employee_site_operational_profiles
with (security_invoker = true) as
select
  p.id,
  p.employee_id,
  e.full_name as employee_name,
  e.alias as employee_alias,
  e.role as employee_base_role,
  e.is_active as employee_is_active,
  p.site_id,
  s.name as site_name,
  s.code as site_code,
  p.default_operational_role,
  coalesce(r.name, p.default_operational_role) as default_operational_role_label,
  p.default_checkin_site_id,
  checkin_site.name as default_checkin_site_name,
  checkin_site.code as default_checkin_site_code,
  p.default_checkout_site_id,
  checkout_site.name as default_checkout_site_name,
  checkout_site.code as default_checkout_site_code,
  p.is_active,
  p.notes,
  p.created_at,
  p.updated_at
from public.employee_site_operational_profiles p
join public.employees e on e.id = p.employee_id
join public.sites s on s.id = p.site_id
left join public.roles r on r.code = p.default_operational_role
left join public.sites checkin_site on checkin_site.id = p.default_checkin_site_id
left join public.sites checkout_site on checkout_site.id = p.default_checkout_site_id;

comment on view public.viso_operational_sites is
  'Operational sites shown in VISO admin selectors. Excludes app_review, test, and hidden sites.';

comment on view public.viso_operational_checkin_points is
  'Hidden/technical sites usable as physical geofence points for ANIMA check-in/check-out.';

comment on view public.viso_employee_site_operational_profiles is
  'Joined view for VISO worker-by-site operational defaults.';

-- 6) Generic helper to create/update a hidden physical check-in/out point.
create or replace function public.upsert_operational_checkin_point(
  p_code text,
  p_name text,
  p_latitude numeric,
  p_longitude numeric,
  p_radius_meters integer default 100,
  p_address text default null,
  p_site_kind text default 'checkin_point'
)
returns uuid
language plpgsql
security definer
set search_path = public
as $$
declare
  v_id uuid;
  v_site_kind text;
begin
  if not (public.is_owner() or public.is_global_manager() or public.is_manager()) then
    raise exception 'Not authorized to manage operational check-in points';
  end if;

  if nullif(btrim(coalesce(p_code, '')), '') is null then
    raise exception 'Point code is required';
  end if;

  if nullif(btrim(coalesce(p_name, '')), '') is null then
    raise exception 'Point name is required';
  end if;

  if p_latitude is null or p_longitude is null then
    raise exception 'Latitude and longitude are required';
  end if;

  v_site_kind := coalesce(nullif(btrim(p_site_kind), ''), 'checkin_point');

  insert into public.sites (
    code,
    name,
    type,
    site_type,
    site_kind,
    latitude,
    longitude,
    address,
    checkin_radius_meters,
    is_public,
    operational_visibility,
    is_active
  )
  values (
    btrim(p_code),
    btrim(p_name),
    'internal',
    'satellite',
    v_site_kind,
    p_latitude,
    p_longitude,
    nullif(btrim(coalesce(p_address, '')), ''),
    greatest(coalesce(p_radius_meters, 100), 1),
    false,
    'hidden',
    true
  )
  on conflict (code)
  do update set
    name = excluded.name,
    type = excluded.type,
    site_type = excluded.site_type,
    site_kind = excluded.site_kind,
    latitude = excluded.latitude,
    longitude = excluded.longitude,
    address = excluded.address,
    checkin_radius_meters = excluded.checkin_radius_meters,
    is_public = false,
    operational_visibility = 'hidden',
    is_active = true
  returning id into v_id;

  -- A technical geofence point must not be assigned as an operational site to employees.
  delete from public.employee_sites where site_id = v_id;

  update public.employee_settings
     set selected_site_id = null
   where selected_site_id = v_id;

  return v_id;
end;
$$;

comment on function public.upsert_operational_checkin_point(text, text, numeric, numeric, integer, text, text) is
  'Creates or updates a hidden physical geofence point for ANIMA check-in/check-out. It does not assign the point as an operational employee site.';

-- 7) Helper to upsert employee operational defaults by site.
create or replace function public.upsert_employee_site_operational_profile(
  p_employee_id uuid,
  p_site_id uuid,
  p_default_operational_role text default null,
  p_default_checkin_site_id uuid default null,
  p_default_checkout_site_id uuid default null,
  p_is_active boolean default true,
  p_notes text default null
)
returns uuid
language plpgsql
security definer
set search_path = public
as $$
declare
  v_id uuid;
  v_actor uuid;
begin
  if not (public.is_owner() or public.is_global_manager() or public.is_manager()) then
    raise exception 'Not authorized to manage employee operational profiles';
  end if;

  v_actor := auth.uid();

  insert into public.employee_site_operational_profiles (
    employee_id,
    site_id,
    default_operational_role,
    default_checkin_site_id,
    default_checkout_site_id,
    is_active,
    notes,
    created_by,
    updated_by
  )
  values (
    p_employee_id,
    p_site_id,
    nullif(btrim(coalesce(p_default_operational_role, '')), ''),
    p_default_checkin_site_id,
    p_default_checkout_site_id,
    coalesce(p_is_active, true),
    nullif(btrim(coalesce(p_notes, '')), ''),
    v_actor,
    v_actor
  )
  on conflict (employee_id, site_id)
  do update set
    default_operational_role = excluded.default_operational_role,
    default_checkin_site_id = excluded.default_checkin_site_id,
    default_checkout_site_id = excluded.default_checkout_site_id,
    is_active = excluded.is_active,
    notes = excluded.notes,
    updated_by = excluded.updated_by,
    updated_at = now()
  returning id into v_id;

  return v_id;
end;
$$;

comment on function public.upsert_employee_site_operational_profile(uuid, uuid, text, uuid, uuid, boolean, text) is
  'Creates or updates default operational role and geofence points for an employee at an operational site.';

-- 8) Function to apply a profile as defaults to a shift.
create or replace function public.apply_operational_profile_to_shift(
  p_shift_id uuid
)
returns uuid
language plpgsql
security definer
set search_path = public
as $$
declare
  v_shift public.employee_shifts%rowtype;
  v_profile public.employee_site_operational_profiles%rowtype;
begin
  if not (public.is_owner() or public.is_global_manager() or public.is_manager()) then
    raise exception 'Not authorized to apply operational profiles to shifts';
  end if;

  select * into v_shift
  from public.employee_shifts
  where id = p_shift_id;

  if not found then
    raise exception 'Shift not found';
  end if;

  select * into v_profile
  from public.employee_site_operational_profiles
  where employee_id = v_shift.employee_id
    and site_id = v_shift.site_id
    and is_active = true
  limit 1;

  if not found then
    return p_shift_id;
  end if;

  update public.employee_shifts
     set operational_role = coalesce(employee_shifts.operational_role, v_profile.default_operational_role),
         checkin_site_id = coalesce(employee_shifts.checkin_site_id, v_profile.default_checkin_site_id),
         checkout_site_id = coalesce(employee_shifts.checkout_site_id, v_profile.default_checkout_site_id),
         updated_at = now()
   where id = p_shift_id;

  return p_shift_id;
end;
$$;

comment on function public.apply_operational_profile_to_shift(uuid) is
  'Applies employee/site operational defaults to a shift without overriding explicit shift values.';

-- 9) VISO permissions and nav entries for the future UI pages.
insert into public.apps (code, name, description, is_active)
values ('viso', 'VISO', 'Gerencia y auditoria', true)
on conflict (code)
do update set name = excluded.name,
              description = excluded.description,
              is_active = true,
              updated_at = now();

with viso_app as (
  select id from public.apps where code = 'viso' limit 1
), permissions(code, name, description) as (
  values
    ('operational_preview.view', 'Ver vista previa operativa', 'Permite simular navegación y permisos por app, sede y rol operativo.'),
    ('operational_points.manage', 'Gestionar puntos de marcacion', 'Permite crear y editar puntos físicos de check-in/check-out.'),
    ('site_operational_roles.manage', 'Gestionar roles operativos por sede', 'Permite activar/desactivar roles operativos disponibles en cada sede.'),
    ('employee_operational_profiles.manage', 'Gestionar perfiles operativos de trabajadores', 'Permite configurar rol operativo y puntos por trabajador y sede.')
)
insert into public.app_permissions (app_id, code, name, description, is_active)
select viso_app.id, permissions.code, permissions.name, permissions.description, true
from viso_app, permissions
on conflict (app_id, code)
do update set name = excluded.name,
              description = excluded.description,
              is_active = true,
              updated_at = now();

-- Grant these permissions to roles that already have global VISO access/admin-like permissions.
with viso_app as (
  select id from public.apps where code = 'viso' limit 1
), source_roles as (
  select distinct rp.role
  from public.role_permissions rp
  join public.app_permissions ap on ap.id = rp.permission_id
  join viso_app va on va.id = ap.app_id
  where rp.is_allowed = true
    and rp.scope_type = 'global'
    and ap.code in ('access', 'admin', 'settings.manage', 'team.manage', 'roles.manage')
  union
  select code
  from public.roles
  where code in ('owner', 'admin', 'administrator', 'administrador', 'gerente', 'manager', 'global_manager', 'super_admin')
), target_permissions as (
  select ap.id as permission_id
  from public.app_permissions ap
  join viso_app va on va.id = ap.app_id
  where ap.code in (
    'operational_preview.view',
    'operational_points.manage',
    'site_operational_roles.manage',
    'employee_operational_profiles.manage'
  )
)
insert into public.role_permissions (role, permission_id, scope_type, is_allowed)
select sr.role, tp.permission_id, 'global'::public.permission_scope_type, true
from source_roles sr
cross join target_permissions tp
where exists (select 1 from public.roles r where r.code = sr.role)
  and not exists (
    select 1
    from public.role_permissions existing
    where existing.role = sr.role
      and existing.permission_id = tp.permission_id
      and existing.scope_type = 'global'
      and existing.is_allowed = true
  );

insert into public.app_navigation_items (
  app_code,
  group_key,
  group_label,
  group_order,
  item_key,
  label,
  description,
  href,
  icon,
  required_permission_code,
  sort_order,
  is_active,
  opens_in_new_tab,
  metadata
)
values
  ('viso', 'operation', 'Operacion', 40, 'operational_preview', 'Vista previa operativa', 'Simula qué ve un rol operativo por app y sede.', '/operations/preview', 'Eye', 'viso.operational_preview.view', 10, true, false, '{}'::jsonb),
  ('viso', 'operation', 'Operacion', 40, 'operational_points', 'Puntos de marcacion', 'Configura puntos físicos ocultos para check-in y check-out.', '/operations/checkin-points', 'MapPin', 'viso.operational_points.manage', 20, true, false, '{}'::jsonb),
  ('viso', 'operation', 'Operacion', 40, 'site_operational_roles', 'Roles por sede', 'Define qué roles operativos están disponibles en cada sede.', '/operations/site-roles', 'ShieldCheck', 'viso.site_operational_roles.manage', 30, true, false, '{}'::jsonb),
  ('viso', 'operation', 'Operacion', 40, 'employee_operational_profiles', 'Trabajador por sede', 'Configura rol operativo y puntos de marcación por trabajador y sede.', '/operations/employee-profiles', 'Users', 'viso.employee_operational_profiles.manage', 40, true, false, '{}'::jsonb)
on conflict (app_code, item_key)
do update set
  group_key = excluded.group_key,
  group_label = excluded.group_label,
  group_order = excluded.group_order,
  label = excluded.label,
  description = excluded.description,
  href = excluded.href,
  icon = excluded.icon,
  required_permission_code = excluded.required_permission_code,
  sort_order = excluded.sort_order,
  is_active = true,
  opens_in_new_tab = excluded.opens_in_new_tab,
  metadata = excluded.metadata,
  updated_at = now();

-- 10) RLS and grants.
alter table public.site_operational_roles enable row level security;
alter table public.employee_site_operational_profiles enable row level security;

drop policy if exists site_operational_roles_select_staff on public.site_operational_roles;
create policy site_operational_roles_select_staff
on public.site_operational_roles
for select
to authenticated
using (public.is_active_staff());

drop policy if exists site_operational_roles_manage_ops_admin on public.site_operational_roles;
create policy site_operational_roles_manage_ops_admin
on public.site_operational_roles
for all
to authenticated
using (public.is_owner() or public.is_global_manager() or public.is_manager())
with check (public.is_owner() or public.is_global_manager() or public.is_manager());

drop policy if exists employee_site_operational_profiles_select_staff on public.employee_site_operational_profiles;
create policy employee_site_operational_profiles_select_staff
on public.employee_site_operational_profiles
for select
to authenticated
using (public.is_active_staff());

drop policy if exists employee_site_operational_profiles_manage_ops_admin on public.employee_site_operational_profiles;
create policy employee_site_operational_profiles_manage_ops_admin
on public.employee_site_operational_profiles
for all
to authenticated
using (public.is_owner() or public.is_global_manager() or public.is_manager())
with check (public.is_owner() or public.is_global_manager() or public.is_manager());

grant select on public.viso_operational_sites to authenticated;
grant select on public.viso_operational_checkin_points to authenticated;
grant select on public.viso_site_operational_roles to authenticated;
grant select on public.viso_employee_site_operational_profiles to authenticated;

grant select, insert, update, delete on public.site_operational_roles to authenticated;
grant select, insert, update, delete on public.employee_site_operational_profiles to authenticated;

grant execute on function public.upsert_operational_checkin_point(text, text, numeric, numeric, integer, text, text) to authenticated;
grant execute on function public.upsert_employee_site_operational_profile(uuid, uuid, text, uuid, uuid, boolean, text) to authenticated;
grant execute on function public.apply_operational_profile_to_shift(uuid) to authenticated;

commit;
