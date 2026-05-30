create extension if not exists pgcrypto;

create table if not exists public.app_navigation_items (
  id uuid primary key default gen_random_uuid(),

  app_code text not null,
  group_key text not null,
  group_label text not null,
  group_order integer not null default 100,

  item_key text not null,
  label text not null,
  description text,
  href text not null,
  icon text,

  required_permission_code text not null,

  sort_order integer not null default 100,
  is_active boolean not null default true,
  opens_in_new_tab boolean not null default false,

  metadata jsonb not null default '{}'::jsonb,

  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),

  constraint app_navigation_items_app_item_key_unique unique (app_code, item_key),
  constraint app_navigation_items_app_href_unique unique (app_code, href),
  constraint app_navigation_items_app_code_check check (length(trim(app_code)) > 0),
  constraint app_navigation_items_group_key_check check (length(trim(group_key)) > 0),
  constraint app_navigation_items_item_key_check check (length(trim(item_key)) > 0),
  constraint app_navigation_items_href_check check (href like '/%' or href like 'http://%' or href like 'https://%'),
  constraint app_navigation_items_required_permission_code_check check (position('.' in required_permission_code) > 0)
);

create index if not exists app_navigation_items_app_active_order_idx
  on public.app_navigation_items (app_code, is_active, group_order, sort_order);

create index if not exists app_navigation_items_required_permission_code_idx
  on public.app_navigation_items (required_permission_code);

create or replace function public.set_app_navigation_items_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists trg_app_navigation_items_updated_at on public.app_navigation_items;

create trigger trg_app_navigation_items_updated_at
before update on public.app_navigation_items
for each row
execute function public.set_app_navigation_items_updated_at();

alter table public.app_navigation_items enable row level security;

drop policy if exists "Authenticated users can read app navigation items"
on public.app_navigation_items;

create policy "Authenticated users can read app navigation items"
on public.app_navigation_items
for select
to authenticated
using (is_active = true);

drop policy if exists "Service role can manage app navigation items"
on public.app_navigation_items;

create policy "Service role can manage app navigation items"
on public.app_navigation_items
for all
to service_role
using (true)
with check (true);

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
  is_active
)
values
  (
    'viso',
    'inicio',
    'Inicio',
    10,
    'panel',
    'Panel',
    'Resumen general',
    '/',
    'dashboard',
    'viso.access',
    10,
    true
  ),
  (
    'viso',
    'inicio',
    'Inicio',
    10,
    'accounting',
    'Contabilidad',
    'Costos e impuestos',
    '/accounting',
    'accounting',
    'viso.accounting.view',
    20,
    true
  ),

  (
    'viso',
    'libretas',
    'Libretas',
    20,
    'staff',
    'Trabajadores',
    'Personal y roles',
    '/staff',
    'users',
    'viso.staff.read',
    10,
    true
  ),
  (
    'viso',
    'libretas',
    'Libretas',
    20,
    'staff_schedule',
    'Horarios',
    'Planner semanal',
    '/staff/schedule',
    'calendar',
    'viso.staff.schedule.view',
    20,
    true
  ),
  (
    'viso',
    'libretas',
    'Libretas',
    20,
    'staff_calendar',
    'Calendario maestro',
    'Contratos, festivos y mantenimientos',
    '/staff/calendar',
    'calendar',
    'viso.staff.calendar.view',
    30,
    true
  ),
  (
    'viso',
    'libretas',
    'Libretas',
    20,
    'ops_audit',
    'Auditoría ops',
    'Áreas, LOCs y asignaciones',
    '/ops/audit',
    'dashboard',
    'viso.ops.audit.view',
    40,
    true
  ),
  (
    'viso',
    'libretas',
    'Libretas',
    20,
    'pass_users',
    'Usuarios Pass',
    'Clientes y lealtad',
    '/pass-users',
    'sparkles',
    'viso.pass_users.read',
    50,
    true
  ),
  (
    'viso',
    'libretas',
    'Libretas',
    20,
    'roles_permissions',
    'Permisos por rol',
    'Aplicaciones, pantallas y acciones',
    '/roles-permissions',
    'users',
    'viso.staff.permissions.manage',
    60,
    true
  ),

  (
    'viso',
    'negocios',
    'Negocios',
    30,
    'businesses',
    'Negocios',
    'Sedes y Vento Pass',
    '/businesses',
    'store',
    'viso.businesses.read',
    10,
    true
  ),
  (
    'viso',
    'negocios',
    'Negocios',
    30,
    'products',
    'Productos fidelización',
    'Canjes y recompensas',
    '/products',
    'package',
    'viso.pass_products.read',
    20,
    true
  ),
  (
    'viso',
    'negocios',
    'Negocios',
    30,
    'menu',
    'Menú comercial',
    'Catálogo comercial',
    '/menu',
    'menu',
    'viso.menu.read',
    30,
    true
  ),
  (
    'viso',
    'negocios',
    'Negocios',
    30,
    'commercial_categories',
    'Categorías comerciales',
    'Orden por satélite',
    '/commercial-categories',
    'menu',
    'viso.commercial_categories.read',
    40,
    true
  ),
  (
    'viso',
    'negocios',
    'Negocios',
    30,
    'delivery_rates',
    'Domicilios',
    'Tarifas por distancia',
    '/delivery-rates',
    'store',
    'viso.delivery_rates.read',
    50,
    true
  ),
  (
    'viso',
    'negocios',
    'Negocios',
    30,
    'vacancies',
    'Vacantes',
    'Portal de empleo',
    '/vacancies',
    'briefcase',
    'viso.vacancies.read',
    60,
    true
  ),
  (
    'viso',
    'negocios',
    'Negocios',
    30,
    'content_blocks',
    'Contenido Pass',
    'Textos y bloques de la app',
    '/content-blocks',
    'fileText',
    'viso.content_blocks.read',
    70,
    true
  ),
  (
    'viso',
    'negocios',
    'Negocios',
    30,
    'app_updates',
    'Actualización app',
    'Versiones y links Store',
    '/app-updates',
    'phone',
    'viso.app_updates.read',
    80,
    true
  ),
  (
    'viso',
    'negocios',
    'Negocios',
    30,
    'website_cms',
    'Website CMS',
    'Contenido de ventogroup.co',
    '/website-cms',
    'fileText',
    'viso.website_cms.read',
    90,
    true
  )
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
  is_active = excluded.is_active,
  updated_at = now();