drop trigger if exists pass_catalog_items_sync_commercial_collection on pass.catalog_items;
drop function if exists pass.sync_catalog_item_commercial_collection();

create or replace function pass.sync_legacy_catalog_item_collection_from_relations()
returns trigger
language plpgsql
security definer
set search_path = public, pass
as $$
declare
  v_catalog_item_id uuid;
  v_primary_collection_id uuid;
begin
  v_catalog_item_id := coalesce(new.catalog_item_id, old.catalog_item_id);

  select cic.commercial_collection_id
  into v_primary_collection_id
  from pass.catalog_item_collections cic
  where cic.catalog_item_id = v_catalog_item_id
    and cic.is_active = true
  order by cic.is_primary desc, cic.sort_order asc, cic.created_at asc
  limit 1;

  update pass.catalog_items
  set commercial_collection_id = v_primary_collection_id,
      updated_at = now()
  where id = v_catalog_item_id
    and commercial_collection_id is distinct from v_primary_collection_id;

  return coalesce(new, old);
end;
$$;

create trigger pass_catalog_item_collections_sync_legacy
  after insert or update of commercial_collection_id, sort_order, is_active, is_primary or delete
  on pass.catalog_item_collections
  for each row
  execute function pass.sync_legacy_catalog_item_collection_from_relations();

with ranked_relations as (
  select
    cic.catalog_item_id,
    cic.commercial_collection_id,
    row_number() over (
      partition by cic.catalog_item_id
      order by cic.is_primary desc, cic.sort_order asc, cic.created_at asc
    ) as relation_rank
  from pass.catalog_item_collections cic
  where cic.is_active = true
), primary_relations as (
  select catalog_item_id, commercial_collection_id
  from ranked_relations
  where relation_rank = 1
)
update pass.catalog_items ci
set commercial_collection_id = pr.commercial_collection_id,
    updated_at = now()
from primary_relations pr
where pr.catalog_item_id = ci.id
  and ci.commercial_collection_id is distinct from pr.commercial_collection_id;

comment on column pass.catalog_items.commercial_collection_id is
  'DEPRECATED compatibility mirror. Source of truth: pass.catalog_item_collections. Remove after all clients stop selecting/writing this column.';