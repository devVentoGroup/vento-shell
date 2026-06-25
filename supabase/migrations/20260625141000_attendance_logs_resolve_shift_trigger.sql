begin;

create or replace function public.set_attendance_log_shift_context()
returns trigger
language plpgsql
security definer
set search_path to 'public'
as $function$
declare
  v_shift_id uuid;
  v_shift_site_id uuid;
begin
  if new.employee_id is null
    or new.site_id is null
    or nullif(btrim(coalesce(new.action, '')), '') is null
    or new.occurred_at is null
  then
    return new;
  end if;

  v_shift_id := new.shift_id;

  if v_shift_id is null then
    v_shift_id := public.resolve_attendance_shift_id(
      new.employee_id,
      new.site_id,
      new.geofence_site_id,
      lower(btrim(new.action)),
      new.occurred_at
    );

    new.shift_id := v_shift_id;
  end if;

  if v_shift_id is null then
    return new;
  end if;

  select s.site_id
    into v_shift_site_id
  from public.employee_shifts s
  where s.id = v_shift_id
  limit 1;

  if v_shift_site_id is null then
    return new;
  end if;

  if new.geofence_site_id is null
    and new.site_id is distinct from v_shift_site_id
  then
    new.geofence_site_id := new.site_id;
  end if;

  new.site_id := v_shift_site_id;

  return new;
end;
$function$;

revoke all on function public.set_attendance_log_shift_context() from public;
revoke all on function public.set_attendance_log_shift_context() from anon;
revoke all on function public.set_attendance_log_shift_context() from authenticated;

drop trigger if exists attendance_logs_resolve_shift_id_bi on public.attendance_logs;

create trigger attendance_logs_resolve_shift_id_bi
before insert on public.attendance_logs
for each row
execute function public.set_attendance_log_shift_context();

notify pgrst, 'reload schema';

commit;
