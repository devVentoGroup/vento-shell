begin;

create or replace function public.reconcile_zero_internal_positions_for_location_product(
  p_location_id uuid,
  p_product_id uuid
)
returns integer
language plpgsql
security definer
set search_path = public, pg_temp
as $$
declare
  v_location_qty numeric := 0;
  v_updated integer := 0;
begin
  if p_location_id is null or p_product_id is null then
    return 0;
  end if;

  select coalesce(stock.current_qty, 0)
    into v_location_qty
  from public.inventory_stock_by_location stock
  where stock.location_id = p_location_id
    and stock.product_id = p_product_id;

  v_location_qty := coalesce(v_location_qty, 0);

  if abs(v_location_qty) > 0.000001 then
    return 0;
  end if;

  update public.inventory_stock_by_position stock_pos
  set
    current_qty = 0,
    updated_at = now()
  from public.inventory_location_positions pos
  where pos.id = stock_pos.position_id
    and pos.location_id = p_location_id
    and stock_pos.product_id = p_product_id
    and abs(coalesce(stock_pos.current_qty, 0)) > 0.000001;

  get diagnostics v_updated = row_count;
  return v_updated;
end;
$$;

comment on function public.reconcile_zero_internal_positions_for_location_product(uuid, uuid) is
  'Mantiene la jerarquia de stock: si un LOC queda en 0 para un producto, ninguna posicion interna del LOC puede conservar saldo.';

grant execute on function public.reconcile_zero_internal_positions_for_location_product(uuid, uuid)
  to authenticated;

create or replace function public.upsert_inventory_stock_by_location(
  p_location_id uuid,
  p_product_id uuid,
  p_delta numeric
) returns void
language plpgsql
security definer
set search_path = public, pg_temp
as $$
declare
  v_site_id uuid;
  v_new_location_qty numeric := 0;
begin
  select site_id into v_site_id
  from public.inventory_locations
  where id = p_location_id;

  if v_site_id is null then
    raise exception 'location not found';
  end if;

  if not (
    public.has_permission('nexo.inventory.stock', v_site_id)
    or public.has_permission('nexo.inventory.remissions.prepare', v_site_id)
    or public.has_permission('nexo.inventory.remissions.receive', v_site_id)
    or public.has_permission('nexo.inventory.production_batches', v_site_id)
    or public.has_permission('nexo.inventory.entries', v_site_id)
    or public.has_permission('nexo.inventory.transfers', v_site_id)
  ) then
    raise exception 'permission denied';
  end if;

  perform pg_advisory_xact_lock(hashtextextended(p_location_id::text || ':' || p_product_id::text, 0));

  insert into public.inventory_stock_by_location (location_id, product_id, current_qty, updated_at)
  values (p_location_id, p_product_id, p_delta, now())
  on conflict (location_id, product_id) do update
    set current_qty = public.inventory_stock_by_location.current_qty + excluded.current_qty,
        updated_at = now()
  returning current_qty into v_new_location_qty;

  if abs(coalesce(v_new_location_qty, 0)) <= 0.000001 then
    perform public.reconcile_zero_internal_positions_for_location_product(p_location_id, p_product_id);
  end if;
end;
$$;

grant execute on function public.upsert_inventory_stock_by_location(uuid, uuid, numeric)
  to authenticated;

commit;
