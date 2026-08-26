drop policy if exists employees_select on public.employees;
create policy employees_select
on public.employees
for select
to authenticated
using (
  public.is_owner()
  or public.is_global_manager()
  or (
    public.current_employee_role() = 'gerente'
    and site_id = public.current_employee_site_id()
  )
  or id = auth.uid()
);
