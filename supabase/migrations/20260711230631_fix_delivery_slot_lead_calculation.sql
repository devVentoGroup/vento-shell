create or replace function pass.order_required_lead_minutes(
  p_site_id uuid,
  p_items jsonb
)
returns integer
language plpgsql
security definer
set search_path = pass, public, auth
as $$
declare
  v_item jsonb;
  v_catalog_item_id uuid;
  v_metadata jsonb;
  v_raw_lead text;
  v_lead integer;
  v_required integer := 0;
  v_requires_scheduling boolean;
begin
  if auth.uid() is null then raise exception 'authentication_required'; end if;
  if p_site_id is null then raise exception 'site_required'; end if;
  if jsonb_typeof(p_items) <> 'array' or jsonb_array_length(p_items) = 0 then
    raise exception 'items_required';
  end if;

  for v_item in select * from jsonb_array_elements(p_items)
  loop
    v_catalog_item_id := nullif(v_item ->> 'catalog_item_id', '')::uuid;
    if v_catalog_item_id is null then continue; end if;

    select coalesce(item.metadata, '{}'::jsonb)
    into v_metadata
    from pass.catalog_items item
    where item.id = v_catalog_item_id
      and item.site_id = p_site_id
      and item.is_active = true;

    if not found then raise exception 'catalog_item_invalid'; end if;

    v_raw_lead := nullif(trim(coalesce(v_metadata ->> 'minimum_lead_minutes', '')), '');
    if v_raw_lead is null then
      v_lead := 0;
    elsif v_raw_lead ~ '^[0-9]+$' then
      v_lead := v_raw_lead::integer;
    else
      raise exception 'catalog_item_invalid_lead_time';
    end if;

    v_requires_scheduling :=
      lower(coalesce(v_metadata ->> 'availability_mode', 'immediate')) = 'made_to_order'
      or lower(coalesce(v_metadata ->> 'scheduling_required', 'false')) = 'true'
      or v_lead > 0;

    if v_requires_scheduling and v_lead <= 0 then
      raise exception 'catalog_item_invalid_lead_time';
    end if;

    if v_requires_scheduling then
      v_required := greatest(v_required, v_lead);
    end if;
  end loop;

  return v_required;
end;
$$;

revoke all on function pass.order_required_lead_minutes(uuid, jsonb) from public, anon, authenticated;

create or replace function public.get_order_delivery_slots(
  p_site_id uuid,
  p_fulfillment_type text,
  p_from_date date,
  p_to_date date,
  p_items jsonb,
  p_timezone text default 'America/Bogota'
)
returns table (
  slot_id uuid,
  window_start timestamptz,
  window_end timestamptz,
  capacity integer,
  remaining_capacity integer
)
language plpgsql
security definer
set search_path = public, pass, auth
as $$
declare
  v_uid uuid := auth.uid();
  v_timezone text := coalesce(nullif(trim(p_timezone), ''), 'America/Bogota');
  v_from date := greatest(coalesce(p_from_date, (now() at time zone v_timezone)::date), (now() at time zone v_timezone)::date);
  v_to date := least(coalesce(p_to_date, v_from + 30), v_from + 60);
  v_required_lead integer := 0;
begin
  if v_uid is null then raise exception 'authentication_required'; end if;
  if p_site_id is null then raise exception 'site_required'; end if;
  if lower(trim(coalesce(p_fulfillment_type, ''))) not in ('delivery', 'pickup', 'on_premise') then
    raise exception 'invalid_fulfillment_type';
  end if;
  if v_to < v_from then raise exception 'invalid_date_range'; end if;

  v_required_lead := pass.order_required_lead_minutes(p_site_id, p_items);

  return query
  with dates as (
    select generate_series(v_from, v_to, interval '1 day')::date as local_date
  ), candidates as (
    select
      slot.id as slot_id,
      (d.local_date + slot.slot_start) at time zone v_timezone as window_start,
      (d.local_date + slot.slot_end) at time zone v_timezone as window_end,
      slot.capacity
    from dates d
    join pass.site_delivery_slots slot
      on slot.site_id = p_site_id
     and slot.fulfillment_type = lower(trim(p_fulfillment_type))
     and slot.iso_weekday = extract(isodow from d.local_date)::smallint
     and slot.is_active
     and (slot.valid_from is null or d.local_date >= slot.valid_from)
     and (slot.valid_until is null or d.local_date <= slot.valid_until)
  ), counted as (
    select
      c.*,
      count(o.id)::integer as reserved
    from candidates c
    left join public.orders o
      on o.site_id = p_site_id
     and o.schedule_mode = 'scheduled'
     and o.delivery_window_start = c.window_start
     and o.delivery_window_end = c.window_end
     and o.cancelled_at is null
     and o.status not in ('cancelled', 'voided')
    group by c.slot_id, c.window_start, c.window_end, c.capacity
  )
  select
    counted.slot_id,
    counted.window_start,
    counted.window_end,
    counted.capacity,
    case when counted.capacity is null then null else greatest(counted.capacity - counted.reserved, 0) end
  from counted
  where counted.window_start >= now() + make_interval(mins => v_required_lead)
    and (counted.capacity is null or counted.reserved < counted.capacity)
  order by counted.window_start;
end;
$$;

revoke all on function public.get_order_delivery_slots(uuid, text, date, date, jsonb, text) from public, anon;
grant execute on function public.get_order_delivery_slots(uuid, text, date, date, jsonb, text) to authenticated;