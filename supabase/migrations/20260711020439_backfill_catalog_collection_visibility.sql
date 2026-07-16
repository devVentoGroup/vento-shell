create or replace function pass.reconcile_catalog_items_after_collection_status_change()
returns trigger
language plpgsql
security definer
set search_path to 'public', 'pass'
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

  update pass.catalog_items ci
  set commercial_collection_id = expected.commercial_collection_id,
      updated_at = now()
  from (
    select affected.catalog_item_id,
      (
        select cic.commercial_collection_id
        from pass.catalog_item_collections cic
        join pass.commercial_collections cc
          on cc.id = cic.commercial_collection_id
         and cc.is_active = true
        where cic.catalog_item_id = affected.catalog_item_id
          and cic.is_active = true
        order by cic.is_primary desc, cic.sort_order asc, cic.created_at asc
        limit 1
      ) as commercial_collection_id
    from (
      select distinct catalog_item_id
      from pass.catalog_item_collections
      where commercial_collection_id = new.id
    ) affected
  ) expected
  where ci.id = expected.catalog_item_id
    and ci.commercial_collection_id is distinct from expected.commercial_collection_id;

  return new;
end;
$function$;

update pass.catalog_item_collections cic
set is_primary = false,
    updated_at = now()
from pass.commercial_collections cc
where cc.id = cic.commercial_collection_id
  and cc.is_active = false
  and cic.is_primary = true;

with replacements as (
  select distinct on (cic.catalog_item_id)
    cic.catalog_item_id,
    cic.commercial_collection_id
  from pass.catalog_item_collections cic
  join pass.commercial_collections cc
    on cc.id = cic.commercial_collection_id
   and cc.is_active = true
  where cic.is_active = true
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
set commercial_collection_id = expected.commercial_collection_id,
    updated_at = now()
from (
  select ci2.id as catalog_item_id,
    (
      select cic.commercial_collection_id
      from pass.catalog_item_collections cic
      join pass.commercial_collections cc
        on cc.id = cic.commercial_collection_id
       and cc.is_active = true
      where cic.catalog_item_id = ci2.id
        and cic.is_active = true
      order by cic.is_primary desc, cic.sort_order asc, cic.created_at asc
      limit 1
    ) as commercial_collection_id
  from pass.catalog_items ci2
) expected
where ci.id = expected.catalog_item_id
  and ci.commercial_collection_id is distinct from expected.commercial_collection_id;