create or replace function public.checkout_fail_payment_transaction(
  p_transaction_id uuid,
  p_status text,
  p_reason text,
  p_source text default 'payments-create-intent',
  p_payload jsonb default '{}'::jsonb
)
returns jsonb
language plpgsql
security definer
set search_path = public, payments
as $$
declare
  v_tx payments.transactions%rowtype;
  v_status text := lower(trim(coalesce(p_status, 'error')));
  v_reason text := nullif(trim(coalesce(p_reason, '')), '');
  v_source text := nullif(trim(coalesce(p_source, '')), '');
  v_order_updated boolean := false;
begin
  if p_transaction_id is null then
    raise exception 'transaction_required';
  end if;

  if v_status not in ('error', 'cancelled') then
    raise exception 'invalid_failure_status';
  end if;

  if v_reason is null then
    v_reason := 'checkout_intent_failed_before_provider';
  end if;

  if v_source is null then
    v_source := 'payments-create-intent';
  end if;

  select *
  into v_tx
  from payments.transactions
  where id = p_transaction_id
  for update;

  if v_tx.id is null then
    return jsonb_build_object(
      'ok', false,
      'reason', 'transaction_not_found',
      'transaction_id', p_transaction_id
    );
  end if;

  if v_tx.status not in ('pending', 'requires_action') then
    return jsonb_build_object(
      'ok', false,
      'reason', 'transaction_not_open',
      'transaction_id', v_tx.id,
      'status', v_tx.status
    );
  end if;

  update payments.transactions
  set
    status = v_status,
    raw_response = coalesce(raw_response, '{}'::jsonb) || jsonb_build_object(
      'reason', v_reason,
      'source', v_source,
      'provider_charge_created', false,
      'reconciled_at', now(),
      'context', coalesce(p_payload, '{}'::jsonb)
    ),
    rejected_at = coalesce(rejected_at, now()),
    updated_at = now()
  where id = v_tx.id;

  update public.orders
  set
    status = 'cancelled',
    payment_status = 'failed',
    cancelled_at = coalesce(cancelled_at, now()),
    updated_at = now()
  where id = v_tx.order_id
    and status not in ('delivered', 'cancelled')
    and payment_status = 'pending_payment';

  get diagnostics v_order_updated = row_count;

  return jsonb_build_object(
    'ok', true,
    'transaction_id', v_tx.id,
    'order_id', v_tx.order_id,
    'transaction_status', v_status,
    'order_cancelled', v_order_updated,
    'reason', v_reason
  );
end;
$$;

revoke all on function public.checkout_fail_payment_transaction(uuid, text, text, text, jsonb) from public;
revoke all on function public.checkout_fail_payment_transaction(uuid, text, text, text, jsonb) from anon;
revoke all on function public.checkout_fail_payment_transaction(uuid, text, text, text, jsonb) from authenticated;
grant execute on function public.checkout_fail_payment_transaction(uuid, text, text, text, jsonb) to service_role;
