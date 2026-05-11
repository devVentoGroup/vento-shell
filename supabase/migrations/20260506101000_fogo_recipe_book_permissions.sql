begin;

insert into public.app_permissions (app_id, code, name, description)
select a.id, v.code, v.name, v.description
from public.apps a
cross join (
  values
    ('production.recipes.manage', 'Gestionar recetas', 'Crear, editar, publicar y archivar recetas de produccion'),
    ('production.recipe_book.view', 'Consultar recetario', 'Ver el recetario operativo publicado por sede y area'),
    ('production.batches.create', 'Crear lotes de produccion', 'Crear lotes desde recetas publicadas y preparar consumo de ingredientes'),
    ('production.batches.view', 'Consultar lotes de produccion', 'Consultar lotes de produccion por sede y area')
) as v(code, name, description)
where a.code = 'fogo'
on conflict (app_id, code) do update
set
  name = excluded.name,
  description = excluded.description,
  is_active = true;

-- Gerencia global: todo FOGO.
insert into public.role_permissions (role, permission_id, scope_type)
select r.role, ap.id, 'global'::public.permission_scope_type
from public.app_permissions ap
join public.apps a on a.id = ap.app_id
join (values ('propietario'), ('gerente_general')) as r(role) on true
where a.code = 'fogo'
  and ap.code in (
    'production.recipes.manage',
    'production.recipe_book.view',
    'production.batches.create',
    'production.batches.view'
  )
on conflict do nothing;

-- Gerencia de sede: gestiona y opera solo en sus sedes.
insert into public.role_permissions (role, permission_id, scope_type)
select 'gerente', ap.id, 'site'::public.permission_scope_type
from public.app_permissions ap
join public.apps a on a.id = ap.app_id
where a.code = 'fogo'
  and ap.code in (
    'production.recipes.manage',
    'production.recipe_book.view',
    'production.batches.create',
    'production.batches.view'
  )
on conflict do nothing;

-- Roles operativos de centro de produccion: consultar y producir por su area/sede.
insert into public.role_permissions (role, permission_id, scope_type, scope_site_type)
select r.role, ap.id, 'site_type'::public.permission_scope_type, 'production_center'::public.site_type
from public.app_permissions ap
join public.apps a on a.id = ap.app_id
join (
  values
    ('cocinero'),
    ('panadero'),
    ('repostero'),
    ('pastelero')
) as r(role) on true
where a.code = 'fogo'
  and ap.code in ('production.recipe_book.view', 'production.batches.create', 'production.batches.view')
on conflict do nothing;

-- Bodega de centro de produccion puede consultar/crear lotes, pero no administrar recetas.
insert into public.role_permissions (role, permission_id, scope_type, scope_site_type)
select 'bodeguero', ap.id, 'site_type'::public.permission_scope_type, 'production_center'::public.site_type
from public.app_permissions ap
join public.apps a on a.id = ap.app_id
where a.code = 'fogo'
  and ap.code in ('production.recipe_book.view', 'production.batches.create', 'production.batches.view')
on conflict do nothing;

commit;
