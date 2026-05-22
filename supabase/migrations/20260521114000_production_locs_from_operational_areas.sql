begin;

-- Permite que produccion use LOCs operativos reales del area, sin duplicar LOCs.
-- Un LOC puede ser destino productivo si:
-- 1) es location_type = production, o
-- 2) pertenece a un area activa cuyo kind esta habilitado para production_recipe en la sede.

insert into public.area_kinds (code, name, description, is_active)
values
  ('bar', 'Barra', 'Barra', true),
  ('cocina', 'Cocina', 'Cocina', true),
  ('cocina_bar', 'Cocina / barra', 'Cocina o barra operativa', true)
on conflict (code) do update
set
  name = excluded.name,
  description = excluded.description,
  is_active = true;

with vcf as (
  select id
  from public.sites
  where code in ('VCF', 'VENTO_CAFE')
     or lower(coalesce(name, '')) like '%vento caf%'
  limit 1
), enabled(area_kind) as (
  values ('bar'), ('cocina')
)
insert into public.site_area_purpose_rules (site_id, area_kind, purpose, is_enabled)
select vcf.id, enabled.area_kind, 'production_recipe', true
from vcf
cross join enabled
on conflict (site_id, area_kind, purpose)
do update set is_enabled = true, updated_at = now();

create or replace function public.validate_product_site_production_location()
returns trigger
language plpgsql
set search_path = public, pg_temp
as $$
declare
  v_location_site_id uuid;
  v_location_type text;
  v_location_active boolean;
  v_area_kind text;
  v_area_active boolean;
  v_area_enabled_for_recipe boolean := false;
begin
  if new.production_location_id is null then
    return new;
  end if;

  select loc.site_id,
         loc.location_type,
         coalesce(loc.is_active, true),
         area.kind,
         coalesce(area.is_active, true)
    into v_location_site_id,
         v_location_type,
         v_location_active,
         v_area_kind,
         v_area_active
  from public.inventory_locations loc
  left join public.areas area on area.id = loc.area_id
  where loc.id = new.production_location_id;

  if v_location_site_id is null then
    raise exception 'production_location_id % does not exist', new.production_location_id;
  end if;

  if v_location_site_id <> new.site_id then
    raise exception 'production_location_id % does not belong to product site %', new.production_location_id, new.site_id;
  end if;

  if not coalesce(v_location_active, false) then
    raise exception 'production_location_id % must be active', new.production_location_id;
  end if;

  if v_area_kind is not null and coalesce(v_area_active, false) then
    select exists (
      select 1
      from public.site_area_purpose_rules rule
      where rule.site_id = new.site_id
        and rule.area_kind = v_area_kind
        and rule.purpose = 'production_recipe'
        and coalesce(rule.is_enabled, true) = true
    ) into v_area_enabled_for_recipe;
  end if;

  if coalesce(v_location_type, '') <> 'production'
     and not coalesce(v_area_enabled_for_recipe, false) then
    raise exception 'production_location_id % must be a production LOC or belong to an area enabled for production_recipe', new.production_location_id;
  end if;

  return new;
end;
$$;

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
      ('reposteria'::text, 4),
      ('cocina'::text, 5),
      ('bar'::text, 6),
      ('cocina_bar'::text, 7)
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
