create table if not exists viso.role_concurrency_limits (
  id uuid primary key default gen_random_uuid(),
  site_id uuid null references public.sites (id) on delete cascade,
  role_code text not null,
  day_of_week integer null check (day_of_week is null or day_of_week between 0 and 6),
  start_time time null,
  end_time time null,
  max_concurrent integer not null default 1 check (max_concurrent >= 0),
  applies_across_sites boolean not null default true,
  is_active boolean not null default true,
  notes text null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  check (
    (start_time is null and end_time is null)
    or (start_time is not null and end_time is not null and start_time < end_time)
  )
);

create unique index if not exists uq_viso_role_concurrency_limits_scope
  on viso.role_concurrency_limits (
    coalesce(site_id, '00000000-0000-0000-0000-000000000000'::uuid),
    role_code,
    coalesce(day_of_week, -1),
    coalesce(start_time, '00:00:00'::time),
    coalesce(end_time, '23:59:59'::time),
    applies_across_sites
  );

create index if not exists idx_viso_role_concurrency_limits_lookup
  on viso.role_concurrency_limits (
    role_code,
    is_active,
    applies_across_sites,
    site_id,
    day_of_week
  );

alter table viso.role_concurrency_limits enable row level security;

grant all privileges on table viso.role_concurrency_limits to service_role;

comment on table viso.role_concurrency_limits is
  'Limites configurables de personal simultaneo por rol operativo para el planner de horarios.';

comment on column viso.role_concurrency_limits.site_id is
  'Cuando es null, el limite es global. Cuando tiene sede, aplica a esa sede o al grupo segun applies_across_sites.';

comment on column viso.role_concurrency_limits.applies_across_sites is
  'Si es true, el maximo se cuenta cruzando sedes. Si es false, se cuenta solo dentro de la sede indicada.';
