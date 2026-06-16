begin;

alter table if exists public.product_cost_events
  add column if not exists source_production_batch_id uuid
    references public.production_batches(id) on delete set null;

create index if not exists idx_product_cost_events_source_production_batch
  on public.product_cost_events(source_production_batch_id)
  where source_production_batch_id is not null;

create or replace function public.fogo_create_real_production_batch(
  p_recipe_card_id uuid,
  p_produced_qty numeric,
  p_destination_location_id uuid,
  p_ingredients jsonb default '[]'::jsonb,
  p_packages jsonb default '[]'::jsonb,
  p_outputs jsonb default '[]'::jsonb,
  p_notes text default null::text
) returns jsonb
language plpgsql
security definer
set search_path to 'public', 'pg_temp'
as $$
declare
  v_employee_id uuid := auth.uid();
  v_result jsonb;
  v_batch_id uuid;
  v_batch record;
  v_recipe record;
  v_output record;
  v_recipe_output record;
  v_output_location record;
  v_output_product record;
  v_input_unit record;
  v_stock_unit record;
  v_movement_id uuid;
  v_total_cost numeric := 0;
  v_allocated_cost numeric := 0;
  v_unit_cost numeric := null;
  v_stock_unit_cost numeric := null;
  v_stock_qty numeric := 0;
  v_conversion_factor_to_stock numeric := 1;
  v_pct_sum numeric := 0;
  v_primary_qty numeric;
  v_primary_unit_cost numeric := null;
  v_has_outputs boolean := false;
  v_global_qty_before numeric := 0;
  v_site_qty_before numeric := 0;
  v_cost_before numeric := 0;
  v_cost_after numeric := 0;
  v_site_avg_before numeric := 0;
  v_site_avg_after numeric := 0;
begin
  if p_outputs is null or jsonb_typeof(p_outputs) <> 'array' then
    raise exception 'outputs must be a json array';
  end if;

  v_has_outputs := jsonb_array_length(p_outputs) > 0;

  v_result := public.fogo_create_real_production_batch(
    p_recipe_card_id,
    p_produced_qty,
    p_destination_location_id,
    p_ingredients,
    p_packages,
    p_notes
  );

  if not v_has_outputs then
    return v_result;
  end if;

  v_batch_id := nullif(v_result->>'batchId', '')::uuid;

  select *
    into v_batch
  from public.production_batches
  where id = v_batch_id;

  if not found then
    raise exception 'production batch not found after creation';
  end if;

  select rc.id, rc.product_id, rc.site_id, rc.area_id, p.unit, p.stock_unit_code
    into v_recipe
  from public.recipe_cards rc
  join public.products p on p.id = rc.product_id
  where rc.id = p_recipe_card_id;

  v_primary_qty := p_produced_qty;
  v_total_cost := coalesce(v_batch.total_cost, 0);

  for v_output in
    select *
    from jsonb_to_recordset(p_outputs) as x(
      recipe_output_id uuid,
      product_id uuid,
      output_role text,
      produced_qty numeric,
      produced_unit text,
      destination_location_id uuid,
      cost_allocation_pct numeric
    )
  loop
    if v_output.product_id is null then
      raise exception 'output product_id is required';
    end if;

    if coalesce(v_output.produced_qty, 0) <= 0 then
      raise exception 'output produced_qty must be greater than zero';
    end if;

    if nullif(trim(coalesce(v_output.produced_unit, '')), '') is null then
      raise exception 'output produced_unit is required';
    end if;

    if coalesce(v_output.cost_allocation_pct, 0) < 0 or coalesce(v_output.cost_allocation_pct, 0) > 100 then
      raise exception 'output cost allocation pct must be between 0 and 100';
    end if;

    if v_output.recipe_output_id is not null then
      select *
        into v_recipe_output
      from public.recipe_outputs ro
      where ro.id = v_output.recipe_output_id
        and ro.recipe_card_id = p_recipe_card_id
        and ro.product_id = v_output.product_id
        and coalesce(ro.is_active, true) = true;

      if not found then
        raise exception 'output does not belong to recipe';
      end if;
    elsif v_output.product_id <> v_recipe.product_id then
      raise exception 'secondary outputs must be configured on recipe_outputs';
    end if;

    v_pct_sum := v_pct_sum + coalesce(v_output.cost_allocation_pct, 0);
  end loop;

  if abs(v_pct_sum - 100) > 0.001 then
    raise exception 'output cost allocation must sum 100%%, got %', v_pct_sum;
  end if;

  delete from public.production_batch_outputs
  where batch_id = v_batch_id;

  for v_output in
    select *
    from jsonb_to_recordset(p_outputs) as x(
      recipe_output_id uuid,
      product_id uuid,
      output_role text,
      produced_qty numeric,
      produced_unit text,
      destination_location_id uuid,
      cost_allocation_pct numeric
    )
  loop
    select id, cost, unit, stock_unit_code
      into v_output_product
    from public.products
    where id = v_output.product_id
    for update;

    if not found then
      raise exception 'output product not found: %', v_output.product_id;
    end if;

    select *
      into v_input_unit
    from public.inventory_units
    where code = v_output.produced_unit
      and coalesce(is_active, true) = true;

    if not found then
      raise exception 'output unit % is not a valid inventory unit', v_output.produced_unit;
    end if;

    select *
      into v_stock_unit
    from public.inventory_units
    where code = coalesce(nullif(v_output_product.stock_unit_code, ''), nullif(v_output_product.unit, ''), v_output.produced_unit)
      and coalesce(is_active, true) = true;

    if not found then
      raise exception 'stock unit for output product % is not valid', v_output.product_id;
    end if;

    if v_input_unit.family is distinct from v_stock_unit.family then
      raise exception 'output unit % cannot be converted to stock unit % for product %',
        v_output.produced_unit,
        v_stock_unit.code,
        v_output.product_id;
    end if;

    v_conversion_factor_to_stock := v_input_unit.factor_to_base / v_stock_unit.factor_to_base;
    v_stock_qty := round(v_output.produced_qty * v_conversion_factor_to_stock, 6);

    if v_stock_qty <= 0 then
      raise exception 'output stock quantity must be greater than zero';
    end if;

    if v_output.product_id = v_recipe.product_id and abs(v_stock_qty - v_output.produced_qty) > 0.001 then
      raise exception 'primary output unit must match product stock unit. Got %, expected %',
        v_output.produced_unit,
        v_stock_unit.code;
    end if;

    v_allocated_cost := round(v_total_cost * (coalesce(v_output.cost_allocation_pct, 0) / 100), 6);
    v_stock_unit_cost := case when v_stock_qty > 0 then round(v_allocated_cost / v_stock_qty, 6) else null end;
    v_unit_cost := case when v_output.produced_qty > 0 then round(v_allocated_cost / v_output.produced_qty, 6) else null end;
    v_movement_id := null;

    if v_output.product_id = v_recipe.product_id then
      v_primary_qty := v_output.produced_qty;
      v_primary_unit_cost := v_unit_cost;
    end if;

    if v_batch.output_mode in ('inventory_stock', 'sellable_stock') then
      v_output.destination_location_id := coalesce(v_output.destination_location_id, v_batch.destination_location_id);

      if v_output.destination_location_id is null then
        raise exception 'destination_location_id is required for output product %', v_output.product_id;
      end if;

      select id, site_id, code
        into v_output_location
      from public.inventory_locations
      where id = v_output.destination_location_id
        and coalesce(is_active, true) = true;

      if not found then
        raise exception 'output destination LOC not found';
      end if;

      if v_output_location.site_id <> v_batch.site_id then
        raise exception 'output destination LOC must belong to batch site';
      end if;

      select coalesce(sum(current_qty), 0)
        into v_global_qty_before
      from public.inventory_stock_by_site
      where product_id = v_output.product_id;

      select coalesce(current_qty, 0), coalesce(avg_unit_cost, 0)
        into v_site_qty_before, v_site_avg_before
      from public.inventory_stock_by_site
      where site_id = v_batch.site_id
        and product_id = v_output.product_id;

      if not found then
        v_site_qty_before := 0;
        v_site_avg_before := 0;
      end if;

      if v_output.product_id = v_recipe.product_id then
        v_global_qty_before := greatest(v_global_qty_before - v_stock_qty, 0);
        v_site_qty_before := greatest(v_site_qty_before - v_stock_qty, 0);

        update public.inventory_movements
        set unit_cost = v_unit_cost,
            stock_unit_cost = v_stock_unit_cost,
            line_total_cost = v_allocated_cost,
            input_qty = v_output.produced_qty,
            input_unit_code = v_output.produced_unit,
            conversion_factor_to_stock = v_conversion_factor_to_stock,
            stock_unit_code = v_stock_unit.code
        where related_production_batch_id = v_batch.id
          and product_id = v_recipe.product_id
          and movement_type = 'production_output'
        returning id into v_movement_id;
      else
        insert into public.inventory_stock_by_location (location_id, product_id, current_qty, updated_at)
        values (v_output.destination_location_id, v_output.product_id, v_stock_qty, now())
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
          stock_unit_cost,
          line_total_cost,
          note,
          related_production_batch_id,
          created_by
        ) values (
          v_batch.site_id,
          v_output.product_id,
          'production_output',
          v_stock_qty,
          v_output.produced_qty,
          v_output.produced_unit,
          v_conversion_factor_to_stock,
          v_stock_unit.code,
          v_unit_cost,
          v_stock_unit_cost,
          v_allocated_cost,
          format('Ingreso coproducto lote %s a %s', coalesce(v_batch.batch_code, v_batch.id::text), coalesce(v_output_location.code, v_output.destination_location_id::text)),
          v_batch.id,
          v_employee_id
        ) returning id into v_movement_id;
      end if;

      v_cost_before := coalesce(v_output_product.cost, 0);
      if v_global_qty_before + v_stock_qty > 0 then
        v_cost_after := round(
          ((greatest(v_global_qty_before, 0) * greatest(v_cost_before, 0)) + (v_stock_qty * greatest(coalesce(v_stock_unit_cost, 0), 0)))
          / nullif(greatest(v_global_qty_before, 0) + v_stock_qty, 0),
          6
        );
      else
        v_cost_after := round(greatest(coalesce(v_stock_unit_cost, v_cost_before, 0), 0), 6);
      end if;

      if v_site_qty_before + v_stock_qty > 0 then
        v_site_avg_after := round(
          ((greatest(v_site_qty_before, 0) * greatest(coalesce(v_site_avg_before, v_cost_before, 0), 0)) + (v_stock_qty * greatest(coalesce(v_stock_unit_cost, 0), 0)))
          / nullif(greatest(v_site_qty_before, 0) + v_stock_qty, 0),
          6
        );
      else
        v_site_avg_after := round(greatest(coalesce(v_stock_unit_cost, v_site_avg_before, 0), 0), 6);
      end if;

      insert into public.inventory_stock_by_site (
        site_id,
        product_id,
        current_qty,
        avg_unit_cost,
        updated_at
      ) values (
        v_batch.site_id,
        v_output.product_id,
        v_stock_qty,
        v_site_avg_after,
        now()
      )
      on conflict (site_id, product_id) do update
        set current_qty = case
              when excluded.product_id = v_recipe.product_id
                then public.inventory_stock_by_site.current_qty
              else public.inventory_stock_by_site.current_qty + excluded.current_qty
            end,
            avg_unit_cost = excluded.avg_unit_cost,
            updated_at = now();

      update public.products
      set cost = v_cost_after,
          updated_at = now()
      where id = v_output.product_id;

      insert into public.product_cost_events (
        product_id,
        site_id,
        source,
        source_production_batch_id,
        source_adjust_movement_id,
        qty_before,
        qty_in,
        cost_before,
        cost_in,
        cost_after,
        basis,
        created_by
      ) values (
        v_output.product_id,
        v_batch.site_id,
        'production',
        v_batch.id,
        v_movement_id,
        v_global_qty_before,
        v_stock_qty,
        v_cost_before,
        coalesce(v_stock_unit_cost, 0),
        v_cost_after,
        'net',
        v_employee_id
      );
    end if;

    insert into public.production_batch_outputs (
      batch_id,
      recipe_card_id,
      recipe_output_id,
      product_id,
      output_role,
      produced_qty,
      produced_unit,
      destination_location_id,
      cost_allocation_method,
      cost_allocation_pct,
      allocated_total_cost,
      unit_cost,
      inventory_movement_id,
      metadata
    ) values (
      v_batch.id,
      p_recipe_card_id,
      v_output.recipe_output_id,
      v_output.product_id,
      case when v_output.product_id = v_recipe.product_id then 'primary' else coalesce(nullif(v_output.output_role, ''), 'co_product') end,
      v_output.produced_qty,
      v_output.produced_unit,
      case when v_batch.output_mode in ('inventory_stock', 'sellable_stock') then v_output.destination_location_id else null end,
      'percentage',
      coalesce(v_output.cost_allocation_pct, 0),
      v_allocated_cost,
      v_unit_cost,
      v_movement_id,
      jsonb_build_object(
        'source', 'fogo_create_real_production_batch',
        'stockQty', v_stock_qty,
        'stockUnitCode', v_stock_unit.code,
        'stockUnitCost', v_stock_unit_cost,
        'conversionFactorToStock', v_conversion_factor_to_stock
      )
    );
  end loop;

  update public.production_batches
  set produced_qty = coalesce(v_primary_qty, produced_qty),
      unit_cost = coalesce(v_primary_unit_cost, unit_cost),
      total_cost = v_total_cost
  where id = v_batch.id;

  return v_result || jsonb_build_object(
    'multiOutput', true,
    'outputCount', jsonb_array_length(p_outputs),
    'primaryUnitCost', v_primary_unit_cost
  );
end;
$$;

alter function public.fogo_create_real_production_batch(
  uuid,
  numeric,
  uuid,
  jsonb,
  jsonb,
  jsonb,
  text
) owner to postgres;

grant all on function public.fogo_create_real_production_batch(
  uuid,
  numeric,
  uuid,
  jsonb,
  jsonb,
  jsonb,
  text
) to authenticated, service_role;

notify pgrst, 'reload schema';

commit;
