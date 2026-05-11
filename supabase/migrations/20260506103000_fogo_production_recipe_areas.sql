begin;

-- FOGO recipe areas must match the production-center operating areas.
-- Keep Panaderia consolidated under Galleteria y panaderia.

alter table public.site_area_purpose_rules
  drop constraint if exists site_area_purpose_rules_purpose_chk;

alter table public.site_area_purpose_rules
  add constraint site_area_purpose_rules_purpose_chk
    check (purpose in ('remission', 'production_recipe'));

insert into public.area_kinds (code, name, description, is_active)
values
  ('bodega', 'Bodega', 'Bodega y almacenamiento', true),
  ('cocina_caliente', 'Cocina caliente', 'Cocina caliente', true),
  ('panaderia', 'Galleteria y panaderia', 'Galleteria y panaderia', true),
  ('reposteria', 'Reposteria', 'Reposteria', true)
on conflict (code) do update
set
  name = excluded.name,
  description = excluded.description,
  is_active = true;

with target_sites as (
  select id
  from public.sites
  where site_type = 'production_center'::public.site_type
    and coalesce(is_active, true) = true
),
area_seed(code, name, kind, sort_order) as (
  values
    ('BODEGA', 'Bodega', 'bodega', 1),
    ('COC-CAL', 'Cocina caliente', 'cocina_caliente', 2),
    ('PAN-GALL', 'Galleteria y panaderia', 'panaderia', 3),
    ('REPOSTERIA', 'Reposteria', 'reposteria', 4)
)
insert into public.areas (site_id, code, name, kind, is_active)
select
  target_sites.id,
  area_seed.code,
  area_seed.name,
  area_seed.kind,
  true
from target_sites
cross join area_seed
on conflict (site_id, code) do update
set
  name = excluded.name,
  kind = excluded.kind,
  is_active = true;

with production_sites as (
  select id
  from public.sites
  where site_type = 'production_center'::public.site_type
    and coalesce(is_active, true) = true
),
replacement as (
  select site_id, id as replacement_area_id
  from public.areas
  where upper(code) = 'PAN-GALL'
),
standalone_panaderia as (
  select a.id, a.site_id, r.replacement_area_id
  from public.areas a
  join production_sites s on s.id = a.site_id
  join replacement r on r.site_id = a.site_id
  where a.id <> r.replacement_area_id
    and (
      upper(coalesce(a.code, '')) in ('PAN', 'PANADERIA')
      or lower(public._vento_slugify(coalesce(a.name, ''))) = 'panaderia'
    )
)
update public.recipe_cards rc
set area_id = standalone_panaderia.replacement_area_id
from standalone_panaderia
where rc.area_id = standalone_panaderia.id;

with production_sites as (
  select id
  from public.sites
  where site_type = 'production_center'::public.site_type
    and coalesce(is_active, true) = true
),
replacement as (
  select site_id, id as replacement_area_id
  from public.areas
  where upper(code) = 'PAN-GALL'
),
standalone_panaderia as (
  select a.id, a.site_id, r.replacement_area_id
  from public.areas a
  join production_sites s on s.id = a.site_id
  join replacement r on r.site_id = a.site_id
  where a.id <> r.replacement_area_id
    and (
      upper(coalesce(a.code, '')) in ('PAN', 'PANADERIA')
      or lower(public._vento_slugify(coalesce(a.name, ''))) = 'panaderia'
    )
)
delete from public.employee_areas ea
using standalone_panaderia
where ea.area_id = standalone_panaderia.id
  and exists (
    select 1
    from public.employee_areas existing
    where existing.employee_id = ea.employee_id
      and existing.area_id = standalone_panaderia.replacement_area_id
  );

with production_sites as (
  select id
  from public.sites
  where site_type = 'production_center'::public.site_type
    and coalesce(is_active, true) = true
),
replacement as (
  select site_id, id as replacement_area_id
  from public.areas
  where upper(code) = 'PAN-GALL'
),
standalone_panaderia as (
  select a.id, a.site_id, r.replacement_area_id
  from public.areas a
  join production_sites s on s.id = a.site_id
  join replacement r on r.site_id = a.site_id
  where a.id <> r.replacement_area_id
    and (
      upper(coalesce(a.code, '')) in ('PAN', 'PANADERIA')
      or lower(public._vento_slugify(coalesce(a.name, ''))) = 'panaderia'
    )
)
update public.employee_areas ea
set area_id = standalone_panaderia.replacement_area_id
from standalone_panaderia
where ea.area_id = standalone_panaderia.id;

with production_sites as (
  select id
  from public.sites
  where site_type = 'production_center'::public.site_type
    and coalesce(is_active, true) = true
),
replacement as (
  select site_id, id as replacement_area_id
  from public.areas
  where upper(code) = 'PAN-GALL'
),
standalone_panaderia as (
  select a.id, a.site_id, r.replacement_area_id
  from public.areas a
  join production_sites s on s.id = a.site_id
  join replacement r on r.site_id = a.site_id
  where a.id <> r.replacement_area_id
    and (
      upper(coalesce(a.code, '')) in ('PAN', 'PANADERIA')
      or lower(public._vento_slugify(coalesce(a.name, ''))) = 'panaderia'
    )
)
delete from public.employee_permissions ep
using standalone_panaderia
where ep.scope_area_id = standalone_panaderia.id
  and exists (
    select 1
    from public.employee_permissions existing
    where existing.employee_id = ep.employee_id
      and existing.permission_id = ep.permission_id
      and existing.scope_type = ep.scope_type
      and existing.scope_site_id is not distinct from ep.scope_site_id
      and existing.scope_area_id is not distinct from standalone_panaderia.replacement_area_id
      and existing.scope_site_type is not distinct from ep.scope_site_type
      and existing.scope_area_kind is not distinct from ep.scope_area_kind
  );

with production_sites as (
  select id
  from public.sites
  where site_type = 'production_center'::public.site_type
    and coalesce(is_active, true) = true
),
replacement as (
  select site_id, id as replacement_area_id
  from public.areas
  where upper(code) = 'PAN-GALL'
),
standalone_panaderia as (
  select a.id, a.site_id, r.replacement_area_id
  from public.areas a
  join production_sites s on s.id = a.site_id
  join replacement r on r.site_id = a.site_id
  where a.id <> r.replacement_area_id
    and (
      upper(coalesce(a.code, '')) in ('PAN', 'PANADERIA')
      or lower(public._vento_slugify(coalesce(a.name, ''))) = 'panaderia'
    )
)
update public.employee_permissions ep
set scope_area_id = standalone_panaderia.replacement_area_id
from standalone_panaderia
where ep.scope_area_id = standalone_panaderia.id;

with production_sites as (
  select id
  from public.sites
  where site_type = 'production_center'::public.site_type
    and coalesce(is_active, true) = true
),
replacement as (
  select site_id, id as replacement_area_id
  from public.areas
  where upper(code) = 'PAN-GALL'
),
standalone_panaderia as (
  select a.id, a.site_id, r.replacement_area_id
  from public.areas a
  join production_sites s on s.id = a.site_id
  join replacement r on r.site_id = a.site_id
  where a.id <> r.replacement_area_id
    and (
      upper(coalesce(a.code, '')) in ('PAN', 'PANADERIA')
      or lower(public._vento_slugify(coalesce(a.name, ''))) = 'panaderia'
    )
)
update public.inventory_locations il
set area_id = standalone_panaderia.replacement_area_id,
    updated_at = now()
from standalone_panaderia
where il.area_id = standalone_panaderia.id;

with production_sites as (
  select id
  from public.sites
  where site_type = 'production_center'::public.site_type
    and coalesce(is_active, true) = true
),
standalone_panaderia as (
  select a.id
  from public.areas a
  join production_sites s on s.id = a.site_id
  where (
    upper(coalesce(a.code, '')) in ('PAN', 'PANADERIA')
    or lower(public._vento_slugify(coalesce(a.name, ''))) = 'panaderia'
  )
    and upper(coalesce(a.code, '')) <> 'PAN-GALL'
)
update public.areas a
set is_active = false
from standalone_panaderia
where a.id = standalone_panaderia.id;

with target_sites as (
  select id
  from public.sites
  where site_type = 'production_center'::public.site_type
    and coalesce(is_active, true) = true
),
allowed(area_kind) as (
  values
    ('bodega'),
    ('cocina_caliente'),
    ('panaderia'),
    ('reposteria')
)
insert into public.site_area_purpose_rules (site_id, area_kind, purpose, is_enabled)
select target_sites.id, allowed.area_kind, 'production_recipe', true
from target_sites
cross join allowed
on conflict (site_id, area_kind, purpose)
do update set is_enabled = true, updated_at = now();

update public.site_area_purpose_rules sapr
set is_enabled = false,
    updated_at = now()
from public.sites s
where s.id = sapr.site_id
  and s.site_type = 'production_center'::public.site_type
  and sapr.purpose = 'production_recipe'
  and sapr.area_kind not in ('bodega', 'cocina_caliente', 'panaderia', 'reposteria');

comment on column public.site_area_purpose_rules.purpose is
  'Proposito operativo. Valores: remission, production_recipe.';

commit;
