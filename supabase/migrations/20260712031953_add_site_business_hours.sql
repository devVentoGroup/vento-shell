create table if not exists pass.site_business_hours (
  id uuid primary key default gen_random_uuid(),
  site_id uuid not null references public.sites(id) on delete cascade,
  iso_weekday smallint not null check (iso_weekday between 1 and 7),
  opens_at time without time zone,
  closes_at time without time zone,
  is_closed boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint site_business_hours_unique_day unique (site_id, iso_weekday),
  constraint site_business_hours_valid_times check (
    (is_closed = true and opens_at is null and closes_at is null)
    or
    (is_closed = false and opens_at is not null and closes_at is not null and closes_at > opens_at)
  )
);

comment on table pass.site_business_hours is 'Horario semanal habitual de operación por sede.';
comment on column pass.site_business_hours.iso_weekday is 'Día ISO: lunes=1, domingo=7.';
comment on column pass.site_business_hours.is_closed is 'Indica que la sede permanece cerrada todo el día.';

create index if not exists site_business_hours_site_idx
  on pass.site_business_hours(site_id, iso_weekday);

alter table pass.site_business_hours enable row level security;

revoke all on table pass.site_business_hours from public, anon, authenticated;
grant all on table pass.site_business_hours to service_role;

insert into pass.site_business_hours (site_id, iso_weekday, opens_at, closes_at, is_closed)
select s.id, d.iso_weekday, null, null, true
from public.sites s
cross join generate_series(1, 7) as d(iso_weekday)
where exists (
  select 1 from pass.pass_satellites ps where ps.site_id = s.id
)
on conflict (site_id, iso_weekday) do nothing;

update pass.site_business_hours h
set opens_at = src.slot_start,
    closes_at = src.slot_end,
    is_closed = false,
    updated_at = now()
from (
  select site_id, iso_weekday, min(slot_start) as slot_start, max(slot_end) as slot_end
  from pass.site_delivery_slots
  where is_active = true
  group by site_id, iso_weekday
) src
where h.site_id = src.site_id
  and h.iso_weekday = src.iso_weekday;