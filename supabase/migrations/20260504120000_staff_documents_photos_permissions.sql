-- Staff documents/photos: granular permissions and employee photo storage.

insert into public.roles (code, name, description)
values (
  'auxiliar_administrativa',
  'Auxiliar administrativa',
  'Apoyo de oficina con permisos administrativos puntuales.'
)
on conflict (code) do update
set name = excluded.name,
    description = excluded.description,
    is_active = true;

insert into public.role_site_type_rules (role, site_type, is_allowed)
values
  ('auxiliar_administrativa', 'admin', true),
  ('auxiliar_administrativa', 'satellite', true),
  ('auxiliar_administrativa', 'production_center', true)
on conflict (role, site_type) do update
set is_allowed = excluded.is_allowed;

insert into public.app_permissions (app_id, code, name, description)
select a.id, p.code, p.name, p.description
from public.apps a
join (
  values
    ('anima', 'documents.view_all', 'Ver documentos de trabajadores', 'Ver documentos de trabajadores dentro del alcance permitido.'),
    ('anima', 'documents.upload', 'Subir documentos de trabajadores', 'Subir documentos laborales desde ANIMA.'),
    ('anima', 'documents.delete', 'Eliminar documentos de trabajadores', 'Eliminar documentos laborales desde ANIMA.'),
    ('anima', 'employee_photos.upload', 'Subir fotos de trabajadores', 'Subir o reemplazar fotos oficiales de trabajadores.'),
    ('viso', 'staff.read', 'Ver trabajadores', 'Ver listado y detalle de trabajadores en VISO.'),
    ('viso', 'staff.manage', 'Gestionar trabajadores', 'Editar datos, sedes, areas, horarios, asistencia y configuraciones operativas de trabajadores.'),
    ('viso', 'staff.documents.manage', 'Gestionar documentos de trabajadores', 'Subir y editar documentos laborales de trabajadores.'),
    ('viso', 'staff.employee_photos.manage', 'Gestionar fotos de trabajadores', 'Subir o reemplazar fotos oficiales de trabajadores.'),
    ('viso', 'staff.permissions.manage', 'Gestionar permisos de trabajadores', 'Asignar permisos puntuales por trabajador.')
) as p(app_code, code, name, description) on p.app_code = a.code
on conflict (app_id, code) do update
set name = excluded.name,
    description = excluded.description,
    is_active = true;

with grants(role, app_code, permission_code, scope_type) as (
  values
    ('propietario', 'anima', 'documents.view_all', 'global'::public.permission_scope_type),
    ('propietario', 'anima', 'documents.upload', 'global'::public.permission_scope_type),
    ('propietario', 'anima', 'documents.delete', 'global'::public.permission_scope_type),
    ('propietario', 'anima', 'employee_photos.upload', 'global'::public.permission_scope_type),
    ('propietario', 'viso', 'staff.read', 'global'::public.permission_scope_type),
    ('propietario', 'viso', 'staff.manage', 'global'::public.permission_scope_type),
    ('propietario', 'viso', 'staff.documents.manage', 'global'::public.permission_scope_type),
    ('propietario', 'viso', 'staff.employee_photos.manage', 'global'::public.permission_scope_type),
    ('propietario', 'viso', 'staff.permissions.manage', 'global'::public.permission_scope_type),
    ('gerente_general', 'anima', 'documents.view_all', 'global'::public.permission_scope_type),
    ('gerente_general', 'anima', 'documents.upload', 'global'::public.permission_scope_type),
    ('gerente_general', 'anima', 'documents.delete', 'global'::public.permission_scope_type),
    ('gerente_general', 'anima', 'employee_photos.upload', 'global'::public.permission_scope_type),
    ('gerente_general', 'viso', 'staff.read', 'global'::public.permission_scope_type),
    ('gerente_general', 'viso', 'staff.manage', 'global'::public.permission_scope_type),
    ('gerente_general', 'viso', 'staff.documents.manage', 'global'::public.permission_scope_type),
    ('gerente_general', 'viso', 'staff.employee_photos.manage', 'global'::public.permission_scope_type),
    ('gerente_general', 'viso', 'staff.permissions.manage', 'global'::public.permission_scope_type),
    ('gerente', 'anima', 'documents.upload', 'site'::public.permission_scope_type),
    ('gerente', 'anima', 'documents.delete', 'site'::public.permission_scope_type),
    ('gerente', 'anima', 'employee_photos.upload', 'site'::public.permission_scope_type),
    ('auxiliar_administrativa', 'viso', 'access', 'global'::public.permission_scope_type),
    ('auxiliar_administrativa', 'viso', 'staff.read', 'global'::public.permission_scope_type),
    ('auxiliar_administrativa', 'viso', 'staff.documents.manage', 'global'::public.permission_scope_type),
    ('auxiliar_administrativa', 'viso', 'staff.employee_photos.manage', 'global'::public.permission_scope_type)
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

insert into public.role_capabilities (role, capability)
values
  ('propietario', 'documents.view_all'),
  ('propietario', 'documents.upload'),
  ('propietario', 'documents.delete'),
  ('propietario', 'employee_photos.upload'),
  ('gerente_general', 'documents.view_all'),
  ('gerente_general', 'documents.upload'),
  ('gerente_general', 'documents.delete'),
  ('gerente_general', 'employee_photos.upload'),
  ('gerente', 'documents.upload'),
  ('gerente', 'documents.delete'),
  ('gerente', 'employee_photos.upload')
on conflict (role, capability) do nothing;

insert into storage.buckets (
  id,
  name,
  public,
  file_size_limit,
  allowed_mime_types
)
values (
  'employee-photos',
  'employee-photos',
  true,
  5242880,
  array['image/jpeg', 'image/png', 'image/webp']
)
on conflict (id) do update
set public = excluded.public,
    file_size_limit = excluded.file_size_limit,
    allowed_mime_types = excluded.allowed_mime_types;

drop policy if exists employee_photos_read on storage.objects;
create policy employee_photos_read
on storage.objects
for select
using (bucket_id = 'employee-photos');

drop policy if exists employee_photos_insert_permission on storage.objects;
create policy employee_photos_insert_permission
on storage.objects
for insert
to authenticated
with check (
  bucket_id = 'employee-photos'
  and (
    public.has_permission('viso.staff.employee_photos.manage')
    or public.has_permission('anima.employee_photos.upload')
  )
);

drop policy if exists employee_photos_update_permission on storage.objects;
create policy employee_photos_update_permission
on storage.objects
for update
to authenticated
using (
  bucket_id = 'employee-photos'
  and (
    public.has_permission('viso.staff.employee_photos.manage')
    or public.has_permission('anima.employee_photos.upload')
  )
)
with check (
  bucket_id = 'employee-photos'
  and (
    public.has_permission('viso.staff.employee_photos.manage')
    or public.has_permission('anima.employee_photos.upload')
  )
);

drop policy if exists employee_photos_delete_permission on storage.objects;
create policy employee_photos_delete_permission
on storage.objects
for delete
to authenticated
using (
  bucket_id = 'employee-photos'
  and (
    public.has_permission('viso.staff.employee_photos.manage')
    or public.has_permission('anima.employee_photos.upload')
  )
);

alter table public.documents enable row level security;

drop policy if exists documents_select_self_or_permission on public.documents;
create policy documents_select_self_or_permission
on public.documents
for select
to authenticated
using (
  owner_employee_id = auth.uid()
  or target_employee_id = auth.uid()
  or (
    site_id is not null
    and exists (
      select 1
      from public.employee_sites es
      where es.employee_id = auth.uid()
        and es.site_id = documents.site_id
        and es.is_active = true
    )
  )
  or public.has_permission('anima.documents.view_all')
  or public.has_permission('viso.staff.documents.manage')
  or exists (
    select 1
    from public.employee_sites target_site
    where target_site.employee_id = documents.target_employee_id
      and target_site.is_active = true
      and public.has_permission('anima.documents.upload', target_site.site_id)
  )
);

drop policy if exists documents_write_restrict_insert_owner_manager on public.documents;
drop policy if exists documents_insert_permission on public.documents;
create policy documents_insert_permission
on public.documents
for insert
to authenticated
with check (
  public.has_permission('viso.staff.documents.manage')
  or public.has_permission('anima.documents.upload', site_id)
  or exists (
    select 1
    from public.employee_sites target_site
    where target_site.employee_id = documents.target_employee_id
      and target_site.is_active = true
      and public.has_permission('anima.documents.upload', target_site.site_id)
  )
);

drop policy if exists documents_write_restrict_update_owner_manager on public.documents;
drop policy if exists documents_update_permission on public.documents;
create policy documents_update_permission
on public.documents
for update
to authenticated
using (
  public.has_permission('viso.staff.documents.manage')
  or public.has_permission('anima.documents.upload', site_id)
  or exists (
    select 1
    from public.employee_sites target_site
    where target_site.employee_id = documents.target_employee_id
      and target_site.is_active = true
      and public.has_permission('anima.documents.upload', target_site.site_id)
  )
)
with check (
  public.has_permission('viso.staff.documents.manage')
  or public.has_permission('anima.documents.upload', site_id)
  or exists (
    select 1
    from public.employee_sites target_site
    where target_site.employee_id = documents.target_employee_id
      and target_site.is_active = true
      and public.has_permission('anima.documents.upload', target_site.site_id)
  )
);

drop policy if exists documents_write_restrict_delete_owner_manager on public.documents;
drop policy if exists documents_delete_permission on public.documents;
create policy documents_delete_permission
on public.documents
for delete
to authenticated
using (
  public.has_permission('viso.staff.documents.manage')
  or public.has_permission('anima.documents.delete', site_id)
  or exists (
    select 1
    from public.employee_sites target_site
    where target_site.employee_id = documents.target_employee_id
      and target_site.is_active = true
      and public.has_permission('anima.documents.delete', target_site.site_id)
  )
);
