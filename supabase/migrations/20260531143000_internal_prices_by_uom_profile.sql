begin;

-- Paso 13.1: precios internos por presentación física/UOM profile.
-- Mantiene compatibilidad legacy con unit_code, pero permite que el precio interno
-- quede amarrado a la misma presentación usada por remisiones.

alter table public.internal_price_list_items
  add column if not exists uom_profile_id uuid,
  add column if not exists pricing_label text,
  add column if not exists pricing_input_unit_code text,
  add column if not exists pricing_qty_in_input_unit numeric,
  add column if not exists pricing_qty_in_stock_unit numeric;

comment on column public.internal_price_list_items.uom_profile_id is
  'Presentación física / UOM profile sobre la que se define el precio interno. Null conserva compatibilidad legacy por unit_code.';

comment on column public.internal_price_list_items.pricing_label is
  'Snapshot del nombre de la presentación al momento de configurar el precio interno. Ej: Pote 2 L, Bolsa 2.500 g, unidad producida.';

comment on column public.internal_price_list_items.pricing_input_unit_code is
  'Snapshot de la unidad de entrada de la presentación. Ej: un, g, ml.';

comment on column public.internal_price_list_items.pricing_qty_in_input_unit is
  'Snapshot de qty_in_input_unit del perfil UOM usado para el precio interno.';

comment on column public.internal_price_list_items.pricing_qty_in_stock_unit is
  'Snapshot de qty_in_stock_unit del perfil UOM usado para el precio interno.';

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'internal_price_list_items_uom_profile_id_fkey'
      and conrelid = 'public.internal_price_list_items'::regclass
  ) then
    alter table public.internal_price_list_items
      add constraint internal_price_list_items_uom_profile_id_fkey
      foreign key (uom_profile_id)
      references public.product_uom_profiles(id)
      on delete set null;
  end if;

  if not exists (
    select 1
    from pg_constraint
    where conname = 'internal_price_list_items_pricing_qty_input_positive'
      and conrelid = 'public.internal_price_list_items'::regclass
  ) then
    alter table public.internal_price_list_items
      add constraint internal_price_list_items_pricing_qty_input_positive
      check (pricing_qty_in_input_unit is null or pricing_qty_in_input_unit > 0);
  end if;

  if not exists (
    select 1
    from pg_constraint
    where conname = 'internal_price_list_items_pricing_qty_stock_positive'
      and conrelid = 'public.internal_price_list_items'::regclass
  ) then
    alter table public.internal_price_list_items
      add constraint internal_price_list_items_pricing_qty_stock_positive
      check (pricing_qty_in_stock_unit is null or pricing_qty_in_stock_unit > 0);
  end if;

  if not exists (
    select 1
    from pg_constraint
    where conname = 'internal_price_list_items_profile_snapshot_required'
      and conrelid = 'public.internal_price_list_items'::regclass
  ) then
    alter table public.internal_price_list_items
      add constraint internal_price_list_items_profile_snapshot_required
      check (
        uom_profile_id is null
        or (
          pricing_label is not null
          and btrim(pricing_label) <> ''
          and pricing_input_unit_code is not null
          and btrim(pricing_input_unit_code) <> ''
          and pricing_qty_in_input_unit is not null
          and pricing_qty_in_stock_unit is not null
        )
      );
  end if;
end;
$$;

create index if not exists internal_price_list_items_uom_profile_idx
  on public.internal_price_list_items(uom_profile_id)
  where uom_profile_id is not null;

-- La unicidad anterior solo usaba unit_code. Eso bloquea casos como:
-- Pote 1 L y Pote 2 L, ambos con unit_code = 'un'.
drop index if exists public.internal_price_list_items_active_uniq;

create unique index if not exists internal_price_list_items_active_profile_uniq
  on public.internal_price_list_items(price_list_id, product_id, uom_profile_id)
  where is_active = true and uom_profile_id is not null;

create unique index if not exists internal_price_list_items_active_legacy_unit_uniq
  on public.internal_price_list_items(price_list_id, product_id, lower(btrim(unit_code)))
  where is_active = true and uom_profile_id is null;

create or replace function public.set_internal_price_item_uom_snapshot()
returns trigger
language plpgsql
security definer
set search_path = public, pg_temp
as $$
declare
  v_profile record;
  v_should_refresh_snapshot boolean := false;
begin
  if new.uom_profile_id is null then
    return new;
  end if;

  select
    profile.id,
    profile.product_id,
    profile.label,
    profile.input_unit_code,
    profile.qty_in_input_unit,
    profile.qty_in_stock_unit,
    profile.is_active
    into v_profile
  from public.product_uom_profiles profile
  where profile.id = new.uom_profile_id;

  if not found then
    raise exception 'uom profile not found';
  end if;

  if v_profile.product_id <> new.product_id then
    raise exception 'uom profile does not belong to internal price product';
  end if;

  if coalesce(v_profile.is_active, false) <> true then
    raise exception 'uom profile is inactive';
  end if;

  if coalesce(v_profile.qty_in_input_unit, 0) <= 0
     or coalesce(v_profile.qty_in_stock_unit, 0) <= 0 then
    raise exception 'uom profile conversion must be positive';
  end if;

  v_should_refresh_snapshot :=
    tg_op = 'INSERT'
    or new.uom_profile_id is distinct from old.uom_profile_id;

  if v_should_refresh_snapshot then
    new.pricing_label := v_profile.label;
    new.pricing_input_unit_code := v_profile.input_unit_code;
    new.pricing_qty_in_input_unit := v_profile.qty_in_input_unit;
    new.pricing_qty_in_stock_unit := v_profile.qty_in_stock_unit;
    new.unit_code := v_profile.input_unit_code;
  else
    new.pricing_label := coalesce(nullif(btrim(new.pricing_label), ''), v_profile.label);
    new.pricing_input_unit_code := coalesce(
      nullif(btrim(new.pricing_input_unit_code), ''),
      v_profile.input_unit_code
    );
    new.pricing_qty_in_input_unit := coalesce(
      new.pricing_qty_in_input_unit,
      v_profile.qty_in_input_unit
    );
    new.pricing_qty_in_stock_unit := coalesce(
      new.pricing_qty_in_stock_unit,
      v_profile.qty_in_stock_unit
    );
    new.unit_code := coalesce(nullif(btrim(new.unit_code), ''), v_profile.input_unit_code);
  end if;

  return new;
end;
$$;

drop trigger if exists trg_internal_price_list_items_uom_snapshot
  on public.internal_price_list_items;

create trigger trg_internal_price_list_items_uom_snapshot
  before insert or update of product_id, unit_code, uom_profile_id, pricing_label, pricing_input_unit_code, pricing_qty_in_input_unit, pricing_qty_in_stock_unit
  on public.internal_price_list_items
  for each row
  execute function public.set_internal_price_item_uom_snapshot();

create or replace function public.resolve_internal_transfer_price_for_profile(
  p_product_id uuid,
  p_seller_cost_center_id uuid,
  p_buyer_cost_center_id uuid,
  p_buyer_site_id uuid,
  p_uom_profile_id uuid default null,
  p_unit_code text default null,
  p_at timestamptz default now()
) returns table(
  price_list_id uuid,
  price_list_item_id uuid,
  unit_price numeric,
  unit_code text,
  currency text,
  priority integer,
  uom_profile_id uuid,
  pricing_label text,
  pricing_input_unit_code text,
  pricing_qty_in_input_unit numeric,
  pricing_qty_in_stock_unit numeric,
  pricing_factor_to_stock numeric
)
language sql
stable
security definer
set search_path = public
as $$
  select
    pl.id as price_list_id,
    pli.id as price_list_item_id,
    pli.unit_price,
    pli.unit_code,
    'COP'::text as currency,
    case
      when pl.buyer_cost_center_id = p_buyer_cost_center_id then 1
      when pl.buyer_site_id = p_buyer_site_id then 2
      when pl.buyer_cost_center_id is null and pl.buyer_site_id is null then 3
      else 9
    end as priority,
    pli.uom_profile_id,
    pli.pricing_label,
    pli.pricing_input_unit_code,
    pli.pricing_qty_in_input_unit,
    pli.pricing_qty_in_stock_unit,
    case
      when coalesce(pli.pricing_qty_in_input_unit, 0) > 0
        then pli.pricing_qty_in_stock_unit / pli.pricing_qty_in_input_unit
      else 1
    end as pricing_factor_to_stock
  from public.internal_price_list_items pli
  join public.internal_price_lists pl
    on pl.id = pli.price_list_id
  where pli.product_id = p_product_id
    and pli.is_active = true
    and pl.is_active = true
    and pl.seller_cost_center_id = p_seller_cost_center_id
    and p_at >= pl.valid_from
    and (pl.valid_to is null or p_at < pl.valid_to)
    and (
      pl.buyer_cost_center_id = p_buyer_cost_center_id
      or pl.buyer_site_id = p_buyer_site_id
      or (pl.buyer_cost_center_id is null and pl.buyer_site_id is null)
    )
    and (
      (
        p_uom_profile_id is not null
        and pli.uom_profile_id = p_uom_profile_id
      )
      or (
        pli.uom_profile_id is null
        and (
          p_unit_code is null
          or btrim(p_unit_code) = ''
          or lower(btrim(pli.unit_code)) = lower(btrim(p_unit_code))
        )
      )
      or (
        p_uom_profile_id is null
        and pli.uom_profile_id is not null
        and (
          p_unit_code is null
          or btrim(p_unit_code) = ''
          or lower(btrim(pli.unit_code)) = lower(btrim(p_unit_code))
        )
      )
    )
  order by
    case
      when p_uom_profile_id is not null and pli.uom_profile_id = p_uom_profile_id then 0
      when pli.uom_profile_id is null then 1
      else 2
    end,
    case
      when pl.buyer_cost_center_id = p_buyer_cost_center_id then 1
      when pl.buyer_site_id = p_buyer_site_id then 2
      when pl.buyer_cost_center_id is null and pl.buyer_site_id is null then 3
      else 9
    end,
    pl.valid_from desc,
    pli.created_at desc
  limit 1;
$$;

comment on function public.resolve_internal_transfer_price_for_profile(
  uuid,
  uuid,
  uuid,
  uuid,
  uuid,
  text,
  timestamptz
) is
  'Returns the best active internal price for product/seller/buyer/date, preferring an exact UOM profile/presentation match and falling back to legacy unit_code.';

-- Mantiene la firma legacy usada por funciones actuales.
create or replace function public.resolve_internal_transfer_price(
  p_product_id uuid,
  p_seller_cost_center_id uuid,
  p_buyer_cost_center_id uuid,
  p_buyer_site_id uuid,
  p_unit_code text default null,
  p_at timestamptz default now()
) returns table(
  price_list_id uuid,
  price_list_item_id uuid,
  unit_price numeric,
  unit_code text,
  currency text,
  priority integer
)
language sql
stable
security definer
set search_path = public
as $$
  select
    resolved.price_list_id,
    resolved.price_list_item_id,
    resolved.unit_price,
    resolved.unit_code,
    resolved.currency,
    resolved.priority
  from public.resolve_internal_transfer_price_for_profile(
    p_product_id,
    p_seller_cost_center_id,
    p_buyer_cost_center_id,
    p_buyer_site_id,
    null,
    p_unit_code,
    p_at
  ) resolved
  limit 1;
$$;

grant execute on function public.set_internal_price_item_uom_snapshot() to authenticated;
grant execute on function public.resolve_internal_transfer_price_for_profile(uuid, uuid, uuid, uuid, uuid, text, timestamptz) to authenticated;
grant execute on function public.resolve_internal_transfer_price(uuid, uuid, uuid, uuid, text, timestamptz) to authenticated;

commit;
