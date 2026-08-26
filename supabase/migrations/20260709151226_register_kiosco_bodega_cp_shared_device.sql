do $$
declare
  v_auth_user_id uuid := 'f39717c8-20e4-4bfb-913b-ce89668f94c1'::uuid;
  v_site_id uuid := '407ccca3-bc35-4252-8998-7280623de78f'::uuid;
  v_area_id uuid := '1c013f8f-2020-4fa3-b8a9-33e055842209'::uuid;
  v_device_id uuid;
begin
  if not exists (select 1 from auth.users where id = v_auth_user_id) then
    raise notice 'KIOSCO_BODEGA_CP registration skipped: legacy Auth user is not provisioned in this environment.';
    return;
  end if;

  if not exists (select 1 from public.sites where id = v_site_id) then
    raise notice 'KIOSCO_BODEGA_CP registration skipped: target site is not provisioned in this environment.';
    return;
  end if;

  if not exists (
    select 1 from public.areas where id = v_area_id and site_id = v_site_id
  ) then
    raise notice 'KIOSCO_BODEGA_CP registration skipped: target area is not provisioned for the configured site.';
    return;
  end if;

  insert into public.shared_operational_devices (
    code,
    label,
    description,
    device_type,
    auth_user_id,
    site_id,
    area_id,
    default_app_code,
    requires_actor_pin,
    requires_active_actor_shift,
    allow_actor_without_pin,
    allow_actions_without_actor,
    activation_status,
    is_active,
    metadata
  )
  values (
    'KIOSCO_BODEGA_CP',
    'Kiosco Bodega CP',
    'Migrado desde el usuario legacy Tablet Bodega / bodega@ventogroup.co. Equipo compartido para operación de bodega en Centro de Producción.',
    'warehouse_terminal',
    v_auth_user_id,
    v_site_id,
    v_area_id,
    'nexo',
    true,
    true,
    false,
    false,
    'active',
    true,
    jsonb_build_object(
      'legacy_employee_id', v_auth_user_id,
      'legacy_employee_name', 'Tablet Bodega',
      'legacy_employee_role', 'bodeguero',
      'legacy_auth_email', 'bodega@ventogroup.co',
      'migration_mode', 'safe_phase_1_keep_employee_active_until_shell_shared_device_detection'
    )
  )
  on conflict (code) do update set
    label = excluded.label,
    description = excluded.description,
    device_type = excluded.device_type,
    auth_user_id = excluded.auth_user_id,
    site_id = excluded.site_id,
    area_id = excluded.area_id,
    default_app_code = excluded.default_app_code,
    requires_actor_pin = excluded.requires_actor_pin,
    requires_active_actor_shift = excluded.requires_active_actor_shift,
    allow_actor_without_pin = excluded.allow_actor_without_pin,
    allow_actions_without_actor = excluded.allow_actions_without_actor,
    activation_status = excluded.activation_status,
    is_active = excluded.is_active,
    metadata = public.shared_operational_devices.metadata || excluded.metadata,
    updated_at = now()
  returning id into v_device_id;

  insert into public.shared_operational_device_apps (
    device_id,
    app_code,
    is_default,
    is_active
  )
  values (
    v_device_id,
    'nexo',
    true,
    true
  )
  on conflict (device_id, app_code) do update set
    is_default = true,
    is_active = true;

  insert into public.shared_operational_device_events (
    device_id,
    session_user_id,
    actor_employee_id,
    app_code,
    site_id,
    area_id,
    event_type,
    event_payload,
    source
  )
  values (
    v_device_id,
    v_auth_user_id,
    null,
    'viso',
    v_site_id,
    v_area_id,
    'device.migrated_from_employee.safe_phase_1',
    jsonb_build_object(
      'legacy_employee_id', v_auth_user_id,
      'legacy_employee_name', 'Tablet Bodega',
      'legacy_auth_email', 'bodega@ventogroup.co',
      'employee_left_active', true,
      'reason', 'Mantener compatibilidad hasta que los shells reconozcan shared devices antes de employees.'
    ),
    'admin'
  );
end $$;
