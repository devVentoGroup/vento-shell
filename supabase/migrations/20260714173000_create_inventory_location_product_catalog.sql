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
  on public.inventory_location_product_catalog(product_id)
  where is_active;

alter table public.inventory_location_product_catalog enable row level security;

drop policy if exists inventory_location_product_catalog_select on public.inventory_location_product_catalog;
create policy inventory_location_product_catalog_select
on public.inventory_location_product_catalog
for select
to authenticated
using (
  exists (
    select 1
    from public.inventory_locations location
    where location.id = inventory_location_product_catalog.location_id
      and (
        public.has_permission('nexo.inventory.counts', location.site_id)
        or public.has_permission('nexo.inventory.stock', location.site_id)
      )
  )
);

drop policy if exists inventory_location_product_catalog_insert on public.inventory_location_product_catalog;
create policy inventory_location_product_catalog_insert
on public.inventory_location_product_catalog
for insert
to authenticated
with check (
  exists (
    select 1
    from public.inventory_locations location
    where location.id = inventory_location_product_catalog.location_id
      and public.has_permission('nexo.inventory.stock', location.site_id)
  )
);

drop policy if exists inventory_location_product_catalog_update on public.inventory_location_product_catalog;
create policy inventory_location_product_catalog_update
on public.inventory_location_product_catalog
for update
to authenticated
using (
  exists (
    select 1
    from public.inventory_locations location
    where location.id = inventory_location_product_catalog.location_id
      and public.has_permission('nexo.inventory.stock', location.site_id)
  )
)
with check (
  exists (
    select 1
    from public.inventory_locations location
    where location.id = inventory_location_product_catalog.location_id
      and public.has_permission('nexo.inventory.stock', location.site_id)
  )
);

drop policy if exists inventory_location_product_catalog_delete on public.inventory_location_product_catalog;
create policy inventory_location_product_catalog_delete
on public.inventory_location_product_catalog
for delete
to authenticated
using (
  exists (
    select 1
    from public.inventory_locations location
    where location.id = inventory_location_product_catalog.location_id
      and public.has_permission('nexo.inventory.stock', location.site_id)
  )
);
