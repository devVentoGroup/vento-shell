create or replace function public.checkout_get_payment_webhook_event(
  p_provider text,
  p_provider_event_id text
)
returns jsonb
language sql
security definer
set search_path = public, payments
as $$
  select to_jsonb(event_row)
  from (
    select id, processed
    from payments.webhook_events
    where provider = p_provider
      and provider_event_id = p_provider_event_id
  ) as event_row;
$$;

revoke all on function public.checkout_get_payment_webhook_event(text, text) from public;
revoke all on function public.checkout_get_payment_webhook_event(text, text) from anon;
revoke all on function public.checkout_get_payment_webhook_event(text, text) from authenticated;
grant execute on function public.checkout_get_payment_webhook_event(text, text) to service_role;

create or replace function public.checkout_find_payment_transaction_by_reference(
  p_provider text,
  p_reference text
)
returns jsonb
language sql
security definer
set search_path = public, payments
as $$
  select to_jsonb(transaction_row)
  from (
    select id
    from payments.transactions
    where provider = p_provider
      and idempotency_key = p_reference
  ) as transaction_row;
$$;

revoke all on function public.checkout_find_payment_transaction_by_reference(text, text) from public;
revoke all on function public.checkout_find_payment_transaction_by_reference(text, text) from anon;
revoke all on function public.checkout_find_payment_transaction_by_reference(text, text) from authenticated;
grant execute on function public.checkout_find_payment_transaction_by_reference(text, text) to service_role;

create or replace function public.checkout_record_payment_webhook_event(
  p_provider text,
  p_provider_event_id text,
  p_transaction_id uuid,
  p_signature_valid boolean,
  p_processed boolean,
  p_payload jsonb
)
returns jsonb
language plpgsql
security definer
set search_path = public, payments
as $$
declare
  v_result jsonb;
begin
  insert into payments.webhook_events (
    provider,
    provider_event_id,
    transaction_id,
    signature_valid,
    processed,
    processed_at,
    payload
  )
  values (
    p_provider,
    p_provider_event_id,
    p_transaction_id,
    coalesce(p_signature_valid, false),
    coalesce(p_processed, false),
    case when coalesce(p_processed, false) then now() else null end,
    coalesce(p_payload, '{}'::jsonb)
  )
  on conflict (provider, provider_event_id)
  do update set
    transaction_id = coalesce(excluded.transaction_id, payments.webhook_events.transaction_id),
    signature_valid = excluded.signature_valid,
    processed = excluded.processed,
    processed_at = case
      when excluded.processed then coalesce(payments.webhook_events.processed_at, now())
      else payments.webhook_events.processed_at
    end,
    payload = excluded.payload
  returning jsonb_build_object(
    'id', id,
    'processed', processed,
    'transaction_id', transaction_id
  )
  into v_result;

  return v_result;
end;
$$;

revoke all on function public.checkout_record_payment_webhook_event(text, text, uuid, boolean, boolean, jsonb) from public;
revoke all on function public.checkout_record_payment_webhook_event(text, text, uuid, boolean, boolean, jsonb) from anon;
revoke all on function public.checkout_record_payment_webhook_event(text, text, uuid, boolean, boolean, jsonb) from authenticated;
grant execute on function public.checkout_record_payment_webhook_event(text, text, uuid, boolean, boolean, jsonb) to service_role;

create or replace function public.mark_payment_transaction_status(
  p_transaction_id uuid,
  p_provider_reference text,
  p_status text,
  p_payload jsonb default '{}'::jsonb
)
returns jsonb
language plpgsql
security definer
set search_path to public, payments
as $$
declare
  v_tx payments.transactions%rowtype;
  v_status text := lower(trim(coalesce(p_status, '')));
  v_order_status text;
  v_payment_status text;
begin
  if p_transaction_id is null then
    raise exception 'transaction_required';
  end if;

  if v_status not in ('approved', 'rejected', 'cancelled', 'error', 'refunded') then
    raise exception 'invalid_payment_status';
  end if;

  select *
  into v_tx
  from payments.transactions
  where id = p_transaction_id
  for update;

  if v_tx.id is null then
    raise exception 'transaction_not_found';
  end if;

  if v_status = 'approved' then
    v_order_status := 'confirmed';
    v_payment_status := 'paid';
  elsif v_status = 'refunded' then
    v_order_status := 'cancelled';
    v_payment_status := 'refunded';
  else
    v_order_status := 'cancelled';
    v_payment_status := 'failed';
  end if;

  update payments.transactions
  set
    status = v_status,
    provider_reference = coalesce(nullif(trim(coalesce(p_provider_reference, '')), ''), provider_reference),
    raw_response = coalesce(p_payload, '{}'::jsonb),
    approved_at = case when v_status = 'approved' then coalesce(approved_at, now()) else approved_at end,
    rejected_at = case when v_status in ('rejected', 'cancelled', 'error') then coalesce(rejected_at, now()) else rejected_at end,
    updated_at = now()
  where id = v_tx.id;

  update public.orders
  set
    payment_status = v_payment_status,
    status = case
      when status = 'delivered' then status
      when status = 'cancelled' then status
      else v_order_status
    end,
    cancelled_at = case
      when v_order_status = 'cancelled' and status not in ('delivered', 'cancelled')
        then coalesce(cancelled_at, now())
      else cancelled_at
    end,
    confirmed_at = case
      when v_order_status = 'confirmed'
        then coalesce(confirmed_at, now())
      else confirmed_at
    end,
    payment_reference = coalesce(nullif(trim(coalesce(p_provider_reference, '')), ''), payment_reference),
    payment_provider = coalesce(payment_provider, v_tx.provider),
    updated_at = now()
  where id = v_tx.order_id;

  return jsonb_build_object(
    'ok', true,
    'transaction_id', v_tx.id,
    'order_id', v_tx.order_id,
    'status', v_status,
    'order_status', v_order_status,
    'payment_status', v_payment_status
  );
end;
$$;

revoke all on function public.mark_payment_transaction_status(uuid, text, text, jsonb) from public;
revoke all on function public.mark_payment_transaction_status(uuid, text, text, jsonb) from anon;
revoke all on function public.mark_payment_transaction_status(uuid, text, text, jsonb) from authenticated;
grant execute on function public.mark_payment_transaction_status(uuid, text, text, jsonb) to service_role;

create or replace function public.reconcile_expired_payment_checkouts()
returns jsonb
language plpgsql
security definer
set search_path = public, payments
as $$
declare
  v_transaction_count integer := 0;
  v_order_count integer := 0;
begin
  with expired as (
    select
      tx.id as transaction_id,
      tx.order_id
    from payments.transactions tx
    join public.orders o
      on o.id = tx.order_id
    where tx.provider = 'wompi'
      and tx.status in ('pending', 'requires_action')
      and o.source = 'vento_pass'
      and o.fulfillment_type = 'delivery'
      and o.payment_status = 'pending_payment'
      and o.status = 'pending'
      and o.checkout_expires_at is not null
      and o.checkout_expires_at < now()
    for update of tx, o
  ),
  updated_transactions as (
    update payments.transactions tx
    set
      status = 'cancelled',
      raw_response = coalesce(tx.raw_response, '{}'::jsonb) || jsonb_build_object(
        'reason', 'checkout_expired_without_payment',
        'source', 'auto_reconciliation',
        'provider_charge_created', false,
        'reconciled_at', now()
      ),
      rejected_at = coalesce(tx.rejected_at, now()),
      updated_at = now()
    from expired e
    where tx.id = e.transaction_id
    returning tx.id
  ),
  updated_orders as (
    update public.orders o
    set
      status = 'cancelled',
      payment_status = 'failed',
      cancelled_at = coalesce(o.cancelled_at, now()),
      updated_at = now()
    from expired e
    where o.id = e.order_id
      and o.status = 'pending'
      and o.payment_status = 'pending_payment'
    returning o.id
  )
  select
    (select count(*) from updated_transactions),
    (select count(*) from updated_orders)
  into v_transaction_count, v_order_count;

  return jsonb_build_object(
    'ok', true,
    'cancelled_transactions', v_transaction_count,
    'cancelled_orders', v_order_count,
    'ran_at', now()
  );
end;
$$;

revoke all on function public.reconcile_expired_payment_checkouts() from public;
revoke all on function public.reconcile_expired_payment_checkouts() from anon;
revoke all on function public.reconcile_expired_payment_checkouts() from authenticated;
grant execute on function public.reconcile_expired_payment_checkouts() to service_role;

do $do$
begin
  if exists (select 1 from pg_extension where extname = 'pg_cron')
     and exists (
       select 1
       from information_schema.tables
       where table_schema = 'cron'
         and table_name = 'job'
     ) then
    begin
      perform cron.unschedule('pass_payment_checkout_expiry_reconciliation');
    exception
      when others then
        null;
    end;

    perform cron.schedule(
      'pass_payment_checkout_expiry_reconciliation',
      '*/5 * * * *',
      $cron$select public.reconcile_expired_payment_checkouts();$cron$
    );
  else
    raise notice 'Skipping payment checkout reconciliation cron because pg_cron is unavailable.';
  end if;
exception
  when insufficient_privilege then
    raise notice 'Skipping payment checkout reconciliation cron due to insufficient privilege.';
end;
$do$;
