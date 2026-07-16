create schema if not exists app_private;
revoke all on schema app_private from public, anon, authenticated;

create table if not exists app_private.delivery_pin_secrets (
  id boolean primary key default true check (id),
  secret text not null,
  created_at timestamptz not null default now()
);

insert into app_private.delivery_pin_secrets (id, secret)
values (true, encode(gen_random_bytes(48), 'hex'))
on conflict (id) do nothing;

create or replace function app_private.delivery_pin_for_session(p_session_id uuid)
returns text
language sql
stable
security definer
set search_path = app_private, public, extensions
as $$
  select lpad(
    (
      (
        ('x' || substr(
          encode(
            extensions.hmac(
              convert_to(p_session_id::text, 'utf8'),
              convert_to(s.secret, 'utf8'),
              'sha256'::text
            ),
            'hex'
          ),
          1,
          12
        ))::bit(48)::bigint % 1000000
      )::text
    ),
    6,
    '0'
  )
  from app_private.delivery_pin_secrets s
  where s.id = true;
$$;

revoke all on function app_private.delivery_pin_for_session(uuid) from public, anon, authenticated;

create table if not exists public.order_delivery_sessions (
  id uuid primary key default gen_random_uuid(),
  order_id uuid not null unique references public.orders(id) on delete cascade,
  site_id uuid not null references public.sites(id),
  status text not null default 'in_transit' check (status in ('pending','in_transit','confirmed','issue','expired','cancelled')),
  confirmation_pin_hash text not null,
  expires_at timestamptz not null,
  attempt_count integer not null default 0 check (attempt_count >= 0),
  max_attempts integer not null default 5 check (max_attempts between 1 and 20),
  opened_at timestamptz,
  confirmed_at timestamptz,
  confirmed_by text,
  issue_code text,
  issue_notes text,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists order_delivery_sessions_site_status_idx
  on public.order_delivery_sessions(site_id, status);
create index if not exists order_delivery_sessions_expires_idx
  on public.order_delivery_sessions(expires_at)
  where status in ('pending','in_transit');

alter table public.order_delivery_sessions enable row level security;

create policy order_delivery_sessions_select_client
on public.order_delivery_sessions
for select
to authenticated
using (
  exists (
    select 1
    from public.orders o
    where o.id = order_delivery_sessions.order_id
      and o.client_id = auth.uid()
  )
);

create policy order_delivery_sessions_select_staff
on public.order_delivery_sessions
for select
to authenticated
using (public.is_employee() and public.can_access_site(site_id));

create or replace function public.sync_order_delivery_session()
returns trigger
language plpgsql
security definer
set search_path = public, app_private, extensions
as $$
declare
  v_session_id uuid;
  v_pin text;
begin
  if new.fulfillment_type <> 'delivery' then
    return new;
  end if;

  if new.status = 'on_the_way'
     and (tg_op = 'INSERT' or old.status is distinct from new.status) then
    select id into v_session_id
    from public.order_delivery_sessions
    where order_id = new.id;

    if v_session_id is null then
      v_session_id := gen_random_uuid();
      v_pin := app_private.delivery_pin_for_session(v_session_id);

      insert into public.order_delivery_sessions (
        id,
        order_id,
        site_id,
        status,
        confirmation_pin_hash,
        expires_at,
        metadata
      ) values (
        v_session_id,
        new.id,
        new.site_id,
        'in_transit',
        encode(extensions.digest(v_pin, 'sha256'::text), 'hex'),
        now() + interval '12 hours',
        jsonb_build_object('source', 'orders_status_trigger')
      );
    else
      update public.order_delivery_sessions
      set status = case when status = 'confirmed' then status else 'in_transit' end,
          expires_at = case when status = 'confirmed' then expires_at else now() + interval '12 hours' end,
          updated_at = now()
      where id = v_session_id;
    end if;
  elsif new.status = 'cancelled' and old.status is distinct from new.status then
    update public.order_delivery_sessions
    set status = case when status = 'confirmed' then status else 'cancelled' end,
        updated_at = now()
    where order_id = new.id;
  end if;

  return new;
end;
$$;

revoke all on function public.sync_order_delivery_session() from public, anon, authenticated;

drop trigger if exists orders_sync_delivery_session on public.orders;
create trigger orders_sync_delivery_session
after insert or update of status on public.orders
for each row execute function public.sync_order_delivery_session();

create or replace function public.get_order_delivery_pin(p_order_id uuid)
returns jsonb
language plpgsql
security definer
set search_path = public, app_private, extensions
as $$
declare
  v_order public.orders%rowtype;
  v_session public.order_delivery_sessions%rowtype;
  v_pin text;
begin
  if auth.uid() is null then
    raise exception 'authentication_required';
  end if;

  select * into v_order
  from public.orders
  where id = p_order_id
    and client_id = auth.uid();

  if v_order.id is null then
    raise exception 'order_not_found';
  end if;

  select * into v_session
  from public.order_delivery_sessions
  where order_id = p_order_id;

  if v_session.id is null then
    return jsonb_build_object(
      'ok', true,
      'available', false,
      'status', null
    );
  end if;

  if v_session.status in ('pending','in_transit') and v_session.expires_at <= now() then
    update public.order_delivery_sessions
    set status = 'expired', updated_at = now()
    where id = v_session.id;
    v_session.status := 'expired';
  end if;

  if v_session.status = 'in_transit' then
    v_pin := app_private.delivery_pin_for_session(v_session.id);

    if encode(extensions.digest(v_pin, 'sha256'::text), 'hex') <> v_session.confirmation_pin_hash then
      raise exception 'delivery_pin_integrity_error';
    end if;
  end if;

  return jsonb_build_object(
    'ok', true,
    'available', v_session.status = 'in_transit',
    'status', v_session.status,
    'pin', case when v_session.status = 'in_transit' then v_pin else null end,
    'expires_at', v_session.expires_at,
    'confirmed_at', v_session.confirmed_at
  );
end;
$$;

grant execute on function public.get_order_delivery_pin(uuid) to authenticated;

alter publication supabase_realtime add table public.order_delivery_sessions;