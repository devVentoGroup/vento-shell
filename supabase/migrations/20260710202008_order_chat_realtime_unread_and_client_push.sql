begin;

create table if not exists public.client_push_tokens (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  token text not null unique,
  platform text,
  device_name text,
  permission_status text,
  notifications_enabled boolean not null default true,
  is_active boolean not null default true,
  last_seen timestamptz not null default now(),
  permission_updated_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists client_push_tokens_user_active_idx
  on public.client_push_tokens (user_id, is_active)
  where is_active = true and notifications_enabled = true;

alter table public.client_push_tokens enable row level security;

drop trigger if exists trg_client_push_tokens_updated_at on public.client_push_tokens;
create trigger trg_client_push_tokens_updated_at
before update on public.client_push_tokens
for each row execute function public.update_updated_at();

do $$
begin
  if not exists (
    select 1
    from pg_publication_tables
    where pubname = 'supabase_realtime'
      and schemaname = 'public'
      and tablename = 'order_messages'
  ) then
    alter publication supabase_realtime add table public.order_messages;
  end if;

  if not exists (
    select 1
    from pg_publication_tables
    where pubname = 'supabase_realtime'
      and schemaname = 'public'
      and tablename = 'order_conversations'
  ) then
    alter publication supabase_realtime add table public.order_conversations;
  end if;
end;
$$;

create or replace function public.mark_order_conversation_read(p_conversation_id uuid)
returns jsonb
language plpgsql
security definer
set search_path = public
as $$
declare
  v_uid uuid := auth.uid();
  v_conversation public.order_conversations%rowtype;
  v_reader text;
begin
  if v_uid is null then
    raise exception 'authentication_required';
  end if;

  select *
  into v_conversation
  from public.order_conversations
  where id = p_conversation_id
  for update;

  if v_conversation.id is null then
    raise exception 'conversation_not_found';
  end if;

  if v_conversation.client_id = v_uid then
    update public.order_conversations
    set
      last_client_read_at = now(),
      status = case when status = 'waiting_client' then 'open' else status end,
      updated_at = now()
    where id = p_conversation_id;
    v_reader := 'client';
  elsif public.is_employee() and public.can_access_site(v_conversation.site_id) then
    update public.order_conversations
    set
      last_staff_read_at = now(),
      status = case when status = 'waiting_staff' then 'open' else status end,
      updated_at = now()
    where id = p_conversation_id;
    v_reader := 'staff';
  else
    raise exception 'forbidden';
  end if;

  return jsonb_build_object(
    'ok', true,
    'conversation_id', p_conversation_id,
    'reader', v_reader,
    'read_at', now()
  );
end;
$$;

create or replace function public.get_client_order_chat_unread_counts(p_order_ids uuid[] default null)
returns table (
  order_id uuid,
  conversation_id uuid,
  unread_count bigint,
  latest_message_at timestamptz
)
language sql
stable
security definer
set search_path = public
as $$
  select
    c.order_id,
    c.id as conversation_id,
    count(m.id)::bigint as unread_count,
    max(m.created_at) as latest_message_at
  from public.order_conversations c
  left join public.order_messages m
    on m.conversation_id = c.id
   and m.author_type = 'staff'
   and m.created_at > coalesce(c.last_client_read_at, '-infinity'::timestamptz)
  where c.client_id = auth.uid()
    and (p_order_ids is null or c.order_id = any(p_order_ids))
  group by c.order_id, c.id;
$$;

create or replace function public.get_staff_order_chat_unread_counts(p_site_id uuid)
returns table (
  order_id uuid,
  conversation_id uuid,
  unread_count bigint,
  latest_message_at timestamptz
)
language plpgsql
stable
security definer
set search_path = public
as $$
begin
  if auth.uid() is null then
    raise exception 'authentication_required';
  end if;

  if not public.is_employee() or not public.can_access_site(p_site_id) then
    raise exception 'forbidden';
  end if;

  return query
  select
    c.order_id,
    c.id as conversation_id,
    count(m.id)::bigint as unread_count,
    max(m.created_at) as latest_message_at
  from public.order_conversations c
  left join public.order_messages m
    on m.conversation_id = c.id
   and m.author_type = 'client'
   and m.created_at > coalesce(c.last_staff_read_at, '-infinity'::timestamptz)
  where c.site_id = p_site_id
  group by c.order_id, c.id;
end;
$$;

grant execute on function public.mark_order_conversation_read(uuid) to authenticated, service_role;
grant execute on function public.get_client_order_chat_unread_counts(uuid[]) to authenticated, service_role;
grant execute on function public.get_staff_order_chat_unread_counts(uuid) to authenticated, service_role;

comment on table public.client_push_tokens is 'Tokens Expo Push de clientes de Vento Pass.';
comment on function public.mark_order_conversation_read(uuid) is 'Marca una conversación de pedido como leída para el cliente o el staff autenticado.';
comment on function public.get_client_order_chat_unread_counts(uuid[]) is 'Devuelve mensajes de staff no leídos por pedido para el cliente autenticado.';
comment on function public.get_staff_order_chat_unread_counts(uuid) is 'Devuelve mensajes de cliente no leídos por pedido para el staff de una sede.';

commit;