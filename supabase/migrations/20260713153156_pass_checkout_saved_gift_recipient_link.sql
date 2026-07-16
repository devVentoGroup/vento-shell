create or replace function public.create_scheduled_order_checkout_draft(
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
set search_path to 'public', 'pass', 'auth'
as $$
declare
  v_result jsonb;
  v_order_id uuid;
  v_schedule jsonb;
  v_mode text := lower(trim(coalesce(p_schedule_mode, 'immediate')));
  v_schedule_items jsonb := '[]'::jsonb;
  v_is_gift boolean := coalesce((p_gift_data ->> 'is_gift')::boolean, false);
  v_recipient_name text;
  v_recipient_phone text;
  v_recipient_relationship text;
  v_is_surprise boolean;
  v_contact_policy text;
  v_fallback_contact_policy text;
  v_card_requested boolean;
  v_card_message text;
  v_card_to text;
  v_card_from text;
  v_hide_prices boolean;
  v_gift_snapshot jsonb;
  v_saved_recipient_id uuid;
  v_requested_saved_recipient_id uuid;
  v_save_recipient boolean := false;
begin
  if auth.uid() is null then
    raise exception 'authentication_required';
  end if;

  v_schedule := pass.validate_order_schedule(
    p_site_id,
    p_items,
    p_fulfillment_type,
    v_mode,
    p_delivery_window_start,
    p_delivery_window_end,
    p_timezone
  );

  if v_is_gift then
    v_recipient_name := nullif(trim(p_gift_data ->> 'recipient_name'), '');
    v_recipient_phone := nullif(trim(p_gift_data ->> 'recipient_phone'), '');
    v_recipient_relationship := nullif(trim(p_gift_data ->> 'recipient_relationship'), '');
    v_is_surprise := coalesce((p_gift_data ->> 'is_surprise')::boolean, false);
    v_contact_policy := coalesce(nullif(trim(p_gift_data ->> 'contact_policy'), ''), 'buyer_first');
    v_fallback_contact_policy := coalesce(nullif(trim(p_gift_data ->> 'fallback_contact_policy'), ''), 'recipient_allowed');
    v_card_requested := coalesce((p_gift_data ->> 'card_requested')::boolean, false);
    v_card_message := nullif(trim(p_gift_data ->> 'card_message'), '');
    v_card_to := nullif(trim(p_gift_data ->> 'card_to'), '');
    v_card_from := nullif(trim(p_gift_data ->> 'card_from'), '');
    v_hide_prices := coalesce((p_gift_data ->> 'hide_prices')::boolean, true);
    v_save_recipient := coalesce((p_gift_data ->> 'save_recipient')::boolean, false);
    v_requested_saved_recipient_id := nullif(p_gift_data ->> 'saved_recipient_id', '')::uuid;

    if v_recipient_name is null then raise exception 'gift_recipient_name_required'; end if;
    if v_recipient_phone is null then raise exception 'gift_recipient_phone_required'; end if;
    if v_contact_policy not in ('buyer_first', 'recipient_allowed') then raise exception 'invalid_gift_contact_policy'; end if;
    if v_fallback_contact_policy not in ('recipient_allowed', 'buyer_only') then raise exception 'invalid_gift_fallback_contact_policy'; end if;
    if v_card_requested and v_card_message is null then raise exception 'gift_card_message_required'; end if;
    if char_length(coalesce(v_card_message, '')) > 300
      or char_length(coalesce(v_card_to, '')) > 80
      or char_length(coalesce(v_card_from, '')) > 80 then
      raise exception 'gift_card_text_too_long';
    end if;

    if v_requested_saved_recipient_id is not null then
      select gr.id
      into v_saved_recipient_id
      from public.gift_recipients gr
      where gr.id = v_requested_saved_recipient_id
        and gr.owner_id = auth.uid();

      if v_saved_recipient_id is null then
        raise exception 'saved_gift_recipient_not_found';
      end if;

      update public.gift_recipients
      set name = v_recipient_name,
          phone = v_recipient_phone,
          relationship = v_recipient_relationship,
          last_used_at = now(),
          updated_at = now()
      where id = v_saved_recipient_id;
    elsif v_save_recipient then
      v_saved_recipient_id := public.save_or_touch_gift_recipient(
        v_recipient_name,
        v_recipient_phone,
        v_recipient_relationship
      );
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
    p_delivery_quote_id,
    p_invoice_requested,
    p_billing_data
  );

  v_order_id := nullif(v_result ->> 'order_id', '')::uuid;
  if v_order_id is null then raise exception 'order_creation_failed'; end if;

  select coalesce(jsonb_agg(jsonb_build_object(
    'catalog_item_id', nullif(item ->> 'catalog_item_id', ''),
    'product_id', nullif(item ->> 'product_id', ''),
    'quantity', coalesce((item ->> 'quantity')::numeric, 0)
  )), '[]'::jsonb)
  into v_schedule_items
  from jsonb_array_elements(p_items) item;

  if v_is_gift then
    v_gift_snapshot := jsonb_strip_nulls(jsonb_build_object(
      'is_gift', true,
      'saved_recipient_id', v_saved_recipient_id,
      'buyer_name', trim(p_contact_name),
      'buyer_phone', trim(p_contact_phone),
      'recipient_name', v_recipient_name,
      'recipient_phone', v_recipient_phone,
      'recipient_relationship', v_recipient_relationship,
      'is_surprise', v_is_surprise,
      'contact_policy', v_contact_policy,
      'fallback_contact_policy', v_fallback_contact_policy,
      'card_requested', v_card_requested,
      'card_message', case when v_card_requested then v_card_message else null end,
      'card_to', case when v_card_requested then v_card_to else null end,
      'card_from', case when v_card_requested then v_card_from else null end,
      'card_status', case when v_card_requested then 'pending' else 'not_requested' end,
      'hide_prices', v_hide_prices
    ));

    insert into public.order_gift_details (
      order_id, purchaser_id, saved_recipient_id,
      buyer_name, buyer_phone,
      recipient_name, recipient_phone, recipient_relationship,
      is_surprise, contact_policy, fallback_contact_policy,
      card_requested, card_message, card_to, card_from, card_status, hide_prices
    ) values (
      v_order_id, auth.uid(), v_saved_recipient_id,
      trim(p_contact_name), trim(p_contact_phone),
      v_recipient_name, v_recipient_phone, v_recipient_relationship,
      v_is_surprise, v_contact_policy, v_fallback_contact_policy,
      v_card_requested,
      case when v_card_requested then v_card_message else null end,
      case when v_card_requested then v_card_to else null end,
      case when v_card_requested then v_card_from else null end,
      case when v_card_requested then 'pending' else 'not_requested' end,
      v_hide_prices
    );
  end if;

  update public.orders
  set schedule_mode = v_mode,
      requested_for = case when v_mode = 'scheduled' then p_delivery_window_start else null end,
      delivery_window_start = case when v_mode = 'scheduled' then p_delivery_window_start else null end,
      delivery_window_end = case when v_mode = 'scheduled' then p_delivery_window_end else null end,
      timezone = coalesce(nullif(trim(p_timezone), ''), 'America/Bogota'),
      is_gift = v_is_gift,
      guest_info = coalesce(guest_info, '{}'::jsonb)
        || jsonb_build_object('schedule_items', v_schedule_items)
        || case when v_is_gift then jsonb_build_object('gift', v_gift_snapshot) else '{}'::jsonb end
  where id = v_order_id
    and client_id = auth.uid();

  if not found then raise exception 'order_schedule_update_failed'; end if;

  return v_result || jsonb_build_object(
    'schedule_mode', v_mode,
    'requested_for', case when v_mode = 'scheduled' then p_delivery_window_start else null end,
    'delivery_window_start', case when v_mode = 'scheduled' then p_delivery_window_start else null end,
    'delivery_window_end', case when v_mode = 'scheduled' then p_delivery_window_end else null end,
    'timezone', coalesce(nullif(trim(p_timezone), ''), 'America/Bogota'),
    'required_lead_minutes', coalesce((v_schedule ->> 'required_lead_minutes')::integer, 0),
    'is_gift', v_is_gift,
    'saved_recipient_id', v_saved_recipient_id
  );
end;
$$;

revoke all on function public.create_scheduled_order_checkout_draft(uuid,text,text,text,text,text,text,text,jsonb,numeric,text,integer,uuid,boolean,jsonb,text,timestamptz,timestamptz,text,jsonb) from public, anon;
grant execute on function public.create_scheduled_order_checkout_draft(uuid,text,text,text,text,text,text,text,jsonb,numeric,text,integer,uuid,boolean,jsonb,text,timestamptz,timestamptz,text,jsonb) to authenticated;