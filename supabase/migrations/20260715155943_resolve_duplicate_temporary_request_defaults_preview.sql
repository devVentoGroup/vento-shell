update public.product_request_policies
set is_active = false,
    is_default = false,
    change_reason = 'Perfil temporal 1:1 sustituido por la política base canónica.',
    updated_at = now()
where id in (
  '69ac8db1-9ea0-4697-8d44-57dcbe20c422',
  '9ffa6993-041b-4f98-9da1-fa6a0e0960c3'
)
and not exists (
  select 1
  from public.restock_request_items item
  where item.request_policy_id = product_request_policies.id
)
and not exists (
  select 1
  from public.inventory_stock_by_uom_profile stock
  where stock.uom_profile_id = product_request_policies.physical_uom_profile_id
    and (abs(coalesce(stock.presentation_qty, 0)) > 0.000001
      or abs(coalesce(stock.base_qty, 0)) > 0.000001)
);

update public.product_request_policies
set is_default = true,
    updated_at = now()
where id in (
  '6d8d116b-6d2d-4e4b-b399-692cd8aa77ab',
  '7a4a2cd4-ad80-4a8f-bc07-4038cfa31e00'
)
and is_active = true;