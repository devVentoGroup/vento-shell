create or replace function pass.reschedule_scheduled_order_admin(
  p_site_id uuid,
  p_order_id uuid,
  p_exception_date date,
  p_new_window_start timestamptz,
  p_new_window_end timestamptz,
  p_decided_by uuid,
  p_note text default null,
  p_timezone text default 'America/Bogota'
) returns void
language plpgsql
security definer
set search_path = public, pass, auth
as $$
declare
  v_order public.orders%rowtype;
  v_exception pass.site_schedule_exceptions%rowtype;
  v_local_start timestamp without time zone;
  v_local_end timestamp without time zone;
  v_local_date date;
  v_open time;
  v_close time;
  v_exception_type text;
  v_prepare_offset interval;
begin
  if p_site_id is null or p_order_id is null or p_exception_date is null or p_decided_by is null then
    raise exception 'required_fields_missing';
  end if;
  if p_new_window_start is null or p_new_window_end is null or p_new_window_end <= p_new_window_start then
    raise exception 'delivery_window_invalid';
  end if;
  if p_new_window_start <= now() or p_new_window_end - p_new_window_start <> interval '30 minutes' then
    raise exception 'delivery_window_invalid';
  end if;

  select * into v_order
  from public.orders
  where id = p_order_id
    and site_id = p_site_id
    and schedule_mode = 'scheduled'
    and status <> 'cancelled'
    and voided_at is null
  for update;

  if not found then raise exception 'order_not_found'; end if;

  select * into v_exception
  from pass.site_schedule_exceptions
  where site_id = p_site_id and exception_date = p_exception_date;

  if not found then raise exception 'source_exception_not_found'; end if;
  if (v_order.delivery_window_start at time zone p_timezone)::date <> p_exception_date then
    raise exception 'source_exception_mismatch';
  end if;

  v_local_start := p_new_window_start at time zone p_timezone;
  v_local_end := p_new_window_end at time zone p_timezone;
  v_local_date := v_local_start::date;

  if v_local_end::date <> v_local_date
     or extract(second from v_local_start) <> 0
     or extract(minute from v_local_start)::integer not in (0, 30) then
    raise exception 'delivery_slot_unavailable';
  end if;

  select ex.exception_type, ex.opens_at, ex.closes_at
  into v_exception_type, v_open, v_close
  from pass.site_schedule_exceptions ex
  where ex.site_id = p_site_id and ex.exception_date = v_local_date;

  if v_exception_type = 'closed' then
    raise exception 'site_closed';
  elsif v_exception_type is distinct from 'special_hours' then
    select h.opens_at, h.closes_at into v_open, v_close
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

  v_prepare_offset := case
    when v_order.prepare_by is not null and v_order.delivery_window_start is not null
      then greatest(v_order.delivery_window_start - v_order.prepare_by, interval '0 minutes')
    else interval '0 minutes'
  end;

  update public.orders
  set requested_for = p_new_window_start,
      delivery_window_start = p_new_window_start,
      delivery_window_end = p_new_window_end,
      prepare_by = p_new_window_start - v_prepare_offset,
      timezone = coalesce(nullif(trim(p_timezone), ''), 'America/Bogota'),
      updated_at = now()
  where id = p_order_id;

  insert into pass.site_schedule_exception_resolutions (
    site_id, order_id, exception_date, decision, note, decided_by, decided_at, updated_at,
    previous_window_start, previous_window_end, new_window_start, new_window_end
  ) values (
    p_site_id, p_order_id, p_exception_date, 'rescheduled', nullif(trim(coalesce(p_note, '')), ''),
    p_decided_by, now(), now(), v_order.delivery_window_start, v_order.delivery_window_end,
    p_new_window_start, p_new_window_end
  )
  on conflict (order_id, exception_date) do update
  set decision = excluded.decision,
      note = excluded.note,
      decided_by = excluded.decided_by,
      decided_at = excluded.decided_at,
      updated_at = excluded.updated_at,
      previous_window_start = excluded.previous_window_start,
      previous_window_end = excluded.previous_window_end,
      new_window_start = excluded.new_window_start,
      new_window_end = excluded.new_window_end;
end;
$$;

revoke all on function pass.reschedule_scheduled_order_admin(uuid, uuid, date, timestamptz, timestamptz, uuid, text, text) from public, anon, authenticated;
grant execute on function pass.reschedule_scheduled_order_admin(uuid, uuid, date, timestamptz, timestamptz, uuid, text, text) to service_role;