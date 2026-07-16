create or replace function public.link_gift_order_delivery_address(
  p_order_id uuid,
  p_saved_address_id uuid
)
returns jsonb
language plpgsql
security definer
set search_path = public, pass, auth
as $$
declare
  v_user_id uuid := auth.uid();
  v_saved_recipient_id uuid;
  v_existing_recipient_id uuid;
  v_address_snapshot jsonb;
begin
  if v_user_id is null then
    raise exception 'authentication_required';
  end if;

  select ogd.saved_recipient_id
  into v_saved_recipient_id
  from public.order_gift_details ogd
  join public.orders o on o.id = ogd.order_id
  where ogd.order_id = p_order_id
    and ogd.purchaser_id = v_user_id
    and o.client_id = v_user_id
    and o.is_gift = true
  for update of ogd;

  if not found then
    raise exception 'gift_order_not_found';
  end if;

  select da.gift_recipient_id,
         jsonb_strip_nulls(jsonb_build_object(
           'saved_address_id', da.id,
           'label', da.label,
           'receiver_label', da.receiver_label,
           'address', da.address,
           'latitude', da.latitude,
           'longitude', da.longitude,
           'address_type', da.address_type,
           'details', da.details,
           'delivery_option', da.delivery_option,
           'courier_instructions', da.courier_instructions
         ))
  into v_existing_recipient_id, v_address_snapshot
  from pass.delivery_addresses da
  where da.id = p_saved_address_id
    and da.user_id = v_user_id
  for update;

  if not found then
    raise exception 'gift_delivery_address_not_found';
  end if;

  if v_saved_recipient_id is not null
     and v_existing_recipient_id is not null
     and v_existing_recipient_id <> v_saved_recipient_id then
    raise exception 'gift_delivery_address_belongs_to_another_recipient';
  end if;

  if v_saved_recipient_id is not null and v_existing_recipient_id is null then
    update pass.delivery_addresses
    set gift_recipient_id = v_saved_recipient_id,
        last_used_at = now(),
        updated_at = now()
    where id = p_saved_address_id
      and user_id = v_user_id;
  else
    update pass.delivery_addresses
    set last_used_at = now(),
        updated_at = now()
    where id = p_saved_address_id
      and user_id = v_user_id;
  end if;

  update public.order_gift_details
  set saved_address_id = p_saved_address_id,
      updated_at = now()
  where order_id = p_order_id
    and purchaser_id = v_user_id;

  update public.orders
  set guest_info = jsonb_set(
        coalesce(guest_info, '{}'::jsonb),
        '{gift,delivery_address}',
        v_address_snapshot,
        true
      ),
      updated_at = now()
  where id = p_order_id
    and client_id = v_user_id;

  return jsonb_build_object(
    'order_id', p_order_id,
    'saved_address_id', p_saved_address_id,
    'saved_recipient_id', v_saved_recipient_id,
    'address_linked', true
  );
end;
$$;

revoke all on function public.link_gift_order_delivery_address(uuid, uuid) from public;
revoke all on function public.link_gift_order_delivery_address(uuid, uuid) from anon;
grant execute on function public.link_gift_order_delivery_address(uuid, uuid) to authenticated;
