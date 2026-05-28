begin;

insert into public.app_permissions (app_id, code, name, description)
select a.id, 'menu.images.manage', 'Gestionar imágenes del menú comercial', 'Subir y modificar fotos de productos del menú comercial en VISO.'
from public.apps a
where a.code = 'viso'
on conflict (app_id, code) do update
set name = excluded.name,
    description = excluded.description,
    is_active = true;

with grants(role, app_code, permission_code, scope_type) as (
  values
    ('propietario', 'viso', 'menu.images.manage', 'global'::public.permission_scope_type),
    ('gerente_general', 'viso', 'menu.images.manage', 'global'::public.permission_scope_type),
    ('auxiliar_administrativa', 'viso', 'menu.images.manage', 'global'::public.permission_scope_type)
)
insert into public.role_permissions (role, permission_id, scope_type)
select g.role, ap.id, g.scope_type
from grants g
join public.apps a on a.code = g.app_code
join public.app_permissions ap on ap.app_id = a.id and ap.code = g.permission_code
where not exists (
  select 1
  from public.role_permissions rp
  where rp.role = g.role
    and rp.permission_id = ap.id
    and rp.scope_type = g.scope_type
    and rp.scope_site_type is null
    and rp.scope_area_kind is null
);

drop policy if exists "product_images_insert" on storage.objects;
create policy "product_images_insert"
on storage.objects
for insert
to authenticated
with check (
  bucket_id = 'product-images'
  and public.has_permission('viso.menu.images.manage')
);

drop policy if exists "product_images_update" on storage.objects;
create policy "product_images_update"
on storage.objects
for update
to authenticated
using (
  bucket_id = 'product-images'
  and public.has_permission('viso.menu.images.manage')
)
with check (
  bucket_id = 'product-images'
  and public.has_permission('viso.menu.images.manage')
);

create or replace function pass.update_catalog_item_image(
  p_item_id uuid,
  p_image_url text
)
returns void
language plpgsql
security definer
set search_path = pass, public
as $$
declare
  v_image_url text;
begin
  if not public.has_permission('viso.menu.images.manage') then
    raise exception 'permission_denied'
      using errcode = '42501';
  end if;

  v_image_url := nullif(trim(coalesce(p_image_url, '')), '');

  update pass.catalog_items
  set image_url = v_image_url,
      updated_at = now()
  where id = p_item_id;

  if not found then
    raise exception 'catalog_item_not_found'
      using errcode = 'P0002';
  end if;
end;
$$;

alter function pass.update_catalog_item_image(uuid, text) owner to postgres;
grant execute on function pass.update_catalog_item_image(uuid, text) to authenticated, service_role;

commit;
