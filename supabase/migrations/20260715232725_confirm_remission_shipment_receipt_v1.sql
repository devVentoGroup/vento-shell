-- Confirma una recepción física completa o parcial sin dividir la trazabilidad
-- entre varias llamadas de aplicación. El inventario destino se publica en una
-- etapa posterior, una vez definido el asiento operativo de recepción.

create or replace function public.confirm_remission_shipment_receipt(
  p_shipment_id uuid,
  p_items jsonb,
  p_notes text default null
)
returns uuid
language plpgsql
security invoker
set search_path = public
as $$
declare
  v_shipment public.remission_shipments%rowtype;
  v_shipment_item public.remission_shipment_items%rowtype;
  v_receipt_id uuid;
  v_item jsonb;
  v_shipment_item_id uuid;
  v_received_qty numeric;
  v_expected_total numeric := 0;
  v_received_total numeric := 0;
begin
  if jsonb_typeof(p_items) <> 'array' or jsonb_array_length(p_items) = 0 then
    raise exception 'Debes confirmar al menos una línea recibida.';
  end if;

  select * into v_shipment
  from public.remission_shipments
  where id = p_shipment_id
  for update;

  if not found then
    raise exception 'El envío no existe o no está disponible.';
  end if;
  if v_shipment.status <> 'in_transit' then
    raise exception 'Solo se pueden recibir envíos que estén en tránsito.';
  end if;

  insert into public.remission_receipts (
    shipment_id, status, received_at, received_by, notes, created_by, updated_by
  ) values (
    p_shipment_id, 'confirmed', now(), auth.uid(), nullif(trim(p_notes), ''), auth.uid(), auth.uid()
  ) returning id into v_receipt_id;

  for v_item in select value from jsonb_array_elements(p_items)
  loop
    begin
      v_shipment_item_id := (v_item ->> 'shipment_item_id')::uuid;
      v_received_qty := (v_item ->> 'received_base_qty')::numeric;
    exception when others then
      raise exception 'Una línea de recepción es inválida.';
    end;

    if v_received_qty < 0 then
      raise exception 'La cantidad recibida no puede ser negativa.';
    end if;

    select * into v_shipment_item
    from public.remission_shipment_items
    where id = v_shipment_item_id
      and shipment_id = p_shipment_id
    for update;

    if not found then
      raise exception 'Una línea no pertenece a este envío.';
    end if;
    if v_received_qty > v_shipment_item.base_qty then
      raise exception 'No puedes recibir más de lo que fue despachado.';
    end if;

    insert into public.remission_receipt_items (
      receipt_id, shipment_item_id, received_base_qty, accepted_base_qty, created_by
    ) values (
      v_receipt_id, v_shipment_item.id, v_received_qty, v_received_qty, auth.uid()
    );

    if v_received_qty < v_shipment_item.base_qty then
      insert into public.remission_exceptions (
        request_item_id, fulfillment_id, shipment_id, shipment_item_id, product_id,
        stage, exception_type, status, affected_base_qty, description, created_by, updated_by
      ) values (
        v_shipment_item.request_item_id, v_shipment_item.fulfillment_id, p_shipment_id,
        v_shipment_item.id, v_shipment_item.product_id,
        'receipt', 'shortage', 'open', v_shipment_item.base_qty - v_received_qty,
        'Faltante confirmado durante la recepción.', auth.uid(), auth.uid()
      );
    end if;

    v_expected_total := v_expected_total + v_shipment_item.base_qty;
    v_received_total := v_received_total + v_received_qty;
  end loop;

  if (select count(*) from public.remission_shipment_items where shipment_id = p_shipment_id) <> jsonb_array_length(p_items) then
    raise exception 'Debes confirmar todas las líneas del envío.';
  end if;

  update public.remission_shipments
  set status = case when v_received_total = v_expected_total then 'received' else 'partial_receipt' end,
      arrived_at = now(),
      updated_at = now(),
      updated_by = auth.uid()
  where id = p_shipment_id;

  return v_receipt_id;
end;
$$;

revoke all on function public.confirm_remission_shipment_receipt(uuid, jsonb, text) from public;
grant execute on function public.confirm_remission_shipment_receipt(uuid, jsonb, text) to authenticated;
