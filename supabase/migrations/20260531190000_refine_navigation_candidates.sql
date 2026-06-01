-- =====================================================================================
-- VENTO OS / Navigation Registry
-- Migration: Refine navigation candidate rules and RPC
-- File: 20260530190000_refine_navigation_candidates.sql
--
-- Scope:
-- - Replaces upsert_app_screen_registry(...) with a version that receives:
--     navigation_kind
--     is_menu_candidate
--     parent_href
-- - Reclassifies current NEXO registry using the real sidebar as source of truth.
-- - Keeps existing menu items as menu candidates.
-- - Leaves only truly new relevant screens as "available to add" in VISO.
--
-- Design:
-- - app_screen_registry stores everything detected.
-- - app_navigation_items is the real sidebar.
-- - VISO should show "available to add" with:
--     app_screen_registry.is_menu_candidate = true
--     and no matching app_navigation_items row by app_code + href.
-- =====================================================================================

begin;

-- =====================================================================================
-- 1. Ensure classification columns exist
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

-- =====================================================================================
-- 2. Replace RPC with classification-aware version
-- =====================================================================================

drop function if exists public.upsert_app_screen_registry(
  text,
  text,
  text,
  text,
  text,
  text,
  text,
  integer,
  integer,
  text,
  text,
  text,
  text,
  text,
  text
);

create or replace function public.upsert_app_screen_registry(
  p_app_code text,
  p_href text,
  p_label text,
  p_description text default null,
  p_icon text default null,
  p_suggested_group_key text default null,
  p_suggested_group_label text default null,
  p_suggested_group_order integer default null,
  p_suggested_sort_order integer default null,
  p_required_permission_code text default null,
  p_permission_name text default null,
  p_permission_description text default null,
  p_source_path text default null,
  p_sync_source text default 'scanner',
  p_sync_hash text default null,
  p_navigation_kind text default 'menu',
  p_is_menu_candidate boolean default true,
  p_parent_href text default null
)
returns uuid
language plpgsql
security definer
set search_path = public
as $$
declare
  v_app_code text := lower(btrim(p_app_code));
  v_href text := case
    when left(btrim(p_href), 1) = '/' then btrim(p_href)
    else '/' || btrim(p_href)
  end;
  v_item_key text;
  v_registry_id uuid;

  v_app_id uuid;
  v_permission_code_full text := null;
  v_permission_code_local text := null;
  v_navigation_kind text := coalesce(nullif(btrim(p_navigation_kind), ''), 'menu');
begin
  if v_app_code = '' then
    raise exception 'app_code_required';
  end if;

  if v_href = '/' then
    raise exception 'href_must_not_be_root';
  end if;

  if btrim(coalesce(p_label, '')) = '' then
    raise exception 'label_required';
  end if;

  if v_navigation_kind not in ('menu', 'submenu', 'detail', 'action', 'internal', 'auth', 'hidden') then
    v_navigation_kind := 'internal';
  end if;

  v_item_key := public._navigation_slugify(v_href);
  v_permission_code_full := nullif(btrim(coalesce(p_required_permission_code, '')), '');

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
    sync_hash,
    navigation_kind,
    is_menu_candidate,
    parent_href,
    is_available,
    is_ignored,
    last_seen_at
  )
  values (
    v_app_code,
    v_item_key,
    btrim(p_label),
    nullif(btrim(coalesce(p_description, '')), ''),
    v_href,
    nullif(btrim(coalesce(p_icon, '')), ''),
    nullif(btrim(coalesce(p_suggested_group_key, '')), ''),
    nullif(btrim(coalesce(p_suggested_group_label, '')), ''),
    p_suggested_group_order,
    p_suggested_sort_order,
    v_permission_code_full,
    nullif(btrim(coalesce(p_permission_name, '')), ''),
    nullif(btrim(coalesce(p_permission_description, '')), ''),
    nullif(btrim(coalesce(p_source_path, '')), ''),
    nullif(btrim(coalesce(p_sync_source, '')), ''),
    nullif(btrim(coalesce(p_sync_hash, '')), ''),
    v_navigation_kind,
    coalesce(p_is_menu_candidate, true),
    nullif(btrim(coalesce(p_parent_href, '')), ''),
    true,
    false,
    now()
  )
  on conflict (app_code, href)
  do update set
    item_key = excluded.item_key,
    label = excluded.label,
    description = excluded.description,
    icon = excluded.icon,
    suggested_group_key = excluded.suggested_group_key,
    suggested_group_label = excluded.suggested_group_label,
    suggested_group_order = excluded.suggested_group_order,
    suggested_sort_order = excluded.suggested_sort_order,
    required_permission_code = excluded.required_permission_code,
    permission_name = excluded.permission_name,
    permission_description = excluded.permission_description,
    source_path = excluded.source_path,
    sync_source = excluded.sync_source,
    sync_hash = excluded.sync_hash,
    navigation_kind = excluded.navigation_kind,
    is_menu_candidate = excluded.is_menu_candidate,
    parent_href = excluded.parent_href,
    is_available = true,
    last_seen_at = now(),
    updated_at = now()
  returning id into v_registry_id;

  if v_permission_code_full is not null then
    select id
    into v_app_id
    from public.apps
    where code = v_app_code
    limit 1;

    if v_app_id is not null then
      if v_permission_code_full like v_app_code || '.%' then
        v_permission_code_local := substr(v_permission_code_full, length(v_app_code) + 2);
      else
        v_permission_code_local := v_permission_code_full;
      end if;

      insert into public.app_permissions (
        app_id,
        code,
        name,
        description,
        is_active
      )
      values (
        v_app_id,
        v_permission_code_local,
        coalesce(nullif(btrim(coalesce(p_permission_name, '')), ''), btrim(p_label)),
        coalesce(
          nullif(btrim(coalesce(p_permission_description, '')), ''),
          'Permite acceder a ' || btrim(p_label) || '.'
        ),
        true
      )
      on conflict (app_id, code)
      do update set
        name = coalesce(excluded.name, public.app_permissions.name),
        description = coalesce(excluded.description, public.app_permissions.description),
        is_active = true,
        updated_at = now();
    end if;
  end if;

  return v_registry_id;
end;
$$;

comment on function public.upsert_app_screen_registry(text, text, text, text, text, text, text, integer, integer, text, text, text, text, text, text, text, boolean, text) is
  'Upserts a detected app screen into the global registry with navigation classification and creates its permission definition when possible.';

grant execute on function public.upsert_app_screen_registry(text, text, text, text, text, text, text, integer, integer, text, text, text, text, text, text, text, boolean, text)
to authenticated, service_role;

-- =====================================================================================
-- 3. Reclassify existing NEXO records using app_navigation_items as source of truth
-- =====================================================================================

-- Safe base: detected but not menu.
update public.app_screen_registry
set
  navigation_kind = 'internal',
  is_menu_candidate = false,
  parent_href = null,
  updated_at = now()
where app_code = 'nexo';

-- Existing sidebar items stay as menu entries, even if they look like actions.
update public.app_screen_registry r
set
  navigation_kind = 'menu',
  is_menu_candidate = true,
  label = n.label,
  description = coalesce(n.description, r.description),
  icon = coalesce(n.icon, r.icon),
  suggested_group_key = n.group_key,
  suggested_group_label = n.group_label,
  suggested_group_order = n.group_order,
  suggested_sort_order = n.sort_order,
  required_permission_code = n.required_permission_code,
  permission_name = n.label,
  permission_description = coalesce(n.description, 'Permite acceder a ' || n.label || '.'),
  parent_href = null,
  updated_at = now()
from public.app_navigation_items n
where r.app_code = n.app_code
  and r.href = n.href
  and n.app_code = 'nexo';

-- New real candidate not yet in the current sidebar.
update public.app_screen_registry
set
  navigation_kind = 'menu',
  is_menu_candidate = true,
  label = 'Centros de costo',
  description = 'Administra centros de costo internos.',
  icon = 'building-2',
  suggested_group_key = 'configuration',
  suggested_group_label = 'Configuracion',
  suggested_group_order = 60,
  suggested_sort_order = 70,
  required_permission_code = 'nexo.cost_centers.view',
  permission_name = 'Centros de costo',
  permission_description = 'Permite acceder a Centros de costo.',
  parent_href = null,
  updated_at = now()
where app_code = 'nexo'
  and href in (
    '/inventory/cost-center',
    '/inventory/cost-centers',
    '/inventory/settings/cost-centers'
  );

-- Future internal billing candidates, only if pages already exist.
update public.app_screen_registry
set
  navigation_kind = 'menu',
  is_menu_candidate = true,
  suggested_group_key = 'configuration',
  suggested_group_label = 'Configuracion',
  suggested_group_order = 60,
  updated_at = now()
where app_code = 'nexo'
  and href in (
    '/inventory/settings/internal-invoices',
    '/inventory/settings/internal-variances',
    '/inventory/settings/internal-reports'
  );

-- Auth / hidden / generated bad root.
update public.app_screen_registry
set
  navigation_kind = case
    when href in ('/login', '/no-access') then 'auth'
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

-- Dynamic routes.
update public.app_screen_registry
set
  navigation_kind = 'detail',
  is_menu_candidate = false,
  parent_href = nullif(regexp_replace(href, '/\[[^/]+\].*$', ''), ''),
  updated_at = now()
where app_code = 'nexo'
  and href ~ '\[[^/]+\]'
  and not exists (
    select 1
    from public.app_navigation_items n
    where n.app_code = app_screen_registry.app_code
      and n.href = app_screen_registry.href
  );

-- Nested routes under menu modules become submenu/internal unless they already exist in sidebar.
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
  and not exists (
    select 1
    from public.app_navigation_items n
    where n.app_code = app_screen_registry.app_code
      and n.href = app_screen_registry.href
  );

-- Known module pages that are valid pages but should not be proposed as new sidebar entries for now.
update public.app_screen_registry
set
  navigation_kind = 'internal',
  is_menu_candidate = false,
  parent_href = null,
  updated_at = now()
where app_code = 'nexo'
  and href in (
    '/scanner',
    '/inventory/lpns',
    '/inventory/warehouse',
    '/printing/setup'
  )
  and not exists (
    select 1
    from public.app_navigation_items n
    where n.app_code = app_screen_registry.app_code
      and n.href = app_screen_registry.href
  );

-- Ensure permission definitions for real candidates exist.
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
    ('cost_centers.manage', 'Centros de costo - Gestionar', 'Crear y administrar centros de costo internos.')
) as permission(code, name, description)
on conflict (app_id, code)
do update set
  name = excluded.name,
  description = excluded.description,
  is_active = true,
  updated_at = now();

commit;

-- =====================================================================================
-- Validation
-- =====================================================================================

select
  'nexo_registry_summary' as check_name,
  navigation_kind,
  is_menu_candidate,
  count(*) as total
from public.app_screen_registry
where app_code = 'nexo'
group by navigation_kind, is_menu_candidate
order by is_menu_candidate desc, navigation_kind;

select
  'nexo_available_to_add' as check_name,
  r.label,
  r.href,
  r.suggested_group_key,
  r.suggested_group_label,
  r.suggested_sort_order,
  r.required_permission_code
from public.app_screen_registry r
where r.app_code = 'nexo'
  and r.is_available = true
  and r.is_ignored = false
  and r.is_menu_candidate = true
  and not exists (
    select 1
    from public.app_navigation_items n
    where n.app_code = r.app_code
      and n.href = r.href
  )
order by r.suggested_group_order, r.suggested_sort_order, r.label;

select
  'nexo_existing_menu_detected' as check_name,
  r.label,
  r.href,
  r.suggested_group_key,
  r.suggested_group_label,
  r.required_permission_code
from public.app_screen_registry r
where r.app_code = 'nexo'
  and exists (
    select 1
    from public.app_navigation_items n
    where n.app_code = r.app_code
      and n.href = r.href
  )
order by r.suggested_group_order, r.suggested_sort_order, r.label;
