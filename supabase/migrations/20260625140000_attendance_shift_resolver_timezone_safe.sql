begin;

create or replace function public.resolve_attendance_shift_id(
  p_employee_id uuid,
  p_site_id uuid,
  p_geofence_site_id uuid,
  p_action text,
  p_occurred_at timestamp with time zone
)
returns uuid
language sql
stable
set search_path to 'public'
as $function$
  with policy as (
    select
      coalesce(shift_match_early_checkin_minutes, 120) as early_checkin,
      coalesce(shift_match_late_checkin_minutes, 60) as late_checkin,
      coalesce(shift_match_early_checkout_minutes, 60) as early_checkout,
      coalesce(shift_match_late_checkout_minutes, 240) as late_checkout
    from public.attendance_policy
    order by created_at asc
    limit 1
  ),
  candidates as (
    select
      s.id,
      case
        when p_action = 'check_in'
          then abs(extract(epoch from (
            p_occurred_at - ((s.shift_date + s.start_time) at time zone 'America/Bogota')
          )))
        else abs(extract(epoch from (
          p_occurred_at - (
            s.shift_date
            + s.end_time
            + case when s.end_time <= s.start_time then interval '1 day' else interval '0' end
          ) at time zone 'America/Bogota'
        )))
      end as distance_seconds
    from public.employee_shifts s
    cross join policy p
    where s.employee_id = p_employee_id
      and s.published_at is not null
      and coalesce(s.status, 'scheduled') <> 'cancelled'
      and coalesce(s.shift_kind, 'laboral') <> 'descanso'
      and (
        s.site_id = p_site_id
        or s.checkin_site_id = p_site_id
        or s.checkout_site_id = p_site_id
        or (p_geofence_site_id is not null and s.site_id = p_geofence_site_id)
        or (p_geofence_site_id is not null and s.checkin_site_id = p_geofence_site_id)
        or (p_geofence_site_id is not null and s.checkout_site_id = p_geofence_site_id)
      )
      and (
        (
          p_action = 'check_in'
          and p_occurred_at >= ((s.shift_date + s.start_time) at time zone 'America/Bogota') - make_interval(mins => p.early_checkin)
          and p_occurred_at <= ((s.shift_date + s.start_time) at time zone 'America/Bogota') + make_interval(mins => p.late_checkin)
        )
        or
        (
          p_action = 'check_out'
          and p_occurred_at >= ((
              s.shift_date
              + s.end_time
              + case when s.end_time <= s.start_time then interval '1 day' else interval '0' end
            ) at time zone 'America/Bogota') - make_interval(mins => p.early_checkout)
          and p_occurred_at <= ((
              s.shift_date
              + s.end_time
              + case when s.end_time <= s.start_time then interval '1 day' else interval '0' end
            ) at time zone 'America/Bogota') + make_interval(mins => p.late_checkout)
        )
      )
    order by distance_seconds asc, s.shift_date asc, s.start_time asc
    limit 1
  )
  select id from candidates;
$function$;

notify pgrst, 'reload schema';

commit;
