begin;

-- Modelo de preparación física de remisiones:
-- Una línea solicitada puede tener varios picks de salida.
-- Cada pick puede salir de un LOC, opcionalmente de una posición interna,
-- y opcionalmente de una presentación física/UOM profile.

create table if not exists public.restock_request_item_picks (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),

  request_id uuid not null references public.restock_requests(id) on delete cascade,
  item_id uuid not null references public.restock_request_items(id) on delete cascade,
  product_id uuid not null references public.products(id) on delete restrict,

  source_location_id uuid not null references public.inventory_locations(id) on delete restrict,
  source_location_position_id uuid references public.inventory_location_positions(id) on delete set null,

  uom_profile_id uuid references public.product_uom_profiles(id) on delete set null,
  presentation_qty numeric not null default 0,
  base_qty numeric not null default 0,

  note text,
  created_by uuid default auth.uid(),
  updated_by uuid,

  constraint restock_request_item_picks_base_qty_positive_chk
    check (base_qty > 0),
  constraint restock_request_item_picks_presentation_qty_nonnegative_chk
    check (presentation_qty >= 0),
  constraint restock_request_item_picks_uom_profile_presentation_chk
    check (
      (uom_profile_id is null and presentation_qty = 0)
      or
      (uom_profile_id is not null and presentation_qty > 0)
    )
);

comment on table public.restock_request_item_picks is
  'Plan físico de salida para remisiones. Una línea de restock_request_items puede tener varios picks por LOC, posición interna y presentación física.';

comment on column public.restock_request_item_picks.base_qty is
  'Cantidad en unidad base/stock que se despacha desde este pick.';

comment on column public.restock_request_item_picks.presentation_qty is
  'Cantidad de presentación física despachada, cuando el pick usa product_uom_profiles. Ej: 2 potes.';

comment on column public.restock_request_item_picks.uom_profile_id is
  'Presentación física usada para el pick. Null para productos sin presentación física específica o productos por unidad/rendimiento.';

comment on column public.restock_request_item_picks.source_location_position_id is
  'Posición interna dentro del LOC origen: estantería, nivel, bin, zona interna, etc.';

create index if not exists idx_restock_request_item_picks_request
  on public.restock_request_item_picks(request_id);

create index if not exists idx_restock_request_item_picks_item
  on public.restock_request_item_picks(item_id);

create index if not exists idx_restock_request_item_picks_product
  on public.restock_request_item_picks(product_id);

create index if not exists idx_restock_request_item_picks_source_location
  on public.restock_request_item_picks(source_location_id);

create index if not exists idx_restock_request_item_picks_source_position
  on public.restock_request_item_picks(source_location_position_id);

create index if not exists idx_restock_request_item_picks_uom_profile
  on public.restock_request_item_picks(uom_profile_id);

drop trigger if exists restock_request_item_picks_set_updated_at
  on public.restock_request_item_picks;

create trigger restock_request_item_picks_set_updated_at
  before update on public.restock_request_item_picks
  for each row
  execute function public.update_updated_at();

create or replace function public.validate_restock_request_item_pick()
returns trigger
language plpgsql
security definer
set search_path = public, pg_temp
as $$
declare
  v_item record;
  v_request record;
  v_location record;
  v_position record;
  v_profile record;
begin
  select
    item.id,
    item.request_id,
    item.product_id,
    item.quantity
    into v_item
  from public.restock_request_items item
  where item.id = new.item_id;

  if not found then
    raise exception 'restock request item not found';
  end if;

  if new.request_id <> v_item.request_id then
    raise exception 'pick request_id does not match item request_id';
  end if;

  if new.product_id <> v_item.product_id then
    raise exception 'pick product_id does not match item product_id';
  end if;

  select req.id, req.from_site_id, req.status
    into v_request
  from public.restock_requests req
  where req.id = new.request_id;

  if not found then
    raise exception 'restock request not found';
  end if;

  if v_request.from_site_id is null then
    raise exception 'restock request has no origin site';
  end if;

  select loc.id, loc.site_id
    into v_location
  from public.inventory_locations loc
  where loc.id = new.source_location_id
    and coalesce(loc.is_active, true) = true;

  if not found then
    raise exception 'active source LOC not found';
  end if;

  if v_location.site_id <> v_request.from_site_id then
    raise exception 'source LOC does not belong to restock request origin site';
  end if;

  if new.source_location_position_id is not null then
    select pos.id, pos.location_id, pos.site_id
      into v_position
    from public.inventory_location_positions pos
    where pos.id = new.source_location_position_id
      and pos.location_id = new.source_location_id
      and coalesce(pos.is_active, true) = true;

    if not found then
      raise exception 'active internal position not found for source LOC';
    end if;
  end if;

  if new.uom_profile_id is not null then
    select profile.id, profile.product_id, profile.is_active
      into v_profile
    from public.product_uom_profiles profile
    where profile.id = new.uom_profile_id;

    if not found or v_profile.product_id <> new.product_id then
      raise exception 'uom profile does not belong to pick product';
    end if;

    if coalesce(v_profile.is_active, false) <> true then
      raise exception 'uom profile is inactive';
    end if;

    perform 1
    from public.assert_inventory_uom_profile_stock_input(
      new.source_location_id,
      new.source_location_position_id,
      new.product_id,
      new.uom_profile_id,
      new.presentation_qty,
      new.base_qty
    );
  end if;

  return new;
end;
$$;

drop trigger if exists restock_request_item_picks_validate
  on public.restock_request_item_picks;

create trigger restock_request_item_picks_validate
  before insert or update on public.restock_request_item_picks
  for each row
  execute function public.validate_restock_request_item_pick();

alter table public.restock_request_item_picks enable row level security;

drop policy if exists "restock_request_item_picks_select_permission"
  on public.restock_request_item_picks;

create policy "restock_request_item_picks_select_permission"
  on public.restock_request_item_picks
  for select to authenticated
  using (
    exists (
      select 1
      from public.restock_requests req
      where req.id = restock_request_item_picks.request_id
        and (
          public.can_access_site(req.from_site_id)
          or public.can_access_site(req.to_site_id)
        )
    )
  );

drop policy if exists "restock_request_item_picks_write_prepare_permission"
  on public.restock_request_item_picks;

create policy "restock_request_item_picks_write_prepare_permission"
  on public.restock_request_item_picks
  for all to authenticated
  using (
    exists (
      select 1
      from public.restock_requests req
      where req.id = restock_request_item_picks.request_id
        and public.has_permission('nexo.inventory.remissions.prepare', req.from_site_id)
    )
  )
  with check (
    exists (
      select 1
      from public.restock_requests req
      where req.id = restock_request_item_picks.request_id
        and public.has_permission('nexo.inventory.remissions.prepare', req.from_site_id)
    )
  );

grant select, insert, update, delete on public.restock_request_item_picks to authenticated;
grant select, insert, update, delete on public.restock_request_item_picks to service_role;

create or replace function public.apply_restock_shipment_from_picks(
  p_request_id uuid
) returns void
language plpgsql
security definer
set search_path = public, pg_temp
as $$
declare
  v_request record;
  v_pick record;
  v_item record;
  v_pick_count integer := 0;
  v_total_base_qty numeric := 0;
  v_available_site numeric := 0;
  v_available_loc numeric := 0;
  v_available_position numeric := 0;
  v_positioned_qty numeric := 0;
begin
  select *
    into v_request
  from public.restock_requests
  where id = p_request_id
  for update;

  if not found then
    raise exception 'restock_request not found: %', p_request_id;
  end if;

  if v_request.from_site_id is null then
    raise exception 'from_site_id requerido para salida de remision';
  end if;

  if not public.has_permission('nexo.inventory.remissions.prepare', v_request.from_site_id) then
    raise exception 'permission denied: remissions.prepare';
  end if;

  if exists (
    select 1
    from public.inventory_movements movements
    where movements.related_restock_request_id = p_request_id
      and movements.movement_type = 'transfer_out'
  ) then
    raise exception 'shipment already applied for restock request %', p_request_id;
  end if;

  select count(*)
    into v_pick_count
  from public.restock_request_item_picks pick
  where pick.request_id = p_request_id;

  if coalesce(v_pick_count, 0) <= 0 then
    raise exception 'no picks found for restock request %', p_request_id;
  end if;

  -- Sincroniza cantidades preparadas/enviadas por línea a partir del plan físico.
  for v_item in
    select
      item.id,
      item.product_id,
      item.quantity,
      coalesce(sum(pick.base_qty), 0) as picked_qty
    from public.restock_request_items item
    left join public.restock_request_item_picks pick on pick.item_id = item.id
    where item.request_id = p_request_id
    group by item.id, item.product_id, item.quantity
  loop
    if coalesce(v_item.picked_qty, 0) <= 0 then
      raise exception 'item % has no prepared picks', v_item.id;
    end if;

    if v_item.picked_qty > coalesce(v_item.quantity, 0) + 0.000001 then
      raise exception 'picked quantity (%) exceeds requested quantity (%) for item %',
        v_item.picked_qty, v_item.quantity, v_item.id;
    end if;

    update public.restock_request_items
    set prepared_quantity = v_item.picked_qty,
        shipped_quantity = v_item.picked_qty
    where id = v_item.id;
  end loop;

  -- Valida stock agregado por sede.
  for v_pick in
    select product_id, sum(base_qty) as total_qty
    from public.restock_request_item_picks
    where request_id = p_request_id
    group by product_id
  loop
    select coalesce(stock.current_qty, 0)
      into v_available_site
    from public.inventory_stock_by_site stock
    where stock.site_id = v_request.from_site_id
      and stock.product_id = v_pick.product_id
    for update;

    v_available_site := coalesce(v_available_site, 0);

    if v_pick.total_qty > v_available_site + 0.000001 then
      raise exception 'insufficient site stock for product %. Requested %, available %',
        v_pick.product_id, v_pick.total_qty, v_available_site;
    end if;
  end loop;

  -- Valida stock agregado por LOC.
  for v_pick in
    select source_location_id, product_id, sum(base_qty) as total_qty
    from public.restock_request_item_picks
    where request_id = p_request_id
    group by source_location_id, product_id
  loop
    select coalesce(stock.current_qty, 0)
      into v_available_loc
    from public.inventory_stock_by_location stock
    where stock.location_id = v_pick.source_location_id
      and stock.product_id = v_pick.product_id
    for update;

    v_available_loc := coalesce(v_available_loc, 0);

    if v_pick.total_qty > v_available_loc + 0.000001 then
      raise exception 'insufficient LOC stock for product %. Requested %, available %',
        v_pick.product_id, v_pick.total_qty, v_available_loc;
    end if;
  end loop;

  -- Valida stock agregado por posición interna.
  for v_pick in
    select source_location_position_id, product_id, sum(base_qty) as total_qty
    from public.restock_request_item_picks
    where request_id = p_request_id
      and source_location_position_id is not null
    group by source_location_position_id, product_id
  loop
    select coalesce(stock.current_qty, 0)
      into v_available_position
    from public.inventory_stock_by_position stock
    where stock.position_id = v_pick.source_location_position_id
      and stock.product_id = v_pick.product_id
    for update;

    v_available_position := coalesce(v_available_position, 0);

    if v_pick.total_qty > v_available_position + 0.000001 then
      raise exception 'insufficient internal position stock for product %. Requested %, available %',
        v_pick.product_id, v_pick.total_qty, v_available_position;
    end if;
  end loop;

  -- Valida stock no posicionado cuando el pick no trae posición interna.
  for v_pick in
    select source_location_id, product_id, sum(base_qty) as total_qty
    from public.restock_request_item_picks
    where request_id = p_request_id
      and source_location_position_id is null
    group by source_location_id, product_id
  loop
    select coalesce(stock.current_qty, 0)
      into v_available_loc
    from public.inventory_stock_by_location stock
    where stock.location_id = v_pick.source_location_id
      and stock.product_id = v_pick.product_id
    for update;

    select coalesce(sum(coalesce(position_stock.current_qty, 0)), 0)
      into v_positioned_qty
    from public.inventory_stock_by_position position_stock
    join public.inventory_location_positions position
      on position.id = position_stock.position_id
    where position.location_id = v_pick.source_location_id
      and position_stock.product_id = v_pick.product_id;

    v_available_loc := greatest(0, coalesce(v_available_loc, 0) - coalesce(v_positioned_qty, 0));

    if v_pick.total_qty > v_available_loc + 0.000001 then
      raise exception 'insufficient unpositioned LOC stock for product %. Requested %, available %',
        v_pick.product_id, v_pick.total_qty, v_available_loc;
    end if;
  end loop;

  for v_pick in
    select *
    from public.restock_request_item_picks
    where request_id = p_request_id
    order by created_at, id
  loop
    if v_pick.uom_profile_id is not null then
      perform public.consume_inventory_stock_by_uom_profile(
        v_pick.source_location_id,
        v_pick.product_id,
        v_pick.uom_profile_id,
        v_pick.presentation_qty,
        v_pick.base_qty,
        v_pick.source_location_position_id
      );
    end if;

    insert into public.inventory_movements (
      site_id,
      product_id,
      movement_type,
      quantity,
      note,
      related_restock_request_id,
      created_by,
      input_qty,
      input_unit_code,
      conversion_factor_to_stock,
      stock_unit_code,
      location_position_id,
      input_uom_profile_id
    )
    select
      v_request.from_site_id,
      v_pick.product_id,
      'transfer_out',
      v_pick.base_qty,
      coalesce(
        nullif(trim(v_pick.note), ''),
        'Salida remision ' || p_request_id::text
      ),
      p_request_id,
      coalesce(v_pick.created_by, auth.uid()),
      case when v_pick.uom_profile_id is not null then v_pick.presentation_qty else v_pick.base_qty end,
      coalesce(profile.input_unit_code, product.stock_unit_code, product.unit, 'un'),
      case
        when profile.id is not null
          and coalesce(profile.qty_in_input_unit, 0) > 0
          then profile.qty_in_stock_unit / profile.qty_in_input_unit
        else 1
      end,
      coalesce(product.stock_unit_code, product.unit, 'un'),
      v_pick.source_location_position_id,
      v_pick.uom_profile_id
    from public.products product
    left join public.product_uom_profiles profile on profile.id = v_pick.uom_profile_id
    where product.id = v_pick.product_id;

    insert into public.inventory_stock_by_site (site_id, product_id, current_qty, updated_at)
    values (v_request.from_site_id, v_pick.product_id, -v_pick.base_qty, now())
    on conflict (site_id, product_id)
    do update set
      current_qty = public.inventory_stock_by_site.current_qty + excluded.current_qty,
      updated_at = now();

    perform public.upsert_inventory_stock_by_location(
      v_pick.source_location_id,
      v_pick.product_id,
      -v_pick.base_qty
    );

    if v_pick.source_location_position_id is not null then
      insert into public.inventory_stock_by_position (
        position_id,
        product_id,
        current_qty,
        updated_at
      )
      values (
        v_pick.source_location_position_id,
        v_pick.product_id,
        -v_pick.base_qty,
        now()
      )
      on conflict (position_id, product_id) do update
        set current_qty = public.inventory_stock_by_position.current_qty + excluded.current_qty,
            updated_at = now();
    end if;
  end loop;
end;
$$;

grant execute on function public.validate_restock_request_item_pick() to authenticated;
grant execute on function public.apply_restock_shipment_from_picks(uuid) to authenticated;

commit;
