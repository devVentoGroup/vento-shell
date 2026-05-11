begin;

create or replace function public.viso_accounting_dashboard(
  p_site_id uuid default null,
  p_month date default current_date
) returns jsonb
language plpgsql
security definer
set search_path = public
as $$
declare
  v_month_start date := date_trunc('month', coalesce(p_month, current_date))::date;
  v_month_end date := (date_trunc('month', coalesce(p_month, current_date)) + interval '1 month')::date;
  v_result jsonb;
begin
  if not public.has_permission('viso.access') then
    raise exception 'permission denied';
  end if;

  with site_scope as (
    select s.id, s.name, s.code
    from public.sites s
    where s.is_active = true
      and (p_site_id is null or s.id = p_site_id)
  ),
  primary_supplier as (
    select distinct on (ps.product_id)
      ps.product_id,
      ps.supplier_id,
      sup.name as supplier_name,
      coalesce(ps.purchase_tax_rate, 0) as iva_rate,
      coalesce(ps.purchase_icui_rate, 0) as icui_rate
    from public.product_suppliers ps
    left join public.suppliers sup on sup.id = ps.supplier_id
    order by ps.product_id, ps.is_primary desc, ps.created_at desc
  ),
  inventory_lines as (
    select
      ss.id as site_id,
      ss.name as site_name,
      p.id as product_id,
      p.name as product_name,
      p.sku,
      p.unit,
      iss.current_qty,
      coalesce(nullif(iss.avg_unit_cost, 0), nullif(p.cost, 0), 0) as unit_cost,
      greatest(iss.current_qty, 0) * coalesce(nullif(iss.avg_unit_cost, 0), nullif(p.cost, 0), 0) as stock_value,
      greatest(iss.current_qty, 0) * coalesce(nullif(iss.avg_unit_cost, 0), nullif(p.cost, 0), 0) * coalesce(ps.iva_rate, 0) / 100.0 as iva_exposure,
      greatest(iss.current_qty, 0) * coalesce(nullif(iss.avg_unit_cost, 0), nullif(p.cost, 0), 0) * coalesce(ps.icui_rate, 0) / 100.0 as icui_exposure,
      coalesce(ps.iva_rate, 0) as iva_rate,
      coalesce(ps.icui_rate, 0) as icui_rate
    from public.inventory_stock_by_site iss
    join site_scope ss on ss.id = iss.site_id
    join public.products p on p.id = iss.product_id
    left join primary_supplier ps on ps.product_id = iss.product_id
  ),
  month_receipt_lines as (
    select
      ie.site_id,
      coalesce(iei.line_total_cost, iei.stock_unit_cost * iei.quantity_received, p.cost * iei.quantity_received, 0) as net_amount,
      coalesce(ps.iva_rate, 0) as iva_rate,
      coalesce(ps.icui_rate, 0) as icui_rate
    from public.inventory_entries ie
    join site_scope ss on ss.id = ie.site_id
    join public.inventory_entry_items iei on iei.entry_id = ie.id
    join public.products p on p.id = iei.product_id
    left join primary_supplier ps on ps.product_id = iei.product_id
    where coalesce(ie.received_at, ie.created_at) >= v_month_start::timestamptz
      and coalesce(ie.received_at, ie.created_at) < v_month_end::timestamptz
      and coalesce(ie.status, '') not in ('cancelled', 'void', 'deleted')
  ),
  purchase_order_lines as (
    select
      po.site_id,
      coalesce(poi.line_total, poi.unit_cost * coalesce(poi.quantity_received, poi.quantity_ordered), 0) as committed_amount
    from public.purchase_orders po
    join site_scope ss on ss.id = po.site_id
    join public.purchase_order_items poi on poi.purchase_order_id = po.id
    where po.created_at >= v_month_start::timestamptz
      and po.created_at < v_month_end::timestamptz
      and coalesce(po.status, '') not in ('cancelled', 'void', 'deleted')
  ),
  inventory_summary as (
    select
      coalesce(sum(stock_value), 0) as total_value,
      coalesce(sum(current_qty) filter (where current_qty > 0), 0) as positive_qty,
      count(*) filter (where current_qty > 0) as stock_rows,
      count(distinct product_id) filter (where current_qty > 0) as products_with_stock,
      count(*) filter (where current_qty > 0 and unit_cost = 0) as rows_missing_cost,
      count(*) filter (where current_qty < 0) as negative_stock_rows,
      coalesce(sum(iva_exposure), 0) as iva_exposure,
      coalesce(sum(icui_exposure), 0) as icui_exposure
    from inventory_lines
  ),
  receipt_summary as (
    select
      coalesce(sum(net_amount), 0) as net_amount,
      coalesce(sum(net_amount * iva_rate / 100.0), 0) as iva_amount,
      coalesce(sum(net_amount * icui_rate / 100.0), 0) as icui_amount,
      count(*) as line_count
    from month_receipt_lines
  ),
  po_summary as (
    select
      coalesce(sum(committed_amount), 0) as committed_amount,
      count(*) as line_count
    from purchase_order_lines
  )
  select jsonb_build_object(
    'period', jsonb_build_object(
      'month_start', v_month_start,
      'month_end', v_month_end
    ),
    'summary', jsonb_build_object(
      'inventory_value', inv.total_value,
      'inventory_positive_qty', inv.positive_qty,
      'stock_rows', inv.stock_rows,
      'products_with_stock', inv.products_with_stock,
      'products_missing_cost', inv.rows_missing_cost,
      'negative_stock_rows', inv.negative_stock_rows,
      'inventory_estimated_iva', inv.iva_exposure,
      'inventory_estimated_icui', inv.icui_exposure,
      'inventory_estimated_tax', inv.iva_exposure + inv.icui_exposure,
      'month_receipts_net', rec.net_amount,
      'month_receipts_iva', rec.iva_amount,
      'month_receipts_icui', rec.icui_amount,
      'month_receipts_tax', rec.iva_amount + rec.icui_amount,
      'month_receipts_gross', rec.net_amount + rec.iva_amount + rec.icui_amount,
      'month_receipt_lines', rec.line_count,
      'month_purchase_orders_committed', po.committed_amount,
      'month_purchase_order_lines', po.line_count
    ),
    'inventory_by_site', coalesce((
      select jsonb_agg(row_to_json(x)::jsonb order by x.inventory_value desc)
      from (
        select
          site_id,
          site_name,
          coalesce(sum(stock_value), 0) as inventory_value,
          count(distinct product_id) filter (where current_qty > 0) as products,
          count(*) filter (where current_qty > 0 and unit_cost = 0) as missing_cost_rows
        from inventory_lines
        group by site_id, site_name
      ) x
    ), '[]'::jsonb),
    'top_inventory_products', coalesce((
      select jsonb_agg(row_to_json(x)::jsonb order by x.stock_value desc)
      from (
        select
          site_name,
          product_id,
          product_name,
          sku,
          unit,
          current_qty,
          unit_cost,
          stock_value,
          iva_rate,
          icui_rate
        from inventory_lines
        where stock_value > 0
        order by stock_value desc
        limit 12
      ) x
    ), '[]'::jsonb),
    'tax_by_site', coalesce((
      select jsonb_agg(row_to_json(x)::jsonb order by x.estimated_tax desc)
      from (
        select
          ss.id as site_id,
          ss.name as site_name,
          coalesce(sum(ml.net_amount * ml.iva_rate / 100.0), 0) as iva,
          coalesce(sum(ml.net_amount * ml.icui_rate / 100.0), 0) as icui,
          coalesce(sum(ml.net_amount * (ml.iva_rate + ml.icui_rate) / 100.0), 0) as estimated_tax
        from site_scope ss
        left join month_receipt_lines ml on ml.site_id = ss.id
        group by ss.id, ss.name
      ) x
    ), '[]'::jsonb)
  )
  into v_result
  from inventory_summary inv
  cross join receipt_summary rec
  cross join po_summary po;

  return v_result;
end;
$$;

revoke all on function public.viso_accounting_dashboard(uuid, date) from public;
grant execute on function public.viso_accounting_dashboard(uuid, date) to authenticated;

commit;
