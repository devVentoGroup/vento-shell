begin;

-- These policies were created for PUBLIC, so anon requests could evaluate
-- predicates that read staff tables and emit 42501 noise. The intended access
-- model is staff-only; keep anon with table SELECT but no matching RLS policy.
alter policy employee_shifts_select_manager
on public.employee_shifts
to authenticated;

alter policy employee_shifts_select_owner
on public.employee_shifts
to authenticated;

alter policy employee_shifts_select_self
on public.employee_shifts
to authenticated;

alter policy employee_shifts_write_manager
on public.employee_shifts
to authenticated;

alter policy employee_shifts_write_owner
on public.employee_shifts
to authenticated;

alter policy sites_select_staff
on public.sites
to authenticated;

alter policy sites_write_owner
on public.sites
to authenticated;

commit;
