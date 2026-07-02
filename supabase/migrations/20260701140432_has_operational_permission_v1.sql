create or replace function public.has_operational_permission(
  p_permission_code text,
  p_site_id uuid default null,
  p_area_id uuid default null,
  p_app_code text default null
)
returns boolean
language plpgsql
stable
security definer
set search_path = public
as $$
declare
  v_permission_code text := nullif(btrim(coalesce(p_permission_code, '')), '');
  v_app_code text := nullif(btrim(coalesce(p_app_code, '')), '');
  v_context record;
  v_site_id uuid;
  v_area_id uuid;
  v_allowed boolean := false;
begin
  if v_permission_code is null then
    return false;
  end if;

  if v_app_code is null then
    v_app_code := split_part(v_permission_code, '.', 1);
  end if;

  select *
    into v_context
  from public.get_operational_context(auth.uid(), p_site_id, v_app_code)
  limit 1;

  if v_context.employee_id is null then
    return false;
  end if;

  if coalesce(v_context.bypass_applied, false) then
    return true;
  end if;

  if not coalesce(v_context.can_operate, false) then
    return false;
  end if;

  if nullif(btrim(coalesce(v_context.active_operational_role, '')), '') is null then
    return false;
  end if;

  v_site_id := coalesce(p_site_id, v_context.active_site_id);
  v_area_id := coalesce(p_area_id, v_context.active_area_id);

  if v_site_id is not null and not exists (
    select 1
    from public.site_operational_roles sor
    where sor.site_id = v_site_id
      and sor.role_code = v_context.active_operational_role
      and coalesce(sor.is_active, true) = true
      and (
        sor.area_id is null
        or v_area_id is null
        or sor.area_id = v_area_id
      )
  ) then
    return false;
  end if;

  select exists (
    select 1
    from public.operational_role_permissions orp
    where orp.role_code = v_context.active_operational_role
      and orp.permission_code = v_permission_code
      and orp.is_allowed = true
      and (orp.site_id is null or orp.site_id = v_site_id)
      and (orp.area_id is null or orp.area_id = v_area_id)
      and (orp.area_kind is null or orp.area_kind = v_context.active_area_kind)
  )
  into v_allowed;

  return coalesce(v_allowed, false);
end;
$$;

comment on function public.has_operational_permission(text, uuid, uuid, text) is
  'Evalua permisos usando el rol operativo del turno activo y public.operational_role_permissions. No reemplaza public.has_permission para configuracion administrativa.';

grant execute on function public.has_operational_permission(text, uuid, uuid, text) to authenticated;

notify pgrst, 'reload schema';
