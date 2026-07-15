create or replace function public.validate_product_request_policy()
returns trigger
language plpgsql
set search_path to 'public', 'auth', 'storage', 'extensions'
as $function$
declare
  v_stock_unit_code text;
  v_physical_profile record;
  v_request_family text;
  v_base_family text;
begin
  new.label := btrim(new.label);
  new.request_unit_code := lower(btrim(new.request_unit_code));
  new.base_unit_code := lower(btrim(new.base_unit_code));
  new.updated_at := now();

  select lower(coalesce(nullif(stock_unit_code, ''), nullif(unit, '')))
    into v_stock_unit_code
  from public.products
  where id = new.product_id;

  if v_stock_unit_code is null then
    raise exception