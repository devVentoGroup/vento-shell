begin;

with center as (
  select id
  from public.sites
  where name ilike '%Centro de Producci%'
  order by name
  limit 1
),
locs as (
  select
    (
      select id
      from public.inventory_locations
      where site_id = (select id from center)
        and code = 'LOC-CP-PROD-PAN-01'
        and is_active = true
        and location_type = 'production'
      limit 1
    ) as pan_loc_id,
    (
      select id
      from public.inventory_locations
      where site_id = (select id from center)
        and code = 'LOC-CP-PROD-REP-01'
        and is_active = true
        and location_type = 'production'
      limit 1
    ) as rep_loc_id
),
targets as (
  select
    pss.id,
    case
      when pss.default_area_kind = 'reposteria' then (select rep_loc_id from locs)
      else (select pan_loc_id from locs)
    end as production_location_id,
    coalesce(pss.default_area_kind, 'panaderia') as default_area_kind
  from public.product_site_settings pss
  join public.products p on p.id = pss.product_id
  left join public.product_inventory_profiles pip on pip.product_id = p.id
  where pss.site_id = (select id from center)
    and coalesce(pip.inventory_kind, '') = 'finished'
    and p.sku like 'VEN-%'
    and (
      p.name ilike '%croissant%'
      or p.name ilike '%galleta%'
      or p.name ilike '%cookie%'
    )
)
update public.product_site_settings pss
set
  production_location_id = targets.production_location_id,
  default_area_kind = targets.default_area_kind,
  area_kinds = coalesce(pss.area_kinds, array[targets.default_area_kind]),
  updated_at = now()
from targets
where pss.id = targets.id
  and targets.production_location_id is not null;

commit;
