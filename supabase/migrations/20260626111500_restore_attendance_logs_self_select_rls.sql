begin;

alter table public.attendance_logs enable row level security;

drop policy if exists "attendance_logs_select_owner_only_restrictive" on public.attendance_logs;
drop policy if exists "attendance_logs_select_owner_only_permissive" on public.attendance_logs;
drop policy if exists "attendance_logs_select_operational_restrictive" on public.attendance_logs;
drop policy if exists "attendance_logs_select_authenticated_permissive" on public.attendance_logs;
drop policy if exists "attendance_logs_select_self" on public.attendance_logs;
drop policy if exists "attendance_logs_select_self_active" on public.attendance_logs;

create policy "attendance_logs_select_self_active"
on public.attendance_logs
for select
to authenticated
using (
  employee_id = auth.uid()
  and exists (
    select 1
    from public.employees e
    where e.id = auth.uid()
      and e.is_active = true
  )
);

drop policy if exists "attendance_logs_select_manager" on public.attendance_logs;
drop policy if exists "attendance_logs_select_manager_scoped" on public.attendance_logs;

create policy "attendance_logs_select_manager_scoped"
on public.attendance_logs
for select
to authenticated
using (
  public.is_owner()
  or public.is_global_manager()
  or (
    public.current_employee_role() = 'gerente'
    and public.can_access_site(site_id)
  )
);

drop function if exists public.anima_latest_attendance_log_id_for_current_user();

commit;
