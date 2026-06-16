-- =====================================================================================
-- VENTO OS / NUMERA
-- Correction: remove Numera grants that were not explicitly defined.
--
-- Propietario and gerente_general keep the ecosystem baseline from permissions_core.
-- Other roles must be assigned intentionally from VISO > Permisos por rol.
-- =====================================================================================

begin;

delete from public.role_permissions rp
using public.app_permissions ap
join public.apps a on a.id = ap.app_id
where a.code = 'numera'
  and rp.permission_id = ap.id
  and rp.role in ('gerente', 'contador');

commit;

select
  'numera_role_grants_after_correction' as check_name,
  rp.role,
  count(*) as permissions
from public.role_permissions rp
join public.app_permissions ap on ap.id = rp.permission_id
join public.apps a on a.id = ap.app_id
where a.code = 'numera'
group by rp.role
order by rp.role;