-- Give the bodega kiosk account the minimum NEXO permissions needed to open
-- and execute withdrawals in its assigned site(s).

do $$
declare
  v_employee_id uuid;
begin
  select e.id
    into v_employee_id
  from public.employees e
  join auth.users u on u.id = e.id
  where lower(u.email) = lower('bodega@ventogroup.co')
    and coalesce(e.is_active, true)
  limit 1;

  if v_employee_id is null then
    raise notice 'bodega@ventogroup.co has no active employee row; skipping kiosk withdraw grants.';
    return;
  end if;

  insert into public.employee_permissions (
    employee_id,
    permission_id,
    is_allowed,
    scope_type,
    scope_site_id
  )
  select distinct
    v_employee_id,
    ap.id,
    true,
    'site'::public.permission_scope_type,
    site_scope.site_id
  from public.app_permissions ap
  join public.apps a on a.id = ap.app_id
  join lateral (
    select es.site_id
    from public.employee_sites es
    where es.employee_id = v_employee_id
      and es.is_active

    union

    select e.site_id
    from public.employees e
    where e.id = v_employee_id
  ) site_scope on site_scope.site_id is not null
  where a.code = 'nexo'
    and ap.code in ('access', 'inventory.withdraw')
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
