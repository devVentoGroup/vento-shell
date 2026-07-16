create table if not exists public.context_simulation_sessions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  site_id uuid not null references public.sites(id),
  area_id uuid references public.areas(id),
  operational_role text,
  administrative_role text,
  is_active boolean not null default true,
  expires_at timestamptz not null default (now() + interval '4 hours'),
  ended_at timestamptz,
  created_by uuid references public.employees(id),
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint context_simulation_sessions_role_check check (
    nullif(btrim(coalesce(operational_role, '')), '') is not null
    or nullif(btrim(coalesce(administrative_role, '')), '') is not null
  ),
  constraint context_simulation_sessions_time_check check (expires_at > created_at),
  constraint context_simulation_sessions_end_check check (ended_at is null or ended_at >= created_at)
);

create unique index if not exists context_simulation_sessions_one_active_idx
  on public.context_simulation_sessions(user_id)
  where is_active and ended_at is null;

create index if not exists context_simulation_sessions_user_expiry_idx
  on public.context_simulation_sessions(user_id, expires_at desc);

create or replace function public.validate_context_simulation_session_v1()
returns trigger
language plpgsql
set search_path = public
as $$
begin
  if new.area_id is not null and not exists (
    select 1 from public.areas a
    where a.id = new.area_id and a.site_id = new.site_id and coalesce(a.is_active, true)
  ) then
    raise exception 'El área simulada no pertenece a la sede seleccionada.';
  end if;

  if nullif(btrim(coalesce(new.operational_role, '')), '') is not null and not exists (
    select 1 from public.site_operational_roles sor
    where sor.site_id = new.site_id
      and sor.role_code = btrim(new.operational_role)
      and coalesce(sor.is_active, true)
      and (sor.area_id is null or new.area_id is null or sor.area_id = new.area_id)
  ) then
    raise exception 'El rol operativo simulado no está habilitado para la sede/área seleccionada.';
  end if;

  new.updated_at := now();
  return new;
end;
$$;

drop trigger if exists trg_validate_context_simulation_session_v1 on public.context_simulation_sessions;
create trigger trg_validate_context_simulation_session_v1
before insert or update on public.context_simulation_sessions
for each row execute function public.validate_context_simulation_session_v1();

alter table public.context_simulation_sessions enable row level security;

create or replace function public.can_manage_context_simulation_v1(p_user_id uuid default auth.uid())
returns boolean
language sql
stable
security definer
set search_path = public, auth
as $$
  select exists (
    select 1 from public.employees e
    where e.id = coalesce(p_user_id, auth.uid())
      and e.role in ('propietario', 'gerente_general')
  );
$$;

revoke all on function public.can_manage_context_simulation_v1(uuid) from public;
grant execute on function public.can_manage_context_simulation_v1(uuid) to authenticated;

drop policy if exists context_simulation_sessions_select_own on public.context_simulation_sessions;
create policy context_simulation_sessions_select_own
on public.context_simulation_sessions
for select to authenticated
using (user_id = auth.uid() and public.can_manage_context_simulation_v1(auth.uid()));

create or replace function public.start_context_simulation_v1(
  p_site_id uuid,
  p_area_id uuid default null,
  p_operational_role text default null,
  p_administrative_role text default null,
  p_duration_minutes integer default 240,
  p_metadata jsonb default '{}'::jsonb
)
returns uuid
language plpgsql
security definer
set search_path = public, auth
as $$
declare
  v_user_id uuid := auth.uid();
  v_session_id uuid;
  v_duration integer := greatest(15, least(coalesce(p_duration_minutes, 240), 720));
begin
  if v_user_id is null then
    raise exception 'Sesión no autenticada.';
  end if;
  if not public.can_manage_context_simulation_v1(v_user_id) then
    raise exception 'No tienes permiso para activar simulaciones de contexto.';
  end if;
  if p_site_id is null or not exists (
    select 1 from public.sites s where s.id = p_site_id
  ) then
    raise exception 'La sede simulada no existe.';
  end if;
  if nullif(btrim(coalesce(p_operational_role, '')), '') is null
     and nullif(btrim(coalesce(p_administrative_role, '')), '') is null then
    raise exception 'Debes seleccionar un rol operativo o administrativo.';
  end if;

  update public.context_simulation_sessions
  set is_active = false, ended_at = coalesce(ended_at, now()), updated_at = now()
  where user_id = v_user_id and is_active and ended_at is null;

  insert into public.context_simulation_sessions (
    user_id, site_id, area_id, operational_role, administrative_role,
    expires_at, created_by, metadata
  ) values (
    v_user_id,
    p_site_id,
    p_area_id,
    nullif(btrim(coalesce(p_operational_role, '')), ''),
    nullif(btrim(coalesce(p_administrative_role, '')), ''),
    now() + make_interval(mins => v_duration),
    v_user_id,
    coalesce(p_metadata, '{}'::jsonb)
  ) returning id into v_session_id;

  return v_session_id;
end;
$$;

create or replace function public.stop_context_simulation_v1()
returns boolean
language plpgsql
security definer
set search_path = public, auth
as $$
declare
  v_count integer;
begin
  if auth.uid() is null then return false; end if;
  update public.context_simulation_sessions
  set is_active = false, ended_at = coalesce(ended_at, now()), updated_at = now()
  where user_id = auth.uid() and is_active and ended_at is null;
  get diagnostics v_count = row_count;
  return v_count > 0;
end;
$$;

create or replace function public.get_active_context_simulation_v1()
returns table (
  id uuid,
  user_id uuid,
  site_id uuid,
  area_id uuid,
  area_kind text,
  operational_role text,
  administrative_role text,
  expires_at timestamptz,
  metadata jsonb
)
language sql
stable
security definer
set search_path = public, auth
as $$
  select cs.id, cs.user_id, cs.site_id, cs.area_id, a.kind,
         cs.operational_role, cs.administrative_role, cs.expires_at, cs.metadata
  from public.context_simulation_sessions cs
  left join public.areas a on a.id = cs.area_id
  where cs.user_id = auth.uid()
    and cs.is_active
    and cs.ended_at is null
    and cs.expires_at > now()
    and public.can_manage_context_simulation_v1(auth.uid())
  order by cs.created_at desc
  limit 1;
$$;

create or replace function public.get_effective_context_v1(p_app_code text default null)
returns table (
  source text,
  session_mode text,
  app_code text,
  user_id uuid,
  real_administrative_role text,
  effective_administrative_role text,
  effective_operational_role text,
  site_id uuid,
  area_id uuid,
  area_kind text,
  shift_id uuid,
  simulation_id uuid,
  shared_device_id uuid,
  is_simulation boolean,
  is_shared_device boolean,
  bypass_applied boolean,
  can_operate boolean,
  blocked_reasons text[],
  metadata jsonb
)
language plpgsql
stable
security definer
set search_path = public, auth
as $$
declare
  v_app_code text := nullif(btrim(lower(coalesce(p_app_code, ''))), '');
  v_device record;
  v_sim record;
  v_real record;
  v_real_role text;
  v_area_kind text;
begin
  select e.role into v_real_role from public.employees e where e.id = auth.uid() limit 1;

  select * into v_device from public.current_shared_operational_device_v1() limit 1;
  if v_device.id is not null then
    select a.kind into v_area_kind from public.areas a where a.id = v_device.area_id limit 1;
    source := 'shared_device';
    session_mode := 'shared_device';
    app_code := v_app_code;
    user_id := auth.uid();
    real_administrative_role := v_real_role;
    effective_administrative_role := null;
    effective_operational_role := nullif(btrim(coalesce(v_device.navigation_role, '')), '');
    site_id := v_device.site_id;
    area_id := v_device.area_id;
    area_kind := v_area_kind;
    shift_id := null;
    simulation_id := null;
    shared_device_id := v_device.id;
    is_simulation := false;
    is_shared_device := true;
    bypass_applied := false;
    can_operate := v_app_code is null or v_app_code = any(coalesce(v_device.allowed_app_codes, '{}'::text[]));
    blocked_reasons := case when can_operate then '{}'::text[] else array['app_not_allowed']::text[] end;
    metadata := coalesce(v_device.metadata, '{}'::jsonb);
    return next;
    return;
  end if;

  select * into v_sim from public.get_active_context_simulation_v1() limit 1;
  if v_sim.id is not null then
    source := 'simulation';
    session_mode := 'employee';
    app_code := v_app_code;
    user_id := auth.uid();
    real_administrative_role := v_real_role;
    effective_administrative_role := v_sim.administrative_role;
    effective_operational_role := v_sim.operational_role;
    site_id := v_sim.site_id;
    area_id := v_sim.area_id;
    area_kind := v_sim.area_kind;
    shift_id := null;
    simulation_id := v_sim.id;
    shared_device_id := null;
    is_simulation := true;
    is_shared_device := false;
    bypass_applied := false;
    can_operate := true;
    blocked_reasons := '{}'::text[];
    metadata := coalesce(v_sim.metadata, '{}'::jsonb);
    return next;
    return;
  end if;

  select * into v_real
  from public.get_operational_context(auth.uid(), null, coalesce(v_app_code, 'nexo'))
  limit 1;

  source := case
    when coalesce(v_real.bypass_applied, false) then 'administrative_bypass'
    when coalesce(v_real.on_shift_now, false) or coalesce(v_real.checked_in_now, false) then 'anima'
    else 'real'
  end;
  session_mode := 'employee';
  app_code := coalesce(v_real.app_code, v_app_code);
  user_id := auth.uid();
  real_administrative_role := v_real_role;
  effective_administrative_role := v_real_role;
  effective_operational_role := v_real.active_operational_role;
  site_id := v_real.active_site_id;
  area_id := v_real.active_area_id;
  area_kind := v_real.active_area_kind;
  shift_id := v_real.active_shift_id;
  simulation_id := null;
  shared_device_id := null;
  is_simulation := false;
  is_shared_device := false;
  bypass_applied := coalesce(v_real.bypass_applied, false);
  can_operate := coalesce(v_real.can_operate, false);
  blocked_reasons := coalesce(v_real.blocked_reasons, '{}'::text[]);
  metadata := '{}'::jsonb;
  return next;
end;
$$;

create or replace function public.has_effective_permission_v1(
  p_permission_code text,
  p_app_code text default null
)
returns boolean
language plpgsql
stable
security definer
set search_path = public, auth
as $$
declare
  v_permission text := nullif(btrim(coalesce(p_permission_code, '')), '');
  v_app text := nullif(btrim(lower(coalesce(p_app_code, ''))), '');
  v_context record;
begin
  if v_permission is null then return false; end if;
  if v_app is null then v_app := split_part(v_permission, '.', 1); end if;

  select * into v_context from public.get_effective_context_v1(v_app) limit 1;
  if v_context.user_id is null or not coalesce(v_context.can_operate, false) then return false; end if;

  if v_context.source = 'simulation' then
    return (
      nullif(btrim(coalesce(v_context.effective_operational_role, '')), '') is not null
      and public.has_operational_role_permission(
        v_context.effective_operational_role, v_permission,
        v_context.site_id, v_context.area_id, v_app
      )
    ) or (
      nullif(btrim(coalesce(v_context.effective_administrative_role, '')), '') is not null
      and public.has_role_permission(
        v_context.effective_administrative_role, v_permission,
        v_context.site_id, v_context.area_id
      )
    );
  end if;

  if v_context.source = 'shared_device' then
    return nullif(btrim(coalesce(v_context.effective_operational_role, '')), '') is not null
      and public.has_operational_role_permission(
        v_context.effective_operational_role, v_permission,
        v_context.site_id, v_context.area_id, v_app
      );
  end if;

  return public.has_permission(v_permission, v_context.site_id, v_context.area_id)
    or public.has_operational_permission(v_permission, v_context.site_id, v_context.area_id, v_app);
end;
$$;

revoke all on function public.start_context_simulation_v1(uuid, uuid, text, text, integer, jsonb) from public;
revoke all on function public.stop_context_simulation_v1() from public;
revoke all on function public.get_active_context_simulation_v1() from public;
revoke all on function public.get_effective_context_v1(text) from public;
revoke all on function public.has_effective_permission_v1(text, text) from public;

grant execute on function public.start_context_simulation_v1(uuid, uuid, text, text, integer, jsonb) to authenticated;
grant execute on function public.stop_context_simulation_v1() to authenticated;
grant execute on function public.get_active_context_simulation_v1() to authenticated;
grant execute on function public.get_effective_context_v1(text) to authenticated;
grant execute on function public.has_effective_permission_v1(text, text) to authenticated;

comment on table public.context_simulation_sessions is 'Sesiones de simulación administrativa compartidas por las apps web de Vento OS.';
comment on function public.get_effective_context_v1(text) is 'Resuelve un único contexto: dispositivo compartido, simulación administrativa o contexto real de ANIMA.';
comment on function public.has_effective_permission_v1(text, text) is 'Evalúa permisos administrativos u operativos contra el contexto efectivo común.';

notify pgrst, 'reload schema';