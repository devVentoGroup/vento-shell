create or replace function public.get_effective_context_v1(
  p_app_code text default null
)
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
  select e.role
    into v_real_role
  from public.employees e
  where e.id = auth.uid()
  limit 1;

  select *
    into v_device
  from public.current_shared_operational_device_v1()
  limit 1;

  if v_device.id is not null then
    select a.kind
      into v_area_kind
    from public.areas a
    where a.id = v_device.area_id
    limit 1;

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
    can_operate := v_app_code is null
      or v_app_code = any(coalesce(v_device.allowed_app_codes, '{}'::text[]));
    blocked_reasons := case
      when can_operate then '{}'::text[]
      else array['app_not_allowed']::text[]
    end;
    metadata := coalesce(v_device.metadata, '{}'::jsonb);
    return next;
    return;
  end if;

  select *
    into v_sim
  from public.get_active_context_simulation_v1()
  limit 1;

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

  select *
    into v_real
  from public.get_operational_context(
    auth.uid(),
    null,
    coalesce(v_app_code, 'nexo')
  )
  limit 1;

  source := case
    when coalesce(v_real.bypass_applied, false) then 'administrative_bypass'
    when coalesce(v_real.on_shift_now, false)
      or coalesce(v_real.checked_in_now, false) then 'anima'
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

revoke all on function public.get_effective_context_v1(text) from public;
grant execute on function public.get_effective_context_v1(text) to authenticated;

comment on function public.get_effective_context_v1(text) is
  'Resuelve un contexto único para apps web: dispositivo compartido, simulación autorizada o contexto real de ANIMA.';

notify pgrst, 'reload schema';
