begin;

-- Do not expose every site to every signed-in user. Existing narrower policies
-- still allow owners/global managers, assigned staff via can_access_site(id),
-- and active public sites.
drop policy if exists "sites_select" on public.sites;

-- The previous employees_update policy allowed users to update their own row as
-- long as role stayed unchanged. That left sensitive fields such as site_id,
-- is_active, names, and profile fields writable from the client by the user.
drop policy if exists "employees_update" on public.employees;

create policy "employees_update_management"
on public.employees
for update
to authenticated
using (
  public.is_owner()
  or public.is_global_manager()
  or (
    public.current_employee_role() = 'gerente'
    and site_id = public.current_employee_site_id()
  )
)
with check (
  public.is_owner()
  or (
    public.is_global_manager()
    and role <> all (array['propietario'::text, 'gerente_general'::text])
  )
  or (
    public.current_employee_role() = 'gerente'
    and role <> all (array['propietario'::text, 'gerente_general'::text, 'gerente'::text])
    and site_id = public.current_employee_site_id()
  )
);

commit;
