-- =====================================================================================
-- VENTO OS
-- Migration: Global app screen registry for automatic navigation sync
-- File: 20260530183500_app_screen_registry.sql
--
-- Scope:
-- - Creates a central registry of screens detected by each web app scanner.
-- - Keeps detected screens separate from active sidebar navigation.
-- - Allows VISO to show available screens not yet added to the menu.
-- - Provides helper functions to upsert detected screens and promote them to app_navigation_items.
--
-- Important:
-- - This does NOT assign new permissions to roles.
-- - It only creates permission definitions in app_permissions.
-- - Role assignment remains controlled by VISO permission matrix.
-- =====================================================================================

begin;

create table if not exists public.app_screen_registry (
  id uuid primary key default gen_random_uuid(),

  app_code text not null,
  item_key text not null,

  label text not null,
  description text null,
  href text not null,
  icon text null,

  suggested_group_key text null,
  suggested_group_label text null,
  suggested_group_order integer null,
  suggested_sort_order integer null,

  required_permission_code text null,
  permission_name text null,
  permission_description text null,

  source_path text null,
  sync_source text not null default 'scanner',
  sync_hash text null,

  is_available boolean not null default true,
  is_ignored boolean not null default false,

  first_seen_at timestamptz not null default now(),
  last_seen_at timestamptz not null default now(),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),

  constraint app_screen_registry_app_code_not_blank check (btrim(app_code) <> ''),
  constraint app_screen_registry_item_key_not_blank check (btrim(item_key) <> ''),
  constraint app_screen_registry_label_not_blank check (btrim(label) <> ''),
  constraint app_screen_registry_href_not_blank check (btrim(href) <> ''),
  constraint app_screen_registry_href_starts_with_slash check (left(href, 1) = '/')
);

create unique index if not exists app_screen_registry_app_item_uidx
  on public.app_screen_registry (app_code, item_key);

create unique index if not exists app_screen_registry_app_href_uidx
  on public.app_screen_registry (app_code, href);

create index if not exists app_screen_registry_app_available_idx
  on public.app_screen_registry (
    app_code,
    is_available,
    is_ignored,
    suggested_group_order,
    suggested_sort_order
  );

create index if not exists app_screen_registry_permission_idx
  on public.app_screen_registry (required_permission_code)
  where required_permission_code is not null;

comment on table public.app_screen_registry is
  'Catalogo global de pantallas detectadas por scanners de las apps web. La visibilidad real del sidebar sigue en app_navigation_items.';

comment on column public.app_screen_registry.required_permission_code is
  'Codigo completo recomendado para acceso a la pantalla, por ejemplo nexo.cost_centers.view.';

comment on column public.app_screen_registry.source_path is
  'Ruta de archivo detectada por scanner, por ejemplo src/app/inventory/settings/cost-centers/page.tsx.';

drop trigger if exists trg_app_screen_registry_updated_at on public.app_screen_registry;
create trigger trg_app_screen_registry_updated_at
before update on public.app_screen_registry
for each row execute function _set_updated_at();

alter table public.app_screen_registry enable row level security;

drop policy if exists app_screen_registry_select_permission on public.app_screen_registry;
create policy app_screen_registry_select_permission
on public.app_screen_registry
for select
to authenticated
using (
  has_permission('viso.staff.permissions.manage')
  or has_permission('viso.app_navigation.manage')
  or has_permission('staff.permissions.manage')
  or is_owner()
  or is_global_manager()
);

drop policy if exists app_screen_registry_write_permission on public.app_screen_registry;
create policy app_screen_registry_write_permission
on public.app_screen_registry
for all
to authenticated
using (
  has_permission('viso.staff.permissions.manage')
  or has_permission('viso.app_navigation.manage')
  or has_permission('staff.permissions.manage')
  or is_owner()
  or is_global_manager()
)
with check (
  has_permission('viso.staff.permissions.manage')
  or has_permission('viso.app_navigation.manage')
  or has_permission('staff.permissions.manage')
  or is_owner()
  or is_global_manager()
);

drop policy if exists app_screen_registry_service_role on public.app_screen_registry;
create policy app_screen_registry_service_role
on public.app_screen_registry
for all
to service_role
using (true)
with check (true);

create or replace function public._navigation_slugify(p_value text)
returns text
language sql
immutable
set search_path = public
as $$
  select coalesce(
    nullif(
      regexp_replace(
        regexp_replace(
          lower(
            translate(
              btrim(coalesce(p_value, '')),
              'áéíóúÁÉÍÓÚñÑüÜ',
              'aeiouAEIOUnNuU'
            )
          ),
          '[^a-z0-9]+',
          '_',
          'g'
        ),
        '^_+|_+$',
        '',
        'g'
      ),
      ''
    ),
    'item'
  );
$$;

comment on function public._navigation_slugify(text) is
  'Internal helper to normalize labels/routes into item keys.';

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
  p_sync_hash text default null
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

comment on function public.upsert_app_screen_registry(text, text, text, text, text, text, text, integer, integer, text, text, text, text, text, text) is
  'Upserts a detected app screen into the global registry and creates its permission definition when possible.';

grant execute on function public.upsert_app_screen_registry(text, text, text, text, text, text, text, integer, integer, text, text, text, text, text, text)
to authenticated, service_role;

create or replace function public.promote_app_screen_to_navigation(
  p_registry_id uuid,
  p_group_key text,
  p_group_label text,
  p_group_order integer,
  p_sort_order integer default 100,
  p_is_active boolean default true
)
returns uuid
language plpgsql
security definer
set search_path = public
as $$
declare
  v_screen record;
  v_item_id uuid;
  v_group_key text := nullif(btrim(coalesce(p_group_key, '')), '');
  v_group_label text := nullif(btrim(coalesce(p_group_label, '')), '');
begin
  if not (
    has_permission('viso.staff.permissions.manage')
    or has_permission('viso.app_navigation.manage')
    or has_permission('staff.permissions.manage')
    or is_owner()
    or is_global_manager()
    or current_user = 'service_role'
    or current_setting('request.jwt.claim.role', true) = 'service_role'
  ) then
    raise exception 'permission_denied_app_navigation_manage';
  end if;

  select *
  into v_screen
  from public.app_screen_registry
  where id = p_registry_id
    and is_available = true
    and is_ignored = false;

  if not found then
    raise exception 'screen_not_found_or_not_available';
  end if;

  if v_group_key is null then
    v_group_key := coalesce(v_screen.suggested_group_key, 'configuration');
  end if;

  if v_group_label is null then
    v_group_label := coalesce(v_screen.suggested_group_label, 'Configuracion');
  end if;

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
    v_screen.app_code,
    v_group_key,
    v_group_label,
    p_group_order,
    v_screen.item_key,
    v_screen.label,
    v_screen.description,
    v_screen.href,
    coalesce(v_screen.icon, 'settings'),
    v_screen.required_permission_code,
    p_sort_order,
    p_is_active
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
    is_active = excluded.is_active
  returning id into v_item_id;

  return v_item_id;
end;
$$;

comment on function public.promote_app_screen_to_navigation(uuid, text, text, integer, integer, boolean) is
  'Promotes a detected screen from app_screen_registry into app_navigation_items using selected group/order/visibility.';

grant execute on function public.promote_app_screen_to_navigation(uuid, text, text, integer, integer, boolean)
to authenticated, service_role;

with viso_app as (
  select id
  from public.apps
  where code = 'viso'
)
insert into public.app_permissions (app_id, code, name, description, is_active)
select
  viso_app.id,
  permission.code,
  permission.name,
  permission.description,
  true
from viso_app
cross join (
  values
    ('app_navigation.manage', 'Navegacion de apps - Gestionar', 'Administrar catalogo, visibilidad y orden de pantallas por app.')
) as permission(code, name, description)
on conflict (app_id, code)
do update set
  name = excluded.name,
  description = excluded.description,
  is_active = true,
  updated_at = now();

commit;

select
  'app_screen_registry_table' as check_name,
  table_name
from information_schema.tables
where table_schema = 'public'
  and table_name = 'app_screen_registry';

select
  'app_screen_registry_functions' as check_name,
  p.proname as function_name,
  pg_get_function_arguments(p.oid) as arguments,
  pg_get_function_result(p.oid) as result_type
from pg_proc p
join pg_namespace n
  on n.oid = p.pronamespace
where n.nspname = 'public'
  and p.proname in (
    'upsert_app_screen_registry',
    'promote_app_screen_to_navigation',
    '_navigation_slugify'
  )
order by p.proname;

select
  'viso_navigation_permission' as check_name,
  a.code as app_code,
  ap.code as permission_code,
  ap.name,
  ap.is_active
from public.app_permissions ap
join public.apps a
  on a.id = ap.app_id
where a.code = 'viso'
  and ap.code = 'app_navigation.manage';
