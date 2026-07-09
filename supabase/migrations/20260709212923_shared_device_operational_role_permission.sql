create or replace function public.has_operational_role_permission(
  p_role_code text,
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
  v_role_code text := nullif(btrim(coalesce(p_role_code, '')), '');
  v_permission_code text := nullif(btrim(coalesce(p_permission_code, '')), '');
  v_app_code text := nullif(btrim(coalesce(p_app_code, '')), '');
  v_area_kind text;
  v_allowed boolean := false;
begin
  if v_role_code is null or v_permission_code is null then
    return false;
  end if;

  if v_app_code is null then
    v_app_code := split_part(v_permission_code, '.', 1);
  end if;

  if v_app_code is null or v_app_code = '' then
    return false;
  end if;

  if p_area_id is not null then
    select a.kind
      into v_area_kind
    from public.areas a
    where a.id = p_area_id
    limit 1;
  end if;

  if p_site_id is not null and not exists (
    select 1
    from public.site_operational_roles sor
    where sor.site_id = p_site_id
      and sor.role_code = v_role_code
      and coalesce(sor.is_active, true) = true
      and (
        sor.area_id is null
        or p_area_id is null
        or sor.area_id = p_area_id
      )
  ) then
    return false;
  end if;

  select exists (
    select 1
    from public.operational_role_permissions orp
    where orp.role_code = v_role_code
      and orp.permission_code = v_permission_code
      and orp.is_allowed = true
      and (orp.site_id is null or orp.site_id = p_site_id)
      and (orp.area_id is null or orp.area_id = p_area_id)
      and (orp.area_kind is null or orp.area_kind = v_area_kind)
  ) into v_allowed;

  return coalesce(v_allowed, false);
end;
$$;

comment on function public.has_operational_role_permission(text, text, uuid, uuid, text) is
  'Evalua un role_code operativo explicito contra operational_role_permissions. Usado por shared devices: navigation_role se interpreta como operational_role. No reemplaza has_permission ni role_permissions.';

revoke all on function public.has_operational_role_permission(text, text, uuid, uuid, text) from public;
grant execute on function public.has_operational_role_permission(text, text, uuid, uuid, text) to authenticated;

notify pgrst, 'reload schema';
