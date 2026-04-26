-- Ops V2 - Dia 1 / Dia 3
-- Matriz operativa producto -> area -> LOC (solo lectura / auditoria)
-- No modifica datos.

with satellite_sites as (
  select s.id, s.code, s.name
  from public.sites s
  where s.is_active = true
    and s.site_type = 'satellite'
),
active_routes as (
  select
    r.requesting_site_id as satellite_site_id,
    r.fulfillment_site_id as source_site_id
  from public.site_supply_routes r
  where r.is_active = true
),
loc_defaults as (
  select
    l.site_id,
    min(l.code) filter (where l.is_active = true and l.location_type = 'receiving') as loc_receiving,
    min(l.code) filter (where l.is_active = true and l.location_type = 'storage') as loc_storage,
    min(l.code) filter (where l.is_active = true and l.location_type = 'picking') as loc_picking,
    min(l.code) filter (where l.is_active = true and l.location_type = 'staging') as loc_staging,
    min(l.code) filter (where l.is_active = true and l.location_type = 'production') as loc_production
  from public.inventory_locations l
  group by l.site_id
),
areas_by_kind as (
  select
    a.site_id,
    a.kind as area_kind,
    min(a.name) filter (where a.is_active = true) as area_name
  from public.areas a
  group by a.site_id, a.kind
),
matrix as (
  select
    sat.id as satellite_site_id,
    sat.code as satellite_code,
    sat.name as satellite_name,
    p.id as product_id,
    p.sku,
    p.name as product_name,
    p.product_type,
    pss.default_area_kind,
    ak.name as default_area_kind_name,
    abk.area_name as area_name_in_site,
    src.id as source_site_id,
    src.code as source_site_code,
    src.name as source_site_name,
    sat_loc.loc_receiving as satellite_loc_receiving,
    sat_loc.loc_storage as satellite_loc_storage,
    sat_loc.loc_picking as satellite_loc_picking,
    src_loc.loc_staging as source_loc_staging,
    src_loc.loc_storage as source_loc_storage,
    src_loc.loc_production as source_loc_production,
    case
      when pss.default_area_kind is null then 'missing_default_area_kind'
      when abk.area_name is null then 'missing_area_instance_in_site'
      when src.id is null then 'missing_supply_route'
      when sat_loc.loc_receiving is null then 'missing_satellite_receiving_loc'
      when sat_loc.loc_storage is null and sat_loc.loc_picking is null then 'missing_satellite_storage_or_picking_loc'
      when src_loc.loc_staging is null and src_loc.loc_storage is null then 'missing_source_dispatch_loc'
      else 'ok'
    end as matrix_status
  from public.product_site_settings pss
  join satellite_sites sat on sat.id = pss.site_id
  join public.products p on p.id = pss.product_id and p.is_active = true
  left join public.area_kinds ak on ak.code = pss.default_area_kind
  left join areas_by_kind abk on abk.site_id = sat.id and abk.area_kind = pss.default_area_kind
  left join active_routes ar on ar.satellite_site_id = sat.id
  left join public.sites src on src.id = ar.source_site_id
  left join loc_defaults sat_loc on sat_loc.site_id = sat.id
  left join loc_defaults src_loc on src_loc.site_id = src.id
  where pss.is_active = true
)

-- 1) Vista completa de matriz operativa
select
  satellite_name,
  sku,
  product_name,
  product_type,
  coalesce(default_area_kind_name, default_area_kind, '-') as area_sugerida,
  coalesce(area_name_in_site, '-') as area_instancia_en_sede,
  coalesce(source_site_name, '-') as sede_origen,
  coalesce(source_loc_staging, source_loc_storage, source_loc_production, '-') as loc_origen_sugerido,
  coalesce(satellite_loc_receiving, '-') as loc_recepcion_satelite,
  coalesce(satellite_loc_storage, satellite_loc_picking, '-') as loc_destino_satelite,
  matrix_status
from matrix
order by satellite_name, product_name;

-- 2) Resumen de brechas por sede
select
  satellite_name,
  matrix_status,
  count(*) as products_count
from matrix
group by satellite_name, matrix_status
order by satellite_name, matrix_status;

-- 3) Solo pendientes criticos para cerrar Dia 1 / Dia 3
select
  satellite_name,
  sku,
  product_name,
  matrix_status,
  default_area_kind,
  area_name_in_site,
  source_site_name,
  satellite_loc_receiving,
  satellite_loc_storage,
  satellite_loc_picking,
  source_loc_staging,
  source_loc_storage
from matrix
where matrix_status <> 'ok'
order by satellite_name, product_name
limit 500;
