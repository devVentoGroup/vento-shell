begin;

insert into public.inventory_count_line_entries (
  count_line_id,
  session_id,
  product_id,
  location_position_id,
  input_quantity,
  input_unit_code,
  input_uom_profile_id,
  quantity_counted,
  stock_unit_code,
  entry_order,
  created_at
)
select
  line.id,
  line.session_id,
  line.product_id,
  line.location_position_id,
  coalesce(line.input_quantity, line.quantity_counted, 0),
  coalesce(line.input_unit_code, line.stock_unit_code, product.stock_unit_code, product.unit, 'un'),
  line.input_uom_profile_id,
  coalesce(line.quantity_counted, 0),
  coalesce(line.stock_unit_code, product.stock_unit_code, product.unit, 'un'),
  1,
  coalesce(session.created_at, now())
from public.inventory_count_lines line
join public.inventory_count_sessions session
  on session.id = line.session_id
left join public.products product
  on product.id = line.product_id
where not exists (
    select 1
    from public.inventory_count_line_entries entry
    where entry.count_line_id = line.id
  )
  and coalesce(line.quantity_counted, 0) >= 0
  and (
    line.input_uom_profile_id is not null
    or nullif(trim(coalesce(line.input_unit_code, '')), '') is not null
  );

commit;
