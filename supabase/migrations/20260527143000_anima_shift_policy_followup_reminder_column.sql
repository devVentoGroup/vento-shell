begin;

alter table if exists public.shift_policy
  add column if not exists end_reminder_minutes_after_end int not null default 30;

comment on column public.shift_policy.end_reminder_minutes_after_end is
  'Minutos despues del fin programado para enviar un segundo recordatorio si el turno sigue abierto.';

update public.shift_policy
set end_reminder_minutes_after_end = coalesce(end_reminder_minutes_after_end, 30);

notify pgrst, 'reload schema';

commit;
