begin;

-- Saudo ya tiene un LOC operativo real asociado al area "general".
-- No se crea un LOC duplicado: se habilita esa area para produccion local.
with saudo as (
  select id
  from public.sites
  where is_active = true
    and (
      upper(coalesce(code, '')) = 'SAU'
      or lower(public._vento_slugify(coalesce(name, ''))) like '%saudo%'
    )
  limit 1
)
insert into public.site_area_purpose_rules (site_id, area_kind, purpose, is_enabled)
select id, 'general', 'production_recipe', true
from saudo
on conflict (site_id, area_kind, purpose)
do update set is_enabled = true, updated_at = now();

with saudo as (
  select id
  from public.sites
  where is_active = true
    and (
      upper(coalesce(code, '')) = 'SAU'
      or lower(public._vento_slugify(coalesce(name, ''))) like '%saudo%'
    )
  limit 1
)
insert into public.site_purpose_settings (site_id, purpose, mode)
select id, 'production_recipe', 'custom'
from saudo
on conflict (site_id, purpose)
do update set mode = 'custom', updated_at = now();

with saudo as (
  select id
  from public.sites
  where is_active = true
    and (
      upper(coalesce(code, '')) = 'SAU'
      or lower(public._vento_slugify(coalesce(name, ''))) like '%saudo%'
    )
  limit 1
)
update public.site_operational_capabilities c
set
  can_produce = true,
  can_hold_inventory = true,
  show_in_product_setup = true,
  updated_at = now()
from saudo
where c.site_id = saudo.id;

commit;
