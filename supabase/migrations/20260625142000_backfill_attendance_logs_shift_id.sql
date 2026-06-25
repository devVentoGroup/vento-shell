begin;

with matches as (
  select
    l.id as attendance_log_id,
    public.resolve_attendance_shift_id(
      l.employee_id,
      l.site_id,
      l.geofence_site_id,
      l.action,
      l.occurred_at
    ) as shift_id
  from public.attendance_logs l
  where l.shift_id is null
),
valid_matches as (
  select
    m.attendance_log_id,
    m.shift_id
  from matches m
  where m.shift_id is not null
),
updated as (
  update public.attendance_logs l
  set
    shift_id = vm.shift_id,
    geofence_site_id = case
      when l.geofence_site_id is null
       and l.site_id is distinct from s.site_id
      then l.site_id
      else l.geofence_site_id
    end,
    site_id = s.site_id
  from valid_matches vm
  join public.employee_shifts s
    on s.id = vm.shift_id
  where l.id = vm.attendance_log_id
  returning l.id
)
select count(*) as updated_attendance_logs
from updated;

commit;