begin;

create or replace function public.support_ticket_is_visible_to_current_employee(p_ticket_id uuid)
returns boolean
language sql
stable
security invoker
set search_path = public
as $$
  select exists (
    select 1
    from public.support_tickets t
    where t.id = p_ticket_id
      and (
        t.created_by = auth.uid()
        or t.assigned_to = auth.uid()
        or t.target_employee_id = auth.uid()
        or public.is_owner()
        or public.is_global_manager()
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
  );
$$;

comment on function public.support_ticket_is_visible_to_current_employee(uuid) is
  'Evalua si el empleado autenticado puede usar estado personal de lectura/ocultamiento para un ticket de soporte.';

drop policy if exists "support_ticket_reads_insert_self" on public.support_ticket_reads;
create policy "support_ticket_reads_insert_self"
on public.support_ticket_reads
for insert
to authenticated
with check (
  employee_id = auth.uid()
  and public.support_ticket_is_visible_to_current_employee(ticket_id)
);

drop policy if exists "support_ticket_reads_update_self" on public.support_ticket_reads;
create policy "support_ticket_reads_update_self"
on public.support_ticket_reads
for update
to authenticated
using (
  employee_id = auth.uid()
  and public.support_ticket_is_visible_to_current_employee(ticket_id)
)
with check (
  employee_id = auth.uid()
  and public.support_ticket_is_visible_to_current_employee(ticket_id)
);

commit;
