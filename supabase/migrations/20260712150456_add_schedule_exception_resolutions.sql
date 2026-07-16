create table if not exists pass.site_schedule_exception_resolutions (
  id uuid primary key default gen_random_uuid(),
  site_id uuid not null references public.sites(id) on delete cascade,
  order_id uuid not null references public.orders(id) on delete cascade,
  exception_date date not null,
  decision text not null check (decision in ('keep')),
  note text null,
  decided_by uuid not null references auth.users(id) on delete restrict,
  decided_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (order_id, exception_date)
);

create index if not exists site_schedule_exception_resolutions_site_date_idx
  on pass.site_schedule_exception_resolutions (site_id, exception_date);

alter table pass.site_schedule_exception_resolutions enable row level security;

revoke all on table pass.site_schedule_exception_resolutions from public, anon, authenticated;
grant select, insert, update, delete on table pass.site_schedule_exception_resolutions to service_role;