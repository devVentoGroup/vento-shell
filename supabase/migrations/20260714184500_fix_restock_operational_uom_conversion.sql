update public.product_uom_profiles
set is_default = false, updated_at = now()
where product_id = '6020f9ef-9bc0-4a65-87f6-c4d84f601f4b'
  and usage_context = 'remission'
  and is_default = true;

update public.product_uom_profiles
set label = 'kg', input_unit_code = 'kg', qty_in_input_unit = 1,
    qty_in_stock_unit = 1000, is_default = true, is_active = true,
    source = 'manual', usage_context = 'remission', updated_at = now()
where id = '94f00cf9-b5a4-4124-a70c-a3add679ee1d';

create or replace function public.apply_default_remission_uom_on_insert()
returns trigger
language plpgsql
as $$
declare
  profile_row record;
  stock_code text;
begin
  if new.input_uom_profile_id is not null then
    return new;
  end if;

  select stock_unit_code into stock_code
  from public.products
  where id = new.product_id;

  select id, input_unit_code, qty_in_input_unit, qty_in_stock_unit
  into profile_row
  from public.product_uom_profiles
  where product_id = new.product_id
    and is_active = true
    and is_default = true
    and usage_context = 'remission'
  order by case when source = 'manual' then 0 else 1 end, updated_at desc
  limit 1;

  if profile_row.id is null then
    return new;
  end if;

  if lower(coalesce(new.input_unit_code, stock_code, '')) <> lower(coalesce(stock_code, '')) then
    return new;
  end if;

  new.input_qty := coalesce(new.input_qty, new.quantity);
  new.input_unit_code := profile_row.input_unit_code;
  new.input_uom_profile_id := profile_row.id;
  new.conversion_factor_to_stock := profile_row.qty_in_stock_unit / profile_row.qty_in_input_unit;
  new.stock_unit_code := coalesce(new.stock_unit_code, stock_code);
  new.unit := coalesce(new.unit, stock_code);
  new.quantity := new.input_qty * new.conversion_factor_to_stock;
  return new;
end;
$$;

drop trigger if exists trg_apply_default_remission_uom_on_insert on public.restock_request_items;
create trigger trg_apply_default_remission_uom_on_insert
before insert on public.restock_request_items
for each row
execute function public.apply_default_remission_uom_on_insert();