alter table pass.site_schedule_exception_resolutions
  add column if not exists contact_name text,
  add column if not exists contact_phone text,
  add column if not exists previous_order_status text,
  add column if not exists new_order_status text;

alter table pass.site_schedule_exception_resolutions
  drop constraint if exists site_schedule_exception_resolutions_decision_check;

alter table pass.site_schedule_exception_resolutions
  add constraint site_schedule_exception_resolutions_decision_check
  check (decision in ('keep', 'rescheduled', 'contact_required', 'cancelled'));

create or replace function pass.resolve_scheduled_order_contact_admin(
  p_site_id uuid,
  p_order_id uuid,
  p_exception_date date,
  p_decision text,
  p_decided_by uuid,
  p_note text,
  p_timezone text default 'America/Bogota'
) returns void
language plpgsql
security definer
set search_path = public, pass, auth
as $$
declare
  v_order public.orders%rowtype;
  v_exception pass.site_schedule_exceptions%rowtype;
  v_contact_name text;
  v_contact_phone text;
  v_new_status text;
begin
  if p_site_id is null or p_order_id is null or p_exception_date is null or p_decided_by is null then
    raise exception 'required_fields_missing';
  end if;
  if p_decision not in ('contact_required', 'cancelled') then
    raise exception 'invalid_decision';
  end if;
  if nullif(trim(coalesce(p_note, '')), '') is null then
    raise exception 'reason_required';
  end if;

  select * into v_order
  from public.orders
  where id = p_order_id
    and site_id = p_site_id
    and schedule_mode = 'scheduled'
    and voided_at is null
  for update;

  if not found then raise exception 'order_not_found'; end if;
  if (v_order.delivery_window_start at time zone p_timezone)::date <> p_exception_date then
    raise exception 'source_exception_mismatch';
  end if;

  select * into v_exception
  from pass.site_schedule_exceptions
  where site_id = p_site_id and exception_date = p_exception_date;

  if not found then raise exception 'source_exception_not_found'; end if;

  v_contact_name := nullif(trim(coalesce(v_order.guest_info ->> 'contact_name', '')), '');
  v_contact_phone := coalesce(
    nullif(trim(coalesce(v_order.contact_phone, '')), ''),
    nullif(trim(coalesce(v_order.guest_info ->> 'contact_phone', '')), '')
  );
  v_new_status := case when p_decision = 'cancelled' then 'cancelled' else v_order.status end;

  if p_decision = 'cancelled' then
    update public.orders
    set status = 'cancelled', updated_at = now()
    where id = p_order_id;
  end if;

  insert into pass.site_schedule_exception_resolutions (
    site_id, order_id, exception_date, decision, note, decided_by, decided_at, updated_at,
    contact_name, contact_phone, previous_order_status, new_order_status
  ) values (
    p_site_id, p_order_id, p_exception_date, p_decision,
    nullif(trim(p_note), ''), p_decided_by, now(), now(),
    v_contact_name, v_contact_phone, v_order.status, v_new_status
  )
  on conflict (order_id, exception_date) do update
  set decision = excluded.decision,
      note = excluded.note,
      decided_by = excluded.decided_by,
      decided_at = excluded.decided_at,
      updated_at = excluded.updated_at,
      contact_name = excluded.contact_name,
      contact_phone = excluded.contact_phone,
      previous_order_status = excluded.previous_order_status,
      new_order_status = excluded.new_order_status;
end;
$$;

revoke all on function pass.resolve_scheduled_order_contact_admin(uuid, uuid, date, text, uuid, text, text) from public, anon, authenticated;
grant execute on function pass.resolve_scheduled_order_contact_admin(uuid, uuid, date, text, uuid, text, text) to service_role;