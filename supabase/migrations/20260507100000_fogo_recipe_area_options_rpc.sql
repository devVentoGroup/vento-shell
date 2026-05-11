begin;

-- Canonical area options for the FOGO cookbook/recipe editor.
-- This avoids direct UI dependence on public.areas RLS and deduplicates legacy
-- operational areas such as COCINA_CALIENTE vs COC-CAL.

with production_sites as (
  select id
  from public.sites
  where site_type = 'production_center'::public.site_type
    and coalesce(is_active, true) = true
),
preferred_cocina as (
  select a.site_id, a.id as keep_area_id
  from public.areas a
  join production_sites s on s.id = a.site_id
  where upper(coalesce(a.code, '')) = 'COC-CAL'
),
duplicate_cocina as (
  select a.id, a.site_id, p.keep_area_id
  from public.areas a
  join preferred_cocina p on p.site_id = a.site_id
  where a.id <> p.keep_area_id
    and (
      upper(coalesce(a.code, '')) = 'COCINA_CALIENTE'
      or lower(public._vento_slugify(coalesce(a.name, ''))) = 'cocina-caliente'
    )
)
update public.recipe_cards rc
set area_id = duplicate_cocina.keep_area_id
from duplicate_cocina
where rc.area_id = duplicate_cocina.id;

with production_sites as (
  select id
  from public.sites
  where site_type = 'production_center'::public.site_type
    and coalesce(is_active, true) = true
),
preferred_cocina as (
  select a.site_id, a.id as keep_area_id
  from public.areas a
  join production_sites s on s.id = a.site_id
  where upper(coalesce(a.code, '')) = 'COC-CAL'
),
duplicate_cocina as (
  select a.id, a.site_id, p.keep_area_id
  from public.areas a
  join preferred_cocina p on p.site_id = a.site_id
  where a.id <> p.keep_area_id
    and (
      upper(coalesce(a.code, '')) = 'COCINA_CALIENTE'
      or lower(public._vento_slugify(coalesce(a.name, ''))) = 'cocina-caliente'
    )
)
delete from public.employee_areas ea
using duplicate_cocina
where ea.area_id = duplicate_cocina.id
  and exists (
    select 1
    from public.employee_areas existing
    where existing.employee_id = ea.employee_id
      and existing.area_id = duplicate_cocina.keep_area_id
  );

with production_sites as (
  select id
  from public.sites
  where site_type = 'production_center'::public.site_type
    and coalesce(is_active, true) = true
),
preferred_cocina as (
  select a.site_id, a.id as keep_area_id
  from public.areas a
  join production_sites s on s.id = a.site_id
  where upper(coalesce(a.code, '')) = 'COC-CAL'
),
duplicate_cocina as (
  select a.id, a.site_id, p.keep_area_id
  from public.areas a
  join preferred_cocina p on p.site_id = a.site_id
  where a.id <> p.keep_area_id
    and (
      upper(coalesce(a.code, '')) = 'COCINA_CALIENTE'
      or lower(public._vento_slugify(coalesce(a.name, ''))) = 'cocina-caliente'
    )
)
update public.employee_areas ea
set area_id = duplicate_cocina.keep_area_id
from duplicate_cocina
where ea.area_id = duplicate_cocina.id;

with production_sites as (
  select id
  from public.sites
  where site_type = 'production_center'::public.site_type
    and coalesce(is_active, true) = true
),
preferred_cocina as (
  select a.site_id, a.id as keep_area_id
  from public.areas a
  join production_sites s on s.id = a.site_id
  where upper(coalesce(a.code, '')) = 'COC-CAL'
),
duplicate_cocina as (
  select a.id, a.site_id, p.keep_area_id
  from public.areas a
  join preferred_cocina p on p.site_id = a.site_id
  where a.id <> p.keep_area_id
    and (
      upper(coalesce(a.code, '')) = 'COCINA_CALIENTE'
      or lower(public._vento_slugify(coalesce(a.name, ''))) = 'cocina-caliente'
    )
)
update public.inventory_locations il
set area_id = duplicate_cocina.keep_area_id,
    updated_at = now()
from duplicate_cocina
where il.area_id = duplicate_cocina.id;

with production_sites as (
  select id
  from public.sites
  where site_type = 'production_center'::public.site_type
    and coalesce(is_active, true) = true
),
preferred_cocina as (
  select a.site_id, a.id as keep_area_id
  from public.areas a
  join production_sites s on s.id = a.site_id
  where upper(coalesce(a.code, '')) = 'COC-CAL'
),
duplicate_cocina as (
  select a.id, a.site_id, p.keep_area_id
  from public.areas a
  join preferred_cocina p on p.site_id = a.site_id
  where a.id <> p.keep_area_id
    and (
      upper(coalesce(a.code, '')) = 'COCINA_CALIENTE'
      or lower(public._vento_slugify(coalesce(a.name, ''))) = 'cocina-caliente'
    )
)
update public.areas a
set is_active = false
from duplicate_cocina
where a.id = duplicate_cocina.id;

create or replace function public.fogo_recipe_area_options(p_site_id uuid)
returns table (
  id uuid,
  code text,
  name text,
  kind text,
  site_id uuid
)
language sql
stable
security definer
set search_path = public, pg_temp
as $$
  with current_context as (
    select
      public.current_employee_role() as role,
      public.current_employee_area_id() as employee_area_id
  ),
  allowed_kind(area_kind, sort_order) as (
    values
      ('bodega'::text, 1),
      ('cocina_caliente'::text, 2),
      ('panaderia'::text, 3),
      ('reposteria'::text, 4)
  ),
  enabled_kind as (
    select ak.area_kind, ak.sort_order
    from allowed_kind ak
    where exists (
      select 1
      from public.site_area_purpose_rules rule
      where rule.site_id = p_site_id
        and rule.purpose = 'production_recipe'
        and rule.area_kind = ak.area_kind
        and coalesce(rule.is_enabled, true) = true
    )
    or not exists (
      select 1
      from public.site_area_purpose_rules rule
      where rule.site_id = p_site_id
        and rule.purpose = 'production_recipe'
    )
  ),
  candidate as (
    select
      a.id,
      a.code,
      a.name,
      a.kind,
      a.site_id,
      case
        when upper(coalesce(a.code, '')) = 'BODEGA'
          or lower(public._vento_slugify(coalesce(a.name, ''))) in ('bodega', 'bodega-principal')
          then 'bodega'
        when upper(coalesce(a.code, '')) in ('COC-CAL', 'COCINA_CALIENTE')
          or lower(public._vento_slugify(coalesce(a.name, ''))) = 'cocina-caliente'
          then 'cocina_caliente'
        when upper(coalesce(a.code, '')) = 'PAN-GALL'
          or lower(public._vento_slugify(coalesce(a.name, ''))) = 'galleteria-y-panaderia'
          then 'panaderia'
        when upper(coalesce(a.code, '')) = 'REPOSTERIA'
          or lower(public._vento_slugify(coalesce(a.name, ''))) = 'reposteria'
          then 'reposteria'
        else a.kind
      end as canonical_kind,
      case
        when upper(coalesce(a.code, '')) in ('BODEGA', 'COC-CAL', 'PAN-GALL', 'REPOSTERIA') then 0
        else 1
      end as preference
    from public.areas a
    where a.site_id = p_site_id
      and coalesce(a.is_active, true) = true
      and not (
        upper(coalesce(a.code, '')) in ('PAN', 'PANADERIA')
        or lower(public._vento_slugify(coalesce(a.name, ''))) = 'panaderia'
      )
  ),
  scoped as (
    select c.*, ek.sort_order
    from candidate c
    join enabled_kind ek on ek.area_kind = c.canonical_kind
    cross join current_context ctx
    where
      ctx.role in ('propietario', 'gerente_general')
      or (
        ctx.role = 'gerente'
        and public.can_access_site(p_site_id)
      )
      or (
        public.has_permission('fogo.production.recipe_book.view', p_site_id, c.id)
        and ctx.employee_area_id = c.id
      )
      or public.has_permission('fogo.production.recipes.manage', p_site_id, c.id)
  ),
  deduped as (
    select *,
      row_number() over (
        partition by canonical_kind
        order by preference asc, name asc, id asc
      ) as rn
    from scoped
  )
  select id, code, name, kind, site_id
  from deduped
  where rn = 1
  order by sort_order asc, name asc;
$$;

grant execute on function public.fogo_recipe_area_options(uuid) to authenticated;

commit;
