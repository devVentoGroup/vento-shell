begin;

create or replace function public.enforce_attendance_geofence()
returns trigger
language plpgsql
security definer
set search_path to 'public'
as $function$
declare
  v_site record;
  v_emp record;
  v_geofence_site_id uuid;

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
  -- System records keep the process timestamp. Worker records use server time.
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

  v_geofence_site_id := coalesce(new.geofence_site_id, new.site_id);
  new.geofence_site_id := v_geofence_site_id;

  select id, name, type, is_active, latitude, longitude, checkin_radius_meters
    into v_site
  from public.sites
  where id = v_geofence_site_id;

  if not found then
    raise exception 'Punto de marcacion no encontrado';
  end if;

  if v_site.is_active is false then
    raise exception 'Punto de marcacion inactivo';
  end if;

  -- Internal autoclosures and scheduled closures do not include worker GPS.
  if coalesce(new.source, 'mobile') = 'system' then
    return new;
  end if;

  select checkin_radius_meters, requires_geofence
    into v_site_policy_radius, v_site_policy_requires_geo
  from public.site_attendance_policy
  where site_id = v_geofence_site_id;

  v_requires_geo := coalesce(
    v_site_policy_requires_geo,
    v_site.type <> 'vento_group'
  );

  if v_requires_geo then
    if v_site.latitude is null or v_site.longitude is null then
      raise exception 'Configuracion invalida: el punto % no tiene coordenadas', v_site.name;
    end if;

    if new.latitude is null or new.longitude is null or new.accuracy_meters is null then
      raise exception 'Ubicacion requerida para registrar asistencia';
    end if;

    if public.device_info_has_blocking_warnings(new.device_info) then
      raise exception 'Ubicacion no valida: senales de ubicacion simulada detectadas';
    end if;

    if new.action = 'check_in' then
      v_max_acc := coalesce(v_policy_check_in_max_acc, 25);
    elsif new.action = 'check_out' then
      v_max_acc := coalesce(v_policy_check_out_max_acc, 25);
    else
      raise exception 'Accion invalida: %', new.action;
    end if;

    v_radius := coalesce(
      v_site_policy_radius,
      v_site.checkin_radius_meters,
      v_policy_default_radius,
      50
    );
    v_accuracy := new.accuracy_meters::double precision;

    if v_accuracy > v_max_acc then
      raise exception 'Precision GPS insuficiente: %m (maximo %m)', round(v_accuracy), v_max_acc;
    end if;

    v_distance := public.haversine_m(new.latitude, new.longitude, v_site.latitude, v_site.longitude);
    new.geofence_distance_meters := round(v_distance::numeric, 2);

    if v_distance > v_radius then
      raise exception 'Fuera de rango: %m > radio %m (precision %m)',
        round(v_distance), v_radius, round(v_accuracy);
    end if;
  else
    new.geofence_distance_meters := null;
  end if;

  return new;
end;
$function$;

commit;
