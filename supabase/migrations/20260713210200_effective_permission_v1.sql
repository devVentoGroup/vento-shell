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
  if v_permission is null then
    return false;
  end if;

  if v_app is null then
    v_app := split_part(v_permission, '.', 1);
  end if;

  select *
    into v_context
  from public.get_effective_context_v1(v_app)
  limit 1;

  if v_context.user_id is null
     or not coalesce(v_context.can_operate, false) then
    return false;
  end if;

  if v_context.source = 'simulation' then
    return (
      nullif(btrim(coalesce(v_context.effective_operational_role, '')), '') is not null
      and public.has_operational_role_permission(
        v_context.effective_operational_role,
        v_permission,
        v_context.site_id,
        v_context.area_id,
        v_app
      )
    ) or (
      nullif(btrim(coalesce(v_context.effective_administrative_role, '')), '') is not null
      and public.has_role_permission(
        v_context.effective_administrative_role,
        v_permission,
        v_context.site_id,
        v_context.area_id
      )
    );
  end if;

  if v_context.source = 'shared_device' then
    return nullif(
      btrim(coalesce(v_context.effective_operational_role, '')),
      ''
    ) is not null
    and public.has_operational_role_permission(
      v_context.effective_operational_role,
      v_permission,
      v_context.site_id,
      v_context.area_id,
      v_app
    );
  end if;

  return public.has_permission(
    v_permission,
    v_context.site_id,
    v_context.area_id
  ) or public.has_operational_permission(
    v_permission,
    v_context.site_id,
    v_context.area_id,
    v_app
  );
end;
$$;

revoke all on function public.has_effective_permission_v1(text, text) from public;
grant execute on function public.has_effective_permission_v1(text, text) to authenticated;

comment on function public.has_effective_permission_v1(text, text) is
  'Evalúa un permiso usando el mismo contexto efectivo consumido por el shell y las acciones de servidor.';

notify pgrst, 'reload schema';
