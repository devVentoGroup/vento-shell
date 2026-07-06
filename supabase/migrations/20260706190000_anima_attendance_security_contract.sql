begin;

grant usage on schema public to authenticated;

-- 1) Mantener contrato mínimo necesario para ANIMA cliente.
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

-- 2) Quitar permisos cliente peligrosos o innecesarios en dominio asistencia.
revoke delete, truncate, references, trigger
on table
  public.attendance_logs,
  public.attendance_breaks,
  public.attendance_sync_conflicts
from authenticated;

-- attendance_breaks se modifica por RPC, no por cliente directo.
revoke insert, update
on table public.attendance_breaks
from authenticated;

-- attendance_sync_conflicts debe escribirse desde sync_attendance_events, no directo desde cliente.
revoke insert, update, delete, truncate, references, trigger
on table public.attendance_sync_conflicts
from authenticated;

-- 3) Limpiar policies amplias/duplicadas en attendance_logs.
drop policy if exists attendance_logs_insert_authenticated_permissive
on public.attendance_logs;

drop policy if exists attendance_logs_employee_insert_own_v20260706
on public.attendance_logs;

drop policy if exists attendance_logs_employee_select_own_v20260706
on public.attendance_logs;

-- 4) Reafirmar policies esperadas.
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

-- 5) RPC de sync como punto de escritura controlado para cola offline/conflictos.
alter function public.sync_attendance_events(jsonb)
security definer;

alter function public.sync_attendance_events(jsonb)
set search_path = public;

revoke all on function public.sync_attendance_events(jsonb) from public;
grant execute on function public.sync_attendance_events(jsonb) to authenticated, service_role;

-- 6) RPCs de descanso: ejecución permitida, escritura directa a tabla no.
revoke all on function public.start_attendance_break(uuid, text, text) from public;
grant execute on function public.start_attendance_break(uuid, text, text) to authenticated, service_role;

revoke all on function public.end_attendance_break(text, text) from public;
grant execute on function public.end_attendance_break(text, text) to authenticated, service_role;

commit;