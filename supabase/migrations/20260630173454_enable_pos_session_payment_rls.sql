begin;

alter table pos.pos_sessions enable row level security;
alter table pos.pos_payments enable row level security;
alter table pos.pos_session_orders enable row level security;

drop policy if exists pos_sessions_select_pos_permission on pos.pos_sessions;
create policy pos_sessions_select_pos_permission
on pos.pos_sessions
for select
to authenticated
using (public.has_permission('pulso.pos.main', site_id));

drop policy if exists pos_sessions_write_pos_permission on pos.pos_sessions;
create policy pos_sessions_write_pos_permission
on pos.pos_sessions
for all
to authenticated
using (public.has_permission('pulso.pos.main', site_id))
with check (public.has_permission('pulso.pos.main', site_id));

drop policy if exists pos_payments_select_pos_permission on pos.pos_payments;
create policy pos_payments_select_pos_permission
on pos.pos_payments
for select
to authenticated
using (
  exists (
    select 1
    from pos.pos_sessions session
    where session.id = pos_payments.session_id
      and public.has_permission('pulso.pos.main', session.site_id)
  )
  or exists (
    select 1
    from public.orders orders
    where orders.id = pos_payments.order_id
      and public.has_permission('pulso.pos.main', orders.site_id)
  )
  or exists (
    select 1
    from pos.pos_cash_shifts shift
    where shift.id = pos_payments.shift_id
      and public.has_permission('pulso.pos.main', shift.site_id)
  )
);

drop policy if exists pos_payments_write_pos_permission on pos.pos_payments;
create policy pos_payments_write_pos_permission
on pos.pos_payments
for all
to authenticated
using (
  exists (
    select 1
    from pos.pos_sessions session
    where session.id = pos_payments.session_id
      and public.has_permission('pulso.pos.main', session.site_id)
  )
  or exists (
    select 1
    from public.orders orders
    where orders.id = pos_payments.order_id
      and public.has_permission('pulso.pos.main', orders.site_id)
  )
  or exists (
    select 1
    from pos.pos_cash_shifts shift
    where shift.id = pos_payments.shift_id
      and public.has_permission('pulso.pos.main', shift.site_id)
  )
)
with check (
  exists (
    select 1
    from pos.pos_sessions session
    where session.id = pos_payments.session_id
      and public.has_permission('pulso.pos.main', session.site_id)
  )
  or exists (
    select 1
    from public.orders orders
    where orders.id = pos_payments.order_id
      and public.has_permission('pulso.pos.main', orders.site_id)
  )
  or exists (
    select 1
    from pos.pos_cash_shifts shift
    where shift.id = pos_payments.shift_id
      and public.has_permission('pulso.pos.main', shift.site_id)
  )
);

drop policy if exists pos_session_orders_select_pos_permission on pos.pos_session_orders;
create policy pos_session_orders_select_pos_permission
on pos.pos_session_orders
for select
to authenticated
using (
  exists (
    select 1
    from pos.pos_sessions session
    where session.id = pos_session_orders.session_id
      and public.has_permission('pulso.pos.main', session.site_id)
  )
  or exists (
    select 1
    from public.orders orders
    where orders.id = pos_session_orders.order_id
      and public.has_permission('pulso.pos.main', orders.site_id)
  )
);

drop policy if exists pos_session_orders_write_pos_permission on pos.pos_session_orders;
create policy pos_session_orders_write_pos_permission
on pos.pos_session_orders
for all
to authenticated
using (
  exists (
    select 1
    from pos.pos_sessions session
    where session.id = pos_session_orders.session_id
      and public.has_permission('pulso.pos.main', session.site_id)
  )
  or exists (
    select 1
    from public.orders orders
    where orders.id = pos_session_orders.order_id
      and public.has_permission('pulso.pos.main', orders.site_id)
  )
)
with check (
  exists (
    select 1
    from pos.pos_sessions session
    where session.id = pos_session_orders.session_id
      and public.has_permission('pulso.pos.main', session.site_id)
  )
  or exists (
    select 1
    from public.orders orders
    where orders.id = pos_session_orders.order_id
      and public.has_permission('pulso.pos.main', orders.site_id)
  )
);

commit;
