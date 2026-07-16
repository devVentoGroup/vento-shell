alter table public.product_request_policies
  add column if not exists version_number integer not null default 1,
  add column if not exists supersedes_policy_id uuid null,
  add column if not exists change_reason text null;

do $$
begin
  if not exists (
    select 1 from pg_constraint
    where conrelid = 'public.product_request_policies'::regclass
      and conname = 'product_request_policies_version_positive_chk'
  ) then
    alter table public.product_request_policies
      add constraint product_request_policies_version_positive_chk
      check (version_number > 0);
  end if;

  if not exists (
    select 1 from pg_constraint
    where conrelid = 'public.product_request_policies'::regclass
      and conname = 'product_request_policies_supersedes_fkey'
  ) then
    alter table public.product_request_policies
      add constraint product_request_policies_supersedes_fkey
      foreign key (supersedes_policy_id)
      references public.product_request_policies(id)
      on delete restrict;
  end if;

  if not exists (
    select 1 from pg_constraint
    where conrelid = 'public.product_request_policies'::regclass
      and conname = 'product_request_policies_not_self_supersede_chk'
  ) then
    alter table public.product_request_policies
      add constraint product_request_policies_not_self_supersede_chk
      check (supersedes_policy_id is null or supersedes_policy_id <> id);
  end if;
end $$;

create index if not exists product_request_policies_supersedes_idx
  on public.product_request_policies(supersedes_policy_id)
  where supersedes_policy_id is not null;

create or replace function public.prevent_used_request_policy_semantic_update()
returns trigger
language plpgsql
set search_path to 'public', 'auth', 'storage', 'extensions'
as $function$
begin
  if exists (
    select 1
    from public.restock_request_items rri
    where rri.request_policy_id = old.id
    limit 1
  ) and (
    new.product_id is distinct from old.product_id or
    new.label is distinct from old.label or
    new.request_unit_code is distinct from old.request_unit_code or
    new.base_unit_code is distinct from old.base_unit_code or
    new.base_qty_per_request_unit is distinct from old.base_qty_per_request_unit or
    new.constraint_mode is distinct from old.constraint_mode or
    new.minimum_request_qty is distinct from old.minimum_request_qty or
    new.request_step_qty is distinct from old.request_step_qty or
    new.allow_fraction is distinct from old.allow_fraction or
    new.policy_kind is distinct from old.policy_kind or
    new.physical_uom_profile_id is distinct from old.physical_uom_profile_id or
    new.source is distinct from old.source or
    new.version_number is distinct from old.version_number or
    new.supersedes_policy_id is distinct from old.supersedes_policy_id
  ) then
    raise exception using
      errcode = '23514',
      message = 'La política ya fue utilizada y no puede modificarse. Crea una nueva versión.';
  end if;
  return new;
end;
$function$;

drop trigger if exists trg_prevent_used_request_policy_semantic_update
  on public.product_request_policies;
create trigger trg_prevent_used_request_policy_semantic_update
before update on public.product_request_policies
for each row
execute function public.prevent_used_request_policy_semantic_update();

create or replace view public.product_request_policy_usage
with (security_invoker = true)
as
select
  p.id as request_policy_id,
  p.product_id,
  count(rri.id)::bigint as use_count,
  count(rri.id) filter (
    where rr.status not in ('completed','cancelled') or rr.status is null
  )::bigint as open_use_count,
  min(rri.created_at) as first_used_at,
  max(rri.created_at) as last_used_at
from public.product_request_policies p
left join public.restock_request_items rri
  on rri.request_policy_id = p.id
left join public.restock_requests rr
  on rr.id = rri.request_id
group by p.id, p.product_id;

grant select on public.product_request_policy_usage to authenticated;

create or replace view public.product_request_policy_audit
with (security_invoker = true)
as
select
  'error'::text as severity,
  'inventory_product_without_active_policy'::text as issue_code,
  p.id as product_id,
  null::uuid as request_policy_id,
  'Producto inventariable activo sin política de solicitud activa.'::text as detail
from public.products p
join public.product_inventory_profiles pip
  on pip.product_id = p.id and pip.track_inventory = true
where p.is_active = true
  and not exists (
    select 1 from public.product_request_policies prp
    where prp.product_id = p.id and prp.is_active = true
  )
union all
select
  'error',
  'product_without_active_default_policy',
  p.id,
  null::uuid,
  'Producto con políticas activas pero sin política predeterminada activa.'
from public.products p
where p.is_active = true
  and exists (
    select 1 from public.product_request_policies prp
    where prp.product_id = p.id and prp.is_active = true
  )
  and not exists (
    select 1 from public.product_request_policies prp
    where prp.product_id = p.id and prp.is_active = true and prp.is_default = true
  )
union all
select
  'error',
  'policy_base_unit_mismatch',
  prp.product_id,
  prp.id,
  'La unidad base de la política no coincide con la unidad base actual del producto.'
from public.product_request_policies prp
join public.products p on p.id = prp.product_id
where prp.is_active = true
  and lower(btrim(prp.base_unit_code)) <> lower(btrim(coalesce(nullif(p.stock_unit_code,''), nullif(p.unit,''))))
union all
select
  'error',
  'physical_profile_invalid',
  prp.product_id,
  prp.id,
  'La presentación física vinculada no existe, está inactiva o pertenece a otro producto.'
from public.product_request_policies prp
left join public.product_uom_profiles pup
  on pup.id = prp.physical_uom_profile_id
where prp.is_active = true
  and prp.policy_kind = 'physical_presentation'
  and (
    pup.id is null or
    pup.is_active = false or
    pup.product_id <> prp.product_id
  )
union all
select
  'error',
  'used_policy_missing_snapshot',
  rri.product_id,
  rri.request_policy_id,
  'Línea con política de solicitud sin snapshot histórico completo.'
from public.restock_request_items rri
where rri.request_policy_id is not null
  and (
    rri.request_policy_kind is null or
    rri.request_policy_label is null or
    rri.requested_policy_qty is null or
    rri.request_unit_code is null or
    rri.base_qty_per_request_unit is null or
    rri.request_constraint_mode is null or
    rri.request_allow_fraction is null
  )
union all
select
  'warning',
  'policy_line_still_requires_package_dispatch',
  rri.product_id,
  rri.request_policy_id,
  'Línea creada con política explícita pero aún marcada para despacho por paquete de producción.'
from public.restock_request_items rri
where rri.request_policy_id is not null
  and coalesce(rri.requires_package_dispatch, false) = true;

grant select on public.product_request_policy_audit to authenticated;

comment on column public.product_request_policies.version_number is
  'Versión semántica de la política. Las políticas usadas no se editan; se reemplazan por una nueva versión.';
comment on column public.product_request_policies.supersedes_policy_id is
  'Política anterior reemplazada por esta versión.';
comment on column public.product_request_policies.change_reason is
  'Motivo operativo del cambio de versión o de la desactivación.';
comment on view public.product_request_policy_usage is
  'Impacto histórico y operativo de cada política de solicitud.';
comment on view public.product_request_policy_audit is
  'Hallazgos de consistencia exclusivos del modelo de políticas de solicitud.';