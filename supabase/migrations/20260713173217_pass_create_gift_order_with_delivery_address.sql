create or replace function public.create_gift_aware_scheduled_order_checkout_draft(
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
  p_billing_data jsonb,
  p_schedule_mode text,
  p_delivery_window_start timestamptz,
  p_delivery_window_end timestamptz,
  p_timezone text default 'America/Bogota',
  p_gift_data jsonb default null
)
returns jsonb
language plpgsql
security definer
set search_path = public, pass, auth
as $$
declare
  v_result jsonb;
  v_order_id uuid;
  v_saved_address_id uuid;
begin
  if auth.uid() is null then
    raise exception 'authentication_required';
  end if;

  v_result := public.create_scheduled_order_checkout_draft(
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
    p_delivery_quote_id,
    p_invoice_requested,
    p_billing_data,
    p_schedule_mode,
    p_delivery_window_start,
    p_delivery_window_end,
    p_timezone,
    p_gift_data
  );

  v_order_id := nullif(v_result ->> 'order_id', '')::uuid;
  v_saved_address_id := nullif(p_gift_data ->> 'saved_address_id', '')::uuid;

  if coalesce((p_gift_data ->> 'is_gift')::boolean, false)
     and v_saved_address_id is not null then
    perform public.link_gift_order_delivery_address(v_order_id, v_saved_address_id);
  end if;

  return v_result || jsonb_build_object('saved_address_id', v_saved_address_id);
end;
$$;

revoke all on function public.create_gift_aware_scheduled_order_checkout_draft(
  uuid, text, text, text, text, text, text, text, jsonb, numeric, text,
  integer, uuid, boolean, jsonb, text, timestamptz, timestamptz, text, jsonb
) from public, anon;

grant execute on function public.create_gift_aware_scheduled_order_checkout_draft(
  uuid, text, text, text, text, text, text, text, jsonb, numeric, text,
  integer, uuid, boolean, jsonb, text, timestamptz, timestamptz, text, jsonb
) to authenticated;
