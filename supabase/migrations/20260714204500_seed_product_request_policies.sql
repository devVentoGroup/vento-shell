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
  p.id,
  case lower(coalesce(nullif(p.stock_unit_code, ''), nullif(p.unit, '')))
    when 'un' then 'Unidad'
    when 'g' then 'Gramo'
    when 'kg' then 'Kilogramo'
    when 'ml' then 'Mililitro'
    when 'l' then 'Litro'
    else 'Unidad base (' || lower(coalesce(nullif(p.stock_unit_code, ''), nullif(p.unit, ''))) || ')'
  end,
  lower(coalesce(nullif(p.stock_unit_code, ''), nullif(p.unit, ''))),
  lower(coalesce(nullif(p.stock_unit_code, ''), nullif(p.unit, ''))),
  1,
  'free',
  null,
  null,
  case
    when lower(coalesce(nullif(p.stock_unit_code, ''), nullif(p.unit, ''))) in ('g','kg','ml','l') then true
    else false
  end,
  true,
  true,
  'base_unit',
  null,
  'migration'
from public.products p
join public.product_inventory_profiles pip
  on pip.product_id = p.id
 and pip.track_inventory = true
where p.is_active = true
  and coalesce(nullif(p.stock_unit_code, ''), nullif(p.unit, '')) is not null
  and not exists (
    select 1
    from public.product_request_policies prp
    where prp.product_id = p.id
      and prp.policy_kind = 'base_unit'
      and prp.is_active = true
  );

with verified_profiles as (
  select distinct
    pup.id,
    pup.product_id,
    pup.label,
    lower(coalesce(nullif(p.stock_unit_code, ''), nullif(p.unit, ''))) as base_unit_code,
    (pup.qty_in_stock_unit / nullif(pup.qty_in_input_unit, 0))::numeric as factor
  from public.product_uom_profiles pup
  join public.products p
    on p.id = pup.product_id
   and p.is_active = true
  join public.product_inventory_profiles pip
    on pip.product_id = p.id
   and pip.track_inventory = true
  join public.inventory_stock_by_uom_profile s
    on s.uom_profile_id = pup.id
   and s.product_id = pup.product_id
  where pup.usage_context = 'remission'
    and pup.is_active = true
    and pup.qty_in_input_unit > 0
    and pup.qty_in_stock_unit > 0
    and (abs(coalesce(s.presentation_qty, 0)) > 0.000001
      or abs(coalesce(s.base_qty, 0)) > 0.000001)
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
  vp.product_id,
  btrim(vp.label),
  case
    when lower(vp.label) like 'six pack%' then 'six_pack'
    when lower(vp.label) like 'paquete%' then 'paquete'
    when lower(vp.label) like 'bandeja%' then 'bandeja'
    when lower(vp.label) like 'caja%' then 'caja'
    when lower(vp.label) like 'bolsa%' then 'bolsa'
    when lower(vp.label) like 'botella%' then 'botella'
    when lower(vp.label) like 'pote%' then 'pote'
    else 'presentacion'
  end,
  vp.base_unit_code,
  vp.factor,
  'strict_multiple',
  1,
  1,
  false,
  false,
  true,
  'physical_presentation',
  vp.id,
  'migration'
from verified_profiles vp
where vp.factor <> 1
  and not exists (
    select 1
    from public.product_request_policies prp
    where prp.physical_uom_profile_id = vp.id
  );