begin;

create or replace function public.employee_wallet_eligibility(p_employee_id uuid default null)
returns table (
  employee_id uuid,
  contract_active boolean,
  contract_document_id uuid,
  contract_start_date date,
  contract_end_date date,
  documents_complete boolean,
  missing_required_document_type_ids uuid[],
  wallet_eligible boolean,
  wallet_status text
)
language plpgsql
security definer
set search_path = public
as $$
declare
  v_today date := current_date;
  v_emp_id uuid;
  v_contract_doc_id uuid;
  v_contract_start date;
  v_contract_end date;
  v_contract_ok boolean := false;
  v_required_ids uuid[];
  v_missing_ids uuid[] := array[]::uuid[];
  v_docs_ok boolean := true;
  v_emp_active boolean;
  v_card_status text;
  v_rule record;
  v_has_doc boolean;
begin
  for v_emp_id in
    select e.id
    from public.employees e
    where p_employee_id is null or e.id = p_employee_id
  loop
    v_contract_doc_id := null;
    v_contract_start := null;
    v_contract_end := null;
    v_contract_ok := false;
    v_missing_ids := array[]::uuid[];
    v_docs_ok := true;

    select d.id, (d.issue_date)::date, (d.expiry_date)::date
    into v_contract_doc_id, v_contract_start, v_contract_end
    from public.documents d
    join public.document_types dt on dt.id = d.document_type_id and dt.system_key = 'employment_contract'
    where d.target_employee_id = v_emp_id
      and d.scope = 'employee'
      and d.status <> 'rejected'
      and d.issue_date is not null
      and ((d.expiry_date)::date is null or (d.expiry_date)::date >= v_today)
      and (d.issue_date)::date <= v_today
    order by (d.expiry_date)::date desc nulls first
    limit 1;

    v_contract_ok := v_contract_doc_id is not null;

    select array_agg(r.document_type_id order by r.display_order, r.document_type_id)
    into v_required_ids
    from public.required_document_rules r
    where r.active = true
      and r.is_required = true
      and (r.site_id is null or r.site_id = (
        select coalesce(es.site_id, e.site_id)
        from public.employees e
        left join public.employee_sites es on es.employee_id = e.id and es.is_primary = true
        where e.id = v_emp_id
        limit 1
      ))
      and (r.role is null or r.role = (select e.role from public.employees e where e.id = v_emp_id limit 1));

    if v_required_ids is not null then
      for v_rule in
        select unnest(v_required_ids) as doc_type_id
      loop
        select exists (
          select 1
          from public.documents d
          where d.target_employee_id = v_emp_id
            and d.document_type_id = v_rule.doc_type_id
            and d.scope = 'employee'
            and d.status <> 'rejected'
        ) into v_has_doc;
        if not v_has_doc then
          v_missing_ids := array_append(v_missing_ids, v_rule.doc_type_id);
          v_docs_ok := false;
        end if;
      end loop;
    end if;

    if v_required_ids is null or array_length(v_required_ids, 1) is null then
      v_docs_ok := true;
    end if;

    select e.is_active from public.employees e where e.id = v_emp_id limit 1 into v_emp_active;

    select coalesce(c.status::text, 'eligible')
    into v_card_status
    from public.employee_wallet_cards c
    where c.employee_id = v_emp_id
    limit 1;

    employee_id := v_emp_id;
    contract_active := v_contract_ok;
    contract_document_id := v_contract_doc_id;
    contract_start_date := v_contract_start;
    contract_end_date := v_contract_end;
    documents_complete := v_docs_ok;
    missing_required_document_type_ids := v_missing_ids;
    wallet_eligible := coalesce(v_emp_active, false) and v_contract_ok and v_docs_ok;
    wallet_status := v_card_status;
    return next;
  end loop;
end;
$$;

create or replace function public.employee_wallet_sync_eligibility()
returns jsonb
language plpgsql
security definer
set search_path = public
as $$
declare
  v_row record;
  v_elig record;
  v_revoked_count int := 0;
  v_checked_count int := 0;
  v_reason text;
  v_revoked_ids uuid[] := array[]::uuid[];
begin
  for v_row in
    select c.id, c.employee_id
    from public.employee_wallet_cards c
    where c.status = 'issued'
  loop
    v_checked_count := v_checked_count + 1;

    select *
    into v_elig
    from public.employee_wallet_eligibility(v_row.employee_id)
    limit 1;

    if v_elig.wallet_eligible then
      null;
    else
      if not v_elig.contract_active then
        v_reason := 'contract_expired';
      elsif not v_elig.documents_complete then
        v_reason := 'documents_incomplete';
      else
        v_reason := 'no_longer_eligible';
      end if;

      update public.employee_wallet_cards
      set
        status = 'revoked',
        last_revoked_at = now(),
        revocation_reason = v_reason,
        updated_at = now()
      where id = v_row.id;

      v_revoked_count := v_revoked_count + 1;
      v_revoked_ids := array_append(v_revoked_ids, v_row.employee_id);
    end if;
  end loop;

  return jsonb_build_object(
    'checked_count', v_checked_count,
    'revoked_count', v_revoked_count,
    'revoked_employee_ids', to_jsonb(v_revoked_ids)
  );
end;
$$;

create or replace function public.close_open_attendance_day_end(p_timezone text default 'America/Bogota'::text)
returns integer
language plpgsql
security definer
set search_path = public
as $$
declare
  v_day_end timestamptz;
  v_closed int := 0;
begin
  v_day_end := (date_trunc('day', now() at time zone p_timezone) + interval '1 day' - interval '1 second') at time zone p_timezone;

  with last_logs as (
    select distinct on (employee_id)
      employee_id,
      site_id,
      action,
      occurred_at
    from public.attendance_logs
    where occurred_at <= v_day_end
    order by employee_id, occurred_at desc, created_at desc
  ),
  inserted as (
    insert into public.attendance_logs (
      employee_id,
      site_id,
      action,
      source,
      occurred_at,
      latitude,
      longitude,
      accuracy_meters,
      device_info,
      notes
    )
    select
      l.employee_id,
      l.site_id,
      'check_out',
      'system',
      v_day_end,
      s.latitude,
      s.longitude,
      0,
      jsonb_build_object('auto_close', true, 'reason', 'day_end'),
      'Cierre automatico: turno abierto cerrado por el sistema a las 23:59'
    from last_logs l
    join public.sites s on s.id = l.site_id
    where l.action = 'check_in'
      and not exists (
        select 1
        from public.attendance_logs al
        where al.employee_id = l.employee_id
          and al.action = 'check_out'
          and al.occurred_at > l.occurred_at
          and al.occurred_at <= v_day_end
      )
    returning 1
  )
  select count(*) into v_closed from inserted;

  return v_closed;
end;
$$;

create or replace function public.compute_restock_item_status(
  p_requested_qty numeric,
  p_prepared_qty numeric,
  p_shipped_qty numeric,
  p_received_qty numeric,
  p_shortage_qty numeric
)
returns text
language plpgsql
immutable
as $$
declare
  v_requested_qty numeric := round(coalesce(p_requested_qty, 0)::numeric, 2);
  v_prepared_qty numeric := round(coalesce(p_prepared_qty, 0)::numeric, 2);
  v_shipped_qty numeric := round(coalesce(p_shipped_qty, 0)::numeric, 2);
  v_received_qty numeric := round(coalesce(p_received_qty, 0)::numeric, 2);
  v_accounted_qty numeric := round(coalesce(p_received_qty, 0)::numeric + coalesce(p_shortage_qty, 0)::numeric, 2);
begin
  if v_shipped_qty > 0 then
    if v_received_qty >= v_shipped_qty then
      return 'received';
    end if;

    if v_accounted_qty > 0 then
      return 'partial';
    end if;

    return 'in_transit';
  end if;

  if v_prepared_qty > 0 then
    return 'preparing';
  end if;

  if v_requested_qty > 0 then
    return 'pending';
  end if;

  return 'pending';
end;
$$;

-- Preserve the hardened grants after replacing function bodies.
revoke all on function public.employee_wallet_sync_eligibility() from authenticated;
grant execute on function public.employee_wallet_sync_eligibility() to service_role;
revoke all on function public.compute_restock_item_status(numeric, numeric, numeric, numeric, numeric) from authenticated;

commit;
