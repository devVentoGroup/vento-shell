-- Assert the bodega tablet account has the exact minimum grants required by
-- the kiosk board and kiosk withdrawal flow.
--
-- This assertion is environment-aware: a clean database replay must not depend
-- on an Auth user or operational site being provisioned before migrations run.
-- When the kiosk account and its active site exist, the exact three required
-- NEXO grants remain mandatory and the migration fails closed if they are
-- incomplete.

do $$
declare
  v_user_id uuid;
  v_site_id uuid;
  v_permission_count integer;
begin
  select u.id
    into v_user_id
  from auth.users u
  where lower(u.email) = lower('bodega@ventogroup.co')
  limit 1;

  if v_user_id is null then
    raise notice 'Bodega kiosk grant assertion skipped: auth user bodega@ventogroup.co is not provisioned in this environment.';
    return;
  end if;

  select coalesce(es.selected_site_id, e.site_id)
    into v_site_id
  from public.employees e
  left join public.employee_settings es on es.employee_id = e.id
  where e.id = v_user_id
    and coalesce(e.is_active, true)
  limit 1;

  if v_site_id is null then
    raise notice 'Bodega kiosk grant assertion skipped: bodega@ventogroup.co has no active employee site in this environment.';
    return;
  end if;

  select count(distinct ap.code)
    into v_permission_count
  from public.employee_permissions ep
  join public.app_permissions ap on ap.id = ep.permission_id
  join public.apps a on a.id = ap.app_id
  where ep.employee_id = v_user_id
    and ep.scope_type = 'site'::public.permission_scope_type
    and ep.scope_site_id = v_site_id
    and ep.is_allowed
    and a.code = 'nexo'
    and ap.code in ('access', 'inventory.withdraw', 'inventory.transfers');

  if v_permission_count <> 3 then
    raise exception 'bodega@ventogroup.co kiosk grants incomplete. Expected 3, got %.', v_permission_count;
  end if;
end $$;
