create or replace function pass.validate_order_requested_for(
  p_site_id uuid,
  p_items jsonb,
  p_requested_for timestamptz
)
returns jsonb
language plpgsql
security definer
set search_path to 'pass', 'public', 'auth'
as $$
declare
  v_item jsonb;
  v_catalog_item_id uuid;
  v_metadata jsonb;
  v_raw_lead text;
  v_minimum_lead_minutes integer;
  v_required_lead_minutes integer := 0;
  v_requires_scheduling boolean;
  v_now timestamptz := now();
  v_earliest_requested_for timestamptz;
begin
  if p_site_id is null then
    raise exception 'site_required';
  end if;

  if jsonb_typeof(p_items) <> 'array' or jsonb_array_length(p_items) = 0 then
    raise exception 'items_required';
  end if;

  for v_item in select * from jsonb_array_elements(p_items)
  loop
    v_catalog_item_id := nullif(v_item ->> 'catalog_item_id', '')::uuid;

    if v_catalog_item_id is null then
      continue;
    end if;

    select coalesce(item.metadata, '{}'::jsonb)
    into v_metadata
    from pass.catalog_items item
    where item.id = v_catalog_item_id
      and item.site_id = p_site_id
      and item.is_active = true;

    if not found then
      raise exception 'catalog_item_invalid';
    end if;

    v_raw_lead := nullif(trim(coalesce(v_metadata ->> 'minimum_lead_minutes', '')), '');

    if v_raw_lead is null then
      v_minimum_lead_minutes := 0;
    elsif v_raw_lead ~ '^[0-9]+$' then
      v_minimum_lead_minutes := v_raw_lead::integer;
    else
      raise exception 'catalog_item_invalid_lead_time';
    end if;

    v_requires_scheduling :=
      lower(coalesce(v_metadata ->> 'availability_mode', 'immediate')) = 'made_to_order'
      or lower(coalesce(v_metadata ->> 'scheduling_required', 'false')) = 'true'
      or v_minimum_lead_minutes > 0;

    if v_requires_scheduling and v_minimum_lead_minutes <= 0 then
      raise exception 'catalog_item_invalid_lead_time';
    end if;

    if v_requires_scheduling then
      v_required_lead_minutes := greatest(v_required_lead_minutes, v_minimum_lead_minutes);
    end if;
  end loop;

  if p_requested_for is not null and p_requested_for < v_now then
    raise exception 'requested_for_in_past';
  end if;

  if v_required_lead_minutes > 0 then
    if p_requested_for is null then
      raise exception 'requested_for_required';
    end if;

    v_earliest_requested_for := v_now + make_interval(mins => v_required_lead_minutes);

    if p_requested_for < v_earliest_requested_for then
      raise exception 'requested_for_too_soon';
    end if;
  end if;

  return jsonb_build_object(
    'required_lead_minutes', v_required_lead_minutes,
    'requested_for', p_requested_for,
    'earliest_requested_for', case
      when v_required_lead_minutes > 0 then v_now + make_interval(mins => v_required_lead_minutes)
      else null
    end
  );
end;
$$;

revoke all on function pass.validate_order_requested_for(uuid, jsonb, timestamptz) from public;
grant execute on function pass.validate_order_requested_for(uuid, jsonb, timestamptz) to authenticated, service_role;

create or replace function public.create_order_checkout_draft(
  p_site_id uuid,
  p_satellite_name text,
  p_fulfillment_type text,
  p_contact_name text,
  p_contact_phone text,
  p_address_line text,
  p_address_reference text,
  p_notes text,
  p_items jsonb,
  p_delivery_fee_amount numeric,
  p_source text,
  p_delivery_distance_km integer,
  p_delivery_quote_id uuid,
  p_requested_for timestamptz
)
returns jsonb
language plpgsql
security definer
set search_path to 'public', 'auth', 'pass'
as $$
declare
  v_result jsonb;
  v_order_id uuid;
  v_schedule jsonb;
begin
  v_schedule := pass.validate_order_requested_for(
    p_site_id,
    p_items,
    p_requested_for
  );

  v_result := public.create_order_checkout_draft(
    p_site_id,
    p_satellite_name,
    p_fulfillment_type,
    p_contact_name,
    p_contact_phone,
    p_address_line,
    p_address_reference,
    p_notes,
    p_items,
    p_delivery_fee_amount,
    p_source,
    p_delivery_distance_km,
    p_delivery_quote_id
  );

  v_order_id := nullif(v_result ->> 'order_id', '')::uuid;
  if v_order_id is null then
    raise exception 'order_creation_failed';
  end if;

  update public.orders
  set requested_for = p_requested_for
  where id = v_order_id
    and client_id = auth.uid();

  if not found then
    raise exception 'order_requested_for_update_failed';
  end if;

  return v_result || jsonb_build_object(
    'requested_for', p_requested_for,
    'required_lead_minutes', coalesce((v_schedule ->> 'required_lead_minutes')::integer, 0)
  );
end;
$$;

revoke all on function public.create_order_checkout_draft(uuid, text, text, text, text, text, text, text, jsonb, numeric, text, integer, uuid, timestamptz) from public;
grant execute on function public.create_order_checkout_draft(uuid, text, text, text, text, text, text, text, jsonb, numeric, text, integer, uuid, timestamptz) to authenticated, service_role;

create or replace function public.create_order_checkout_draft(
  p_site_id uuid,
  p_satellite_name text,
  p_fulfillment_type text,
  p_contact_name text,
  p_contact_phone text,
  p_address_line text,
  p_address_reference text,
  p_notes text,
  p_items jsonb,
  p_delivery_fee_amount numeric,
  p_source text,
  p_delivery_distance_km integer,
  p_delivery_quote_id uuid,
  p_invoice_requested boolean,
  p_billing_data jsonb,
  p_requested_for timestamptz
)
returns jsonb
language plpgsql
security definer
set search_path to 'public', 'auth', 'pass'
as $$
declare
  v_result jsonb;
  v_order_id uuid;
  v_schedule jsonb;
begin
  v_schedule := pass.validate_order_requested_for(
    p_site_id,
    p_items,
    p_requested_for
  );

  v_result := public.create_order_checkout_draft(
    p_site_id,
    p_satellite_name,
    p_fulfillment_type,
    p_contact_name,
    p_contact_phone,
    p_address_line,
    p_address_reference,
    p_notes,
    p_items,
    p_delivery_fee_amount,
    p_source,
    p_delivery_distance_km,
    p_delivery_quote_id,
    p_invoice_requested,
    p_billing_data
  );

  v_order_id := nullif(v_result ->> 'order_id', '')::uuid;
  if v_order_id is null then
    raise exception 'order_creation_failed';
  end if;

  update public.orders
  set requested_for = p_requested_for
  where id = v_order_id
    and client_id = auth.uid();

  if not found then
    raise exception 'order_requested_for_update_failed';
  end if;

  return v_result || jsonb_build_object(
    'requested_for', p_requested_for,
    'required_lead_minutes', coalesce((v_schedule ->> 'required_lead_minutes')::integer, 0)
  );
end;
$$;

revoke all on function public.create_order_checkout_draft(uuid, text, text, text, text, text, text, text, jsonb, numeric, text, integer, uuid, boolean, jsonb, timestamptz) from public;
grant execute on function public.create_order_checkout_draft(uuid, text, text, text, text, text, text, text, jsonb, numeric, text, integer, uuid, boolean, jsonb, timestamptz) to authenticated, service_role;

comment on function pass.validate_order_requested_for(uuid, jsonb, timestamptz)
is 'Validates requested_for against authoritative catalog item scheduling metadata and returns the maximum required lead time.';

comment on function public.create_order_checkout_draft(uuid, text, text, text, text, text, text, text, jsonb, numeric, text, integer, uuid, timestamptz)
is 'Backward-compatible checkout overload that validates and persists orders.requested_for.';

comment on function public.create_order_checkout_draft(uuid, text, text, text, text, text, text, text, jsonb, numeric, text, integer, uuid, boolean, jsonb, timestamptz)
is 'Invoice-aware checkout overload that validates and persists orders.requested_for.';