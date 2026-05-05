begin;

insert into public.inventory_movement_types (code, name, description, affects_stock)
values (
  'stock_reconcile_position_count',
  'Reconciliacion de posiciones por conteo',
  'Reemplaza el reparto interno de stock por posicion como resultado de un conteo fisico de LOC',
  0
)
on conflict (code) do nothing;

create or replace function public.reconcile_inventory_stock_positions_for_count(
  p_location_id uuid,
  p_lines jsonb,
  p_created_by uuid default auth.uid(),
  p_note text default null
)
returns jsonb
language plpgsql
security definer
set search_path = public, pg_temp
as $$
declare
  v_location record;
  v_product_id uuid;
  v_total_lines integer := 0;
  v_positioned_lines integer := 0;
  v_positioned_qty numeric := 0;
  v_bad_product_id uuid;
  v_bad_positioned_qty numeric;
  v_bad_location_qty numeric;
begin
  if p_location_id is null then
    raise exception 'location is required';
  end if;

  if jsonb_typeof(coalesce(p_lines, '[]'::jsonb)) <> 'array' then
    raise exception 'p_lines debe ser un arreglo JSON';
  end if;

  select loc.id, loc.site_id, loc.code
    into v_location
  from public.inventory_locations loc
  where loc.id = p_location_id
    and coalesce(loc.is_active, true) = true;

  if not found then
    raise exception 'active LOC not found';
  end if;

  if not public.has_permission('nexo.inventory.stock', v_location.site_id) then
    raise exception 'permission denied';
  end if;

  create temporary table tmp_position_count_lines (
    product_id uuid not null,
    position_id uuid null,
    quantity numeric not null
  ) on commit drop;

  insert into tmp_position_count_lines (product_id, position_id, quantity)
  select
    (entry ->> 'product_id')::uuid,
    nullif(trim(coalesce(entry ->> 'position_id', '')), '')::uuid,
    (entry ->> 'quantity')::numeric
  from jsonb_array_elements(coalesce(p_lines, '[]'::jsonb)) entry
  where nullif(trim(coalesce(entry ->> 'product_id', '')), '') is not null
    and coalesce((entry ->> 'quantity')::numeric, 0) > 0;

  select count(*) into v_total_lines
  from tmp_position_count_lines;

  if v_total_lines = 0 then
    raise exception 'Al menos una linea con cantidad > 0';
  end if;

  if exists (
    select 1
    from tmp_position_count_lines line
    where line.position_id is not null
      and not exists (
        select 1
        from public.inventory_location_positions pos
        where pos.id = line.position_id
          and pos.location_id = p_location_id
          and pos.site_id = v_location.site_id
          and coalesce(pos.is_active, true) = true
      )
  ) then
    raise exception 'Una o mas posiciones internas no pertenecen al LOC del conteo';
  end if;

  create temporary table tmp_position_count_agg (
    product_id uuid not null,
    position_id uuid not null,
    quantity numeric not null,
    primary key (product_id, position_id)
  ) on commit drop;

  insert into tmp_position_count_agg (product_id, position_id, quantity)
  select
    line.product_id,
    line.position_id,
    sum(line.quantity)
  from tmp_position_count_lines line
  where line.position_id is not null
  group by line.product_id, line.position_id
  having sum(line.quantity) > 0;

  for v_product_id in
    select distinct line.product_id
    from tmp_position_count_lines line
  loop
    perform pg_advisory_xact_lock(hashtextextended(p_location_id::text || ':' || v_product_id::text, 0));
  end loop;

  select
    agg.product_id,
    agg.positioned_qty,
    coalesce(stock.current_qty, 0)
  into
    v_bad_product_id,
    v_bad_positioned_qty,
    v_bad_location_qty
  from (
    select
      product_id,
      sum(quantity) as positioned_qty
    from tmp_position_count_agg
    group by product_id
  ) agg
  left join public.inventory_stock_by_location stock
    on stock.location_id = p_location_id
   and stock.product_id = agg.product_id
  where agg.positioned_qty > coalesce(stock.current_qty, 0) + 0.000001
  limit 1;

  if v_bad_product_id is not null then
    raise exception
      'positioned quantity % exceeds LOC stock % for product %',
      v_bad_positioned_qty,
      v_bad_location_qty,
      v_bad_product_id;
  end if;

  delete from public.inventory_stock_by_position stock_pos
  using public.inventory_location_positions pos
  where pos.id = stock_pos.position_id
    and pos.location_id = p_location_id
    and stock_pos.product_id in (
      select distinct line.product_id
      from tmp_position_count_lines line
    );

  insert into public.inventory_stock_by_position (
    position_id,
    product_id,
    current_qty,
    updated_at
  )
  select
    agg.position_id,
    agg.product_id,
    agg.quantity,
    now()
  from tmp_position_count_agg agg
  on conflict (position_id, product_id) do update
    set current_qty = excluded.current_qty,
        updated_at = now();

  insert into public.inventory_movements (
    site_id,
    product_id,
    movement_type,
    quantity,
    input_qty,
    input_unit_code,
    conversion_factor_to_stock,
    stock_unit_code,
    note,
    created_by
  )
  select
    v_location.site_id,
    agg.product_id,
    'stock_reconcile_position_count',
    agg.quantity,
    agg.quantity,
    coalesce(nullif(product.stock_unit_code, ''), nullif(product.unit, ''), 'un'),
    1,
    coalesce(nullif(product.stock_unit_code, ''), nullif(product.unit, ''), 'un'),
    coalesce(
      nullif(trim(p_note), ''),
      format('Reconciliacion interna por conteo LOC %s', v_location.code)
    ),
    p_created_by
  from tmp_position_count_agg agg
  left join public.products product
    on product.id = agg.product_id;

  select
    count(*),
    coalesce(sum(quantity), 0)
  into
    v_positioned_lines,
    v_positioned_qty
  from tmp_position_count_agg;

  return jsonb_build_object(
    'locationId', p_location_id,
    'totalLines', v_total_lines,
    'positionedLines', v_positioned_lines,
    'positionedQty', v_positioned_qty
  );
end;
$$;

grant execute on function public.reconcile_inventory_stock_positions_for_count(uuid, jsonb, uuid, text)
  to authenticated;

commit;