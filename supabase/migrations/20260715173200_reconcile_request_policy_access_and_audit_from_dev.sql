-- Vista de auditoría, RLS y permisos del dominio de políticas de solicitud.

create or replace view public.product_request_policy_audit_summary
with (security_invoker = true)
as
with usage_counts as (
  select
    request_policy_id,
    count(*) as usage_count,
    count(*) filter (
      where coalesce(request_policy_label, '') = ''
         or requested_policy_qty is null
         or request_unit_code is null
         or base_qty_per_request_unit is null
    ) as incomplete_snapshot_count
  from public.restock_request_items
  where request_policy_id is not null
  group by request_policy_id
)
select
  p.id as product_id,
  p.name as product_name,
  lower(coalesce(nullif(p.stock_unit_code, ''), nullif(p.unit, ''))) as product_base_unit_code,
  prp.id as policy_id,
  prp.label,
  prp.request_unit_code,
  prp.base_unit_code,
  prp.base_qty_per_request_unit,
  prp.constraint_mode,
  prp.minimum_request_qty,
  prp.request_step_qty,
  prp.allow_fraction,
  prp.policy_kind,
  prp.physical_uom_profile_id,
  prp.is_default,
  prp.is_active,
  prp.version_number,
  prp.supersedes_policy_id,
  coalesce(u.usage_count, 0) as usage_count,
  coalesce(u.incomplete_snapshot_count, 0) as incomplete_snapshot_count,
  array_remove(array[
    case when prp.id is null then 'missing_policy' end,
    case when prp.id is not null and not exists (
      select 1
      from public.product_request_policies default_policy
      where default_policy.product_id = p.id
        and default_policy.is_active
        and default_policy.is_default
    ) then 'missing_default' end,
    case when prp.id is not null
      and prp.base_unit_code is distinct from lower(coalesce(nullif(p.stock_unit_code, ''), nullif(p.unit, '')))
      then 'base_unit_mismatch' end,
    case when prp.policy_kind = 'base_unit'
      and (prp.request_unit_code is distinct from prp.base_unit_code or prp.base_qty_per_request_unit <> 1)
      then 'invalid_base_policy' end,
    case when prp.policy_kind = 'logical_group' and prp.physical_uom_profile_id is not null
      then 'logical_group_has_physical_profile' end,
    case when prp.policy_kind = 'physical_presentation' and prp.physical_uom_profile_id is null
      then 'physical_policy_missing_profile' end,
    case when coalesce(u.incomplete_snapshot_count, 0) > 0
      then 'incomplete_historical_snapshot' end
  ], null) as issues
from public.products p
join public.product_inventory_profiles pip
  on pip.product_id = p.id and pip.track_inventory = true
left join public.product_request_policies prp
  on prp.product_id = p.id
left join usage_counts u
  on u.request_policy_id = prp.id
where p.is_active = true;

alter table public.product_request_policies enable row level security;
alter table public.product_request_policy_presentations enable row level security;

drop policy if exists product_request_policies_select_staff on public.product_request_policies;
create policy product_request_policies_select_staff
on public.product_request_policies
for select to authenticated
using (
  public.is_employee()
  or public.current_shared_device_can_access_nexo_remission_catalog(product_id)
);

drop policy if exists product_request_policies_insert_catalog on public.product_request_policies;
create policy product_request_policies_insert_catalog
on public.product_request_policies
for insert to authenticated
with check (
  public.has_permission('nexo.catalog.products')
  or public.is_owner()
  or public.is_global_manager()
);

drop policy if exists product_request_policies_update_catalog on public.product_request_policies;
create policy product_request_policies_update_catalog
on public.product_request_policies
for update to authenticated
using (
  public.has_permission('nexo.catalog.products')
  or public.is_owner()
  or public.is_global_manager()
)
with check (
  public.has_permission('nexo.catalog.products')
  or public.is_owner()
  or public.is_global_manager()
);

drop policy if exists product_request_policy_presentations_select_staff on public.product_request_policy_presentations;
create policy product_request_policy_presentations_select_staff
on public.product_request_policy_presentations
for select to authenticated
using (
  public.is_employee()
  or public.current_shared_device_can_access_nexo_remission_catalog((
    select policy.product_id
    from public.product_request_policies policy
    where policy.id = request_policy_id
  ))
);

drop policy if exists product_request_policy_presentations_insert_catalog on public.product_request_policy_presentations;
create policy product_request_policy_presentations_insert_catalog
on public.product_request_policy_presentations
for insert to authenticated
with check (
  public.has_permission('nexo.catalog.products')
  or public.is_owner()
  or public.is_global_manager()
);

drop policy if exists product_request_policy_presentations_update_catalog on public.product_request_policy_presentations;
create policy product_request_policy_presentations_update_catalog
on public.product_request_policy_presentations
for update to authenticated
using (
  public.has_permission('nexo.catalog.products')
  or public.is_owner()
  or public.is_global_manager()
)
with check (
  public.has_permission('nexo.catalog.products')
  or public.is_owner()
  or public.is_global_manager()
);

drop policy if exists product_request_policy_presentations_delete_catalog on public.product_request_policy_presentations;
create policy product_request_policy_presentations_delete_catalog
on public.product_request_policy_presentations
for delete to authenticated
using (
  public.has_permission('nexo.catalog.products')
  or public.is_owner()
  or public.is_global_manager()
);

grant select, insert, update on public.product_request_policies to authenticated;
grant select, insert, update, delete on public.product_request_policy_presentations to authenticated;
grant select on public.product_request_policy_audit_summary to authenticated;

comment on view public.product_request_policy_audit_summary is
  'Audita políticas faltantes, defaults, equivalencias y snapshots históricos incompletos.';