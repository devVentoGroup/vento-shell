create table if not exists public.inventory_entry_corrections (
  id uuid primary key default gen_random_uuid(),
  entry_id uuid not null references public.inventory_entries(id) on delete restrict,
  correction_type text not null check (correction_type in ('reverse', 'edit')),
  comment text not null check (length(btrim(comment)) > 0),
  before_snapshot jsonb not null default '{}'::jsonb,
  after_snapshot jsonb not null default '{}'::jsonb,
  replacement_entry_id uuid references public.inventory_entries(id) on delete restrict,
  created_by uuid not null,
  created_at timestamptz not null default now()
);

alter table public.inventory_entry_corrections enable row level security;

drop policy if exists inventory_entry_corrections_select_staff on public.inventory_entry_corrections;
create policy inventory_entry_corrections_select_staff
on public.inventory_entry_corrections
for select
using (is_employee());

drop policy if exists inventory_entry_corrections_insert_receipts on public.inventory_entry_corrections;
create policy inventory_entry_corrections_insert_receipts
on public.inventory_entry_corrections
for insert
with check (
  created_by = auth.uid()
  and exists (
    select 1
    from public.inventory_entries e
    where e.id = entry_id
      and has_permission('origo.procurement.receipts'::text, e.site_id, null)
  )
);

create or replace function public.origo_reverse_inventory_entry(
  p_entry_id uuid,
  p_comment text
)
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  v_user_id uuid := auth.uid();
  v_comment text := btrim(coalesce(p_comment, ''));
  v_now timestamptz := now();
  v_entry public.inventory_entries%rowtype;
  v_before jsonb;
  v_after jsonb;
  v_item_count integer := 0;
  v_current_qty numeric := 0;
  v_all_received boolean := false;
  v_event record;
  v_row record;
begin
  if v_user_id is null then
    raise exception 'Usuario no autenticado.';
  end if;

  if v_comment = '' then
    raise exception 'El comentario de reversión es obligatorio.';
  end if;

  select *
  into v_entry
  from public.inventory_entries
  where id = p_entry_id
  for update;

  if not found then
    raise exception 'Recepción no encontrada.';
  end if;

  if not has_permission('origo.procurement.receipts'::text, v_entry.site_id, null) then
    raise exception 'No tienes permiso para reversar esta recepción.';
  end if;

  if coalesce(v_entry.status, '') <> 'received' then
    raise exception 'Solo se pueden reversar recepciones en estado received.';
  end if;

  select count(*)
  into v_item_count
  from public.inventory_entry_items
  where entry_id = p_entry_id;

  if v_item_count <= 0 then
    raise exception 'La recepción no tiene ítems para reversar.';
  end if;

  select jsonb_build_object(
    'entry', to_jsonb(v_entry),
    'items', coalesce((
      select jsonb_agg(to_jsonb(ii) order by ii.created_at, ii.id)
      from public.inventory_entry_items ii
      where ii.entry_id = p_entry_id
    ), '[]'::jsonb),
    'cost_events', coalesce((
      select jsonb_agg(to_jsonb(ce) order by ce.created_at, ce.id)
      from public.product_cost_events ce
      where ce.source_entry_id = p_entry_id
    ), '[]'::jsonb)
  )
  into v_before;

  for v_row in
    select product_id, sum(quantity_received) as qty
    from public.inventory_entry_items
    where entry_id = p_entry_id
    group by product_id
  loop
    select current_qty
    into v_current_qty
    from public.inventory_stock_by_site
    where site_id = v_entry.site_id
      and product_id = v_row.product_id
    for update;

    if coalesce(v_current_qty, 0) < coalesce(v_row.qty, 0) then
      raise exception 'No se puede reversar: el stock de sede del producto % es menor a la cantidad recibida.', v_row.product_id;
    end if;
  end loop;

  for v_row in
    select location_id, product_id, sum(quantity_received) as qty
    from public.inventory_entry_items
    where entry_id = p_entry_id
      and location_id is not null
    group by location_id, product_id
  loop
    select current_qty
    into v_current_qty
    from public.inventory_stock_by_location
    where location_id = v_row.location_id
      and product_id = v_row.product_id
    for update;

    if coalesce(v_current_qty, 0) < coalesce(v_row.qty, 0) then
      raise exception 'No se puede reversar: el stock del LOC para el producto % es menor a la cantidad recibida.', v_row.product_id;
    end if;
  end loop;

  for v_event in
    select *
    from public.product_cost_events
    where source_entry_id = p_entry_id
    for update
  loop
    if exists (
      select 1
      from public.product_cost_events later
      where later.product_id = v_event.product_id
        and later.created_at > v_event.created_at
    ) then
      raise exception 'No se puede reversar automático: hay eventos de costo posteriores para el producto %. Requiere recalculo de costos.', v_event.product_id;
    end if;
  end loop;

  insert into public.inventory_movements (
    site_id,
    product_id,
    location_id,
    location_position_id,
    movement_type,
    quantity,
    note,
    unit_cost,
    created_by,
    input_qty,
    input_unit_code,
    conversion_factor_to_stock,
    stock_unit_code,
    stock_unit_cost,
    line_total_cost,
    input_uom_profile_id
  )
  select
    v_entry.site_id,
    ii.product_id,
    ii.location_id,
    ii.location_position_id,
    'receipt_reversal',
    -ii.quantity_received,
    'Reversión recepción ORIGO ' || p_entry_id::text || ': ' || v_comment,
    ii.stock_unit_cost,
    v_user_id,
    -coalesce(ii.input_qty, ii.quantity_received),
    ii.input_unit_code,
    ii.conversion_factor_to_stock,
    ii.stock_unit_code,
    ii.stock_unit_cost,
    -coalesce(ii.line_total_cost, 0),
    ii.input_uom_profile_id
  from public.inventory_entry_items ii
  where ii.entry_id = p_entry_id;

  for v_row in
    select product_id, sum(quantity_received) as qty
    from public.inventory_entry_items
    where entry_id = p_entry_id
    group by product_id
  loop
    update public.inventory_stock_by_site
    set current_qty = round(current_qty - v_row.qty, 6),
        updated_at = v_now
    where site_id = v_entry.site_id
      and product_id = v_row.product_id;
  end loop;

  for v_row in
    select location_id, product_id, sum(quantity_received) as qty
    from public.inventory_entry_items
    where entry_id = p_entry_id
      and location_id is not null
    group by location_id, product_id
  loop
    perform public.upsert_inventory_stock_by_location(
      p_location_id := v_row.location_id,
      p_product_id := v_row.product_id,
      p_delta := -v_row.qty
    );
  end loop;

  for v_row in
    select purchase_order_item_id, sum(coalesce(input_qty, quantity_received)) as qty
    from public.inventory_entry_items
    where entry_id = p_entry_id
      and purchase_order_item_id is not null
    group by purchase_order_item_id
  loop
    update public.purchase_order_items
    set quantity_received = greatest(0, coalesce(quantity_received, 0) - v_row.qty)
    where id = v_row.purchase_order_item_id;
  end loop;

  if v_entry.purchase_order_id is not null then
    select coalesce(
      bool_and(quantity_ordered > 0 and coalesce(quantity_received, 0) >= quantity_ordered),
      false
    )
    into v_all_received
    from public.purchase_order_items
    where purchase_order_id = v_entry.purchase_order_id;

    update public.purchase_orders
    set status = case when v_all_received then 'received' else 'sent' end,
        received_at = case when v_all_received then received_at else null end
    where id = v_entry.purchase_order_id;
  end if;

  for v_event in
    select *
    from public.product_cost_events
    where source_entry_id = p_entry_id
    order by created_at, id
  loop
    update public.products
    set cost = v_event.cost_before,
        updated_at = v_now
    where id = v_event.product_id;

    insert into public.product_cost_events (
      product_id,
      site_id,
      source,
      source_entry_id,
      qty_before,
      qty_in,
      cost_before,
      cost_in,
      cost_after,
      basis,
      created_by
    )
    values (
      v_event.product_id,
      v_event.site_id,
      'entry_reversal',
      p_entry_id,
      coalesce(v_event.qty_before, 0) + coalesce(v_event.qty_in, 0),
      -coalesce(v_event.qty_in, 0),
      v_event.cost_after,
      v_event.cost_in,
      v_event.cost_before,
      v_event.basis,
      v_user_id
    );
  end loop;

  update public.inventory_entries
  set status = 'reversed',
      notes = btrim(concat_ws(E'\n', notes, 'Reversión ' || to_char(v_now, 'YYYY-MM-DD HH24:MI:SS TZ') || ': ' || v_comment)),
      updated_at = v_now
  where id = p_entry_id;

  select jsonb_build_object(
    'entry', to_jsonb(e),
    'items', coalesce((
      select jsonb_agg(to_jsonb(ii) order by ii.created_at, ii.id)
      from public.inventory_entry_items ii
      where ii.entry_id = p_entry_id
    ), '[]'::jsonb),
    'reversal_movements', coalesce((
      select jsonb_agg(to_jsonb(m) order by m.created_at, m.id)
      from public.inventory_movements m
      where m.note = 'Reversión recepción ORIGO ' || p_entry_id::text || ': ' || v_comment
    ), '[]'::jsonb)
  )
  into v_after
  from public.inventory_entries e
  where e.id = p_entry_id;

  insert into public.inventory_entry_corrections (
    entry_id,
    correction_type,
    comment,
    before_snapshot,
    after_snapshot,
    created_by
  )
  values (
    p_entry_id,
    'reverse',
    v_comment,
    v_before,
    v_after,
    v_user_id
  );
end;
$$;

grant execute on function public.origo_reverse_inventory_entry(uuid, text) to authenticated;
