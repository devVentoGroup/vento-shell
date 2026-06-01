-- =====================================================================================
-- VENTO OS / Navigation Registry
-- Migration: Classify detected screens and avoid sidebar pollution
-- File: 20260530185000_classify_app_screen_registry.sql
--
-- Scope:
-- - Adds navigation classification fields to app_screen_registry.
-- - Classifies existing NEXO detected routes.
-- - Keeps detail/action/auth/internal pages out of the sidebar candidate list.
-- - Fixes "Cost Center" naming/permission convention.
--
-- Result:
-- - app_screen_registry still tracks all detected pages.
-- - Only is_menu_candidate = true should be shown in VISO as "available to add".
-- - app_navigation_items remains the real sidebar source.
-- =====================================================================================

begin;

-- =====================================================================================
-- 1. Structural fields
-- =====================================================================================

alter table public.app_screen_registry
  add column if not exists navigation_kind text not null default 'menu',
  add column if not exists is_menu_candidate boolean not null default true,
  add column if not exists parent_href text null;

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'app_screen_registry_navigation_kind_check'
      and conrelid = 'public.app_screen_registry'::regclass
  ) then
    alter table public.app_screen_registry
      add constraint app_screen_registry_navigation_kind_check
      check (
        navigation_kind in (
          'menu',
          'submenu',
          'detail',
          'action',
          'internal',
          'auth',
          'hidden'
        )
      ) not valid;
  end if;
end $$;

create index if not exists app_screen_registry_menu_candidates_idx
  on public.app_screen_registry (
    app_code,
    is_menu_candidate,
    is_available,
    is_ignored,
    suggested_group_order,
    suggested_sort_order,
    label
  );

comment on column public.app_screen_registry.navigation_kind is
  'Clasificacion de la pantalla detectada: menu, submenu, detail, action, internal, auth o hidden.';

comment on column public.app_screen_registry.is_menu_candidate is
  'Indica si VISO debe mostrar esta pantalla como candidata para agregar al sidebar.';

comment on column public.app_screen_registry.parent_href is
  'Ruta padre funcional cuando la pantalla es detalle, accion o subpantalla contenida dentro de otra.';

-- =====================================================================================
-- 2. Reset current NEXO classification to safe defaults
-- =====================================================================================

update public.app_screen_registry
set
  navigation_kind = 'menu',
  is_menu_candidate = true,
  parent_href = null,
  updated_at = now()
where app_code = 'nexo';

-- =====================================================================================
-- 3. Normalize known naming and permissions
-- =====================================================================================

update public.app_screen_registry
set
  label = 'Centros de costo',
  description = 'Administra centros de costo internos.',
  icon = 'building-2',
  suggested_group_key = 'configuration',
  suggested_group_label = 'Configuracion',
  suggested_group_order = 60,
  required_permission_code = 'nexo.cost_centers.view',
  permission_name = 'Centros de costo',
  permission_description = 'Permite acceder a Centros de costo.',
  updated_at = now()
where app_code = 'nexo'
  and href in (
    '/inventory/cost-center',
    '/inventory/cost-centers',
    '/inventory/settings/cost-centers'
  );

update public.app_screen_registry
set
  label = 'Precios internos',
  description = 'Administra precios internos por producto y satelite.',
  icon = 'badge-dollar-sign',
  suggested_group_key = 'configuration',
  suggested_group_label = 'Configuracion',
  suggested_group_order = 60,
  required_permission_code = 'nexo.internal_prices.view',
  permission_name = 'Precios internos',
  permission_description = 'Permite acceder a Precios internos.',
  updated_at = now()
where app_code = 'nexo'
  and href = '/inventory/settings/internal-prices';

-- Ensure corrected permissions exist as definitions.
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
    ('cost_centers.view', 'Centros de costo - Ver', 'Ver centros de costo internos.'),
    ('internal_prices.view', 'Precios internos - Ver', 'Ver listas de precios internos.')
) as permission(code, name, description)
on conflict (app_id, code)
do update set
  name = excluded.name,
  description = excluded.description,
  is_active = true,
  updated_at = now();

-- =====================================================================================
-- 4. Classify pages that must never be sidebar candidates
-- =====================================================================================

-- Auth / access / generated root bug.
update public.app_screen_registry
set
  navigation_kind = case
    when href = '/login' then 'auth'
    when href = '/no-access' then 'auth'
    else 'hidden'
  end,
  is_menu_candidate = false,
  parent_href = null,
  updated_at = now()
where app_code = 'nexo'
  and (
    href in ('/login', '/no-access', '/page.tsx')
    or href like '/_hidden_%'
    or href like '/api/%'
  );

-- Shortlink / kiosk routes are operational runtime routes, not sidebar entries.
update public.app_screen_registry
set
  navigation_kind = 'internal',
  is_menu_candidate = false,
  parent_href = null,
  updated_at = now()
where app_code = 'nexo'
  and (
    href like '/kiosk/%'
    or href like '/l/%'
  );

-- Dynamic detail routes.
update public.app_screen_registry
set
  navigation_kind = 'detail',
  is_menu_candidate = false,
  parent_href = nullif(regexp_replace(href, '/\[[^/]+\].*$', ''), ''),
  updated_at = now()
where app_code = 'nexo'
  and href ~ '\[[^/]+\]';

-- Create/new/edit/action pages.
update public.app_screen_registry
set
  navigation_kind = 'action',
  is_menu_candidate = false,
  parent_href = nullif(regexp_replace(href, '/(new|create|edit|prepare|transit|assign-location|open|print|preview|import|export)$', ''), ''),
  updated_at = now()
where app_code = 'nexo'
  and href ~ '/(new|create|edit|prepare|transit|assign-location|open|print|preview|import|export)$';

-- Nested utility pages under a parent module.
update public.app_screen_registry
set
  navigation_kind = 'submenu',
  is_menu_candidate = false,
  parent_href = case
    when href like '/inventory/catalog/%' then '/inventory/catalog'
    when href like '/inventory/count-initial/%' then '/inventory/count-initial'
    when href like '/inventory/locations/%' then '/inventory/locations'
    when href like '/inventory/remissions/%' then '/inventory/remissions'
    when href like '/inventory/stock/%' then '/inventory/stock'
    else nullif(regexp_replace(href, '/[^/]+$', ''), '')
  end,
  updated_at = now()
where app_code = 'nexo'
  and (
    href like '/inventory/catalog/%'
    or href like '/inventory/count-initial/%'
    or href like '/inventory/locations/%'
    or href like '/inventory/remissions/%'
    or href like '/inventory/stock/%'
  )
  and href not like '/inventory/settings/%'
  and href not in (
    '/inventory/catalog',
    '/inventory/count-initial',
    '/inventory/locations',
    '/inventory/remissions',
    '/inventory/stock'
  );

-- =====================================================================================
-- 5. Explicit sidebar candidates for NEXO
-- =====================================================================================

-- Keep only module entrypoints and settings entrypoints as sidebar candidates.
update public.app_screen_registry
set
  is_menu_candidate = case
    when href in (
      '/scanner',
      '/inventory/adjust',
      '/inventory/catalog',
      '/inventory/cost-center',
      '/inventory/cost-centers',
      '/inventory/count-initial',
      '/inventory/entries',
      '/inventory/locations',
      '/inventory/lpns',
      '/inventory/movements',
      '/inventory/production-batches',
      '/inventory/remissions',
      '/inventory/settings/categories',
      '/inventory/settings/internal-prices',
      '/inventory/settings/remissions',
      '/inventory/settings/sites',
      '/inventory/settings/supply-routes',
      '/inventory/settings/units',
      '/inventory/stock',
      '/inventory/transfers',
      '/inventory/warehouse',
      '/inventory/withdraw',
      '/printing/designer',
      '/printing/jobs',
      '/printing/setup'
    ) then true
    else false
  end,
  navigation_kind = case
    when href in (
      '/scanner',
      '/inventory/adjust',
      '/inventory/catalog',
      '/inventory/cost-center',
      '/inventory/cost-centers',
      '/inventory/count-initial',
      '/inventory/entries',
      '/inventory/locations',
      '/inventory/lpns',
      '/inventory/movements',
      '/inventory/production-batches',
      '/inventory/remissions',
      '/inventory/settings/categories',
      '/inventory/settings/internal-prices',
      '/inventory/settings/remissions',
      '/inventory/settings/sites',
      '/inventory/settings/supply-routes',
      '/inventory/settings/units',
      '/inventory/stock',
      '/inventory/transfers',
      '/inventory/warehouse',
      '/inventory/withdraw',
      '/printing/designer',
      '/printing/jobs',
      '/printing/setup'
    ) then 'menu'
    else navigation_kind
  end,
  updated_at = now()
where app_code = 'nexo'
  and navigation_kind not in ('auth', 'hidden');

-- =====================================================================================
-- 6. Validation
-- =====================================================================================

commit;

select
  'nexo_registry_classification_summary' as check_name,
  navigation_kind,
  is_menu_candidate,
  count(*) as total
from public.app_screen_registry
where app_code = 'nexo'
group by navigation_kind, is_menu_candidate
order by is_menu_candidate desc, navigation_kind;

select
  'nexo_menu_candidates' as check_name,
  label,
  href,
  suggested_group_key,
  suggested_group_label,
  required_permission_code
from public.app_screen_registry
where app_code = 'nexo'
  and is_menu_candidate = true
  and is_available = true
  and is_ignored = false
order by suggested_group_order, suggested_sort_order, label;

select
  'nexo_non_menu_detected' as check_name,
  navigation_kind,
  label,
  href,
  parent_href
from public.app_screen_registry
where app_code = 'nexo'
  and is_menu_candidate = false
order by navigation_kind, href;
