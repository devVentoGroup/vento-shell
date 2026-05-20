begin;

-- Attendance logs are operational records. Client writes are allowed for the
-- signed-in employee only, and only against a site the employee can access.
drop policy if exists "attendance_logs_insert_self" on public.attendance_logs;
create policy "attendance_logs_insert_self_accessible_site"
on public.attendance_logs
for insert
to authenticated
with check (
  employee_id = auth.uid()
  and source in ('mobile', 'web', 'kiosk')
  and public.can_access_site(site_id)
);

drop policy if exists "attendance_logs_select_manager" on public.attendance_logs;
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

drop policy if exists "attendance_breaks_select_manager" on public.attendance_breaks;
create policy "attendance_breaks_select_manager_scoped"
on public.attendance_breaks
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

-- History incidents in Anima update only notes. Keep row-level permission for
-- self/manager, then use column privileges to prevent client-side changes to
-- timestamps, action, site, GPS, source, device_info, shift_id, etc.
drop policy if exists "attendance_logs_update_notes_scoped" on public.attendance_logs;
create policy "attendance_logs_update_notes_scoped"
on public.attendance_logs
for update
to authenticated
using (
  employee_id = auth.uid()
  or public.is_owner()
  or public.is_global_manager()
  or (
    public.current_employee_role() = 'gerente'
    and public.can_access_site(site_id)
  )
)
with check (
  employee_id = auth.uid()
  or public.is_owner()
  or public.is_global_manager()
  or (
    public.current_employee_role() = 'gerente'
    and public.can_access_site(site_id)
  )
);

revoke update on public.attendance_logs from authenticated;
grant update (notes) on public.attendance_logs to authenticated;

commit;
