insert into pass.commercial_collection_categories (
  collection_id,
  commercial_category_id,
  sort_order
)
select
  collection.id,
  category.id,
  coalesce(category.sort_order, 0)
from pass.commercial_collections collection
join pass.commercial_categories category
  on category.site_id = collection.site_id
where collection.is_active = true
  and collection.kind = 'main'
  and category.is_active = true
on conflict (collection_id, commercial_category_id) do nothing;

create or replace function pass.sync_active_category_to_main_collections()
returns trigger
language plpgsql
security definer
set search_path = public, pass
as $function$
begin
  if new.is_active = true then
    insert into pass.commercial_collection_categories (
      collection_id,
      commercial_category_id,
      sort_order
    )
    select
      collection.id,
      new.id,
      coalesce(new.sort_order, 0)
    from pass.commercial_collections collection
    where collection.site_id = new.site_id
      and collection.is_active = true
      and collection.kind = 'main'
    on conflict (collection_id, commercial_category_id) do update
    set sort_order = excluded.sort_order;
  end if;

  return new;
end;
$function$;

drop trigger if exists pass_commercial_categories_sync_main_collections
on pass.commercial_categories;

create trigger pass_commercial_categories_sync_main_collections
after insert or update of site_id, is_active, sort_order
on pass.commercial_categories
for each row
execute function pass.sync_active_category_to_main_collections();

create or replace function pass.sync_main_collection_categories()
returns trigger
language plpgsql
security definer
set search_path = public, pass
as $function$
begin
  if new.is_active = true and new.kind = 'main' then
    insert into pass.commercial_collection_categories (
      collection_id,
      commercial_category_id,
      sort_order
    )
    select
      new.id,
      category.id,
      coalesce(category.sort_order, 0)
    from pass.commercial_categories category
    where category.site_id = new.site_id
      and category.is_active = true
    on conflict (collection_id, commercial_category_id) do update
    set sort_order = excluded.sort_order;
  end if;

  return new;
end;
$function$;

drop trigger if exists pass_commercial_collections_sync_categories
on pass.commercial_collections;

create trigger pass_commercial_collections_sync_categories
after insert or update of site_id, kind, is_active
on pass.commercial_collections
for each row
execute function pass.sync_main_collection_categories();