begin;

alter table public.employee_shifts
  add column if not exists area_id uuid;

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'employee_shifts_area_id_fkey'
      and conrelid = 'public.employee_shifts'::regclass
  ) then
    alter table public.employee_shifts
      add constraint employee_shifts_area_id_fkey
      foreign key (area_id)
      references public.areas(id)
      on delete set null;
  end if;
end $$;

create index if not exists employee_shifts_area_id_idx
  on public.employee_shifts(area_id);

comment on column public.employee_shifts.area_id is
  'Área operativa del turno. Complementa site_id y operational_role para resolver contexto operativo.';

notify pgrst, 'reload schema';

commit;
