-- NEXO - Conteo operativo/quincenal con revision antes de aplicar.
-- Ejecutar en Supabase SQL Editor o como migration.
-- Objetivo:
-- 1) Permitir conteos con cantidad 0.
-- 2) Guardar sesiones abiertas para sede/zona/LOC sin aplicar ajustes automaticamente.
-- 3) Soportar ubicacion interna en lineas de conteo.
-- 4) Calcular diferencias al cerrar y aplicar solo al aprobar.

alter table public.inventory_count_lines
  drop constraint if exists inventory_count_lines_session_id_product_id_key;

alter table public.inventory_count_lines
  add column if not exists input_quantity numeric,
  add column if not exists input_unit_code text,
  add column if not exists input_uom_profile_id uuid,
  add column if not exists stock_unit_code text,
  add column if not exists location_position_id uuid;

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'inventory_count_lines_location_position_id_fkey'
  ) then
    alter table public.inventory_count_lines
      add constraint inventory_count_lines_location_position_id_fkey
      foreign key (location_position_id)
      references public.inventory_location_positions(id)
      on delete set null;
  end if;

  if not exists (
    select 1
    from pg_constraint
    where conname = 'inventory_count_lines_input_uom_profile_id_fkey'
  ) then
    alter table public.inventory_count_lines
      add constraint inventory_count_lines_input_uom_profile_id_fkey
      foreign key (input_uom_profile_id)
      references public.product_uom_profiles(id)
      on delete set null;
  end if;
end $$;

create index if not exists inventory_count_lines_session_product_position_idx
  on public.inventory_count_lines (session_id, product_id, location_position_id);

create or replace function public.create_inventory_count_session_with_lines(
  p_site_id uuid,
  p_scope_type text,
  p_scope_zone text,
  p_scope_location_id uuid,
  p_name text,
  p_created_by uuid,
  p_lines jsonb
) returns jsonb
language plpgsql
security definer
set search_path to 'public', 'pg_temp'
as $$
declare
  v_scope_type text := lower(coalesce(nullif(trim(p_scope_type), ''), 'site'));
  v_scope_zone text := nullif(trim(coalesce(p_scope_zone, '')), '');
  v_session_id uuid;
  v_count integer := 0;
begin
  if jsonb_typeof(coalesce(p_lines, '[]'::jsonb)) <> 'array' then
    raise exception 'p_lines debe ser un arreglo JSON';
  end if;

  if v_scope_type not in ('site', 'zone', 'loc') then
    raise exception 'scope_type invalido: %', v_scope_type;
  end if;

  if v_scope_type = 'loc' then
    if p_scope_location_id is null then
      raise exception 'scope_location_id requerido para scope_type=loc';
    end if;

    if not exists (
      select 1
      from public.inventory_locations loc
      where loc.id = p_scope_location_id
        and loc.site_id = p_site_id
        and coalesce(loc.is_active, true) = true
    ) then
      raise exception 'LOC no pertenece a la sede del conteo';
    end if;
  end if;

  if v_scope_type = 'zone' and v_scope_zone is null then
    raise exception 'scope_zone requerido para scope_type=zone';
  end if;

  create temporary table tmp_count_lines_input (
    product_id uuid not null,
    quantity numeric not null,
    input_quantity numeric null,
    input_unit_code text null,
    input_uom_profile_id uuid null,
    stock_unit_code text null,
    location_position_id uuid null
  ) on commit drop;

  insert into tmp_count_lines_input (
    product_id,
    quantity,
    input_quantity,
    input_unit_code,
    input_uom_profile_id,
    stock_unit_code,
    location_position_id
  )
  select
    (entry ->> 'product_id')::uuid,
    (entry ->> 'quantity')::numeric,
    nullif(trim(coalesce(entry ->> 'input_quantity', '')), '')::numeric,
    nullif(trim(coalesce(entry ->> 'input_unit_code', '')), ''),
    nullif(trim(coalesce(entry ->> 'uom_profile_id', '')), '')::uuid,
    nullif(trim(coalesce(entry ->> 'stock_unit_code', '')), ''),
    nullif(trim(coalesce(entry ->> 'position_id', '')), '')::uuid
  from jsonb_array_elements(coalesce(p_lines, '[]'::jsonb)) entry
  where nullif(trim(coalesce(entry ->> 'product_id', '')), '') is not null
    and coalesce((entry ->> 'quantity')::numeric, -1) >= 0;

  select count(*) into v_count from tmp_count_lines_input;
  if v_count = 0 then
    raise exception 'Al menos una linea capturada';
  end if;

  if v_scope_type <> 'loc' and exists (
    select 1 from tmp_count_lines_input where location_position_id is not null
  ) then
    raise exception 'Las ubicaciones internas solo aplican para conteos por LOC';
  end if;

  if v_scope_type = 'loc' and exists (
    select 1
    from tmp_count_lines_input line
    where line.location_position_id is not null
      and not exists (
        select 1
        from public.inventory_location_positions pos
        where pos.id = line.location_position_id
          and pos.location_id = p_scope_location_id
          and pos.site_id = p_site_id
          and coalesce(pos.is_active, true) = true
      )
  ) then
    raise exception 'Una o mas ubicaciones internas no pertenecen al LOC del conteo';
  end if;

  create temporary table tmp_count_lines_agg (
    product_id uuid not null,
    location_position_id uuid null,
    quantity numeric not null,
    input_quantity numeric null,
    input_unit_code text null,
    input_uom_profile_id uuid null,
    stock_unit_code text null
  ) on commit drop;

  insert into tmp_count_lines_agg (
    product_id,
    location_position_id,
    quantity,
    input_quantity,
    input_unit_code,
    input_uom_profile_id,
    stock_unit_code
  )
  select
    product_id,
    location_position_id,
    sum(quantity) as quantity,
    case when count(distinct coalesce(input_unit_code, '')) = 1 then sum(coalesce(input_quantity, quantity)) else null end,
    case when count(distinct coalesce(input_unit_code, '')) = 1 then max(input_unit_code) else null end,
    case
      when count(distinct input_uom_profile_id) filter (where input_uom_profile_id is not null) = 1
        then (array_agg(input_uom_profile_id) filter (where input_uom_profile_id is not null))[1]
      else null
    end,
    (array_agg(stock_unit_code) filter (where stock_unit_code is not null))[1]
  from tmp_count_lines_input
  group by product_id, location_position_id;

  insert into public.inventory_count_sessions (
    site_id,
    status,
    scope_type,
    scope_zone,
    scope_location_id,
    name,
    created_by
  )
  values (
    p_site_id,
    'open',
    v_scope_type,
    case when v_scope_type = 'zone' then v_scope_zone else null end,
    case when v_scope_type = 'loc' then p_scope_location_id else null end,
    coalesce(
      nullif(trim(p_name), ''),
      case
        when v_scope_type = 'zone' then format('Conteo zona %s', v_scope_zone)
        when v_scope_type = 'loc' then 'Conteo por LOC'
        else 'Conteo'
      end
    ),
    p_created_by
  )
  returning id into v_session_id;

  insert into public.inventory_count_lines (
    session_id,
    product_id,
    quantity_counted,
    input_quantity,
    input_unit_code,
    input_uom_profile_id,
    stock_unit_code,
    location_position_id,
    current_qty_at_open
  )
  select
    v_session_id,
    li.product_id,
    li.quantity,
    li.input_quantity,
    li.input_unit_code,
    li.input_uom_profile_id,
    coalesce(li.stock_unit_code, p.stock_unit_code, p.unit, 'un'),
    li.location_position_id,
    case
      when li.location_position_id is not null then coalesce(pos_stock.current_qty, 0)
      when v_scope_type = 'loc' then coalesce(loc_stock.current_qty, 0)
      when v_scope_type = 'zone' then coalesce(zone_stock.current_qty, 0)
      else coalesce(site_stock.current_qty, 0)
    end
  from tmp_count_lines_agg li
  left join public.products p
    on p.id = li.product_id
  left join public.inventory_stock_by_position pos_stock
    on pos_stock.position_id = li.location_position_id
   and pos_stock.product_id = li.product_id
  left join public.inventory_stock_by_location loc_stock
    on loc_stock.location_id = p_scope_location_id
   and loc_stock.product_id = li.product_id
  left join lateral (
    select coalesce(sum(s.current_qty), 0) as current_qty
    from public.inventory_locations il
    left join public.inventory_stock_by_location s
      on s.location_id = il.id
     and s.product_id = li.product_id
    where il.site_id = p_site_id
      and il.zone = v_scope_zone
      and il.is_active is true
  ) zone_stock on v_scope_type = 'zone'
  left join public.inventory_stock_by_site site_stock
    on site_stock.site_id = p_site_id
   and site_stock.product_id = li.product_id;

  return jsonb_build_object('countSessionId', v_session_id, 'count', v_count);
end;
$$;

create or replace function public.close_inventory_count_session(
  p_session_id uuid,
  p_closed_by uuid
) returns jsonb
language plpgsql
security definer
set search_path to 'public', 'pg_temp'
as $$
declare
  v_session record;
  v_count integer := 0;
begin
  select *
  into v_session
  from public.inventory_count_sessions s
  where s.id = p_session_id
  for update;

  if not found then
    raise exception 'Sesion no encontrada';
  end if;

  if coalesce(v_session.status, '') <> 'open' then
    raise exception 'Sesion debe estar abierta';
  end if;

  update public.inventory_count_lines l
  set
    current_qty_at_close =
      case
        when l.location_position_id is not null then coalesce(pos_stock.current_qty, 0)
        when coalesce(v_session.scope_type, '') = 'loc' and v_session.scope_location_id is not null then coalesce(loc_stock.current_qty, 0)
        when coalesce(v_session.scope_type, '') = 'zone' and coalesce(v_session.scope_zone, '') <> '' then coalesce(zone_stock.current_qty, 0)
        else coalesce(site_stock.current_qty, 0)
      end,
    quantity_delta =
      coalesce(l.quantity_counted, 0) -
      case
        when l.location_position_id is not null then coalesce(pos_stock.current_qty, 0)
        when coalesce(v_session.scope_type, '') = 'loc' and v_session.scope_location_id is not null then coalesce(loc_stock.current_qty, 0)
        when coalesce(v_session.scope_type, '') = 'zone' and coalesce(v_session.scope_zone, '') <> '' then coalesce(zone_stock.current_qty, 0)
        else coalesce(site_stock.current_qty, 0)
      end
  from public.inventory_count_lines line_ref
  left join public.inventory_stock_by_position pos_stock
    on pos_stock.position_id = line_ref.location_position_id
   and pos_stock.product_id = line_ref.product_id
  left join public.inventory_stock_by_location loc_stock
    on loc_stock.location_id = v_session.scope_location_id
   and loc_stock.product_id = line_ref.product_id
  left join lateral (
    select coalesce(sum(s.current_qty), 0) as current_qty
    from public.inventory_locations il
    left join public.inventory_stock_by_location s
      on s.location_id = il.id
     and s.product_id = line_ref.product_id
    where il.site_id = v_session.site_id
      and il.zone = v_session.scope_zone
      and il.is_active is true
  ) zone_stock on coalesce(v_session.scope_type, '') = 'zone'
  left join public.inventory_stock_by_site site_stock
    on site_stock.site_id = v_session.site_id
   and site_stock.product_id = line_ref.product_id
  where l.id = line_ref.id
    and l.session_id = p_session_id;

  update public.inventory_count_sessions
  set
    status = 'closed',
    closed_at = now(),
    closed_by = p_closed_by
  where id = p_session_id;

  select count(*) into v_count
  from public.inventory_count_lines
  where session_id = p_session_id;

  return jsonb_build_object('sessionId', p_session_id, 'count', v_count);
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

    update public.inventory_count_lines
    set adjustment_applied_at = now()
    where id = v_line.id;
  end loop;

  return jsonb_build_object('applied', v_applied);
end;
$$;
