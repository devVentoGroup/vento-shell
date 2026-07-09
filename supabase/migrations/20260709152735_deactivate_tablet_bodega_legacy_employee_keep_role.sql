do $$
declare
  v_employee_id uuid := 'f39717c8-20e4-4bfb-913b-ce89668f94c1'::uuid;
  v_device_id uuid;
begin
  select id into v_device_id
  from public.shared_operational_devices
  where auth_user_id = v_employee_id
    and code = 'KIOSCO_BODEGA_CP'
  limit 1;

  if v_device_id is null then
    raise exception 'No existe el dispositivo compartido KIOSCO_BODEGA_CP para desactivar el empleado legacy de forma segura.';
  end if;

  update public.employees
  set
    is_active = false,
    updated_at = now()
  where id = v_employee_id;

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
  select
    d.id,
    d.auth_user_id,
    null,
    'viso',
    d.site_id,
    d.area_id,
    'legacy_employee.deactivated',
    jsonb_build_object(
      'legacy_employee_id', v_employee_id,
      'legacy_role_kept', 'bodeguero',
      'reason', 'El auth user ahora representa un dispositivo compartido operativo. Se conserva role legacy por trigger de integridad de roles por site_type.'
    ),
    'admin'
  from public.shared_operational_devices d
  where d.id = v_device_id;
end $$;
