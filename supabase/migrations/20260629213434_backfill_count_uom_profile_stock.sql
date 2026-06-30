begin;

create temporary table tmp_count_uom_profile_backfill on commit drop as
with applied_lines as (
  select
    loc.site_id,
    s.scope_location_id as location_id,
    l.location_position_id,
    l.product_id,
    l.input_uom_profile_id as uom_profile_id,
    coalesce(l.input_quantity, 0) as presentation_qty,
    coalesce(l.quantity_counted, 0) as base_qty,
    coalesce(l.adjustment_applied_at, s.closed_at, s.created_at) as applied_at,
    l.id as line_id
  from public.inventory_count_sessions s
  join public.inventory_count_lines l
    on l.session_id = s.id
  join public.inventory_locations loc
    on loc.id = s.scope_location_id
  join public.product_uom_profiles profile
    on profile.id = l.input_uom_profile_id
   and profile.product_id = l.product_id
   and coalesce(profile.is_active, true) = true
  where s.scope_type = 'loc'
    and s.scope_location_id is not null
    and l.input_uom_profile_id is not null
    and l.adjustment_applied_at is not null
    and coalesce(l.input_quantity, 0) > 0
    and coalesce(l.quantity_counted, 0) > 0
),
ranked_lines as (
  select
    *,
    row_number() over (
      partition by location_id, location_position_id, product_id, uom_profile_id
      order by applied_at desc, line_id desc
    ) as rn
  from applied_lines
)
select
  site_id,
  location_id,
  location_position_id,
  product_id,
  uom_profile_id,
  presentation_qty,
  base_qty
from ranked_lines
where rn = 1;

update public.inventory_stock_by_uom_profile stock
set presentation_qty = 0,
    base_qty = 0,
    updated_at = now()
where exists (
    select 1
    from tmp_count_uom_profile_backfill counted
    where counted.location_id = stock.location_id
      and counted.product_id = stock.product_id
      and (
        (counted.location_position_id is null and stock.location_position_id is null)
        or counted.location_position_id = stock.location_position_id
      )
  )
  and not exists (
    select 1
    from tmp_count_uom_profile_backfill counted
    where counted.location_id = stock.location_id
      and counted.product_id = stock.product_id
      and counted.uom_profile_id = stock.uom_profile_id
      and (
        (counted.location_position_id is null and stock.location_position_id is null)
        or counted.location_position_id = stock.location_position_id
      )
  );

insert into public.inventory_stock_by_uom_profile (
  site_id,
  location_id,
  location_position_id,
  product_id,
  uom_profile_id,
  presentation_qty,
  base_qty,
  updated_at
)
select
  site_id,
  location_id,
  null,
  product_id,
  uom_profile_id,
  presentation_qty,
  base_qty,
  now()
from tmp_count_uom_profile_backfill
where location_position_id is null
on conflict (location_id, product_id, uom_profile_id) where location_position_id is null do update
  set site_id = excluded.site_id,
      presentation_qty = excluded.presentation_qty,
      base_qty = excluded.base_qty,
      updated_at = now();

insert into public.inventory_stock_by_uom_profile (
  site_id,
  location_id,
  location_position_id,
  product_id,
  uom_profile_id,
  presentation_qty,
  base_qty,
  updated_at
)
select
  site_id,
  location_id,
  location_position_id,
  product_id,
  uom_profile_id,
  presentation_qty,
  base_qty,
  now()
from tmp_count_uom_profile_backfill
where location_position_id is not null
on conflict (location_id, location_position_id, product_id, uom_profile_id) where location_position_id is not null do update
  set site_id = excluded.site_id,
      presentation_qty = excluded.presentation_qty,
      base_qty = excluded.base_qty,
      updated_at = now();

commit;
