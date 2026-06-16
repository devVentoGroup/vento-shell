begin;

alter table public.site_operational_capabilities
  add column if not exists operation_model text not null default 'multi_area',
  add column if not exists primary_operational_location_id uuid null references public.inventory_locations(id) on delete set null;

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'site_operational_capabilities_operation_model_chk'
  ) then
    alter table public.site_operational_capabilities
      add constraint site_operational_capabilities_operation_model_chk
      check (operation_model in ('single_loc', 'multi_area', 'multi_loc'));
  end if;
end
$$;

comment on column public.site_operational_capabilities.operation_model is
  'Modelo operativo gerencial de la sede: single_loc, multi_area o multi_loc.';

comment on column public.site_operational_capabilities.primary_operational_location_id is
  'LOC principal usado por sedes single_loc para recibir, almacenar, vender y producir sin traslados internos.';

create index if not exists idx_site_operational_capabilities_primary_loc
  on public.site_operational_capabilities(primary_operational_location_id)
  where primary_operational_location_id is not null;

-- Default conservador: si una sede activa tiene un solo LOC activo, puede operar como LOC único.
with active_location_counts as (
  select
    s.id as site_id,
    count(l.id) filter (where coalesce(l.is_active, true) = true) as active_loc_count,
    (array_agg(l.id order by l.created_at, l.id) filter (where coalesce(l.is_active, true) = true))[1] as only_loc_id
  from public.sites s
  left join public.inventory_locations l on l.site_id = s.id
  where coalesce(s.is_active, true) = true
  group by s.id
)
update public.site_operational_capabilities cap
set
  operation_model = case
    when c.active_loc_count = 1 then 'single_loc'
    else coalesce(nullif(cap.operation_model, ''), 'multi_area')
  end,
  primary_operational_location_id = case
    when c.active_loc_count = 1 then c.only_loc_id
    else cap.primary_operational_location_id
  end,
  updated_at = now()
from active_location_counts c
where c.site_id = cap.site_id
  and (
    (c.active_loc_count = 1 and cap.operation_model is distinct from 'single_loc')
    or (c.active_loc_count = 1 and cap.primary_operational_location_id is distinct from c.only_loc_id)
  );

commit;
