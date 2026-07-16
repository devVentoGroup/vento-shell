create or replace function pass.get_order_reschedule_slots_admin(
  p_site_id uuid,
  p_from_date date default null,
  p_to_date date default null,
  p_timezone text default 'America/Bogota'
)
returns table(window_start timestamptz, window_end timestamptz)
language sql
security definer
set search_path = public, pass, auth
as $$
  with bounds as (
    select
      greatest(coalesce(p_from_date, (now() at time zone p_timezone)::date), (now() at time zone p_timezone)::date) as from_date,
      least(coalesce(p_to_date, (now() at time zone p_timezone)::date + 30), (now() at time zone p_timezone)::date + 60) as to_date
  ), dates as (
    select generate_series(b.from_date, b.to_date, interval '1 day')::date as local_date
    from bounds b
  ), effective_hours as (
    select
      d.local_date,
      case
        when ex.exception_type = 'closed' then null
        when ex.exception_type = 'special_hours' then ex.opens_at
        when coalesce(h.is_closed, true) then null
        else h.opens_at
      end as opens_at,
      case
        when ex.exception_type = 'closed' then null
        when ex.exception_type = 'special_hours' then ex.closes_at
        when coalesce(h.is_closed, true) then null
        else h.closes_at
      end as closes_at
    from dates d
    left join pass.site_business_hours h
      on h.site_id = p_site_id
     and h.iso_weekday = extract(isodow from d.local_date)::smallint
    left join pass.site_schedule_exceptions ex
      on ex.site_id = p_site_id
     and ex.exception_date = d.local_date
  ), generated as (
    select
      gs::timestamp without time zone as local_start,
      (gs + interval '30 minutes')::timestamp without time zone as local_end
    from effective_hours e
    cross join lateral generate_series(
      e.local_date + e.opens_at,
      e.local_date + e.closes_at - interval '30 minutes',
      interval '30 minutes'
    ) gs
    where e.opens_at is not null
      and e.closes_at is not null
      and e.closes_at > e.opens_at
  )
  select
    g.local_start at time zone p_timezone,
    g.local_end at time zone p_timezone
  from generated g
  where g.local_start at time zone p_timezone > now()
  order by 1;
$$;

revoke all on function pass.get_order_reschedule_slots_admin(uuid,date,date,text) from public, anon, authenticated;
grant execute on function pass.get_order_reschedule_slots_admin(uuid,date,date,text) to service_role;