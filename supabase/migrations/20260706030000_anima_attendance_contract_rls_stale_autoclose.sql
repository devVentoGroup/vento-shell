begin;

grant usage on schema public to authenticated;

grant select on public.sites to authenticated;
grant select on public.site_attendance_policy to authenticated;
grant select, insert on public.attendance_logs to authenticated;
grant select, insert on public.attendance_shift_events to authenticated;
grant select, update on public.attendance_breaks to authenticated;

alter table public.attendance_logs enable row level security;
alter table public.site_attendance_policy enable row level security;
alter table public.attendance_shift_events enable row level security;
alter table public.attendance_breaks enable row level security;

drop policy if exists attendance_logs_employee_select_own_v20260706 on public.attendance_logs;
create policy attendance_logs_employee_select_own_v20260706
on public.attendance_logs
for select
to authenticated
using (employee_id = auth.uid());

drop policy if exists attendance_logs_employee_insert_own_v20260706 on public.attendance_logs;
create policy attendance_logs_employee_insert_own_v20260706
on public.attendance_logs
for insert
to authenticated
with check (employee_id = auth.uid());

drop policy if exists site_attendance_policy_authenticated_select_v20260706 on public.site_attendance_policy;
create policy site_attendance_policy_authenticated_select_v20260706
on public.site_attendance_policy
for select
to authenticated
using (true);

drop policy if exists attendance_shift_events_employee_select_own_v20260706 on public.attendance_shift_events;
create policy attendance_shift_events_employee_select_own_v20260706
on public.attendance_shift_events
for select
to authenticated
using (employee_id = auth.uid());

drop policy if exists attendance_shift_events_employee_insert_own_v20260706 on public.attendance_shift_events;
create policy attendance_shift_events_employee_insert_own_v20260706
on public.attendance_shift_events
for insert
to authenticated
with check (employee_id = auth.uid());

drop policy if exists attendance_breaks_employee_select_own_v20260706 on public.attendance_breaks;
create policy attendance_breaks_employee_select_own_v20260706
on public.attendance_breaks
for select
to authenticated
using (employee_id = auth.uid());

drop policy if exists attendance_breaks_employee_update_own_v20260706 on public.attendance_breaks;
create policy attendance_breaks_employee_update_own_v20260706
on public.attendance_breaks
for update
to authenticated
using (employee_id = auth.uid())
with check (employee_id = auth.uid());

create or replace function public.enforce_attendance_geofence()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  v_site record;
  v_emp record;
  v_geofence_site_id uuid;

  v_requires_geo boolean;
  v_max_acc integer;
  v_radius integer;
  v_policy_check_in_max_acc integer;
  v_policy_check_out_max_acc integer;
  v_policy_default_radius integer;
  v_site_policy_radius integer;
  v_site_policy_requires_geo boolean;

  v_distance double precision;
  v_accuracy double precision;
begin
  if coalesce(new.source, 'mobile') <> 'system' then
    new.occurred_at := now();
  end if;

  v_geofence_site_id := coalesce(new.geofence_site_id, new.site_id);
  new.geofence_site_id := v_geofence_site_id;

  if coalesce(new.source, 'mobile') = 'system' then
    new.geofence_distance_meters := null;
    return new;
  end if;

  select
    geofence_check_in_max_accuracy_meters,
    geofence_check_out_max_accuracy_meters,
    default_radius_meters
    into v_policy_check_in_max_acc,
      v_policy_check_out_max_acc,
      v_policy_default_radius
  from public.attendance_policy
  order by created_at asc
  limit 1;

  if not found then
    v_policy_check_in_max_acc := 25;
    v_policy_check_out_max_acc := 25;
    v_policy_default_radius := null;
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

  if new.action = 'check_in'
    and v_emp.site_id is distinct from new.site_id
    and not exists (
      select 1
      from public.employee_sites es
      where es.employee_id = new.employee_id
        and es.site_id = new.site_id
        and es.is_active is true
    )
  then
    raise exception 'No autorizado: check-in solo permitido en una sede asignada';
  end if;

  select id, name, type, is_active, latitude, longitude, checkin_radius_meters
    into v_site
  from public.sites
  where id = v_geofence_site_id;

  if not found then
    raise exception 'Punto de marcacion no encontrado';
  end if;

  if v_site.is_active is false then
    raise exception 'Punto de marcacion inactivo';
  end if;

  select checkin_radius_meters, requires_geofence
    into v_site_policy_radius, v_site_policy_requires_geo
  from public.site_attendance_policy
  where site_id = v_geofence_site_id;

  v_requires_geo := coalesce(
    v_site_policy_requires_geo,
    v_site.latitude is not null and v_site.longitude is not null
  );

  if v_requires_geo then
    if v_site.latitude is null or v_site.longitude is null then
      raise exception 'Configuracion invalida: el punto % no tiene coordenadas', v_site.name;
    end if;

    if new.latitude is null or new.longitude is null or new.accuracy_meters is null then
      raise exception 'Ubicacion requerida para registrar asistencia';
    end if;

    if public.device_info_has_blocking_warnings(new.device_info) then
      raise exception 'Ubicacion no valida: senales de ubicacion simulada detectadas';
    end if;

    if new.action = 'check_in' then
      v_max_acc := coalesce(v_policy_check_in_max_acc, 25);
    elsif new.action = 'check_out' then
      v_max_acc := coalesce(v_policy_check_out_max_acc, 25);
    else
      raise exception 'Accion invalida: %', new.action;
    end if;

    v_radius := coalesce(
      v_site_policy_radius,
      v_site.checkin_radius_meters,
      v_policy_default_radius,
      50
    );
    v_accuracy := new.accuracy_meters::double precision;

    if v_accuracy > v_max_acc then
      raise exception 'Precision GPS insuficiente: %m (maximo %m)', round(v_accuracy), v_max_acc;
    end if;

    v_distance := public.haversine_m(new.latitude, new.longitude, v_site.latitude, v_site.longitude);
    new.geofence_distance_meters := round(v_distance::numeric, 2);

    if v_distance > v_radius then
      raise exception 'Fuera de rango: %m > radio %m (precision %m)',
        round(v_distance), v_radius, round(v_accuracy);
    end if;
  else
    new.geofence_distance_meters := null;
  end if;

  return new;
end;
$$;

create or replace function public.close_stale_open_attendance_shifts(
  p_now timestamptz default now(),
  p_timezone text default 'America/Bogota'
)
returns table (
  employee_id uuid,
  full_name text,
  check_in_at timestamptz,
  check_out_at timestamptz,
  site_id uuid,
  site_name text,
  shift_id uuid,
  close_reason text
)
language plpgsql
security definer
set search_path = public
as $$
begin
  return query
  with ordered_logs as (
    select
      al.*,
      row_number() over (
        partition by al.employee_id
        order by al.occurred_at desc, al.created_at desc
      ) as rn
    from public.attendance_logs al
  ),
  open_logs as (
    select
      al.employee_id,
      al.site_id,
      al.geofence_site_id,
      al.shift_id,
      al.occurred_at as check_in_at
    from ordered_logs al
    where al.rn = 1
      and al.action = 'check_in'
      and (al.occurred_at at time zone p_timezone)::date < (p_now at time zone p_timezone)::date
  ),
  resolved as (
    select
      ol.*,
      e.full_name,
      s.name as site_name,
      case
        when es.id is not null then
          greatest(
            (
              es.shift_date::timestamp
              + es.end_time
              + case
                  when es.end_time <= es.start_time then interval '1 day'
                  else interval '0 day'
                end
            ) at time zone p_timezone,
            ol.check_in_at + interval '1 minute'
          )
        else
          greatest(
            (
              ((ol.check_in_at at time zone p_timezone)::date::timestamp + time '23:59:59')
              at time zone p_timezone
            ),
            ol.check_in_at + interval '1 minute'
          )
      end as target_check_out_at,
      case
        when es.id is not null then 'scheduled_shift_end_time'
        else 'local_day_end_fallback'
      end as close_reason
    from open_logs ol
    join public.employees e on e.id = ol.employee_id
    left join public.sites s on s.id = ol.site_id
    left join public.employee_shifts es
      on es.id = ol.shift_id
      and es.employee_id = ol.employee_id
      and es.shift_kind <> 'descanso'
  ),
  normalized as (
    select
      r.*,
      least(r.target_check_out_at, p_now) as check_out_at
    from resolved r
    where least(r.target_check_out_at, p_now) > r.check_in_at
  ),
  closed_breaks as (
    update public.attendance_breaks b
    set
      ended_at = n.check_out_at,
      end_source = coalesce(b.end_source, 'system'),
      end_notes = coalesce(
        b.end_notes,
        'Cierre automatico server-side por turno abierto de dia anterior.'
      )
    from normalized n
    where b.employee_id = n.employee_id
      and b.ended_at is null
    returning b.employee_id
  ),
  inserted as (
    insert into public.attendance_logs (
      employee_id,
      site_id,
      geofence_site_id,
      shift_id,
      action,
      source,
      occurred_at,
      latitude,
      longitude,
      accuracy_meters,
      notes,
      device_info
    )
    select
      n.employee_id,
      n.site_id,
      n.geofence_site_id,
      n.shift_id,
      'check_out',
      'system',
      n.check_out_at,
      null,
      null,
      null,
      'Cierre automatico server-side por turno abierto de dia anterior.',
      jsonb_build_object(
        'autoCheckout', true,
        'origin', 'server_stale_open_shift_processor',
        'sourceDetail', 'system_stale_auto_close',
        'closeReason', n.close_reason,
        'checkInAt', n.check_in_at,
        'processedAt', p_now
      )
    from normalized n
    where not exists (
      select 1
      from public.attendance_logs ao
      where ao.employee_id = n.employee_id
        and ao.action = 'check_out'
        and ao.occurred_at > n.check_in_at
    )
    returning
      attendance_logs.employee_id,
      attendance_logs.site_id,
      attendance_logs.shift_id,
      attendance_logs.occurred_at
  )
  select
    n.employee_id,
    n.full_name,
    n.check_in_at,
    i.occurred_at as check_out_at,
    n.site_id,
    n.site_name,
    n.shift_id,
    n.close_reason
  from inserted i
  join normalized n
    on n.employee_id = i.employee_id
    and n.site_id = i.site_id
    and (n.shift_id is not distinct from i.shift_id);
end;
$$;

revoke all on function public.close_stale_open_attendance_shifts(timestamptz, text) from public;
revoke all on function public.close_stale_open_attendance_shifts(timestamptz, text) from authenticated;
grant execute on function public.close_stale_open_attendance_shifts(timestamptz, text) to service_role;

do $$
begin
  if exists (
    select 1
    from pg_extension
    where extname = 'pg_cron'
  ) then
    if exists (
      select 1
      from cron.job
      where jobname = 'attendance_stale_open_shift_autoclose_daily_bogota'
    ) then
      perform cron.unschedule('attendance_stale_open_shift_autoclose_daily_bogota');
    end if;

    perform cron.schedule(
      'attendance_stale_open_shift_autoclose_daily_bogota',
      '10 5 * * *',
      $cron$select public.close_stale_open_attendance_shifts();$cron$
    );
  end if;
end;
$$;

commit;
