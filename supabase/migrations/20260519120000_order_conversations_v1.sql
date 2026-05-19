begin;

create table if not exists public.order_conversations (
  id uuid primary key default gen_random_uuid(),
  order_id uuid not null references public.orders(id) on delete cascade,
  site_id uuid not null references public.sites(id) on delete cascade,
  client_id uuid not null references auth.users(id) on delete cascade,
  status text not null default 'open'
    check (status in ('open', 'waiting_staff', 'waiting_client', 'closed')),
  last_message_at timestamptz,
  last_client_read_at timestamptz,
  last_staff_read_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (order_id)
);

create table if not exists public.order_messages (
  id uuid primary key default gen_random_uuid(),
  conversation_id uuid not null references public.order_conversations(id) on delete cascade,
  order_id uuid not null references public.orders(id) on delete cascade,
  site_id uuid not null references public.sites(id) on delete cascade,
  author_id uuid not null references auth.users(id) on delete cascade,
  author_type text not null check (author_type in ('client', 'staff', 'system')),
  body text not null,
  created_at timestamptz not null default now(),
  constraint order_messages_body_not_blank check (length(btrim(body)) > 0)
);

create index if not exists order_conversations_site_last_message_idx
  on public.order_conversations (site_id, (coalesce(last_message_at, created_at)) desc);

create index if not exists order_conversations_client_last_message_idx
  on public.order_conversations (client_id, (coalesce(last_message_at, created_at)) desc);

create index if not exists order_messages_conversation_created_idx
  on public.order_messages (conversation_id, created_at asc);

create index if not exists order_messages_site_created_idx
  on public.order_messages (site_id, created_at desc);

drop trigger if exists trg_order_conversations_updated_at on public.order_conversations;
create trigger trg_order_conversations_updated_at
before update on public.order_conversations
for each row execute function public.update_updated_at();

alter table public.order_conversations enable row level security;
alter table public.order_messages enable row level security;

drop policy if exists order_conversations_select_client on public.order_conversations;
create policy order_conversations_select_client
on public.order_conversations
for select
to authenticated
using (client_id = auth.uid());

drop policy if exists order_conversations_select_staff on public.order_conversations;
create policy order_conversations_select_staff
on public.order_conversations
for select
to authenticated
using (
  public.is_employee()
  and public.can_access_site(site_id)
);

drop policy if exists order_messages_select_client on public.order_messages;
create policy order_messages_select_client
on public.order_messages
for select
to authenticated
using (
  exists (
    select 1
    from public.order_conversations c
    where c.id = order_messages.conversation_id
      and c.client_id = auth.uid()
  )
);

drop policy if exists order_messages_select_staff on public.order_messages;
create policy order_messages_select_staff
on public.order_messages
for select
to authenticated
using (
  public.is_employee()
  and public.can_access_site(site_id)
);

drop policy if exists order_messages_insert_client on public.order_messages;
create policy order_messages_insert_client
on public.order_messages
for insert
to authenticated
with check (
  author_id = auth.uid()
  and author_type = 'client'
  and exists (
    select 1
    from public.order_conversations c
    where c.id = order_messages.conversation_id
      and c.order_id = order_messages.order_id
      and c.site_id = order_messages.site_id
      and c.client_id = auth.uid()
  )
);

drop policy if exists order_messages_insert_staff on public.order_messages;
create policy order_messages_insert_staff
on public.order_messages
for insert
to authenticated
with check (
  author_id = auth.uid()
  and author_type = 'staff'
  and public.is_employee()
  and public.can_access_site(site_id)
);

create or replace function public.ensure_order_conversation(p_order_id uuid)
returns jsonb
language plpgsql
security definer
set search_path = public
as $$
declare
  v_uid uuid := auth.uid();
  v_order public.orders%rowtype;
  v_conversation public.order_conversations%rowtype;
begin
  if v_uid is null then
    raise exception 'authentication_required';
  end if;

  select *
  into v_order
  from public.orders
  where id = p_order_id
    and client_id = v_uid;

  if v_order.id is null then
    raise exception 'order_not_found';
  end if;

  insert into public.order_conversations (order_id, site_id, client_id, status)
  values (v_order.id, v_order.site_id, v_uid, 'open')
  on conflict (order_id) do update
    set updated_at = now()
  returning * into v_conversation;

  return jsonb_build_object(
    'ok', true,
    'conversation_id', v_conversation.id,
    'order_id', v_conversation.order_id,
    'site_id', v_conversation.site_id,
    'client_id', v_conversation.client_id,
    'status', v_conversation.status
  );
end;
$$;

create or replace function public.touch_order_conversation_from_message()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  update public.order_conversations
  set
    last_message_at = new.created_at,
    status = case
      when new.author_type = 'client' then 'waiting_staff'
      when new.author_type = 'staff' then 'waiting_client'
      else status
    end,
    last_client_read_at = case
      when new.author_type = 'client' then new.created_at
      else last_client_read_at
    end,
    last_staff_read_at = case
      when new.author_type = 'staff' then new.created_at
      else last_staff_read_at
    end,
    updated_at = now()
  where id = new.conversation_id;

  return new;
end;
$$;

drop trigger if exists trg_order_messages_touch_conversation on public.order_messages;
create trigger trg_order_messages_touch_conversation
after insert on public.order_messages
for each row execute function public.touch_order_conversation_from_message();

grant select on table public.order_conversations to authenticated, service_role;
grant select, insert on table public.order_messages to authenticated, service_role;
grant execute on function public.ensure_order_conversation(uuid) to authenticated, service_role;

comment on table public.order_conversations is 'Conversaciones de texto ligadas a pedidos cliente-sede.';
comment on table public.order_messages is 'Mensajes de chat por pedido entre cliente y staff.';
comment on function public.ensure_order_conversation(uuid) is 'Crea o devuelve la conversación de un pedido propio del cliente.';

commit;
