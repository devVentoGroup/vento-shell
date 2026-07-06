begin;

grant usage on schema public to authenticated;

alter table public.attendance_logs enable row level security;
alter table public.attendance_breaks enable row level security;
alter table public.attendance_sync_conflicts enable row level security;

grant select, insert
on table public.attendance_logs
to authenticated;

revoke update
on table public.attendance_logs
from authenticated;

grant update (notes)
on table public.attendance_logs
to authenticated;

grant select
on table public.attendance_breaks
to authenticated;

revoke delete, truncate, references, trigger
on table
  public.attendance_logs,
  public.attendance_breaks,
  public.attendance_sync_conflicts
from authenticated;

revoke insert, update
on table public.attendance_breaks
from authenticated;

revoke insert, update, delete, truncate, references, trigger
on table public.attendance_sync_conflicts
from authenticated;

drop policy if exists attendance_logs_insert_authenticated_permissive
on public.attendance_logs;

drop policy if exists attendance_logs_employee_insert_own_v20260706
on public.attendance_logs;

drop policy if exists attendance_logs_employee_select_own_v20260706
on public.attendance_logs;

drop policy if exists attendance_logs_insert_self_accessible_site
on public.attendance_logs;

create policy attendance_logs_insert_self_accessible_site
on public.attendance_logs
for insert
to authenticated
with check (
  employee_id = auth.uid()
  and source in ('mobile', 'web', 'kiosk')
  and public.can_access_site(site_id)
);

drop policy if exists attendance_logs_select_self_active
on public.attendance_logs;

create policy attendance_logs_select_self_active
on public.attendance_logs
for select
to authenticated
using (
  employee_id = auth.uid()
  and exists (
    select 1
    from public.employees e
    where e.id = auth.uid()
      and e.is_active = true
  )
);

drop policy if exists attendance_logs_select_manager_scoped
on public.attendance_logs;

create policy attendance_logs_select_manager_scoped
on public.attendance_logs
for select
to authenticated
using (
  public.is_owner()
  or public.is_global_manager()
  or (
    public.current_employee_role() = 'gerente'
    and public.can_access_site(site_id)
  )
);

drop policy if exists attendance_logs_update_notes_scoped
on public.attendance_logs;

create policy attendance_logs_update_notes_scoped
on public.attendance_logs
for update
to authenticated
using (
  employee_id = auth.uid()
  or public.is_owner()
  or public.is_global_manager()
  or (
    public.current_employee_role() = 'gerente'
    and public.can_access_site(site_id)
  )
)
with check (
  employee_id = auth.uid()
  or public.is_owner()
  or public.is_global_manager()
  or (
    public.current_employee_role() = 'gerente'
    and public.can_access_site(site_id)
  )
);

create or replace function public.sync_attendance_events(p_events jsonb)
returns table (
  event_id text,
  result text,
  message text
)
language plpgsql
security definer
set search_path = public
as $$
declare
  v_employee_id uuid := auth.uid();
  v_item jsonb;
  v_event_id text;
  v_action text;
  v_site_id uuid;
  v_geofence_site_id uuid;
  v_geofence_distance_meters numeric;
  v_occurred_at timestamptz;
  v_lat numeric;
  v_lng numeric;
  v_accuracy numeric;
  v_source text;
  v_notes text;
  v_device_info jsonb;
  v_shift_id uuid;
begin
  if v_employee_id is null then
    raise exception 'auth.uid() is null';
  end if;

  if not public.anima_is_active_employee() then
    raise exception 'Empleado inactivo o no encontrado';
  end if;

  if p_events is null or jsonb_typeof(p_events) <> 'array' then
    raise exception 'p_events must be a json array';
  end if;

  for v_item in select value from jsonb_array_elements(p_events)
  loop
    v_event_id := nullif(trim(coalesce(v_item ->> 'eventId', v_item ->> 'event_id', '')), '');
    v_action := lower(trim(coalesce(v_item ->> 'eventType', v_item ->> 'event_type', v_item ->> 'action', '')));
    v_source := coalesce(nullif(trim(coalesce(v_item ->> 'source', '')), ''), 'mobile');
    v_notes := nullif(trim(coalesce(v_item ->> 'notes', '')), '');
    v_occurred_at := coalesce(
      nullif(v_item ->> 'occurredAt', '')::timestamptz,
      nullif(v_item ->> 'occurred_at', '')::timestamptz,
      now()
    );
    v_site_id := nullif(coalesce(v_item ->> 'siteId', v_item ->> 'site_id', ''), '')::uuid;
    v_geofence_site_id := nullif(coalesce(v_item ->> 'geofenceSiteId', v_item ->> 'geofence_site_id', ''), '')::uuid;
    v_geofence_distance_meters := nullif(
      coalesce(v_item ->> 'geofenceDistanceMeters', v_item ->> 'geofence_distance_meters', ''),
      ''
    )::numeric;
    v_lat := nullif(coalesce(v_item #>> '{geoSnapshot,lat}', v_item ->> 'latitude', ''), '')::numeric;
    v_lng := nullif(coalesce(v_item #>> '{geoSnapshot,lng}', v_item ->> 'longitude', ''), '')::numeric;
    v_accuracy := nullif(
      coalesce(v_item #>> '{geoSnapshot,accuracy}', v_item ->> 'accuracy_meters', ''),
      ''
    )::numeric;
    v_device_info := coalesce(v_item -> 'deviceInfo', v_item -> 'device_info', '{}'::jsonb);
    v_shift_id := nullif(coalesce(v_item ->> 'shiftId', v_item ->> 'shift_id', ''), '')::uuid;

    if v_event_id is null then
      return query select null::text, 'error'::text, 'event_id missing'::text;
      continue;
    end if;

    if v_action not in ('check_in', 'check_out') then
      return query select v_event_id, 'error'::text, 'event_type not supported'::text;
      continue;
    end if;

    if v_source not in ('mobile', 'web', 'kiosk') then
      return query select v_event_id, 'error'::text, 'source not allowed'::text;
      continue;
    end if;

    if v_site_id is null then
      return query select v_event_id, 'error'::text, 'site_id missing'::text;
      continue;
    end if;

    if not public.can_access_site(v_site_id) then
      return query select v_event_id, 'error'::text, 'No autorizado para esta sede'::text;
      continue;
    end if;

    begin
      insert into public.attendance_logs (
        employee_id,
        site_id,
        action,
        occurred_at,
        source,
        latitude,
        longitude,
        accuracy_meters,
        notes,
        device_info,
        client_event_id,
        shift_id,
        geofence_site_id,
        geofence_distance_meters
      )
      values (
        v_employee_id,
        v_site_id,
        v_action,
        v_occurred_at,
        v_source,
        v_lat,
        v_lng,
        v_accuracy,
        v_notes,
        jsonb_set(coalesce(v_device_info, '{}'::jsonb), '{clientEventId}', to_jsonb(v_event_id), true),
        v_event_id,
        v_shift_id,
        v_geofence_site_id,
        v_geofence_distance_meters
      );

      return query select v_event_id, 'applied'::text, null::text;
    exception
      when unique_violation then
        return query select v_event_id, 'duplicate'::text, 'Evento ya aplicado previamente.'::text;
      when others then
        insert into public.attendance_sync_conflicts (
          employee_id,
          event_id,
          event_type,
          site_id,
          occurred_at,
          reason,
          payload
        )
        values (
          v_employee_id,
          v_event_id,
          v_action,
          v_site_id::text,
          v_occurred_at,
          sqlerrm,
          v_item
        );

        if sqlstate = 'P0001' then
          return query select v_event_id, 'conflict'::text, sqlerrm;
        else
          return query select v_event_id, 'error'::text, sqlerrm;
        end if;
    end;
  end loop;
end;
$$;

revoke all on function public.sync_attendance_events(jsonb) from public;
grant execute on function public.sync_attendance_events(jsonb) to authenticated, service_role;

revoke all on function public.start_attendance_break(uuid, text, text) from public;
grant execute on function public.start_attendance_break(uuid, text, text) to authenticated, service_role;

revoke all on function public.end_attendance_break(text, text) from public;
grant execute on function public.end_attendance_break(text, text) to authenticated, service_role;

commit;
