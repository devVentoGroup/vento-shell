begin;

create table if not exists pass.commercial_categories (
  id uuid primary key default gen_random_uuid(),
  site_id uuid not null references public.sites(id) on delete cascade,
  code text not null,
  name text not null,
  description text,
  sort_order integer not null default 0,
  is_active boolean not null default true,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint pass_commercial_categories_code_not_blank check (btrim(code) <> ''),
  constraint pass_commercial_categories_name_not_blank check (btrim(name) <> ''),
  constraint pass_commercial_categories_metadata_object check (jsonb_typeof(metadata) = 'object'),
  constraint pass_commercial_categories_site_code_key unique (site_id, code)
);

comment on table pass.commercial_categories is
  'Categorias comerciales por sede/satelite para Vento Pass. No reemplazan categorias operacionales de inventario.';
comment on column pass.commercial_categories.site_id is
  'Sede/satelite donde esta categoria se muestra. Permite menus y precios distintos por satelite.';

create index if not exists pass_commercial_categories_site_active_sort_idx
  on pass.commercial_categories (site_id, is_active, sort_order, name);

drop trigger if exists pass_commercial_categories_set_updated_at on pass.commercial_categories;
create trigger pass_commercial_categories_set_updated_at
before update on pass.commercial_categories
for each row
execute function public._set_updated_at();

alter table pass.commercial_categories enable row level security;

grant select on table pass.commercial_categories to anon, authenticated;
grant insert, update, delete on table pass.commercial_categories to authenticated, service_role;

drop policy if exists pass_commercial_categories_select_active on pass.commercial_categories;
create policy pass_commercial_categories_select_active
on pass.commercial_categories
for select
using (is_active = true);

drop policy if exists pass_commercial_categories_select_admin on pass.commercial_categories;
create policy pass_commercial_categories_select_admin
on pass.commercial_categories
for select
to authenticated
using (public.is_owner() or public.is_global_manager());

drop policy if exists pass_commercial_categories_insert_admin on pass.commercial_categories;
create policy pass_commercial_categories_insert_admin
on pass.commercial_categories
for insert
to authenticated
with check (public.is_owner() or public.is_global_manager());

drop policy if exists pass_commercial_categories_update_admin on pass.commercial_categories;
create policy pass_commercial_categories_update_admin
on pass.commercial_categories
for update
to authenticated
using (public.is_owner() or public.is_global_manager())
with check (public.is_owner() or public.is_global_manager());

drop policy if exists pass_commercial_categories_delete_admin on pass.commercial_categories;
create policy pass_commercial_categories_delete_admin
on pass.commercial_categories
for delete
to authenticated
using (public.is_owner() or public.is_global_manager());

create or replace function pass.normalize_commercial_category_code(p_name text)
returns text
language sql
immutable
as $$
  select coalesce(nullif(public._vento_slugify(p_name), ''), 'categoria');
$$;

create or replace function pass.ensure_commercial_category(
  p_site_id uuid,
  p_name text,
  p_code text default null
)
returns uuid
language plpgsql
security definer
set search_path = public, pass
as $$
declare
  v_name text := nullif(btrim(coalesce(p_name, '')), '');
  v_base_code text;
  v_code text;
  v_category_id uuid;
  v_suffix integer := 1;
begin
  if p_site_id is null then
    raise exception 'site_required';
  end if;

  if v_name is null then
    return null;
  end if;

  select id
    into v_category_id
  from pass.commercial_categories
  where site_id = p_site_id
    and lower(btrim(name)) = lower(v_name)
  order by is_active desc, sort_order asc, name asc
  limit 1;

  if v_category_id is not null then
    return v_category_id;
  end if;

  v_base_code := case
    when nullif(btrim(coalesce(p_code, '')), '') is not null
      then pass.normalize_commercial_category_code(p_code)
    else pass.normalize_commercial_category_code(v_name)
  end;
  v_code := v_base_code;

  while exists (
    select 1
    from pass.commercial_categories
    where site_id = p_site_id
      and code = v_code
  ) loop
    v_suffix := v_suffix + 1;
    v_code := v_base_code || '-' || v_suffix::text;
  end loop;

  insert into pass.commercial_categories (site_id, code, name, metadata)
  values (
    p_site_id,
    v_code,
    v_name,
    jsonb_build_object('created_from', 'catalog_item_category_label')
  )
  returning id into v_category_id;

  return v_category_id;
end;
$$;

alter function pass.ensure_commercial_category(uuid, text, text) owner to postgres;
grant execute on function pass.ensure_commercial_category(uuid, text, text) to authenticated, service_role;

update pass.commercial_categories
set code = pass.normalize_commercial_category_code(name),
    updated_at = now()
where code = 'categoria'
  and not exists (
    select 1
    from pass.commercial_categories other
    where other.site_id = pass.commercial_categories.site_id
      and other.code = pass.normalize_commercial_category_code(pass.commercial_categories.name)
      and other.id <> pass.commercial_categories.id
  );

alter table pass.catalog_items
  add column if not exists commercial_category_id uuid references pass.commercial_categories(id) on delete set null;

comment on column pass.catalog_items.commercial_category_id is
  'Categoria comercial canonica del item en Vento Pass. category_label queda como compatibilidad de lectura.';

create index if not exists pass_catalog_items_commercial_category_idx
  on pass.catalog_items (site_id, commercial_category_id, sort_order)
  where is_active = true;

with labels as (
  select distinct
    site_id,
    nullif(btrim(category_label), '') as category_label
  from pass.catalog_items
  where site_id is not null
    and nullif(btrim(category_label), '') is not null
)
select pass.ensure_commercial_category(site_id, category_label)
from labels;

update pass.catalog_items ci
set commercial_category_id = pass.ensure_commercial_category(ci.site_id, ci.category_label),
    updated_at = now()
where ci.commercial_category_id is null
  and ci.site_id is not null
  and nullif(btrim(ci.category_label), '') is not null;

create or replace function pass.validate_catalog_item_product_site()
returns trigger
language plpgsql
security definer
set search_path = public, pass
as $$
declare
  v_product record;
  v_category record;
begin
  if new.product_id is null then
    return new;
  end if;

  select
    p.id,
    p.name,
    p.description,
    p.sku,
    p.price,
    lower(coalesce(p.product_type, '')) as product_type,
    p.is_active
  into v_product
  from public.products p
  where p.id = new.product_id;

  if not found then
    raise exception 'Producto % no existe.', new.product_id;
  end if;

  if coalesce(v_product.is_active, true) = false then
    raise exception 'Producto % esta inactivo.', new.product_id;
  end if;

  if v_product.product_type not in ('venta', 'sale') then
    raise exception 'Solo se permiten productos de venta.';
  end if;

  perform 1
  from public.product_site_settings pss
  where pss.product_id = new.product_id
    and pss.site_id = new.site_id
    and coalesce(pss.is_active, true) = true;

  if not found then
    raise exception 'Producto % no esta habilitado para la sede %.', new.product_id, new.site_id;
  end if;

  if coalesce(trim(new.name), '') = '' then
    new.name := coalesce(v_product.name, 'Producto');
  end if;

  if coalesce(trim(new.description), '') = '' then
    new.description := v_product.description;
  end if;

  if coalesce(trim(new.code), '') = '' then
    new.code := lower(
      regexp_replace(
        coalesce(v_product.sku, v_product.name, 'item'),
        '[^a-zA-Z0-9]+',
        '-',
        'g'
      )
    );
    new.code := regexp_replace(new.code, '(^-+|-+$)', '', 'g');
    if coalesce(new.code, '') = '' then
      new.code := 'item';
    end if;
  end if;

  if coalesce(new.price_amount, 0) = 0 and v_product.price is not null and v_product.price > 0 then
    new.price_amount := v_product.price;
  end if;

  if new.commercial_category_id is not null then
    select id, site_id, name, is_active
      into v_category
    from pass.commercial_categories
    where id = new.commercial_category_id;

    if not found then
      raise exception 'Categoria comercial % no existe.', new.commercial_category_id;
    end if;

    if v_category.site_id is distinct from new.site_id then
      raise exception 'Categoria comercial no pertenece a la sede del item.';
    end if;

    if coalesce(v_category.is_active, true) = false then
      raise exception 'Categoria comercial inactiva.';
    end if;

    new.category_label := v_category.name;
  elsif nullif(btrim(coalesce(new.category_label, '')), '') is not null then
    new.commercial_category_id := pass.ensure_commercial_category(new.site_id, new.category_label);
  end if;

  return new;
end;
$$;

alter function pass.validate_catalog_item_product_site() owner to postgres;
grant execute on function pass.validate_catalog_item_product_site() to authenticated, service_role;

create or replace function pass.seed_catalog_items_from_sell_products(
  p_site_id uuid default null,
  p_only_missing boolean default true
)
returns jsonb
language plpgsql
security definer
set search_path = public, pass
as $$
declare
  v_row record;
  v_existing_id uuid;
  v_inserted integer := 0;
  v_updated integer := 0;
  v_skipped integer := 0;
  v_slug text;
  v_code text;
  v_now timestamptz := now();
begin
  if auth.uid() is not null and not (public.is_owner() or public.is_global_manager()) then
    return jsonb_build_object('success', false, 'error', 'No autorizado.');
  end if;

  for v_row in
    select
      sps.site_id,
      sps.product_id,
      sps.name,
      sps.description,
      sps.sku,
      sps.base_price,
      sps.recipe_cost_amount,
      sps.base_margin_amount,
      sps.base_margin_pct,
      p.catalog_image_url,
      p.image_url as product_image_url
    from pass.sell_products_by_site sps
    join public.products p
      on p.id = sps.product_id
    where p_site_id is null or sps.site_id = p_site_id
    order by sps.site_id, sps.name
  loop
    select ci.id
      into v_existing_id
    from pass.catalog_items ci
    where ci.site_id = v_row.site_id
      and ci.product_id = v_row.product_id
    order by ci.is_active desc, ci.updated_at desc, ci.created_at desc
    limit 1;

    v_slug := lower(
      regexp_replace(
        coalesce(nullif(trim(v_row.sku), ''), nullif(trim(v_row.name), ''), 'item'),
        '[^a-zA-Z0-9]+',
        '-',
        'g'
      )
    );
    v_slug := regexp_replace(v_slug, '(^-+|-+$)', '', 'g');
    if coalesce(v_slug, '') = '' then
      v_slug := 'item';
    end if;
    v_code := v_slug || '-' || substring(replace(v_row.product_id::text, '-', '') from 1 for 6);

    if v_existing_id is null then
      insert into pass.catalog_items (
        site_id,
        product_id,
        code,
        name,
        description,
        category_label,
        commercial_category_id,
        image_url,
        remission_image_url,
        price_amount,
        is_active,
        is_featured,
        badges,
        fulfillment_modes,
        metadata,
        sort_order
      ) values (
        v_row.site_id,
        v_row.product_id,
        v_code,
        coalesce(v_row.name, 'Producto'),
        v_row.description,
        null,
        null,
        coalesce(v_row.catalog_image_url, v_row.product_image_url),
        v_row.product_image_url,
        greatest(coalesce(v_row.base_price, 0), 0),
        true,
        false,
        '{}'::text[],
        array['delivery', 'pickup', 'on_premise']::text[],
        jsonb_strip_nulls(
          jsonb_build_object(
            'seed_source', 'products_sell',
            'seed_synced_at', v_now,
            'recipe_cost_amount', v_row.recipe_cost_amount,
            'margin_amount', v_row.base_margin_amount,
            'margin_pct', v_row.base_margin_pct
          )
        ),
        0
      );

      v_inserted := v_inserted + 1;
    elsif p_only_missing then
      v_skipped := v_skipped + 1;
    else
      update pass.catalog_items ci
      set
        site_id = v_row.site_id,
        product_id = v_row.product_id,
        image_url = coalesce(ci.image_url, v_row.catalog_image_url, v_row.product_image_url),
        remission_image_url = coalesce(ci.remission_image_url, v_row.product_image_url),
        price_amount = case
          when coalesce(ci.price_amount, 0) <= 0 then greatest(coalesce(v_row.base_price, 0), 0)
          else ci.price_amount
        end,
        metadata = jsonb_strip_nulls(
          coalesce(ci.metadata, '{}'::jsonb)
          || jsonb_build_object(
            'seed_source', 'products_sell',
            'seed_synced_at', v_now,
            'recipe_cost_amount', v_row.recipe_cost_amount,
            'margin_amount', case
              when coalesce(ci.price_amount, 0) > 0 and v_row.recipe_cost_amount is not null
                then ci.price_amount - v_row.recipe_cost_amount
              else v_row.base_margin_amount
            end,
            'margin_pct', case
              when coalesce(ci.price_amount, 0) > 0 and v_row.recipe_cost_amount is not null
                then round(((ci.price_amount - v_row.recipe_cost_amount) / ci.price_amount) * 100, 2)
              else v_row.base_margin_pct
            end
          )
        ),
        updated_at = v_now
      where ci.id = v_existing_id;

      v_updated := v_updated + 1;
    end if;
  end loop;

  return jsonb_build_object(
    'success', true,
    'inserted', v_inserted,
    'updated', v_updated,
    'skipped', v_skipped
  );
exception
  when others then
    return jsonb_build_object(
      'success', false,
      'error', sqlerrm,
      'inserted', v_inserted,
      'updated', v_updated,
      'skipped', v_skipped
    );
end;
$$;

alter function pass.seed_catalog_items_from_sell_products(uuid, boolean) owner to postgres;
grant execute on function pass.seed_catalog_items_from_sell_products(uuid, boolean) to authenticated, service_role;

create or replace view public.commercial_categories
with (security_invoker = true)
as
select * from pass.commercial_categories;

comment on view public.commercial_categories is 'Compat view. Canonical table lives in pass.commercial_categories.';

grant select on public.commercial_categories to anon, authenticated;
grant insert, update, delete on public.commercial_categories to authenticated, service_role;

commit;
