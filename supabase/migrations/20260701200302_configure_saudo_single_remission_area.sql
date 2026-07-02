with saudo as (
  select id as site_id
  from public.sites
  where code = 'SAUDO'
  limit 1
), source_categories as (
  select
    psarc.product_id,
    psarc.site_id,
    psarc.remission_category_id,
    psarc.updated_by
  from public.product_site_area_remission_categories psarc
  join saudo on saudo.site_id = psarc.site_id
  where psarc.remission_category_id is not null
)
insert into public.product_site_area_remission_categories (
  product_id,
  site_id,
  area_kind,
  remission_category_id,
  created_at,
  updated_at,
  updated_by
)
select distinct on (product_id, site_id)
  product_id,
  site_id,
  'general',
  remission_category_id,
  now(),
  now(),
  updated_by
from source_categories
order by product_id, site_id, remission_category_id
on conflict (product_id, site_id, area_kind)
do update set
  remission_category_id = excluded.remission_category_id,
  updated_at = now(),
  updated_by = excluded.updated_by;

with saudo as (
  select id as site_id
  from public.sites
  where code = 'SAUDO'
  limit 1
)
delete from public.product_site_area_remission_categories psarc
using saudo
where psarc.site_id = saudo.site_id
  and psarc.area_kind <> 'general';

with saudo as (
  select id as site_id
  from public.sites
  where code = 'SAUDO'
  limit 1
)
insert into public.site_area_purpose_rules (
  site_id,
  area_kind,
  purpose,
  is_enabled,
  created_at,
  updated_at
)
select
  site_id,
  'general',
  'remission',
  true,
  now(),
  now()
from saudo
on conflict (site_id, area_kind, purpose)
do update set
  is_enabled = true,
  updated_at = now();

with saudo as (
  select id as site_id
  from public.sites
  where code = 'SAUDO'
  limit 1
)
update public.site_area_purpose_rules r
set
  is_enabled = false,
  updated_at = now()
from saudo
where r.site_id = saudo.site_id
  and r.purpose = 'remission'
  and r.area_kind <> 'general';

notify pgrst, 'reload schema';
