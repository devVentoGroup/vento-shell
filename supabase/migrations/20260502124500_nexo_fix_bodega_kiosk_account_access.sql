-- Hardening for the bodega tablet account.
-- The kiosk withdrawal page records an internal transfer, so the account needs
-- access, withdraw and transfers on its active bodega site.
--
-- Replay safety:
-- - Local database resets do not require operational Auth seed users to exist.
-- - If bodega@ventogroup.co is not provisioned, this data-specific hardening is skipped.
-- - If no active site can be resolved, this data-specific hardening is skipped.
-- - When the user and site do exist, the original provisioning behavior is preserved.

do $$
declare
  v_user_id uuid;
  v_employee_id uuid;
  v_site_id uuid;
begin
  select u.id
    into v_user_id
  from auth.users u
  where lower(trim(u.email)) = lower('bodega@ventogroup.co')
  limit 1;

  if v_user_id is null then
    raise notice 'Bodega kiosk hardening skipped: auth user bodega@ventogroup.co is not provisioned in this environment.';
    return;
  end if;

  select coalesce(es.site_id, e.site_id)
    into v_site_id
  from auth.users u
  left join public.employees e on e.id = u.id
  left join public.employee_sites es
    on es.employee_id = u.id
   and es.is_active
   and es.is_primary
  where u.id = v_user_id
  limit 1;

  if v_site_id is null then
    select il.site_id
      into v_site_id
    from public.inventory_locations il
    join public.sites s on s.id = il.site_id
    where il.is_active
      and (
        lower(coalesce(il.description, '')) in ('bodega principal', 'bodega')
        or lower(coalesce(il.code, '')) like '%bod%'
      )
    order by
      case when lower(coalesce(il.description, '')) = 'bodega principal' then 0 else 1 end,
      case when lower(coalesce(s.site_type::text, '')) = 'production_center' then 0 else 1 end,
      il.created_at asc
    limit 1;
  end if;

  if v_site_id is null then
    select s.id
      into v_site_id
    from public.sites s
    where coalesce(s.is_active, true)
    order by
      case when lower(coalesce(s.site_type::text, '')) = 'production_center' then 0 else 1 end,
      s.created_at asc
    limit 1;
  end if;

  if v_site_id is null then
    raise notice 'Bodega kiosk hardening skipped: no active site is available in this environment.';
    return;
  end if;

  insert into public.employees (
    id,
    site_id,
    role,
    full_name,
    alias,
    is_active
  )
  values (
    v_user_id,
    v_site_id,
    'bodeguero',
    'Quiosco Bodega',
    'Bodega',
    true
  )
  on conflict (id) do update
    set site_id = excluded.site_id,
        role = case
          when public.employees.role in ('propietario', 'gerente_general', 'gerente') then public.employees.role
          else 'bodeguero'
        end,
        is_active = true,
        updated_at = now();

  v_employee_id := v_user_id;

  update public.employee_sites
     set is_primary = false
   where employee_id = v_employee_id
     and site_id <> v_site_id
     and is_primary;

  insert into public.employee_sites (employee_id, site_id, is_primary, is_active)
  values (v_employee_id, v_site_id, true, true)
  on conflict (employee_id, site_id) do update
    set is_primary = true,
        is_active = true;

  insert into public.employee_settings (employee_id, selected_site_id, selected_area_id, updated_at)
  values (v_employee_id, v_site_id, null, now())
  on conflict (employee_id) do update
    set selected_site_id = excluded.selected_site_id,
        selected_area_id = null,
        updated_at = now();

  insert into public.employee_permissions (
    employee_id,
    permission_id,
    is_allowed,
    scope_type,
    scope_site_id
  )
  select
    v_employee_id,
    ap.id,
    true,
    'site'::public.permission_scope_type,
    v_site_id
  from public.app_permissions ap
  join public.apps a on a.id = ap.app_id
  where a.code = 'nexo'
    and ap.code in ('access', 'inventory.withdraw', 'inventory.transfers')
  on conflict (
    employee_id,
    permission_id,
    scope_type,
    scope_site_id,
    scope_area_id,
    scope_site_type,
    scope_area_kind
  )
  do update set is_allowed = true;
end $$;
