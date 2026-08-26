drop policy if exists employee_sites_select on public.employee_sites;
create policy employee_sites_select
on public.employee_sites
for select
to authenticated
using (
  public.is_owner()
  or public.is_global_manager()
  or (
    public.current_employee_role() = 'gerente'
    and employee_id in (
      select e.id
      from public.employees e
      where e.site_id = (
        select me.site_id
        from public.employees me
        where me.id = auth.uid()
      )
    )
  )
  or employee_id = auth.uid()
);
