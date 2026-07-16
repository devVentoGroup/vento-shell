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
    raise exception 'El producto de la política no existe o no tiene unidad base.';
  end if;

  if new.base_unit_code <> v_stock_unit_code then
    raise exception 'La unidad base de la política (%) no coincide con la unidad base del producto (%).', new.base_unit_code, v_stock_unit_code;
  end if;

  if new.policy_kind = 'physical_presentation' then
    select id, product_id, input_unit_code, qty_in_input_unit, qty_in_stock_unit, is_active
      into v_physical_profile
    from public.product_uom_profiles
    where id = new.physical_uom_profile_id;

    if v_physical_profile.id is null
       or v_physical_profile.product_id <> new.product_id
       or v_physical_profile.is_active is false then
      raise exception 'La presentación física no existe, está inactiva o pertenece a otro producto.';
    end if;

    if v_physical_profile.qty_in_input_unit is null
       or v_physical_profile.qty_in_input_unit <= 0
       or v_physical_profile.qty_in_stock_unit is null
       or v_physical_profile.qty_in_stock_unit <= 0 then
      raise exception 'La presentación física tiene una equivalencia inválida.';
    end if;

    if round((v_physical_profile.qty_in_stock_unit / v_physical_profile.qty_in_input_unit)::numeric, 6)
       <> round(new.base_qty_per_request_unit, 6) then
      raise exception 'La equivalencia no coincide con la presentación física seleccionada.';
    end if;
  end if;

  if new.policy_kind = 'actual_quantity' then
    select family into v_request_family
    from public.inventory_units
    where code = new.request_unit_code and is_active = true;

    select family into v_base_family
    from public.inventory_units
    where code = new.base_unit_code and is_active = true;

    if v_request_family is null or v_base_family is null or v_request_family <> v_base_family then
      raise exception 'La política de cantidad real debe usar unidades activas de la misma familia.';
    end if;
  end if;

  return new;
end;
$function$;