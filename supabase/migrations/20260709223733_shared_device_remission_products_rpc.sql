create or replace function public.current_shared_device_can_access_nexo_remission_catalog(
  p_product_id uuid
)
returns boolean
language sql
stable
security definer
set search_path = public, auth
as $$
  with device as (
    select
      d.id,
      d.site_id,
      d.area_id,
      d.navigation_role
    from public.shared_operational_devices d
    where d.auth_user_id = auth.uid()
      and d.is_active
      and d.activation_status = 'active'
      and d.site_id is not null
      and nullif(trim(coalesce(d.navigation_role, '')), '') is not null
    limit 1
  )
  select exists (
    select 1
    from device d
    join public.shared_operational_device_apps da
      on da.device_id = d.id
     and da.app_code = 'nexo'
     and da.is_active
    join public.product_site_settings pss
      on pss.site_id = d.site_id
     and pss.product_id = p_product_id
     and pss.is_active
     and coalesce(pss.remission_enabled, true)
    join public.products p
      on p.id = pss.product_id
     and coalesce(p.is_active, true)
    where public.has_operational_role_permission(
      d.navigation_role,
      'nexo.inventory.remissions.request',
      d.site_id,
      d.area_id,
      'nexo'
    )
    or public.has_operational_role_permission(
      d.navigation_role,
      'nexo.inventory.remissions.prepare',
      d.site_id,
      d.area_id,
      'nexo'
    )
    or public.has_operational_role_permission(
      d.navigation_role,
      'nexo.inventory.remissions.receive',
      d.site_id,
      d.area_id,
      'nexo'
    )
  );
$$;

comment on function public.current_shared_device_can_access_nexo_remission_catalog(uuid) is
  'Permite a dispositivos compartidos leer solo productos/perfiles habilitados para remisiones en su sede operativa NEXO.';

revoke all on function public.current_shared_device_can_access_nexo_remission_catalog(uuid) from public;
grant execute on function public.current_shared_device_can_access_nexo_remission_catalog(uuid) to authenticated;

drop policy if exists products_select_shared_device_remission_catalog on public.products;
create policy products_select_shared_device_remission_catalog
on public.products
for select
to authenticated
using (public.current_shared_device_can_access_nexo_remission_catalog(id));

drop policy if exists product_inventory_profiles_select_shared_device_remission_catalog on public.product_inventory_profiles;
create policy product_inventory_profiles_select_shared_device_remission_catalog
on public.product_inventory_profiles
for select
to authenticated
using (public.current_shared_device_can_access_nexo_remission_catalog(product_id));

drop policy if exists product_uom_profiles_select_shared_device_remission_catalog on public.product_uom_profiles;
create policy product_uom_profiles_select_shared_device_remission_catalog
on public.product_uom_profiles
for select
to authenticated
using (public.current_shared_device_can_access_nexo_remission_catalog(product_id));

notify pgrst, 'reload schema';