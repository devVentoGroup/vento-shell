begin;

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
  v_order_item_id uuid;
  v_tx_id uuid;
  v_item jsonb;
  v_option jsonb;
  v_validated_items jsonb := '[]'::jsonb;
  v_selected_options jsonb := '[]'::jsonb;
  v_product_id uuid;
  v_catalog_item_id uuid;
  v_option_id uuid;
  v_quantity numeric;
  v_original_unit_price numeric;
  v_unit_price numeric;
  v_catalog_base_price numeric;
  v_option_delta numeric;
  v_subtotal numeric := 0;
  v_delivery numeric := 0;
  v_total numeric := 0;
  v_fulfillment text := lower(trim(coalesce(p_fulfillment_type, 'delivery')));
  v_order_type text := 'takeaway';
  v_delivery_address jsonb := '{}'::jsonb;
  v_delivery_zone text := null;
  v_quote pass.delivery_quotes%rowtype;
  v_idempotency_key text := gen_random_uuid()::text;
  v_payment_status text := 'pending_payment';
  v_payment_provider text := null;
  v_checkout_expires_at timestamptz := null;
  v_option_row record;
  v_group_rule record;
  v_selected_count integer;
  v_min_select integer;
  v_max_select integer;
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
    v_payment_status := 'pending_payment';
    v_payment_provider := 'wompi';
    v_checkout_expires_at := now() + interval '20 minutes';

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
  else
    v_payment_status := 'not_required';
    v_payment_provider := null;
    v_checkout_expires_at := null;
    v_delivery := 0;
    v_delivery_zone := null;
    v_delivery_address := '{}'::jsonb;
  end if;

  for v_item in select * from jsonb_array_elements(p_items)
  loop
    v_product_id := nullif(v_item ->> 'product_id', '')::uuid;
    v_catalog_item_id := nullif(v_item ->> 'catalog_item_id', '')::uuid;
    v_quantity := greatest(coalesce((v_item ->> 'quantity')::numeric, 0), 0);
    v_original_unit_price := greatest(coalesce((v_item ->> 'unit_price')::numeric, 0), 0);
    v_unit_price := v_original_unit_price;
    v_catalog_base_price := null;
    v_option_delta := 0;

    if v_item ? 'selected_options' then
      if jsonb_typeof(v_item -> 'selected_options') <> 'array' then
        raise exception 'invalid_selected_options';
      end if;

      v_selected_options := coalesce(v_item -> 'selected_options', '[]'::jsonb);
    else
      v_selected_options := '[]'::jsonb;
    end if;

    if v_product_id is null then
      raise exception 'item_product_required';
    end if;

    if v_quantity <= 0 then
      raise exception 'invalid_item_quantity';
    end if;

    if v_original_unit_price < 0 then
      raise exception 'invalid_item_price';
    end if;

    if v_catalog_item_id is null and jsonb_array_length(v_selected_options) > 0 then
      raise exception 'catalog_item_required_for_selected_options';
    end if;

    if v_catalog_item_id is not null then
      select item.price_amount
      into v_catalog_base_price
      from pass.catalog_items item
      where item.id = v_catalog_item_id
        and item.site_id = p_site_id
        and item.product_id = v_product_id
        and item.is_active = true;

      if not found then
        raise exception 'catalog_item_invalid';
      end if;

      for v_option in select * from jsonb_array_elements(v_selected_options)
      loop
        v_option_id := nullif(v_option ->> 'option_id', '')::uuid;

        if v_option_id is null then
          raise exception 'selected_option_required';
        end if;

        select
          opt_group.id as group_id,
          opt_group.code as group_code,
          opt_group.name as group_name,
          opt_group.selection_type,
          opt.id as option_id,
          opt.code as option_code,
          opt.name as option_name,
          opt.price_delta_amount,
          opt.effect_type
        into v_option_row
        from pass.catalog_item_options opt
        join pass.catalog_item_option_groups opt_group
          on opt_group.id = opt.option_group_id
        where opt.id = v_option_id
          and opt.is_active = true
          and opt_group.is_active = true
          and opt_group.catalog_item_id = v_catalog_item_id;

        if not found then
          raise exception 'selected_option_invalid';
        end if;

        v_option_delta := v_option_delta + greatest(coalesce(v_option_row.price_delta_amount, 0), 0);
      end loop;

      for v_group_rule in
        select id, name, selection_type, is_required, min_select, max_select
        from pass.catalog_item_option_groups
        where catalog_item_id = v_catalog_item_id
          and is_active = true
      loop
        v_min_select := greatest(
          case when coalesce(v_group_rule.is_required, false) then 1 else 0 end,
          coalesce(v_group_rule.min_select, 0)
        );

        v_max_select := case
          when v_group_rule.selection_type = 'single' then 1
          else greatest(1, coalesce(v_group_rule.max_select, 1), v_min_select)
        end;

        select count(distinct opt.id)
        into v_selected_count
        from jsonb_array_elements(v_selected_options) selected
        join pass.catalog_item_options opt
          on opt.id::text = selected.value ->> 'option_id'
        where opt.option_group_id = v_group_rule.id
          and opt.is_active = true;

        if coalesce(v_selected_count, 0) < v_min_select then
          raise exception 'option_group_min_select_required';
        end if;

        if coalesce(v_selected_count, 0) > v_max_select then
          raise exception 'option_group_max_select_exceeded';
        end if;
      end loop;

      v_unit_price := greatest(coalesce(v_catalog_base_price, 0), 0) + greatest(coalesce(v_option_delta, 0), 0);

      if abs(v_original_unit_price - v_unit_price) > 0.01 then
        raise exception 'invalid_item_price';
      end if;
    end if;

    v_subtotal := v_subtotal + (v_quantity * v_unit_price);

    v_validated_items := v_validated_items || jsonb_build_array(
      jsonb_build_object(
        'product_id', v_product_id,
        'catalog_item_id', v_catalog_item_id,
        'quantity', v_quantity,
        'unit_price', v_unit_price,
        'base_unit_price', coalesce(v_catalog_base_price, v_unit_price),
        'option_total_amount', greatest(coalesce(v_option_delta, 0), 0),
        'notes', nullif(trim(coalesce(v_item ->> 'notes', '')), ''),
        'line_key', nullif(trim(coalesce(v_item ->> 'line_key', '')), ''),
        'selected_options', v_selected_options
      )
    );
  end loop;

  v_total := v_subtotal + v_delivery;

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
    v_payment_status,
    v_total,
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
    v_payment_provider,
    v_checkout_expires_at
  )
  returning id into v_order_id;

  for v_item in select * from jsonb_array_elements(v_validated_items)
  loop
    v_selected_options := coalesce(v_item -> 'selected_options', '[]'::jsonb);
    v_quantity := (v_item ->> 'quantity')::numeric;
    v_unit_price := (v_item ->> 'unit_price')::numeric;
    v_catalog_item_id := nullif(v_item ->> 'catalog_item_id', '')::uuid;

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
      v_quantity,
      v_unit_price,
      (v_quantity * v_unit_price),
      nullif(trim(coalesce(v_item ->> 'notes', '')), '')
    )
    returning id into v_order_item_id;

    if v_catalog_item_id is not null and jsonb_array_length(v_selected_options) > 0 then
      for v_option in select * from jsonb_array_elements(v_selected_options)
      loop
        v_option_id := nullif(v_option ->> 'option_id', '')::uuid;

        select
          opt_group.id as group_id,
          opt_group.code as group_code,
          opt_group.name as group_name,
          opt_group.selection_type,
          opt.id as option_id,
          opt.code as option_code,
          opt.name as option_name,
          opt.price_delta_amount,
          opt.effect_type
        into v_option_row
        from pass.catalog_item_options opt
        join pass.catalog_item_option_groups opt_group
          on opt_group.id = opt.option_group_id
        where opt.id = v_option_id
          and opt.is_active = true
          and opt_group.is_active = true
          and opt_group.catalog_item_id = v_catalog_item_id;

        if not found then
          raise exception 'selected_option_invalid';
        end if;

        insert into public.order_item_options (
          order_item_id,
          option_group_id,
          option_id,
          group_code,
          group_name,
          option_code,
          option_name,
          quantity,
          price_delta_amount,
          total_delta_amount,
          metadata
        )
        values (
          v_order_item_id,
          v_option_row.group_id,
          v_option_row.option_id,
          v_option_row.group_code,
          v_option_row.group_name,
          v_option_row.option_code,
          v_option_row.option_name,
          v_quantity,
          greatest(coalesce(v_option_row.price_delta_amount, 0), 0),
          v_quantity * greatest(coalesce(v_option_row.price_delta_amount, 0), 0),
          jsonb_build_object(
            'line_key', v_item ->> 'line_key',
            'catalog_item_id', v_catalog_item_id,
            'base_unit_price', (v_item ->> 'base_unit_price')::numeric,
            'option_total_amount', (v_item ->> 'option_total_amount')::numeric,
            'effect_type', v_option_row.effect_type,
            'client_snapshot', v_option,
            'consumption_rules', coalesce(
              (
                select jsonb_agg(to_jsonb(rule) order by rule.sort_order, rule.name)
                from pass.catalog_item_option_consumption_rules rule
                where rule.option_id = v_option_row.option_id
                  and rule.is_active = true
              ),
              '[]'::jsonb
            ),
            'recipe_effects', coalesce(
              (
                select jsonb_agg(to_jsonb(effect) order by effect.sort_order, effect.id)
                from pass.catalog_item_option_recipe_effects effect
                where effect.option_id = v_option_row.option_id
                  and effect.is_active = true
              ),
              '[]'::jsonb
            )
          )
        );
      end loop;
    end if;
  end loop;

  if v_quote.id is not null then
    update pass.delivery_quotes
    set used_at = now()
    where id = v_quote.id;
  end if;

  if v_fulfillment = 'delivery' then
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
      round(v_total * 100)::bigint,
      'COP',
      'pending',
      jsonb_build_object(
        'source', 'create_order_checkout_draft',
        'delivery_quote_id', p_delivery_quote_id,
        'delivery_distance_km', coalesce(v_quote.billed_distance_km, p_delivery_distance_km),
        'fulfillment_type', v_fulfillment
      )
    )
    returning id into v_tx_id;

    update public.orders
    set payment_intent_id = v_tx_id
    where id = v_order_id;
  end if;

  return jsonb_build_object(
    'ok', true,
    'order_id', v_order_id,
    'transaction_id', v_tx_id,
    'idempotency_key', case when v_fulfillment = 'delivery' then v_idempotency_key else null end,
    'amount_minor', round(v_total * 100)::bigint,
    'currency', 'COP',
    'payment_status', v_payment_status,
    'payment_provider', v_payment_provider,
    'checkout_expires_at', v_checkout_expires_at
  );
end;
$$;

grant execute on function public.create_order_checkout_draft(
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
  integer,
  uuid
) to authenticated, service_role;

comment on function public.create_order_checkout_draft(
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
  integer,
  uuid
) is
  'Crea orden desde Vento Pass. Valida precio de catalog item y opciones configurables; guarda snapshots en order_item_options. Domicilio crea intento Wompi pendiente; recoger y en sitio quedan con pago no requerido.';

notify pgrst, 'reload schema';

commit;
