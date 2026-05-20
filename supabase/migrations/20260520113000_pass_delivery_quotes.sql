begin;

create table if not exists pass.delivery_quotes (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  site_id uuid not null references public.sites(id) on update cascade on delete cascade,
  rate_id uuid references pass.delivery_distance_rates(id) on update cascade on delete set null,
  destination_label text,
  destination_address text,
  destination_latitude double precision not null,
  destination_longitude double precision not null,
  distance_meters integer not null check (distance_meters >= 0),
  distance_km numeric not null check (distance_km >= 0),
  billed_distance_km integer not null check (billed_distance_km > 0),
  duration_seconds integer check (duration_seconds is null or duration_seconds >= 0),
  customer_fee_amount numeric not null check (customer_fee_amount >= 0),
  raw_provider text not null default 'google',
  raw_response jsonb not null default '{}'::jsonb,
  expires_at timestamptz not null default now() + interval '15 minutes',
  used_at timestamptz,
  created_at timestamptz not null default now(),
  constraint pass_delivery_quotes_raw_response_object check (jsonb_typeof(raw_response) = 'object')
);

comment on table pass.delivery_quotes is
  'Cotizaciones temporales de domicilio calculadas en backend. El checkout debe usar una cotizacion vigente para evitar tarifas manipuladas desde el cliente.';

create index if not exists pass_delivery_quotes_user_site_created_idx
  on pass.delivery_quotes (user_id, site_id, created_at desc);

create index if not exists pass_delivery_quotes_valid_idx
  on pass.delivery_quotes (id, user_id, site_id, expires_at)
  where used_at is null;

alter table pass.delivery_quotes enable row level security;

grant select on table pass.delivery_quotes to authenticated;
grant select, insert, update, delete on table pass.delivery_quotes to service_role;

drop policy if exists pass_delivery_quotes_select_self on pass.delivery_quotes;
create policy pass_delivery_quotes_select_self
on pass.delivery_quotes
for select
to authenticated
using (auth.uid() = user_id);

drop policy if exists pass_delivery_quotes_select_admin on pass.delivery_quotes;
create policy pass_delivery_quotes_select_admin
on pass.delivery_quotes
for select
to authenticated
using (public.is_owner() or public.is_global_manager());

drop function if exists public.create_order_checkout_draft(
  uuid,
  text,
  text,
  text,
  text,
  text,
  text,
  text,
  jsonb,
  numeric,
  text,
  integer
);

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
  p_delivery_fee_amount numeric default 0,
  p_source text default 'vento_pass',
  p_delivery_distance_km integer default null,
  p_delivery_quote_id uuid default null
)
returns jsonb
language plpgsql
security definer
set search_path = public, auth, pass
as $$
declare
  v_uid uuid := auth.uid();
  v_order_id uuid;
  v_tx_id uuid;
  v_item jsonb;
  v_product_id uuid;
  v_quantity numeric;
  v_unit_price numeric;
  v_subtotal numeric := 0;
  v_delivery numeric := 0;
  v_fulfillment text := lower(trim(coalesce(p_fulfillment_type, 'delivery')));
  v_order_type text := 'takeaway';
  v_delivery_address jsonb := '{}'::jsonb;
  v_delivery_zone text := null;
  v_quote pass.delivery_quotes%rowtype;
  v_idempotency_key text := gen_random_uuid()::text;
begin
  if v_uid is null then
    raise exception 'authentication_required';
  end if;

  if p_site_id is null then
    raise exception 'site_required';
  end if;

  if jsonb_typeof(p_items) <> 'array' or jsonb_array_length(p_items) = 0 then
    raise exception 'items_required';
  end if;

  if v_fulfillment not in ('delivery', 'pickup', 'on_premise') then
    raise exception 'invalid_fulfillment_type';
  end if;

  if v_fulfillment = 'on_premise' then
    v_order_type := 'dine_in';
  end if;

  if v_fulfillment = 'delivery' then
    if p_delivery_quote_id is null then
      raise exception 'delivery_quote_required';
    end if;

    select *
    into v_quote
    from pass.delivery_quotes
    where id = p_delivery_quote_id
      and user_id = v_uid
      and site_id = p_site_id
      and used_at is null
      and expires_at > now()
    for update;

    if v_quote.id is null then
      raise exception 'delivery_quote_invalid_or_expired';
    end if;

    v_delivery := v_quote.customer_fee_amount;
    v_delivery_zone := v_quote.billed_distance_km::text || ' km';
    v_delivery_address := jsonb_build_object(
      'line1', nullif(trim(coalesce(p_address_line, v_quote.destination_address, '')), ''),
      'reference', nullif(trim(coalesce(p_address_reference, '')), ''),
      'label', nullif(trim(coalesce(v_quote.destination_label, '')), ''),
      'latitude', v_quote.destination_latitude,
      'longitude', v_quote.destination_longitude,
      'distance_meters', v_quote.distance_meters,
      'distance_km', v_quote.distance_km,
      'billed_distance_km', v_quote.billed_distance_km,
      'duration_seconds', v_quote.duration_seconds,
      'delivery_quote_id', v_quote.id
    );

    if coalesce(v_delivery_address ->> 'line1', '') = '' then
      raise exception 'delivery_address_required';
    end if;
  end if;

  for v_item in select * from jsonb_array_elements(p_items)
  loop
    v_product_id := nullif(v_item ->> 'product_id', '')::uuid;
    v_quantity := greatest(coalesce((v_item ->> 'quantity')::numeric, 0), 0);
    v_unit_price := greatest(coalesce((v_item ->> 'unit_price')::numeric, 0), 0);

    if v_product_id is null then
      raise exception 'item_product_required';
    end if;
    if v_quantity <= 0 then
      raise exception 'invalid_item_quantity';
    end if;
    if v_unit_price < 0 then
      raise exception 'invalid_item_price';
    end if;

    v_subtotal := v_subtotal + (v_quantity * v_unit_price);
  end loop;

  insert into public.orders (
    client_id,
    order_type,
    source,
    status,
    payment_status,
    total_amount,
    subtotal_amount,
    notes,
    site_id,
    guest_info,
    fulfillment_type,
    contact_phone,
    delivery_address,
    delivery_zone,
    delivery_fee_amount,
    payment_provider,
    checkout_expires_at
  )
  values (
    v_uid,
    v_order_type,
    coalesce(nullif(trim(coalesce(p_source, '')), ''), 'vento_pass'),
    'pending',
    'pending_payment',
    v_subtotal + v_delivery,
    v_subtotal,
    nullif(trim(coalesce(p_notes, '')), ''),
    p_site_id,
    jsonb_build_object(
      'contact_name', nullif(trim(coalesce(p_contact_name, '')), ''),
      'contact_phone', nullif(trim(coalesce(p_contact_phone, '')), ''),
      'fulfillment_type', v_fulfillment,
      'satellite_name', nullif(trim(coalesce(p_satellite_name, '')), '')
    ),
    v_fulfillment,
    nullif(trim(coalesce(p_contact_phone, '')), ''),
    v_delivery_address,
    v_delivery_zone,
    v_delivery,
    'wompi',
    now() + interval '20 minutes'
  )
  returning id into v_order_id;

  for v_item in select * from jsonb_array_elements(p_items)
  loop
    insert into public.order_items (
      order_id,
      product_id,
      quantity,
      unit_price,
      total_amount,
      notes
    )
    values (
      v_order_id,
      (v_item ->> 'product_id')::uuid,
      (v_item ->> 'quantity')::numeric,
      (v_item ->> 'unit_price')::numeric,
      ((v_item ->> 'quantity')::numeric * (v_item ->> 'unit_price')::numeric),
      nullif(trim(coalesce(v_item ->> 'notes', '')), '')
    );
  end loop;

  if v_quote.id is not null then
    update pass.delivery_quotes
    set used_at = now()
    where id = v_quote.id;
  end if;

  insert into payments.transactions (
    order_id,
    user_id,
    site_id,
    provider,
    idempotency_key,
    amount_minor,
    currency,
    status,
    metadata
  )
  values (
    v_order_id,
    v_uid,
    p_site_id,
    'wompi',
    v_idempotency_key,
    round((v_subtotal + v_delivery) * 100)::bigint,
    'COP',
    'pending',
    jsonb_build_object(
      'source', 'create_order_checkout_draft',
      'delivery_quote_id', p_delivery_quote_id,
      'delivery_distance_km', coalesce(v_quote.billed_distance_km, p_delivery_distance_km)
    )
  )
  returning id into v_tx_id;

  update public.orders
  set payment_intent_id = v_tx_id
  where id = v_order_id;

  return jsonb_build_object(
    'ok', true,
    'order_id', v_order_id,
    'transaction_id', v_tx_id,
    'idempotency_key', v_idempotency_key,
    'amount_minor', round((v_subtotal + v_delivery) * 100)::bigint,
    'currency', 'COP',
    'checkout_expires_at', now() + interval '20 minutes'
  );
end;
$$;

grant execute on function public.create_order_checkout_draft(uuid, text, text, text, text, text, text, text, jsonb, numeric, text, integer, uuid) to authenticated, service_role;

comment on function public.create_order_checkout_draft(uuid, text, text, text, text, text, text, text, jsonb, numeric, text, integer, uuid) is
  'Crea borrador de orden + lineas + intent de pago pendiente. Para domicilio exige cotizacion backend vigente.';

notify pgrst, 'reload schema';

commit;
