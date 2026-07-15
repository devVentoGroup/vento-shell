create or replace view public.product_request_policy_audit_summary
with (security_invoker = true)
as
with usage_counts as (
  select
    request_policy_id,
    count(*)::bigint as usage_count,
    count(*) filter (
      where coalesce(request_policy_label, '') = ''
         or requested_policy_qty is null
         or request_unit_code is null
         or base_qty_per_request_unit is null
    )::bigint as incomplete_snapshot_count
  from public.restock_request_items
  where request_policy_id is not null
  group by request_policy_id
), policy_rows as (
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
    pup.product_id as physical_profile_product_id,
    pup.is_active as physical_profile_is_active
  from public.products p
  join public.product_inventory_profiles pip
    on pip.product_id = p.id
   and pip.track_inventory = true
  left join public.product_request_policies prp on prp.product_id = p.id
  left join usage_counts u on u.request_policy_id = prp.id
  left join public.product_uom_profiles pup on pup.id = prp.physical_uom_profile_id
  where p.is_active = true
)
select
  *,
  array_remove(array[
    case when policy_id is null then 'missing_policy' end,
    case when policy_id is not null
      and not exists (
        select 1
        from public.product_request_policies default_policy
        where default_policy.product_id = policy_rows.product_id
          and default_policy.is_active
          and default_policy.is_default
      ) then 'missing_default' end,
    case when policy_id is not null and base_unit_code is distinct from product_base_unit_code
      then 'base_unit_mismatch' end,
    case when policy_kind = 'base_unit'
      and (request_unit_code is distinct from base_unit_code or base_qty_per_request_unit <> 1)
      then 'invalid_base_policy' end,
    case when policy_kind = 'logical_group' and physical_uom_profile_id is not null
      then 'logical_group_has_physical_profile' end,
    case when policy_kind = 'physical_presentation' and physical_uom_profile_id is null
      then 'physical_policy_missing_profile' end,
    case when physical_uom_profile_id is not null and physical_profile_product_id is distinct from product_id
      then 'physical_profile_product_mismatch' end,
    case when physical_uom_profile_id is not null and coalesce(physical_profile_is_active, false) is false
      then 'physical_profile_inactive' end,
    case when incomplete_snapshot_count > 0 then 'incomplete_historical_snapshot' end
  ], null)::text[] as issues
from policy_rows;
