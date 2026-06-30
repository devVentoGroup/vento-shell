begin;

create or replace function public.close_open_attendance_day_end(
  p_timezone text default 'America/Bogota'::text
)
returns integer
language plpgsql
security definer
set search_path = public
as $$
declare
  v_today date := (now() at time zone p_timezone)::date;
  v_closed int := 0;
begin
  with last_logs as (
    select distinct on (al.employee_id)
      al.employee_id,
      al.site_id,
      al.action,
      al.occurred_at,
      al.shift_id,
      (((al.occurred_at at time zone p_timezone)::date + 1)::timestamp - interval '1 second') at time zone p_timezone as local_day_end
    from public.attendance_logs al
    join public.employees e on e.id = al.employee_id
    where coalesce(e.is_active, false) = true
    order by al.employee_id, al.occurred_at desc, al.created_at desc
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
      notes,
      shift_id
    )
    select
      l.employee_id,
      l.site_id,
      'check_out',
      'system',
      l.local_day_end,
      s.latitude,
      s.longitude,
      0,
      jsonb_build_object(
        'auto_close',
        true,
        'reason',
        'day_end',
        'timezone',
        p_timezone
      ),
      'Cierre automatico: turno abierto cerrado por el sistema al final del dia',
      l.shift_id
    from last_logs l
    join public.sites s on s.id = l.site_id
    where l.action = 'check_in'
      and (l.occurred_at at time zone p_timezone)::date < v_today
      and not exists (
        select 1
        from public.attendance_logs ao
        where ao.employee_id = l.employee_id
          and ao.action = 'check_out'
          and ao.occurred_at > l.occurred_at
          and ao.occurred_at <= l.local_day_end
      )
    returning 1
  )
  select count(*) into v_closed from inserted;

  return v_closed;
end;
$$;

comment on function public.close_open_attendance_day_end(text) is
  'Cierra turnos abiertos de dias locales anteriores al final exacto del dia del check-in para empleados activos.';

select public.close_open_attendance_day_end('America/Bogota');

commit;
