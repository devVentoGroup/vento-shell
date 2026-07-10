create table if not exists public.shared_device_actor_signatures (
  id uuid primary key default gen_random_uuid(),
  shared_device_id uuid not null references public.shared_operational_devices(id) on delete cascade,
  auth_user_id uuid not null references auth.users(id) on delete cascade,
  actor_employee_id uuid not null references public.employees(id) on delete restrict,
  actor_shift_id uuid references public.employee_shifts(id) on delete set null,
  site_id uuid references public.sites(id),
  area_id uuid references public.areas(id),
  app_code text not null references public.apps(code),
  action_code text not null,
  target_table text,
  target_id uuid,
  signature_method text not null default 'pin',
  signed_at timestamptz not null default now(),
  expires_at timestamptz,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  constraint shared_device_actor_signatures_action_not_blank check (btrim(action_code) <> ''),
  constraint shared_device_actor_signatures_method_check check (
    signature_method in ('pin', 'qr', 'nfc', 'manual_override', 'session_reuse')
  ),
  constraint shared_device_actor_signatures_expires_check check (
    expires_at is null or expires_at >= signed_at
  )
);

create index if not exists shared_device_actor_signatures_device_time_idx
  on public.shared_device_actor_signatures(shared_device_id, signed_at desc);

create index if not exists shared_device_actor_signatures_actor_time_idx
  on public.shared_device_actor_signatures(actor_employee_id, signed_at desc);

create index if not exists shared_device_actor_signatures_target_idx
  on public.shared_device_actor_signatures(app_code, action_code, target_table, target_id);

create index if not exists shared_device_actor_signatures_expires_idx
  on public.shared_device_actor_signatures(expires_at);

alter table public.shared_device_actor_signatures enable row level security;

drop policy if exists shared_device_actor_signatures_select_own_device on public.shared_device_actor_signatures;
create policy shared_device_actor_signatures_select_own_device
on public.shared_device_actor_signatures
for select
to authenticated
using (
  auth_user_id = auth.uid()
  or exists (
    select 1
    from public.shared_operational_devices d
    where d.id = shared_device_actor_signatures.shared_device_id
      and d.auth_user_id = auth.uid()
  )
);

create or replace function public.current_actor_shift_for_shared_device_v1(
  p_actor_employee_id uuid,
  p_site_id uuid default null,
  p_area_id uuid default null
)
returns table (
  actor_shift_id uuid,
  active_site_id uuid,
  active_area_id uuid,
  active_role text
)
language sql
stable
security definer
set search_path = public, auth
as $$
  with last_attendance as (
    select
      al.employee_id,
      al.action,
      al.site_id,
      al.shift_id,
      al.device_info
    from public.attendance_logs al
    where al.employee_id = p_actor_employee_id
      and al.action in ('check_in', 'check_out')
    order by al.occurred_at desc, al.created_at desc
    limit 1
  ),
  actor as (
    select e.id, e.role, e.site_id, e.area_id
    from public.employees e
    where e.id = p_actor_employee_id
      and e.is_active is true
  )
  select
    la.shift_id as actor_shift_id,
    coalesce(
      nullif(la.device_info #>> '{operationalContext,siteId}', '')::uuid,
      la.site_id,
      a.site_id
    ) as active_site_id,
    coalesce(
      nullif(la.device_info #>> '{operationalContext,areaId}', '')::uuid,
      a.area_id
    ) as active_area_id,
    coalesce(
      nullif(la.device_info #>> '{operationalContext,operationalRole}', ''),
      a.role
    ) as active_role
  from last_attendance la
  join actor a on a.id = la.employee_id
  where la.action = 'check_in'
    and (p_site_id is null or coalesce(nullif(la.device_info #>> '{operationalContext,siteId}', '')::uuid, la.site_id, a.site_id) = p_site_id)
    and (p_area_id is null or coalesce(nullif(la.device_info #>> '{operationalContext,areaId}', '')::uuid, a.area_id) = p_area_id)
  limit 1;
$$;

create or replace function public.sign_shared_device_action(
  p_actor_employee_id uuid,
  p_actor_pin text default null,
  p_app_code text default 'nexo',
  p_action_code text default null,
  p_target_table text default null,
  p_target_id uuid default null,
  p_signature_method text default 'pin',
  p_ttl_seconds integer default 300,
  p_metadata jsonb default '{}'::jsonb
)
returns table (
  signature_id uuid,
  actor_employee_id uuid,
  actor_shift_id uuid,
  expires_at timestamptz
)
language plpgsql
security definer
set search_path = public, auth
as $$
declare
  v_device public.shared_operational_devices%rowtype;
  v_actor public.employees%rowtype;
  v_shift_id uuid;
  v_actor_site_id uuid;
  v_actor_area_id uuid;
  v_action_code text := nullif(btrim(coalesce(p_action_code, '')), '');
  v_app_code text := nullif(btrim(coalesce(p_app_code, '')), '');
  v_method text := lower(nullif(btrim(coalesce(p_signature_method, '')), ''));
  v_expires_at timestamptz;
  v_signature_id uuid;
begin
  if auth.uid() is null then
    raise exception 'AUTH_REQUIRED' using errcode = '28000';
  end if;

  if v_action_code is null then
    raise exception 'ACTION_CODE_REQUIRED' using errcode = '22023';
  end if;

  if v_app_code is null then
    raise exception 'APP_CODE_REQUIRED' using errcode = '22023';
  end if;

  if v_method is null then
    v_method := 'pin';
  end if;

  if v_method not in ('pin', 'qr', 'nfc', 'manual_override', 'session_reuse') then
    raise exception 'INVALID_SIGNATURE_METHOD' using errcode = '22023';
  end if;

  select * into v_device
  from public.shared_operational_devices d
  where d.auth_user_id = auth.uid()
    and d.is_active
    and d.activation_status = 'active'
  limit 1;

  if v_device.id is null then
    raise exception 'ACTIVE_SHARED_DEVICE_REQUIRED' using errcode = '28000';
  end if;

  if not exists (
    select 1
    from public.shared_operational_device_apps da
    where da.device_id = v_device.id
      and da.app_code = v_app_code
      and da.is_active
  ) then
    raise exception 'APP_NOT_ALLOWED_FOR_DEVICE' using errcode = '42501';
  end if;

  select * into v_actor
  from public.employees e
  where e.id = p_actor_employee_id
    and e.is_active is true
  limit 1;

  if v_actor.id is null then
    raise exception 'ACTIVE_ACTOR_REQUIRED' using errcode = '28000';
  end if;

  if v_device.requires_actor_pin and not v_device.allow_actor_without_pin then
    if v_method <> 'pin' then
      raise exception 'PIN_SIGNATURE_REQUIRED' using errcode = '42501';
    end if;

    if nullif(btrim(coalesce(p_actor_pin, '')), '') is null then
      raise exception 'ACTOR_PIN_REQUIRED' using errcode = '22023';
    end if;

    if coalesce(v_actor.pin_code, '') <> btrim(p_actor_pin) then
      raise exception 'INVALID_ACTOR_PIN' using errcode = '28000';
    end if;
  end if;

  select s.actor_shift_id, s.active_site_id, s.active_area_id
  into v_shift_id, v_actor_site_id, v_actor_area_id
  from public.current_actor_shift_for_shared_device_v1(
    p_actor_employee_id,
    case when v_device.requires_active_actor_shift then v_device.site_id else null end,
    null
  ) s
  limit 1;

  if v_device.requires_active_actor_shift and v_shift_id is null then
    raise exception 'ACTIVE_ACTOR_SHIFT_REQUIRED' using errcode = '42501';
  end if;

  if not public.shared_device_actor_is_allowed_v1(
    v_device.id,
    p_actor_employee_id,
    case when v_device.requires_active_actor_shift then v_device.site_id else null end,
    null
  ) then
    raise exception 'ACTOR_NOT_ALLOWED_FOR_DEVICE' using errcode = '42501';
  end if;

  if p_ttl_seconds is null or p_ttl_seconds <= 0 then
    v_expires_at := now();
  else
    v_expires_at := now() + make_interval(secs => least(p_ttl_seconds, 3600));
  end if;

  insert into public.shared_device_actor_signatures (
    shared_device_id,
    auth_user_id,
    actor_employee_id,
    actor_shift_id,
    site_id,
    area_id,
    app_code,
    action_code,
    target_table,
    target_id,
    signature_method,
    signed_at,
    expires_at,
    metadata
  ) values (
    v_device.id,
    auth.uid(),
    v_actor.id,
    v_shift_id,
    coalesce(v_actor_site_id, v_device.site_id),
    coalesce(v_actor_area_id, v_device.area_id),
    v_app_code,
    v_action_code,
    nullif(btrim(coalesce(p_target_table, '')), ''),
    p_target_id,
    v_method,
    now(),
    v_expires_at,
    coalesce(p_metadata, '{}'::jsonb) || jsonb_build_object(
      'device_code', v_device.code,
      'device_label', v_device.label,
      'actor_role', v_actor.role
    )
  )
  returning id into v_signature_id;

  insert into public.shared_operational_device_events (
    device_id,
    session_user_id,
    actor_employee_id,
    actor_shift_id,
    app_code,
    site_id,
    area_id,
    event_type,
    event_payload,
    source
  ) values (
    v_device.id,
    auth.uid(),
    v_actor.id,
    v_shift_id,
    v_app_code,
    coalesce(v_actor_site_id, v_device.site_id),
    coalesce(v_actor_area_id, v_device.area_id),
    'actor_signature_created',
    jsonb_build_object(
      'signature_id', v_signature_id,
      'action_code', v_action_code,
      'target_table', p_target_table,
      'target_id', p_target_id,
      'signature_method', v_method,
      'expires_at', v_expires_at
    ),
    'shared_device'
  );

  return query select v_signature_id, v_actor.id, v_shift_id, v_expires_at;
end;
$$;

create or replace function public.verify_shared_device_action_signature(
  p_signature_id uuid,
  p_app_code text,
  p_action_code text,
  p_target_table text default null,
  p_target_id uuid default null,
  p_consume boolean default false
)
returns table (
  signature_id uuid,
  actor_employee_id uuid,
  actor_shift_id uuid,
  shared_device_id uuid,
  site_id uuid,
  area_id uuid
)
language plpgsql
security definer
set search_path = public, auth
as $$
declare
  v_sig public.shared_device_actor_signatures%rowtype;
begin
  if auth.uid() is null then
    raise exception 'AUTH_REQUIRED' using errcode = '28000';
  end if;

  select * into v_sig
  from public.shared_device_actor_signatures s
  where s.id = p_signature_id
    and s.auth_user_id = auth.uid()
    and s.app_code = p_app_code
    and s.action_code = p_action_code
    and (s.expires_at is null or s.expires_at >= now())
    and (p_target_table is null or s.target_table is null or s.target_table = p_target_table)
    and (p_target_id is null or s.target_id is null or s.target_id = p_target_id)
  limit 1;

  if v_sig.id is null then
    raise exception 'INVALID_OR_EXPIRED_SHARED_DEVICE_SIGNATURE' using errcode = '42501';
  end if;

  if not exists (
    select 1
    from public.shared_operational_devices d
    where d.id = v_sig.shared_device_id
      and d.auth_user_id = auth.uid()
      and d.is_active
      and d.activation_status = 'active'
  ) then
    raise exception 'ACTIVE_SHARED_DEVICE_REQUIRED' using errcode = '28000';
  end if;

  if p_consume then
    update public.shared_device_actor_signatures
    set expires_at = least(coalesce(expires_at, now()), now())
    where id = v_sig.id;
  end if;

  return query select
    v_sig.id,
    v_sig.actor_employee_id,
    v_sig.actor_shift_id,
    v_sig.shared_device_id,
    v_sig.site_id,
    v_sig.area_id;
end;
$$;

revoke all on function public.current_actor_shift_for_shared_device_v1(uuid, uuid, uuid) from public;
revoke all on function public.sign_shared_device_action(uuid, text, text, text, text, uuid, text, integer, jsonb) from public;
revoke all on function public.verify_shared_device_action_signature(uuid, text, text, text, uuid, boolean) from public;

grant execute on function public.current_actor_shift_for_shared_device_v1(uuid, uuid, uuid) to authenticated;
grant execute on function public.sign_shared_device_action(uuid, text, text, text, text, uuid, text, integer, jsonb) to authenticated;
grant execute on function public.verify_shared_device_action_signature(uuid, text, text, text, uuid, boolean) to authenticated;

grant select on public.shared_device_actor_signatures to authenticated;

comment on table public.shared_device_actor_signatures is
  'Firmas auditables de trabajador humano para acciones ejecutadas desde terminales compartidas.';
comment on function public.sign_shared_device_action(uuid, text, text, text, text, uuid, text, integer, jsonb) is
  'Firma una accion operativa desde un dispositivo compartido activo, validando actor humano, PIN, jornada y politica de uso.';
comment on function public.verify_shared_device_action_signature(uuid, text, text, text, uuid, boolean) is
  'Verifica que una firma de dispositivo compartido pertenece al auth.uid actual, no expiro y coincide con app/accion/target.';

notify pgrst, 'reload schema';