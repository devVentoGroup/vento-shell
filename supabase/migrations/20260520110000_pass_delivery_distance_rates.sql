begin;

create table if not exists pass.delivery_distance_rates (
  id uuid primary key default gen_random_uuid(),
  site_id uuid not null references public.sites(id) on update cascade on delete cascade,
  distance_km integer not null check (distance_km > 0),
  eta_minutes integer check (eta_minutes is null or eta_minutes > 0),
  customer_fee_amount numeric not null check (customer_fee_amount >= 0),
  courier_cost_amount numeric check (courier_cost_amount is null or courier_cost_amount >= 0),
  label text,
  sort_order integer not null default 0,
  is_active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint pass_delivery_distance_rates_site_distance_unique unique (site_id, distance_km)
);

comment on table pass.delivery_distance_rates is
  'Tarifas comerciales de domicilio por kilometro para Vento Pass. La tarifa cobrada al cliente puede diferir del costo interno del domiciliario.';

comment on column pass.delivery_distance_rates.customer_fee_amount is
  'Valor que paga el cliente y se suma al checkout Wompi.';

comment on column pass.delivery_distance_rates.courier_cost_amount is
  'Costo interno estimado del domiciliario para analisis operativo/margen; no se muestra al cliente por defecto.';

create index if not exists pass_delivery_distance_rates_lookup_idx
  on pass.delivery_distance_rates (site_id, is_active, sort_order, distance_km);

drop trigger if exists pass_delivery_distance_rates_set_updated_at on pass.delivery_distance_rates;
create trigger pass_delivery_distance_rates_set_updated_at
before update on pass.delivery_distance_rates
for each row
execute function public._set_updated_at();

alter table pass.delivery_distance_rates enable row level security;

grant select on table pass.delivery_distance_rates to anon, authenticated;
grant select, insert, update, delete on table pass.delivery_distance_rates to authenticated, service_role;

drop policy if exists pass_delivery_distance_rates_select_active on pass.delivery_distance_rates;
create policy pass_delivery_distance_rates_select_active
on pass.delivery_distance_rates
for select
to anon, authenticated
using (is_active = true);

drop policy if exists pass_delivery_distance_rates_select_admin on pass.delivery_distance_rates;
create policy pass_delivery_distance_rates_select_admin
on pass.delivery_distance_rates
for select
to authenticated
using (public.is_owner() or public.is_global_manager());

drop policy if exists pass_delivery_distance_rates_insert_admin on pass.delivery_distance_rates;
create policy pass_delivery_distance_rates_insert_admin
on pass.delivery_distance_rates
for insert
to authenticated
with check (public.is_owner() or public.is_global_manager());

drop policy if exists pass_delivery_distance_rates_update_admin on pass.delivery_distance_rates;
create policy pass_delivery_distance_rates_update_admin
on pass.delivery_distance_rates
for update
to authenticated
using (public.is_owner() or public.is_global_manager())
with check (public.is_owner() or public.is_global_manager());

drop policy if exists pass_delivery_distance_rates_delete_admin on pass.delivery_distance_rates;
create policy pass_delivery_distance_rates_delete_admin
on pass.delivery_distance_rates
for delete
to authenticated
using (public.is_owner() or public.is_global_manager());

create or replace view public.pass_delivery_distance_rates as
select
  id,
  site_id,
  distance_km,
  eta_minutes,
  customer_fee_amount,
  label,
  sort_order,
  is_active,
  created_at,
  updated_at
from pass.delivery_distance_rates
where is_active = true;

grant select on public.pass_delivery_distance_rates to anon, authenticated;
grant select, insert, update, delete on public.pass_delivery_distance_rates to service_role;

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
  text
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
  p_delivery_distance_km integer default null
)
returns jsonb
language plpgsql
security definer
set search_path = public, auth
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
  v_delivery numeric := greatest(coalesce(p_delivery_fee_amount, 0), 0);
  v_fulfillment text := lower(trim(coalesce(p_fulfillment_type, 'delivery')));
  v_order_type text := 'takeaway';
  v_delivery_address jsonb := '{}'::jsonb;
  v_delivery_zone text := null;
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
    v_delivery_address := jsonb_build_object(
      'line1', nullif(trim(coalesce(p_address_line, '')), ''),
      'reference', nullif(trim(coalesce(p_address_reference, '')), ''),
      'distance_km', p_delivery_distance_km
    );
    if coalesce(v_delivery_address ->> 'line1', '') = '' then
      raise exception 'delivery_address_required';
    end if;
    if p_delivery_distance_km is not null then
      if p_delivery_distance_km <= 0 then
        raise exception 'invalid_delivery_distance';
      end if;
      v_delivery_zone := p_delivery_distance_km::text || ' km';
    end if;
  else
    v_delivery := 0;
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
      'delivery_distance_km', p_delivery_distance_km
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

grant execute on function public.create_order_checkout_draft(uuid, text, text, text, text, text, text, text, jsonb, numeric, text, integer) to authenticated, service_role;

comment on function public.create_order_checkout_draft(uuid, text, text, text, text, text, text, text, jsonb, numeric, text, integer) is
  'Crea borrador de orden + lineas + intent de pago pendiente. Incluye tarifa de domicilio por kilometro cuando aplica.';

notify pgrst, 'reload schema';

commit;
