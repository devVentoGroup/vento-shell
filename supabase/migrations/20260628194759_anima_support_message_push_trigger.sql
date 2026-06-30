begin;

create extension if not exists pg_net;

insert into public.app_config (key, value)
values
  (
    'support_message_notify_function_url',
    to_jsonb('https://clzdpinthhtknkmefsxx.supabase.co/functions/v1/support-message-notify'::text)
  )
on conflict (key) do update set
  value = excluded.value,
  updated_at = now();

create or replace function public.notify_support_message_inserted()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  fn_url text;
  secret text;
begin
  select coalesce(value #>> '{}', '')
  into fn_url
  from public.app_config
  where key = 'support_message_notify_function_url'
  limit 1;

  select coalesce(value #>> '{}', '')
  into secret
  from public.app_config
  where key = 'shift_notify_internal_secret'
  limit 1;

  if trim(fn_url) = '' or trim(secret) = '' then
    return new;
  end if;

  perform net.http_post(
    trim(fn_url),
    jsonb_build_object(
      'ticket_id', new.ticket_id,
      'message_id', new.id,
      'author_id', new.author_id,
      'body', new.body
    ),
    '{}'::jsonb,
    jsonb_build_object(
      'Content-Type', 'application/json',
      'x-internal-secret', trim(secret)
    )
  );

  return new;
exception
  when others then
    return new;
end;
$$;

comment on function public.notify_support_message_inserted() is
  'Llama la Edge Function support-message-notify cuando se crea un mensaje de soporte.';

drop trigger if exists trg_support_messages_notify_inserted on public.support_messages;
create trigger trg_support_messages_notify_inserted
after insert on public.support_messages
for each row execute function public.notify_support_message_inserted();

commit;
