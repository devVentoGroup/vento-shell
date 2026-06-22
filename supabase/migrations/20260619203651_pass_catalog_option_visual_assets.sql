begin;

insert into storage.buckets (
  id,
  name,
  public,
  file_size_limit,
  allowed_mime_types
)
values (
  'commercial-menu-images',
  'commercial-menu-images',
  true,
  5242880,
  array['image/jpeg', 'image/png', 'image/webp']::text[]
)
on conflict (id) do update
set
  public = excluded.public,
  file_size_limit = excluded.file_size_limit,
  allowed_mime_types = excluded.allowed_mime_types;

create table if not exists pass.catalog_option_visual_assets (
  id uuid primary key default gen_random_uuid(),
  site_id uuid references public.sites(id) on update cascade on delete cascade,
  asset_key text not null,
  display_name text not null,
  image_url text not null,
  linked_product_id uuid references public.products(id) on update cascade on delete set null,
  linked_ingredient_product_id uuid references public.products(id) on update cascade on delete set null,
  option_code text,
  normalized_option_name text,
  scope text not null default 'generic',
  is_active boolean not null default true,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),

  constraint pass_catalog_option_visual_assets_asset_key_not_blank check (length(btrim(asset_key)) > 0),
  constraint pass_catalog_option_visual_assets_display_name_not_blank check (length(btrim(display_name)) > 0),
  constraint pass_catalog_option_visual_assets_image_url_not_blank check (length(btrim(image_url)) > 0),
  constraint pass_catalog_option_visual_assets_scope_check check (
    scope in ('extra', 'ingredient', 'topping', 'sauce', 'removal', 'replacement', 'recommendation', 'generic')
  ),
  constraint pass_catalog_option_visual_assets_metadata_object check (jsonb_typeof(metadata) = 'object')
);

comment on table pass.catalog_option_visual_assets is
  'Assets visuales comerciales reutilizables para opciones de menu en Pass. Separan la imagen comercial de la imagen operacional de inventario.';

comment on column pass.catalog_option_visual_assets.site_id is
  'Sede propietaria del asset. Null permite asset global reutilizable por varias sedes.';

comment on column pass.catalog_option_visual_assets.linked_product_id is
  'Producto operacional relacionado para extras, toppings o salsas.';

comment on column pass.catalog_option_visual_assets.linked_ingredient_product_id is
  'Ingrediente operacional relacionado para opciones de retiro o reemplazo.';

create unique index if not exists pass_catalog_option_visual_assets_site_asset_key_key
  on pass.catalog_option_visual_assets (site_id, asset_key)
  where site_id is not null;

create unique index if not exists pass_catalog_option_visual_assets_global_asset_key_key
  on pass.catalog_option_visual_assets (asset_key)
  where site_id is null;

create index if not exists pass_catalog_option_visual_assets_site_active_idx
  on pass.catalog_option_visual_assets (site_id, is_active, scope, display_name);

create index if not exists pass_catalog_option_visual_assets_linked_product_idx
  on pass.catalog_option_visual_assets (site_id, linked_product_id)
  where linked_product_id is not null and is_active = true;

create index if not exists pass_catalog_option_visual_assets_linked_ingredient_idx
  on pass.catalog_option_visual_assets (site_id, linked_ingredient_product_id)
  where linked_ingredient_product_id is not null and is_active = true;

create index if not exists pass_catalog_option_visual_assets_option_code_idx
  on pass.catalog_option_visual_assets (site_id, option_code)
  where option_code is not null and is_active = true;

create index if not exists pass_catalog_option_visual_assets_normalized_name_idx
  on pass.catalog_option_visual_assets (site_id, normalized_option_name)
  where normalized_option_name is not null and is_active = true;

drop trigger if exists pass_catalog_option_visual_assets_set_updated_at on pass.catalog_option_visual_assets;
create trigger pass_catalog_option_visual_assets_set_updated_at
before update on pass.catalog_option_visual_assets
for each row
execute function public._set_updated_at();

alter table pass.catalog_option_visual_assets enable row level security;

grant select on table pass.catalog_option_visual_assets to anon, authenticated;
grant insert, update, delete on table pass.catalog_option_visual_assets to authenticated, service_role;

drop policy if exists pass_catalog_option_visual_assets_select_public on pass.catalog_option_visual_assets;
create policy pass_catalog_option_visual_assets_select_public
on pass.catalog_option_visual_assets
for select
to anon, authenticated
using (is_active = true);

drop policy if exists pass_catalog_option_visual_assets_select_admin on pass.catalog_option_visual_assets;
create policy pass_catalog_option_visual_assets_select_admin
on pass.catalog_option_visual_assets
for select
to authenticated
using (public.is_owner() or public.is_global_manager());

drop policy if exists pass_catalog_option_visual_assets_insert_admin on pass.catalog_option_visual_assets;
create policy pass_catalog_option_visual_assets_insert_admin
on pass.catalog_option_visual_assets
for insert
to authenticated
with check (public.is_owner() or public.is_global_manager());

drop policy if exists pass_catalog_option_visual_assets_update_admin on pass.catalog_option_visual_assets;
create policy pass_catalog_option_visual_assets_update_admin
on pass.catalog_option_visual_assets
for update
to authenticated
using (public.is_owner() or public.is_global_manager())
with check (public.is_owner() or public.is_global_manager());

drop policy if exists pass_catalog_option_visual_assets_delete_admin on pass.catalog_option_visual_assets;
create policy pass_catalog_option_visual_assets_delete_admin
on pass.catalog_option_visual_assets
for delete
to authenticated
using (public.is_owner() or public.is_global_manager());

drop policy if exists commercial_menu_images_select_public on storage.objects;
create policy commercial_menu_images_select_public
on storage.objects
for select
to anon, authenticated
using (bucket_id = 'commercial-menu-images');

drop policy if exists commercial_menu_images_insert_admin on storage.objects;
create policy commercial_menu_images_insert_admin
on storage.objects
for insert
to authenticated
with check (
  bucket_id = 'commercial-menu-images'
  and (public.is_owner() or public.is_global_manager())
);

drop policy if exists commercial_menu_images_update_admin on storage.objects;
create policy commercial_menu_images_update_admin
on storage.objects
for update
to authenticated
using (
  bucket_id = 'commercial-menu-images'
  and (public.is_owner() or public.is_global_manager())
)
with check (
  bucket_id = 'commercial-menu-images'
  and (public.is_owner() or public.is_global_manager())
);

drop policy if exists commercial_menu_images_delete_admin on storage.objects;
create policy commercial_menu_images_delete_admin
on storage.objects
for delete
to authenticated
using (
  bucket_id = 'commercial-menu-images'
  and (public.is_owner() or public.is_global_manager())
);

create or replace view public.catalog_option_visual_assets
with (security_invoker = true)
as
select
  id,
  site_id,
  asset_key,
  display_name,
  image_url,
  linked_product_id,
  linked_ingredient_product_id,
  option_code,
  normalized_option_name,
  scope,
  is_active,
  metadata,
  created_at,
  updated_at
from pass.catalog_option_visual_assets;

grant select on public.catalog_option_visual_assets to anon, authenticated;
grant insert, update, delete on public.catalog_option_visual_assets to authenticated, service_role;

notify pgrst, 'reload schema';

commit;
