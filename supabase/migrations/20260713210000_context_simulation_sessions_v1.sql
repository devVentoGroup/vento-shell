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
  updated_at timestamptz not null default now()
);

create unique index if not exists context_simulation_sessions_one_active_idx
  on public.context_simulation_sessions(user_id)
  where is_active and ended_at is null;

create index if not exists context_simulation_sessions_user_expiry_idx
  on public.context_simulation_sessions(user_id, expires_at desc);

create or replace function public.can_manage_context_simulation_v1(
  p_user_id uuid default auth.uid()
)
returns boolean
language sql
stable
security definer
set search_path = public, auth
as $$
  select exists (
    select 1
    from public.employees e
    where e.id = coalesce(p_user_id, auth.uid())
      and e.role in ('propietario', 'gerente_general')
  );
$$;

create or replace function public.validate_context_simulation_session_v1()
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
      and coalesce(a.is_active, true)
  ) then
    raise exception 'El área simulada no pertenece a la sede seleccionada.';
  end if;

  if nullif(btrim(coalesce(new.operational_role, '')), '') is not null and not exists (
    select 1
    from public.site_operational_roles sor
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

drop trigger if exists trg_validate_context_simulation_session_v1
  on public.context_simulation_sessions;
create trigger trg_validate_context_simulation_session_v1
before insert or update on public.context_simulation_sessions
for each row execute function public.validate_context_simulation_session_v1();

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
  select
    cs.id,
    cs.user_id,
    cs.site_id,
    cs.area_id,
    a.kind,
    cs.operational_role,
    cs.administrative_role,
    cs.expires_at,
    cs.metadata
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
  set is_active = false,
      ended_at = coalesce(ended_at, now()),
      updated_at = now()
  where user_id = v_user_id
    and is_active
    and ended_at is null;

  insert into public.context_simulation_sessions (
    user_id,
    site_id,
    area_id,
    operational_role,
    administrative_role,
    expires_at,
    created_by,
    metadata
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
  if auth.uid() is null then
    return false;
  end if;

  update public.context_simulation_sessions
  set is_active = false,
      ended_at = coalesce(ended_at, now()),
      updated_at = now()
  where user_id = auth.uid()
    and is_active
    and ended_at is null;

  get diagnostics v_count = row_count;
  return v_count > 0;
end;
$$;

alter table public.context_simulation_sessions enable row level security;

drop policy if exists context_simulation_sessions_select_own
  on public.context_simulation_sessions;
create policy context_simulation_sessions_select_own
on public.context_simulation_sessions
for select
to authenticated
using (
  user_id = auth.uid()
  and public.can_manage_context_simulation_v1(auth.uid())
);

revoke all on function public.can_manage_context_simulation_v1(uuid) from public;
revoke all on function public.get_active_context_simulation_v1() from public;
revoke all on function public.start_context_simulation_v1(uuid, uuid, text, text, integer, jsonb) from public;
revoke all on function public.stop_context_simulation_v1() from public;

grant execute on function public.can_manage_context_simulation_v1(uuid) to authenticated;
grant execute on function public.get_active_context_simulation_v1() to authenticated;
grant execute on function public.start_context_simulation_v1(uuid, uuid, text, text, integer, jsonb) to authenticated;
grant execute on function public.stop_context_simulation_v1() to authenticated;

notify pgrst, 'reload schema';
