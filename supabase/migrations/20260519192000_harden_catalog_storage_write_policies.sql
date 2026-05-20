begin;

-- Product/catalog images can stay publicly readable, but writes must not be
-- available to every authenticated user.

drop policy if exists "product_images_authenticated_insert" on storage.objects;
drop policy if exists "product_images_authenticated_update" on storage.objects;
drop policy if exists "product_images_authenticated_delete" on storage.objects;

drop policy if exists "nexo_catalog_images_authenticated_insert" on storage.objects;
drop policy if exists "nexo_catalog_images_authenticated_update" on storage.objects;
drop policy if exists "nexo_catalog_images_authenticated_delete" on storage.objects;

drop policy if exists "nexo_catalog_images_insert_admin" on storage.objects;
drop policy if exists "nexo_catalog_images_update_admin" on storage.objects;
drop policy if exists "nexo_catalog_images_delete_admin" on storage.objects;

create policy "nexo_catalog_images_insert_admin"
on storage.objects
for insert
to authenticated
with check (
  bucket_id = 'nexo-catalog-images'
  and (
    public.is_owner()
    or public.is_global_manager()
    or public.has_permission('nexo.catalog.products')
  )
);

create policy "nexo_catalog_images_update_admin"
on storage.objects
for update
to authenticated
using (
  bucket_id = 'nexo-catalog-images'
  and (
    public.is_owner()
    or public.is_global_manager()
    or public.has_permission('nexo.catalog.products')
  )
)
with check (
  bucket_id = 'nexo-catalog-images'
  and (
    public.is_owner()
    or public.is_global_manager()
    or public.has_permission('nexo.catalog.products')
  )
);

create policy "nexo_catalog_images_delete_admin"
on storage.objects
for delete
to authenticated
using (
  bucket_id = 'nexo-catalog-images'
  and (
    public.is_owner()
    or public.is_global_manager()
    or public.has_permission('nexo.catalog.products')
  )
);

commit;
