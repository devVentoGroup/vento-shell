create or replace function public.create_order_checkout_draft(
  p_site_id uuid,
  p_satellite_name text,
  p_fulfillment_type text,
  p_contact_name text,
  p_contact_phone text,
  p_address_line text,
  p_address_reference text,
  p_notes text,
  p_items jsonb,
  p_delivery_fee_amount numeric,
  p_source text,
  p_delivery_distance_km integer,
  p_delivery_quote_id uuid,
  p_invoice_requested boolean,
  p_billing_data jsonb
)
returns jsonb
language plpgsql
security definer
set search_path = public, auth, pass
as $$
declare
  v_uid uuid := auth.uid();
  v_result jsonb;
  v_order_id uuid;
  v_billing_request_id uuid;
  v_legal_name text;
  v_document_type text;
  v_document_number text;
  v_verification_digit text;
  v_billing_email text;
  v_order_site_id uuid;
  v_order_payment_status text;
  v_order_fulfillment_type text;
  v_initial_status text := 'requested';
begin
  if v_uid is null then
    raise exception 'authentication_required';
  end if;

  if coalesce(p_invoice_requested, false) then
    if p_billing_data is null or jsonb_typeof(p_billing_data) <> 'object' then
      raise exception 'billing_data_required';
    end if;

    v_legal_name := nullif(trim(coalesce(p_billing_data ->> 'legal_name', '')), '');
    v_document_type := upper(nullif(trim(coalesce(p_billing_data ->> 'document_type', '')), ''));
    v_document_number := nullif(trim(coalesce(p_billing_data ->> 'document_number', '')), '');
    v_verification_digit := nullif(trim(coalesce(p_billing_data ->> 'verification_digit', '')), '');
    v_billing_email := lower(nullif(trim(coalesce(p_billing_data ->> 'billing_email', '')), ''));

    if v_legal_name is null then raise exception 'billing_legal_name_required'; end if;
    if v_document_type is null then raise exception 'billing_document_type_required'; end if;
    if v_document_number is null then raise exception 'billing_document_number_required'; end if;
    if v_billing_email is null then raise exception 'billing_email_required'; end if;

    if v_billing_email !~* '^[^[:space:]@]+@[^[:space:]@]+\.[^[:space:]@]+$' then
      raise exception 'billing_email_invalid';
    end if;

    if v_verification_digit is not null and length(v_verification_digit) > 2 then
      raise exception 'billing_verification_digit_invalid';
    end if;
  end if;

  v_result := public.create_order_checkout_draft(
    p_site_id,
    p_satellite_name,
    p_fulfillment_type,
    p_contact_name,
    p_contact_phone,
    p_address_line,
    p_address_reference,
    p_notes,
    p_items,
    p_delivery_fee_amount,
    p_source,
    p_delivery_distance_km,
    p_delivery_quote_id
  );

  v_order_id := nullif(v_result ->> 'order_id', '')::uuid;
  if v_order_id is null then raise exception 'order_creation_failed'; end if;

  if not coalesce(p_invoice_requested, false) then
    return v_result || jsonb_build_object(
      'invoice_requested', false,
      'billing_request_id', null,
      'billing_status', null
    );
  end if;

  select site_id, payment_status, fulfillment_type
  into v_order_site_id, v_order_payment_status, v_order_fulfillment_type
  from public.orders
  where id = v_order_id and client_id = v_uid;

  if v_order_site_id is null then raise exception 'billing_order_not_found'; end if;

  if v_order_payment_status = 'paid'
     or (v_order_fulfillment_type in ('pickup', 'on_premise') and (v_result ->> 'payment_status') = 'paid') then
    v_initial_status := 'ready_to_issue';
  end if;

  insert into public.client_billing_profiles (
    user_id, legal_name, document_type, document_number, verification_digit, billing_email
  ) values (
    v_uid, v_legal_name, v_document_type, v_document_number, v_verification_digit, v_billing_email
  )
  on conflict (user_id) do update
  set legal_name = excluded.legal_name,
      document_type = excluded.document_type,
      document_number = excluded.document_number,
      verification_digit = excluded.verification_digit,
      billing_email = excluded.billing_email,
      updated_at = now();

  insert into public.order_billing_requests (
    order_id, client_id, site_id, legal_name, document_type, document_number,
    verification_digit, billing_email, status, metadata
  ) values (
    v_order_id, v_uid, v_order_site_id, v_legal_name, v_document_type, v_document_number,
    v_verification_digit, v_billing_email, v_initial_status,
    jsonb_build_object(
      'source', coalesce(nullif(trim(coalesce(p_source, '')), ''), 'vento_pass'),
      'captured_at', now(),
      'fulfillment_type', v_order_fulfillment_type,
      'payment_status_at_capture', v_order_payment_status
    )
  ) returning id into v_billing_request_id;

  update public.orders
  set guest_info = coalesce(guest_info, '{}'::jsonb) || jsonb_build_object(
    'invoice_requested', true,
    'billing_request_id', v_billing_request_id,
    'billing', jsonb_build_object(
      'legal_name', v_legal_name,
      'document_type', v_document_type,
      'document_number', v_document_number,
      'verification_digit', v_verification_digit,
      'billing_email', v_billing_email,
      'status', v_initial_status
    )
  )
  where id = v_order_id;

  return v_result || jsonb_build_object(
    'invoice_requested', true,
    'billing_request_id', v_billing_request_id,
    'billing_status', v_initial_status
  );
end;
$$;