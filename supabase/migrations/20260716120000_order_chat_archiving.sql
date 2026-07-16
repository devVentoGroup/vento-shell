begin;

-- ============================================================
-- 1. CAMPOS DE ARCHIVADO
-- ============================================================

alter table public.order_conversations
  add column if not exists archived_at timestamptz;

alter table public.order_conversations
  add column if not exists archived_by uuid
    references auth.users(id)
    on delete set null;

-- No puede existir archived_by si la conversación no está archivada.
-- Sí se permite archived_at sin archived_by en caso de que el usuario
-- que archivó sea eliminado posteriormente.
do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'order_conversations_archived_by_requires_archived_at'
      and conrelid = 'public.order_conversations'::regclass
  ) then
    alter table public.order_conversations
      add constraint order_conversations_archived_by_requires_archived_at
      check (
        archived_at is not null
        or archived_by is null
      );
  end if;
end;
$$;


-- ============================================================
-- 2. ÍNDICES PARA BANDEJA ACTIVA Y ARCHIVADOS
-- ============================================================

create index if not exists order_conversations_site_active_idx
  on public.order_conversations (
    site_id,
    (coalesce(last_message_at, created_at)) desc
  )
  where archived_at is null;

create index if not exists order_conversations_site_archived_idx
  on public.order_conversations (
    site_id,
    archived_at desc
  )
  where archived_at is not null;


-- ============================================================
-- 3. ARCHIVAR O RESTAURAR UNA CONVERSACIÓN
-- ============================================================

create or replace function public.set_order_conversation_archived(
  p_conversation_id uuid,
  p_archived boolean
)
returns jsonb
language plpgsql
security definer
set search_path = public
as $$
declare
  v_uid uuid := auth.uid();
  v_conversation public.order_conversations%rowtype;
  v_order_status text;
  v_has_unread_client_messages boolean;
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

  if not public.is_employee()
     or not public.can_access_site(v_conversation.site_id) then
    raise exception 'forbidden';
  end if;

  if p_archived then
    select o.status
    into v_order_status
    from public.orders o
    where o.id = v_conversation.order_id;

    if v_order_status is null
       or v_order_status not in ('delivered', 'cancelled') then
      raise exception 'order_not_finished';
    end if;

    select exists (
      select 1
      from public.order_messages m
      where m.conversation_id = v_conversation.id
        and m.author_type = 'client'
        and m.created_at > coalesce(
          v_conversation.last_staff_read_at,
          '-infinity'::timestamptz
        )
    )
    into v_has_unread_client_messages;

    if v_has_unread_client_messages then
      raise exception 'conversation_has_unread_messages';
    end if;

    update public.order_conversations
    set
      archived_at = coalesce(archived_at, now()),
      archived_by = coalesce(archived_by, v_uid),
      updated_at = now()
    where id = p_conversation_id
    returning *
    into v_conversation;

  else
    update public.order_conversations
    set
      archived_at = null,
      archived_by = null,
      updated_at = now()
    where id = p_conversation_id
    returning *
    into v_conversation;
  end if;

  return jsonb_build_object(
    'ok', true,
    'conversation_id', v_conversation.id,
    'order_id', v_conversation.order_id,
    'site_id', v_conversation.site_id,
    'archived', v_conversation.archived_at is not null,
    'archived_at', v_conversation.archived_at,
    'archived_by', v_conversation.archived_by
  );
end;
$$;


-- ============================================================
-- 4. ARCHIVAR EN BLOQUE PEDIDOS FINALIZADOS
-- ============================================================

create or replace function public.archive_finished_order_conversations(
  p_site_id uuid
)
returns jsonb
language plpgsql
security definer
set search_path = public
as $$
declare
  v_uid uuid := auth.uid();
  v_archived_count bigint := 0;
begin
  if v_uid is null then
    raise exception 'authentication_required';
  end if;

  if not public.is_employee()
     or not public.can_access_site(p_site_id) then
    raise exception 'forbidden';
  end if;

  with archived_conversations as (
    update public.order_conversations c
    set
      archived_at = now(),
      archived_by = v_uid,
      updated_at = now()
    from public.orders o
    where c.order_id = o.id
      and c.site_id = p_site_id
      and c.archived_at is null
      and o.status in ('delivered', 'cancelled')
      and not exists (
        select 1
        from public.order_messages m
        where m.conversation_id = c.id
          and m.author_type = 'client'
          and m.created_at > coalesce(
            c.last_staff_read_at,
            '-infinity'::timestamptz
          )
      )
    returning c.id
  )
  select count(*)
  into v_archived_count
  from archived_conversations;

  return jsonb_build_object(
    'ok', true,
    'site_id', p_site_id,
    'archived_count', v_archived_count
  );
end;
$$;


-- ============================================================
-- 5. REABRIR AUTOMÁTICAMENTE SI EL CLIENTE ESCRIBE
-- ============================================================

create or replace function public.unarchive_order_conversation_from_client_message()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  if new.author_type = 'client' then
    update public.order_conversations
    set
      archived_at = null,
      archived_by = null,
      updated_at = now()
    where id = new.conversation_id
      and archived_at is not null;
  end if;

  return new;
end;
$$;

drop trigger if exists trg_order_messages_unarchive_conversation
  on public.order_messages;

create trigger trg_order_messages_unarchive_conversation
after insert on public.order_messages
for each row
execute function public.unarchive_order_conversation_from_client_message();


-- ============================================================
-- 6. PERMISOS
-- ============================================================

grant execute
  on function public.set_order_conversation_archived(uuid, boolean)
  to authenticated, service_role;

grant execute
  on function public.archive_finished_order_conversations(uuid)
  to authenticated, service_role;


-- ============================================================
-- 7. DOCUMENTACIÓN
-- ============================================================

comment on column public.order_conversations.archived_at is
  'Fecha en la que la conversación fue retirada de la bandeja activa.';

comment on column public.order_conversations.archived_by is
  'Usuario del equipo que archivó la conversación.';

comment on function public.set_order_conversation_archived(uuid, boolean) is
  'Archiva o restaura una conversación. Solo permite archivar pedidos finalizados y sin mensajes pendientes del cliente.';

comment on function public.archive_finished_order_conversations(uuid) is
  'Archiva en bloque conversaciones de pedidos entregados o cancelados sin mensajes pendientes del cliente.';

comment on function public.unarchive_order_conversation_from_client_message() is
  'Restaura automáticamente una conversación archivada cuando el cliente envía un mensaje nuevo.';

commit;