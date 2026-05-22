begin;

create table if not exists public.staff_manual_calendar_events (
  id uuid primary key default gen_random_uuid(),
  event_date date not null,
  title text not null,
  detail text,
  event_type text not null default 'commercial'
    check (event_type in ('holiday', 'mother_day', 'commercial', 'operations', 'maintenance', 'other')),
  site_id uuid references public.sites(id) on delete set null,
  priority text not null default 'medium'
    check (priority in ('high', 'medium', 'low')),
  is_active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint staff_manual_calendar_events_title_not_blank check (btrim(title) <> '')
);

create index if not exists staff_manual_calendar_events_date_idx
  on public.staff_manual_calendar_events (event_date, is_active, event_type);

create index if not exists staff_manual_calendar_events_site_idx
  on public.staff_manual_calendar_events (site_id, event_date)
  where site_id is not null;

drop trigger if exists staff_manual_calendar_events_set_updated_at on public.staff_manual_calendar_events;
create trigger staff_manual_calendar_events_set_updated_at
before update on public.staff_manual_calendar_events
for each row
execute function public._set_updated_at();

alter table public.staff_manual_calendar_events enable row level security;

grant select, insert, update, delete on public.staff_manual_calendar_events to authenticated, service_role;

drop policy if exists staff_manual_calendar_events_select_admin on public.staff_manual_calendar_events;
create policy staff_manual_calendar_events_select_admin
on public.staff_manual_calendar_events
for select
to authenticated
using (public.is_owner() or public.is_global_manager());

drop policy if exists staff_manual_calendar_events_write_admin on public.staff_manual_calendar_events;
create policy staff_manual_calendar_events_write_admin
on public.staff_manual_calendar_events
for all
to authenticated
using (public.is_owner() or public.is_global_manager())
with check (public.is_owner() or public.is_global_manager());

comment on table public.staff_manual_calendar_events is
  'Eventos manuales del calendario maestro de VISO: fechas comerciales/locales, excepciones regionales y recordatorios operativos.';

notify pgrst, 'reload schema';

commit;
