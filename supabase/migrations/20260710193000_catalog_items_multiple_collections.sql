begin;

create table if not exists pass.catalog_item_collections (
  id uuid primary key default gen_random_uuid(),
  catalog_item_id uuid not null references pass.catalog_items(id) on delete cascade,
  commercial_collection_id uuid not null references pass.commercial_collections(id) on delete cascade,
  sort_order integer not null default 0,
  is_active boolean not null default true,
  is_primary boolean not null default false,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint pass_catalog_item_collections_unique unique (catalog_item_id, commercial_collection_id),
  constraint pass_catalog_item_collections_metadata_object check (jsonb_typeof(metadata) = 'object')
);

create index if not exists pass_catalog_item_collections_item_idx
  on pass.catalog_item_collections (catalog_item_id, is_active, sort_order);

create index if not exists pass_catalog_item_collections_collection_idx
  on pass.catalog_item_collections (commercial_collection_id, is_active, sort_order);

create unique index if not exists pass_catalog_item_collections_one_primary_idx
  on pass.catalog_item_collections (catalog_item_id)
  where is_primary = true;

create or replace function pass.validate_catalog_item_collection_site()
returns trigger
language plpgsql
security definer
set search_path = public, pass
as $$
declare
  v_item_site_id uuid;
  v_item_category_id uuid;
  v_collection_site_id uuid;
begin
  select site_id, commercial_category_id
  into v_item_site_id, v_item_category_id
  from pass.catalog_items
  where id = new.catalog_item_id;

  if not found then
    raise exception 'Item comercial % no existe.', new.catalog_item_id;
  end if;

  select site_id
  into v_collection_site_id
  from pass.commercial_collections
  where id = new.commercial_collection_id;

  if not found then
    raise exception 'Coleccion comercial % no existe.', new.commercial_collection_id;
  end if;

  if v_item_site_id is distinct from v_collection_site_id then
    raise exception 'La coleccion comercial no pertenece a la sede del item.';
  end if;

  if v_item_category_id is not null then
    perform pass.ensure_commercial_collection_category(
      new.commercial_collection_id,
      v_item_category_id
    );
  end if;

  return new;
end;
$$;

drop trigger if exists pass_catalog_item_collections_validate_site on pass.catalog_item_collections;
create trigger pass_catalog_item_collections_validate_site
before insert or update on pass.catalog_item_collections
for each row execute function pass.validate_catalog_item_collection_site();

drop trigger if exists pass_catalog_item_collections_set_updated_at on pass.catalog_item_collections;
create trigger pass_catalog_item_collections_set_updated_at
before update on pass.catalog_item_collections
for each row execute function public._set_updated_at();

insert into pass.catalog_item_collections (
  catalog_item_id,
  commercial_collection_id,
  sort_order,
  is_active,
  is_primary,
  metadata
)
select
  ci.id,
  ci.commercial_collection_id,
  ci.sort_order,
  true,
  true,
  jsonb_build_object('migrated_from', 'catalog_items.commercial_collection_id')
from pass.catalog_items ci
where ci.commercial_collection_id is not null
on conflict (catalog_item_id, commercial_collection_id) do update
set
  sort_order = excluded.sort_order,
  is_active = true,
  is_primary = true,
  updated_at = now();

create or replace function pass.sync_catalog_item_commercial_collection()
returns trigger
language plpgsql
security definer
set search_path = public, pass
as $$
declare
  v_collection_site_id uuid;
begin
  if new.commercial_collection_id is null then
    return new;
  end if;

  select site_id
  into v_collection_site_id
  from pass.commercial_collections
  where id = new.commercial_collection_id;

  if not found then
    raise exception 'Coleccion comercial % no existe.', new.commercial_collection_id;
  end if;

  if v_collection_site_id is distinct from new.site_id then
    raise exception 'La coleccion comercial no pertenece a la sede del item.';
  end if;

  if new.commercial_category_id is not null then
    perform pass.ensure_commercial_collection_category(
      new.commercial_collection_id,
      new.commercial_category_id
    );
  end if;

  update pass.catalog_item_collections
  set is_primary = false, updated_at = now()
  where catalog_item_id = new.id
    and commercial_collection_id is distinct from new.commercial_collection_id
    and is_primary = true;

  insert into pass.catalog_item_collections (
    catalog_item_id,
    commercial_collection_id,
    sort_order,
    is_active,
    is_primary,
    metadata
  )
  values (
    new.id,
    new.commercial_collection_id,
    new.sort_order,
    true,
    true,
    jsonb_build_object('synced_from', 'catalog_items.commercial_collection_id')
  )
  on conflict (catalog_item_id, commercial_collection_id) do update
  set
    sort_order = excluded.sort_order,
    is_active = true,
    is_primary = true,
    updated_at = now();

  return new;
end;
$$;

comment on table pass.catalog_item_collections is
  'Permite que un producto comercial aparezca en varias colecciones sin duplicar el producto.';

comment on column pass.catalog_item_collections.is_primary is
  'Marca la coleccion principal mantenida temporalmente en catalog_items.commercial_collection_id por compatibilidad.';

commit;
