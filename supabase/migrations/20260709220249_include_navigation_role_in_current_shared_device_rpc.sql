drop function if exists public.current_shared_operational_device_v1();

create or replace function public.current_shared_operational_device_v1()
returns table (
  id uuid,
  code text,
  label text,
  description text,
  device_type text,
  site_id uuid,
  area_id uuid,
  navigation_role text,
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
    d.navigation_role,
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

comment on function public.current_shared_operational_device_v1() is
  'Retorna el dispositivo compartido autenticado con apps permitidas y navigation_role interpretado como operational_role para shells y navegacion.';

revoke all on function public.current_shared_operational_device_v1() from public;
grant execute on function public.current_shared_operational_device_v1() to authenticated;

notify pgrst, 'reload schema';