create or replace function pass.sync_legacy_catalog_item_collection_from_relations()
returns trigger
language plpgsql
security definer
set search_path to 'public', 'pass'
as $function$
declare
  v_catalog_item_id uuid;
  v_primary_collection_id uuid;
begin
  v_catalog_item_id := coalesce(new.catalog_item_id, old.catalog_item_id);

  select cic.commercial_collection_id
  into v_primary_collection_id
  from pass.catalog_item_collections cic
  join pass.commercial_collections cc
    on cc.id = cic.commercial_collection_id
   and cc.is_active = true
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
$function$;

create or replace function pass.reconcile_catalog_items_after_collection_status_change()
returns trigger
language plpgsql
security definer
set search_path to 'public', 'pass'
as $function$
begin
  if old.is_active is distinct from new.is_active and new.is_active = false then
    update pass.catalog_item_collections cic
    set is_primary = false,
        updated_at = now()
    where cic.commercial_collection_id = new.id
      and cic.is_primary = true;

    with affected_items as (
      select distinct cic.catalog_item_id
      from pass.catalog_item_collections cic
      where cic.commercial_collection_id = new.id
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

    update pass.catalog_items ci
    set commercial_collection_id = replacement.commercial_collection_id,
        updated_at = now()
    from (
      select distinct on (cic.catalog_item_id)
        cic.catalog_item_id,
        cic.commercial_collection_id
      from pass.catalog_item_collections cic
      join pass.commercial_collections cc
        on cc.id = cic.commercial_collection_id
       and cc.is_active = true
      where cic.catalog_item_id in (
        select catalog_item_id
        from pass.catalog_item_collections
        where commercial_collection_id = new.id
      )
        and cic.is_active = true
      order by cic.catalog_item_id, cic.is_primary desc, cic.sort_order asc, cic.created_at asc
    ) replacement
    where ci.id = replacement.catalog_item_id
      and ci.commercial_collection_id is distinct from replacement.commercial_collection_id;

    update pass.catalog_items ci
    set commercial_collection_id = null,
        updated_at = now()
    where ci.id in (
      select catalog_item_id
      from pass.catalog_item_collections
      where commercial_collection_id = new.id
    )
      and not exists (
        select 1
        from pass.catalog_item_collections cic
        join pass.commercial_collections cc
          on cc.id = cic.commercial_collection_id
         and cc.is_active = true
        where cic.catalog_item_id = ci.id
          and cic.is_active = true
      )
      and ci.commercial_collection_id is not null;
  end if;

  return new;
end;
$function$;

drop trigger if exists pass_commercial_collections_reconcile_items on pass.commercial_collections;
create trigger pass_commercial_collections_reconcile_items
after update of is_active on pass.commercial_collections
for each row
execute function pass.reconcile_catalog_items_after_collection_status_change();