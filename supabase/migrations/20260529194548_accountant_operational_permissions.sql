begin;

insert into public.app_permissions (app_id, code, name, description)
select a.id, v.code, v.name, v.description
from public.apps a
join (
  values
    ('nexo', 'catalog.products', 'Productos', 'Crear y modificar productos del catalogo maestro'),
    ('origo', 'suppliers.manage', 'Proveedores', 'Crear y modificar proveedores')
) as v(app_code, code, name, description) on v.app_code = a.code
on conflict (app_id, code) do update
set
  name = excluded.name,
  description = excluded.description,
  is_active = true,
  updated_at = now();

with grants(role, app_code, permission_code, scope_type) as (
  values
    ('contador', 'viso', 'access', 'global'::public.permission_scope_type),
    ('contador', 'nexo', 'access', 'global'::public.permission_scope_type),
    ('contador', 'nexo', 'inventory.stock', 'global'::public.permission_scope_type),
    ('contador', 'nexo', 'catalog.products', 'global'::public.permission_scope_type),
    ('contador', 'origo', 'access', 'global'::public.permission_scope_type),
    ('contador', 'origo', 'procurement.receipts', 'global'::public.permission_scope_type),
    ('contador', 'origo', 'suppliers.manage', 'global'::public.permission_scope_type)
)
insert into public.role_permissions (role, permission_id, scope_type)
select g.role, ap.id, g.scope_type
from grants g
join public.apps a on a.code = g.app_code
join public.app_permissions ap on ap.app_id = a.id and ap.code = g.permission_code
on conflict do nothing;

drop policy if exists products_write_accountant_catalog on public.products;
create policy products_write_accountant_catalog
  on public.products
  for all to authenticated
  using (public.has_permission('nexo.catalog.products'))
  with check (public.has_permission('nexo.catalog.products'));

drop policy if exists product_inventory_profiles_write_accountant_catalog on public.product_inventory_profiles;
create policy product_inventory_profiles_write_accountant_catalog
  on public.product_inventory_profiles
  for all to authenticated
  using (public.has_permission('nexo.catalog.products'))
  with check (public.has_permission('nexo.catalog.products'));

drop policy if exists product_suppliers_write_accountant_catalog on public.product_suppliers;
create policy product_suppliers_write_accountant_catalog
  on public.product_suppliers
  for all to authenticated
  using (public.has_permission('nexo.catalog.products'))
  with check (public.has_permission('nexo.catalog.products'));

drop policy if exists product_site_settings_write_accountant_catalog on public.product_site_settings;
create policy product_site_settings_write_accountant_catalog
  on public.product_site_settings
  for all to authenticated
  using (public.has_permission('nexo.catalog.products', site_id))
  with check (public.has_permission('nexo.catalog.products', site_id));

drop policy if exists product_asset_profiles_write_accountant_catalog on public.product_asset_profiles;
create policy product_asset_profiles_write_accountant_catalog
  on public.product_asset_profiles
  for all to authenticated
  using (public.has_permission('nexo.catalog.products'))
  with check (public.has_permission('nexo.catalog.products'));

drop policy if exists product_uom_profiles_write_accountant_catalog on public.product_uom_profiles;
create policy product_uom_profiles_write_accountant_catalog
  on public.product_uom_profiles
  for all to authenticated
  using (public.has_permission('nexo.catalog.products'))
  with check (public.has_permission('nexo.catalog.products'));

drop policy if exists suppliers_insert_owner_manager on public.suppliers;
drop policy if exists suppliers_update_owner_manager on public.suppliers;
drop policy if exists suppliers_delete_owner_manager on public.suppliers;
drop policy if exists suppliers_insert_owner_manager_accountant on public.suppliers;
drop policy if exists suppliers_update_owner_manager_accountant on public.suppliers;
drop policy if exists suppliers_delete_owner_manager_accountant on public.suppliers;

create policy suppliers_insert_owner_manager_accountant
  on public.suppliers
  for insert to authenticated
  with check (
    public.is_owner()
    or public.is_global_manager()
    or public.is_manager()
    or public.has_permission('origo.suppliers.manage')
  );

create policy suppliers_update_owner_manager_accountant
  on public.suppliers
  for update to authenticated
  using (
    public.is_owner()
    or public.is_global_manager()
    or public.is_manager()
    or public.has_permission('origo.suppliers.manage')
  )
  with check (
    public.is_owner()
    or public.is_global_manager()
    or public.is_manager()
    or public.has_permission('origo.suppliers.manage')
  );

create policy suppliers_delete_owner_manager_accountant
  on public.suppliers
  for delete to authenticated
  using (
    public.is_owner()
    or public.is_global_manager()
    or public.is_manager()
    or public.has_permission('origo.suppliers.manage')
  );

commit;
