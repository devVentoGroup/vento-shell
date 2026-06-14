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
  v_cap integer;
  v_max_acc integer;
  v_radius integer;

  v_distance double precision;
  v_accuracy double precision;
begin
  -- Hora servidor (anti manipulacion)
  new.occurred_at := now();

  -- Empleado: debe existir y estar activo
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

  -- En check_in, la sede del log debe coincidir con la sede asignada al empleado.
  if new.action = 'check_in' and v_emp.site_id is distinct from new.site_id then
    raise exception 'No autorizado: check-in solo permitido en tu sede asignada';
  end if;

  -- Sede: debe existir y estar activa
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

  -- Requiere geolocalizacion si NO es vento_group.
  if v_site.type <> 'vento_group' then
    if v_site.latitude is null or v_site.longitude is null then
      raise exception 'Configuración inválida: la sede % no tiene coordenadas', v_site.name;
    end if;
    v_requires_geo := true;
  else
    v_requires_geo := false;
  end if;

  if v_requires_geo then
    -- Debe venir ubicacion
    if new.latitude is null or new.longitude is null or new.accuracy_meters is null then
      raise exception 'Ubicación requerida para registrar asistencia';
    end if;

    -- Si el cliente reporta warnings bloqueantes, rechaza.
    if public.device_info_has_blocking_warnings(new.device_info) then
      raise exception 'Ubicación no válida: señales de ubicación simulada detectadas';
    end if;

    if new.action = 'check_in' then
      v_cap := 30;
      v_max_acc := 25;
    elsif new.action = 'check_out' then
      v_cap := 40;
      v_max_acc := 30;
    else
      raise exception 'Acción inválida: %', new.action;
    end if;

    v_radius := least(coalesce(v_site.checkin_radius_meters, 50), v_cap);
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
