create table if not exists public.gift_recipients (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid not null references auth.users(id) on delete cascade,
  name text not null,
  phone text not null,
  relationship text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  last_used_at timestamptz,
  constraint gift_recipients_name_check check (char_length(trim(name)) between 1 and 120),
  constraint gift_recipients_phone_check check (char_length(trim(phone)) between 3 and 30),
  constraint gift_recipients_relationship_check check (relationship is null or char_length(relationship) <= 80),
  constraint gift_recipients_owner_phone_unique unique (owner_id, phone)
);

alter table public.gift_recipients enable row level security;

drop policy if exists gift_recipients_select_own on public.gift_recipients;
create policy gift_recipients_select_own
on public.gift_recipients
for select
to authenticated
using ((select auth.uid()) = owner_id);

drop policy if exists gift_recipients_insert_own on public.gift_recipients;
create policy gift_recipients_insert_own
on public.gift_recipients
for insert
to authenticated
with check ((select auth.uid()) = owner_id);

drop policy if exists gift_recipients_update_own on public.gift_recipients;
create policy gift_recipients_update_own
on public.gift_recipients
for update
to authenticated
using ((select auth.uid()) = owner_id)
with check ((select auth.uid()) = owner_id);

drop policy if exists gift_recipients_delete_own on public.gift_recipients;
create policy gift_recipients_delete_own
on public.gift_recipients
for delete
to authenticated
using ((select auth.uid()) = owner_id);

grant select, insert, update, delete on public.gift_recipients to authenticated;
revoke all on public.gift_recipients from anon;

create index if not exists gift_recipients_owner_last_used_idx
on public.gift_recipients(owner_id, last_used_at desc nulls last, updated_at desc);

create or replace function public.get_client_gift_history(p_limit integer default 10)
returns table (
  order_id uuid,
  created_at timestamptz,
  site_id uuid,
  total_amount numeric,
  fulfillment_type text,
  schedule_mode text,
  recipient_name text,
  recipient_phone text,
  recipient_relationship text,
  is_surprise boolean,
  contact_policy text,
  fallback_contact_policy text,
  card_requested boolean,
  card_message text,
  card_to text,
  card_from text,
  saved_recipient_id uuid
)
language sql
security invoker
set search_path = public
as $$
  select
    o.id,
    o.created_at,
    o.site_id,
    o.total_amount,
    o.fulfillment_type,
    o.schedule_mode,
    g.recipient_name,
    g.recipient_phone,
    g.recipient_relationship,
    g.is_surprise,
    g.contact_policy,
    g.fallback_contact_policy,
    g.card_requested,
    g.card_message,
    g.card_to,
    g.card_from,
    g.saved_recipient_id
  from public.orders o
  join public.order_gift_details g on g.order_id = o.id
  where o.client_id = (select auth.uid())
    and o.is_gift = true
  order by o.created_at desc
  limit greatest(1, least(coalesce(p_limit, 10), 25));
$$;

revoke all on function public.get_client_gift_history(integer) from public, anon;
grant execute on function public.get_client_gift_history(integer) to authenticated;

create or replace function public.save_or_touch_gift_recipient(
  p_name text,
  p_phone text,
  p_relationship text default null
)
returns uuid
language plpgsql
security invoker
set search_path = public
as $$
declare
  v_id uuid;
  v_name text := nullif(trim(coalesce(p_name, '')), '');
  v_phone text := nullif(trim(coalesce(p_phone, '')), '');
  v_relationship text := nullif(trim(coalesce(p_relationship, '')), '');
begin
  if auth.uid() is null then
    raise exception 'authentication_required';
  end if;
  if v_name is null then raise exception 'recipient_name_required'; end if;
  if v_phone is null then raise exception 'recipient_phone_required'; end if;

  insert into public.gift_recipients(owner_id, name, phone, relationship, last_used_at)
  values (auth.uid(), v_name, v_phone, v_relationship, now())
  on conflict (owner_id, phone)
  do update set
    name = excluded.name,
    relationship = excluded.relationship,
    last_used_at = now(),
    updated_at = now()
  returning id into v_id;

  return v_id;
end;
$$;

revoke all on function public.save_or_touch_gift_recipient(text,text,text) from public, anon;
grant execute on function public.save_or_touch_gift_recipient(text,text,text) to authenticated;