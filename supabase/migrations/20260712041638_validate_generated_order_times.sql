create or replace function pass.validate_order_schedule(
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
set search_path = 'public', 'pass', 'auth'
as $$
declare
  v_mode text := lower(trim(coalesce(p_schedule_mode, 'immediate')));
  v_fulfillment text := lower(trim(coalesce(p_fulfillment_type, '')));
  v_timezone text := coalesce(nullif(trim(p_timezone), ''), 'America/Bogota');
  v_schedule jsonb;
  v_local_start timestamp without time zone;
  v_local_end timestamp without time zone;
  v_local_date date;
  v_open time;
  v_close time;
  v_exception_type text;
  v_slot_id uuid;
begin
  if auth.uid() is null then raise exception 'authentication_required'; end if;
  if p_site_id is null then raise exception 'site_required'; end if;
  if v_fulfillment not in ('delivery', 'pickup', 'on_premise') then raise exception 'invalid_fulfillment_type'; end if;
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
  if p_window_end - p_window_start <> interval '30 minutes' then raise exception 'delivery_window_invalid'; end if;

  v_local_start := p_window_start at time zone v_timezone;
  v_local_end := p_window_end at time zone v_timezone;
  v_local_date := v_local_start::date;

  if v_local_end::date <> v_local_date
     or extract(second from v_local_start) <> 0
     or extract(minute from v_local_start)::integer not in (0, 30) then
    raise exception 'delivery_slot_unavailable';
  end if;

  select ex.exception_type, ex.opens_at, ex.closes_at
  into v_exception_type, v_open, v_close
  from pass.site_schedule_exceptions ex
  where ex.site_id = p_site_id
    and ex.exception_date = v_local_date;

  if v_exception_type = 'closed' then
    raise exception 'site_closed';
  elsif v_exception_type is distinct from 'special_hours' then
    select h.opens_at, h.closes_at
    into v_open, v_close
    from pass.site_business_hours h
    where h.site_id = p_site_id
      and h.iso_weekday = extract(isodow from v_local_date)::smallint
      and h.is_closed = false;
  end if;

  if v_open is null or v_close is null
     or v_local_start::time < v_open
     or v_local_end::time > v_close then
    raise exception 'delivery_slot_unavailable';
  end if;

  v_schedule := pass.validate_order_requested_for(p_site_id, p_items, p_window_start);

  v_slot_id := (
    substr(md5(p_site_id::text || ':' || v_fulfillment || ':' || p_window_start::text || ':' || p_window_end::text), 1, 8) || '-' ||
    substr(md5(p_site_id::text || ':' || v_fulfillment || ':' || p_window_start::text || ':' || p_window_end::text), 9, 4) || '-' ||
    substr(md5(p_site_id::text || ':' || v_fulfillment || ':' || p_window_start::text || ':' || p_window_end::text), 13, 4) || '-' ||
    substr(md5(p_site_id::text || ':' || v_fulfillment || ':' || p_window_start::text || ':' || p_window_end::text), 17, 4) || '-' ||
    substr(md5(p_site_id::text || ':' || v_fulfillment || ':' || p_window_start::text || ':' || p_window_end::text), 21, 12)
  )::uuid;

  return v_schedule || jsonb_build_object(
    'schedule_mode', 'scheduled',
    'slot_id', v_slot_id,
    'delivery_window_start', p_window_start,
    'delivery_window_end', p_window_end,
    'timezone', v_timezone
  );
end;
$$;