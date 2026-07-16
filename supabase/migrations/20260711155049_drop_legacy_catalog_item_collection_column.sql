drop trigger if exists pass_catalog_item_collections_sync_legacy
on pass.catalog_item_collections;

drop function if exists pass.sync_legacy_catalog_item_collection_from_relations();

create or replace function pass.reconcile_catalog_items_after_collection_status_change()
returns trigger
language plpgsql
security definer
set search_path = public, pass
as $function$
begin
  if old.is_active is not distinct from new.is_active then
    return new;
  end if;

  if new.is_active = false then
    update pass.catalog_item_collections cic
    set is_primary = false,
        updated_at = now()
    where cic.commercial_collection_id = new.id
      and cic.is_primary = true;

    with affected_items as (
      select distinct catalog_item_id
      from pass.catalog_item_collections
      where commercial_collection_id = new.id
    ), replacements as (
      select distinct on (cic.catalog_item_id)
        cic.catalog_item_id,
        cic.commercial_collection_id
      from pass.catalog_item_collections cic
      join pass.commercial_collections cc
        on cc.id = cic.commercial_collection_id
       and cc.is_active = true
      where cic.catalog_item_id in (select catalog_item_id from affected_items)
        and cic.is_active = true
      order by cic.catalog_item_id, cic.is_primary desc, cic.sort_order asc, cic.created_at asc
    )
    update pass.catalog_item_collections cic
    set is_primary = true,
        updated_at = now()
    from replacements replacement
    where cic.catalog_item_id = replacement.catalog_item_id
      and cic.commercial_collection_id = replacement.commercial_collection_id
      and cic.is_primary = false;
  end if;

  return new;
end;
$function$;

drop index if exists pass.pass_catalog_items_commercial_collection_idx;

alter table pass.catalog_items
  drop constraint if exists catalog_items_commercial_collection_id_fkey;

alter table pass.catalog_items
  drop column if exists commercial_collection_id;