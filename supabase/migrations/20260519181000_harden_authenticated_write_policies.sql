begin;

-- Remove broad authenticated write access to operational configuration.
-- These tables change catalog/routing behavior and should be owned by admins.

drop policy if exists "pss_write_authenticated" on public.product_site_settings;

drop policy if exists "employee_area_purpose_assignments_write_authenticated"
  on public.employee_area_purpose_assignments;
create policy "employee_area_purpose_assignments_write_admin"
on public.employee_area_purpose_assignments
to authenticated
using (public.is_owner() or public.is_global_manager())
with check (public.is_owner() or public.is_global_manager());

drop policy if exists "site_area_purpose_rules_write_authenticated"
  on public.site_area_purpose_rules;
create policy "site_area_purpose_rules_write_admin"
on public.site_area_purpose_rules
to authenticated
using (public.is_owner() or public.is_global_manager())
with check (public.is_owner() or public.is_global_manager());

-- The project has no public website surface attached to this database today.
-- Keep published website CMS rows available to signed-in users only.
drop policy if exists "website_blocks_public_read" on public.website_blocks;
create policy "website_blocks_authenticated_read"
on public.website_blocks
for select
to authenticated
using (is_published = true);

drop policy if exists "website_items_public_read" on public.website_items;
create policy "website_items_authenticated_read"
on public.website_items
for select
to authenticated
using (is_published = true);

commit;
