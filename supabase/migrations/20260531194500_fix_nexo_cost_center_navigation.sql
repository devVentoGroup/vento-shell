-- =====================================================================================
-- VENTO OS / NEXO
-- Fix: ensure Cost Centers page is registered in sidebar/navigation
-- File: 20260530194500_fix_nexo_cost_center_navigation.sql
--
-- Real Next.js route:
--   /inventory/cost-center
--
-- Required page file:
--   src/app/inventory/cost-center/page.tsx
-- =====================================================================================

begin;

-- Ensure permission definitions exist.
with nexo_app as (
  select id
  from public.apps
  where code = 'nexo'
)
insert into public.app_permissions (app_id, code, name, description, is_active)
select
  nexo_app.id,
  permission.code,
  permission.name,
  permission.description,
  true
from nexo_app
cross join (
  values
    ('cost_centers.view', 'Centros de costo - Ver', 'Ver centros de costo y bandeja de valorización interna.'),
    ('cost_centers.manage', 'Centros de costo - Gestionar', 'Crear y administrar centros de costo internos.')
) as permission(code, name, description)
on conflict (app_id, code)
do update set
  name = excluded.name,
  description = excluded.description,
  is_active = true,
  updated_at = now();

-- Normalize registry row if present.
update public.app_screen_registry
set
  href = '/inventory/cost-center',
  label = 'Centros de costo',
  description = 'Administra centros de costo internos y remisiones valorizadas.',
  icon = 'building-2',
  suggested_group_key = 'configuration',
  suggested_group_label = 'Configuracion',
  suggested_group_order = 60,
  suggested_sort_order = 70,
  required_permission_code = 'nexo.cost_centers.view',
  permission_name = 'Centros de costo',
  permission_description = 'Permite acceder a Centros de costo.',
  navigation_kind = 'menu',
  is_menu_candidate = true,
  is_available = true,
  is_ignored = false,
  updated_at = now()
where app_code = 'nexo'
  and (
    href in ('/inventory/cost-center', '/inventory/cost-centers', '/inventory/settings/cost-centers')
    or item_key in ('inventory_cost_center', 'inventory_cost_centers', 'inventory_settings_cost_centers')
    or label ilike '%costo%'
  );

-- Insert registry row if missing.
insert into public.app_screen_registry (
  app_code,
  item_key,
  label,
  description,
  href,
  icon,
  suggested_group_key,
  suggested_group_label,
  suggested_group_order,
  suggested_sort_order,
  required_permission_code,
  permission_name,
  permission_description,
  source_path,
  sync_source,
  navigation_kind,
  is_menu_candidate,
  is_available,
  is_ignored
)
select
  'nexo',
  'inventory_cost_center',
  'Centros de costo',
  'Administra centros de costo internos y remisiones valorizadas.',
  '/inventory/cost-center',
  'building-2',
  'configuration',
  'Configuracion',
  60,
  70,
  'nexo.cost_centers.view',
  'Centros de costo',
  'Permite acceder a Centros de costo.',
  'src/app/inventory/cost-center/page.tsx',
  'manual-fix',
  'menu',
  true,
  true,
  false
where not exists (
  select 1
  from public.app_screen_registry
  where app_code = 'nexo'
    and href = '/inventory/cost-center'
);

-- Add or update sidebar item.
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
values (
  'nexo',
  'configuration',
  'Configuracion',
  60,
  'inventory_cost_center',
  'Centros de costo',
  'Centro de costos internos y remisiones valorizadas.',
  '/inventory/cost-center',
  'building-2',
  'nexo.cost_centers.view',
  70,
  true
)
on conflict (app_code, href)
do update set
  group_key = excluded.group_key,
  group_label = excluded.group_label,
  group_order = excluded.group_order,
  item_key = excluded.item_key,
  label = excluded.label,
  description = excluded.description,
  icon = excluded.icon,
  required_permission_code = excluded.required_permission_code,
  sort_order = excluded.sort_order,
  is_active = true;

commit;

select
  'nexo_cost_center_navigation' as check_name,
  app_code,
  group_key,
  group_label,
  label,
  href,
  required_permission_code,
  sort_order,
  is_active
from public.app_navigation_items
where app_code = 'nexo'
  and href = '/inventory/cost-center';

select
  'nexo_cost_center_registry' as check_name,
  app_code,
  label,
  href,
  required_permission_code,
  navigation_kind,
  is_menu_candidate,
  is_available,
  is_ignored
from public.app_screen_registry
where app_code = 'nexo'
  and href = '/inventory/cost-center';
