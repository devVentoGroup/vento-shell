create or replace function public.get_order_delivery_slots(
  p_site_id uuid,
  p_fulfillment_type text,
  p_from_date date,
  p_to_date date,
  p_items jsonb,
  p_timezone text default 'America/Bogota'
)
returns table(
  slot_id uuid,
  window_start timestamptz,
  window_end timestamptz,
  capacity integer,
  remaining_capacity integer
)
language plpgsql
security definer
set search_path = 'public', 'pass', 'auth'
as $$
declare
  v_uid uuid := auth.uid();
  v_timezone text := coalesce(nullif(trim(p_timezone), ''), 'America/Bogota');
  v_fulfillment text := lower(trim(coalesce(p_fulfillment_type, '')));
  v_today date := (now() at time zone v_timezone)::date;
  v_from date := greatest(coalesce(p_from_date, v_today), v_today);
  v_to date := least(coalesce(p_to_date, v_from + 30), v_from + 60);
  v_required_lead integer := 0;
begin
  if v_uid is null then raise exception 'authentication_required'; end if;
  if p_site_id is null then raise exception 'site_required'; end if;
  if v_fulfillment not in ('delivery', 'pickup', 'on_premise') then raise exception 'invalid_fulfillment_type'; end if;
  if v_to < v_from then raise exception 'invalid_date_range'; end if;

  v_required_lead := pass.order_required_lead_minutes(p_site_id, p_items);

  return query
  with dates as (
    select generate_series(v_from, v_to, interval '1 day')::date as local_date
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
  ), candidates as (
    select
      g.local_start at time zone v_timezone as window_start,
      g.local_end at time zone v_timezone as window_end
    from generated g
  )
  select
    (
      substr(md5(p_site_id::text || ':' || v_fulfillment || ':' || c.window_start::text || ':' || c.window_end::text), 1, 8) || '-' ||
      substr(md5(p_site_id::text || ':' || v_fulfillment || ':' || c.window_start::text || ':' || c.window_end::text), 9, 4) || '-' ||
      substr(md5(p_site_id::text || ':' || v_fulfillment || ':' || c.window_start::text || ':' || c.window_end::text), 13, 4) || '-' ||
      substr(md5(p_site_id::text || ':' || v_fulfillment || ':' || c.window_start::text || ':' || c.window_end::text), 17, 4) || '-' ||
      substr(md5(p_site_id::text || ':' || v_fulfillment || ':' || c.window_start::text || ':' || c.window_end::text), 21, 12)
    )::uuid,
    c.window_start,
    c.window_end,
    null::integer,
    null::integer
  from candidates c
  where c.window_start >= now() + make_interval(mins => v_required_lead)
  order by c.window_start;
end;
$$;