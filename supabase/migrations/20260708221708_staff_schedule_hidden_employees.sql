begin;

create table if not exists public.staff_schedule_hidden_employees (
  employee_id uuid primary key references public.employees(id) on delete cascade,
  reason text,
  hidden_at timestamptz not null default now(),
  hidden_by uuid references public.employees(id) on delete set null,
  updated_at timestamptz not null default now(),
  updated_by uuid references public.employees(id) on delete set null,
  constraint staff_schedule_hidden_employees_reason_not_blank check (
    reason is null or length(trim(reason)) > 0
  )
);

comment on table public.staff_schedule_hidden_employees is
  'Global VISO schedule preference: employees hidden from the global schedule planner for every user/device.';

comment on column public.staff_schedule_hidden_employees.employee_id is
  'Employee hidden from the global schedule view. This does not deactivate the employee or affect attendance.';

create index if not exists staff_schedule_hidden_employees_hidden_at_idx
  on public.staff_schedule_hidden_employees(hidden_at desc);

alter table public.staff_schedule_hidden_employees enable row level security;

drop policy if exists "staff_schedule_hidden_employees_select_admin" on public.staff_schedule_hidden_employees;
create policy "staff_schedule_hidden_employees_select_admin"
on public.staff_schedule_hidden_employees
for select
to authenticated
using (
  public.is_owner()
  or public.is_global_manager()
);

drop policy if exists "staff_schedule_hidden_employees_write_admin" on public.staff_schedule_hidden_employees;
create policy "staff_schedule_hidden_employees_write_admin"
on public.staff_schedule_hidden_employees
for all
to authenticated
using (
  public.is_owner()
  or public.is_global_manager()
)
with check (
  public.is_owner()
  or public.is_global_manager()
);

grant select, insert, update, delete on public.staff_schedule_hidden_employees to authenticated;
grant all on public.staff_schedule_hidden_employees to service_role;

commit;
