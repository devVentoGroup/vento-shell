begin;

update public.area_kinds
set
  name = 'Cocina / Barra',
  use_for_remission = true,
  is_active = true,
  updated_at = now()
where code = 'cocina_bar';

with cocina_bar_sites as (
  select distinct a.site_id
  from public.areas a
  join public.sites s on s.id = a.site_id
  where a.kind = 'cocina_bar'
    and coalesce(a.is_active, true) = true
    and coalesce(s.is_active, true) = true
)
insert into public.site_area_purpose_rules (site_id, area_kind, purpose, is_enabled)
select site_id, 'cocina_bar', purpose, true
from cocina_bar_sites
cross join (values ('remission'), ('production_recipe')) as purposes(purpose)
on conflict (site_id, area_kind, purpose)
do update set
  is_enabled = true,
  updated_at = now();

with cocina_bar_sites as (
  select distinct a.site_id
  from public.areas a
  join public.sites s on s.id = a.site_id
  where a.kind = 'cocina_bar'
    and coalesce(a.is_active, true) = true
    and coalesce(s.is_active, true) = true
)
update public.site_area_purpose_rules r
set
  is_enabled = false,
  updated_at = now()
from cocina_bar_sites cbs
where r.site_id = cbs.site_id
  and r.area_kind = 'general'
  and r.purpose = 'production_recipe'
  and r.is_enabled = true;

notify pgrst, 'reload schema';

commit;
