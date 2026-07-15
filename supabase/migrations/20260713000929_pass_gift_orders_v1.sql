-- Respaldo canónico de la migración aplicada directamente en Supabase.
-- Proyecto: vento-os-dev (clzdpinthhtknkmefsxx)
-- Versión remota: 20260713000929
-- Nombre remoto: pass_gift_orders_v1

alter table public.orders
  add column if not exists is_gift boolean not null default false;

create table if not exists public.order_gift_details (
  id uuid primary key default gen_random_uuid(),
  order_id uuid not null unique references public.orders(id) on delete cascade,
  purchaser_id uuid not null references auth.users(id) on delete restrict,
  saved_recipient_id uuid,
  saved_address_id uuid,
  buyer_name text not null,
  buyer_phone text not null,
  recipient_name text not null,
  recipient_phone text not null,
  recipient_relationship text,
  is_surprise boolean not null default false,
  contact_policy text not null default 'buyer_first'
    check (contact_policy in ('buyer_first', 'recipient_allowed')),
  fallback_contact_policy text not null default 'recipient_allowed'
    check (fallback_contact_policy in ('recipient_allowed', 'buyer_only')),
  card_requested boolean not null default false,
  card_message text check (card_message is null or char_length(card_message) <= 300),
  card_to text check (card_to is null or char_length(card_to) <= 80),
  card_from text check (card_from is null or char_length(card_from) <= 80),
  card_status text not null default 'not_requested'
    check (card_status in ('not_requested', 'pending', 'prepared', 'included')),
  hide_prices boolean not null default true,
  card_prepared_at timestamptz,
  card_included_at timestamptz,
  price_free_packaging_confirmed_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists order_gift_details_purchaser_id_idx
  on public.order_gift_details (purchaser_id);

alter table public.order_gift_details enable row level security;

revoke all on table public.order_gift_details from anon;
revoke insert, update, delete on table public.order_gift_details from authenticated;
grant select on table public.order_gift_details to authenticated;
grant all on table public.order_gift_details to service_role;

drop policy if exists "Clients can view their own gift details"
  on public.order_gift_details;

create policy "Clients can view their own gift details"
  on public.order_gift_details
  for select
  to authenticated
  using ((select auth.uid()) = purchaser_id);

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
  v_is_surprise boolean;
  v_contact_policy text;
  v_fallback_contact_policy text;
  v_card_requested boolean;
  v_card_message text;
  v_card_to text;
  v_card_from text;
  v_hide_prices boolean;
  v_gift_snapshot jsonb;
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
    v_is_surprise := coalesce((p_gift_data ->> 'is_surprise')::boolean, false);
    v_contact_policy := coalesce(nullif(trim(p_gift_data ->> 'contact_policy'), ''), 'buyer_first');
    v_fallback_contact_policy := coalesce(
      nullif(trim(p_gift_data ->> 'fallback_contact_policy'), ''),
      'recipient_allowed'
    );
    v_card_requested := coalesce((p_gift_data ->> 'card_requested')::boolean, false);
    v_card_message := nullif(trim(p_gift_data ->> 'card_message'), '');
    v_card_to := nullif(trim(p_gift_data ->> 'card_to'), '');
    v_card_from := nullif(trim(p_gift_data ->> 'card_from'), '');
    v_hide_prices := coalesce((p_gift_data ->> 'hide_prices')::boolean, true);

    if v_recipient_name is null then
      raise exception 'gift_recipient_name_required';
    end if;

    if v_recipient_phone is null then
      raise exception 'gift_recipient_phone_required';
    end if;

    if v_contact_policy not in ('buyer_first', 'recipient_allowed') then
      raise exception 'invalid_gift_contact_policy';
    end if;

    if v_fallback_contact_policy not in ('recipient_allowed', 'buyer_only') then
      raise exception 'invalid_gift_fallback_contact_policy';
    end if;

    if v_card_requested and v_card_message is null then
      raise exception 'gift_card_message_required';
    end if;

    if char_length(coalesce(v_card_message, '')) > 300
      or char_length(coalesce(v_card_to, '')) > 80
      or char_length(coalesce(v_card_from, '')) > 80 then
      raise exception 'gift_card_text_too_long';
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
  if v_order_id is null then
    raise exception 'order_creation_failed';
  end if;

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

  if v_is_gift then
    v_gift_snapshot := jsonb_strip_nulls(jsonb_build_object(
      'is_gift', true,
      'buyer_name', trim(p_contact_name),
      'buyer_phone', trim(p_contact_phone),
      'recipient_name', v_recipient_name,
      'recipient_phone', v_recipient_phone,
      'recipient_relationship', nullif(trim(p_gift_data ->> 'recipient_relationship'), ''),
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
      order_id,
      purchaser_id,
      buyer_name,
      buyer_phone,
      recipient_name,
      recipient_phone,
      recipient_relationship,
      is_surprise,
      contact_policy,
      fallback_contact_policy,
      card_requested,
      card_message,
      card_to,
      card_from,
      card_status,
      hide_prices
    )
    values (
      v_order_id,
      auth.uid(),
      trim(p_contact_name),
      trim(p_contact_phone),
      v_recipient_name,
      v_recipient_phone,
      nullif(trim(p_gift_data ->> 'recipient_relationship'), ''),
      v_is_surprise,
      v_contact_policy,
      v_fallback_contact_policy,
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
        || case when v_is_gift
          then jsonb_build_object('gift', v_gift_snapshot)
          else '{}'::jsonb
        end
  where id = v_order_id
    and client_id = auth.uid();

  if not found then
    raise exception 'order_schedule_update_failed';
  end if;

  return v_result || jsonb_build_object(
    'schedule_mode', v_mode,
    'requested_for', case when v_mode = 'scheduled' then p_delivery_window_start else null end,
    'delivery_window_start', case when v_mode = 'scheduled' then p_delivery_window_start else null end,
    'delivery_window_end', case when v_mode = 'scheduled' then p_delivery_window_end else null end,
    'timezone', coalesce(nullif(trim(p_timezone), ''), 'America/Bogota'),
    'required_lead_minutes', coalesce((v_schedule ->> 'required_lead_minutes')::integer, 0),
    'is_gift', v_is_gift
  );
end;
$$;

revoke execute on function public.create_scheduled_order_checkout_draft(
  uuid, text, text, text, text, text, text, text, jsonb, numeric, text,
  integer, uuid, boolean, jsonb, text, timestamptz, timestamptz, text, jsonb
) from public, anon;

grant execute on function public.create_scheduled_order_checkout_draft(
  uuid, text, text, text, text, text, text, text, jsonb, numeric, text,
  integer, uuid, boolean, jsonb, text, timestamptz, timestamptz, text, jsonb
) to authenticated, service_role;
