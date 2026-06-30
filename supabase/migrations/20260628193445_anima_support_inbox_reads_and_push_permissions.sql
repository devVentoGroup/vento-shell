begin;

alter table public.employee_push_tokens
  add column if not exists permission_status text,
  add column if not exists notifications_enabled boolean,
  add column if not exists permission_updated_at timestamptz,
  add column if not exists device_name text;

comment on column public.employee_push_tokens.permission_status is
  'Estado de permiso de notificaciones reportado por el dispositivo.';
comment on column public.employee_push_tokens.notifications_enabled is
  'True cuando el dispositivo reporta permiso de notificaciones concedido.';
comment on column public.employee_push_tokens.permission_updated_at is
  'Momento en que el dispositivo sincronizo el estado de permiso.';
comment on column public.employee_push_tokens.device_name is
  'Nombre/modelo reportado por el dispositivo para diagnostico operacional.';

create table if not exists public.support_ticket_reads (
  ticket_id uuid not null references public.support_tickets(id) on delete cascade,
  employee_id uuid not null references public.employees(id) on delete cascade,
  last_read_at timestamptz,
  hidden_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint support_ticket_reads_pkey primary key (ticket_id, employee_id)
);

comment on table public.support_ticket_reads is
  'Estado por empleado para bandeja de soporte: lectura y ocultamiento local de conversaciones.';
comment on column public.support_ticket_reads.hidden_at is
  'Oculta la conversacion solo para este empleado; no elimina auditoria ni mensajes.';

create index if not exists support_ticket_reads_employee_hidden_idx
  on public.support_ticket_reads(employee_id, hidden_at);

drop trigger if exists support_ticket_reads_set_updated_at on public.support_ticket_reads;
create trigger support_ticket_reads_set_updated_at
before update on public.support_ticket_reads
for each row execute function public._set_updated_at();

alter table public.support_ticket_reads enable row level security;

drop policy if exists "support_ticket_reads_select_self" on public.support_ticket_reads;
create policy "support_ticket_reads_select_self"
on public.support_ticket_reads
for select
to authenticated
using (employee_id = auth.uid());

drop policy if exists "support_ticket_reads_insert_self" on public.support_ticket_reads;
create policy "support_ticket_reads_insert_self"
on public.support_ticket_reads
for insert
to authenticated
with check (
  employee_id = auth.uid()
  and exists (
    select 1
    from public.support_tickets t
    where t.id = support_ticket_reads.ticket_id
      and (
        t.created_by = auth.uid()
        or t.assigned_to = auth.uid()
        or t.target_employee_id = auth.uid()
        or exists (
          select 1
          from public.employees e
          join public.employee_sites es on es.employee_id = e.id
          where e.id = auth.uid()
            and e.role = 'gerente'
            and es.site_id = t.site_id
            and es.is_active = true
        )
      )
  )
);

drop policy if exists "support_ticket_reads_update_self" on public.support_ticket_reads;
create policy "support_ticket_reads_update_self"
on public.support_ticket_reads
for update
to authenticated
using (employee_id = auth.uid())
with check (employee_id = auth.uid());

grant select, insert, update on table public.support_ticket_reads to authenticated;
grant all on table public.support_ticket_reads to service_role;

commit;
