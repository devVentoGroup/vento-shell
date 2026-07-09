alter table public.shared_operational_device_templates
  add column if not exists navigation_role text;

alter table public.shared_operational_devices
  add column if not exists navigation_role text;

comment on column public.shared_operational_device_templates.navigation_role is 'Perfil de permisos usado para construir menu y vistas iniciales de dispositivos creados desde esta plantilla. No controla quien puede actuar; eso vive en actor policies.';
comment on column public.shared_operational_devices.navigation_role is 'Perfil de permisos efectivo para menu/vistas del dispositivo compartido. Editable por dispositivo; no controla actor humano.';

update public.shared_operational_device_templates
set navigation_role = case code
  when 'pos_satellite' then 'cajero'
  when 'bar_satellite' then 'barista'
  when 'warehouse_kiosk' then 'bodeguero'
  when 'procurement_reception' then 'auxiliar_administrativa'
  when 'production_center' then 'cocinero'
  when 'management_terminal' then 'gerente_general'
  else navigation_role
end
where navigation_role is null;

update public.shared_operational_devices d
set navigation_role = coalesce(d.navigation_role, t.navigation_role),
    updated_at = now()
from public.shared_operational_device_templates t
where d.template_id = t.id
  and d.navigation_role is null;

drop view if exists public.shared_operational_devices_admin_v1;

create view public.shared_operational_devices_admin_v1 as
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
  d.updated_at,
  d.template_id,
  t.code as template_code,
  t.label as template_label,
  d.navigation_role
from public.shared_operational_devices d
left join public.sites s on s.id = d.site_id
left join public.areas a on a.id = d.area_id
left join public.shared_operational_device_templates t on t.id = d.template_id
left join public.shared_operational_device_apps da on da.device_id = d.id
group by d.id, s.id, a.id, t.id;

drop view if exists public.shared_operational_device_templates_admin_v1;

create view public.shared_operational_device_templates_admin_v1 as
select
  t.id,
  t.code,
  t.label,
  t.description,
  t.device_type,
  t.default_app_code,
  t.requires_actor_pin,
  t.requires_active_actor_shift,
  t.allow_actor_without_pin,
  t.allow_actions_without_actor,
  t.is_active,
  t.sort_order,
  coalesce(
    array_agg(distinct ta.app_code order by ta.app_code) filter (where ta.is_active),
    '{}'::text[]
  ) as app_codes,
  coalesce(
    jsonb_agg(
      distinct jsonb_build_object(
        'policy_type', tp.policy_type,
        'scope_strategy', tp.scope_strategy,
        'role_code', tp.role_code,
        'employee_id', tp.employee_id,
        'notes', tp.notes
      )
    ) filter (where tp.is_active),
    '[]'::jsonb
  ) as actor_policies,
  t.metadata,
  t.created_at,
  t.updated_at,
  t.navigation_role
from public.shared_operational_device_templates t
left join public.shared_operational_device_template_apps ta on ta.template_id = t.id
left join public.shared_operational_device_template_actor_policies tp on tp.template_id = t.id
group by t.id;

grant select on public.shared_operational_devices_admin_v1 to authenticated;
grant select on public.shared_operational_device_templates_admin_v1 to authenticated;
