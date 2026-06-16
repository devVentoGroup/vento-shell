alter table public.recipe_site_uses
  drop constraint if exists recipe_site_uses_mode_chk;

alter table public.recipe_site_uses
  add constraint recipe_site_uses_mode_chk
  check (
    usage_mode in (
      'produces_here',
      'sells_finished_good',
      'prepares_to_order',
      'stored_for_production',
      'no_inventory'
    )
  );

alter table public.recipe_site_uses
  drop constraint if exists recipe_site_uses_location_chk;

alter table public.recipe_site_uses
  add constraint recipe_site_uses_location_chk
  check (
    (
      usage_mode = 'produces_here'
      and area_id is not null
      and source_location_id is not null
      and destination_location_id is not null
    )
    or (
      usage_mode = 'prepares_to_order'
      and area_id is not null
      and source_location_id is not null
      and destination_location_id is null
    )
    or (
      usage_mode = 'sells_finished_good'
      and source_location_id is not null
      and destination_location_id is null
    )
    or (
      usage_mode = 'stored_for_production'
      and source_location_id is not null
      and destination_location_id is null
    )
    or (
      usage_mode = 'no_inventory'
      and area_id is null
      and source_location_id is null
      and destination_location_id is null
    )
  ) not valid;

create or replace function public.validate_recipe_site_use()
returns trigger
language plpgsql
security invoker
set search_path = public
as $$
declare
  v_recipe record;
  v_area_site_id uuid;
  v_source record;
  v_destination record;
begin
  select id, product_id
    into v_recipe
  from public.recipe_cards
  where id = new.recipe_card_id;

  if v_recipe.id is null then
    raise exception 'recipe_card_id no existe';
  end if;

  new.product_id := v_recipe.product_id;

  if new.usage_mode = 'no_inventory' then
    new.area_id := null;
    new.source_location_id := null;
    new.destination_location_id := null;
  end if;

  if new.usage_mode in ('sells_finished_good', 'stored_for_production', 'prepares_to_order') then
    new.destination_location_id := null;
  end if;

  if new.area_id is not null then
    select site_id into v_area_site_id
    from public.areas
    where id = new.area_id;

    if v_area_site_id is distinct from new.site_id then
      raise exception 'El area no pertenece a la sede del uso.';
    end if;
  end if;

  if new.source_location_id is not null then
    select site_id, area_id, is_active
      into v_source
    from public.inventory_locations
    where id = new.source_location_id;

    if v_source.site_id is null then
      raise exception 'El LOC origen seleccionado no existe.';
    end if;
    if v_source.site_id is distinct from new.site_id then
      raise exception 'El LOC origen no pertenece a la sede del uso.';
    end if;
    if coalesce(v_source.is_active, false) is false then
      raise exception 'El LOC origen no esta activo.';
    end if;

    if new.usage_mode in ('sells_finished_good', 'stored_for_production') then
      new.area_id := v_source.area_id;
    elsif new.area_id is not null and v_source.area_id is distinct from new.area_id then
      raise exception 'El LOC origen no pertenece al area del uso.';
    end if;
  end if;

  if new.destination_location_id is not null then
    select site_id, area_id, is_active
      into v_destination
    from public.inventory_locations
    where id = new.destination_location_id;

    if v_destination.site_id is null then
      raise exception 'El LOC destino seleccionado no existe.';
    end if;
    if v_destination.site_id is distinct from new.site_id then
      raise exception 'El LOC destino no pertenece a la sede del uso.';
    end if;
    if coalesce(v_destination.is_active, false) is false then
      raise exception 'El LOC destino no esta activo.';
    end if;
    if new.usage_mode = 'produces_here'
      and new.area_id is not null
      and v_destination.area_id is not null
      and v_destination.area_id is distinct from new.area_id then
      raise exception 'El LOC destino no pertenece al area del uso.';
    end if;
  end if;

  return new;
end;
$$;

notify pgrst, 'reload schema';
