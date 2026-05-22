begin;

create table if not exists pass.commercial_collections (
  id uuid primary key default gen_random_uuid(),
  site_id uuid not null references public.sites(id) on delete cascade,
  code text not null,
  name text not null,
  subtitle text,
  description text,
  kind text not null default 'seasonal',
  hero_image_url text,
  starts_at timestamptz,
  ends_at timestamptz,
  sort_order integer not null default 0,
  is_active boolean not null default true,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint pass_commercial_collections_code_not_blank check (btrim(code) <> ''),
  constraint pass_commercial_collections_name_not_blank check (btrim(name) <> ''),
  constraint pass_commercial_collections_kind_not_blank check (btrim(kind) <> ''),
  constraint pass_commercial_collections_metadata_object check (jsonb_typeof(metadata) = 'object'),
  constraint pass_commercial_collections_date_range check (
    starts_at is null
    or ends_at is null
    or starts_at <= ends_at
  ),
  constraint pass_commercial_collections_site_code_key unique (site_id, code)
);

comment on table pass.commercial_collections is
  'Colecciones comerciales por sede/satelite para agrupar temporadas, campanas, menus especiales o menu principal en Vento Pass.';

comment on column pass.commercial_collections.site_id is
  'Sede/satelite donde esta coleccion se muestra.';

comment on column pass.commercial_collections.kind is
  'Tipo logico de coleccion: main, seasonal, special, campaign, event u otro valor operativo.';

comment on column pass.commercial_collections.hero_image_url is
  'Imagen hero opcional para mostrar la coleccion en Vento Pass.';

create index if not exists pass_commercial_collections_site_active_sort_idx
  on pass.commercial_collections (site_id, is_active, sort_order, name);

create index if not exists pass_commercial_collections_dates_idx
  on pass.commercial_collections (starts_at, ends_at);

drop trigger if exists pass_commercial_collections_set_updated_at on pass.commercial_collections;
create trigger pass_commercial_collections_set_updated_at
before update on pass.commercial_collections
for each row
execute function public._set_updated_at();

alter table pass.commercial_collections enable row level security;

grant select on table pass.commercial_collections to anon, authenticated;
grant insert, update, delete on table pass.commercial_collections to authenticated, service_role;

drop policy if exists pass_commercial_collections_select_active on pass.commercial_collections;
create policy pass_commercial_collections_select_active
on pass.commercial_collections
for select
using (
  is_active = true
  and (starts_at is null or starts_at <= now())
  and (ends_at is null or ends_at >= now())
);

drop policy if exists pass_commercial_collections_select_admin on pass.commercial_collections;
create policy pass_commercial_collections_select_admin
on pass.commercial_collections
for select
to authenticated
using (public.is_owner() or public.is_global_manager());

drop policy if exists pass_commercial_collections_insert_admin on pass.commercial_collections;
create policy pass_commercial_collections_insert_admin
on pass.commercial_collections
for insert
to authenticated
with check (public.is_owner() or public.is_global_manager());

drop policy if exists pass_commercial_collections_update_admin on pass.commercial_collections;
create policy pass_commercial_collections_update_admin
on pass.commercial_collections
for update
to authenticated
using (public.is_owner() or public.is_global_manager())
with check (public.is_owner() or public.is_global_manager());

drop policy if exists pass_commercial_collections_delete_admin on pass.commercial_collections;
create policy pass_commercial_collections_delete_admin
on pass.commercial_collections
for delete
to authenticated
using (public.is_owner() or public.is_global_manager());

create table if not exists pass.commercial_collection_categories (
  id uuid primary key default gen_random_uuid(),
  collection_id uuid not null references pass.commercial_collections(id) on delete cascade,
  commercial_category_id uuid not null references pass.commercial_categories(id) on delete cascade,
  sort_order integer not null default 0,
  is_active boolean not null default true,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint pass_commercial_collection_categories_metadata_object check (jsonb_typeof(metadata) = 'object'),
  constraint pass_commercial_collection_categories_unique unique (collection_id, commercial_category_id)
);

comment on table pass.commercial_collection_categories is
  'Relacion entre colecciones comerciales y categorias comerciales. Permite que una coleccion tenga secciones como Entradas, Fuertes, Brunch o Bebidas.';

create index if not exists pass_commercial_collection_categories_collection_sort_idx
  on pass.commercial_collection_categories (collection_id, is_active, sort_order);

create index if not exists pass_commercial_collection_categories_category_idx
  on pass.commercial_collection_categories (commercial_category_id);

drop trigger if exists pass_commercial_collection_categories_set_updated_at on pass.commercial_collection_categories;
create trigger pass_commercial_collection_categories_set_updated_at
before update on pass.commercial_collection_categories
for each row
execute function public._set_updated_at();

create or replace function pass.validate_commercial_collection_category_site()
returns trigger
language plpgsql
security definer
set search_path = public, pass
as $$
declare
  v_collection_site_id uuid;
  v_category_site_id uuid;
begin
  select site_id
    into v_collection_site_id
  from pass.commercial_collections
  where id = new.collection_id;

  if not found then
    raise exception 'Coleccion comercial % no existe.', new.collection_id;
  end if;

  select site_id
    into v_category_site_id
  from pass.commercial_categories
  where id = new.commercial_category_id;

  if not found then
    raise exception 'Categoria comercial % no existe.', new.commercial_category_id;
  end if;

  if v_collection_site_id is distinct from v_category_site_id then
    raise exception 'La categoria comercial no pertenece a la misma sede de la coleccion.';
  end if;

  return new;
end;
$$;

alter function pass.validate_commercial_collection_category_site() owner to postgres;
grant execute on function pass.validate_commercial_collection_category_site() to authenticated, service_role;

drop trigger if exists pass_commercial_collection_categories_validate_site on pass.commercial_collection_categories;
create trigger pass_commercial_collection_categories_validate_site
before insert or update of collection_id, commercial_category_id
on pass.commercial_collection_categories
for each row
execute function pass.validate_commercial_collection_category_site();

alter table pass.commercial_collection_categories enable row level security;

grant select on table pass.commercial_collection_categories to anon, authenticated;
grant insert, update, delete on table pass.commercial_collection_categories to authenticated, service_role;

drop policy if exists pass_commercial_collection_categories_select_active on pass.commercial_collection_categories;
create policy pass_commercial_collection_categories_select_active
on pass.commercial_collection_categories
for select
using (
  is_active = true
  and exists (
    select 1
    from pass.commercial_collections collection
    join pass.commercial_categories category
      on category.id = pass.commercial_collection_categories.commercial_category_id
    where collection.id = pass.commercial_collection_categories.collection_id
      and collection.is_active = true
      and category.is_active = true
      and (collection.starts_at is null or collection.starts_at <= now())
      and (collection.ends_at is null or collection.ends_at >= now())
  )
);

drop policy if exists pass_commercial_collection_categories_select_admin on pass.commercial_collection_categories;
create policy pass_commercial_collection_categories_select_admin
on pass.commercial_collection_categories
for select
to authenticated
using (public.is_owner() or public.is_global_manager());

drop policy if exists pass_commercial_collection_categories_insert_admin on pass.commercial_collection_categories;
create policy pass_commercial_collection_categories_insert_admin
on pass.commercial_collection_categories
for insert
to authenticated
with check (public.is_owner() or public.is_global_manager());

drop policy if exists pass_commercial_collection_categories_update_admin on pass.commercial_collection_categories;
create policy pass_commercial_collection_categories_update_admin
on pass.commercial_collection_categories
for update
to authenticated
using (public.is_owner() or public.is_global_manager())
with check (public.is_owner() or public.is_global_manager());

drop policy if exists pass_commercial_collection_categories_delete_admin on pass.commercial_collection_categories;
create policy pass_commercial_collection_categories_delete_admin
on pass.commercial_collection_categories
for delete
to authenticated
using (public.is_owner() or public.is_global_manager());

create or replace function pass.normalize_commercial_collection_code(p_name text)
returns text
language sql
immutable
as $$
  select coalesce(nullif(public._vento_slugify(p_name), ''), 'coleccion');
$$;

create or replace function pass.ensure_commercial_collection_category(
  p_collection_id uuid,
  p_commercial_category_id uuid
)
returns uuid
language plpgsql
security definer
set search_path = public, pass
as $$
declare
  v_link_id uuid;
begin
  if p_collection_id is null or p_commercial_category_id is null then
    return null;
  end if;

  insert into pass.commercial_collection_categories (
    collection_id,
    commercial_category_id,
    is_active,
    metadata
  )
  values (
    p_collection_id,
    p_commercial_category_id,
    true,
    jsonb_build_object('created_from', 'catalog_item_assignment')
  )
  on conflict (collection_id, commercial_category_id)
  do update set
    is_active = true,
    updated_at = now(),
    metadata = coalesce(pass.commercial_collection_categories.metadata, '{}'::jsonb)
      || jsonb_build_object(
        'last_ensured_from', 'catalog_item_assignment',
        'last_ensured_at', now()
      )
  returning id into v_link_id;

  return v_link_id;
end;
$$;

alter function pass.ensure_commercial_collection_category(uuid, uuid) owner to postgres;
grant execute on function pass.ensure_commercial_collection_category(uuid, uuid) to authenticated, service_role;

alter table pass.catalog_items
  add column if not exists commercial_collection_id uuid references pass.commercial_collections(id) on delete set null;

comment on column pass.catalog_items.commercial_collection_id is
  'Coleccion comercial donde se muestra el item en Vento Pass. Ejemplos: Menu principal, Menu especial de mayo, Coleccion Madres.';

create index if not exists pass_catalog_items_commercial_collection_idx
  on pass.catalog_items (site_id, commercial_collection_id, commercial_category_id, sort_order)
  where is_active = true;

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

  return new;
end;
$$;

alter function pass.sync_catalog_item_commercial_collection() owner to postgres;
grant execute on function pass.sync_catalog_item_commercial_collection() to authenticated, service_role;

drop trigger if exists pass_catalog_items_sync_commercial_collection on pass.catalog_items;
create trigger pass_catalog_items_sync_commercial_collection
after insert or update of site_id, commercial_collection_id, commercial_category_id
on pass.catalog_items
for each row
execute function pass.sync_catalog_item_commercial_collection();

create or replace view public.commercial_collections
with (security_invoker = true)
as
select * from pass.commercial_collections;

comment on view public.commercial_collections is
  'Compat view. Canonical table lives in pass.commercial_collections.';

grant select on public.commercial_collections to anon, authenticated;
grant insert, update, delete on public.commercial_collections to authenticated, service_role;

create or replace view public.commercial_collection_categories
with (security_invoker = true)
as
select * from pass.commercial_collection_categories;

comment on view public.commercial_collection_categories is
  'Compat view. Canonical table lives in pass.commercial_collection_categories.';

grant select on public.commercial_collection_categories to anon, authenticated;
grant insert, update, delete on public.commercial_collection_categories to authenticated, service_role;

commit;