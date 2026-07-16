-- The requesting site creates the initial demand task. Preparation and receipt keep their existing scoped access.

drop policy if exists restock_item_fulfillments_access on public.restock_item_fulfillments;

create policy restock_item_fulfillments_access on public.restock_item_fulfillments for all to authenticated
  using (
    public.has_permission('nexo.inventory.remissions.all_sites')
    or public.has_permission('nexo.inventory.remissions.request', to_site_id)
    or public.has_permission('nexo.inventory.remissions.prepare', from_site_id)
    or public.has_permission('nexo.inventory.remissions.receive', to_site_id)
  )
  with check (
    public.has_permission('nexo.inventory.remissions.all_sites')
    or public.has_permission('nexo.inventory.remissions.request', to_site_id)
    or public.has_permission('nexo.inventory.remissions.prepare', from_site_id)
    or public.has_permission('nexo.inventory.remissions.receive', to_site_id)
  );