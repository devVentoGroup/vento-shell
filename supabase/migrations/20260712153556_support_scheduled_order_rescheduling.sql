alter table pass.site_schedule_exception_resolutions
  drop constraint if exists site_schedule_exception_resolutions_decision_check;

alter table pass.site_schedule_exception_resolutions
  add constraint site_schedule_exception_resolutions_decision_check
  check (decision in ('keep', 'rescheduled'));

alter table pass.site_schedule_exception_resolutions
  add column if not exists previous_window_start timestamptz,
  add column if not exists previous_window_end timestamptz,
  add column if not exists new_window_start timestamptz,
  add column if not exists new_window_end timestamptz;

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
  p_timezone text default 'America/Bogota'
)
returns jsonb
language plpgsql
security definer
set search_path = public, pass, auth
as $$
declare
  v_result jsonb;
  v_order_id uuid;
  v_schedule jsonb;
  v_mode text := lower(trim(coalesce(p_schedule_mode, 'immediate')));
  v_schedule_items jsonb := '[]'::jsonb;
begin
  if auth.uid() is null then raise exception 'authentication_required'; end if;

  v_schedule := pass.validate_order_schedule(
    p_site_id,
    p_items,
    p_fulfillment_type,
    v_mode,
    p_delivery_window_start,
    p_delivery_window_end,
    p_timezone
  );

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

  select coalesce(
    jsonb_agg(
      jsonb_build_object(
        'catalog_item_id', nullif(item ->> 'catalog_item_id', ''),
        'product_id', nullif(item ->> 'product_id', ''),
        'quantity', coalesce((item ->> 'quantity')::numeric, 0)
      )
    ),
    '[]'::jsonb
  )
  into v_schedule_items
  from jsonb_array_elements(p_items) item;

  update public.orders
  set schedule_mode = v_mode,
      requested_for = case when v_mode = 'scheduled' then p_delivery_window_start else null end,
      delivery_window_start = case when v_mode = 'scheduled' then p_delivery_window_start else null end,
      delivery_window_end = case when v_mode = 'scheduled' then p_delivery_window_end else null end,
      timezone = coalesce(nullif(trim(p_timezone), ''), 'America/Bogota'),
      guest_info = coalesce(guest_info, '{}'::jsonb) || jsonb_build_object('schedule_items', v_schedule_items)
  where id = v_order_id and client_id = auth.uid();

  if not found then raise exception 'order_schedule_update_failed'; end if;

  return v_result || jsonb_build_object(
    'schedule_mode', v_mode,
    'requested_for', case when v_mode = 'scheduled' then p_delivery_window_start else null end,
    'delivery_window_start', case when v_mode = 'scheduled' then p_delivery_window_start else null end,
    'delivery_window_end', case when v_mode = 'scheduled' then p_delivery_window_end else null end,
    'timezone', coalesce(nullif(trim(p_timezone), ''), 'America/Bogota'),
    'required_lead_minutes', coalesce((v_schedule ->> 'required_lead_minutes')::integer, 0)
  );
end;
$$;