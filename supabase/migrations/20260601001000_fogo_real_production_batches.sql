-- FOGO · Produccion real + empaques por lote
-- Crea soporte para consumo real de ingredientes, rendimiento real y paquetes/bolsas reales.

begin;

-- 1) Campos resumen en el lote. Son nullable para no romper lotes historicos.
alter table public.production_batches
  add column if not exists expected_qty numeric,
  add column if not exists expected_unit text,
  add column if not exists packaged_qty numeric,
  add column if not exists packaged_unit text,
  add column if not exists package_count integer default 0 not null,
  add column if not exists packaging_status text default 'not_packaged' not null;

alter table public.production_batches
  drop constraint if exists production_batches_expected_qty_chk,
  add constraint production_batches_expected_qty_chk
    check (expected_qty is null or expected_qty >= 0);

alter table public.production_batches
  drop constraint if exists production_batches_packaged_qty_chk,
  add constraint production_batches_packaged_qty_chk
    check (packaged_qty is null or packaged_qty >= 0);

alter table public.production_batches
  drop constraint if exists production_batches_package_count_chk,
  add constraint production_batches_package_count_chk
    check (package_count >= 0);

alter table public.production_batches
  drop constraint if exists production_batches_packaging_status_chk,
  add constraint production_batches_packaging_status_chk
    check (packaging_status in ('not_packaged', 'packaged', 'partial', 'variance'));

comment on column public.production_batches.expected_qty is
  'Rendimiento teorico esperado de la receta para el lote.';
comment on column public.production_batches.expected_unit is
  'Unidad del rendimiento teorico esperado.';
comment on column public.production_batches.packaged_qty is
  'Total real empacado en unidad base del producto terminado.';
comment on column public.production_batches.packaged_unit is
  'Unidad del total real empacado.';
comment on column public.production_batches.package_count is
  'Cantidad de empaques fisicos generados por el lote.';
comment on column public.production_batches.packaging_status is
  'Estado de empaque del lote: not_packaged, packaged, partial o variance.';

-- 2) Empaques reales del lote: bolsa, recipiente, porcion, fraccion final, etc.
create table if not exists public.production_batch_packages (
  id uuid primary key default gen_random_uuid(),
  batch_id uuid not null references public.production_batches(id) on delete cascade,
  product_id uuid not null references public.products(id) on delete cascade,
  uom_profile_id uuid references public.product_uom_profiles(id) on delete set null,
  package_index integer not null,
  package_label text not null,
  expected_qty numeric default 0 not null,
  actual_qty numeric not null,
  unit_code text not null references public.inventory_units(code),
  status text default 'available' not null,
  notes text,
  created_at timestamp with time zone default now() not null,
  created_by uuid references auth.users(id) on delete set null,
  constraint production_batch_packages_index_chk check (package_index > 0),
  constraint production_batch_packages_expected_qty_chk check (expected_qty >= 0),
  constraint production_batch_packages_actual_qty_chk check (actual_qty > 0),
  constraint production_batch_packages_status_chk check (
    status in ('available', 'reserved', 'dispatched', 'consumed', 'discarded', 'void')
  )
);

alter table public.production_batch_packages owner to postgres;

create unique index if not exists ux_production_batch_packages_batch_index
  on public.production_batch_packages(batch_id, package_index);

create index if not exists idx_production_batch_packages_batch
  on public.production_batch_packages(batch_id);

create index if not exists idx_production_batch_packages_product_status
  on public.production_batch_packages(product_id, status, created_at desc);

create index if not exists idx_production_batch_packages_uom_profile
  on public.production_batch_packages(uom_profile_id);

comment on table public.production_batch_packages is
  'Empaques fisicos reales generados por un lote de produccion. Ej: bolsas de 1 kg, 1.2 kg o 0.7 kg.';
comment on column public.production_batch_packages.expected_qty is
  'Cantidad esperada/estandar del empaque. Ej: bolsa estandar de 1 kg.';
comment on column public.production_batch_packages.actual_qty is
  'Cantidad real medida del empaque. Esta es la que manda para inventario y remisiones.';
comment on column public.production_batch_packages.uom_profile_id is
  'Presentacion estandar opcional asociada, por ejemplo Bolsa 1 kg en product_uom_profiles.';

alter table public.production_batch_packages enable row level security;

drop policy if exists production_batch_packages_select_staff on public.production_batch_packages;
create policy production_batch_packages_select_staff
  on public.production_batch_packages
  for select
  to authenticated
  using (public.is_employee());

drop policy if exists production_batch_packages_write_production on public.production_batch_packages;
create policy production_batch_packages_write_production
  on public.production_batch_packages
  for all
  to authenticated
  using (
    exists (
      select 1
      from public.production_batches pb
      where pb.id = production_batch_packages.batch_id
        and public.has_permission('fogo.production.batches.create', pb.site_id)
    )
  )
  with check (
    exists (
      select 1
      from public.production_batches pb
      where pb.id = production_batch_packages.batch_id
        and public.has_permission('fogo.production.batches.create', pb.site_id)
    )
  );

grant all on table public.production_batch_packages to authenticated;
grant all on table public.production_batch_packages to service_role;

-- 3) RPC nuevo. Conserva el RPC anterior y agrega uno para produccion real.
create or replace function public.fogo_create_real_production_batch(
  p_recipe_card_id uuid,
  p_produced_qty numeric,
  p_destination_location_id uuid,
  p_ingredients jsonb default '[]'::jsonb,
  p_packages jsonb default '[]'::jsonb,
  p_notes text default null
) returns jsonb
language plpgsql
security definer
set search_path to 'public', 'pg_temp'
as $$
declare
  v_employee_id uuid := auth.uid();
  v_recipe record;
  v_destination record;
  v_configured_production_location_id uuid;
  v_scale numeric;
  v_expected_qty numeric;
  v_produced_unit text;
  v_total_cost numeric := 0;
  v_unit_cost numeric := null;
  v_batch_id uuid;
  v_batch_code text;
  v_ingredient record;
  v_location record;
  v_remaining numeric;
  v_required_qty numeric;
  v_consumed_qty numeric;
  v_take numeric;
  v_stock_unit_code text;
  v_movement_id uuid;
  v_custom_ingredients boolean := false;
  v_invalid_ingredients integer := 0;
  v_packages_count integer := 0;
  v_package record;
  v_package_index integer := 0;
  v_package_total numeric := 0;
  v_package_unit text;
  v_expected_package_qty numeric;
  v_package_label text;
  v_package_profile_id uuid;
  v_packaging_status text;
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

  if p_ingredients is null or jsonb_typeof(p_ingredients) <> 'array' then
    raise exception 'ingredients must be a json array';
  end if;

  if p_packages is null or jsonb_typeof(p_packages) <> 'array' then
    raise exception 'packages must be a json array';
  end if;

  select
    rc.id,
    rc.product_id,
    rc.site_id,
    rc.area_id,
    rc.yield_qty,
    rc.yield_unit,
    rc.portion_size,
    rc.portion_unit,
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
  v_expected_qty := v_recipe.yield_qty;
  v_produced_unit := coalesce(
    nullif(v_recipe.yield_unit, ''),
    nullif(v_recipe.product_stock_unit_code, ''),
    nullif(v_recipe.product_unit, ''),
    'un'
  );

  v_custom_ingredients := jsonb_array_length(p_ingredients) > 0;

  if v_custom_ingredients then
    with provided as (
      select distinct x.ingredient_product_id
      from jsonb_to_recordset(p_ingredients) as x(
        ingredient_product_id uuid,
        required_qty numeric,
        actual_qty numeric,
        location_id uuid
      )
    )
    select count(*)
      into v_invalid_ingredients
    from provided pi
    left join public.recipes r
      on r.product_id = v_recipe.product_id
     and r.ingredient_product_id = pi.ingredient_product_id
     and coalesce(r.is_active, true) = true
    where pi.ingredient_product_id is null
       or r.id is null;

    if v_invalid_ingredients > 0 then
      raise exception 'ingredients payload contains products that are not active ingredients of the recipe';
    end if;
  end if;

  -- Validar paquetes antes de tocar inventario.
  v_packages_count := jsonb_array_length(p_packages);
  if v_packages_count > 0 then
    for v_package in
      select *
      from jsonb_to_recordset(p_packages) as x(
        package_index integer,
        label text,
        expected_qty numeric,
        actual_qty numeric,
        unit_code text,
        uom_profile_id uuid,
        notes text
      )
    loop
      v_package_index := coalesce(v_package.package_index, v_package_index + 1);
      v_package_unit := coalesce(nullif(trim(v_package.unit_code), ''), v_produced_unit);

      if coalesce(v_package.actual_qty, 0) <= 0 then
        raise exception 'all packages must have actual_qty greater than zero';
      end if;

      if v_package.uom_profile_id is not null and not exists (
        select 1
        from public.product_uom_profiles profile
        where profile.id = v_package.uom_profile_id
          and profile.product_id = v_recipe.product_id
      ) then
        raise exception 'package uom profile does not belong to the produced product';
      end if;

      if not exists (select 1 from public.inventory_units u where u.code = v_package_unit) then
        raise exception 'package unit % does not exist', v_package_unit;
      end if;

      v_package_total := v_package_total + coalesce(v_package.actual_qty, 0);
    end loop;

    if abs(v_package_total - p_produced_qty) > 0.001 then
      raise exception 'package total (%) must match produced_qty (%)', v_package_total, p_produced_qty;
    end if;
  end if;

  insert into public.production_batches (
    site_id,
    product_id,
    recipe_card_id,
    produced_qty,
    produced_unit,
    expected_qty,
    expected_unit,
    packaged_qty,
    packaged_unit,
    package_count,
    packaging_status,
    status,
    notes,
    created_by,
    destination_location_id,
    recipe_consumed
  ) values (
    v_recipe.site_id,
    v_recipe.product_id,
    v_recipe.id,
    p_produced_qty,
    v_produced_unit,
    v_expected_qty,
    v_produced_unit,
    case when v_packages_count > 0 then v_package_total else null end,
    case when v_packages_count > 0 then v_produced_unit else null end,
    v_packages_count,
    case when v_packages_count > 0 then 'packaged' else 'not_packaged' end,
    'posted',
    nullif(trim(coalesce(p_notes, '')), ''),
    v_employee_id,
    p_destination_location_id,
    true
  ) returning id, batch_code into v_batch_id, v_batch_code;

  for v_ingredient in
    with provided as (
      select *
      from jsonb_to_recordset(p_ingredients) as x(
        ingredient_product_id uuid,
        required_qty numeric,
        actual_qty numeric,
        location_id uuid
      )
    )
    select
      r.ingredient_product_id,
      p.name,
      p.unit,
      p.stock_unit_code,
      coalesce(p.cost, 0) as cost,
      coalesce(pi.required_qty, r.quantity * v_scale) as required_qty,
      coalesce(pi.actual_qty, r.quantity * v_scale) as consumed_qty,
      pi.location_id as requested_location_id
    from public.recipes r
    join public.products p on p.id = r.ingredient_product_id
    left join provided pi on pi.ingredient_product_id = r.ingredient_product_id
    where r.product_id = v_recipe.product_id
      and coalesce(r.is_active, true) = true
      and (not v_custom_ingredients or pi.ingredient_product_id is not null)
    order by r.created_at asc, r.id asc
  loop
    v_required_qty := coalesce(v_ingredient.required_qty, 0);
    v_consumed_qty := coalesce(v_ingredient.consumed_qty, 0);

    if v_required_qty < 0 or v_consumed_qty < 0 then
      raise exception 'ingredient quantities cannot be negative';
    end if;

    if v_consumed_qty <= 0 then
      continue;
    end if;

    v_remaining := v_consumed_qty;
    v_stock_unit_code := coalesce(
      nullif(v_ingredient.stock_unit_code, ''),
      nullif(v_ingredient.unit, ''),
      'un'
    );
    v_total_cost := v_total_cost + (v_consumed_qty * coalesce(v_ingredient.cost, 0));

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
          v_ingredient.requested_location_id is null
          or loc.id = v_ingredient.requested_location_id
        )
        and (
          v_ingredient.requested_location_id is not null
          or v_configured_production_location_id is null
          or loc.id = v_configured_production_location_id
        )
      order by
        case when v_ingredient.requested_location_id is not null then 0
             when pick.location_id is null then 1 else 0 end,
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
      ) values (
        v_recipe.site_id,
        v_ingredient.ingredient_product_id,
        'production_consume',
        -v_take,
        v_take,
        v_stock_unit_code,
        1,
        v_stock_unit_code,
        coalesce(v_ingredient.cost, 0),
        format('Consumo real lote %s desde %s', coalesce(v_batch_code, v_batch_id::text), coalesce(v_location.location_code, v_location.location_id::text)),
        v_batch_id,
        v_employee_id
      ) returning id into v_movement_id;

      insert into public.production_batch_consumptions (
        batch_id,
        ingredient_product_id,
        location_id,
        required_qty,
        consumed_qty,
        stock_unit_code,
        movement_id,
        created_by
      ) values (
        v_batch_id,
        v_ingredient.ingredient_product_id,
        v_location.location_id,
        case when v_consumed_qty > 0 then (v_required_qty * (v_take / v_consumed_qty)) else 0 end,
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
        v_consumed_qty,
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
  ) values (
    v_recipe.site_id,
    v_recipe.product_id,
    'production_output',
    p_produced_qty,
    p_produced_qty,
    coalesce(nullif(v_recipe.product_stock_unit_code, ''), nullif(v_recipe.product_unit, ''), v_produced_unit),
    1,
    coalesce(nullif(v_recipe.product_stock_unit_code, ''), nullif(v_recipe.product_unit, ''), v_produced_unit),
    v_unit_cost,
    format('Ingreso real lote %s a %s', coalesce(v_batch_code, v_batch_id::text), coalesce(v_destination.code, p_destination_location_id::text)),
    v_batch_id,
    v_employee_id
  );

  -- Registrar empaques al final. Si no llegaron empaques, queda como lote sin empaque detallado.
  if v_packages_count > 0 then
    v_package_index := 0;
    for v_package in
      select *
      from jsonb_to_recordset(p_packages) as x(
        package_index integer,
        label text,
        expected_qty numeric,
        actual_qty numeric,
        unit_code text,
        uom_profile_id uuid,
        notes text
      )
    loop
      v_package_index := coalesce(v_package.package_index, v_package_index + 1);
      v_package_unit := coalesce(nullif(trim(v_package.unit_code), ''), v_produced_unit);
      v_expected_package_qty := coalesce(
        v_package.expected_qty,
        nullif(v_recipe.portion_size, 0),
        v_package.actual_qty
      );
      v_package_label := coalesce(
        nullif(trim(v_package.label), ''),
        format('Empaque %s', v_package_index)
      );
      v_package_profile_id := v_package.uom_profile_id;

      insert into public.production_batch_packages (
        batch_id,
        product_id,
        uom_profile_id,
        package_index,
        package_label,
        expected_qty,
        actual_qty,
        unit_code,
        status,
        notes,
        created_by
      ) values (
        v_batch_id,
        v_recipe.product_id,
        v_package_profile_id,
        v_package_index,
        v_package_label,
        v_expected_package_qty,
        v_package.actual_qty,
        v_package_unit,
        'available',
        nullif(trim(coalesce(v_package.notes, '')), ''),
        v_employee_id
      );
    end loop;
  end if;

  v_packaging_status := case
    when v_packages_count <= 0 then 'not_packaged'
    when abs(v_package_total - p_produced_qty) <= 0.001 then 'packaged'
    else 'variance'
  end;

  update public.production_batches
  set packaged_qty = case when v_packages_count > 0 then v_package_total else packaged_qty end,
      packaged_unit = case when v_packages_count > 0 then v_produced_unit else packaged_unit end,
      package_count = v_packages_count,
      packaging_status = v_packaging_status
  where id = v_batch_id;

  return jsonb_build_object(
    'batchId', v_batch_id,
    'batchCode', v_batch_code,
    'recipeCardId', v_recipe.id,
    'productId', v_recipe.product_id,
    'siteId', v_recipe.site_id,
    'areaId', v_recipe.area_id,
    'expectedQty', v_expected_qty,
    'producedQty', p_produced_qty,
    'producedUnit', v_produced_unit,
    'destinationLocationId', p_destination_location_id,
    'packageCount', v_packages_count,
    'packagedQty', case when v_packages_count > 0 then v_package_total else null end,
    'totalCost', v_total_cost,
    'unitCost', v_unit_cost
  );
end;
$$;

alter function public.fogo_create_real_production_batch(uuid, numeric, uuid, jsonb, jsonb, text) owner to postgres;

grant all on function public.fogo_create_real_production_batch(uuid, numeric, uuid, jsonb, jsonb, text) to authenticated;
grant all on function public.fogo_create_real_production_batch(uuid, numeric, uuid, jsonb, jsonb, text) to service_role;

commit;
