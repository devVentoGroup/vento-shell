with chosen_profiles as (
  select *
  from (
    select
      pup.product_id,
      pup.id as profile_id,
      btrim(pup.label) as label,
      lower(coalesce(nullif(p.stock_unit_code, ''), nullif(p.unit, ''))) as base_unit_code,
      (pup.qty_in_stock_unit / nullif(pup.qty_in_input_unit, 0))::numeric as factor,
      row_number() over (
        partition by pup.product_id
        order by
          case when pup.is_default then 0 else 1 end,
          case when pup.source = 'manual' then 0 when pup.source = 'supplier_primary' then 1 else 2 end,
          pup.created_at asc,
          pup.id asc
      ) as preference_rank
    from public.product_uom_profiles pup
    join public.products p on p.id = pup.product_id
    where pup.is_active = true
      and lower(coalesce(pup.usage_context, '')) = 'remission'
      and pup.qty_in_input_unit > 0
      and pup.qty_in_stock_unit > 0
      and coalesce(nullif(p.stock_unit_code, ''), nullif(p.unit, '')) is not null
  ) ranked
  where preference_rank = 1
), updated_label_matches as (
  update public.product_request_policies prp
  set
    request_unit_code = case
      when lower(cp.label) like 'six pack%' then 'six_pack'
      when lower(cp.label) like 'paquete%' then 'paquete'
      when lower(cp.label) like 'bandeja%' then 'bandeja'
      when lower(cp.label) like 'caja%' then 'caja'
      when lower(cp.label) like 'bolsa%' then 'bolsa'
      when lower(cp.label) like 'botella%' then 'botella'
      when lower(cp.label) like 'pote%' then 'pote'
      when lower(cp.label) like 'bulto%' then 'bulto'
      when lower(cp.label) like 'tarro%' then 'tarro'
      when lower(cp.label) like 'lata%' then 'lata'
      when lower(cp.label) like 'unidad%' then cp.base_unit_code
      else 'presentacion'
    end,
    base_unit_code = cp.base_unit_code,
    base_qty_per_request_unit = cp.factor,
    constraint_mode = 'strict_multiple',
    minimum_request_qty = 1,
    request_step_qty = 1,
    allow_fraction = false,
    policy_kind = 'physical_presentation',
    physical_uom_profile_id = cp.profile_id,
    source = 'migration',
    updated_at = now()
  from chosen_profiles cp
  where prp.product_id = cp.product_id
    and prp.is_active = true
    and lower(btrim(prp.label)) = lower(btrim(cp.label))
    and prp.physical_uom_profile_id is null
    and not exists (
      select 1
      from public.product_request_policies existing
      where existing.product_id = cp.product_id
        and existing.physical_uom_profile_id = cp.profile_id
        and existing.is_active = true
    )
  returning prp.id
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
  cp.product_id,
  cp.label,
  case
    when lower(cp.label) like 'six pack%' then 'six_pack'
    when lower(cp.label) like 'paquete%' then 'paquete'
    when lower(cp.label) like 'bandeja%' then 'bandeja'
    when lower(cp.label) like 'caja%' then 'caja'
    when lower(cp.label) like 'bolsa%' then 'bolsa'
    when lower(cp.label) like 'botella%' then 'botella'
    when lower(cp.label) like 'pote%' then 'pote'
    when lower(cp.label) like 'bulto%' then 'bulto'
    when lower(cp.label) like 'tarro%' then 'tarro'
    when lower(cp.label) like 'lata%' then 'lata'
    when lower(cp.label) like 'unidad%' then cp.base_unit_code
    else 'presentacion'
  end,
  cp.base_unit_code,
  cp.factor,
  'strict_multiple',
  1,
  1,
  false,
  false,
  true,
  'physical_presentation',
  cp.profile_id,
  'migration'
from chosen_profiles cp
where not exists (
  select 1
  from public.product_request_policies prp
  where prp.product_id = cp.product_id
    and prp.physical_uom_profile_id = cp.profile_id
    and prp.is_active = true
)
and not exists (
  select 1
  from public.product_request_policies prp
  where prp.product_id = cp.product_id
    and lower(btrim(prp.label)) = lower(btrim(cp.label))
    and prp.is_active = true
);

with chosen_profiles as (
  select product_id, profile_id
  from (
    select
      pup.product_id,
      pup.id as profile_id,
      row_number() over (
        partition by pup.product_id
        order by
          case when pup.is_default then 0 else 1 end,
          case when pup.source = 'manual' then 0 when pup.source = 'supplier_primary' then 1 else 2 end,
          pup.created_at asc,
          pup.id asc
      ) as preference_rank
    from public.product_uom_profiles pup
    join public.products p on p.id = pup.product_id
    where pup.is_active = true
      and lower(coalesce(pup.usage_context, '')) = 'remission'
      and pup.qty_in_input_unit > 0
      and pup.qty_in_stock_unit > 0
      and coalesce(nullif(p.stock_unit_code, ''), nullif(p.unit, '')) is not null
  ) ranked
  where preference_rank = 1
)
update public.product_request_policies prp
set is_default = false, updated_at = now()
where prp.is_active = true
  and prp.is_default = true
  and exists (
    select 1 from chosen_profiles cp where cp.product_id = prp.product_id
  );

with chosen_profiles as (
  select product_id, profile_id
  from (
    select
      pup.product_id,
      pup.id as profile_id,
      row_number() over (
        partition by pup.product_id
        order by
          case when pup.is_default then 0 else 1 end,
          case when pup.source = 'manual' then 0 when pup.source = 'supplier_primary' then 1 else 2 end,
          pup.created_at asc,
          pup.id asc
      ) as preference_rank
    from public.product_uom_profiles pup
    join public.products p on p.id = pup.product_id
    where pup.is_active = true
      and lower(coalesce(pup.usage_context, '')) = 'remission'
      and pup.qty_in_input_unit > 0
      and pup.qty_in_stock_unit > 0
      and coalesce(nullif(p.stock_unit_code, ''), nullif(p.unit, '')) is not null
  ) ranked
  where preference_rank = 1
)
update public.product_request_policies prp
set is_default = true, updated_at = now()
from chosen_profiles cp
where prp.product_id = cp.product_id
  and prp.physical_uom_profile_id = cp.profile_id
  and prp.is_active = true;