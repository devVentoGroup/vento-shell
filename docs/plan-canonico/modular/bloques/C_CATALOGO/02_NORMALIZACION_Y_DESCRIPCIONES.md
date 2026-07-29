### SECCIÓN — NORMALIZACIÓN Y DESCRIPCIONES

<!-- PLAN-SECTION-META:START -->
Esta sección reúne contenido canónico con una responsabilidad documental única dentro del plan. Debe conservarse cohesionada y actualizarse junto con sus referencias y validaciones dependientes.

**Cobertura canónica:** `AUTH-CAT-003` a `AUTH-CAT-005` — 3 tareas.
<!-- PLAN-SECTION-META:END -->

### ✅ AUTH-CAT-003 — Normalizar códigos de permisos con la convención aprobada

#### 1. Estado de implementación

#### 2. Objetivo

Aplicar la convención aprobada:

`<app>.access`

o:

`<app>.<module>.<resource>.<action>`

sobre todo el catálogo actual.

Cada código existente quedará clasificado como:

KEEP
RENAME
MERGE_CANDIDATE
DECOMPOSE_REQUIRED
RETIRE_TECHNICAL

#### 3. Resultado general

Permisos legacy analizados:

177

Distribución:

| Resolución         | Permisos actuales |
| ------------------ | ----------------- |
| KEEP               | 17                |
| RENAME             | 71                |
| MERGE_CANDIDATE    | 54                |
| DECOMPOSE_REQUIRED | 21                |
| RETIRE_TECHNICAL   | 14                |
| Total              | 177               |

Interpretación:

17
→ ya cumplen la convención

71
→ tienen una equivalencia canónica individual

54
→ apuntan a capacidades compartidas con otros códigos legacy

21
→ son permisos demasiado amplios y deben dividirse

14
→ representan rutas, pantallas o infraestructura técnica

El número definitivo de permisos canónicos activos no se cierra todavía porque:

MERGE_CANDIDATE
→ puede reducir varios códigos a uno

DECOMPOSE_REQUIRED
→ puede convertir un código en varias capacidades

Ese cierre corresponde a:

AUTH-CAT-004

y a los inventarios funcionales de cada aplicación.

#### 4. Estados de resolución

4.1 KEEP

El código ya cumple la convención y conserva su identidad.

Ejemplo:

nexo.inventory.remissions.request
4.2 RENAME

Existe una equivalencia funcional individual suficientemente clara.

Ejemplo:

anima.shift.edit
    ↓
anima.attendance.shifts.update

El código legacy podrá convertirse temporalmente en alias.

4.3 MERGE_CANDIDATE

Dos o más códigos actuales parecen representar la misma capacidad canónica.

Ejemplo:

nexo.stock.view
nexo.inventory.stock
    ↓
nexo.inventory.stock.view

AUTH-CAT-003 define el destino común.

AUTH-CAT-004 decidirá:

qué registros se desactivan;
qué aliases se conservan;
qué asignaciones se consolidan;
qué consumidor utiliza cada código.
4.4 DECOMPOSE_REQUIRED

El permiso legacy representa varias acciones independientes.

Ejemplo:

viso.staff.manage

No puede convertirse de manera segura en un único permiso como:

viso.workforce.employees.update

porque podría incluir además:

view
create
activate
deactivate

Regla:

UN PERMISO LEGACY AMPLIO
NO SE CONVIERTE EN UN ALIAS
QUE AMPLÍE AUTORIDAD

Estos permisos no tendrán alias automático uno a uno.

4.5 RETIRE_TECHNICAL

El código representa:

una ruta;
una pantalla;
un archivo;
un segmento dinámico;
login;
sin acceso;
navegación técnica.

No tendrá equivalente canónico independiente.

La superficie correspondiente deberá consumir uno o más permisos funcionales.

#### 5. Acciones canónicas incorporadas

Además de las acciones ya definidas en AUTH-CAT-002, esta normalización registra explícitamente:

register

Registrar una transacción o evento empresarial validado.

Ejemplos:

nexo.inventory.entries.register
nexo.inventory.withdrawals.register

No equivale simplemente a insertar una fila.

Representa completar la operación empresarial.

perform

Ejecutar un procedimiento operativo estructurado.

Ejemplos:

nexo.inventory.stock_counts.perform
nexo.inventory.stock_validations.perform

Se utiliza cuando:

create

solo describiría la creación del registro técnico, pero no la ejecución del procedimiento.

generate

Generar un documento o resultado derivado de información existente.

Ejemplo:

nexo.finance.internal_invoices.generate

Se diferencia de:

create
issue

#### 6. Regla para aliases

Solo podrán convertirse directamente en aliases los estados:

RENAME
MERGE_CANDIDATE

No podrán tener alias automático:

DECOMPOSE_REQUIRED
RETIRE_TECHNICAL

Modelo:

legacy key
    ↓
una única canonical key

Prohibido:

legacy manage
    ↓
varios permisos canónicos concedidos automáticamente

#### 7. ANIMA — 10 permisos

Resultado
KEEP        1
RENAME      9
TOTAL      10

| Código actual                | Resolución | Código canónico                           |
| ---------------------------- | ---------- | ----------------------------------------- |
| anima.access                 | KEEP       | anima.access                              |
| anima.documents.delete       | RENAME     | anima.workforce.employee_documents.delete |
| anima.documents.upload       | RENAME     | anima.workforce.employee_documents.upload |
| anima.documents.view_all     | RENAME     | anima.workforce.employee_documents.view   |
| anima.employee_photos.upload | RENAME     | anima.workforce.employee_photos.upload    |
| anima.shift.cancel           | RENAME     | anima.attendance.shifts.cancel            |
| anima.shift.create           | RENAME     | anima.attendance.shifts.create            |
| anima.shift.edit             | RENAME     | anima.attendance.shifts.update            |
| anima.team.invite            | RENAME     | anima.workforce.staff_invitations.create  |
| anima.team.view              | RENAME     | anima.workforce.team_members.view         |

Decisiones
Documentos
documents
→ workforce.employee_documents

El alcance all desaparece del código.

La cobertura se definirá después mediante el alcance del permiso.

Turnos
shift
→ attendance.shifts

La acción:

edit
→ update
Equipo

Se distinguen:

team_members
staff_invitations

porque consultar trabajadores e invitarlos son capacidades diferentes.

#### 8. AURA — 1 permiso

| Código actual | Resolución | Código canónico |
| ------------- | ---------- | --------------- |
| aura.access   | KEEP       | aura.access     |

AURA permanece:

activa en catálogo
+
diferida dentro del roadmap

No se crean capacidades adicionales hasta auditar su producto y repositorio.

#### 9. FOGO — 8 permisos

Resultado
KEEP                  4
RENAME                1
MERGE_CANDIDATE       2
DECOMPOSE_REQUIRED    1
TOTAL                  8

| Código actual                    | Resolución         | Código canónico                   |
| -------------------------------- | ------------------ | --------------------------------- |
| fogo.access                      | KEEP               | fogo.access                       |
| fogo.production.batches          | MERGE_CANDIDATE    | fogo.production.batches.view      |
| fogo.production.batches.create   | KEEP               | fogo.production.batches.create    |
| fogo.production.batches.view     | KEEP               | fogo.production.batches.view      |
| fogo.production.orders           | RENAME             | fogo.production.orders.view       |
| fogo.production.recipe_book.view | KEEP               | fogo.production.recipe_book.view  |
| fogo.production.recipes          | MERGE_CANDIDATE    | fogo.production.recipes.view      |
| fogo.production.recipes.manage   | DECOMPOSE_REQUIRED | Familia fogo.production.recipes.* |

Descomposición requerida

fogo.production.recipes.manage deberá reemplazarse, como mínimo, por las acciones que realmente existan:

fogo.production.recipes.view
fogo.production.recipes.create
fogo.production.recipes.update
fogo.production.recipes.archive

La lista final dependerá de las operaciones reales de FOGO.

No se creará un alias que conceda todas esas capacidades automáticamente.

#### 10. NEXO — 111 permisos

Resultado
KEEP                  5
RENAME               35
MERGE_CANDIDATE      52
DECOMPOSE_REQUIRED    7
RETIRE_TECHNICAL     12
TOTAL                111
10.1 Permisos que se conservan

| Código actual                     | Código canónico                   |
| --------------------------------- | --------------------------------- |
| nexo.access                       | nexo.access                       |
| nexo.inventory.remissions.request | nexo.inventory.remissions.request |
| nexo.inventory.remissions.prepare | nexo.inventory.remissions.prepare |
| nexo.inventory.remissions.receive | nexo.inventory.remissions.receive |
| nexo.inventory.remissions.cancel  | nexo.inventory.remissions.cancel  |

10.2 Catálogo
Productos

Los siguientes códigos convergen en:

nexo.catalog.products.view

Códigos legacy:

nexo.catalog.view
nexo.ficha.view
nexo.products.view
nexo.catalog.products
nexo.inventory_catalog_id.view
nexo.inventory_catalog.view

Creación:

nexo.inventory_catalog_new.view
    ↓
nexo.catalog.products.create
Presentaciones

Convergen en:

nexo.catalog.presentations.view

Códigos legacy:

nexo.presentations.view
nexo.inventory_catalog_id_presentations.view
nexo.inventory_catalog_presentations.view
Políticas de solicitud

Convergen en:

nexo.catalog.request_policies.view

Códigos legacy:

nexo.request_policies.view
nexo.inventory_catalog_id_request_policies.view
nexo.inventory_settings_request_policies.view
Categorías
nexo.categories.view
    ↓
nexo.catalog.categories.view

El permiso amplio:

nexo.settings.categories.manage

deberá descomponerse en las acciones reales, potencialmente:

nexo.catalog.categories.view
nexo.catalog.categories.create
nexo.catalog.categories.update
nexo.catalog.categories.activate
nexo.catalog.categories.deactivate
Unidades
nexo.units.view
    ↓
nexo.catalog.units.view

El permiso:

nexo.settings.units.manage

requiere descomposición en acciones concretas.

10.3 Activos
nexo.assets.view
nexo.inventory_assets_items_id.view
    ↓
nexo.assets.items.view
nexo.inventory_assets_new.view
    ↓
nexo.assets.items.create
nexo.inventory_assets_groups_id.view
    ↓
nexo.assets.groups.view
nexo.inventory_assets_counts_id.view
    ↓
nexo.assets.counts.view
10.4 Inventario — consultas
Ajustes
nexo.adjust.view
    ↓
nexo.inventory.adjustments.view
Entradas
nexo.entries.view
    ↓
nexo.inventory.entries.view
Ubicaciones

Convergen en:

nexo.inventory.locations.view

Códigos legacy:

nexo.locations.view
nexo.inventory.locations
nexo.inventory_locations_id.view
LPN

Convergen en:

nexo.inventory.lpns.view

Códigos legacy:

nexo.lpns.view
nexo.inventory.lpns
Movimientos

Convergen en:

nexo.inventory.movements.view

Códigos legacy:

nexo.movements.view
nexo.inventory.movements
Stock

Convergen en:

nexo.inventory.stock.view

Códigos legacy:

nexo.stock.view
nexo.inventory.stock
Lotes de producción reflejados en inventario

Convergen en:

nexo.inventory.production_batches.view

Códigos legacy:

nexo.production_batches.view
nexo.inventory.production_batches
Traslados
nexo.transfers.view
    ↓
nexo.inventory.transfers.view
Retiros
nexo.withdraw.view
    ↓
nexo.inventory.withdrawals.view
Zonas

Convergen en:

nexo.inventory.zones.view

Códigos legacy:

nexo.zone.view
nexo.zones.view
Posiciones
nexo.positions.view
    ↓
nexo.inventory.storage_positions.view
Operación de bodega
nexo.warehouse.view
    ↓
nexo.inventory.warehouse_operations.view
10.5 Inventario — acciones
Registrar ajuste
nexo.inventory.adjustments
    ↓
nexo.inventory.adjustments.register
Ejecutar conteo
nexo.inventory.counts
    ↓
nexo.inventory.stock_counts.perform

Consulta de conteos:

nexo.counts.view
    ↓
nexo.inventory.stock_counts.view
Conteo inicial

Convergen en:

nexo.inventory.initial_counts.view

Códigos legacy:

nexo.count_initial.view
nexo.inventory_count_initial_session_id.view
Registrar entrada
nexo.inventory.entries
    ↓
nexo.inventory.entries.register
Entrada excepcional
nexo.inventory.entries_emergency
    ↓
nexo.inventory.entries.override

override deberá conservar:

justificación;
auditoría;
actor;
motivo;
controles adicionales.
Crear traslado
nexo.inventory.transfers
    ↓
nexo.inventory.transfers.create
Ejecutar validación
nexo.inventory.validation
    ↓
nexo.inventory.stock_validations.perform
Registrar retiro

Convergen en:

nexo.inventory.withdrawals.register

Códigos legacy:

nexo.inventory.withdraw
nexo.kiosk_withdraw.view
Asignar ubicación
nexo.assign_location.view
    ↓
nexo.inventory.location_assignments.assign
Configurar catálogo de ubicación
nexo.inventory_settings_locations_id_catalog.view
    ↓
nexo.inventory.location_catalog.update
10.6 Remisiones
Consulta

Convergen en:

nexo.inventory.remissions.view

Códigos legacy:

nexo.inventory.remissions
nexo.inventory.remissions.all_sites
nexo.inventory.remissions.view_dispatch
nexo.inventory_remissions_id.view
nexo.inventory_remissions.view

Reglas:

all_sites
→ se elimina del código
→ se resolverá mediante alcance

view_dispatch
→ no será otra capacidad de consulta
→ la vista de despacho consume permisos funcionales
Actualización
nexo.inventory.remissions.edit_own_pending
    ↓
nexo.inventory.remissions.update

Las condiciones:

own
pending

se trasladan al contrato del recurso.

Preparación

Convergen en:

nexo.inventory.remissions.prepare

Códigos legacy:

nexo.inventory.remissions.prepare
nexo.prepare.view
Recepción

Convergen en:

nexo.inventory.remissions.receive

Códigos legacy:

nexo.inventory.remissions.receive
nexo.receive.view
Tránsito y despacho

Convergen en:

nexo.inventory.remissions.dispatch

Códigos legacy:

nexo.inventory.remissions.transit
nexo.transit.view

Decisión:

transit
→ describe estado ambiguo

dispatch
→ describe la acción empresarial
   que inicia la salida o tránsito

El estado posterior podrá continuar llamándose:

in_transit

sin que el permiso se llame transit.

Solicitud

Se conserva:

nexo.inventory.remissions.request
Cancelación

Se conserva:

nexo.inventory.remissions.cancel
10.7 Logística
nexo.board.view
    ↓
nexo.logistics.operations_board.view
nexo.operations.view
    ↓
nexo.logistics.operations.view
nexo.conductor.view
    ↓
nexo.logistics.driver_operations.view
nexo.fulfillment.view
    ↓
nexo.logistics.fulfillment.view
nexo.fulfillment_routes.view
    ↓
nexo.logistics.fulfillment_routes.view
nexo.supply_routes.view
    ↓
nexo.logistics.supply_routes.view

El permiso:

nexo.settings.supply_routes.manage

requiere descomposición en capacidades concretas sobre:

nexo.logistics.supply_routes.*
10.8 Finanzas internas de NEXO

Esta tarea conserva la aplicación propietaria actual.

No mueve automáticamente estas capacidades a NUMERA.

Facturas internas
nexo.internal_invoices.view
    ↓
nexo.finance.internal_invoices.view
nexo.internal_invoices.generate
    ↓
nexo.finance.internal_invoices.generate
nexo.internal_invoices.issue
    ↓
nexo.finance.internal_invoices.issue
nexo.internal_invoices.cancel
    ↓
nexo.finance.internal_invoices.cancel

Consulta sensible de valores:

nexo.internal_invoices.view_amounts
    ↓
nexo.finance.internal_invoice_amounts.view
Precios internos
nexo.internal_prices.view
    ↓
nexo.finance.internal_prices.view
nexo.internal_prices.manage
    ↓
DECOMPOSE_REQUIRED

Familia esperada:

nexo.finance.internal_prices.view
nexo.finance.internal_prices.create
nexo.finance.internal_prices.update
nexo.finance.internal_prices.activate
nexo.finance.internal_prices.deactivate
Variaciones internas
nexo.internal_variances.view
    ↓
nexo.finance.internal_variances.view
nexo.internal_variances.approve
    ↓
nexo.finance.internal_variances.approve
nexo.internal_variances.resolve
    ↓
nexo.finance.internal_variances.resolve
Centros de costo

Convergen en:

nexo.finance.cost_centers.view

Códigos legacy:

nexo.cost_center.view
nexo.cost_centers.view

El permiso:

nexo.cost_centers.manage

requiere descomposición.

10.9 Analítica
nexo.internal_reports.view
    ↓
nexo.analytics.internal_reports.view
nexo.internal_reports.full_margin
    ↓
nexo.analytics.margin_reports.view

full_margin deja de ser una acción y se convierte en un recurso sensible específico.

10.10 Impresión

Convergen en:

nexo.printing.templates.update

Códigos legacy:

nexo.designer.view
nexo.printing.designer

Convergen en:

nexo.printing.jobs.view

Códigos legacy:

nexo.jobs.view
nexo.printing.jobs
10.11 Configuración
Sedes
nexo.sites.view
    ↓
nexo.settings.sites.view
nexo.settings.sites.manage
    ↓
DECOMPOSE_REQUIRED
Políticas de remisiones
nexo.inventory_settings_remissions.view
    ↓
nexo.settings.remission_policies.view
nexo.settings.remissions.manage
    ↓
DECOMPOSE_REQUIRED

Familia esperada:

nexo.settings.remission_policies.view
nexo.settings.remission_policies.update

Podrán agregarse otras acciones únicamente si existen operaciones distintas.

10.12 Permisos técnicos que se retiran

Los siguientes 12 códigos no tendrán un permiso canónico equivalente:

nexo.code.view
nexo.edit.view
nexo.login.view
nexo.new.view
nexo.no_access.view
nexo.open.view
nexo.page_tsx.view
nexo.quick.view
nexo.scanner.view
nexo.settings.view
nexo.setup.view
nexo.slug.view

Motivos:

| Código         | Motivo                                                                  |
| -------------- | ----------------------------------------------------------------------- |
| code.view      | Segmento técnico sin recurso empresarial                                |
| edit.view      | Estado de interfaz                                                      |
| login.view     | Infraestructura de autenticación                                        |
| new.view       | Ruta de creación                                                        |
| no_access.view | Pantalla de error                                                       |
| open.view      | Acción de interfaz ambigua                                              |
| page_tsx.view  | Nombre de archivo                                                       |
| quick.view     | Ruta o variante de interfaz sin capacidad definida                      |
| scanner.view   | Herramienta de interfaz; debe usar el permiso de la operación escaneada |
| settings.view  | Contenedor de navegación                                                |
| setup.view     | Flujo técnico genérico                                                  |
| slug.view      | Segmento dinámico                                                       |

Regla para escáner:

ESCANEAR UNA REMISIÓN PARA RECIBIR
→ requiere remissions.receive

ESCANEAR UN LPN PARA CONSULTAR
→ requiere lpns.view

ESCANEAR PARA RETIRAR
→ requiere withdrawals.register

No existe un permiso global:

scanner.view

#### 11. NUMERA — 8 permisos

Resultado
KEEP                  1
RENAME                5
DECOMPOSE_REQUIRED    2
TOTAL                  8

| Código actual              | Resolución         | Código canónico                         |
| -------------------------- | ------------------ | --------------------------------------- |
| numera.access              | KEEP               | numera.access                           |
| numera.break_even.view     | RENAME             | numera.analytics.break_even.view        |
| numera.cost_centers.view   | RENAME             | numera.finance.cost_centers.view        |
| numera.expenses.view       | RENAME             | numera.finance.expenses.view            |
| numera.profitability.view  | RENAME             | numera.analytics.profitability.view     |
| numera.reports.view        | RENAME             | numera.analytics.financial_reports.view |
| numera.cost_centers.manage | DECOMPOSE_REQUIRED | Familia numera.finance.cost_centers.*   |
| numera.expenses.manage     | DECOMPOSE_REQUIRED | Familia numera.finance.expenses.*       |

Familias de descomposición

Centros de costo:

numera.finance.cost_centers.view
numera.finance.cost_centers.create
numera.finance.cost_centers.update
numera.finance.cost_centers.activate
numera.finance.cost_centers.deactivate

Gastos:

numera.finance.expenses.view
numera.finance.expenses.create
numera.finance.expenses.update
numera.finance.expenses.approve
numera.finance.expenses.cancel

La lista final se validará contra las operaciones reales de NUMERA.

#### 12. ORIGO — 8 permisos

Resultado
KEEP                  1
RENAME                4
DECOMPOSE_REQUIRED    1
RETIRE_TECHNICAL      2
TOTAL                  8

| Código actual                     | Resolución         | Código canónico                        |
| --------------------------------- | ------------------ | -------------------------------------- |
| origo.access                      | KEEP               | origo.access                           |
| origo.procurement.purchase_orders | RENAME             | origo.procurement.purchase_orders.view |
| origo.procurement.receipts        | RENAME             | origo.procurement.receipts.view        |
| origo.product_master_review.view  | RENAME             | origo.catalog.product_reviews.view     |
| origo.suppliers.view              | RENAME             | origo.procurement.suppliers.view       |
| origo.suppliers.manage            | DECOMPOSE_REQUIRED | Familia origo.procurement.suppliers.*  |
| origo.login.view                  | RETIRE_TECHNICAL   | Sin equivalente                        |
| origo.no_access.view              | RETIRE_TECHNICAL   | Sin equivalente                        |

Proveedores

La familia deberá dividirse según las operaciones existentes:

origo.procurement.suppliers.view
origo.procurement.suppliers.create
origo.procurement.suppliers.update
origo.procurement.suppliers.activate
origo.procurement.suppliers.deactivate

#### 13. Vento Pass — 1 permiso

| Código actual | Resolución | Código canónico |
| ------------- | ---------- | --------------- |
| pass.access   | KEEP       | pass.access     |

Regla:

pass.access

dentro del catálogo laboral no autoriza la sesión normal del cliente.

El cliente de Vento Pass continuará perteneciendo al dominio:

public.users

El significado laboral exacto de pass.access deberá confirmarse antes de asignarlo a nuevas matrices.

#### 14. PULSO — 3 permisos

Resultado
KEEP                  1
RENAME                1
DECOMPOSE_REQUIRED    1
TOTAL                  3

| Código actual           | Resolución         | Código canónico                    |
| ----------------------- | ------------------ | ---------------------------------- |
| pulso.access            | KEEP               | pulso.access                       |
| pulso.delivery.override | RENAME             | pulso.delivery.deliveries.override |
| pulso.pos.main          | DECOMPOSE_REQUIRED | Sin equivalencia individual        |

pulso.pos.main

pos.main representa una pantalla principal y no una capacidad empresarial.

No tendrá alias directo.

Deberá descomponerse después de inventariar las operaciones reales de PULSO.

Familias esperadas:

pulso.sales.orders.view
pulso.sales.orders.create
pulso.sales.orders.update
pulso.sales.orders.cancel

pulso.payments.transactions.collect
pulso.payments.transactions.refund

pulso.cash.sessions.start
pulso.cash.sessions.close

pulso.loyalty.points.accumulate
pulso.loyalty.points.redeem

Esta lista es estructural y no concede todavía dichas capacidades.

La lista definitiva se cerrará en las tareas PULSO-AUTH.

#### 15. SHELL — 1 permiso

| Código actual | Resolución | Código canónico |
| ------------- | ---------- | --------------- |
| shell.access  | KEEP       | shell.access    |

El permiso controla la entrada al Hub Vento OS.

No controla:

migraciones;
paquetes compartidos;
contratos;
infraestructura de vento-shell.

#### 16. VISO — 26 permisos

Resultado
KEEP                  1
RENAME               16
DECOMPOSE_REQUIRED    9
TOTAL                 26
16.1 Permisos que conservan o reciben equivalencia individual

| Código actual                   | Resolución | Código canónico                             |
| ------------------------------- | ---------- | ------------------------------------------- |
| viso.access                     | KEEP       | viso.access                                 |
| viso.accounting.view            | RENAME     | viso.finance.accounting.view                |
| viso.app_updates.read           | RENAME     | viso.platform.app_updates.view              |
| viso.businesses.read            | RENAME     | viso.organization.businesses.view           |
| viso.commercial_categories.read | RENAME     | viso.catalog.commercial_categories.view     |
| viso.content_blocks.read        | RENAME     | viso.content.content_blocks.view            |
| viso.delivery_rates.read        | RENAME     | viso.delivery.rates.view                    |
| viso.menu.read                  | RENAME     | viso.content.menu.view                      |
| viso.operational_preview.view   | RENAME     | viso.authorization.context_simulations.view |
| viso.ops.audit.view             | RENAME     | viso.authorization.audit_logs.view          |
| viso.pass_products.read         | RENAME     | viso.loyalty.products.view                  |
| viso.pass_users.read            | RENAME     | viso.loyalty.customers.view                 |
| viso.staff.calendar.view        | RENAME     | viso.workforce.staff_calendar.view          |
| viso.staff.read                 | RENAME     | viso.workforce.employees.view               |
| viso.staff.schedule.view        | RENAME     | viso.workforce.schedules.view               |
| viso.vacancies.read             | RENAME     | viso.workforce.vacancies.view               |
| viso.website_cms.read           | RENAME     | viso.content.website_content.view           |

Decisión:

.read
→ .view
16.2 Permisos que requieren descomposición
Navegación de aplicaciones
viso.app_navigation.manage

Familia esperada:

viso.platform.app_navigation.view
viso.platform.app_navigation.update
viso.platform.app_navigation.publish
Perfiles operativos
viso.employee_operational_profiles.manage

Familia esperada:

viso.workforce.operational_profiles.view
viso.workforce.operational_profiles.create
viso.workforce.operational_profiles.update
viso.workforce.operational_profiles.activate
viso.workforce.operational_profiles.deactivate
Imágenes del menú
viso.menu.images.manage

Familia esperada:

viso.content.menu_images.view
viso.content.menu_images.upload
viso.content.menu_images.update
viso.content.menu_images.delete
Puntos operativos de marcación
viso.operational_points.manage

Familia esperada:

viso.operations.checkin_points.view
viso.operations.checkin_points.create
viso.operations.checkin_points.update
viso.operations.checkin_points.activate
viso.operations.checkin_points.deactivate
Roles operativos por sede
viso.site_operational_roles.manage

Familia esperada:

viso.authorization.site_operational_roles.view
viso.authorization.site_operational_roles.assign
viso.authorization.site_operational_roles.revoke
Documentos de trabajadores
viso.staff.documents.manage

Familia esperada:

viso.workforce.employee_documents.view
viso.workforce.employee_documents.upload
viso.workforce.employee_documents.update
viso.workforce.employee_documents.delete
Fotografías de trabajadores
viso.staff.employee_photos.manage

Familia esperada:

viso.workforce.employee_photos.view
viso.workforce.employee_photos.upload
viso.workforce.employee_photos.update
viso.workforce.employee_photos.delete
Administración de trabajadores
viso.staff.manage

Familia esperada:

viso.workforce.employees.view
viso.workforce.employees.create
viso.workforce.employees.update
viso.workforce.employees.activate
viso.workforce.employees.deactivate
Administración de permisos
viso.staff.permissions.manage

Familia esperada:

viso.authorization.permission_assignments.view
viso.authorization.permission_assignments.assign
viso.authorization.permission_assignments.revoke

#### 17. Propiedad funcional entre aplicaciones

Esta tarea normaliza el nombre dentro de la aplicación propietaria actual.

No mueve automáticamente una capacidad entre aplicaciones.

Ejemplo:

nexo.finance.cost_centers.view
numera.finance.cost_centers.view

Ambas podrán coexistir temporalmente.

AUTH-CAT-004 y las auditorías por aplicación deberán determinar si:

son capacidades distintas;
una aplicación solo consume la capacidad de otra;
una de las dos debe retirarse;
ambas protegen operaciones diferentes.

Regla:

NORMALIZAR EL CÓDIGO
NO EQUIVALE A CAMBIAR
LA APLICACIÓN PROPIETARIA

#### 18. Códigos canónicos nuevos no conceden autoridad

La definición de un código nuevo no implica:

asignarlo a propietarios;
asignarlo a gerentes;
asignarlo a roles operativos;
habilitar navegación;
permitir RPC;
permitir RLS;
hacerlo visible en VISO.

La creación futura deberá comenzar:

sin asignaciones implícitas

hasta que se aprueben:

authorization_requirement;
clasificación;
alcance;
prerrequisitos;
matrices.

#### 19. Manejo de asignaciones legacy

Cuando se implemente la migración:

Para KEEP
no cambiar clave
Para RENAME
crear permiso canónico
→ migrar consumidor
→ migrar asignaciones
→ mantener alias temporal
→ retirar legacy
Para MERGE_CANDIDATE
crear o identificar permiso canónico
→ consolidar asignaciones sin duplicarlas
→ migrar todos los consumidores
→ retirar códigos redundantes
Para DECOMPOSE_REQUIRED
inventariar operaciones reales
→ crear permisos atómicos
→ asignar cada permiso explícitamente
→ no copiar automáticamente la concesión amplia
Para RETIRE_TECHNICAL
reemplazar el guard de ruta
→ usar capacidades funcionales
→ retirar el permiso técnico

#### 20. Regla de seguridad para descomposición

Ejemplo problemático:

viso.staff.manage

No se permitirá:

staff.manage
    ↓
employees.create
employees.update
employees.activate
employees.deactivate

como conversión automática para todos los actores actuales.

La migración deberá revisar la intención de cada asignación.

Fórmula:

PERMISO LEGACY AMPLIO
≠
CONCESIÓN AUTOMÁTICA
DE TODAS LAS ACCIONES NUEVAS

#### 21. Regla de seguridad para fusiones

Cuando varios códigos converjan:

legacy A
legacy B
legacy C
    ↓
canonical X

la migración consolidará:

actor;
carril;
alcance;
is_allowed;
origen;
vigencia.

No deberá convertir tres asignaciones diferentes en una concesión más amplia.

Ejemplo:

inventory.remissions.all_sites

y:

inventory.remissions

convergen en:

inventory.remissions.view

pero sus alcances anteriores deberán analizarse separadamente.

El alcance all_sites no puede perderse ni extenderse silenciosamente.

#### 22. Catálogo técnico retirado

Se retiran como conceptos de autorización:

login
no_access
page_tsx
slug
new
edit
open
quick
scanner
settings
setup
code

Esto no significa eliminar las pantallas.

Significa:

LA PANTALLA CONTINÚA
PERO CONSUME PERMISOS FUNCIONALES

Ejemplo:

/inventory/catalog/[id]

podrá requerir:

nexo.catalog.products.view

No:

nexo.inventory_catalog_id.view

#### 23. Catálogo canónico esperado por aplicación

SHELL
platform
ANIMA
attendance
workforce
VISO
authorization
catalog
content
delivery
finance
loyalty
operations
organization
platform
workforce
NEXO
analytics
assets
catalog
finance
inventory
logistics
printing
settings
FOGO
production
ORIGO
catalog
procurement
PULSO
cash
delivery
loyalty
payments
sales
NUMERA
analytics
finance
AURA

No se amplía todavía.

PASS

No se amplía todavía dentro del RBAC laboral.

#### 24. Validación de la normalización

La propuesta cubre:

ANIMA       10 de 10
AURA         1 de 1
FOGO         8 de 8
NEXO       111 de 111
NUMERA       8 de 8
ORIGO        8 de 8
PASS         1 de 1
PULSO        3 de 3
SHELL        1 de 1
VISO        26 de 26

Total:

177 de 177

No queda ningún permiso actual sin resolución documental.

#### 25. Qué no queda decidido todavía

AUTH-CAT-003 no determina:

qué duplicados se eliminan primero;
cuándo termina cada alias;
qué permisos amplios se dividen exactamente;
qué actor recibe cada nuevo permiso;
qué permiso es base u operativo;
qué alcance admite cada permiso;
qué permisos son sensibles;
qué permisos requieren turno;
qué permisos requieren check-in;
qué permisos requieren área;
qué permisos admiten dispositivos compartidos;
qué permisos admiten simulación;
qué recurso resuelve cada operación;
qué aplicación será propietaria final
de dominios transversales.

#### 26. Riesgos controlados

Riesgo 1 — Perder alcance durante un rename

Control:

el código y el alcance se migran por separado
Riesgo 2 — Convertir manage en autoridad total

Control:

DECOMPOSE_REQUIRED
sin alias automático
Riesgo 3 — Eliminar una ruta funcional

Control:

se retira el permiso técnico
no la pantalla
Riesgo 4 — Duplicar asignaciones al fusionar

Control:

consolidación por actor, carril y alcance
Riesgo 5 — Mover capacidades entre aplicaciones sin auditoría

Control:

se conserva temporalmente la aplicación propietaria actual
Riesgo 6 — Autorizar por crear el permiso

Control:

nuevo permiso sin concesiones implícitas

#### 27. Criterios de aprobación

Los criterios de aprobación de esta tarea fueron aceptados íntegramente
durante su revisión y quedan respaldados por sus invariantes,
resultado esperado y decisión final.

#### 28. Decisión final

177 PERMISOS LEGACY
        ↓
NORMALIZACIÓN DOCUMENTAL COMPLETA
        ↓
KEEP
RENAME
MERGE_CANDIDATE
DECOMPOSE_REQUIRED
RETIRE_TECHNICAL

Regla principal:

EL CÓDIGO CANÓNICO
DESCRIBE UNA CAPACIDAD EMPRESARIAL

NO DESCRIBE:

RUTA
PANTALLA
ARCHIVO
SEDE
ÁREA
PROPIEDAD
ESTADO COMO FILTRO
ROL
MODALIDAD
DISPOSITIVO
FRAMEWORK

Estado:

AUTH-CAT-001
→ APROBADA

AUTH-CAT-002
→ APROBADA

AUTH-CAT-003
→ APROBADA

### ✅ AUTH-CAT-004 — Eliminar permisos duplicados semánticamente

#### 1. Estado de implementación

#### 2. Objetivo

Consolidar códigos distintos que representan la misma capacidad empresarial.

Ejemplo:

nexo.stock.view
nexo.inventory.stock

Ambos representan:

consultar stock

Por tanto, deberán converger en:

nexo.inventory.stock.view

Resultado:

VARIOS CÓDIGOS LEGACY
        ↓
UNA CAPACIDAD CANÓNICA

#### 3. Definición de duplicado semántico

Dos permisos son duplicados semánticos cuando:

pertenecen a la misma aplicación;
protegen la misma capacidad empresarial;
actúan sobre el mismo recurso;
representan la misma acción;
su diferencia proviene del nombre de una ruta,
pantalla, singular, plural o estructura legacy.

Ejemplo:

nexo.locations.view
nexo.inventory.locations
nexo.inventory_locations_id.view

Los tres permiten consultar ubicaciones.

La diferencia entre listado y detalle no constituye por sí sola una capacidad distinta.

Código canónico:

nexo.inventory.locations.view

#### 4. No todo parecido es un duplicado

Dos permisos no son duplicados solamente porque:

usan el mismo verbo;
utilizan el mismo recurso;
tienen el mismo código relativo;
aparecen en pantallas parecidas;
pertenecen al mismo dominio empresarial.

Ejemplos que no son duplicados:

nexo.inventory.remissions.view
nexo.inventory.remissions.request

Uno consulta y el otro solicita.

También:

nexo.finance.cost_centers.view
numera.finance.cost_centers.view

Pertenecen a aplicaciones distintas.

Su propiedad funcional deberá resolverse después, pero no se fusionan automáticamente en esta tarea.

#### 5. Regla principal

Dentro de cada familia semántica deberá existir:

1 permiso canónico activo
0 permisos legacy asignables
0 capacidades duplicadas visibles en VISO

Los códigos anteriores podrán conservarse temporalmente como:

aliases deprecated

pero nunca como capacidades independientes.

#### 6. Resultado general

AUTH-CAT-003 había clasificado provisionalmente:

54 códigos como MERGE_CANDIDATE

Ese número representa registros candidatos, no 54 familias distintas.

AUTH-CAT-004 los organiza en:

20 familias semánticas confirmadas

Cada familia tendrá una única clave canónica.

La cantidad física final de registros activos se definirá al implementar la migración, porque también deberán procesarse:

renames;
permisos amplios que deben descomponerse;
permisos técnicos que deben retirarse;
aliases de transición;
asignaciones existentes.

#### 7. Registro canónico de familias duplicadas

DUP-001 — Consulta de lotes de producción en FOGO
Códigos legacy
fogo.production.batches
fogo.production.batches.view
Código canónico
fogo.production.batches.view
Decisión

production.batches no expresa acción.

Se interpreta como la versión legacy de consulta.

Resultado
fogo.production.batches
→ alias deprecated

fogo.production.batches.view
→ permiso canónico
DUP-002 — Consulta de productos del catálogo de NEXO
Códigos legacy
nexo.catalog.view
nexo.ficha.view
nexo.products.view
nexo.catalog.products
nexo.inventory_catalog_id.view
nexo.inventory_catalog.view
Código canónico
nexo.catalog.products.view
Decisión

Las diferencias actuales corresponden a:

listado;
ficha;
detalle;
ruta dinámica;
nombre antiguo del catálogo.

Todas representan la misma capacidad ordinaria:

consultar productos del catálogo
No incluye
crear productos;
actualizar productos;
administrar presentaciones;
administrar políticas de solicitud.
DUP-003 — Consulta de presentaciones
Códigos legacy
nexo.presentations.view
nexo.inventory_catalog_id_presentations.view
nexo.inventory_catalog_presentations.view
Código canónico
nexo.catalog.presentations.view
Decisión

La presentación puede aparecer:

dentro de un producto;
en un listado general;
en una ruta de configuración.

Eso no genera capacidades diferentes.

DUP-004 — Consulta de políticas de solicitud
Códigos legacy
nexo.request_policies.view
nexo.inventory_catalog_id_request_policies.view
nexo.inventory_settings_request_policies.view
Código canónico
nexo.catalog.request_policies.view
Decisión

Los tres códigos consultan las políticas que determinan cómo se solicita un producto.

La ruta desde la cual se consulta no forma parte de la autorización.

DUP-005 — Consulta de elementos de activos
Códigos legacy
nexo.assets.view
nexo.inventory_assets_items_id.view
Código canónico
nexo.assets.items.view
Decisión

El permiso de detalle generado desde [id] no constituye una capacidad independiente.

DUP-006 — Consulta de ubicaciones
Códigos legacy
nexo.locations.view
nexo.inventory.locations
nexo.inventory_locations_id.view
Código canónico
nexo.inventory.locations.view
Decisión

El permiso canónico cubre:

listado;
búsqueda;
detalle ordinario;
selección de ubicación.

No incluye:

crear;
actualizar;
asignar stock;
modificar catálogo interno.
DUP-007 — Consulta de LPN
Códigos legacy
nexo.lpns.view
nexo.inventory.lpns
Código canónico
nexo.inventory.lpns.view
Decisión

El código sin acción se interpreta como consulta legacy.

DUP-008 — Consulta de movimientos de inventario
Códigos legacy
nexo.movements.view
nexo.inventory.movements
Código canónico
nexo.inventory.movements.view
Decisión

Ambos permiten consultar movimientos ya registrados.

No incluyen crear o corregir movimientos.

DUP-009 — Consulta de stock
Códigos legacy
nexo.stock.view
nexo.inventory.stock
Código canónico
nexo.inventory.stock.view
Decisión

La diferencia proviene de una versión de ruta y una versión funcional anterior.

DUP-010 — Consulta de lotes de producción reflejados en NEXO
Códigos legacy
nexo.production_batches.view
nexo.inventory.production_batches
Código canónico
nexo.inventory.production_batches.view
Decisión

NEXO consulta los lotes por su efecto o trazabilidad en inventario.

Esto no convierte a NEXO en propietario del proceso productivo.

La ejecución productiva continúa perteneciendo a FOGO.

DUP-011 — Consulta de zonas de almacenamiento
Códigos legacy
nexo.zone.view
nexo.zones.view
Código canónico
nexo.inventory.zones.view
Decisión

La diferencia singular/plural no representa capacidades distintas.

DUP-012 — Consulta de conteos iniciales
Códigos legacy
nexo.count_initial.view
nexo.inventory_count_initial_session_id.view
Código canónico
nexo.inventory.initial_counts.view
Decisión

La ruta de sesión por identificador no constituye otro permiso.

Este permiso no autoriza ejecutar o ajustar un conteo.

DUP-013 — Consulta de remisiones
Códigos legacy
nexo.inventory.remissions
nexo.inventory.remissions.all_sites
nexo.inventory.remissions.view_dispatch
nexo.inventory_remissions_id.view
nexo.inventory_remissions.view
Código canónico
nexo.inventory.remissions.view
Decisión

Todos representan la capacidad de consultar remisiones.

Las diferencias deben resolverse fuera del código:

all_sites
→ alcance territorial

view_dispatch
→ superficie de navegación

_id
→ identificador del recurso
Regla crítica de alcance

La consolidación no convertirá automáticamente todas las asignaciones en acceso global.

Ejemplo:

legacy:
nexo.inventory.remissions.all_sites

canonical:
nexo.inventory.remissions.view

scope:
global o cobertura transversal equivalente

Mientras:

legacy:
nexo.inventory.remissions

canonical:
nexo.inventory.remissions.view

scope:
conservar el alcance real de la asignación original
DUP-014 — Preparar remisiones
Códigos legacy
nexo.inventory.remissions.prepare
nexo.prepare.view
Código canónico
nexo.inventory.remissions.prepare
Decisión

prepare.view es un permiso derivado de la pantalla de preparación.

La capacidad real es:

preparar una remisión

La pantalla consume esa capacidad.

DUP-015 — Recibir remisiones
Códigos legacy
nexo.inventory.remissions.receive
nexo.receive.view
Código canónico
nexo.inventory.remissions.receive
Decisión

receive.view representa navegación.

No existe una capacidad separada para abrir la pantalla y otra para recibir.

La interfaz podrá permitir consulta con:

nexo.inventory.remissions.view

y exigir:

nexo.inventory.remissions.receive

al confirmar la recepción.

DUP-016 — Despachar e iniciar tránsito
Códigos legacy
nexo.inventory.remissions.transit
nexo.transit.view
Código canónico
nexo.inventory.remissions.dispatch
Decisión

transit describe de forma ambigua un estado.

La capacidad empresarial ejecutada es:

despachar la remisión
e iniciar su tránsito

El estado del recurso podrá continuar siendo:

in_transit

El permiso será:

dispatch
DUP-017 — Registrar retiros de inventario
Códigos legacy
nexo.inventory.withdraw
nexo.kiosk_withdraw.view
Código canónico
nexo.inventory.withdrawals.register
Decisión

kiosk_withdraw.view representa una pantalla de kiosco.

La capacidad real es:

registrar un retiro

El mismo permiso se utiliza en:

kiosco;
tablet;
PC;
interfaz personal.

El dispositivo compartido agrega restricciones, pero no cambia el permiso.

DUP-018 — Consulta de centros de costo en NEXO
Códigos legacy
nexo.cost_center.view
nexo.cost_centers.view
Código canónico
nexo.finance.cost_centers.view
Decisión

La diferencia singular/plural es legacy.

Aclaración

No se fusiona con:

numera.finance.cost_centers.view

porque pertenece a otra aplicación.

La propiedad definitiva entre NEXO y NUMERA se resolverá posteriormente.

DUP-019 — Diseñar plantillas de impresión
Códigos legacy
nexo.designer.view
nexo.printing.designer
Código canónico
nexo.printing.templates.update
Decisión

Ambos permiten acceder al diseñador y modificar plantillas.

No se conservará un permiso de navegación independiente llamado designer.view.

Separación futura

Podrán existir:

nexo.printing.templates.view
nexo.printing.templates.update

si se confirma que algunos actores solo deben consultar plantillas.

No se crea esa separación automáticamente en esta tarea.

DUP-020 — Consulta de trabajos de impresión
Códigos legacy
nexo.jobs.view
nexo.printing.jobs
Código canónico
nexo.printing.jobs.view
Decisión

El código sin acción se interpreta como consulta legacy.

#### 8. Resumen visual de consolidación

FOGO

production.batches
production.batches.view
        ↓
production.batches.view
NEXO — CATÁLOGO

catalog.view
ficha.view
products.view
catalog.products
inventory_catalog_id.view
inventory_catalog.view
        ↓
catalog.products.view
NEXO — STOCK

stock.view
inventory.stock
        ↓
inventory.stock.view
NEXO — REMISIONES

inventory.remissions
inventory.remissions.all_sites
inventory.remissions.view_dispatch
inventory_remissions_id.view
inventory_remissions.view
        ↓
inventory.remissions.view
        +
alcance separado
NEXO — RETIROS

inventory.withdraw
kiosk_withdraw.view
        ↓
inventory.withdrawals.register

#### 9. Casos que no se fusionan

9.1 Permisos access de distintas aplicaciones

No son duplicados:

nexo.access
fogo.access
origo.access
pulso.access

Cada uno permite entrar a una aplicación diferente.

9.2 Centros de costo entre NEXO y NUMERA

No se fusionan todavía:

nexo.finance.cost_centers.view
numera.finance.cost_centers.view

Debe definirse posteriormente:

aplicación propietaria;
operación protegida;
si una app consume el permiso de la otra;
si realmente existen dos capacidades.
9.3 Lotes de producción entre FOGO y NEXO

No son duplicados:

fogo.production.batches.view
nexo.inventory.production_batches.view

FOGO:

consulta el proceso productivo

NEXO:

consulta su efecto y trazabilidad en inventario
9.4 Recetas y recetario

No se fusionan todavía:

fogo.production.recipes.view
fogo.production.recipe_book.view

Debe confirmarse si:

recipes
→ catálogo administrativo

recipe_book
→ recetario operativo

Hasta esa validación se mantienen como recursos distintos.

9.5 Reportes internos y margen completo

No son duplicados:

nexo.analytics.internal_reports.view
nexo.analytics.margin_reports.view

El margen puede ser información sensible separada del reporte ordinario.

9.6 Consulta y acción

No se fusionan:

remissions.view
remissions.request
remissions.prepare
remissions.dispatch
remissions.receive
remissions.cancel

Todas actúan sobre el mismo recurso, pero representan capacidades diferentes.

9.7 Consulta y administración

No se fusionan:

suppliers.view
suppliers.manage

manage debe descomponerse.

No debe fusionarse con view.

9.8 Configuración y operación

No se fusionan:

nexo.catalog.request_policies.view
nexo.settings.remission_policies.view

La primera consulta políticas de solicitud de productos.

La segunda consulta configuración general del flujo de remisiones.

#### 10. Estado de los códigos legacy

Cada código duplicado deberá quedar con:

is_canonical = false
lifecycle_status = deprecated
assignable = false
visible_in_role_editor = false

Y deberá apuntar a:

canonical_permission_key

Ejemplo:

legacy:
nexo.stock.view

canonical:
nexo.inventory.stock.view

#### 11. Regla de visibilidad en VISO

VISO no mostrará:

Consultar stock
Consultar inventario stock
Stock
Inventory Stock

como cuatro permisos.

Mostrará:

Consultar stock
nexo.inventory.stock.view

Y opcionalmente:

Referencias legacy: 2

Visual:

┌─────────────────────────────────────────────┐
│ Consultar stock                             │
│ nexo.inventory.stock.view                   │
│                                             │
│ Estado: Activo                              │
│ Referencias legacy: 2                       │
│                                             │
│ · nexo.stock.view                           │
│ · nexo.inventory.stock                      │
└─────────────────────────────────────────────┘

#### 12. Regla de asignación

Desde la publicación del catálogo canónico:

solo los permisos canónicos podrán
recibir asignaciones nuevas

Se bloqueará asignar:

nexo.stock.view

Se permitirá asignar:

nexo.inventory.stock.view

#### 13. Consolidación de asignaciones

Al implementar la migración, cada asignación legacy se trasladará a la clave canónica conservando:

actor;
tipo de actor;
rol;
carril;
is_allowed;
scope_type;
scope_site_id;
scope_site_type;
scope_area_id;
scope_area_kind;
origen;
vigencia;
metadatos de auditoría.

#### 14. No ampliar el alcance

La fusión no podrá convertir:

permiso limitado

en:

permiso global

Ejemplo:

rol A
nexo.stock.view
scope = site_type / production_center

deberá convertirse en:

rol A
nexo.inventory.stock.view
scope = site_type / production_center

No en:

scope = global

#### 15. No reducir el alcance silenciosamente

Tampoco podrá perderse una concesión transversal legítima.

Ejemplo:

nexo.inventory.remissions.all_sites

deberá convertirse en:

nexo.inventory.remissions.view

con un alcance que conserve expresamente la cobertura aprobada.

La cadena all_sites desaparece.

La cobertura no desaparece.

#### 16. Conflictos al consolidar

Puede ocurrir:

legacy A → canonical X → allow
legacy B → canonical X → deny

Resultado:

no se resuelve por sobrescritura

Se aplicará la precedencia canónica aprobada:

deny aplicable
>
allow aplicable

El conflicto deberá registrarse para auditoría.

#### 17. Duplicados físicos posteriores a la fusión

La consolidación puede producir dos filas idénticas.

Ejemplo:

rol = propietario
legacy A → canonical X
legacy B → canonical X
mismo alcance
mismo is_allowed

Resultado:

una sola asignación canónica

La otra fila se eliminará como redundante durante la migración.

#### 18. Diferencia frente a duplicados físicos actuales

Esta tarea elimina:

PERMISOS DISTINTOS
QUE REPRESENTAN LA MISMA CAPACIDAD

No elimina todavía directamente:

FILAS IDÉNTICAS
DEL MISMO PERMISO

Ejemplos auditados:

role_permissions
→ 8 filas físicas redundantes

employee_permissions
→ 3 filas físicas redundantes

Esas filas deberán limpiarse al migrar y sembrar las matrices canónicas.

#### 19. Orden futuro de migración

La implementación física deberá seguir este orden:

1. Crear permisos canónicos faltantes.

2. Registrar aliases legacy.

3. Actualizar consumidores de código.

4. Actualizar navegación.

5. Actualizar guards.

6. Actualizar RPC y Server Actions.

7. Actualizar RLS cuando aplique.

8. Copiar asignaciones preservando alcance.

9. Resolver conflictos allow/deny.

10. Eliminar filas físicas duplicadas.

11. Deshabilitar asignación de códigos legacy.

12. Validar que ningún consumidor use el código anterior.

13. Desactivar el permiso legacy.

14. Retirarlo cuando termine la compatibilidad.

#### 20. Regla de compatibilidad

Durante la transición podrán reconocerse:

legacy key
o
canonical key

pero la decisión deberá normalizarse internamente hacia:

canonical key

Ejemplo:

solicitud:
nexo.stock.view

normalización:
nexo.inventory.stock.view

evaluación:
nexo.inventory.stock.view

La auditoría deberá registrar:

requested_permission_key;
canonical_permission_key;
alias_used.

#### 21. Prohibición de autorización doble

Durante la transición no se permitirá:

evaluar legacy
+
evaluar canonical
+
sumar ambos resultados

La evaluación será:

resolver alias
        ↓
obtener una clave canónica
        ↓
evaluar una vez

Esto evita:

doble concesión;
doble denegación;
resultados contradictorios;
auditoría duplicada.

#### 22. Prohibición de nuevos duplicados

No podrá registrarse un permiso nuevo si:

otra capacidad canónica ya representa
la misma aplicación, módulo, recurso y acción

Antes de crear un permiso deberá comprobarse:

app;
module;
resource;
action;
descripción;
contrato de recurso;
aliases existentes.

#### 23. El sincronizador de rutas no podrá crear permisos

La auditoría confirmó que el sincronizador actual puede generar códigos desde segmentos de ruta.

Esa conducta deberá eliminarse.

Modelo prohibido:

ruta nueva
        ↓
generar permiso automáticamente

Modelo canónico:

ruta nueva
        ↓
seleccionar permisos canónicos existentes

Cuando una ruta necesite una capacidad nueva:

debe registrarse y aprobarse primero
en el catálogo canónico

#### 24. Registro de aliases requerido

Cada alias deberá contener como mínimo:

legacy_permission_key
canonical_permission_key
status
introduced_at
deprecated_at
retire_after
migration_reference
notes

Estado permitido:

active_alias
deprecated
retired

#### 25. Restricciones de aliases

No se permitirán:

alias → alias;
alias circular;
alias hacia varias capacidades;
alias dependiente del actor;
alias dependiente de sede;
alias dependiente del rol;
alias que altere el alcance;
alias que cambie según la aplicación.

Correcto:

nexo.stock.view
→ nexo.inventory.stock.view

Incorrecto:

nexo.stock.view
→ nexo.inventory.stock.view
→ nexo.inventory.stock.read

#### 26. Cómo se verá una familia consolidada

Familia
Stock de inventario

Permiso canónico
nexo.inventory.stock.view

Aliases legacy
├── nexo.stock.view
└── nexo.inventory.stock

Consumidores pendientes
[ 4 ]

Asignaciones pendientes de migrar
[ 11 ]

Estado
● En transición
○ Completada

#### 27. Qué queda después de esta tarea

Ya definido

✅ Código canónico por familia.

✅ Códigos legacy que convergen.

✅ Casos que no deben fusionarse.

✅ Reglas para preservar alcance.

✅ Reglas para preservar denegaciones.

✅ Reglas para aliases.

✅ Prohibición de duplicados futuros.

Queda pendiente

❌ Crear descripciones humanas.

❌ Definir modalidad de autorización.

❌ Clasificar permisos operativos.

❌ Clasificar permisos sensibles.

❌ Definir alcances admitidos.

❌ Crear el catálogo versionado.

❌ Crear migraciones.

❌ Actualizar repositorios consumidores.

#### 28. Fuera del alcance

Esta tarea no resuelve:

permisos demasiado amplios como *.manage;
permisos técnicos que no tienen equivalente;
propiedad final entre NEXO y NUMERA;
matrices de roles;
excepciones individuales;
denegaciones concretas;
authorization_requirement;
requisitos de turno;
requisitos de check-in;
requisitos de área;
dispositivos compartidos;
simulación;
contratos territoriales;
RLS;
RPC;
guards.

#### 29. Riesgos controlados

Riesgo 1 — Fusionar capacidades distintas

Control:

solo se fusionan familias confirmadas
dentro de una misma aplicación
Riesgo 2 — Perder acceso transversal

Control:

el alcance se migra separadamente
Riesgo 3 — Ampliar acceso al consolidar

Control:

se conserva actor + carril + alcance + efecto
Riesgo 4 — Mantener dos capacidades visibles

Control:

solo el permiso canónico es asignable
Riesgo 5 — Crear aliases eternos

Control:

todo alias tiene estado y retiro planificado
Riesgo 6 — Volver a generar duplicados

Control:

las rutas no crean permisos
Riesgo 7 — Doble evaluación

Control:

resolver alias antes de autorizar

#### 30. Invariantes

Una capacidad empresarial tiene una única clave canónica.
Un código legacy no es asignable.
Un alias apunta directamente a una clave canónica.
Un alias no amplía alcance.
Un alias no cambia la modalidad.
Un alias no cambia el recurso.
Una fusión conserva los efectos allow y deny.
Una fusión conserva la territorialidad.
La denegación aplicable prevalece.
No se fusionan automáticamente permisos de aplicaciones diferentes.
No se fusionan acciones diferentes.
Listado y detalle ordinarios usan el mismo permiso view.
Las rutas consumen permisos funcionales.
Los códigos técnicos no crean capacidades.
Los dispositivos no generan variantes del permiso.
No existe evaluación doble entre legacy y canonical.
No existen aliases encadenados.
No existen aliases circulares.
Los duplicados físicos se eliminan después de normalizar.
VISO muestra únicamente capacidades canónicas.

#### 31. Criterios de aprobación

Los criterios de aprobación de esta tarea fueron aceptados íntegramente
durante su revisión y quedan respaldados por sus invariantes,
resultado esperado y decisión final.

#### 32. Decisión final

UNA CAPACIDAD EMPRESARIAL
**=**
UNA CLAVE CANÓNICA
CÓDIGOS LEGACY
**=**
ALIASES TEMPORALES
NO CAPACIDADES ADICIONALES
DUPLICACIÓN SEMÁNTICA
NO SE RESUELVE
BORRANDO CADENAS SIN CONTEXTO

SE RESUELVE MEDIANTE:

CLAVE CANÓNICA
+
MIGRACIÓN DE CONSUMIDORES
+
PRESERVACIÓN DE ALCANCE
+
PRESERVACIÓN DE DENEGACIONES
+
CONSOLIDACIÓN DE ASIGNACIONES
+
RETIRO CONTROLADO

Estado:

AUTH-CAT-001
→ APROBADA

AUTH-CAT-002
→ APROBADA

AUTH-CAT-003
→ APROBADA

AUTH-CAT-004
→ APROBADA

### ✅ AUTH-CAT-005 — Crear descripciones humanas de cada permiso

#### 1. Estado de implementación

#### 2. Problema que se resuelve

El catálogo actual contiene metadatos como:

ID
New
Products
Locations
Movements
Request Policies
Access

y descripciones genéricas como:

Permite acceder a ID.
Permite acceder a New.
Permite acceder a Products.

Estas expresiones no permiten identificar con seguridad:

qué operación concede el permiso;
sobre qué recurso actúa;
si consulta o modifica;
si representa una acción o una pantalla;
si se diferencia de otro permiso parecido.

Una matriz administrativa no puede depender de que el usuario interprete el código técnico.

#### 3. Objetivo

Todo permiso canónico deberá tener:

permission_key
human_label
human_description
human_group
human_sort_order

Ejemplo:

permission_key:
nexo.inventory.remissions.prepare

human_label:
Preparar remisiones

human_description:
Permite registrar y confirmar la preparación de una remisión antes de su despacho.

human_group:
Remisiones

human_sort_order:
240

#### 4. Campos humanos canónicos

4.1 human_label

Nombre corto que se muestra en:

matrices de roles;
detalle de permisos;
simulador;
auditoría;
selectores administrativos;
diagnósticos.

Debe permitir reconocer la capacidad sin leer el código.

4.2 human_description

Explicación precisa del efecto empresarial del permiso.

Debe responder:

¿Qué puede hacer el actor?
¿Sobre qué recurso?
¿Qué resultado empresarial produce?

No debe intentar explicar todavía:

quién recibe el permiso;
qué rol lo hereda;
qué sede cubre;
si requiere turno;
si requiere check-in;
si es sensible;
si admite dispositivo compartido.

Esas propiedades pertenecen a tareas posteriores.

4.3 human_group

Grupo funcional utilizado para organizar los permisos dentro de cada aplicación.

Ejemplos:

Acceso a la aplicación
Personal
Asistencia y turnos
Catálogo
Inventario
Remisiones
Producción
Compras
Autorización

El grupo es presentación administrativa.

No es un permiso ni una capacidad asignable.

4.4 human_sort_order

Número entero utilizado para mostrar permisos en un orden estable.

No define:

prioridad;
precedencia;
sensibilidad;
jerarquía;
autoridad.

#### 5. Idioma

Los códigos técnicos continuarán en inglés:

nexo.inventory.remissions.prepare

La presentación humana será en español:

Preparar remisiones
Permite registrar y confirmar la preparación de una remisión antes de su despacho.

No se mezclarán idiomas dentro de una misma etiqueta.

Incorrecto:

View remisiones
Manage proveedores
Access NEXO

Correcto:

Consultar remisiones
Administrar proveedores
Entrar a NEXO

#### 6. Convención de etiquetas

Las etiquetas usarán:

VERBO EN INFINITIVO
+
RECURSO

Ejemplos:

Consultar stock
Crear lotes de producción
Solicitar remisiones
Aprobar variaciones internas
Actualizar trabajadores

No se utilizarán etiquetas nominales ambiguas:

Stock
Remisiones
Administración
Productos
Configuración

#### 7. Verbos humanos canónicos

| Acción técnica | Verbo humano                  |
| -------------- | ----------------------------- |
| access         | Entrar a                      |
| view           | Consultar                     |
| create         | Crear                         |
| update         | Actualizar                    |
| delete         | Eliminar                      |
| register       | Registrar                     |
| perform        | Ejecutar                      |
| request        | Solicitar                     |
| prepare        | Preparar                      |
| dispatch       | Despachar                     |
| receive        | Recibir                       |
| approve        | Aprobar                       |
| reject         | Rechazar                      |
| cancel         | Cancelar                      |
| assign         | Asignar                       |
| revoke         | Revocar                       |
| generate       | Generar                       |
| issue          | Emitir                        |
| upload         | Cargar                        |
| override       | Ejecutar de forma excepcional |

El verbo podrá adaptarse cuando la traducción literal no represente correctamente la operación empresarial.

#### 8. Convención de descripciones

La estructura preferida será:

Permite + verbo + recurso + finalidad o efecto empresarial.

Ejemplo:

Permite consultar las existencias disponibles y su distribución dentro del inventario.

Para acciones sensibles o excepcionales podrá añadirse una aclaración funcional:

Permite registrar una entrada mediante el flujo excepcional previsto para casos que no pueden procesarse por el procedimiento ordinario.

#### 9. Contenido prohibido en las descripciones

Las descripciones no afirmarán prematuramente:

que el permiso es global;
que aplica a todas las sedes;
que solo funciona en una sede;
que requiere turno;
que requiere check-in;
que está reservado al propietario;
que está reservado a gerencia;
que puede ejecutarse desde un dispositivo compartido;
que admite simulación;
que es sensible;
que representa un bypass.

Ejemplo incorrecto:

Permite a los gerentes consultar el stock de todas las sedes.

Ejemplo correcto:

Permite consultar las existencias disponibles y su distribución dentro del inventario.

La identidad, modalidad y alcance se definirán separadamente.

#### 10. Acceso a una aplicación

Los permisos:

`<app>.access`

utilizarán la etiqueta:

Entrar a <APLICACIÓN>

Descripción:

Permite abrir y utilizar la superficie general de <APLICACIÓN>. No concede por sí solo acceso a las operaciones o recursos específicos de la aplicación.

Regla:

ENTRAR A LA APLICACIÓN
≠
EJECUTAR TODAS SUS CAPACIDADES

#### 11. Consulta

Los permisos terminados en:

.view

utilizarán normalmente:

Consultar `<recurso>`

La descripción podrá incluir:

listado;
búsqueda;
detalle ordinario;
información relacionada necesaria para la consulta.

No implica:

crear;
actualizar;
eliminar;
aprobar;
cancelar;
exportar;
ejecutar acciones.

#### 12. Creación y registro

Se diferencian:

create
→ crear una nueva entidad

register
→ registrar una operación o transacción empresarial

Ejemplos:

Crear productos
Registrar entradas de inventario
Registrar retiros de inventario

#### 13. Actualización y transiciones

update se presentará como:

Actualizar `<recurso>`

Las transiciones conservarán el verbo empresarial:

Preparar remisiones
Despachar remisiones
Recibir remisiones
Cancelar remisiones
Aprobar variaciones

No se ocultarán dentro de:

Administrar remisiones

#### 14. Palabra administrar

Administrar no se utilizará para nuevos permisos atómicos.

Solo podrá aparecer temporalmente en la visualización de un permiso legacy amplio:

Administrar trabajadores (legacy)

Los permisos canónicos utilizarán acciones concretas.

#### 15. Grupos humanos canónicos

SHELL
Acceso a la aplicación
ANIMA
Acceso a la aplicación
Asistencia y turnos
Personal y equipo
FOGO
Acceso a la aplicación
Producción
Recetas
NEXO
Acceso a la aplicación
Catálogo
Activos
Inventario
Conteos
Remisiones
Logística
Finanzas internas
Analítica
Impresión
Configuración
NUMERA
Acceso a la aplicación
Finanzas
Analítica
ORIGO
Acceso a la aplicación
Compras
Proveedores
Catálogo
PULSO
Acceso a la aplicación
Entregas
VISO
Acceso a la aplicación
Plataforma
Organización
Personal
Autorización
Catálogo
Contenido
Finanzas
Entregas
Fidelización
AURA y PASS
Acceso a la aplicación

#### 16. Orden humano

Dentro de cada aplicación se utilizará esta prioridad general:

010  Acceso a la aplicación
100  Consultas
200  Creación y registro
300  Actualización
400  Transiciones operativas
500  Aprobación y resolución
600  Acciones excepcionales
700  Eliminación, cancelación o desactivación

El valor final podrá incorporar:

grupo
+
acción
+
posición estable dentro del grupo

La modificación de human_sort_order no cambiará el significado del permiso.

#### 17. Catálogo humano — SHELL

| Permiso      | Etiqueta          | Descripción                                                                                                           | Grupo                  |
| ------------ | ----------------- | --------------------------------------------------------------------------------------------------------------------- | ---------------------- |
| shell.access | Entrar a Vento OS | Permite abrir y utilizar el Hub de Vento OS. No concede por sí solo acceso a las aplicaciones enlazadas desde el Hub. | Acceso a la aplicación |

#### 18. Catálogo humano — ANIMA

| Permiso                                   | Etiqueta                             | Descripción                                                                                                                                            | Grupo                  |
| ----------------------------------------- | ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------- |
| anima.access                              | Entrar a ANIMA                       | Permite abrir y utilizar la superficie general de ANIMA. No concede por sí solo acceso a las operaciones específicas de personal, documentos o turnos. | Acceso a la aplicación |
| anima.workforce.employee_documents.view   | Consultar documentos de trabajadores | Permite consultar los documentos laborales registrados para los trabajadores.                                                                          | Personal y equipo      |
| anima.workforce.employee_documents.upload | Cargar documentos de trabajadores    | Permite cargar nuevos documentos laborales asociados a trabajadores.                                                                                   | Personal y equipo      |
| anima.workforce.employee_documents.delete | Eliminar documentos de trabajadores  | Permite eliminar documentos laborales almacenados para trabajadores.                                                                                   | Personal y equipo      |
| anima.workforce.employee_photos.upload    | Cargar fotografías de trabajadores   | Permite cargar o reemplazar la fotografía laboral asociada a un trabajador.                                                                            | Personal y equipo      |
| anima.workforce.team_members.view         | Consultar integrantes del equipo     | Permite consultar los trabajadores que forman parte del equipo disponible en ANIMA.                                                                    | Personal y equipo      |
| anima.workforce.staff_invitations.create  | Invitar trabajadores                 | Permite crear invitaciones para incorporar trabajadores al sistema laboral.                                                                            | Personal y equipo      |
| anima.attendance.shifts.create            | Crear turnos                         | Permite crear nuevos turnos laborales para trabajadores.                                                                                               | Asistencia y turnos    |
| anima.attendance.shifts.update            | Actualizar turnos                    | Permite modificar la información programada de turnos laborales existentes.                                                                            | Asistencia y turnos    |
| anima.attendance.shifts.cancel            | Cancelar turnos                      | Permite cancelar un turno laboral programado sin eliminar su registro histórico.                                                                       | Asistencia y turnos    |

#### 19. Catálogo humano — AURA

| Permiso     | Etiqueta      | Descripción                                                                                                                      | Grupo                  |
| ----------- | ------------- | -------------------------------------------------------------------------------------------------------------------------------- | ---------------------- |
| aura.access | Entrar a AURA | Permite abrir y utilizar la superficie general de AURA. No concede por sí solo capacidades específicas de marketing o contenido. | Acceso a la aplicación |

AURA no recibe nuevos permisos humanos hasta completar su auditoría funcional.

#### 20. Catálogo humano — FOGO

| Permiso                          | Etiqueta                        | Descripción                                                                                                                  | Grupo                  |
| -------------------------------- | ------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- | ---------------------- |
| fogo.access                      | Entrar a FOGO                   | Permite abrir y utilizar la superficie general de FOGO. No concede por sí solo acceso a operaciones de producción o recetas. | Acceso a la aplicación |
| fogo.production.batches.view     | Consultar lotes de producción   | Permite consultar los lotes de producción y su información operativa registrada.                                             | Producción             |
| fogo.production.batches.create   | Crear lotes de producción       | Permite iniciar y registrar nuevos lotes de producción.                                                                      | Producción             |
| fogo.production.orders.view      | Consultar órdenes de producción | Permite consultar las órdenes que definen o solicitan producción.                                                            | Producción             |
| fogo.production.recipe_book.view | Consultar recetario operativo   | Permite consultar el recetario utilizado como referencia durante la ejecución productiva.                                    | Recetas                |
| fogo.production.recipes.view     | Consultar recetas               | Permite consultar la definición y composición de las recetas registradas.                                                    | Recetas                |

El permiso legacy:

fogo.production.recipes.manage

no recibirá una descripción canónica definitiva hasta completar su descomposición.

#### 21. Catálogo humano — NEXO: acceso y catálogo

| Permiso                            | Etiqueta                         | Descripción                                                                                                                                | Grupo                  |
| ---------------------------------- | -------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------- |
| nexo.access                        | Entrar a NEXO                    | Permite abrir y utilizar la superficie general de NEXO. No concede por sí solo acceso a operaciones específicas de inventario o logística. | Acceso a la aplicación |
| nexo.catalog.products.view         | Consultar productos              | Permite consultar los productos registrados en el catálogo, incluyendo su información general.                                             | Catálogo               |
| nexo.catalog.products.create       | Crear productos                  | Permite registrar nuevos productos dentro del catálogo.                                                                                    | Catálogo               |
| nexo.catalog.presentations.view    | Consultar presentaciones         | Permite consultar las presentaciones disponibles para los productos del catálogo.                                                          | Catálogo               |
| nexo.catalog.request_policies.view | Consultar políticas de solicitud | Permite consultar las reglas que determinan cómo pueden solicitarse los productos.                                                         | Catálogo               |
| nexo.catalog.categories.view       | Consultar categorías             | Permite consultar las categorías utilizadas para organizar los productos.                                                                  | Catálogo               |
| nexo.catalog.units.view            | Consultar unidades               | Permite consultar las unidades de medida y empaque disponibles en el catálogo.                                                             | Catálogo               |

#### 22. Catálogo humano — NEXO: activos

| Permiso                  | Etiqueta                     | Descripción                                                              | Grupo   |
| ------------------------ | ---------------------------- | ------------------------------------------------------------------------ | ------- |
| nexo.assets.items.view   | Consultar activos            | Permite consultar los elementos registrados en el inventario de activos. | Activos |
| nexo.assets.items.create | Crear activos                | Permite registrar nuevos elementos dentro del inventario de activos.     | Activos |
| nexo.assets.groups.view  | Consultar grupos de activos  | Permite consultar los grupos utilizados para clasificar activos.         | Activos |
| nexo.assets.counts.view  | Consultar conteos de activos | Permite consultar los conteos realizados sobre activos.                  | Activos |

#### 23. Catálogo humano — NEXO: inventario

| Permiso                                    | Etiqueta                                 | Descripción                                                                                                                              | Grupo      |
| ------------------------------------------ | ---------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- | ---------- |
| nexo.inventory.adjustments.view            | Consultar ajustes de inventario          | Permite consultar los ajustes registrados sobre las existencias de inventario.                                                           | Inventario |
| nexo.inventory.adjustments.register        | Registrar ajustes de inventario          | Permite registrar modificaciones justificadas sobre las existencias de inventario.                                                       | Inventario |
| nexo.inventory.entries.view                | Consultar entradas de inventario         | Permite consultar las entradas de productos registradas en el inventario.                                                                | Inventario |
| nexo.inventory.entries.register            | Registrar entradas de inventario         | Permite registrar el ingreso de productos al inventario.                                                                                 | Inventario |
| nexo.inventory.entries.override            | Registrar entradas excepcionales         | Permite registrar una entrada mediante el flujo excepcional previsto para casos que no pueden procesarse por el procedimiento ordinario. | Inventario |
| nexo.inventory.locations.view              | Consultar ubicaciones de inventario      | Permite consultar las ubicaciones físicas utilizadas para almacenar inventario.                                                          | Inventario |
| nexo.inventory.location_assignments.assign | Asignar ubicaciones de inventario        | Permite vincular existencias, contenedores o referencias de inventario con una ubicación física.                                         | Inventario |
| nexo.inventory.location_catalog.update     | Actualizar el catálogo de una ubicación  | Permite modificar qué productos o referencias pueden manejarse dentro de una ubicación de inventario.                                    | Inventario |
| nexo.inventory.lpns.view                   | Consultar LPN                            | Permite consultar los identificadores logísticos y el contenido asociado a cada LPN.                                                     | Inventario |
| nexo.inventory.movements.view              | Consultar movimientos de inventario      | Permite consultar los movimientos que modificaron o trasladaron existencias.                                                             | Inventario |
| nexo.inventory.stock.view                  | Consultar stock                          | Permite consultar las existencias disponibles y su distribución dentro del inventario.                                                   | Inventario |
| nexo.inventory.production_batches.view     | Consultar lotes vinculados al inventario | Permite consultar los lotes de producción relacionados con existencias y movimientos de inventario.                                      | Inventario |
| nexo.inventory.transfers.view              | Consultar traslados de inventario        | Permite consultar los traslados registrados entre ubicaciones o contextos de inventario.                                                 | Inventario |
| nexo.inventory.transfers.create            | Crear traslados de inventario            | Permite iniciar y registrar un traslado de existencias.                                                                                  | Inventario |
| nexo.inventory.withdrawals.view            | Consultar retiros de inventario          | Permite consultar los retiros registrados sobre las existencias.                                                                         | Inventario |
| nexo.inventory.withdrawals.register        | Registrar retiros de inventario          | Permite registrar la salida o consumo de existencias desde el inventario.                                                                | Inventario |
| nexo.inventory.zones.view                  | Consultar zonas de almacenamiento        | Permite consultar las zonas utilizadas para organizar el almacenamiento físico.                                                          | Inventario |
| nexo.inventory.storage_positions.view      | Consultar posiciones de almacenamiento   | Permite consultar las posiciones específicas disponibles dentro de las zonas de almacenamiento.                                          | Inventario |
| nexo.inventory.warehouse_operations.view   | Consultar operaciones de bodega          | Permite consultar la información operativa consolidada de las actividades de bodega.                                                     | Inventario |
| nexo.inventory.stock_validations.perform   | Ejecutar validaciones de inventario      | Permite ejecutar procedimientos de validación sobre existencias y registros de inventario.                                               | Inventario |

#### 24. Catálogo humano — NEXO: conteos

| Permiso                             | Etiqueta                        | Descripción                                                                                   | Grupo   |
| ----------------------------------- | ------------------------------- | --------------------------------------------------------------------------------------------- | ------- |
| nexo.inventory.stock_counts.view    | Consultar conteos de inventario | Permite consultar sesiones y resultados de conteos de existencias.                            | Conteos |
| nexo.inventory.stock_counts.perform | Ejecutar conteos de inventario  | Permite capturar y procesar conteos físicos de existencias.                                   | Conteos |
| nexo.inventory.initial_counts.view  | Consultar conteos iniciales     | Permite consultar las sesiones y resultados utilizados para establecer existencias iniciales. | Conteos |

#### 25. Catálogo humano — NEXO: remisiones

| Permiso                            | Etiqueta              | Descripción                                                                              | Grupo      |
| ---------------------------------- | --------------------- | ---------------------------------------------------------------------------------------- | ---------- |
| nexo.inventory.remissions.view     | Consultar remisiones  | Permite consultar remisiones y su información operativa registrada.                      | Remisiones |
| nexo.inventory.remissions.update   | Actualizar remisiones | Permite modificar la información editable de una remisión existente.                     | Remisiones |
| nexo.inventory.remissions.request  | Solicitar remisiones  | Permite crear y registrar una solicitud de remisión.                                     | Remisiones |
| nexo.inventory.remissions.prepare  | Preparar remisiones   | Permite registrar y confirmar la preparación de los productos incluidos en una remisión. | Remisiones |
| nexo.inventory.remissions.dispatch | Despachar remisiones  | Permite confirmar la salida de una remisión e iniciar su tránsito.                       | Remisiones |
| nexo.inventory.remissions.receive  | Recibir remisiones    | Permite registrar y confirmar la recepción de una remisión en su destino.                | Remisiones |
| nexo.inventory.remissions.cancel   | Cancelar remisiones   | Permite cancelar una remisión sin eliminar su historial operativo.                       | Remisiones |

Las condiciones como:

propiedad del recurso;
estado pendiente;
sede de origen;
sede de destino;

no se incorporan en la descripción general.

Se definirán en el contrato del recurso.

#### 26. Catálogo humano — NEXO: logística

| Permiso                                | Etiqueta                             | Descripción                                                                              | Grupo     |
| -------------------------------------- | ------------------------------------ | ---------------------------------------------------------------------------------------- | --------- |
| nexo.logistics.operations_board.view   | Consultar tablero logístico          | Permite consultar el tablero consolidado de seguimiento de operaciones logísticas.       | Logística |
| nexo.logistics.operations.view         | Consultar operaciones logísticas     | Permite consultar las operaciones logísticas registradas y su estado.                    | Logística |
| nexo.logistics.driver_operations.view  | Consultar operaciones de conductores | Permite consultar las actividades logísticas asociadas a conductores.                    | Logística |
| nexo.logistics.fulfillment.view        | Consultar cumplimiento logístico     | Permite consultar el estado de cumplimiento de las operaciones y entregas logísticas.    | Logística |
| nexo.logistics.fulfillment_routes.view | Consultar rutas de cumplimiento      | Permite consultar las rutas utilizadas para organizar el cumplimiento y la distribución. | Logística |
| nexo.logistics.supply_routes.view      | Consultar rutas de abastecimiento    | Permite consultar las rutas definidas para mover productos entre sedes y procesos.       | Logística |

#### 27. Catálogo humano — NEXO: finanzas internas

| Permiso                                    | Etiqueta                               | Descripción                                                                                  | Grupo             |
| ------------------------------------------ | -------------------------------------- | -------------------------------------------------------------------------------------------- | ----------------- |
| nexo.finance.internal_invoices.view        | Consultar facturas internas            | Permite consultar las facturas internas generadas entre unidades o sedes.                    | Finanzas internas |
| nexo.finance.internal_invoices.generate    | Generar facturas internas              | Permite calcular y crear una factura interna a partir de operaciones registradas.            | Finanzas internas |
| nexo.finance.internal_invoices.issue       | Emitir facturas internas               | Permite confirmar la emisión de una factura interna generada.                                | Finanzas internas |
| nexo.finance.internal_invoices.cancel      | Cancelar facturas internas             | Permite cancelar una factura interna sin eliminar su trazabilidad.                           | Finanzas internas |
| nexo.finance.internal_invoice_amounts.view | Consultar valores de facturas internas | Permite consultar los importes y detalles monetarios de las facturas internas.               | Finanzas internas |
| nexo.finance.internal_prices.view          | Consultar precios internos             | Permite consultar los precios utilizados para valoraciones y transacciones internas.         | Finanzas internas |
| nexo.finance.internal_variances.view       | Consultar variaciones internas         | Permite consultar las diferencias detectadas entre valores, cantidades o registros internos. | Finanzas internas |
| nexo.finance.internal_variances.approve    | Aprobar variaciones internas           | Permite aprobar una variación interna después de su revisión.                                | Finanzas internas |
| nexo.finance.internal_variances.resolve    | Resolver variaciones internas          | Permite registrar la resolución aplicada a una variación interna.                            | Finanzas internas |
| nexo.finance.cost_centers.view             | Consultar centros de costo en NEXO     | Permite consultar los centros de costo utilizados por los procesos de NEXO.                  | Finanzas internas |

#### 28. Catálogo humano — NEXO: analítica

| Permiso                              | Etiqueta                     | Descripción                                                                                       | Grupo     |
| ------------------------------------ | ---------------------------- | ------------------------------------------------------------------------------------------------- | --------- |
| nexo.analytics.internal_reports.view | Consultar reportes internos  | Permite consultar reportes generados a partir de las operaciones internas administradas por NEXO. | Analítica |
| nexo.analytics.margin_reports.view   | Consultar reportes de margen | Permite consultar reportes que incluyen información de márgenes internos.                         | Analítica |

#### 29. Catálogo humano — NEXO: impresión

| Permiso                        | Etiqueta                        | Descripción                                                                                | Grupo     |
| ------------------------------ | ------------------------------- | ------------------------------------------------------------------------------------------ | --------- |
| nexo.printing.templates.update | Editar plantillas de impresión  | Permite modificar el diseño y la configuración de las plantillas utilizadas para imprimir. | Impresión |
| nexo.printing.jobs.view        | Consultar trabajos de impresión | Permite consultar los trabajos enviados o procesados por el sistema de impresión.          | Impresión |

#### 30. Catálogo humano — NEXO: configuración

| Permiso                               | Etiqueta                          | Descripción                                                                   | Grupo         |
| ------------------------------------- | --------------------------------- | ----------------------------------------------------------------------------- | ------------- |
| nexo.settings.sites.view              | Consultar configuración de sedes  | Permite consultar la configuración de sedes utilizada por NEXO.               | Configuración |
| nexo.settings.remission_policies.view | Consultar políticas de remisiones | Permite consultar las reglas generales que configuran el flujo de remisiones. | Configuración |

#### 31. Catálogo humano — NUMERA

| Permiso                                 | Etiqueta                       | Descripción                                                                                                                                  | Grupo                  |
| --------------------------------------- | ------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------- |
| numera.access                           | Entrar a NUMERA                | Permite abrir y utilizar la superficie general de NUMERA. No concede por sí solo acceso a información u operaciones financieras específicas. | Acceso a la aplicación |
| numera.finance.cost_centers.view        | Consultar centros de costo     | Permite consultar los centros de costo utilizados para clasificar y analizar información financiera.                                         | Finanzas               |
| numera.finance.expenses.view            | Consultar gastos               | Permite consultar los gastos registrados y su información financiera asociada.                                                               | Finanzas               |
| numera.analytics.break_even.view        | Consultar punto de equilibrio  | Permite consultar cálculos y análisis relacionados con el punto de equilibrio.                                                               | Analítica              |
| numera.analytics.profitability.view     | Consultar rentabilidad         | Permite consultar análisis de rentabilidad calculados por NUMERA.                                                                            | Analítica              |
| numera.analytics.financial_reports.view | Consultar reportes financieros | Permite consultar reportes financieros consolidados generados por NUMERA.                                                                    | Analítica              |

Los permisos legacy:

numera.cost_centers.manage
numera.expenses.manage

permanecen pendientes de descomposición.

#### 32. Catálogo humano — ORIGO

| Permiso                                | Etiqueta                          | Descripción                                                                                                                                | Grupo                  |
| -------------------------------------- | --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------- |
| origo.access                           | Entrar a ORIGO                    | Permite abrir y utilizar la superficie general de ORIGO. No concede por sí solo acceso a operaciones específicas de compras o proveedores. | Acceso a la aplicación |
| origo.procurement.purchase_orders.view | Consultar órdenes de compra       | Permite consultar las órdenes de compra registradas y su estado.                                                                           | Compras                |
| origo.procurement.receipts.view        | Consultar recepciones de compra   | Permite consultar las recepciones registradas para compras y abastecimiento.                                                               | Compras                |
| origo.procurement.suppliers.view       | Consultar proveedores             | Permite consultar los proveedores registrados y su información general.                                                                    | Proveedores            |
| origo.catalog.product_reviews.view     | Consultar revisiones de productos | Permite consultar los productos que requieren revisión o validación dentro del maestro de productos.                                       | Catálogo               |

El permiso legacy:

origo.suppliers.manage

permanece pendiente de descomposición.

#### 33. Catálogo humano — Vento Pass

| Permiso     | Etiqueta            | Descripción                                                                                                                                            | Grupo                  |
| ----------- | ------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------- |
| pass.access | Entrar a Vento Pass | Permite abrir la superficie laboral o administrativa identificada como Vento Pass. No representa la autorización normal de los clientes de Vento Pass. | Acceso a la aplicación |

El acceso normal del cliente continuará separado del RBAC laboral.

#### 34. Catálogo humano — PULSO

| Permiso                            | Etiqueta                                | Descripción                                                                                                                                          | Grupo                  |
| ---------------------------------- | --------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------- |
| pulso.access                       | Entrar a PULSO                          | Permite abrir y utilizar la superficie general de PULSO. No concede por sí solo capacidad para crear ventas, cobrar, cancelar órdenes o cerrar caja. | Acceso a la aplicación |
| pulso.delivery.deliveries.override | Confirmar entregas de forma excepcional | Permite confirmar una entrega mediante el procedimiento excepcional previsto cuando el flujo ordinario no puede completarse.                         | Entregas               |

El permiso:

pulso.pos.main

no recibirá una descripción canónica definitiva.

Representa una pantalla amplia que debe descomponerse en capacidades de:

ventas;
órdenes;
pagos;
caja;
fidelización;
entregas.

#### 35. Catálogo humano — VISO: acceso y plataforma

| Permiso                        | Etiqueta                                  | Descripción                                                                                                             | Grupo                  |
| ------------------------------ | ----------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- | ---------------------- |
| viso.access                    | Entrar a VISO                             | Permite abrir y utilizar la superficie general de VISO. No concede por sí solo capacidades administrativas específicas. | Acceso a la aplicación |
| viso.platform.app_updates.view | Consultar actualizaciones de aplicaciones | Permite consultar la información registrada sobre versiones y actualizaciones de las aplicaciones.                      | Plataforma             |

#### 36. Catálogo humano — VISO: organización y personal

| Permiso                            | Etiqueta                                 | Descripción                                                                            | Grupo        |
| ---------------------------------- | ---------------------------------------- | -------------------------------------------------------------------------------------- | ------------ |
| viso.organization.businesses.view  | Consultar empresas y unidades de negocio | Permite consultar las empresas o unidades organizacionales registradas en Vento Group. | Organización |
| viso.workforce.employees.view      | Consultar trabajadores                   | Permite consultar trabajadores y su información laboral general.                       | Personal     |
| viso.workforce.staff_calendar.view | Consultar calendario del personal        | Permite consultar el calendario laboral y los eventos programados del personal.        | Personal     |
| viso.workforce.schedules.view      | Consultar programación de turnos         | Permite consultar la programación laboral y los turnos asignados al personal.          | Personal     |
| viso.workforce.vacancies.view      | Consultar vacantes                       | Permite consultar las vacantes laborales registradas.                                  | Personal     |

#### 37. Catálogo humano — VISO: autorización

| Permiso                                     | Etiqueta                               | Descripción                                                                                 | Grupo        |
| ------------------------------------------- | -------------------------------------- | ------------------------------------------------------------------------------------------- | ------------ |
| viso.authorization.context_simulations.view | Consultar simulaciones de autorización | Permite consultar vistas previas o simulaciones del contexto y los permisos efectivos.      | Autorización |
| viso.authorization.audit_logs.view          | Consultar auditoría de autorización    | Permite consultar registros de decisiones, cambios y eventos relacionados con autorización. | Autorización |

#### 38. Catálogo humano — VISO: catálogo y contenido

| Permiso                                 | Etiqueta                          | Descripción                                                                                   | Grupo     |
| --------------------------------------- | --------------------------------- | --------------------------------------------------------------------------------------------- | --------- |
| viso.catalog.commercial_categories.view | Consultar categorías comerciales  | Permite consultar las categorías comerciales utilizadas para organizar productos o contenido. | Catálogo  |
| viso.content.content_blocks.view        | Consultar bloques de contenido    | Permite consultar los bloques de contenido administrados desde VISO.                          | Contenido |
| viso.content.menu.view                  | Consultar menú                    | Permite consultar la información del menú administrada desde VISO.                            | Contenido |
| viso.content.website_content.view       | Consultar contenido del sitio web | Permite consultar el contenido administrado para el sitio web.                                | Contenido |

#### 39. Catálogo humano — VISO: finanzas, entregas y fidelización

| Permiso                      | Etiqueta                            | Descripción                                                                                   | Grupo        |
| ---------------------------- | ----------------------------------- | --------------------------------------------------------------------------------------------- | ------------ |
| viso.finance.accounting.view | Consultar información contable      | Permite consultar la información contable expuesta dentro de VISO.                            | Finanzas     |
| viso.delivery.rates.view     | Consultar tarifas de entrega        | Permite consultar las tarifas utilizadas para calcular o administrar entregas.                | Entregas     |
| viso.loyalty.products.view   | Consultar productos de fidelización | Permite consultar los productos o beneficios disponibles dentro del programa de fidelización. | Fidelización |
| viso.loyalty.customers.view  | Consultar clientes de fidelización  | Permite consultar los clientes registrados en el programa de fidelización.                    | Fidelización |

#### 40. Permisos legacy amplios pendientes de descomposición

Los siguientes 21 permisos no recibirán metadatos canónicos definitivos:

FOGO
fogo.production.recipes.manage
NEXO
nexo.settings.categories.manage
nexo.settings.units.manage
nexo.settings.supply_routes.manage
nexo.internal_prices.manage
nexo.cost_centers.manage
nexo.settings.sites.manage
nexo.settings.remissions.manage
NUMERA
numera.cost_centers.manage
numera.expenses.manage
ORIGO
origo.suppliers.manage
PULSO
pulso.pos.main
VISO
viso.app_navigation.manage
viso.employee_operational_profiles.manage
viso.menu.images.manage
viso.operational_points.manage
viso.site_operational_roles.manage
viso.staff.documents.manage
viso.staff.employee_photos.manage
viso.staff.manage
viso.staff.permissions.manage

#### 41. Presentación de permisos legacy amplios

Mientras existan, deberán mostrarse así:

Administrar trabajadores (legacy)

Permiso amplio pendiente de descomposición.
No debe utilizarse en configuraciones nuevas.

Código:
viso.staff.manage

Estado:
Deprecated

Asignación nueva:
Bloqueada

Metadatos temporales:

human_label:
Administrar trabajadores (legacy)

human_description:
Permiso legacy amplio pendiente de descomposición en capacidades específicas. No debe utilizarse para asignaciones nuevas.

human_group:
Permisos legacy

Esta descripción no convierte manage en permiso canónico.

#### 42. Permisos técnicos retirados

Los permisos técnicos retirados no aparecerán en el editor normal de roles.

Ejemplos:

nexo.login.view
nexo.no_access.view
nexo.page_tsx.view
nexo.slug.view
origo.login.view
origo.no_access.view

Solo podrán aparecer en una vista técnica de migración:

Permiso técnico retirado

Este código representaba una ruta, pantalla o detalle de implementación.
No constituye una capacidad empresarial asignable.

#### 43. Aliases legacy

Los aliases no tendrán etiquetas humanas independientes.

Ejemplo:

nexo.stock.view
→ nexo.inventory.stock.view

La interfaz mostrará:

Consultar stock
nexo.inventory.stock.view

Alias legacy:
nexo.stock.view

Regla:

ALIAS
→ HEREDA PRESENTACIÓN CANÓNICA

ALIAS
→ NO CREA OTRA ETIQUETA

#### 44. Descripciones y alcance

La descripción:

Consultar remisiones

no cambiará según el alcance.

Ejemplos:

Permiso:
nexo.inventory.remissions.view

Asignación A:
sede específica

Asignación B:
sedes asignadas

Asignación C:
global

Los tres utilizarán la misma descripción humana.

El alcance se mostrará en un campo separado.

#### 45. Descripciones y modalidad

La descripción tampoco cambiará según:

BASE_ONLY
OPERATIONAL_ONLY
BASE_OR_OPERATIONAL
BASE_AND_OPERATIONAL

Ejemplo:

Preparar remisiones

seguirá siendo la misma capacidad.

Su modalidad se definirá en:

AUTH-CAT-006

#### 46. Descripciones y sensibilidad

La etiqueta no utilizará símbolos o palabras que sustituyan la clasificación formal.

No se crearán etiquetas como:

Consultar facturas internas sensibles
Cancelar remisiones peligrosamente
Aprobar variaciones críticas

La sensibilidad se mostrará mediante:

badge;
nivel;
advertencia;
requisitos adicionales.

La clasificación corresponde a:

AUTH-CAT-010

#### 47. Descripciones y turno

No se incluirá:

durante el turno;
con check-in;
en la sede activa;
en el área activa.

dentro de todas las descripciones operativas.

Ejemplo correcto:

Preparar remisiones

Permite registrar y confirmar la preparación de los productos incluidos en una remisión.

La exigencia de turno y check-in se mostrará separadamente.

#### 48. Cómo se verá en VISO

┌──────────────────────────────────────────────────┐
│ Preparar remisiones                              │
│ nexo.inventory.remissions.prepare                │
│                                                  │
│ Permite registrar y confirmar la preparación     │
│ de los productos incluidos en una remisión.      │
│                                                  │
│ Grupo: Remisiones                                │
│ Modalidad: Pendiente de definir                  │
│ Alcance: Pendiente de definir                    │
│ Turno: Pendiente de definir                      │
│ Sensibilidad: Pendiente de definir               │
│ Estado: Activo                                   │
└──────────────────────────────────────────────────┘

#### 49. Cómo se verá el selector de permisos

NEXO

Remisiones
□ Consultar remisiones
□ Actualizar remisiones
□ Solicitar remisiones
□ Preparar remisiones
□ Despachar remisiones
□ Recibir remisiones
□ Cancelar remisiones

Inventario
□ Consultar stock
□ Consultar movimientos de inventario
□ Registrar entradas de inventario
□ Registrar retiros de inventario

No se mostrará al usuario únicamente:

inventory.remissions.prepare
inventory.stock
inventory.withdraw

#### 50. Búsqueda administrativa

La búsqueda en VISO deberá encontrar un permiso mediante:

permission_key;
human_label;
human_description;
human_group;
alias legacy.

Ejemplo:

Búsqueda:
retirar inventario

Resultado:
Registrar retiros de inventario
nexo.inventory.withdrawals.register

#### 51. Validaciones obligatorias

Todo permiso canónico activo deberá cumplir:

human_label no vacío;
human_description no vacía;
human_group no vacío;
human_sort_order no nulo;
idioma español;
etiqueta sin código técnico;
descripción sin reglas de rol;
descripción sin alcance implícito;
descripción sin modalidad implícita.

#### 52. Validaciones de calidad

Se rechazarán etiquetas:

ID
New
Main
Access
Manage
View
Products
Locations

Se rechazarán descripciones:

Permite acceder a la pantalla.
Permite acceder a ID.
Permite usar esta función.
Permite administrar el módulo.

La descripción debe nombrar el recurso y el efecto empresarial.

#### 53. Unicidad de etiquetas

No se exige que human_label sea globalmente único.

Ejemplo válido:

NEXO
Consultar centros de costo

NUMERA
Consultar centros de costo

La interfaz deberá mostrar también:

aplicación;
grupo;
permission_key.

Dentro de una misma aplicación y grupo se evitarán etiquetas idénticas para capacidades diferentes.

#### 54. Cambio de descripción

Podrán actualizarse:

human_label;
human_description;
human_group;
human_sort_order;

sin cambiar el código canónico, siempre que no cambie la capacidad real.

Ejemplo permitido:

Etiqueta anterior:
Consultar stock

Etiqueta nueva:
Consultar existencias

si ambos términos representan exactamente la misma capacidad.

Un cambio de significado exigirá un permiso nuevo.

#### 55. Catálogo humano como contrato

Los metadatos humanos formarán parte del catálogo versionado.

No serán textos aislados escritos manualmente en cada aplicación.

Arquitectura objetivo:

catálogo versionado en vento-shell
        ↓
permission_key
human_label
human_description
human_group
human_sort_order
        ↓
VISO
NEXO
FOGO
ORIGO
PULSO
NUMERA
ANIMA

La implementación corresponde a:

AUTH-CAT-017

#### 56. Cobertura resultante

Metadatos humanos definidos para claves canónicas resueltas:

| Aplicación | Permisos descritos |
| ---------- | ------------------ |
| SHELL      | 1                  |
| ANIMA      | 10                 |
| AURA       | 1                  |
| FOGO       | 6                  |
| NEXO       | 63                 |
| NUMERA     | 6                  |
| ORIGO      | 5                  |
| PASS       | 1                  |
| PULSO      | 2                  |
| VISO       | 17                 |
| Total      | 112                |

Adicionalmente quedan documentados:

21 permisos legacy amplios
→ pendientes de descomposición

14 permisos técnicos
→ retirados como capacidades

aliases legacy
→ heredan presentación canónica

#### 57. Lo que no queda decidido

AUTH-CAT-005 no determina:

modalidad base u operativa;
permisos de solo lectura;
permisos de configuración;
sensibilidad;
alcance territorial;
turno;
check-in;
área activa;
dispositivos compartidos;
simulación;
contrato del recurso;
matriz de roles;
concesiones individuales;
denegaciones.

#### 58. Riesgos controlados

Riesgo 1 — Etiquetas ambiguas

Control:

verbo
+
recurso empresarial
Riesgo 2 — Ocultar demasiado bajo “administrar”

Control:

solo acciones atómicas reciben descripción canónica
Riesgo 3 — Incluir alcance en la descripción

Control:

alcance como propiedad separada
Riesgo 4 — Incluir rol o turno en la descripción

Control:

modalidad y contexto como propiedades separadas
Riesgo 5 — Mostrar aliases como capacidades

Control:

el alias hereda la presentación canónica
Riesgo 6 — Mantener permisos técnicos visibles

Control:

ocultarlos del editor normal de roles
Riesgo 7 — Descripciones diferentes por repositorio

Control:

catálogo central versionado en vento-shell

#### 59. Invariantes

Todo permiso canónico activo tiene etiqueta.
Todo permiso canónico activo tiene descripción.
Toda etiqueta se presenta en español.
Todo código permanece en inglés.
La etiqueta utiliza un verbo empresarial.
La descripción identifica recurso y efecto.
La descripción no determina el rol.
La descripción no determina el alcance.
La descripción no determina la modalidad.
La descripción no determina turno o check-in.
La descripción no determina sensibilidad.
app.access no implica acceso total.
view no implica modificar.
Los aliases no tienen presentación independiente.
Los permisos técnicos no aparecen como capacidades.
Los permisos legacy amplios se identifican expresamente como legacy.
Los grupos son únicamente de presentación.
El orden visual no crea precedencia.
Una modificación textual no cambia el código.
Un cambio real de capacidad requiere otro permiso.

#### 60. Criterios de aprobación

Los criterios de aprobación de esta tarea fueron aceptados íntegramente
durante su revisión y quedan respaldados por sus invariantes,
resultado esperado y decisión final.

#### 61. Decisión final

PERMISSION_KEY
→ IDENTIDAD TÉCNICA ESTABLE

HUMAN_LABEL
→ NOMBRE CORTO DE LA CAPACIDAD

HUMAN_DESCRIPTION
→ EFECTO EMPRESARIAL EXPLICADO

HUMAN_GROUP
→ ORGANIZACIÓN VISUAL

HUMAN_SORT_ORDER
→ ORDEN DE PRESENTACIÓN

Regla principal:

UNA PERSONA DEBE PODER ENTENDER
QUÉ CONCEDE UN PERMISO

SIN LEER EL CÓDIGO
SIN CONOCER LA RUTA
SIN CONOCER EL REPOSITORIO
SIN INTERPRETAR EL ROL

Estado:

AUTH-CAT-001
→ APROBADA

AUTH-CAT-002
→ APROBADA

AUTH-CAT-003
→ APROBADA

AUTH-CAT-004
→ APROBADA

AUTH-CAT-005
→ APROBADA
