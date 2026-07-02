create table if not exists public.operational_role_permissions (
  id uuid primary key default gen_random_uuid(),
  role_code text not null references public.operational_roles(code) on delete cascade,
  permission_code text not null,
  site_id uuid null references public.sites(id) on delete cascade,
  area_id uuid null references public.areas(id) on delete cascade,
  area_kind text null references public.area_kinds(code) on update cascade on delete restrict,
  is_allowed boolean not null default true,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now()),
  constraint operational_role_permissions_permission_code_not_blank check (
    btrim(permission_code) <> ''
  ),
  constraint operational_role_permissions_scope_consistent check (
    area_id is null or area_kind is null
  )
);

comment on table public.operational_role_permissions is
  'Permisos operativos configurables por rol de turno. No reemplaza role_permissions: aplica solo al contexto operativo activo.';

comment on column public.operational_role_permissions.role_code is
  'Codigo de public.operational_roles que se toma desde employee_shifts.operational_role.';

comment on column public.operational_role_permissions.permission_code is
  'Permiso completo, por ejemplo nexo.inventory.remissions.request.';

comment on column public.operational_role_permissions.site_id is
  'Scope opcional por sede. Null significa cualquier sede donde el rol sea valido.';

comment on column public.operational_role_permissions.area_id is
  'Scope opcional por area especifica. No se combina con area_kind.';

comment on column public.operational_role_permissions.area_kind is
  'Scope opcional por tipo de area. No se combina con area_id.';

create unique index if not exists operational_role_permissions_unique_scope_idx
  on public.operational_role_permissions (
    role_code,
    permission_code,
    coalesce(site_id, '00000000-0000-0000-0000-000000000000'::uuid),
    coalesce(area_id, '00000000-0000-0000-0000-000000000000'::uuid),
    coalesce(area_kind, '')
  );

create index if not exists operational_role_permissions_role_idx
  on public.operational_role_permissions (role_code);

create index if not exists operational_role_permissions_permission_idx
  on public.operational_role_permissions (permission_code);

create index if not exists operational_role_permissions_site_idx
  on public.operational_role_permissions (site_id)
  where site_id is not null;

create index if not exists operational_role_permissions_area_idx
  on public.operational_role_permissions (area_id)
  where area_id is not null;

create index if not exists operational_role_permissions_area_kind_idx
  on public.operational_role_permissions (area_kind)
  where area_kind is not null;

drop trigger if exists operational_role_permissions_touch_updated_at
  on public.operational_role_permissions;

create trigger operational_role_permissions_touch_updated_at
before update on public.operational_role_permissions
for each row execute function public.touch_updated_at();

alter table public.operational_role_permissions enable row level security;

drop policy if exists operational_role_permissions_select_staff
  on public.operational_role_permissions;

create policy operational_role_permissions_select_staff
on public.operational_role_permissions
for select
to authenticated
using (
  exists (
    select 1
    from public.employees e
    where e.id = (select auth.uid())
      and e.is_active = true
  )
);

drop policy if exists operational_role_permissions_manage_ops_admin
  on public.operational_role_permissions;

create policy operational_role_permissions_manage_ops_admin
on public.operational_role_permissions
for all
to authenticated
using (public.is_manager_or_owner())
with check (public.is_manager_or_owner());

grant select on public.operational_role_permissions to authenticated;
grant insert, update, delete on public.operational_role_permissions to authenticated;

with seed(role_code, permission_code) as (
  values
    ('operador_integral_satelite', 'nexo.access'),
    ('operador_integral_satelite', 'nexo.inventory.remissions'),
    ('operador_integral_satelite', 'nexo.inventory.remissions.request'),
    ('operador_integral_satelite', 'nexo.inventory.remissions.receive'),
    ('operador_integral_satelite', 'pulso.access'),
    ('operador_integral_satelite', 'pulso.pos.main'),

    ('cajero_satelite', 'nexo.access'),
    ('cajero_satelite', 'nexo.inventory.remissions'),
    ('cajero_satelite', 'nexo.inventory.remissions.request'),
    ('cajero_satelite', 'pulso.access'),
    ('cajero_satelite', 'pulso.pos.main'),

    ('barista_satelite', 'nexo.access'),
    ('barista_satelite', 'nexo.inventory.remissions'),
    ('barista_satelite', 'nexo.inventory.remissions.request'),

    ('cocinero_satelite', 'nexo.access'),
    ('cocinero_satelite', 'nexo.inventory.remissions'),
    ('cocinero_satelite', 'nexo.inventory.remissions.request'),

    ('bodeguero', 'nexo.access'),
    ('bodeguero', 'nexo.inventory.stock'),
    ('bodeguero', 'nexo.inventory.remissions'),
    ('bodeguero', 'nexo.inventory.remissions.prepare'),
    ('bodeguero', 'nexo.inventory.movements'),

    ('conductor_logistica', 'nexo.access'),
    ('conductor_logistica', 'nexo.inventory.remissions'),
    ('conductor_logistica', 'nexo.inventory.remissions.transit'),

    ('gerencia_operativa', 'nexo.access'),
    ('gerencia_operativa', 'nexo.inventory.remissions'),
    ('gerencia_operativa', 'nexo.inventory.remissions.request'),
    ('gerencia_operativa', 'nexo.inventory.remissions.prepare'),
    ('gerencia_operativa', 'nexo.inventory.remissions.receive'),
    ('gerencia_operativa', 'nexo.inventory.remissions.transit'),
    ('gerencia_operativa', 'nexo.inventory.remissions.cancel')
)
insert into public.operational_role_permissions (
  role_code,
  permission_code,
  is_allowed
)
select
  seed.role_code,
  seed.permission_code,
  true
from seed
where exists (
  select 1
  from public.operational_roles r
  where r.code = seed.role_code
)
on conflict do nothing;

notify pgrst, 'reload schema';
