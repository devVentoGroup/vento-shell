-- Package reservation: VISO-SCHEDULE-MONTHLY-001.
-- Status: provisional policy; not authorized for production rollout.
-- Canonical process: VPROC-0007.
-- Canonical migration repository: vento-shell.
-- VISO: límite mensual de publicación de turnos por trabajador.
-- Regla provisional local pendiente de aprobación canónica en VISO-SCH-004 y VISO-SCH-008:
--   * Los borradores pueden superar 186 horas para permitir ajustes.
--   * Cualquier publicación queda bloqueada mientras el plan completo del mes
--     del trabajador exceda 11.160 minutos (186 horas).
--   * Los descansos y turnos cancelados no suman horas laborales.

create or replace function public.viso_enforce_monthly_schedule_publish_limit()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  v_month_start date;
  v_month_end date;
  v_existing_minutes integer := 0;
  v_new_minutes integer := 0;
  v_total_minutes integer := 0;
  v_limit_minutes constant integer := 11160;
  v_employee_label text;
begin
  -- La regla solo se activa cuando el registro queda publicado.
  -- Cancelar o convertir un turno en descanso siempre debe poder reducir horas.
  if new.published_at is null
    or coalesce(new.status, '') = 'cancelled'
    or coalesce(new.shift_kind, 'laboral') = 'descanso'
  then
    return new;
  end if;

  v_month_start := date_trunc('month', new.shift_date)::date;
  v_month_end := (v_month_start + interval '1 month')::date;

  select coalesce(
    sum(
      case
        when coalesce(es.shift_kind, 'laboral') = 'descanso'
          or coalesce(es.status, '') = 'cancelled'
        then 0
        else greatest(
          0,
          floor(extract(epoch from (es.end_time - es.start_time)) / 60)::integer
          - greatest(coalesce(es.break_minutes, 0), 0)
        )
      end
    ),
    0
  )::integer
  into v_existing_minutes
  from public.employee_shifts es
  where es.employee_id = new.employee_id
    and es.shift_date >= v_month_start
    and es.shift_date < v_month_end
    and (tg_op = 'INSERT' or es.id <> new.id);

  v_new_minutes := case
    when coalesce(new.shift_kind, 'laboral') = 'descanso'
      or coalesce(new.status, '') = 'cancelled'
    then 0
    else greatest(
      0,
      floor(extract(epoch from (new.end_time - new.start_time)) / 60)::integer
      - greatest(coalesce(new.break_minutes, 0), 0)
    )
  end;

  v_total_minutes := v_existing_minutes + v_new_minutes;

  if v_total_minutes > v_limit_minutes then
    select coalesce(e.full_name, e.alias, e.id::text)
    into v_employee_label
    from public.employees e
    where e.id = new.employee_id;

    raise exception using
      errcode = 'P0001',
      message = format(
        'No se puede publicar: %s acumula %s horas en %s y el máximo permitido es 186 horas. Corrige los borradores del mes.',
        coalesce(v_employee_label, new.employee_id::text),
        round(v_total_minutes::numeric / 60, 1),
        to_char(v_month_start, 'YYYY-MM')
      );
  end if;

  return new;
end;
$$;

comment on function public.viso_enforce_monthly_schedule_publish_limit() is
  'Reserved for package VISO-SCHEDULE-MONTHLY-001. Guards publication of VPROC-0007 scheduling against the provisional 186-hour monthly threshold. Value, validity, policy versioning and approved exception handling remain required before production rollout.';

drop trigger if exists trg_viso_monthly_schedule_publish_limit
  on public.employee_shifts;

create trigger trg_viso_monthly_schedule_publish_limit
before insert or update of
  published_at,
  employee_id,
  shift_date,
  start_time,
  end_time,
  break_minutes,
  shift_kind,
  status
on public.employee_shifts
for each row
execute function public.viso_enforce_monthly_schedule_publish_limit();
