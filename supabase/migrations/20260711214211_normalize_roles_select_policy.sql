drop policy if exists roles_select on public.roles;
create policy roles_select
on public.roles
for select
to authenticated
using (true);
