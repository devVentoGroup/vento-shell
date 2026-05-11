begin;

create or replace function public.fogo_create_production_batch_from_recipe(
  p_recipe_card_id uuid,
  p_produced_qty numeric,
  p_destination_location_id uuid,
  p_notes text default null
)
returns jsonb
language plpgsql
security definer
set search_path = public, pg_temp
as $$
declare
  v_employee_id uuid := auth.uid();
  v_recipe record;
  v_destination record;
  v_configured_production_location_id uuid;
  v_scale numeric;
  v_total_cost numeric := 0;
  v_unit_cost numeric := null;
  v_batch_id uuid;
  v_batch_code text;
  v_ingredient record;
  v_location record;
  v_remaining numeric;
  v_required_qty numeric;
  v_take numeric;
  v_stock_unit_code text;
  v_movement_id uuid;
begin
  if v_employee_id is null then
    raise exception 'not authenticated';
  end if;

  if p_recipe_card_id is null then
    raise exception 'recipe_card_id is required';
  end if;

  if coalesce(p_produced_qty, 0) <= 0 then
    raise exception 'produced_qty must be greater than zero';
  end if;

  if p_destination_location_id is null then
    raise exception 'destination_location_id is required';
  end if;

  select
    rc.id,
    rc.product_id,
    rc.site_id,
    rc.area_id,
    rc.yield_qty,
    rc.yield_unit,
    rc.status,
    p.name as product_name,
    p.unit as product_unit,
    p.stock_unit_code as product_stock_unit_code
  into v_recipe
  from public.recipe_cards rc
  join public.products p on p.id = rc.product_id
  where rc.id = p_recipe_card_id
    and coalesce(rc.is_active, true) = true;

  if not found then
    raise exception 'recipe not found';
  end if;

  if v_recipe.status <> 'published' then
    raise exception 'recipe must be published';
  end if;

  if v_recipe.site_id is null then
    raise exception 'recipe must have a site';
  end if;

  if v_recipe.area_id is null then
    raise exception 'recipe must have an area';
  end if;

  if coalesce(v_recipe.yield_qty, 0) <= 0 then
    raise exception 'recipe yield must be greater than zero';
  end if;

  if not public.has_permission('fogo.production.batches.create', v_recipe.site_id, v_recipe.area_id) then
    raise exception 'permission denied';
  end if;

  if not public.can_access_recipe_scope(v_recipe.site_id, v_recipe.area_id) then
    raise exception 'recipe scope denied';
  end if;

  select id, site_id, code
  into v_destination
  from public.inventory_locations
  where id = p_destination_location_id
    and coalesce(is_active, true) = true;

  if not found then
    raise exception 'destination LOC not found';
  end if;

  if v_destination.site_id <> v_recipe.site_id then
    raise exception 'destination LOC must belong to recipe site';
  end if;

  select production_location_id
    into v_configured_production_location_id
  from public.product_site_settings
  where product_id = v_recipe.product_id
    and site_id = v_recipe.site_id
    and coalesce(is_active, true) = true
    and production_location_id is not null
  order by updated_at desc nulls last, created_at desc nulls last
  limit 1;

  if v_configured_production_location_id is not null
     and v_configured_production_location_id <> p_destination_location_id then
    raise exception 'destination LOC must match configured production LOC for this product';
  end if;

  v_scale := p_produced_qty / v_recipe.yield_qty;

  insert into public.production_batches (
    site_id,
    product_id,
    recipe_card_id,
    produced_qty,
    produced_unit,
    status,
    notes,
    created_by,
    destination_location_id,
    recipe_consumed
  )
  values (
    v_recipe.site_id,
    v_recipe.product_id,
    v_recipe.id,
    p_produced_qty,
    coalesce(nullif(v_recipe.yield_unit, ''), nullif(v_recipe.product_stock_unit_code, ''), nullif(v_recipe.product_unit, ''), 'un'),
    'posted',
    nullif(trim(coalesce(p_notes, '')), ''),
    v_employee_id,
    p_destination_location_id,
    true
  )
  returning id, batch_code into v_batch_id, v_batch_code;

  for v_ingredient in
    select
      r.ingredient_product_id,
      r.quantity,
      p.name,
      p.unit,
      p.stock_unit_code,
      coalesce(p.cost, 0) as cost
    from public.recipes r
    join public.products p on p.id = r.ingredient_product_id
    where r.product_id = v_recipe.product_id
      and coalesce(r.is_active, true) = true
    order by r.created_at asc, r.id asc
  loop
    v_required_qty := coalesce(v_ingredient.quantity, 0) * v_scale;
    if v_required_qty <= 0 then
      continue;
    end if;

    v_remaining := v_required_qty;
    v_stock_unit_code := coalesce(
      nullif(v_ingredient.stock_unit_code, ''),
      nullif(v_ingredient.unit, ''),
      'un'
    );
    v_total_cost := v_total_cost + (v_required_qty * coalesce(v_ingredient.cost, 0));

    perform pg_advisory_xact_lock(hashtextextended(v_recipe.site_id::text || ':' || v_ingredient.ingredient_product_id::text, 0));

    for v_location in
      select
        loc.id as location_id,
        loc.code as location_code,
        coalesce(stock.current_qty, 0) as current_qty
      from public.inventory_locations loc
      join public.inventory_stock_by_location stock
        on stock.location_id = loc.id
       and stock.product_id = v_ingredient.ingredient_product_id
       and stock.current_qty > 0
      left join public.site_production_pick_order pick
        on pick.site_id = v_recipe.site_id
       and pick.location_id = loc.id
       and coalesce(pick.is_active, true) = true
      where loc.site_id = v_recipe.site_id
        and coalesce(loc.is_active, true) = true
        and (
          v_configured_production_location_id is null
          or loc.id = v_configured_production_location_id
        )
      order by
        case when pick.location_id is null then 1 else 0 end,
        coalesce(pick.priority, 100000) asc,
        stock.current_qty desc,
        loc.code asc
      for update of stock
    loop
      exit when v_remaining <= 0;
      v_take := least(v_remaining, v_location.current_qty);
      if v_take <= 0 then
        continue;
      end if;

      update public.inventory_stock_by_location
      set current_qty = current_qty - v_take,
          updated_at = now()
      where location_id = v_location.location_id
        and product_id = v_ingredient.ingredient_product_id
        and current_qty >= v_take;

      if not found then
        raise exception 'stock changed while consuming ingredient %', v_ingredient.name;
      end if;

      insert into public.inventory_movements (
        site_id,
        product_id,
        movement_type,
        quantity,
        input_qty,
        input_unit_code,
        conversion_factor_to_stock,
        stock_unit_code,
        unit_cost,
        note,
        related_production_batch_id,
        created_by
      )
      values (
        v_recipe.site_id,
        v_ingredient.ingredient_product_id,
        'production_consume',
        -v_take,
        v_take,
        v_stock_unit_code,
        1,
        v_stock_unit_code,
        coalesce(v_ingredient.cost, 0),
        format('Consumo lote %s desde %s', coalesce(v_batch_code, v_batch_id::text), coalesce(v_location.location_code, v_location.location_id::text)),
        v_batch_id,
        v_employee_id
      )
      returning id into v_movement_id;

      insert into public.production_batch_consumptions (
        batch_id,
        ingredient_product_id,
        location_id,
        required_qty,
        consumed_qty,
        stock_unit_code,
        movement_id,
        created_by
      )
      values (
        v_batch_id,
        v_ingredient.ingredient_product_id,
        v_location.location_id,
        v_take,
        v_take,
        v_stock_unit_code,
        v_movement_id,
        v_employee_id
      );

      v_remaining := v_remaining - v_take;
    end loop;

    if v_remaining > 0.000001 then
      raise exception 'insufficient stock for ingredient %: required %, missing %',
        v_ingredient.name,
        v_required_qty,
        v_remaining;
    end if;
  end loop;

  v_unit_cost := case when p_produced_qty > 0 then v_total_cost / p_produced_qty else null end;

  update public.production_batches
  set total_cost = v_total_cost,
      unit_cost = v_unit_cost
  where id = v_batch_id;

  insert into public.inventory_stock_by_location (location_id, product_id, current_qty, updated_at)
  values (p_destination_location_id, v_recipe.product_id, p_produced_qty, now())
  on conflict (location_id, product_id) do update
    set current_qty = public.inventory_stock_by_location.current_qty + excluded.current_qty,
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
    unit_cost,
    note,
    related_production_batch_id,
    created_by
  )
  values (
    v_recipe.site_id,
    v_recipe.product_id,
    'production_output',
    p_produced_qty,
    p_produced_qty,
    coalesce(nullif(v_recipe.product_stock_unit_code, ''), nullif(v_recipe.product_unit, ''), coalesce(nullif(v_recipe.yield_unit, ''), 'un')),
    1,
    coalesce(nullif(v_recipe.product_stock_unit_code, ''), nullif(v_recipe.product_unit, ''), coalesce(nullif(v_recipe.yield_unit, ''), 'un')),
    v_unit_cost,
    format('Ingreso lote %s a %s', coalesce(v_batch_code, v_batch_id::text), coalesce(v_destination.code, p_destination_location_id::text)),
    v_batch_id,
    v_employee_id
  );

  return jsonb_build_object(
    'batchId', v_batch_id,
    'batchCode', v_batch_code,
    'recipeCardId', v_recipe.id,
    'productId', v_recipe.product_id,
    'siteId', v_recipe.site_id,
    'areaId', v_recipe.area_id,
    'producedQty', p_produced_qty,
    'producedUnit', coalesce(nullif(v_recipe.yield_unit, ''), nullif(v_recipe.product_stock_unit_code, ''), nullif(v_recipe.product_unit, ''), 'un'),
    'destinationLocationId', p_destination_location_id,
    'totalCost', v_total_cost,
    'unitCost', v_unit_cost
  );
end;
$$;

grant execute on function public.fogo_create_production_batch_from_recipe(uuid, numeric, uuid, text)
  to authenticated;

commit;
