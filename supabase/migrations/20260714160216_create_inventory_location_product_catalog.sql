create table if not exists public.inventory_location_product_catalog (
  location_id uuid not null references public.inventory_locations(id) on delete cascade,
  product_id uuid not null references public.products(id) on delete cascade,
  is_active boolean not null default true,
  created_at timestamptz not null default now(),
  created_by uuid null references auth.users(id),
  updated_at timestamptz not null default now(),
  primary key (location_id, product_id)
);

create index if not exists inventory_location_product_catalog_product_idx
  on public.inventory_location_product_catalog(product_id);

alter table public.inventory_location_product_catalog enable row level security;

drop policy if exists inventory_location_product_catalog_select_permission
  on public.inventory_location_product_catalog;
create policy inventory_location_product_catalog_select_permission
  on public.inventory_location_product_catalog
  for select
  to authenticated
  using (
    exists (
      select 1
      from public.inventory_locations loc
      where loc.id = inventory_location_product_catalog.location_id
        and (
          has_permission('nexo.inventory.counts'::text, loc.site_id)
          or has_permission('nexo.inventory.stock'::text, loc.site_id)
          or has_permission('nexo.inventory.locations'::text, loc.site_id)
        )
    )
  );

drop policy if exists inventory_location_product_catalog_insert_permission
  on public.inventory_location_product_catalog;
create policy inventory_location_product_catalog_insert_permission
  on public.inventory_location_product_catalog
  for insert
  to authenticated
  with check (
    exists (
      select 1
      from public.inventory_locations loc
      where loc.id = inventory_location_product_catalog.location_id
        and (
          has_permission('nexo.inventory.stock'::text, loc.site_id)
          or has_permission('nexo.inventory.locations'::text, loc.site_id)
          or is_owner()
          or is_global_manager()
        )
    )
  );

drop policy if exists inventory_location_product_catalog_update_permission
  on public.inventory_location_product_catalog;
create policy inventory_location_product_catalog_update_permission
  on public.inventory_location_product_catalog
  for update
  to authenticated
  using (
    exists (
      select 1
      from public.inventory_locations loc
      where loc.id = inventory_location_product_catalog.location_id
        and (
          has_permission('nexo.inventory.stock'::text, loc.site_id)
          or has_permission('nexo.inventory.locations'::text, loc.site_id)
          or is_owner()
          or is_global_manager()
        )
    )
  )
  with check (
    exists (
      select 1
      from public.inventory_locations loc
      where loc.id = inventory_location_product_catalog.location_id
        and (
          has_permission('nexo.inventory.stock'::text, loc.site_id)
          or has_permission('nexo.inventory.locations'::text, loc.site_id)
          or is_owner()
          or is_global_manager()
        )
    )
  );

drop policy if exists inventory_location_product_catalog_delete_permission
  on public.inventory_location_product_catalog;
create policy inventory_location_product_catalog_delete_permission
  on public.inventory_location_product_catalog
  for delete
  to authenticated
  using (
    exists (
      select 1
      from public.inventory_locations loc
      where loc.id = inventory_location_product_catalog.location_id
        and (
          has_permission('nexo.inventory.stock'::text, loc.site_id)
          or has_permission('nexo.inventory.locations'::text, loc.site_id)
          or is_owner()
          or is_global_manager()
        )
    )
  );