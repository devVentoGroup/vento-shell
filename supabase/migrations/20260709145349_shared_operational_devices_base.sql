create table if not exists public.shared_operational_devices (
  id uuid primary key default gen_random_uuid(),
  code text not null,
  label text not null,
  description text,
  device_type text not null default 'shared_terminal',
  auth_user_id uuid unique references auth.users(id) on delete set null,
  site_id uuid not null references public.sites(id),
  area_id uuid references public.areas(id),
  default_app_code text not null default 'nexo' references public.apps(code),
  mode text not null default 'shared_device',
  requires_actor_pin boolean not null default true,
  requires_active_actor_shift boolean not null default true,
  allow_actor_without_pin boolean not null default false,
  allow_actions_without_actor boolean not null default false,
  activation_status text not null default 'draft',
  is_active boolean not null default true,
  last_seen_at timestamptz,
  created_by uuid references public.employees(id),
  updated_by uuid references public.employees(id),
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint shared_operational_devices_code_key unique (code),
  constraint shared_operational_devices_code_not_blank check (btrim(code) <> ''),
  constraint shared_operational_devices_label_not_blank check (btrim(label) <> ''),
  constraint shared_operational_devices_device_type_check check (
    device_type in (
      'shared_terminal',
      'pos_terminal',
      'kiosk',
      'tablet',
      'reception_terminal',
      'production_terminal',
      'warehouse_terminal'
    )
  ),
  constraint shared_operational_devices_mode_check check (mode = 'shared_device'),
  constraint shared_operational_devices_activation_status_check check (
    activation_status in ('draft', 'pending_activation', 'active', 'suspended', 'revoked')
  ),
  constraint shared_operational_devices_actor_policy_check check (
    not allow_actions_without_actor or allow_actor_without_pin
  )
);

create table if not exists public.shared_operational_device_apps (
  id uuid primary key default gen_random_uuid(),
  device_id uuid not null references public.shared_operational_devices(id) on delete cascade,
  app_code text not null references public.apps(code),
  is_default boolean not null default false,
  is_active boolean not null default true,
  created_at timestamptz not null default now(),
  constraint shared_operational_device_apps_unique unique (device_id, app_code)
);

create unique index if not exists shared_operational_device_apps_one_default_idx
  on public.shared_operational_device_apps(device_id)
  where is_default;

create table if not exists public.shared_operational_device_actor_sessions (
  id uuid primary key default gen_random_uuid(),
  device_id uuid not null references public.shared_operational_devices(id) on delete cascade,
  actor_employee_id uuid not null references public.employees(id),
  actor_shift_id uuid references public.employee_shifts(id),
  actor_operational_role text,
  site_id uuid references public.sites(id),
  area_id uuid references public.areas(id),
  started_at timestamptz not null default now(),
  expires_at timestamptz,
  ended_at timestamptz,
  ended_reason text,
  created_at timestamptz not null default now(),
  constraint shared_operational_device_actor_sessions_time_check check (
    expires_at is null or expires_at > started_at
  ),
  constraint shared_operational_device_actor_sessions_end_check check (
    ended_at is null or ended_at >= started_at
  )
);

create unique index if not exists shared_operational_device_actor_sessions_one_open_idx
  on public.shared_operational_device_actor_sessions(device_id)
  where ended_at is null;

create table if not exists public.shared_operational_device_events (
  id uuid primary key default gen_random_uuid(),
  device_id uuid references public.shared_operational_devices(id) on delete set null,
  session_user_id uuid references auth.users(id) on delete set null,
  actor_employee_id uuid references public.employees(id) on delete set null,
  actor_shift_id uuid references public.employee_shifts(id) on delete set null,
  app_code text references public.apps(code),
  site_id uuid references public.sites(id),
  area_id uuid references public.areas(id),
  event_type text not null,
  event_payload jsonb not null default '{}'::jsonb,
  source text not null default 'shared_device',
  occurred_at timestamptz not null default now(),
  created_at timestamptz not null default now(),
  constraint shared_operational_device_events_event_type_not_blank check (btrim(event_type) <> ''),
  constraint shared_operational_device_events_source_check check (source in ('shared_device', 'system', 'admin'))
);

create index if not exists shared_operational_devices_auth_user_id_idx
  on public.shared_operational_devices(auth_user_id);

create index if not exists shared_operational_devices_site_area_idx
  on public.shared_operational_devices(site_id, area_id);

create index if not exists shared_operational_devices_active_status_idx
  on public.shared_operational_devices(is_active, activation_status);

create index if not exists shared_operational_device_apps_app_code_idx
  on public.shared_operational_device_apps(app_code)
  where is_active;

create index if not exists shared_operational_device_events_device_time_idx
  on public.shared_operational_device_events(device_id, occurred_at desc);

create index if not exists shared_operational_device_events_actor_time_idx
  on public.shared_operational_device_events(actor_employee_id, occurred_at desc);

create or replace function public.validate_shared_operational_device_area_site()
returns trigger
language plpgsql
set search_path = public
as $$
begin
  if new.area_id is not null and not exists (
    select 1
    from public.areas a
    where a.id = new.area_id
      and a.site_id = new.site_id
  ) then
    raise exception 'El area_id % no pertenece a la sede %', new.area_id, new.site_id;
  end if;

  return new;
end;
$$;

drop trigger if exists trg_shared_operational_devices_area_site on public.shared_operational_devices;
create trigger trg_shared_operational_devices_area_site
before insert or update of site_id, area_id on public.shared_operational_devices
for each row execute function public.validate_shared_operational_device_area_site();

drop trigger if exists trg_shared_operational_devices_updated_at on public.shared_operational_devices;
create trigger trg_shared_operational_devices_updated_at
before update on public.shared_operational_devices
for each row execute function public._set_updated_at();

create or replace view public.shared_operational_devices_admin_v1 as
select
  d.id,
  d.code,
  d.label,
  d.description,
  d.device_type,
  d.auth_user_id,
  d.site_id,
  s.name as site_name,
  s.code as site_code,
  d.area_id,
  a.name as area_name,
  a.code as area_code,
  d.default_app_code,
  d.requires_actor_pin,
  d.requires_active_actor_shift,
  d.allow_actor_without_pin,
  d.allow_actions_without_actor,
  d.activation_status,
  d.is_active,
  d.last_seen_at,
  coalesce(
    array_agg(da.app_code order by da.app_code) filter (where da.is_active),
    '{}'::text[]
  ) as allowed_app_codes,
  d.metadata,
  d.created_at,
  d.updated_at
from public.shared_operational_devices d
join public.sites s on s.id = d.site_id
left join public.areas a on a.id = d.area_id
left join public.shared_operational_device_apps da on da.device_id = d.id
group by d.id, s.id, a.id;

create or replace function public.current_shared_operational_device_v1()
returns table (
  id uuid,
  code text,
  label text,
  description text,
  device_type text,
  site_id uuid,
  area_id uuid,
  default_app_code text,
  requires_actor_pin boolean,
  requires_active_actor_shift boolean,
  allow_actor_without_pin boolean,
  allow_actions_without_actor boolean,
  allowed_app_codes text[],
  metadata jsonb
)
language sql
stable
security definer
set search_path = public, auth
as $$
  select
    d.id,
    d.code,
    d.label,
    d.description,
    d.device_type,
    d.site_id,
    d.area_id,
    d.default_app_code,
    d.requires_actor_pin,
    d.requires_active_actor_shift,
    d.allow_actor_without_pin,
    d.allow_actions_without_actor,
    coalesce(
      array_agg(da.app_code order by da.app_code) filter (where da.is_active),
      '{}'::text[]
    ) as allowed_app_codes,
    d.metadata
  from public.shared_operational_devices d
  left join public.shared_operational_device_apps da on da.device_id = d.id
  where d.auth_user_id = auth.uid()
    and d.is_active
    and d.activation_status = 'active'
  group by d.id;
$$;

create or replace function public.current_shared_device_can_access_app(app_code_input text)
returns boolean
language sql
stable
security definer
set search_path = public, auth
as $$
  select exists (
    select 1
    from public.shared_operational_devices d
    join public.shared_operational_device_apps da on da.device_id = d.id
    where d.auth_user_id = auth.uid()
      and d.is_active
      and d.activation_status = 'active'
      and da.is_active
      and da.app_code = app_code_input
  );
$$;

alter table public.shared_operational_devices enable row level security;
alter table public.shared_operational_device_apps enable row level security;
alter table public.shared_operational_device_actor_sessions enable row level security;
alter table public.shared_operational_device_events enable row level security;

drop policy if exists shared_operational_devices_select_own on public.shared_operational_devices;
create policy shared_operational_devices_select_own
on public.shared_operational_devices
for select
to authenticated
using (auth.uid() = auth_user_id);

drop policy if exists shared_operational_device_apps_select_own_device on public.shared_operational_device_apps;
create policy shared_operational_device_apps_select_own_device
on public.shared_operational_device_apps
for select
to authenticated
using (
  exists (
    select 1
    from public.shared_operational_devices d
    where d.id = shared_operational_device_apps.device_id
      and d.auth_user_id = auth.uid()
  )
);

drop policy if exists shared_operational_device_actor_sessions_select_own_device on public.shared_operational_device_actor_sessions;
create policy shared_operational_device_actor_sessions_select_own_device
on public.shared_operational_device_actor_sessions
for select
to authenticated
using (
  exists (
    select 1
    from public.shared_operational_devices d
    where d.id = shared_operational_device_actor_sessions.device_id
      and d.auth_user_id = auth.uid()
  )
);

drop policy if exists shared_operational_device_events_insert_own_device on public.shared_operational_device_events;
create policy shared_operational_device_events_insert_own_device
on public.shared_operational_device_events
for insert
to authenticated
with check (
  session_user_id = auth.uid()
  and exists (
    select 1
    from public.shared_operational_devices d
    where d.id = shared_operational_device_events.device_id
      and d.auth_user_id = auth.uid()
      and d.is_active
      and d.activation_status = 'active'
  )
);

drop policy if exists shared_operational_device_events_select_own_device on public.shared_operational_device_events;
create policy shared_operational_device_events_select_own_device
on public.shared_operational_device_events
for select
to authenticated
using (
  exists (
    select 1
    from public.shared_operational_devices d
    where d.id = shared_operational_device_events.device_id
      and d.auth_user_id = auth.uid()
  )
);

grant select on public.shared_operational_devices_admin_v1 to authenticated;
grant execute on function public.current_shared_operational_device_v1() to authenticated;
grant execute on function public.current_shared_device_can_access_app(text) to authenticated;

comment on table public.shared_operational_devices is 'Dispositivos compartidos operativos. No son empleados; usan auth_user_id tecnico y actor_employee_id por accion.';
comment on table public.shared_operational_device_apps is 'Apps habilitadas por dispositivo compartido.';
comment on table public.shared_operational_device_actor_sessions is 'Sesion corta del trabajador actor sobre un dispositivo compartido.';
comment on table public.shared_operational_device_events is 'Auditoria base de eventos emitidos desde dispositivos compartidos.';
comment on view public.shared_operational_devices_admin_v1 is 'Vista administrativa para VISO: dispositivos compartidos con sede, area y apps permitidas.';
comment on function public.current_shared_operational_device_v1() is 'Devuelve el dispositivo compartido activo asociado a auth.uid(), para shells multi-app.';
comment on function public.current_shared_device_can_access_app(text) is 'Indica si el auth.uid() actual es un dispositivo compartido activo con acceso a una app.';
