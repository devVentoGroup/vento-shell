-- Ops V2 readiness check (NEXO + ORIGO + FOGO)
-- Ejecutar en Supabase SQL editor para ver brechas de salida operativa.

-- 1) Readiness general por sede
select *
from public.v_ops_site_readiness
order by site_type, site_name;

-- 2) Brechas de productos satelite para remision
select *
from public.v_ops_restock_product_gaps
order by site_name, product_name;

-- 3) Top productos con mas movimiento (30 dias)
select
  s.name as site_name,
  p.sku,
  p.name as product_name,
  count(*) as movement_count_30d,
  sum(abs(coalesce(m.quantity, 0))) as moved_qty_30d
from public.inventory_movements m
join public.sites s on s.id = m.site_id
join public.products p on p.id = m.product_id
where m.created_at >= now() - interval '30 day'
group by s.name, p.sku, p.name
order by movement_count_30d desc, moved_qty_30d desc
limit 100;

-- 4) Remisiones con posible cierre pendiente (sin received_at)
select
  r.id,
  r.request_code,
  fs.name as from_site,
  ts.name as to_site,
  r.status,
  r.created_at,
  r.prepared_at,
  r.in_transit_at,
  r.received_at
from public.restock_requests r
left join public.sites fs on fs.id = r.from_site_id
left join public.sites ts on ts.id = r.to_site_id
where r.created_at >= now() - interval '30 day'
  and r.status in ('approved', 'preparing', 'ready', 'in_transit')
  and r.received_at is null
order by r.created_at desc;

-- 5) Recetas en borrador (centro de produccion)
select
  s.name as site_name,
  p.sku,
  p.name as product_name,
  rc.status,
  rc.updated_at
from public.recipe_cards rc
join public.products p on p.id = rc.product_id
left join public.sites s on s.id = rc.site_id
where coalesce(s.site_type::text, '') = 'production_center'
  and rc.status = 'draft'
order by rc.updated_at desc;
