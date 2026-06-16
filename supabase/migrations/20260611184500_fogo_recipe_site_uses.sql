create table if not exists public.recipe_site_uses (
  id uuid primary key default gen_random_uuid(),
  recipe_card_id uuid not null references public.recipe_cards(id) on delete cascade,
  product_id uuid not null references public.products(id) on delete cascade,
  site_id uuid not null references public.sites(id) on delete cascade,
  usage_mode text not null,
  area_id uuid references public.areas(id) on delete restrict,
  source_location_id uuid references public.inventory_locations(id) on delete restrict,
  destination_location_id uuid references public.inventory_locations(id) on delete restrict,
  is_active boolean not null default true,
  created_by uuid references auth.users(id) on delete set null,
  updated_by uuid references auth.users(id) on delete set null,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint recipe_site_uses_mode_chk
    check (usage_mode in ('produces_here', 'sells_finished_good', 'prepares_to_order', 'no_inventory')),
  constraint recipe_site_uses_location_chk check (
    (usage_mode = 'produces_here' and area_id is not null)
    or (usage_mode = 'sells_finished_good')
    or (usage_mode = 'prepares_to_order' and area_id is not null)
    or (usage_mode = 'no_inventory')
  ),
  constraint recipe_site_uses_recipe_site_key unique (recipe_card_id, site_id)
);

create index if not exists recipe_site_uses_product_site_idx
  on public.recipe_site_uses (product_id, site_id)
  where is_active = true;

create or replace function public.set_recipe_site_uses_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists recipe_site_uses_updated_at on public.recipe_site_uses;
create trigger recipe_site_uses_updated_at
before update on public.recipe_site_uses
for each row
execute function public.set_recipe_site_uses_updated_at();

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

    if v_source.site_id is distinct from new.site_id then
      raise exception 'El LOC origen no pertenece a la sede del uso.';
    end if;
    if coalesce(v_source.is_active, false) is false then
      raise exception 'El LOC origen no esta activo.';
    end if;
    if new.area_id is not null and v_source.area_id is distinct from new.area_id then
      raise exception 'El LOC origen no pertenece al area del uso.';
    end if;
  end if;

  if new.destination_location_id is not null then
    select site_id, area_id, is_active
      into v_destination
    from public.inventory_locations
    where id = new.destination_location_id;

    if v_destination.site_id is distinct from new.site_id then
      raise exception 'El LOC destino no pertenece a la sede del uso.';
    end if;
    if coalesce(v_destination.is_active, false) is false then
      raise exception 'El LOC destino no esta activo.';
    end if;
  end if;

  return new;
end;
$$;

drop trigger if exists recipe_site_uses_validate on public.recipe_site_uses;
create trigger recipe_site_uses_validate
before insert or update of recipe_card_id, product_id, site_id, usage_mode, area_id, source_location_id, destination_location_id
on public.recipe_site_uses
for each row
execute function public.validate_recipe_site_use();

insert into public.recipe_site_uses (
  recipe_card_id,
  product_id,
  site_id,
  usage_mode,
  area_id,
  is_active,
  metadata
)
select
  rc.id,
  rc.product_id,
  rc.site_id,
  'produces_here',
  rc.area_id,
  true,
  jsonb_build_object('backfilledFrom', 'recipe_cards.site_id')
from public.recipe_cards rc
where rc.site_id is not null
on conflict (recipe_card_id, site_id) do nothing;

alter table public.recipe_site_uses enable row level security;

drop policy if exists recipe_site_uses_select_staff on public.recipe_site_uses;
create policy recipe_site_uses_select_staff
on public.recipe_site_uses
for select
to authenticated
using (public.can_access_recipe_scope(site_id, area_id));

drop policy if exists recipe_site_uses_write_manager on public.recipe_site_uses;
create policy recipe_site_uses_write_manager
on public.recipe_site_uses
for all
to authenticated
using (
  (public.is_owner() or public.is_manager())
  and public.can_access_recipe_scope(site_id, area_id)
)
with check (
  (public.is_owner() or public.is_manager())
  and public.can_access_recipe_scope(site_id, area_id)
);

grant select, insert, update, delete on public.recipe_site_uses to authenticated;
grant all on public.recipe_site_uses to service_role;
grant execute on function public.validate_recipe_site_use() to authenticated, service_role;

notify pgrst, 'reload schema';
