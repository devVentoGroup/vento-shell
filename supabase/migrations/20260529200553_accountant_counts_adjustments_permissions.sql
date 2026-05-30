begin;

with grants(role, app_code, permission_code, scope_type) as (
  values
    ('contador', 'nexo', 'inventory.counts', 'global'::public.permission_scope_type),
    ('contador', 'nexo', 'inventory.adjustments', 'global'::public.permission_scope_type)
)
insert into public.role_permissions (role, permission_id, scope_type)
select g.role, ap.id, g.scope_type
from grants g
join public.apps a on a.code = g.app_code
join public.app_permissions ap on ap.app_id = a.id and ap.code = g.permission_code
on conflict do nothing;

commit;
