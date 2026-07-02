begin;

alter table public.site_operational_capabilities
  add column if not exists can_schedule_staff boolean not null default false;

comment on column public.site_operational_capabilities.can_schedule_staff is
  'La sede aparece en VISO para programacion semanal de personal.';

update public.site_operational_capabilities soc
set can_schedule_staff = true
from public.sites s
where s.id = soc.site_id
  and coalesce(s.operational_visibility, 'operational') = 'operational'
  and coalesce(s.type, '') <> 'checkin_point'
  and s.site_type::text in ('satellite', 'production_center', 'admin');

insert into public.site_operational_capabilities (
  site_id,
  can_schedule_staff
)
select
  s.id,
  true
from public.sites s
where coalesce(s.operational_visibility, 'operational') = 'operational'
  and coalesce(s.type, '') <> 'checkin_point'
  and s.site_type::text in ('satellite', 'production_center', 'admin')
on conflict (site_id) do update
set can_schedule_staff = excluded.can_schedule_staff;

commit;
