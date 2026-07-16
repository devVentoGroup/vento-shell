create table public.product_request_policies (
  id uuid primary key default gen_random_uuid(),
  product_id uuid not null references public.products(id) on delete cascade,
  label text not null,
  request_unit_code text not null,
  base_unit_code text not null references public.inventory_units(code),
  base_qty_per_request_unit numeric not null,
  constraint_mode text not null default 'free',
  minimum_request_qty numeric null,
  request_step_qty numeric null,
  allow_fraction boolean not null default false,
  is_default boolean not null default false,
  is_active boolean not null default true,
  policy_kind text not null,
  physical_uom_profile_id uuid null references public.product_uom_profiles(id) on delete restrict,
  source text not null default 'manual',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  created_by uuid null references auth.users(id) on delete set null,
  constraint product_request_policies_label_nonempty_chk check (length(btrim(label)) > 0),
  constraint product_request_policies_request_unit_nonempty_chk check (length(btrim(request_unit_code)) > 0),
  constraint product_request_policies_base_qty_positive_chk check (base_qty_per_request_unit > 0),
  constraint product_request_policies_constraint_mode_chk check (constraint_mode in ('free','strict_multiple','preferred_multiple')),
  constraint product_request_policies_policy_kind_chk check (policy_kind in ('base_unit','logical_group','physical_presentation','actual_quantity')),
  constraint product_request_policies_source_chk check (source in ('manual','migration','supplier_primary','recipe_portion','system')),
  constraint product_request_policies_minimum_positive_chk check (minimum_request_qty is null or minimum_request_qty > 0),
  constraint product_request_policies_step_positive_chk check (request_step_qty is null or request_step_qty > 0),
  constraint product_request_policies_strict_step_chk check (constraint_mode <> 'strict_multiple' or request_step_qty is not null),
  constraint product_request_policies_physical_profile_chk check (
    (policy_kind = 'physical_presentation' and physical_uom_profile_id is not null)
    or (policy_kind <> 'physical_presentation' and physical_uom_profile_id is null)
  ),
  constraint product_request_policies_base_kind_chk check (
    policy_kind <> 'base_unit'
    or (
      lower(btrim(request_unit_code)) = lower(btrim(base_unit_code))
      and base_qty_per_request_unit = 1
    )
  )
);

create index product_request_policies_product_idx
  on public.product_request_policies(product_id, is_active);

create index product_request_policies_physical_uom_idx
  on public.product_request_policies(physical_uom_profile_id)
  where physical_uom_profile_id is not null;

create unique index product_request_policies_one_active_default_idx
  on public.product_request_policies(product_id)
  where is_active and is_default;

create unique index product_request_policies_active_label_idx
  on public.product_request_policies(product_id, lower(btrim(label)))
  where is_active;

create or replace function public.validate_product_request_policy()
returns trigger
language plpgsql
set search_path = public, auth, storage, extensions
as $$
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

  select lower(coalesce(stock_unit_code, unit))
    into v_stock_unit_code
  from public.products
  where id = new.product_id;

  if v_stock_unit_code is null then
    raise exception 'El producto de la política no existe.';
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

    if lower(v_physical_profile.input_unit_code) <> new.request_unit_code then
      raise exception 'La unidad solicitada no coincide con la presentación física seleccionada.';
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
$$;

create trigger trg_validate_product_request_policy
before insert or update on public.product_request_policies
for each row execute function public.validate_product_request_policy();

alter table public.restock_request_items
  add column request_policy_id uuid null references public.product_request_policies(id) on delete restrict,
  add column request_policy_kind text null,
  add column request_policy_label text null,
  add column requested_policy_qty numeric null,
  add column request_unit_code text null,
  add column base_qty_per_request_unit numeric null,
  add column request_constraint_mode text null,
  add column request_minimum_qty numeric null,
  add column request_step_qty numeric null,
  add column request_allow_fraction boolean null;

alter table public.restock_request_items
  add constraint restock_request_items_request_policy_kind_chk
    check (request_policy_kind is null or request_policy_kind in ('base_unit','logical_group','physical_presentation','actual_quantity')),
  add constraint restock_request_items_requested_policy_qty_positive_chk
    check (requested_policy_qty is null or requested_policy_qty > 0),
  add constraint restock_request_items_request_factor_positive_chk
    check (base_qty_per_request_unit is null or base_qty_per_request_unit > 0),
  add constraint restock_request_items_request_constraint_mode_chk
    check (request_constraint_mode is null or request_constraint_mode in ('free','strict_multiple','preferred_multiple')),
  add constraint restock_request_items_request_minimum_positive_chk
    check (request_minimum_qty is null or request_minimum_qty > 0),
  add constraint restock_request_items_request_step_positive_chk
    check (request_step_qty is null or request_step_qty > 0);

create index restock_request_items_request_policy_idx
  on public.restock_request_items(request_policy_id)
  where request_policy_id is not null;

create or replace function public.apply_request_policy_to_restock_item()
returns trigger
language plpgsql
set search_path = public, auth, storage, extensions
as $$
declare
  v_policy public.product_request_policies%rowtype;
  v_ratio numeric;
begin
  if new.request_policy_id is null then
    return new;
  end if;

  if tg_op = 'UPDATE'
     and new.request_policy_id is not distinct from old.request_policy_id
     and new.requested_policy_qty is not distinct from old.requested_policy_qty then
    return new;
  end if;

  select * into v_policy
  from public.product_request_policies
  where id = new.request_policy_id;

  if v_policy.id is null
     or v_policy.is_active is false
     or v_policy.product_id <> new.product_id then
    raise exception 'La política de solicitud no existe, está inactiva o pertenece a otro producto.';
  end if;

  if new.requested_policy_qty is null or new.requested_policy_qty <= 0 then
    raise exception 'La cantidad solicitada por política debe ser mayor a cero.';
  end if;

  if not v_policy.allow_fraction and new.requested_policy_qty <> trunc(new.requested_policy_qty) then
    raise exception 'Esta política no permite cantidades fraccionarias.';
  end if;

  if v_policy.minimum_request_qty is not null
     and new.requested_policy_qty < v_policy.minimum_request_qty then
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
  new.input_unit_code := case
    when v_policy.policy_kind in ('base_unit','actual_quantity') then v_policy.request_unit_code
    else v_policy.base_unit_code
  end;
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
$$;

create trigger trg_apply_request_policy_to_restock_item
before insert or update of request_policy_id, requested_policy_qty, product_id
on public.restock_request_items
for each row execute function public.apply_request_policy_to_restock_item();

create or replace function public.apply_default_remission_uom_on_insert()
returns trigger
language plpgsql
set search_path = public, auth, storage, extensions
as $$
declare
  profile_row record;
  stock_code text;
begin
  if new.request_policy_id is not null then
    return new;
  end if;

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

  if lower(profile_row.input_unit_code) = lower(coalesce(stock_code, ''))
     and profile_row.qty_in_input_unit = profile_row.qty_in_stock_unit then
    return new;
  end if;

  new.input_qty := coalesce(new.input_qty, new.quantity);
  new.input_unit_code := profile_row.input_unit_code;
  new.input_uom_profile_id := profile_row.id;
  new.conversion_factor_to_stock := profile_row.qty_in_stock_unit / profile_row.qty_in_input_unit;
  new.stock_unit_code := coalesce(new.stock_unit_code, stock_code);
  new.unit := coalesce(new.unit, stock_code);
  new.quantity := round(new.input_qty * new.conversion_factor_to_stock, 6);

  return new;
end;
$$;

alter table public.product_request_policies enable row level security;

grant select, insert, update on public.product_request_policies to authenticated;
grant select, insert, update, delete on public.product_request_policies to service_role;

create policy product_request_policies_select_staff
on public.product_request_policies
for select
to authenticated
using (
  public.is_employee()
  or public.current_shared_device_can_access_nexo_remission_catalog(product_id)
);

create policy product_request_policies_insert_catalog
on public.product_request_policies
for insert
to authenticated
with check (
  public.has_permission('nexo.catalog.products')
  or public.is_owner()
  or public.is_global_manager()
);

create policy product_request_policies_update_catalog
on public.product_request_policies
for update
to authenticated
using (
  public.has_permission('nexo.catalog.products')
  or public.is_owner()
  or public.is_global_manager()
)
with check (
  public.has_permission('nexo.catalog.products')
  or public.is_owner()
  or public.is_global_manager()
);