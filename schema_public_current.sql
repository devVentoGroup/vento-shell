


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


CREATE SCHEMA IF NOT EXISTS "public";


ALTER SCHEMA "public" OWNER TO "pg_database_owner";


COMMENT ON SCHEMA "public" IS 'standard public schema';



CREATE TYPE "public"."document_scope" AS ENUM (
    'employee',
    'site',
    'group'
);


ALTER TYPE "public"."document_scope" OWNER TO "postgres";


CREATE TYPE "public"."document_status" AS ENUM (
    'pending_review',
    'approved',
    'rejected'
);


ALTER TYPE "public"."document_status" OWNER TO "postgres";


CREATE TYPE "public"."employee_wallet_card_status" AS ENUM (
    'eligible',
    'issued',
    'revoked',
    'expired',
    'blocked'
);


ALTER TYPE "public"."employee_wallet_card_status" OWNER TO "postgres";


CREATE TYPE "public"."permission_scope_type" AS ENUM (
    'global',
    'site',
    'site_type',
    'area',
    'area_kind'
);


ALTER TYPE "public"."permission_scope_type" OWNER TO "postgres";


CREATE TYPE "public"."recipe_status" AS ENUM (
    'draft',
    'published',
    'archived'
);


ALTER TYPE "public"."recipe_status" OWNER TO "postgres";


CREATE TYPE "public"."site_type" AS ENUM (
    'satellite',
    'production_center',
    'admin'
);


ALTER TYPE "public"."site_type" OWNER TO "postgres";


CREATE TYPE "public"."support_ticket_status" AS ENUM (
    'open',
    'in_progress',
    'resolved',
    'closed'
);


ALTER TYPE "public"."support_ticket_status" OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."_set_updated_at"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END$$;


ALTER FUNCTION "public"."_set_updated_at"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."_vento_norm"("input" "text") RETURNS "text"
    LANGUAGE "sql" IMMUTABLE
    AS $_$
  SELECT regexp_replace(trim(coalesce($1,'')), '\s+', ' ', 'g')
$_$;


ALTER FUNCTION "public"."_vento_norm"("input" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."_vento_slugify"("input" "text") RETURNS "text"
    LANGUAGE "sql" IMMUTABLE
    AS $_$
  SELECT trim(both '-' from regexp_replace(lower(coalesce($1,'')), '[^a-z0-9]+', '-', 'g'))
$_$;


ALTER FUNCTION "public"."_vento_slugify"("input" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."_vento_uuid_from_text"("input" "text") RETURNS "uuid"
    LANGUAGE "sql" IMMUTABLE
    AS $_$
  SELECT (
    substr(md5(coalesce($1,'')), 1, 8)  || '-' ||
    substr(md5(coalesce($1,'')), 9, 4)  || '-' ||
    substr(md5(coalesce($1,'')), 13, 4) || '-' ||
    substr(md5(coalesce($1,'')), 17, 4) || '-' ||
    substr(md5(coalesce($1,'')), 21, 12)
  )::uuid
$_$;


ALTER FUNCTION "public"."_vento_uuid_from_text"("input" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."anonymize_user_personal_data"("p_user_id" "uuid") RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pass'
    AS $$
begin
  update public.users
  set
    full_name = 'Deleted User',
    document_id = null,
    document_type = null,
    phone = null,
    email = concat('deleted+', substring(p_user_id::text, 1, 8), '@deleted.local'),
    birth_date = null,
    is_active = false,
    is_client = false,
    marketing_opt_in = false,
    has_reviewed_google = false,
    last_review_prompt_date = null,
    updated_at = now()
  where id = p_user_id;

  delete from pass.user_favorites where user_id = p_user_id;
end;
$$;


ALTER FUNCTION "public"."anonymize_user_personal_data"("p_user_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."apply_inventory_count_adjustments"("p_session_id" "uuid", "p_user_id" "uuid") RETURNS "jsonb"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pg_temp'
    AS $$
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


ALTER FUNCTION "public"."apply_inventory_count_adjustments"("p_session_id" "uuid", "p_user_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."apply_inventory_site_count"("p_site_id" "uuid", "p_user_id" "uuid", "p_note" "text", "p_lines" "jsonb") RETURNS "jsonb"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pg_temp'
    AS $$
declare
  v_count integer := 0;
begin
  if jsonb_typeof(coalesce(p_lines, '[]'::jsonb)) <> 'array' then
    raise exception 'p_lines debe ser un arreglo JSON';
  end if;

  create temporary table tmp_site_count_lines (
    product_id uuid not null,
    quantity numeric not null
  ) on commit drop;

  insert into tmp_site_count_lines (product_id, quantity)
  select
    (entry ->> 'product_id')::uuid,
    (entry ->> 'quantity')::numeric
  from jsonb_array_elements(coalesce(p_lines, '[]'::jsonb)) entry
  where coalesce((entry ->> 'quantity')::numeric, 0) > 0;

  select count(*) into v_count from tmp_site_count_lines;
  if v_count = 0 then
    raise exception 'Al menos una linea con cantidad > 0';
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
    note,
    created_by
  )
  select
    p_site_id,
    l.product_id,
    'initial_count',
    l.quantity,
    l.quantity,
    coalesce(p.stock_unit_code, p.unit, 'un'),
    1,
    coalesce(p.stock_unit_code, p.unit, 'un'),
    p_note,
    p_user_id
  from tmp_site_count_lines l
  left join public.products p on p.id = l.product_id;

  insert into public.inventory_stock_by_site (
    site_id,
    product_id,
    current_qty,
    updated_at
  )
  select
    p_site_id,
    l.product_id,
    l.quantity,
    now()
  from tmp_site_count_lines l
  on conflict (site_id, product_id) do update
    set current_qty = excluded.current_qty,
        updated_at = excluded.updated_at;

  return jsonb_build_object('count', v_count);
end;
$$;


ALTER FUNCTION "public"."apply_inventory_site_count"("p_site_id" "uuid", "p_user_id" "uuid", "p_note" "text", "p_lines" "jsonb") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."apply_restock_receipt"("p_request_id" "uuid") RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare
  v_request record;
  v_item record;
  v_qty numeric;
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

    insert into public.inventory_movements (
      site_id,
      product_id,
      movement_type,
      quantity,
      note,
      related_restock_request_id
    )
    values (
      v_request.to_site_id,
      v_item.product_id,
      'transfer_in',
      v_qty,
      'Recepcion remision ' || p_request_id::text,
      p_request_id
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


ALTER FUNCTION "public"."apply_restock_receipt"("p_request_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."apply_restock_shipment"("p_request_id" "uuid") RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare
  v_request record;
  v_item record;
  v_qty numeric;
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

    insert into public.inventory_movements (
      site_id,
      product_id,
      movement_type,
      quantity,
      note,
      related_restock_request_id
    )
    values (
      v_request.from_site_id,
      v_item.product_id,
      'transfer_out',
      v_qty,
      'Salida remision ' || p_request_id::text,
      p_request_id
    );

    -- Totales por sede
    insert into public.inventory_stock_by_site (site_id, product_id, current_qty, updated_at)
    values (v_request.from_site_id, v_item.product_id, -v_qty, now())
    on conflict (site_id, product_id)
    do update set
      current_qty = public.inventory_stock_by_site.current_qty + excluded.current_qty,
      updated_at = now();

    -- Totales por LOC (si ya existe source_location_id para la l├¡nea)
    if v_item.source_location_id is not null then
      perform public.upsert_inventory_stock_by_location(v_item.source_location_id, v_item.product_id, -v_qty);
    end if;
  end loop;
end;
$$;


ALTER FUNCTION "public"."apply_restock_shipment"("p_request_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."apply_restock_shipment_from_picks"("p_request_id" "uuid") RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pg_temp'
    AS $$
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

  -- Sincroniza cantidades preparadas/enviadas por l├¡nea a partir del plan f├¡sico.
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

  -- Valida stock agregado por posici├│n interna.
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

  -- Valida stock no posicionado cuando el pick no trae posici├│n interna.
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


ALTER FUNCTION "public"."apply_restock_shipment_from_picks"("p_request_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."assert_inventory_uom_profile_stock_input"("p_location_id" "uuid", "p_location_position_id" "uuid", "p_product_id" "uuid", "p_uom_profile_id" "uuid", "p_presentation_qty" numeric, "p_base_qty" numeric) RETURNS TABLE("site_id" "uuid", "factor_to_stock" numeric)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pg_temp'
    AS $$
declare
  v_location record;
  v_position record;
  v_profile record;
  v_factor numeric;
begin
  if p_location_id is null or p_product_id is null or p_uom_profile_id is null then
    raise exception 'location, product and uom profile are required';
  end if;

  if coalesce(p_presentation_qty, 0) < 0 or coalesce(p_base_qty, 0) < 0 then
    raise exception 'presentation and base quantities cannot be negative';
  end if;

  select loc.id, loc.site_id
    into v_location
  from public.inventory_locations loc
  where loc.id = p_location_id
    and coalesce(loc.is_active, true) = true;

  if not found then
    raise exception 'active LOC not found';
  end if;

  if p_location_position_id is not null then
    select pos.id, pos.location_id, pos.site_id
      into v_position
    from public.inventory_location_positions pos
    where pos.id = p_location_position_id
      and pos.location_id = p_location_id
      and coalesce(pos.is_active, true) = true;

    if not found then
      raise exception 'active internal position not found for LOC';
    end if;
  end if;

  select
    profile.id,
    profile.product_id,
    profile.is_active,
    profile.qty_in_input_unit,
    profile.qty_in_stock_unit
    into v_profile
  from public.product_uom_profiles profile
  where profile.id = p_uom_profile_id;

  if not found or v_profile.product_id <> p_product_id then
    raise exception 'uom profile does not belong to product';
  end if;

  if coalesce(v_profile.is_active, false) <> true then
    raise exception 'uom profile is inactive';
  end if;

  if coalesce(v_profile.qty_in_input_unit, 0) <= 0 or coalesce(v_profile.qty_in_stock_unit, 0) <= 0 then
    raise exception 'uom profile conversion must be positive';
  end if;

  v_factor := v_profile.qty_in_stock_unit / v_profile.qty_in_input_unit;

  if p_presentation_qty > 0 and abs(coalesce(p_base_qty, 0) - (p_presentation_qty * v_factor)) > 0.000001 then
    raise exception 'base quantity does not match presentation conversion';
  end if;

  return query select v_location.site_id, v_factor;
end;
$$;


ALTER FUNCTION "public"."assert_inventory_uom_profile_stock_input"("p_location_id" "uuid", "p_location_position_id" "uuid", "p_product_id" "uuid", "p_uom_profile_id" "uuid", "p_presentation_qty" numeric, "p_base_qty" numeric) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."assign_inventory_stock_to_location"("p_site_id" "uuid", "p_product_id" "uuid", "p_location_id" "uuid", "p_quantity" numeric, "p_created_by" "uuid" DEFAULT "auth"."uid"(), "p_note" "text" DEFAULT NULL::"text") RETURNS "jsonb"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pg_temp'
    AS $$
declare
  v_location record;
  v_product record;
  v_site_qty numeric := 0;
  v_assigned_qty numeric := 0;
  v_available_qty numeric := 0;
  v_stock_unit_code text;
begin
  if p_site_id is null or p_product_id is null or p_location_id is null then
    raise exception 'site, product and location are required';
  end if;

  if coalesce(p_quantity, 0) <= 0 then
    raise exception 'quantity must be greater than zero';
  end if;

  if not public.has_permission('nexo.inventory.stock', p_site_id) then
    raise exception 'permission denied';
  end if;

  select loc.id, loc.code, loc.site_id
    into v_location
  from public.inventory_locations loc
  where loc.id = p_location_id
    and loc.site_id = p_site_id
    and coalesce(loc.is_active, true) = true
  for update;

  if not found then
    raise exception 'active LOC not found for site';
  end if;

  select p.id, p.name, p.unit, p.stock_unit_code
    into v_product
  from public.products p
  where p.id = p_product_id;

  if not found then
    raise exception 'product not found';
  end if;

  select coalesce(s.current_qty, 0)
    into v_site_qty
  from public.inventory_stock_by_site s
  where s.site_id = p_site_id
    and s.product_id = p_product_id
  for update;

  v_site_qty := coalesce(v_site_qty, 0);

  select coalesce(sum(coalesce(s.current_qty, 0)), 0)
    into v_assigned_qty
  from public.inventory_stock_by_location s
  join public.inventory_locations loc on loc.id = s.location_id
  where loc.site_id = p_site_id
    and coalesce(loc.is_active, true) = true
    and s.product_id = p_product_id;

  v_available_qty := greatest(0, v_site_qty - coalesce(v_assigned_qty, 0));

  if p_quantity > v_available_qty + 0.000001 then
    raise exception 'only % is available without LOC', v_available_qty;
  end if;

  v_stock_unit_code := coalesce(nullif(v_product.stock_unit_code, ''), nullif(v_product.unit, ''), 'un');

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
    p_site_id,
    p_product_id,
    'stock_assign_location',
    p_quantity,
    p_quantity,
    v_stock_unit_code,
    1,
    v_stock_unit_code,
    coalesce(
      nullif(trim(p_note), ''),
      format('Asignacion de stock sin area a %s: %s', v_location.code, v_product.name)
    ),
    p_created_by
  );

  insert into public.inventory_stock_by_location (location_id, product_id, current_qty, updated_at)
  values (p_location_id, p_product_id, p_quantity, now())
  on conflict (location_id, product_id) do update
    set current_qty = public.inventory_stock_by_location.current_qty + excluded.current_qty,
        updated_at = now();

  return jsonb_build_object(
    'siteId', p_site_id,
    'productId', p_product_id,
    'locationId', p_location_id,
    'assignedQty', p_quantity,
    'availableBefore', v_available_qty,
    'availableAfter', greatest(0, v_available_qty - p_quantity)
  );
end;
$$;


ALTER FUNCTION "public"."assign_inventory_stock_to_location"("p_site_id" "uuid", "p_product_id" "uuid", "p_location_id" "uuid", "p_quantity" numeric, "p_created_by" "uuid", "p_note" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."assign_inventory_stock_to_position"("p_location_id" "uuid", "p_product_id" "uuid", "p_position_id" "uuid", "p_quantity" numeric, "p_created_by" "uuid" DEFAULT "auth"."uid"(), "p_note" "text" DEFAULT NULL::"text") RETURNS "jsonb"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pg_temp'
    AS $$
declare
  v_location record;
  v_position record;
  v_product record;
  v_location_qty numeric := 0;
  v_positioned_qty numeric := 0;
  v_available_qty numeric := 0;
  v_stock_unit_code text;
begin
  if p_location_id is null or p_product_id is null or p_position_id is null then
    raise exception 'location, product and position are required';
  end if;

  if coalesce(p_quantity, 0) <= 0 then
    raise exception 'quantity must be greater than zero';
  end if;

  select loc.id, loc.site_id, loc.code
    into v_location
  from public.inventory_locations loc
  where loc.id = p_location_id
    and coalesce(loc.is_active, true) = true;

  if not found then
    raise exception 'active LOC not found';
  end if;

  if not public.has_permission('nexo.inventory.stock', v_location.site_id) then
    raise exception 'permission denied';
  end if;

  select pos.id, pos.location_id, pos.site_id, pos.code, pos.name
    into v_position
  from public.inventory_location_positions pos
  where pos.id = p_position_id
    and pos.location_id = p_location_id
    and coalesce(pos.is_active, true) = true;

  if not found then
    raise exception 'active internal position not found for LOC';
  end if;

  perform pg_advisory_xact_lock(hashtextextended(p_location_id::text || ':' || p_product_id::text, 0));

  select p.id, p.name, p.unit, p.stock_unit_code
    into v_product
  from public.products p
  where p.id = p_product_id;

  if not found then
    raise exception 'product not found';
  end if;

  select coalesce(s.current_qty, 0)
    into v_location_qty
  from public.inventory_stock_by_location s
  where s.location_id = p_location_id
    and s.product_id = p_product_id
  for update;

  v_location_qty := coalesce(v_location_qty, 0);

  select coalesce(sum(coalesce(sp.current_qty, 0)), 0)
    into v_positioned_qty
  from public.inventory_stock_by_position sp
  join public.inventory_location_positions pos on pos.id = sp.position_id
  where pos.location_id = p_location_id
    and sp.product_id = p_product_id;

  v_available_qty := greatest(0, v_location_qty - coalesce(v_positioned_qty, 0));

  if p_quantity > v_available_qty + 0.000001 then
    raise exception 'only % is available without internal position', v_available_qty;
  end if;

  v_stock_unit_code := coalesce(nullif(v_product.stock_unit_code, ''), nullif(v_product.unit, ''), 'un');

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
    v_location.site_id,
    p_product_id,
    'stock_assign_position',
    p_quantity,
    p_quantity,
    v_stock_unit_code,
    1,
    v_stock_unit_code,
    coalesce(
      nullif(trim(p_note), ''),
      format('Asignacion interna %s > %s: %s', v_location.code, v_position.name, v_product.name)
    ),
    p_created_by
  );

  insert into public.inventory_stock_by_position (position_id, product_id, current_qty, updated_at)
  values (p_position_id, p_product_id, p_quantity, now())
  on conflict (position_id, product_id) do update
    set current_qty = public.inventory_stock_by_position.current_qty + excluded.current_qty,
        updated_at = now();

  return jsonb_build_object(
    'locationId', p_location_id,
    'positionId', p_position_id,
    'productId', p_product_id,
    'assignedQty', p_quantity,
    'availableBefore', v_available_qty,
    'availableAfter', greatest(0, v_available_qty - p_quantity)
  );
end;
$$;


ALTER FUNCTION "public"."assign_inventory_stock_to_position"("p_location_id" "uuid", "p_product_id" "uuid", "p_position_id" "uuid", "p_quantity" numeric, "p_created_by" "uuid", "p_note" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."award_loyalty_points_external"("p_user_id" "uuid", "p_site_id" "uuid", "p_amount_cop" numeric, "p_external_ref" "text", "p_description" "text" DEFAULT NULL::"text", "p_metadata" "jsonb" DEFAULT '{}'::"jsonb") RETURNS "jsonb"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare
  v_points integer;
  v_ref text;
  v_sale_id uuid;
  v_grant_result jsonb;
  v_transaction_id uuid;
  v_new_balance integer;
begin
  if not public.is_active_staff() then
    return jsonb_build_object('success', false, 'error', 'No autorizado (staff requerido)');
  end if;

  if p_user_id is null then
    return jsonb_build_object('success', false, 'error', 'user_id es requerido');
  end if;

  if p_site_id is null then
    return jsonb_build_object('success', false, 'error', 'site_id es requerido');
  end if;

  if not public.has_permission('pulso.pos.main', p_site_id, null) then
    return jsonb_build_object('success', false, 'error', 'No autorizado para operar en esta sede');
  end if;

  if p_amount_cop is null or p_amount_cop <= 0 then
    return jsonb_build_object('success', false, 'error', 'amount_cop debe ser mayor a 0');
  end if;

  v_ref := btrim(coalesce(p_external_ref, ''));
  if v_ref = '' then
    return jsonb_build_object('success', false, 'error', 'external_ref es requerido');
  end if;

  v_points := floor(p_amount_cop / 1000);
  if v_points <= 0 then
    return jsonb_build_object('success', false, 'error', 'El monto no genera puntos');
  end if;

  begin
    insert into public.loyalty_external_sales (
      site_id,
      user_id,
      amount_cop,
      points_awarded,
      external_ref,
      source_app,
      awarded_by,
      metadata
    ) values (
      p_site_id,
      p_user_id,
      p_amount_cop,
      v_points,
      v_ref,
      'pulso',
      auth.uid(),
      coalesce(p_metadata, '{}'::jsonb) || jsonb_build_object('external_ref', v_ref, 'site_id', p_site_id)
    )
    returning id into v_sale_id;
  exception
    when unique_violation then
      return jsonb_build_object(
        'success', false,
        'duplicate', true,
        'error', 'Referencia externa ya registrada en esta sede'
      );
  end;

  v_grant_result := public.grant_loyalty_points(
    p_user_id,
    v_points,
    coalesce(p_description, format('Compra externa (%s)', v_ref)),
    coalesce(p_metadata, '{}'::jsonb)
      || jsonb_build_object(
        'source_app', 'pulso',
        'flow', 'external_pos',
        'site_id', p_site_id,
        'external_ref', v_ref,
        'external_sale_id', v_sale_id
      )
  );

  if coalesce((v_grant_result->>'success')::boolean, false) is not true then
    raise exception '%', coalesce(v_grant_result->>'error', 'Error otorgando puntos');
  end if;

  v_transaction_id := nullif(v_grant_result->>'transaction_id', '')::uuid;
  v_new_balance := nullif(v_grant_result->>'new_balance', '')::integer;

  update public.loyalty_external_sales
  set loyalty_transaction_id = v_transaction_id
  where id = v_sale_id;

  return jsonb_build_object(
    'success', true,
    'duplicate', false,
    'points_awarded', v_points,
    'new_balance', v_new_balance,
    'transaction_id', v_transaction_id,
    'external_sale_id', v_sale_id
  );
exception
  when others then
    return jsonb_build_object('success', false, 'error', sqlerrm);
end;
$$;


ALTER FUNCTION "public"."award_loyalty_points_external"("p_user_id" "uuid", "p_site_id" "uuid", "p_amount_cop" numeric, "p_external_ref" "text", "p_description" "text", "p_metadata" "jsonb") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."can_access_area"("p_area_id" "uuid") RETURNS boolean
    LANGUAGE "sql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    SET "row_security" TO 'off'
    AS $$
  select p_area_id is null
    or public.is_owner()
    or public.is_global_manager()
    or exists (
      select 1
      from public.employee_areas ea
      join public.areas a on a.id = ea.area_id
      where ea.employee_id = auth.uid()
        and ea.area_id = p_area_id
        and coalesce(ea.is_active, true) = true
        and a.site_id = public.current_employee_selected_site_id()
    )
    or exists (
      select 1
      from public.employees e
      where e.id = auth.uid()
        and e.area_id = p_area_id
    );
$$;


ALTER FUNCTION "public"."can_access_area"("p_area_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."can_access_recipe_scope"("p_site_id" "uuid", "p_area_id" "uuid") RETURNS boolean
    LANGUAGE "sql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
  select
    public.is_owner()
    or public.is_global_manager()
    or (
      public.current_employee_role() = any (array['gerente'::text, 'bodeguero'::text])
      and p_site_id is not null
      and public.can_access_site(p_site_id)
    )
    or (
      public.is_employee()
      and p_site_id is not null
      and p_area_id is not null
      and public.can_access_site(p_site_id)
      and public.can_access_area(p_area_id)
    );
$$;


ALTER FUNCTION "public"."can_access_recipe_scope"("p_site_id" "uuid", "p_area_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."can_access_site"("p_site_id" "uuid") RETURNS boolean
    LANGUAGE "sql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    SET "row_security" TO 'off'
    AS $$
  select
    case
      when p_site_id is null then false
      when is_owner() then true
      when is_global_manager() then true
      when exists (
        select 1
        from public.employee_sites es
        where es.employee_id = auth.uid()
          and es.site_id = p_site_id
          and es.is_active = true
      ) then true
      when exists (
        select 1
        from public.employees e
        where e.id = auth.uid()
          and e.site_id = p_site_id
          and (e.is_active is true or e.is_active is null)
      ) then true
      else false
    end;
$$;


ALTER FUNCTION "public"."can_access_site"("p_site_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."check_nexo_permissions"("p_employee_id" "uuid", "p_site_id" "uuid") RETURNS TABLE("permission_code" "text", "allowed" boolean)
    LANGUAGE "sql" STABLE
    AS $$
  with perms as (
    select ap.code as permission_code
    from public.app_permissions ap
    join public.apps a on a.id = ap.app_id
    where a.code = 'nexo'
  ),
  ctx as (
    select p_employee_id as employee_id, p_site_id as site_id
  )
  select p.permission_code,
         public.has_permission('nexo.' || p.permission_code, (select site_id from ctx), null) as allowed
  from perms p
  order by p.permission_code;
$$;


ALTER FUNCTION "public"."check_nexo_permissions"("p_employee_id" "uuid", "p_site_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."close_inventory_count_session"("p_session_id" "uuid", "p_closed_by" "uuid") RETURNS "jsonb"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pg_temp'
    AS $$
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

  create temporary table tmp_count_current (
    product_id uuid primary key,
    current_qty numeric not null
  ) on commit drop;

  if coalesce(v_session.scope_type, '') = 'loc' and v_session.scope_location_id is not null then
    insert into tmp_count_current (product_id, current_qty)
    select l.product_id, coalesce(s.current_qty, 0)
    from public.inventory_count_lines l
    left join public.inventory_stock_by_location s
      on s.location_id = v_session.scope_location_id
     and s.product_id = l.product_id
    where l.session_id = p_session_id;
  elsif coalesce(v_session.scope_type, '') = 'zone' and coalesce(v_session.scope_zone, '') <> '' then
    insert into tmp_count_current (product_id, current_qty)
    select
      l.product_id,
      coalesce(sum(s.current_qty), 0)
    from public.inventory_count_lines l
    left join public.inventory_locations il
      on il.site_id = v_session.site_id
     and il.zone = v_session.scope_zone
     and il.is_active is true
    left join public.inventory_stock_by_location s
      on s.location_id = il.id
     and s.product_id = l.product_id
    where l.session_id = p_session_id
    group by l.product_id;
  else
    insert into tmp_count_current (product_id, current_qty)
    select l.product_id, coalesce(s.current_qty, 0)
    from public.inventory_count_lines l
    left join public.inventory_stock_by_site s
      on s.site_id = v_session.site_id
     and s.product_id = l.product_id
    where l.session_id = p_session_id;
  end if;

  update public.inventory_count_lines l
  set
    current_qty_at_close = coalesce(c.current_qty, 0),
    quantity_delta = coalesce(l.quantity_counted, 0) - coalesce(c.current_qty, 0)
  from tmp_count_current c
  where l.session_id = p_session_id
    and l.product_id = c.product_id;

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


ALTER FUNCTION "public"."close_inventory_count_session"("p_session_id" "uuid", "p_closed_by" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."close_open_attendance_day_end"("p_timezone" "text" DEFAULT 'America/Bogota'::"text") RETURNS integer
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare
  v_day_end timestamptz;
  v_closed int := 0;
begin
  v_day_end := (date_trunc('day', now() at time zone p_timezone) + interval '1 day' - interval '1 second') at time zone p_timezone;

  with last_logs as (
    select distinct on (employee_id)
      employee_id,
      site_id,
      action,
      occurred_at
    from public.attendance_logs
    where occurred_at <= v_day_end
    order by employee_id, occurred_at desc, created_at desc
  ),
  inserted as (
    insert into public.attendance_logs (
      employee_id,
      site_id,
      action,
      source,
      occurred_at,
      latitude,
      longitude,
      accuracy_meters,
      device_info,
      notes
    )
    select
      l.employee_id,
      l.site_id,
      'check_out',
      'system',
      v_day_end,
      s.latitude,
      s.longitude,
      0,
      jsonb_build_object('auto_close', true, 'reason', 'day_end'),
      'Cierre automatico: turno abierto cerrado por el sistema a las 23:59'
    from last_logs l
    join public.sites s on s.id = l.site_id
    where l.action = 'check_in'
      and not exists (
        select 1
        from public.attendance_logs al
        where al.employee_id = l.employee_id
          and al.action = 'check_out'
          and al.occurred_at > l.occurred_at
          and al.occurred_at <= v_day_end
      )
    returning 1
  )
  select count(*) into v_closed from inserted;

  return v_closed;
end;
$$;


ALTER FUNCTION "public"."close_open_attendance_day_end"("p_timezone" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."compute_restock_item_status"("p_requested_qty" numeric, "p_prepared_qty" numeric, "p_shipped_qty" numeric, "p_received_qty" numeric, "p_shortage_qty" numeric) RETURNS "text"
    LANGUAGE "plpgsql" IMMUTABLE
    AS $$
declare
  v_requested_qty numeric := round(coalesce(p_requested_qty, 0)::numeric, 2);
  v_prepared_qty numeric := round(coalesce(p_prepared_qty, 0)::numeric, 2);
  v_shipped_qty numeric := round(coalesce(p_shipped_qty, 0)::numeric, 2);
  v_received_qty numeric := round(coalesce(p_received_qty, 0)::numeric, 2);
  v_accounted_qty numeric := round(coalesce(p_received_qty, 0)::numeric + coalesce(p_shortage_qty, 0)::numeric, 2);
begin
  if v_shipped_qty > 0 then
    if v_received_qty >= v_shipped_qty then
      return 'received';
    end if;

    if v_accounted_qty > 0 then
      return 'partial';
    end if;

    return 'in_transit';
  end if;

  if v_prepared_qty > 0 then
    return 'preparing';
  end if;

  if v_requested_qty > 0 then
    return 'pending';
  end if;

  return 'pending';
end;
$$;


ALTER FUNCTION "public"."compute_restock_item_status"("p_requested_qty" numeric, "p_prepared_qty" numeric, "p_shipped_qty" numeric, "p_received_qty" numeric, "p_shortage_qty" numeric) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."consume_inventory_stock_by_uom_profile"("p_location_id" "uuid", "p_product_id" "uuid", "p_uom_profile_id" "uuid", "p_presentation_qty" numeric, "p_base_qty" numeric, "p_location_position_id" "uuid" DEFAULT NULL::"uuid") RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pg_temp'
    AS $$
declare
  v_site_id uuid;
  v_stock record;
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

  if coalesce(p_presentation_qty, 0) <= 0 or coalesce(p_base_qty, 0) <= 0 then
    raise exception 'presentation and base quantities must be greater than zero';
  end if;

  if not (
    public.has_permission('nexo.inventory.stock', v_site_id)
    or public.has_permission('nexo.inventory.transfers', v_site_id)
    or public.has_permission('nexo.inventory.withdraw', v_site_id)
    or public.has_permission('nexo.inventory.remissions.prepare', v_site_id)
  ) then
    raise exception 'permission denied';
  end if;

  perform pg_advisory_xact_lock(hashtextextended(p_location_id::text || ':' || p_product_id::text || ':' || p_uom_profile_id::text || ':' || coalesce(p_location_position_id::text, ''), 0));

  select stock.id, stock.presentation_qty, stock.base_qty
    into v_stock
  from public.inventory_stock_by_uom_profile stock
  where stock.location_id = p_location_id
    and stock.product_id = p_product_id
    and stock.uom_profile_id = p_uom_profile_id
    and (
      (p_location_position_id is null and stock.location_position_id is null)
      or stock.location_position_id = p_location_position_id
    )
  for update;

  if not found or coalesce(v_stock.presentation_qty, 0) + 0.000001 < p_presentation_qty then
    raise exception 'insufficient physical stock for selected presentation';
  end if;

  if coalesce(v_stock.base_qty, 0) + 0.000001 < p_base_qty then
    raise exception 'insufficient base stock for selected presentation';
  end if;

  update public.inventory_stock_by_uom_profile
  set presentation_qty = presentation_qty - p_presentation_qty,
      base_qty = base_qty - p_base_qty,
      updated_at = now()
  where id = v_stock.id;
end;
$$;


ALTER FUNCTION "public"."consume_inventory_stock_by_uom_profile"("p_location_id" "uuid", "p_product_id" "uuid", "p_uom_profile_id" "uuid", "p_presentation_qty" numeric, "p_base_qty" numeric, "p_location_position_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."consume_inventory_stock_from_positions"("p_location_id" "uuid", "p_product_id" "uuid", "p_quantity" numeric, "p_created_by" "uuid" DEFAULT "auth"."uid"(), "p_note" "text" DEFAULT NULL::"text") RETURNS "jsonb"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pg_temp'
    AS $$
declare
  v_location record;
  v_product record;
  v_remaining numeric := coalesce(p_quantity, 0);
  v_consumed_total numeric := 0;
  v_take numeric := 0;
  v_stock_unit_code text;
  v_position_count integer := 0;
  v_row record;
begin
  if p_location_id is null or p_product_id is null then
    raise exception 'location and product are required';
  end if;

  if coalesce(p_quantity, 0) <= 0 then
    return jsonb_build_object(
      'locationId', p_location_id,
      'productId', p_product_id,
      'requestedQty', coalesce(p_quantity, 0),
      'consumedQty', 0,
      'unpositionedQty', 0,
      'positionsTouched', 0
    );
  end if;

  select loc.id, loc.site_id, loc.code
    into v_location
  from public.inventory_locations loc
  where loc.id = p_location_id
    and coalesce(loc.is_active, true) = true;

  if not found then
    raise exception 'active LOC not found';
  end if;

  if not (
    public.has_permission('nexo.inventory.withdraw', v_location.site_id)
    or public.has_permission('nexo.inventory.stock', v_location.site_id)
  ) then
    raise exception 'permission denied';
  end if;

  select p.id, p.name, p.unit, p.stock_unit_code
    into v_product
  from public.products p
  where p.id = p_product_id;

  if not found then
    raise exception 'product not found';
  end if;

  perform pg_advisory_xact_lock(hashtextextended(p_location_id::text || ':' || p_product_id::text, 0));

  for v_row in
    select sp.position_id, sp.current_qty, pos.name, pos.code, pos.sort_order
    from public.inventory_stock_by_position sp
    join public.inventory_location_positions pos on pos.id = sp.position_id
    where pos.location_id = p_location_id
      and sp.product_id = p_product_id
      and sp.current_qty > 0
      and coalesce(pos.is_active, true) = true
    order by sp.current_qty asc, coalesce(pos.sort_order, 0) asc, pos.code asc, sp.position_id asc
    for update of sp
  loop
    exit when v_remaining <= 0;

    v_take := least(v_remaining, coalesce(v_row.current_qty, 0));
    if v_take <= 0 then
      continue;
    end if;

    update public.inventory_stock_by_position
    set current_qty = current_qty - v_take,
        updated_at = now()
    where position_id = v_row.position_id
      and product_id = p_product_id;

    v_remaining := v_remaining - v_take;
    v_consumed_total := v_consumed_total + v_take;
    v_position_count := v_position_count + 1;
  end loop;

  if v_consumed_total > 0 then
    v_stock_unit_code := coalesce(nullif(v_product.stock_unit_code, ''), nullif(v_product.unit, ''), 'un');

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
      v_location.site_id,
      p_product_id,
      'stock_consume_position',
      -v_consumed_total,
      v_consumed_total,
      v_stock_unit_code,
      1,
      v_stock_unit_code,
      coalesce(
        nullif(trim(p_note), ''),
        format(
          'Consumo interno %s: menor stock primero, %s posiciones',
          coalesce(v_location.code, p_location_id::text),
          v_position_count
        )
      ),
      p_created_by
    );
  end if;

  return jsonb_build_object(
    'locationId', p_location_id,
    'productId', p_product_id,
    'requestedQty', p_quantity,
    'consumedQty', v_consumed_total,
    'unpositionedQty', greatest(0, v_remaining),
    'positionsTouched', v_position_count,
    'rule', 'smallest_position_stock_first'
  );
end;
$$;


ALTER FUNCTION "public"."consume_inventory_stock_from_positions"("p_location_id" "uuid", "p_product_id" "uuid", "p_quantity" numeric, "p_created_by" "uuid", "p_note" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."create_inventory_count_session_with_lines"("p_site_id" "uuid", "p_scope_type" "text", "p_scope_zone" "text", "p_scope_location_id" "uuid", "p_name" "text", "p_created_by" "uuid", "p_lines" "jsonb") RETURNS "jsonb"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pg_temp'
    AS $$
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
    ) then
      raise exception 'LOC no pertenece a la sede del conteo';
    end if;
  end if;

  if v_scope_type = 'zone' and v_scope_zone is null then
    raise exception 'scope_zone requerido para scope_type=zone';
  end if;

  create temporary table tmp_count_lines_input (
    product_id uuid not null,
    quantity numeric not null
  ) on commit drop;

  insert into tmp_count_lines_input (product_id, quantity)
  select
    (entry ->> 'product_id')::uuid,
    (entry ->> 'quantity')::numeric
  from jsonb_array_elements(coalesce(p_lines, '[]'::jsonb)) entry
  where coalesce((entry ->> 'quantity')::numeric, 0) > 0;

  select count(*) into v_count from tmp_count_lines_input;
  if v_count = 0 then
    raise exception 'Al menos una linea con cantidad > 0';
  end if;

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

  if v_scope_type = 'loc' then
    insert into public.inventory_count_lines (
      session_id,
      product_id,
      quantity_counted,
      current_qty_at_open
    )
    select
      v_session_id,
      li.product_id,
      li.quantity,
      coalesce(loc.current_qty, 0)
    from tmp_count_lines_input li
    left join public.inventory_stock_by_location loc
      on loc.location_id = p_scope_location_id
     and loc.product_id = li.product_id;
  elsif v_scope_type = 'zone' then
    insert into public.inventory_count_lines (
      session_id,
      product_id,
      quantity_counted,
      current_qty_at_open
    )
    select
      v_session_id,
      li.product_id,
      li.quantity,
      coalesce(sum(loc.current_qty), 0)
    from tmp_count_lines_input li
    left join public.inventory_locations il
      on il.site_id = p_site_id
     and il.zone = v_scope_zone
     and il.is_active is true
    left join public.inventory_stock_by_location loc
      on loc.location_id = il.id
     and loc.product_id = li.product_id
    group by li.product_id, li.quantity;
  else
    insert into public.inventory_count_lines (
      session_id,
      product_id,
      quantity_counted,
      current_qty_at_open
    )
    select
      v_session_id,
      li.product_id,
      li.quantity,
      coalesce(site.current_qty, 0)
    from tmp_count_lines_input li
    left join public.inventory_stock_by_site site
      on site.site_id = p_site_id
     and site.product_id = li.product_id;
  end if;

  return jsonb_build_object('countSessionId', v_session_id, 'count', v_count);
end;
$$;


ALTER FUNCTION "public"."create_inventory_count_session_with_lines"("p_site_id" "uuid", "p_scope_type" "text", "p_scope_zone" "text", "p_scope_location_id" "uuid", "p_name" "text", "p_created_by" "uuid", "p_lines" "jsonb") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."create_order_checkout_draft"("p_site_id" "uuid", "p_satellite_name" "text", "p_fulfillment_type" "text", "p_contact_name" "text", "p_contact_phone" "text", "p_address_line" "text", "p_address_reference" "text", "p_notes" "text", "p_items" "jsonb", "p_delivery_fee_amount" numeric DEFAULT 0, "p_source" "text" DEFAULT 'vento_pass'::"text", "p_delivery_distance_km" integer DEFAULT NULL::integer, "p_delivery_quote_id" "uuid" DEFAULT NULL::"uuid") RETURNS "jsonb"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'auth', 'pass'
    AS $$
declare
  v_uid uuid := auth.uid();
  v_order_id uuid;
  v_tx_id uuid;
  v_item jsonb;
  v_product_id uuid;
  v_quantity numeric;
  v_unit_price numeric;
  v_subtotal numeric := 0;
  v_delivery numeric := 0;
  v_total numeric := 0;
  v_fulfillment text := lower(trim(coalesce(p_fulfillment_type, 'delivery')));
  v_order_type text := 'takeaway';
  v_delivery_address jsonb := '{}'::jsonb;
  v_delivery_zone text := null;
  v_quote pass.delivery_quotes%rowtype;
  v_idempotency_key text := gen_random_uuid()::text;
  v_payment_status text := 'pending_payment';
  v_payment_provider text := null;
  v_checkout_expires_at timestamptz := null;
begin
  if v_uid is null then
    raise exception 'authentication_required';
  end if;

  if p_site_id is null then
    raise exception 'site_required';
  end if;

  if jsonb_typeof(p_items) <> 'array' or jsonb_array_length(p_items) = 0 then
    raise exception 'items_required';
  end if;

  if v_fulfillment not in ('delivery', 'pickup', 'on_premise') then
    raise exception 'invalid_fulfillment_type';
  end if;

  if v_fulfillment = 'on_premise' then
    v_order_type := 'dine_in';
  end if;

  if v_fulfillment = 'delivery' then
    v_payment_status := 'pending_payment';
    v_payment_provider := 'wompi';
    v_checkout_expires_at := now() + interval '20 minutes';

    if p_delivery_quote_id is null then
      raise exception 'delivery_quote_required';
    end if;

    select *
    into v_quote
    from pass.delivery_quotes
    where id = p_delivery_quote_id
      and user_id = v_uid
      and site_id = p_site_id
      and used_at is null
      and expires_at > now()
    for update;

    if v_quote.id is null then
      raise exception 'delivery_quote_invalid_or_expired';
    end if;

    v_delivery := v_quote.customer_fee_amount;
    v_delivery_zone := v_quote.billed_distance_km::text || ' km';
    v_delivery_address := jsonb_build_object(
      'line1', nullif(trim(coalesce(p_address_line, v_quote.destination_address, '')), ''),
      'reference', nullif(trim(coalesce(p_address_reference, '')), ''),
      'label', nullif(trim(coalesce(v_quote.destination_label, '')), ''),
      'latitude', v_quote.destination_latitude,
      'longitude', v_quote.destination_longitude,
      'distance_meters', v_quote.distance_meters,
      'distance_km', v_quote.distance_km,
      'billed_distance_km', v_quote.billed_distance_km,
      'duration_seconds', v_quote.duration_seconds,
      'delivery_quote_id', v_quote.id
    );

    if coalesce(v_delivery_address ->> 'line1', '') = '' then
      raise exception 'delivery_address_required';
    end if;
  else
    v_payment_status := 'not_required';
    v_payment_provider := null;
    v_checkout_expires_at := null;
    v_delivery := 0;
    v_delivery_zone := null;
    v_delivery_address := '{}'::jsonb;
  end if;

  for v_item in select * from jsonb_array_elements(p_items)
  loop
    v_product_id := nullif(v_item ->> 'product_id', '')::uuid;
    v_quantity := greatest(coalesce((v_item ->> 'quantity')::numeric, 0), 0);
    v_unit_price := greatest(coalesce((v_item ->> 'unit_price')::numeric, 0), 0);

    if v_product_id is null then
      raise exception 'item_product_required';
    end if;

    if v_quantity <= 0 then
      raise exception 'invalid_item_quantity';
    end if;

    if v_unit_price < 0 then
      raise exception 'invalid_item_price';
    end if;

    v_subtotal := v_subtotal + (v_quantity * v_unit_price);
  end loop;

  v_total := v_subtotal + v_delivery;

  insert into public.orders (
    client_id,
    order_type,
    source,
    status,
    payment_status,
    total_amount,
    subtotal_amount,
    notes,
    site_id,
    guest_info,
    fulfillment_type,
    contact_phone,
    delivery_address,
    delivery_zone,
    delivery_fee_amount,
    payment_provider,
    checkout_expires_at
  )
  values (
    v_uid,
    v_order_type,
    coalesce(nullif(trim(coalesce(p_source, '')), ''), 'vento_pass'),
    'pending',
    v_payment_status,
    v_total,
    v_subtotal,
    nullif(trim(coalesce(p_notes, '')), ''),
    p_site_id,
    jsonb_build_object(
      'contact_name', nullif(trim(coalesce(p_contact_name, '')), ''),
      'contact_phone', nullif(trim(coalesce(p_contact_phone, '')), ''),
      'fulfillment_type', v_fulfillment,
      'satellite_name', nullif(trim(coalesce(p_satellite_name, '')), '')
    ),
    v_fulfillment,
    nullif(trim(coalesce(p_contact_phone, '')), ''),
    v_delivery_address,
    v_delivery_zone,
    v_delivery,
    v_payment_provider,
    v_checkout_expires_at
  )
  returning id into v_order_id;

  for v_item in select * from jsonb_array_elements(p_items)
  loop
    insert into public.order_items (
      order_id,
      product_id,
      quantity,
      unit_price,
      total_amount,
      notes
    )
    values (
      v_order_id,
      (v_item ->> 'product_id')::uuid,
      (v_item ->> 'quantity')::numeric,
      (v_item ->> 'unit_price')::numeric,
      ((v_item ->> 'quantity')::numeric * (v_item ->> 'unit_price')::numeric),
      nullif(trim(coalesce(v_item ->> 'notes', '')), '')
    );
  end loop;

  if v_quote.id is not null then
    update pass.delivery_quotes
    set used_at = now()
    where id = v_quote.id;
  end if;

  if v_fulfillment = 'delivery' then
    insert into payments.transactions (
      order_id,
      user_id,
      site_id,
      provider,
      idempotency_key,
      amount_minor,
      currency,
      status,
      metadata
    )
    values (
      v_order_id,
      v_uid,
      p_site_id,
      'wompi',
      v_idempotency_key,
      round(v_total * 100)::bigint,
      'COP',
      'pending',
      jsonb_build_object(
        'source', 'create_order_checkout_draft',
        'delivery_quote_id', p_delivery_quote_id,
        'delivery_distance_km', coalesce(v_quote.billed_distance_km, p_delivery_distance_km),
        'fulfillment_type', v_fulfillment
      )
    )
    returning id into v_tx_id;

    update public.orders
    set payment_intent_id = v_tx_id
    where id = v_order_id;
  end if;

  return jsonb_build_object(
    'ok', true,
    'order_id', v_order_id,
    'transaction_id', v_tx_id,
    'idempotency_key', case when v_fulfillment = 'delivery' then v_idempotency_key else null end,
    'amount_minor', round(v_total * 100)::bigint,
    'currency', 'COP',
    'payment_status', v_payment_status,
    'payment_provider', v_payment_provider,
    'checkout_expires_at', v_checkout_expires_at
  );
end;
$$;


ALTER FUNCTION "public"."create_order_checkout_draft"("p_site_id" "uuid", "p_satellite_name" "text", "p_fulfillment_type" "text", "p_contact_name" "text", "p_contact_phone" "text", "p_address_line" "text", "p_address_reference" "text", "p_notes" "text", "p_items" "jsonb", "p_delivery_fee_amount" numeric, "p_source" "text", "p_delivery_distance_km" integer, "p_delivery_quote_id" "uuid") OWNER TO "postgres";


COMMENT ON FUNCTION "public"."create_order_checkout_draft"("p_site_id" "uuid", "p_satellite_name" "text", "p_fulfillment_type" "text", "p_contact_name" "text", "p_contact_phone" "text", "p_address_line" "text", "p_address_reference" "text", "p_notes" "text", "p_items" "jsonb", "p_delivery_fee_amount" numeric, "p_source" "text", "p_delivery_distance_km" integer, "p_delivery_quote_id" "uuid") IS 'Crea orden desde Vento Pass. Domicilio crea intento Wompi pendiente; recoger y en sitio quedan con pago no requerido.';



CREATE OR REPLACE FUNCTION "public"."current_employee_area_id"() RETURNS "uuid"
    LANGUAGE "sql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    SET "row_security" TO 'off'
    AS $$
  select public.current_employee_selected_area_id();
$$;


ALTER FUNCTION "public"."current_employee_area_id"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."current_employee_primary_site_id"() RETURNS "uuid"
    LANGUAGE "sql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    SET "row_security" TO 'off'
    AS $$
  select coalesce(
    (
      select es.site_id
      from public.employee_sites es
      where es.employee_id = auth.uid()
        and es.is_primary = true
      limit 1
    ),
    (
      select e.site_id
      from public.employees e
      where e.id = auth.uid()
    )
  );
$$;


ALTER FUNCTION "public"."current_employee_primary_site_id"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."current_employee_role"() RETURNS "text"
    LANGUAGE "sql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    SET "row_security" TO 'off'
    AS $$
  select e.role
  from public.employees e
  where e.id = auth.uid();
$$;


ALTER FUNCTION "public"."current_employee_role"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."current_employee_selected_area_id"() RETURNS "uuid"
    LANGUAGE "sql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    SET "row_security" TO 'off'
    AS $$
  select coalesce(
    (
      select s.selected_area_id
      from public.employee_settings s
      where s.employee_id = auth.uid()
    ),
    (
      select ea.area_id
      from public.employee_areas ea
      where ea.employee_id = auth.uid()
        and ea.is_primary = true
      limit 1
    ),
    (
      select e.area_id
      from public.employees e
      where e.id = auth.uid()
    )
  );
$$;


ALTER FUNCTION "public"."current_employee_selected_area_id"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."current_employee_selected_site_id"() RETURNS "uuid"
    LANGUAGE "sql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    SET "row_security" TO 'off'
    AS $$
  select coalesce(
    (
      select s.selected_site_id
      from public.employee_settings s
      where s.employee_id = auth.uid()
    ),
    public.current_employee_primary_site_id()
  );
$$;


ALTER FUNCTION "public"."current_employee_selected_site_id"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."current_employee_site_id"() RETURNS "uuid"
    LANGUAGE "sql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    SET "row_security" TO 'off'
    AS $$
  select public.current_employee_selected_site_id();
$$;


ALTER FUNCTION "public"."current_employee_site_id"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."device_info_has_blocking_warnings"("di" "jsonb") RETURNS boolean
    LANGUAGE "sql" IMMUTABLE
    AS $$
  select exists (
    select 1
    from jsonb_array_elements_text(
      case
        when di is null then '[]'::jsonb
        when jsonb_typeof(di->'validationWarnings') = 'array' then di->'validationWarnings'
        else '[]'::jsonb
      end
    ) as w(txt)
    where lower(w.txt) like any (
      array[
        '%mock%',
        '%simulada%',
        '%spoof%',
        '%punto nulo%',
        '%patron sospechoso%',
        '%digitos repetidos%'
      ]
    )
  );
$$;


ALTER FUNCTION "public"."device_info_has_blocking_warnings"("di" "jsonb") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."employee_wallet_eligibility"("p_employee_id" "uuid" DEFAULT NULL::"uuid") RETURNS TABLE("employee_id" "uuid", "contract_active" boolean, "contract_document_id" "uuid", "contract_start_date" "date", "contract_end_date" "date", "documents_complete" boolean, "missing_required_document_type_ids" "uuid"[], "wallet_eligible" boolean, "wallet_status" "text")
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare
  v_today date := current_date;
  v_emp_id uuid;
  v_contract_doc_id uuid;
  v_contract_start date;
  v_contract_end date;
  v_contract_ok boolean := false;
  v_required_ids uuid[];
  v_missing_ids uuid[] := array[]::uuid[];
  v_docs_ok boolean := true;
  v_emp_active boolean;
  v_card_status text;
  v_rule record;
  v_has_doc boolean;
begin
  for v_emp_id in
    select e.id
    from public.employees e
    where p_employee_id is null or e.id = p_employee_id
  loop
    v_contract_doc_id := null;
    v_contract_start := null;
    v_contract_end := null;
    v_contract_ok := false;
    v_missing_ids := array[]::uuid[];
    v_docs_ok := true;

    select d.id, (d.issue_date)::date, (d.expiry_date)::date
    into v_contract_doc_id, v_contract_start, v_contract_end
    from public.documents d
    join public.document_types dt on dt.id = d.document_type_id and dt.system_key = 'employment_contract'
    where d.target_employee_id = v_emp_id
      and d.scope = 'employee'
      and d.status <> 'rejected'
      and d.issue_date is not null
      and ((d.expiry_date)::date is null or (d.expiry_date)::date >= v_today)
      and (d.issue_date)::date <= v_today
    order by (d.expiry_date)::date desc nulls first
    limit 1;

    v_contract_ok := v_contract_doc_id is not null;

    select array_agg(r.document_type_id order by r.display_order, r.document_type_id)
    into v_required_ids
    from public.required_document_rules r
    where r.active = true
      and r.is_required = true
      and (r.site_id is null or r.site_id = (
        select coalesce(es.site_id, e.site_id)
        from public.employees e
        left join public.employee_sites es on es.employee_id = e.id and es.is_primary = true
        where e.id = v_emp_id
        limit 1
      ))
      and (r.role is null or r.role = (select e.role from public.employees e where e.id = v_emp_id limit 1));

    if v_required_ids is not null then
      for v_rule in
        select unnest(v_required_ids) as doc_type_id
      loop
        select exists (
          select 1
          from public.documents d
          where d.target_employee_id = v_emp_id
            and d.document_type_id = v_rule.doc_type_id
            and d.scope = 'employee'
            and d.status <> 'rejected'
        ) into v_has_doc;
        if not v_has_doc then
          v_missing_ids := array_append(v_missing_ids, v_rule.doc_type_id);
          v_docs_ok := false;
        end if;
      end loop;
    end if;

    if v_required_ids is null or array_length(v_required_ids, 1) is null then
      v_docs_ok := true;
    end if;

    select e.is_active from public.employees e where e.id = v_emp_id limit 1 into v_emp_active;

    select coalesce(c.status::text, 'eligible')
    into v_card_status
    from public.employee_wallet_cards c
    where c.employee_id = v_emp_id
    limit 1;

    employee_id := v_emp_id;
    contract_active := v_contract_ok;
    contract_document_id := v_contract_doc_id;
    contract_start_date := v_contract_start;
    contract_end_date := v_contract_end;
    documents_complete := v_docs_ok;
    missing_required_document_type_ids := v_missing_ids;
    wallet_eligible := coalesce(v_emp_active, false) and v_contract_ok and v_docs_ok;
    wallet_status := v_card_status;
    return next;
  end loop;
end;
$$;


ALTER FUNCTION "public"."employee_wallet_eligibility"("p_employee_id" "uuid") OWNER TO "postgres";


COMMENT ON FUNCTION "public"."employee_wallet_eligibility"("p_employee_id" "uuid") IS 'Elegibilidad para carnet laboral: contrato activo, documentos requeridos y estado del carnet.';



CREATE OR REPLACE FUNCTION "public"."employee_wallet_mark_issued"("p_employee_id" "uuid") RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare
  v_eligible boolean;
begin
  if auth.uid() is null or auth.uid() <> p_employee_id then
    return;
  end if;
  select e.wallet_eligible into v_eligible
  from public.employee_wallet_eligibility(p_employee_id) e
  limit 1;
  if not coalesce(v_eligible, false) then
    return;
  end if;
  insert into public.employee_wallet_cards (employee_id, status, serial_number, last_issued_at, updated_at)
  values (p_employee_id, 'issued', 'emp-' || p_employee_id::text, now(), now())
  on conflict (employee_id) do update set
    status = 'issued',
    serial_number = 'emp-' || p_employee_id::text,
    last_issued_at = now(),
    last_revoked_at = null,
    revocation_reason = null,
    updated_at = now();
end;
$$;


ALTER FUNCTION "public"."employee_wallet_mark_issued"("p_employee_id" "uuid") OWNER TO "postgres";


COMMENT ON FUNCTION "public"."employee_wallet_mark_issued"("p_employee_id" "uuid") IS 'Marca el carnet laboral del empleado como emitido (solo el propio usuario, solo si elegible).';



CREATE OR REPLACE FUNCTION "public"."employee_wallet_sync_eligibility"() RETURNS "jsonb"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare
  v_row record;
  v_elig record;
  v_revoked_count int := 0;
  v_checked_count int := 0;
  v_reason text;
  v_revoked_ids uuid[] := array[]::uuid[];
begin
  for v_row in
    select c.id, c.employee_id
    from public.employee_wallet_cards c
    where c.status = 'issued'
  loop
    v_checked_count := v_checked_count + 1;

    select *
    into v_elig
    from public.employee_wallet_eligibility(v_row.employee_id)
    limit 1;

    if v_elig.wallet_eligible then
      null;
    else
      if not v_elig.contract_active then
        v_reason := 'contract_expired';
      elsif not v_elig.documents_complete then
        v_reason := 'documents_incomplete';
      else
        v_reason := 'no_longer_eligible';
      end if;

      update public.employee_wallet_cards
      set
        status = 'revoked',
        last_revoked_at = now(),
        revocation_reason = v_reason,
        updated_at = now()
      where id = v_row.id;

      v_revoked_count := v_revoked_count + 1;
      v_revoked_ids := array_append(v_revoked_ids, v_row.employee_id);
    end if;
  end loop;

  return jsonb_build_object(
    'checked_count', v_checked_count,
    'revoked_count', v_revoked_count,
    'revoked_employee_ids', to_jsonb(v_revoked_ids)
  );
end;
$$;


ALTER FUNCTION "public"."employee_wallet_sync_eligibility"() OWNER TO "postgres";


COMMENT ON FUNCTION "public"."employee_wallet_sync_eligibility"() IS 'Reeval├║a elegibilidad de carnets emitidos y revoca los que ya no cumplan (contrato/documentos). Invocable por cron o Edge Function.';


SET default_tablespace = '';

SET default_table_access_method = "heap";


CREATE TABLE IF NOT EXISTS "public"."attendance_breaks" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "employee_id" "uuid" NOT NULL,
    "site_id" "uuid" NOT NULL,
    "started_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "ended_at" timestamp with time zone,
    "start_source" "text" DEFAULT 'mobile'::"text" NOT NULL,
    "end_source" "text",
    "start_notes" "text",
    "end_notes" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "attendance_breaks_end_source_check" CHECK ((("end_source" IS NULL) OR ("end_source" = ANY (ARRAY['mobile'::"text", 'web'::"text", 'kiosk'::"text", 'system'::"text"])))),
    CONSTRAINT "attendance_breaks_start_source_check" CHECK (("start_source" = ANY (ARRAY['mobile'::"text", 'web'::"text", 'kiosk'::"text", 'system'::"text"]))),
    CONSTRAINT "attendance_breaks_time_check" CHECK ((("ended_at" IS NULL) OR ("ended_at" >= "started_at")))
);


ALTER TABLE "public"."attendance_breaks" OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."end_attendance_break"("p_source" "text" DEFAULT 'mobile'::"text", "p_notes" "text" DEFAULT NULL::"text") RETURNS "public"."attendance_breaks"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare
  v_employee_id uuid;
  v_open_break public.attendance_breaks%rowtype;
  v_result public.attendance_breaks%rowtype;
begin
  v_employee_id := auth.uid();
  if v_employee_id is null then
    raise exception 'No autenticado';
  end if;

  select *
    into v_open_break
  from public.attendance_breaks
  where employee_id = v_employee_id
    and ended_at is null
  order by started_at desc
  limit 1
  for update;

  if not found then
    raise exception 'No hay descanso activo para finalizar';
  end if;

  update public.attendance_breaks
  set
    ended_at = now(),
    end_source = coalesce(p_source, 'mobile'),
    end_notes = p_notes
  where id = v_open_break.id
  returning *
    into v_result;

  return v_result;
end;
$$;


ALTER FUNCTION "public"."end_attendance_break"("p_source" "text", "p_notes" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."enforce_attendance_geofence"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare
  v_site record;
  v_emp record;

  v_requires_geo boolean;
  v_max_acc integer;
  v_radius integer;

  v_distance double precision;
  v_accuracy double precision;
  v_is_assigned boolean;
begin
  if new.source <> 'system' then
    new.occurred_at := now();
  end if;

  select id, site_id, is_active
    into v_emp
  from public.employees
  where id = new.employee_id;

  if not found then
    raise exception 'Empleado no encontrado';
  end if;

  if v_emp.is_active is false then
    raise exception 'Empleado inactivo';
  end if;

  if new.action = 'check_in' then
    v_is_assigned := (v_emp.site_id is not distinct from new.site_id)
      or exists (
        select 1
        from public.employee_sites es
        where es.employee_id = new.employee_id
          and es.site_id = new.site_id
          and es.is_active = true
      );

    if not v_is_assigned then
      raise exception 'No autorizado: check-in solo permitido en tu sede asignada';
    end if;
  end if;

  select id, name, type, is_active, latitude, longitude, checkin_radius_meters
    into v_site
  from public.sites
  where id = new.site_id;

  if not found then
    raise exception 'Sede no encontrada';
  end if;

  if v_site.is_active is false then
    raise exception 'Sede inactiva';
  end if;

  if new.source = 'system' then
    return new;
  end if;

  if v_site.type <> 'vento_group' then
    if v_site.latitude is null or v_site.longitude is null then
      raise exception 'Configuracion invalida: la sede % no tiene coordenadas', v_site.name;
    end if;
    if v_site.checkin_radius_meters is null or v_site.checkin_radius_meters <= 0 then
      raise exception 'Configuracion invalida: la sede % no tiene radio de check-in configurado', v_site.name;
    end if;
    v_requires_geo := true;
  else
    v_requires_geo := false;
  end if;

  if v_requires_geo then
    if new.latitude is null or new.longitude is null or new.accuracy_meters is null then
      raise exception 'Ubicacion requerida para registrar asistencia';
    end if;

    if public.device_info_has_blocking_warnings(new.device_info) then
      raise exception 'Ubicacion no valida: senales de ubicacion simulada detectadas';
    end if;

    if new.action = 'check_in' then
      v_max_acc := 20;
    elsif new.action = 'check_out' then
      v_max_acc := 25;
    else
      raise exception 'Accion invalida: %', new.action;
    end if;

    v_radius := v_site.checkin_radius_meters;
    v_accuracy := new.accuracy_meters::double precision;

    if v_accuracy > v_max_acc then
      raise exception 'Precision GPS insuficiente: %m (maximo %m)', round(v_accuracy), v_max_acc;
    end if;

    v_distance := public.haversine_m(new.latitude, new.longitude, v_site.latitude, v_site.longitude);

    if (v_distance + v_accuracy) > v_radius then
      raise exception 'Fuera de rango: %m (precision %m) > radio %m',
        round(v_distance), round(v_accuracy), v_radius;
    end if;
  end if;

  return new;
end;
$$;


ALTER FUNCTION "public"."enforce_attendance_geofence"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."enforce_attendance_sequence"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
declare
  v_last_action text;
  v_last_site_id uuid;
  v_last_occurred_at timestamptz;
begin
  -- Serializa operaciones por empleado (evita doble insert concurrente)
  perform pg_advisory_xact_lock(hashtext(new.employee_id::text)::bigint);

  -- Validar acci├│n (por si entra algo raro)
  if new.action not in ('check_in','check_out') then
    raise exception 'Acci├│n inv├ílida: %', new.action;
  end if;

  -- Tomar el ├║ltimo evento del empleado (global, no solo "hoy")
  select action, site_id, occurred_at
    into v_last_action, v_last_site_id, v_last_occurred_at
  from public.attendance_logs
  where employee_id = new.employee_id
  order by occurred_at desc, created_at desc
  limit 1;

  if v_last_action is null then
    -- Primer evento debe ser check_in
    if new.action <> 'check_in' then
      raise exception 'Secuencia inv├ílida: el primer registro debe ser check_in';
    end if;

    return new;
  end if;

  -- (Opcional pero recomendado) evitar inserts "hacia atr├ís" en el tiempo
  if new.occurred_at < v_last_occurred_at then
    raise exception 'Secuencia inv├ílida: occurred_at no puede ser menor al ├║ltimo registro';
  end if;

  -- No permitir dos acciones iguales seguidas
  if new.action = v_last_action then
    raise exception 'Secuencia inv├ílida: no puedes registrar % dos veces seguidas', new.action;
  end if;

  -- Si es check_out, debe cerrar el mismo sitio del check_in anterior
  if new.action = 'check_out' and v_last_action = 'check_in' then
    if new.site_id <> v_last_site_id then
      raise exception 'Secuencia inv├ílida: el check_out debe ser en la misma sede del check_in anterior';
    end if;
  end if;

  return new;
end;
$$;


ALTER FUNCTION "public"."enforce_attendance_sequence"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."enforce_employee_inventory_location_assignment_site"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
declare
  v_employee_site uuid;
  v_location_site uuid;
begin
  select site_id into v_employee_site
  from public.employees
  where id = new.employee_id;

  select site_id into v_location_site
  from public.inventory_locations
  where id = new.location_id;

  if v_location_site is null then
    raise exception 'LOC invalido para asignacion de trabajador.';
  end if;

  if v_employee_site is distinct from new.site_id then
    if not exists (
      select 1
      from public.employee_sites es
      where es.employee_id = new.employee_id
        and es.site_id = new.site_id
        and es.is_active = true
    ) then
      raise exception 'El trabajador no pertenece a la sede seleccionada.';
    end if;
  end if;

  if v_location_site <> new.site_id then
    raise exception 'El LOC no pertenece a la sede seleccionada.';
  end if;

  new.updated_at = now();
  return new;
end;
$$;


ALTER FUNCTION "public"."enforce_employee_inventory_location_assignment_site"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."enforce_employee_role_site"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
declare
  st public.site_type;
begin
  select s.site_type into st
  from public.sites s
  where s.id = new.site_id;

  if st is null then
    raise exception 'site_id invalido o sede sin site_type';
  end if;

  if not exists (
    select 1
    from public.role_site_type_rules r
    where r.role = new.role
      and r.site_type = st
      and r.is_allowed = true
  ) then
    raise exception 'Rol "%" no permitido para site_type="%"', new.role, st;
  end if;

  return new;
end;
$$;


ALTER FUNCTION "public"."enforce_employee_role_site"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."enforce_inventory_location_area_site"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    SET "search_path" TO 'public'
    AS $$
declare
  v_area_site_id uuid;
begin
  select a.site_id
    into v_area_site_id
  from public.areas a
  where a.id = new.area_id;

  if v_area_site_id is null then
    raise exception 'area not found for LOC';
  end if;

  if v_area_site_id <> new.site_id then
    raise exception 'LOC area must belong to the same site';
  end if;

  return new;
end;
$$;


ALTER FUNCTION "public"."enforce_inventory_location_area_site"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."enforce_inventory_location_parent_same_site"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
begin
  if new.parent_location_id is null then
    return new;
  end if;

  -- no puede ser su propio padre
  if new.parent_location_id = new.id then
    raise exception 'inventory_locations: parent_location_id cannot equal id';
  end if;

  -- el padre debe pertenecer al mismo site_id
  if not exists (
    select 1
    from public.inventory_locations p
    where p.id = new.parent_location_id
      and p.site_id = new.site_id
  ) then
    raise exception 'inventory_locations: parent_location_id must belong to the same site_id';
  end if;

  return new;
end;
$$;


ALTER FUNCTION "public"."enforce_inventory_location_parent_same_site"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."enforce_inventory_location_position_scope"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    SET "search_path" TO 'public'
    AS $$
declare
  v_location_site_id uuid;
  v_parent_location_id uuid;
begin
  select loc.site_id
    into v_location_site_id
  from public.inventory_locations loc
  where loc.id = new.location_id;

  if v_location_site_id is null then
    raise exception 'LOC not found for internal position';
  end if;

  new.site_id := v_location_site_id;

  if new.parent_position_id is not null then
    select parent.location_id
      into v_parent_location_id
    from public.inventory_location_positions parent
    where parent.id = new.parent_position_id;

    if v_parent_location_id is null then
      raise exception 'parent position not found';
    end if;

    if v_parent_location_id <> new.location_id then
      raise exception 'parent position must belong to the same LOC';
    end if;
  end if;

  return new;
end;
$$;


ALTER FUNCTION "public"."enforce_inventory_location_position_scope"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."ensure_order_conversation"("p_order_id" "uuid") RETURNS "jsonb"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare
  v_uid uuid := auth.uid();
  v_order public.orders%rowtype;
  v_conversation public.order_conversations%rowtype;
begin
  if v_uid is null then
    raise exception 'authentication_required';
  end if;

  select *
  into v_order
  from public.orders
  where id = p_order_id
    and client_id = v_uid;

  if v_order.id is null then
    raise exception 'order_not_found';
  end if;

  insert into public.order_conversations (order_id, site_id, client_id, status)
  values (v_order.id, v_order.site_id, v_uid, 'open')
  on conflict (order_id) do update
    set updated_at = now()
  returning * into v_conversation;

  return jsonb_build_object(
    'ok', true,
    'conversation_id', v_conversation.id,
    'order_id', v_conversation.order_id,
    'site_id', v_conversation.site_id,
    'client_id', v_conversation.client_id,
    'status', v_conversation.status
  );
end;
$$;


ALTER FUNCTION "public"."ensure_order_conversation"("p_order_id" "uuid") OWNER TO "postgres";


COMMENT ON FUNCTION "public"."ensure_order_conversation"("p_order_id" "uuid") IS 'Crea o devuelve la conversaci├│n de un pedido propio del cliente.';



CREATE OR REPLACE FUNCTION "public"."fogo_create_production_batch_from_recipe"("p_recipe_card_id" "uuid", "p_produced_qty" numeric, "p_destination_location_id" "uuid", "p_notes" "text" DEFAULT NULL::"text") RETURNS "jsonb"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pg_temp'
    AS $$
declare
  v_employee_id uuid := auth.uid();
  v_recipe record;
  v_destination record;
  v_configured_production_location_id uuid;
  v_scale numeric;
  v_total_cost numeric := 0;
  v_unit_cost numeric := null;
  v_batch_id uuid;
  v_batch_code text;
  v_ingredient record;
  v_location record;
  v_remaining numeric;
  v_required_qty numeric;
  v_take numeric;
  v_stock_unit_code text;
  v_movement_id uuid;
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

  select
    rc.id,
    rc.product_id,
    rc.site_id,
    rc.area_id,
    rc.yield_qty,
    rc.yield_unit,
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

  insert into public.production_batches (
    site_id,
    product_id,
    recipe_card_id,
    produced_qty,
    produced_unit,
    status,
    notes,
    created_by,
    destination_location_id,
    recipe_consumed
  )
  values (
    v_recipe.site_id,
    v_recipe.product_id,
    v_recipe.id,
    p_produced_qty,
    coalesce(nullif(v_recipe.yield_unit, ''), nullif(v_recipe.product_stock_unit_code, ''), nullif(v_recipe.product_unit, ''), 'un'),
    'posted',
    nullif(trim(coalesce(p_notes, '')), ''),
    v_employee_id,
    p_destination_location_id,
    true
  )
  returning id, batch_code into v_batch_id, v_batch_code;

  for v_ingredient in
    select
      r.ingredient_product_id,
      r.quantity,
      p.name,
      p.unit,
      p.stock_unit_code,
      coalesce(p.cost, 0) as cost
    from public.recipes r
    join public.products p on p.id = r.ingredient_product_id
    where r.product_id = v_recipe.product_id
      and coalesce(r.is_active, true) = true
    order by r.created_at asc, r.id asc
  loop
    v_required_qty := coalesce(v_ingredient.quantity, 0) * v_scale;
    if v_required_qty <= 0 then
      continue;
    end if;

    v_remaining := v_required_qty;
    v_stock_unit_code := coalesce(
      nullif(v_ingredient.stock_unit_code, ''),
      nullif(v_ingredient.unit, ''),
      'un'
    );
    v_total_cost := v_total_cost + (v_required_qty * coalesce(v_ingredient.cost, 0));

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
          v_configured_production_location_id is null
          or loc.id = v_configured_production_location_id
        )
      order by
        case when pick.location_id is null then 1 else 0 end,
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
      )
      values (
        v_recipe.site_id,
        v_ingredient.ingredient_product_id,
        'production_consume',
        -v_take,
        v_take,
        v_stock_unit_code,
        1,
        v_stock_unit_code,
        coalesce(v_ingredient.cost, 0),
        format('Consumo lote %s desde %s', coalesce(v_batch_code, v_batch_id::text), coalesce(v_location.location_code, v_location.location_id::text)),
        v_batch_id,
        v_employee_id
      )
      returning id into v_movement_id;

      insert into public.production_batch_consumptions (
        batch_id,
        ingredient_product_id,
        location_id,
        required_qty,
        consumed_qty,
        stock_unit_code,
        movement_id,
        created_by
      )
      values (
        v_batch_id,
        v_ingredient.ingredient_product_id,
        v_location.location_id,
        v_take,
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
        v_required_qty,
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
  )
  values (
    v_recipe.site_id,
    v_recipe.product_id,
    'production_output',
    p_produced_qty,
    p_produced_qty,
    coalesce(nullif(v_recipe.product_stock_unit_code, ''), nullif(v_recipe.product_unit, ''), coalesce(nullif(v_recipe.yield_unit, ''), 'un')),
    1,
    coalesce(nullif(v_recipe.product_stock_unit_code, ''), nullif(v_recipe.product_unit, ''), coalesce(nullif(v_recipe.yield_unit, ''), 'un')),
    v_unit_cost,
    format('Ingreso lote %s a %s', coalesce(v_batch_code, v_batch_id::text), coalesce(v_destination.code, p_destination_location_id::text)),
    v_batch_id,
    v_employee_id
  );

  return jsonb_build_object(
    'batchId', v_batch_id,
    'batchCode', v_batch_code,
    'recipeCardId', v_recipe.id,
    'productId', v_recipe.product_id,
    'siteId', v_recipe.site_id,
    'areaId', v_recipe.area_id,
    'producedQty', p_produced_qty,
    'producedUnit', coalesce(nullif(v_recipe.yield_unit, ''), nullif(v_recipe.product_stock_unit_code, ''), nullif(v_recipe.product_unit, ''), 'un'),
    'destinationLocationId', p_destination_location_id,
    'totalCost', v_total_cost,
    'unitCost', v_unit_cost
  );
end;
$$;


ALTER FUNCTION "public"."fogo_create_production_batch_from_recipe"("p_recipe_card_id" "uuid", "p_produced_qty" numeric, "p_destination_location_id" "uuid", "p_notes" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."fogo_recipe_area_options"("p_site_id" "uuid") RETURNS TABLE("id" "uuid", "code" "text", "name" "text", "kind" "text", "site_id" "uuid")
    LANGUAGE "sql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public', 'pg_temp'
    AS $$
  with current_context as (
    select
      public.current_employee_role() as role,
      public.current_employee_area_id() as employee_area_id
  ),
  allowed_kind(area_kind, sort_order) as (
    values
      ('bodega'::text, 1),
      ('cocina_caliente'::text, 2),
      ('panaderia'::text, 3),
      ('reposteria'::text, 4),
      ('cocina'::text, 5),
      ('bar'::text, 6),
      ('cocina_bar'::text, 7)
  ),
  enabled_kind as (
    select ak.area_kind, ak.sort_order
    from allowed_kind ak
    where exists (
      select 1
      from public.site_area_purpose_rules rule
      where rule.site_id = p_site_id
        and rule.purpose = 'production_recipe'
        and rule.area_kind = ak.area_kind
        and coalesce(rule.is_enabled, true) = true
    )
    or not exists (
      select 1
      from public.site_area_purpose_rules rule
      where rule.site_id = p_site_id
        and rule.purpose = 'production_recipe'
    )
  ),
  candidate as (
    select
      a.id,
      a.code,
      a.name,
      a.kind,
      a.site_id,
      case
        when upper(coalesce(a.code, '')) = 'BODEGA'
          or lower(public._vento_slugify(coalesce(a.name, ''))) in ('bodega', 'bodega-principal')
          then 'bodega'
        when upper(coalesce(a.code, '')) in ('COC-CAL', 'COCINA_CALIENTE')
          or lower(public._vento_slugify(coalesce(a.name, ''))) = 'cocina-caliente'
          then 'cocina_caliente'
        when upper(coalesce(a.code, '')) = 'PAN-GALL'
          or lower(public._vento_slugify(coalesce(a.name, ''))) = 'galleteria-y-panaderia'
          then 'panaderia'
        when upper(coalesce(a.code, '')) = 'REPOSTERIA'
          or lower(public._vento_slugify(coalesce(a.name, ''))) = 'reposteria'
          then 'reposteria'
        else a.kind
      end as canonical_kind,
      case
        when upper(coalesce(a.code, '')) in ('BODEGA', 'COC-CAL', 'PAN-GALL', 'REPOSTERIA') then 0
        else 1
      end as preference
    from public.areas a
    where a.site_id = p_site_id
      and coalesce(a.is_active, true) = true
      and not (
        upper(coalesce(a.code, '')) in ('PAN', 'PANADERIA')
        or lower(public._vento_slugify(coalesce(a.name, ''))) = 'panaderia'
      )
  ),
  scoped as (
    select c.*, ek.sort_order
    from candidate c
    join enabled_kind ek on ek.area_kind = c.canonical_kind
    cross join current_context ctx
    where
      ctx.role in ('propietario', 'gerente_general')
      or (
        ctx.role = 'gerente'
        and public.can_access_site(p_site_id)
      )
      or (
        public.has_permission('fogo.production.recipe_book.view', p_site_id, c.id)
        and ctx.employee_area_id = c.id
      )
      or public.has_permission('fogo.production.recipes.manage', p_site_id, c.id)
  ),
  deduped as (
    select *,
      row_number() over (
        partition by canonical_kind
        order by preference asc, name asc, id asc
      ) as rn
    from scoped
  )
  select id, code, name, kind, site_id
  from deduped
  where rn = 1
  order by sort_order asc, name asc;
$$;


ALTER FUNCTION "public"."fogo_recipe_area_options"("p_site_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."generate_inventory_sku"("p_product_type" "text" DEFAULT NULL::"text", "p_inventory_kind" "text" DEFAULT NULL::"text", "p_name" "text" DEFAULT NULL::"text") RETURNS "text"
    LANGUAGE "plpgsql"
    AS $$
declare
  v_type text;
  v_name text;
  v_seq bigint;
begin
  v_type := case
    when lower(coalesce(trim(p_inventory_kind), '')) = 'asset' then 'EQP'
    when lower(coalesce(trim(p_product_type), '')) = 'venta' then 'VEN'
    when lower(coalesce(trim(p_product_type), '')) = 'preparacion' then 'PRE'
    else 'INS'
  end;

  v_name := upper(coalesce(trim(p_name), ''));
  v_name := translate(v_name,
    '├ü├Ç├ä├é├â├ë├ê├ï├è├ì├î├Å├Ä├ô├Æ├û├ö├ò├Ü├Ö├£├¢├æ├ç├í├á├ñ├ó├ú├⌐├¿├½├¬├¡├¼├»├«├│├▓├╢├┤├╡├║├╣├╝├╗├▒├º',
    'AAAAAEEEEIIIIOOOOOUUUUNCaaaaaeeeeiiiiooooouuuunc'
  );
  v_name := regexp_replace(v_name, '[^A-Z0-9]+', '', 'g');
  v_name := left(nullif(v_name, ''), 6);
  if v_name is null then
    v_name := 'ITEM';
  end if;

  v_seq := nextval('public.inventory_sku_seq');

  return v_type || '-' || v_name || '-' || lpad(v_seq::text, 6, '0');
end;
$$;


ALTER FUNCTION "public"."generate_inventory_sku"("p_product_type" "text", "p_inventory_kind" "text", "p_name" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."generate_location_code"("p_site_code" "text", "p_zone" "text", "p_aisle" "text" DEFAULT NULL::"text", "p_level" "text" DEFAULT NULL::"text") RETURNS "text"
    LANGUAGE "plpgsql" IMMUTABLE
    AS $$
DECLARE
  v_code TEXT;
BEGIN
  v_code := 'LOC-' || UPPER(p_site_code) || '-' || UPPER(p_zone);
  IF p_aisle IS NOT NULL THEN
    v_code := v_code || '-' || UPPER(p_aisle);
  END IF;
  IF p_level IS NOT NULL THEN
    v_code := v_code || '-' || UPPER(p_level);
  END IF;
  RETURN v_code;
END;
$$;


ALTER FUNCTION "public"."generate_location_code"("p_site_code" "text", "p_zone" "text", "p_aisle" "text", "p_level" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."generate_lpn_code"("p_site_code" "text") RETURNS "text"
    LANGUAGE "plpgsql"
    AS $$
DECLARE
  v_year_month TEXT;
  v_seq INT;
BEGIN
  v_year_month := TO_CHAR(NOW(), 'YYMM');
  v_seq := NEXTVAL('lpn_sequence');
  RETURN 'LPN-' || UPPER(p_site_code) || '-' || v_year_month || '-' || LPAD(v_seq::TEXT, 4, '0');
END;
$$;


ALTER FUNCTION "public"."generate_lpn_code"("p_site_code" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."generate_product_sku"("p_product_type" "text", "p_site_id" "uuid" DEFAULT NULL::"uuid") RETURNS "text"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare
  v_site_id uuid;
  v_brand_code text;
  v_type_code text;
  v_next integer;
begin
  v_site_id := coalesce(
    p_site_id,
    public.current_employee_selected_site_id(),
    public.current_employee_primary_site_id()
  );

  if v_site_id is null then
    select s.id into v_site_id
    from public.sites s
    where s.site_kind = 'hq'
    order by s.created_at
    limit 1;
  end if;

  if v_site_id is null then
    select s.id into v_site_id
    from public.sites s
    order by s.created_at
    limit 1;
  end if;

  if v_site_id is null then
    raise exception 'No site available to generate SKU';
  end if;

  v_brand_code := public.resolve_product_sku_brand_code(v_site_id);
  if v_brand_code is null or v_brand_code = '' then
    raise exception 'No brand code available for site %', v_site_id;
  end if;

  v_type_code := public.resolve_product_sku_type_code(p_product_type);
  if v_type_code is null or v_type_code = '' then
    v_type_code := 'GEN';
  end if;

  insert into public.product_sku_sequences (brand_code, type_code, last_value, updated_at)
  values (v_brand_code, v_type_code, 1, now())
  on conflict (brand_code, type_code)
  do update
    set last_value = public.product_sku_sequences.last_value + 1,
        updated_at = now()
  returning last_value into v_next;

  return v_brand_code || '-' || v_type_code || '-' || lpad(v_next::text, 5, '0');
end;
$$;


ALTER FUNCTION "public"."generate_product_sku"("p_product_type" "text", "p_site_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_internal_invoice_cutoff_warnings"("p_cutoff_at" timestamp with time zone) RETURNS TABLE("warning_key" "text", "total" bigint)
    LANGUAGE "plpgsql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
begin
  return query
  select
    'operational_not_closed'::text as warning_key,
    count(*)::bigint as total
  from public.restock_requests r
  where r.created_at <= p_cutoff_at
    and r.status not in ('closed', 'received', 'cancelled');

  return query
  select
    'partial_or_in_transit'::text as warning_key,
    count(*)::bigint as total
  from public.restock_requests r
  where r.created_at <= p_cutoff_at
    and r.status in ('partial', 'in_transit');

  return query
  select
    'closed_pending_price'::text as warning_key,
    count(*)::bigint as total
  from public.restock_requests r
  where r.closed_at is not null
    and r.closed_at <= p_cutoff_at
    and r.status in ('closed', 'received')
    and r.pricing_status = 'pending_price'
    and r.internal_pos_document_id is null;

  return query
  select
    'closed_pending_variance_resolution'::text as warning_key,
    count(*)::bigint as total
  from public.restock_requests r
  where r.closed_at is not null
    and r.closed_at <= p_cutoff_at
    and r.status in ('closed', 'received')
    and r.pricing_status = 'pending_variance_resolution'
    and r.internal_pos_document_id is null;

  return query
  select
    'ready_to_invoice'::text as warning_key,
    count(*)::bigint as total
  from public.restock_requests r
  where r.closed_at is not null
    and r.closed_at <= p_cutoff_at
    and r.status in ('closed', 'received')
    and r.pricing_status = 'ready_to_invoice'
    and r.internal_pos_document_id is null;
end;
$$;


ALTER FUNCTION "public"."get_internal_invoice_cutoff_warnings"("p_cutoff_at" timestamp with time zone) OWNER TO "postgres";


COMMENT ON FUNCTION "public"."get_internal_invoice_cutoff_warnings"("p_cutoff_at" timestamp with time zone) IS 'Returns aggregate warning counts for the future 4:30 p.m. internal billing cutoff notification.';



CREATE OR REPLACE FUNCTION "public"."get_my_total_earned_points"() RETURNS TABLE("total_earned" bigint)
    LANGUAGE "sql" STABLE
    SET "search_path" TO 'public', 'pass'
    AS $$
  select * from pass.get_my_total_earned_points();
$$;


ALTER FUNCTION "public"."get_my_total_earned_points"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_operational_context"("p_employee_id" "uuid" DEFAULT "auth"."uid"(), "p_site_id" "uuid" DEFAULT NULL::"uuid", "p_app_code" "text" DEFAULT 'nexo'::"text") RETURNS TABLE("employee_id" "uuid", "app_code" "text", "active_site_id" "uuid", "selected_site_id" "uuid", "employee_default_site_id" "uuid", "active_shift_id" "uuid", "active_shift_site_id" "uuid", "on_shift_now" boolean, "active_checkin_id" "uuid", "active_checkin_site_id" "uuid", "checked_in_now" boolean, "policy_requires_shift" boolean, "policy_requires_checkin" boolean, "policy_requires_site_match" boolean, "bypass_applied" boolean, "can_operate" boolean, "blocked_reasons" "text"[])
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare
  v_policy record;
  v_selected_site_id uuid;
  v_employee_site_id uuid;
  v_active_site_id uuid;
  v_shift_id uuid;
  v_shift_site_id uuid;
  v_on_shift boolean := false;
  v_open_checkin_id uuid;
  v_open_checkin_site_id uuid;
  v_checked_in boolean := false;
  v_now_local timestamp without time zone;
  v_today date;
  v_time_now time without time zone;
  v_bypass boolean := false;
  v_bypass_code text := null;
  v_reasons text[] := array[]::text[];
  v_can_operate boolean := true;
  v_employee_role text := null;
begin
  select *
  into v_policy
  from public.app_operation_policies p
  where p.app_code = trim(lower(coalesce(p_app_code, 'nexo')))
    and p.is_active = true
  limit 1;

  if p_employee_id is null then
    p_employee_id := auth.uid();
  end if;

  if p_employee_id is null then
    employee_id := null;
    app_code := coalesce(v_policy.app_code, trim(lower(coalesce(p_app_code, 'nexo'))));
    active_site_id := null;
    selected_site_id := null;
    employee_default_site_id := null;
    active_shift_id := null;
    active_shift_site_id := null;
    on_shift_now := false;
    active_checkin_id := null;
    active_checkin_site_id := null;
    checked_in_now := false;
    policy_requires_shift := coalesce(v_policy.requires_shift, false);
    policy_requires_checkin := coalesce(v_policy.requires_checkin, false);
    policy_requires_site_match := coalesce(v_policy.requires_site_match, false);
    bypass_applied := false;
    can_operate := false;
    blocked_reasons := array['unauthenticated'];
    return next;
    return;
  end if;

  select e.site_id, e.role
    into v_employee_site_id, v_employee_role
  from public.employees e
  where e.id = p_employee_id
  limit 1;

  select es.selected_site_id
    into v_selected_site_id
  from public.employee_settings es
  where es.employee_id = p_employee_id
  limit 1;

  v_now_local := now() at time zone 'America/Bogota';
  v_today := v_now_local::date;
  v_time_now := v_now_local::time;

  select s.id, s.site_id
    into v_shift_id, v_shift_site_id
  from public.employee_shifts s
  where s.employee_id = p_employee_id
    and s.shift_date = v_today
    and s.published_at is not null
    and coalesce(s.status, 'scheduled') <> 'cancelled'
    and (
      (s.start_time <= s.end_time and v_time_now between s.start_time and s.end_time)
      or
      (s.start_time > s.end_time and (v_time_now >= s.start_time or v_time_now <= s.end_time))
    )
  order by s.start_time asc
  limit 1;

  v_on_shift := v_shift_id is not null;

  select al.id, al.site_id
    into v_open_checkin_id, v_open_checkin_site_id
  from public.attendance_logs al
  where al.employee_id = p_employee_id
    and al.action = 'check_in'
    and not exists (
      select 1
      from public.attendance_logs ao
      where ao.employee_id = al.employee_id
        and ao.action = 'check_out'
        and ao.occurred_at > al.occurred_at
    )
  order by al.occurred_at desc
  limit 1;

  v_checked_in := v_open_checkin_id is not null;
  v_active_site_id := coalesce(p_site_id, v_selected_site_id, v_open_checkin_site_id, v_shift_site_id, v_employee_site_id);

  -- Explicit role bypass for global management (they do not operate with shifts).
  if coalesce(v_employee_role, '') in ('propietario', 'gerente_general') then
    v_bypass := true;
  end if;

  if not v_bypass and v_policy.bypass_permission_code is not null and trim(v_policy.bypass_permission_code) <> '' then
    v_bypass_code := v_policy.app_code || '.' || trim(v_policy.bypass_permission_code);
    v_bypass := public.has_permission(v_bypass_code, v_active_site_id);
  end if;

  if not v_bypass then
    if coalesce(v_policy.requires_shift, false) and not v_on_shift then
      v_reasons := array_append(v_reasons, 'out_of_shift');
    end if;
    if coalesce(v_policy.requires_checkin, false) and not v_checked_in then
      v_reasons := array_append(v_reasons, 'checkin_required');
    end if;
    if coalesce(v_policy.requires_site_match, false) then
      if v_on_shift and v_active_site_id is not null and v_shift_site_id is not null and v_shift_site_id <> v_active_site_id then
        v_reasons := array_append(v_reasons, 'shift_site_mismatch');
      end if;
      if v_checked_in and v_active_site_id is not null and v_open_checkin_site_id is not null and v_open_checkin_site_id <> v_active_site_id then
        v_reasons := array_append(v_reasons, 'checkin_site_mismatch');
      end if;
    end if;
  end if;

  v_can_operate := coalesce(array_length(v_reasons, 1), 0) = 0;

  employee_id := p_employee_id;
  app_code := coalesce(v_policy.app_code, trim(lower(coalesce(p_app_code, 'nexo'))));
  active_site_id := v_active_site_id;
  selected_site_id := v_selected_site_id;
  employee_default_site_id := v_employee_site_id;
  active_shift_id := v_shift_id;
  active_shift_site_id := v_shift_site_id;
  on_shift_now := v_on_shift;
  active_checkin_id := v_open_checkin_id;
  active_checkin_site_id := v_open_checkin_site_id;
  checked_in_now := v_checked_in;
  policy_requires_shift := coalesce(v_policy.requires_shift, false);
  policy_requires_checkin := coalesce(v_policy.requires_checkin, false);
  policy_requires_site_match := coalesce(v_policy.requires_site_match, false);
  bypass_applied := v_bypass;
  can_operate := v_can_operate;
  blocked_reasons := v_reasons;
  return next;
end;
$$;


ALTER FUNCTION "public"."get_operational_context"("p_employee_id" "uuid", "p_site_id" "uuid", "p_app_code" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_restock_request_operational_summary"("p_request_id" "uuid") RETURNS TABLE("total_lines" integer, "pending_loc_selection_lines" integer, "dispatch_ready_lines" integer, "dispatch_blocked_lines" integer, "pending_receipt_lines" integer, "shortage_lines" integer, "received_lines" integer, "can_start_prepare" boolean, "can_transit" boolean, "can_complete_receive" boolean, "can_receive_partial" boolean)
    LANGUAGE "sql" STABLE
    AS $$
  with item_metrics as (
    select
      i.id,
      coalesce(i.quantity, 0)::numeric as requested_qty,
      coalesce(i.prepared_quantity, 0)::numeric as prepared_qty,
      coalesce(i.shipped_quantity, 0)::numeric as shipped_qty,
      coalesce(i.received_quantity, 0)::numeric as received_qty,
      coalesce(i.shortage_quantity, 0)::numeric as shortage_qty,
      i.source_location_id as source_location_id
    from public.restock_request_items i
    where i.request_id = p_request_id
  ),
  agg as (
    select
      count(*)::integer as total_lines,
      count(*) filter (
        where requested_qty > 0 and source_location_id is null
      )::integer as pending_loc_selection_lines,
      count(*) filter (
        where requested_qty > 0 and prepared_qty > 0
      )::integer as dispatch_ready_lines,
      count(*) filter (
        where requested_qty > 0 and prepared_qty <= 0
      )::integer as dispatch_blocked_lines,
      count(*) filter (
        -- Antes se usaba received + shortage para decidir pendiente.
        -- Ahora: el faltante es alerta, pero mientras received < shipped hay pendiente real.
        where shipped_qty > 0 and received_qty < shipped_qty
      )::integer as pending_receipt_lines,
      count(*) filter (
        where shortage_qty > 0
      )::integer as shortage_lines,
      count(*) filter (
        where received_qty > 0
      )::integer as received_lines,
      bool_and(
        case
          when requested_qty > 0 then source_location_id is not null
          else true
        end
      ) as all_locs_selected,
      bool_and(
        case
          when requested_qty > 0 then prepared_qty > 0
          else true
        end
      ) as all_lines_prepared,
      bool_and(
        case
          when shipped_qty > 0 then received_qty = shipped_qty
          else true
        end
      ) as all_received_or_short
    from item_metrics
  )
  select
    total_lines,
    pending_loc_selection_lines,
    dispatch_ready_lines,
    dispatch_blocked_lines,
    pending_receipt_lines,
    shortage_lines,
    received_lines,
    total_lines > 0 and pending_loc_selection_lines = 0 and coalesce(all_locs_selected, false) as can_start_prepare,
    total_lines > 0 and dispatch_ready_lines > 0 and dispatch_blocked_lines = 0 and coalesce(all_lines_prepared, false) as can_transit,
    total_lines > 0 and pending_receipt_lines = 0 and coalesce(all_received_or_short, false) as can_complete_receive,
    total_lines > 0 and received_lines > 0 and pending_receipt_lines > 0 as can_receive_partial
  from agg;
$$;


ALTER FUNCTION "public"."get_restock_request_operational_summary"("p_request_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_site_cost_center"("p_site_id" "uuid") RETURNS "uuid"
    LANGUAGE "sql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
  select cc.id
  from public.cost_centers cc
  where cc.site_id = p_site_id
    and cc.is_active is not false
  order by
    case cc.type
      when 'production_center' then 1
      when 'satellite' then 2
      when 'admin' then 3
      when 'logistics' then 4
      else 9
    end,
    cc.created_at asc
  limit 1;
$$;


ALTER FUNCTION "public"."get_site_cost_center"("p_site_id" "uuid") OWNER TO "postgres";


COMMENT ON FUNCTION "public"."get_site_cost_center"("p_site_id" "uuid") IS 'Returns the active cost center associated with a site. Used by internal billing valuation.';



CREATE OR REPLACE FUNCTION "public"."grant_loyalty_points"("p_user_id" "uuid", "p_points" integer, "p_description" "text" DEFAULT NULL::"text", "p_metadata" "jsonb" DEFAULT '{}'::"jsonb") RETURNS "jsonb"
    LANGUAGE "sql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pass'
    AS $$
  select pass.grant_loyalty_points(p_user_id, p_points, p_description, p_metadata);
$$;


ALTER FUNCTION "public"."grant_loyalty_points"("p_user_id" "uuid", "p_points" integer, "p_description" "text", "p_metadata" "jsonb") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."handle_new_user"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
BEGIN
  INSERT INTO public.users (id, email, full_name, loyalty_points)
  VALUES (new.id, new.email, '', 0)
  ON CONFLICT (id) DO NOTHING; -- Evita errores si ya existe
  RETURN new;
END;
$$;


ALTER FUNCTION "public"."handle_new_user"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."has_permission"("p_permission_code" "text", "p_site_id" "uuid" DEFAULT NULL::"uuid", "p_area_id" "uuid" DEFAULT NULL::"uuid") RETURNS boolean
    LANGUAGE "plpgsql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare
  v_employee_id uuid;
  v_role text;
  v_permission_id uuid;
  v_site_id uuid;
  v_area_id uuid;
  v_denied boolean;
  v_allowed boolean;
begin
  v_employee_id := auth.uid();

  if v_employee_id is null then
    return false;
  end if;

  select e.role
  into v_role
  from public.employees e
  where e.id = v_employee_id
    and e.is_active = true;

  if v_role is null then
    return false;
  end if;

  select ap.id
  into v_permission_id
  from public.app_permissions ap
  join public.apps a
    on a.id = ap.app_id
  where (a.code || '.' || ap.code) = p_permission_code
    and a.is_active = true
    and ap.is_active = true;

  if v_permission_id is null then
    return false;
  end if;

  v_site_id := coalesce(p_site_id, public.current_employee_site_id());
  v_area_id := p_area_id;

  select exists (
    select 1
    from public.employee_permissions ep
    where ep.employee_id = v_employee_id
      and ep.permission_id = v_permission_id
      and ep.is_allowed = false
      and public.permission_scope_matches(
        ep.scope_type,
        v_site_id,
        v_area_id,
        ep.scope_site_id,
        ep.scope_area_id,
        ep.scope_site_type,
        ep.scope_area_kind
      )
  )
  into v_denied;

  if v_denied then
    return false;
  end if;

  select exists (
    select 1
    from public.employee_permissions ep
    where ep.employee_id = v_employee_id
      and ep.permission_id = v_permission_id
      and ep.is_allowed = true
      and public.permission_scope_matches(
        ep.scope_type,
        v_site_id,
        v_area_id,
        ep.scope_site_id,
        ep.scope_area_id,
        ep.scope_site_type,
        ep.scope_area_kind
      )
  )
  into v_allowed;

  if v_allowed then
    return true;
  end if;

  select exists (
    select 1
    from public.role_permissions rp
    where rp.role = v_role
      and rp.permission_id = v_permission_id
      and rp.is_allowed = true
      and public.permission_scope_matches(
        rp.scope_type,
        v_site_id,
        v_area_id,
        rp.scope_site_id,
        rp.scope_area_id,
        rp.scope_site_type,
        rp.scope_area_kind
      )
  )
  into v_allowed;

  return coalesce(v_allowed, false);
end;
$$;


ALTER FUNCTION "public"."has_permission"("p_permission_code" "text", "p_site_id" "uuid", "p_area_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."haversine_m"("lat1" numeric, "lon1" numeric, "lat2" numeric, "lon2" numeric) RETURNS double precision
    LANGUAGE "sql" IMMUTABLE
    AS $$
  select 2 * 6371000::double precision *
    asin(
      sqrt(
        power(sin((((lat2::double precision - lat1::double precision) * pi()) / 180) / 2), 2) +
        cos((lat1::double precision * pi()) / 180) *
        cos((lat2::double precision * pi()) / 180) *
        power(sin((((lon2::double precision - lon1::double precision) * pi()) / 180) / 2), 2)
      )
    );
$$;


ALTER FUNCTION "public"."haversine_m"("lat1" numeric, "lon1" numeric, "lat2" numeric, "lon2" numeric) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."is_active_staff"() RETURNS boolean
    LANGUAGE "sql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    SET "row_security" TO 'off'
    AS $$
  select public.is_employee();
$$;


ALTER FUNCTION "public"."is_active_staff"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."is_employee"() RETURNS boolean
    LANGUAGE "sql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    SET "row_security" TO 'off'
    AS $$
  select exists (
    select 1
    from public.employees e
    where e.id = auth.uid()
      and coalesce(e.is_active, true) = true
  );
$$;


ALTER FUNCTION "public"."is_employee"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."is_global_manager"() RETURNS boolean
    LANGUAGE "sql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    SET "row_security" TO 'off'
    AS $$
  select public.current_employee_role() = 'gerente_general';
$$;


ALTER FUNCTION "public"."is_global_manager"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."is_manager"() RETURNS boolean
    LANGUAGE "sql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    SET "row_security" TO 'off'
    AS $$
  select public.current_employee_role() = 'gerente';
$$;


ALTER FUNCTION "public"."is_manager"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."is_manager_or_owner"() RETURNS boolean
    LANGUAGE "sql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    SET "row_security" TO 'off'
    AS $$
  select public.current_employee_role() in ('propietario', 'gerente', 'gerente_general');
$$;


ALTER FUNCTION "public"."is_manager_or_owner"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."is_owner"() RETURNS boolean
    LANGUAGE "sql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    SET "row_security" TO 'off'
    AS $$
  select public.current_employee_role() = 'propietario';
$$;


ALTER FUNCTION "public"."is_owner"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."mark_payment_transaction_status"("p_transaction_id" "uuid", "p_provider_reference" "text", "p_status" "text", "p_payload" "jsonb" DEFAULT '{}'::"jsonb") RETURNS "jsonb"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'payments'
    AS $$
declare
  v_tx payments.transactions%rowtype;
  v_status text := lower(trim(coalesce(p_status, '')));
  v_order_status text;
  v_payment_status text;
begin
  if p_transaction_id is null then
    raise exception 'transaction_required';
  end if;

  if v_status not in ('approved', 'rejected', 'cancelled', 'error', 'refunded') then
    raise exception 'invalid_payment_status';
  end if;

  select *
  into v_tx
  from payments.transactions
  where id = p_transaction_id
  for update;

  if v_tx.id is null then
    raise exception 'transaction_not_found';
  end if;

  if v_status = 'approved' then
    v_order_status := 'confirmed';
    v_payment_status := 'paid';
  elsif v_status = 'refunded' then
    v_order_status := 'cancelled';
    v_payment_status := 'refunded';
  else
    v_order_status := 'pending';
    v_payment_status := 'failed';
  end if;

  update payments.transactions
  set
    status = v_status,
    provider_reference = coalesce(nullif(trim(coalesce(p_provider_reference, '')), ''), provider_reference),
    raw_response = coalesce(p_payload, '{}'::jsonb),
    approved_at = case when v_status = 'approved' then now() else approved_at end,
    rejected_at = case when v_status in ('rejected', 'cancelled', 'error') then now() else rejected_at end,
    updated_at = now()
  where id = v_tx.id;

  update public.orders
  set
    payment_status = v_payment_status,
    status = case
      when status in ('delivered', 'cancelled') then status
      else v_order_status
    end,
    payment_reference = coalesce(nullif(trim(coalesce(p_provider_reference, '')), ''), payment_reference),
    payment_provider = coalesce(payment_provider, v_tx.provider),
    updated_at = now()
  where id = v_tx.order_id;

  return jsonb_build_object(
    'ok', true,
    'transaction_id', v_tx.id,
    'order_id', v_tx.order_id,
    'status', v_status
  );
end;
$$;


ALTER FUNCTION "public"."mark_payment_transaction_status"("p_transaction_id" "uuid", "p_provider_reference" "text", "p_status" "text", "p_payload" "jsonb") OWNER TO "postgres";


COMMENT ON FUNCTION "public"."mark_payment_transaction_status"("p_transaction_id" "uuid", "p_provider_reference" "text", "p_status" "text", "p_payload" "jsonb") IS 'Aplica resultado de pago y sincroniza estado de orden.';



CREATE OR REPLACE FUNCTION "public"."nexo_kiosk_withdraw_workers"("p_source_location_id" "uuid") RETURNS TABLE("employee_id" "uuid", "label" "text", "role" "text", "destination_label" "text", "has_destination" boolean)
    LANGUAGE "sql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
  with source as (
    select il.id, il.site_id
    from public.inventory_locations il
    where il.id = p_source_location_id
      and il.is_active = true
    limit 1
  ),
  allowed as (
    select s.site_id
    from source s
    where public.has_permission('nexo.inventory.withdraw', s.site_id)
       or public.has_permission('nexo.inventory.transfers', s.site_id)
  ),
  site_workers as (
    select e.id, e.full_name, e.alias, e.role
    from allowed a
    join public.employee_sites es
      on es.site_id = a.site_id
     and es.is_active = true
    join public.employees e
      on e.id = es.employee_id
     and coalesce(e.is_active, true) = true

    union

    select e.id, e.full_name, e.alias, e.role
    from allowed a
    join public.employees e
      on e.site_id = a.site_id
     and coalesce(e.is_active, true) = true
  ),
  assignments as (
    select distinct on (a.employee_id)
      a.employee_id,
      a.location_id,
      coalesce(nullif(il.description, ''), nullif(il.zone, ''), nullif(il.code, ''), il.id::text) as destination_label
    from allowed src
    join public.employee_inventory_location_assignments a
      on a.site_id = src.site_id
     and a.purpose = 'kiosk_withdraw'
     and a.is_active = true
    join public.inventory_locations il
      on il.id = a.location_id
     and il.is_active = true
    where a.location_id <> p_source_location_id
    order by a.employee_id, a.updated_at desc
  )
  select
    sw.id as employee_id,
    coalesce(nullif(sw.alias, ''), nullif(sw.full_name, ''), sw.id::text) as label,
    sw.role,
    coalesce(a.destination_label, 'Sin destino (descuento)') as destination_label,
    (a.location_id is not null) as has_destination
  from site_workers sw
  left join assignments a on a.employee_id = sw.id
  where sw.id <> auth.uid()
  order by coalesce(nullif(sw.alias, ''), nullif(sw.full_name, ''), sw.id::text);
$$;


ALTER FUNCTION "public"."nexo_kiosk_withdraw_workers"("p_source_location_id" "uuid") OWNER TO "postgres";


COMMENT ON FUNCTION "public"."nexo_kiosk_withdraw_workers"("p_source_location_id" "uuid") IS 'Returns active workers for a kiosk source LOC site, including their kiosk withdrawal destination when configured.';



CREATE OR REPLACE FUNCTION "public"."notify_shift_published"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare
  fn_url text;
  secret text;
  payload jsonb;
begin
  -- Solo notificar en el momento de publicar:
  -- INSERT con published_at ya puesto, o UPDATE donde published_at pasaba de null a no null.
  if new.published_at is null then
    return new;
  end if;
  if tg_op = 'UPDATE' and old.published_at is not null then
    return new;  -- ya estaba publicado; no notificar por ediciones posteriores
  end if;

  select coalesce(value #>> '{}', '') into fn_url from public.app_config where key = 'shift_notify_function_url' limit 1;
  if trim(fn_url) = '' then
    return new;
  end if;

  select coalesce(value #>> '{}', '') into secret from public.app_config where key = 'shift_notify_internal_secret' limit 1;
  if trim(secret) = '' then
    return new;
  end if;

  payload := jsonb_build_object(
    'employee_id', new.employee_id,
    'shift_id', new.id,
    'shift_date', new.shift_date,
    'start_time', coalesce(nullif(trim(new.start_time), ''), '08:00'),
    'end_time', coalesce(nullif(trim(new.end_time), ''), '14:00'),
    'type', 'published'
  );

  perform net.http_post(
    trim(fn_url),
    payload,
    '{}'::jsonb,
    jsonb_build_object(
      'Content-Type', 'application/json',
      'x-internal-secret', trim(secret)
    )
  );

  return new;
exception
  when others then
    return new;
end;
$$;


ALTER FUNCTION "public"."notify_shift_published"() OWNER TO "postgres";


COMMENT ON FUNCTION "public"."notify_shift_published"() IS 'Notifica al empleado solo cuando se publica el turno (published_at pasa de null a valor). No en borrador ni al editar ya publicado.';



CREATE OR REPLACE FUNCTION "public"."permission_scope_matches"("p_scope_type" "public"."permission_scope_type", "p_context_site_id" "uuid", "p_context_area_id" "uuid", "p_scope_site_id" "uuid", "p_scope_area_id" "uuid", "p_scope_site_type" "public"."site_type", "p_scope_area_kind" "text") RETURNS boolean
    LANGUAGE "plpgsql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare
  v_site_type public.site_type;
  v_area_kind text;
begin
  if p_scope_type = 'global' then
    return true;
  end if;

  if p_scope_type = 'site' then
    if p_context_site_id is null then
      return false;
    end if;
    if p_scope_site_id is not null and p_scope_site_id <> p_context_site_id then
      return false;
    end if;
    return public.can_access_site(p_context_site_id);
  end if;

  if p_scope_type = 'site_type' then
    if p_context_site_id is null then
      return false;
    end if;
    if not public.can_access_site(p_context_site_id) then
      return false;
    end if;
    select site_type into v_site_type from public.sites where id = p_context_site_id;
    return v_site_type = p_scope_site_type;
  end if;

  if p_scope_type = 'area' then
    if p_context_area_id is null then
      return false;
    end if;
    if p_scope_area_id is not null and p_scope_area_id <> p_context_area_id then
      return false;
    end if;
    return public.can_access_area(p_context_area_id);
  end if;

  if p_scope_type = 'area_kind' then
    if p_context_area_id is null then
      return false;
    end if;
    if not public.can_access_area(p_context_area_id) then
      return false;
    end if;
    select kind into v_area_kind from public.areas where id = p_context_area_id;
    return v_area_kind = p_scope_area_kind;
  end if;

  return false;
end;
$$;


ALTER FUNCTION "public"."permission_scope_matches"("p_scope_type" "public"."permission_scope_type", "p_context_site_id" "uuid", "p_context_area_id" "uuid", "p_scope_site_id" "uuid", "p_scope_area_id" "uuid", "p_scope_site_type" "public"."site_type", "p_scope_area_kind" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."price_restock_request_internal_transfer"("p_request_id" "uuid") RETURNS "jsonb"
    LANGUAGE "sql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
  select public.value_closed_restock_request(p_request_id);
$$;


ALTER FUNCTION "public"."price_restock_request_internal_transfer"("p_request_id" "uuid") OWNER TO "postgres";


COMMENT ON FUNCTION "public"."price_restock_request_internal_transfer"("p_request_id" "uuid") IS 'Alias expl├¡cito para valorizar una remisi├│n interna recibida/cerrada con precios internos por presentaci├│n.';



CREATE OR REPLACE FUNCTION "public"."process_loyalty_earning"("p_order_id" "uuid") RETURNS "void"
    LANGUAGE "sql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pass'
    AS $$
  select pass.process_loyalty_earning(p_order_id);
$$;


ALTER FUNCTION "public"."process_loyalty_earning"("p_order_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."process_order_payment"("p_order_id" "uuid", "p_site_id" "uuid", "p_payment_method" "text", "p_payment_reference" "text" DEFAULT NULL::"text") RETURNS json
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pos'
    AS $$
declare
  v_order record;
  v_loyalty_points int := 0;
begin
  select * into v_order
  from public.orders
  where id = p_order_id;

  if not found then
    return json_build_object('success', false, 'error', 'Orden no encontrada');
  end if;

  v_loyalty_points := floor(v_order.total_amount / 1000);

  update public.orders
  set status = 'completed',
      payment_status = 'paid',
      loyalty_processed = true,
      loyalty_points_awarded = v_loyalty_points,
      updated_at = now()
  where id = p_order_id;

  insert into pos.pos_payments (
    order_id,
    payment_method,
    amount,
    reference,
    created_at
  ) values (
    p_order_id,
    p_payment_method,
    v_order.total_amount,
    p_payment_reference,
    now()
  );

  if v_order.client_id is not null and v_loyalty_points > 0 then
    update public.users
    set loyalty_points = coalesce(loyalty_points, 0) + v_loyalty_points,
        updated_at = now()
    where id = v_order.client_id;

    insert into public.loyalty_transactions (
      user_id,
      order_id,
      kind,
      points_delta,
      description,
      created_at
    ) values (
      v_order.client_id,
      p_order_id,
      'earn',
      v_loyalty_points,
      'Order paid: loyalty earning',
      now()
    );
  end if;

  return json_build_object(
    'success', true,
    'order_id', p_order_id,
    'loyalty_points_awarded', v_loyalty_points
  );
end;
$$;


ALTER FUNCTION "public"."process_order_payment"("p_order_id" "uuid", "p_site_id" "uuid", "p_payment_method" "text", "p_payment_reference" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."receive_purchase_order"("p_purchase_order_id" "uuid") RETURNS "void"
    LANGUAGE "plpgsql"
    AS $$
DECLARE
  v_po record;
  v_item record;

  v_purchase_unit_size numeric;
  v_received_base_qty numeric;

  v_prev_total_qty numeric;          -- stock TOTAL antes de recibir
  v_existing_cost numeric;
  v_received_unit_cost_base numeric;
  v_new_cost numeric;

  v_line_total numeric;
  v_total_amount numeric := 0;
BEGIN
  -- Lock PO
  SELECT *
  INTO v_po
  FROM public.purchase_orders
  WHERE id = p_purchase_order_id
  FOR UPDATE;

  IF NOT FOUND THEN
    RAISE EXCEPTION 'Purchase order % no existe', p_purchase_order_id;
  END IF;

  IF v_po.status IN ('received', 'completed') THEN
    RAISE EXCEPTION 'Purchase order % ya est├í recibida (status=%)', p_purchase_order_id, v_po.status;
  END IF;

  -- Procesar items recibidos
  FOR v_item IN
    SELECT *
    FROM public.purchase_order_items
    WHERE purchase_order_id = p_purchase_order_id
    ORDER BY created_at ASC
  LOOP
    IF v_item.quantity_received IS NULL OR v_item.quantity_received <= 0 THEN
      CONTINUE;
    END IF;

    -- purchase_unit_size por proveedor+producto
    SELECT ps.purchase_unit_size
    INTO v_purchase_unit_size
    FROM public.product_suppliers ps
    WHERE ps.supplier_id = v_po.supplier_id
      AND ps.product_id = v_item.product_id
    LIMIT 1;

    IF v_purchase_unit_size IS NULL OR v_purchase_unit_size <= 0 THEN
      RAISE EXCEPTION
        'Falta purchase_unit_size en product_suppliers para supplier_id=% product_id=% (PO=%)',
        v_po.supplier_id, v_item.product_id, p_purchase_order_id;
    END IF;

    -- Convertir a unidad base
    v_received_base_qty := v_item.quantity_received * v_purchase_unit_size;

    -- 1) Capturar stock total PREVIO (antes de sumar lo recibido)
    SELECT COALESCE(SUM(current_qty), 0)
    INTO v_prev_total_qty
    FROM public.inventory_stock_by_site
    WHERE product_id = v_item.product_id;

    -- 2) Costo actual (promedio anterior)
    SELECT COALESCE(cost, 0)
    INTO v_existing_cost
    FROM public.products
    WHERE id = v_item.product_id;

    -- 3) Costo recibido en unidad base
    v_received_unit_cost_base := v_item.unit_cost / v_purchase_unit_size;

    -- 4) Nuevo costo promedio ponderado (usando stock previo real)
    IF (v_prev_total_qty + v_received_base_qty) > 0 THEN
      v_new_cost :=
        (
          (v_existing_cost * v_prev_total_qty) +
          (v_received_unit_cost_base * v_received_base_qty)
        )
        / (v_prev_total_qty + v_received_base_qty);
    ELSE
      v_new_cost := v_received_unit_cost_base;
    END IF;

    -- Kardex
    INSERT INTO public.inventory_movements (
      site_id,
      product_id,
      movement_type,
      quantity,
      note,
      related_purchase_order_id,
      related_order_id
    )
    VALUES (
      v_po.site_id,
      v_item.product_id,
      'purchase_in',
      v_received_base_qty,
      'Recepci├│n OC ' || p_purchase_order_id::text,
      p_purchase_order_id,
      NULL
    );

    -- Stock por sede
    INSERT INTO public.inventory_stock_by_site (site_id, product_id, current_qty, updated_at)
    VALUES (v_po.site_id, v_item.product_id, v_received_base_qty, now())
    ON CONFLICT (site_id, product_id)
    DO UPDATE SET
      current_qty = public.inventory_stock_by_site.current_qty + EXCLUDED.current_qty,
      updated_at = now();

    -- Actualizar costo del producto
    UPDATE public.products
    SET cost = v_new_cost,
        updated_at = now()
    WHERE id = v_item.product_id;

    -- Totales PO
    v_line_total := v_item.unit_cost * v_item.quantity_received;
    v_total_amount := v_total_amount + COALESCE(v_line_total, 0);

    UPDATE public.purchase_order_items
    SET line_total = v_line_total
    WHERE id = v_item.id;
  END LOOP;

  UPDATE public.purchase_orders
  SET status = 'received',
      received_at = now(),
      total_amount = v_total_amount
  WHERE id = p_purchase_order_id;

END;
$$;


ALTER FUNCTION "public"."receive_purchase_order"("p_purchase_order_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."reconcile_inventory_stock_positions_for_count"("p_location_id" "uuid", "p_lines" "jsonb", "p_created_by" "uuid" DEFAULT "auth"."uid"(), "p_note" "text" DEFAULT NULL::"text") RETURNS "jsonb"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pg_temp'
    AS $$
declare
  v_location record;
  v_product_id uuid;
  v_total_lines integer := 0;
  v_positioned_lines integer := 0;
  v_positioned_qty numeric := 0;
  v_bad_product_id uuid;
  v_bad_positioned_qty numeric;
  v_bad_location_qty numeric;
begin
  if p_location_id is null then
    raise exception 'location is required';
  end if;

  if jsonb_typeof(coalesce(p_lines, '[]'::jsonb)) <> 'array' then
    raise exception 'p_lines debe ser un arreglo JSON';
  end if;

  select loc.id, loc.site_id, loc.code
    into v_location
  from public.inventory_locations loc
  where loc.id = p_location_id
    and coalesce(loc.is_active, true) = true;

  if not found then
    raise exception 'active LOC not found';
  end if;

  if not public.has_permission('nexo.inventory.stock', v_location.site_id) then
    raise exception 'permission denied';
  end if;

  create temporary table tmp_position_count_lines (
    product_id uuid not null,
    position_id uuid null,
    quantity numeric not null
  ) on commit drop;

  insert into tmp_position_count_lines (product_id, position_id, quantity)
  select
    (entry ->> 'product_id')::uuid,
    nullif(trim(coalesce(entry ->> 'position_id', '')), '')::uuid,
    (entry ->> 'quantity')::numeric
  from jsonb_array_elements(coalesce(p_lines, '[]'::jsonb)) entry
  where nullif(trim(coalesce(entry ->> 'product_id', '')), '') is not null
    and coalesce((entry ->> 'quantity')::numeric, 0) > 0;

  select count(*) into v_total_lines
  from tmp_position_count_lines;

  if v_total_lines = 0 then
    raise exception 'Al menos una linea con cantidad > 0';
  end if;

  if exists (
    select 1
    from tmp_position_count_lines line
    where line.position_id is not null
      and not exists (
        select 1
        from public.inventory_location_positions pos
        where pos.id = line.position_id
          and pos.location_id = p_location_id
          and pos.site_id = v_location.site_id
          and coalesce(pos.is_active, true) = true
      )
  ) then
    raise exception 'Una o mas posiciones internas no pertenecen al LOC del conteo';
  end if;

  create temporary table tmp_position_count_agg (
    product_id uuid not null,
    position_id uuid not null,
    quantity numeric not null,
    primary key (product_id, position_id)
  ) on commit drop;

  insert into tmp_position_count_agg (product_id, position_id, quantity)
  select
    line.product_id,
    line.position_id,
    sum(line.quantity)
  from tmp_position_count_lines line
  where line.position_id is not null
  group by line.product_id, line.position_id
  having sum(line.quantity) > 0;

  for v_product_id in
    select distinct line.product_id
    from tmp_position_count_lines line
  loop
    perform pg_advisory_xact_lock(hashtextextended(p_location_id::text || ':' || v_product_id::text, 0));
  end loop;

  select
    agg.product_id,
    agg.positioned_qty,
    coalesce(stock.current_qty, 0)
  into
    v_bad_product_id,
    v_bad_positioned_qty,
    v_bad_location_qty
  from (
    select
      product_id,
      sum(quantity) as positioned_qty
    from tmp_position_count_agg
    group by product_id
  ) agg
  left join public.inventory_stock_by_location stock
    on stock.location_id = p_location_id
   and stock.product_id = agg.product_id
  where agg.positioned_qty > coalesce(stock.current_qty, 0) + 0.000001
  limit 1;

  if v_bad_product_id is not null then
    raise exception
      'positioned quantity % exceeds LOC stock % for product %',
      v_bad_positioned_qty,
      v_bad_location_qty,
      v_bad_product_id;
  end if;

  delete from public.inventory_stock_by_position stock_pos
  using public.inventory_location_positions pos
  where pos.id = stock_pos.position_id
    and pos.location_id = p_location_id
    and stock_pos.product_id in (
      select distinct line.product_id
      from tmp_position_count_lines line
    );

  insert into public.inventory_stock_by_position (
    position_id,
    product_id,
    current_qty,
    updated_at
  )
  select
    agg.position_id,
    agg.product_id,
    agg.quantity,
    now()
  from tmp_position_count_agg agg
  on conflict (position_id, product_id) do update
    set current_qty = excluded.current_qty,
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
    note,
    created_by
  )
  select
    v_location.site_id,
    agg.product_id,
    'stock_reconcile_position_count',
    agg.quantity,
    agg.quantity,
    coalesce(nullif(product.stock_unit_code, ''), nullif(product.unit, ''), 'un'),
    1,
    coalesce(nullif(product.stock_unit_code, ''), nullif(product.unit, ''), 'un'),
    coalesce(
      nullif(trim(p_note), ''),
      format('Reconciliacion interna por conteo LOC %s', v_location.code)
    ),
    p_created_by
  from tmp_position_count_agg agg
  left join public.products product
    on product.id = agg.product_id;

  select
    count(*),
    coalesce(sum(quantity), 0)
  into
    v_positioned_lines,
    v_positioned_qty
  from tmp_position_count_agg;

  return jsonb_build_object(
    'locationId', p_location_id,
    'totalLines', v_total_lines,
    'positionedLines', v_positioned_lines,
    'positionedQty', v_positioned_qty
  );
end;
$$;


ALTER FUNCTION "public"."reconcile_inventory_stock_positions_for_count"("p_location_id" "uuid", "p_lines" "jsonb", "p_created_by" "uuid", "p_note" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."reconcile_staff_invitations"() RETURNS TABLE("accepted_count" integer, "expired_count" integer)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'auth'
    AS $$
declare
  v_actor_role text;
  v_actor_site_id uuid;
  v_is_global_manager boolean;
begin
  select e.role, e.site_id
    into v_actor_role, v_actor_site_id
  from public.employees e
  where e.id = auth.uid()
    and e.is_active is distinct from false;

  if v_actor_role is null
     or not (v_actor_role = any (array['propietario', 'gerente_general', 'gerente'])) then
    raise exception 'Forbidden' using errcode = '42501';
  end if;

  v_is_global_manager := v_actor_role = any (array['propietario', 'gerente_general']);

  with expired_rows as (
    update public.staff_invitations si
       set status = 'expired',
           expired_at = coalesce(si.expired_at, si.expires_at, now()),
           updated_at = now(),
           metadata = coalesce(si.metadata, '{}'::jsonb)
             || jsonb_build_object(
               'reconciled_by', auth.uid(),
               'reconciled_reason', 'invite_expired'
             )
     where si.status = 'sent'
       and coalesce(si.expires_at, si.expired_at) is not null
       and coalesce(si.expires_at, si.expired_at) < now()
       and (
         v_is_global_manager
         or coalesce(si.site_id, si.staff_site_id) = v_actor_site_id
       )
     returning si.id
  ),
  matched_active_employee as (
    select distinct on (si.id)
      si.id as invitation_id,
      e.id as employee_id
    from public.staff_invitations si
    join public.employees e
      on e.is_active is distinct from false
     and (
       si.auth_user_id = e.id
       or si.employee_id = e.id
       or exists (
         select 1
         from public.users u
         where u.id = e.id
           and si.email is not null
           and lower(u.email) = lower(si.email)
       )
     )
    where si.status in ('sent', 'expired')
      and (
        v_is_global_manager
        or coalesce(si.site_id, si.staff_site_id) = v_actor_site_id
      )
    order by si.id, e.updated_at desc nulls last, e.joined_at desc nulls last
  ),
  accepted_rows as (
    update public.staff_invitations si
       set status = 'accepted',
           accepted_at = coalesce(si.accepted_at, now()),
           auth_user_id = coalesce(si.auth_user_id, m.employee_id),
           employee_id = coalesce(si.employee_id, m.employee_id),
           updated_at = now(),
           metadata = coalesce(si.metadata, '{}'::jsonb)
             || jsonb_build_object(
               'reconciled_by', auth.uid(),
               'reconciled_reason', 'active_employee_exists'
             )
      from matched_active_employee m
     where si.id = m.invitation_id
     returning si.id
  )
  select
    (select count(*)::integer from accepted_rows),
    (select count(*)::integer from expired_rows)
  into accepted_count, expired_count;

  return next;
end;
$$;


ALTER FUNCTION "public"."reconcile_staff_invitations"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."register_shift_departure_event"("p_site_id" "uuid", "p_distance_meters" integer, "p_accuracy_meters" integer DEFAULT NULL::integer, "p_source" "text" DEFAULT 'mobile'::"text", "p_notes" "text" DEFAULT NULL::"text", "p_occurred_at" timestamp with time zone DEFAULT "now"()) RETURNS "jsonb"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare
  v_employee_id uuid := auth.uid();
  v_employee public.employees%rowtype;
  v_shift_site_id uuid;
  v_shift_start_at timestamptz;
  v_event_id uuid;
  v_distance integer := greatest(coalesce(p_distance_meters, 0), 0);
  v_accuracy integer := case
    when p_accuracy_meters is null then null
    else greatest(p_accuracy_meters, 0)
  end;
  v_event_time timestamptz := coalesce(p_occurred_at, now());
begin
  if v_employee_id is null then
    raise exception 'No autenticado';
  end if;

  select *
    into v_employee
  from public.employees
  where id = v_employee_id;

  if not found then
    raise exception 'Empleado no encontrado';
  end if;

  if coalesce(v_employee.is_active, false) is false then
    raise exception 'Empleado inactivo';
  end if;

  select al.site_id, al.occurred_at
    into v_shift_site_id, v_shift_start_at
  from public.attendance_logs al
  where al.employee_id = v_employee_id
    and al.action = 'check_in'
    and not exists (
      select 1
      from public.attendance_logs ao
      where ao.employee_id = al.employee_id
        and ao.action = 'check_out'
        and ao.occurred_at > al.occurred_at
    )
  order by al.occurred_at desc, al.created_at desc
  limit 1;

  if v_shift_start_at is null then
    return jsonb_build_object('inserted', false, 'reason', 'no_open_shift');
  end if;

  if p_site_id is not null and p_site_id is distinct from v_shift_site_id then
    return jsonb_build_object('inserted', false, 'reason', 'site_mismatch');
  end if;

  if exists (
    select 1
    from public.attendance_breaks b
    where b.employee_id = v_employee_id
      and b.ended_at is null
  ) then
    return jsonb_build_object('inserted', false, 'reason', 'on_break');
  end if;

  insert into public.attendance_shift_events (
    employee_id,
    site_id,
    shift_start_at,
    event_type,
    occurred_at,
    distance_meters,
    accuracy_meters,
    source,
    notes
  )
  values (
    v_employee_id,
    coalesce(p_site_id, v_shift_site_id),
    v_shift_start_at,
    'left_site_open_shift',
    v_event_time,
    v_distance,
    v_accuracy,
    coalesce(p_source, 'mobile'),
    p_notes
  )
  on conflict (employee_id, shift_start_at, event_type) do nothing
  returning id
    into v_event_id;

  if v_event_id is null then
    return jsonb_build_object('inserted', false, 'reason', 'already_recorded');
  end if;

  return jsonb_build_object(
    'inserted', true,
    'event_id', v_event_id,
    'shift_start_at', v_shift_start_at
  );
end;
$$;


ALTER FUNCTION "public"."register_shift_departure_event"("p_site_id" "uuid", "p_distance_meters" integer, "p_accuracy_meters" integer, "p_source" "text", "p_notes" "text", "p_occurred_at" timestamp with time zone) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."register_shift_departure_event_autoclose"("p_site_id" "uuid", "p_distance_meters" integer, "p_accuracy_meters" integer DEFAULT NULL::integer, "p_source" "text" DEFAULT 'mobile'::"text", "p_notes" "text" DEFAULT NULL::"text", "p_occurred_at" timestamp with time zone DEFAULT "now"(), "p_auto_checkout_threshold_meters" integer DEFAULT 500) RETURNS "jsonb"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare
  v_employee_id uuid := auth.uid();
  v_employee public.employees%rowtype;
  v_shift_site_id uuid;
  v_shift_start_at timestamptz;
  v_event_id uuid;
  v_distance integer := greatest(coalesce(p_distance_meters, 0), 0);
  v_accuracy integer := case
    when p_accuracy_meters is null then null
    else greatest(p_accuracy_meters, 0)
  end;
  v_event_time timestamptz := coalesce(p_occurred_at, now());
  v_threshold integer := greatest(coalesce(p_auto_checkout_threshold_meters, 500), 100);
  v_is_outside boolean;
  v_auto_checkout_applied boolean := false;
  v_auto_checkout_reason text := null;
begin
  if v_employee_id is null then
    raise exception 'No autenticado';
  end if;

  select *
    into v_employee
  from public.employees
  where id = v_employee_id;

  if not found then
    raise exception 'Empleado no encontrado';
  end if;

  if coalesce(v_employee.is_active, false) is false then
    raise exception 'Empleado inactivo';
  end if;

  select al.site_id, al.occurred_at
    into v_shift_site_id, v_shift_start_at
  from public.attendance_logs al
  where al.employee_id = v_employee_id
    and al.action = 'check_in'
    and not exists (
      select 1
      from public.attendance_logs ao
      where ao.employee_id = al.employee_id
        and ao.action = 'check_out'
        and ao.occurred_at > al.occurred_at
    )
  order by al.occurred_at desc, al.created_at desc
  limit 1;

  if v_shift_start_at is null then
    return jsonb_build_object('inserted', false, 'reason', 'no_open_shift');
  end if;

  if p_site_id is not null and p_site_id is distinct from v_shift_site_id then
    return jsonb_build_object('inserted', false, 'reason', 'site_mismatch');
  end if;

  -- Regla de negocio: no autocerrar turno cuando hay descanso activo.
  if exists (
    select 1
    from public.attendance_breaks b
    where b.employee_id = v_employee_id
      and b.ended_at is null
  ) then
    return jsonb_build_object(
      'inserted', false,
      'reason', 'on_break',
      'auto_checkout_applied', false,
      'auto_checkout_reason', 'on_break'
    );
  end if;

  insert into public.attendance_shift_events (
    employee_id,
    site_id,
    shift_start_at,
    event_type,
    occurred_at,
    distance_meters,
    accuracy_meters,
    source,
    notes
  )
  values (
    v_employee_id,
    coalesce(p_site_id, v_shift_site_id),
    v_shift_start_at,
    'left_site_open_shift',
    v_event_time,
    v_distance,
    v_accuracy,
    coalesce(p_source, 'mobile'),
    p_notes
  )
  on conflict (employee_id, shift_start_at, event_type) do nothing
  returning id
    into v_event_id;

  v_is_outside := (v_distance + coalesce(v_accuracy, 0)) >= v_threshold;

  if v_is_outside then
    begin
      update public.attendance_breaks
      set
        ended_at = coalesce(ended_at, v_event_time),
        end_source = 'system',
        end_notes = coalesce(end_notes, 'Cierre autom├ítico por salida de sede')
      where employee_id = v_employee_id
        and ended_at is null;

      insert into public.attendance_logs (
        employee_id,
        site_id,
        action,
        source,
        latitude,
        longitude,
        accuracy_meters,
        device_info,
        notes,
        occurred_at
      )
      values (
        v_employee_id,
        coalesce(p_site_id, v_shift_site_id),
        'check_out',
        'system',
        null,
        null,
        coalesce(v_accuracy, 0),
        jsonb_build_object(
          'autoCheckout', true,
          'origin', 'departure_monitor',
          'distanceMeters', v_distance,
          'accuracyMeters', v_accuracy,
          'thresholdMeters', v_threshold
        ),
        'Auto check-out por salida de sede',
        v_event_time
      );

      v_auto_checkout_applied := true;
      v_auto_checkout_reason := 'auto_checkout_applied';
    exception
      when others then
        v_auto_checkout_applied := false;
        v_auto_checkout_reason := sqlerrm;
    end;
  else
    v_auto_checkout_reason := 'below_threshold';
  end if;

  return jsonb_build_object(
    'inserted', v_event_id is not null,
    'reason', case when v_event_id is null then 'already_recorded' else null end,
    'event_id', v_event_id,
    'shift_start_at', v_shift_start_at,
    'auto_checkout_applied', v_auto_checkout_applied,
    'auto_checkout_reason', v_auto_checkout_reason,
    'threshold_meters', v_threshold
  );
end;
$$;


ALTER FUNCTION "public"."register_shift_departure_event_autoclose"("p_site_id" "uuid", "p_distance_meters" integer, "p_accuracy_meters" integer, "p_source" "text", "p_notes" "text", "p_occurred_at" timestamp with time zone, "p_auto_checkout_threshold_meters" integer) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."resolve_internal_transfer_price"("p_product_id" "uuid", "p_seller_cost_center_id" "uuid", "p_buyer_cost_center_id" "uuid", "p_buyer_site_id" "uuid", "p_unit_code" "text" DEFAULT NULL::"text", "p_at" timestamp with time zone DEFAULT "now"()) RETURNS TABLE("price_list_id" "uuid", "price_list_item_id" "uuid", "unit_price" numeric, "unit_code" "text", "currency" "text", "priority" integer)
    LANGUAGE "sql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
  select
    resolved.price_list_id,
    resolved.price_list_item_id,
    resolved.unit_price,
    resolved.unit_code,
    resolved.currency,
    resolved.priority
  from public.resolve_internal_transfer_price_for_profile(
    p_product_id,
    p_seller_cost_center_id,
    p_buyer_cost_center_id,
    p_buyer_site_id,
    null,
    p_unit_code,
    p_at
  ) resolved
  limit 1;
$$;


ALTER FUNCTION "public"."resolve_internal_transfer_price"("p_product_id" "uuid", "p_seller_cost_center_id" "uuid", "p_buyer_cost_center_id" "uuid", "p_buyer_site_id" "uuid", "p_unit_code" "text", "p_at" timestamp with time zone) OWNER TO "postgres";


COMMENT ON FUNCTION "public"."resolve_internal_transfer_price"("p_product_id" "uuid", "p_seller_cost_center_id" "uuid", "p_buyer_cost_center_id" "uuid", "p_buyer_site_id" "uuid", "p_unit_code" "text", "p_at" timestamp with time zone) IS 'Returns the best active internal price for product/seller/buyer/unit/date. Priority: buyer cost center, buyer site, general seller price.';



CREATE OR REPLACE FUNCTION "public"."resolve_internal_transfer_price_for_profile"("p_product_id" "uuid", "p_seller_cost_center_id" "uuid", "p_buyer_cost_center_id" "uuid", "p_buyer_site_id" "uuid", "p_uom_profile_id" "uuid" DEFAULT NULL::"uuid", "p_unit_code" "text" DEFAULT NULL::"text", "p_at" timestamp with time zone DEFAULT "now"()) RETURNS TABLE("price_list_id" "uuid", "price_list_item_id" "uuid", "unit_price" numeric, "unit_code" "text", "currency" "text", "priority" integer, "uom_profile_id" "uuid", "pricing_label" "text", "pricing_input_unit_code" "text", "pricing_qty_in_input_unit" numeric, "pricing_qty_in_stock_unit" numeric, "pricing_factor_to_stock" numeric)
    LANGUAGE "sql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
  select
    pl.id as price_list_id,
    pli.id as price_list_item_id,
    pli.unit_price,
    pli.unit_code,
    'COP'::text as currency,
    case
      when pl.buyer_cost_center_id = p_buyer_cost_center_id then 1
      when pl.buyer_site_id = p_buyer_site_id then 2
      when pl.buyer_cost_center_id is null and pl.buyer_site_id is null then 3
      else 9
    end as priority,
    pli.uom_profile_id,
    pli.pricing_label,
    pli.pricing_input_unit_code,
    pli.pricing_qty_in_input_unit,
    pli.pricing_qty_in_stock_unit,
    case
      when coalesce(pli.pricing_qty_in_input_unit, 0) > 0
        then pli.pricing_qty_in_stock_unit / pli.pricing_qty_in_input_unit
      else 1
    end as pricing_factor_to_stock
  from public.internal_price_list_items pli
  join public.internal_price_lists pl
    on pl.id = pli.price_list_id
  where pli.product_id = p_product_id
    and pli.is_active = true
    and pl.is_active = true
    and pl.seller_cost_center_id = p_seller_cost_center_id
    and p_at >= pl.valid_from
    and (pl.valid_to is null or p_at < pl.valid_to)
    and (
      pl.buyer_cost_center_id = p_buyer_cost_center_id
      or pl.buyer_site_id = p_buyer_site_id
      or (pl.buyer_cost_center_id is null and pl.buyer_site_id is null)
    )
    and (
      (
        p_uom_profile_id is not null
        and pli.uom_profile_id = p_uom_profile_id
      )
      or (
        pli.uom_profile_id is null
        and (
          p_unit_code is null
          or btrim(p_unit_code) = ''
          or lower(btrim(pli.unit_code)) = lower(btrim(p_unit_code))
        )
      )
      or (
        p_uom_profile_id is null
        and pli.uom_profile_id is not null
        and (
          p_unit_code is null
          or btrim(p_unit_code) = ''
          or lower(btrim(pli.unit_code)) = lower(btrim(p_unit_code))
        )
      )
    )
  order by
    case
      when p_uom_profile_id is not null and pli.uom_profile_id = p_uom_profile_id then 0
      when pli.uom_profile_id is null then 1
      else 2
    end,
    case
      when pl.buyer_cost_center_id = p_buyer_cost_center_id then 1
      when pl.buyer_site_id = p_buyer_site_id then 2
      when pl.buyer_cost_center_id is null and pl.buyer_site_id is null then 3
      else 9
    end,
    pl.valid_from desc,
    pli.created_at desc
  limit 1;
$$;


ALTER FUNCTION "public"."resolve_internal_transfer_price_for_profile"("p_product_id" "uuid", "p_seller_cost_center_id" "uuid", "p_buyer_cost_center_id" "uuid", "p_buyer_site_id" "uuid", "p_uom_profile_id" "uuid", "p_unit_code" "text", "p_at" timestamp with time zone) OWNER TO "postgres";


COMMENT ON FUNCTION "public"."resolve_internal_transfer_price_for_profile"("p_product_id" "uuid", "p_seller_cost_center_id" "uuid", "p_buyer_cost_center_id" "uuid", "p_buyer_site_id" "uuid", "p_uom_profile_id" "uuid", "p_unit_code" "text", "p_at" timestamp with time zone) IS 'Returns the best active internal price for product/seller/buyer/date, preferring an exact UOM profile/presentation match and falling back to legacy unit_code.';



CREATE OR REPLACE FUNCTION "public"."resolve_product_sku_brand_code"("p_site_id" "uuid") RETURNS "text"
    LANGUAGE "plpgsql" STABLE
    AS $$
declare
  v_site_type text;
  v_site_code text;
begin
  select s.type, s.code
    into v_site_type, v_site_code
  from public.sites s
  where s.id = p_site_id;

  if v_site_type is not null then
    case lower(v_site_type)
      when 'vento_group' then return 'VGR';
      when 'vento_cafe' then return 'VCF';
      when 'saudo' then return 'SAU';
      when 'vaila_vainilla' then return 'VAI';
      when 'catering' then return 'CAT';
    end case;
  end if;

  if v_site_code is null then
    return null;
  end if;

  return upper(regexp_replace(v_site_code, '[^A-Za-z0-9]', '', 'g'));
end;
$$;


ALTER FUNCTION "public"."resolve_product_sku_brand_code"("p_site_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."resolve_product_sku_type_code"("p_product_type" "text") RETURNS "text"
    LANGUAGE "plpgsql" IMMUTABLE
    AS $$
declare
  v_raw text;
  v_clean text;
begin
  v_raw := coalesce(p_product_type, '');
  v_clean := lower(v_raw);

  if v_clean like '%venta%' then
    return 'VEN';
  elsif v_clean like '%insum%' then
    return 'INS';
  elsif v_clean like '%prepar%' then
    return 'PRE';
  elsif v_clean like '%empa%' then
    return 'EMP';
  elsif v_clean like '%limp%' then
    return 'LIM';
  elsif v_clean like '%mant%' then
    return 'MAN';
  elsif v_clean like '%acti%' then
    return 'ACT';
  end if;

  v_clean := regexp_replace(v_clean, '[^a-z0-9]', '', 'g');
  if v_clean = '' then
    return 'GEN';
  end if;

  return upper(substr(v_clean, 1, 3));
end;
$$;


ALTER FUNCTION "public"."resolve_product_sku_type_code"("p_product_type" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."reverse_restock_request"("p_request_id" "uuid") RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare
  v_request public.restock_requests%rowtype;
  v_now timestamptz := timezone('utc', now());
  v_actor uuid := auth.uid();
  v_marker text;
begin
  select *
  into v_request
  from public.restock_requests
  where id = p_request_id;

  if not found then
    raise exception 'request_not_found';
  end if;

  if v_actor is null then
    raise exception 'permission_denied_reverse';
  end if;

  if not public.has_permission('nexo.inventory.remissions.cancel') then
    raise exception 'permission_denied_reverse';
  end if;

  v_marker := '[REVERSA_APLICADA ' || to_char(v_now, 'YYYY-MM-DD"T"HH24:MI:SS"Z"') || ']';

  if coalesce(v_request.notes, '') like '%[REVERSA_APLICADA %' then
    raise exception 'already_reversed';
  end if;

  with movement_net as (
    select
      m.site_id,
      m.product_id,
      sum(
        case
          when m.movement_type = 'transfer_out' then greatest(coalesce(m.quantity, 0), 0)
          when m.movement_type = 'transfer_in' then -greatest(coalesce(m.quantity, 0), 0)
          else 0
        end
      ) as net_qty
    from public.inventory_movements m
    where m.related_restock_request_id = p_request_id
      and m.site_id is not null
      and m.product_id is not null
      and m.movement_type in ('transfer_out', 'transfer_in')
    group by m.site_id, m.product_id
  ),
  reversible_site as (
    select site_id, product_id, net_qty
    from movement_net
    where net_qty > 0
  )
  insert into public.inventory_movements (
    site_id,
    product_id,
    movement_type,
    quantity,
    note,
    related_restock_request_id,
    created_by,
    created_at
  )
  select
    rs.site_id,
    rs.product_id,
    'adjustment_in',
    rs.net_qty,
    'reverse_restock_request',
    p_request_id,
    v_actor,
    v_now
  from reversible_site rs;

  update public.restock_requests
  set
    status = 'cancelled',
    cancelled_at = coalesce(cancelled_at, v_now),
    status_updated_at = v_now,
    notes = trim(
      both E'\n'
      from concat_ws(E'\n', nullif(notes, ''), v_marker)
    )
  where id = p_request_id;
end;
$$;


ALTER FUNCTION "public"."reverse_restock_request"("p_request_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."run_shift_runtime_processor"() RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare
  fn_url text;
  cron_secret text;
begin
  select coalesce(value #>> '{}', '')
  into fn_url
  from public.app_config
  where key = 'shift_runtime_processor_url'
  limit 1;

  if trim(fn_url) = '' then
    return;
  end if;

  select coalesce(secret_value, '')
  into cron_secret
  from public.internal_job_secrets
  where key = 'shift_runtime_processor_cron'
  limit 1;

  perform net.http_post(
    trim(fn_url),
    '{}'::jsonb,
    '{}'::jsonb,
    jsonb_build_object(
      'Content-Type', 'application/json',
      'x-cron-key', trim(coalesce(cron_secret, ''))
    )
  );
end;
$$;


ALTER FUNCTION "public"."run_shift_runtime_processor"() OWNER TO "postgres";


COMMENT ON FUNCTION "public"."run_shift_runtime_processor"() IS 'Dispara la Edge Function shift-runtime-processor con secreto interno para recordatorios y autocierres programados.';



CREATE OR REPLACE FUNCTION "public"."scheduled_auto_close_shift"("p_shift_id" "uuid", "p_triggered_at" timestamp with time zone DEFAULT "now"()) RETURNS "jsonb"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare
  v_shift public.employee_shifts%rowtype;
  v_shift_start_at timestamptz;
  v_check_in public.attendance_logs%rowtype;
  v_existing_check_out public.attendance_logs%rowtype;
  v_closed_breaks int := 0;
begin
  if p_shift_id is null then
    raise exception 'shift_id_required';
  end if;

  select *
  into v_shift
  from public.employee_shifts
  where id = p_shift_id
  for update;

  if not found then
    return jsonb_build_object(
      'applied', false,
      'reason', 'shift_not_found'
    );
  end if;

  if v_shift.published_at is null then
    return jsonb_build_object(
      'applied', false,
      'reason', 'shift_not_published'
    );
  end if;

  if coalesce(v_shift.status, '') = 'cancelled' then
    return jsonb_build_object(
      'applied', false,
      'reason', 'shift_cancelled'
    );
  end if;

  v_shift_start_at := make_timestamptz(
    extract(year from v_shift.shift_date)::int,
    extract(month from v_shift.shift_date)::int,
    extract(day from v_shift.shift_date)::int,
    extract(hour from v_shift.start_time)::int,
    extract(minute from v_shift.start_time)::int,
    extract(second from v_shift.start_time),
    'America/Bogota'
  );

  select *
  into v_check_in
  from public.attendance_logs
  where employee_id = v_shift.employee_id
    and site_id = v_shift.site_id
    and action = 'check_in'
    and occurred_at >= v_shift_start_at - interval '6 hours'
    and occurred_at <= p_triggered_at
    and (shift_id = p_shift_id or shift_id is null)
  order by
    case when shift_id = p_shift_id then 0 else 1 end,
    occurred_at desc
  limit 1;

  if not found then
    return jsonb_build_object(
      'applied', false,
      'reason', 'no_check_in'
    );
  end if;

  select *
  into v_existing_check_out
  from public.attendance_logs
  where employee_id = v_shift.employee_id
    and site_id = v_shift.site_id
    and action = 'check_out'
    and occurred_at >= v_check_in.occurred_at
    and occurred_at <= p_triggered_at
    and (shift_id = p_shift_id or shift_id is null)
  order by occurred_at asc
  limit 1;

  if found then
    return jsonb_build_object(
      'applied', false,
      'reason', 'already_closed',
      'check_out_at', v_existing_check_out.occurred_at
    );
  end if;

  update public.attendance_breaks
  set ended_at = p_triggered_at
  where employee_id = v_shift.employee_id
    and ended_at is null
    and started_at >= v_check_in.occurred_at;

  get diagnostics v_closed_breaks = row_count;

  insert into public.attendance_logs (
    employee_id,
    site_id,
    action,
    occurred_at,
    source,
    latitude,
    longitude,
    accuracy_meters,
    notes,
    device_info,
    client_event_id,
    shift_id
  )
  values (
    v_shift.employee_id,
    v_shift.site_id,
    'check_out',
    p_triggered_at,
    'system',
    null,
    null,
    null,
    'Auto check-out por fin programado del turno',
    jsonb_build_object(
      'scheduledAutoCheckout', true,
      'closedOpenBreaks', v_closed_breaks
    ),
    null,
    p_shift_id
  );

  return jsonb_build_object(
    'applied', true,
    'reason', 'auto_closed',
    'check_in_at', v_check_in.occurred_at,
    'check_out_at', p_triggered_at,
    'closed_breaks', v_closed_breaks
  );
end;
$$;


ALTER FUNCTION "public"."scheduled_auto_close_shift"("p_shift_id" "uuid", "p_triggered_at" timestamp with time zone) OWNER TO "postgres";


COMMENT ON FUNCTION "public"."scheduled_auto_close_shift"("p_shift_id" "uuid", "p_triggered_at" timestamp with time zone) IS 'Autocierra un turno programado abierto usando la hora de ejecuci├│n como check-out del sistema.';



CREATE OR REPLACE FUNCTION "public"."seed_catalog_items_from_sell_products"("p_site_id" "uuid" DEFAULT NULL::"uuid", "p_only_missing" boolean DEFAULT true) RETURNS "jsonb"
    LANGUAGE "sql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pass'
    AS $$
  select pass.seed_catalog_items_from_sell_products(p_site_id, p_only_missing);
$$;


ALTER FUNCTION "public"."seed_catalog_items_from_sell_products"("p_site_id" "uuid", "p_only_missing" boolean) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."set_app_navigation_items_updated_at"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
begin
  new.updated_at = now();
  return new;
end;
$$;


ALTER FUNCTION "public"."set_app_navigation_items_updated_at"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."set_employee_kiosk_pin"("p_employee_id" "uuid", "p_pin" "text") RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'extensions'
    AS $_$
declare
  v_pin text := btrim(coalesce(p_pin, ''));
begin
  if p_employee_id is null then
    raise exception 'Trabajador invalido.';
  end if;

  if v_pin !~ '^[0-9]{4,8}$' then
    raise exception 'El PIN debe tener entre 4 y 8 digitos.';
  end if;

  update public.employees
  set pin_code_hash = crypt(v_pin, gen_salt('bf')),
      pin_code = null
  where id = p_employee_id;

  if not found then
    raise exception 'Trabajador no encontrado.';
  end if;
end;
$_$;


ALTER FUNCTION "public"."set_employee_kiosk_pin"("p_employee_id" "uuid", "p_pin" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."set_internal_price_item_uom_snapshot"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pg_temp'
    AS $$
declare
  v_profile record;
  v_should_refresh_snapshot boolean := false;
begin
  if new.uom_profile_id is null then
    return new;
  end if;

  select
    profile.id,
    profile.product_id,
    profile.label,
    profile.input_unit_code,
    profile.qty_in_input_unit,
    profile.qty_in_stock_unit,
    profile.is_active
    into v_profile
  from public.product_uom_profiles profile
  where profile.id = new.uom_profile_id;

  if not found then
    raise exception 'uom profile not found';
  end if;

  if v_profile.product_id <> new.product_id then
    raise exception 'uom profile does not belong to internal price product';
  end if;

  if coalesce(v_profile.is_active, false) <> true then
    raise exception 'uom profile is inactive';
  end if;

  if coalesce(v_profile.qty_in_input_unit, 0) <= 0
     or coalesce(v_profile.qty_in_stock_unit, 0) <= 0 then
    raise exception 'uom profile conversion must be positive';
  end if;

  v_should_refresh_snapshot :=
    tg_op = 'INSERT'
    or new.uom_profile_id is distinct from old.uom_profile_id;

  if v_should_refresh_snapshot then
    new.pricing_label := v_profile.label;
    new.pricing_input_unit_code := v_profile.input_unit_code;
    new.pricing_qty_in_input_unit := v_profile.qty_in_input_unit;
    new.pricing_qty_in_stock_unit := v_profile.qty_in_stock_unit;
    new.unit_code := v_profile.input_unit_code;
  else
    new.pricing_label := coalesce(nullif(btrim(new.pricing_label), ''), v_profile.label);
    new.pricing_input_unit_code := coalesce(
      nullif(btrim(new.pricing_input_unit_code), ''),
      v_profile.input_unit_code
    );
    new.pricing_qty_in_input_unit := coalesce(
      new.pricing_qty_in_input_unit,
      v_profile.qty_in_input_unit
    );
    new.pricing_qty_in_stock_unit := coalesce(
      new.pricing_qty_in_stock_unit,
      v_profile.qty_in_stock_unit
    );
    new.unit_code := coalesce(nullif(btrim(new.unit_code), ''), v_profile.input_unit_code);
  end if;

  return new;
end;
$$;


ALTER FUNCTION "public"."set_internal_price_item_uom_snapshot"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."set_product_sku"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
begin
  if new.sku is null or btrim(new.sku) = '' then
    new.sku := public.generate_product_sku(new.product_type, null);
  end if;
  return new;
end;
$$;


ALTER FUNCTION "public"."set_product_sku"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."set_production_batch_code"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
begin
  if new.id is null then
    new.id := gen_random_uuid();
  end if;

  if new.batch_code is null or btrim(new.batch_code) = '' then
    new.batch_code := 'BATCH-' || upper(substr(replace(new.id::text, '-', ''), 1, 8));
  end if;

  return new;
end;
$$;


ALTER FUNCTION "public"."set_production_batch_code"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."set_updated_at"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
begin
  new.updated_at = now();
  return new;
end;
$$;


ALTER FUNCTION "public"."set_updated_at"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."split_restock_request_item"("p_item_id" "uuid", "p_split_quantity" numeric) RETURNS "uuid"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare
  v_item public.restock_request_items%rowtype;
  v_request public.restock_requests%rowtype;
  v_original_quantity numeric;
  v_split_quantity numeric;
  v_split_ratio numeric;
  v_split_input_qty numeric;
  v_remaining_input_qty numeric;
  v_split_transfer_total numeric;
  v_remaining_transfer_total numeric;
  v_new_item_id uuid;
begin
  v_split_quantity := coalesce(p_split_quantity, 0);

  select *
  into v_item
  from public.restock_request_items
  where id = p_item_id;

  if v_item.id is null then
    raise exception 'Linea de remision no encontrada.';
  end if;

  select *
  into v_request
  from public.restock_requests
  where id = v_item.request_id;

  if v_request.id is null then
    raise exception 'Remision no encontrada para la linea indicada.';
  end if;

  if v_request.from_site_id is null then
    raise exception 'La remision no tiene sede origen.';
  end if;

  if v_request.status not in ('pending', 'preparing') then
    raise exception 'Solo puedes partir lineas en remisiones pendientes o preparando.';
  end if;

  if not public.has_permission('nexo.inventory.remissions.prepare', v_request.from_site_id) then
    raise exception 'No tienes permiso para partir lineas en esta remision.';
  end if;

  v_original_quantity := coalesce(v_item.quantity, 0);

  if v_original_quantity <= 0 then
    raise exception 'La linea no tiene cantidad valida para partir.';
  end if;

  if v_split_quantity <= 0 then
    raise exception 'La cantidad a partir debe ser mayor que cero.';
  end if;

  if v_split_quantity >= v_original_quantity then
    raise exception 'La cantidad a partir debe ser menor que la cantidad actual.';
  end if;

  if coalesce(v_item.prepared_quantity, 0) <> 0
     or coalesce(v_item.shipped_quantity, 0) <> 0
     or coalesce(v_item.received_quantity, 0) <> 0
     or coalesce(v_item.shortage_quantity, 0) <> 0 then
    raise exception 'Solo puedes partir lineas que todavia no tengan preparacion, envio, recepcion ni faltantes.';
  end if;

  v_split_ratio := v_split_quantity / v_original_quantity;
  v_split_input_qty := case
    when v_item.input_qty is null then null
    else v_item.input_qty * v_split_ratio
  end;
  v_remaining_input_qty := case
    when v_item.input_qty is null then null
    else v_item.input_qty - v_split_input_qty
  end;
  v_split_transfer_total := case
    when v_item.transfer_total is null then null
    else v_item.transfer_total * v_split_ratio
  end;
  v_remaining_transfer_total := case
    when v_item.transfer_total is null then null
    else v_item.transfer_total - v_split_transfer_total
  end;

  insert into public.restock_request_items (
    request_id,
    product_id,
    quantity,
    unit,
    transfer_unit_price,
    transfer_currency,
    transfer_total,
    input_qty,
    input_unit_code,
    conversion_factor_to_stock,
    stock_unit_code,
    production_area_kind,
    source_location_id,
    prepared_quantity,
    shipped_quantity,
    received_quantity,
    shortage_quantity,
    item_status,
    notes
  )
  values (
    v_item.request_id,
    v_item.product_id,
    v_split_quantity,
    v_item.unit,
    v_item.transfer_unit_price,
    v_item.transfer_currency,
    v_split_transfer_total,
    v_split_input_qty,
    v_item.input_unit_code,
    v_item.conversion_factor_to_stock,
    v_item.stock_unit_code,
    v_item.production_area_kind,
    null,
    0,
    0,
    0,
    0,
    coalesce(v_item.item_status, 'pending'),
    v_item.notes
  )
  returning id into v_new_item_id;

  update public.restock_request_items
  set
    quantity = v_original_quantity - v_split_quantity,
    input_qty = v_remaining_input_qty,
    transfer_total = v_remaining_transfer_total
  where id = v_item.id;

  return v_new_item_id;
end;
$$;


ALTER FUNCTION "public"."split_restock_request_item"("p_item_id" "uuid", "p_split_quantity" numeric) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."start_attendance_break"("p_site_id" "uuid", "p_source" "text" DEFAULT 'mobile'::"text", "p_notes" "text" DEFAULT NULL::"text") RETURNS "public"."attendance_breaks"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare
  v_employee public.employees%rowtype;
  v_last_action text;
  v_last_site_id uuid;
  v_result public.attendance_breaks%rowtype;
begin
  if auth.uid() is null then
    raise exception 'No autenticado';
  end if;

  select *
    into v_employee
  from public.employees
  where id = auth.uid();

  if not found then
    raise exception 'Empleado no encontrado';
  end if;

  if coalesce(v_employee.is_active, false) is false then
    raise exception 'Empleado inactivo';
  end if;

  select action, site_id
    into v_last_action, v_last_site_id
  from public.attendance_logs
  where employee_id = v_employee.id
  order by occurred_at desc, created_at desc
  limit 1;

  if v_last_action is distinct from 'check_in' then
    raise exception 'No hay un turno activo para iniciar descanso';
  end if;

  if p_site_id is not null and p_site_id is distinct from v_last_site_id then
    raise exception 'La sede del descanso no coincide con el turno activo';
  end if;

  if exists (
    select 1
    from public.attendance_breaks b
    where b.employee_id = v_employee.id
      and b.ended_at is null
  ) then
    raise exception 'Ya tienes un descanso activo';
  end if;

  insert into public.attendance_breaks (
    employee_id,
    site_id,
    started_at,
    start_source,
    start_notes
  )
  values (
    v_employee.id,
    coalesce(p_site_id, v_last_site_id),
    now(),
    coalesce(p_source, 'mobile'),
    p_notes
  )
  returning *
    into v_result;

  return v_result;
end;
$$;


ALTER FUNCTION "public"."start_attendance_break"("p_site_id" "uuid", "p_source" "text", "p_notes" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."sync_attendance_events"("p_events" "jsonb") RETURNS TABLE("event_id" "text", "result" "text", "message" "text")
    LANGUAGE "plpgsql"
    SET "search_path" TO 'public'
    AS $$
declare
  v_employee_id uuid := auth.uid();
  v_item jsonb;
  v_event_id text;
  v_action text;
  v_site_id uuid;
  v_occurred_at timestamptz;
  v_lat numeric;
  v_lng numeric;
  v_accuracy numeric;
  v_source text;
  v_notes text;
  v_device_info jsonb;
  v_shift_id uuid;
begin
  if v_employee_id is null then
    raise exception 'auth.uid() is null';
  end if;

  if p_events is null or jsonb_typeof(p_events) <> 'array' then
    raise exception 'p_events must be a json array';
  end if;

  for v_item in select value from jsonb_array_elements(p_events)
  loop
    v_event_id := nullif(trim(coalesce(v_item ->> 'eventId', v_item ->> 'event_id', '')), '');
    v_action := lower(trim(coalesce(v_item ->> 'eventType', v_item ->> 'event_type', v_item ->> 'action', '')));
    v_source := nullif(trim(coalesce(v_item ->> 'source', 'mobile')), '');
    v_notes := nullif(trim(coalesce(v_item ->> 'notes', '')), '');
    v_occurred_at := coalesce(
      nullif(v_item ->> 'occurredAt', '')::timestamptz,
      nullif(v_item ->> 'occurred_at', '')::timestamptz,
      now()
    );
    v_site_id := nullif(coalesce(v_item ->> 'siteId', v_item ->> 'site_id', ''), '')::uuid;
    v_lat := nullif(coalesce(v_item #>> '{geoSnapshot,lat}', v_item ->> 'latitude', ''), '')::numeric;
    v_lng := nullif(coalesce(v_item #>> '{geoSnapshot,lng}', v_item ->> 'longitude', ''), '')::numeric;
    v_accuracy := nullif(
      coalesce(v_item #>> '{geoSnapshot,accuracy}', v_item ->> 'accuracy_meters', ''),
      ''
    )::numeric;
    v_device_info := coalesce(v_item -> 'deviceInfo', v_item -> 'device_info', '{}'::jsonb);
    v_shift_id := nullif(coalesce(v_item ->> 'shiftId', v_item ->> 'shift_id', ''), '')::uuid;

    if v_event_id is null then
      return query select null::text, 'error'::text, 'event_id missing'::text;
      continue;
    end if;

    if v_action not in ('check_in', 'check_out') then
      return query select v_event_id, 'error'::text, 'event_type not supported'::text;
      continue;
    end if;

    if v_site_id is null then
      return query select v_event_id, 'error'::text, 'site_id missing'::text;
      continue;
    end if;

    begin
      insert into public.attendance_logs (
        employee_id,
        site_id,
        action,
        occurred_at,
        source,
        latitude,
        longitude,
        accuracy_meters,
        notes,
        device_info,
        client_event_id,
        shift_id
      )
      values (
        v_employee_id,
        v_site_id,
        v_action,
        v_occurred_at,
        coalesce(v_source, 'mobile'),
        v_lat,
        v_lng,
        v_accuracy,
        v_notes,
        jsonb_set(coalesce(v_device_info, '{}'::jsonb), '{clientEventId}', to_jsonb(v_event_id), true),
        v_event_id,
        v_shift_id
      );

      return query select v_event_id, 'applied'::text, null::text;
    exception
      when unique_violation then
        return query select v_event_id, 'duplicate'::text, 'Evento ya aplicado previamente.'::text;
      when others then
        insert into public.attendance_sync_conflicts (
          employee_id,
          event_id,
          event_type,
          site_id,
          occurred_at,
          reason,
          payload
        )
        values (
          v_employee_id,
          v_event_id,
          v_action,
          v_site_id::text,
          v_occurred_at,
          sqlerrm,
          v_item
        );

        if sqlstate = 'P0001' then
          return query select v_event_id, 'conflict'::text, sqlerrm;
        else
          return query select v_event_id, 'error'::text, sqlerrm;
        end if;
    end;
  end loop;
end;
$$;


ALTER FUNCTION "public"."sync_attendance_events"("p_events" "jsonb") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."sync_order_fulfillment_state"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
begin
  if new.fulfillment_type = 'delivery' then
    if coalesce(new.dispatch_status, '') = '' or new.dispatch_status = 'not_required' then
      new.dispatch_status := 'pending';
    end if;
  else
    new.dispatch_status := 'not_required';
  end if;

  if new.status = 'confirmed' and new.confirmed_at is null then
    new.confirmed_at := now();
  end if;

  if new.status = 'ready_for_dispatch' and new.ready_for_dispatch_at is null then
    new.ready_for_dispatch_at := now();
  end if;

  if new.status = 'on_the_way' and new.on_the_way_at is null then
    new.on_the_way_at := now();
    if new.fulfillment_type = 'delivery' then
      new.dispatch_status := 'on_the_way';
    end if;
  end if;

  if new.status = 'delivered' and new.delivered_at is null then
    new.delivered_at := now();
    if new.fulfillment_type = 'delivery' then
      new.dispatch_status := 'delivered';
    end if;
  end if;

  if new.status = 'cancelled' and new.cancelled_at is null then
    new.cancelled_at := now();
    if new.fulfillment_type = 'delivery' then
      new.dispatch_status := 'cancelled';
    end if;
  end if;

  return new;
end
$$;


ALTER FUNCTION "public"."sync_order_fulfillment_state"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."sync_restock_item_status_trigger"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
begin
  new.item_status := public.compute_restock_item_status(
    new.quantity,
    new.prepared_quantity,
    new.shipped_quantity,
    new.received_quantity,
    new.shortage_quantity
  );
  return new;
end;
$$;


ALTER FUNCTION "public"."sync_restock_item_status_trigger"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."sync_restock_request_status_from_items"("p_request_id" "uuid") RETURNS "text"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare
  v_request public.restock_requests%rowtype;
  v_has_items boolean := false;
  v_any_prepared boolean := false;
  v_any_shipped boolean := false;
  v_any_accounted boolean := false;
  v_all_shipped_fully_received boolean := true;
  v_next_status text := 'pending';
begin
  select *
  into v_request
  from public.restock_requests
  where id = p_request_id;

  if v_request.id is null then
    return null;
  end if;

  if v_request.status in ('cancelled', 'closed') then
    return v_request.status;
  end if;

  select
    count(*) > 0,
    bool_or(coalesce(prepared_quantity, 0) > 0),
    bool_or(coalesce(shipped_quantity, 0) > 0),
    bool_or(coalesce(received_quantity, 0) + coalesce(shortage_quantity, 0) > 0),
    bool_and(
      case
        when coalesce(shipped_quantity, 0) > 0
          then coalesce(received_quantity, 0) = coalesce(shipped_quantity, 0)
        else true
      end
    )
  into
    v_has_items,
    v_any_prepared,
    v_any_shipped,
    v_any_accounted,
    v_all_shipped_fully_received
  from public.restock_request_items
  where request_id = p_request_id;

  if not v_has_items then
    v_next_status := 'pending';
  elsif v_any_shipped then
    if coalesce(v_all_shipped_fully_received, false) then
      v_next_status := 'received';
    elsif v_any_accounted then
      v_next_status := 'partial';
    else
      v_next_status := 'in_transit';
    end if;
  elsif v_any_prepared then
    v_next_status := 'preparing';
  else
    v_next_status := 'pending';
  end if;

  update public.restock_requests
  set
    status = v_next_status,
    received_at = case
      when v_next_status in ('partial', 'received')
        then coalesce(received_at, now())
      else received_at
    end,
    status_updated_at = now()
  where id = p_request_id;

  return v_next_status;
end;
$$;


ALTER FUNCTION "public"."sync_restock_request_status_from_items"("p_request_id" "uuid") OWNER TO "postgres";


COMMENT ON FUNCTION "public"."sync_restock_request_status_from_items"("p_request_id" "uuid") IS 'Recalcula el estado de una remisi├│n con base en las cantidades preparadas, enviadas, recibidas y faltantes de sus l├¡neas.';



CREATE OR REPLACE FUNCTION "public"."tg_set_updated_at"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
begin
  new.updated_at := now();
  return new;
end $$;


ALTER FUNCTION "public"."tg_set_updated_at"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."touch_order_conversation_from_message"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
begin
  update public.order_conversations
  set
    last_message_at = new.created_at,
    status = case
      when new.author_type = 'client' then 'waiting_staff'
      when new.author_type = 'staff' then 'waiting_client'
      else status
    end,
    last_client_read_at = case
      when new.author_type = 'client' then new.created_at
      else last_client_read_at
    end,
    last_staff_read_at = case
      when new.author_type = 'staff' then new.created_at
      else last_staff_read_at
    end,
    updated_at = now()
  where id = new.conversation_id;

  return new;
end;
$$;


ALTER FUNCTION "public"."touch_order_conversation_from_message"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."touch_updated_at"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
begin
  new.updated_at := timezone('utc', now());
  return new;
end;
$$;


ALTER FUNCTION "public"."touch_updated_at"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."trg_sync_restock_request_status_from_items"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare
  v_request_id uuid;
begin
  v_request_id := coalesce(new.request_id, old.request_id);

  if v_request_id is not null then
    perform public.sync_restock_request_status_from_items(v_request_id);
  end if;

  return coalesce(new, old);
end;
$$;


ALTER FUNCTION "public"."trg_sync_restock_request_status_from_items"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."update_employee_shifts_updated_at"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."update_employee_shifts_updated_at"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."update_loyalty_balance"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
BEGIN
  -- Si insertamos una transacci├│n, sumamos/restamos al saldo del usuario
  IF (TG_OP = 'INSERT') THEN
    UPDATE public.users
    SET loyalty_points = loyalty_points + NEW.points_delta,
        updated_at = now()
    WHERE id = NEW.user_id;
  END IF;
  RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."update_loyalty_balance"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."update_order_operational_state"("p_order_id" "uuid", "p_site_id" "uuid", "p_operation" "text", "p_dispatch_partner" "text" DEFAULT NULL::"text", "p_dispatch_reference" "text" DEFAULT NULL::"text", "p_metadata" "jsonb" DEFAULT '{}'::"jsonb") RETURNS "jsonb"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare
  v_uid uuid := auth.uid();
  v_order public.orders%rowtype;
  v_permission boolean := false;
  v_operation text := lower(trim(coalesce(p_operation, '')));
  v_from_status text;
  v_to_status text;
  v_from_dispatch text;
  v_to_dispatch text;
  v_partner text;
  v_reference text;
  v_event_id uuid;
begin
  if v_uid is null then
    raise exception 'authentication_required';
  end if;

  select public.has_permission('pulso.pos.main', p_site_id, null)
  into v_permission;

  if not coalesce(v_permission, false) then
    raise exception 'permission_denied';
  end if;

  select *
  into v_order
  from public.orders o
  where o.id = p_order_id
    and o.site_id = p_site_id
  for update;

  if v_order.id is null then
    raise exception 'order_not_found';
  end if;

  if v_operation <> 'mark_cancelled'
    and v_order.fulfillment_type = 'delivery'
    and coalesce(v_order.payment_status, 'unpaid') <> 'paid' then
    raise exception 'payment_not_approved';
  end if;

  if v_operation <> 'mark_cancelled'
    and coalesce(v_order.fulfillment_type, '') <> 'delivery'
    and coalesce(v_order.payment_status, 'unpaid') not in ('paid', 'not_required') then
    raise exception 'payment_not_allowed_for_operation';
  end if;

  v_from_status := coalesce(v_order.status, 'pending');
  v_from_dispatch := coalesce(v_order.dispatch_status, 'not_required');
  v_to_status := v_from_status;
  v_to_dispatch := v_from_dispatch;
  v_partner := v_order.dispatch_partner;
  v_reference := v_order.dispatch_reference;

  if v_operation = 'mark_preparing' then
    if v_from_status not in ('pending', 'confirmed') then
      raise exception 'invalid_transition:mark_preparing';
    end if;
    v_to_status := 'preparing';

  elsif v_operation = 'mark_ready' then
    if v_from_status not in ('pending', 'confirmed', 'preparing') then
      raise exception 'invalid_transition:mark_ready';
    end if;
    v_to_status := 'ready_for_dispatch';
    if v_order.fulfillment_type = 'delivery'
      and v_to_dispatch in ('not_required', 'pending', 'scheduled') then
      v_to_dispatch := 'pending';
    end if;

  elsif v_operation = 'mark_in_transit' then
    if v_order.fulfillment_type <> 'delivery' then
      raise exception 'invalid_fulfillment_for_in_transit';
    end if;
    if v_from_status not in ('ready_for_dispatch', 'on_the_way', 'in_transit') then
      raise exception 'invalid_transition:mark_in_transit';
    end if;
    v_to_status := 'on_the_way';
    v_to_dispatch := 'on_the_way';

  elsif v_operation = 'mark_delivered' then
    if v_from_status = 'cancelled' then
      raise exception 'invalid_transition:mark_delivered';
    end if;
    v_to_status := 'delivered';
    if v_order.fulfillment_type = 'delivery' then
      v_to_dispatch := 'delivered';
    else
      v_to_dispatch := 'not_required';
    end if;

  elsif v_operation = 'mark_cancelled' then
    if v_from_status = 'delivered' then
      raise exception 'invalid_transition:mark_cancelled';
    end if;
    v_to_status := 'cancelled';
    if v_order.fulfillment_type = 'delivery' then
      v_to_dispatch := 'cancelled';
    else
      v_to_dispatch := 'not_required';
    end if;

  elsif v_operation = 'assign_dispatch' then
    if v_order.fulfillment_type <> 'delivery' then
      raise exception 'invalid_fulfillment_for_assign_dispatch';
    end if;
    if v_from_status in ('delivered', 'cancelled') then
      raise exception 'invalid_transition:assign_dispatch';
    end if;

    if nullif(trim(coalesce(p_dispatch_partner, '')), '') is null
       and nullif(trim(coalesce(p_dispatch_reference, '')), '') is null then
      raise exception 'dispatch_partner_or_reference_required';
    end if;

    if nullif(trim(coalesce(p_dispatch_partner, '')), '') is not null then
      v_partner := trim(p_dispatch_partner);
    end if;

    if nullif(trim(coalesce(p_dispatch_reference, '')), '') is not null then
      v_reference := trim(p_dispatch_reference);
    end if;

    if v_to_dispatch in ('not_required', 'pending', 'scheduled') then
      v_to_dispatch := 'assigned';
    end if;

  else
    raise exception 'invalid_operation';
  end if;

  update public.orders
  set
    status = v_to_status,
    dispatch_status = v_to_dispatch,
    dispatch_partner = v_partner,
    dispatch_reference = v_reference,
    updated_at = now()
  where id = v_order.id;

  insert into public.order_status_events (
    order_id,
    site_id,
    changed_by,
    actor_type,
    operation,
    from_status,
    to_status,
    from_dispatch_status,
    to_dispatch_status,
    dispatch_partner,
    dispatch_reference,
    metadata
  )
  values (
    v_order.id,
    v_order.site_id,
    v_uid,
    'staff',
    v_operation,
    v_from_status,
    v_to_status,
    v_from_dispatch,
    v_to_dispatch,
    v_partner,
    v_reference,
    coalesce(p_metadata, '{}'::jsonb)
  )
  returning id into v_event_id;

  return jsonb_build_object(
    'ok', true,
    'event_id', v_event_id,
    'order_id', v_order.id,
    'site_id', v_order.site_id,
    'operation', v_operation,
    'status', v_to_status,
    'dispatch_status', v_to_dispatch,
    'dispatch_partner', v_partner,
    'dispatch_reference', v_reference
  );
end;
$$;


ALTER FUNCTION "public"."update_order_operational_state"("p_order_id" "uuid", "p_site_id" "uuid", "p_operation" "text", "p_dispatch_partner" "text", "p_dispatch_reference" "text", "p_metadata" "jsonb") OWNER TO "postgres";


COMMENT ON FUNCTION "public"."update_order_operational_state"("p_order_id" "uuid", "p_site_id" "uuid", "p_operation" "text", "p_dispatch_partner" "text", "p_dispatch_reference" "text", "p_metadata" "jsonb") IS 'Actualiza estado operativo de pedidos. Domicilio exige pago aprobado; recoger y en sitio permiten pago no requerido.';



CREATE OR REPLACE FUNCTION "public"."update_updated_at"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."update_updated_at"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."upsert_inventory_stock_by_location"("p_location_id" "uuid", "p_product_id" "uuid", "p_delta" numeric) RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare
  v_site_id uuid;
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
    or public.has_permission('nexo.inventory.entries', v_site_id)
    or public.has_permission('nexo.inventory.entries_emergency', v_site_id)
    or public.has_permission('nexo.inventory.transfers', v_site_id)
    or public.has_permission('nexo.inventory.withdraw', v_site_id)
    or public.has_permission('nexo.inventory.counts', v_site_id)
    or public.has_permission('nexo.inventory.adjustments', v_site_id)
    or public.has_permission('origo.procurement.receipts', v_site_id)
    or public.has_permission('fogo.production.batches', v_site_id)
  ) then
    raise exception 'permission denied';
  end if;

  insert into public.inventory_stock_by_location (location_id, product_id, current_qty, updated_at)
  values (p_location_id, p_product_id, p_delta, now())
  on conflict (location_id, product_id) do update
    set current_qty = public.inventory_stock_by_location.current_qty + excluded.current_qty,
        updated_at = now();
end;
$$;


ALTER FUNCTION "public"."upsert_inventory_stock_by_location"("p_location_id" "uuid", "p_product_id" "uuid", "p_delta" numeric) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."upsert_inventory_stock_by_uom_profile"("p_location_id" "uuid", "p_product_id" "uuid", "p_uom_profile_id" "uuid", "p_presentation_delta" numeric, "p_base_delta" numeric, "p_location_position_id" "uuid" DEFAULT NULL::"uuid") RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pg_temp'
    AS $$
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
    abs(coalesce(p_presentation_delta, 0)),
    abs(coalesce(p_base_delta, 0))
  ) checked;

  if not (
    public.has_permission('nexo.inventory.stock', v_site_id)
    or public.has_permission('nexo.inventory.entries', v_site_id)
    or public.has_permission('nexo.inventory.transfers', v_site_id)
    or public.has_permission('nexo.inventory.withdraw', v_site_id)
    or public.has_permission('nexo.inventory.remissions.prepare', v_site_id)
    or public.has_permission('nexo.inventory.remissions.receive', v_site_id)
  ) then
    raise exception 'permission denied';
  end if;

  perform pg_advisory_xact_lock(hashtextextended(p_location_id::text || ':' || p_product_id::text || ':' || p_uom_profile_id::text || ':' || coalesce(p_location_position_id::text, ''), 0));

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
      coalesce(p_presentation_delta, 0),
      coalesce(p_base_delta, 0),
      now()
    )
    on conflict (location_id, product_id, uom_profile_id) where location_position_id is null do update
      set presentation_qty = public.inventory_stock_by_uom_profile.presentation_qty + excluded.presentation_qty,
          base_qty = public.inventory_stock_by_uom_profile.base_qty + excluded.base_qty,
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
      coalesce(p_presentation_delta, 0),
      coalesce(p_base_delta, 0),
      now()
    )
    on conflict (location_id, location_position_id, product_id, uom_profile_id) where location_position_id is not null do update
      set presentation_qty = public.inventory_stock_by_uom_profile.presentation_qty + excluded.presentation_qty,
          base_qty = public.inventory_stock_by_uom_profile.base_qty + excluded.base_qty,
          site_id = excluded.site_id,
          updated_at = now();
  end if;

  if exists (
    select 1
    from public.inventory_stock_by_uom_profile stock
    where stock.location_id = p_location_id
      and stock.product_id = p_product_id
      and stock.uom_profile_id = p_uom_profile_id
      and (
        (p_location_position_id is null and stock.location_position_id is null)
        or stock.location_position_id = p_location_position_id
      )
      and (stock.presentation_qty < -0.000001 or stock.base_qty < -0.000001)
  ) then
    raise exception 'insufficient stock for uom profile';
  end if;
end;
$$;


ALTER FUNCTION "public"."upsert_inventory_stock_by_uom_profile"("p_location_id" "uuid", "p_product_id" "uuid", "p_uom_profile_id" "uuid", "p_presentation_delta" numeric, "p_base_delta" numeric, "p_location_position_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."util_column_usage"("p_table" "regclass") RETURNS TABLE("column_name" "text", "non_null_count" bigint, "total_count" bigint, "pct_non_null" numeric)
    LANGUAGE "plpgsql"
    AS $$
declare
  col record;
  total bigint;
begin
  execute format('select count(*) from %s', p_table) into total;

  for col in
    select a.attname as column_name
    from pg_attribute a
    where a.attrelid = p_table
      and a.attnum > 0
      and not a.attisdropped
  loop
    return query execute format(
      'select %L::text,
              count(%I)::bigint,
              %s::bigint,
              round((count(%I)::numeric / nullif(%s,0))*100, 2)
       from %s',
      col.column_name,
      col.column_name,
      total,
      col.column_name,
      total,
      p_table
    );
  end loop;
end $$;


ALTER FUNCTION "public"."util_column_usage"("p_table" "regclass") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."validate_product_site_production_location"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    SET "search_path" TO 'public', 'pg_temp'
    AS $$
declare
  v_location_site_id uuid;
  v_location_type text;
  v_location_active boolean;
  v_area_kind text;
  v_area_active boolean;
  v_area_enabled_for_recipe boolean := false;
begin
  if new.production_location_id is null then
    return new;
  end if;

  select loc.site_id,
         loc.location_type,
         coalesce(loc.is_active, true),
         area.kind,
         coalesce(area.is_active, true)
    into v_location_site_id,
         v_location_type,
         v_location_active,
         v_area_kind,
         v_area_active
  from public.inventory_locations loc
  left join public.areas area on area.id = loc.area_id
  where loc.id = new.production_location_id;

  if v_location_site_id is null then
    raise exception 'production_location_id % does not exist', new.production_location_id;
  end if;

  if v_location_site_id <> new.site_id then
    raise exception 'production_location_id % does not belong to product site %', new.production_location_id, new.site_id;
  end if;

  if not coalesce(v_location_active, false) then
    raise exception 'production_location_id % must be active', new.production_location_id;
  end if;

  if v_area_kind is not null and coalesce(v_area_active, false) then
    select exists (
      select 1
      from public.site_area_purpose_rules rule
      where rule.site_id = new.site_id
        and rule.area_kind = v_area_kind
        and rule.purpose = 'production_recipe'
        and coalesce(rule.is_enabled, true) = true
    ) into v_area_enabled_for_recipe;
  end if;

  if coalesce(v_location_type, '') <> 'production'
     and not coalesce(v_area_enabled_for_recipe, false) then
    raise exception 'production_location_id % must be a production LOC or belong to an area enabled for production_recipe', new.production_location_id;
  end if;

  return new;
end;
$$;


ALTER FUNCTION "public"."validate_product_site_production_location"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."validate_restock_request_item_pick"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pg_temp'
    AS $$
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


ALTER FUNCTION "public"."validate_restock_request_item_pick"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."value_closed_restock_request"("p_request_id" "uuid") RETURNS "jsonb"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare
  v_request record;
  v_item record;
  v_price record;

  v_now timestamptz := now();
  v_price_at timestamptz;
  v_effective_closed_at timestamptz;
  v_seller_cost_center_id uuid;
  v_buyer_cost_center_id uuid;

  v_billable_count integer := 0;
  v_missing_price_count integer := 0;
  v_variance_count integer := 0;

  v_received_qty numeric := 0;
  v_pricing_qty numeric := 0;
  v_total numeric := 0;
  v_line_total numeric := 0;
  v_unit_code text;

  v_is_service_role boolean := false;
  v_permission_ok boolean := false;
begin
  select r.*
  into v_request
  from public.restock_requests r
  where r.id = p_request_id
  for update;

  if not found then
    raise exception 'request_not_found';
  end if;

  v_is_service_role :=
    current_user = 'service_role'
    or current_setting('request.jwt.claim.role', true) = 'service_role';

  v_permission_ok :=
    v_is_service_role
    or public.has_permission('nexo.internal_invoices.generate')
    or public.has_permission('nexo.internal_invoices.issue')
    or public.has_permission('nexo.inventory.remissions.all_sites')
    or public.has_permission('nexo.inventory.remissions.prepare', v_request.from_site_id)
    or public.has_permission('nexo.inventory.remissions.receive', v_request.to_site_id)
    or is_owner()
    or is_global_manager();

  if not v_permission_ok then
    raise exception 'permission_denied_internal_billing';
  end if;

  if v_request.internal_pos_document_id is not null
     or v_request.pricing_status in ('invoiced', 'credited') then
    return jsonb_build_object(
      'request_id', p_request_id,
      'pricing_status', v_request.pricing_status,
      'message', 'already_invoiced_or_credited'
    );
  end if;

  v_seller_cost_center_id := coalesce(
    v_request.seller_cost_center_id,
    public.get_site_cost_center(v_request.from_site_id)
  );
  v_buyer_cost_center_id := coalesce(
    v_request.buyer_cost_center_id,
    public.get_site_cost_center(v_request.to_site_id)
  );

  v_effective_closed_at := coalesce(
    v_request.closed_at,
    case when v_request.status in ('received', 'closed') then v_request.received_at end,
    case when v_request.status in ('received', 'closed') then v_request.status_updated_at end,
    case when v_request.status in ('received', 'closed') then v_now end
  );
  v_price_at := coalesce(v_effective_closed_at, v_now);

  if v_request.status not in ('closed', 'received') then
    update public.restock_requests
    set
      pricing_mode = 'internal_transfer',
      pricing_status = 'pending_close',
      seller_cost_center_id = v_seller_cost_center_id,
      buyer_cost_center_id = v_buyer_cost_center_id,
      priced_at = null
    where id = p_request_id;

    return jsonb_build_object(
      'request_id', p_request_id,
      'pricing_status', 'pending_close',
      'message', 'request_is_not_received'
    );
  end if;

  if v_effective_closed_at is null then
    update public.restock_requests
    set
      pricing_mode = 'internal_transfer',
      pricing_status = 'pending_close',
      seller_cost_center_id = v_seller_cost_center_id,
      buyer_cost_center_id = v_buyer_cost_center_id,
      priced_at = null
    where id = p_request_id;

    return jsonb_build_object(
      'request_id', p_request_id,
      'pricing_status', 'pending_close',
      'message', 'missing_received_or_closed_at'
    );
  end if;

  if v_seller_cost_center_id is null or v_buyer_cost_center_id is null then
    update public.restock_requests
    set
      pricing_mode = 'internal_transfer',
      pricing_status = 'pending_price',
      seller_cost_center_id = v_seller_cost_center_id,
      buyer_cost_center_id = v_buyer_cost_center_id,
      closed_at = coalesce(closed_at, v_effective_closed_at),
      priced_at = null
    where id = p_request_id;

    return jsonb_build_object(
      'request_id', p_request_id,
      'pricing_status', 'pending_price',
      'message', 'missing_cost_center',
      'seller_cost_center_id', v_seller_cost_center_id,
      'buyer_cost_center_id', v_buyer_cost_center_id
    );
  end if;

  -- Crea diferencias cuando lo recibido no coincide con lo enviado.
  insert into public.internal_transfer_variances (
    remission_id,
    remission_item_id,
    product_id,
    expected_qty,
    dispatched_qty,
    received_qty,
    variance_qty,
    unit_code,
    variance_type,
    reason,
    financial_treatment,
    status,
    created_at,
    updated_at
  )
  select
    p_request_id,
    i.id,
    i.product_id,
    coalesce(i.quantity, 0),
    coalesce(i.shipped_quantity, 0),
    coalesce(i.received_quantity, 0),
    abs(coalesce(i.shipped_quantity, 0) - coalesce(i.received_quantity, 0)),
    coalesce(nullif(btrim(i.stock_unit_code), ''), nullif(btrim(i.unit), ''), nullif(btrim(i.input_unit_code), ''), 'un'),
    case
      when coalesce(i.received_quantity, 0) > coalesce(i.shipped_quantity, 0) then 'overage'
      else 'shortage'
    end,
    'Diferencia detectada automaticamente al valorizar la remision.',
    'pending',
    'pending',
    v_now,
    v_now
  from public.restock_request_items i
  where i.request_id = p_request_id
    and abs(coalesce(i.shipped_quantity, 0) - coalesce(i.received_quantity, 0)) > 0
    and not exists (
      select 1
      from public.internal_transfer_variances v
      where v.remission_item_id = i.id
        and v.status <> 'cancelled'
    );

  select count(*)
  into v_variance_count
  from public.internal_transfer_variances v
  where v.remission_id = p_request_id
    and v.status not in ('approved', 'cancelled');

  if v_variance_count > 0 then
    update public.restock_requests
    set
      pricing_mode = 'internal_transfer',
      pricing_status = 'pending_variance_resolution',
      seller_cost_center_id = v_seller_cost_center_id,
      buyer_cost_center_id = v_buyer_cost_center_id,
      closed_at = coalesce(closed_at, v_effective_closed_at),
      priced_at = null
    where id = p_request_id;

    return jsonb_build_object(
      'request_id', p_request_id,
      'pricing_status', 'pending_variance_resolution',
      'pending_variances', v_variance_count
    );
  end if;

  for v_item in
    select i.*
    from public.restock_request_items i
    where i.request_id = p_request_id
    order by i.created_at asc, i.id asc
  loop
    v_received_qty := coalesce(v_item.received_quantity, 0);
    v_unit_code := coalesce(
      nullif(btrim(v_item.input_unit_code), ''),
      nullif(btrim(v_item.stock_unit_code), ''),
      nullif(btrim(v_item.unit), ''),
      'un'
    );

    if v_received_qty <= 0 then
      update public.restock_request_items
      set
        transfer_unit_price = 0,
        transfer_currency = 'COP',
        transfer_total = 0,
        internal_price_list_id = null,
        internal_price_list_item_id = null,
        priced_at = v_now
      where id = v_item.id;

      continue;
    end if;

    v_billable_count := v_billable_count + 1;

    -- Si la l├¡nea fue solicitada con presentaci├│n f├¡sica, se cobra en esa presentaci├│n.
    -- Ejemplo: cantidad base 4000 ml, input_qty 2 potes, recibido 2000 ml => pricing_qty 1 pote.
    if v_item.input_uom_profile_id is not null
       and coalesce(v_item.input_qty, 0) > 0
       and coalesce(v_item.quantity, 0) > 0 then
      v_pricing_qty := round((v_received_qty / v_item.quantity) * v_item.input_qty, 6);
    else
      v_pricing_qty := v_received_qty;
    end if;

    select *
    into v_price
    from public.resolve_internal_transfer_price_for_profile(
      v_item.product_id,
      v_seller_cost_center_id,
      v_buyer_cost_center_id,
      v_request.to_site_id,
      v_item.input_uom_profile_id,
      v_unit_code,
      v_price_at
    );

    if not found then
      v_missing_price_count := v_missing_price_count + 1;

      update public.restock_request_items
      set
        transfer_unit_price = null,
        transfer_currency = 'COP',
        transfer_total = null,
        internal_price_list_id = null,
        internal_price_list_item_id = null,
        priced_at = null
      where id = v_item.id;

      continue;
    end if;

    v_line_total := round(v_pricing_qty * v_price.unit_price, 2);
    v_total := v_total + v_line_total;

    update public.restock_request_items
    set
      transfer_unit_price = v_price.unit_price,
      transfer_currency = v_price.currency,
      transfer_total = v_line_total,
      internal_price_list_id = v_price.price_list_id,
      internal_price_list_item_id = v_price.price_list_item_id,
      priced_at = v_now
    where id = v_item.id;
  end loop;

  if v_missing_price_count > 0 then
    update public.restock_requests
    set
      pricing_mode = 'internal_transfer',
      pricing_status = 'pending_price',
      seller_cost_center_id = v_seller_cost_center_id,
      buyer_cost_center_id = v_buyer_cost_center_id,
      closed_at = coalesce(closed_at, v_effective_closed_at),
      priced_at = null
    where id = p_request_id;

    return jsonb_build_object(
      'request_id', p_request_id,
      'pricing_status', 'pending_price',
      'billable_lines', v_billable_count,
      'missing_price_lines', v_missing_price_count
    );
  end if;

  if v_billable_count = 0 then
    update public.restock_requests
    set
      pricing_mode = 'internal_transfer',
      pricing_status = 'not_applicable',
      seller_cost_center_id = v_seller_cost_center_id,
      buyer_cost_center_id = v_buyer_cost_center_id,
      closed_at = coalesce(closed_at, v_effective_closed_at),
      priced_at = v_now
    where id = p_request_id;

    return jsonb_build_object(
      'request_id', p_request_id,
      'pricing_status', 'not_applicable',
      'billable_lines', 0,
      'total', 0
    );
  end if;

  update public.restock_requests
  set
    pricing_mode = 'internal_transfer',
    pricing_status = 'ready_to_invoice',
    seller_cost_center_id = v_seller_cost_center_id,
    buyer_cost_center_id = v_buyer_cost_center_id,
    closed_at = coalesce(closed_at, v_effective_closed_at),
    priced_at = v_now
  where id = p_request_id;

  return jsonb_build_object(
    'request_id', p_request_id,
    'pricing_status', 'ready_to_invoice',
    'billable_lines', v_billable_count,
    'missing_price_lines', 0,
    'total', v_total
  );
end;
$$;


ALTER FUNCTION "public"."value_closed_restock_request"("p_request_id" "uuid") OWNER TO "postgres";


COMMENT ON FUNCTION "public"."value_closed_restock_request"("p_request_id" "uuid") IS 'Values a received/closed restock request for internal billing. Uses input_uom_profile_id to resolve internal price by presentation and stores transfer_* as financial snapshot.';



CREATE OR REPLACE FUNCTION "public"."value_closed_restock_requests_for_cutoff"("p_cutoff_at" timestamp with time zone) RETURNS "jsonb"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare
  v_request record;
  v_result jsonb;
  v_status text;

  v_processed integer := 0;
  v_ready integer := 0;
  v_pending_price integer := 0;
  v_pending_variance integer := 0;
  v_pending_close integer := 0;
  v_not_applicable integer := 0;
  v_other integer := 0;
begin
  for v_request in
    select r.id
    from public.restock_requests r
    where r.status in ('closed', 'received')
      and coalesce(r.closed_at, r.received_at) is not null
      and coalesce(r.closed_at, r.received_at) <= p_cutoff_at
      and r.internal_pos_document_id is null
      and r.pricing_status not in ('invoiced', 'credited')
    order by coalesce(r.closed_at, r.received_at) asc, r.id asc
  loop
    v_result := public.value_closed_restock_request(v_request.id);
    v_status := coalesce(v_result->>'pricing_status', 'unknown');
    v_processed := v_processed + 1;

    if v_status = 'ready_to_invoice' then
      v_ready := v_ready + 1;
    elsif v_status = 'pending_price' then
      v_pending_price := v_pending_price + 1;
    elsif v_status = 'pending_variance_resolution' then
      v_pending_variance := v_pending_variance + 1;
    elsif v_status = 'pending_close' then
      v_pending_close := v_pending_close + 1;
    elsif v_status = 'not_applicable' then
      v_not_applicable := v_not_applicable + 1;
    else
      v_other := v_other + 1;
    end if;
  end loop;

  return jsonb_build_object(
    'cutoff_at', p_cutoff_at,
    'processed', v_processed,
    'ready_to_invoice', v_ready,
    'pending_price', v_pending_price,
    'pending_variance_resolution', v_pending_variance,
    'pending_close', v_pending_close,
    'not_applicable', v_not_applicable,
    'other', v_other
  );
end;
$$;


ALTER FUNCTION "public"."value_closed_restock_requests_for_cutoff"("p_cutoff_at" timestamp with time zone) OWNER TO "postgres";


COMMENT ON FUNCTION "public"."value_closed_restock_requests_for_cutoff"("p_cutoff_at" timestamp with time zone) IS 'Values all received/closed, non-invoiced restock requests up to a cutoff. Uses coalesce(closed_at, received_at) because v1 closes operationally on received.';



CREATE OR REPLACE FUNCTION "public"."verify_employee_kiosk_pin"("p_employee_id" "uuid", "p_pin" "text") RETURNS boolean
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'extensions'
    AS $$
declare
  v_pin text := btrim(coalesce(p_pin, ''));
  v_hash text;
  v_legacy_pin text;
begin
  if p_employee_id is null or v_pin = '' then
    return false;
  end if;

  select pin_code_hash, pin_code
  into v_hash, v_legacy_pin
  from public.employees
  where id = p_employee_id
    and is_active is true;

  if v_hash is not null and v_hash = crypt(v_pin, v_hash) then
    return true;
  end if;

  if v_hash is null and v_legacy_pin is not null and v_legacy_pin = v_pin then
    update public.employees
    set pin_code_hash = crypt(v_pin, gen_salt('bf')),
        pin_code = null
    where id = p_employee_id;
    return true;
  end if;

  return false;
end;
$$;


ALTER FUNCTION "public"."verify_employee_kiosk_pin"("p_employee_id" "uuid", "p_pin" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."viso_accounting_dashboard"("p_site_id" "uuid" DEFAULT NULL::"uuid", "p_month" "date" DEFAULT CURRENT_DATE) RETURNS "jsonb"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare
  v_month_start date := date_trunc('month', coalesce(p_month, current_date))::date;
  v_month_end date := (date_trunc('month', coalesce(p_month, current_date)) + interval '1 month')::date;
  v_result jsonb;
begin
  if not public.has_permission('viso.access') then
    raise exception 'permission denied';
  end if;

  with site_scope as (
    select s.id, s.name, s.code
    from public.sites s
    where s.is_active = true
      and (p_site_id is null or s.id = p_site_id)
  ),
  primary_supplier as (
    select distinct on (ps.product_id)
      ps.product_id,
      ps.supplier_id,
      sup.name as supplier_name,
      coalesce(ps.purchase_tax_rate, 0) as iva_rate,
      coalesce(ps.purchase_icui_rate, 0) as icui_rate
    from public.product_suppliers ps
    left join public.suppliers sup on sup.id = ps.supplier_id
    order by ps.product_id, ps.is_primary desc, ps.created_at desc
  ),
  inventory_lines as (
    select
      ss.id as site_id,
      ss.name as site_name,
      p.id as product_id,
      p.name as product_name,
      p.sku,
      p.unit,
      iss.current_qty,
      coalesce(nullif(iss.avg_unit_cost, 0), nullif(p.cost, 0), 0) as unit_cost,
      greatest(iss.current_qty, 0) * coalesce(nullif(iss.avg_unit_cost, 0), nullif(p.cost, 0), 0) as stock_value,
      greatest(iss.current_qty, 0) * coalesce(nullif(iss.avg_unit_cost, 0), nullif(p.cost, 0), 0) * coalesce(ps.iva_rate, 0) / 100.0 as iva_exposure,
      greatest(iss.current_qty, 0) * coalesce(nullif(iss.avg_unit_cost, 0), nullif(p.cost, 0), 0) * coalesce(ps.icui_rate, 0) / 100.0 as icui_exposure,
      coalesce(ps.iva_rate, 0) as iva_rate,
      coalesce(ps.icui_rate, 0) as icui_rate
    from public.inventory_stock_by_site iss
    join site_scope ss on ss.id = iss.site_id
    join public.products p on p.id = iss.product_id
    left join primary_supplier ps on ps.product_id = iss.product_id
  ),
  month_receipt_lines as (
    select
      ie.site_id,
      coalesce(iei.line_total_cost, iei.stock_unit_cost * iei.quantity_received, p.cost * iei.quantity_received, 0) as net_amount,
      coalesce(ps.iva_rate, 0) as iva_rate,
      coalesce(ps.icui_rate, 0) as icui_rate
    from public.inventory_entries ie
    join site_scope ss on ss.id = ie.site_id
    join public.inventory_entry_items iei on iei.entry_id = ie.id
    join public.products p on p.id = iei.product_id
    left join primary_supplier ps on ps.product_id = iei.product_id
    where coalesce(ie.received_at, ie.created_at) >= v_month_start::timestamptz
      and coalesce(ie.received_at, ie.created_at) < v_month_end::timestamptz
      and coalesce(ie.status, '') not in ('cancelled', 'void', 'deleted')
  ),
  purchase_order_lines as (
    select
      po.site_id,
      coalesce(poi.line_total, poi.unit_cost * coalesce(poi.quantity_received, poi.quantity_ordered), 0) as committed_amount
    from public.purchase_orders po
    join site_scope ss on ss.id = po.site_id
    join public.purchase_order_items poi on poi.purchase_order_id = po.id
    where po.created_at >= v_month_start::timestamptz
      and po.created_at < v_month_end::timestamptz
      and coalesce(po.status, '') not in ('cancelled', 'void', 'deleted')
  ),
  inventory_summary as (
    select
      coalesce(sum(stock_value), 0) as total_value,
      coalesce(sum(current_qty) filter (where current_qty > 0), 0) as positive_qty,
      count(*) filter (where current_qty > 0) as stock_rows,
      count(distinct product_id) filter (where current_qty > 0) as products_with_stock,
      count(*) filter (where current_qty > 0 and unit_cost = 0) as rows_missing_cost,
      count(*) filter (where current_qty < 0) as negative_stock_rows,
      coalesce(sum(iva_exposure), 0) as iva_exposure,
      coalesce(sum(icui_exposure), 0) as icui_exposure
    from inventory_lines
  ),
  receipt_summary as (
    select
      coalesce(sum(net_amount), 0) as net_amount,
      coalesce(sum(net_amount * iva_rate / 100.0), 0) as iva_amount,
      coalesce(sum(net_amount * icui_rate / 100.0), 0) as icui_amount,
      count(*) as line_count
    from month_receipt_lines
  ),
  po_summary as (
    select
      coalesce(sum(committed_amount), 0) as committed_amount,
      count(*) as line_count
    from purchase_order_lines
  )
  select jsonb_build_object(
    'period', jsonb_build_object(
      'month_start', v_month_start,
      'month_end', v_month_end
    ),
    'summary', jsonb_build_object(
      'inventory_value', inv.total_value,
      'inventory_positive_qty', inv.positive_qty,
      'stock_rows', inv.stock_rows,
      'products_with_stock', inv.products_with_stock,
      'products_missing_cost', inv.rows_missing_cost,
      'negative_stock_rows', inv.negative_stock_rows,
      'inventory_estimated_iva', inv.iva_exposure,
      'inventory_estimated_icui', inv.icui_exposure,
      'inventory_estimated_tax', inv.iva_exposure + inv.icui_exposure,
      'month_receipts_net', rec.net_amount,
      'month_receipts_iva', rec.iva_amount,
      'month_receipts_icui', rec.icui_amount,
      'month_receipts_tax', rec.iva_amount + rec.icui_amount,
      'month_receipts_gross', rec.net_amount + rec.iva_amount + rec.icui_amount,
      'month_receipt_lines', rec.line_count,
      'month_purchase_orders_committed', po.committed_amount,
      'month_purchase_order_lines', po.line_count
    ),
    'inventory_by_site', coalesce((
      select jsonb_agg(row_to_json(x)::jsonb order by x.inventory_value desc)
      from (
        select
          site_id,
          site_name,
          coalesce(sum(stock_value), 0) as inventory_value,
          count(distinct product_id) filter (where current_qty > 0) as products,
          count(*) filter (where current_qty > 0 and unit_cost = 0) as missing_cost_rows
        from inventory_lines
        group by site_id, site_name
      ) x
    ), '[]'::jsonb),
    'top_inventory_products', coalesce((
      select jsonb_agg(row_to_json(x)::jsonb order by x.stock_value desc)
      from (
        select
          site_name,
          product_id,
          product_name,
          sku,
          unit,
          current_qty,
          unit_cost,
          stock_value,
          iva_rate,
          icui_rate
        from inventory_lines
        where stock_value > 0
        order by stock_value desc
        limit 12
      ) x
    ), '[]'::jsonb),
    'tax_by_site', coalesce((
      select jsonb_agg(row_to_json(x)::jsonb order by x.estimated_tax desc)
      from (
        select
          ss.id as site_id,
          ss.name as site_name,
          coalesce(sum(ml.net_amount * ml.iva_rate / 100.0), 0) as iva,
          coalesce(sum(ml.net_amount * ml.icui_rate / 100.0), 0) as icui,
          coalesce(sum(ml.net_amount * (ml.iva_rate + ml.icui_rate) / 100.0), 0) as estimated_tax
        from site_scope ss
        left join month_receipt_lines ml on ml.site_id = ss.id
        group by ss.id, ss.name
      ) x
    ), '[]'::jsonb)
  )
  into v_result
  from inventory_summary inv
  cross join receipt_summary rec
  cross join po_summary po;

  return v_result;
end;
$$;


ALTER FUNCTION "public"."viso_accounting_dashboard"("p_site_id" "uuid", "p_month" "date") OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."product_site_settings" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "site_id" "uuid" NOT NULL,
    "product_id" "uuid" NOT NULL,
    "is_active" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "default_area_kind" "text",
    "audience" "text" DEFAULT 'BOTH'::"text" NOT NULL,
    "min_stock_qty" numeric,
    "min_stock_input_mode" "text",
    "min_stock_purchase_qty" numeric,
    "min_stock_purchase_unit_code" "text",
    "min_stock_purchase_to_base_factor" numeric,
    "area_kinds" "text"[],
    "production_location_id" "uuid",
    "remission_enabled" boolean,
    "local_production_enabled" boolean DEFAULT false NOT NULL,
    "sales_enabled" boolean,
    "inventory_enabled" boolean,
    CONSTRAINT "product_site_settings_audience_chk" CHECK (("audience" = ANY (ARRAY['SAUDO'::"text", 'VCF'::"text", 'BOTH'::"text", 'INTERNAL'::"text"]))),
    CONSTRAINT "product_site_settings_local_production_location_chk" CHECK ((("local_production_enabled" = true) OR ("production_location_id" IS NULL))),
    CONSTRAINT "product_site_settings_min_stock_input_mode_chk" CHECK ((("min_stock_input_mode" IS NULL) OR ("min_stock_input_mode" = ANY (ARRAY['base'::"text", 'purchase'::"text"])))),
    CONSTRAINT "product_site_settings_min_stock_mode_consistency_chk" CHECK ((("min_stock_input_mode" IS NULL) OR ("min_stock_input_mode" = 'base'::"text") OR (("min_stock_input_mode" = 'purchase'::"text") AND ("min_stock_purchase_qty" IS NOT NULL) AND ("min_stock_purchase_unit_code" IS NOT NULL) AND ("min_stock_purchase_to_base_factor" IS NOT NULL)))),
    CONSTRAINT "product_site_settings_min_stock_purchase_qty_chk" CHECK ((("min_stock_purchase_qty" IS NULL) OR ("min_stock_purchase_qty" >= (0)::numeric))),
    CONSTRAINT "product_site_settings_min_stock_purchase_to_base_factor_chk" CHECK ((("min_stock_purchase_to_base_factor" IS NULL) OR ("min_stock_purchase_to_base_factor" > (0)::numeric))),
    CONSTRAINT "product_site_settings_min_stock_qty_chk" CHECK ((("min_stock_qty" IS NULL) OR ("min_stock_qty" >= (0)::numeric)))
);


ALTER TABLE "public"."product_site_settings" OWNER TO "postgres";


COMMENT ON TABLE "public"."product_site_settings" IS 'Catalogo activo por sede para productos (sin depender de stock).';



COMMENT ON COLUMN "public"."product_site_settings"."default_area_kind" IS 'Area de solicitud sugerida para remisiones.';



COMMENT ON COLUMN "public"."product_site_settings"."min_stock_input_mode" IS 'Modo de captura del minimo: base o purchase. El calculo operativo siempre usa min_stock_qty en unidad base.';



COMMENT ON COLUMN "public"."product_site_settings"."min_stock_purchase_qty" IS 'Cantidad de minimo capturada en unidad de compra.';



COMMENT ON COLUMN "public"."product_site_settings"."min_stock_purchase_unit_code" IS 'Codigo de la unidad de compra usada para capturar el minimo.';



COMMENT ON COLUMN "public"."product_site_settings"."min_stock_purchase_to_base_factor" IS 'Factor de conversion de unidad de compra a unidad base (base por 1 unidad de compra).';



COMMENT ON COLUMN "public"."product_site_settings"."area_kinds" IS 'Areas operativas habilitadas para solicitar este producto en la sede (multi-seleccion).';



COMMENT ON COLUMN "public"."product_site_settings"."production_location_id" IS 'LOC operativo donde se consume la receta y se suma el producto terminado para esta sede/producto.';



COMMENT ON COLUMN "public"."product_site_settings"."remission_enabled" IS 'Control explicito para remisiones. null mantiene comportamiento legacy; true habilita remision; false excluye de remisiones aunque el producto este disponible en la sede.';



COMMENT ON COLUMN "public"."product_site_settings"."local_production_enabled" IS 'Control explicito para indicar que el producto se produce localmente en esta sede.';



COMMENT ON COLUMN "public"."product_site_settings"."sales_enabled" IS 'Control opcional para venta por sede. Null mantiene comportamiento legacy.';



COMMENT ON COLUMN "public"."product_site_settings"."inventory_enabled" IS 'Control opcional para inventario por sede. Null mantiene comportamiento legacy.';



CREATE TABLE IF NOT EXISTS "public"."products" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "name" "text" NOT NULL,
    "description" "text",
    "sku" "text",
    "price" numeric,
    "cost" numeric,
    "is_active" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "product_type" "text" DEFAULT 'venta'::"text" NOT NULL,
    "category_id" "uuid" NOT NULL,
    "unit" "text" NOT NULL,
    "cost_original" numeric,
    "production_area_kind" "text" DEFAULT 'general'::"text",
    "image_url" "text",
    "catalog_image_url" "text",
    "stock_unit_code" "text",
    "create_request_key" "text",
    CONSTRAINT "products_product_type_check" CHECK (("product_type" = ANY (ARRAY['venta'::"text", 'insumo'::"text", 'preparacion'::"text"])))
);


ALTER TABLE "public"."products" OWNER TO "postgres";


COMMENT ON TABLE "public"."products" IS 'Core ΓÇô tabla can├│nica para cat├ílogo maestro de productos y preparaciones. Cat├ílogo maestro de productos de venta, insumos y preparaciones; usar en todo el c├│digo nuevo.';



COMMENT ON COLUMN "public"."products"."unit" IS 'Unidad base del producto/insumo (ej: "g", "kg", "ml", "L", "unidades"). 
Migrado desde inventory.unit (legacy).';



COMMENT ON COLUMN "public"."products"."image_url" IS 'URL de la foto del producto (ficha maestra).';



COMMENT ON COLUMN "public"."products"."catalog_image_url" IS 'URL de la foto de cat├ílogo (listados, reportes).';



COMMENT ON COLUMN "public"."products"."create_request_key" IS 'Llave de idempotencia para alta de producto. Evita duplicados por doble submit/reintento de red.';



CREATE TABLE IF NOT EXISTS "public"."recipe_cards" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "product_id" "uuid" NOT NULL,
    "yield_qty" numeric DEFAULT 1 NOT NULL,
    "yield_unit" "text" NOT NULL,
    "portion_size" numeric,
    "portion_unit" "text",
    "prep_time_minutes" integer,
    "shelf_life_days" integer,
    "area" "text",
    "difficulty" "text",
    "is_active" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "site_id" "uuid",
    "area_id" "uuid",
    "recipe_description" "text",
    "cover_image_path" "text",
    "video_path" "text",
    "status" "public"."recipe_status" DEFAULT 'draft'::"public"."recipe_status" NOT NULL,
    "process_config" "jsonb" DEFAULT '{}'::"jsonb" NOT NULL,
    CONSTRAINT "recipe_cards_yield_qty_positive" CHECK (("yield_qty" > (0)::numeric))
);


ALTER TABLE "public"."recipe_cards" OWNER TO "postgres";


COMMENT ON COLUMN "public"."recipe_cards"."status" IS 'Recipe workflow status: draft (work in progress), published (visible to staff), archived (hidden)';



COMMENT ON COLUMN "public"."recipe_cards"."process_config" IS 'Configuracion dinamica de proceso por receta: empaque al vacio, coccion controlada, conservacion especial y etiquetado.';



CREATE TABLE IF NOT EXISTS "public"."recipes" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "product_id" "uuid" NOT NULL,
    "quantity" numeric DEFAULT '0'::numeric NOT NULL,
    "is_active" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "ingredient_product_id" "uuid"
);


ALTER TABLE "public"."recipes" OWNER TO "postgres";


COMMENT ON TABLE "public"."recipes" IS 'Core ΓÇô tabla can├│nica para recetas/consumos. Define relaciones productoΓåÆinsumo (inventory) y cantidades necesarias para producci├│n.';



COMMENT ON COLUMN "public"."recipes"."product_id" IS 'ID del producto final (pizza, bebida, preparaci├│n terminada).';



COMMENT ON COLUMN "public"."recipes"."ingredient_product_id" IS 'Producto usado como ingrediente (FK a products.id). 
El producto debe tener product_type = ''insumo''. 
Este es el campo can├│nico que reemplaza a inventory_id (legacy).';



CREATE TABLE IF NOT EXISTS "public"."account_deletion_requests" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "email" "text" NOT NULL,
    "requested_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "status" "text" DEFAULT 'pending'::"text" NOT NULL,
    "processed_at" timestamp with time zone,
    "processed_by" "text",
    "notes" "text",
    "user_id" "uuid",
    "request_type" "text" DEFAULT 'full_account'::"text" NOT NULL,
    "requested_via" "text" DEFAULT 'in_app'::"text" NOT NULL,
    "execute_after" timestamp with time zone,
    "canceled_at" timestamp with time zone,
    "completed_at" timestamp with time zone,
    "confirmation" "jsonb" DEFAULT '{}'::"jsonb" NOT NULL,
    "error_message" "text",
    CONSTRAINT "account_deletion_requests_request_type_check" CHECK (("request_type" = ANY (ARRAY['full_account'::"text", 'data_cleanup'::"text"]))),
    CONSTRAINT "account_deletion_requests_status_check" CHECK (("status" = ANY (ARRAY['pending'::"text", 'processing'::"text", 'completed'::"text", 'rejected'::"text", 'canceled'::"text", 'failed'::"text"])))
);


ALTER TABLE "public"."account_deletion_requests" OWNER TO "postgres";


COMMENT ON TABLE "public"."account_deletion_requests" IS 'Solicitudes de eliminaci├│n de cuenta/datos para Vento Pass. URL p├║blica en app y tiendas.';



CREATE TABLE IF NOT EXISTS "public"."announcements" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "title" "text" NOT NULL,
    "body" "text" NOT NULL,
    "tag" "text" DEFAULT 'INFO'::"text" NOT NULL,
    "published_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "is_active" boolean DEFAULT true NOT NULL,
    "display_order" integer DEFAULT 0 NOT NULL,
    "created_by" "uuid",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "announcements_body_not_empty" CHECK (("length"(TRIM(BOTH FROM "body")) > 0)),
    CONSTRAINT "announcements_tag_valid" CHECK (("tag" = ANY (ARRAY['IMPORTANTE'::"text", 'INFO'::"text", 'ALERTA'::"text"]))),
    CONSTRAINT "announcements_title_not_empty" CHECK (("length"(TRIM(BOTH FROM "title")) > 0))
);


ALTER TABLE "public"."announcements" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."app_config" (
    "key" "text" NOT NULL,
    "value" "jsonb" DEFAULT '{}'::"jsonb" NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."app_config" OWNER TO "postgres";


COMMENT ON TABLE "public"."app_config" IS 'Config global ANIMA: locale, timezone, feature_flags, textos (key/value). Sin filas la app usa defaults.';



CREATE TABLE IF NOT EXISTS "public"."app_content_blocks" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "app_key" "text" NOT NULL,
    "screen_key" "text" NOT NULL,
    "section_key" "text" NOT NULL,
    "locale" "text" DEFAULT 'es-CO'::"text" NOT NULL,
    "payload" "jsonb" DEFAULT '{}'::"jsonb" NOT NULL,
    "sort_order" integer DEFAULT 100 NOT NULL,
    "is_enabled" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "app_content_blocks_payload_object_check" CHECK (("jsonb_typeof"("payload") = 'object'::"text"))
);


ALTER TABLE "public"."app_content_blocks" OWNER TO "postgres";


COMMENT ON TABLE "public"."app_content_blocks" IS 'Contenido configurable por app/pantalla/seccion para mover copies y bloques visuales desde BD en lugar de codigo.';



COMMENT ON COLUMN "public"."app_content_blocks"."payload" IS 'JSONB libre para copies, labels, metadata visual y toggles por seccion.';



CREATE TABLE IF NOT EXISTS "public"."app_navigation_items" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "app_code" "text" NOT NULL,
    "group_key" "text" NOT NULL,
    "group_label" "text" NOT NULL,
    "group_order" integer DEFAULT 100 NOT NULL,
    "item_key" "text" NOT NULL,
    "label" "text" NOT NULL,
    "description" "text",
    "href" "text" NOT NULL,
    "icon" "text",
    "required_permission_code" "text" NOT NULL,
    "sort_order" integer DEFAULT 100 NOT NULL,
    "is_active" boolean DEFAULT true NOT NULL,
    "opens_in_new_tab" boolean DEFAULT false NOT NULL,
    "metadata" "jsonb" DEFAULT '{}'::"jsonb" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "app_navigation_items_app_code_check" CHECK (("length"(TRIM(BOTH FROM "app_code")) > 0)),
    CONSTRAINT "app_navigation_items_group_key_check" CHECK (("length"(TRIM(BOTH FROM "group_key")) > 0)),
    CONSTRAINT "app_navigation_items_href_check" CHECK ((("href" ~~ '/%'::"text") OR ("href" ~~ 'http://%'::"text") OR ("href" ~~ 'https://%'::"text"))),
    CONSTRAINT "app_navigation_items_item_key_check" CHECK (("length"(TRIM(BOTH FROM "item_key")) > 0)),
    CONSTRAINT "app_navigation_items_required_permission_code_check" CHECK ((POSITION(('.'::"text") IN ("required_permission_code")) > 0))
);


ALTER TABLE "public"."app_navigation_items" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."app_operation_policies" (
    "app_code" "text" NOT NULL,
    "requires_shift" boolean DEFAULT false NOT NULL,
    "requires_checkin" boolean DEFAULT false NOT NULL,
    "requires_site_match" boolean DEFAULT false NOT NULL,
    "bypass_permission_code" "text",
    "is_active" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "app_operation_policies_app_code_check" CHECK (("length"(TRIM(BOTH FROM "app_code")) > 0))
);


ALTER TABLE "public"."app_operation_policies" OWNER TO "postgres";


COMMENT ON TABLE "public"."app_operation_policies" IS 'DB-driven rules to allow/block operational actions per app (shift, check-in, site match).';



COMMENT ON COLUMN "public"."app_operation_policies"."bypass_permission_code" IS 'Permission suffix (without app prefix). If user has app_code.permission, operational gate is bypassed.';



CREATE TABLE IF NOT EXISTS "public"."app_permissions" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "app_id" "uuid" NOT NULL,
    "code" "text" NOT NULL,
    "name" "text" NOT NULL,
    "description" "text",
    "is_active" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."app_permissions" OWNER TO "postgres";


COMMENT ON TABLE "public"."app_permissions" IS 'Catalogo de permisos por app (vistas/acciones).';



CREATE TABLE IF NOT EXISTS "public"."app_runtime_settings" (
    "app_id" "text" NOT NULL,
    "setting_key" "text" NOT NULL,
    "bool_value" boolean,
    "text_value" "text",
    "number_value" numeric,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_by" "uuid"
);


ALTER TABLE "public"."app_runtime_settings" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."app_update_policies" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "app_key" "text" NOT NULL,
    "platform" "text" NOT NULL,
    "min_version" "text" DEFAULT '0.0.0'::"text" NOT NULL,
    "latest_version" "text",
    "force_update" boolean DEFAULT false NOT NULL,
    "store_url" "text",
    "title" "text",
    "message" "text",
    "is_enabled" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "app_update_policies_platform_check" CHECK (("platform" = ANY (ARRAY['ios'::"text", 'android'::"text"])))
);


ALTER TABLE "public"."app_update_policies" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."apps" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "code" "text" NOT NULL,
    "name" "text" NOT NULL,
    "description" "text",
    "is_active" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."apps" OWNER TO "postgres";


COMMENT ON TABLE "public"."apps" IS 'Catalogo de aplicaciones Vento OS.';



CREATE TABLE IF NOT EXISTS "public"."area_kinds" (
    "code" "text" NOT NULL,
    "name" "text" NOT NULL,
    "description" "text",
    "is_active" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "use_for_remission" boolean DEFAULT false NOT NULL
);


ALTER TABLE "public"."area_kinds" OWNER TO "postgres";


COMMENT ON TABLE "public"."area_kinds" IS 'Catalogo canonico de tipos de area para produccion y remisiones.';



COMMENT ON COLUMN "public"."area_kinds"."use_for_remission" IS 'Si true, esta area se puede usar en flujos de remision (solicitud/alistamiento).';



CREATE TABLE IF NOT EXISTS "public"."areas" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "site_id" "uuid" NOT NULL,
    "code" "text" NOT NULL,
    "name" "text" NOT NULL,
    "kind" "text" NOT NULL,
    "is_active" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."areas" OWNER TO "postgres";


COMMENT ON TABLE "public"."areas" IS 'Core ΓÇô tabla can├│nica para ├íreas dentro de un site. Usa para segmentar zonas de servicio/operaci├│n dentro de cada site.';



CREATE TABLE IF NOT EXISTS "public"."asistencia_logs" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "empleado_nombre" "text",
    "empleado_id" "text" NOT NULL,
    "fecha_hora" timestamp with time zone NOT NULL,
    "sucursal" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."asistencia_logs" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."attendance_logs" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "employee_id" "uuid" NOT NULL,
    "site_id" "uuid" NOT NULL,
    "action" "text" NOT NULL,
    "source" "text" DEFAULT 'web'::"text" NOT NULL,
    "occurred_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "latitude" numeric(10,7),
    "longitude" numeric(10,7),
    "accuracy_meters" numeric(6,1),
    "device_info" "jsonb" DEFAULT '{}'::"jsonb",
    "notes" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "client_event_id" "text",
    "shift_id" "uuid",
    CONSTRAINT "attendance_logs_action_check" CHECK (("action" = ANY (ARRAY['check_in'::"text", 'check_out'::"text"]))),
    CONSTRAINT "attendance_logs_source_check" CHECK (("source" = ANY (ARRAY['mobile'::"text", 'web'::"text", 'kiosk'::"text", 'system'::"text"])))
);


ALTER TABLE "public"."attendance_logs" OWNER TO "postgres";


COMMENT ON TABLE "public"."attendance_logs" IS 'Registro de check-in/check-out de empleados (ANIMA)';



COMMENT ON COLUMN "public"."attendance_logs"."action" IS 'Tipo de acci├│n: check_in o check_out';



COMMENT ON COLUMN "public"."attendance_logs"."source" IS 'Origen del registro: mobile, web, kiosk, system';



COMMENT ON COLUMN "public"."attendance_logs"."accuracy_meters" IS 'Precisi├│n del GPS en metros';



COMMENT ON COLUMN "public"."attendance_logs"."shift_id" IS 'Turno programado asociado al registro (check-in en sede/fecha del turno publicado). Opcional.';



CREATE TABLE IF NOT EXISTS "public"."attendance_policy" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "geofence_check_in_max_accuracy_meters" integer DEFAULT 20 NOT NULL,
    "geofence_check_out_max_accuracy_meters" integer DEFAULT 25 NOT NULL,
    "late_tolerance_minutes" integer DEFAULT 15 NOT NULL,
    "geofence_ready_cache_ms" integer DEFAULT 45000 NOT NULL,
    "geofence_latch_ttl_checkin_ms" integer DEFAULT 900000 NOT NULL,
    "geofence_latch_ttl_checkout_ms" integer DEFAULT 600000 NOT NULL,
    "shift_departure_max_accuracy_meters" integer DEFAULT 35 NOT NULL,
    "shift_departure_threshold_meters" integer DEFAULT 500 NOT NULL,
    "shift_departure_min_check_interval_ms" integer DEFAULT 45000 NOT NULL,
    "default_radius_meters" integer,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."attendance_policy" OWNER TO "postgres";


COMMENT ON TABLE "public"."attendance_policy" IS 'Pol├¡tica global de asistencia (ANIMA). Un solo registro activo; la app usa estos valores en lugar de constantes.';



CREATE TABLE IF NOT EXISTS "public"."attendance_shift_events" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "employee_id" "uuid" NOT NULL,
    "site_id" "uuid" NOT NULL,
    "shift_start_at" timestamp with time zone NOT NULL,
    "event_type" "text" NOT NULL,
    "occurred_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "distance_meters" integer,
    "accuracy_meters" integer,
    "source" "text" DEFAULT 'mobile'::"text" NOT NULL,
    "notes" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "attendance_shift_events_accuracy_check" CHECK ((("accuracy_meters" IS NULL) OR ("accuracy_meters" >= 0))),
    CONSTRAINT "attendance_shift_events_distance_check" CHECK ((("distance_meters" IS NULL) OR ("distance_meters" >= 0))),
    CONSTRAINT "attendance_shift_events_event_type_check" CHECK (("event_type" = ANY (ARRAY['left_site_open_shift'::"text"]))),
    CONSTRAINT "attendance_shift_events_source_check" CHECK (("source" = ANY (ARRAY['mobile'::"text", 'web'::"text", 'kiosk'::"text", 'system'::"text"])))
);


ALTER TABLE "public"."attendance_shift_events" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."attendance_sync_conflicts" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "employee_id" "uuid" NOT NULL,
    "event_id" "text" NOT NULL,
    "event_type" "text" NOT NULL,
    "site_id" "text",
    "occurred_at" timestamp with time zone,
    "reason" "text" NOT NULL,
    "payload" "jsonb" DEFAULT '{}'::"jsonb" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."attendance_sync_conflicts" OWNER TO "postgres";


CREATE OR REPLACE VIEW "public"."catalog_item_presentation" WITH ("security_invoker"='true') AS
 SELECT "id",
    "catalog_item_id",
    "surface",
    "card_layout",
    "opens_detail_modal",
    "is_highlighted",
    "sort_weight",
    "metadata",
    "created_at",
    "updated_at"
   FROM "pass"."catalog_item_presentation";


ALTER VIEW "public"."catalog_item_presentation" OWNER TO "postgres";


COMMENT ON VIEW "public"."catalog_item_presentation" IS 'Compat view publica para configuracion visual de items comerciales. Canonical table lives in pass.catalog_item_presentation.';



CREATE OR REPLACE VIEW "public"."catalog_items" WITH ("security_invoker"='true') AS
 SELECT "id",
    "site_id",
    "product_id",
    "code",
    "name",
    "description",
    "category_label",
    "image_url",
    "price_amount",
    "compare_at_amount",
    "sort_order",
    "is_active",
    "is_featured",
    "badges",
    "fulfillment_modes",
    "metadata",
    "created_at",
    "updated_at"
   FROM "pass"."catalog_items";


ALTER VIEW "public"."catalog_items" OWNER TO "postgres";


COMMENT ON VIEW "public"."catalog_items" IS 'Compat view. Canonical table lives in pass.catalog_items.';



CREATE OR REPLACE VIEW "public"."commercial_categories" WITH ("security_invoker"='true') AS
 SELECT "id",
    "site_id",
    "code",
    "name",
    "description",
    "sort_order",
    "is_active",
    "metadata",
    "created_at",
    "updated_at"
   FROM "pass"."commercial_categories";


ALTER VIEW "public"."commercial_categories" OWNER TO "postgres";


COMMENT ON VIEW "public"."commercial_categories" IS 'Compat view. Canonical table lives in pass.commercial_categories.';



CREATE OR REPLACE VIEW "public"."commercial_collection_categories" WITH ("security_invoker"='true') AS
 SELECT "id",
    "collection_id",
    "commercial_category_id",
    "sort_order",
    "is_active",
    "metadata",
    "created_at",
    "updated_at"
   FROM "pass"."commercial_collection_categories";


ALTER VIEW "public"."commercial_collection_categories" OWNER TO "postgres";


COMMENT ON VIEW "public"."commercial_collection_categories" IS 'Compat view. Canonical table lives in pass.commercial_collection_categories.';



CREATE OR REPLACE VIEW "public"."commercial_collections" WITH ("security_invoker"='true') AS
 SELECT "id",
    "site_id",
    "code",
    "name",
    "subtitle",
    "description",
    "kind",
    "hero_image_url",
    "starts_at",
    "ends_at",
    "sort_order",
    "is_active",
    "metadata",
    "created_at",
    "updated_at"
   FROM "pass"."commercial_collections";


ALTER VIEW "public"."commercial_collections" OWNER TO "postgres";


COMMENT ON VIEW "public"."commercial_collections" IS 'Compat view. Canonical table lives in pass.commercial_collections.';



CREATE TABLE IF NOT EXISTS "public"."cost_centers" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "site_id" "uuid",
    "name" "text" NOT NULL,
    "monthly_budget" numeric DEFAULT 0,
    "current_month_spend" numeric DEFAULT 0,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "is_active" boolean DEFAULT true,
    "code" "text",
    "type" "text",
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."cost_centers" OWNER TO "postgres";


COMMENT ON TABLE "public"."cost_centers" IS 'Centros de costo internos. Se usa para asociar sedes, produccion, satelites, logistica o administracion con responsabilidad economica.';



COMMENT ON COLUMN "public"."cost_centers"."code" IS 'Codigo corto auditable del centro de costo. Ejemplo: CP-PRINCIPAL, SAT-CHAPINERO.';



COMMENT ON COLUMN "public"."cost_centers"."type" IS 'Tipo funcional del centro de costo: production_center, satellite, logistics, admin u other.';



CREATE TABLE IF NOT EXISTS "public"."document_types" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "name" "text" NOT NULL,
    "scope" "public"."document_scope" DEFAULT 'employee'::"public"."document_scope" NOT NULL,
    "requires_expiry" boolean DEFAULT false NOT NULL,
    "validity_months" integer,
    "reminder_days" integer DEFAULT 7 NOT NULL,
    "is_active" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "display_order" integer DEFAULT 999 NOT NULL,
    "system_key" "text"
);


ALTER TABLE "public"."document_types" OWNER TO "postgres";


COMMENT ON COLUMN "public"."document_types"."system_key" IS 'Clave estable para tipos especiales, ej. employment_contract para contrato laboral.';



CREATE TABLE IF NOT EXISTS "public"."documents" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "scope" "public"."document_scope" NOT NULL,
    "owner_employee_id" "uuid" NOT NULL,
    "target_employee_id" "uuid",
    "site_id" "uuid",
    "title" "text" NOT NULL,
    "description" "text",
    "status" "public"."document_status" DEFAULT 'pending_review'::"public"."document_status" NOT NULL,
    "approved_by" "uuid",
    "approved_at" timestamp with time zone,
    "rejected_reason" "text",
    "storage_path" "text" NOT NULL,
    "file_name" "text" NOT NULL,
    "file_size_bytes" integer,
    "file_mime" "text" DEFAULT 'application/pdf'::"text",
    "expiry_date" "date",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "document_type_id" "uuid",
    "issue_date" "date",
    CONSTRAINT "documents_scope_site_check" CHECK (((("scope" = 'site'::"public"."document_scope") AND ("site_id" IS NOT NULL)) OR ("scope" <> 'site'::"public"."document_scope"))),
    CONSTRAINT "documents_scope_target_check" CHECK (((("scope" = 'employee'::"public"."document_scope") AND ("target_employee_id" IS NOT NULL)) OR ("scope" <> 'employee'::"public"."document_scope")))
);


ALTER TABLE "public"."documents" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."employee_area_purpose_assignments" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "employee_id" "uuid" NOT NULL,
    "site_id" "uuid" NOT NULL,
    "area_id" "uuid" NOT NULL,
    "purpose" "text" NOT NULL,
    "is_active" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "employee_area_purpose_assignments_purpose_chk" CHECK (("purpose" = ANY (ARRAY['operational'::"text", 'remission'::"text"])))
);


ALTER TABLE "public"."employee_area_purpose_assignments" OWNER TO "postgres";


COMMENT ON TABLE "public"."employee_area_purpose_assignments" IS 'Asignaci├│n de ├íreas por prop├│sito (operational/remission) por trabajador y sede.';



COMMENT ON COLUMN "public"."employee_area_purpose_assignments"."purpose" IS 'Prop├│sito operativo de la asignaci├│n: operational o remission.';



CREATE TABLE IF NOT EXISTS "public"."employee_areas" (
    "employee_id" "uuid" NOT NULL,
    "area_id" "uuid" NOT NULL,
    "is_primary" boolean DEFAULT false NOT NULL,
    "is_active" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."employee_areas" OWNER TO "postgres";


CREATE OR REPLACE VIEW "public"."employee_attendance_status" AS
 SELECT DISTINCT ON ("employee_id") "employee_id",
    "action" AS "current_status",
    "occurred_at" AS "last_action_at",
    "site_id" AS "last_site_id"
   FROM "public"."attendance_logs"
  ORDER BY "employee_id", "occurred_at" DESC;


ALTER VIEW "public"."employee_attendance_status" OWNER TO "postgres";


COMMENT ON VIEW "public"."employee_attendance_status" IS 'Estado actual de asistencia por empleado (├║ltimo check-in/out)';



CREATE TABLE IF NOT EXISTS "public"."employee_devices" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "employee_id" "uuid" NOT NULL,
    "expo_push_token" "text" NOT NULL,
    "platform" "text",
    "device_label" "text",
    "is_active" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."employee_devices" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."employee_inventory_location_assignments" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "employee_id" "uuid" NOT NULL,
    "site_id" "uuid" NOT NULL,
    "location_id" "uuid" NOT NULL,
    "purpose" "text" DEFAULT 'kiosk_withdraw'::"text" NOT NULL,
    "is_active" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "employee_inventory_location_assignments_purpose_chk" CHECK (("purpose" = 'kiosk_withdraw'::"text"))
);


ALTER TABLE "public"."employee_inventory_location_assignments" OWNER TO "postgres";


COMMENT ON TABLE "public"."employee_inventory_location_assignments" IS 'Asignacion operativa de trabajador a LOC de inventario. NEXO usa purpose=kiosk_withdraw para traslados desde quiosco.';



CREATE TABLE IF NOT EXISTS "public"."employee_permissions" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "employee_id" "uuid" NOT NULL,
    "permission_id" "uuid" NOT NULL,
    "is_allowed" boolean DEFAULT true NOT NULL,
    "scope_type" "public"."permission_scope_type" DEFAULT 'site'::"public"."permission_scope_type" NOT NULL,
    "scope_site_id" "uuid",
    "scope_area_id" "uuid",
    "scope_site_type" "public"."site_type",
    "scope_area_kind" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."employee_permissions" OWNER TO "postgres";


COMMENT ON TABLE "public"."employee_permissions" IS 'Overrides de permisos por empleado.';



CREATE TABLE IF NOT EXISTS "public"."employee_push_tokens" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "employee_id" "uuid" NOT NULL,
    "token" "text" NOT NULL,
    "platform" "text",
    "device_id" "text",
    "is_active" boolean DEFAULT true NOT NULL,
    "last_seen" timestamp with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."employee_push_tokens" OWNER TO "postgres";


COMMENT ON TABLE "public"."employee_push_tokens" IS 'ANIMA - Tokens Expo Push por empleado para notificaciones (ej. horario publicado).';



COMMENT ON COLUMN "public"."employee_push_tokens"."token" IS 'Expo push token (ExponentPushToken[...]).';



COMMENT ON COLUMN "public"."employee_push_tokens"."is_active" IS 'False si el token fue rechazado (DeviceNotRegistered) al enviar.';



CREATE TABLE IF NOT EXISTS "public"."employee_settings" (
    "employee_id" "uuid" NOT NULL,
    "selected_site_id" "uuid",
    "selected_area_id" "uuid",
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."employee_settings" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."employee_shifts" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "employee_id" "uuid" NOT NULL,
    "site_id" "uuid" NOT NULL,
    "shift_date" "date" NOT NULL,
    "start_time" time without time zone NOT NULL,
    "end_time" time without time zone NOT NULL,
    "break_minutes" integer DEFAULT 0,
    "notes" "text",
    "status" "text" DEFAULT 'scheduled'::"text" NOT NULL,
    "created_by" "uuid",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "published_at" timestamp with time zone,
    "published_by" "uuid",
    "show_end_as_close" boolean DEFAULT false NOT NULL,
    "shift_kind" "text" DEFAULT 'laboral'::"text" NOT NULL,
    CONSTRAINT "employee_shifts_shift_kind_check" CHECK (("shift_kind" = ANY (ARRAY['laboral'::"text", 'descanso'::"text"]))),
    CONSTRAINT "employee_shifts_status_check" CHECK (("status" = ANY (ARRAY['scheduled'::"text", 'confirmed'::"text", 'completed'::"text", 'cancelled'::"text", 'no_show'::"text"])))
);


ALTER TABLE "public"."employee_shifts" OWNER TO "postgres";


COMMENT ON TABLE "public"."employee_shifts" IS 'Turnos programados de empleados - ANIMA';



COMMENT ON COLUMN "public"."employee_shifts"."shift_date" IS 'Fecha del turno';



COMMENT ON COLUMN "public"."employee_shifts"."start_time" IS 'Hora de inicio programada';



COMMENT ON COLUMN "public"."employee_shifts"."end_time" IS 'Hora de fin programada';



COMMENT ON COLUMN "public"."employee_shifts"."break_minutes" IS 'Minutos de descanso dentro del turno';



COMMENT ON COLUMN "public"."employee_shifts"."status" IS 'scheduled=programado, confirmed=confirmado, completed=completado, cancelled=cancelado, no_show=no se present├│';



COMMENT ON COLUMN "public"."employee_shifts"."published_at" IS 'Timestamp when the shift was officially published to the employee-facing schedule.';



COMMENT ON COLUMN "public"."employee_shifts"."published_by" IS 'Employee who published the shift to ANIMA.';



COMMENT ON COLUMN "public"."employee_shifts"."show_end_as_close" IS 'Si es true, el turno se muestra en UI como "Inicio - Cierre" para vista legal/comercial, manteniendo end_time interno para reglas de negocio.';



COMMENT ON COLUMN "public"."employee_shifts"."shift_kind" IS 'Tipo de turno: laboral (con jornada) o descanso (no laboral, visible al empleado como descanso programado).';



CREATE TABLE IF NOT EXISTS "public"."employee_sites" (
    "employee_id" "uuid" NOT NULL,
    "site_id" "uuid" NOT NULL,
    "is_primary" boolean DEFAULT false NOT NULL,
    "is_active" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."employee_sites" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."employee_wallet_cards" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "employee_id" "uuid" NOT NULL,
    "status" "public"."employee_wallet_card_status" DEFAULT 'eligible'::"public"."employee_wallet_card_status" NOT NULL,
    "serial_number" "text",
    "wallet_provider_state" "jsonb",
    "last_issued_at" timestamp with time zone,
    "last_revoked_at" timestamp with time zone,
    "revocation_reason" "text",
    "snapshot_payload" "jsonb",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."employee_wallet_cards" OWNER TO "postgres";


COMMENT ON TABLE "public"."employee_wallet_cards" IS 'Estado del carnet laboral en wallet por empleado; lifecycle administrable desde VISO.';



CREATE TABLE IF NOT EXISTS "public"."employees" (
    "id" "uuid" NOT NULL,
    "site_id" "uuid" NOT NULL,
    "role" "text" NOT NULL,
    "permissions" "jsonb" DEFAULT '{}'::"jsonb",
    "full_name" "text" NOT NULL,
    "alias" "text",
    "pin_code" "text",
    "is_active" boolean DEFAULT true,
    "joined_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone DEFAULT "now"(),
    "area_id" "uuid",
    "photo_url" "text",
    "pin_code_hash" "text"
);


ALTER TABLE "public"."employees" OWNER TO "postgres";


COMMENT ON TABLE "public"."employees" IS 'Core ΓÇô tabla can├│nica para empleados/staff. Gesti├│n de personal por site, roles y permisos operativos.';



COMMENT ON COLUMN "public"."employees"."photo_url" IS 'URL de la foto oficial del trabajador para carnet laboral.';



COMMENT ON COLUMN "public"."employees"."pin_code_hash" IS 'Hash del PIN operativo usado para confirmar retiros desde quiosco.';



CREATE TABLE IF NOT EXISTS "public"."internal_job_secrets" (
    "key" "text" NOT NULL,
    "secret_value" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."internal_job_secrets" OWNER TO "postgres";


COMMENT ON TABLE "public"."internal_job_secrets" IS 'Secretos internos usados por jobs del sistema y edge functions. No exponer a clientes.';



CREATE TABLE IF NOT EXISTS "public"."internal_pos_document_lines" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "document_id" "uuid" NOT NULL,
    "remission_id" "uuid" NOT NULL,
    "remission_item_id" "uuid" NOT NULL,
    "product_id" "uuid" NOT NULL,
    "quantity" numeric NOT NULL,
    "unit_code" "text" NOT NULL,
    "unit_price" numeric NOT NULL,
    "subtotal" numeric NOT NULL,
    "price_list_id" "uuid",
    "price_list_item_id" "uuid",
    "priced_at" timestamp with time zone NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "internal_pos_document_lines_quantity_positive" CHECK (("quantity" > (0)::numeric)),
    CONSTRAINT "internal_pos_document_lines_subtotal_non_negative" CHECK (("subtotal" >= (0)::numeric)),
    CONSTRAINT "internal_pos_document_lines_unit_code_not_blank" CHECK (("btrim"("unit_code") <> ''::"text")),
    CONSTRAINT "internal_pos_document_lines_unit_price_non_negative" CHECK (("unit_price" >= (0)::numeric))
);


ALTER TABLE "public"."internal_pos_document_lines" OWNER TO "postgres";


COMMENT ON TABLE "public"."internal_pos_document_lines" IS 'Lineas de comprobantes POS internos. Cada linea viene de un item de remision y no puede facturarse dos veces.';



CREATE TABLE IF NOT EXISTS "public"."internal_pos_document_sequences" (
    "document_date" "date" NOT NULL,
    "last_value" integer DEFAULT 0 NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "internal_pos_document_sequences_last_value_non_negative" CHECK (("last_value" >= 0))
);


ALTER TABLE "public"."internal_pos_document_sequences" OWNER TO "postgres";


COMMENT ON TABLE "public"."internal_pos_document_sequences" IS 'Secuencia interna por fecha para generar consecutivos INT-YYYYMMDD-0001.';



CREATE TABLE IF NOT EXISTS "public"."internal_pos_documents" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "document_number" "text" NOT NULL,
    "document_date" "date" NOT NULL,
    "cutoff_at" timestamp with time zone NOT NULL,
    "seller_cost_center_id" "uuid" NOT NULL,
    "buyer_cost_center_id" "uuid" NOT NULL,
    "buyer_site_id" "uuid",
    "status" "text" DEFAULT 'draft'::"text" NOT NULL,
    "subtotal" numeric DEFAULT 0 NOT NULL,
    "total" numeric DEFAULT 0 NOT NULL,
    "currency" "text" DEFAULT 'COP'::"text" NOT NULL,
    "generated_by_system" boolean DEFAULT true NOT NULL,
    "generated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "issued_at" timestamp with time zone,
    "cancelled_at" timestamp with time zone,
    "credited_at" timestamp with time zone,
    "notes" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "internal_pos_documents_currency_not_blank" CHECK (("btrim"("currency") <> ''::"text")),
    CONSTRAINT "internal_pos_documents_number_not_blank" CHECK (("btrim"("document_number") <> ''::"text")),
    CONSTRAINT "internal_pos_documents_status_check" CHECK (("status" = ANY (ARRAY['draft'::"text", 'issued'::"text", 'cancelled'::"text", 'credited'::"text"]))),
    CONSTRAINT "internal_pos_documents_subtotal_non_negative" CHECK (("subtotal" >= (0)::numeric)),
    CONSTRAINT "internal_pos_documents_total_non_negative" CHECK (("total" >= (0)::numeric))
);


ALTER TABLE "public"."internal_pos_documents" OWNER TO "postgres";


COMMENT ON TABLE "public"."internal_pos_documents" IS 'Comprobantes POS internos diarios generados desde remisiones cerradas y valorizadas. No son factura fiscal.';



COMMENT ON COLUMN "public"."internal_pos_documents"."document_number" IS 'Consecutivo global interno. Formato recomendado: INT-YYYYMMDD-0001.';



CREATE TABLE IF NOT EXISTS "public"."internal_price_list_items" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "price_list_id" "uuid" NOT NULL,
    "product_id" "uuid" NOT NULL,
    "unit_price" numeric NOT NULL,
    "unit_code" "text" NOT NULL,
    "is_active" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "uom_profile_id" "uuid",
    "pricing_label" "text",
    "pricing_input_unit_code" "text",
    "pricing_qty_in_input_unit" numeric,
    "pricing_qty_in_stock_unit" numeric,
    CONSTRAINT "internal_price_list_items_pricing_qty_input_positive" CHECK ((("pricing_qty_in_input_unit" IS NULL) OR ("pricing_qty_in_input_unit" > (0)::numeric))),
    CONSTRAINT "internal_price_list_items_pricing_qty_stock_positive" CHECK ((("pricing_qty_in_stock_unit" IS NULL) OR ("pricing_qty_in_stock_unit" > (0)::numeric))),
    CONSTRAINT "internal_price_list_items_profile_snapshot_required" CHECK ((("uom_profile_id" IS NULL) OR (("pricing_label" IS NOT NULL) AND ("btrim"("pricing_label") <> ''::"text") AND ("pricing_input_unit_code" IS NOT NULL) AND ("btrim"("pricing_input_unit_code") <> ''::"text") AND ("pricing_qty_in_input_unit" IS NOT NULL) AND ("pricing_qty_in_stock_unit" IS NOT NULL)))),
    CONSTRAINT "internal_price_list_items_unit_code_not_blank" CHECK (("btrim"("unit_code") <> ''::"text")),
    CONSTRAINT "internal_price_list_items_unit_price_non_negative" CHECK (("unit_price" >= (0)::numeric))
);


ALTER TABLE "public"."internal_price_list_items" OWNER TO "postgres";


COMMENT ON TABLE "public"."internal_price_list_items" IS 'Items de listas de precios internos. unit_price es precio interno neto, sin impuestos.';



COMMENT ON COLUMN "public"."internal_price_list_items"."unit_price" IS 'Precio interno neto usado para valorizar remisiones cerradas.';



COMMENT ON COLUMN "public"."internal_price_list_items"."uom_profile_id" IS 'Presentaci├│n f├¡sica / UOM profile sobre la que se define el precio interno. Null conserva compatibilidad legacy por unit_code.';



COMMENT ON COLUMN "public"."internal_price_list_items"."pricing_label" IS 'Snapshot del nombre de la presentaci├│n al momento de configurar el precio interno. Ej: Pote 2 L, Bolsa 2.500 g, unidad producida.';



COMMENT ON COLUMN "public"."internal_price_list_items"."pricing_input_unit_code" IS 'Snapshot de la unidad de entrada de la presentaci├│n. Ej: un, g, ml.';



COMMENT ON COLUMN "public"."internal_price_list_items"."pricing_qty_in_input_unit" IS 'Snapshot de qty_in_input_unit del perfil UOM usado para el precio interno.';



COMMENT ON COLUMN "public"."internal_price_list_items"."pricing_qty_in_stock_unit" IS 'Snapshot de qty_in_stock_unit del perfil UOM usado para el precio interno.';



CREATE TABLE IF NOT EXISTS "public"."internal_price_lists" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "name" "text" NOT NULL,
    "seller_cost_center_id" "uuid" NOT NULL,
    "buyer_cost_center_id" "uuid",
    "buyer_site_id" "uuid",
    "valid_from" timestamp with time zone DEFAULT "now"() NOT NULL,
    "valid_to" timestamp with time zone,
    "is_active" boolean DEFAULT true NOT NULL,
    "created_by" "uuid",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "internal_price_lists_name_not_blank" CHECK (("btrim"("name") <> ''::"text")),
    CONSTRAINT "internal_price_lists_valid_range" CHECK ((("valid_to" IS NULL) OR ("valid_to" > "valid_from")))
);


ALTER TABLE "public"."internal_price_lists" OWNER TO "postgres";


COMMENT ON TABLE "public"."internal_price_lists" IS 'Listas de precios internos para transferencias entre centros de costo. No representan precio fiscal ni precio al cliente.';



COMMENT ON COLUMN "public"."internal_price_lists"."seller_cost_center_id" IS 'Centro de costo vendedor, normalmente centro de produccion.';



COMMENT ON COLUMN "public"."internal_price_lists"."buyer_cost_center_id" IS 'Centro de costo comprador. Puede ser null para una lista general.';



COMMENT ON COLUMN "public"."internal_price_lists"."buyer_site_id" IS 'Sede compradora especifica. Permite precios distintos por satelite.';



CREATE TABLE IF NOT EXISTS "public"."internal_transfer_variances" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "remission_id" "uuid" NOT NULL,
    "remission_item_id" "uuid" NOT NULL,
    "product_id" "uuid" NOT NULL,
    "expected_qty" numeric DEFAULT 0 NOT NULL,
    "dispatched_qty" numeric DEFAULT 0 NOT NULL,
    "received_qty" numeric DEFAULT 0 NOT NULL,
    "variance_qty" numeric DEFAULT 0 NOT NULL,
    "unit_code" "text",
    "variance_type" "text" DEFAULT 'shortage'::"text" NOT NULL,
    "reason" "text",
    "responsible_cost_center_id" "uuid",
    "responsible_employee_id" "uuid",
    "financial_treatment" "text" DEFAULT 'pending'::"text" NOT NULL,
    "status" "text" DEFAULT 'pending'::"text" NOT NULL,
    "approved_by" "uuid",
    "approved_at" timestamp with time zone,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "internal_transfer_variances_dispatched_non_negative" CHECK (("dispatched_qty" >= (0)::numeric)),
    CONSTRAINT "internal_transfer_variances_expected_non_negative" CHECK (("expected_qty" >= (0)::numeric)),
    CONSTRAINT "internal_transfer_variances_financial_treatment_check" CHECK (("financial_treatment" = ANY (ARRAY['pending'::"text", 'charge_to_responsible_cost_center'::"text", 'company_loss'::"text", 'production_loss'::"text", 'satellite_loss'::"text", 'logistics_loss'::"text", 'no_charge_authorized'::"text"]))),
    CONSTRAINT "internal_transfer_variances_received_non_negative" CHECK (("received_qty" >= (0)::numeric)),
    CONSTRAINT "internal_transfer_variances_status_check" CHECK (("status" = ANY (ARRAY['pending'::"text", 'resolved'::"text", 'approved'::"text", 'cancelled'::"text"]))),
    CONSTRAINT "internal_transfer_variances_type_check" CHECK (("variance_type" = ANY (ARRAY['shortage'::"text", 'damage'::"text", 'overage'::"text", 'wrong_item'::"text", 'quality_issue'::"text", 'other'::"text"]))),
    CONSTRAINT "internal_transfer_variances_variance_non_negative" CHECK (("variance_qty" >= (0)::numeric))
);


ALTER TABLE "public"."internal_transfer_variances" OWNER TO "postgres";


COMMENT ON TABLE "public"."internal_transfer_variances" IS 'Diferencias internas entre lo despachado y lo recibido en remisiones. Bloquean facturacion hasta resolverse/aprobarse.';



CREATE TABLE IF NOT EXISTS "public"."inventory_cost_policies" (
    "site_id" "uuid" NOT NULL,
    "cost_basis" "text" DEFAULT 'net'::"text" NOT NULL,
    "is_active" boolean DEFAULT true NOT NULL,
    "updated_by" "uuid",
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "inventory_cost_policies_cost_basis_chk" CHECK (("cost_basis" = ANY (ARRAY['net'::"text", 'gross'::"text"])))
);


ALTER TABLE "public"."inventory_cost_policies" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."inventory_count_lines" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "session_id" "uuid" NOT NULL,
    "product_id" "uuid" NOT NULL,
    "quantity_counted" numeric DEFAULT 0 NOT NULL,
    "current_qty_at_close" numeric,
    "quantity_delta" numeric,
    "adjustment_applied_at" timestamp with time zone,
    "current_qty_at_open" numeric,
    CONSTRAINT "inventory_count_lines_quantity_counted_check" CHECK (("quantity_counted" >= (0)::numeric))
);


ALTER TABLE "public"."inventory_count_lines" OWNER TO "postgres";


COMMENT ON TABLE "public"."inventory_count_lines" IS 'L├¡neas de conteo por sesi├│n; quantity_delta = quantity_counted - current_qty_at_close al cerrar';



CREATE TABLE IF NOT EXISTS "public"."inventory_count_sessions" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "site_id" "uuid" NOT NULL,
    "status" "text" DEFAULT 'open'::"text" NOT NULL,
    "scope_type" "text" DEFAULT 'site'::"text" NOT NULL,
    "scope_zone" "text",
    "scope_location_id" "uuid",
    "name" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "created_by" "uuid",
    "closed_at" timestamp with time zone,
    "closed_by" "uuid",
    CONSTRAINT "inventory_count_sessions_scope_type_check" CHECK (("scope_type" = ANY (ARRAY['site'::"text", 'zone'::"text", 'loc'::"text"]))),
    CONSTRAINT "inventory_count_sessions_status_check" CHECK (("status" = ANY (ARRAY['open'::"text", 'closed'::"text"])))
);


ALTER TABLE "public"."inventory_count_sessions" OWNER TO "postgres";


COMMENT ON TABLE "public"."inventory_count_sessions" IS 'Sesiones de conteo c├¡clico; open=en curso, closed=cerrada con diferencias calculadas';



CREATE TABLE IF NOT EXISTS "public"."inventory_entries" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "site_id" "uuid" NOT NULL,
    "supplier_name" "text" NOT NULL,
    "invoice_number" "text",
    "received_at" timestamp with time zone DEFAULT "now"(),
    "status" "text" DEFAULT 'pending'::"text" NOT NULL,
    "notes" "text",
    "created_by" "uuid",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "supplier_id" "uuid",
    "purchase_order_id" "uuid",
    "source_app" "text" DEFAULT 'origo'::"text" NOT NULL,
    "entry_mode" "text" DEFAULT 'normal'::"text" NOT NULL,
    "emergency_reason" "text",
    CONSTRAINT "inventory_entries_emergency_reason_chk" CHECK ((("entry_mode" <> 'emergency'::"text") OR (NULLIF(TRIM(BOTH FROM "emergency_reason"), ''::"text") IS NOT NULL))),
    CONSTRAINT "inventory_entries_entry_mode_chk" CHECK (("entry_mode" = ANY (ARRAY['normal'::"text", 'emergency'::"text"]))),
    CONSTRAINT "inventory_entries_source_app_chk" CHECK (("source_app" = ANY (ARRAY['origo'::"text", 'nexo'::"text"])))
);


ALTER TABLE "public"."inventory_entries" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."inventory_entry_items" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "entry_id" "uuid" NOT NULL,
    "product_id" "uuid" NOT NULL,
    "quantity_declared" numeric NOT NULL,
    "quantity_received" numeric NOT NULL,
    "unit" "text",
    "notes" "text",
    "discrepancy" numeric GENERATED ALWAYS AS (("quantity_received" - "quantity_declared")) STORED,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "location_id" "uuid",
    "input_qty" numeric,
    "input_unit_code" "text",
    "conversion_factor_to_stock" numeric,
    "stock_unit_code" "text",
    "input_unit_cost" numeric,
    "stock_unit_cost" numeric,
    "line_total_cost" numeric,
    "cost_source" "text",
    "currency" "text" DEFAULT 'COP'::"text",
    "purchase_order_item_id" "uuid",
    "tax_included" boolean,
    "tax_rate" numeric,
    "net_unit_cost" numeric,
    "gross_unit_cost" numeric,
    "lot_number" "text",
    "expiry_date" "date",
    "location_position_id" "uuid",
    "input_uom_profile_id" "uuid",
    CONSTRAINT "inventory_entry_items_cost_source_chk" CHECK ((("cost_source" IS NULL) OR ("cost_source" = ANY (ARRAY['manual'::"text", 'po_prefill'::"text", 'fallback_product_cost'::"text"])))),
    CONSTRAINT "inventory_entry_items_tax_rate_chk" CHECK ((("tax_rate" IS NULL) OR (("tax_rate" >= (0)::numeric) AND ("tax_rate" <= (100)::numeric))))
);


ALTER TABLE "public"."inventory_entry_items" OWNER TO "postgres";


COMMENT ON COLUMN "public"."inventory_entry_items"."location_position_id" IS 'Optional internal position inside the destination inventory location for received items.';



CREATE TABLE IF NOT EXISTS "public"."inventory_form_drafts" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "user_id" "uuid" NOT NULL,
    "form_key" "text" NOT NULL,
    "entity_id" "text",
    "site_id" "uuid",
    "step_id" "text",
    "payload_json" "jsonb" DEFAULT '{}'::"jsonb" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "expires_at" timestamp with time zone DEFAULT ("now"() + '30 days'::interval) NOT NULL,
    "entity_scope" "text" GENERATED ALWAYS AS (COALESCE("entity_id", ''::"text")) STORED,
    "site_scope" "uuid" GENERATED ALWAYS AS (COALESCE("site_id", '00000000-0000-0000-0000-000000000000'::"uuid")) STORED
);


ALTER TABLE "public"."inventory_form_drafts" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."inventory_location_positions" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "site_id" "uuid" NOT NULL,
    "location_id" "uuid" NOT NULL,
    "parent_position_id" "uuid",
    "code" "text" NOT NULL,
    "name" "text" NOT NULL,
    "kind" "text" DEFAULT 'section'::"text" NOT NULL,
    "sort_order" integer DEFAULT 0 NOT NULL,
    "is_active" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "inventory_location_positions_code_not_blank" CHECK (("length"(TRIM(BOTH FROM "code")) > 0)),
    CONSTRAINT "inventory_location_positions_kind_check" CHECK (("kind" = ANY (ARRAY['section'::"text", 'shelf'::"text", 'level'::"text", 'zone'::"text", 'bin'::"text"]))),
    CONSTRAINT "inventory_location_positions_name_not_blank" CHECK (("length"(TRIM(BOTH FROM "name")) > 0))
);


ALTER TABLE "public"."inventory_location_positions" OWNER TO "postgres";


COMMENT ON TABLE "public"."inventory_location_positions" IS 'Sububicaciones internas dentro de un LOC operativo. No reemplazan al LOC; sirven para reportes, quioscos y detalle interno.';



COMMENT ON COLUMN "public"."inventory_location_positions"."location_id" IS 'LOC operativo visible para el trabajador, por ejemplo Bodega.';



COMMENT ON COLUMN "public"."inventory_location_positions"."parent_position_id" IS 'Permite jerarquia interna como Bodega > Estanteria 03 > Nivel 05.';



CREATE TABLE IF NOT EXISTS "public"."inventory_locations" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "site_id" "uuid" NOT NULL,
    "code" "text" NOT NULL,
    "zone" "text" NOT NULL,
    "aisle" "text",
    "level" "text",
    "description" "text",
    "is_active" boolean DEFAULT true,
    "capacity_units" numeric(10,2),
    "location_type" "text" DEFAULT 'storage'::"text",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone DEFAULT "now"(),
    "parent_location_id" "uuid",
    "area_id" "uuid" NOT NULL,
    CONSTRAINT "inventory_locations_location_type_check" CHECK (("location_type" = ANY (ARRAY['storage'::"text", 'picking'::"text", 'receiving'::"text", 'staging'::"text", 'production'::"text"])))
);


ALTER TABLE "public"."inventory_locations" OWNER TO "postgres";


COMMENT ON TABLE "public"."inventory_locations" IS 'Ubicaciones f├¡sicas en almac├⌐n (LOC)';



COMMENT ON COLUMN "public"."inventory_locations"."code" IS 'C├│digo ├║nico LOC-{SEDE}-{ZONA}-{PASILLO}-{NIVEL}';



CREATE TABLE IF NOT EXISTS "public"."inventory_lpn_items" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "lpn_id" "uuid" NOT NULL,
    "product_id" "uuid" NOT NULL,
    "quantity" numeric(10,2) DEFAULT 0 NOT NULL,
    "unit" "text" DEFAULT 'unidad'::"text" NOT NULL,
    "lot_number" "text",
    "expiry_date" "date",
    "received_at" timestamp with time zone DEFAULT "now"(),
    "cost_per_unit" numeric(12,2),
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone DEFAULT "now"()
);


ALTER TABLE "public"."inventory_lpn_items" OWNER TO "postgres";


COMMENT ON TABLE "public"."inventory_lpn_items" IS 'Contenido de cada LPN con lote y vencimiento';



CREATE TABLE IF NOT EXISTS "public"."inventory_lpns" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "site_id" "uuid" NOT NULL,
    "code" "text" NOT NULL,
    "location_id" "uuid",
    "status" "text" DEFAULT 'active'::"text",
    "container_type" "text" DEFAULT 'box'::"text",
    "notes" "text",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone DEFAULT "now"(),
    "created_by" "uuid",
    "label" "text",
    CONSTRAINT "inventory_lpns_container_type_check" CHECK (("container_type" = ANY (ARRAY['box'::"text", 'pallet'::"text", 'bag'::"text", 'tray'::"text", 'bin'::"text", 'other'::"text"]))),
    CONSTRAINT "inventory_lpns_status_check" CHECK (("status" = ANY (ARRAY['active'::"text", 'empty'::"text", 'consumed'::"text", 'damaged'::"text"])))
);


ALTER TABLE "public"."inventory_lpns" OWNER TO "postgres";


COMMENT ON TABLE "public"."inventory_lpns" IS 'License Plate Numbers - Contenedores/Cajas identificables';



COMMENT ON COLUMN "public"."inventory_lpns"."code" IS 'C├│digo ├║nico LPN-{SEDE}-{AAMM}-{SEQ}';



CREATE TABLE IF NOT EXISTS "public"."inventory_movement_types" (
    "code" "text" NOT NULL,
    "name" "text" NOT NULL,
    "description" "text",
    "affects_stock" smallint NOT NULL,
    "is_active" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "inventory_movement_types_affects_stock_check" CHECK (("affects_stock" = ANY (ARRAY['-1'::integer, 0, 1])))
);


ALTER TABLE "public"."inventory_movement_types" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."inventory_movements" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "site_id" "uuid" NOT NULL,
    "product_id" "uuid" NOT NULL,
    "movement_type" "text" NOT NULL,
    "quantity" numeric NOT NULL,
    "note" "text",
    "related_order_id" "uuid",
    "related_production_request_id" "uuid",
    "related_restock_request_id" "uuid",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "related_purchase_order_id" "uuid",
    "unit_cost" numeric,
    "related_production_batch_id" "uuid",
    "created_by" "uuid" DEFAULT "auth"."uid"(),
    "input_qty" numeric,
    "input_unit_code" "text",
    "conversion_factor_to_stock" numeric,
    "stock_unit_code" "text",
    "stock_unit_cost" numeric,
    "line_total_cost" numeric,
    "location_position_id" "uuid",
    "input_uom_profile_id" "uuid"
);


ALTER TABLE "public"."inventory_movements" OWNER TO "postgres";


COMMENT ON TABLE "public"."inventory_movements" IS 'Core ΓÇô tabla can├│nica para movimientos de inventario. Registra entradas/salidas y relaciones con orders/production/restock para auditor├¡a y conciliaci├│n.';



COMMENT ON COLUMN "public"."inventory_movements"."location_position_id" IS 'Optional internal position inside the destination inventory location for traceable inventory movements.';



CREATE SEQUENCE IF NOT EXISTS "public"."inventory_sku_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."inventory_sku_seq" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."inventory_stock_by_location" (
    "location_id" "uuid" NOT NULL,
    "product_id" "uuid" NOT NULL,
    "current_qty" numeric DEFAULT 0 NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."inventory_stock_by_location" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."inventory_stock_by_position" (
    "position_id" "uuid" NOT NULL,
    "product_id" "uuid" NOT NULL,
    "current_qty" numeric DEFAULT 0 NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."inventory_stock_by_position" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."inventory_stock_by_site" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "site_id" "uuid" NOT NULL,
    "product_id" "uuid" NOT NULL,
    "current_qty" numeric DEFAULT '0'::numeric NOT NULL,
    "min_qty" numeric DEFAULT '0'::numeric NOT NULL,
    "max_qty" numeric DEFAULT '0'::numeric NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "avg_unit_cost" numeric
);


ALTER TABLE "public"."inventory_stock_by_site" OWNER TO "postgres";


COMMENT ON TABLE "public"."inventory_stock_by_site" IS 'Core ΓÇô tabla can├│nica para stock por sitio. Registra cantidades actuales y umbrales por site+product; usar para consultas de disponibilidad y reabastecimiento.';



CREATE TABLE IF NOT EXISTS "public"."inventory_stock_by_uom_profile" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "site_id" "uuid",
    "location_id" "uuid" NOT NULL,
    "location_position_id" "uuid",
    "product_id" "uuid" NOT NULL,
    "uom_profile_id" "uuid" NOT NULL,
    "presentation_qty" numeric DEFAULT 0 NOT NULL,
    "base_qty" numeric DEFAULT 0 NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "inventory_stock_by_uom_profile_qty_nonnegative_chk" CHECK ((("presentation_qty" >= (0)::numeric) AND ("base_qty" >= (0)::numeric)))
);


ALTER TABLE "public"."inventory_stock_by_uom_profile" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."inventory_transfer_items" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "transfer_id" "uuid" NOT NULL,
    "product_id" "uuid" NOT NULL,
    "quantity" numeric NOT NULL,
    "unit" "text",
    "notes" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "input_qty" numeric,
    "input_unit_code" "text",
    "conversion_factor_to_stock" numeric,
    "stock_unit_code" "text",
    "input_uom_profile_id" "uuid"
);


ALTER TABLE "public"."inventory_transfer_items" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."inventory_transfers" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "site_id" "uuid" NOT NULL,
    "from_loc_id" "uuid" NOT NULL,
    "to_loc_id" "uuid" NOT NULL,
    "status" "text" DEFAULT 'completed'::"text" NOT NULL,
    "notes" "text",
    "created_by" "uuid",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."inventory_transfers" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."inventory_unit_aliases" (
    "alias" "text" NOT NULL,
    "unit_code" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."inventory_unit_aliases" OWNER TO "postgres";


COMMENT ON TABLE "public"."inventory_unit_aliases" IS 'Aliases para mapear variantes de captura (ej. litro, lts, unidad) hacia una unidad canonica.';



CREATE TABLE IF NOT EXISTS "public"."inventory_units" (
    "code" "text" NOT NULL,
    "name" "text" NOT NULL,
    "family" "text" NOT NULL,
    "factor_to_base" numeric NOT NULL,
    "symbol" "text",
    "display_decimals" integer DEFAULT 2 NOT NULL,
    "is_active" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "inventory_units_display_decimals_check" CHECK ((("display_decimals" >= 0) AND ("display_decimals" <= 6))),
    CONSTRAINT "inventory_units_factor_to_base_check" CHECK (("factor_to_base" > (0)::numeric)),
    CONSTRAINT "inventory_units_family_check" CHECK (("family" = ANY (ARRAY['volume'::"text", 'mass'::"text", 'count'::"text"])))
);


ALTER TABLE "public"."inventory_units" OWNER TO "postgres";


COMMENT ON TABLE "public"."inventory_units" IS 'Catalogo canonic de unidades de inventario para conversion entre unidades de la misma familia.';



CREATE TABLE IF NOT EXISTS "public"."loyalty_external_sales" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "site_id" "uuid" NOT NULL,
    "user_id" "uuid" NOT NULL,
    "amount_cop" numeric NOT NULL,
    "points_awarded" integer NOT NULL,
    "external_ref" "text" NOT NULL,
    "source_app" "text" DEFAULT 'pulso'::"text" NOT NULL,
    "awarded_by" "uuid" NOT NULL,
    "loyalty_transaction_id" "uuid",
    "metadata" "jsonb" DEFAULT '{}'::"jsonb" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "loyalty_external_sales_amount_cop_check" CHECK (("amount_cop" > (0)::numeric)),
    CONSTRAINT "loyalty_external_sales_external_ref_chk" CHECK (("btrim"("external_ref") <> ''::"text")),
    CONSTRAINT "loyalty_external_sales_points_awarded_check" CHECK (("points_awarded" > 0))
);


ALTER TABLE "public"."loyalty_external_sales" OWNER TO "postgres";


CREATE OR REPLACE VIEW "public"."loyalty_redemptions" WITH ("security_invoker"='true') AS
 SELECT "id",
    "user_id",
    "order_id",
    "reward_id",
    "points_spent",
    "qr_code",
    "status",
    "metadata",
    "created_at",
    "validated_at",
    "site_id"
   FROM "pass"."loyalty_redemptions";


ALTER VIEW "public"."loyalty_redemptions" OWNER TO "postgres";


COMMENT ON VIEW "public"."loyalty_redemptions" IS 'Compat view. Canonical table lives in pass.loyalty_redemptions.';



CREATE OR REPLACE VIEW "public"."loyalty_rewards" WITH ("security_invoker"='true') AS
 SELECT "id",
    "code",
    "name",
    "description",
    "points_cost",
    "is_active",
    "metadata",
    "created_at",
    "updated_at",
    "site_id"
   FROM "pass"."loyalty_rewards";


ALTER VIEW "public"."loyalty_rewards" OWNER TO "postgres";


COMMENT ON VIEW "public"."loyalty_rewards" IS 'Compat view. Canonical table lives in pass.loyalty_rewards.';



CREATE OR REPLACE VIEW "public"."loyalty_transactions" WITH ("security_invoker"='true') AS
 SELECT "id",
    "user_id",
    "order_id",
    "kind",
    "points_delta",
    "description",
    "metadata",
    "created_at"
   FROM "pass"."loyalty_transactions";


ALTER VIEW "public"."loyalty_transactions" OWNER TO "postgres";


COMMENT ON VIEW "public"."loyalty_transactions" IS 'Compat view. Canonical table lives in pass.loyalty_transactions.';



CREATE SEQUENCE IF NOT EXISTS "public"."lpn_sequence"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."lpn_sequence" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."order_conversations" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "order_id" "uuid" NOT NULL,
    "site_id" "uuid" NOT NULL,
    "client_id" "uuid" NOT NULL,
    "status" "text" DEFAULT 'open'::"text" NOT NULL,
    "last_message_at" timestamp with time zone,
    "last_client_read_at" timestamp with time zone,
    "last_staff_read_at" timestamp with time zone,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "order_conversations_status_check" CHECK (("status" = ANY (ARRAY['open'::"text", 'waiting_staff'::"text", 'waiting_client'::"text", 'closed'::"text"])))
);


ALTER TABLE "public"."order_conversations" OWNER TO "postgres";


COMMENT ON TABLE "public"."order_conversations" IS 'Conversaciones de texto ligadas a pedidos cliente-sede.';



CREATE TABLE IF NOT EXISTS "public"."order_items" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "order_id" "uuid" NOT NULL,
    "product_id" "uuid" NOT NULL,
    "quantity" numeric DEFAULT '1'::numeric NOT NULL,
    "unit_price" numeric DEFAULT '0'::numeric NOT NULL,
    "total_amount" numeric DEFAULT '0'::numeric NOT NULL,
    "notes" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "seat_number" integer,
    "course" "text" DEFAULT 'main'::"text",
    "status" "text" DEFAULT 'pending'::"text",
    "sent_at" timestamp with time zone,
    "allergy_alert" "text",
    "is_comped" boolean DEFAULT false,
    "comp_reason" "text"
);


ALTER TABLE "public"."order_items" OWNER TO "postgres";


COMMENT ON TABLE "public"."order_items" IS 'Core ΓÇô tabla can├│nica para l├¡neas de pedido. Detalle de productos, cantidades y precios asociados a cada order.';



CREATE TABLE IF NOT EXISTS "public"."order_messages" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "conversation_id" "uuid" NOT NULL,
    "order_id" "uuid" NOT NULL,
    "site_id" "uuid" NOT NULL,
    "author_id" "uuid" NOT NULL,
    "author_type" "text" NOT NULL,
    "body" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "order_messages_author_type_check" CHECK (("author_type" = ANY (ARRAY['client'::"text", 'staff'::"text", 'system'::"text"]))),
    CONSTRAINT "order_messages_body_not_blank" CHECK (("length"("btrim"("body")) > 0))
);


ALTER TABLE "public"."order_messages" OWNER TO "postgres";


COMMENT ON TABLE "public"."order_messages" IS 'Mensajes de chat por pedido entre cliente y staff.';



CREATE TABLE IF NOT EXISTS "public"."order_status_events" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "order_id" "uuid" NOT NULL,
    "site_id" "uuid" NOT NULL,
    "changed_by" "uuid",
    "actor_type" "text" DEFAULT 'staff'::"text" NOT NULL,
    "operation" "text" NOT NULL,
    "from_status" "text",
    "to_status" "text",
    "from_dispatch_status" "text",
    "to_dispatch_status" "text",
    "dispatch_partner" "text",
    "dispatch_reference" "text",
    "metadata" "jsonb" DEFAULT '{}'::"jsonb" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "order_status_events_actor_type_check" CHECK (("actor_type" = ANY (ARRAY['staff'::"text", 'system'::"text", 'client'::"text"])))
);


ALTER TABLE "public"."order_status_events" OWNER TO "postgres";


COMMENT ON TABLE "public"."order_status_events" IS 'Bit├ícora operativa de cambios de estado y despacho por pedido.';



CREATE TABLE IF NOT EXISTS "public"."orders" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "client_id" "uuid",
    "order_type" "text" DEFAULT 'dine_in'::"text" NOT NULL,
    "source" "text" DEFAULT 'vento_os'::"text" NOT NULL,
    "table_number" "text",
    "status" "text" DEFAULT 'pending'::"text" NOT NULL,
    "payment_status" "text" DEFAULT 'unpaid'::"text" NOT NULL,
    "total_amount" numeric DEFAULT '0'::numeric NOT NULL,
    "notes" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "inventory_processed" boolean DEFAULT false NOT NULL,
    "loyalty_processed" boolean DEFAULT false NOT NULL,
    "loyalty_points_awarded" integer DEFAULT 0 NOT NULL,
    "guest_info" "jsonb" DEFAULT '{}'::"jsonb",
    "site_id" "uuid",
    "session_id" "uuid",
    "server_id" "uuid",
    "split_type" "text",
    "discount_amount" numeric DEFAULT 0,
    "discount_reason" "text",
    "voided_at" timestamp with time zone,
    "voided_by" "uuid",
    "void_reason" "text",
    "fulfillment_type" "text" DEFAULT 'on_premise'::"text" NOT NULL,
    "requested_for" timestamp with time zone,
    "contact_phone" "text",
    "delivery_address" "jsonb" DEFAULT '{}'::"jsonb" NOT NULL,
    "delivery_zone" "text",
    "delivery_fee_amount" numeric DEFAULT 0 NOT NULL,
    "dispatch_status" "text" DEFAULT 'not_required'::"text" NOT NULL,
    "dispatch_partner" "text",
    "dispatch_reference" "text",
    "confirmed_at" timestamp with time zone,
    "ready_for_dispatch_at" timestamp with time zone,
    "on_the_way_at" timestamp with time zone,
    "delivered_at" timestamp with time zone,
    "cancelled_at" timestamp with time zone,
    "subtotal_amount" numeric DEFAULT 0 NOT NULL,
    "payment_provider" "text",
    "payment_reference" "text",
    "payment_intent_id" "uuid",
    "checkout_expires_at" timestamp with time zone,
    CONSTRAINT "orders_delivery_address_object_check" CHECK (("jsonb_typeof"("delivery_address") = 'object'::"text")),
    CONSTRAINT "orders_delivery_fee_amount_nonnegative_check" CHECK (("delivery_fee_amount" >= (0)::numeric)),
    CONSTRAINT "orders_dispatch_status_check" CHECK (("dispatch_status" = ANY (ARRAY['not_required'::"text", 'pending'::"text", 'scheduled'::"text", 'assigned'::"text", 'on_the_way'::"text", 'delivered'::"text", 'cancelled'::"text"]))),
    CONSTRAINT "orders_fulfillment_type_check" CHECK (("fulfillment_type" = ANY (ARRAY['on_premise'::"text", 'pickup'::"text", 'delivery'::"text"])))
);


ALTER TABLE "public"."orders" OWNER TO "postgres";


COMMENT ON TABLE "public"."orders" IS 'Core ΓÇô tabla can├│nica para pedidos de clientes. Registro maestro de ├│rdenes de venta/consumo con soporte MVP para on premise, pickup y delivery.';



COMMENT ON COLUMN "public"."orders"."fulfillment_type" IS 'MVP pedidos: define si la orden es consumo interno, pickup o delivery.';



COMMENT ON COLUMN "public"."orders"."delivery_address" IS 'MVP pedidos: direccion estructurada para delivery, incluyendo referencia, barrio y detalles del destino.';



COMMENT ON COLUMN "public"."orders"."dispatch_status" IS 'MVP pedidos: estado operativo del despacho cuando fulfillment_type = delivery.';



CREATE OR REPLACE VIEW "public"."pass_delivery_distance_rates" AS
 SELECT "id",
    "site_id",
    "distance_km",
    "eta_minutes",
    "customer_fee_amount",
    "label",
    "sort_order",
    "is_active",
    "created_at",
    "updated_at"
   FROM "pass"."delivery_distance_rates"
  WHERE ("is_active" = true);


ALTER VIEW "public"."pass_delivery_distance_rates" OWNER TO "postgres";


CREATE OR REPLACE VIEW "public"."pass_satellites" WITH ("security_invoker"='true') AS
 SELECT "id",
    "code",
    "name",
    "subtitle",
    "tags",
    "site_id",
    "logo_url",
    "watermark_icon",
    "gradient_start",
    "gradient_end",
    "accent_color",
    "primary_color",
    "background_color",
    "text_color",
    "text_secondary_color",
    "card_color",
    "border_color",
    "indicator_color",
    "loading_color",
    "review_url",
    "maps_url",
    "address_override",
    "latitude_override",
    "longitude_override",
    "sort_order",
    "is_active",
    "created_at",
    "updated_at",
    "card_logo_url",
    "header_logo_url"
   FROM "pass"."pass_satellites";


ALTER VIEW "public"."pass_satellites" OWNER TO "postgres";


COMMENT ON VIEW "public"."pass_satellites" IS 'Compat view. Canonical table lives in pass.pass_satellites.';



CREATE OR REPLACE VIEW "public"."pos_cash_movements" WITH ("security_invoker"='true') AS
 SELECT "id",
    "shift_id",
    "type",
    "amount",
    "payment_method",
    "reference",
    "description",
    "order_id",
    "created_by",
    "created_at"
   FROM "pos"."pos_cash_movements";


ALTER VIEW "public"."pos_cash_movements" OWNER TO "postgres";


COMMENT ON VIEW "public"."pos_cash_movements" IS 'Compat view. Canonical table lives in pos.pos_cash_movements.';



CREATE OR REPLACE VIEW "public"."pos_cash_shifts" WITH ("security_invoker"='true') AS
 SELECT "id",
    "site_id",
    "employee_id",
    "status",
    "opened_at",
    "closed_at",
    "opening_amount",
    "expected_amount",
    "counted_amount",
    "difference",
    "notes",
    "created_at"
   FROM "pos"."pos_cash_shifts";


ALTER VIEW "public"."pos_cash_shifts" OWNER TO "postgres";


COMMENT ON VIEW "public"."pos_cash_shifts" IS 'Compat view. Canonical table lives in pos.pos_cash_shifts.';



CREATE OR REPLACE VIEW "public"."pos_modifier_options" WITH ("security_invoker"='true') AS
 SELECT "id",
    "modifier_id",
    "name",
    "price_adjustment",
    "display_order",
    "is_default",
    "is_active",
    "created_at"
   FROM "pos"."pos_modifier_options";


ALTER VIEW "public"."pos_modifier_options" OWNER TO "postgres";


COMMENT ON VIEW "public"."pos_modifier_options" IS 'Compat view. Canonical table lives in pos.pos_modifier_options.';



CREATE OR REPLACE VIEW "public"."pos_modifiers" WITH ("security_invoker"='true') AS
 SELECT "id",
    "site_id",
    "name",
    "type",
    "is_required",
    "min_selections",
    "max_selections",
    "display_order",
    "is_active",
    "created_at"
   FROM "pos"."pos_modifiers";


ALTER VIEW "public"."pos_modifiers" OWNER TO "postgres";


COMMENT ON VIEW "public"."pos_modifiers" IS 'Compat view. Canonical table lives in pos.pos_modifiers.';



CREATE OR REPLACE VIEW "public"."pos_order_item_modifiers" WITH ("security_invoker"='true') AS
 SELECT "id",
    "order_item_id",
    "modifier_id",
    "modifier_option_id",
    "price_adjustment",
    "created_at"
   FROM "pos"."pos_order_item_modifiers";


ALTER VIEW "public"."pos_order_item_modifiers" OWNER TO "postgres";


COMMENT ON VIEW "public"."pos_order_item_modifiers" IS 'Compat view. Canonical table lives in pos.pos_order_item_modifiers.';



CREATE OR REPLACE VIEW "public"."pos_payments" WITH ("security_invoker"='true') AS
 SELECT "id",
    "order_id",
    "session_id",
    "shift_id",
    "payment_method",
    "amount",
    "tip_amount",
    "reference",
    "status",
    "processed_by",
    "created_at"
   FROM "pos"."pos_payments";


ALTER VIEW "public"."pos_payments" OWNER TO "postgres";


COMMENT ON VIEW "public"."pos_payments" IS 'Compat view. Canonical table lives in pos.pos_payments.';



CREATE OR REPLACE VIEW "public"."pos_product_modifiers" WITH ("security_invoker"='true') AS
 SELECT "id",
    "product_id",
    "modifier_id",
    "display_order",
    "created_at"
   FROM "pos"."pos_product_modifiers";


ALTER VIEW "public"."pos_product_modifiers" OWNER TO "postgres";


COMMENT ON VIEW "public"."pos_product_modifiers" IS 'Compat view. Canonical table lives in pos.pos_product_modifiers.';



CREATE OR REPLACE VIEW "public"."pos_session_orders" WITH ("security_invoker"='true') AS
 SELECT "id",
    "session_id",
    "order_id",
    "seat_number",
    "course",
    "course_status",
    "fired_at",
    "created_at"
   FROM "pos"."pos_session_orders";


ALTER VIEW "public"."pos_session_orders" OWNER TO "postgres";


COMMENT ON VIEW "public"."pos_session_orders" IS 'Compat view. Canonical table lives in pos.pos_session_orders.';



CREATE OR REPLACE VIEW "public"."pos_sessions" WITH ("security_invoker"='true') AS
 SELECT "id",
    "site_id",
    "table_id",
    "server_id",
    "status",
    "pax",
    "opened_at",
    "closed_at",
    "notes",
    "created_at",
    "updated_at"
   FROM "pos"."pos_sessions";


ALTER VIEW "public"."pos_sessions" OWNER TO "postgres";


COMMENT ON VIEW "public"."pos_sessions" IS 'Compat view. Canonical table lives in pos.pos_sessions.';



CREATE OR REPLACE VIEW "public"."pos_table_call_devices" WITH ("security_invoker"='true') AS
 SELECT "id",
    "site_id",
    "table_id",
    "device_type",
    "device_vendor",
    "device_model",
    "device_code",
    "is_active",
    "metadata",
    "created_at",
    "updated_at"
   FROM "pos"."pos_table_call_devices";


ALTER VIEW "public"."pos_table_call_devices" OWNER TO "postgres";


COMMENT ON VIEW "public"."pos_table_call_devices" IS 'Compat view. Canonical table lives in pos.pos_table_call_devices.';



CREATE OR REPLACE VIEW "public"."pos_table_service_calls" WITH ("security_invoker"='true') AS
 SELECT "id",
    "site_id",
    "zone_id",
    "table_id",
    "session_id",
    "device_id",
    "source_type",
    "request_type",
    "status",
    "priority",
    "notes",
    "payload",
    "created_by",
    "assigned_to",
    "created_at",
    "acknowledged_at",
    "resolved_at",
    "cancelled_at",
    "updated_at"
   FROM "pos"."pos_table_service_calls";


ALTER VIEW "public"."pos_table_service_calls" OWNER TO "postgres";


COMMENT ON VIEW "public"."pos_table_service_calls" IS 'Compat view. Canonical table lives in pos.pos_table_service_calls.';



CREATE OR REPLACE VIEW "public"."pos_tables" WITH ("security_invoker"='true') AS
 SELECT "id",
    "site_id",
    "zone_id",
    "name",
    "table_number",
    "shape",
    "capacity",
    "position_x",
    "position_y",
    "rotation",
    "width",
    "height",
    "is_active",
    "created_at",
    "updated_at"
   FROM "pos"."pos_tables";


ALTER VIEW "public"."pos_tables" OWNER TO "postgres";


COMMENT ON VIEW "public"."pos_tables" IS 'Compat view. Canonical table lives in pos.pos_tables.';



CREATE OR REPLACE VIEW "public"."pos_zones" WITH ("security_invoker"='true') AS
 SELECT "id",
    "site_id",
    "name",
    "color",
    "display_order",
    "is_active",
    "created_at"
   FROM "pos"."pos_zones";


ALTER VIEW "public"."pos_zones" OWNER TO "postgres";


COMMENT ON VIEW "public"."pos_zones" IS 'Compat view. Canonical table lives in pos.pos_zones.';



CREATE TABLE IF NOT EXISTS "public"."printing_label_templates" (
    "id" "text" NOT NULL,
    "user_id" "uuid" NOT NULL,
    "app_id" "text" DEFAULT 'nexo'::"text" NOT NULL,
    "name" "text" NOT NULL,
    "template" "jsonb" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."printing_label_templates" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."procurement_agreed_prices" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "supplier_id" "uuid" NOT NULL,
    "product_id" "uuid" NOT NULL,
    "agreed_price" numeric NOT NULL,
    "currency" "text" DEFAULT 'COP'::"text",
    "valid_from" timestamp with time zone DEFAULT "now"(),
    "valid_until" timestamp with time zone,
    "is_active" boolean DEFAULT true
);


ALTER TABLE "public"."procurement_agreed_prices" OWNER TO "postgres";


COMMENT ON TABLE "public"."procurement_agreed_prices" IS 'Core ΓÇô tabla can├│nica para precios acordados con proveedores. Almacena tarifas vigentes por supplier+product para negociar/planificar compras.';



CREATE TABLE IF NOT EXISTS "public"."procurement_reception_items" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "reception_id" "uuid" NOT NULL,
    "product_id" "uuid" NOT NULL,
    "quantity_declared" numeric NOT NULL,
    "quantity_received" numeric NOT NULL,
    "discrepancy" numeric GENERATED ALWAYS AS (("quantity_received" - "quantity_declared")) STORED
);


ALTER TABLE "public"."procurement_reception_items" OWNER TO "postgres";


COMMENT ON TABLE "public"."procurement_reception_items" IS 'Core ΓÇô tabla can├│nica para ├¡tems de recepci├│n de compra. Detalle de cantidades recibidas y discrepancias por recepci├│n.';



CREATE TABLE IF NOT EXISTS "public"."procurement_receptions" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "purchase_order_id" "uuid" NOT NULL,
    "received_by" "uuid" NOT NULL,
    "received_at" timestamp with time zone DEFAULT "now"(),
    "site_id" "uuid",
    "evidence_photo_url" "text" NOT NULL,
    "weight_source" "text" DEFAULT 'MANUAL'::"text",
    "notes" "text",
    "geolocation" "jsonb"
);


ALTER TABLE "public"."procurement_receptions" OWNER TO "postgres";


COMMENT ON TABLE "public"."procurement_receptions" IS 'Core ΓÇô tabla can├│nica para recepciones de compras. Registra el acto de recepci├│n f├¡sico/fecha/evidencia por purchase_order.';



CREATE TABLE IF NOT EXISTS "public"."product_asset_maintenance_events" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "product_id" "uuid" NOT NULL,
    "scheduled_date" "date",
    "performed_date" "date",
    "responsible" "text",
    "maintenance_provider" "text",
    "work_done" "text",
    "parts_replaced" boolean DEFAULT false NOT NULL,
    "replaced_parts" "text",
    "planner_bucket" "text" DEFAULT 'mensual'::"text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "timezone"('utc'::"text", "now"()) NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "timezone"('utc'::"text", "now"()) NOT NULL,
    CONSTRAINT "product_asset_maintenance_events_planner_bucket_chk" CHECK (("planner_bucket" = ANY (ARRAY['correctivo'::"text", 'semanal'::"text", 'mensual'::"text", 'trimestral'::"text", 'semestral'::"text", 'anual'::"text"])))
);


ALTER TABLE "public"."product_asset_maintenance_events" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."product_asset_profiles" (
    "product_id" "uuid" NOT NULL,
    "brand" "text",
    "model" "text",
    "serial_number" "text",
    "physical_location" "text",
    "purchase_invoice_url" "text",
    "commercial_value" numeric(14,2),
    "purchase_date" "date",
    "started_use_date" "date",
    "equipment_status" "text" DEFAULT 'operativo'::"text" NOT NULL,
    "maintenance_service_provider" "text",
    "technical_description" "text",
    "created_at" timestamp with time zone DEFAULT "timezone"('utc'::"text", "now"()) NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "timezone"('utc'::"text", "now"()) NOT NULL,
    "maintenance_cycle_enabled" boolean DEFAULT false NOT NULL,
    "maintenance_cycle_months" integer,
    "maintenance_cycle_anchor_date" "date",
    CONSTRAINT "product_asset_profiles_maintenance_cycle_months_chk" CHECK ((("maintenance_cycle_months" IS NULL) OR (("maintenance_cycle_months" >= 1) AND ("maintenance_cycle_months" <= 60)))),
    CONSTRAINT "product_asset_profiles_status_chk" CHECK (("equipment_status" = ANY (ARRAY['operativo'::"text", 'en_mantenimiento'::"text", 'fuera_servicio'::"text", 'baja'::"text"])))
);


ALTER TABLE "public"."product_asset_profiles" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."product_asset_transfer_events" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "product_id" "uuid" NOT NULL,
    "moved_at" "date",
    "from_location" "text",
    "to_location" "text",
    "responsible" "text",
    "notes" "text",
    "created_at" timestamp with time zone DEFAULT "timezone"('utc'::"text", "now"()) NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "timezone"('utc'::"text", "now"()) NOT NULL
);


ALTER TABLE "public"."product_asset_transfer_events" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."product_categories" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "name" "text" NOT NULL,
    "slug" "text",
    "description" "text",
    "display_order" integer,
    "is_active" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "domain" "text",
    "parent_id" "uuid",
    "updated_at" timestamp with time zone,
    "site_id" "uuid",
    "applies_to_kinds" "text"[] DEFAULT ARRAY['insumo'::"text", 'preparacion'::"text", 'venta'::"text", 'equipo'::"text"] NOT NULL,
    CONSTRAINT "product_categories_applies_to_kinds_allowed_chk" CHECK (("applies_to_kinds" <@ ARRAY['insumo'::"text", 'preparacion'::"text", 'venta'::"text", 'equipo'::"text"])),
    CONSTRAINT "product_categories_applies_to_kinds_nonempty_chk" CHECK (("cardinality"("applies_to_kinds") > 0)),
    CONSTRAINT "product_categories_domain_requires_venta_chk" CHECK (((NULLIF(TRIM(BOTH FROM "domain"), ''::"text") IS NULL) OR ("applies_to_kinds" @> ARRAY['venta'::"text"])))
);


ALTER TABLE "public"."product_categories" OWNER TO "postgres";


COMMENT ON TABLE "public"."product_categories" IS 'Core ΓÇô tabla can├│nica para categor├¡as de productos. Clasificaci├│n can├│nica usada por products (referenciar por category_id) en nuevas implementaciones.';



COMMENT ON COLUMN "public"."product_categories"."description" IS 'Descripcion operativa de referencia para clasificar items. Opcional para categorias de venta.';



COMMENT ON COLUMN "public"."product_categories"."site_id" IS 'Sede espec├¡fica de la categor├¡a. NULL = categor├¡a global compartida entre todas las sedes';



COMMENT ON COLUMN "public"."product_categories"."applies_to_kinds" IS 'Tipos logicos donde aplica la categoria: insumo, preparacion, venta, equipo.';



CREATE TABLE IF NOT EXISTS "public"."product_categories_backup_20260316_preparaciones" (
    "id" "uuid",
    "name" "text",
    "slug" "text",
    "description" "text",
    "display_order" integer,
    "is_active" boolean,
    "created_at" timestamp with time zone,
    "domain" "text",
    "parent_id" "uuid",
    "updated_at" timestamp with time zone,
    "site_id" "uuid",
    "applies_to_kinds" "text"[]
);


ALTER TABLE "public"."product_categories_backup_20260316_preparaciones" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."product_cost_events" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "product_id" "uuid" NOT NULL,
    "site_id" "uuid",
    "source" "text" NOT NULL,
    "source_entry_id" "uuid",
    "source_adjust_movement_id" "uuid",
    "qty_before" numeric DEFAULT 0 NOT NULL,
    "qty_in" numeric DEFAULT 0 NOT NULL,
    "cost_before" numeric DEFAULT 0 NOT NULL,
    "cost_in" numeric DEFAULT 0 NOT NULL,
    "cost_after" numeric DEFAULT 0 NOT NULL,
    "basis" "text" DEFAULT 'net'::"text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "created_by" "uuid",
    CONSTRAINT "product_cost_events_basis_chk" CHECK (("basis" = ANY (ARRAY['net'::"text", 'gross'::"text"]))),
    CONSTRAINT "product_cost_events_source_chk" CHECK (("source" = ANY (ARRAY['entry'::"text", 'adjust'::"text", 'production'::"text"])))
);


ALTER TABLE "public"."product_cost_events" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."product_images" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "product_id" "uuid" NOT NULL,
    "image_url" "text" NOT NULL,
    "kind" "text" DEFAULT 'product'::"text" NOT NULL,
    "label" "text",
    "source" "text" DEFAULT 'upload'::"text" NOT NULL,
    "is_active" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "created_by" "uuid"
);


ALTER TABLE "public"."product_images" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."product_inventory_profiles" (
    "product_id" "uuid" NOT NULL,
    "track_inventory" boolean DEFAULT true NOT NULL,
    "inventory_kind" "text" DEFAULT 'unclassified'::"text" NOT NULL,
    "default_unit" "text",
    "lot_tracking" boolean DEFAULT false NOT NULL,
    "expiry_tracking" boolean DEFAULT false NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "unit_family" "text",
    "costing_mode" "text" DEFAULT 'auto_primary_supplier'::"text" NOT NULL,
    CONSTRAINT "product_inventory_profiles_costing_mode_chk" CHECK (("costing_mode" = ANY (ARRAY['auto_primary_supplier'::"text", 'manual'::"text"]))),
    CONSTRAINT "product_inventory_profiles_kind_chk" CHECK (("inventory_kind" = ANY (ARRAY['ingredient'::"text", 'finished'::"text", 'resale'::"text", 'packaging'::"text", 'asset'::"text", 'unclassified'::"text"]))),
    CONSTRAINT "product_inventory_profiles_unit_family_chk" CHECK ((("unit_family" = ANY (ARRAY['volume'::"text", 'mass'::"text", 'count'::"text"])) OR ("unit_family" IS NULL)))
);


ALTER TABLE "public"."product_inventory_profiles" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."product_sku_aliases" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "product_id" "uuid" NOT NULL,
    "sku" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."product_sku_aliases" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."product_sku_sequences" (
    "brand_code" "text" NOT NULL,
    "type_code" "text" NOT NULL,
    "last_value" integer DEFAULT 0 NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."product_sku_sequences" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."product_suppliers" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "product_id" "uuid" NOT NULL,
    "supplier_id" "uuid" NOT NULL,
    "supplier_sku" "text",
    "purchase_unit" "text",
    "purchase_unit_size" numeric,
    "purchase_price" numeric,
    "currency" "text" DEFAULT 'COP'::"text" NOT NULL,
    "lead_time_days" integer,
    "min_order_qty" numeric,
    "is_primary" boolean DEFAULT false NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "purchase_pack_qty" numeric,
    "purchase_pack_unit_code" "text",
    "purchase_price_net" numeric,
    "purchase_price_includes_tax" boolean DEFAULT false NOT NULL,
    "purchase_tax_rate" numeric DEFAULT 0 NOT NULL,
    "purchase_price_includes_icui" boolean DEFAULT false NOT NULL,
    "purchase_icui_rate" numeric DEFAULT 0 NOT NULL,
    CONSTRAINT "product_suppliers_purchase_icui_rate_nonnegative_chk" CHECK (("purchase_icui_rate" >= (0)::numeric)),
    CONSTRAINT "product_suppliers_purchase_pack_qty_chk" CHECK ((("purchase_pack_qty" IS NULL) OR ("purchase_pack_qty" > (0)::numeric))),
    CONSTRAINT "product_suppliers_purchase_tax_rate_nonnegative_chk" CHECK (("purchase_tax_rate" >= (0)::numeric))
);


ALTER TABLE "public"."product_suppliers" OWNER TO "postgres";


COMMENT ON TABLE "public"."product_suppliers" IS 'Core ΓÇô tabla can├│nica para relaci├│n productoΓåöproveedor. Define proveedores asociados a productos, SKUs proveedor y condiciones de compra.';



COMMENT ON COLUMN "public"."product_suppliers"."purchase_price_net" IS 'Precio neto sin impuestos incluidos (considera IVA y/o ICUI cuando aplique).';



COMMENT ON COLUMN "public"."product_suppliers"."purchase_price_includes_tax" IS 'Indica si purchase_price viene con impuesto incluido.';



COMMENT ON COLUMN "public"."product_suppliers"."purchase_tax_rate" IS 'Tasa de impuesto aplicada al precio de compra (porcentaje, ej. 19 para 19%).';



COMMENT ON COLUMN "public"."product_suppliers"."purchase_price_includes_icui" IS 'Indica si purchase_price viene con ICUI incluido.';



COMMENT ON COLUMN "public"."product_suppliers"."purchase_icui_rate" IS 'Tasa ICUI aplicada al precio de compra (porcentaje).';



CREATE TABLE IF NOT EXISTS "public"."product_uom_profiles" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "product_id" "uuid" NOT NULL,
    "label" "text" NOT NULL,
    "input_unit_code" "text" NOT NULL,
    "qty_in_input_unit" numeric NOT NULL,
    "qty_in_stock_unit" numeric NOT NULL,
    "is_default" boolean DEFAULT false NOT NULL,
    "is_active" boolean DEFAULT true NOT NULL,
    "source" "text" DEFAULT 'manual'::"text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "usage_context" "text" DEFAULT 'general'::"text" NOT NULL,
    "image_url" "text",
    "catalog_image_url" "text",
    CONSTRAINT "product_uom_profiles_qty_input_chk" CHECK (("qty_in_input_unit" > (0)::numeric)),
    CONSTRAINT "product_uom_profiles_qty_stock_chk" CHECK (("qty_in_stock_unit" > (0)::numeric)),
    CONSTRAINT "product_uom_profiles_source_chk" CHECK (("source" = ANY (ARRAY['manual'::"text", 'supplier_primary'::"text", 'recipe_portion'::"text"]))),
    CONSTRAINT "product_uom_profiles_usage_context_chk" CHECK (("usage_context" = ANY (ARRAY['general'::"text", 'purchase'::"text", 'remission'::"text"])))
);


ALTER TABLE "public"."product_uom_profiles" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."production_batch_consumptions" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "batch_id" "uuid" NOT NULL,
    "ingredient_product_id" "uuid" NOT NULL,
    "location_id" "uuid" NOT NULL,
    "required_qty" numeric DEFAULT 0 NOT NULL,
    "consumed_qty" numeric DEFAULT 0 NOT NULL,
    "stock_unit_code" "text" NOT NULL,
    "movement_id" "uuid",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "created_by" "uuid",
    CONSTRAINT "production_batch_consumptions_consumed_qty_chk" CHECK (("consumed_qty" >= (0)::numeric)),
    CONSTRAINT "production_batch_consumptions_required_qty_chk" CHECK (("required_qty" >= (0)::numeric))
);


ALTER TABLE "public"."production_batch_consumptions" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."production_batches" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "site_id" "uuid" NOT NULL,
    "product_id" "uuid" NOT NULL,
    "recipe_card_id" "uuid",
    "produced_qty" numeric NOT NULL,
    "produced_unit" "text" NOT NULL,
    "total_cost" numeric,
    "unit_cost" numeric,
    "status" "text" DEFAULT 'posted'::"text" NOT NULL,
    "notes" "text",
    "created_by" "uuid",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "batch_code" "text",
    "expires_at" timestamp with time zone,
    "destination_location_id" "uuid",
    "recipe_consumed" boolean DEFAULT false NOT NULL
);


ALTER TABLE "public"."production_batches" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."production_request_items" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "request_id" "uuid" NOT NULL,
    "product_id" "uuid" NOT NULL,
    "recipe_id" "uuid",
    "quantity" numeric DEFAULT '0'::numeric,
    "unit" "text",
    "requested_quantity" numeric DEFAULT '0'::numeric NOT NULL,
    "produced_quantity" numeric DEFAULT '0'::numeric NOT NULL,
    "loaded_quantity" numeric DEFAULT '0'::numeric NOT NULL,
    "received_quantity" numeric DEFAULT '0'::numeric NOT NULL,
    "stage_status" "text" DEFAULT '''pending'''::"text" NOT NULL,
    "production_area_kind" "text" DEFAULT 'general'::"text"
);


ALTER TABLE "public"."production_request_items" OWNER TO "postgres";


COMMENT ON TABLE "public"."production_request_items" IS 'Core ΓÇô tabla can├│nica para ├¡tems de producci├│n. Detalle de productos/recetas y cantidades asociadas a cada producci├│n.';



CREATE TABLE IF NOT EXISTS "public"."production_requests" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "created_by" "uuid",
    "from_location" "text" NOT NULL,
    "to_location" "text" NOT NULL,
    "status" "text" DEFAULT '''pending'''::"text" NOT NULL,
    "needed_for_date" "date",
    "notes" "text",
    "from_site_id" "uuid",
    "to_site_id" "uuid"
);


ALTER TABLE "public"."production_requests" OWNER TO "postgres";


COMMENT ON TABLE "public"."production_requests" IS 'Core ΓÇô tabla can├│nica para solicitudes de producci├│n. Coordina producci├│n interna desde inventario/recetas entre sitios.';



CREATE TABLE IF NOT EXISTS "public"."purchase_order_items" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "purchase_order_id" "uuid" NOT NULL,
    "product_id" "uuid" NOT NULL,
    "quantity_ordered" numeric NOT NULL,
    "quantity_received" numeric,
    "unit_cost" numeric NOT NULL,
    "line_total" numeric,
    "unit" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "input_uom_profile_id" "uuid",
    "input_unit_code" "text",
    "input_unit_label" "text",
    "conversion_factor_to_stock" numeric,
    "stock_unit_code" "text",
    "stock_quantity_ordered" numeric,
    "stock_unit_cost" numeric,
    CONSTRAINT "purchase_order_items_conversion_factor_to_stock_chk" CHECK ((("conversion_factor_to_stock" IS NULL) OR ("conversion_factor_to_stock" > (0)::numeric))),
    CONSTRAINT "purchase_order_items_stock_quantity_ordered_chk" CHECK ((("stock_quantity_ordered" IS NULL) OR ("stock_quantity_ordered" >= (0)::numeric))),
    CONSTRAINT "purchase_order_items_stock_unit_cost_chk" CHECK ((("stock_unit_cost" IS NULL) OR ("stock_unit_cost" >= (0)::numeric)))
);


ALTER TABLE "public"."purchase_order_items" OWNER TO "postgres";


COMMENT ON TABLE "public"."purchase_order_items" IS 'Core ΓÇô tabla can├│nica para l├¡neas de ├│rdenes de compra. Detalle de productos, cantidades y costos por purchase_order.';



CREATE TABLE IF NOT EXISTS "public"."purchase_orders" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "supplier_id" "uuid" NOT NULL,
    "site_id" "uuid" NOT NULL,
    "status" "text" DEFAULT 'draft'::"text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "expected_at" timestamp with time zone,
    "received_at" timestamp with time zone,
    "total_amount" numeric,
    "currency" "text" DEFAULT 'COP'::"text" NOT NULL,
    "notes" "text",
    "cost_center_id" "uuid",
    "approved_by" "uuid",
    "approval_date" timestamp with time zone,
    "created_by" "uuid" DEFAULT "auth"."uid"()
);


ALTER TABLE "public"."purchase_orders" OWNER TO "postgres";


COMMENT ON TABLE "public"."purchase_orders" IS 'Core ΓÇô tabla can├│nica para ├│rdenes de compra a proveedores. Registra pedidos, estado y metadatos para recepci├│n y pagos.';



CREATE TABLE IF NOT EXISTS "public"."recipe_steps" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "recipe_card_id" "uuid" NOT NULL,
    "step_number" integer NOT NULL,
    "description" "text" NOT NULL,
    "tip" "text",
    "time_minutes" integer,
    "image_path" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "step_image_url" "text",
    "step_video_url" "text",
    CONSTRAINT "recipe_steps_step_number_positive" CHECK (("step_number" > 0)),
    CONSTRAINT "recipe_steps_time_minutes_positive" CHECK ((("time_minutes" IS NULL) OR ("time_minutes" >= 0)))
);


ALTER TABLE "public"."recipe_steps" OWNER TO "postgres";


COMMENT ON COLUMN "public"."recipe_steps"."step_image_url" IS 'Foto opcional para documentar visualmente el paso de la receta.';



COMMENT ON COLUMN "public"."recipe_steps"."step_video_url" IS 'URL opcional de video para el paso de la receta (YouTube, Drive u origen interno).';



CREATE TABLE IF NOT EXISTS "public"."required_document_rules" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "site_id" "uuid",
    "role" "text",
    "document_type_id" "uuid" NOT NULL,
    "is_required" boolean DEFAULT true NOT NULL,
    "active" boolean DEFAULT true NOT NULL,
    "display_order" integer DEFAULT 999 NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."required_document_rules" OWNER TO "postgres";


COMMENT ON TABLE "public"."required_document_rules" IS 'Reglas de documentos requeridos para elegibilidad carnet laboral; site_id/role null = global.';



CREATE TABLE IF NOT EXISTS "public"."restock_request_item_picks" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "request_id" "uuid" NOT NULL,
    "item_id" "uuid" NOT NULL,
    "product_id" "uuid" NOT NULL,
    "source_location_id" "uuid" NOT NULL,
    "source_location_position_id" "uuid",
    "uom_profile_id" "uuid",
    "presentation_qty" numeric DEFAULT 0 NOT NULL,
    "base_qty" numeric DEFAULT 0 NOT NULL,
    "note" "text",
    "created_by" "uuid" DEFAULT "auth"."uid"(),
    "updated_by" "uuid",
    CONSTRAINT "restock_request_item_picks_base_qty_positive_chk" CHECK (("base_qty" > (0)::numeric)),
    CONSTRAINT "restock_request_item_picks_presentation_qty_nonnegative_chk" CHECK (("presentation_qty" >= (0)::numeric)),
    CONSTRAINT "restock_request_item_picks_uom_profile_presentation_chk" CHECK (((("uom_profile_id" IS NULL) AND ("presentation_qty" = (0)::numeric)) OR (("uom_profile_id" IS NOT NULL) AND ("presentation_qty" > (0)::numeric))))
);


ALTER TABLE "public"."restock_request_item_picks" OWNER TO "postgres";


COMMENT ON TABLE "public"."restock_request_item_picks" IS 'Plan f├¡sico de salida para remisiones. Una l├¡nea de restock_request_items puede tener varios picks por LOC, posici├│n interna y presentaci├│n f├¡sica.';



COMMENT ON COLUMN "public"."restock_request_item_picks"."source_location_position_id" IS 'Posici├│n interna dentro del LOC origen: estanter├¡a, nivel, bin, zona interna, etc.';



COMMENT ON COLUMN "public"."restock_request_item_picks"."uom_profile_id" IS 'Presentaci├│n f├¡sica usada para el pick. Null para productos sin presentaci├│n f├¡sica espec├¡fica o productos por unidad/rendimiento.';



COMMENT ON COLUMN "public"."restock_request_item_picks"."presentation_qty" IS 'Cantidad de presentaci├│n f├¡sica despachada, cuando el pick usa product_uom_profiles. Ej: 2 potes.';



COMMENT ON COLUMN "public"."restock_request_item_picks"."base_qty" IS 'Cantidad en unidad base/stock que se despacha desde este pick.';



CREATE TABLE IF NOT EXISTS "public"."restock_request_items" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "request_id" "uuid" NOT NULL,
    "product_id" "uuid" NOT NULL,
    "quantity" numeric DEFAULT '0'::numeric NOT NULL,
    "unit" "text",
    "transfer_unit_price" numeric,
    "transfer_currency" "text",
    "transfer_total" numeric,
    "production_area_kind" "text" DEFAULT 'general'::"text",
    "prepared_quantity" numeric DEFAULT 0 NOT NULL,
    "shipped_quantity" numeric DEFAULT 0 NOT NULL,
    "received_quantity" numeric DEFAULT 0 NOT NULL,
    "shortage_quantity" numeric DEFAULT 0 NOT NULL,
    "item_status" "text" DEFAULT 'pending'::"text" NOT NULL,
    "notes" "text",
    "input_qty" numeric,
    "input_unit_code" "text",
    "conversion_factor_to_stock" numeric,
    "stock_unit_code" "text",
    "source_location_id" "uuid",
    "input_uom_profile_id" "uuid",
    "internal_price_list_id" "uuid",
    "internal_price_list_item_id" "uuid",
    "priced_at" timestamp with time zone
);


ALTER TABLE "public"."restock_request_items" OWNER TO "postgres";


COMMENT ON TABLE "public"."restock_request_items" IS 'Core ΓÇô tabla can├│nica para ├¡tems de reabastecimiento. Detalle de productos y cantidades solicitadas en cada restock_request.';



COMMENT ON COLUMN "public"."restock_request_items"."transfer_unit_price" IS 'Snapshot del precio interno unitario usado para facturar la linea. Si hay input_uom_profile_id, es precio por presentaci├│n solicitada.';



COMMENT ON COLUMN "public"."restock_request_items"."transfer_total" IS 'Subtotal interno de la linea: cantidad recibida convertida a unidad/presentaci├│n de precio por precio interno.';



COMMENT ON COLUMN "public"."restock_request_items"."internal_price_list_id" IS 'Lista de precios internos usada para valorizar la linea.';



COMMENT ON COLUMN "public"."restock_request_items"."internal_price_list_item_id" IS 'Item exacto de lista de precios usado como fuente del precio interno.';



COMMENT ON COLUMN "public"."restock_request_items"."priced_at" IS 'Momento en que se congelo el precio interno de la linea.';



CREATE TABLE IF NOT EXISTS "public"."restock_requests" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "created_by" "uuid",
    "from_location" "text" NOT NULL,
    "to_location" "text" NOT NULL,
    "status" "text" DEFAULT '''pending'''::"text" NOT NULL,
    "expected_date" "date",
    "notes" "text",
    "from_site_id" "uuid",
    "to_site_id" "uuid",
    "pricing_mode" "text" DEFAULT 'none'::"text" NOT NULL,
    "pricing_status" "text" DEFAULT 'draft'::"text" NOT NULL,
    "internal_supplier_site_id" "uuid",
    "request_code" "text",
    "requested_by_site_id" "uuid",
    "status_updated_at" timestamp with time zone DEFAULT "now"(),
    "prepared_at" timestamp with time zone,
    "prepared_by" "uuid",
    "in_transit_at" timestamp with time zone,
    "in_transit_by" "uuid",
    "received_at" timestamp with time zone,
    "received_by" "uuid",
    "cancelled_at" timestamp with time zone,
    "closed_at" timestamp with time zone,
    "priority" "text" DEFAULT 'normal'::"text",
    "request_type" "text" DEFAULT 'internal'::"text",
    "seller_cost_center_id" "uuid",
    "buyer_cost_center_id" "uuid",
    "internal_pos_document_id" "uuid",
    "priced_at" timestamp with time zone
);


ALTER TABLE "public"."restock_requests" OWNER TO "postgres";


COMMENT ON TABLE "public"."restock_requests" IS 'Core ΓÇô tabla can├│nica para solicitudes de reabastecimiento. Gestiona pedidos internos de re-stock entre ubicaciones o hacia proveedores.';



COMMENT ON COLUMN "public"."restock_requests"."seller_cost_center_id" IS 'Snapshot del centro de costo vendedor usado para facturacion interna.';



COMMENT ON COLUMN "public"."restock_requests"."buyer_cost_center_id" IS 'Snapshot del centro de costo comprador usado para facturacion interna.';



COMMENT ON COLUMN "public"."restock_requests"."internal_pos_document_id" IS 'Comprobante POS interno asociado cuando la remision queda facturada.';



COMMENT ON COLUMN "public"."restock_requests"."priced_at" IS 'Momento en que la remision fue valorizada con precios internos.';



CREATE TABLE IF NOT EXISTS "public"."role_capabilities" (
    "role" "text" NOT NULL,
    "capability" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."role_capabilities" OWNER TO "postgres";


COMMENT ON TABLE "public"."role_capabilities" IS 'Capacidades por rol (ANIMA). Ej: shift.create, team.invite. Sin filas la app usa l├│gica actual por rol.';



CREATE TABLE IF NOT EXISTS "public"."role_permissions" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "role" "text" NOT NULL,
    "permission_id" "uuid" NOT NULL,
    "scope_type" "public"."permission_scope_type" DEFAULT 'site'::"public"."permission_scope_type" NOT NULL,
    "scope_site_type" "public"."site_type",
    "scope_area_kind" "text",
    "is_allowed" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "scope_site_id" "uuid",
    "scope_area_id" "uuid",
    CONSTRAINT "role_permissions_scope_consistency_check" CHECK ((((COALESCE("scope_type", 'global'::"public"."permission_scope_type") = 'global'::"public"."permission_scope_type") AND ("scope_site_id" IS NULL) AND ("scope_area_id" IS NULL) AND ("scope_site_type" IS NULL) AND ("scope_area_kind" IS NULL)) OR (("scope_type" = 'site'::"public"."permission_scope_type") AND ("scope_area_id" IS NULL) AND ("scope_site_type" IS NULL) AND ("scope_area_kind" IS NULL)) OR (("scope_type" = 'area'::"public"."permission_scope_type") AND ("scope_site_id" IS NULL) AND ("scope_site_type" IS NULL) AND ("scope_area_kind" IS NULL)) OR (("scope_type" = 'site_type'::"public"."permission_scope_type") AND ("scope_site_type" IS NOT NULL) AND ("scope_site_id" IS NULL) AND ("scope_area_id" IS NULL) AND ("scope_area_kind" IS NULL)) OR (("scope_type" = 'area_kind'::"public"."permission_scope_type") AND ("scope_area_kind" IS NOT NULL) AND ("scope_site_id" IS NULL) AND ("scope_area_id" IS NULL) AND ("scope_site_type" IS NULL))))
);


ALTER TABLE "public"."role_permissions" OWNER TO "postgres";


COMMENT ON TABLE "public"."role_permissions" IS 'Permisos base por rol.';



CREATE TABLE IF NOT EXISTS "public"."role_site_type_rules" (
    "role" "text" NOT NULL,
    "site_type" "public"."site_type" NOT NULL,
    "is_allowed" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."role_site_type_rules" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."roles" (
    "code" "text" NOT NULL,
    "name" "text" NOT NULL,
    "description" "text",
    "is_active" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."roles" OWNER TO "postgres";


COMMENT ON TABLE "public"."roles" IS 'Catalogo canonico de roles de staff.';



CREATE OR REPLACE VIEW "public"."sell_products_by_site" WITH ("security_invoker"='true') AS
 SELECT "site_id",
    "product_id",
    "name",
    "sku",
    "description",
    "base_price",
    "recipe_cost_amount",
    "base_margin_amount",
    "base_margin_pct"
   FROM "pass"."sell_products_by_site";


ALTER VIEW "public"."sell_products_by_site" OWNER TO "postgres";


COMMENT ON VIEW "public"."sell_products_by_site" IS 'Compat view. Canonical view lives in pass.sell_products_by_site.';



CREATE TABLE IF NOT EXISTS "public"."sites" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "code" "text" NOT NULL,
    "name" "text" NOT NULL,
    "type" "text" NOT NULL,
    "is_active" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "latitude" numeric(10,8),
    "longitude" numeric(11,8),
    "address" "text",
    "site_type" "public"."site_type" DEFAULT 'satellite'::"public"."site_type" NOT NULL,
    "site_kind" "text" NOT NULL,
    "checkin_radius_meters" integer DEFAULT 50,
    "is_public" boolean DEFAULT false NOT NULL
);


ALTER TABLE "public"."sites" OWNER TO "postgres";


COMMENT ON TABLE "public"."sites" IS 'Core ΓÇô tabla can├│nica para ubicaciones (sites). Define locales/almacenes donde hay stock, movimientos y operaciones.';



COMMENT ON COLUMN "public"."sites"."latitude" IS 'Latitud de la sede para LiveMap';



COMMENT ON COLUMN "public"."sites"."longitude" IS 'Longitud de la sede para LiveMap';



COMMENT ON COLUMN "public"."sites"."address" IS 'Direcci├│n f├¡sica de la sede';



COMMENT ON COLUMN "public"."sites"."checkin_radius_meters" IS 'Radio en metros para validar check-in GPS (default 50m)';



CREATE OR REPLACE VIEW "public"."shift_calendar_view" AS
 SELECT "s"."id",
    "s"."employee_id",
    "e"."full_name" AS "employee_name",
    "e"."alias" AS "employee_alias",
    "s"."site_id",
    "si"."name" AS "site_name",
    "s"."shift_date",
    "s"."start_time",
    "s"."end_time",
    "s"."break_minutes",
    "s"."notes",
    "s"."status",
    ((EXTRACT(epoch FROM ("s"."end_time" - "s"."start_time")) / (3600)::numeric) - (("s"."break_minutes")::numeric / 60.0)) AS "scheduled_hours",
    ( SELECT "al"."occurred_at"
           FROM "public"."attendance_logs" "al"
          WHERE (("al"."employee_id" = "s"."employee_id") AND ("al"."site_id" = "s"."site_id") AND ("al"."action" = 'check_in'::"text") AND ("date"("al"."occurred_at") = "s"."shift_date"))
          ORDER BY "al"."occurred_at"
         LIMIT 1) AS "actual_check_in",
    ( SELECT "al"."occurred_at"
           FROM "public"."attendance_logs" "al"
          WHERE (("al"."employee_id" = "s"."employee_id") AND ("al"."site_id" = "s"."site_id") AND ("al"."action" = 'check_out'::"text") AND ("date"("al"."occurred_at") = "s"."shift_date"))
          ORDER BY "al"."occurred_at" DESC
         LIMIT 1) AS "actual_check_out",
    "s"."created_at",
    "s"."updated_at"
   FROM (("public"."employee_shifts" "s"
     JOIN "public"."employees" "e" ON (("e"."id" = "s"."employee_id")))
     JOIN "public"."sites" "si" ON (("si"."id" = "s"."site_id")));


ALTER VIEW "public"."shift_calendar_view" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."shift_policy" (
    "id" integer DEFAULT 1 NOT NULL,
    "publication_notice_minutes" integer DEFAULT 0 NOT NULL,
    "reminder_minutes_before_shift" integer DEFAULT 60 NOT NULL,
    "max_shift_hours_per_day" numeric DEFAULT 12 NOT NULL,
    "min_hours_between_shifts" numeric DEFAULT 0 NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "late_grace_minutes" integer DEFAULT 5 NOT NULL,
    "end_reminder_minutes_before_end" integer DEFAULT 5 NOT NULL,
    "auto_checkout_grace_minutes_after_end" integer DEFAULT 30 NOT NULL,
    "end_reminder_enabled" boolean DEFAULT true NOT NULL,
    "scheduled_auto_checkout_enabled" boolean DEFAULT true NOT NULL,
    "end_reminder_minutes_after_end" integer DEFAULT 30 NOT NULL,
    CONSTRAINT "shift_policy_id_check" CHECK (("id" = 1))
);


ALTER TABLE "public"."shift_policy" OWNER TO "postgres";


COMMENT ON TABLE "public"."shift_policy" IS 'Pol├¡ticas globales de turnos ANIMA: aviso publicaci├│n, recordatorio, m├íx horas por turno, m├¡n entre turnos.';



COMMENT ON COLUMN "public"."shift_policy"."late_grace_minutes" IS 'Minutos de tolerancia antes de marcar tardanza en reportes operativos.';



COMMENT ON COLUMN "public"."shift_policy"."end_reminder_minutes_before_end" IS 'Minutos antes del fin programado para enviar recordatorio de cierre de turno.';



COMMENT ON COLUMN "public"."shift_policy"."auto_checkout_grace_minutes_after_end" IS 'Minutos despu├⌐s del fin programado en los que el sistema puede autocerrar el turno si sigue abierto.';



COMMENT ON COLUMN "public"."shift_policy"."end_reminder_enabled" IS 'Habilita recordatorios push cerca del cierre programado.';



COMMENT ON COLUMN "public"."shift_policy"."scheduled_auto_checkout_enabled" IS 'Habilita autocierre autom├ítico por hora fin programada.';



COMMENT ON COLUMN "public"."shift_policy"."end_reminder_minutes_after_end" IS 'Minutos despues del fin programado para enviar un segundo recordatorio si el turno sigue abierto.';



CREATE TABLE IF NOT EXISTS "public"."shift_runtime_events" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "shift_id" "uuid" NOT NULL,
    "employee_id" "uuid" NOT NULL,
    "site_id" "uuid" NOT NULL,
    "event_type" "text" NOT NULL,
    "scheduled_for" timestamp with time zone,
    "processed_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "status" "text" DEFAULT 'applied'::"text" NOT NULL,
    "notes" "text",
    "payload" "jsonb" DEFAULT '{}'::"jsonb" NOT NULL,
    CONSTRAINT "shift_runtime_events_event_type_check" CHECK (("event_type" = ANY (ARRAY['end_reminder_sent'::"text", 'end_reminder_followup_sent'::"text", 'scheduled_auto_checkout'::"text"]))),
    CONSTRAINT "shift_runtime_events_status_check" CHECK (("status" = ANY (ARRAY['applied'::"text", 'skipped'::"text", 'error'::"text"])))
);


ALTER TABLE "public"."shift_runtime_events" OWNER TO "postgres";


COMMENT ON TABLE "public"."shift_runtime_events" IS 'Bit├ícora operativa de recordatorios y autocierres ejecutados sobre turnos programados.';



CREATE TABLE IF NOT EXISTS "public"."site_area_purpose_rules" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "site_id" "uuid" NOT NULL,
    "area_kind" "text" NOT NULL,
    "purpose" "text" DEFAULT 'remission'::"text" NOT NULL,
    "is_enabled" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "site_area_purpose_rules_purpose_chk" CHECK (("purpose" = ANY (ARRAY['remission'::"text", 'production_recipe'::"text"])))
);


ALTER TABLE "public"."site_area_purpose_rules" OWNER TO "postgres";


COMMENT ON TABLE "public"."site_area_purpose_rules" IS 'Reglas por sede + prop├│sito para habilitar tipos de ├írea operativa (ej. remisiones).';



COMMENT ON COLUMN "public"."site_area_purpose_rules"."purpose" IS 'Proposito operativo. Valores: remission, production_recipe.';



COMMENT ON COLUMN "public"."site_area_purpose_rules"."is_enabled" IS 'Si true, el area_kind aplica para el prop├│sito en esa sede.';



CREATE TABLE IF NOT EXISTS "public"."site_attendance_policy" (
    "site_id" "uuid" NOT NULL,
    "checkin_radius_meters" integer,
    "requires_geofence" boolean,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "site_attendance_policy_radius_positive" CHECK ((("checkin_radius_meters" IS NULL) OR ("checkin_radius_meters" > 0)))
);


ALTER TABLE "public"."site_attendance_policy" OWNER TO "postgres";


COMMENT ON TABLE "public"."site_attendance_policy" IS 'Pol├¡ticas de asistencia por sede (ANIMA). Overrides opcionales; sin fila se usa sites.checkin_radius_meters y presencia de coordenadas.';



CREATE TABLE IF NOT EXISTS "public"."site_operational_capabilities" (
    "site_id" "uuid" NOT NULL,
    "can_request_remissions" boolean DEFAULT false NOT NULL,
    "can_fulfill_remissions" boolean DEFAULT false NOT NULL,
    "can_receive_remissions" boolean DEFAULT false NOT NULL,
    "can_sell" boolean DEFAULT false NOT NULL,
    "can_produce" boolean DEFAULT false NOT NULL,
    "can_hold_inventory" boolean DEFAULT false NOT NULL,
    "is_commercial_business" boolean DEFAULT false NOT NULL,
    "show_in_product_setup" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_by" "uuid"
);


ALTER TABLE "public"."site_operational_capabilities" OWNER TO "postgres";


COMMENT ON TABLE "public"."site_operational_capabilities" IS 'Capacidades operativas configurables por sede. site_type queda como clasificacion visual/legacy.';



COMMENT ON COLUMN "public"."site_operational_capabilities"."can_request_remissions" IS 'La sede puede crear solicitudes de remision.';



COMMENT ON COLUMN "public"."site_operational_capabilities"."can_fulfill_remissions" IS 'La sede puede despachar/alistar remisiones como origen.';



COMMENT ON COLUMN "public"."site_operational_capabilities"."can_receive_remissions" IS 'La sede puede recibir remisiones.';



COMMENT ON COLUMN "public"."site_operational_capabilities"."can_sell" IS 'La sede participa en flujos comerciales/POS.';



COMMENT ON COLUMN "public"."site_operational_capabilities"."can_produce" IS 'La sede puede producir localmente.';



COMMENT ON COLUMN "public"."site_operational_capabilities"."can_hold_inventory" IS 'La sede participa en stock, conteos y LOCs.';



COMMENT ON COLUMN "public"."site_operational_capabilities"."is_commercial_business" IS 'Sede comercial que no entra a flujos operativos salvo que tenga capacidades activas.';



COMMENT ON COLUMN "public"."site_operational_capabilities"."show_in_product_setup" IS 'Controla si la sede aparece en configuracion producto-sede.';



CREATE TABLE IF NOT EXISTS "public"."site_production_pick_order" (
    "site_id" "uuid" NOT NULL,
    "location_id" "uuid" NOT NULL,
    "priority" integer DEFAULT 100 NOT NULL,
    "is_active" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "site_production_pick_order_priority_chk" CHECK (("priority" > 0))
);


ALTER TABLE "public"."site_production_pick_order" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."site_purpose_settings" (
    "site_id" "uuid" NOT NULL,
    "purpose" "text" NOT NULL,
    "mode" "text" DEFAULT 'inherit_global'::"text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_by" "uuid",
    CONSTRAINT "site_purpose_settings_mode_chk" CHECK (("mode" = ANY (ARRAY['inherit_global'::"text", 'custom'::"text", 'disabled'::"text"]))),
    CONSTRAINT "site_purpose_settings_purpose_chk" CHECK (("purpose" = ANY (ARRAY['remission'::"text", 'production_recipe'::"text"])))
);


ALTER TABLE "public"."site_purpose_settings" OWNER TO "postgres";


COMMENT ON TABLE "public"."site_purpose_settings" IS 'Modo de resolucion por sede/proposito para distinguir fallback global, reglas custom y cero areas habilitadas.';



COMMENT ON COLUMN "public"."site_purpose_settings"."mode" IS 'inherit_global usa defaults globales; custom usa reglas site_area_purpose_rules; disabled fuerza cero areas.';



CREATE TABLE IF NOT EXISTS "public"."site_supply_routes" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "requesting_site_id" "uuid" NOT NULL,
    "fulfillment_site_id" "uuid" NOT NULL,
    "is_active" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."site_supply_routes" OWNER TO "postgres";


COMMENT ON TABLE "public"."site_supply_routes" IS 'Mapa de sede solicitante -> sede que abastece remisiones.';



CREATE TABLE IF NOT EXISTS "public"."staff_invitations" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "token" "text",
    "email" "text",
    "full_name" "text",
    "staff_site_id" "uuid",
    "staff_role" "text",
    "staff_area" "text",
    "status" "text" DEFAULT 'pending'::"text" NOT NULL,
    "expires_at" timestamp with time zone,
    "accepted_at" timestamp with time zone,
    "created_by" "uuid",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "invited_at" timestamp with time zone NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "role_code" "text",
    "site_id" "uuid",
    "invited_by" "uuid",
    "last_sent_at" timestamp with time zone,
    "expired_at" timestamp with time zone,
    "cancelled_at" timestamp with time zone,
    "resend_count" integer DEFAULT 0 NOT NULL,
    "delivery_channel" "text" DEFAULT 'email'::"text" NOT NULL,
    "auth_user_id" "uuid",
    "employee_id" "uuid",
    "invite_token_hash" "text",
    "source_app" "text" DEFAULT 'anima'::"text" NOT NULL,
    "notes" "text",
    "metadata" "jsonb" DEFAULT '{}'::"jsonb" NOT NULL,
    CONSTRAINT "staff_invitations_delivery_channel_check" CHECK (("delivery_channel" = ANY (ARRAY['email'::"text", 'manual'::"text", 'system'::"text"]))),
    CONSTRAINT "staff_invitations_status_check" CHECK (("status" = ANY (ARRAY['sent'::"text", 'linked_existing_user'::"text", 'accepted'::"text", 'expired'::"text", 'cancelled'::"text", 'failed'::"text"])))
);


ALTER TABLE "public"."staff_invitations" OWNER TO "postgres";


COMMENT ON TABLE "public"."staff_invitations" IS 'ANIMA - Invitaciones laborales con trazabilidad operativa para envio, reenvio, aceptacion y seguimiento.';



COMMENT ON COLUMN "public"."staff_invitations"."status" IS 'sent, linked_existing_user, accepted, expired, cancelled, failed. pending se conserva solo como legacy y se migra a sent.';



COMMENT ON COLUMN "public"."staff_invitations"."created_by" IS 'Legacy actor column. Conserva el staff que origin├│ la invitaci├│n y referencia public.employees(id).';



COMMENT ON COLUMN "public"."staff_invitations"."role_code" IS 'Rol normalizado destino de la invitacion. Sustituye gradualmente a staff_role.';



COMMENT ON COLUMN "public"."staff_invitations"."site_id" IS 'Sede normalizada destino de la invitacion. Sustituye gradualmente a staff_site_id.';



COMMENT ON COLUMN "public"."staff_invitations"."invited_by" IS 'Actor staff normalizado que origin├│ la invitaci├│n. Referencia public.employees(id).';



COMMENT ON COLUMN "public"."staff_invitations"."resend_count" IS 'Cantidad de reenvios realizados para la misma invitacion.';



COMMENT ON COLUMN "public"."staff_invitations"."invite_token_hash" IS 'Hash opcional del token o enlace emitido para evitar persistir secretos en texto plano.';



COMMENT ON COLUMN "public"."staff_invitations"."metadata" IS 'Payload tecnico y trazabilidad adicional del flujo de invitacion.';



CREATE TABLE IF NOT EXISTS "public"."staff_manual_calendar_events" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "event_date" "date" NOT NULL,
    "title" "text" NOT NULL,
    "detail" "text",
    "event_type" "text" DEFAULT 'commercial'::"text" NOT NULL,
    "site_id" "uuid",
    "priority" "text" DEFAULT 'medium'::"text" NOT NULL,
    "is_active" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "staff_manual_calendar_events_event_type_check" CHECK (("event_type" = ANY (ARRAY['holiday'::"text", 'mother_day'::"text", 'commercial'::"text", 'operations'::"text", 'maintenance'::"text", 'other'::"text"]))),
    CONSTRAINT "staff_manual_calendar_events_priority_check" CHECK (("priority" = ANY (ARRAY['high'::"text", 'medium'::"text", 'low'::"text"]))),
    CONSTRAINT "staff_manual_calendar_events_title_not_blank" CHECK (("btrim"("title") <> ''::"text"))
);


ALTER TABLE "public"."staff_manual_calendar_events" OWNER TO "postgres";


COMMENT ON TABLE "public"."staff_manual_calendar_events" IS 'Eventos manuales del calendario maestro de VISO: fechas comerciales/locales, excepciones regionales y recordatorios operativos.';



CREATE TABLE IF NOT EXISTS "public"."staging_insumos_import" (
    "fecha" "text",
    "area" "text",
    "proveedor" "text",
    "producto" "text",
    "presentacion_raw" "text",
    "purchase_unit" "text",
    "purchase_unit_size" "text",
    "base_unit" "text",
    "unit_token" "text",
    "precio_raw" "text",
    "precio_cop" "text",
    "issues" "text"
);


ALTER TABLE "public"."staging_insumos_import" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."suppliers" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "name" "text" NOT NULL,
    "tax_id" "text",
    "contact_name" "text",
    "phone" "text",
    "email" "text",
    "address" "text",
    "notes" "text",
    "is_active" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."suppliers" OWNER TO "postgres";


COMMENT ON TABLE "public"."suppliers" IS 'Core ΓÇô tabla can├│nica para proveedores. Datos maestros de proveedores usados en compras y acuerdos de suministro.';



CREATE TABLE IF NOT EXISTS "public"."support_messages" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "ticket_id" "uuid" NOT NULL,
    "author_id" "uuid" NOT NULL,
    "body" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."support_messages" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."support_tickets" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "created_by" "uuid" NOT NULL,
    "site_id" "uuid",
    "category" "text" DEFAULT 'attendance'::"text" NOT NULL,
    "title" "text" NOT NULL,
    "description" "text",
    "status" "public"."support_ticket_status" DEFAULT 'open'::"public"."support_ticket_status" NOT NULL,
    "assigned_to" "uuid",
    "resolved_at" timestamp with time zone,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "target_employee_id" "uuid"
);


ALTER TABLE "public"."support_tickets" OWNER TO "postgres";


COMMENT ON COLUMN "public"."support_tickets"."target_employee_id" IS 'Cuando lo define un gerente/propietario, el trabajador con este employee_id ve el ticket en Soporte.';



CREATE OR REPLACE VIEW "public"."user_favorites" WITH ("security_invoker"='true') AS
 SELECT "id",
    "user_id",
    "reward_id",
    "created_at"
   FROM "pass"."user_favorites";


ALTER VIEW "public"."user_favorites" OWNER TO "postgres";


COMMENT ON VIEW "public"."user_favorites" IS 'Compat view. Canonical table lives in pass.user_favorites.';



CREATE TABLE IF NOT EXISTS "public"."user_feedback" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "user_id" "uuid" NOT NULL,
    "site_id" "uuid",
    "rating" integer NOT NULL,
    "feedback_text" "text",
    "category" "text",
    "status" "text" DEFAULT 'pending'::"text" NOT NULL,
    "reviewed_by" "uuid",
    "reviewed_at" timestamp with time zone,
    "resolution_notes" "text",
    "metadata" "jsonb" DEFAULT '{}'::"jsonb",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "user_feedback_rating_check" CHECK ((("rating" >= 1) AND ("rating" <= 5)))
);


ALTER TABLE "public"."user_feedback" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."users" (
    "id" "uuid" NOT NULL,
    "full_name" "text",
    "document_id" "text",
    "phone" "text",
    "role" "text" DEFAULT 'client'::"text" NOT NULL,
    "is_active" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "loyalty_points" integer DEFAULT 0 NOT NULL,
    "email" "text",
    "document_type" "text",
    "birth_date" "date",
    "is_client" boolean DEFAULT true NOT NULL,
    "marketing_opt_in" boolean DEFAULT false NOT NULL,
    "has_reviewed_google" boolean DEFAULT false,
    "last_review_prompt_date" timestamp with time zone
);


ALTER TABLE "public"."users" OWNER TO "postgres";


COMMENT ON TABLE "public"."users" IS 'Core ΓÇô tabla can├│nica para usuarios/clients. Registro de clientes/usuarios del sistema, sus datos y relaci├│n con pedidos y lealtad.';



CREATE OR REPLACE VIEW "public"."v_inventory_catalog" AS
 SELECT "p"."id",
    "p"."name",
    "p"."description",
    "p"."sku",
    "p"."price",
    "p"."cost",
    "p"."unit",
    "p"."product_type",
    "p"."category_id",
    "pc"."name" AS "category_name",
    "p"."is_active",
    "p"."created_at",
    "p"."updated_at"
   FROM ("public"."products" "p"
     LEFT JOIN "public"."product_categories" "pc" ON (("p"."category_id" = "pc"."id")));


ALTER VIEW "public"."v_inventory_catalog" OWNER TO "postgres";


CREATE OR REPLACE VIEW "public"."v_inventory_stock_by_location" AS
 SELECT "loc"."id" AS "location_id",
    "loc"."code" AS "location_code",
    "loc"."zone",
    "loc"."site_id",
    "s"."name" AS "site_name",
    "p"."id" AS "product_id",
    "p"."name" AS "product_name",
    "p"."sku",
    "isl"."current_qty" AS "total_quantity",
    "p"."unit"
   FROM ((("public"."inventory_stock_by_location" "isl"
     JOIN "public"."inventory_locations" "loc" ON (("loc"."id" = "isl"."location_id")))
     JOIN "public"."sites" "s" ON (("s"."id" = "loc"."site_id")))
     JOIN "public"."products" "p" ON (("p"."id" = "isl"."product_id")))
  WHERE ("loc"."is_active" = true);


ALTER VIEW "public"."v_inventory_stock_by_location" OWNER TO "postgres";


CREATE OR REPLACE VIEW "public"."v_ops_restock_product_gaps" AS
 SELECT "s"."id" AS "site_id",
    "s"."code" AS "site_code",
    "s"."name" AS "site_name",
    "p"."id" AS "product_id",
    "p"."sku",
    "p"."name" AS "product_name",
    "p"."product_type",
    "pip"."inventory_kind",
    "pss"."default_area_kind",
        CASE
            WHEN ("pss"."default_area_kind" IS NULL) THEN 'missing_default_area_kind'::"text"
            WHEN ("pip"."product_id" IS NULL) THEN 'missing_inventory_profile'::"text"
            WHEN (COALESCE("pip"."track_inventory", false) = false) THEN 'track_inventory_disabled'::"text"
            WHEN (COALESCE("pip"."default_unit", ''::"text") = ''::"text") THEN 'missing_default_unit'::"text"
            ELSE NULL::"text"
        END AS "gap_code"
   FROM ((("public"."product_site_settings" "pss"
     JOIN "public"."sites" "s" ON (("s"."id" = "pss"."site_id")))
     JOIN "public"."products" "p" ON (("p"."id" = "pss"."product_id")))
     LEFT JOIN "public"."product_inventory_profiles" "pip" ON (("pip"."product_id" = "p"."id")))
  WHERE (("s"."is_active" = true) AND ("s"."site_type" = 'satellite'::"public"."site_type") AND ("pss"."is_active" = true) AND ("p"."is_active" = true) AND (("pss"."default_area_kind" IS NULL) OR ("pip"."product_id" IS NULL) OR (COALESCE("pip"."track_inventory", false) = false) OR (COALESCE("pip"."default_unit", ''::"text") = ''::"text")))
  ORDER BY "s"."name", "p"."name";


ALTER VIEW "public"."v_ops_restock_product_gaps" OWNER TO "postgres";


COMMENT ON VIEW "public"."v_ops_restock_product_gaps" IS 'Brechas de configuracion producto-sede para remision operativa en sedes satelite.';



CREATE OR REPLACE VIEW "public"."v_ops_site_readiness" AS
 WITH "active_sites" AS (
         SELECT "s_1"."id",
            "s_1"."code",
            "s_1"."name",
            "s_1"."site_type"
           FROM "public"."sites" "s_1"
          WHERE (("s_1"."is_active" = true) AND ("s_1"."site_type" = ANY (ARRAY['production_center'::"public"."site_type", 'satellite'::"public"."site_type"])))
        ), "loc_metrics" AS (
         SELECT "l"."site_id",
            "count"(*) FILTER (WHERE ("l"."is_active" = true)) AS "loc_total",
            "count"(*) FILTER (WHERE (("l"."is_active" = true) AND ("l"."location_type" = 'receiving'::"text"))) AS "loc_receiving",
            "count"(*) FILTER (WHERE (("l"."is_active" = true) AND ("l"."location_type" = 'production'::"text"))) AS "loc_production",
            "count"(*) FILTER (WHERE (("l"."is_active" = true) AND ("l"."location_type" = ANY (ARRAY['storage'::"text", 'picking'::"text", 'staging'::"text"])))) AS "loc_storage"
           FROM "public"."inventory_locations" "l"
          GROUP BY "l"."site_id"
        ), "area_metrics" AS (
         SELECT "a"."site_id",
            "count"(*) FILTER (WHERE ("a"."is_active" = true)) AS "area_total"
           FROM "public"."areas" "a"
          GROUP BY "a"."site_id"
        ), "catalog_metrics" AS (
         SELECT "pss"."site_id",
            "count"(*) FILTER (WHERE ("pss"."is_active" = true)) AS "catalog_products",
            "count"(*) FILTER (WHERE (("pss"."is_active" = true) AND ("pss"."default_area_kind" IS NOT NULL))) AS "catalog_products_with_area"
           FROM "public"."product_site_settings" "pss"
          GROUP BY "pss"."site_id"
        ), "recipe_metrics" AS (
         SELECT "rc"."site_id",
            "count"(*) AS "recipe_cards_total",
            "count"(*) FILTER (WHERE ("rc"."status" = 'published'::"public"."recipe_status")) AS "recipe_cards_published"
           FROM "public"."recipe_cards" "rc"
          WHERE ("rc"."site_id" IS NOT NULL)
          GROUP BY "rc"."site_id"
        ), "remission_outbound" AS (
         SELECT "r"."from_site_id" AS "site_id",
            "count"(*) AS "remissions_out_last_30d"
           FROM "public"."restock_requests" "r"
          WHERE (("r"."created_at" >= ("now"() - '30 days'::interval)) AND ("r"."from_site_id" IS NOT NULL))
          GROUP BY "r"."from_site_id"
        ), "remission_inbound" AS (
         SELECT "r"."to_site_id" AS "site_id",
            "count"(*) AS "remissions_in_last_30d"
           FROM "public"."restock_requests" "r"
          WHERE (("r"."created_at" >= ("now"() - '30 days'::interval)) AND ("r"."to_site_id" IS NOT NULL))
          GROUP BY "r"."to_site_id"
        ), "production_metrics" AS (
         SELECT "pb"."site_id",
            "count"(*) AS "production_batches_last_30d"
           FROM "public"."production_batches" "pb"
          WHERE ("pb"."created_at" >= ("now"() - '30 days'::interval))
          GROUP BY "pb"."site_id"
        ), "movement_metrics" AS (
         SELECT "m"."site_id",
            "count"(*) AS "inventory_movements_last_30d"
           FROM "public"."inventory_movements" "m"
          WHERE ("m"."created_at" >= ("now"() - '30 days'::interval))
          GROUP BY "m"."site_id"
        )
 SELECT "s"."id" AS "site_id",
    "s"."code" AS "site_code",
    "s"."name" AS "site_name",
    "s"."site_type",
    COALESCE("lm"."loc_total", (0)::bigint) AS "loc_total",
    COALESCE("lm"."loc_receiving", (0)::bigint) AS "loc_receiving",
    COALESCE("lm"."loc_storage", (0)::bigint) AS "loc_storage",
    COALESCE("lm"."loc_production", (0)::bigint) AS "loc_production",
    COALESCE("am"."area_total", (0)::bigint) AS "area_total",
    COALESCE("cm"."catalog_products", (0)::bigint) AS "catalog_products",
    COALESCE("cm"."catalog_products_with_area", (0)::bigint) AS "catalog_products_with_area",
        CASE
            WHEN (COALESCE("cm"."catalog_products", (0)::bigint) = 0) THEN (0)::numeric
            ELSE "round"((((COALESCE("cm"."catalog_products_with_area", (0)::bigint))::numeric / ("cm"."catalog_products")::numeric) * (100)::numeric), 2)
        END AS "catalog_area_coverage_pct",
    COALESCE("rm"."recipe_cards_total", (0)::bigint) AS "recipe_cards_total",
    COALESCE("rm"."recipe_cards_published", (0)::bigint) AS "recipe_cards_published",
    COALESCE("ro"."remissions_out_last_30d", (0)::bigint) AS "remissions_out_last_30d",
    COALESCE("ri"."remissions_in_last_30d", (0)::bigint) AS "remissions_in_last_30d",
    COALESCE("pm"."production_batches_last_30d", (0)::bigint) AS "production_batches_last_30d",
    COALESCE("mm"."inventory_movements_last_30d", (0)::bigint) AS "inventory_movements_last_30d",
    (((((
        CASE
            WHEN (COALESCE("lm"."loc_total", (0)::bigint) >= 3) THEN 1
            ELSE 0
        END +
        CASE
            WHEN (COALESCE("am"."area_total", (0)::bigint) >= 1) THEN 1
            ELSE 0
        END) +
        CASE
            WHEN (COALESCE("cm"."catalog_products", (0)::bigint) >= 1) THEN 1
            ELSE 0
        END) +
        CASE
            WHEN (COALESCE("cm"."catalog_products", (0)::bigint) = 0) THEN 0
            WHEN (((COALESCE("cm"."catalog_products_with_area", (0)::bigint))::numeric / NULLIF(("cm"."catalog_products")::numeric, (0)::numeric)) >= 0.80) THEN 1
            ELSE 0
        END) +
        CASE
            WHEN (COALESCE("mm"."inventory_movements_last_30d", (0)::bigint) >= 1) THEN 1
            ELSE 0
        END) +
        CASE
            WHEN (("s"."site_type" = 'production_center'::"public"."site_type") AND (COALESCE("rm"."recipe_cards_published", (0)::bigint) >= 1)) THEN 1
            WHEN ("s"."site_type" = 'satellite'::"public"."site_type") THEN 1
            ELSE 0
        END) AS "readiness_score_0_6"
   FROM (((((((("active_sites" "s"
     LEFT JOIN "loc_metrics" "lm" ON (("lm"."site_id" = "s"."id")))
     LEFT JOIN "area_metrics" "am" ON (("am"."site_id" = "s"."id")))
     LEFT JOIN "catalog_metrics" "cm" ON (("cm"."site_id" = "s"."id")))
     LEFT JOIN "recipe_metrics" "rm" ON (("rm"."site_id" = "s"."id")))
     LEFT JOIN "remission_outbound" "ro" ON (("ro"."site_id" = "s"."id")))
     LEFT JOIN "remission_inbound" "ri" ON (("ri"."site_id" = "s"."id")))
     LEFT JOIN "production_metrics" "pm" ON (("pm"."site_id" = "s"."id")))
     LEFT JOIN "movement_metrics" "mm" ON (("mm"."site_id" = "s"."id")))
  ORDER BY "s"."site_type", "s"."name";


ALTER VIEW "public"."v_ops_site_readiness" OWNER TO "postgres";


COMMENT ON VIEW "public"."v_ops_site_readiness" IS 'Vista de readiness operativo por sede para la fase NEXO + ORIGO + FOGO.';



CREATE OR REPLACE VIEW "public"."v_procurement_price_book" AS
 SELECT "s"."id" AS "supplier_id",
    "s"."name" AS "supplier_name",
    "p"."id" AS "product_id",
    "p"."name" AS "product_name",
    "p"."unit",
    "pap"."agreed_price",
    "pap"."valid_from",
    "pap"."valid_until",
    "pc"."name" AS "category_name"
   FROM ((("public"."procurement_agreed_prices" "pap"
     JOIN "public"."suppliers" "s" ON (("pap"."supplier_id" = "s"."id")))
     JOIN "public"."products" "p" ON (("pap"."product_id" = "p"."id")))
     LEFT JOIN "public"."product_categories" "pc" ON (("p"."category_id" = "pc"."id")))
  WHERE (("pap"."is_active" = true) AND ("s"."is_active" = true) AND ("p"."is_active" = true));


ALTER VIEW "public"."v_procurement_price_book" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."wallet_devices" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "device_library_identifier" "text" NOT NULL,
    "pass_type_identifier" "text" NOT NULL,
    "serial_number" "text" NOT NULL,
    "push_token" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone DEFAULT "now"()
);


ALTER TABLE "public"."wallet_devices" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."wallet_passes" (
    "serial_number" "text" NOT NULL,
    "user_id" "uuid" NOT NULL,
    "pass_type_identifier" "text" NOT NULL,
    "auth_token" "text" NOT NULL,
    "data_hash" "text",
    "updated_at" timestamp with time zone DEFAULT "now"()
);


ALTER TABLE "public"."wallet_passes" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."website_blocks" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "page_slug" "text" NOT NULL,
    "block_key" "text" NOT NULL,
    "block_type" "text" DEFAULT 'content'::"text" NOT NULL,
    "title" "text",
    "subtitle" "text",
    "body" "text",
    "cta_label" "text",
    "cta_url" "text",
    "media_url" "text",
    "media_type" "text",
    "sort_order" integer DEFAULT 0 NOT NULL,
    "is_published" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "timezone"('utc'::"text", "now"()) NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "timezone"('utc'::"text", "now"()) NOT NULL,
    CONSTRAINT "website_blocks_media_type_check" CHECK ((("media_type" = ANY (ARRAY['image'::"text", 'video'::"text"])) OR ("media_type" IS NULL)))
);


ALTER TABLE "public"."website_blocks" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."website_items" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "category" "text" NOT NULL,
    "slug" "text" NOT NULL,
    "title" "text" NOT NULL,
    "excerpt" "text",
    "body" "text",
    "location" "text",
    "schedule_text" "text",
    "start_at" timestamp with time zone,
    "end_at" timestamp with time zone,
    "image_url" "text",
    "video_url" "text",
    "action_label" "text",
    "action_url" "text",
    "sort_order" integer DEFAULT 0 NOT NULL,
    "is_published" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "timezone"('utc'::"text", "now"()) NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "timezone"('utc'::"text", "now"()) NOT NULL,
    CONSTRAINT "website_items_category_check" CHECK (("category" = ANY (ARRAY['restaurant'::"text", 'job'::"text", 'service'::"text", 'event'::"text", 'app'::"text"])))
);


ALTER TABLE "public"."website_items" OWNER TO "postgres";


ALTER TABLE ONLY "public"."account_deletion_requests"
    ADD CONSTRAINT "account_deletion_requests_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."announcements"
    ADD CONSTRAINT "announcements_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."app_config"
    ADD CONSTRAINT "app_config_pkey" PRIMARY KEY ("key");



ALTER TABLE ONLY "public"."app_content_blocks"
    ADD CONSTRAINT "app_content_blocks_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."app_content_blocks"
    ADD CONSTRAINT "app_content_blocks_unique" UNIQUE ("app_key", "screen_key", "section_key", "locale");



ALTER TABLE ONLY "public"."app_navigation_items"
    ADD CONSTRAINT "app_navigation_items_app_href_unique" UNIQUE ("app_code", "href");



ALTER TABLE ONLY "public"."app_navigation_items"
    ADD CONSTRAINT "app_navigation_items_app_item_key_unique" UNIQUE ("app_code", "item_key");



ALTER TABLE ONLY "public"."app_navigation_items"
    ADD CONSTRAINT "app_navigation_items_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."app_operation_policies"
    ADD CONSTRAINT "app_operation_policies_pkey" PRIMARY KEY ("app_code");



ALTER TABLE ONLY "public"."app_permissions"
    ADD CONSTRAINT "app_permissions_app_id_code_key" UNIQUE ("app_id", "code");



ALTER TABLE ONLY "public"."app_permissions"
    ADD CONSTRAINT "app_permissions_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."app_runtime_settings"
    ADD CONSTRAINT "app_runtime_settings_pkey" PRIMARY KEY ("app_id", "setting_key");



ALTER TABLE ONLY "public"."app_update_policies"
    ADD CONSTRAINT "app_update_policies_app_platform_unique" UNIQUE ("app_key", "platform");



ALTER TABLE ONLY "public"."app_update_policies"
    ADD CONSTRAINT "app_update_policies_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."apps"
    ADD CONSTRAINT "apps_code_key" UNIQUE ("code");



ALTER TABLE ONLY "public"."apps"
    ADD CONSTRAINT "apps_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."area_kinds"
    ADD CONSTRAINT "area_kinds_pkey" PRIMARY KEY ("code");



ALTER TABLE ONLY "public"."areas"
    ADD CONSTRAINT "areas_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."asistencia_logs"
    ADD CONSTRAINT "asistencia_logs_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."attendance_breaks"
    ADD CONSTRAINT "attendance_breaks_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."attendance_logs"
    ADD CONSTRAINT "attendance_logs_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."attendance_policy"
    ADD CONSTRAINT "attendance_policy_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."attendance_shift_events"
    ADD CONSTRAINT "attendance_shift_events_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."attendance_sync_conflicts"
    ADD CONSTRAINT "attendance_sync_conflicts_pkey" PRIMARY KEY ("id");



ALTER TABLE "public"."cost_centers"
    ADD CONSTRAINT "cost_centers_code_not_blank" CHECK ((("code" IS NULL) OR ("btrim"("code") <> ''::"text"))) NOT VALID;



ALTER TABLE ONLY "public"."cost_centers"
    ADD CONSTRAINT "cost_centers_pkey" PRIMARY KEY ("id");



ALTER TABLE "public"."cost_centers"
    ADD CONSTRAINT "cost_centers_type_check" CHECK ((("type" IS NULL) OR ("type" = ANY (ARRAY['production_center'::"text", 'satellite'::"text", 'logistics'::"text", 'admin'::"text", 'other'::"text"])))) NOT VALID;



ALTER TABLE ONLY "public"."document_types"
    ADD CONSTRAINT "document_types_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."documents"
    ADD CONSTRAINT "documents_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."employee_area_purpose_assignments"
    ADD CONSTRAINT "employee_area_purpose_assignmen_employee_id_site_id_purpose_key" UNIQUE ("employee_id", "site_id", "purpose");



ALTER TABLE ONLY "public"."employee_area_purpose_assignments"
    ADD CONSTRAINT "employee_area_purpose_assignments_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."employee_areas"
    ADD CONSTRAINT "employee_areas_pkey" PRIMARY KEY ("employee_id", "area_id");



ALTER TABLE ONLY "public"."employee_devices"
    ADD CONSTRAINT "employee_devices_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."employee_devices"
    ADD CONSTRAINT "employee_devices_unique_token" UNIQUE ("expo_push_token");



ALTER TABLE ONLY "public"."employee_inventory_location_assignments"
    ADD CONSTRAINT "employee_inventory_location_assignments_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."employee_inventory_location_assignments"
    ADD CONSTRAINT "employee_inventory_location_assignments_unique_active" UNIQUE ("employee_id", "site_id", "purpose");



ALTER TABLE ONLY "public"."employee_permissions"
    ADD CONSTRAINT "employee_permissions_employee_id_permission_id_scope_type_s_key" UNIQUE ("employee_id", "permission_id", "scope_type", "scope_site_id", "scope_area_id", "scope_site_type", "scope_area_kind");



ALTER TABLE ONLY "public"."employee_permissions"
    ADD CONSTRAINT "employee_permissions_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."employee_push_tokens"
    ADD CONSTRAINT "employee_push_tokens_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."employee_settings"
    ADD CONSTRAINT "employee_settings_pkey" PRIMARY KEY ("employee_id");



ALTER TABLE ONLY "public"."employee_shifts"
    ADD CONSTRAINT "employee_shifts_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."employee_sites"
    ADD CONSTRAINT "employee_sites_pkey" PRIMARY KEY ("employee_id", "site_id");



ALTER TABLE ONLY "public"."employee_wallet_cards"
    ADD CONSTRAINT "employee_wallet_cards_employee_unique" UNIQUE ("employee_id");



ALTER TABLE ONLY "public"."employee_wallet_cards"
    ADD CONSTRAINT "employee_wallet_cards_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."employees"
    ADD CONSTRAINT "employees_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."internal_job_secrets"
    ADD CONSTRAINT "internal_job_secrets_pkey" PRIMARY KEY ("key");



ALTER TABLE ONLY "public"."internal_pos_document_lines"
    ADD CONSTRAINT "internal_pos_document_lines_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."internal_pos_document_sequences"
    ADD CONSTRAINT "internal_pos_document_sequences_pkey" PRIMARY KEY ("document_date");



ALTER TABLE ONLY "public"."internal_pos_documents"
    ADD CONSTRAINT "internal_pos_documents_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."internal_price_list_items"
    ADD CONSTRAINT "internal_price_list_items_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."internal_price_lists"
    ADD CONSTRAINT "internal_price_lists_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."internal_transfer_variances"
    ADD CONSTRAINT "internal_transfer_variances_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."inventory_cost_policies"
    ADD CONSTRAINT "inventory_cost_policies_pkey" PRIMARY KEY ("site_id");



ALTER TABLE ONLY "public"."inventory_count_lines"
    ADD CONSTRAINT "inventory_count_lines_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."inventory_count_lines"
    ADD CONSTRAINT "inventory_count_lines_session_id_product_id_key" UNIQUE ("session_id", "product_id");



ALTER TABLE ONLY "public"."inventory_count_sessions"
    ADD CONSTRAINT "inventory_count_sessions_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."inventory_entries"
    ADD CONSTRAINT "inventory_entries_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."inventory_entry_items"
    ADD CONSTRAINT "inventory_entry_items_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."inventory_form_drafts"
    ADD CONSTRAINT "inventory_form_drafts_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."inventory_location_positions"
    ADD CONSTRAINT "inventory_location_positions_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."inventory_locations"
    ADD CONSTRAINT "inventory_locations_code_key" UNIQUE ("code");



ALTER TABLE ONLY "public"."inventory_locations"
    ADD CONSTRAINT "inventory_locations_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."inventory_lpn_items"
    ADD CONSTRAINT "inventory_lpn_items_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."inventory_lpns"
    ADD CONSTRAINT "inventory_lpns_code_key" UNIQUE ("code");



ALTER TABLE ONLY "public"."inventory_lpns"
    ADD CONSTRAINT "inventory_lpns_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."inventory_movement_types"
    ADD CONSTRAINT "inventory_movement_types_pkey" PRIMARY KEY ("code");



ALTER TABLE ONLY "public"."inventory_movements"
    ADD CONSTRAINT "inventory_movements_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."inventory_stock_by_location"
    ADD CONSTRAINT "inventory_stock_by_location_pkey" PRIMARY KEY ("location_id", "product_id");



ALTER TABLE ONLY "public"."inventory_stock_by_position"
    ADD CONSTRAINT "inventory_stock_by_position_pkey" PRIMARY KEY ("position_id", "product_id");



ALTER TABLE ONLY "public"."inventory_stock_by_site"
    ADD CONSTRAINT "inventory_stock_by_site_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."inventory_stock_by_site"
    ADD CONSTRAINT "inventory_stock_by_site_site_product_unique" UNIQUE ("site_id", "product_id");



ALTER TABLE ONLY "public"."inventory_stock_by_uom_profile"
    ADD CONSTRAINT "inventory_stock_by_uom_profile_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."inventory_transfer_items"
    ADD CONSTRAINT "inventory_transfer_items_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."inventory_transfers"
    ADD CONSTRAINT "inventory_transfers_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."inventory_unit_aliases"
    ADD CONSTRAINT "inventory_unit_aliases_pkey" PRIMARY KEY ("alias");



ALTER TABLE ONLY "public"."inventory_units"
    ADD CONSTRAINT "inventory_units_pkey" PRIMARY KEY ("code");



ALTER TABLE ONLY "public"."loyalty_external_sales"
    ADD CONSTRAINT "loyalty_external_sales_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."order_conversations"
    ADD CONSTRAINT "order_conversations_order_id_key" UNIQUE ("order_id");



ALTER TABLE ONLY "public"."order_conversations"
    ADD CONSTRAINT "order_conversations_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."order_items"
    ADD CONSTRAINT "order_items_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."order_messages"
    ADD CONSTRAINT "order_messages_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."order_status_events"
    ADD CONSTRAINT "order_status_events_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."orders"
    ADD CONSTRAINT "orders_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."printing_label_templates"
    ADD CONSTRAINT "printing_label_templates_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."procurement_agreed_prices"
    ADD CONSTRAINT "procurement_agreed_prices_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."procurement_reception_items"
    ADD CONSTRAINT "procurement_reception_items_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."procurement_receptions"
    ADD CONSTRAINT "procurement_receptions_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."product_asset_maintenance_events"
    ADD CONSTRAINT "product_asset_maintenance_events_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."product_asset_profiles"
    ADD CONSTRAINT "product_asset_profiles_pkey" PRIMARY KEY ("product_id");



ALTER TABLE ONLY "public"."product_asset_transfer_events"
    ADD CONSTRAINT "product_asset_transfer_events_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."product_categories"
    ADD CONSTRAINT "product_categories_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."product_cost_events"
    ADD CONSTRAINT "product_cost_events_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."product_images"
    ADD CONSTRAINT "product_images_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."product_inventory_profiles"
    ADD CONSTRAINT "product_inventory_profiles_pkey" PRIMARY KEY ("product_id");



ALTER TABLE ONLY "public"."product_site_settings"
    ADD CONSTRAINT "product_site_settings_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."product_site_settings"
    ADD CONSTRAINT "product_site_settings_site_product_uniq" UNIQUE ("site_id", "product_id");



ALTER TABLE ONLY "public"."product_sku_aliases"
    ADD CONSTRAINT "product_sku_aliases_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."product_sku_sequences"
    ADD CONSTRAINT "product_sku_sequences_pkey" PRIMARY KEY ("brand_code", "type_code");



ALTER TABLE ONLY "public"."product_suppliers"
    ADD CONSTRAINT "product_suppliers_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."product_uom_profiles"
    ADD CONSTRAINT "product_uom_profiles_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."production_batch_consumptions"
    ADD CONSTRAINT "production_batch_consumptions_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."production_batches"
    ADD CONSTRAINT "production_batches_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."production_request_items"
    ADD CONSTRAINT "production_request_items_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."production_requests"
    ADD CONSTRAINT "production_requests_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."products"
    ADD CONSTRAINT "products_pkey" PRIMARY KEY ("id");



ALTER TABLE "public"."products"
    ADD CONSTRAINT "products_sku_format_chk" CHECK ((("sku" IS NULL) OR (TRIM(BOTH FROM "sku") = ''::"text") OR ("upper"(TRIM(BOTH FROM "sku")) ~ '^[A-Z0-9]+(-[A-Z0-9]+)*$'::"text"))) NOT VALID;



ALTER TABLE ONLY "public"."products"
    ADD CONSTRAINT "products_sku_key" UNIQUE ("sku");



ALTER TABLE ONLY "public"."purchase_order_items"
    ADD CONSTRAINT "purchase_order_items_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."purchase_orders"
    ADD CONSTRAINT "purchase_orders_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."recipe_cards"
    ADD CONSTRAINT "recipe_cards_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."recipe_cards"
    ADD CONSTRAINT "recipe_cards_product_id_key" UNIQUE ("product_id");



ALTER TABLE ONLY "public"."recipe_steps"
    ADD CONSTRAINT "recipe_steps_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."recipe_steps"
    ADD CONSTRAINT "recipe_steps_unique_step" UNIQUE ("recipe_card_id", "step_number");



ALTER TABLE ONLY "public"."recipes"
    ADD CONSTRAINT "recipes_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."required_document_rules"
    ADD CONSTRAINT "required_document_rules_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."restock_request_item_picks"
    ADD CONSTRAINT "restock_request_item_picks_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."restock_request_items"
    ADD CONSTRAINT "restock_request_items_pkey" PRIMARY KEY ("id");



ALTER TABLE "public"."restock_request_items"
    ADD CONSTRAINT "restock_request_items_transfer_total_non_negative" CHECK ((("transfer_total" IS NULL) OR ("transfer_total" >= (0)::numeric))) NOT VALID;



ALTER TABLE "public"."restock_request_items"
    ADD CONSTRAINT "restock_request_items_transfer_unit_price_non_negative" CHECK ((("transfer_unit_price" IS NULL) OR ("transfer_unit_price" >= (0)::numeric))) NOT VALID;



ALTER TABLE ONLY "public"."restock_requests"
    ADD CONSTRAINT "restock_requests_pkey" PRIMARY KEY ("id");



ALTER TABLE "public"."restock_requests"
    ADD CONSTRAINT "restock_requests_pricing_mode_check" CHECK (("pricing_mode" = ANY (ARRAY['none'::"text", 'internal_transfer'::"text", 'external_purchase'::"text", 'manual_adjustment'::"text"]))) NOT VALID;



ALTER TABLE "public"."restock_requests"
    ADD CONSTRAINT "restock_requests_pricing_status_check" CHECK (("pricing_status" = ANY (ARRAY['draft'::"text", 'pending_close'::"text", 'pending_price'::"text", 'pending_variance_resolution'::"text", 'ready_to_invoice'::"text", 'invoiced'::"text", 'credited'::"text", 'not_applicable'::"text"]))) NOT VALID;



ALTER TABLE ONLY "public"."role_capabilities"
    ADD CONSTRAINT "role_capabilities_pkey" PRIMARY KEY ("role", "capability");



ALTER TABLE ONLY "public"."role_permissions"
    ADD CONSTRAINT "role_permissions_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."role_permissions"
    ADD CONSTRAINT "role_permissions_role_permission_id_scope_type_scope_site_t_key" UNIQUE ("role", "permission_id", "scope_type", "scope_site_type", "scope_area_kind");



ALTER TABLE ONLY "public"."role_site_type_rules"
    ADD CONSTRAINT "role_site_type_rules_pkey" PRIMARY KEY ("role", "site_type");



ALTER TABLE ONLY "public"."roles"
    ADD CONSTRAINT "roles_pkey" PRIMARY KEY ("code");



ALTER TABLE ONLY "public"."shift_policy"
    ADD CONSTRAINT "shift_policy_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."shift_runtime_events"
    ADD CONSTRAINT "shift_runtime_events_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."site_area_purpose_rules"
    ADD CONSTRAINT "site_area_purpose_rules_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."site_area_purpose_rules"
    ADD CONSTRAINT "site_area_purpose_rules_site_id_area_kind_purpose_key" UNIQUE ("site_id", "area_kind", "purpose");



ALTER TABLE ONLY "public"."site_attendance_policy"
    ADD CONSTRAINT "site_attendance_policy_pkey" PRIMARY KEY ("site_id");



ALTER TABLE ONLY "public"."site_operational_capabilities"
    ADD CONSTRAINT "site_operational_capabilities_pkey" PRIMARY KEY ("site_id");



ALTER TABLE ONLY "public"."site_production_pick_order"
    ADD CONSTRAINT "site_production_pick_order_pkey" PRIMARY KEY ("site_id", "location_id");



ALTER TABLE ONLY "public"."site_purpose_settings"
    ADD CONSTRAINT "site_purpose_settings_pkey" PRIMARY KEY ("site_id", "purpose");



ALTER TABLE ONLY "public"."site_supply_routes"
    ADD CONSTRAINT "site_supply_routes_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."site_supply_routes"
    ADD CONSTRAINT "site_supply_routes_requesting_site_id_fulfillment_site_id_key" UNIQUE ("requesting_site_id", "fulfillment_site_id");



ALTER TABLE ONLY "public"."sites"
    ADD CONSTRAINT "sites_code_key" UNIQUE ("code");



ALTER TABLE ONLY "public"."sites"
    ADD CONSTRAINT "sites_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."staff_invitations"
    ADD CONSTRAINT "staff_invitations_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."staff_manual_calendar_events"
    ADD CONSTRAINT "staff_manual_calendar_events_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."suppliers"
    ADD CONSTRAINT "suppliers_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."support_messages"
    ADD CONSTRAINT "support_messages_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."support_tickets"
    ADD CONSTRAINT "support_tickets_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."employee_shifts"
    ADD CONSTRAINT "unique_employee_shift_per_day" UNIQUE ("employee_id", "site_id", "shift_date", "start_time");



ALTER TABLE ONLY "public"."user_feedback"
    ADD CONSTRAINT "user_feedback_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_document_id_key" UNIQUE ("document_id");



ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."wallet_devices"
    ADD CONSTRAINT "wallet_devices_device_library_identifier_pass_type_identifi_key" UNIQUE ("device_library_identifier", "pass_type_identifier", "serial_number");



ALTER TABLE ONLY "public"."wallet_devices"
    ADD CONSTRAINT "wallet_devices_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."wallet_passes"
    ADD CONSTRAINT "wallet_passes_pkey" PRIMARY KEY ("serial_number");



ALTER TABLE ONLY "public"."website_blocks"
    ADD CONSTRAINT "website_blocks_page_slug_block_key_key" UNIQUE ("page_slug", "block_key");



ALTER TABLE ONLY "public"."website_blocks"
    ADD CONSTRAINT "website_blocks_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."website_items"
    ADD CONSTRAINT "website_items_category_slug_key" UNIQUE ("category", "slug");



ALTER TABLE ONLY "public"."website_items"
    ADD CONSTRAINT "website_items_pkey" PRIMARY KEY ("id");



CREATE INDEX "announcements_active_order_idx" ON "public"."announcements" USING "btree" ("is_active", "display_order", "published_at" DESC);



CREATE INDEX "app_content_blocks_lookup_idx" ON "public"."app_content_blocks" USING "btree" ("app_key", "screen_key", "locale", "is_enabled", "sort_order");



CREATE INDEX "app_navigation_items_app_active_order_idx" ON "public"."app_navigation_items" USING "btree" ("app_code", "is_active", "group_order", "sort_order");



CREATE INDEX "app_navigation_items_required_permission_code_idx" ON "public"."app_navigation_items" USING "btree" ("required_permission_code");



CREATE UNIQUE INDEX "app_update_policies_app_platform_uidx" ON "public"."app_update_policies" USING "btree" ("app_key", "platform");



CREATE INDEX "app_update_policies_enabled_idx" ON "public"."app_update_policies" USING "btree" ("app_key", "platform", "is_enabled");



CREATE UNIQUE INDEX "areas_site_code_unique" ON "public"."areas" USING "btree" ("site_id", "code");



CREATE INDEX "areas_site_id_idx" ON "public"."areas" USING "btree" ("site_id");



CREATE UNIQUE INDEX "asistencia_logs_employee_fecha_unique" ON "public"."asistencia_logs" USING "btree" ("empleado_id", "fecha_hora");



CREATE INDEX "attendance_breaks_employee_started_idx" ON "public"."attendance_breaks" USING "btree" ("employee_id", "started_at" DESC);



CREATE UNIQUE INDEX "attendance_breaks_one_open_per_employee_idx" ON "public"."attendance_breaks" USING "btree" ("employee_id") WHERE ("ended_at" IS NULL);



CREATE INDEX "attendance_breaks_site_started_idx" ON "public"."attendance_breaks" USING "btree" ("site_id", "started_at" DESC);



CREATE UNIQUE INDEX "attendance_logs_employee_client_event_uidx" ON "public"."attendance_logs" USING "btree" ("employee_id", "client_event_id") WHERE ("client_event_id" IS NOT NULL);



CREATE INDEX "attendance_logs_employee_occurred_at_idx" ON "public"."attendance_logs" USING "btree" ("employee_id", "occurred_at" DESC);



CREATE INDEX "attendance_shift_events_employee_shift_idx" ON "public"."attendance_shift_events" USING "btree" ("employee_id", "shift_start_at" DESC);



CREATE INDEX "attendance_shift_events_site_occurred_idx" ON "public"."attendance_shift_events" USING "btree" ("site_id", "occurred_at" DESC);



CREATE UNIQUE INDEX "attendance_shift_events_unique_shift_event_idx" ON "public"."attendance_shift_events" USING "btree" ("employee_id", "shift_start_at", "event_type");



CREATE UNIQUE INDEX "cost_centers_code_uidx" ON "public"."cost_centers" USING "btree" ("lower"("btrim"("code"))) WHERE (("code" IS NOT NULL) AND ("btrim"("code") <> ''::"text"));



CREATE UNIQUE INDEX "cost_centers_site_uidx" ON "public"."cost_centers" USING "btree" ("site_id") WHERE (("site_id" IS NOT NULL) AND ("is_active" IS NOT FALSE));



CREATE INDEX "document_types_display_order_idx" ON "public"."document_types" USING "btree" ("display_order", "name");



CREATE UNIQUE INDEX "document_types_name_scope_idx" ON "public"."document_types" USING "btree" ("name", "scope");



CREATE UNIQUE INDEX "document_types_system_key_key" ON "public"."document_types" USING "btree" ("system_key") WHERE ("system_key" IS NOT NULL);



CREATE INDEX "documents_expiry_idx" ON "public"."documents" USING "btree" ("expiry_date");



CREATE INDEX "documents_owner_idx" ON "public"."documents" USING "btree" ("owner_employee_id");



CREATE INDEX "documents_site_idx" ON "public"."documents" USING "btree" ("site_id");



CREATE INDEX "documents_status_idx" ON "public"."documents" USING "btree" ("status");



CREATE INDEX "documents_target_idx" ON "public"."documents" USING "btree" ("target_employee_id");



CREATE INDEX "employee_areas_employee_idx" ON "public"."employee_areas" USING "btree" ("employee_id");



CREATE UNIQUE INDEX "employee_areas_one_primary" ON "public"."employee_areas" USING "btree" ("employee_id") WHERE ("is_primary" = true);



CREATE INDEX "employee_push_tokens_employee_idx" ON "public"."employee_push_tokens" USING "btree" ("employee_id");



CREATE UNIQUE INDEX "employee_push_tokens_token_idx" ON "public"."employee_push_tokens" USING "btree" ("token");



CREATE INDEX "employee_sites_employee_idx" ON "public"."employee_sites" USING "btree" ("employee_id");



CREATE UNIQUE INDEX "employee_sites_one_primary" ON "public"."employee_sites" USING "btree" ("employee_id") WHERE ("is_primary" = true);



CREATE INDEX "employee_wallet_cards_employee_id" ON "public"."employee_wallet_cards" USING "btree" ("employee_id");



CREATE INDEX "employee_wallet_cards_status" ON "public"."employee_wallet_cards" USING "btree" ("status");



CREATE INDEX "employees_area_id_idx" ON "public"."employees" USING "btree" ("area_id");



CREATE INDEX "idx_account_deletion_requests_status_execute" ON "public"."account_deletion_requests" USING "btree" ("status", "execute_after");



CREATE INDEX "idx_account_deletion_requests_user_status_execute" ON "public"."account_deletion_requests" USING "btree" ("user_id", "status", "execute_after");



CREATE INDEX "idx_attendance_logs_employee" ON "public"."attendance_logs" USING "btree" ("employee_id");



CREATE INDEX "idx_attendance_logs_employee_date" ON "public"."attendance_logs" USING "btree" ("employee_id", "occurred_at" DESC);



CREATE INDEX "idx_attendance_logs_occurred" ON "public"."attendance_logs" USING "btree" ("occurred_at" DESC);



CREATE INDEX "idx_attendance_logs_site_date" ON "public"."attendance_logs" USING "btree" ("site_id", "occurred_at" DESC);



CREATE INDEX "idx_count_lines_session" ON "public"."inventory_count_lines" USING "btree" ("session_id");



CREATE INDEX "idx_count_sessions_created_at" ON "public"."inventory_count_sessions" USING "btree" ("created_at" DESC);



CREATE INDEX "idx_count_sessions_site_status" ON "public"."inventory_count_sessions" USING "btree" ("site_id", "status");



CREATE INDEX "idx_employee_area_purpose_assignments_lookup" ON "public"."employee_area_purpose_assignments" USING "btree" ("employee_id", "site_id", "purpose", "is_active");



CREATE INDEX "idx_employee_inventory_location_assignments_employee" ON "public"."employee_inventory_location_assignments" USING "btree" ("employee_id", "is_active");



CREATE INDEX "idx_employee_inventory_location_assignments_location" ON "public"."employee_inventory_location_assignments" USING "btree" ("location_id", "is_active");



CREATE INDEX "idx_employee_push_tokens_employee_active" ON "public"."employee_push_tokens" USING "btree" ("employee_id", "is_active") WHERE ("is_active" = true);



CREATE INDEX "idx_employee_shifts_date_range" ON "public"."employee_shifts" USING "btree" ("shift_date", "site_id");



CREATE INDEX "idx_employee_shifts_employee_date" ON "public"."employee_shifts" USING "btree" ("employee_id", "shift_date" DESC);



CREATE INDEX "idx_employee_shifts_published_date" ON "public"."employee_shifts" USING "btree" ("site_id", "shift_date", "published_at" DESC);



CREATE INDEX "idx_employee_shifts_site_date" ON "public"."employee_shifts" USING "btree" ("site_id", "shift_date" DESC);



CREATE INDEX "idx_employee_shifts_status" ON "public"."employee_shifts" USING "btree" ("status") WHERE ("status" = 'scheduled'::"text");



CREATE INDEX "idx_inv_locations_area" ON "public"."inventory_locations" USING "btree" ("area_id");



CREATE INDEX "idx_inv_locations_code" ON "public"."inventory_locations" USING "btree" ("code");



CREATE INDEX "idx_inv_locations_site" ON "public"."inventory_locations" USING "btree" ("site_id");



CREATE INDEX "idx_inv_locations_zone" ON "public"."inventory_locations" USING "btree" ("zone");



CREATE INDEX "idx_inv_lpn_items_expiry" ON "public"."inventory_lpn_items" USING "btree" ("expiry_date");



CREATE INDEX "idx_inv_lpn_items_lot" ON "public"."inventory_lpn_items" USING "btree" ("lot_number");



CREATE INDEX "idx_inv_lpn_items_lpn" ON "public"."inventory_lpn_items" USING "btree" ("lpn_id");



CREATE INDEX "idx_inv_lpn_items_product" ON "public"."inventory_lpn_items" USING "btree" ("product_id");



CREATE INDEX "idx_inv_lpns_code" ON "public"."inventory_lpns" USING "btree" ("code");



CREATE INDEX "idx_inv_lpns_location" ON "public"."inventory_lpns" USING "btree" ("location_id");



CREATE INDEX "idx_inv_lpns_site" ON "public"."inventory_lpns" USING "btree" ("site_id");



CREATE INDEX "idx_inv_lpns_status" ON "public"."inventory_lpns" USING "btree" ("status");



CREATE INDEX "idx_inventory_entries_purchase_order_id" ON "public"."inventory_entries" USING "btree" ("purchase_order_id");



CREATE INDEX "idx_inventory_entries_site" ON "public"."inventory_entries" USING "btree" ("site_id");



CREATE INDEX "idx_inventory_entries_source_mode" ON "public"."inventory_entries" USING "btree" ("source_app", "entry_mode", "created_at" DESC);



CREATE INDEX "idx_inventory_entries_status" ON "public"."inventory_entries" USING "btree" ("status");



CREATE INDEX "idx_inventory_entries_supplier" ON "public"."inventory_entries" USING "btree" ("supplier_id");



CREATE INDEX "idx_inventory_entry_items_entry" ON "public"."inventory_entry_items" USING "btree" ("entry_id");



CREATE INDEX "idx_inventory_entry_items_expiry_date" ON "public"."inventory_entry_items" USING "btree" ("expiry_date");



CREATE INDEX "idx_inventory_entry_items_input_uom_profile" ON "public"."inventory_entry_items" USING "btree" ("input_uom_profile_id");



CREATE INDEX "idx_inventory_entry_items_location" ON "public"."inventory_entry_items" USING "btree" ("location_id");



CREATE INDEX "idx_inventory_entry_items_location_position_id" ON "public"."inventory_entry_items" USING "btree" ("location_position_id");



CREATE INDEX "idx_inventory_entry_items_lot_number" ON "public"."inventory_entry_items" USING "btree" ("lot_number");



CREATE INDEX "idx_inventory_entry_items_product" ON "public"."inventory_entry_items" USING "btree" ("product_id");



CREATE INDEX "idx_inventory_entry_items_product_expiry" ON "public"."inventory_entry_items" USING "btree" ("product_id", "expiry_date");



CREATE INDEX "idx_inventory_entry_items_product_lot" ON "public"."inventory_entry_items" USING "btree" ("product_id", "lot_number");



CREATE INDEX "idx_inventory_entry_items_stock_unit_code" ON "public"."inventory_entry_items" USING "btree" ("stock_unit_code");



CREATE INDEX "idx_inventory_form_drafts_expires_at" ON "public"."inventory_form_drafts" USING "btree" ("expires_at");



CREATE INDEX "idx_inventory_form_drafts_user_form_updated" ON "public"."inventory_form_drafts" USING "btree" ("user_id", "form_key", "updated_at" DESC);



CREATE INDEX "idx_inventory_movements_input_uom_profile" ON "public"."inventory_movements" USING "btree" ("input_uom_profile_id");



CREATE INDEX "idx_inventory_movements_location_position_id" ON "public"."inventory_movements" USING "btree" ("location_position_id");



CREATE INDEX "idx_inventory_movements_movement_type" ON "public"."inventory_movements" USING "btree" ("movement_type");



CREATE INDEX "idx_inventory_movements_stock_unit_code" ON "public"."inventory_movements" USING "btree" ("stock_unit_code");



CREATE INDEX "idx_inventory_stock_by_location_location" ON "public"."inventory_stock_by_location" USING "btree" ("location_id");



CREATE INDEX "idx_inventory_stock_by_location_product" ON "public"."inventory_stock_by_location" USING "btree" ("product_id");



CREATE INDEX "idx_inventory_stock_by_position_position" ON "public"."inventory_stock_by_position" USING "btree" ("position_id");



CREATE INDEX "idx_inventory_stock_by_position_product" ON "public"."inventory_stock_by_position" USING "btree" ("product_id");



CREATE INDEX "idx_inventory_stock_by_uom_profile_location" ON "public"."inventory_stock_by_uom_profile" USING "btree" ("location_id");



CREATE INDEX "idx_inventory_stock_by_uom_profile_position" ON "public"."inventory_stock_by_uom_profile" USING "btree" ("location_position_id");



CREATE INDEX "idx_inventory_stock_by_uom_profile_product" ON "public"."inventory_stock_by_uom_profile" USING "btree" ("product_id");



CREATE INDEX "idx_inventory_stock_by_uom_profile_uom_profile" ON "public"."inventory_stock_by_uom_profile" USING "btree" ("uom_profile_id");



CREATE INDEX "idx_inventory_transfer_items_input_uom_profile" ON "public"."inventory_transfer_items" USING "btree" ("input_uom_profile_id");



CREATE INDEX "idx_inventory_transfer_items_product" ON "public"."inventory_transfer_items" USING "btree" ("product_id");



CREATE INDEX "idx_inventory_transfer_items_stock_unit_code" ON "public"."inventory_transfer_items" USING "btree" ("stock_unit_code");



CREATE INDEX "idx_inventory_transfer_items_transfer" ON "public"."inventory_transfer_items" USING "btree" ("transfer_id");



CREATE INDEX "idx_inventory_transfers_from" ON "public"."inventory_transfers" USING "btree" ("from_loc_id");



CREATE INDEX "idx_inventory_transfers_site" ON "public"."inventory_transfers" USING "btree" ("site_id");



CREATE INDEX "idx_inventory_transfers_to" ON "public"."inventory_transfers" USING "btree" ("to_loc_id");



CREATE INDEX "idx_inventory_units_family" ON "public"."inventory_units" USING "btree" ("family", "is_active");



CREATE INDEX "idx_loyalty_external_sales_user_created" ON "public"."loyalty_external_sales" USING "btree" ("user_id", "created_at" DESC);



CREATE INDEX "idx_order_status_events_order_created" ON "public"."order_status_events" USING "btree" ("order_id", "created_at" DESC);



CREATE INDEX "idx_order_status_events_site_created" ON "public"."order_status_events" USING "btree" ("site_id", "created_at" DESC);



CREATE INDEX "idx_orders_client_fulfillment_created_at" ON "public"."orders" USING "btree" ("client_id", "fulfillment_type", "created_at" DESC);



CREATE INDEX "idx_orders_client_payment_status_created_at" ON "public"."orders" USING "btree" ("client_id", "payment_status", "created_at" DESC);



CREATE INDEX "idx_orders_site_dispatch_status_created_at" ON "public"."orders" USING "btree" ("site_id", "dispatch_status", "created_at" DESC) WHERE ("fulfillment_type" = 'delivery'::"text");



CREATE INDEX "idx_orders_table_status" ON "public"."orders" USING "btree" ("table_number", "status") WHERE ("status" <> 'paid'::"text");



CREATE INDEX "idx_printing_label_templates_user_app" ON "public"."printing_label_templates" USING "btree" ("user_id", "app_id", "updated_at" DESC);



CREATE INDEX "idx_product_categories_applies_to_kinds" ON "public"."product_categories" USING "gin" ("applies_to_kinds");



CREATE INDEX "idx_product_categories_domain" ON "public"."product_categories" USING "btree" (COALESCE(NULLIF(TRIM(BOTH FROM "domain"), ''::"text"), '*'::"text"));



CREATE INDEX "idx_product_categories_domain_site_id" ON "public"."product_categories" USING "btree" ("domain", "site_id");



CREATE INDEX "idx_product_categories_scope_parent" ON "public"."product_categories" USING "btree" ("site_id", "parent_id");



CREATE INDEX "idx_product_categories_site_id" ON "public"."product_categories" USING "btree" ("site_id");



CREATE INDEX "idx_product_cost_events_product_created" ON "public"."product_cost_events" USING "btree" ("product_id", "created_at" DESC);



CREATE INDEX "idx_product_inventory_profiles_unit_family" ON "public"."product_inventory_profiles" USING "btree" ("unit_family", "costing_mode");



CREATE INDEX "idx_product_site_settings_production_location" ON "public"."product_site_settings" USING "btree" ("production_location_id") WHERE ("production_location_id" IS NOT NULL);



CREATE INDEX "idx_product_site_settings_site_active_audience" ON "public"."product_site_settings" USING "btree" ("site_id", "is_active", "audience");



CREATE INDEX "idx_product_site_settings_site_active_min" ON "public"."product_site_settings" USING "btree" ("site_id", "is_active", "min_stock_qty");



CREATE INDEX "idx_product_suppliers_pack_unit" ON "public"."product_suppliers" USING "btree" ("product_id", "purchase_pack_unit_code");



CREATE INDEX "idx_product_uom_profiles_product" ON "public"."product_uom_profiles" USING "btree" ("product_id");



CREATE INDEX "idx_product_uom_profiles_product_active" ON "public"."product_uom_profiles" USING "btree" ("product_id", "is_active", "is_default");



CREATE INDEX "idx_product_uom_profiles_product_context" ON "public"."product_uom_profiles" USING "btree" ("product_id", "usage_context", "is_active", "is_default");



CREATE INDEX "idx_production_batch_consumptions_batch" ON "public"."production_batch_consumptions" USING "btree" ("batch_id");



CREATE INDEX "idx_production_batch_consumptions_ingredient" ON "public"."production_batch_consumptions" USING "btree" ("ingredient_product_id", "created_at" DESC);



CREATE INDEX "idx_production_batch_consumptions_location" ON "public"."production_batch_consumptions" USING "btree" ("location_id");



CREATE INDEX "idx_products_stock_unit_code" ON "public"."products" USING "btree" ("stock_unit_code");



CREATE INDEX "idx_purchase_order_items_input_uom_profile_id" ON "public"."purchase_order_items" USING "btree" ("input_uom_profile_id");



CREATE INDEX "idx_purchase_order_items_product_input_uom" ON "public"."purchase_order_items" USING "btree" ("product_id", "input_uom_profile_id");



CREATE INDEX "idx_recipe_cards_area_id" ON "public"."recipe_cards" USING "btree" ("area_id");



CREATE INDEX "idx_recipe_cards_site_id" ON "public"."recipe_cards" USING "btree" ("site_id");



CREATE INDEX "idx_recipe_cards_status" ON "public"."recipe_cards" USING "btree" ("status");



CREATE INDEX "idx_recipe_steps_recipe_card_id" ON "public"."recipe_steps" USING "btree" ("recipe_card_id");



CREATE INDEX "idx_recipes_ingredient_product_id" ON "public"."recipes" USING "btree" ("ingredient_product_id");



CREATE INDEX "idx_restock_request_item_picks_item" ON "public"."restock_request_item_picks" USING "btree" ("item_id");



CREATE INDEX "idx_restock_request_item_picks_product" ON "public"."restock_request_item_picks" USING "btree" ("product_id");



CREATE INDEX "idx_restock_request_item_picks_request" ON "public"."restock_request_item_picks" USING "btree" ("request_id");



CREATE INDEX "idx_restock_request_item_picks_source_location" ON "public"."restock_request_item_picks" USING "btree" ("source_location_id");



CREATE INDEX "idx_restock_request_item_picks_source_position" ON "public"."restock_request_item_picks" USING "btree" ("source_location_position_id");



CREATE INDEX "idx_restock_request_item_picks_uom_profile" ON "public"."restock_request_item_picks" USING "btree" ("uom_profile_id");



CREATE INDEX "idx_restock_request_items_input_uom_profile" ON "public"."restock_request_items" USING "btree" ("input_uom_profile_id");



CREATE INDEX "idx_restock_request_items_source_location" ON "public"."restock_request_items" USING "btree" ("source_location_id");



CREATE INDEX "idx_restock_request_items_stock_unit_code" ON "public"."restock_request_items" USING "btree" ("stock_unit_code");



CREATE UNIQUE INDEX "idx_shift_runtime_events_shift_event_type" ON "public"."shift_runtime_events" USING "btree" ("shift_id", "event_type");



CREATE INDEX "idx_site_area_purpose_rules_site_purpose" ON "public"."site_area_purpose_rules" USING "btree" ("site_id", "purpose", "is_enabled");



CREATE INDEX "idx_site_production_pick_order_active" ON "public"."site_production_pick_order" USING "btree" ("site_id", "is_active", "priority");



CREATE INDEX "idx_sites_location" ON "public"."sites" USING "btree" ("latitude", "longitude") WHERE (("latitude" IS NOT NULL) AND ("longitude" IS NOT NULL));



CREATE INDEX "idx_staff_invitations_auth_user_id" ON "public"."staff_invitations" USING "btree" ("auth_user_id") WHERE ("auth_user_id" IS NOT NULL);



CREATE INDEX "idx_staff_invitations_email" ON "public"."staff_invitations" USING "btree" ("lower"("email"));



CREATE UNIQUE INDEX "idx_staff_invitations_invite_token_hash" ON "public"."staff_invitations" USING "btree" ("invite_token_hash") WHERE ("invite_token_hash" IS NOT NULL);



CREATE INDEX "idx_staff_invitations_invited_by" ON "public"."staff_invitations" USING "btree" ("invited_by");



CREATE INDEX "idx_staff_invitations_site_status" ON "public"."staff_invitations" USING "btree" ("site_id", "status");



CREATE INDEX "idx_staff_invitations_status" ON "public"."staff_invitations" USING "btree" ("status");



CREATE INDEX "idx_user_feedback_created_at" ON "public"."user_feedback" USING "btree" ("created_at" DESC);



CREATE INDEX "idx_user_feedback_rating" ON "public"."user_feedback" USING "btree" ("rating");



CREATE INDEX "idx_user_feedback_site_id" ON "public"."user_feedback" USING "btree" ("site_id");



CREATE INDEX "idx_user_feedback_status" ON "public"."user_feedback" USING "btree" ("status");



CREATE INDEX "idx_user_feedback_user_id" ON "public"."user_feedback" USING "btree" ("user_id");



CREATE INDEX "internal_pos_document_lines_document_idx" ON "public"."internal_pos_document_lines" USING "btree" ("document_id");



CREATE INDEX "internal_pos_document_lines_remission_idx" ON "public"."internal_pos_document_lines" USING "btree" ("remission_id");



CREATE UNIQUE INDEX "internal_pos_document_lines_remission_item_uidx" ON "public"."internal_pos_document_lines" USING "btree" ("remission_item_id");



CREATE INDEX "internal_pos_documents_buyer_idx" ON "public"."internal_pos_documents" USING "btree" ("buyer_cost_center_id", "document_date" DESC);



CREATE UNIQUE INDEX "internal_pos_documents_cutoff_party_active_uidx" ON "public"."internal_pos_documents" USING "btree" ("document_date", "seller_cost_center_id", "buyer_cost_center_id", COALESCE("buyer_site_id", '00000000-0000-0000-0000-000000000000'::"uuid")) WHERE ("status" = ANY (ARRAY['draft'::"text", 'issued'::"text", 'credited'::"text"]));



CREATE INDEX "internal_pos_documents_date_idx" ON "public"."internal_pos_documents" USING "btree" ("document_date", "status");



CREATE UNIQUE INDEX "internal_pos_documents_number_uidx" ON "public"."internal_pos_documents" USING "btree" ("document_number");



CREATE INDEX "internal_pos_documents_seller_idx" ON "public"."internal_pos_documents" USING "btree" ("seller_cost_center_id", "document_date" DESC);



CREATE UNIQUE INDEX "internal_price_list_items_active_legacy_unit_uniq" ON "public"."internal_price_list_items" USING "btree" ("price_list_id", "product_id", "lower"("btrim"("unit_code"))) WHERE (("is_active" = true) AND ("uom_profile_id" IS NULL));



CREATE UNIQUE INDEX "internal_price_list_items_active_profile_uniq" ON "public"."internal_price_list_items" USING "btree" ("price_list_id", "product_id", "uom_profile_id") WHERE (("is_active" = true) AND ("uom_profile_id" IS NOT NULL));



CREATE INDEX "internal_price_list_items_product_idx" ON "public"."internal_price_list_items" USING "btree" ("product_id", "is_active");



CREATE INDEX "internal_price_list_items_uom_profile_idx" ON "public"."internal_price_list_items" USING "btree" ("uom_profile_id") WHERE ("uom_profile_id" IS NOT NULL);



CREATE INDEX "internal_price_lists_buyer_cc_idx" ON "public"."internal_price_lists" USING "btree" ("buyer_cost_center_id", "is_active", "valid_from" DESC) WHERE ("buyer_cost_center_id" IS NOT NULL);



CREATE INDEX "internal_price_lists_buyer_site_idx" ON "public"."internal_price_lists" USING "btree" ("buyer_site_id", "is_active", "valid_from" DESC) WHERE ("buyer_site_id" IS NOT NULL);



CREATE INDEX "internal_price_lists_seller_idx" ON "public"."internal_price_lists" USING "btree" ("seller_cost_center_id", "is_active", "valid_from" DESC);



CREATE INDEX "internal_transfer_variances_item_idx" ON "public"."internal_transfer_variances" USING "btree" ("remission_item_id");



CREATE INDEX "internal_transfer_variances_remission_idx" ON "public"."internal_transfer_variances" USING "btree" ("remission_id", "status");



CREATE INDEX "internal_transfer_variances_responsible_cc_idx" ON "public"."internal_transfer_variances" USING "btree" ("responsible_cost_center_id", "status") WHERE ("responsible_cost_center_id" IS NOT NULL);



CREATE UNIQUE INDEX "inventory_location_positions_location_code_uidx" ON "public"."inventory_location_positions" USING "btree" ("location_id", "code");



CREATE INDEX "inventory_location_positions_location_idx" ON "public"."inventory_location_positions" USING "btree" ("location_id");



CREATE INDEX "inventory_location_positions_parent_idx" ON "public"."inventory_location_positions" USING "btree" ("parent_position_id");



CREATE INDEX "inventory_location_positions_site_idx" ON "public"."inventory_location_positions" USING "btree" ("site_id");



CREATE INDEX "inventory_locations_parent_id_idx" ON "public"."inventory_locations" USING "btree" ("parent_location_id");



CREATE UNIQUE INDEX "inventory_locations_site_code_uniq" ON "public"."inventory_locations" USING "btree" ("site_id", "code");



CREATE INDEX "inventory_movements_related_purchase_order_id_idx" ON "public"."inventory_movements" USING "btree" ("related_purchase_order_id");



CREATE UNIQUE INDEX "inventory_stock_by_site_site_product_uidx" ON "public"."inventory_stock_by_site" USING "btree" ("site_id", "product_id");



CREATE UNIQUE INDEX "inventory_stock_by_site_unique_site_product" ON "public"."inventory_stock_by_site" USING "btree" ("site_id", "product_id");



CREATE INDEX "order_conversations_client_last_message_idx" ON "public"."order_conversations" USING "btree" ("client_id", COALESCE("last_message_at", "created_at") DESC);



CREATE INDEX "order_conversations_site_last_message_idx" ON "public"."order_conversations" USING "btree" ("site_id", COALESCE("last_message_at", "created_at") DESC);



CREATE INDEX "order_messages_conversation_created_idx" ON "public"."order_messages" USING "btree" ("conversation_id", "created_at");



CREATE INDEX "order_messages_site_created_idx" ON "public"."order_messages" USING "btree" ("site_id", "created_at" DESC);



CREATE INDEX "product_asset_maintenance_events_performed_date_idx" ON "public"."product_asset_maintenance_events" USING "btree" ("performed_date" DESC);



CREATE INDEX "product_asset_maintenance_events_product_id_idx" ON "public"."product_asset_maintenance_events" USING "btree" ("product_id");



CREATE INDEX "product_asset_maintenance_events_scheduled_date_idx" ON "public"."product_asset_maintenance_events" USING "btree" ("scheduled_date" DESC);



CREATE INDEX "product_asset_transfer_events_moved_at_idx" ON "public"."product_asset_transfer_events" USING "btree" ("moved_at" DESC);



CREATE INDEX "product_asset_transfer_events_product_id_idx" ON "public"."product_asset_transfer_events" USING "btree" ("product_id");



CREATE INDEX "product_categories_domain_idx" ON "public"."product_categories" USING "btree" ("domain");



CREATE UNIQUE INDEX "product_categories_domain_parent_slug_uidx" ON "public"."product_categories" USING "btree" ("domain", COALESCE("parent_id", '00000000-0000-0000-0000-000000000000'::"uuid"), "slug");



CREATE INDEX "product_categories_parent_id_idx" ON "public"."product_categories" USING "btree" ("parent_id");



CREATE INDEX "product_images_product_id_idx" ON "public"."product_images" USING "btree" ("product_id");



CREATE UNIQUE INDEX "product_images_product_url_unique_idx" ON "public"."product_images" USING "btree" ("product_id", "image_url");



CREATE INDEX "product_site_settings_product_id_idx" ON "public"."product_site_settings" USING "btree" ("product_id");



CREATE INDEX "product_site_settings_site_id_idx" ON "public"."product_site_settings" USING "btree" ("site_id");



CREATE INDEX "product_sku_aliases_product_id_idx" ON "public"."product_sku_aliases" USING "btree" ("product_id");



CREATE UNIQUE INDEX "product_sku_aliases_sku_key" ON "public"."product_sku_aliases" USING "btree" ("sku");



CREATE INDEX "purchase_orders_created_by_idx" ON "public"."purchase_orders" USING "btree" ("created_by");



CREATE INDEX "required_document_rules_document_type_id" ON "public"."required_document_rules" USING "btree" ("document_type_id");



CREATE INDEX "required_document_rules_site_role_active" ON "public"."required_document_rules" USING "btree" ("site_id", "role", "active") WHERE ("active" = true);



CREATE INDEX "restock_request_items_internal_price_idx" ON "public"."restock_request_items" USING "btree" ("internal_price_list_item_id") WHERE ("internal_price_list_item_id" IS NOT NULL);



CREATE INDEX "restock_request_items_priced_at_idx" ON "public"."restock_request_items" USING "btree" ("priced_at") WHERE ("priced_at" IS NOT NULL);



CREATE INDEX "restock_requests_internal_billing_idx" ON "public"."restock_requests" USING "btree" ("pricing_mode", "pricing_status", "closed_at", "internal_pos_document_id");



CREATE INDEX "restock_requests_seller_buyer_cc_idx" ON "public"."restock_requests" USING "btree" ("seller_cost_center_id", "buyer_cost_center_id") WHERE (("seller_cost_center_id" IS NOT NULL) AND ("buyer_cost_center_id" IS NOT NULL));



CREATE INDEX "role_permissions_scope_area_id_idx" ON "public"."role_permissions" USING "btree" ("scope_area_id");



CREATE INDEX "role_permissions_scope_area_kind_idx" ON "public"."role_permissions" USING "btree" ("scope_area_kind");



CREATE INDEX "role_permissions_scope_site_id_idx" ON "public"."role_permissions" USING "btree" ("scope_site_id");



CREATE INDEX "role_permissions_scope_site_type_idx" ON "public"."role_permissions" USING "btree" ("scope_site_type");



CREATE UNIQUE INDEX "staff_invitations_token_key" ON "public"."staff_invitations" USING "btree" ("token");



CREATE INDEX "staff_manual_calendar_events_date_idx" ON "public"."staff_manual_calendar_events" USING "btree" ("event_date", "is_active", "event_type");



CREATE INDEX "staff_manual_calendar_events_site_idx" ON "public"."staff_manual_calendar_events" USING "btree" ("site_id", "event_date") WHERE ("site_id" IS NOT NULL);



CREATE INDEX "support_tickets_assigned_idx" ON "public"."support_tickets" USING "btree" ("assigned_to");



CREATE INDEX "support_tickets_site_idx" ON "public"."support_tickets" USING "btree" ("site_id");



CREATE INDEX "support_tickets_status_idx" ON "public"."support_tickets" USING "btree" ("status");



CREATE UNIQUE INDEX "uq_loyalty_external_sales_site_ref" ON "public"."loyalty_external_sales" USING "btree" ("site_id", "lower"("btrim"("external_ref")));



CREATE UNIQUE INDEX "ux_inventory_form_drafts_scope" ON "public"."inventory_form_drafts" USING "btree" ("user_id", "form_key", "entity_scope", "site_scope");



CREATE UNIQUE INDEX "ux_inventory_stock_by_uom_profile_no_position" ON "public"."inventory_stock_by_uom_profile" USING "btree" ("location_id", "product_id", "uom_profile_id") WHERE ("location_position_id" IS NULL);



CREATE UNIQUE INDEX "ux_inventory_stock_by_uom_profile_with_position" ON "public"."inventory_stock_by_uom_profile" USING "btree" ("location_id", "location_position_id", "product_id", "uom_profile_id") WHERE ("location_position_id" IS NOT NULL);



CREATE UNIQUE INDEX "ux_product_categories_scope_parent_name" ON "public"."product_categories" USING "btree" (COALESCE("site_id", '00000000-0000-0000-0000-000000000000'::"uuid"), COALESCE("parent_id", '00000000-0000-0000-0000-000000000000'::"uuid"), COALESCE(NULLIF(TRIM(BOTH FROM "domain"), ''::"text"), '*'::"text"), "lower"(TRIM(BOTH FROM "name")));



CREATE UNIQUE INDEX "ux_product_categories_scope_parent_slug" ON "public"."product_categories" USING "btree" (COALESCE("site_id", '00000000-0000-0000-0000-000000000000'::"uuid"), COALESCE("parent_id", '00000000-0000-0000-0000-000000000000'::"uuid"), COALESCE(NULLIF(TRIM(BOTH FROM "domain"), ''::"text"), '*'::"text"), "lower"(TRIM(BOTH FROM "slug"))) WHERE (("slug" IS NOT NULL) AND (TRIM(BOTH FROM "slug") <> ''::"text"));



CREATE UNIQUE INDEX "ux_product_site_settings_product_site" ON "public"."product_site_settings" USING "btree" ("product_id", "site_id");



CREATE UNIQUE INDEX "ux_product_uom_profiles_default_per_product_context" ON "public"."product_uom_profiles" USING "btree" ("product_id", "usage_context") WHERE (("is_default" = true) AND ("is_active" = true));



CREATE UNIQUE INDEX "ux_production_batch_consumptions_batch_ingredient_location" ON "public"."production_batch_consumptions" USING "btree" ("batch_id", "ingredient_product_id", "location_id");



CREATE UNIQUE INDEX "ux_products_create_request_key" ON "public"."products" USING "btree" ("create_request_key") WHERE ("create_request_key" IS NOT NULL);



CREATE UNIQUE INDEX "ux_products_sku_unique_global" ON "public"."products" USING "btree" ("lower"(TRIM(BOTH FROM "sku"))) WHERE (("sku" IS NOT NULL) AND (TRIM(BOTH FROM "sku") <> ''::"text"));



CREATE INDEX "website_blocks_page_idx" ON "public"."website_blocks" USING "btree" ("page_slug", "sort_order");



CREATE INDEX "website_blocks_published_idx" ON "public"."website_blocks" USING "btree" ("is_published");



CREATE INDEX "website_items_category_idx" ON "public"."website_items" USING "btree" ("category", "sort_order");



CREATE INDEX "website_items_published_idx" ON "public"."website_items" USING "btree" ("is_published");



CREATE OR REPLACE TRIGGER "app_content_blocks_set_updated_at" BEFORE UPDATE ON "public"."app_content_blocks" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at"();



CREATE OR REPLACE TRIGGER "app_update_policies_set_updated_at" BEFORE UPDATE ON "public"."app_update_policies" FOR EACH ROW EXECUTE FUNCTION "public"."_set_updated_at"();



CREATE OR REPLACE TRIGGER "attendance_breaks_set_updated_at" BEFORE UPDATE ON "public"."attendance_breaks" FOR EACH ROW EXECUTE FUNCTION "public"."set_updated_at"();



CREATE OR REPLACE TRIGGER "attendance_logs_00_geofence" BEFORE INSERT ON "public"."attendance_logs" FOR EACH ROW EXECUTE FUNCTION "public"."enforce_attendance_geofence"();



CREATE OR REPLACE TRIGGER "attendance_logs_enforce_sequence" BEFORE INSERT ON "public"."attendance_logs" FOR EACH ROW EXECUTE FUNCTION "public"."enforce_attendance_sequence"();



CREATE OR REPLACE TRIGGER "attendance_shift_events_set_updated_at" BEFORE UPDATE ON "public"."attendance_shift_events" FOR EACH ROW EXECUTE FUNCTION "public"."set_updated_at"();



CREATE OR REPLACE TRIGGER "documents_set_updated_at" BEFORE UPDATE ON "public"."documents" FOR EACH ROW EXECUTE FUNCTION "public"."set_updated_at"();



CREATE OR REPLACE TRIGGER "employee_devices_set_updated_at" BEFORE UPDATE ON "public"."employee_devices" FOR EACH ROW EXECUTE FUNCTION "public"."set_updated_at"();



CREATE OR REPLACE TRIGGER "enforce_inventory_location_area_site" BEFORE INSERT OR UPDATE OF "site_id", "area_id" ON "public"."inventory_locations" FOR EACH ROW EXECUTE FUNCTION "public"."enforce_inventory_location_area_site"();



CREATE OR REPLACE TRIGGER "enforce_inventory_location_position_scope" BEFORE INSERT OR UPDATE OF "site_id", "location_id", "parent_position_id" ON "public"."inventory_location_positions" FOR EACH ROW EXECUTE FUNCTION "public"."enforce_inventory_location_position_scope"();



CREATE OR REPLACE TRIGGER "restock_request_item_picks_set_updated_at" BEFORE UPDATE ON "public"."restock_request_item_picks" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at"();



CREATE OR REPLACE TRIGGER "restock_request_item_picks_validate" BEFORE INSERT OR UPDATE ON "public"."restock_request_item_picks" FOR EACH ROW EXECUTE FUNCTION "public"."validate_restock_request_item_pick"();



CREATE OR REPLACE TRIGGER "set_document_types_updated_at" BEFORE UPDATE ON "public"."document_types" FOR EACH ROW EXECUTE FUNCTION "public"."_set_updated_at"();



CREATE OR REPLACE TRIGGER "set_employee_push_tokens_updated_at" BEFORE UPDATE ON "public"."employee_push_tokens" FOR EACH ROW EXECUTE FUNCTION "public"."_set_updated_at"();



CREATE OR REPLACE TRIGGER "set_updated_at_product_asset_maintenance_events" BEFORE UPDATE ON "public"."product_asset_maintenance_events" FOR EACH ROW EXECUTE FUNCTION "public"."tg_set_updated_at"();



CREATE OR REPLACE TRIGGER "set_updated_at_product_asset_profiles" BEFORE UPDATE ON "public"."product_asset_profiles" FOR EACH ROW EXECUTE FUNCTION "public"."tg_set_updated_at"();



CREATE OR REPLACE TRIGGER "set_updated_at_product_asset_transfer_events" BEFORE UPDATE ON "public"."product_asset_transfer_events" FOR EACH ROW EXECUTE FUNCTION "public"."tg_set_updated_at"();



CREATE OR REPLACE TRIGGER "set_updated_at_product_inventory_profiles" BEFORE UPDATE ON "public"."product_inventory_profiles" FOR EACH ROW EXECUTE FUNCTION "public"."tg_set_updated_at"();



CREATE OR REPLACE TRIGGER "staff_manual_calendar_events_set_updated_at" BEFORE UPDATE ON "public"."staff_manual_calendar_events" FOR EACH ROW EXECUTE FUNCTION "public"."_set_updated_at"();



CREATE OR REPLACE TRIGGER "support_tickets_set_updated_at" BEFORE UPDATE ON "public"."support_tickets" FOR EACH ROW EXECUTE FUNCTION "public"."set_updated_at"();



CREATE OR REPLACE TRIGGER "trg_app_navigation_items_updated_at" BEFORE UPDATE ON "public"."app_navigation_items" FOR EACH ROW EXECUTE FUNCTION "public"."set_app_navigation_items_updated_at"();



CREATE OR REPLACE TRIGGER "trg_cost_centers_updated_at" BEFORE UPDATE ON "public"."cost_centers" FOR EACH ROW EXECUTE FUNCTION "public"."_set_updated_at"();



CREATE OR REPLACE TRIGGER "trg_employee_area_purpose_assignments_updated_at" BEFORE UPDATE ON "public"."employee_area_purpose_assignments" FOR EACH ROW EXECUTE FUNCTION "public"."_set_updated_at"();



CREATE OR REPLACE TRIGGER "trg_employee_inventory_location_assignment_site" BEFORE INSERT OR UPDATE OF "employee_id", "site_id", "location_id", "is_active" ON "public"."employee_inventory_location_assignments" FOR EACH ROW EXECUTE FUNCTION "public"."enforce_employee_inventory_location_assignment_site"();



CREATE OR REPLACE TRIGGER "trg_employee_push_tokens_updated_at" BEFORE UPDATE ON "public"."employee_push_tokens" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at"();



CREATE OR REPLACE TRIGGER "trg_enforce_employee_role_site" BEFORE INSERT OR UPDATE OF "role", "site_id" ON "public"."employees" FOR EACH ROW EXECUTE FUNCTION "public"."enforce_employee_role_site"();



CREATE OR REPLACE TRIGGER "trg_internal_pos_document_sequences_updated_at" BEFORE UPDATE ON "public"."internal_pos_document_sequences" FOR EACH ROW EXECUTE FUNCTION "public"."_set_updated_at"();



CREATE OR REPLACE TRIGGER "trg_internal_pos_documents_updated_at" BEFORE UPDATE ON "public"."internal_pos_documents" FOR EACH ROW EXECUTE FUNCTION "public"."_set_updated_at"();



CREATE OR REPLACE TRIGGER "trg_internal_price_list_items_uom_snapshot" BEFORE INSERT OR UPDATE OF "product_id", "unit_code", "uom_profile_id", "pricing_label", "pricing_input_unit_code", "pricing_qty_in_input_unit", "pricing_qty_in_stock_unit" ON "public"."internal_price_list_items" FOR EACH ROW EXECUTE FUNCTION "public"."set_internal_price_item_uom_snapshot"();



CREATE OR REPLACE TRIGGER "trg_internal_price_list_items_updated_at" BEFORE UPDATE ON "public"."internal_price_list_items" FOR EACH ROW EXECUTE FUNCTION "public"."_set_updated_at"();



CREATE OR REPLACE TRIGGER "trg_internal_price_lists_updated_at" BEFORE UPDATE ON "public"."internal_price_lists" FOR EACH ROW EXECUTE FUNCTION "public"."_set_updated_at"();



CREATE OR REPLACE TRIGGER "trg_internal_transfer_variances_updated_at" BEFORE UPDATE ON "public"."internal_transfer_variances" FOR EACH ROW EXECUTE FUNCTION "public"."_set_updated_at"();



CREATE OR REPLACE TRIGGER "trg_inventory_form_drafts_updated_at" BEFORE UPDATE ON "public"."inventory_form_drafts" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at"();



CREATE OR REPLACE TRIGGER "trg_inventory_locations_parent_same_site" BEFORE INSERT OR UPDATE OF "parent_location_id", "site_id" ON "public"."inventory_locations" FOR EACH ROW EXECUTE FUNCTION "public"."enforce_inventory_location_parent_same_site"();



CREATE OR REPLACE TRIGGER "trg_inventory_units_updated_at" BEFORE UPDATE ON "public"."inventory_units" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at"();



CREATE OR REPLACE TRIGGER "trg_order_conversations_updated_at" BEFORE UPDATE ON "public"."order_conversations" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at"();



CREATE OR REPLACE TRIGGER "trg_order_messages_touch_conversation" AFTER INSERT ON "public"."order_messages" FOR EACH ROW EXECUTE FUNCTION "public"."touch_order_conversation_from_message"();



CREATE OR REPLACE TRIGGER "trg_orders_sync_fulfillment_state" BEFORE INSERT OR UPDATE ON "public"."orders" FOR EACH ROW EXECUTE FUNCTION "public"."sync_order_fulfillment_state"();



CREATE OR REPLACE TRIGGER "trg_printing_label_templates_updated_at" BEFORE UPDATE ON "public"."printing_label_templates" FOR EACH ROW EXECUTE FUNCTION "public"."_set_updated_at"();



CREATE OR REPLACE TRIGGER "trg_product_categories_updated_at" BEFORE UPDATE ON "public"."product_categories" FOR EACH ROW EXECUTE FUNCTION "public"."_set_updated_at"();



CREATE OR REPLACE TRIGGER "trg_product_site_settings_production_location" BEFORE INSERT OR UPDATE OF "site_id", "production_location_id" ON "public"."product_site_settings" FOR EACH ROW EXECUTE FUNCTION "public"."validate_product_site_production_location"();



CREATE OR REPLACE TRIGGER "trg_product_site_settings_updated_at" BEFORE UPDATE ON "public"."product_site_settings" FOR EACH ROW EXECUTE FUNCTION "public"."_set_updated_at"();



CREATE OR REPLACE TRIGGER "trg_set_product_sku" BEFORE INSERT OR UPDATE ON "public"."products" FOR EACH ROW EXECUTE FUNCTION "public"."set_product_sku"();



CREATE OR REPLACE TRIGGER "trg_set_production_batch_code" BEFORE INSERT ON "public"."production_batches" FOR EACH ROW EXECUTE FUNCTION "public"."set_production_batch_code"();



CREATE OR REPLACE TRIGGER "trg_site_area_purpose_rules_updated_at" BEFORE UPDATE ON "public"."site_area_purpose_rules" FOR EACH ROW EXECUTE FUNCTION "public"."_set_updated_at"();



CREATE OR REPLACE TRIGGER "trg_site_operational_capabilities_updated_at" BEFORE UPDATE ON "public"."site_operational_capabilities" FOR EACH ROW EXECUTE FUNCTION "public"."_set_updated_at"();



CREATE OR REPLACE TRIGGER "trg_site_purpose_settings_updated_at" BEFORE UPDATE ON "public"."site_purpose_settings" FOR EACH ROW EXECUTE FUNCTION "public"."_set_updated_at"();



CREATE OR REPLACE TRIGGER "trg_staff_invitations_updated_at" BEFORE UPDATE ON "public"."staff_invitations" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at"();



CREATE OR REPLACE TRIGGER "trg_sync_restock_item_status" BEFORE INSERT OR UPDATE OF "quantity", "prepared_quantity", "shipped_quantity", "received_quantity", "shortage_quantity" ON "public"."restock_request_items" FOR EACH ROW EXECUTE FUNCTION "public"."sync_restock_item_status_trigger"();



CREATE OR REPLACE TRIGGER "trg_sync_restock_request_status_from_items" AFTER INSERT OR DELETE OR UPDATE OF "quantity", "prepared_quantity", "shipped_quantity", "received_quantity", "shortage_quantity", "item_status", "request_id" ON "public"."restock_request_items" FOR EACH ROW EXECUTE FUNCTION "public"."trg_sync_restock_request_status_from_items"();



CREATE OR REPLACE TRIGGER "trigger_employee_shifts_updated_at" BEFORE UPDATE ON "public"."employee_shifts" FOR EACH ROW EXECUTE FUNCTION "public"."update_employee_shifts_updated_at"();



CREATE OR REPLACE TRIGGER "update_inventory_entries_updated_at" BEFORE UPDATE ON "public"."inventory_entries" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at"();



CREATE OR REPLACE TRIGGER "update_inventory_location_positions_updated_at" BEFORE UPDATE ON "public"."inventory_location_positions" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at"();



CREATE OR REPLACE TRIGGER "update_inventory_locations_updated_at" BEFORE UPDATE ON "public"."inventory_locations" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at"();



CREATE OR REPLACE TRIGGER "update_inventory_lpn_items_updated_at" BEFORE UPDATE ON "public"."inventory_lpn_items" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at"();



CREATE OR REPLACE TRIGGER "update_inventory_lpns_updated_at" BEFORE UPDATE ON "public"."inventory_lpns" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at"();



CREATE OR REPLACE TRIGGER "update_inventory_transfers_updated_at" BEFORE UPDATE ON "public"."inventory_transfers" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at"();



CREATE OR REPLACE TRIGGER "website_blocks_touch_updated_at" BEFORE UPDATE ON "public"."website_blocks" FOR EACH ROW EXECUTE FUNCTION "public"."touch_updated_at"();



CREATE OR REPLACE TRIGGER "website_items_touch_updated_at" BEFORE UPDATE ON "public"."website_items" FOR EACH ROW EXECUTE FUNCTION "public"."touch_updated_at"();



ALTER TABLE ONLY "public"."account_deletion_requests"
    ADD CONSTRAINT "account_deletion_requests_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."announcements"
    ADD CONSTRAINT "announcements_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "auth"."users"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."app_permissions"
    ADD CONSTRAINT "app_permissions_app_id_fkey" FOREIGN KEY ("app_id") REFERENCES "public"."apps"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."app_runtime_settings"
    ADD CONSTRAINT "app_runtime_settings_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "auth"."users"("id");



ALTER TABLE ONLY "public"."areas"
    ADD CONSTRAINT "areas_kind_fkey" FOREIGN KEY ("kind") REFERENCES "public"."area_kinds"("code");



ALTER TABLE ONLY "public"."areas"
    ADD CONSTRAINT "areas_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id");



ALTER TABLE ONLY "public"."attendance_breaks"
    ADD CONSTRAINT "attendance_breaks_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "public"."employees"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."attendance_breaks"
    ADD CONSTRAINT "attendance_breaks_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."attendance_logs"
    ADD CONSTRAINT "attendance_logs_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "public"."employees"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."attendance_logs"
    ADD CONSTRAINT "attendance_logs_shift_id_fkey" FOREIGN KEY ("shift_id") REFERENCES "public"."employee_shifts"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."attendance_logs"
    ADD CONSTRAINT "attendance_logs_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."attendance_shift_events"
    ADD CONSTRAINT "attendance_shift_events_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "public"."employees"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."attendance_shift_events"
    ADD CONSTRAINT "attendance_shift_events_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."attendance_sync_conflicts"
    ADD CONSTRAINT "attendance_sync_conflicts_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "public"."employees"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."cost_centers"
    ADD CONSTRAINT "cost_centers_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id");



ALTER TABLE ONLY "public"."documents"
    ADD CONSTRAINT "documents_approved_by_fkey" FOREIGN KEY ("approved_by") REFERENCES "public"."employees"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."documents"
    ADD CONSTRAINT "documents_document_type_id_fkey" FOREIGN KEY ("document_type_id") REFERENCES "public"."document_types"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."documents"
    ADD CONSTRAINT "documents_owner_employee_id_fkey" FOREIGN KEY ("owner_employee_id") REFERENCES "public"."employees"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."documents"
    ADD CONSTRAINT "documents_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."documents"
    ADD CONSTRAINT "documents_target_employee_id_fkey" FOREIGN KEY ("target_employee_id") REFERENCES "public"."employees"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."employee_area_purpose_assignments"
    ADD CONSTRAINT "employee_area_purpose_assignments_area_id_fkey" FOREIGN KEY ("area_id") REFERENCES "public"."areas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."employee_area_purpose_assignments"
    ADD CONSTRAINT "employee_area_purpose_assignments_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "public"."employees"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."employee_area_purpose_assignments"
    ADD CONSTRAINT "employee_area_purpose_assignments_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."employee_areas"
    ADD CONSTRAINT "employee_areas_area_id_fkey" FOREIGN KEY ("area_id") REFERENCES "public"."areas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."employee_areas"
    ADD CONSTRAINT "employee_areas_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "public"."employees"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."employee_devices"
    ADD CONSTRAINT "employee_devices_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "public"."employees"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."employee_inventory_location_assignments"
    ADD CONSTRAINT "employee_inventory_location_assignments_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "public"."employees"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."employee_inventory_location_assignments"
    ADD CONSTRAINT "employee_inventory_location_assignments_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "public"."inventory_locations"("id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."employee_inventory_location_assignments"
    ADD CONSTRAINT "employee_inventory_location_assignments_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."employee_permissions"
    ADD CONSTRAINT "employee_permissions_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "public"."employees"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."employee_permissions"
    ADD CONSTRAINT "employee_permissions_permission_id_fkey" FOREIGN KEY ("permission_id") REFERENCES "public"."app_permissions"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."employee_permissions"
    ADD CONSTRAINT "employee_permissions_scope_area_id_fkey" FOREIGN KEY ("scope_area_id") REFERENCES "public"."areas"("id");



ALTER TABLE ONLY "public"."employee_permissions"
    ADD CONSTRAINT "employee_permissions_scope_area_kind_fkey" FOREIGN KEY ("scope_area_kind") REFERENCES "public"."area_kinds"("code");



ALTER TABLE ONLY "public"."employee_permissions"
    ADD CONSTRAINT "employee_permissions_scope_site_id_fkey" FOREIGN KEY ("scope_site_id") REFERENCES "public"."sites"("id");



ALTER TABLE ONLY "public"."employee_push_tokens"
    ADD CONSTRAINT "employee_push_tokens_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "public"."employees"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."employee_settings"
    ADD CONSTRAINT "employee_settings_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "public"."employees"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."employee_settings"
    ADD CONSTRAINT "employee_settings_selected_area_id_fkey" FOREIGN KEY ("selected_area_id") REFERENCES "public"."areas"("id");



ALTER TABLE ONLY "public"."employee_settings"
    ADD CONSTRAINT "employee_settings_selected_site_id_fkey" FOREIGN KEY ("selected_site_id") REFERENCES "public"."sites"("id");



ALTER TABLE ONLY "public"."employee_shifts"
    ADD CONSTRAINT "employee_shifts_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."employees"("id");



ALTER TABLE ONLY "public"."employee_shifts"
    ADD CONSTRAINT "employee_shifts_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "public"."employees"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."employee_shifts"
    ADD CONSTRAINT "employee_shifts_published_by_fkey" FOREIGN KEY ("published_by") REFERENCES "public"."employees"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."employee_shifts"
    ADD CONSTRAINT "employee_shifts_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."employee_sites"
    ADD CONSTRAINT "employee_sites_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "public"."employees"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."employee_sites"
    ADD CONSTRAINT "employee_sites_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."employee_wallet_cards"
    ADD CONSTRAINT "employee_wallet_cards_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "public"."employees"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."employees"
    ADD CONSTRAINT "employees_area_id_fkey" FOREIGN KEY ("area_id") REFERENCES "public"."areas"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."employees"
    ADD CONSTRAINT "employees_id_fkey" FOREIGN KEY ("id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."employees"
    ADD CONSTRAINT "employees_role_fkey" FOREIGN KEY ("role") REFERENCES "public"."roles"("code");



ALTER TABLE ONLY "public"."employees"
    ADD CONSTRAINT "employees_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id");



ALTER TABLE ONLY "public"."internal_pos_document_lines"
    ADD CONSTRAINT "internal_pos_document_lines_document_id_fkey" FOREIGN KEY ("document_id") REFERENCES "public"."internal_pos_documents"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."internal_pos_document_lines"
    ADD CONSTRAINT "internal_pos_document_lines_price_list_id_fkey" FOREIGN KEY ("price_list_id") REFERENCES "public"."internal_price_lists"("id");



ALTER TABLE ONLY "public"."internal_pos_document_lines"
    ADD CONSTRAINT "internal_pos_document_lines_price_list_item_id_fkey" FOREIGN KEY ("price_list_item_id") REFERENCES "public"."internal_price_list_items"("id");



ALTER TABLE ONLY "public"."internal_pos_document_lines"
    ADD CONSTRAINT "internal_pos_document_lines_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id");



ALTER TABLE ONLY "public"."internal_pos_document_lines"
    ADD CONSTRAINT "internal_pos_document_lines_remission_id_fkey" FOREIGN KEY ("remission_id") REFERENCES "public"."restock_requests"("id");



ALTER TABLE ONLY "public"."internal_pos_document_lines"
    ADD CONSTRAINT "internal_pos_document_lines_remission_item_id_fkey" FOREIGN KEY ("remission_item_id") REFERENCES "public"."restock_request_items"("id");



ALTER TABLE ONLY "public"."internal_pos_documents"
    ADD CONSTRAINT "internal_pos_documents_buyer_cost_center_id_fkey" FOREIGN KEY ("buyer_cost_center_id") REFERENCES "public"."cost_centers"("id");



ALTER TABLE ONLY "public"."internal_pos_documents"
    ADD CONSTRAINT "internal_pos_documents_buyer_site_id_fkey" FOREIGN KEY ("buyer_site_id") REFERENCES "public"."sites"("id");



ALTER TABLE ONLY "public"."internal_pos_documents"
    ADD CONSTRAINT "internal_pos_documents_seller_cost_center_id_fkey" FOREIGN KEY ("seller_cost_center_id") REFERENCES "public"."cost_centers"("id");



ALTER TABLE ONLY "public"."internal_price_list_items"
    ADD CONSTRAINT "internal_price_list_items_price_list_id_fkey" FOREIGN KEY ("price_list_id") REFERENCES "public"."internal_price_lists"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."internal_price_list_items"
    ADD CONSTRAINT "internal_price_list_items_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id");



ALTER TABLE ONLY "public"."internal_price_list_items"
    ADD CONSTRAINT "internal_price_list_items_uom_profile_id_fkey" FOREIGN KEY ("uom_profile_id") REFERENCES "public"."product_uom_profiles"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."internal_price_lists"
    ADD CONSTRAINT "internal_price_lists_buyer_cost_center_id_fkey" FOREIGN KEY ("buyer_cost_center_id") REFERENCES "public"."cost_centers"("id");



ALTER TABLE ONLY "public"."internal_price_lists"
    ADD CONSTRAINT "internal_price_lists_buyer_site_id_fkey" FOREIGN KEY ("buyer_site_id") REFERENCES "public"."sites"("id");



ALTER TABLE ONLY "public"."internal_price_lists"
    ADD CONSTRAINT "internal_price_lists_seller_cost_center_id_fkey" FOREIGN KEY ("seller_cost_center_id") REFERENCES "public"."cost_centers"("id");



ALTER TABLE ONLY "public"."internal_transfer_variances"
    ADD CONSTRAINT "internal_transfer_variances_approved_by_fkey" FOREIGN KEY ("approved_by") REFERENCES "public"."employees"("id");



ALTER TABLE ONLY "public"."internal_transfer_variances"
    ADD CONSTRAINT "internal_transfer_variances_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id");



ALTER TABLE ONLY "public"."internal_transfer_variances"
    ADD CONSTRAINT "internal_transfer_variances_remission_id_fkey" FOREIGN KEY ("remission_id") REFERENCES "public"."restock_requests"("id");



ALTER TABLE ONLY "public"."internal_transfer_variances"
    ADD CONSTRAINT "internal_transfer_variances_remission_item_id_fkey" FOREIGN KEY ("remission_item_id") REFERENCES "public"."restock_request_items"("id");



ALTER TABLE ONLY "public"."internal_transfer_variances"
    ADD CONSTRAINT "internal_transfer_variances_responsible_cost_center_id_fkey" FOREIGN KEY ("responsible_cost_center_id") REFERENCES "public"."cost_centers"("id");



ALTER TABLE ONLY "public"."internal_transfer_variances"
    ADD CONSTRAINT "internal_transfer_variances_responsible_employee_id_fkey" FOREIGN KEY ("responsible_employee_id") REFERENCES "public"."employees"("id");



ALTER TABLE ONLY "public"."inventory_cost_policies"
    ADD CONSTRAINT "inventory_cost_policies_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."inventory_cost_policies"
    ADD CONSTRAINT "inventory_cost_policies_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "auth"."users"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."inventory_count_lines"
    ADD CONSTRAINT "inventory_count_lines_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."inventory_count_lines"
    ADD CONSTRAINT "inventory_count_lines_session_id_fkey" FOREIGN KEY ("session_id") REFERENCES "public"."inventory_count_sessions"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."inventory_count_sessions"
    ADD CONSTRAINT "inventory_count_sessions_closed_by_fkey" FOREIGN KEY ("closed_by") REFERENCES "auth"."users"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."inventory_count_sessions"
    ADD CONSTRAINT "inventory_count_sessions_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "auth"."users"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."inventory_count_sessions"
    ADD CONSTRAINT "inventory_count_sessions_scope_location_id_fkey" FOREIGN KEY ("scope_location_id") REFERENCES "public"."inventory_locations"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."inventory_count_sessions"
    ADD CONSTRAINT "inventory_count_sessions_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."inventory_entries"
    ADD CONSTRAINT "inventory_entries_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."employees"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."inventory_entries"
    ADD CONSTRAINT "inventory_entries_purchase_order_id_fkey" FOREIGN KEY ("purchase_order_id") REFERENCES "public"."purchase_orders"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."inventory_entries"
    ADD CONSTRAINT "inventory_entries_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."inventory_entries"
    ADD CONSTRAINT "inventory_entries_supplier_id_fkey" FOREIGN KEY ("supplier_id") REFERENCES "public"."suppliers"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."inventory_entry_items"
    ADD CONSTRAINT "inventory_entry_items_entry_id_fkey" FOREIGN KEY ("entry_id") REFERENCES "public"."inventory_entries"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."inventory_entry_items"
    ADD CONSTRAINT "inventory_entry_items_input_unit_code_fkey" FOREIGN KEY ("input_unit_code") REFERENCES "public"."inventory_units"("code");



ALTER TABLE ONLY "public"."inventory_entry_items"
    ADD CONSTRAINT "inventory_entry_items_input_uom_profile_id_fkey" FOREIGN KEY ("input_uom_profile_id") REFERENCES "public"."product_uom_profiles"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."inventory_entry_items"
    ADD CONSTRAINT "inventory_entry_items_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "public"."inventory_locations"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."inventory_entry_items"
    ADD CONSTRAINT "inventory_entry_items_location_position_id_fkey" FOREIGN KEY ("location_position_id") REFERENCES "public"."inventory_location_positions"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."inventory_entry_items"
    ADD CONSTRAINT "inventory_entry_items_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id");



ALTER TABLE ONLY "public"."inventory_entry_items"
    ADD CONSTRAINT "inventory_entry_items_purchase_order_item_id_fkey" FOREIGN KEY ("purchase_order_item_id") REFERENCES "public"."purchase_order_items"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."inventory_entry_items"
    ADD CONSTRAINT "inventory_entry_items_stock_unit_code_fkey" FOREIGN KEY ("stock_unit_code") REFERENCES "public"."inventory_units"("code");



ALTER TABLE ONLY "public"."inventory_form_drafts"
    ADD CONSTRAINT "inventory_form_drafts_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."inventory_form_drafts"
    ADD CONSTRAINT "inventory_form_drafts_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."inventory_location_positions"
    ADD CONSTRAINT "inventory_location_positions_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "public"."inventory_locations"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."inventory_location_positions"
    ADD CONSTRAINT "inventory_location_positions_parent_position_id_fkey" FOREIGN KEY ("parent_position_id") REFERENCES "public"."inventory_location_positions"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."inventory_location_positions"
    ADD CONSTRAINT "inventory_location_positions_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."inventory_locations"
    ADD CONSTRAINT "inventory_locations_area_id_fkey" FOREIGN KEY ("area_id") REFERENCES "public"."areas"("id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."inventory_locations"
    ADD CONSTRAINT "inventory_locations_parent_fkey" FOREIGN KEY ("parent_location_id") REFERENCES "public"."inventory_locations"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."inventory_locations"
    ADD CONSTRAINT "inventory_locations_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."inventory_lpn_items"
    ADD CONSTRAINT "inventory_lpn_items_lpn_id_fkey" FOREIGN KEY ("lpn_id") REFERENCES "public"."inventory_lpns"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."inventory_lpn_items"
    ADD CONSTRAINT "inventory_lpn_items_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."inventory_lpns"
    ADD CONSTRAINT "inventory_lpns_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."employees"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."inventory_lpns"
    ADD CONSTRAINT "inventory_lpns_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "public"."inventory_locations"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."inventory_lpns"
    ADD CONSTRAINT "inventory_lpns_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."inventory_movements"
    ADD CONSTRAINT "inventory_movements_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."employees"("id");



ALTER TABLE ONLY "public"."inventory_movements"
    ADD CONSTRAINT "inventory_movements_input_unit_code_fkey" FOREIGN KEY ("input_unit_code") REFERENCES "public"."inventory_units"("code");



ALTER TABLE ONLY "public"."inventory_movements"
    ADD CONSTRAINT "inventory_movements_input_uom_profile_id_fkey" FOREIGN KEY ("input_uom_profile_id") REFERENCES "public"."product_uom_profiles"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."inventory_movements"
    ADD CONSTRAINT "inventory_movements_location_position_id_fkey" FOREIGN KEY ("location_position_id") REFERENCES "public"."inventory_location_positions"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."inventory_movements"
    ADD CONSTRAINT "inventory_movements_movement_type_fkey" FOREIGN KEY ("movement_type") REFERENCES "public"."inventory_movement_types"("code");



ALTER TABLE ONLY "public"."inventory_movements"
    ADD CONSTRAINT "inventory_movements_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id");



ALTER TABLE ONLY "public"."inventory_movements"
    ADD CONSTRAINT "inventory_movements_production_batch_id_fkey" FOREIGN KEY ("related_production_batch_id") REFERENCES "public"."production_batches"("id");



ALTER TABLE ONLY "public"."inventory_movements"
    ADD CONSTRAINT "inventory_movements_related_order_id_fkey" FOREIGN KEY ("related_order_id") REFERENCES "public"."orders"("id");



ALTER TABLE ONLY "public"."inventory_movements"
    ADD CONSTRAINT "inventory_movements_related_production_request_id_fkey" FOREIGN KEY ("related_production_request_id") REFERENCES "public"."production_requests"("id");



ALTER TABLE ONLY "public"."inventory_movements"
    ADD CONSTRAINT "inventory_movements_related_purchase_order_id_fkey" FOREIGN KEY ("related_purchase_order_id") REFERENCES "public"."purchase_orders"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."inventory_movements"
    ADD CONSTRAINT "inventory_movements_related_restock_request_id_fkey" FOREIGN KEY ("related_restock_request_id") REFERENCES "public"."restock_requests"("id");



ALTER TABLE ONLY "public"."inventory_movements"
    ADD CONSTRAINT "inventory_movements_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id");



ALTER TABLE ONLY "public"."inventory_movements"
    ADD CONSTRAINT "inventory_movements_stock_unit_code_fkey" FOREIGN KEY ("stock_unit_code") REFERENCES "public"."inventory_units"("code");



ALTER TABLE ONLY "public"."inventory_stock_by_location"
    ADD CONSTRAINT "inventory_stock_by_location_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "public"."inventory_locations"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."inventory_stock_by_location"
    ADD CONSTRAINT "inventory_stock_by_location_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."inventory_stock_by_position"
    ADD CONSTRAINT "inventory_stock_by_position_position_id_fkey" FOREIGN KEY ("position_id") REFERENCES "public"."inventory_location_positions"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."inventory_stock_by_position"
    ADD CONSTRAINT "inventory_stock_by_position_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."inventory_stock_by_site"
    ADD CONSTRAINT "inventory_stock_by_site_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id");



ALTER TABLE ONLY "public"."inventory_stock_by_site"
    ADD CONSTRAINT "inventory_stock_by_site_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id");



ALTER TABLE ONLY "public"."inventory_stock_by_uom_profile"
    ADD CONSTRAINT "inventory_stock_by_uom_profile_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "public"."inventory_locations"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."inventory_stock_by_uom_profile"
    ADD CONSTRAINT "inventory_stock_by_uom_profile_location_position_id_fkey" FOREIGN KEY ("location_position_id") REFERENCES "public"."inventory_location_positions"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."inventory_stock_by_uom_profile"
    ADD CONSTRAINT "inventory_stock_by_uom_profile_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."inventory_stock_by_uom_profile"
    ADD CONSTRAINT "inventory_stock_by_uom_profile_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."inventory_stock_by_uom_profile"
    ADD CONSTRAINT "inventory_stock_by_uom_profile_uom_profile_id_fkey" FOREIGN KEY ("uom_profile_id") REFERENCES "public"."product_uom_profiles"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."inventory_transfer_items"
    ADD CONSTRAINT "inventory_transfer_items_input_unit_code_fkey" FOREIGN KEY ("input_unit_code") REFERENCES "public"."inventory_units"("code");



ALTER TABLE ONLY "public"."inventory_transfer_items"
    ADD CONSTRAINT "inventory_transfer_items_input_uom_profile_id_fkey" FOREIGN KEY ("input_uom_profile_id") REFERENCES "public"."product_uom_profiles"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."inventory_transfer_items"
    ADD CONSTRAINT "inventory_transfer_items_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id");



ALTER TABLE ONLY "public"."inventory_transfer_items"
    ADD CONSTRAINT "inventory_transfer_items_stock_unit_code_fkey" FOREIGN KEY ("stock_unit_code") REFERENCES "public"."inventory_units"("code");



ALTER TABLE ONLY "public"."inventory_transfer_items"
    ADD CONSTRAINT "inventory_transfer_items_transfer_id_fkey" FOREIGN KEY ("transfer_id") REFERENCES "public"."inventory_transfers"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."inventory_transfers"
    ADD CONSTRAINT "inventory_transfers_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."employees"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."inventory_transfers"
    ADD CONSTRAINT "inventory_transfers_from_loc_id_fkey" FOREIGN KEY ("from_loc_id") REFERENCES "public"."inventory_locations"("id");



ALTER TABLE ONLY "public"."inventory_transfers"
    ADD CONSTRAINT "inventory_transfers_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."inventory_transfers"
    ADD CONSTRAINT "inventory_transfers_to_loc_id_fkey" FOREIGN KEY ("to_loc_id") REFERENCES "public"."inventory_locations"("id");



ALTER TABLE ONLY "public"."inventory_unit_aliases"
    ADD CONSTRAINT "inventory_unit_aliases_unit_code_fkey" FOREIGN KEY ("unit_code") REFERENCES "public"."inventory_units"("code") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."loyalty_external_sales"
    ADD CONSTRAINT "loyalty_external_sales_awarded_by_fkey" FOREIGN KEY ("awarded_by") REFERENCES "public"."employees"("id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."loyalty_external_sales"
    ADD CONSTRAINT "loyalty_external_sales_loyalty_transaction_id_fkey" FOREIGN KEY ("loyalty_transaction_id") REFERENCES "pass"."loyalty_transactions"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."loyalty_external_sales"
    ADD CONSTRAINT "loyalty_external_sales_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."loyalty_external_sales"
    ADD CONSTRAINT "loyalty_external_sales_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."order_conversations"
    ADD CONSTRAINT "order_conversations_client_id_fkey" FOREIGN KEY ("client_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."order_conversations"
    ADD CONSTRAINT "order_conversations_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "public"."orders"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."order_conversations"
    ADD CONSTRAINT "order_conversations_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."order_items"
    ADD CONSTRAINT "order_items_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "public"."orders"("id");



ALTER TABLE ONLY "public"."order_items"
    ADD CONSTRAINT "order_items_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id");



ALTER TABLE ONLY "public"."order_messages"
    ADD CONSTRAINT "order_messages_author_id_fkey" FOREIGN KEY ("author_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."order_messages"
    ADD CONSTRAINT "order_messages_conversation_id_fkey" FOREIGN KEY ("conversation_id") REFERENCES "public"."order_conversations"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."order_messages"
    ADD CONSTRAINT "order_messages_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "public"."orders"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."order_messages"
    ADD CONSTRAINT "order_messages_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."order_status_events"
    ADD CONSTRAINT "order_status_events_changed_by_fkey" FOREIGN KEY ("changed_by") REFERENCES "auth"."users"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."order_status_events"
    ADD CONSTRAINT "order_status_events_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "public"."orders"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."order_status_events"
    ADD CONSTRAINT "order_status_events_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."orders"
    ADD CONSTRAINT "orders_client_id_fkey" FOREIGN KEY ("client_id") REFERENCES "public"."users"("id") ON UPDATE RESTRICT ON DELETE SET NULL;



ALTER TABLE ONLY "public"."orders"
    ADD CONSTRAINT "orders_payment_intent_id_fkey" FOREIGN KEY ("payment_intent_id") REFERENCES "payments"."transactions"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."orders"
    ADD CONSTRAINT "orders_server_id_fkey" FOREIGN KEY ("server_id") REFERENCES "public"."employees"("id");



ALTER TABLE ONLY "public"."orders"
    ADD CONSTRAINT "orders_session_id_fkey" FOREIGN KEY ("session_id") REFERENCES "pos"."pos_sessions"("id");



ALTER TABLE ONLY "public"."orders"
    ADD CONSTRAINT "orders_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id");



ALTER TABLE ONLY "public"."orders"
    ADD CONSTRAINT "orders_voided_by_fkey" FOREIGN KEY ("voided_by") REFERENCES "public"."employees"("id");



ALTER TABLE ONLY "public"."printing_label_templates"
    ADD CONSTRAINT "printing_label_templates_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."procurement_agreed_prices"
    ADD CONSTRAINT "procurement_agreed_prices_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id");



ALTER TABLE ONLY "public"."procurement_agreed_prices"
    ADD CONSTRAINT "procurement_agreed_prices_supplier_id_fkey" FOREIGN KEY ("supplier_id") REFERENCES "public"."suppliers"("id");



ALTER TABLE ONLY "public"."procurement_reception_items"
    ADD CONSTRAINT "procurement_reception_items_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id");



ALTER TABLE ONLY "public"."procurement_reception_items"
    ADD CONSTRAINT "procurement_reception_items_reception_id_fkey" FOREIGN KEY ("reception_id") REFERENCES "public"."procurement_receptions"("id");



ALTER TABLE ONLY "public"."procurement_receptions"
    ADD CONSTRAINT "procurement_receptions_purchase_order_id_fkey" FOREIGN KEY ("purchase_order_id") REFERENCES "public"."purchase_orders"("id");



ALTER TABLE ONLY "public"."procurement_receptions"
    ADD CONSTRAINT "procurement_receptions_received_by_fkey" FOREIGN KEY ("received_by") REFERENCES "auth"."users"("id");



ALTER TABLE ONLY "public"."procurement_receptions"
    ADD CONSTRAINT "procurement_receptions_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id");



ALTER TABLE ONLY "public"."product_asset_maintenance_events"
    ADD CONSTRAINT "product_asset_maintenance_events_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."product_asset_profiles"
    ADD CONSTRAINT "product_asset_profiles_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."product_asset_transfer_events"
    ADD CONSTRAINT "product_asset_transfer_events_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."product_categories"
    ADD CONSTRAINT "product_categories_parent_id_fkey" FOREIGN KEY ("parent_id") REFERENCES "public"."product_categories"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."product_categories"
    ADD CONSTRAINT "product_categories_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."product_cost_events"
    ADD CONSTRAINT "product_cost_events_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "auth"."users"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."product_cost_events"
    ADD CONSTRAINT "product_cost_events_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."product_cost_events"
    ADD CONSTRAINT "product_cost_events_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."product_cost_events"
    ADD CONSTRAINT "product_cost_events_source_adjust_movement_id_fkey" FOREIGN KEY ("source_adjust_movement_id") REFERENCES "public"."inventory_movements"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."product_cost_events"
    ADD CONSTRAINT "product_cost_events_source_entry_id_fkey" FOREIGN KEY ("source_entry_id") REFERENCES "public"."inventory_entries"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."product_images"
    ADD CONSTRAINT "product_images_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "auth"."users"("id");



ALTER TABLE ONLY "public"."product_images"
    ADD CONSTRAINT "product_images_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."product_inventory_profiles"
    ADD CONSTRAINT "product_inventory_profiles_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."product_site_settings"
    ADD CONSTRAINT "product_site_settings_default_area_kind_fkey" FOREIGN KEY ("default_area_kind") REFERENCES "public"."area_kinds"("code");



ALTER TABLE ONLY "public"."product_site_settings"
    ADD CONSTRAINT "product_site_settings_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."product_site_settings"
    ADD CONSTRAINT "product_site_settings_production_location_id_fkey" FOREIGN KEY ("production_location_id") REFERENCES "public"."inventory_locations"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."product_site_settings"
    ADD CONSTRAINT "product_site_settings_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."product_sku_aliases"
    ADD CONSTRAINT "product_sku_aliases_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."product_suppliers"
    ADD CONSTRAINT "product_suppliers_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id");



ALTER TABLE ONLY "public"."product_suppliers"
    ADD CONSTRAINT "product_suppliers_purchase_pack_unit_code_fkey" FOREIGN KEY ("purchase_pack_unit_code") REFERENCES "public"."inventory_units"("code");



ALTER TABLE ONLY "public"."product_suppliers"
    ADD CONSTRAINT "product_suppliers_supplier_id_fkey" FOREIGN KEY ("supplier_id") REFERENCES "public"."suppliers"("id");



ALTER TABLE ONLY "public"."product_uom_profiles"
    ADD CONSTRAINT "product_uom_profiles_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."production_batch_consumptions"
    ADD CONSTRAINT "production_batch_consumptions_batch_id_fkey" FOREIGN KEY ("batch_id") REFERENCES "public"."production_batches"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."production_batch_consumptions"
    ADD CONSTRAINT "production_batch_consumptions_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "auth"."users"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."production_batch_consumptions"
    ADD CONSTRAINT "production_batch_consumptions_ingredient_product_id_fkey" FOREIGN KEY ("ingredient_product_id") REFERENCES "public"."products"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."production_batch_consumptions"
    ADD CONSTRAINT "production_batch_consumptions_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "public"."inventory_locations"("id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."production_batch_consumptions"
    ADD CONSTRAINT "production_batch_consumptions_movement_id_fkey" FOREIGN KEY ("movement_id") REFERENCES "public"."inventory_movements"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."production_batch_consumptions"
    ADD CONSTRAINT "production_batch_consumptions_stock_unit_code_fkey" FOREIGN KEY ("stock_unit_code") REFERENCES "public"."inventory_units"("code");



ALTER TABLE ONLY "public"."production_batches"
    ADD CONSTRAINT "production_batches_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."employees"("id");



ALTER TABLE ONLY "public"."production_batches"
    ADD CONSTRAINT "production_batches_destination_location_id_fkey" FOREIGN KEY ("destination_location_id") REFERENCES "public"."inventory_locations"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."production_batches"
    ADD CONSTRAINT "production_batches_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id");



ALTER TABLE ONLY "public"."production_batches"
    ADD CONSTRAINT "production_batches_recipe_card_id_fkey" FOREIGN KEY ("recipe_card_id") REFERENCES "public"."recipe_cards"("id");



ALTER TABLE ONLY "public"."production_batches"
    ADD CONSTRAINT "production_batches_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id");



ALTER TABLE ONLY "public"."production_request_items"
    ADD CONSTRAINT "production_request_items_area_kind_fkey" FOREIGN KEY ("production_area_kind") REFERENCES "public"."area_kinds"("code");



ALTER TABLE ONLY "public"."production_request_items"
    ADD CONSTRAINT "production_request_items_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id");



ALTER TABLE ONLY "public"."production_request_items"
    ADD CONSTRAINT "production_request_items_recipe_id_fkey" FOREIGN KEY ("recipe_id") REFERENCES "public"."recipes"("id");



ALTER TABLE ONLY "public"."production_request_items"
    ADD CONSTRAINT "production_request_items_request_id_fkey" FOREIGN KEY ("request_id") REFERENCES "public"."production_requests"("id");



ALTER TABLE ONLY "public"."production_requests"
    ADD CONSTRAINT "production_requests_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."users"("id");



ALTER TABLE ONLY "public"."production_requests"
    ADD CONSTRAINT "production_requests_from_site_id_fkey" FOREIGN KEY ("from_site_id") REFERENCES "public"."sites"("id");



ALTER TABLE ONLY "public"."production_requests"
    ADD CONSTRAINT "production_requests_to_site_id_fkey" FOREIGN KEY ("to_site_id") REFERENCES "public"."sites"("id");



ALTER TABLE ONLY "public"."products"
    ADD CONSTRAINT "products_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "public"."product_categories"("id");



ALTER TABLE ONLY "public"."products"
    ADD CONSTRAINT "products_production_area_kind_fkey" FOREIGN KEY ("production_area_kind") REFERENCES "public"."area_kinds"("code");



ALTER TABLE ONLY "public"."products"
    ADD CONSTRAINT "products_stock_unit_code_fkey" FOREIGN KEY ("stock_unit_code") REFERENCES "public"."inventory_units"("code");



ALTER TABLE ONLY "public"."purchase_order_items"
    ADD CONSTRAINT "purchase_order_items_input_uom_profile_id_fkey" FOREIGN KEY ("input_uom_profile_id") REFERENCES "public"."product_uom_profiles"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."purchase_order_items"
    ADD CONSTRAINT "purchase_order_items_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id");



ALTER TABLE ONLY "public"."purchase_order_items"
    ADD CONSTRAINT "purchase_order_items_purchase_order_id_fkey" FOREIGN KEY ("purchase_order_id") REFERENCES "public"."purchase_orders"("id");



ALTER TABLE ONLY "public"."purchase_orders"
    ADD CONSTRAINT "purchase_orders_approved_by_fkey" FOREIGN KEY ("approved_by") REFERENCES "auth"."users"("id");



ALTER TABLE ONLY "public"."purchase_orders"
    ADD CONSTRAINT "purchase_orders_cost_center_id_fkey" FOREIGN KEY ("cost_center_id") REFERENCES "public"."cost_centers"("id");



ALTER TABLE ONLY "public"."purchase_orders"
    ADD CONSTRAINT "purchase_orders_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."employees"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."purchase_orders"
    ADD CONSTRAINT "purchase_orders_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id");



ALTER TABLE ONLY "public"."purchase_orders"
    ADD CONSTRAINT "purchase_orders_supplier_id_fkey" FOREIGN KEY ("supplier_id") REFERENCES "public"."suppliers"("id");



ALTER TABLE ONLY "public"."recipe_cards"
    ADD CONSTRAINT "recipe_cards_area_id_fkey" FOREIGN KEY ("area_id") REFERENCES "public"."areas"("id");



ALTER TABLE ONLY "public"."recipe_cards"
    ADD CONSTRAINT "recipe_cards_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."recipe_cards"
    ADD CONSTRAINT "recipe_cards_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id");



ALTER TABLE ONLY "public"."recipe_steps"
    ADD CONSTRAINT "recipe_steps_recipe_card_id_fkey" FOREIGN KEY ("recipe_card_id") REFERENCES "public"."recipe_cards"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."recipes"
    ADD CONSTRAINT "recipes_ingredient_product_id_fkey" FOREIGN KEY ("ingredient_product_id") REFERENCES "public"."products"("id");



ALTER TABLE ONLY "public"."recipes"
    ADD CONSTRAINT "recipes_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id");



ALTER TABLE ONLY "public"."required_document_rules"
    ADD CONSTRAINT "required_document_rules_document_type_id_fkey" FOREIGN KEY ("document_type_id") REFERENCES "public"."document_types"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."required_document_rules"
    ADD CONSTRAINT "required_document_rules_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."restock_request_item_picks"
    ADD CONSTRAINT "restock_request_item_picks_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "public"."restock_request_items"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."restock_request_item_picks"
    ADD CONSTRAINT "restock_request_item_picks_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."restock_request_item_picks"
    ADD CONSTRAINT "restock_request_item_picks_request_id_fkey" FOREIGN KEY ("request_id") REFERENCES "public"."restock_requests"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."restock_request_item_picks"
    ADD CONSTRAINT "restock_request_item_picks_source_location_id_fkey" FOREIGN KEY ("source_location_id") REFERENCES "public"."inventory_locations"("id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."restock_request_item_picks"
    ADD CONSTRAINT "restock_request_item_picks_source_location_position_id_fkey" FOREIGN KEY ("source_location_position_id") REFERENCES "public"."inventory_location_positions"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."restock_request_item_picks"
    ADD CONSTRAINT "restock_request_item_picks_uom_profile_id_fkey" FOREIGN KEY ("uom_profile_id") REFERENCES "public"."product_uom_profiles"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."restock_request_items"
    ADD CONSTRAINT "restock_request_items_area_kind_fkey" FOREIGN KEY ("production_area_kind") REFERENCES "public"."area_kinds"("code");



ALTER TABLE ONLY "public"."restock_request_items"
    ADD CONSTRAINT "restock_request_items_input_unit_code_fkey" FOREIGN KEY ("input_unit_code") REFERENCES "public"."inventory_units"("code");



ALTER TABLE ONLY "public"."restock_request_items"
    ADD CONSTRAINT "restock_request_items_input_uom_profile_id_fkey" FOREIGN KEY ("input_uom_profile_id") REFERENCES "public"."product_uom_profiles"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."restock_request_items"
    ADD CONSTRAINT "restock_request_items_internal_price_list_id_fkey" FOREIGN KEY ("internal_price_list_id") REFERENCES "public"."internal_price_lists"("id");



ALTER TABLE ONLY "public"."restock_request_items"
    ADD CONSTRAINT "restock_request_items_internal_price_list_item_id_fkey" FOREIGN KEY ("internal_price_list_item_id") REFERENCES "public"."internal_price_list_items"("id");



ALTER TABLE ONLY "public"."restock_request_items"
    ADD CONSTRAINT "restock_request_items_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id");



ALTER TABLE ONLY "public"."restock_request_items"
    ADD CONSTRAINT "restock_request_items_request_id_fkey" FOREIGN KEY ("request_id") REFERENCES "public"."restock_requests"("id");



ALTER TABLE ONLY "public"."restock_request_items"
    ADD CONSTRAINT "restock_request_items_source_location_id_fkey" FOREIGN KEY ("source_location_id") REFERENCES "public"."inventory_locations"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."restock_request_items"
    ADD CONSTRAINT "restock_request_items_stock_unit_code_fkey" FOREIGN KEY ("stock_unit_code") REFERENCES "public"."inventory_units"("code");



ALTER TABLE ONLY "public"."restock_requests"
    ADD CONSTRAINT "restock_requests_buyer_cost_center_id_fkey" FOREIGN KEY ("buyer_cost_center_id") REFERENCES "public"."cost_centers"("id");



ALTER TABLE ONLY "public"."restock_requests"
    ADD CONSTRAINT "restock_requests_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."users"("id");



ALTER TABLE ONLY "public"."restock_requests"
    ADD CONSTRAINT "restock_requests_from_site_id_fkey" FOREIGN KEY ("from_site_id") REFERENCES "public"."sites"("id");



ALTER TABLE ONLY "public"."restock_requests"
    ADD CONSTRAINT "restock_requests_in_transit_by_fkey" FOREIGN KEY ("in_transit_by") REFERENCES "public"."employees"("id");



ALTER TABLE ONLY "public"."restock_requests"
    ADD CONSTRAINT "restock_requests_internal_pos_document_id_fkey" FOREIGN KEY ("internal_pos_document_id") REFERENCES "public"."internal_pos_documents"("id");



ALTER TABLE ONLY "public"."restock_requests"
    ADD CONSTRAINT "restock_requests_internal_supplier_site_id_fkey" FOREIGN KEY ("internal_supplier_site_id") REFERENCES "public"."sites"("id");



ALTER TABLE ONLY "public"."restock_requests"
    ADD CONSTRAINT "restock_requests_prepared_by_fkey" FOREIGN KEY ("prepared_by") REFERENCES "public"."employees"("id");



ALTER TABLE ONLY "public"."restock_requests"
    ADD CONSTRAINT "restock_requests_received_by_fkey" FOREIGN KEY ("received_by") REFERENCES "public"."employees"("id");



ALTER TABLE ONLY "public"."restock_requests"
    ADD CONSTRAINT "restock_requests_requested_by_site_id_fkey" FOREIGN KEY ("requested_by_site_id") REFERENCES "public"."sites"("id");



ALTER TABLE ONLY "public"."restock_requests"
    ADD CONSTRAINT "restock_requests_seller_cost_center_id_fkey" FOREIGN KEY ("seller_cost_center_id") REFERENCES "public"."cost_centers"("id");



ALTER TABLE ONLY "public"."restock_requests"
    ADD CONSTRAINT "restock_requests_to_site_id_fkey" FOREIGN KEY ("to_site_id") REFERENCES "public"."sites"("id");



ALTER TABLE ONLY "public"."role_permissions"
    ADD CONSTRAINT "role_permissions_permission_id_fkey" FOREIGN KEY ("permission_id") REFERENCES "public"."app_permissions"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."role_permissions"
    ADD CONSTRAINT "role_permissions_role_fkey" FOREIGN KEY ("role") REFERENCES "public"."roles"("code") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."role_permissions"
    ADD CONSTRAINT "role_permissions_scope_area_kind_fkey" FOREIGN KEY ("scope_area_kind") REFERENCES "public"."area_kinds"("code");



ALTER TABLE ONLY "public"."role_site_type_rules"
    ADD CONSTRAINT "role_site_type_rules_role_fkey" FOREIGN KEY ("role") REFERENCES "public"."roles"("code") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."shift_runtime_events"
    ADD CONSTRAINT "shift_runtime_events_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "public"."employees"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."shift_runtime_events"
    ADD CONSTRAINT "shift_runtime_events_shift_id_fkey" FOREIGN KEY ("shift_id") REFERENCES "public"."employee_shifts"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."shift_runtime_events"
    ADD CONSTRAINT "shift_runtime_events_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."site_area_purpose_rules"
    ADD CONSTRAINT "site_area_purpose_rules_area_kind_fkey" FOREIGN KEY ("area_kind") REFERENCES "public"."area_kinds"("code");



ALTER TABLE ONLY "public"."site_area_purpose_rules"
    ADD CONSTRAINT "site_area_purpose_rules_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."site_attendance_policy"
    ADD CONSTRAINT "site_attendance_policy_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."site_operational_capabilities"
    ADD CONSTRAINT "site_operational_capabilities_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."site_operational_capabilities"
    ADD CONSTRAINT "site_operational_capabilities_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "auth"."users"("id");



ALTER TABLE ONLY "public"."site_production_pick_order"
    ADD CONSTRAINT "site_production_pick_order_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "public"."inventory_locations"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."site_production_pick_order"
    ADD CONSTRAINT "site_production_pick_order_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."site_purpose_settings"
    ADD CONSTRAINT "site_purpose_settings_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."site_purpose_settings"
    ADD CONSTRAINT "site_purpose_settings_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "auth"."users"("id");



ALTER TABLE ONLY "public"."site_supply_routes"
    ADD CONSTRAINT "site_supply_routes_fulfillment_site_id_fkey" FOREIGN KEY ("fulfillment_site_id") REFERENCES "public"."sites"("id");



ALTER TABLE ONLY "public"."site_supply_routes"
    ADD CONSTRAINT "site_supply_routes_requesting_site_id_fkey" FOREIGN KEY ("requesting_site_id") REFERENCES "public"."sites"("id");



ALTER TABLE ONLY "public"."staff_invitations"
    ADD CONSTRAINT "staff_invitations_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."employees"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."staff_invitations"
    ADD CONSTRAINT "staff_invitations_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "public"."employees"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."staff_invitations"
    ADD CONSTRAINT "staff_invitations_invited_by_fkey" FOREIGN KEY ("invited_by") REFERENCES "public"."employees"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."staff_invitations"
    ADD CONSTRAINT "staff_invitations_role_code_fkey" FOREIGN KEY ("role_code") REFERENCES "public"."roles"("code");



ALTER TABLE ONLY "public"."staff_invitations"
    ADD CONSTRAINT "staff_invitations_role_fkey" FOREIGN KEY ("staff_role") REFERENCES "public"."roles"("code");



ALTER TABLE ONLY "public"."staff_invitations"
    ADD CONSTRAINT "staff_invitations_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id");



ALTER TABLE ONLY "public"."staff_invitations"
    ADD CONSTRAINT "staff_invitations_staff_site_id_fkey" FOREIGN KEY ("staff_site_id") REFERENCES "public"."sites"("id");



ALTER TABLE ONLY "public"."staff_manual_calendar_events"
    ADD CONSTRAINT "staff_manual_calendar_events_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."support_messages"
    ADD CONSTRAINT "support_messages_author_id_fkey" FOREIGN KEY ("author_id") REFERENCES "public"."employees"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."support_messages"
    ADD CONSTRAINT "support_messages_ticket_id_fkey" FOREIGN KEY ("ticket_id") REFERENCES "public"."support_tickets"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."support_tickets"
    ADD CONSTRAINT "support_tickets_assigned_to_fkey" FOREIGN KEY ("assigned_to") REFERENCES "public"."employees"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."support_tickets"
    ADD CONSTRAINT "support_tickets_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."employees"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."support_tickets"
    ADD CONSTRAINT "support_tickets_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."support_tickets"
    ADD CONSTRAINT "support_tickets_target_employee_id_fkey" FOREIGN KEY ("target_employee_id") REFERENCES "public"."employees"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."user_feedback"
    ADD CONSTRAINT "user_feedback_reviewed_by_fkey" FOREIGN KEY ("reviewed_by") REFERENCES "public"."employees"("id");



ALTER TABLE ONLY "public"."user_feedback"
    ADD CONSTRAINT "user_feedback_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."sites"("id");



ALTER TABLE ONLY "public"."user_feedback"
    ADD CONSTRAINT "user_feedback_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."wallet_devices"
    ADD CONSTRAINT "wallet_devices_serial_number_fkey" FOREIGN KEY ("serial_number") REFERENCES "public"."wallet_passes"("serial_number") ON DELETE CASCADE;



CREATE POLICY "Anyone can read movement types" ON "public"."inventory_movement_types" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Authenticated users can read app navigation items" ON "public"."app_navigation_items" FOR SELECT TO "authenticated" USING (("is_active" = true));



CREATE POLICY "Employees can view LPN items of their sites" ON "public"."inventory_lpn_items" FOR SELECT USING ((EXISTS ( SELECT 1
   FROM ("public"."inventory_lpns" "lpn"
     JOIN "public"."employee_sites" "es" ON (("lpn"."site_id" = "es"."site_id")))
  WHERE (("lpn"."id" = "inventory_lpn_items"."lpn_id") AND ("es"."employee_id" = "auth"."uid"())))));



CREATE POLICY "Employees can view all feedback" ON "public"."user_feedback" FOR SELECT TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."employees"
  WHERE ("employees"."id" = "auth"."uid"()))));



CREATE POLICY "Owners can update feedback" ON "public"."user_feedback" FOR UPDATE TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."employees"
  WHERE (("employees"."id" = "auth"."uid"()) AND ("employees"."role" = 'propietario'::"text")))));



CREATE POLICY "Service role can manage app navigation items" ON "public"."app_navigation_items" TO "service_role" USING (true) WITH CHECK (true);



CREATE POLICY "Staff can manage LPN items" ON "public"."inventory_lpn_items" USING ((EXISTS ( SELECT 1
   FROM (("public"."inventory_lpns" "lpn"
     JOIN "public"."employees" "e" ON (("e"."id" = "auth"."uid"())))
     JOIN "public"."employee_sites" "es" ON ((("e"."id" = "es"."employee_id") AND ("lpn"."site_id" = "es"."site_id"))))
  WHERE ("lpn"."id" = "inventory_lpn_items"."lpn_id"))));



CREATE POLICY "Users can insert their own feedback" ON "public"."user_feedback" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() = "user_id"));



CREATE POLICY "Users can view their own feedback" ON "public"."user_feedback" FOR SELECT TO "authenticated" USING (("auth"."uid"() = "user_id"));



ALTER TABLE "public"."account_deletion_requests" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "account_deletion_requests_select_own" ON "public"."account_deletion_requests" FOR SELECT TO "authenticated" USING (("user_id" = "auth"."uid"()));



CREATE POLICY "account_deletion_requests_service_role" ON "public"."account_deletion_requests" TO "service_role" USING (true) WITH CHECK (true);



ALTER TABLE "public"."announcements" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "announcements_select_authenticated" ON "public"."announcements" FOR SELECT TO "authenticated" USING (("is_active" = true));



CREATE POLICY "announcements_write_management" ON "public"."announcements" TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."employees" "e"
  WHERE (("e"."id" = "auth"."uid"()) AND ("e"."is_active" = true) AND ("e"."role" = ANY (ARRAY['propietario'::"text", 'gerente_general'::"text", 'gerente'::"text"])))))) WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."employees" "e"
  WHERE (("e"."id" = "auth"."uid"()) AND ("e"."is_active" = true) AND ("e"."role" = ANY (ARRAY['propietario'::"text", 'gerente_general'::"text", 'gerente'::"text"]))))));



ALTER TABLE "public"."app_config" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "app_config_select_anon" ON "public"."app_config" FOR SELECT TO "anon" USING (true);



CREATE POLICY "app_config_select_authenticated" ON "public"."app_config" FOR SELECT TO "authenticated" USING (true);



ALTER TABLE "public"."app_content_blocks" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "app_content_blocks_select_public" ON "public"."app_content_blocks" FOR SELECT USING ("is_enabled");



CREATE POLICY "app_content_blocks_write_admin" ON "public"."app_content_blocks" USING (("public"."is_owner"() OR "public"."is_global_manager"() OR ("auth"."role"() = 'service_role'::"text"))) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"() OR ("auth"."role"() = 'service_role'::"text")));



ALTER TABLE "public"."app_navigation_items" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."app_operation_policies" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "app_operation_policies_select_authenticated" ON "public"."app_operation_policies" FOR SELECT TO "authenticated" USING (true);



ALTER TABLE "public"."app_permissions" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "app_permissions_manage_owner" ON "public"."app_permissions" TO "authenticated" USING (("public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"()));



CREATE POLICY "app_permissions_select_all" ON "public"."app_permissions" FOR SELECT TO "authenticated" USING (true);



ALTER TABLE "public"."app_runtime_settings" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "app_runtime_settings_read_authenticated" ON "public"."app_runtime_settings" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "app_runtime_settings_write_admins" ON "public"."app_runtime_settings" TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."employees" "e"
  WHERE (("e"."id" = "auth"."uid"()) AND ("lower"("e"."role") = ANY (ARRAY['propietario'::"text", 'gerente_general'::"text"])))))) WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."employees" "e"
  WHERE (("e"."id" = "auth"."uid"()) AND ("lower"("e"."role") = ANY (ARRAY['propietario'::"text", 'gerente_general'::"text"]))))));



ALTER TABLE "public"."app_update_policies" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "app_update_policies_select_public" ON "public"."app_update_policies" FOR SELECT TO "authenticated", "anon" USING (("is_enabled" = true));



ALTER TABLE "public"."apps" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "apps_manage_owner" ON "public"."apps" TO "authenticated" USING (("public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"()));



CREATE POLICY "apps_select_all" ON "public"."apps" FOR SELECT TO "authenticated" USING (true);



ALTER TABLE "public"."area_kinds" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "area_kinds_manage_owner" ON "public"."area_kinds" TO "authenticated" USING (("public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"()));



CREATE POLICY "area_kinds_select_all" ON "public"."area_kinds" FOR SELECT TO "authenticated" USING (true);



ALTER TABLE "public"."areas" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "areas_select_staff" ON "public"."areas" FOR SELECT USING (("public"."can_access_area"("id") OR (("public"."current_employee_role"() = ANY (ARRAY['gerente'::"text", 'bodeguero'::"text"])) AND "public"."can_access_site"("site_id"))));



CREATE POLICY "areas_write_owner" ON "public"."areas" USING (("public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"()));



ALTER TABLE "public"."attendance_breaks" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "attendance_breaks_select_manager_scoped" ON "public"."attendance_breaks" FOR SELECT TO "authenticated" USING (("public"."is_owner"() OR "public"."is_global_manager"() OR (("public"."current_employee_role"() = 'gerente'::"text") AND "public"."can_access_site"("site_id"))));



CREATE POLICY "attendance_breaks_select_self" ON "public"."attendance_breaks" FOR SELECT TO "authenticated" USING (("employee_id" = "auth"."uid"()));



ALTER TABLE "public"."attendance_logs" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "attendance_logs_insert_self_accessible_site" ON "public"."attendance_logs" FOR INSERT TO "authenticated" WITH CHECK ((("employee_id" = "auth"."uid"()) AND ("source" = ANY (ARRAY['mobile'::"text", 'web'::"text", 'kiosk'::"text"])) AND "public"."can_access_site"("site_id")));



CREATE POLICY "attendance_logs_select_manager_scoped" ON "public"."attendance_logs" FOR SELECT TO "authenticated" USING (("public"."is_owner"() OR "public"."is_global_manager"() OR (("public"."current_employee_role"() = 'gerente'::"text") AND "public"."can_access_site"("site_id"))));



CREATE POLICY "attendance_logs_select_self" ON "public"."attendance_logs" FOR SELECT TO "authenticated" USING (("employee_id" = "auth"."uid"()));



CREATE POLICY "attendance_logs_update_notes_scoped" ON "public"."attendance_logs" FOR UPDATE TO "authenticated" USING ((("employee_id" = "auth"."uid"()) OR "public"."is_owner"() OR "public"."is_global_manager"() OR (("public"."current_employee_role"() = 'gerente'::"text") AND "public"."can_access_site"("site_id")))) WITH CHECK ((("employee_id" = "auth"."uid"()) OR "public"."is_owner"() OR "public"."is_global_manager"() OR (("public"."current_employee_role"() = 'gerente'::"text") AND "public"."can_access_site"("site_id"))));



ALTER TABLE "public"."attendance_policy" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "attendance_policy_select_authenticated" ON "public"."attendance_policy" FOR SELECT TO "authenticated" USING (true);



ALTER TABLE "public"."attendance_shift_events" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "attendance_shift_events_select_manager" ON "public"."attendance_shift_events" FOR SELECT TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."employees" "e"
  WHERE (("e"."id" = "auth"."uid"()) AND ("e"."role" = ANY (ARRAY['propietario'::"text", 'gerente'::"text", 'gerente_general'::"text"])) AND (("e"."role" = ANY (ARRAY['propietario'::"text", 'gerente_general'::"text"])) OR ("e"."site_id" = "attendance_shift_events"."site_id"))))));



CREATE POLICY "attendance_shift_events_select_self" ON "public"."attendance_shift_events" FOR SELECT TO "authenticated" USING (("employee_id" = "auth"."uid"()));



ALTER TABLE "public"."attendance_sync_conflicts" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "attendance_sync_conflicts_insert_self" ON "public"."attendance_sync_conflicts" FOR INSERT TO "authenticated" WITH CHECK (("employee_id" = "auth"."uid"()));



CREATE POLICY "attendance_sync_conflicts_select_self" ON "public"."attendance_sync_conflicts" FOR SELECT TO "authenticated" USING (("employee_id" = "auth"."uid"()));



ALTER TABLE "public"."cost_centers" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "cost_centers_manage_internal_billing" ON "public"."cost_centers" TO "authenticated" USING (("public"."has_permission"('nexo.cost_centers.manage'::"text") OR "public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."has_permission"('nexo.cost_centers.manage'::"text") OR "public"."is_owner"() OR "public"."is_global_manager"()));



ALTER TABLE "public"."document_types" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "document_types_select" ON "public"."document_types" FOR SELECT USING (("auth"."role"() = 'authenticated'::"text"));



CREATE POLICY "document_types_write_admin" ON "public"."document_types" USING (("public"."is_owner"() OR "public"."is_global_manager"() OR ("public"."current_employee_role"() = 'gerente'::"text"))) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"() OR ("public"."current_employee_role"() = 'gerente'::"text")));



ALTER TABLE "public"."documents" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "documents_delete_permission" ON "public"."documents" FOR DELETE TO "authenticated" USING (("public"."has_permission"('viso.staff.documents.manage'::"text") OR "public"."has_permission"('anima.documents.delete'::"text", "site_id") OR (EXISTS ( SELECT 1
   FROM "public"."employee_sites" "target_site"
  WHERE (("target_site"."employee_id" = "documents"."target_employee_id") AND ("target_site"."is_active" = true) AND "public"."has_permission"('anima.documents.delete'::"text", "target_site"."site_id"))))));



CREATE POLICY "documents_insert_permission" ON "public"."documents" FOR INSERT TO "authenticated" WITH CHECK (("public"."has_permission"('viso.staff.documents.manage'::"text") OR "public"."has_permission"('anima.documents.upload'::"text", "site_id") OR (EXISTS ( SELECT 1
   FROM "public"."employee_sites" "target_site"
  WHERE (("target_site"."employee_id" = "documents"."target_employee_id") AND ("target_site"."is_active" = true) AND "public"."has_permission"('anima.documents.upload'::"text", "target_site"."site_id"))))));



CREATE POLICY "documents_select_self_or_permission" ON "public"."documents" FOR SELECT TO "authenticated" USING ((("owner_employee_id" = "auth"."uid"()) OR ("target_employee_id" = "auth"."uid"()) OR (("site_id" IS NOT NULL) AND (EXISTS ( SELECT 1
   FROM "public"."employee_sites" "es"
  WHERE (("es"."employee_id" = "auth"."uid"()) AND ("es"."site_id" = "documents"."site_id") AND ("es"."is_active" = true))))) OR "public"."has_permission"('anima.documents.view_all'::"text") OR "public"."has_permission"('viso.staff.documents.manage'::"text") OR (EXISTS ( SELECT 1
   FROM "public"."employee_sites" "target_site"
  WHERE (("target_site"."employee_id" = "documents"."target_employee_id") AND ("target_site"."is_active" = true) AND "public"."has_permission"('anima.documents.upload'::"text", "target_site"."site_id"))))));



CREATE POLICY "documents_update_permission" ON "public"."documents" FOR UPDATE TO "authenticated" USING (("public"."has_permission"('viso.staff.documents.manage'::"text") OR "public"."has_permission"('anima.documents.upload'::"text", "site_id") OR (EXISTS ( SELECT 1
   FROM "public"."employee_sites" "target_site"
  WHERE (("target_site"."employee_id" = "documents"."target_employee_id") AND ("target_site"."is_active" = true) AND "public"."has_permission"('anima.documents.upload'::"text", "target_site"."site_id")))))) WITH CHECK (("public"."has_permission"('viso.staff.documents.manage'::"text") OR "public"."has_permission"('anima.documents.upload'::"text", "site_id") OR (EXISTS ( SELECT 1
   FROM "public"."employee_sites" "target_site"
  WHERE (("target_site"."employee_id" = "documents"."target_employee_id") AND ("target_site"."is_active" = true) AND "public"."has_permission"('anima.documents.upload'::"text", "target_site"."site_id"))))));



ALTER TABLE "public"."employee_area_purpose_assignments" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "employee_area_purpose_assignments_select_authenticated" ON "public"."employee_area_purpose_assignments" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "employee_area_purpose_assignments_write_admin" ON "public"."employee_area_purpose_assignments" TO "authenticated" USING (("public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"()));



ALTER TABLE "public"."employee_areas" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "employee_areas_select_owner" ON "public"."employee_areas" FOR SELECT USING (("public"."is_owner"() OR "public"."is_global_manager"()));



CREATE POLICY "employee_areas_select_self" ON "public"."employee_areas" FOR SELECT USING (("employee_id" = "auth"."uid"()));



CREATE POLICY "employee_areas_write_owner" ON "public"."employee_areas" USING (("public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"()));



ALTER TABLE "public"."employee_devices" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "employee_devices_insert" ON "public"."employee_devices" FOR INSERT WITH CHECK (("employee_id" = "auth"."uid"()));



CREATE POLICY "employee_devices_select" ON "public"."employee_devices" FOR SELECT USING (("employee_id" = "auth"."uid"()));



CREATE POLICY "employee_devices_update" ON "public"."employee_devices" FOR UPDATE USING (("employee_id" = "auth"."uid"())) WITH CHECK (("employee_id" = "auth"."uid"()));



ALTER TABLE "public"."employee_inventory_location_assignments" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "employee_inventory_location_assignments_manage_staff" ON "public"."employee_inventory_location_assignments" USING ((("public"."is_employee"() AND "public"."can_access_site"("site_id")) OR "public"."has_permission"('nexo.inventory.transfers'::"text", "site_id"))) WITH CHECK ((("public"."is_employee"() AND "public"."can_access_site"("site_id")) OR "public"."has_permission"('nexo.inventory.transfers'::"text", "site_id")));



CREATE POLICY "employee_inventory_location_assignments_select_staff" ON "public"."employee_inventory_location_assignments" FOR SELECT USING ((("public"."is_employee"() AND "public"."can_access_site"("site_id")) OR "public"."has_permission"('nexo.inventory.transfers'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.withdraw'::"text", "site_id")));



ALTER TABLE "public"."employee_permissions" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "employee_permissions_manage_owner" ON "public"."employee_permissions" TO "authenticated" USING (("public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"()));



CREATE POLICY "employee_permissions_select_owner" ON "public"."employee_permissions" FOR SELECT TO "authenticated" USING (("public"."is_owner"() OR "public"."is_global_manager"()));



CREATE POLICY "employee_permissions_select_self" ON "public"."employee_permissions" FOR SELECT TO "authenticated" USING (("employee_id" = "auth"."uid"()));



ALTER TABLE "public"."employee_push_tokens" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "employee_push_tokens_delete_self" ON "public"."employee_push_tokens" FOR DELETE USING (("employee_id" = "auth"."uid"()));



CREATE POLICY "employee_push_tokens_insert_self" ON "public"."employee_push_tokens" FOR INSERT WITH CHECK (("employee_id" = "auth"."uid"()));



CREATE POLICY "employee_push_tokens_own_upsert" ON "public"."employee_push_tokens" TO "authenticated" USING (("employee_id" = "auth"."uid"())) WITH CHECK (("employee_id" = "auth"."uid"()));



CREATE POLICY "employee_push_tokens_select_self" ON "public"."employee_push_tokens" FOR SELECT USING (("employee_id" = "auth"."uid"()));



CREATE POLICY "employee_push_tokens_update_self" ON "public"."employee_push_tokens" FOR UPDATE USING (("employee_id" = "auth"."uid"())) WITH CHECK (("employee_id" = "auth"."uid"()));



ALTER TABLE "public"."employee_settings" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "employee_settings_insert_self" ON "public"."employee_settings" FOR INSERT WITH CHECK ((("employee_id" = "auth"."uid"()) AND (("selected_site_id" IS NULL) OR "public"."can_access_site"("selected_site_id")) AND (("selected_area_id" IS NULL) OR "public"."can_access_area"("selected_area_id"))));



CREATE POLICY "employee_settings_select_owner" ON "public"."employee_settings" FOR SELECT USING (("public"."is_owner"() OR "public"."is_global_manager"()));



CREATE POLICY "employee_settings_select_self" ON "public"."employee_settings" FOR SELECT USING (("employee_id" = "auth"."uid"()));



CREATE POLICY "employee_settings_update_self" ON "public"."employee_settings" FOR UPDATE USING (("employee_id" = "auth"."uid"())) WITH CHECK ((("employee_id" = "auth"."uid"()) AND (("selected_site_id" IS NULL) OR "public"."can_access_site"("selected_site_id")) AND (("selected_area_id" IS NULL) OR "public"."can_access_area"("selected_area_id"))));



ALTER TABLE "public"."employee_shifts" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "employee_shifts_select_manager" ON "public"."employee_shifts" FOR SELECT USING ((EXISTS ( SELECT 1
   FROM "public"."employees" "e"
  WHERE (("e"."id" = "auth"."uid"()) AND ("e"."role" = ANY (ARRAY['gerente'::"text"])) AND ("e"."site_id" = "employee_shifts"."site_id")))));



CREATE POLICY "employee_shifts_select_owner" ON "public"."employee_shifts" FOR SELECT USING (("public"."is_owner"() OR "public"."is_global_manager"()));



CREATE POLICY "employee_shifts_select_self" ON "public"."employee_shifts" FOR SELECT USING (("employee_id" = "auth"."uid"()));



CREATE POLICY "employee_shifts_write_manager" ON "public"."employee_shifts" USING ((EXISTS ( SELECT 1
   FROM "public"."employees" "e"
  WHERE (("e"."id" = "auth"."uid"()) AND ("e"."role" = ANY (ARRAY['gerente'::"text"])) AND ("e"."site_id" = "employee_shifts"."site_id"))))) WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."employees" "e"
  WHERE (("e"."id" = "auth"."uid"()) AND ("e"."role" = ANY (ARRAY['gerente'::"text"])) AND ("e"."site_id" = "employee_shifts"."site_id")))));



CREATE POLICY "employee_shifts_write_owner" ON "public"."employee_shifts" USING (("public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"()));



ALTER TABLE "public"."employee_sites" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "employee_sites_read_management" ON "public"."employee_sites" FOR SELECT TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."employees" "me"
  WHERE (("me"."id" = "auth"."uid"()) AND ("me"."is_active" IS TRUE) AND ("me"."role" = ANY (ARRAY['propietario'::"text", 'gerente'::"text", 'gerente_general'::"text"]))))));



CREATE POLICY "employee_sites_read_self" ON "public"."employee_sites" FOR SELECT TO "authenticated" USING (("employee_id" = "auth"."uid"()));



CREATE POLICY "employee_sites_select" ON "public"."employee_sites" FOR SELECT USING ((("auth"."role"() = 'authenticated'::"text") AND ("public"."is_owner"() OR "public"."is_global_manager"() OR (("public"."current_employee_role"() = 'gerente'::"text") AND ("employee_id" IN ( SELECT "e"."id"
   FROM "public"."employees" "e"
  WHERE ("e"."site_id" = ( SELECT "me"."site_id"
           FROM "public"."employees" "me"
          WHERE ("me"."id" = "auth"."uid"())))))) OR ("employee_id" = "auth"."uid"()))));



CREATE POLICY "employee_sites_select_owner" ON "public"."employee_sites" FOR SELECT USING (("public"."is_owner"() OR "public"."is_global_manager"()));



CREATE POLICY "employee_sites_select_self" ON "public"."employee_sites" FOR SELECT USING (("employee_id" = "auth"."uid"()));



CREATE POLICY "employee_sites_write_admin" ON "public"."employee_sites" USING (("public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"()));



CREATE POLICY "employee_sites_write_owner" ON "public"."employee_sites" USING (("public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"()));



ALTER TABLE "public"."employee_wallet_cards" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "employee_wallet_cards_insert_scoped" ON "public"."employee_wallet_cards" FOR INSERT TO "authenticated" WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"() OR (EXISTS ( SELECT 1
   FROM ("public"."employee_sites" "manager_site"
     JOIN "public"."employee_sites" "target_site" ON ((("target_site"."site_id" = "manager_site"."site_id") AND ("target_site"."employee_id" = "employee_wallet_cards"."employee_id") AND ("target_site"."is_active" = true))))
  WHERE (("manager_site"."employee_id" = "auth"."uid"()) AND ("manager_site"."is_active" = true) AND ("public"."current_employee_role"() = 'gerente'::"text"))))));



CREATE POLICY "employee_wallet_cards_select_scoped" ON "public"."employee_wallet_cards" FOR SELECT TO "authenticated" USING ((("employee_id" = "auth"."uid"()) OR "public"."is_owner"() OR "public"."is_global_manager"() OR (EXISTS ( SELECT 1
   FROM ("public"."employee_sites" "manager_site"
     JOIN "public"."employee_sites" "target_site" ON ((("target_site"."site_id" = "manager_site"."site_id") AND ("target_site"."employee_id" = "employee_wallet_cards"."employee_id") AND ("target_site"."is_active" = true))))
  WHERE (("manager_site"."employee_id" = "auth"."uid"()) AND ("manager_site"."is_active" = true) AND ("public"."current_employee_role"() = 'gerente'::"text"))))));



CREATE POLICY "employee_wallet_cards_update_scoped" ON "public"."employee_wallet_cards" FOR UPDATE TO "authenticated" USING (("public"."is_owner"() OR "public"."is_global_manager"() OR (EXISTS ( SELECT 1
   FROM ("public"."employee_sites" "manager_site"
     JOIN "public"."employee_sites" "target_site" ON ((("target_site"."site_id" = "manager_site"."site_id") AND ("target_site"."employee_id" = "employee_wallet_cards"."employee_id") AND ("target_site"."is_active" = true))))
  WHERE (("manager_site"."employee_id" = "auth"."uid"()) AND ("manager_site"."is_active" = true) AND ("public"."current_employee_role"() = 'gerente'::"text")))))) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"() OR (EXISTS ( SELECT 1
   FROM ("public"."employee_sites" "manager_site"
     JOIN "public"."employee_sites" "target_site" ON ((("target_site"."site_id" = "manager_site"."site_id") AND ("target_site"."employee_id" = "employee_wallet_cards"."employee_id") AND ("target_site"."is_active" = true))))
  WHERE (("manager_site"."employee_id" = "auth"."uid"()) AND ("manager_site"."is_active" = true) AND ("public"."current_employee_role"() = 'gerente'::"text"))))));



ALTER TABLE "public"."employees" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "employees_crud_purchase_orders" ON "public"."purchase_orders" TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."employees"
  WHERE ("employees"."id" = "auth"."uid"()))));



CREATE POLICY "employees_insert_owner_global_manager" ON "public"."employees" FOR INSERT TO "authenticated" WITH CHECK (("public"."is_owner"() OR ("public"."is_global_manager"() AND ("role" <> ALL (ARRAY['propietario'::"text", 'gerente_general'::"text"])))));



CREATE POLICY "employees_read_agreed_prices" ON "public"."procurement_agreed_prices" FOR SELECT TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."employees"
  WHERE ("employees"."id" = "auth"."uid"()))));



CREATE POLICY "employees_read_cost_centers" ON "public"."cost_centers" FOR SELECT TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."employees"
  WHERE ("employees"."id" = "auth"."uid"()))));



CREATE POLICY "employees_read_suppliers" ON "public"."suppliers" FOR SELECT TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."employees"
  WHERE ("employees"."id" = "auth"."uid"()))));



CREATE POLICY "employees_select" ON "public"."employees" FOR SELECT USING ((("auth"."role"() = 'authenticated'::"text") AND ("public"."is_owner"() OR "public"."is_global_manager"() OR (("public"."current_employee_role"() = 'gerente'::"text") AND ("site_id" = "public"."current_employee_site_id"())) OR ("id" = "auth"."uid"()))));



CREATE POLICY "employees_select_area" ON "public"."employees" FOR SELECT USING ((("area_id" IS NOT NULL) AND "public"."can_access_area"("area_id") AND ("public"."is_owner"() OR "public"."is_global_manager"() OR ("public"."current_employee_role"() <> 'gerente'::"text") OR ("site_id" = "public"."current_employee_site_id"()))));



CREATE POLICY "employees_select_manager" ON "public"."employees" FOR SELECT TO "authenticated" USING (("public"."is_owner"() OR "public"."is_global_manager"() OR (("public"."is_manager_or_owner"() OR ("public"."current_employee_role"() = ANY (ARRAY['logistics'::"text"]))) AND "public"."can_access_site"("site_id"))));



CREATE POLICY "employees_select_self" ON "public"."employees" FOR SELECT USING (("auth"."uid"() = "id"));



CREATE POLICY "employees_update_management" ON "public"."employees" FOR UPDATE TO "authenticated" USING (("public"."is_owner"() OR "public"."is_global_manager"() OR (("public"."current_employee_role"() = 'gerente'::"text") AND ("site_id" = "public"."current_employee_site_id"())))) WITH CHECK (("public"."is_owner"() OR ("public"."is_global_manager"() AND ("role" <> ALL (ARRAY['propietario'::"text", 'gerente_general'::"text"]))) OR (("public"."current_employee_role"() = 'gerente'::"text") AND ("role" <> ALL (ARRAY['propietario'::"text", 'gerente_general'::"text", 'gerente'::"text"])) AND ("site_id" = "public"."current_employee_site_id"()))));



ALTER TABLE "public"."internal_job_secrets" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."internal_pos_document_lines" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "internal_pos_document_lines_select_permission" ON "public"."internal_pos_document_lines" FOR SELECT TO "authenticated" USING (("public"."has_permission"('nexo.internal_invoices.view'::"text") OR "public"."has_permission"('nexo.internal_invoices.view_amounts'::"text") OR "public"."has_permission"('nexo.internal_invoices.generate'::"text") OR "public"."has_permission"('nexo.internal_invoices.issue'::"text") OR "public"."has_permission"('nexo.internal_invoices.cancel'::"text") OR "public"."is_owner"() OR "public"."is_global_manager"()));



CREATE POLICY "internal_pos_document_lines_service_role" ON "public"."internal_pos_document_lines" TO "service_role" USING (true) WITH CHECK (true);



CREATE POLICY "internal_pos_document_lines_write_permission" ON "public"."internal_pos_document_lines" TO "authenticated" USING (("public"."has_permission"('nexo.internal_invoices.generate'::"text") OR "public"."has_permission"('nexo.internal_invoices.issue'::"text") OR "public"."has_permission"('nexo.internal_invoices.cancel'::"text") OR "public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."has_permission"('nexo.internal_invoices.generate'::"text") OR "public"."has_permission"('nexo.internal_invoices.issue'::"text") OR "public"."has_permission"('nexo.internal_invoices.cancel'::"text") OR "public"."is_owner"() OR "public"."is_global_manager"()));



ALTER TABLE "public"."internal_pos_document_sequences" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "internal_pos_document_sequences_service_role" ON "public"."internal_pos_document_sequences" TO "service_role" USING (true) WITH CHECK (true);



ALTER TABLE "public"."internal_pos_documents" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "internal_pos_documents_select_permission" ON "public"."internal_pos_documents" FOR SELECT TO "authenticated" USING (("public"."has_permission"('nexo.internal_invoices.view'::"text") OR "public"."has_permission"('nexo.internal_invoices.view_amounts'::"text") OR "public"."has_permission"('nexo.internal_invoices.generate'::"text") OR "public"."has_permission"('nexo.internal_invoices.issue'::"text") OR "public"."has_permission"('nexo.internal_invoices.cancel'::"text") OR "public"."is_owner"() OR "public"."is_global_manager"()));



CREATE POLICY "internal_pos_documents_service_role" ON "public"."internal_pos_documents" TO "service_role" USING (true) WITH CHECK (true);



CREATE POLICY "internal_pos_documents_write_permission" ON "public"."internal_pos_documents" TO "authenticated" USING (("public"."has_permission"('nexo.internal_invoices.generate'::"text") OR "public"."has_permission"('nexo.internal_invoices.issue'::"text") OR "public"."has_permission"('nexo.internal_invoices.cancel'::"text") OR "public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."has_permission"('nexo.internal_invoices.generate'::"text") OR "public"."has_permission"('nexo.internal_invoices.issue'::"text") OR "public"."has_permission"('nexo.internal_invoices.cancel'::"text") OR "public"."is_owner"() OR "public"."is_global_manager"()));



ALTER TABLE "public"."internal_price_list_items" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "internal_price_list_items_select_permission" ON "public"."internal_price_list_items" FOR SELECT TO "authenticated" USING (("public"."has_permission"('nexo.internal_prices.view'::"text") OR "public"."has_permission"('nexo.internal_prices.manage'::"text") OR "public"."is_owner"() OR "public"."is_global_manager"()));



CREATE POLICY "internal_price_list_items_write_permission" ON "public"."internal_price_list_items" TO "authenticated" USING (("public"."has_permission"('nexo.internal_prices.manage'::"text") OR "public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."has_permission"('nexo.internal_prices.manage'::"text") OR "public"."is_owner"() OR "public"."is_global_manager"()));



ALTER TABLE "public"."internal_price_lists" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "internal_price_lists_select_permission" ON "public"."internal_price_lists" FOR SELECT TO "authenticated" USING (("public"."has_permission"('nexo.internal_prices.view'::"text") OR "public"."has_permission"('nexo.internal_prices.manage'::"text") OR "public"."is_owner"() OR "public"."is_global_manager"()));



CREATE POLICY "internal_price_lists_write_permission" ON "public"."internal_price_lists" TO "authenticated" USING (("public"."has_permission"('nexo.internal_prices.manage'::"text") OR "public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."has_permission"('nexo.internal_prices.manage'::"text") OR "public"."is_owner"() OR "public"."is_global_manager"()));



ALTER TABLE "public"."internal_transfer_variances" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "internal_transfer_variances_select_permission" ON "public"."internal_transfer_variances" FOR SELECT TO "authenticated" USING (("public"."has_permission"('nexo.internal_variances.view'::"text") OR "public"."has_permission"('nexo.internal_variances.resolve'::"text") OR "public"."has_permission"('nexo.internal_variances.approve'::"text") OR "public"."is_owner"() OR "public"."is_global_manager"()));



CREATE POLICY "internal_transfer_variances_write_permission" ON "public"."internal_transfer_variances" TO "authenticated" USING (("public"."has_permission"('nexo.internal_variances.resolve'::"text") OR "public"."has_permission"('nexo.internal_variances.approve'::"text") OR "public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."has_permission"('nexo.internal_variances.resolve'::"text") OR "public"."has_permission"('nexo.internal_variances.approve'::"text") OR "public"."is_owner"() OR "public"."is_global_manager"()));



ALTER TABLE "public"."inventory_entries" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "inventory_entries_delete_permission" ON "public"."inventory_entries" FOR DELETE TO "authenticated" USING (("public"."has_permission"('nexo.inventory.entries'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.entries_emergency'::"text", "site_id") OR "public"."has_permission"('origo.procurement.receipts'::"text", "site_id")));



CREATE POLICY "inventory_entries_insert_permission" ON "public"."inventory_entries" FOR INSERT TO "authenticated" WITH CHECK (("public"."has_permission"('nexo.inventory.entries'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.entries_emergency'::"text", "site_id") OR "public"."has_permission"('origo.procurement.receipts'::"text", "site_id")));



CREATE POLICY "inventory_entries_select_permission" ON "public"."inventory_entries" FOR SELECT TO "authenticated" USING (("public"."has_permission"('nexo.inventory.entries'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.entries_emergency'::"text", "site_id") OR "public"."has_permission"('origo.procurement.receipts'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.stock'::"text", "site_id")));



CREATE POLICY "inventory_entries_update_permission" ON "public"."inventory_entries" FOR UPDATE TO "authenticated" USING (("public"."has_permission"('nexo.inventory.entries'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.entries_emergency'::"text", "site_id") OR "public"."has_permission"('origo.procurement.receipts'::"text", "site_id"))) WITH CHECK (("public"."has_permission"('nexo.inventory.entries'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.entries_emergency'::"text", "site_id") OR "public"."has_permission"('origo.procurement.receipts'::"text", "site_id")));



ALTER TABLE "public"."inventory_entry_items" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "inventory_entry_items_delete_permission" ON "public"."inventory_entry_items" FOR DELETE TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."inventory_entries" "ie"
  WHERE (("ie"."id" = "inventory_entry_items"."entry_id") AND ("public"."has_permission"('nexo.inventory.entries'::"text", "ie"."site_id") OR "public"."has_permission"('nexo.inventory.entries_emergency'::"text", "ie"."site_id") OR "public"."has_permission"('origo.procurement.receipts'::"text", "ie"."site_id"))))));



CREATE POLICY "inventory_entry_items_insert_permission" ON "public"."inventory_entry_items" FOR INSERT TO "authenticated" WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."inventory_entries" "ie"
  WHERE (("ie"."id" = "inventory_entry_items"."entry_id") AND ("public"."has_permission"('nexo.inventory.entries'::"text", "ie"."site_id") OR "public"."has_permission"('nexo.inventory.entries_emergency'::"text", "ie"."site_id") OR "public"."has_permission"('origo.procurement.receipts'::"text", "ie"."site_id"))))));



CREATE POLICY "inventory_entry_items_select_permission" ON "public"."inventory_entry_items" FOR SELECT TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."inventory_entries" "ie"
  WHERE (("ie"."id" = "inventory_entry_items"."entry_id") AND ("public"."has_permission"('nexo.inventory.entries'::"text", "ie"."site_id") OR "public"."has_permission"('nexo.inventory.entries_emergency'::"text", "ie"."site_id") OR "public"."has_permission"('origo.procurement.receipts'::"text", "ie"."site_id") OR "public"."has_permission"('nexo.inventory.stock'::"text", "ie"."site_id"))))));



CREATE POLICY "inventory_entry_items_update_permission" ON "public"."inventory_entry_items" FOR UPDATE TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."inventory_entries" "ie"
  WHERE (("ie"."id" = "inventory_entry_items"."entry_id") AND ("public"."has_permission"('nexo.inventory.entries'::"text", "ie"."site_id") OR "public"."has_permission"('nexo.inventory.entries_emergency'::"text", "ie"."site_id") OR "public"."has_permission"('origo.procurement.receipts'::"text", "ie"."site_id")))))) WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."inventory_entries" "ie"
  WHERE (("ie"."id" = "inventory_entry_items"."entry_id") AND ("public"."has_permission"('nexo.inventory.entries'::"text", "ie"."site_id") OR "public"."has_permission"('nexo.inventory.entries_emergency'::"text", "ie"."site_id") OR "public"."has_permission"('origo.procurement.receipts'::"text", "ie"."site_id"))))));



ALTER TABLE "public"."inventory_form_drafts" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "inventory_form_drafts_delete_own" ON "public"."inventory_form_drafts" FOR DELETE TO "authenticated" USING (("auth"."uid"() = "user_id"));



CREATE POLICY "inventory_form_drafts_insert_own" ON "public"."inventory_form_drafts" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() = "user_id"));



CREATE POLICY "inventory_form_drafts_select_own" ON "public"."inventory_form_drafts" FOR SELECT TO "authenticated" USING (("auth"."uid"() = "user_id"));



CREATE POLICY "inventory_form_drafts_update_own" ON "public"."inventory_form_drafts" FOR UPDATE TO "authenticated" USING (("auth"."uid"() = "user_id")) WITH CHECK (("auth"."uid"() = "user_id"));



ALTER TABLE "public"."inventory_location_positions" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "inventory_location_positions_select_site" ON "public"."inventory_location_positions" FOR SELECT USING (("public"."is_employee"() AND "public"."can_access_site"("site_id")));



CREATE POLICY "inventory_location_positions_write_manager" ON "public"."inventory_location_positions" USING (("public"."is_owner"() OR "public"."is_global_manager"() OR ("public"."is_manager"() AND "public"."can_access_site"("site_id")))) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"() OR ("public"."is_manager"() AND "public"."can_access_site"("site_id"))));



ALTER TABLE "public"."inventory_locations" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "inventory_locations_delete_permission" ON "public"."inventory_locations" FOR DELETE TO "authenticated" USING ("public"."has_permission"('nexo.inventory.locations'::"text", "site_id"));



CREATE POLICY "inventory_locations_insert_permission" ON "public"."inventory_locations" FOR INSERT TO "authenticated" WITH CHECK ("public"."has_permission"('nexo.inventory.locations'::"text", "site_id"));



CREATE POLICY "inventory_locations_select_permission" ON "public"."inventory_locations" FOR SELECT TO "authenticated" USING (("public"."has_permission"('nexo.inventory.locations'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.withdraw'::"text", "site_id")));



CREATE POLICY "inventory_locations_update_permission" ON "public"."inventory_locations" FOR UPDATE TO "authenticated" USING ("public"."has_permission"('nexo.inventory.locations'::"text", "site_id")) WITH CHECK ("public"."has_permission"('nexo.inventory.locations'::"text", "site_id"));



ALTER TABLE "public"."inventory_lpn_items" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."inventory_lpns" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "inventory_lpns_delete_permission" ON "public"."inventory_lpns" FOR DELETE TO "authenticated" USING ("public"."has_permission"('nexo.inventory.lpns'::"text", "site_id"));



CREATE POLICY "inventory_lpns_insert_permission" ON "public"."inventory_lpns" FOR INSERT TO "authenticated" WITH CHECK ("public"."has_permission"('nexo.inventory.lpns'::"text", "site_id"));



CREATE POLICY "inventory_lpns_select_permission" ON "public"."inventory_lpns" FOR SELECT TO "authenticated" USING ("public"."has_permission"('nexo.inventory.lpns'::"text", "site_id"));



CREATE POLICY "inventory_lpns_update_permission" ON "public"."inventory_lpns" FOR UPDATE TO "authenticated" USING ("public"."has_permission"('nexo.inventory.lpns'::"text", "site_id")) WITH CHECK ("public"."has_permission"('nexo.inventory.lpns'::"text", "site_id"));



ALTER TABLE "public"."inventory_movement_types" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."inventory_movements" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "inventory_movements_insert_permission" ON "public"."inventory_movements" FOR INSERT TO "authenticated" WITH CHECK (("public"."has_permission"('nexo.inventory.movements'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.stock'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.remissions.prepare'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.remissions.receive'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.production_batches'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.entries'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.transfers'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.withdraw'::"text", "site_id")));



CREATE POLICY "inventory_movements_select_permission" ON "public"."inventory_movements" FOR SELECT TO "authenticated" USING ("public"."has_permission"('nexo.inventory.movements'::"text", "site_id"));



ALTER TABLE "public"."inventory_stock_by_location" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "inventory_stock_by_location_delete_permission" ON "public"."inventory_stock_by_location" FOR DELETE TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."inventory_locations" "loc"
  WHERE (("loc"."id" = "inventory_stock_by_location"."location_id") AND "public"."has_permission"('nexo.inventory.stock'::"text", "loc"."site_id")))));



CREATE POLICY "inventory_stock_by_location_insert_permission" ON "public"."inventory_stock_by_location" FOR INSERT TO "authenticated" WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."inventory_locations" "loc"
  WHERE (("loc"."id" = "inventory_stock_by_location"."location_id") AND ("public"."has_permission"('nexo.inventory.stock'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.remissions.prepare'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.remissions.receive'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.entries'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.entries_emergency'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.transfers'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.withdraw'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.counts'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.adjustments'::"text", "loc"."site_id") OR "public"."has_permission"('origo.procurement.receipts'::"text", "loc"."site_id") OR "public"."has_permission"('fogo.production.batches'::"text", "loc"."site_id"))))));



CREATE POLICY "inventory_stock_by_location_select_permission" ON "public"."inventory_stock_by_location" FOR SELECT TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."inventory_locations" "loc"
  WHERE (("loc"."id" = "inventory_stock_by_location"."location_id") AND ("public"."has_permission"('nexo.inventory.stock'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.withdraw'::"text", "loc"."site_id"))))));



CREATE POLICY "inventory_stock_by_location_update_permission" ON "public"."inventory_stock_by_location" FOR UPDATE TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."inventory_locations" "loc"
  WHERE (("loc"."id" = "inventory_stock_by_location"."location_id") AND ("public"."has_permission"('nexo.inventory.stock'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.remissions.prepare'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.remissions.receive'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.entries'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.entries_emergency'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.transfers'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.withdraw'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.counts'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.adjustments'::"text", "loc"."site_id") OR "public"."has_permission"('origo.procurement.receipts'::"text", "loc"."site_id") OR "public"."has_permission"('fogo.production.batches'::"text", "loc"."site_id")))))) WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."inventory_locations" "loc"
  WHERE (("loc"."id" = "inventory_stock_by_location"."location_id") AND ("public"."has_permission"('nexo.inventory.stock'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.remissions.prepare'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.remissions.receive'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.entries'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.entries_emergency'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.transfers'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.withdraw'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.counts'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.adjustments'::"text", "loc"."site_id") OR "public"."has_permission"('origo.procurement.receipts'::"text", "loc"."site_id") OR "public"."has_permission"('fogo.production.batches'::"text", "loc"."site_id"))))));



ALTER TABLE "public"."inventory_stock_by_position" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "inventory_stock_by_position_select_permission" ON "public"."inventory_stock_by_position" FOR SELECT USING ((EXISTS ( SELECT 1
   FROM "public"."inventory_location_positions" "pos"
  WHERE (("pos"."id" = "inventory_stock_by_position"."position_id") AND "public"."can_access_site"("pos"."site_id")))));



CREATE POLICY "inventory_stock_by_position_write_permission" ON "public"."inventory_stock_by_position" USING ((EXISTS ( SELECT 1
   FROM "public"."inventory_location_positions" "pos"
  WHERE (("pos"."id" = "inventory_stock_by_position"."position_id") AND "public"."has_permission"('nexo.inventory.stock'::"text", "pos"."site_id"))))) WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."inventory_location_positions" "pos"
  WHERE (("pos"."id" = "inventory_stock_by_position"."position_id") AND "public"."has_permission"('nexo.inventory.stock'::"text", "pos"."site_id")))));



ALTER TABLE "public"."inventory_stock_by_site" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."inventory_stock_by_uom_profile" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "inventory_stock_by_uom_profile_select_permission" ON "public"."inventory_stock_by_uom_profile" FOR SELECT TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."inventory_locations" "loc"
  WHERE (("loc"."id" = "inventory_stock_by_uom_profile"."location_id") AND "public"."can_access_site"("loc"."site_id")))));



CREATE POLICY "inventory_stock_by_uom_profile_write_permission" ON "public"."inventory_stock_by_uom_profile" TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."inventory_locations" "loc"
  WHERE (("loc"."id" = "inventory_stock_by_uom_profile"."location_id") AND ("public"."has_permission"('nexo.inventory.stock'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.entries'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.transfers'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.withdraw'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.remissions.prepare'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.remissions.receive'::"text", "loc"."site_id")))))) WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."inventory_locations" "loc"
  WHERE (("loc"."id" = "inventory_stock_by_uom_profile"."location_id") AND ("public"."has_permission"('nexo.inventory.stock'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.entries'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.transfers'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.withdraw'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.remissions.prepare'::"text", "loc"."site_id") OR "public"."has_permission"('nexo.inventory.remissions.receive'::"text", "loc"."site_id"))))));



CREATE POLICY "inventory_stock_insert_permission" ON "public"."inventory_stock_by_site" FOR INSERT TO "authenticated" WITH CHECK (("public"."has_permission"('nexo.inventory.stock'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.remissions.prepare'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.remissions.receive'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.entries'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.entries_emergency'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.transfers'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.withdraw'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.counts'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.adjustments'::"text", "site_id") OR "public"."has_permission"('origo.procurement.receipts'::"text", "site_id") OR "public"."has_permission"('fogo.production.batches'::"text", "site_id")));



CREATE POLICY "inventory_stock_select_permission" ON "public"."inventory_stock_by_site" FOR SELECT TO "authenticated" USING (("public"."has_permission"('nexo.inventory.stock'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.withdraw'::"text", "site_id")));



CREATE POLICY "inventory_stock_update_permission" ON "public"."inventory_stock_by_site" FOR UPDATE TO "authenticated" USING (("public"."has_permission"('nexo.inventory.stock'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.remissions.prepare'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.remissions.receive'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.entries'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.entries_emergency'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.transfers'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.withdraw'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.counts'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.adjustments'::"text", "site_id") OR "public"."has_permission"('origo.procurement.receipts'::"text", "site_id") OR "public"."has_permission"('fogo.production.batches'::"text", "site_id"))) WITH CHECK (("public"."has_permission"('nexo.inventory.stock'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.remissions.prepare'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.remissions.receive'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.entries'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.entries_emergency'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.transfers'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.withdraw'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.counts'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.adjustments'::"text", "site_id") OR "public"."has_permission"('origo.procurement.receipts'::"text", "site_id") OR "public"."has_permission"('fogo.production.batches'::"text", "site_id")));



ALTER TABLE "public"."inventory_transfer_items" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "inventory_transfer_items_delete_permission" ON "public"."inventory_transfer_items" FOR DELETE TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."inventory_transfers" "it"
  WHERE (("it"."id" = "inventory_transfer_items"."transfer_id") AND "public"."has_permission"('nexo.inventory.transfers'::"text", "it"."site_id")))));



CREATE POLICY "inventory_transfer_items_insert_permission" ON "public"."inventory_transfer_items" FOR INSERT TO "authenticated" WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."inventory_transfers" "it"
  WHERE (("it"."id" = "inventory_transfer_items"."transfer_id") AND "public"."has_permission"('nexo.inventory.transfers'::"text", "it"."site_id")))));



CREATE POLICY "inventory_transfer_items_select_permission" ON "public"."inventory_transfer_items" FOR SELECT TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."inventory_transfers" "it"
  WHERE (("it"."id" = "inventory_transfer_items"."transfer_id") AND ("public"."has_permission"('nexo.inventory.transfers'::"text", "it"."site_id") OR "public"."has_permission"('nexo.inventory.stock'::"text", "it"."site_id"))))));



CREATE POLICY "inventory_transfer_items_update_permission" ON "public"."inventory_transfer_items" FOR UPDATE TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."inventory_transfers" "it"
  WHERE (("it"."id" = "inventory_transfer_items"."transfer_id") AND "public"."has_permission"('nexo.inventory.transfers'::"text", "it"."site_id"))))) WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."inventory_transfers" "it"
  WHERE (("it"."id" = "inventory_transfer_items"."transfer_id") AND "public"."has_permission"('nexo.inventory.transfers'::"text", "it"."site_id")))));



ALTER TABLE "public"."inventory_transfers" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "inventory_transfers_delete_permission" ON "public"."inventory_transfers" FOR DELETE TO "authenticated" USING ("public"."has_permission"('nexo.inventory.transfers'::"text", "site_id"));



CREATE POLICY "inventory_transfers_insert_permission" ON "public"."inventory_transfers" FOR INSERT TO "authenticated" WITH CHECK ("public"."has_permission"('nexo.inventory.transfers'::"text", "site_id"));



CREATE POLICY "inventory_transfers_select_permission" ON "public"."inventory_transfers" FOR SELECT TO "authenticated" USING (("public"."has_permission"('nexo.inventory.transfers'::"text", "site_id") OR "public"."has_permission"('nexo.inventory.stock'::"text", "site_id")));



CREATE POLICY "inventory_transfers_update_permission" ON "public"."inventory_transfers" FOR UPDATE TO "authenticated" USING ("public"."has_permission"('nexo.inventory.transfers'::"text", "site_id")) WITH CHECK ("public"."has_permission"('nexo.inventory.transfers'::"text", "site_id"));



ALTER TABLE "public"."loyalty_external_sales" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "loyalty_external_sales_insert_staff" ON "public"."loyalty_external_sales" FOR INSERT TO "authenticated" WITH CHECK (("public"."is_active_staff"() AND "public"."has_permission"('pulso.pos.main'::"text", "site_id", NULL::"uuid") AND ("awarded_by" = "auth"."uid"())));



CREATE POLICY "loyalty_external_sales_select_staff" ON "public"."loyalty_external_sales" FOR SELECT TO "authenticated" USING (("public"."is_active_staff"() AND "public"."has_permission"('pulso.pos.main'::"text", "site_id", NULL::"uuid")));



ALTER TABLE "public"."order_conversations" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "order_conversations_select_client" ON "public"."order_conversations" FOR SELECT TO "authenticated" USING (("client_id" = "auth"."uid"()));



CREATE POLICY "order_conversations_select_staff" ON "public"."order_conversations" FOR SELECT TO "authenticated" USING (("public"."is_employee"() AND "public"."can_access_site"("site_id")));



ALTER TABLE "public"."order_items" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "order_items_delete_owner" ON "public"."order_items" FOR DELETE USING (("public"."is_owner"() OR "public"."is_global_manager"()));



CREATE POLICY "order_items_insert_client" ON "public"."order_items" FOR INSERT WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."orders" "o"
  WHERE (("o"."id" = "order_items"."order_id") AND ("o"."client_id" = "auth"."uid"())))));



CREATE POLICY "order_items_insert_staff" ON "public"."order_items" FOR INSERT WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."orders" "o"
  WHERE (("o"."id" = "order_items"."order_id") AND "public"."is_employee"() AND "public"."can_access_site"("o"."site_id")))));



CREATE POLICY "order_items_select_client" ON "public"."order_items" FOR SELECT USING ((EXISTS ( SELECT 1
   FROM "public"."orders" "o"
  WHERE (("o"."id" = "order_items"."order_id") AND ("o"."client_id" = "auth"."uid"())))));



CREATE POLICY "order_items_select_staff" ON "public"."order_items" FOR SELECT USING ((EXISTS ( SELECT 1
   FROM "public"."orders" "o"
  WHERE (("o"."id" = "order_items"."order_id") AND "public"."is_employee"() AND "public"."can_access_site"("o"."site_id")))));



CREATE POLICY "order_items_update_staff" ON "public"."order_items" FOR UPDATE USING ((EXISTS ( SELECT 1
   FROM "public"."orders" "o"
  WHERE (("o"."id" = "order_items"."order_id") AND "public"."is_employee"() AND "public"."can_access_site"("o"."site_id"))))) WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."orders" "o"
  WHERE (("o"."id" = "order_items"."order_id") AND "public"."is_employee"() AND "public"."can_access_site"("o"."site_id")))));



ALTER TABLE "public"."order_messages" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "order_messages_insert_client" ON "public"."order_messages" FOR INSERT TO "authenticated" WITH CHECK ((("author_id" = "auth"."uid"()) AND ("author_type" = 'client'::"text") AND (EXISTS ( SELECT 1
   FROM "public"."order_conversations" "c"
  WHERE (("c"."id" = "order_messages"."conversation_id") AND ("c"."order_id" = "order_messages"."order_id") AND ("c"."site_id" = "order_messages"."site_id") AND ("c"."client_id" = "auth"."uid"()))))));



CREATE POLICY "order_messages_insert_staff" ON "public"."order_messages" FOR INSERT TO "authenticated" WITH CHECK ((("author_id" = "auth"."uid"()) AND ("author_type" = 'staff'::"text") AND "public"."is_employee"() AND "public"."can_access_site"("site_id")));



CREATE POLICY "order_messages_select_client" ON "public"."order_messages" FOR SELECT TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."order_conversations" "c"
  WHERE (("c"."id" = "order_messages"."conversation_id") AND ("c"."client_id" = "auth"."uid"())))));



CREATE POLICY "order_messages_select_staff" ON "public"."order_messages" FOR SELECT TO "authenticated" USING (("public"."is_employee"() AND "public"."can_access_site"("site_id")));



ALTER TABLE "public"."order_status_events" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "order_status_events_insert_staff" ON "public"."order_status_events" FOR INSERT TO "authenticated" WITH CHECK (("public"."is_employee"() AND "public"."can_access_site"("site_id") AND "public"."has_permission"('pulso.pos.main'::"text", "site_id", NULL::"uuid")));



CREATE POLICY "order_status_events_select_client" ON "public"."order_status_events" FOR SELECT TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."orders" "o"
  WHERE (("o"."id" = "order_status_events"."order_id") AND ("o"."client_id" = "auth"."uid"())))));



CREATE POLICY "order_status_events_select_staff" ON "public"."order_status_events" FOR SELECT TO "authenticated" USING (("public"."is_employee"() AND "public"."can_access_site"("site_id")));



ALTER TABLE "public"."orders" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "orders_delete_owner" ON "public"."orders" FOR DELETE USING (("public"."is_owner"() OR "public"."is_global_manager"()));



CREATE POLICY "orders_insert_client" ON "public"."orders" FOR INSERT WITH CHECK ((("client_id" = "auth"."uid"()) AND ("source" = 'vento_pass'::"text")));



CREATE POLICY "orders_insert_staff" ON "public"."orders" FOR INSERT WITH CHECK (("public"."is_employee"() AND "public"."can_access_site"("site_id")));



CREATE POLICY "orders_select_client" ON "public"."orders" FOR SELECT USING (("client_id" = "auth"."uid"()));



CREATE POLICY "orders_select_staff" ON "public"."orders" FOR SELECT USING (("public"."is_employee"() AND "public"."can_access_site"("site_id")));



CREATE POLICY "orders_update_staff" ON "public"."orders" FOR UPDATE USING (("public"."is_employee"() AND "public"."can_access_site"("site_id"))) WITH CHECK (("public"."is_employee"() AND "public"."can_access_site"("site_id")));



ALTER TABLE "public"."printing_label_templates" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "printing_label_templates_delete_own" ON "public"."printing_label_templates" FOR DELETE TO "authenticated" USING ((("auth"."uid"() = "user_id") AND ("app_id" = 'nexo'::"text")));



CREATE POLICY "printing_label_templates_insert_own" ON "public"."printing_label_templates" FOR INSERT TO "authenticated" WITH CHECK ((("auth"."uid"() = "user_id") AND ("app_id" = 'nexo'::"text")));



CREATE POLICY "printing_label_templates_select_own" ON "public"."printing_label_templates" FOR SELECT TO "authenticated" USING ((("auth"."uid"() = "user_id") AND ("app_id" = 'nexo'::"text")));



CREATE POLICY "printing_label_templates_update_own" ON "public"."printing_label_templates" FOR UPDATE TO "authenticated" USING ((("auth"."uid"() = "user_id") AND ("app_id" = 'nexo'::"text"))) WITH CHECK ((("auth"."uid"() = "user_id") AND ("app_id" = 'nexo'::"text")));



ALTER TABLE "public"."procurement_agreed_prices" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."procurement_reception_items" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "procurement_reception_items_delete_permission" ON "public"."procurement_reception_items" FOR DELETE TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."procurement_receptions" "pr"
  WHERE (("pr"."id" = "procurement_reception_items"."reception_id") AND "public"."has_permission"('nexo.inventory.stock'::"text", "pr"."site_id")))));



CREATE POLICY "procurement_reception_items_insert_permission" ON "public"."procurement_reception_items" FOR INSERT TO "authenticated" WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."procurement_receptions" "pr"
  WHERE (("pr"."id" = "procurement_reception_items"."reception_id") AND "public"."has_permission"('nexo.inventory.stock'::"text", "pr"."site_id")))));



CREATE POLICY "procurement_reception_items_select_permission" ON "public"."procurement_reception_items" FOR SELECT TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."procurement_receptions" "pr"
  WHERE (("pr"."id" = "procurement_reception_items"."reception_id") AND "public"."has_permission"('nexo.inventory.stock'::"text", "pr"."site_id")))));



CREATE POLICY "procurement_reception_items_update_permission" ON "public"."procurement_reception_items" FOR UPDATE TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."procurement_receptions" "pr"
  WHERE (("pr"."id" = "procurement_reception_items"."reception_id") AND "public"."has_permission"('nexo.inventory.stock'::"text", "pr"."site_id"))))) WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."procurement_receptions" "pr"
  WHERE (("pr"."id" = "procurement_reception_items"."reception_id") AND "public"."has_permission"('nexo.inventory.stock'::"text", "pr"."site_id")))));



ALTER TABLE "public"."procurement_receptions" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "procurement_receptions_delete_permission" ON "public"."procurement_receptions" FOR DELETE TO "authenticated" USING ("public"."has_permission"('nexo.inventory.stock'::"text", "site_id"));



CREATE POLICY "procurement_receptions_insert_permission" ON "public"."procurement_receptions" FOR INSERT TO "authenticated" WITH CHECK ("public"."has_permission"('nexo.inventory.stock'::"text", "site_id"));



CREATE POLICY "procurement_receptions_select_permission" ON "public"."procurement_receptions" FOR SELECT TO "authenticated" USING ("public"."has_permission"('nexo.inventory.stock'::"text", "site_id"));



CREATE POLICY "procurement_receptions_update_permission" ON "public"."procurement_receptions" FOR UPDATE TO "authenticated" USING ("public"."has_permission"('nexo.inventory.stock'::"text", "site_id")) WITH CHECK ("public"."has_permission"('nexo.inventory.stock'::"text", "site_id"));



ALTER TABLE "public"."product_asset_maintenance_events" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "product_asset_maintenance_events_insert_inventory_operator" ON "public"."product_asset_maintenance_events" FOR INSERT WITH CHECK ("public"."has_permission"('nexo.inventory.stock'::"text", "public"."current_employee_site_id"()));



CREATE POLICY "product_asset_maintenance_events_select_staff" ON "public"."product_asset_maintenance_events" FOR SELECT USING ("public"."is_employee"());



CREATE POLICY "product_asset_maintenance_events_write_owner" ON "public"."product_asset_maintenance_events" USING (("public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"()));



ALTER TABLE "public"."product_asset_profiles" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "product_asset_profiles_insert_inventory_operator" ON "public"."product_asset_profiles" FOR INSERT WITH CHECK ("public"."has_permission"('nexo.inventory.stock'::"text", "public"."current_employee_site_id"()));



CREATE POLICY "product_asset_profiles_select_staff" ON "public"."product_asset_profiles" FOR SELECT USING ("public"."is_employee"());



CREATE POLICY "product_asset_profiles_write_accountant_catalog" ON "public"."product_asset_profiles" TO "authenticated" USING ("public"."has_permission"('nexo.catalog.products'::"text")) WITH CHECK ("public"."has_permission"('nexo.catalog.products'::"text"));



CREATE POLICY "product_asset_profiles_write_owner" ON "public"."product_asset_profiles" USING (("public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"()));



ALTER TABLE "public"."product_asset_transfer_events" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "product_asset_transfer_events_insert_inventory_operator" ON "public"."product_asset_transfer_events" FOR INSERT WITH CHECK ("public"."has_permission"('nexo.inventory.stock'::"text", "public"."current_employee_site_id"()));



CREATE POLICY "product_asset_transfer_events_select_staff" ON "public"."product_asset_transfer_events" FOR SELECT USING ("public"."is_employee"());



CREATE POLICY "product_asset_transfer_events_write_owner" ON "public"."product_asset_transfer_events" USING (("public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"()));



ALTER TABLE "public"."product_categories" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "product_categories_select_client" ON "public"."product_categories" FOR SELECT USING (((EXISTS ( SELECT 1
   FROM "public"."users" "u"
  WHERE (("u"."id" = "auth"."uid"()) AND ("u"."is_client" = true)))) AND ("is_active" = true)));



CREATE POLICY "product_categories_select_staff" ON "public"."product_categories" FOR SELECT USING ("public"."is_employee"());



CREATE POLICY "product_categories_write_owner" ON "public"."product_categories" USING (("public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"()));



ALTER TABLE "public"."product_images" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "product_images_read_authenticated" ON "public"."product_images" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "product_images_write_inventory_managers" ON "public"."product_images" TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."employees" "e"
  WHERE (("e"."id" = "auth"."uid"()) AND ("lower"("e"."role") = ANY (ARRAY['propietario'::"text", 'gerente_general'::"text"])))))) WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."employees" "e"
  WHERE (("e"."id" = "auth"."uid"()) AND ("lower"("e"."role") = ANY (ARRAY['propietario'::"text", 'gerente_general'::"text"]))))));



ALTER TABLE "public"."product_inventory_profiles" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "product_inventory_profiles_insert_inventory_operator" ON "public"."product_inventory_profiles" FOR INSERT WITH CHECK ("public"."has_permission"('nexo.inventory.stock'::"text", "public"."current_employee_site_id"()));



CREATE POLICY "product_inventory_profiles_select_staff" ON "public"."product_inventory_profiles" FOR SELECT USING ("public"."is_employee"());



CREATE POLICY "product_inventory_profiles_write_accountant_catalog" ON "public"."product_inventory_profiles" TO "authenticated" USING ("public"."has_permission"('nexo.catalog.products'::"text")) WITH CHECK ("public"."has_permission"('nexo.catalog.products'::"text"));



CREATE POLICY "product_inventory_profiles_write_owner" ON "public"."product_inventory_profiles" USING (("public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"()));



ALTER TABLE "public"."product_site_settings" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "product_site_settings_insert_inventory_operator" ON "public"."product_site_settings" FOR INSERT WITH CHECK ("public"."has_permission"('nexo.inventory.stock'::"text", "site_id"));



CREATE POLICY "product_site_settings_select_staff" ON "public"."product_site_settings" FOR SELECT USING ("public"."is_employee"());



CREATE POLICY "product_site_settings_write_accountant_catalog" ON "public"."product_site_settings" TO "authenticated" USING ("public"."has_permission"('nexo.catalog.products'::"text", "site_id")) WITH CHECK ("public"."has_permission"('nexo.catalog.products'::"text", "site_id"));



CREATE POLICY "product_site_settings_write_owner" ON "public"."product_site_settings" USING (("public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"()));



ALTER TABLE "public"."product_sku_aliases" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "product_sku_aliases_select_staff" ON "public"."product_sku_aliases" FOR SELECT TO "authenticated" USING ("public"."is_employee"());



ALTER TABLE "public"."product_sku_sequences" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."product_suppliers" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "product_suppliers_insert_inventory_operator" ON "public"."product_suppliers" FOR INSERT WITH CHECK ("public"."has_permission"('nexo.inventory.stock'::"text", "public"."current_employee_site_id"()));



CREATE POLICY "product_suppliers_select_staff" ON "public"."product_suppliers" FOR SELECT USING ("public"."is_employee"());



CREATE POLICY "product_suppliers_write_accountant_catalog" ON "public"."product_suppliers" TO "authenticated" USING ("public"."has_permission"('nexo.catalog.products'::"text")) WITH CHECK ("public"."has_permission"('nexo.catalog.products'::"text"));



CREATE POLICY "product_suppliers_write_owner" ON "public"."product_suppliers" USING (("public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"()));



CREATE POLICY "product_uom_profiles_write_accountant_catalog" ON "public"."product_uom_profiles" TO "authenticated" USING ("public"."has_permission"('nexo.catalog.products'::"text")) WITH CHECK ("public"."has_permission"('nexo.catalog.products'::"text"));



ALTER TABLE "public"."production_batches" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "production_batches_select_staff" ON "public"."production_batches" FOR SELECT USING ("public"."is_employee"());



CREATE POLICY "production_batches_write_production" ON "public"."production_batches" USING ((("public"."current_employee_role"() = ANY (ARRAY['propietario'::"text", 'gerente'::"text", 'gerente_general'::"text", 'barista'::"text", 'cocinero'::"text", 'panadero'::"text", 'repostero'::"text", 'pastelero'::"text"])) AND (("public"."current_employee_role"() = ANY (ARRAY['propietario'::"text", 'gerente'::"text", 'gerente_general'::"text"])) OR ("site_id" = "public"."current_employee_site_id"())))) WITH CHECK ((("public"."current_employee_role"() = ANY (ARRAY['propietario'::"text", 'gerente'::"text", 'gerente_general'::"text", 'barista'::"text", 'cocinero'::"text", 'panadero'::"text", 'repostero'::"text", 'pastelero'::"text"])) AND (("public"."current_employee_role"() = ANY (ARRAY['propietario'::"text", 'gerente'::"text", 'gerente_general'::"text"])) OR ("site_id" = "public"."current_employee_site_id"()))));



ALTER TABLE "public"."production_request_items" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "production_request_items_insert_site" ON "public"."production_request_items" FOR INSERT WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."production_requests" "r"
  WHERE (("r"."id" = "production_request_items"."request_id") AND "public"."is_employee"() AND ("public"."can_access_site"("r"."from_site_id") OR "public"."can_access_site"("r"."to_site_id"))))));



CREATE POLICY "production_request_items_select_site" ON "public"."production_request_items" FOR SELECT USING ((EXISTS ( SELECT 1
   FROM "public"."production_requests" "r"
  WHERE (("r"."id" = "production_request_items"."request_id") AND "public"."is_employee"() AND ("public"."can_access_site"("r"."from_site_id") OR "public"."can_access_site"("r"."to_site_id"))))));



CREATE POLICY "production_request_items_update_site" ON "public"."production_request_items" FOR UPDATE USING ((EXISTS ( SELECT 1
   FROM "public"."production_requests" "r"
  WHERE (("r"."id" = "production_request_items"."request_id") AND "public"."is_employee"() AND ("public"."can_access_site"("r"."from_site_id") OR "public"."can_access_site"("r"."to_site_id")))))) WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."production_requests" "r"
  WHERE (("r"."id" = "production_request_items"."request_id") AND "public"."is_employee"() AND ("public"."can_access_site"("r"."from_site_id") OR "public"."can_access_site"("r"."to_site_id"))))));



ALTER TABLE "public"."production_requests" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "production_requests_delete_owner" ON "public"."production_requests" FOR DELETE USING (("public"."is_owner"() OR "public"."is_global_manager"()));



CREATE POLICY "production_requests_insert_site" ON "public"."production_requests" FOR INSERT WITH CHECK (("public"."is_employee"() AND ("public"."can_access_site"("from_site_id") OR "public"."can_access_site"("to_site_id"))));



CREATE POLICY "production_requests_select_site" ON "public"."production_requests" FOR SELECT USING (("public"."is_employee"() AND ("public"."can_access_site"("from_site_id") OR "public"."can_access_site"("to_site_id"))));



CREATE POLICY "production_requests_update_site" ON "public"."production_requests" FOR UPDATE USING (("public"."is_employee"() AND ("public"."can_access_site"("from_site_id") OR "public"."can_access_site"("to_site_id")))) WITH CHECK (("public"."is_employee"() AND ("public"."can_access_site"("from_site_id") OR "public"."can_access_site"("to_site_id"))));



ALTER TABLE "public"."products" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "products_insert_accountant_catalog" ON "public"."products" FOR INSERT TO "authenticated" WITH CHECK ("public"."has_permission"('nexo.catalog.products'::"text"));



CREATE POLICY "products_insert_inventory_operator" ON "public"."products" FOR INSERT WITH CHECK ("public"."has_permission"('nexo.inventory.stock'::"text", "public"."current_employee_site_id"()));



CREATE POLICY "products_select_client" ON "public"."products" FOR SELECT USING (((EXISTS ( SELECT 1
   FROM "public"."users" "u"
  WHERE (("u"."id" = "auth"."uid"()) AND ("u"."is_client" = true)))) AND ("is_active" = true) AND ("product_type" = 'sale'::"text")));



CREATE POLICY "products_select_staff" ON "public"."products" FOR SELECT USING ("public"."is_employee"());



CREATE POLICY "products_update_accountant_catalog" ON "public"."products" FOR UPDATE TO "authenticated" USING ("public"."has_permission"('nexo.catalog.products'::"text")) WITH CHECK ("public"."has_permission"('nexo.catalog.products'::"text"));



CREATE POLICY "products_write_owner" ON "public"."products" USING (("public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"()));



CREATE POLICY "pss_select_authenticated" ON "public"."product_site_settings" FOR SELECT TO "authenticated" USING (true);



ALTER TABLE "public"."purchase_orders" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."recipe_cards" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "recipe_cards_select_staff" ON "public"."recipe_cards" FOR SELECT USING ("public"."can_access_recipe_scope"("site_id", "area_id"));



CREATE POLICY "recipe_cards_write_manager" ON "public"."recipe_cards" USING ((("public"."is_owner"() OR "public"."is_manager"()) AND "public"."can_access_recipe_scope"("site_id", "area_id"))) WITH CHECK ((("public"."is_owner"() OR "public"."is_manager"()) AND "public"."can_access_recipe_scope"("site_id", "area_id")));



ALTER TABLE "public"."recipe_steps" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "recipe_steps_select_staff" ON "public"."recipe_steps" FOR SELECT USING ((EXISTS ( SELECT 1
   FROM "public"."recipe_cards" "rc"
  WHERE (("rc"."id" = "recipe_steps"."recipe_card_id") AND "public"."can_access_recipe_scope"("rc"."site_id", "rc"."area_id")))));



CREATE POLICY "recipe_steps_write_manager" ON "public"."recipe_steps" USING (("public"."is_owner"() OR "public"."is_manager"())) WITH CHECK (("public"."is_owner"() OR "public"."is_manager"()));



ALTER TABLE "public"."recipes" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "recipes_select_staff" ON "public"."recipes" FOR SELECT USING ((EXISTS ( SELECT 1
   FROM "public"."recipe_cards" "rc"
  WHERE (("rc"."product_id" = "recipes"."product_id") AND "public"."can_access_recipe_scope"("rc"."site_id", "rc"."area_id")))));



CREATE POLICY "recipes_write_manager" ON "public"."recipes" USING (("public"."is_owner"() OR "public"."is_manager"())) WITH CHECK (("public"."is_owner"() OR "public"."is_manager"()));



ALTER TABLE "public"."required_document_rules" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "required_document_rules_delete" ON "public"."required_document_rules" FOR DELETE TO "authenticated" USING (("public"."is_owner"() OR "public"."is_global_manager"() OR ("public"."current_employee_role"() = 'gerente'::"text")));



CREATE POLICY "required_document_rules_insert" ON "public"."required_document_rules" FOR INSERT TO "authenticated" WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"() OR ("public"."current_employee_role"() = 'gerente'::"text")));



CREATE POLICY "required_document_rules_select" ON "public"."required_document_rules" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "required_document_rules_update" ON "public"."required_document_rules" FOR UPDATE TO "authenticated" USING (("public"."is_owner"() OR "public"."is_global_manager"() OR ("public"."current_employee_role"() = 'gerente'::"text"))) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"() OR ("public"."current_employee_role"() = 'gerente'::"text")));



ALTER TABLE "public"."restock_request_item_picks" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "restock_request_item_picks_select_permission" ON "public"."restock_request_item_picks" FOR SELECT TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."restock_requests" "req"
  WHERE (("req"."id" = "restock_request_item_picks"."request_id") AND ("public"."can_access_site"("req"."from_site_id") OR "public"."can_access_site"("req"."to_site_id"))))));



CREATE POLICY "restock_request_item_picks_write_prepare_permission" ON "public"."restock_request_item_picks" TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."restock_requests" "req"
  WHERE (("req"."id" = "restock_request_item_picks"."request_id") AND "public"."has_permission"('nexo.inventory.remissions.prepare'::"text", "req"."from_site_id"))))) WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."restock_requests" "req"
  WHERE (("req"."id" = "restock_request_item_picks"."request_id") AND "public"."has_permission"('nexo.inventory.remissions.prepare'::"text", "req"."from_site_id")))));



ALTER TABLE "public"."restock_request_items" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "restock_request_items_delete_permission" ON "public"."restock_request_items" FOR DELETE TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."restock_requests" "r"
  WHERE (("r"."id" = "restock_request_items"."request_id") AND ("public"."has_permission"('nexo.inventory.remissions.cancel'::"text") OR "public"."has_permission"('nexo.inventory.remissions.prepare'::"text", "r"."from_site_id") OR (("r"."created_by" = "auth"."uid"()) AND ("r"."status" = 'pending'::"text") AND ("r"."to_site_id" IS NOT NULL) AND "public"."has_permission"('nexo.inventory.remissions.edit_own_pending'::"text", "r"."to_site_id")))))));



CREATE POLICY "restock_request_items_insert_permission" ON "public"."restock_request_items" FOR INSERT TO "authenticated" WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."restock_requests" "r"
  WHERE (("r"."id" = "restock_request_items"."request_id") AND ("public"."has_permission"('nexo.inventory.remissions.prepare'::"text", "r"."from_site_id") OR "public"."has_permission"('nexo.inventory.remissions.receive'::"text", "r"."to_site_id") OR "public"."has_permission"('nexo.inventory.remissions.cancel'::"text") OR (("r"."created_by" = "auth"."uid"()) AND ("r"."status" = 'pending'::"text") AND ("r"."to_site_id" IS NOT NULL) AND "public"."has_permission"('nexo.inventory.remissions.edit_own_pending'::"text", "r"."to_site_id")))))));



CREATE POLICY "restock_request_items_select_permission" ON "public"."restock_request_items" FOR SELECT TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."restock_requests" "r"
  WHERE (("r"."id" = "restock_request_items"."request_id") AND ("public"."has_permission"('nexo.inventory.remissions'::"text", "r"."from_site_id") OR "public"."has_permission"('nexo.inventory.remissions'::"text", "r"."to_site_id") OR "public"."has_permission"('nexo.inventory.remissions.prepare'::"text", "r"."from_site_id") OR "public"."has_permission"('nexo.inventory.remissions.receive'::"text", "r"."to_site_id") OR "public"."has_permission"('nexo.inventory.remissions.all_sites'::"text"))))));



CREATE POLICY "restock_request_items_update_permission" ON "public"."restock_request_items" FOR UPDATE TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."restock_requests" "r"
  WHERE (("r"."id" = "restock_request_items"."request_id") AND ("public"."has_permission"('nexo.inventory.remissions.prepare'::"text", "r"."from_site_id") OR "public"."has_permission"('nexo.inventory.remissions.receive'::"text", "r"."to_site_id") OR "public"."has_permission"('nexo.inventory.remissions.cancel'::"text") OR (("r"."created_by" = "auth"."uid"()) AND ("r"."status" = 'pending'::"text") AND ("r"."to_site_id" IS NOT NULL) AND "public"."has_permission"('nexo.inventory.remissions.edit_own_pending'::"text", "r"."to_site_id"))))))) WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."restock_requests" "r"
  WHERE (("r"."id" = "restock_request_items"."request_id") AND ("public"."has_permission"('nexo.inventory.remissions.prepare'::"text", "r"."from_site_id") OR "public"."has_permission"('nexo.inventory.remissions.receive'::"text", "r"."to_site_id") OR "public"."has_permission"('nexo.inventory.remissions.cancel'::"text") OR (("r"."created_by" = "auth"."uid"()) AND ("r"."status" = 'pending'::"text") AND ("r"."to_site_id" IS NOT NULL) AND "public"."has_permission"('nexo.inventory.remissions.edit_own_pending'::"text", "r"."to_site_id")))))));



ALTER TABLE "public"."restock_requests" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "restock_requests_delete_permission" ON "public"."restock_requests" FOR DELETE TO "authenticated" USING ("public"."has_permission"('nexo.inventory.remissions.cancel'::"text"));



CREATE POLICY "restock_requests_insert_permission" ON "public"."restock_requests" FOR INSERT TO "authenticated" WITH CHECK ((("to_site_id" IS NOT NULL) AND "public"."has_permission"('nexo.inventory.remissions.request'::"text", "to_site_id")));



CREATE POLICY "restock_requests_select_permission" ON "public"."restock_requests" FOR SELECT TO "authenticated" USING (("public"."has_permission"('nexo.inventory.remissions'::"text", "from_site_id") OR "public"."has_permission"('nexo.inventory.remissions'::"text", "to_site_id") OR "public"."has_permission"('nexo.inventory.remissions.prepare'::"text", "from_site_id") OR "public"."has_permission"('nexo.inventory.remissions.receive'::"text", "to_site_id") OR "public"."has_permission"('nexo.inventory.remissions.all_sites'::"text")));



CREATE POLICY "restock_requests_update_permission" ON "public"."restock_requests" FOR UPDATE TO "authenticated" USING (("public"."has_permission"('nexo.inventory.remissions.prepare'::"text", "from_site_id") OR "public"."has_permission"('nexo.inventory.remissions.receive'::"text", "to_site_id") OR "public"."has_permission"('nexo.inventory.remissions.cancel'::"text") OR (("created_by" = "auth"."uid"()) AND ("status" = 'pending'::"text") AND ("to_site_id" IS NOT NULL) AND "public"."has_permission"('nexo.inventory.remissions.edit_own_pending'::"text", "to_site_id")))) WITH CHECK (("public"."has_permission"('nexo.inventory.remissions.prepare'::"text", "from_site_id") OR "public"."has_permission"('nexo.inventory.remissions.receive'::"text", "to_site_id") OR "public"."has_permission"('nexo.inventory.remissions.cancel'::"text") OR (("created_by" = "auth"."uid"()) AND ("status" = 'pending'::"text") AND ("to_site_id" IS NOT NULL) AND "public"."has_permission"('nexo.inventory.remissions.edit_own_pending'::"text", "to_site_id"))));



ALTER TABLE "public"."role_capabilities" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "role_capabilities_select_authenticated" ON "public"."role_capabilities" FOR SELECT TO "authenticated" USING (true);



ALTER TABLE "public"."role_permissions" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "role_permissions_manage_owner" ON "public"."role_permissions" TO "authenticated" USING (("public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"()));



CREATE POLICY "role_permissions_select_all" ON "public"."role_permissions" FOR SELECT TO "authenticated" USING (true);



ALTER TABLE "public"."role_site_type_rules" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "role_site_type_rules_manage_owner" ON "public"."role_site_type_rules" TO "authenticated" USING (("public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"()));



CREATE POLICY "role_site_type_rules_select_all" ON "public"."role_site_type_rules" FOR SELECT TO "authenticated" USING (true);



ALTER TABLE "public"."roles" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "roles_manage_owner" ON "public"."roles" TO "authenticated" USING (("public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"()));



CREATE POLICY "roles_select" ON "public"."roles" FOR SELECT USING (("auth"."role"() = 'authenticated'::"text"));



CREATE POLICY "roles_select_all" ON "public"."roles" FOR SELECT TO "authenticated" USING (true);



ALTER TABLE "public"."shift_policy" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "shift_policy_select_authenticated" ON "public"."shift_policy" FOR SELECT TO "authenticated" USING (true);



ALTER TABLE "public"."site_area_purpose_rules" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "site_area_purpose_rules_select_authenticated" ON "public"."site_area_purpose_rules" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "site_area_purpose_rules_write_admin" ON "public"."site_area_purpose_rules" TO "authenticated" USING (("public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"()));



ALTER TABLE "public"."site_attendance_policy" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "site_attendance_policy_select_authenticated" ON "public"."site_attendance_policy" FOR SELECT TO "authenticated" USING (true);



ALTER TABLE "public"."site_operational_capabilities" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "site_operational_capabilities_select_authenticated" ON "public"."site_operational_capabilities" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "site_operational_capabilities_write_admin" ON "public"."site_operational_capabilities" TO "authenticated" USING (("public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"()));



ALTER TABLE "public"."site_purpose_settings" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "site_purpose_settings_select_authenticated" ON "public"."site_purpose_settings" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "site_purpose_settings_write_admin" ON "public"."site_purpose_settings" TO "authenticated" USING (("public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"()));



ALTER TABLE "public"."site_supply_routes" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "site_supply_routes_manage_owner" ON "public"."site_supply_routes" TO "authenticated" USING (("public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"()));



CREATE POLICY "site_supply_routes_select_all" ON "public"."site_supply_routes" FOR SELECT TO "authenticated" USING (true);



ALTER TABLE "public"."sites" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "sites_select_owner_manager" ON "public"."sites" FOR SELECT TO "authenticated" USING (("public"."is_owner"() OR "public"."is_global_manager"()));



CREATE POLICY "sites_select_public_vento_pass" ON "public"."sites" FOR SELECT TO "authenticated" USING ((("is_active" = true) AND ("is_public" = true)));



CREATE POLICY "sites_select_staff" ON "public"."sites" FOR SELECT USING ("public"."can_access_site"("id"));



CREATE POLICY "sites_write_owner" ON "public"."sites" USING (("public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"()));



ALTER TABLE "public"."staff_invitations" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "staff_invitations_insert_management" ON "public"."staff_invitations" FOR INSERT TO "authenticated" WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."employees" "e"
  WHERE (("e"."id" = "auth"."uid"()) AND ("e"."role" = ANY (ARRAY['propietario'::"text", 'gerente_general'::"text", 'gerente'::"text"])) AND (("e"."role" = ANY (ARRAY['propietario'::"text", 'gerente_general'::"text"])) OR ("e"."site_id" = COALESCE("staff_invitations"."site_id", "staff_invitations"."staff_site_id")))))));



CREATE POLICY "staff_invitations_select_management" ON "public"."staff_invitations" FOR SELECT TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."employees" "e"
  WHERE (("e"."id" = "auth"."uid"()) AND ("e"."role" = ANY (ARRAY['propietario'::"text", 'gerente_general'::"text", 'gerente'::"text"])) AND (("e"."role" = ANY (ARRAY['propietario'::"text", 'gerente_general'::"text"])) OR ("e"."site_id" = "staff_invitations"."site_id") OR ("e"."site_id" = "staff_invitations"."staff_site_id"))))));



ALTER TABLE "public"."staff_manual_calendar_events" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "staff_manual_calendar_events_select_admin" ON "public"."staff_manual_calendar_events" FOR SELECT TO "authenticated" USING (("public"."is_owner"() OR "public"."is_global_manager"()));



CREATE POLICY "staff_manual_calendar_events_write_admin" ON "public"."staff_manual_calendar_events" TO "authenticated" USING (("public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"()));



CREATE POLICY "staff_select_all_users" ON "public"."users" FOR SELECT TO "authenticated" USING ("public"."is_active_staff"());



ALTER TABLE "public"."suppliers" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "suppliers_delete_owner_manager_accountant" ON "public"."suppliers" FOR DELETE TO "authenticated" USING (("public"."is_owner"() OR "public"."is_global_manager"() OR "public"."is_manager"() OR "public"."has_permission"('origo.suppliers.manage'::"text")));



CREATE POLICY "suppliers_insert_owner_manager_accountant" ON "public"."suppliers" FOR INSERT TO "authenticated" WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"() OR "public"."is_manager"() OR "public"."has_permission"('origo.suppliers.manage'::"text")));



CREATE POLICY "suppliers_update_owner_manager_accountant" ON "public"."suppliers" FOR UPDATE TO "authenticated" USING (("public"."is_owner"() OR "public"."is_global_manager"() OR "public"."is_manager"() OR "public"."has_permission"('origo.suppliers.manage'::"text"))) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"() OR "public"."is_manager"() OR "public"."has_permission"('origo.suppliers.manage'::"text")));



ALTER TABLE "public"."support_messages" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "support_messages_insert" ON "public"."support_messages" FOR INSERT WITH CHECK ((("author_id" = "auth"."uid"()) AND (EXISTS ( SELECT 1
   FROM "public"."support_tickets" "t"
  WHERE (("t"."id" = "support_messages"."ticket_id") AND (("t"."created_by" = "auth"."uid"()) OR ("t"."assigned_to" = "auth"."uid"()) OR (EXISTS ( SELECT 1
           FROM "public"."employees" "e"
          WHERE (("e"."id" = "auth"."uid"()) AND ("e"."role" = ANY (ARRAY['propietario'::"text", 'gerente_general'::"text"]))))) OR (EXISTS ( SELECT 1
           FROM ("public"."employees" "e"
             JOIN "public"."employee_sites" "es" ON (("es"."employee_id" = "e"."id")))
          WHERE (("e"."id" = "auth"."uid"()) AND ("e"."role" = 'gerente'::"text") AND ("es"."site_id" = "t"."site_id") AND ("es"."is_active" = true))))))))));



CREATE POLICY "support_messages_select" ON "public"."support_messages" FOR SELECT USING ((EXISTS ( SELECT 1
   FROM "public"."support_tickets" "t"
  WHERE (("t"."id" = "support_messages"."ticket_id") AND (("t"."created_by" = "auth"."uid"()) OR ("t"."assigned_to" = "auth"."uid"()) OR (EXISTS ( SELECT 1
           FROM "public"."employees" "e"
          WHERE (("e"."id" = "auth"."uid"()) AND ("e"."role" = ANY (ARRAY['propietario'::"text", 'gerente_general'::"text"]))))) OR (EXISTS ( SELECT 1
           FROM ("public"."employees" "e"
             JOIN "public"."employee_sites" "es" ON (("es"."employee_id" = "e"."id")))
          WHERE (("e"."id" = "auth"."uid"()) AND ("e"."role" = 'gerente'::"text") AND ("es"."site_id" = "t"."site_id") AND ("es"."is_active" = true)))))))));



ALTER TABLE "public"."support_tickets" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "support_tickets_insert" ON "public"."support_tickets" FOR INSERT WITH CHECK (("created_by" = "auth"."uid"()));



CREATE POLICY "support_tickets_select" ON "public"."support_tickets" FOR SELECT USING ((("created_by" = "auth"."uid"()) OR ("assigned_to" = "auth"."uid"()) OR (EXISTS ( SELECT 1
   FROM "public"."employees" "e"
  WHERE (("e"."id" = "auth"."uid"()) AND ("e"."role" = ANY (ARRAY['propietario'::"text", 'gerente_general'::"text"]))))) OR (EXISTS ( SELECT 1
   FROM ("public"."employees" "e"
     JOIN "public"."employee_sites" "es" ON (("es"."employee_id" = "e"."id")))
  WHERE (("e"."id" = "auth"."uid"()) AND ("e"."role" = 'gerente'::"text") AND ("es"."site_id" = "support_tickets"."site_id") AND ("es"."is_active" = true))))));



CREATE POLICY "support_tickets_select_as_target" ON "public"."support_tickets" FOR SELECT TO "authenticated" USING (("target_employee_id" = "auth"."uid"()));



CREATE POLICY "support_tickets_update" ON "public"."support_tickets" FOR UPDATE USING ((("created_by" = "auth"."uid"()) OR ("assigned_to" = "auth"."uid"()) OR (EXISTS ( SELECT 1
   FROM "public"."employees" "e"
  WHERE (("e"."id" = "auth"."uid"()) AND ("e"."role" = ANY (ARRAY['propietario'::"text", 'gerente_general'::"text"]))))) OR (EXISTS ( SELECT 1
   FROM ("public"."employees" "e"
     JOIN "public"."employee_sites" "es" ON (("es"."employee_id" = "e"."id")))
  WHERE (("e"."id" = "auth"."uid"()) AND ("e"."role" = 'gerente'::"text") AND ("es"."site_id" = "support_tickets"."site_id") AND ("es"."is_active" = true)))))) WITH CHECK ((("created_by" = "auth"."uid"()) OR ("assigned_to" = "auth"."uid"()) OR (EXISTS ( SELECT 1
   FROM "public"."employees" "e"
  WHERE (("e"."id" = "auth"."uid"()) AND ("e"."role" = ANY (ARRAY['propietario'::"text", 'gerente_general'::"text"]))))) OR (EXISTS ( SELECT 1
   FROM ("public"."employees" "e"
     JOIN "public"."employee_sites" "es" ON (("es"."employee_id" = "e"."id")))
  WHERE (("e"."id" = "auth"."uid"()) AND ("e"."role" = 'gerente'::"text") AND ("es"."site_id" = "support_tickets"."site_id") AND ("es"."is_active" = true))))));



ALTER TABLE "public"."user_feedback" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."users" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "users_delete_admin" ON "public"."users" FOR DELETE TO "authenticated" USING (("public"."is_owner"() OR "public"."is_global_manager"()));



CREATE POLICY "users_insert_admin" ON "public"."users" FOR INSERT TO "authenticated" WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"()));



CREATE POLICY "users_insert_self" ON "public"."users" FOR INSERT TO "authenticated" WITH CHECK (("id" = "auth"."uid"()));



CREATE POLICY "users_select_cashier" ON "public"."users" FOR SELECT TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."employees" "e"
  WHERE (("e"."id" = "auth"."uid"()) AND ("e"."is_active" = true) AND ("e"."role" = ANY (ARRAY['propietario'::"text", 'gerente'::"text", 'gerente_general'::"text", 'cajero'::"text", 'mesero'::"text"]))))));



CREATE POLICY "users_select_cashier_for_qr" ON "public"."users" FOR SELECT TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."employees" "e"
  WHERE (("e"."id" = "auth"."uid"()) AND ("e"."is_active" = true) AND ("e"."role" = ANY (ARRAY['propietario'::"text", 'gerente'::"text", 'gerente_general'::"text", 'cajero'::"text", 'mesero'::"text"]))))));



CREATE POLICY "users_select_self" ON "public"."users" FOR SELECT TO "authenticated" USING (("id" = "auth"."uid"()));



CREATE POLICY "users_update_admin" ON "public"."users" FOR UPDATE TO "authenticated" USING (("public"."is_owner"() OR "public"."is_global_manager"())) WITH CHECK (("public"."is_owner"() OR "public"."is_global_manager"()));



CREATE POLICY "users_update_self" ON "public"."users" FOR UPDATE TO "authenticated" USING (("id" = "auth"."uid"())) WITH CHECK (("id" = "auth"."uid"()));



ALTER TABLE "public"."website_blocks" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "website_blocks_authenticated_read" ON "public"."website_blocks" FOR SELECT TO "authenticated" USING (("is_published" = true));



ALTER TABLE "public"."website_items" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "website_items_authenticated_read" ON "public"."website_items" FOR SELECT TO "authenticated" USING (("is_published" = true));



GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";



GRANT ALL ON FUNCTION "public"."_set_updated_at"() TO "service_role";



GRANT ALL ON FUNCTION "public"."_vento_norm"("input" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."_vento_slugify"("input" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."_vento_uuid_from_text"("input" "text") TO "service_role";



REVOKE ALL ON FUNCTION "public"."anonymize_user_personal_data"("p_user_id" "uuid") FROM PUBLIC;
GRANT ALL ON FUNCTION "public"."anonymize_user_personal_data"("p_user_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."apply_inventory_count_adjustments"("p_session_id" "uuid", "p_user_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."apply_inventory_count_adjustments"("p_session_id" "uuid", "p_user_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."apply_inventory_site_count"("p_site_id" "uuid", "p_user_id" "uuid", "p_note" "text", "p_lines" "jsonb") TO "authenticated";
GRANT ALL ON FUNCTION "public"."apply_inventory_site_count"("p_site_id" "uuid", "p_user_id" "uuid", "p_note" "text", "p_lines" "jsonb") TO "service_role";



GRANT ALL ON FUNCTION "public"."apply_restock_receipt"("p_request_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."apply_restock_receipt"("p_request_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."apply_restock_shipment"("p_request_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."apply_restock_shipment"("p_request_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."apply_restock_shipment_from_picks"("p_request_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."apply_restock_shipment_from_picks"("p_request_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."assert_inventory_uom_profile_stock_input"("p_location_id" "uuid", "p_location_position_id" "uuid", "p_product_id" "uuid", "p_uom_profile_id" "uuid", "p_presentation_qty" numeric, "p_base_qty" numeric) TO "authenticated";
GRANT ALL ON FUNCTION "public"."assert_inventory_uom_profile_stock_input"("p_location_id" "uuid", "p_location_position_id" "uuid", "p_product_id" "uuid", "p_uom_profile_id" "uuid", "p_presentation_qty" numeric, "p_base_qty" numeric) TO "service_role";



GRANT ALL ON FUNCTION "public"."assign_inventory_stock_to_location"("p_site_id" "uuid", "p_product_id" "uuid", "p_location_id" "uuid", "p_quantity" numeric, "p_created_by" "uuid", "p_note" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."assign_inventory_stock_to_location"("p_site_id" "uuid", "p_product_id" "uuid", "p_location_id" "uuid", "p_quantity" numeric, "p_created_by" "uuid", "p_note" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."assign_inventory_stock_to_position"("p_location_id" "uuid", "p_product_id" "uuid", "p_position_id" "uuid", "p_quantity" numeric, "p_created_by" "uuid", "p_note" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."assign_inventory_stock_to_position"("p_location_id" "uuid", "p_product_id" "uuid", "p_position_id" "uuid", "p_quantity" numeric, "p_created_by" "uuid", "p_note" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."award_loyalty_points_external"("p_user_id" "uuid", "p_site_id" "uuid", "p_amount_cop" numeric, "p_external_ref" "text", "p_description" "text", "p_metadata" "jsonb") TO "authenticated";
GRANT ALL ON FUNCTION "public"."award_loyalty_points_external"("p_user_id" "uuid", "p_site_id" "uuid", "p_amount_cop" numeric, "p_external_ref" "text", "p_description" "text", "p_metadata" "jsonb") TO "service_role";



GRANT ALL ON FUNCTION "public"."can_access_area"("p_area_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."can_access_area"("p_area_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."can_access_recipe_scope"("p_site_id" "uuid", "p_area_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."can_access_recipe_scope"("p_site_id" "uuid", "p_area_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."can_access_site"("p_site_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."can_access_site"("p_site_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."check_nexo_permissions"("p_employee_id" "uuid", "p_site_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."check_nexo_permissions"("p_employee_id" "uuid", "p_site_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."close_inventory_count_session"("p_session_id" "uuid", "p_closed_by" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."close_inventory_count_session"("p_session_id" "uuid", "p_closed_by" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."close_open_attendance_day_end"("p_timezone" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."close_open_attendance_day_end"("p_timezone" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."compute_restock_item_status"("p_requested_qty" numeric, "p_prepared_qty" numeric, "p_shipped_qty" numeric, "p_received_qty" numeric, "p_shortage_qty" numeric) TO "service_role";



GRANT ALL ON FUNCTION "public"."consume_inventory_stock_by_uom_profile"("p_location_id" "uuid", "p_product_id" "uuid", "p_uom_profile_id" "uuid", "p_presentation_qty" numeric, "p_base_qty" numeric, "p_location_position_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."consume_inventory_stock_by_uom_profile"("p_location_id" "uuid", "p_product_id" "uuid", "p_uom_profile_id" "uuid", "p_presentation_qty" numeric, "p_base_qty" numeric, "p_location_position_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."consume_inventory_stock_from_positions"("p_location_id" "uuid", "p_product_id" "uuid", "p_quantity" numeric, "p_created_by" "uuid", "p_note" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."consume_inventory_stock_from_positions"("p_location_id" "uuid", "p_product_id" "uuid", "p_quantity" numeric, "p_created_by" "uuid", "p_note" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."create_inventory_count_session_with_lines"("p_site_id" "uuid", "p_scope_type" "text", "p_scope_zone" "text", "p_scope_location_id" "uuid", "p_name" "text", "p_created_by" "uuid", "p_lines" "jsonb") TO "authenticated";
GRANT ALL ON FUNCTION "public"."create_inventory_count_session_with_lines"("p_site_id" "uuid", "p_scope_type" "text", "p_scope_zone" "text", "p_scope_location_id" "uuid", "p_name" "text", "p_created_by" "uuid", "p_lines" "jsonb") TO "service_role";



GRANT ALL ON FUNCTION "public"."create_order_checkout_draft"("p_site_id" "uuid", "p_satellite_name" "text", "p_fulfillment_type" "text", "p_contact_name" "text", "p_contact_phone" "text", "p_address_line" "text", "p_address_reference" "text", "p_notes" "text", "p_items" "jsonb", "p_delivery_fee_amount" numeric, "p_source" "text", "p_delivery_distance_km" integer, "p_delivery_quote_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."create_order_checkout_draft"("p_site_id" "uuid", "p_satellite_name" "text", "p_fulfillment_type" "text", "p_contact_name" "text", "p_contact_phone" "text", "p_address_line" "text", "p_address_reference" "text", "p_notes" "text", "p_items" "jsonb", "p_delivery_fee_amount" numeric, "p_source" "text", "p_delivery_distance_km" integer, "p_delivery_quote_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."current_employee_area_id"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."current_employee_area_id"() TO "service_role";



GRANT ALL ON FUNCTION "public"."current_employee_primary_site_id"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."current_employee_primary_site_id"() TO "service_role";



GRANT ALL ON FUNCTION "public"."current_employee_role"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."current_employee_role"() TO "service_role";



GRANT ALL ON FUNCTION "public"."current_employee_selected_area_id"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."current_employee_selected_area_id"() TO "service_role";



GRANT ALL ON FUNCTION "public"."current_employee_selected_site_id"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."current_employee_selected_site_id"() TO "service_role";



GRANT ALL ON FUNCTION "public"."current_employee_site_id"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."current_employee_site_id"() TO "service_role";



GRANT ALL ON FUNCTION "public"."device_info_has_blocking_warnings"("di" "jsonb") TO "authenticated";
GRANT ALL ON FUNCTION "public"."device_info_has_blocking_warnings"("di" "jsonb") TO "service_role";



GRANT ALL ON FUNCTION "public"."employee_wallet_eligibility"("p_employee_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."employee_wallet_eligibility"("p_employee_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."employee_wallet_mark_issued"("p_employee_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."employee_wallet_mark_issued"("p_employee_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."employee_wallet_sync_eligibility"() TO "service_role";



GRANT ALL ON TABLE "public"."attendance_breaks" TO "authenticated";
GRANT ALL ON TABLE "public"."attendance_breaks" TO "service_role";



GRANT ALL ON FUNCTION "public"."end_attendance_break"("p_source" "text", "p_notes" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."end_attendance_break"("p_source" "text", "p_notes" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."enforce_attendance_geofence"() TO "service_role";



GRANT ALL ON FUNCTION "public"."enforce_attendance_sequence"() TO "service_role";



GRANT ALL ON FUNCTION "public"."enforce_employee_inventory_location_assignment_site"() TO "service_role";



GRANT ALL ON FUNCTION "public"."enforce_employee_role_site"() TO "service_role";



GRANT ALL ON FUNCTION "public"."enforce_inventory_location_area_site"() TO "service_role";



GRANT ALL ON FUNCTION "public"."enforce_inventory_location_parent_same_site"() TO "service_role";



GRANT ALL ON FUNCTION "public"."enforce_inventory_location_position_scope"() TO "service_role";



GRANT ALL ON FUNCTION "public"."ensure_order_conversation"("p_order_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."ensure_order_conversation"("p_order_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."fogo_create_production_batch_from_recipe"("p_recipe_card_id" "uuid", "p_produced_qty" numeric, "p_destination_location_id" "uuid", "p_notes" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."fogo_create_production_batch_from_recipe"("p_recipe_card_id" "uuid", "p_produced_qty" numeric, "p_destination_location_id" "uuid", "p_notes" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."fogo_recipe_area_options"("p_site_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."fogo_recipe_area_options"("p_site_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."generate_inventory_sku"("p_product_type" "text", "p_inventory_kind" "text", "p_name" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."generate_inventory_sku"("p_product_type" "text", "p_inventory_kind" "text", "p_name" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."generate_location_code"("p_site_code" "text", "p_zone" "text", "p_aisle" "text", "p_level" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."generate_location_code"("p_site_code" "text", "p_zone" "text", "p_aisle" "text", "p_level" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."generate_lpn_code"("p_site_code" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."generate_lpn_code"("p_site_code" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."generate_product_sku"("p_product_type" "text", "p_site_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."generate_product_sku"("p_product_type" "text", "p_site_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."get_internal_invoice_cutoff_warnings"("p_cutoff_at" timestamp with time zone) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_internal_invoice_cutoff_warnings"("p_cutoff_at" timestamp with time zone) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_my_total_earned_points"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_my_total_earned_points"() TO "service_role";



GRANT ALL ON FUNCTION "public"."get_operational_context"("p_employee_id" "uuid", "p_site_id" "uuid", "p_app_code" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_operational_context"("p_employee_id" "uuid", "p_site_id" "uuid", "p_app_code" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."get_restock_request_operational_summary"("p_request_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_restock_request_operational_summary"("p_request_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."get_site_cost_center"("p_site_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_site_cost_center"("p_site_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."grant_loyalty_points"("p_user_id" "uuid", "p_points" integer, "p_description" "text", "p_metadata" "jsonb") TO "service_role";



GRANT ALL ON FUNCTION "public"."handle_new_user"() TO "service_role";



GRANT ALL ON FUNCTION "public"."has_permission"("p_permission_code" "text", "p_site_id" "uuid", "p_area_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."has_permission"("p_permission_code" "text", "p_site_id" "uuid", "p_area_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."haversine_m"("lat1" numeric, "lon1" numeric, "lat2" numeric, "lon2" numeric) TO "service_role";



GRANT ALL ON FUNCTION "public"."is_active_staff"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."is_active_staff"() TO "service_role";



GRANT ALL ON FUNCTION "public"."is_employee"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."is_employee"() TO "service_role";



GRANT ALL ON FUNCTION "public"."is_global_manager"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."is_global_manager"() TO "service_role";



GRANT ALL ON FUNCTION "public"."is_manager"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."is_manager"() TO "service_role";



GRANT ALL ON FUNCTION "public"."is_manager_or_owner"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."is_manager_or_owner"() TO "service_role";



GRANT ALL ON FUNCTION "public"."is_owner"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."is_owner"() TO "service_role";



GRANT ALL ON FUNCTION "public"."mark_payment_transaction_status"("p_transaction_id" "uuid", "p_provider_reference" "text", "p_status" "text", "p_payload" "jsonb") TO "service_role";



REVOKE ALL ON FUNCTION "public"."nexo_kiosk_withdraw_workers"("p_source_location_id" "uuid") FROM PUBLIC;
GRANT ALL ON FUNCTION "public"."nexo_kiosk_withdraw_workers"("p_source_location_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."nexo_kiosk_withdraw_workers"("p_source_location_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."notify_shift_published"() TO "service_role";



GRANT ALL ON FUNCTION "public"."permission_scope_matches"("p_scope_type" "public"."permission_scope_type", "p_context_site_id" "uuid", "p_context_area_id" "uuid", "p_scope_site_id" "uuid", "p_scope_area_id" "uuid", "p_scope_site_type" "public"."site_type", "p_scope_area_kind" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."permission_scope_matches"("p_scope_type" "public"."permission_scope_type", "p_context_site_id" "uuid", "p_context_area_id" "uuid", "p_scope_site_id" "uuid", "p_scope_area_id" "uuid", "p_scope_site_type" "public"."site_type", "p_scope_area_kind" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."price_restock_request_internal_transfer"("p_request_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."price_restock_request_internal_transfer"("p_request_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."process_loyalty_earning"("p_order_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."process_order_payment"("p_order_id" "uuid", "p_site_id" "uuid", "p_payment_method" "text", "p_payment_reference" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."process_order_payment"("p_order_id" "uuid", "p_site_id" "uuid", "p_payment_method" "text", "p_payment_reference" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."receive_purchase_order"("p_purchase_order_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."receive_purchase_order"("p_purchase_order_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."reconcile_inventory_stock_positions_for_count"("p_location_id" "uuid", "p_lines" "jsonb", "p_created_by" "uuid", "p_note" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."reconcile_inventory_stock_positions_for_count"("p_location_id" "uuid", "p_lines" "jsonb", "p_created_by" "uuid", "p_note" "text") TO "service_role";



REVOKE ALL ON FUNCTION "public"."reconcile_staff_invitations"() FROM PUBLIC;
GRANT ALL ON FUNCTION "public"."reconcile_staff_invitations"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."reconcile_staff_invitations"() TO "service_role";



GRANT ALL ON FUNCTION "public"."register_shift_departure_event"("p_site_id" "uuid", "p_distance_meters" integer, "p_accuracy_meters" integer, "p_source" "text", "p_notes" "text", "p_occurred_at" timestamp with time zone) TO "authenticated";
GRANT ALL ON FUNCTION "public"."register_shift_departure_event"("p_site_id" "uuid", "p_distance_meters" integer, "p_accuracy_meters" integer, "p_source" "text", "p_notes" "text", "p_occurred_at" timestamp with time zone) TO "service_role";



GRANT ALL ON FUNCTION "public"."register_shift_departure_event_autoclose"("p_site_id" "uuid", "p_distance_meters" integer, "p_accuracy_meters" integer, "p_source" "text", "p_notes" "text", "p_occurred_at" timestamp with time zone, "p_auto_checkout_threshold_meters" integer) TO "authenticated";
GRANT ALL ON FUNCTION "public"."register_shift_departure_event_autoclose"("p_site_id" "uuid", "p_distance_meters" integer, "p_accuracy_meters" integer, "p_source" "text", "p_notes" "text", "p_occurred_at" timestamp with time zone, "p_auto_checkout_threshold_meters" integer) TO "service_role";



GRANT ALL ON FUNCTION "public"."resolve_internal_transfer_price"("p_product_id" "uuid", "p_seller_cost_center_id" "uuid", "p_buyer_cost_center_id" "uuid", "p_buyer_site_id" "uuid", "p_unit_code" "text", "p_at" timestamp with time zone) TO "authenticated";
GRANT ALL ON FUNCTION "public"."resolve_internal_transfer_price"("p_product_id" "uuid", "p_seller_cost_center_id" "uuid", "p_buyer_cost_center_id" "uuid", "p_buyer_site_id" "uuid", "p_unit_code" "text", "p_at" timestamp with time zone) TO "service_role";



GRANT ALL ON FUNCTION "public"."resolve_internal_transfer_price_for_profile"("p_product_id" "uuid", "p_seller_cost_center_id" "uuid", "p_buyer_cost_center_id" "uuid", "p_buyer_site_id" "uuid", "p_uom_profile_id" "uuid", "p_unit_code" "text", "p_at" timestamp with time zone) TO "authenticated";
GRANT ALL ON FUNCTION "public"."resolve_internal_transfer_price_for_profile"("p_product_id" "uuid", "p_seller_cost_center_id" "uuid", "p_buyer_cost_center_id" "uuid", "p_buyer_site_id" "uuid", "p_uom_profile_id" "uuid", "p_unit_code" "text", "p_at" timestamp with time zone) TO "service_role";



GRANT ALL ON FUNCTION "public"."resolve_product_sku_brand_code"("p_site_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."resolve_product_sku_type_code"("p_product_type" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."reverse_restock_request"("p_request_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."reverse_restock_request"("p_request_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."run_shift_runtime_processor"() TO "service_role";



GRANT ALL ON FUNCTION "public"."scheduled_auto_close_shift"("p_shift_id" "uuid", "p_triggered_at" timestamp with time zone) TO "service_role";



GRANT ALL ON FUNCTION "public"."seed_catalog_items_from_sell_products"("p_site_id" "uuid", "p_only_missing" boolean) TO "service_role";



GRANT ALL ON FUNCTION "public"."set_app_navigation_items_updated_at"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."set_app_navigation_items_updated_at"() TO "service_role";



REVOKE ALL ON FUNCTION "public"."set_employee_kiosk_pin"("p_employee_id" "uuid", "p_pin" "text") FROM PUBLIC;
GRANT ALL ON FUNCTION "public"."set_employee_kiosk_pin"("p_employee_id" "uuid", "p_pin" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."set_employee_kiosk_pin"("p_employee_id" "uuid", "p_pin" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."set_internal_price_item_uom_snapshot"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."set_internal_price_item_uom_snapshot"() TO "service_role";



GRANT ALL ON FUNCTION "public"."set_product_sku"() TO "service_role";



GRANT ALL ON FUNCTION "public"."set_production_batch_code"() TO "service_role";



GRANT ALL ON FUNCTION "public"."set_updated_at"() TO "service_role";



GRANT ALL ON FUNCTION "public"."split_restock_request_item"("p_item_id" "uuid", "p_split_quantity" numeric) TO "authenticated";
GRANT ALL ON FUNCTION "public"."split_restock_request_item"("p_item_id" "uuid", "p_split_quantity" numeric) TO "service_role";



GRANT ALL ON FUNCTION "public"."start_attendance_break"("p_site_id" "uuid", "p_source" "text", "p_notes" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."start_attendance_break"("p_site_id" "uuid", "p_source" "text", "p_notes" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."sync_attendance_events"("p_events" "jsonb") TO "authenticated";
GRANT ALL ON FUNCTION "public"."sync_attendance_events"("p_events" "jsonb") TO "service_role";



GRANT ALL ON FUNCTION "public"."sync_order_fulfillment_state"() TO "service_role";



GRANT ALL ON FUNCTION "public"."sync_restock_item_status_trigger"() TO "service_role";



GRANT ALL ON FUNCTION "public"."sync_restock_request_status_from_items"("p_request_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."tg_set_updated_at"() TO "service_role";



GRANT ALL ON FUNCTION "public"."touch_order_conversation_from_message"() TO "service_role";



GRANT ALL ON FUNCTION "public"."touch_updated_at"() TO "service_role";



GRANT ALL ON FUNCTION "public"."trg_sync_restock_request_status_from_items"() TO "service_role";



GRANT ALL ON FUNCTION "public"."update_employee_shifts_updated_at"() TO "service_role";



GRANT ALL ON FUNCTION "public"."update_loyalty_balance"() TO "service_role";



GRANT ALL ON FUNCTION "public"."update_order_operational_state"("p_order_id" "uuid", "p_site_id" "uuid", "p_operation" "text", "p_dispatch_partner" "text", "p_dispatch_reference" "text", "p_metadata" "jsonb") TO "authenticated";
GRANT ALL ON FUNCTION "public"."update_order_operational_state"("p_order_id" "uuid", "p_site_id" "uuid", "p_operation" "text", "p_dispatch_partner" "text", "p_dispatch_reference" "text", "p_metadata" "jsonb") TO "service_role";



GRANT ALL ON FUNCTION "public"."update_updated_at"() TO "service_role";



GRANT ALL ON FUNCTION "public"."upsert_inventory_stock_by_location"("p_location_id" "uuid", "p_product_id" "uuid", "p_delta" numeric) TO "authenticated";
GRANT ALL ON FUNCTION "public"."upsert_inventory_stock_by_location"("p_location_id" "uuid", "p_product_id" "uuid", "p_delta" numeric) TO "service_role";



GRANT ALL ON FUNCTION "public"."upsert_inventory_stock_by_uom_profile"("p_location_id" "uuid", "p_product_id" "uuid", "p_uom_profile_id" "uuid", "p_presentation_delta" numeric, "p_base_delta" numeric, "p_location_position_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."upsert_inventory_stock_by_uom_profile"("p_location_id" "uuid", "p_product_id" "uuid", "p_uom_profile_id" "uuid", "p_presentation_delta" numeric, "p_base_delta" numeric, "p_location_position_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."util_column_usage"("p_table" "regclass") TO "service_role";



GRANT ALL ON FUNCTION "public"."validate_product_site_production_location"() TO "service_role";



GRANT ALL ON FUNCTION "public"."validate_restock_request_item_pick"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."validate_restock_request_item_pick"() TO "service_role";



GRANT ALL ON FUNCTION "public"."value_closed_restock_request"("p_request_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."value_closed_restock_request"("p_request_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."value_closed_restock_requests_for_cutoff"("p_cutoff_at" timestamp with time zone) TO "authenticated";
GRANT ALL ON FUNCTION "public"."value_closed_restock_requests_for_cutoff"("p_cutoff_at" timestamp with time zone) TO "service_role";



REVOKE ALL ON FUNCTION "public"."verify_employee_kiosk_pin"("p_employee_id" "uuid", "p_pin" "text") FROM PUBLIC;
GRANT ALL ON FUNCTION "public"."verify_employee_kiosk_pin"("p_employee_id" "uuid", "p_pin" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."verify_employee_kiosk_pin"("p_employee_id" "uuid", "p_pin" "text") TO "service_role";



REVOKE ALL ON FUNCTION "public"."viso_accounting_dashboard"("p_site_id" "uuid", "p_month" "date") FROM PUBLIC;
GRANT ALL ON FUNCTION "public"."viso_accounting_dashboard"("p_site_id" "uuid", "p_month" "date") TO "authenticated";
GRANT ALL ON FUNCTION "public"."viso_accounting_dashboard"("p_site_id" "uuid", "p_month" "date") TO "service_role";



GRANT ALL ON TABLE "public"."product_site_settings" TO "authenticated";
GRANT ALL ON TABLE "public"."product_site_settings" TO "service_role";



GRANT ALL ON TABLE "public"."products" TO "authenticated";
GRANT ALL ON TABLE "public"."products" TO "service_role";



GRANT ALL ON TABLE "public"."recipe_cards" TO "authenticated";
GRANT ALL ON TABLE "public"."recipe_cards" TO "service_role";



GRANT ALL ON TABLE "public"."recipes" TO "authenticated";
GRANT ALL ON TABLE "public"."recipes" TO "service_role";



GRANT ALL ON TABLE "public"."account_deletion_requests" TO "authenticated";
GRANT ALL ON TABLE "public"."account_deletion_requests" TO "service_role";



GRANT ALL ON TABLE "public"."announcements" TO "authenticated";
GRANT ALL ON TABLE "public"."announcements" TO "service_role";



GRANT ALL ON TABLE "public"."app_config" TO "authenticated";
GRANT ALL ON TABLE "public"."app_config" TO "service_role";
GRANT SELECT ON TABLE "public"."app_config" TO "anon";



GRANT ALL ON TABLE "public"."app_content_blocks" TO "authenticated";
GRANT ALL ON TABLE "public"."app_content_blocks" TO "service_role";



GRANT ALL ON TABLE "public"."app_navigation_items" TO "authenticated";
GRANT ALL ON TABLE "public"."app_navigation_items" TO "service_role";



GRANT ALL ON TABLE "public"."app_operation_policies" TO "authenticated";
GRANT ALL ON TABLE "public"."app_operation_policies" TO "service_role";



GRANT ALL ON TABLE "public"."app_permissions" TO "authenticated";
GRANT ALL ON TABLE "public"."app_permissions" TO "service_role";



GRANT ALL ON TABLE "public"."app_runtime_settings" TO "authenticated";
GRANT ALL ON TABLE "public"."app_runtime_settings" TO "service_role";



GRANT ALL ON TABLE "public"."app_update_policies" TO "authenticated";
GRANT ALL ON TABLE "public"."app_update_policies" TO "service_role";
GRANT SELECT ON TABLE "public"."app_update_policies" TO "anon";



GRANT ALL ON TABLE "public"."apps" TO "authenticated";
GRANT ALL ON TABLE "public"."apps" TO "service_role";



GRANT ALL ON TABLE "public"."area_kinds" TO "authenticated";
GRANT ALL ON TABLE "public"."area_kinds" TO "service_role";



GRANT ALL ON TABLE "public"."areas" TO "authenticated";
GRANT ALL ON TABLE "public"."areas" TO "service_role";



GRANT ALL ON TABLE "public"."asistencia_logs" TO "authenticated";
GRANT ALL ON TABLE "public"."asistencia_logs" TO "service_role";



GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."attendance_logs" TO "authenticated";
GRANT ALL ON TABLE "public"."attendance_logs" TO "service_role";



GRANT UPDATE("notes") ON TABLE "public"."attendance_logs" TO "authenticated";



GRANT ALL ON TABLE "public"."attendance_policy" TO "authenticated";
GRANT ALL ON TABLE "public"."attendance_policy" TO "service_role";



GRANT ALL ON TABLE "public"."attendance_shift_events" TO "authenticated";
GRANT ALL ON TABLE "public"."attendance_shift_events" TO "service_role";



GRANT ALL ON TABLE "public"."attendance_sync_conflicts" TO "authenticated";
GRANT ALL ON TABLE "public"."attendance_sync_conflicts" TO "service_role";



GRANT ALL ON TABLE "public"."catalog_item_presentation" TO "authenticated";
GRANT ALL ON TABLE "public"."catalog_item_presentation" TO "service_role";
GRANT SELECT ON TABLE "public"."catalog_item_presentation" TO "anon";



GRANT ALL ON TABLE "public"."catalog_items" TO "authenticated";
GRANT ALL ON TABLE "public"."catalog_items" TO "service_role";



GRANT ALL ON TABLE "public"."commercial_categories" TO "authenticated";
GRANT ALL ON TABLE "public"."commercial_categories" TO "service_role";
GRANT SELECT ON TABLE "public"."commercial_categories" TO "anon";



GRANT ALL ON TABLE "public"."commercial_collection_categories" TO "authenticated";
GRANT ALL ON TABLE "public"."commercial_collection_categories" TO "service_role";
GRANT SELECT ON TABLE "public"."commercial_collection_categories" TO "anon";



GRANT ALL ON TABLE "public"."commercial_collections" TO "authenticated";
GRANT ALL ON TABLE "public"."commercial_collections" TO "service_role";
GRANT SELECT ON TABLE "public"."commercial_collections" TO "anon";



GRANT ALL ON TABLE "public"."cost_centers" TO "authenticated";
GRANT ALL ON TABLE "public"."cost_centers" TO "service_role";



GRANT ALL ON TABLE "public"."document_types" TO "authenticated";
GRANT ALL ON TABLE "public"."document_types" TO "service_role";



GRANT ALL ON TABLE "public"."documents" TO "authenticated";
GRANT ALL ON TABLE "public"."documents" TO "service_role";



GRANT ALL ON TABLE "public"."employee_area_purpose_assignments" TO "authenticated";
GRANT ALL ON TABLE "public"."employee_area_purpose_assignments" TO "service_role";



GRANT ALL ON TABLE "public"."employee_areas" TO "authenticated";
GRANT ALL ON TABLE "public"."employee_areas" TO "service_role";



GRANT ALL ON TABLE "public"."employee_attendance_status" TO "authenticated";
GRANT ALL ON TABLE "public"."employee_attendance_status" TO "service_role";



GRANT ALL ON TABLE "public"."employee_devices" TO "authenticated";
GRANT ALL ON TABLE "public"."employee_devices" TO "service_role";



GRANT ALL ON TABLE "public"."employee_inventory_location_assignments" TO "authenticated";
GRANT ALL ON TABLE "public"."employee_inventory_location_assignments" TO "service_role";



GRANT ALL ON TABLE "public"."employee_permissions" TO "authenticated";
GRANT ALL ON TABLE "public"."employee_permissions" TO "service_role";



GRANT ALL ON TABLE "public"."employee_push_tokens" TO "authenticated";
GRANT ALL ON TABLE "public"."employee_push_tokens" TO "service_role";



GRANT ALL ON TABLE "public"."employee_settings" TO "authenticated";
GRANT ALL ON TABLE "public"."employee_settings" TO "service_role";



GRANT ALL ON TABLE "public"."employee_shifts" TO "authenticated";
GRANT ALL ON TABLE "public"."employee_shifts" TO "service_role";



GRANT ALL ON TABLE "public"."employee_sites" TO "authenticated";
GRANT ALL ON TABLE "public"."employee_sites" TO "service_role";



GRANT ALL ON TABLE "public"."employee_wallet_cards" TO "authenticated";
GRANT ALL ON TABLE "public"."employee_wallet_cards" TO "service_role";



GRANT ALL ON TABLE "public"."employees" TO "authenticated";
GRANT ALL ON TABLE "public"."employees" TO "service_role";



GRANT ALL ON TABLE "public"."internal_job_secrets" TO "service_role";



GRANT ALL ON TABLE "public"."internal_pos_document_lines" TO "authenticated";
GRANT ALL ON TABLE "public"."internal_pos_document_lines" TO "service_role";



GRANT ALL ON TABLE "public"."internal_pos_document_sequences" TO "authenticated";
GRANT ALL ON TABLE "public"."internal_pos_document_sequences" TO "service_role";



GRANT ALL ON TABLE "public"."internal_pos_documents" TO "authenticated";
GRANT ALL ON TABLE "public"."internal_pos_documents" TO "service_role";



GRANT ALL ON TABLE "public"."internal_price_list_items" TO "authenticated";
GRANT ALL ON TABLE "public"."internal_price_list_items" TO "service_role";



GRANT ALL ON TABLE "public"."internal_price_lists" TO "authenticated";
GRANT ALL ON TABLE "public"."internal_price_lists" TO "service_role";



GRANT ALL ON TABLE "public"."internal_transfer_variances" TO "authenticated";
GRANT ALL ON TABLE "public"."internal_transfer_variances" TO "service_role";



GRANT ALL ON TABLE "public"."inventory_cost_policies" TO "authenticated";
GRANT ALL ON TABLE "public"."inventory_cost_policies" TO "service_role";



GRANT ALL ON TABLE "public"."inventory_count_lines" TO "authenticated";
GRANT ALL ON TABLE "public"."inventory_count_lines" TO "service_role";



GRANT ALL ON TABLE "public"."inventory_count_sessions" TO "authenticated";
GRANT ALL ON TABLE "public"."inventory_count_sessions" TO "service_role";



GRANT ALL ON TABLE "public"."inventory_entries" TO "authenticated";
GRANT ALL ON TABLE "public"."inventory_entries" TO "service_role";



GRANT ALL ON TABLE "public"."inventory_entry_items" TO "authenticated";
GRANT ALL ON TABLE "public"."inventory_entry_items" TO "service_role";



GRANT ALL ON TABLE "public"."inventory_form_drafts" TO "authenticated";
GRANT ALL ON TABLE "public"."inventory_form_drafts" TO "service_role";



GRANT ALL ON TABLE "public"."inventory_location_positions" TO "authenticated";
GRANT ALL ON TABLE "public"."inventory_location_positions" TO "service_role";



GRANT ALL ON TABLE "public"."inventory_locations" TO "authenticated";
GRANT ALL ON TABLE "public"."inventory_locations" TO "service_role";



GRANT ALL ON TABLE "public"."inventory_lpn_items" TO "authenticated";
GRANT ALL ON TABLE "public"."inventory_lpn_items" TO "service_role";



GRANT ALL ON TABLE "public"."inventory_lpns" TO "authenticated";
GRANT ALL ON TABLE "public"."inventory_lpns" TO "service_role";



GRANT ALL ON TABLE "public"."inventory_movement_types" TO "authenticated";
GRANT ALL ON TABLE "public"."inventory_movement_types" TO "service_role";



GRANT ALL ON TABLE "public"."inventory_movements" TO "authenticated";
GRANT ALL ON TABLE "public"."inventory_movements" TO "service_role";



GRANT ALL ON SEQUENCE "public"."inventory_sku_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."inventory_sku_seq" TO "service_role";



GRANT ALL ON TABLE "public"."inventory_stock_by_location" TO "authenticated";
GRANT ALL ON TABLE "public"."inventory_stock_by_location" TO "service_role";



GRANT ALL ON TABLE "public"."inventory_stock_by_position" TO "authenticated";
GRANT ALL ON TABLE "public"."inventory_stock_by_position" TO "service_role";



GRANT ALL ON TABLE "public"."inventory_stock_by_site" TO "authenticated";
GRANT ALL ON TABLE "public"."inventory_stock_by_site" TO "service_role";



GRANT ALL ON TABLE "public"."inventory_stock_by_uom_profile" TO "authenticated";
GRANT ALL ON TABLE "public"."inventory_stock_by_uom_profile" TO "service_role";



GRANT ALL ON TABLE "public"."inventory_transfer_items" TO "authenticated";
GRANT ALL ON TABLE "public"."inventory_transfer_items" TO "service_role";



GRANT ALL ON TABLE "public"."inventory_transfers" TO "authenticated";
GRANT ALL ON TABLE "public"."inventory_transfers" TO "service_role";



GRANT ALL ON TABLE "public"."inventory_unit_aliases" TO "authenticated";
GRANT ALL ON TABLE "public"."inventory_unit_aliases" TO "service_role";



GRANT ALL ON TABLE "public"."inventory_units" TO "authenticated";
GRANT ALL ON TABLE "public"."inventory_units" TO "service_role";



GRANT ALL ON TABLE "public"."loyalty_external_sales" TO "authenticated";
GRANT ALL ON TABLE "public"."loyalty_external_sales" TO "service_role";



GRANT ALL ON TABLE "public"."loyalty_redemptions" TO "authenticated";
GRANT ALL ON TABLE "public"."loyalty_redemptions" TO "service_role";



GRANT ALL ON TABLE "public"."loyalty_rewards" TO "authenticated";
GRANT ALL ON TABLE "public"."loyalty_rewards" TO "service_role";



GRANT ALL ON TABLE "public"."loyalty_transactions" TO "authenticated";
GRANT ALL ON TABLE "public"."loyalty_transactions" TO "service_role";



GRANT ALL ON SEQUENCE "public"."lpn_sequence" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."lpn_sequence" TO "service_role";



GRANT ALL ON TABLE "public"."order_conversations" TO "authenticated";
GRANT ALL ON TABLE "public"."order_conversations" TO "service_role";



GRANT ALL ON TABLE "public"."order_items" TO "authenticated";
GRANT ALL ON TABLE "public"."order_items" TO "service_role";



GRANT ALL ON TABLE "public"."order_messages" TO "authenticated";
GRANT ALL ON TABLE "public"."order_messages" TO "service_role";



GRANT ALL ON TABLE "public"."order_status_events" TO "authenticated";
GRANT ALL ON TABLE "public"."order_status_events" TO "service_role";



GRANT ALL ON TABLE "public"."orders" TO "authenticated";
GRANT ALL ON TABLE "public"."orders" TO "service_role";



GRANT ALL ON TABLE "public"."pass_delivery_distance_rates" TO "authenticated";
GRANT ALL ON TABLE "public"."pass_delivery_distance_rates" TO "service_role";
GRANT SELECT ON TABLE "public"."pass_delivery_distance_rates" TO "anon";



GRANT ALL ON TABLE "public"."pass_satellites" TO "authenticated";
GRANT ALL ON TABLE "public"."pass_satellites" TO "service_role";



GRANT ALL ON TABLE "public"."pos_cash_movements" TO "authenticated";
GRANT ALL ON TABLE "public"."pos_cash_movements" TO "service_role";



GRANT ALL ON TABLE "public"."pos_cash_shifts" TO "authenticated";
GRANT ALL ON TABLE "public"."pos_cash_shifts" TO "service_role";



GRANT ALL ON TABLE "public"."pos_modifier_options" TO "authenticated";
GRANT ALL ON TABLE "public"."pos_modifier_options" TO "service_role";



GRANT ALL ON TABLE "public"."pos_modifiers" TO "authenticated";
GRANT ALL ON TABLE "public"."pos_modifiers" TO "service_role";



GRANT ALL ON TABLE "public"."pos_order_item_modifiers" TO "authenticated";
GRANT ALL ON TABLE "public"."pos_order_item_modifiers" TO "service_role";



GRANT ALL ON TABLE "public"."pos_payments" TO "authenticated";
GRANT ALL ON TABLE "public"."pos_payments" TO "service_role";



GRANT ALL ON TABLE "public"."pos_product_modifiers" TO "authenticated";
GRANT ALL ON TABLE "public"."pos_product_modifiers" TO "service_role";



GRANT ALL ON TABLE "public"."pos_session_orders" TO "authenticated";
GRANT ALL ON TABLE "public"."pos_session_orders" TO "service_role";



GRANT ALL ON TABLE "public"."pos_sessions" TO "authenticated";
GRANT ALL ON TABLE "public"."pos_sessions" TO "service_role";



GRANT ALL ON TABLE "public"."pos_table_call_devices" TO "authenticated";
GRANT ALL ON TABLE "public"."pos_table_call_devices" TO "service_role";



GRANT ALL ON TABLE "public"."pos_table_service_calls" TO "authenticated";
GRANT ALL ON TABLE "public"."pos_table_service_calls" TO "service_role";



GRANT ALL ON TABLE "public"."pos_tables" TO "authenticated";
GRANT ALL ON TABLE "public"."pos_tables" TO "service_role";



GRANT ALL ON TABLE "public"."pos_zones" TO "authenticated";
GRANT ALL ON TABLE "public"."pos_zones" TO "service_role";



GRANT ALL ON TABLE "public"."printing_label_templates" TO "authenticated";
GRANT ALL ON TABLE "public"."printing_label_templates" TO "service_role";



GRANT ALL ON TABLE "public"."procurement_agreed_prices" TO "authenticated";
GRANT ALL ON TABLE "public"."procurement_agreed_prices" TO "service_role";



GRANT ALL ON TABLE "public"."procurement_reception_items" TO "authenticated";
GRANT ALL ON TABLE "public"."procurement_reception_items" TO "service_role";



GRANT ALL ON TABLE "public"."procurement_receptions" TO "authenticated";
GRANT ALL ON TABLE "public"."procurement_receptions" TO "service_role";



GRANT ALL ON TABLE "public"."product_asset_maintenance_events" TO "authenticated";
GRANT ALL ON TABLE "public"."product_asset_maintenance_events" TO "service_role";



GRANT ALL ON TABLE "public"."product_asset_profiles" TO "authenticated";
GRANT ALL ON TABLE "public"."product_asset_profiles" TO "service_role";



GRANT ALL ON TABLE "public"."product_asset_transfer_events" TO "authenticated";
GRANT ALL ON TABLE "public"."product_asset_transfer_events" TO "service_role";



GRANT ALL ON TABLE "public"."product_categories" TO "authenticated";
GRANT ALL ON TABLE "public"."product_categories" TO "service_role";



GRANT ALL ON TABLE "public"."product_categories_backup_20260316_preparaciones" TO "authenticated";
GRANT ALL ON TABLE "public"."product_categories_backup_20260316_preparaciones" TO "service_role";



GRANT ALL ON TABLE "public"."product_cost_events" TO "authenticated";
GRANT ALL ON TABLE "public"."product_cost_events" TO "service_role";



GRANT ALL ON TABLE "public"."product_images" TO "authenticated";
GRANT ALL ON TABLE "public"."product_images" TO "service_role";



GRANT ALL ON TABLE "public"."product_inventory_profiles" TO "authenticated";
GRANT ALL ON TABLE "public"."product_inventory_profiles" TO "service_role";



GRANT ALL ON TABLE "public"."product_sku_aliases" TO "authenticated";
GRANT ALL ON TABLE "public"."product_sku_aliases" TO "service_role";



GRANT ALL ON TABLE "public"."product_sku_sequences" TO "authenticated";
GRANT ALL ON TABLE "public"."product_sku_sequences" TO "service_role";



GRANT ALL ON TABLE "public"."product_suppliers" TO "authenticated";
GRANT ALL ON TABLE "public"."product_suppliers" TO "service_role";



GRANT ALL ON TABLE "public"."product_uom_profiles" TO "authenticated";
GRANT ALL ON TABLE "public"."product_uom_profiles" TO "service_role";



GRANT ALL ON TABLE "public"."production_batch_consumptions" TO "authenticated";
GRANT ALL ON TABLE "public"."production_batch_consumptions" TO "service_role";



GRANT ALL ON TABLE "public"."production_batches" TO "authenticated";
GRANT ALL ON TABLE "public"."production_batches" TO "service_role";



GRANT ALL ON TABLE "public"."production_request_items" TO "authenticated";
GRANT ALL ON TABLE "public"."production_request_items" TO "service_role";



GRANT ALL ON TABLE "public"."production_requests" TO "authenticated";
GRANT ALL ON TABLE "public"."production_requests" TO "service_role";



GRANT ALL ON TABLE "public"."purchase_order_items" TO "authenticated";
GRANT ALL ON TABLE "public"."purchase_order_items" TO "service_role";



GRANT ALL ON TABLE "public"."purchase_orders" TO "authenticated";
GRANT ALL ON TABLE "public"."purchase_orders" TO "service_role";



GRANT ALL ON TABLE "public"."recipe_steps" TO "authenticated";
GRANT ALL ON TABLE "public"."recipe_steps" TO "service_role";



GRANT ALL ON TABLE "public"."required_document_rules" TO "authenticated";
GRANT ALL ON TABLE "public"."required_document_rules" TO "service_role";



GRANT ALL ON TABLE "public"."restock_request_item_picks" TO "authenticated";
GRANT ALL ON TABLE "public"."restock_request_item_picks" TO "service_role";



GRANT ALL ON TABLE "public"."restock_request_items" TO "authenticated";
GRANT ALL ON TABLE "public"."restock_request_items" TO "service_role";



GRANT ALL ON TABLE "public"."restock_requests" TO "authenticated";
GRANT ALL ON TABLE "public"."restock_requests" TO "service_role";



GRANT ALL ON TABLE "public"."role_capabilities" TO "authenticated";
GRANT ALL ON TABLE "public"."role_capabilities" TO "service_role";



GRANT ALL ON TABLE "public"."role_permissions" TO "authenticated";
GRANT ALL ON TABLE "public"."role_permissions" TO "service_role";



GRANT ALL ON TABLE "public"."role_site_type_rules" TO "authenticated";
GRANT ALL ON TABLE "public"."role_site_type_rules" TO "service_role";



GRANT ALL ON TABLE "public"."roles" TO "authenticated";
GRANT ALL ON TABLE "public"."roles" TO "service_role";



GRANT ALL ON TABLE "public"."sell_products_by_site" TO "authenticated";
GRANT ALL ON TABLE "public"."sell_products_by_site" TO "service_role";



GRANT ALL ON TABLE "public"."sites" TO "authenticated";
GRANT ALL ON TABLE "public"."sites" TO "service_role";



GRANT ALL ON TABLE "public"."shift_calendar_view" TO "authenticated";
GRANT ALL ON TABLE "public"."shift_calendar_view" TO "service_role";



GRANT ALL ON TABLE "public"."shift_policy" TO "authenticated";
GRANT ALL ON TABLE "public"."shift_policy" TO "service_role";



GRANT ALL ON TABLE "public"."shift_runtime_events" TO "authenticated";
GRANT ALL ON TABLE "public"."shift_runtime_events" TO "service_role";



GRANT ALL ON TABLE "public"."site_area_purpose_rules" TO "authenticated";
GRANT ALL ON TABLE "public"."site_area_purpose_rules" TO "service_role";



GRANT ALL ON TABLE "public"."site_attendance_policy" TO "authenticated";
GRANT ALL ON TABLE "public"."site_attendance_policy" TO "service_role";



GRANT ALL ON TABLE "public"."site_operational_capabilities" TO "authenticated";
GRANT ALL ON TABLE "public"."site_operational_capabilities" TO "service_role";



GRANT ALL ON TABLE "public"."site_production_pick_order" TO "authenticated";
GRANT ALL ON TABLE "public"."site_production_pick_order" TO "service_role";



GRANT ALL ON TABLE "public"."site_purpose_settings" TO "authenticated";
GRANT ALL ON TABLE "public"."site_purpose_settings" TO "service_role";



GRANT ALL ON TABLE "public"."site_supply_routes" TO "authenticated";
GRANT ALL ON TABLE "public"."site_supply_routes" TO "service_role";



GRANT ALL ON TABLE "public"."staff_invitations" TO "authenticated";
GRANT ALL ON TABLE "public"."staff_invitations" TO "service_role";



GRANT ALL ON TABLE "public"."staff_manual_calendar_events" TO "authenticated";
GRANT ALL ON TABLE "public"."staff_manual_calendar_events" TO "service_role";



GRANT ALL ON TABLE "public"."staging_insumos_import" TO "authenticated";
GRANT ALL ON TABLE "public"."staging_insumos_import" TO "service_role";



GRANT ALL ON TABLE "public"."suppliers" TO "authenticated";
GRANT ALL ON TABLE "public"."suppliers" TO "service_role";



GRANT ALL ON TABLE "public"."support_messages" TO "authenticated";
GRANT ALL ON TABLE "public"."support_messages" TO "service_role";



GRANT ALL ON TABLE "public"."support_tickets" TO "authenticated";
GRANT ALL ON TABLE "public"."support_tickets" TO "service_role";



GRANT ALL ON TABLE "public"."user_favorites" TO "authenticated";
GRANT ALL ON TABLE "public"."user_favorites" TO "service_role";



GRANT ALL ON TABLE "public"."user_feedback" TO "authenticated";
GRANT ALL ON TABLE "public"."user_feedback" TO "service_role";



GRANT ALL ON TABLE "public"."users" TO "authenticated";
GRANT ALL ON TABLE "public"."users" TO "service_role";



GRANT ALL ON TABLE "public"."v_inventory_catalog" TO "authenticated";
GRANT ALL ON TABLE "public"."v_inventory_catalog" TO "service_role";



GRANT ALL ON TABLE "public"."v_inventory_stock_by_location" TO "authenticated";
GRANT ALL ON TABLE "public"."v_inventory_stock_by_location" TO "service_role";



GRANT ALL ON TABLE "public"."v_ops_restock_product_gaps" TO "authenticated";
GRANT ALL ON TABLE "public"."v_ops_restock_product_gaps" TO "service_role";



GRANT ALL ON TABLE "public"."v_ops_site_readiness" TO "authenticated";
GRANT ALL ON TABLE "public"."v_ops_site_readiness" TO "service_role";



GRANT ALL ON TABLE "public"."v_procurement_price_book" TO "authenticated";
GRANT ALL ON TABLE "public"."v_procurement_price_book" TO "service_role";



GRANT ALL ON TABLE "public"."wallet_devices" TO "authenticated";
GRANT ALL ON TABLE "public"."wallet_devices" TO "service_role";



GRANT ALL ON TABLE "public"."wallet_passes" TO "authenticated";
GRANT ALL ON TABLE "public"."wallet_passes" TO "service_role";



GRANT ALL ON TABLE "public"."website_blocks" TO "authenticated";
GRANT ALL ON TABLE "public"."website_blocks" TO "service_role";



GRANT ALL ON TABLE "public"."website_items" TO "authenticated";
GRANT ALL ON TABLE "public"."website_items" TO "service_role";



ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "service_role";







