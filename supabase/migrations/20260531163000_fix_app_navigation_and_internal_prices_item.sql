-- =====================================================================================
-- VENTO / VISO + NEXO
-- Migration: Fix App Navigation URL and register NEXO internal prices screen
-- File: 20260530181500_fix_app_navigation_and_internal_prices_item.sql
--
-- Scope:
-- - Fix incorrect VISO navigation hrefs that point to app_navigation or _hidden_ routes.
-- - Ensure the VISO "Navegacion de apps" item points to /app-navigation.
-- - Register the NEXO "Precios internos" screen in app_navigation_items.
--
-- Notes:
-- - The real VISO route is /app-navigation because the page lives in
--   vento-viso/src/app/app-navigation/page.tsx.
-- - The NEXO internal prices page route is expected to be
--   /inventory/settings/internal-prices.
-- - This migration is idempotent.
-- =====================================================================================

begin;

-- 1) Fix old/bad VISO hrefs that cause 404.
update public.app_navigation_items
set
  href = '/app-navigation',
  item_key = coalesce(nullif(item_key, ''), 'app_navigation'),
  label = coalesce(nullif(label, ''), 'Navegación de apps'),
  description = coalesce(nullif(description, ''), 'Administra la visibilidad y el orden del menú lateral.'),
  group_key = coalesce(nullif(group_key, ''), 'administracion'),
  group_label = coalesce(nullif(group_label, ''), 'Administración'),
  group_order = coalesce(group_order, 90),
  sort_order = coalesce(sort_order, 80),
  required_permission_code = coalesce(nullif(required_permission_code, ''), 'staff.permissions.manage'),
  is_active = true
where app_code = 'viso'
  and (
    href ilike '%app_navigation%'
    or href ilike '%app-navigation%'
    or label ilike '%naveg%'
  );

-- 2) Ensure VISO navigation admin exists even if no previous item was found.
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
  'viso',
  'administracion',
  'Administración',
  90,
  'app_navigation',
  'Navegación de apps',
  'Administra la visibilidad y el orden del menú lateral.',
  '/app-navigation',
  'menu',
  'staff.permissions.manage',
  80,
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

-- 3) Register NEXO internal prices screen.
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
  'configuracion',
  'Configuración',
  80,
  'settings_internal_prices',
  'Precios internos',
  'Centro de costos y precios internos',
  '/inventory/settings/internal-prices',
  'settings',
  'nexo.internal_prices.view',
  100,
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

-- =====================================================================================
-- Validation
-- =====================================================================================

select
  'viso_app_navigation_fixed' as check_name,
  app_code,
  item_key,
  label,
  href,
  group_label,
  required_permission_code,
  is_active
from public.app_navigation_items
where app_code = 'viso'
  and href = '/app-navigation';

select
  'nexo_internal_prices_registered' as check_name,
  app_code,
  item_key,
  label,
  description,
  href,
  group_label,
  required_permission_code,
  is_active
from public.app_navigation_items
where app_code = 'nexo'
  and href = '/inventory/settings/internal-prices';
