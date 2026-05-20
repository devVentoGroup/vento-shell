begin;

grant usage on schema pass to anon, authenticated, service_role;

grant select on table pass.commercial_categories to anon, authenticated, service_role;
grant insert, update, delete on table pass.commercial_categories to authenticated, service_role;

grant select on public.commercial_categories to anon, authenticated, service_role;
grant insert, update, delete on public.commercial_categories to authenticated, service_role;

drop policy if exists pass_commercial_categories_select_active on pass.commercial_categories;
create policy pass_commercial_categories_select_active
on pass.commercial_categories
for select
to anon, authenticated
using (is_active = true);

drop policy if exists pass_commercial_categories_select_admin on pass.commercial_categories;
create policy pass_commercial_categories_select_admin
on pass.commercial_categories
for select
to authenticated
using (
  public.is_owner()
  or public.is_global_manager()
  or public.can_access_site(site_id)
);

drop policy if exists pass_commercial_categories_insert_admin on pass.commercial_categories;
create policy pass_commercial_categories_insert_admin
on pass.commercial_categories
for insert
to authenticated
with check (
  public.is_owner()
  or public.is_global_manager()
  or public.can_access_site(site_id)
);

drop policy if exists pass_commercial_categories_update_admin on pass.commercial_categories;
create policy pass_commercial_categories_update_admin
on pass.commercial_categories
for update
to authenticated
using (
  public.is_owner()
  or public.is_global_manager()
  or public.can_access_site(site_id)
)
with check (
  public.is_owner()
  or public.is_global_manager()
  or public.can_access_site(site_id)
);

drop policy if exists pass_commercial_categories_delete_admin on pass.commercial_categories;
create policy pass_commercial_categories_delete_admin
on pass.commercial_categories
for delete
to authenticated
using (
  public.is_owner()
  or public.is_global_manager()
  or public.can_access_site(site_id)
);

notify pgrst, 'reload schema';

commit;
