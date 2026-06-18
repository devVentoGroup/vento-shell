begin;

create or replace function public.enforce_attendance_geofence()
returns trigger
language plpgsql
security definer
set search_path to 'public'
as $$
declare
  v_site record;
  v_emp record;

  v_requires_geo boolean;
  v_max_acc integer;
  v_radius integer;
  v_policy_check_in_max_acc integer;
  v_policy_check_out_max_acc integer;
  v_policy_default_radius integer;
  v_site_policy_radius integer;
  v_site_policy_requires_geo boolean;

  v_distance double precision;
  v_accuracy double precision;
begin
  -- Registros operativos del sistema preservan la hora del proceso que los crea.
  -- Registros del trabajador siguen usando hora servidor para evitar manipulación.
  if coalesce(new.source, 'mobile') <> 'system' then
    new.occurred_at := now();
  end if;

  select
    geofence_check_in_max_accuracy_meters,
    geofence_check_out_max_accuracy_meters,
    default_radius_meters
    into v_policy_check_in_max_acc,
      v_policy_check_out_max_acc,
      v_policy_default_radius
  from public.attendance_policy
  order by created_at asc
  limit 1;

  if not found then
    v_policy_check_in_max_acc := 25;
    v_policy_check_out_max_acc := 25;
    v_policy_default_radius := null;
  end if;

  select id, site_id, is_active
    into v_emp
  from public.employees
  where id = new.employee_id;

  if not found then
    raise exception 'Empleado no encontrado';
  end if;

  if v_emp.is_active is false then
    raise exception 'Empleado inactivo';
  end if;

  if new.action = 'check_in'
    and v_emp.site_id is distinct from new.site_id
    and not exists (
      select 1
      from public.employee_sites es
      where es.employee_id = new.employee_id
        and es.site_id = new.site_id
        and es.is_active is true
    )
  then
    raise exception 'No autorizado: check-in solo permitido en una sede asignada';
  end if;

  select id, name, type, is_active, latitude, longitude, checkin_radius_meters
    into v_site
  from public.sites
  where id = new.site_id;

  if not found then
    raise exception 'Sede no encontrada';
  end if;

  if v_site.is_active is false then
    raise exception 'Sede inactiva';
  end if;

  -- Autocierres, cierres programados y otros procesos internos no tienen muestra GPS
  -- del trabajador. La secuencia se valida en attendance_logs_enforce_sequence.
  if coalesce(new.source, 'mobile') = 'system' then
    return new;
  end if;

  select checkin_radius_meters, requires_geofence
    into v_site_policy_radius, v_site_policy_requires_geo
  from public.site_attendance_policy
  where site_id = new.site_id;

  v_requires_geo := coalesce(
    v_site_policy_requires_geo,
    v_site.type <> 'vento_group'
  );

  if v_requires_geo then
    if v_site.latitude is null or v_site.longitude is null then
      raise exception 'Configuración inválida: la sede % no tiene coordenadas', v_site.name;
    end if;

    if new.latitude is null or new.longitude is null or new.accuracy_meters is null then
      raise exception 'Ubicación requerida para registrar asistencia';
    end if;

    if public.device_info_has_blocking_warnings(new.device_info) then
      raise exception 'Ubicación no válida: señales de ubicación simulada detectadas';
    end if;

    if new.action = 'check_in' then
      v_max_acc := coalesce(v_policy_check_in_max_acc, 25);
    elsif new.action = 'check_out' then
      v_max_acc := coalesce(v_policy_check_out_max_acc, 25);
    else
      raise exception 'Acción inválida: %', new.action;
    end if;

    v_radius := coalesce(
      v_site_policy_radius,
      v_site.checkin_radius_meters,
      v_policy_default_radius,
      50
    );
    v_accuracy := new.accuracy_meters::double precision;

    if v_accuracy > v_max_acc then
      raise exception 'Precisión GPS insuficiente: %m (máximo %m)', round(v_accuracy), v_max_acc;
    end if;

    v_distance := public.haversine_m(new.latitude, new.longitude, v_site.latitude, v_site.longitude);

    if v_distance > v_radius then
      raise exception 'Fuera de rango: %m > radio %m (precisión %m)',
        round(v_distance), v_radius, round(v_accuracy);
    end if;
  end if;

  return new;
end;
$$;

alter function public.enforce_attendance_geofence() owner to postgres;

commit;
