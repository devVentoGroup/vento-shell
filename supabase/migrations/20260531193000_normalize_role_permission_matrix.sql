-- =====================================================================================
-- VENTO OS / VISO
-- Migration: Normalize role permission matrix
-- File: 20260530193000_normalize_role_permission_matrix.sql
--
-- V4 FIX:
-- - No implicit type inference for scope columns.
-- - Every scoped null is explicitly cast:
--     scope_site_id   -> null::uuid
--     scope_area_id   -> null::uuid
--     scope_site_type -> null::public.site_type
--     scope_area_kind -> null::text
-- - Every global scope is explicitly cast:
--     'global'::public.permission_scope_type
--
-- Real schema used by VISO:
-- - roles.code
-- - roles.name
-- - roles.is_active
-- - role_permissions.role
-- - role_permissions.permission_id
-- - role_permissions.is_allowed
-- - role_permissions.scope_type
-- - role_permissions.scope_site_id
-- - role_permissions.scope_area_id
-- - role_permissions.scope_site_type
-- - role_permissions.scope_area_kind
--
-- Policy:
-- - Propietario: all active permissions, global.
-- - Gerente general: all active permissions, global.
-- - Gerente: important operational / managerial permissions.
-- - Asistente administrativo: catalog/product/staff/procurement/admin setup.
-- - Contador: accounting/internal billing/cost/report/procurement/value permissions.
--
-- Notes:
-- - Does not create roles.
-- - Matches target roles by code/name.
-- - Deletes and rebuilds permissions only for matched target roles.
-- - Inserts only allowed rows.
-- =====================================================================================

begin;

drop table if exists _target_roles;
drop table if exists _active_permissions;
drop table if exists _permission_grants;

-- =====================================================================================
-- 1. Identify target roles by code/name
-- =====================================================================================

create temp table _target_roles as
select
  r.code as role,
  r.name,
  case
    when lower(r.code) in ('owner', 'propietario', 'owners')
      or lower(r.name) like '%propiet%' then 'owner'

    when lower(r.code) in ('general_manager', 'gerente_general', 'gerencia_general')
      or lower(r.name) like '%gerente general%'
      or lower(r.name) like '%gerencia general%' then 'general_manager'

    when (
      lower(r.code) in ('manager', 'gerente', 'site_manager', 'gerente_sede')
      or lower(r.name) = 'gerente'
      or lower(r.name) like '%gerente de sede%'
      or lower(r.name) like '%gerente sede%'
    )
      and lower(r.name) not like '%general%'
      and lower(r.code) not like '%general%' then 'manager'

    when lower(r.code) in ('admin_assistant', 'assistant_admin', 'asistente_administrativo', 'asistente_admin')
      or lower(r.name) like '%asistente administrativo%'
      or lower(r.name) like '%auxiliar administrativo%' then 'admin_assistant'

    when lower(r.code) in ('accountant', 'contador', 'contabilidad')
      or lower(r.name) like '%contador%'
      or lower(r.name) like '%contabilidad%' then 'accountant'

    else null
  end as role_group
from public.roles r
where r.is_active = true;

delete from _target_roles
where role_group is null;

-- =====================================================================================
-- 2. Active permissions catalog
-- =====================================================================================

create temp table _active_permissions as
select
  ap.id as permission_id,
  a.code as app_code,
  ap.code as permission_code,
  lower(a.code || '.' || ap.code) as full_code,
  lower(coalesce(ap.name, '')) as permission_name,
  lower(coalesce(ap.description, '')) as permission_description
from public.app_permissions ap
join public.apps a
  on a.id = ap.app_id
where ap.is_active = true;

-- =====================================================================================
-- 3. Build permission grants using exact role_permissions column types
-- =====================================================================================

create temp table _permission_grants as
select
  role,
  permission_id,
  is_allowed,
  scope_type,
  scope_site_id,
  scope_area_id,
  scope_site_type,
  scope_area_kind
from public.role_permissions
where false;

-- Owner and general manager: full access.
insert into _permission_grants (
  role,
  permission_id,
  is_allowed,
  scope_type,
  scope_site_id,
  scope_area_id,
  scope_site_type,
  scope_area_kind
)
select
  tr.role,
  p.permission_id,
  true,
  'global'::public.permission_scope_type,
  null::uuid,
  null::uuid,
  null::public.site_type,
  null::text
from _target_roles tr
cross join _active_permissions p
where tr.role_group in ('owner', 'general_manager');

-- Manager: operational and management permissions, excluding permission/security administration.
insert into _permission_grants (
  role,
  permission_id,
  is_allowed,
  scope_type,
  scope_site_id,
  scope_area_id,
  scope_site_type,
  scope_area_kind
)
select distinct
  tr.role,
  p.permission_id,
  true,
  'global'::public.permission_scope_type,
  null::uuid,
  null::uuid,
  null::public.site_type,
  null::text
from _target_roles tr
join _active_permissions p
  on true
where tr.role_group = 'manager'
  and (
    p.permission_code = 'access'
    or p.full_code like '%.access'

    or p.permission_code like '%.view'
    or p.permission_code like '%.read'
    or p.full_code like '%.view'
    or p.full_code like '%.read'

    or p.full_code in (
      'nexo.inventory.remissions',
      'nexo.inventory.remissions.request',
      'nexo.inventory.remissions.prepare',
      'nexo.inventory.remissions.receive',
      'nexo.inventory.remissions.transit',
      'nexo.inventory.remissions.edit_own_pending',
      'nexo.inventory.stock',
      'nexo.inventory.movements',
      'nexo.inventory.entries',
      'nexo.inventory.withdraw',
      'nexo.inventory.counts',
      'nexo.inventory.transfers',
      'nexo.inventory.locations',
      'nexo.inventory.production_batches',
      'nexo.catalog.products',
      'nexo.cost_centers.view',
      'nexo.internal_prices.view',
      'nexo.internal_invoices.view',
      'nexo.internal_invoices.view_amounts',
      'nexo.internal_reports.view',
      'nexo.internal_variances.view'
    )

    or p.full_code like 'fogo.%'
    or p.full_code like 'origo.%'
    or p.full_code like 'pulso.%'

    or p.full_code like 'viso.staff.%'
    or p.full_code like 'viso.calendar%'
    or p.full_code like 'viso.attendance%'
    or p.full_code like 'viso.sites%'
    or p.full_code like 'viso.business%'
    or p.full_code like 'viso.audit%'
  )
  and p.full_code not like '%permissions.manage%'
  and p.full_code not like '%app_navigation.manage%'
  and p.full_code not like '%roles%'
  and p.full_code not like '%internal_reports.full_margin%'
  and p.full_code not like '%internal_prices.manage%'
  and p.full_code not like '%internal_invoices.cancel%'
  and p.full_code not like '%internal_variances.approve%';

-- Administrative assistant: admin/catalog/product/staff/procurement setup.
insert into _permission_grants (
  role,
  permission_id,
  is_allowed,
  scope_type,
  scope_site_id,
  scope_area_id,
  scope_site_type,
  scope_area_kind
)
select distinct
  tr.role,
  p.permission_id,
  true,
  'global'::public.permission_scope_type,
  null::uuid,
  null::uuid,
  null::public.site_type,
  null::text
from _target_roles tr
join _active_permissions p
  on true
where tr.role_group = 'admin_assistant'
  and (
    p.permission_code = 'access'
    or p.full_code like '%.access'

    or p.full_code like '%catalog%'
    or p.full_code like '%product%'
    or p.full_code like '%products%'
    or p.full_code like '%category%'
    or p.full_code like '%categories%'
    or p.full_code like '%unit%'
    or p.full_code like '%uom%'
    or p.full_code like '%photo%'
    or p.full_code like '%image%'
    or p.full_code like '%upload%'

    or p.full_code like 'origo.%'
    or p.full_code like '%supplier%'
    or p.full_code like '%provider%'
    or p.full_code like '%procurement%'
    or p.full_code like '%purchase%'

    or p.full_code like 'viso.staff%'
    or p.full_code like '%employee%'
    or p.full_code like '%worker%'
    or p.full_code like '%trabajador%'

    or p.full_code in (
      'nexo.inventory.remissions',
      'nexo.inventory.remissions.request',
      'nexo.inventory.remissions.receive',
      'nexo.inventory.entries',
      'nexo.inventory.stock',
      'nexo.inventory.movements',
      'nexo.settings.categories.manage',
      'nexo.settings.units.manage',
      'nexo.settings.sites.manage',
      'nexo.settings.supply_routes.manage',
      'nexo.settings.remissions.manage',
      'nexo.cost_centers.view',
      'nexo.internal_prices.view'
    )

    or p.full_code in (
      'nexo.internal_invoices.view',
      'nexo.internal_invoices.view_amounts',
      'nexo.internal_reports.view',
      'nexo.internal_variances.view'
    )
  )
  and p.full_code not like '%permissions.manage%'
  and p.full_code not like '%app_navigation.manage%'
  and p.full_code not like '%roles%'
  and p.full_code not like '%internal_reports.full_margin%'
  and p.full_code not like '%internal_prices.manage%'
  and p.full_code not like '%internal_invoices.cancel%'
  and p.full_code not like '%internal_variances.approve%';

-- Accountant: accounting, internal billing, costs, reports, purchases, movement valuation.
insert into _permission_grants (
  role,
  permission_id,
  is_allowed,
  scope_type,
  scope_site_id,
  scope_area_id,
  scope_site_type,
  scope_area_kind
)
select distinct
  tr.role,
  p.permission_id,
  true,
  'global'::public.permission_scope_type,
  null::uuid,
  null::uuid,
  null::public.site_type,
  null::text
from _target_roles tr
join _active_permissions p
  on true
where tr.role_group = 'accountant'
  and (
    p.permission_code = 'access'
    or p.full_code like '%.access'

    or p.full_code like '%invoice%'
    or p.full_code like '%invoices%'
    or p.full_code like '%billing%'
    or p.full_code like '%cost%'
    or p.full_code like '%cost_center%'
    or p.full_code like '%cost_centers%'
    or p.full_code like '%price%'
    or p.full_code like '%prices%'
    or p.full_code like '%report%'
    or p.full_code like '%margin%'

    or p.full_code in (
      'nexo.inventory.stock',
      'nexo.inventory.movements',
      'nexo.inventory.remissions',
      'nexo.inventory.remissions.all_sites',
      'nexo.inventory.entries',
      'nexo.catalog.products',
      'nexo.internal_invoices.view',
      'nexo.internal_invoices.view_amounts',
      'nexo.internal_reports.view',
      'nexo.internal_reports.full_margin',
      'nexo.internal_prices.view',
      'nexo.cost_centers.view',
      'nexo.internal_variances.view'
    )

    or p.full_code like 'origo.%'
    or p.full_code like '%purchase%'
    or p.full_code like '%procurement%'
    or p.full_code like '%supplier%'
    or p.full_code like '%provider%'
  )
  and p.full_code not like '%permissions.manage%'
  and p.full_code not like '%app_navigation.manage%'
  and p.full_code not like '%roles%'
  and p.full_code not like '%internal_prices.manage%'
  and p.full_code not like '%internal_invoices.cancel%'
  and p.full_code not like '%internal_variances.approve%';

-- =====================================================================================
-- 4. Apply grants
-- =====================================================================================

delete from public.role_permissions rp
using _target_roles tr
where rp.role = tr.role;

insert into public.role_permissions (
  role,
  permission_id,
  is_allowed,
  scope_type,
  scope_site_id,
  scope_area_id,
  scope_site_type,
  scope_area_kind
)
select distinct
  g.role,
  g.permission_id,
  g.is_allowed,
  g.scope_type,
  g.scope_site_id,
  g.scope_area_id,
  g.scope_site_type,
  g.scope_area_kind
from _permission_grants g;

commit;

-- =====================================================================================
-- Validation
-- =====================================================================================

select
  'matched_roles' as check_name,
  role_group,
  role,
  name
from _target_roles
order by role_group, role;

select
  'role_permission_totals' as check_name,
  tr.role_group,
  tr.role,
  count(rp.permission_id) as active_permissions
from _target_roles tr
left join public.role_permissions rp
  on rp.role = tr.role
 and rp.is_allowed = true
group by tr.role_group, tr.role
order by tr.role_group, tr.role;

select
  'role_app_permission_totals' as check_name,
  tr.role_group,
  tr.role,
  a.code as app_code,
  count(rp.permission_id) as active_permissions
from _target_roles tr
join public.role_permissions rp
  on rp.role = tr.role
 and rp.is_allowed = true
join public.app_permissions ap
  on ap.id = rp.permission_id
join public.apps a
  on a.id = ap.app_id
group by tr.role_group, tr.role, a.code
order by tr.role_group, tr.role, a.code;

select
  'owner_general_manager_missing_active_permissions' as check_name,
  tr.role_group,
  tr.role,
  count(p.permission_id) as missing_total
from _target_roles tr
cross join _active_permissions p
left join public.role_permissions rp
  on rp.role = tr.role
 and rp.permission_id = p.permission_id
 and rp.is_allowed = true
where tr.role_group in ('owner', 'general_manager')
  and rp.permission_id is null
group by tr.role_group, tr.role
order by tr.role_group, tr.role;
