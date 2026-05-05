begin;

create or replace function public.apply_inventory_count_adjustments(
  p_session_id uuid,
  p_user_id uuid
)
returns jsonb
language plpgsql
security definer
set search_path = public, pg_temp
as $$
declare
  v_session record;
  v_line record;
  v_stock_unit_code text;
  v_applied integer := 0;
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
      coalesce(l.quantity_counted, 0) as counted_qty,
      coalesce(l.quantity_delta, 0) as delta
    from public.inventory_count_lines l
    where l.session_id = p_session_id
      and l.adjustment_applied_at is null
    for update
  loop
    select coalesce(p.stock_unit_code, p.unit, 'un')
    into v_stock_unit_code
    from public.products p
    where p.id = v_line.product_id;

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
        note,
        created_by
      )
      values (
        v_session.site_id,
        v_line.product_id,
        'adjustment',
        v_line.delta,
        abs(v_line.delta),
        coalesce(v_stock_unit_code, 'un'),
        1,
        coalesce(v_stock_unit_code, 'un'),
        format('Ajuste por conteo sesion %s', p_session_id),
        p_user_id
      );

      if coalesce(v_session.scope_type, '') = 'loc' and v_session.scope_location_id is not null then
        perform public.upsert_inventory_stock_by_location(
          v_session.scope_location_id,
          v_line.product_id,
          v_line.delta
        );
      end if;

      insert into public.inventory_stock_by_site (site_id, product_id, current_qty, updated_at)
      values (v_session.site_id, v_line.product_id, greatest(0, v_line.delta), now())
      on conflict (site_id, product_id) do update
        set current_qty = greatest(0, coalesce(public.inventory_stock_by_site.current_qty, 0) + v_line.delta),
            updated_at = now();

      v_applied := v_applied + 1;
    else
      if coalesce(v_session.scope_type, '') = 'loc' and v_session.scope_location_id is not null then
        insert into public.inventory_stock_by_location (location_id, product_id, current_qty, updated_at)
        values (v_session.scope_location_id, v_line.product_id, greatest(0, v_line.counted_qty), now())
        on conflict (location_id, product_id) do update
          set updated_at = now();
      end if;

      insert into public.inventory_stock_by_site (site_id, product_id, current_qty, updated_at)
      values (v_session.site_id, v_line.product_id, greatest(0, v_line.counted_qty), now())
      on conflict (site_id, product_id) do update
        set updated_at = now();
    end if;

    update public.inventory_count_lines
    set adjustment_applied_at = now()
    where id = v_line.id;
  end loop;

  return jsonb_build_object('applied', v_applied);
end;
$$;

grant execute on function public.apply_inventory_count_adjustments(uuid, uuid) to authenticated;

commit;
