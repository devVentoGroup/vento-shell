alter table public.orders
  add column if not exists schedule_mode text not null default 'immediate',
  add column if not exists delivery_window_start timestamptz,
  add column if not exists delivery_window_end timestamptz,
  add column if not exists prepare_by timestamptz,
  add column if not exists timezone text not null default 'America/Bogota';

alter table public.orders drop constraint if exists orders_schedule_mode_check;
alter table public.orders add constraint orders_schedule_mode_check
  check (schedule_mode in ('immediate', 'scheduled'));

alter table public.orders drop constraint if exists orders_delivery_window_check;
alter table public.orders add constraint orders_delivery_window_check check (
  (schedule_mode = 'immediate' and delivery_window_start is null and delivery_window_end is null)
  or
  (schedule_mode = 'scheduled'
    and delivery_window_start is not null
    and delivery_window_end is not null
    and delivery_window_end > delivery_window_start)
);

create index if not exists orders_site_delivery_window_idx
  on public.orders (site_id, delivery_window_start, delivery_window_end)
  where schedule_mode = 'scheduled' and cancelled_at is null;

create table if not exists pass.site_delivery_slots (
  id uuid primary key default gen_random_uuid(),
  site_id uuid not null references public.sites(id) on delete cascade,
  fulfillment_type text not null,
  iso_weekday smallint not null,
  slot_start time without time zone not null,
  slot_end time without time zone not null,
  capacity integer,
  valid_from date,
  valid_until date,
  is_active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint site_delivery_slots_fulfillment_check
    check (fulfillment_type in ('delivery', 'pickup', 'on_premise')),
  constraint site_delivery_slots_weekday_check
    check (iso_weekday between 1 and 7),
  constraint site_delivery_slots_time_check
    check (slot_end > slot_start),
  constraint site_delivery_slots_capacity_check
    check (capacity is null or capacity > 0),
  constraint site_delivery_slots_validity_check
    check (valid_until is null or valid_from is null or valid_until >= valid_from),
  constraint site_delivery_slots_unique
    unique (site_id, fulfillment_type, iso_weekday, slot_start, slot_end, valid_from)
);

create index if not exists site_delivery_slots_lookup_idx
  on pass.site_delivery_slots (site_id, fulfillment_type, iso_weekday, is_active);

alter table pass.site_delivery_slots enable row level security;
revoke all on table pass.site_delivery_slots from anon, authenticated;

drop function if exists public.get_order_delivery_slots(uuid, text, date, date, jsonb, text);
create function public.get_order_delivery_slots(
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
  v_validation jsonb;
begin
  if v_uid is null then raise exception 'authentication_required'; end if;
  if p_site_id is null then raise exception 'site_required'; end if;
  if lower(trim(coalesce(p_fulfillment_type, ''))) not in ('delivery', 'pickup', 'on_premise') then
    raise exception 'invalid_fulfillment_type';
  end if;
  if v_to < v_from then raise exception 'invalid_date_range'; end if;

  v_validation := pass.validate_order_requested_for(p_site_id, p_items, null);
  v_required_lead := coalesce((v_validation ->> 'required_lead_minutes')::integer, 0);

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

drop function if exists pass.validate_order_schedule(uuid, jsonb, text, text, timestamptz, timestamptz, text);
create function pass.validate_order_schedule(
  p_site_id uuid,
  p_items jsonb,
  p_fulfillment_type text,
  p_schedule_mode text,
  p_window_start timestamptz,
  p_window_end timestamptz,
  p_timezone text default 'America/Bogota'
)
returns jsonb
language plpgsql
security definer
set search_path = public, pass, auth
as $$
declare
  v_mode text := lower(trim(coalesce(p_schedule_mode, 'immediate')));
  v_fulfillment text := lower(trim(coalesce(p_fulfillment_type, '')));
  v_timezone text := coalesce(nullif(trim(p_timezone), ''), 'America/Bogota');
  v_schedule jsonb;
  v_slot pass.site_delivery_slots%rowtype;
  v_reserved integer;
begin
  if auth.uid() is null then raise exception 'authentication_required'; end if;
  if v_mode not in ('immediate', 'scheduled') then raise exception 'invalid_schedule_mode'; end if;

  if v_mode = 'immediate' then
    if p_window_start is not null or p_window_end is not null then
      raise exception 'immediate_order_has_delivery_window';
    end if;
    v_schedule := pass.validate_order_requested_for(p_site_id, p_items, null);
    return v_schedule || jsonb_build_object('schedule_mode', 'immediate');
  end if;

  if p_window_start is null or p_window_end is null then raise exception 'delivery_window_required'; end if;
  if p_window_end <= p_window_start then raise exception 'delivery_window_invalid'; end if;
  if p_window_start <= now() then raise exception 'requested_for_in_past'; end if;

  v_schedule := pass.validate_order_requested_for(p_site_id, p_items, p_window_start);

  select slot.* into v_slot
  from pass.site_delivery_slots slot
  where slot.site_id = p_site_id
    and slot.fulfillment_type = v_fulfillment
    and slot.iso_weekday = extract(isodow from (p_window_start at time zone v_timezone))::smallint
    and slot.slot_start = (p_window_start at time zone v_timezone)::time
    and slot.slot_end = (p_window_end at time zone v_timezone)::time
    and slot.is_active
    and (slot.valid_from is null or (p_window_start at time zone v_timezone)::date >= slot.valid_from)
    and (slot.valid_until is null or (p_window_start at time zone v_timezone)::date <= slot.valid_until)
  limit 1;

  if v_slot.id is null then raise exception 'delivery_slot_unavailable'; end if;

  perform pg_advisory_xact_lock(hashtextextended(
    p_site_id::text || ':' || v_fulfillment || ':' || p_window_start::text || ':' || p_window_end::text,
    0
  ));

  if v_slot.capacity is not null then
    select count(*)::integer into v_reserved
    from public.orders o
    where o.site_id = p_site_id
      and o.schedule_mode = 'scheduled'
      and o.delivery_window_start = p_window_start
      and o.delivery_window_end = p_window_end
      and o.cancelled_at is null
      and o.status not in ('cancelled', 'voided');

    if v_reserved >= v_slot.capacity then raise exception 'delivery_slot_full'; end if;
  end if;

  return v_schedule || jsonb_build_object(
    'schedule_mode', 'scheduled',
    'slot_id', v_slot.id,
    'delivery_window_start', p_window_start,
    'delivery_window_end', p_window_end,
    'timezone', v_timezone
  );
end;
$$;

revoke all on function pass.validate_order_schedule(uuid, jsonb, text, text, timestamptz, timestamptz, text) from public, anon, authenticated;

drop function if exists public.create_scheduled_order_checkout_draft(uuid, text, text, text, text, text, text, text, jsonb, numeric, text, integer, uuid, boolean, jsonb, text, timestamptz, timestamptz, text);
create function public.create_scheduled_order_checkout_draft(
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
  p_schedule_mode text,
  p_delivery_window_start timestamptz,
  p_delivery_window_end timestamptz,
  p_timezone text default 'America/Bogota'
)
returns jsonb
language plpgsql
security definer
set search_path = public, pass, auth
as $$
declare
  v_result jsonb;
  v_order_id uuid;
  v_schedule jsonb;
  v_mode text := lower(trim(coalesce(p_schedule_mode, 'immediate')));
begin
  if auth.uid() is null then raise exception 'authentication_required'; end if;

  v_schedule := pass.validate_order_schedule(
    p_site_id,
    p_items,
    p_fulfillment_type,
    v_mode,
    p_delivery_window_start,
    p_delivery_window_end,
    p_timezone
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
  if v_order_id is null then raise exception 'order_creation_failed'; end if;

  update public.orders
  set schedule_mode = v_mode,
      requested_for = case when v_mode = 'scheduled' then p_delivery_window_start else null end,
      delivery_window_start = case when v_mode = 'scheduled' then p_delivery_window_start else null end,
      delivery_window_end = case when v_mode = 'scheduled' then p_delivery_window_end else null end,
      timezone = coalesce(nullif(trim(p_timezone), ''), 'America/Bogota')
  where id = v_order_id and client_id = auth.uid();

  if not found then raise exception 'order_schedule_update_failed'; end if;

  return v_result || jsonb_build_object(
    'schedule_mode', v_mode,
    'requested_for', case when v_mode = 'scheduled' then p_delivery_window_start else null end,
    'delivery_window_start', case when v_mode = 'scheduled' then p_delivery_window_start else null end,
    'delivery_window_end', case when v_mode = 'scheduled' then p_delivery_window_end else null end,
    'timezone', coalesce(nullif(trim(p_timezone), ''), 'America/Bogota'),
    'required_lead_minutes', coalesce((v_schedule ->> 'required_lead_minutes')::integer, 0)
  );
end;
$$;

revoke all on function public.create_scheduled_order_checkout_draft(uuid, text, text, text, text, text, text, text, jsonb, numeric, text, integer, uuid, boolean, jsonb, text, timestamptz, timestamptz, text) from public, anon;
grant execute on function public.create_scheduled_order_checkout_draft(uuid, text, text, text, text, text, text, text, jsonb, numeric, text, integer, uuid, boolean, jsonb, text, timestamptz, timestamptz, text) to authenticated;
