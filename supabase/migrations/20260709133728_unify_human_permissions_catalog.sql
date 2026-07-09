alter table public.app_permissions
  add column if not exists human_label text,
  add column if not exists human_description text,
  add column if not exists human_group text,
  add column if not exists human_sort_order integer not null default 1000,
  add column if not exists permission_audience text not null default 'administrative',
  add column if not exists is_operational boolean not null default false,
  add column if not exists requires_active_work_context boolean not null default false;

comment on column public.app_permissions.human_label is 'Etiqueta humana para mostrar en VISO. Ej: Solicitar remisiones.';
comment on column public.app_permissions.human_description is 'Descripcion humana de lo que permite este permiso.';
comment on column public.app_permissions.human_group is 'Grupo humano para organizar permisos en VISO. Ej: Remisiones, Trabajadores, Caja.';
comment on column public.app_permissions.permission_audience is 'Tipo de uso esperado: administrative, operational, shared_device o system.';
comment on column public.app_permissions.is_operational is 'Indica si el permiso pertenece a operacion diaria y puede depender de jornada activa.';
comment on column public.app_permissions.requires_active_work_context is 'Indica si el permiso requiere jornada/turno activo para usuarios personales.';

with catalog(app_code, code, name, description, human_group, human_label, human_description, permission_audience, is_operational, requires_active_work_context, human_sort_order) as (
  values
    ('shell', 'access', 'Entrar al Hub', 'Permite entrar al launcher principal del ecosistema Vento OS.', 'Acceso', 'Entrar al Hub', 'Permite abrir el launcher principal del ecosistema Vento OS.', 'system', false, false, 10),

    ('anima', 'access', 'Entrar a ANIMA', 'Permite entrar a ANIMA para iniciar o cerrar jornada y consultar asistencia.', 'Acceso', 'Entrar a ANIMA', 'Permite abrir ANIMA para iniciar jornada, cerrar jornada y consultar asistencia.', 'operational', false, false, 10),
    ('anima', 'shift.create', 'Crear jornadas o turnos', 'Permite crear jornadas o turnos para trabajadores.', 'Jornadas y turnos', 'Crear jornadas o turnos', 'Permite crear jornadas programadas o flexibles para trabajadores.', 'administrative', false, false, 100),
    ('anima', 'shift.edit', 'Editar jornadas o turnos', 'Permite modificar horarios, sede, area o rol operativo de una jornada.', 'Jornadas y turnos', 'Editar jornadas o turnos', 'Permite corregir o ajustar jornadas existentes.', 'administrative', false, false, 110),
    ('anima', 'shift.cancel', 'Cancelar jornadas o turnos', 'Permite cancelar una jornada o turno creado por error o que ya no aplica.', 'Jornadas y turnos', 'Cancelar jornadas o turnos', 'Permite anular jornadas que no deben ejecutarse.', 'administrative', false, false, 120),
    ('anima', 'team.view', 'Ver equipo', 'Permite ver trabajadores y equipo dentro del alcance asignado.', 'Equipo', 'Ver equipo', 'Permite consultar el equipo de trabajo dentro del alcance permitido.', 'administrative', false, false, 200),
    ('anima', 'team.invite', 'Invitar trabajadores', 'Permite invitar o vincular trabajadores al sistema.', 'Equipo', 'Invitar trabajadores', 'Permite vincular trabajadores nuevos al sistema.', 'administrative', false, false, 210),
    ('anima', 'documents.view_all', 'Ver documentos de trabajadores', 'Permite ver documentos laborales de trabajadores dentro del alcance permitido.', 'Documentos', 'Ver documentos de trabajadores', 'Permite consultar documentos laborales de trabajadores.', 'administrative', false, false, 300),
    ('anima', 'documents.upload', 'Subir documentos de trabajadores', 'Permite cargar documentos laborales desde ANIMA.', 'Documentos', 'Subir documentos de trabajadores', 'Permite cargar documentos laborales a trabajadores.', 'administrative', false, false, 310),
    ('anima', 'documents.delete', 'Eliminar documentos de trabajadores', 'Permite eliminar documentos laborales cargados por error.', 'Documentos', 'Eliminar documentos de trabajadores', 'Permite borrar documentos laborales cuando ya no aplican o fueron cargados por error.', 'administrative', false, false, 320),
    ('anima', 'employee_photos.upload', 'Subir fotos de trabajadores', 'Permite subir o reemplazar fotos oficiales de trabajadores.', 'Fotos de trabajadores', 'Subir fotos de trabajadores', 'Permite subir o reemplazar fotos oficiales de trabajadores.', 'administrative', false, false, 330),

    ('viso', 'access', 'Entrar a VISO', 'Permite entrar a VISO para gestion administrativa y operativa.', 'Acceso', 'Entrar a VISO', 'Permite abrir VISO. Para roles no privilegiados debe requerir jornada activa.', 'administrative', false, true, 10),
    ('viso', 'staff.read', 'Ver trabajadores', 'Permite ver listado y detalle de trabajadores.', 'Trabajadores', 'Ver trabajadores', 'Permite consultar trabajadores, sedes asignadas y datos basicos.', 'administrative', false, true, 100),
    ('viso', 'staff.manage', 'Administrar trabajadores', 'Permite editar datos, sedes, areas, horarios, asistencia y configuraciones operativas.', 'Trabajadores', 'Administrar trabajadores', 'Permite modificar la informacion laboral y operativa de los trabajadores.', 'administrative', false, true, 110),
    ('viso', 'staff.documents.manage', 'Gestionar documentos de trabajadores', 'Permite subir y editar documentos laborales de trabajadores.', 'Trabajadores', 'Gestionar documentos de trabajadores', 'Permite administrar documentos laborales desde VISO.', 'administrative', false, true, 120),
    ('viso', 'staff.employee_photos.manage', 'Gestionar fotos de trabajadores', 'Permite subir o reemplazar fotos oficiales de trabajadores.', 'Trabajadores', 'Gestionar fotos de trabajadores', 'Permite administrar fotos oficiales del equipo.', 'administrative', false, true, 130),
    ('viso', 'staff.permissions.manage', 'Configurar lo que puede hacer cada rol', 'Permite asignar permisos administrativos y operativos a roles.', 'Configuracion de roles', 'Configurar lo que puede hacer cada rol', 'Permite definir de forma humana que puede hacer cada rol en Vento OS.', 'administrative', false, true, 200),
    ('viso', 'site_operational_roles.manage', 'Configurar roles operativos por sede', 'Permite activar o desactivar roles operativos disponibles por sede y area.', 'Configuracion operativa', 'Configurar roles operativos por sede', 'Permite definir que roles operativos existen en cada sede o area.', 'administrative', false, true, 210),
    ('viso', 'employee_operational_profiles.manage', 'Configurar rol operativo de trabajadores', 'Permite asignar rol operativo y puntos de marcacion por trabajador y sede.', 'Configuracion operativa', 'Configurar rol operativo de trabajadores', 'Permite definir el rol operativo habitual de cada trabajador por sede.', 'administrative', false, true, 220),
    ('viso', 'operational_points.manage', 'Configurar puntos de marcacion', 'Permite crear y editar puntos fisicos de check-in y check-out.', 'Configuracion operativa', 'Configurar puntos de marcacion', 'Permite administrar los puntos fisicos donde se inicia o cierra jornada.', 'administrative', false, true, 230),
    ('viso', 'operational_preview.view', 'Probar permisos y navegacion operativa', 'Permite simular navegacion y permisos por app, sede y rol operativo.', 'Auditoria operativa', 'Probar permisos y navegacion operativa', 'Permite revisar como queda la experiencia de un rol antes de operar.', 'administrative', false, true, 300),
    ('viso', 'ops.audit.view', 'Ver auditoria operativa', 'Permite consultar trazabilidad operativa y cambios relevantes.', 'Auditoria operativa', 'Ver auditoria operativa', 'Permite revisar acciones y trazabilidad del sistema.', 'administrative', false, true, 310),
    ('viso', 'app_navigation.manage', 'Configurar pantallas de las apps', 'Permite administrar catalogo, visibilidad y orden de pantallas por app.', 'Configuracion de apps', 'Configurar pantallas de las apps', 'Permite definir que pantallas aparecen en cada aplicacion.', 'administrative', false, true, 400),

    ('nexo', 'access', 'Entrar a NEXO', 'Permite entrar a NEXO para inventario, stock y remisiones.', 'Acceso', 'Entrar a NEXO', 'Permite abrir NEXO. Normalmente requiere jornada activa o dispositivo compartido autorizado.', 'operational', true, true, 10),
    ('nexo', 'inventory.stock', 'Ver stock', 'Permite consultar cantidades disponibles por sede.', 'Inventario', 'Ver stock', 'Permite revisar existencias y disponibilidad por sede.', 'operational', true, true, 100),
    ('nexo', 'inventory.movements', 'Ver movimientos de inventario', 'Permite consultar el historial de movimientos de inventario.', 'Inventario', 'Ver movimientos de inventario', 'Permite revisar entradas, salidas, traslados, ajustes y trazabilidad.', 'operational', true, true, 110),
    ('nexo', 'inventory.withdraw', 'Registrar retiros de inventario', 'Permite retirar insumos o productos desde ubicaciones LOC.', 'Inventario', 'Registrar retiros de inventario', 'Permite descontar inventario usado o retirado desde una ubicacion.', 'operational', true, true, 120),
    ('nexo', 'inventory.transfers', 'Registrar traslados internos', 'Permite mover inventario entre ubicaciones internas.', 'Inventario', 'Registrar traslados internos', 'Permite mover inventario entre ubicaciones LOC o zonas internas.', 'operational', true, true, 130),
    ('nexo', 'inventory.counts', 'Hacer conteos de inventario', 'Permite realizar conteos y ajustes derivados.', 'Inventario', 'Hacer conteos de inventario', 'Permite contar existencias y registrar diferencias.', 'operational', true, true, 140),
    ('nexo', 'inventory.entries', 'Registrar entradas de inventario', 'Permite recibir insumos o productos en inventario.', 'Inventario', 'Registrar entradas de inventario', 'Permite ingresar inventario recibido a una sede o area.', 'operational', true, true, 150),
    ('nexo', 'inventory.locations', 'Ver ubicaciones de inventario', 'Permite consultar ubicaciones fisicas LOC.', 'Inventario', 'Ver ubicaciones de inventario', 'Permite ver o usar ubicaciones fisicas de almacenamiento.', 'operational', true, true, 160),
    ('nexo', 'inventory.remissions', 'Ver remisiones', 'Permite consultar solicitudes y remisiones internas.', 'Remisiones', 'Ver remisiones', 'Permite abrir el modulo de abastecimiento interno y revisar remisiones.', 'operational', true, true, 200),
    ('nexo', 'inventory.remissions.request', 'Solicitar remisiones', 'Permite crear solicitudes de abastecimiento desde una sede.', 'Remisiones', 'Solicitar remisiones', 'Permite pedir productos o insumos desde una sede satelite o punto autorizado.', 'operational', true, true, 210),
    ('nexo', 'inventory.remissions.prepare', 'Preparar remisiones', 'Permite alistar productos solicitados para despacho.', 'Remisiones', 'Preparar remisiones', 'Permite preparar y confirmar cantidades alistadas para enviar.', 'operational', true, true, 220),
    ('nexo', 'inventory.remissions.transit', 'Despachar remisiones', 'Permite marcar una remision como enviada o en transito.', 'Remisiones', 'Despachar remisiones', 'Permite entregar la remision a transporte y moverla a transito.', 'operational', true, true, 230),
    ('nexo', 'inventory.remissions.receive', 'Recibir remisiones', 'Permite recibir y confirmar una remision en la sede destino.', 'Remisiones', 'Recibir remisiones', 'Permite confirmar cantidades recibidas y cerrar abastecimiento.', 'operational', true, true, 240),
    ('nexo', 'inventory.remissions.cancel', 'Cancelar remisiones', 'Permite cancelar solicitudes de remision.', 'Remisiones', 'Cancelar remisiones', 'Permite anular solicitudes o remisiones que no deben continuar.', 'operational', true, true, 250),
    ('nexo', 'inventory.remissions.all_sites', 'Ver remisiones de todas las sedes', 'Permite consultar remisiones de todas las sedes.', 'Remisiones', 'Ver remisiones de todas las sedes', 'Permite una vista global de abastecimiento interno.', 'administrative', true, true, 260),
    ('nexo', 'inventory.remissions.edit_own_pending', 'Editar solicitudes propias pendientes', 'Permite editar una solicitud propia mientras siga pendiente.', 'Remisiones', 'Editar solicitudes propias pendientes', 'Permite corregir una solicitud propia antes de que sea preparada.', 'operational', true, true, 270),

    ('pulso', 'access', 'Entrar a PULSO', 'Permite entrar a PULSO para operar caja y ventas.', 'Acceso', 'Entrar a PULSO', 'Permite abrir PULSO. Normalmente requiere jornada activa o dispositivo compartido autorizado.', 'operational', true, true, 10),
    ('pulso', 'pos.main', 'Operar punto de venta', 'Permite vender, cobrar y operar la caja principal.', 'Caja', 'Operar punto de venta', 'Permite usar el POS para registrar ventas y cobros.', 'operational', true, true, 100),

    ('fogo', 'access', 'Entrar a FOGO', 'Permite entrar a FOGO para recetas y produccion.', 'Acceso', 'Entrar a FOGO', 'Permite abrir FOGO. Normalmente requiere jornada activa o dispositivo compartido autorizado.', 'operational', true, true, 10),
    ('fogo', 'production.recipe_book.view', 'Ver recetario operativo', 'Permite consultar fichas de preparacion publicadas.', 'Recetas', 'Ver recetario operativo', 'Permite consultar recetas aprobadas para producir.', 'operational', true, true, 100),
    ('fogo', 'production.recipes', 'Consultar recetas internas', 'Permite consultar informacion interna de recetas.', 'Recetas', 'Consultar recetas internas', 'Permite ver informacion interna de recetas y preparaciones.', 'operational', true, true, 110),
    ('fogo', 'production.recipes.manage', 'Gestionar recetas', 'Permite crear, editar, publicar y archivar recetas.', 'Recetas', 'Gestionar recetas', 'Permite administrar recetas y fichas tecnicas.', 'administrative', true, true, 120),
    ('fogo', 'production.batches', 'Ver produccion', 'Permite consultar lotes y produccion.', 'Produccion', 'Ver produccion', 'Permite abrir el modulo de produccion.', 'operational', true, true, 200),
    ('fogo', 'production.batches.view', 'Ver lotes de produccion', 'Permite consultar lotes de produccion creados.', 'Produccion', 'Ver lotes de produccion', 'Permite consultar produccion registrada.', 'operational', true, true, 210),
    ('fogo', 'production.batches.create', 'Crear lotes de produccion', 'Permite registrar produccion real desde recetas publicadas.', 'Produccion', 'Crear lotes de produccion', 'Permite producir un lote y registrar consumo de ingredientes.', 'operational', true, true, 220),
    ('fogo', 'production.orders', 'Ver ordenes de produccion', 'Permite consultar ordenes de produccion.', 'Produccion', 'Ver ordenes de produccion', 'Permite consultar ordenes o solicitudes de produccion.', 'operational', true, true, 230),

    ('origo', 'access', 'Entrar a ORIGO', 'Permite entrar a ORIGO para compras y proveedores.', 'Acceso', 'Entrar a ORIGO', 'Permite abrir ORIGO para compras, proveedores y recepciones.', 'operational', true, true, 10),
    ('origo', 'procurement.purchase_orders', 'Ver ordenes de compra', 'Permite consultar ordenes de compra.', 'Compras', 'Ver ordenes de compra', 'Permite consultar ordenes de compra registradas.', 'operational', true, true, 100),
    ('origo', 'procurement.receipts', 'Registrar recepciones de compra', 'Permite recibir compras y registrar entradas.', 'Compras', 'Registrar recepciones de compra', 'Permite recibir productos comprados y registrar su entrada.', 'operational', true, true, 110),
    ('origo', 'suppliers.view', 'Ver proveedores', 'Permite consultar proveedores.', 'Proveedores', 'Ver proveedores', 'Permite consultar proveedores registrados.', 'administrative', false, true, 200),
    ('origo', 'suppliers.manage', 'Gestionar proveedores', 'Permite crear y modificar proveedores.', 'Proveedores', 'Gestionar proveedores', 'Permite administrar informacion de proveedores.', 'administrative', false, true, 210)
)
insert into public.app_permissions (
  app_id,
  code,
  name,
  description,
  human_label,
  human_description,
  human_group,
  permission_audience,
  is_operational,
  requires_active_work_context,
  human_sort_order
)
select
  apps.id,
  catalog.code,
  catalog.name,
  catalog.description,
  catalog.human_label,
  catalog.human_description,
  catalog.human_group,
  catalog.permission_audience,
  catalog.is_operational,
  catalog.requires_active_work_context,
  catalog.human_sort_order
from catalog
join public.apps on apps.code = catalog.app_code
on conflict (app_id, code) do update
set name = excluded.name,
    description = excluded.description,
    human_label = excluded.human_label,
    human_description = excluded.human_description,
    human_group = excluded.human_group,
    permission_audience = excluded.permission_audience,
    is_operational = excluded.is_operational,
    requires_active_work_context = excluded.requires_active_work_context,
    human_sort_order = excluded.human_sort_order,
    is_active = true,
    updated_at = now();

with capability_map(capability, app_code, permission_code) as (
  values
    ('shift.create', 'anima', 'shift.create'),
    ('shift.edit', 'anima', 'shift.edit'),
    ('shift.cancel', 'anima', 'shift.cancel'),
    ('team.view', 'anima', 'team.view'),
    ('team.invite', 'anima', 'team.invite'),
    ('documents.view_all', 'anima', 'documents.view_all'),
    ('documents.upload', 'anima', 'documents.upload'),
    ('documents.delete', 'anima', 'documents.delete'),
    ('employee_photos.upload', 'anima', 'employee_photos.upload')
)
insert into public.role_permissions (role, permission_id, scope_type, is_allowed)
select
  rc.role,
  ap.id,
  'global'::public.permission_scope_type,
  true
from public.role_capabilities rc
join capability_map cm on cm.capability = rc.capability
join public.apps a on a.code = cm.app_code
join public.app_permissions ap on ap.app_id = a.id and ap.code = cm.permission_code
where not exists (
  select 1
  from public.role_permissions rp
  where rp.role = rc.role
    and rp.permission_id = ap.id
    and rp.scope_type = 'global'::public.permission_scope_type
    and rp.scope_site_id is null
    and rp.scope_area_id is null
    and rp.scope_site_type is null
    and rp.scope_area_kind is null
);

comment on table public.role_capabilities is 'LEGACY: capacidades antiguas de ANIMA/VISO. La fuente de verdad nueva es app_permissions + role_permissions + operational_role_permissions.';

create or replace view public.permission_catalog_human_v1 as
select
  ap.id,
  a.code as app_code,
  ap.code,
  (a.code || '.' || ap.code) as full_code,
  coalesce(nullif(ap.human_label, ''), nullif(ap.name, ''), ap.code) as label,
  coalesce(nullif(ap.human_description, ''), nullif(ap.description, ''), 'Define que puede hacer este rol dentro de Vento OS.') as description,
  coalesce(nullif(ap.human_group, ''), 'General') as group_label,
  ap.permission_audience,
  ap.is_operational,
  ap.requires_active_work_context,
  ap.human_sort_order,
  ap.is_active,
  ap.created_at,
  ap.updated_at
from public.app_permissions ap
join public.apps a on a.id = ap.app_id;

comment on view public.permission_catalog_human_v1 is 'Catalogo humano unificado de permisos para VISO. No usar role_capabilities para nuevas pantallas.';
