-- Funciones y triggers efectivos del dominio de políticas de solicitud.
-- Corrige el contrato: input_qty e input_unit_code conservan la cantidad y unidad solicitadas.

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
    select id, product_id, qty_in_input_unit, qty_in_stock_unit, is_active
      into v_physical_profile
    from public.product_uom_profiles
    where id = new.physical_uom_profile_id;

    if v_physical_profile.id is null
       or v_physical_profile.product_id <> new.product_id
       or v_physical_profile.is_active is false then
      raise exception 'La presentación física no existe, está inactiva o pertenece a otro producto.';
    end if;
    if v_physical_profile.qty_in_input_unit <= 0 or v_physical_profile.qty_in_stock_unit <= 0 then
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

create or replace function public.prevent_used_request_policy_semantic_update()
returns trigger
language plpgsql
set search_path to 'public', 'auth', 'storage', 'extensions'
as $function$
begin
  if exists (
    select 1 from public.restock_request_items item
    where item.request_policy_id = old.id limit 1
  ) and (
    new.product_id is distinct from old.product_id
    or new.request_unit_code is distinct from old.request_unit_code
    or new.base_unit_code is distinct from old.base_unit_code
    or new.base_qty_per_request_unit is distinct from old.base_qty_per_request_unit
    or new.constraint_mode is distinct from old.constraint_mode
    or new.minimum_request_qty is distinct from old.minimum_request_qty
    or new.request_step_qty is distinct from old.request_step_qty
    or new.allow_fraction is distinct from old.allow_fraction
    or new.policy_kind is distinct from old.policy_kind
    or new.physical_uom_profile_id is distinct from old.physical_uom_profile_id
  ) then
    raise exception using
      errcode = '23514',
      message = 'REQUEST_POLICY_VERSION_REQUIRED',
      detail = 'La política ya fue utilizada. Desactívala y crea una nueva versión para cambiar su significado.';
  end if;
  return new;
end;
$function$;

create or replace function public.assign_request_policy_to_restock_item()
returns trigger
language plpgsql
set search_path to 'public', 'auth', 'storage', 'extensions'
as $function$
declare
  v_policy_id uuid;
begin
  if new.request_policy_id is not null then return new; end if;

  if new.input_uom_profile_id is not null then
    select prp.id into v_policy_id
    from public.product_request_policies prp
    where prp.product_id = new.product_id
      and prp.is_active
      and prp.policy_kind = 'physical_presentation'
      and prp.physical_uom_profile_id = new.input_uom_profile_id
    order by prp.created_at desc
    limit 1;
  end if;

  if v_policy_id is null then
    select prp.id into v_policy_id
    from public.product_request_policies prp
    where prp.product_id = new.product_id
      and prp.is_active
      and prp.is_default
    order by prp.created_at asc
    limit 1;
  end if;

  if v_policy_id is null then return new; end if;
  new.request_policy_id := v_policy_id;
  new.requested_policy_qty := coalesce(nullif(new.input_qty, 0), nullif(new.quantity, 0));
  return new;
end;
$function$;

create or replace function public.apply_request_policy_to_restock_item()
returns trigger
language plpgsql
set search_path to 'public', 'auth', 'storage', 'extensions'
as $function$
declare
  v_policy public.product_request_policies%rowtype;
  v_ratio numeric;
begin
  if new.request_policy_id is null then return new; end if;
  if tg_op = 'UPDATE'
     and new.request_policy_id is not distinct from old.request_policy_id
     and new.requested_policy_qty is not distinct from old.requested_policy_qty then
    return new;
  end if;

  select * into v_policy
  from public.product_request_policies
  where id = new.request_policy_id;

  if v_policy.id is null or not v_policy.is_active or v_policy.product_id <> new.product_id then
    raise exception 'La política de solicitud no existe, está inactiva o pertenece a otro producto.';
  end if;
  if new.requested_policy_qty is null or new.requested_policy_qty <= 0 then
    raise exception 'La cantidad solicitada por política debe ser mayor a cero.';
  end if;
  if not v_policy.allow_fraction and new.requested_policy_qty <> trunc(new.requested_policy_qty) then
    raise exception 'Esta política no permite cantidades fraccionarias.';
  end if;
  if v_policy.minimum_request_qty is not null and new.requested_policy_qty < v_policy.minimum_request_qty then
    raise exception 'La cantidad solicitada es menor al mínimo permitido (%).', v_policy.minimum_request_qty;
  end if;
  if v_policy.constraint_mode = 'strict_multiple' then
    v_ratio := new.requested_policy_qty / v_policy.request_step_qty;
    if abs(v_ratio - round(v_ratio)) > 0.000001 then
      raise exception 'La cantidad solicitada debe ser múltiplo de %.', v_policy.request_step_qty;
    end if;
  end if;

  new.request_policy_kind := v_policy.policy_kind;
  new.request_policy_label := v_policy.label;
  new.request_unit_code := v_policy.request_unit_code;
  new.base_qty_per_request_unit := v_policy.base_qty_per_request_unit;
  new.request_constraint_mode := v_policy.constraint_mode;
  new.request_minimum_qty := v_policy.minimum_request_qty;
  new.request_step_qty := v_policy.request_step_qty;
  new.request_allow_fraction := v_policy.allow_fraction;
  new.input_qty := new.requested_policy_qty;
  new.input_unit_code := v_policy.request_unit_code;
  new.input_uom_profile_id := case
    when v_policy.policy_kind = 'physical_presentation' then v_policy.physical_uom_profile_id
    else null
  end;
  new.conversion_factor_to_stock := v_policy.base_qty_per_request_unit;
  new.stock_unit_code := v_policy.base_unit_code;
  new.unit := v_policy.base_unit_code;
  new.quantity := round(new.requested_policy_qty * v_policy.base_qty_per_request_unit, 6);
  new.production_package_plan := '[]'::jsonb;
  new.requires_package_dispatch := false;
  return new;
end;
$function$;

drop trigger if exists trg_validate_product_request_policy on public.product_request_policies;
create trigger trg_validate_product_request_policy
before insert or update on public.product_request_policies
for each row execute function public.validate_product_request_policy();

drop trigger if exists trg_prevent_used_request_policy_semantic_update on public.product_request_policies;
create trigger trg_prevent_used_request_policy_semantic_update
before update on public.product_request_policies
for each row execute function public.prevent_used_request_policy_semantic_update();

drop trigger if exists trg_00_assign_request_policy_to_restock_item on public.restock_request_items;
create trigger trg_00_assign_request_policy_to_restock_item
before insert on public.restock_request_items
for each row execute function public.assign_request_policy_to_restock_item();

drop trigger if exists trg_apply_request_policy_to_restock_item on public.restock_request_items;
create trigger trg_apply_request_policy_to_restock_item
before insert or update of request_policy_id, requested_policy_qty on public.restock_request_items
for each row execute function public.apply_request_policy_to_restock_item();