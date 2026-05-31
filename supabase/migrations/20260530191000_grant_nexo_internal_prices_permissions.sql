begin;

-- Grant NEXO internal price permissions to the roles that should manage
-- transfer prices between production centers and satellites.
--
-- The foundation migration created the app_permissions rows, but those
-- permissions still need to be assigned to roles through role_permissions.

with grants(role, app_code, permission_code, scope_type) as (
  values
    ('propietario', 'nexo', 'internal_prices.view', 'global'::public.permission_scope_type),
    ('propietario', 'nexo', 'internal_prices.manage', 'global'::public.permission_scope_type),
    ('gerente_general', 'nexo', 'internal_prices.view', 'global'::public.permission_scope_type),
    ('gerente_general', 'nexo', 'internal_prices.manage', 'global'::public.permission_scope_type)
)
insert into public.role_permissions (role, permission_id, scope_type)
select g.role, ap.id, g.scope_type
from grants g
join public.apps a
  on a.code = g.app_code
join public.app_permissions ap
  on ap.app_id = a.id
 and ap.code = g.permission_code
on conflict do nothing;

commit;

-- Validation query
select
  rp.role,
  a.code as app_code,
  ap.code as permission_code,
  rp.scope_type
from public.role_permissions rp
join public.app_permissions ap
  on ap.id = rp.permission_id
join public.apps a
  on a.id = ap.app_id
where a.code = 'nexo'
  and ap.code in ('internal_prices.view', 'internal_prices.manage')
order by rp.role, ap.code;
