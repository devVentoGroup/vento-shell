-- NEXO / VENTO OS
-- Count-with-weight auxiliary counts for remissions, inventory counts and movement audit.
--
-- Purpose:
-- - Keep stock math in base quantity (for example, grams).
-- - Store auxiliary physical count separately (for example, pieces/aguacates).
-- - Preserve the auxiliary count on remission lines and optional movement audit.
--
-- Safe to run more than once.

begin;

alter table public.product_inventory_profiles
  add column if not exists aux_count_unit_code text;

comment on column public.product_inventory_profiles.aux_count_unit_code is
  'Default auxiliary count unit for count_with_weight products. Example: pieza, unidad, aguacate. Stock remains controlled by the base unit.';

alter table public.restock_request_items
  add column if not exists aux_count_unit_code text,
  add column if not exists input_aux_count numeric,
  add column if not exists prepared_aux_count numeric,
  add column if not exists shipped_aux_count numeric,
  add column if not exists received_aux_count numeric,
  add column if not exists shortage_aux_count numeric;

comment on column public.restock_request_items.aux_count_unit_code is
  'Auxiliary physical count unit for this remission line. Example: piezas. The canonical quantities remain quantity/prepared/shipped/received/shortage in stock unit.';
comment on column public.restock_request_items.input_aux_count is
  'Optional auxiliary count requested/input for count_with_weight products. Example: 12 pieces while quantity is 2850 g.';
comment on column public.restock_request_items.prepared_aux_count is
  'Auxiliary count prepared at origin for count_with_weight products.';
comment on column public.restock_request_items.shipped_aux_count is
  'Auxiliary count shipped from origin for count_with_weight products.';
comment on column public.restock_request_items.received_aux_count is
  'Auxiliary count received at destination for count_with_weight products.';
comment on column public.restock_request_items.shortage_aux_count is
  'Auxiliary count registered as shortage for count_with_weight products.';

alter table public.inventory_count_lines
  add column if not exists aux_count_unit_code text,
  add column if not exists counted_aux_count numeric;

comment on column public.inventory_count_lines.aux_count_unit_code is
  'Auxiliary physical count unit used during count. Example: piezas. quantity_counted remains the canonical stock quantity.';
comment on column public.inventory_count_lines.counted_aux_count is
  'Auxiliary count captured during inventory count for count_with_weight products. Example: 12 pieces while quantity_counted is 2850 g.';

alter table public.inventory_movements
  add column if not exists aux_count numeric,
  add column if not exists aux_count_unit_code text;

comment on column public.inventory_movements.aux_count is
  'Optional auxiliary physical count linked to this movement. Stock math still uses quantity.';
comment on column public.inventory_movements.aux_count_unit_code is
  'Auxiliary count unit for aux_count. Example: piezas.';

do $$
begin
  if not exists (
    select 1 from pg_constraint
    where conname = 'product_inventory_profiles_aux_count_unit_code_nonempty_chk'
  ) then
    alter table public.product_inventory_profiles
      add constraint product_inventory_profiles_aux_count_unit_code_nonempty_chk
      check (aux_count_unit_code is null or length(btrim(aux_count_unit_code)) > 0);
  end if;
end $$;

do $$
begin
  if not exists (
    select 1 from pg_constraint
    where conname = 'restock_request_items_aux_count_unit_code_nonempty_chk'
  ) then
    alter table public.restock_request_items
      add constraint restock_request_items_aux_count_unit_code_nonempty_chk
      check (aux_count_unit_code is null or length(btrim(aux_count_unit_code)) > 0);
  end if;
end $$;

do $$
begin
  if not exists (
    select 1 from pg_constraint
    where conname = 'restock_request_items_input_aux_count_nonnegative_chk'
  ) then
    alter table public.restock_request_items
      add constraint restock_request_items_input_aux_count_nonnegative_chk
      check (input_aux_count is null or input_aux_count >= 0);
  end if;
end $$;

do $$
begin
  if not exists (
    select 1 from pg_constraint
    where conname = 'restock_request_items_prepared_aux_count_nonnegative_chk'
  ) then
    alter table public.restock_request_items
      add constraint restock_request_items_prepared_aux_count_nonnegative_chk
      check (prepared_aux_count is null or prepared_aux_count >= 0);
  end if;
end $$;

do $$
begin
  if not exists (
    select 1 from pg_constraint
    where conname = 'restock_request_items_shipped_aux_count_nonnegative_chk'
  ) then
    alter table public.restock_request_items
      add constraint restock_request_items_shipped_aux_count_nonnegative_chk
      check (shipped_aux_count is null or shipped_aux_count >= 0);
  end if;
end $$;

do $$
begin
  if not exists (
    select 1 from pg_constraint
    where conname = 'restock_request_items_received_aux_count_nonnegative_chk'
  ) then
    alter table public.restock_request_items
      add constraint restock_request_items_received_aux_count_nonnegative_chk
      check (received_aux_count is null or received_aux_count >= 0);
  end if;
end $$;

do $$
begin
  if not exists (
    select 1 from pg_constraint
    where conname = 'restock_request_items_shortage_aux_count_nonnegative_chk'
  ) then
    alter table public.restock_request_items
      add constraint restock_request_items_shortage_aux_count_nonnegative_chk
      check (shortage_aux_count is null or shortage_aux_count >= 0);
  end if;
end $$;

do $$
begin
  if not exists (
    select 1 from pg_constraint
    where conname = 'inventory_count_lines_counted_aux_count_nonnegative_chk'
  ) then
    alter table public.inventory_count_lines
      add constraint inventory_count_lines_counted_aux_count_nonnegative_chk
      check (counted_aux_count is null or counted_aux_count >= 0);
  end if;
end $$;

do $$
begin
  if not exists (
    select 1 from pg_constraint
    where conname = 'inventory_count_lines_aux_count_unit_code_nonempty_chk'
  ) then
    alter table public.inventory_count_lines
      add constraint inventory_count_lines_aux_count_unit_code_nonempty_chk
      check (aux_count_unit_code is null or length(btrim(aux_count_unit_code)) > 0);
  end if;
end $$;

do $$
begin
  if not exists (
    select 1 from pg_constraint
    where conname = 'inventory_movements_aux_count_nonnegative_chk'
  ) then
    alter table public.inventory_movements
      add constraint inventory_movements_aux_count_nonnegative_chk
      check (aux_count is null or aux_count >= 0);
  end if;
end $$;

do $$
begin
  if not exists (
    select 1 from pg_constraint
    where conname = 'inventory_movements_aux_count_unit_code_nonempty_chk'
  ) then
    alter table public.inventory_movements
      add constraint inventory_movements_aux_count_unit_code_nonempty_chk
      check (aux_count_unit_code is null or length(btrim(aux_count_unit_code)) > 0);
  end if;
end $$;

create or replace function public.apply_restock_receipt(p_request_id uuid)
returns void
language plpgsql
security definer
set search_path to 'public'
as $$
declare
  v_request record;
  v_item record;
  v_qty numeric;
  v_aux_count numeric;
  v_aux_unit text;
begin
  select *
  into v_request
  from public.restock_requests
  where id = p_request_id;

  if v_request.id is null then
    raise exception 'restock_request not found: %', p_request_id;
  end if;

  if v_request.to_site_id is null then
    raise exception 'to_site_id requerido para recepcion de remision';
  end if;

  if not public.has_permission('nexo.inventory.remissions.receive', v_request.to_site_id) then
    raise exception 'permission denied: remissions.receive';
  end if;

  for v_item in
    select *
    from public.restock_request_items
    where request_id = p_request_id
  loop
    v_qty := coalesce(v_item.received_quantity, 0);
    if v_qty <= 0 then
      continue;
    end if;

    v_aux_count := v_item.received_aux_count;
    v_aux_unit := nullif(btrim(coalesce(v_item.aux_count_unit_code, '')), '');

    if v_aux_count is not null and v_aux_count <= 0 then
      v_aux_count := null;
    end if;

    insert into public.inventory_movements (
      site_id,
      product_id,
      movement_type,
      quantity,
      note,
      related_restock_request_id,
      aux_count,
      aux_count_unit_code
    )
    values (
      v_request.to_site_id,
      v_item.product_id,
      'transfer_in',
      v_qty,
      'Recepcion remision ' || p_request_id::text,
      p_request_id,
      v_aux_count,
      v_aux_unit
    );

    insert into public.inventory_stock_by_site (site_id, product_id, current_qty, updated_at)
    values (v_request.to_site_id, v_item.product_id, v_qty, now())
    on conflict (site_id, product_id)
    do update set
      current_qty = public.inventory_stock_by_site.current_qty + excluded.current_qty,
      updated_at = now();
  end loop;
end;
$$;

create or replace function public.apply_restock_shipment(p_request_id uuid)
returns void
language plpgsql
security definer
set search_path to 'public'
as $$
declare
  v_request record;
  v_item record;
  v_qty numeric;
  v_aux_count numeric;
  v_aux_unit text;
begin
  select *
  into v_request
  from public.restock_requests
  where id = p_request_id;

  if v_request.id is null then
    raise exception 'restock_request not found: %', p_request_id;
  end if;

  if v_request.from_site_id is null then
    raise exception 'from_site_id requerido para salida de remision';
  end if;

  if not public.has_permission('nexo.inventory.remissions.prepare', v_request.from_site_id) then
    raise exception 'permission denied: remissions.prepare';
  end if;

  for v_item in
    select *
    from public.restock_request_items
    where request_id = p_request_id
  loop
    v_qty := coalesce(v_item.shipped_quantity, 0);
    if v_qty <= 0 then
      continue;
    end if;

    v_aux_count := v_item.shipped_aux_count;
    v_aux_unit := nullif(btrim(coalesce(v_item.aux_count_unit_code, '')), '');

    if v_aux_count is not null and v_aux_count <= 0 then
      v_aux_count := null;
    end if;

    insert into public.inventory_movements (
      site_id,
      product_id,
      movement_type,
      quantity,
      note,
      related_restock_request_id,
      aux_count,
      aux_count_unit_code
    )
    values (
      v_request.from_site_id,
      v_item.product_id,
      'transfer_out',
      v_qty,
      'Salida remision ' || p_request_id::text,
      p_request_id,
      v_aux_count,
      v_aux_unit
    );

    insert into public.inventory_stock_by_site (site_id, product_id, current_qty, updated_at)
    values (v_request.from_site_id, v_item.product_id, -v_qty, now())
    on conflict (site_id, product_id)
    do update set
      current_qty = public.inventory_stock_by_site.current_qty + excluded.current_qty,
      updated_at = now();

    if v_item.source_location_id is not null then
      perform public.upsert_inventory_stock_by_location(
        v_item.source_location_id,
        v_item.product_id,
        -v_qty
      );
    end if;
  end loop;
end;
$$;

commit;
