-- Atomic allocation prevents two operators from loading the same ready quantity.

alter table public.restock_item_fulfillments
  add column allocated_base_qty numeric not null default 0 check (allocated_base_qty >= 0);

alter table public.restock_item_fulfillments
  drop constraint if exists restock_item_fulfillments_status_check;
alter table public.restock_item_fulfillments
  add constraint restock_item_fulfillments_status_check
  check (status in ('pending', 'reserved', 'preparing', 'partially_ready', 'ready', 'allocated', 'blocked', 'reassigned', 'released', 'cancelled'));
alter table public.restock_item_fulfillments
  add constraint restock_item_fulfillments_allocated_within_ready
  check (allocated_base_qty <= ready_base_qty);

create or replace function public.create_remission_shipment_from_fulfillments(
  p_origin_site_id uuid,
  p_destination_site_id uuid,
  p_dispatch_run_id uuid,
  p_items jsonb
) returns uuid
language plpgsql
security invoker
set search_path = public
as $$
declare
  v_shipment_id uuid;
  v_item jsonb;
  v_fulfillment record;
  v_requested numeric;
  v_available numeric;
  v_qty numeric;
  v_current_user uuid := auth.uid();
begin
  if p_origin_site_id is null or p_destination_site_id is null or p_origin_site_id = p_destination_site_id then
    raise exception 'Origen y destino válidos son obligatorios.';
  end if;
  if coalesce(jsonb_typeof(p_items), '') <> 'array' or jsonb_array_length(p_items) = 0 then
    raise exception 'Selecciona al menos una cantidad lista para cargar.';
  end if;
  if not (
    public.has_permission('nexo.inventory.remissions.all_sites')
    or public.has_permission('nexo.inventory.remissions.transit', p_origin_site_id)
    or public.has_permission('nexo.inventory.remissions.prepare', p_origin_site_id)
  ) then
    raise exception 'No tienes permiso para armar una salida desde esta sede.';
  end if;
  if p_dispatch_run_id is not null and not exists (
    select 1 from public.remission_dispatch_runs r
    where r.id = p_dispatch_run_id and r.origin_site_id = p_origin_site_id and r.status in ('draft', 'loading')
  ) then
    raise exception 'La salida logística no está disponible para este origen.';
  end if;

  insert into public.remission_shipments (
    dispatch_run_id, origin_site_id, destination_site_id, shipment_code, status, created_by, updated_by
  ) values (
    p_dispatch_run_id, p_origin_site_id, p_destination_site_id,
    'ENV-' || upper(substr(replace(gen_random_uuid()::text, '-', ''), 1, 8)),
    'loading', v_current_user, v_current_user
  ) returning id into v_shipment_id;

  for v_item in select value from jsonb_array_elements(p_items)
  loop
    v_qty := round(coalesce((v_item ->> 'base_qty')::numeric, 0), 6);
    if v_qty <= 0 then
      raise exception 'La cantidad a cargar debe ser mayor que cero.';
    end if;

    select
      f.id, f.request_item_id, f.product_id, f.source_location_id, f.destination_location_id,
      f.ready_base_qty, f.allocated_base_qty, f.status,
      i.stock_unit_code, i.request_policy_id, i.request_policy_label
    into v_fulfillment
    from public.restock_item_fulfillments f
    join public.restock_request_items i on i.id = f.request_item_id
    where f.id = (v_item ->> 'fulfillment_id')::uuid
      and f.from_site_id = p_origin_site_id
      and f.to_site_id = p_destination_site_id
      and f.status in ('partially_ready', 'ready', 'allocated')
    for update of f;

    if not found then
      raise exception 'Una tarea seleccionada ya no está lista para cargar.';
    end if;

    v_available := round(v_fulfillment.ready_base_qty - v_fulfillment.allocated_base_qty, 6);
    if v_qty > v_available then
      raise exception 'La cantidad solicitada (%) supera lo disponible para cargar (%) en una tarea.', v_qty, v_available;
    end if;

    insert into public.remission_shipment_items (
      shipment_id, request_item_id, fulfillment_id, product_id, source_location_id,
      destination_location_id, base_qty, stock_unit_code, request_policy_id,
      request_policy_label, created_by
    ) values (
      v_shipment_id, v_fulfillment.request_item_id, v_fulfillment.id, v_fulfillment.product_id,
      v_fulfillment.source_location_id, v_fulfillment.destination_location_id, v_qty,
      v_fulfillment.stock_unit_code, v_fulfillment.request_policy_id,
      v_fulfillment.request_policy_label, v_current_user
    );

    update public.restock_item_fulfillments
    set allocated_base_qty = allocated_base_qty + v_qty,
        status = case when ready_base_qty - (allocated_base_qty + v_qty) > 0 then 'partially_ready' else 'allocated' end,
        updated_by = v_current_user,
        updated_at = now()
    where id = v_fulfillment.id;
  end loop;

  return v_shipment_id;
end;
$$;

revoke all on function public.create_remission_shipment_from_fulfillments(uuid, uuid, uuid, jsonb) from public;
grant execute on function public.create_remission_shipment_from_fulfillments(uuid, uuid, uuid, jsonb) to authenticated, service_role;