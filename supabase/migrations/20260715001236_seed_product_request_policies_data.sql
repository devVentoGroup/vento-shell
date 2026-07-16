with base_candidates as (
  select
    p.id as product_id,
    lower(coalesce(nullif(p.stock_unit_code, ''), nullif(pip.default_unit, ''), nullif(p.unit, ''))) as base_unit_code,
    coalesce(iu.name, upper(lower(coalesce(nullif(p.stock_unit_code, ''), nullif(pip.default_unit, ''), nullif(p.unit, ''))))) as policy_label,
    coalesce(iu.family, pip.unit_family, '') as unit_family
  from public.products p
  join public.product_inventory_profiles pip
    on pip.product_id = p.id
   and pip.track_inventory = true
  left join public.inventory_units iu
    on iu.code = lower(coalesce(nullif(p.stock_unit_code, ''), nullif(pip.default_unit, ''), nullif(p.unit, '')))
   and iu.is_active = true
  where p.is_active = true
), inserted_base as (
  insert into public.product_request_policies (
    product_id,
    label,
    request_unit_code,
    base_unit_code,
    base_qty_per_request_unit,
    constraint_mode,
    minimum_request_qty,
    request_step_qty,
    allow_fraction,
    is_default,
    is_active,
    policy_kind,
    physical_uom_profile_id,
    source
  )
  select
    bc.product_id,
    bc.policy_label,
    bc.base_unit_code,
    bc.base_unit_code,
    1,
    'free',
    null,
    null,
    case when bc.unit_family = 'count' or bc.base_unit_code = 'un' then false else true end,
    true,
    true,
    'base_unit',
    null,
    'migration'
  from base_candidates bc
  where not exists (
    select 1
    from public.product_request_policies prp
    where prp.product_id = bc.product_id
      and prp.is_active = true
      and prp.policy_kind = 'base_unit'
      and prp.base_qty_per_request_unit = 1
      and prp.base_unit_code = bc.base_unit_code
  )
  returning id
), physical_candidates as (
  select
    pup.id as physical_uom_profile_id,
    pup.product_id,
    btrim(pup.label) as label,
    case
      when lower(btrim(pup.label)) like 'six pack%' then 'six_pack'
      when lower(btrim(pup.label)) like 'paquete%' then 'paquete'
      when lower(btrim(pup.label)) like 'bandeja%' then 'bandeja'
      when lower(btrim(pup.label)) like 'caja%' then 'caja'
      when lower(btrim(pup.label)) like 'bolsa%' then 'bolsa'
      when lower(btrim(pup.label)) like 'pote%' then 'pote'
      when lower(btrim(pup.label)) like 'botella%' then 'botella'
      else lower(btrim(pup.input_unit_code))
    end as request_unit_code,
    lower(coalesce(nullif(p.stock_unit_code, ''), nullif(pip.default_unit, ''), nullif(p.unit, ''))) as base_unit_code,
    (pup.qty_in_stock_unit / nullif(pup.qty_in_input_unit, 0))::numeric as factor
  from public.product_uom_profiles pup
  join public.products p
    on p.id = pup.product_id
   and p.is_active = true
  join public.product_inventory_profiles pip
    on pip.product_id = p.id
   and pip.track_inventory = true
  where pup.usage_context = 'remission'
    and pup.is_active = true
    and pup.qty_in_input_unit > 0
    and pup.qty_in_stock_unit > 0
    and exists (
      select 1
      from public.inventory_stock_by_uom_profile s
      where s.uom_profile_id = pup.id
        and (
          abs(coalesce(s.presentation_qty, 0)) > 0.000001
          or abs(coalesce(s.base_qty, 0)) > 0.000001
        )
    )
)
insert into public.product_request_policies (
  product_id,
  label,
  request_unit_code,
  base_unit_code,
  base_qty_per_request_unit,
  constraint_mode,
  minimum_request_qty,
  request_step_qty,
  allow_fraction,
  is_default,
  is_active,
  policy_kind,
  physical_uom_profile_id,
  source
)
select
  pc.product_id,
  pc.label,
  pc.request_unit_code,
  pc.base_unit_code,
  pc.factor,
  'strict_multiple',
  1,
  1,
  false,
  false,
  true,
  'physical_presentation',
  pc.physical_uom_profile_id,
  'migration'
from physical_candidates pc
where pc.factor <> 1
  and not exists (
    select 1
    from public.product_request_policies prp
    where prp.physical_uom_profile_id = pc.physical_uom_profile_id
      and prp.is_active = true
  );