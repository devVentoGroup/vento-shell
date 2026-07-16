with candidates as (
  select cic.id
  from pass.catalog_item_collections cic
  where cic.is_active = true
    and cic.is_primary = false
    and not exists (
      select 1
      from pass.catalog_item_collections existing_primary
      where existing_primary.catalog_item_id = cic.catalog_item_id
        and existing_primary.is_primary = true
    )
    and cic.id = (
      select chosen.id
      from pass.catalog_item_collections chosen
      where chosen.catalog_item_id = cic.catalog_item_id
        and chosen.is_active = true
      order by chosen.sort_order asc nulls last, chosen.created_at asc, chosen.id asc
      limit 1
    )
)
update pass.catalog_item_collections cic
set is_primary = true,
    updated_at = now()
from candidates
where cic.id = candidates.id;