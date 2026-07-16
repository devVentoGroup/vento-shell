create table if not exists public.gift_recipient_events (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid not null references auth.users(id) on delete cascade,
  recipient_id uuid not null references public.gift_recipients(id) on delete cascade,
  event_type text not null default 'other',
  label text not null,
  event_month smallint not null,
  event_day smallint not null,
  remind_days_before smallint not null default 7,
  is_active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint gift_recipient_events_event_type_check check (event_type in ('birthday','anniversary','other')),
  constraint gift_recipient_events_month_check check (event_month between 1 and 12),
  constraint gift_recipient_events_day_check check (event_day between 1 and 31),
  constraint gift_recipient_events_remind_days_check check (remind_days_before between 0 and 60),
  constraint gift_recipient_events_unique unique (recipient_id, event_type, label, event_month, event_day)
);

create index if not exists gift_recipient_events_owner_idx on public.gift_recipient_events(owner_id, is_active);
create index if not exists gift_recipient_events_recipient_idx on public.gift_recipient_events(recipient_id);

alter table public.gift_recipient_events enable row level security;

drop policy if exists gift_recipient_events_select_own on public.gift_recipient_events;
create policy gift_recipient_events_select_own
on public.gift_recipient_events for select
to authenticated
using ((select auth.uid()) = owner_id);

drop policy if exists gift_recipient_events_insert_own on public.gift_recipient_events;
create policy gift_recipient_events_insert_own
on public.gift_recipient_events for insert
to authenticated
with check (
  (select auth.uid()) = owner_id
  and exists (
    select 1 from public.gift_recipients gr
    where gr.id = recipient_id and gr.owner_id = (select auth.uid())
  )
);

drop policy if exists gift_recipient_events_update_own on public.gift_recipient_events;
create policy gift_recipient_events_update_own
on public.gift_recipient_events for update
to authenticated
using ((select auth.uid()) = owner_id)
with check (
  (select auth.uid()) = owner_id
  and exists (
    select 1 from public.gift_recipients gr
    where gr.id = recipient_id and gr.owner_id = (select auth.uid())
  )
);

drop policy if exists gift_recipient_events_delete_own on public.gift_recipient_events;
create policy gift_recipient_events_delete_own
on public.gift_recipient_events for delete
to authenticated
using ((select auth.uid()) = owner_id);

revoke all on public.gift_recipient_events from anon, public;
grant select, insert, update, delete on public.gift_recipient_events to authenticated;

create or replace function public.get_upcoming_gift_events(p_limit integer default 10)
returns table (
  event_id uuid,
  recipient_id uuid,
  recipient_name text,
  recipient_phone text,
  recipient_relationship text,
  event_type text,
  label text,
  event_month smallint,
  event_day smallint,
  remind_days_before smallint,
  next_date date,
  days_until integer
)
language sql
security definer
set search_path = public, auth
as $$
  with own_events as (
    select
      e.id as event_id,
      e.recipient_id,
      gr.name as recipient_name,
      gr.phone as recipient_phone,
      gr.relationship as recipient_relationship,
      e.event_type,
      e.label,
      e.event_month,
      e.event_day,
      e.remind_days_before,
      make_date(extract(year from current_date)::int, e.event_month, least(e.event_day, extract(day from (date_trunc('month', make_date(extract(year from current_date)::int, e.event_month, 1)) + interval '1 month - 1 day'))::int)) as this_year_date
    from public.gift_recipient_events e
    join public.gift_recipients gr on gr.id = e.recipient_id
    where e.owner_id = auth.uid()
      and gr.owner_id = auth.uid()
      and e.is_active = true
  ), normalized as (
    select *,
      case
        when this_year_date >= current_date then this_year_date
        else make_date(extract(year from current_date)::int + 1, event_month, least(event_day, extract(day from (date_trunc('month', make_date(extract(year from current_date)::int + 1, event_month, 1)) + interval '1 month - 1 day'))::int))
      end as computed_next_date
    from own_events
  )
  select
    event_id,
    recipient_id,
    recipient_name,
    recipient_phone,
    recipient_relationship,
    event_type,
    label,
    event_month,
    event_day,
    remind_days_before,
    computed_next_date as next_date,
    (computed_next_date - current_date)::int as days_until
  from normalized
  order by computed_next_date asc, recipient_name asc
  limit greatest(1, least(coalesce(p_limit, 10), 50));
$$;

revoke all on function public.get_upcoming_gift_events(integer) from public, anon;
grant execute on function public.get_upcoming_gift_events(integer) to authenticated;
