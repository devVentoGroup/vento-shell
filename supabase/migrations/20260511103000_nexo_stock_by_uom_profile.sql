begin;

alter table if exists public.product_uom_profiles
  add column if not exists image_url text;

alter table if exists public.product_uom_profiles
  add column if not exists catalog_image_url text;

alter table if exists public.inventory_entry_items
  add column if not exists input_uom_profile_id uuid references public.product_uom_profiles(id) on delete set null;

alter table if exists public.inventory_transfer_items
  add column if not exists input_uom_profile_id uuid references public.product_uom_profiles(id) on delete set null;

alter table if exists public.restock_request_items
  add column if not exists input_uom_profile_id uuid references public.product_uom_profiles(id) on delete set null;

alter table if exists public.inventory_movements
  add column if not exists input_uom_profile_id uuid references public.product_uom_profiles(id) on delete set null;

create table if not exists public.inventory_stock_by_uom_profile (
  id uuid primary key default gen_random_uuid(),
  site_id uuid references public.sites(id) on delete set null,
  location_id uuid not null references public.inventory_locations(id) on delete cascade,
  location_position_id uuid references public.inventory_location_positions(id) on delete set null,
  product_id uuid not null references public.products(id) on delete cascade,
  uom_profile_id uuid not null references public.product_uom_profiles(id) on delete cascade,
  presentation_qty numeric not null default 0,
  base_qty numeric not null default 0,
  updated_at timestamptz not null default now(),
  constraint inventory_stock_by_uom_profile_qty_nonnegative_chk
    check (presentation_qty >= 0 and base_qty >= 0)
);

create index if not exists idx_inventory_stock_by_uom_profile_location
  on public.inventory_stock_by_uom_profile(location_id);

create index if not exists idx_inventory_stock_by_uom_profile_position
  on public.inventory_stock_by_uom_profile(location_position_id);

create index if not exists idx_inventory_stock_by_uom_profile_product
  on public.inventory_stock_by_uom_profile(product_id);

create index if not exists idx_inventory_stock_by_uom_profile_uom_profile
  on public.inventory_stock_by_uom_profile(uom_profile_id);

create unique index if not exists ux_inventory_stock_by_uom_profile_no_position
  on public.inventory_stock_by_uom_profile(location_id, product_id, uom_profile_id)
  where location_position_id is null;

create unique index if not exists ux_inventory_stock_by_uom_profile_with_position
  on public.inventory_stock_by_uom_profile(location_id, location_position_id, product_id, uom_profile_id)
  where location_position_id is not null;

create or replace function public.assert_inventory_uom_profile_stock_input(
  p_location_id uuid,
  p_location_position_id uuid,
  p_product_id uuid,
  p_uom_profile_id uuid,
  p_presentation_qty numeric,
  p_base_qty numeric
) returns table (
  site_id uuid,
  factor_to_stock numeric
)
language plpgsql
security definer
set search_path = public, pg_temp
as $$
declare
  v_location record;
  v_position record;
  v_profile record;
  v_factor numeric;
begin
  if p_location_id is null or p_product_id is null or p_uom_profile_id is null then
    raise exception 'location, product and uom profile are required';
  end if;

  if coalesce(p_presentation_qty, 0) < 0 or coalesce(p_base_qty, 0) < 0 then
    raise exception 'presentation and base quantities cannot be negative';
  end if;

  select loc.id, loc.site_id
    into v_location
  from public.inventory_locations loc
  where loc.id = p_location_id
    and coalesce(loc.is_active, true) = true;

  if not found then
    raise exception 'active LOC not found';
  end if;

  if p_location_position_id is not null then
    select pos.id, pos.location_id, pos.site_id
      into v_position
    from public.inventory_location_positions pos
    where pos.id = p_location_position_id
      and pos.location_id = p_location_id
      and coalesce(pos.is_active, true) = true;

    if not found then
      raise exception 'active internal position not found for LOC';
    end if;
  end if;

  select
    profile.id,
    profile.product_id,
    profile.is_active,
    profile.qty_in_input_unit,
    profile.qty_in_stock_unit
    into v_profile
  from public.product_uom_profiles profile
  where profile.id = p_uom_profile_id;

  if not found or v_profile.product_id <> p_product_id then
    raise exception 'uom profile does not belong to product';
  end if;

  if coalesce(v_profile.is_active, false) <> true then
    raise exception 'uom profile is inactive';
  end if;

  if coalesce(v_profile.qty_in_input_unit, 0) <= 0 or coalesce(v_profile.qty_in_stock_unit, 0) <= 0 then
    raise exception 'uom profile conversion must be positive';
  end if;

  v_factor := v_profile.qty_in_stock_unit / v_profile.qty_in_input_unit;

  if p_presentation_qty > 0 and abs(coalesce(p_base_qty, 0) - (p_presentation_qty * v_factor)) > 0.000001 then
    raise exception 'base quantity does not match presentation conversion';
  end if;

  return query select v_location.site_id, v_factor;
end;
$$;

create or replace function public.upsert_inventory_stock_by_uom_profile(
  p_location_id uuid,
  p_product_id uuid,
  p_uom_profile_id uuid,
  p_presentation_delta numeric,
  p_base_delta numeric,
  p_location_position_id uuid default null
) returns void
language plpgsql
security definer
set search_path = public, pg_temp
as $$
declare
  v_site_id uuid;
begin
  select checked.site_id
    into v_site_id
  from public.assert_inventory_uom_profile_stock_input(
    p_location_id,
    p_location_position_id,
    p_product_id,
    p_uom_profile_id,
    abs(coalesce(p_presentation_delta, 0)),
    abs(coalesce(p_base_delta, 0))
  ) checked;

  if not (
    public.has_permission('nexo.inventory.stock', v_site_id)
    or public.has_permission('nexo.inventory.entries', v_site_id)
    or public.has_permission('nexo.inventory.transfers', v_site_id)
    or public.has_permission('nexo.inventory.withdraw', v_site_id)
    or public.has_permission('nexo.inventory.remissions.prepare', v_site_id)
    or public.has_permission('nexo.inventory.remissions.receive', v_site_id)
  ) then
    raise exception 'permission denied';
  end if;

  perform pg_advisory_xact_lock(hashtextextended(p_location_id::text || ':' || p_product_id::text || ':' || p_uom_profile_id::text || ':' || coalesce(p_location_position_id::text, ''), 0));

  if p_location_position_id is null then
    insert into public.inventory_stock_by_uom_profile (
      site_id,
      location_id,
      location_position_id,
      product_id,
      uom_profile_id,
      presentation_qty,
      base_qty,
      updated_at
    )
    values (
      v_site_id,
      p_location_id,
      null,
      p_product_id,
      p_uom_profile_id,
      coalesce(p_presentation_delta, 0),
      coalesce(p_base_delta, 0),
      now()
    )
    on conflict (location_id, product_id, uom_profile_id) where location_position_id is null do update
      set presentation_qty = public.inventory_stock_by_uom_profile.presentation_qty + excluded.presentation_qty,
          base_qty = public.inventory_stock_by_uom_profile.base_qty + excluded.base_qty,
          site_id = excluded.site_id,
          updated_at = now();
  else
    insert into public.inventory_stock_by_uom_profile (
      site_id,
      location_id,
      location_position_id,
      product_id,
      uom_profile_id,
      presentation_qty,
      base_qty,
      updated_at
    )
    values (
      v_site_id,
      p_location_id,
      p_location_position_id,
      p_product_id,
      p_uom_profile_id,
      coalesce(p_presentation_delta, 0),
      coalesce(p_base_delta, 0),
      now()
    )
    on conflict (location_id, location_position_id, product_id, uom_profile_id) where location_position_id is not null do update
      set presentation_qty = public.inventory_stock_by_uom_profile.presentation_qty + excluded.presentation_qty,
          base_qty = public.inventory_stock_by_uom_profile.base_qty + excluded.base_qty,
          site_id = excluded.site_id,
          updated_at = now();
  end if;

  if exists (
    select 1
    from public.inventory_stock_by_uom_profile stock
    where stock.location_id = p_location_id
      and stock.product_id = p_product_id
      and stock.uom_profile_id = p_uom_profile_id
      and (
        (p_location_position_id is null and stock.location_position_id is null)
        or stock.location_position_id = p_location_position_id
      )
      and (stock.presentation_qty < -0.000001 or stock.base_qty < -0.000001)
  ) then
    raise exception 'insufficient stock for uom profile';
  end if;
end;
$$;

create or replace function public.consume_inventory_stock_by_uom_profile(
  p_location_id uuid,
  p_product_id uuid,
  p_uom_profile_id uuid,
  p_presentation_qty numeric,
  p_base_qty numeric,
  p_location_position_id uuid default null
) returns void
language plpgsql
security definer
set search_path = public, pg_temp
as $$
declare
  v_site_id uuid;
  v_stock record;
begin
  select checked.site_id
    into v_site_id
  from public.assert_inventory_uom_profile_stock_input(
    p_location_id,
    p_location_position_id,
    p_product_id,
    p_uom_profile_id,
    coalesce(p_presentation_qty, 0),
    coalesce(p_base_qty, 0)
  ) checked;

  if coalesce(p_presentation_qty, 0) <= 0 or coalesce(p_base_qty, 0) <= 0 then
    raise exception 'presentation and base quantities must be greater than zero';
  end if;

  if not (
    public.has_permission('nexo.inventory.stock', v_site_id)
    or public.has_permission('nexo.inventory.transfers', v_site_id)
    or public.has_permission('nexo.inventory.withdraw', v_site_id)
    or public.has_permission('nexo.inventory.remissions.prepare', v_site_id)
  ) then
    raise exception 'permission denied';
  end if;

  perform pg_advisory_xact_lock(hashtextextended(p_location_id::text || ':' || p_product_id::text || ':' || p_uom_profile_id::text || ':' || coalesce(p_location_position_id::text, ''), 0));

  select stock.id, stock.presentation_qty, stock.base_qty
    into v_stock
  from public.inventory_stock_by_uom_profile stock
  where stock.location_id = p_location_id
    and stock.product_id = p_product_id
    and stock.uom_profile_id = p_uom_profile_id
    and (
      (p_location_position_id is null and stock.location_position_id is null)
      or stock.location_position_id = p_location_position_id
    )
  for update;

  if not found or coalesce(v_stock.presentation_qty, 0) + 0.000001 < p_presentation_qty then
    raise exception 'insufficient physical stock for selected presentation';
  end if;

  if coalesce(v_stock.base_qty, 0) + 0.000001 < p_base_qty then
    raise exception 'insufficient base stock for selected presentation';
  end if;

  update public.inventory_stock_by_uom_profile
  set presentation_qty = presentation_qty - p_presentation_qty,
      base_qty = base_qty - p_base_qty,
      updated_at = now()
  where id = v_stock.id;
end;
$$;

alter table public.inventory_stock_by_uom_profile enable row level security;

drop policy if exists "inventory_stock_by_uom_profile_select_permission"
  on public.inventory_stock_by_uom_profile;

create policy "inventory_stock_by_uom_profile_select_permission"
  on public.inventory_stock_by_uom_profile
  for select to authenticated
  using (
    exists (
      select 1
      from public.inventory_locations loc
      where loc.id = inventory_stock_by_uom_profile.location_id
        and public.can_access_site(loc.site_id)
    )
  );

drop policy if exists "inventory_stock_by_uom_profile_write_permission"
  on public.inventory_stock_by_uom_profile;

create policy "inventory_stock_by_uom_profile_write_permission"
  on public.inventory_stock_by_uom_profile
  for all to authenticated
  using (
    exists (
      select 1
      from public.inventory_locations loc
      where loc.id = inventory_stock_by_uom_profile.location_id
        and (
          public.has_permission('nexo.inventory.stock', loc.site_id)
          or public.has_permission('nexo.inventory.entries', loc.site_id)
          or public.has_permission('nexo.inventory.transfers', loc.site_id)
          or public.has_permission('nexo.inventory.withdraw', loc.site_id)
          or public.has_permission('nexo.inventory.remissions.prepare', loc.site_id)
          or public.has_permission('nexo.inventory.remissions.receive', loc.site_id)
        )
    )
  )
  with check (
    exists (
      select 1
      from public.inventory_locations loc
      where loc.id = inventory_stock_by_uom_profile.location_id
        and (
          public.has_permission('nexo.inventory.stock', loc.site_id)
          or public.has_permission('nexo.inventory.entries', loc.site_id)
          or public.has_permission('nexo.inventory.transfers', loc.site_id)
          or public.has_permission('nexo.inventory.withdraw', loc.site_id)
          or public.has_permission('nexo.inventory.remissions.prepare', loc.site_id)
          or public.has_permission('nexo.inventory.remissions.receive', loc.site_id)
        )
    )
  );

create index if not exists idx_inventory_entry_items_input_uom_profile
  on public.inventory_entry_items(input_uom_profile_id);

create index if not exists idx_inventory_transfer_items_input_uom_profile
  on public.inventory_transfer_items(input_uom_profile_id);

create index if not exists idx_restock_request_items_input_uom_profile
  on public.restock_request_items(input_uom_profile_id);

create index if not exists idx_inventory_movements_input_uom_profile
  on public.inventory_movements(input_uom_profile_id);

grant select, insert, update, delete on public.inventory_stock_by_uom_profile to authenticated;
grant execute on function public.upsert_inventory_stock_by_uom_profile(uuid, uuid, uuid, numeric, numeric, uuid) to authenticated;
grant execute on function public.consume_inventory_stock_by_uom_profile(uuid, uuid, uuid, numeric, numeric, uuid) to authenticated;

commit;
