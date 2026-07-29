### SECCIÓN — ROLES APPS Y PERMISOS

<!-- PLAN-SECTION-META:START -->
Esta sección reúne contenido canónico con una responsabilidad documental única dentro del plan. Debe conservarse cohesionada y actualizarse junto con sus referencias y validaciones dependientes.

**Cobertura canónica:** `AUTH-AUD-001` a `AUTH-AUD-004` — 4 tareas.
<!-- PLAN-SECTION-META:END -->

### ✅ AUTH-AUD-001 — Inventariar todos los roles base existentes

Inventario actual de roles base

La fuente vigente es:

public.roles
    ↓
public.employees.role
    ↓
public.role_permissions
public.role_site_type_rules
public.staff_invitations

La tabla public.roles fue creada como catálogo canónico de roles de trabajadores y employees.role quedó enlazado mediante llave foránea.

Catálogo vigente: 15 roles activos

| Código                  | Trabajadores | Estado conceptual                   |
| ----------------------- | ------------ | ----------------------------------- |
| propietario             | 4            | Base administrativo                 |
| gerente_general         | 3            | Base administrativo                 |
| gerente                 | 0            | Base administrativo por sede        |
| auxiliar_administrativa | 1            | Base administrativo                 |
| contador                | 2            | Base funcional/administrativo       |
| marketing               | 1            | Base funcional                      |
| barista                 | 4            | ⚠️ Oficio operativo en catálogo base |
| bodeguero               | 7            | ⚠️ Está en ambos catálogos           |
| cajero                  | 5            | ⚠️ Oficio operativo en catálogo base |
| cocinero                | 11           | ⚠️ Oficio operativo en catálogo base |
| conductor               | 1            | ⚠️ Oficio operativo en catálogo base |
| mesero                  | 6            | ⚠️ Oficio operativo en catálogo base |
| panadero                | 5            | ⚠️ Oficio operativo en catálogo base |
| pastelero               | 1            | ⚠️ Oficio operativo en catálogo base |
| repostero               | 4            | ⚠️ Oficio operativo en catálogo base |

El rol auxiliar_administrativa fue agregado posteriormente mediante una migración independiente.

Hallazgo principal

⚠️ public.roles todavía mezcla dos conceptos diferentes:

ROL BASE
├── propietario
├── gerente_general
├── gerente
├── auxiliar_administrativa
├── contador
└── marketing

OFICIO OPERATIVO LEGACY
├── barista
├── bodeguero
├── cajero
├── cocinero
├── conductor
├── mesero
├── panadero
├── pastelero
└── repostero

Esto contradice parcialmente la arquitectura objetivo:

employees.role
→ identidad y acceso administrativo permanente

operational_roles
→ función ejecutada durante el turno

Una migración anterior ya declaraba que employees.role debía mantenerse como rol base y que los roles por sede serían operativos.

Comparación con operational_roles

Actualmente existe un catálogo operativo separado.

Coincidencia exacta entre ambos catálogos
bodeguero
Roles operativos nuevos que ya están correctamente separados
barista_satelite
cajero_satelite
cocinero_satelite
conductor_logistica
gerencia_operativa
mostrador_satelite
operador_integral_satelite
produccion_cocina
produccion_panaderia
produccion_reposteria
propietario_admin
servicio_salon

🟡 Esto indica una transición incompleta:

Modelo viejo              Modelo nuevo
barista            →      barista_satelite
cajero             →      cajero_satelite
cocinero           →      cocinero_satelite
conductor          →      conductor_logistica
panadero           →      produccion_panaderia
repostero          →      produccion_reposteria
mesero             →      servicio_salon

No se deben eliminar ni transformar todavía porque existen trabajadores y permisos asociados.

Otros sistemas de roles encontrados

Estos no son roles base laborales:

| Fuente                                          | Valor         | Uso                     |
| ----------------------------------------------- | ------------- | ----------------------- |
| auth.users.role                                 | authenticated | Rol técnico de Supabase |
| public.users.role                               | client        | Cliente de Vento Pass   |
| operational_roles.code                          | varios        | Rol activo del turno    |
| context_simulation_sessions.administrative_role | texto         | Simulación              |
| context_simulation_sessions.operational_role    | texto         | Simulación              |

✅ Deben mantenerse separados del catálogo laboral.

Riesgos registrados
⚠️ 1. Catálogo híbrido

public.roles contiene administración y operación. Una aplicación puede interpretar cocinero como identidad permanente, aunque el nuevo modelo requiere que sea función del turno.

⚠️ 2. Permisos base asignados a oficios operativos

Los roles operativos legacy tienen registros en role_permissions:

cocinero      23
bodeguero     20
barista       15
cajero        12
mesero        10
panadero       9
repostero      9
pastelero      9
conductor      6

Esto puede otorgar acceso permanente sin depender del turno.

⚠️ 3. gerente sin usuarios actuales
Trabajadores:           0
Permisos asociados:   115

No significa que sea obsoleto, pero debe comprobarse si es realmente “gerente de sede” o un rol histórico.

⚠️ 4. Coincidencia duplicada

bodeguero existe simultáneamente en:

public.roles
public.operational_roles

Es el único código idéntico en ambos catálogos.

⚠️ 5. Normalización por nombres aproximados

Una migración clasifica roles usando coincidencias de código y texto como %gerente% o %auxiliar administrativo%. Esto funciona como transición, pero es frágil como modelo definitivo.

### ✅ AUTH-AUD-002 — Inventariar todos los roles operativos existentes

Catálogo operativo actual

Existen 13 roles operativos activos en public.operational_roles.

| Rol operativo              | Familia        | Turnos | Perfiles | Permisos |
| -------------------------- | -------------- | ------ | -------- | -------- |
| cajero_satelite            | satélite       | 63     | 0        | 5        |
| barista_satelite           | satélite       | 47     | 0        | 3        |
| cocinero_satelite          | satélite       | 132    | 0        | 3        |
| servicio_salon             | satélite       | 66     | 0        | 0        |
| mostrador_satelite         | satélite       | 0      | 0        | 0        |
| operador_integral_satelite | satélite       | 35     | 0        | 6        |
| produccion_cocina          | producción     | 16     | 0        | 0        |
| produccion_panaderia       | producción     | 17     | 0        | 0        |
| produccion_reposteria      | producción     | 15     | 0        | 0        |
| bodeguero                  | logística      | 19     | 0        | 5        |
| conductor_logistica        | logística      | 9      | 1        | 3        |
| gerencia_operativa         | gerencia       | 55     | 0        | 7        |
| propietario_admin          | administración | 0      | 0        | 0        |

Asignación actual por sede y área
Vento Café
Barra       → barista_satelite
Caja        → cajero_satelite
Cocina      → cocinero_satelite
Mostrador   → mostrador_satelite
Salón       → servicio_salon
Saudo
Caja             → cajero_satelite
Cocina / Barra   → barista_satelite
Cocina / Barra   → cocinero_satelite
Salón            → servicio_salon
Centro de Producción
Bodega                   → bodeguero
Cocina caliente          → produccion_cocina
Galletería y Panadería   → produccion_panaderia
Repostería               → produccion_reposteria
Sede general             → conductor_logistica
Molka
Sede general → operador_integral_satelite
Vento Group
Sede general → gerencia_operativa

La arquitectura nueva ya separó parcialmente los roles operativos mediante operational_roles, perfiles por trabajador y asignaciones por sede. Esto corrige el diseño inicial, donde los roles operativos todavía referenciaban public.roles.

Integridad encontrada

✅ Todos los roles utilizados en:

employee_shifts.operational_role;
employee_site_operational_profiles.default_operational_role;
site_operational_roles.role_code;
operational_role_permissions.role_code;

existen actualmente en public.operational_roles.

✅ No encontré códigos operativos huérfanos.

✅ Todos están activos.

✅ Los turnos ya utilizan mayoritariamente los nombres operativos nuevos.

Hallazgos principales
⚠️ 1. Nueve roles no tienen permisos operativos
servicio_salon
mostrador_satelite
produccion_cocina
produccion_panaderia
produccion_reposteria
propietario_admin

En realidad son seis roles sin filas; adicionalmente, varios catálogos funcionales todavía tienen permisos muy incompletos.

Esto significa:

Turno válido
    ↓
Rol operativo válido
    ↓
Sin permisos operativos
    ↓
La aplicación puede bloquearlo
o depender todavía del rol base
⚠️ 2. Producción está asignada, pero no autorizada

Los tres roles de producción tienen turnos y asignación correcta:

produccion_cocina       16 turnos
produccion_panaderia    17 turnos
produccion_reposteria   15 turnos

Pero tienen:

0 permisos operativos

Esto coincide con el estado del roadmap: FOGO todavía no está integrado completamente.

⚠️ 3. Servicio de salón tiene uso real sin permisos
servicio_salon
Turnos:       66
Asignaciones: 2
Permisos:      0

Es uno de los roles más utilizados, pero actualmente no cuenta con autorización operativa propia.

⚠️ 4. Mostrador está configurado pero nunca usado
mostrador_satelite
Asignado a: Vento Café / Mostrador
Turnos:     0
Permisos:   0

Debe verificarse después si:

todavía no se ha usado;
se está asignando otro rol al personal de mostrador;
la pantalla o el proceso aún no existe.

No se debe eliminar durante la auditoría.

⚠️ 5. propietario_admin no encaja como rol operativo
Familia:      administracion
Turnos:       0
Sedes:        0
Permisos:     0
Check-in:     no requerido
Descripción:  bypass operativo futuro

Este rol parece una solución provisional.

Según el modelo objetivo:

propietario
→ rol base administrativo global
→ no requiere turno

propietario_admin
→ no debería ser necesario como rol operativo

Debe revisarse en el Bloque B, no corregirse todavía.

⚠️ 6. gerencia_operativa está ligada a Vento Group

Actualmente:

Vento Group → gerencia_operativa
Turnos: 55
Permisos: 7

Esto puede ser válido para una jornada operativa de gerencia, pero debe diferenciarse claramente de:

gerente_general
→ acceso administrativo permanente

gerencia_operativa
→ operación dentro de un turno
⚠️ 7. Los perfiles predeterminados casi no se usan

Solo existe un perfil operativo predeterminado:

conductor_logistica → 1 perfil

Los demás roles se están resolviendo directamente desde los turnos, no desde employee_site_operational_profiles.

Esto no necesariamente es un error, pero indica que VISO todavía no administra completamente los perfiles operativos por trabajador y sede.

⚠️ 8. Los permisos operativos actuales son casi exclusivamente NEXO/PULSO

Cobertura encontrada:

NEXO     ✅ parcial
PULSO    🟡 mínima
FOGO     ❌ sin permisos
ORIGO    ❌ sin permisos
NUMERA   ❌ sin permisos
ANIMA    ❌ no corresponde que otorgue permisos
Permisos existentes por rol
Satélites
barista_satelite
├── nexo.access
├── nexo.inventory.remissions
└── nexo.inventory.remissions.request

cocinero_satelite
├── nexo.access
├── nexo.inventory.remissions
└── nexo.inventory.remissions.request

cajero_satelite
├── nexo.access
├── nexo.inventory.remissions
├── nexo.inventory.remissions.request
├── pulso.access
└── pulso.pos.main
Logística
bodeguero
├── nexo.access
├── nexo.inventory.stock
├── nexo.inventory.movements
├── nexo.inventory.remissions
└── nexo.inventory.remissions.prepare

conductor_logistica
├── nexo.access
├── nexo.inventory.remissions
└── nexo.inventory.remissions.transit
Gerencia operativa
gerencia_operativa
├── nexo.access
├── remissions
├── request
├── prepare
├── transit
├── receive
└── cancel
Problema estructural pendiente

La evolución fue:

MODELO INICIAL
site_operational_roles.role_code
    → public.roles.code

Luego pasó a:

MODELO ACTUAL
site_operational_roles.role_code
    → public.operational_roles.code

✅ La separación ya existe en la base actual.

🟡 Sin embargo, varias migraciones históricas y aplicaciones pueden seguir suponiendo que un rol operativo también existe en public.roles. La migración original del conductor, por ejemplo, declaraba que employees.role seguía siendo el rol base, pero creó los roles por sede inicialmente usando el catálogo base.

### ✅ AUTH-AUD-003 — Inventariar aplicaciones registradas en Supabase

Aplicaciones registradas en Supabase

Existen 10 aplicaciones activas en public.apps.

| Código | Aplicación | Permisos | Uso operativo                |
| ------ | ---------- | -------- | ---------------------------- |
| anima  | ANIMA      | 10       | No directo                   |
| aura   | AURA       | 1        | No                           |
| fogo   | FOGO       | 8        | ❌ Sin permisos operativos    |
| nexo   | NEXO       | 111      | ✅ 28 asignaciones operativas |
| numera | NUMERA     | 8        | ❌ Sin permisos operativos    |
| origo  | ORIGO      | 8        | ❌ Sin permisos operativos    |
| pass   | Vento Pass | 1        | No                           |
| pulso  | PULSO      | 3        | 🟡 4 asignaciones operativas  |
| shell  | Vento OS   | 1        | No                           |
| viso   | VISO       | 26       | Administrativo               |

Todas están marcadas como activas y todas tienen un permiso explícito:

access
Arquitectura encontrada
public.apps
    ↓
public.app_permissions
    ↓
├── public.role_permissions
├── public.employee_permissions
└── public.operational_role_permissions
Cobertura operativa actual
NEXO     ██████████  Integración operativa parcial
PULSO    ██░░░░░░░░  Integración mínima
FOGO     ░░░░░░░░░░  Sin permisos operativos
ORIGO    ░░░░░░░░░░  Sin permisos operativos
NUMERA   ░░░░░░░░░░  Sin permisos operativos
NEXO
111 permisos registrados.
28 filas de permisos operativos.
7 roles operativos con alguna autorización.
Es la aplicación más avanzada, pero el catálogo está sobredimensionado y contiene muchos permisos generados desde rutas.
PULSO

Solo tiene tres permisos:

pulso.access
pulso.pos.main
pulso.delivery.override

Los roles operativos con acceso son:

cajero_satelite
operador_integral_satelite
FOGO

Tiene catálogo base:

access
production.batches
production.batches.create
production.batches.view
production.orders
production.recipe_book.view
production.recipes
production.recipes.manage

❌ Ninguno está asignado mediante operational_role_permissions.

ORIGO

Tiene permisos administrativos y funcionales básicos:

access
procurement.purchase_orders
procurement.receipts
suppliers.view
suppliers.manage
product_master_review.view

❌ No tiene autorización operativa vinculada al turno.

NUMERA

Tiene permisos principalmente administrativos:

access
expenses.view
expenses.manage
reports.view
profitability.view
break_even.view
cost_centers.view
cost_centers.manage

❌ No cuenta con permisos operativos.

Hallazgos
⚠️ 1. AURA no aparece en el roadmap actual

aura está activa como aplicación de marketing, pero no forma parte del ecosistema enumerado en el roadmap:

vento-shell
vento-anima
vento-viso
vento-nexo
vento-fogo
vento-origo
vento-pulso
vento-numera

Debe definirse después si:

sigue siendo una aplicación activa;
fue reemplazada;
debe incluirse formalmente en el modelo;
debe mantenerse fuera del alcance de esta auditoría.

No se debe desactivar todavía.

⚠️ 2. Vento Pass está mezclado con aplicaciones internas

pass aparece en el catálogo RBAC laboral, aunque es principalmente una aplicación de clientes.

Actualmente tiene solamente:

pass.access

Debe definirse si este permiso controla:

acceso administrativo a Pass;
acceso del cliente;
acceso de caja para acumulaciones;
o solamente navegación interna.

El cliente final no debería depender de employees.role.

⚠️ 3. shell está registrado como aplicación
Código: shell
Nombre: Vento OS
Descripción: Hub y SSO
Permisos: access

Esto es válido para controlar entrada al hub, pero debe diferenciarse de vento-shell como repositorio de contratos, migraciones y paquetes compartidos.

shell en Supabase
→ aplicación/hub

vento-shell en GitHub
→ núcleo técnico y repositorio compartido
⚠️ 4. NEXO tiene un catálogo excesivamente granular

NEXO tiene 111 permisos, incluyendo muchos derivados directamente de nombres de rutas:

page_tsx.view
slug.view
new.view
open.view
login.view
no_access.view
inventory_catalog_id.view
inventory_locations_id.view

Esto indica que parte del catálogo fue generado desde la estructura de páginas y no desde capacidades funcionales reales.

Ejemplo:

Permiso técnico actual
inventory_catalog_id_presentations.view

Permiso funcional esperado
nexo.catalog.presentations.read

Este problema se trabajará principalmente en:

AUTH-AUD-017 — nombres inconsistentes
AUTH-UI-001 — inventario de rutas
AUTH-CAT-002 — normalización de permisos
⚠️ 5. FOGO tiene permisos base, pero no operativos

Esto explica la contradicción actual:

Rol base cocinero/panadero/repostero
        ↓
Puede recibir permisos de FOGO permanentemente

Rol operativo produccion_*
        ↓
No tiene permisos de FOGO

La aplicación aún puede depender del modelo antiguo.

⚠️ 6. Las aplicaciones administrativas y operativas no están clasificadas

Actualmente public.apps no diferencia explícitamente:

Administrativa
Operativa
Cliente
Hub
Híbrida

Clasificación preliminar:

| Aplicación | Tipo preliminar        |
| ---------- | ---------------------- |
| ANIMA      | Híbrida                |
| AURA       | Administrativa         |
| FOGO       | Operativa              |
| NEXO       | Híbrida                |
| NUMERA     | Administrativa/híbrida |
| ORIGO      | Híbrida                |
| Pass       | Cliente/híbrida        |
| PULSO      | Operativa              |
| Shell      | Hub                    |
| VISO       | Administrativa         |

Esta clasificación todavía no es definitiva; corresponde al Bloque B y C.

Excepciones individuales detectadas

Existen permisos individuales en:

ANIMA   4 filas
NEXO    8 filas
VISO    5 filas

Eso confirma que employee_permissions está siendo utilizado y deberá auditarse específicamente en AUTH-AUD-007.

### ✅ AUTH-AUD-004 — Inventariar todos los permisos por aplicación

Resumen del catálogo

| Aplicación | Permisos | Activos | Problema principal                     |
| ---------- | -------- | ------- | -------------------------------------- |
| ANIMA      | 10       | 10      | Convención parcialmente inconsistente  |
| AURA       | 1        | 1       | Solo controla acceso                   |
| FOGO       | 8        | 8       | Permisos semánticamente solapados      |
| NEXO       | 111      | 111     | 69 parecen generados desde rutas       |
| NUMERA     | 8        | 8       | Catálogo pequeño y coherente           |
| ORIGO      | 8        | 8       | Incluye páginas técnicas como permisos |
| Pass       | 1        | 1       | Solo controla acceso                   |
| PULSO      | 3        | 3       | Catálogo todavía insuficiente          |
| Shell      | 1        | 1       | Solo controla acceso al hub            |
| VISO       | 26       | 26      | 13 permisos sin descripción            |

TOTAL ACTIVOS    177
INACTIVOS          0

La estructura central del catálogo se encuentra en public.app_permissions, asociada con public.apps; el modelo fue creado como parte del núcleo de permisos de Vento OS.

Inventario completo
ANIMA — 10
access
documents.delete
documents.upload
documents.view_all
employee_photos.upload
shift.cancel
shift.create
shift.edit
team.invite
team.view

🟡 Inconsistencia:

team.view
documents.view_all

Una usa la acción terminal view; la otra usa view_all, que mezcla acción y alcance.

AURA — 1
access

🟡 Solo existe el control de entrada a la aplicación.

FOGO — 8
access
production.batches
production.batches.create
production.batches.view
production.orders
production.recipe_book.view
production.recipes
production.recipes.manage

⚠️ Existen permisos generales y permisos específicos sobre el mismo recurso:

production.batches
production.batches.view
production.batches.create

También:

production.recipes
production.recipes.manage

No está claro si el permiso general representa lectura, acceso al módulo o una autorización superior.

NEXO — 111
Acceso y navegación
access
adjust.view
assets.view
assign_location.view
board.view
catalog.view
categories.view
code.view
conductor.view
count_initial.view
counts.view
designer.view
edit.view
entries.view
ficha.view
fulfillment.view
fulfillment_routes.view
jobs.view
kiosk_withdraw.view
locations.view
login.view
lpns.view
movements.view
new.view
no_access.view
open.view
operations.view
page_tsx.view
positions.view
prepare.view
presentations.view
production_batches.view
products.view
quick.view
receive.view
request_policies.view
scanner.view
settings.view
setup.view
sites.view
slug.view
stock.view
supply_routes.view
transfers.view
transit.view
units.view
warehouse.view
withdraw.view
zone.view
zones.view
Catálogo e inventario
catalog.products
cost_center.view
cost_centers.manage
cost_centers.view
inventory.adjustments
inventory.counts
inventory.entries
inventory.entries_emergency
inventory.locations
inventory.lpns
inventory.movements
inventory.production_batches
inventory.stock
inventory.transfers
inventory.validation
inventory.withdraw
Remisiones
inventory.remissions
inventory.remissions.all_sites
inventory.remissions.cancel
inventory.remissions.edit_own_pending
inventory.remissions.prepare
inventory.remissions.receive
inventory.remissions.request
inventory.remissions.transit
inventory.remissions.view_dispatch
Rutas técnicas generadas
inventory_assets_counts_id.view
inventory_assets_groups_id.view
inventory_assets_items_id.view
inventory_assets_new.view
inventory_catalog_id.view
inventory_catalog_id_presentations.view
inventory_catalog_id_request_policies.view
inventory_catalog_new.view
inventory_catalog_presentations.view
inventory_catalog.view
inventory_count_initial_session_id.view
inventory_locations_id.view
inventory_remissions_id.view
inventory_remissions.view
inventory_settings_locations_id_catalog.view
inventory_settings_remissions.view
inventory_settings_request_policies.view
Finanzas internas
internal_invoices.cancel
internal_invoices.generate
internal_invoices.issue
internal_invoices.view
internal_invoices.view_amounts
internal_prices.manage
internal_prices.view
internal_reports.full_margin
internal_reports.view
internal_variances.approve
internal_variances.resolve
internal_variances.view
Impresión
printing.designer
printing.jobs
Configuración
settings.categories.manage
settings.remissions.manage
settings.sites.manage
settings.supply_routes.manage
settings.units.manage
Problema crítico de NEXO

⚠️ Aproximadamente 69 de los 111 permisos parecen haber sido creados automáticamente a partir de nombres de carpetas, páginas o rutas.

Ejemplos claramente técnicos:

page_tsx.view
slug.view
code.view
edit.view
new.view
inventory_catalog_id.view
inventory_assets_items_id.view
no_access.view
login.view

Estos códigos no expresan una capacidad empresarial verificable.

Duplicidades o solapamientos evidentes
cost_center.view
cost_centers.view

catalog.view
inventory_catalog.view

inventory.remissions
inventory_remissions.view

inventory.locations
locations.view
inventory_locations_id.view

inventory.movements
movements.view

inventory.stock
stock.view

inventory.transfers
transfers.view

inventory.withdraw
withdraw.view

🟡 No se eliminarán todavía porque primero debe comprobarse qué aplicaciones utilizan cada cadena.

NUMERA — 8
access
break_even.view
cost_centers.manage
cost_centers.view
expenses.manage
expenses.view
profitability.view
reports.view

✅ Es uno de los catálogos más coherentes.

La convención predominante es:

recurso.view
recurso.manage
ORIGO — 8
access
login.view
no_access.view
procurement.purchase_orders
procurement.receipts
product_master_review.view
suppliers.manage
suppliers.view

⚠️ login.view y no_access.view son páginas técnicas, no capacidades empresariales.

⚠️ Los siguientes permisos no indican acción:

procurement.purchase_orders
procurement.receipts

Sin embargo, sus nombres humanos dicen que son permisos de lectura.

Convención esperada posteriormente:

procurement.purchase_orders.view
procurement.receipts.view

No se deben renombrar todavía porque podrían estar escritos literalmente en el código.

Vento Pass — 1
access

🟡 El catálogo no representa operaciones como:

points.accumulate
points.redeem
rewards.manage
users.view

Parte de estas funciones parece estar siendo administrada desde VISO o PULSO.

PULSO — 3
access
delivery.override
pos.main

⚠️ pos.main no expresa una acción específica.

El catálogo aún no diferencia operaciones sensibles como:

sales.create
sales.cancel
payments.collect
cash.close
points.accumulate
points.redeem
orders.override

Esto se definirá después; no se agregan todavía.

Shell — 1
access

✅ Controla únicamente la entrada al hub principal.

VISO — 26
access
accounting.view
app_navigation.manage
app_updates.read
businesses.read
commercial_categories.read
content_blocks.read
delivery_rates.read
employee_operational_profiles.manage
menu.images.manage
menu.read
operational_points.manage
operational_preview.view
ops.audit.view
pass_products.read
pass_users.read
site_operational_roles.manage
staff.calendar.view
staff.documents.manage
staff.employee_photos.manage
staff.manage
staff.permissions.manage
staff.read
staff.schedule.view
vacancies.read
website_cms.read
Permisos sin descripción
accounting.view
app_updates.read
businesses.read
commercial_categories.read
content_blocks.read
delivery_rates.read
menu.read
pass_products.read
pass_users.read
staff.calendar.view
staff.schedule.view
vacancies.read
website_cms.read

⚠️ Son 13 permisos activos sin descripción funcional.

Convención mezclada
staff.read
staff.calendar.view
businesses.read
accounting.view

VISO utiliza simultáneamente:

.read
.view
.manage

No existe todavía una regla clara para distinguir read de view.

Hallazgos transversales
⚠️ 1. Dos clases de permisos están mezcladas
PERMISOS FUNCIONALES
inventory.remissions.prepare
staff.permissions.manage
delivery.override

PERMISOS DE RUTA
page_tsx.view
inventory_catalog_id.view
login.view
no_access.view

El catálogo debería autorizar capacidades. Las rutas deberían consumir esas capacidades, no convertirse automáticamente en permisos permanentes.

⚠️ 2. No existe convención canónica

Actualmente coexisten:

recurso
recurso.view
recurso.read
recurso.manage
recurso.accion
recurso.view_all
recurso.all_sites
recurso.full_margin
⚠️ 3. Hay 15 códigos sin acción terminal clara

Entre ellos:

anima.documents.view_all
fogo.production.batches
fogo.production.orders
fogo.production.recipes
nexo.catalog.products
nexo.inventory.adjustments
nexo.inventory.entries_emergency
nexo.inventory.production_batches
nexo.inventory.remissions
nexo.inventory.remissions.all_sites
nexo.printing.designer
nexo.printing.jobs
origo.procurement.purchase_orders
origo.procurement.receipts
pulso.pos.main

No todos son incorrectos, pero requieren una definición explícita.

⚠️ 4. Hay códigos repetidos entre aplicaciones

Esto no es necesariamente un error porque el código completo incluye la aplicación:

nexo.cost_centers.view
numera.cost_centers.view

Repetidos encontrados:

access
cost_centers.view
cost_centers.manage
login.view
no_access.view
⚠️ 5. NEXO concentra el 63 % del catálogo
NEXO              111
Resto del sistema  66
Total             177

Esto no significa que NEXO tenga realmente más capacidades. La diferencia proviene principalmente de permisos generados desde navegación.
