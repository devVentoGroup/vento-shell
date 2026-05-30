begin;

drop policy if exists products_write_accountant_catalog on public.products;

create policy products_insert_accountant_catalog
  on public.products
  for insert to authenticated
  with check (public.has_permission('nexo.catalog.products'));

create policy products_update_accountant_catalog
  on public.products
  for update to authenticated
  using (public.has_permission('nexo.catalog.products'))
  with check (public.has_permission('nexo.catalog.products'));

commit;
