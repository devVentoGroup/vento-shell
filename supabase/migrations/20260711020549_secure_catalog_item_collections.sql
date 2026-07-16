alter table pass.catalog_item_collections enable row level security;

drop policy if exists pass_catalog_item_collections_select_active on pass.catalog_item_collections;
create policy pass_catalog_item_collections_select_active
on pass.catalog_item_collections
for select
to public
using (
  is_active = true
  and exists (
    select 1
    from pass.catalog_items ci
    where ci.id = catalog_item_collections.catalog_item_id
      and ci.is_active = true
  )
  and exists (
    select 1
    from pass.commercial_collections cc
    where cc.id = catalog_item_collections.commercial_collection_id
      and cc.is_active = true
      and (cc.starts_at is null or cc.starts_at <= now())
      and (cc.ends_at is null or cc.ends_at >= now())
  )
);

drop policy if exists pass_catalog_item_collections_select_admin on pass.catalog_item_collections;
create policy pass_catalog_item_collections_select_admin
on pass.catalog_item_collections
for select
to authenticated
using (is_owner() or is_global_manager());

drop policy if exists pass_catalog_item_collections_insert_admin on pass.catalog_item_collections;
create policy pass_catalog_item_collections_insert_admin
on pass.catalog_item_collections
for insert
to authenticated
with check (is_owner() or is_global_manager());

drop policy if exists pass_catalog_item_collections_update_admin on pass.catalog_item_collections;
create policy pass_catalog_item_collections_update_admin
on pass.catalog_item_collections
for update
to authenticated
using (is_owner() or is_global_manager())
with check (is_owner() or is_global_manager());

drop policy if exists pass_catalog_item_collections_delete_admin on pass.catalog_item_collections;
create policy pass_catalog_item_collections_delete_admin
on pass.catalog_item_collections
for delete
to authenticated
using (is_owner() or is_global_manager());

grant select on pass.catalog_item_collections to anon;

revoke execute on function pass.reconcile_catalog_items_after_collection_status_change() from public, anon, authenticated;
revoke execute on function pass.sync_legacy_catalog_item_collection_from_relations() from public, anon, authenticated;
revoke execute on function pass.validate_catalog_item_collection_site() from public, anon, authenticated;
revoke execute on function pass.sync_main_collection_categories() from public, anon, authenticated;
revoke execute on function pass.sync_active_category_to_main_collections() from public, anon, authenticated;