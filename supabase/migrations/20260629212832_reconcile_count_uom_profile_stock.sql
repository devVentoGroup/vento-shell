begin;

create or replace function public.set_inventory_stock_by_uom_profile_count(
  p_location_id uuid,
  p_product_id uuid,
  p_uom_profile_id uuid,
  p_presentation_qty numeric,
  p_base_qty numeric,
  p_location_position_id uuid default null
) returns void
language plpgsql
security definer
set search_path = public, pg_temp
as $$
declare
  v_site_id uuid;
begin
  select checked.site_id
    into v_site_id
  from public.assert_inventory_uom_profile_stock_input(
    p_location_id,
    p_location_position_id,
    p_product_id,
    p_uom_profile_id,
    coalesce(p_presentation_qty, 0),
    coalesce(p_base_qty, 0)
  ) checked;

  if not (
    public.has_permission('nexo.inventory.stock', v_site_id)
    or public.has_permission('nexo.inventory.counts', v_site_id)
  ) then
    raise exception 'permission denied';
  end if;

  perform pg_advisory_xact_lock(
    hashtextextended(
      p_location_id::text || ':' || p_product_id::text || ':' || coalesce(p_location_position_id::text, ''),
      0
    )
  );

  update public.inventory_stock_by_uom_profile stock
  set presentation_qty = 0,
      base_qty = 0,
      site_id = v_site_id,
      updated_at = now()
  where stock.location_id = p_location_id
    and stock.product_id = p_product_id
    and stock.uom_profile_id <> p_uom_profile_id
    and (
      (p_location_position_id is null and stock.location_position_id is null)
      or stock.location_position_id = p_location_position_id
    );

  if p_location_position_id is null then
    insert into public.inventory_stock_by_uom_profile (
      site_id,
      location_id,
      location_position_id,
      product_id,
      uom_profile_id,
      presentation_qty,
      base_qty,
      updated_at
    )
    values (
      v_site_id,
      p_location_id,
      null,
      p_product_id,
      p_uom_profile_id,
      coalesce(p_presentation_qty, 0),
      coalesce(p_base_qty, 0),
      now()
    )
    on conflict (location_id, product_id, uom_profile_id) where location_position_id is null do update
      set presentation_qty = excluded.presentation_qty,
          base_qty = excluded.base_qty,
          site_id = excluded.site_id,
          updated_at = now();
  else
    insert into public.inventory_stock_by_uom_profile (
      site_id,
      location_id,
      location_position_id,
      product_id,
      uom_profile_id,
      presentation_qty,
      base_qty,
      updated_at
    )
    values (
      v_site_id,
      p_location_id,
      p_location_position_id,
      p_product_id,
      p_uom_profile_id,
      coalesce(p_presentation_qty, 0),
      coalesce(p_base_qty, 0),
      now()
    )
    on conflict (location_id, location_position_id, product_id, uom_profile_id) where location_position_id is not null do update
      set presentation_qty = excluded.presentation_qty,
          base_qty = excluded.base_qty,
          site_id = excluded.site_id,
          updated_at = now();
  end if;
end;
$$;

create or replace function public.apply_inventory_count_adjustments(
  p_session_id uuid,
  p_user_id uuid
) returns jsonb
language plpgsql
security definer
set search_path to 'public', 'pg_temp'
as $$
declare
  v_session record;
  v_line record;
  v_applied integer := 0;
  v_new_site_qty numeric;
  v_new_loc_qty numeric;
  v_new_pos_qty numeric;
begin
  select *
  into v_session
  from public.inventory_count_sessions s
  where s.id = p_session_id
  for update;

  if not found then
    raise exception 'Sesion no encontrada';
  end if;

  if coalesce(v_session.status, '') <> 'closed' then
    raise exception 'Sesion debe estar cerrada';
  end if;

  for v_line in
    select
      l.id,
      l.product_id,
      l.location_position_id,
      coalesce(l.quantity_counted, 0) as counted_qty,
      coalesce(l.quantity_delta, 0) as delta,
      coalesce(l.input_quantity, abs(coalesce(l.quantity_delta, 0))) as input_quantity,
      coalesce(l.input_unit_code, l.stock_unit_code, p.stock_unit_code, p.unit, 'un') as input_unit_code,
      l.input_uom_profile_id,
      coalesce(l.stock_unit_code, p.stock_unit_code, p.unit, 'un') as stock_unit_code
    from public.inventory_count_lines l
    left join public.products p on p.id = l.product_id
    where l.session_id = p_session_id
      and l.adjustment_applied_at is null
    order by l.product_id, l.location_position_id nulls first
    for update of l
  loop
    if v_line.delta <> 0 then
      insert into public.inventory_movements (
        site_id,
        product_id,
        movement_type,
        quantity,
        input_qty,
        input_unit_code,
        conversion_factor_to_stock,
        stock_unit_code,
        input_uom_profile_id,
        location_id,
        location_position_id,
        note,
        created_by
      )
      values (
        v_session.site_id,
        v_line.product_id,
        'adjustment',
        v_line.delta,
        abs(v_line.delta),
        coalesce(v_line.input_unit_code, v_line.stock_unit_code, 'un'),
        1,
        coalesce(v_line.stock_unit_code, 'un'),
        v_line.input_uom_profile_id,
        case when coalesce(v_session.scope_type, '') = 'loc' then v_session.scope_location_id else null end,
        v_line.location_position_id,
        format('Ajuste por conteo sesion %s', p_session_id),
        p_user_id
      );

      insert into public.inventory_stock_by_site (site_id, product_id, current_qty, updated_at)
      values (v_session.site_id, v_line.product_id, greatest(0, v_line.delta), now())
      on conflict (site_id, product_id) do update
        set current_qty = greatest(0, coalesce(public.inventory_stock_by_site.current_qty, 0) + v_line.delta),
            updated_at = now()
      returning current_qty into v_new_site_qty;

      if coalesce(v_session.scope_type, '') = 'loc' and v_session.scope_location_id is not null then
        insert into public.inventory_stock_by_location (location_id, product_id, current_qty, updated_at)
        values (v_session.scope_location_id, v_line.product_id, greatest(0, v_line.delta), now())
        on conflict (location_id, product_id) do update
          set current_qty = greatest(0, coalesce(public.inventory_stock_by_location.current_qty, 0) + v_line.delta),
              updated_at = now()
        returning current_qty into v_new_loc_qty;
      end if;

      if v_line.location_position_id is not null then
        insert into public.inventory_stock_by_position (position_id, product_id, current_qty, updated_at)
        values (v_line.location_position_id, v_line.product_id, greatest(0, v_line.delta), now())
        on conflict (position_id, product_id) do update
          set current_qty = greatest(0, coalesce(public.inventory_stock_by_position.current_qty, 0) + v_line.delta),
              updated_at = now()
        returning current_qty into v_new_pos_qty;
      end if;

      v_applied := v_applied + 1;
    end if;

    if coalesce(v_session.scope_type, '') = 'loc' and v_session.scope_location_id is not null then
      if v_line.input_uom_profile_id is not null then
        perform public.set_inventory_stock_by_uom_profile_count(
          v_session.scope_location_id,
          v_line.product_id,
          v_line.input_uom_profile_id,
          coalesce(v_line.input_quantity, 0),
          coalesce(v_line.counted_qty, 0),
          v_line.location_position_id
        );
      elsif lower(trim(coalesce(v_line.input_unit_code, ''))) = lower(trim(coalesce(v_line.stock_unit_code, ''))) then
        update public.inventory_stock_by_uom_profile stock
        set presentation_qty = 0,
            base_qty = 0,
            updated_at = now()
        where stock.location_id = v_session.scope_location_id
          and stock.product_id = v_line.product_id
          and (
            (v_line.location_position_id is null and stock.location_position_id is null)
            or stock.location_position_id = v_line.location_position_id
          );
      end if;
    end if;

    update public.inventory_count_lines
    set adjustment_applied_at = now()
    where id = v_line.id;
  end loop;

  return jsonb_build_object('applied', v_applied);
end;
$$;

commit;
