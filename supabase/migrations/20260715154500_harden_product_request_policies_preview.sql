alter table public.product_request_policies
  add column if not exists version_number integer not null default 1,
  add column if not exists supersedes_policy_id uuid null,
  add column if not exists change_reason text null;

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conrelid = 'public.product_request_policies'::regclass
      and conname = 'product_request_policies_version_positive_chk'
  ) then
    alter table public.product_request_policies
      add constraint product_request_policies_version_positive_chk
      check (version_number > 0);
  end if;

  if not exists (
    select 1
    from pg_constraint
    where conrelid = 'public.product_request_policies'::regclass
      and conname = 'product_request_policies_supersedes_fkey'
  ) then
    alter table public.product_request_policies
      add constraint product_request_policies_supersedes_fkey
      foreign key (supersedes_policy_id)
      references public.product_request_policies(id)
      on delete restrict;
  end if;
end;
$$;

create index if not exists product_request_policies_supersedes_idx
  on public.product_request_policies(supersedes_policy_id)
  where supersedes_policy_id is not null;

create or replace function public.lock_used_product_request_policy_semantics()
returns trigger
language plpgsql
set search_path to 'public', 'auth', 'storage', 'extensions'
as $function$
begin
  if exists (
    select 1
    from public.restock_request_items item
    where item.request_policy_id = old.id
    limit 1
  ) and (
    new.product_id is distinct from old.product_id
    or new.request_unit_code is distinct from old.request_unit_code
    or new.base_unit_code is distinct from old.base_unit_code
    or new.base_qty_per_request_unit is distinct from old.base_qty_per_request_unit
    or new.constraint_mode is distinct from old.constraint_mode
    or new.minimum_request_qty is distinct from old.minimum_request_qty
    or new.request_step_qty is distinct from old.request_step_qty
    or new.allow_fraction is distinct from old.allow_fraction
    or new.policy_kind is distinct from old.policy_kind
    or new.physical_uom_profile_id is distinct from old.physical_uom_profile_id
  ) then
    raise exception using
      errcode = '23514',
      message = 'REQUEST_POLICY_VERSION_REQUIRED',
      detail = 'La política ya fue utilizada. Desactívala y crea una nueva versión para cambiar su significado.';
  end if;

  return new;
end;
$function$;

revoke all on function public.lock_used_product_request_policy_semantics() from public;
revoke all on function public.lock_used_product_request_policy_semantics() from anon;
revoke all on function public.lock_used_product_request_policy_semantics() from authenticated;

comment on function public.lock_used_product_request_policy_semantics() is
  'Impide cambiar la semántica de una política de solicitud después de que haya sido usada. Estado, default, etiqueta y metadatos pueden mantenerse sin reescribir el historial.';

drop trigger if exists trg_lock_used_product_request_policy
  on public.product_request_policies;
create trigger trg_lock_used_product_request_policy
before update on public.product_request_policies
for each row
execute function public.lock_used_product_request_policy_semantics();

create or replace view public.product_request_policy_audit
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
  left join public.product_request_policies prp on prp.product_id = p.id
  left join usage_counts u on u.request_policy_id = prp.id
  left join public.product_uom_profiles pup on pup.id = prp.physical_uom_profile_id
  where p.is_active = true
)
select
  *,
  array_remove(array[
    case when policy_id is null then 'missing_policy' end,
    case when policy_id is not null and is_active and is_default is false
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

comment on view public.product_request_policy_audit is
  'Auditoría específica de políticas de solicitud. No modela compras, producción ni fulfillment.';

grant select on public.product_request_policy_audit to authenticated;
