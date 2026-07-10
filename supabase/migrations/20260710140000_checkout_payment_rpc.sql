create or replace function public.checkout_get_payment_transaction(
  p_transaction_id uuid
)
returns jsonb
language sql
security definer
set search_path = public, payments
as $$
  select to_jsonb(transaction_row)
  from (
    select
      id,
      user_id,
      provider,
      idempotency_key,
      amount_minor,
      currency,
      status,
      order_id
    from payments.transactions
    where id = p_transaction_id
  ) as transaction_row;
$$;

revoke all on function public.checkout_get_payment_transaction(uuid) from public;
revoke all on function public.checkout_get_payment_transaction(uuid) from anon;
revoke all on function public.checkout_get_payment_transaction(uuid) from authenticated;
grant execute on function public.checkout_get_payment_transaction(uuid) to service_role;

create or replace function public.checkout_mark_payment_transaction_requires_action(
  p_transaction_id uuid,
  p_raw_request jsonb
)
returns jsonb
language plpgsql
security definer
set search_path = public, payments
as $$
declare
  v_result jsonb;
begin
  update payments.transactions
  set
    status = 'requires_action',
    raw_request = coalesce(p_raw_request, '{}'::jsonb),
    updated_at = now()
  where id = p_transaction_id
    and status in ('pending', 'requires_action')
  returning jsonb_build_object('id', id)
  into v_result;

  return v_result;
end;
$$;

revoke all on function public.checkout_mark_payment_transaction_requires_action(uuid, jsonb) from public;
revoke all on function public.checkout_mark_payment_transaction_requires_action(uuid, jsonb) from anon;
revoke all on function public.checkout_mark_payment_transaction_requires_action(uuid, jsonb) from authenticated;
grant execute on function public.checkout_mark_payment_transaction_requires_action(uuid, jsonb) to service_role;
