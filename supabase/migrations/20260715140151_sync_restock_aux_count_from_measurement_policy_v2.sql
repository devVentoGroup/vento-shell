create or replace function public.sync_restock_request_item_measurement_counts()
returns trigger
language plpgsql
set search_path = public, auth, storage, extensions
as $$
declare
  v_mode text;
  v_aux_unit text;
begin
  select
    coalesce(measurement_mode, 'fixed_presentation'),
    nullif(btrim(aux_count_unit_code), '')
  into v_mode, v_aux_unit
  from public.product_inventory_profiles
  where product_id = new.product_id;

  if coalesce(v_mode, 'fixed_presentation') = 'count_with_weight' then
    new.aux_count_unit_code := coalesce(v_aux_unit, new.aux_count_unit_code, 'empaques');

    if tg_op = 'INSERT' then
      new.input_aux_count := coalesce(new.input_aux_count, new.requested_policy_qty);
      new.prepared_aux_count := coalesce(new.prepared_aux_count, new.input_aux_count);
      new.shipped_aux_count := coalesce(new.shipped_aux_count, new.prepared_aux_count, new.input_aux_count);
    else
      if new.input_aux_count is null then
        new.input_aux_count := coalesce(old.input_aux_count, new.requested_policy_qty);
      end if;

      if new.prepared_quantity is distinct from old.prepared_quantity
         and coalesce(new.prepared_quantity, 0) > 0
         and new.prepared_aux_count is null then
        new.prepared_aux_count := coalesce(old.prepared_aux_count, new.input_aux_count, new.requested_policy_qty);
      end if;

      if new.shipped_quantity is distinct from old.shipped_quantity
         and coalesce(new.shipped_quantity, 0) > 0
         and new.shipped_aux_count is null then
        new.shipped_aux_count := coalesce(old.shipped_aux_count, new.prepared_aux_count, new.input_aux_count, new.requested_policy_qty);
      end if;

      if new.received_quantity is distinct from old.received_quantity
         and coalesce(new.received_quantity, 0) > 0
         and new.received_aux_count is null then
        new.received_aux_count := coalesce(old.received_aux_count, new.shipped_aux_count, new.prepared_aux_count, new.input_aux_count);
      end if;
    end if;
  end if;

  return new;
end;
$$;

drop trigger if exists trg_sync_restock_request_item_measurement_counts
on public.restock_request_items;

create trigger trg_sync_restock_request_item_measurement_counts
before insert or update of
  product_id,
  requested_policy_qty,
  prepared_quantity,
  shipped_quantity,
  received_quantity,
  input_aux_count,
  prepared_aux_count,
  shipped_aux_count,
  received_aux_count
on public.restock_request_items
for each row
execute function public.sync_restock_request_item_measurement_counts();