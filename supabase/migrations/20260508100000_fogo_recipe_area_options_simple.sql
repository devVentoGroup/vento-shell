begin;

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
  with candidate as (
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
  allowed as (
    select *
    from candidate
    where canonical_kind in ('bodega', 'cocina_caliente', 'panaderia', 'reposteria')
  ),
  deduped as (
    select *,
      row_number() over (
        partition by canonical_kind
        order by preference asc, name asc, id asc
      ) as rn,
      case canonical_kind
        when 'bodega' then 1
        when 'cocina_caliente' then 2
        when 'panaderia' then 3
        when 'reposteria' then 4
        else 99
      end as sort_order
    from allowed
  )
  select id, code, name, kind, site_id
  from deduped
  where rn = 1
  order by sort_order asc, name asc;
$$;

grant execute on function public.fogo_recipe_area_options(uuid) to authenticated;

notify pgrst, 'reload schema';

commit;
