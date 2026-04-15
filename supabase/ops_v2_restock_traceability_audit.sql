-- Ops V2 - Auditoria de trazabilidad de remisiones (E2E)
-- Enfocado en Centro -> Satelites

with rr as (
  select
    r.id,
    r.request_code,
    r.status,
    r.created_at,
    r.prepared_at,
    r.in_transit_at,
    r.received_at,
    fs.name as from_site,
    ts.name as to_site
  from public.restock_requests r
  left join public.sites fs on fs.id = r.from_site_id
  left join public.sites ts on ts.id = r.to_site_id
  where fs.name = 'Centro de Producción'
    and ts.name in ('Vento Café','Saudo','Molka Principal')
),
item_stats as (
  select
    i.request_id,
    count(*) as line_count,
    sum(coalesce(i.quantity,0)) as qty_requested,
    sum(coalesce(i.prepared_quantity,0)) as qty_prepared,
    sum(coalesce(i.shipped_quantity,0)) as qty_shipped,
    sum(coalesce(i.received_quantity,0)) as qty_received,
    sum(coalesce(i.shortage_quantity,0)) as qty_shortage
  from public.restock_request_items i
  group by i.request_id
),
mov_stats as (
  select
    m.related_restock_request_id as request_id,
    count(*) filter (where m.movement_type = 'transfer_out') as transfer_out_count,
    count(*) filter (where m.movement_type = 'transfer_in') as transfer_in_count,
    sum(case when m.movement_type = 'transfer_out' then abs(coalesce(m.quantity,0)) else 0 end) as qty_transfer_out,
    sum(case when m.movement_type = 'transfer_in' then abs(coalesce(m.quantity,0)) else 0 end) as qty_transfer_in
  from public.inventory_movements m
  where m.related_restock_request_id is not null
  group by m.related_restock_request_id
)
select
  rr.id,
  rr.request_code,
  rr.status,
  rr.created_at,
  rr.from_site,
  rr.to_site,
  coalesce(isx.line_count,0) as line_count,
  coalesce(isx.qty_requested,0) as qty_requested,
  coalesce(isx.qty_prepared,0) as qty_prepared,
  coalesce(isx.qty_shipped,0) as qty_shipped,
  coalesce(isx.qty_received,0) as qty_received,
  coalesce(ms.transfer_out_count,0) as transfer_out_count,
  coalesce(ms.transfer_in_count,0) as transfer_in_count,
  coalesce(ms.qty_transfer_out,0) as qty_transfer_out,
  coalesce(ms.qty_transfer_in,0) as qty_transfer_in,
  case
    when coalesce(isx.line_count,0) = 0 then 'invalid_no_items'
    when coalesce(ms.transfer_out_count,0) = 0 then 'missing_transfer_out'
    when coalesce(ms.transfer_in_count,0) = 0 then 'missing_transfer_in'
    else 'ok_e2e'
  end as trace_status
from rr
left join item_stats isx on isx.request_id = rr.id
left join mov_stats ms on ms.request_id = rr.id
order by rr.created_at desc;

-- Resumen rapido
with base as (
  select
    case
      when coalesce(isx.line_count,0) = 0 then 'invalid_no_items'
      when coalesce(ms.transfer_out_count,0) = 0 then 'missing_transfer_out'
      when coalesce(ms.transfer_in_count,0) = 0 then 'missing_transfer_in'
      else 'ok_e2e'
    end as trace_status
  from public.restock_requests r
  left join public.sites fs on fs.id = r.from_site_id
  left join public.sites ts on ts.id = r.to_site_id
  left join (
    select request_id, count(*) as line_count
    from public.restock_request_items
    group by request_id
  ) isx on isx.request_id = r.id
  left join (
    select
      related_restock_request_id as request_id,
      count(*) filter (where movement_type = 'transfer_out') as transfer_out_count,
      count(*) filter (where movement_type = 'transfer_in') as transfer_in_count
    from public.inventory_movements
    where related_restock_request_id is not null
    group by related_restock_request_id
  ) ms on ms.request_id = r.id
  where fs.name = 'Centro de Producción'
    and ts.name in ('Vento Café','Saudo','Molka Principal')
)
select trace_status, count(*) as requests
from base
group by trace_status
order by requests desc;
