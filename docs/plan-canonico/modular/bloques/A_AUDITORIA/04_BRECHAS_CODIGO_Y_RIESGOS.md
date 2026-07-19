### ✅ AUTH-AUD-015 — Buscar permisos existentes sin asignación

Resumen
Permisos activos totales:          177
Con alguna asignación:             163
Sin ninguna asignación:             14

Los 14 permisos sin asignación pertenecen exclusivamente a NEXO.

Por aplicación:

| Aplicación | Permisos sin asignación |
| ---------- | ----------------------- |
| NEXO       | 14                      |
| ANIMA      | 0                       |
| AURA       | 0                       |
| FOGO       | 0                       |
| NUMERA     | 0                       |
| ORIGO      | 0                       |
| PASS       | 0                       |
| PULSO      | 0                       |
| SHELL      | 0                       |
| VISO       | 0                       |

Permisos sin ninguna asignación
Navegación general
nexo.conductor.view
nexo.fulfillment.view
nexo.fulfillment_routes.view
nexo.quick.view
nexo.receive.view
nexo.settings.view
nexo.zones.view
Catálogo y presentaciones
nexo.inventory_catalog.view
nexo.inventory_catalog_presentations.view
nexo.inventory_catalog_id_presentations.view
Políticas de solicitud
nexo.request_policies.view
nexo.inventory_settings_request_policies.view
nexo.inventory_catalog_id_request_policies.view
Configuración de ubicaciones
nexo.inventory_settings_locations_id_catalog.view
Distribución por capa

De los 177 permisos activos:

| Uso                               | Permisos |
| --------------------------------- | -------- |
| Solo rol base                     | 140      |
| Rol base + excepción individual   | 12       |
| Rol base + rol operativo          | 9        |
| Rol base + empleado + operativo   | 2        |
| Solo empleado                     | 0        |
| Solo rol operativo                | 0        |
| Empleado + operativo sin rol base | 0        |
| Sin asignación                    | 14       |

Hallazgo importante

Todos los permisos operativos actuales también existen en la matriz de roles base.

Permisos solo operativos: 0

Esto confirma que operational_role_permissions todavía no contiene capacidades verdaderamente exclusivas del contexto operativo.

El modelo operativo está duplicando parcialmente capacidades ya concedidas permanentemente.

Referencias en base de datos

Los 14 permisos se buscaron también dentro de:

funciones y RPC de public
políticas RLS

Resultado:

Referencias directas en funciones: 0
Referencias directas en RLS:       0

Por tanto, dentro de la base de datos no existe evidencia de que alguno sea utilizado por:

una validación SQL;
una función de autorización;
una política RLS;
una RPC.

Esto no descarta que puedan estar referenciados en el código frontend de NEXO, pero sí confirma que no participan directamente en autorización dentro de PostgreSQL.

Clasificación probable

#### 1. Probables permisos generados desde rutas

La mayoría presenta nombres derivados directamente de carpetas o segmentos de URL:

inventory_catalog_id_presentations.view
inventory_catalog_id_request_policies.view
inventory_settings_locations_id_catalog.view
inventory_settings_request_policies.view
fulfillment_routes.view

La presencia de:

_id_

en lugar de una entidad funcional indica que probablemente fueron generados transformando rutas dinámicas como:

/inventory/catalog/[id]/presentations

Esto coincide con la deuda detectada en AUTH-AUD-004.

#### 2. Posibles rutas antiguas o reemplazadas

Estos permisos podrían corresponder a pantallas que cambiaron de nombre o estructura:

conductor.view
fulfillment.view
fulfillment_routes.view
quick.view
receive.view
zones.view

#### 3. Posibles permisos contenedores

Estos podrían haber sido pensados para permitir acceso a una sección general:

inventory_catalog.view
settings.view
request_policies.view

Pero actualmente no están asignados a nadie.

Permisos especialmente sospechosos
nexo.inventory_catalog.view

Existe junto a permisos similares como:

nexo.catalog.view
nexo.catalog.products
nexo.products.view
nexo.inventory_catalog_id.view

Esto sugiere duplicación semántica.

nexo.request_policies.view

Convive con:

nexo.inventory_settings_request_policies.view
nexo.inventory_catalog_id_request_policies.view

Los tres representan aparentemente el mismo concepto en diferentes rutas.

nexo.receive.view

Podría superponerse con:

nexo.inventory.remissions.receive
nexo.inventory_remissions.view
nexo.entries.view

El nombre no aclara qué entidad se recibe.

nexo.conductor.view

El rol conductor_logistica tiene permisos funcionales:

nexo.access
nexo.inventory.remissions
nexo.inventory.remissions.transit

pero no tiene asignado nexo.conductor.view.

Esto puede significar:

la ruta conductor ya no usa este permiso

o:

el conductor tiene la acción, pero no el permiso de navegación

Esto deberá confirmarse contra el código de NEXO.

Implicación funcional

Un permiso activo sin asignación produce uno de estos escenarios:

Caso A — permiso muerto
Existe en catálogo
pero ningún usuario puede obtenerlo
y ningún código lo consulta

Debe eliminarse o desactivarse.

Caso B — permiso faltante en matriz
La pantalla o acción sí lo exige
pero nadie lo tiene asignado

La funcionalidad estaría bloqueada para todos, excepto donde exista bypass.

Caso C — ruta ya no protegida
El permiso fue creado
pero la ruta dejó de consultarlo

El registro quedó como residuo histórico.

Con la auditoría de base de datos no es posible decidir todavía cuál de los tres casos corresponde a cada permiso; requiere revisar NEXO.

Hallazgos principales
⚠️ 1. Catorce permisos activos no pueden concederse

Ninguna de las matrices actuales los asigna.

⚠️ 2. Todos son de NEXO

Esto refuerza que el problema está relacionado con su catálogo sobredimensionado y generación por rutas.

⚠️ 3. No están usados en la base de datos

No aparecen en funciones ni políticas RLS.

⚠️ 4. Existen grupos semánticamente duplicados

Especialmente:

catalog
request_policies
receive
settings
fulfillment
⚠️ 5. El modelo operativo no introduce permisos exclusivos

Todos los permisos operativos también están concedidos en algún rol base.

⚠️ 6. No existen excepciones exclusivamente individuales
Permisos solo en employee_permissions: 0

Las excepciones individuales continúan siendo redundantes.

Diagnóstico
✅ Confirmado
177 permisos activos.
14 sin ninguna asignación.
Los 14 pertenecen a NEXO.
Ninguno aparece en funciones SQL.
Ninguno aparece en políticas RLS.
No hay permisos exclusivamente operativos.
No hay permisos exclusivamente individuales.
🟡 Pendiente de validar en código
Si las rutas todavía existen.
Si el frontend consulta esos permisos.
Si fueron reemplazados por permisos semánticos.
Si alguna pantalla está bloqueada para todos.
Si pueden desactivarse sin impacto.

### ✅ AUTH-AUD-016 — Buscar permisos asignados que ninguna aplicación utiliza

Resultado general

De los 163 permisos activos con alguna asignación:

Permisos confirmados en uso:                 148
Permisos asignados sin uso confirmado:        15
Permiso adicional pendiente de confirmar:      1

Los 15 permisos confirmados sin uso generan:

45 filas redundantes en role_permissions
0 excepciones individuales
0 asignaciones a roles operativos
Permisos asignados que ninguna aplicación utiliza
FOGO
fogo.production.orders

No aparece en:

código actual de FOGO;
navegación activa;
registro disponible de pantallas;
funciones SQL;
políticas RLS.

FOGO sí utiliza otros permisos del módulo, como los de recetas y lotes, pero no se encontró consumo de production.orders.

Está asignado a siete roles:

cocinero
panadero
pastelero
repostero
gerente
gerente_general
propietario

Total:

7 filas en role_permissions
NEXO

Se confirmaron 14 permisos asignados sin consumo actual.

Catálogo
nexo.catalog.view
nexo.presentations.view
nexo.new.view

Existen permisos más concretos o rutas alternativas para esos conceptos, por ejemplo:

nexo.catalog.products
nexo.products.view
nexo.inventory_catalog_id.view
nexo.inventory_catalog_new.view

Esto indica que los códigos sin uso son probablemente versiones antiguas o demasiado genéricas.

Centros de costo
nexo.cost_center.view

Convive con:

nexo.cost_centers.view

El sincronizador de navegación normaliza tanto cost-center como cost-centers hacia cost_centers.view, no hacia cost_center.view.

Por tanto:

nexo.cost_center.view

es un duplicado legado sin consumo.

Reportes internos
nexo.internal_reports.view
nexo.internal_reports.full_margin

El sincronizador sí utiliza:

nexo.internal_reports.view

como permiso sugerido para la ruta correspondiente en su configuración de overrides.

Sin embargo, en la base actual ese permiso:

no está en navegación activa;
no está en una pantalla disponible del registro;
no aparece en código de aplicación;
no aparece en RPC o RLS.

Por eso actualmente está definido conceptualmente, pero no consumido operacionalmente.

internal_reports.full_margin tampoco tiene referencias.

Remisiones
nexo.inventory.remissions.view_dispatch

No aparece en el código actual.

El conductor utiliza actualmente la combinación:

nexo.inventory.remissions
nexo.inventory.remissions.transit

Por tanto, view_dispatch parece un permiso antiguo reemplazado.

Validación de inventario
nexo.inventory.validation

No tiene referencias en aplicación, navegación, RPC ni RLS.

Está asignado a:

bodeguero
gerente_general
propietario

Pero no concede una capacidad observable.

Impresión
nexo.printing.designer

Convive con permisos de rutas como:

nexo.designer.view
nexo.jobs.view

No se encontró consumo del permiso semántico printing.designer.

Configuración
nexo.settings.categories.manage
nexo.settings.remissions.manage
nexo.settings.sites.manage
nexo.settings.supply_routes.manage
nexo.settings.units.manage

Los cinco están asignados a:

propietario
gerente_general

Pero ninguno aparece en:

guards de la aplicación;
navegación activa;
registro vigente de pantallas;
funciones de base de datos;
RLS.

Las pantallas actuales parecen estar protegidas mediante permisos de vista generados por ruta o mediante otras capacidades más específicas.

Impacto por permiso

| Permiso                                 | Roles con asignación |
| --------------------------------------- | -------------------- |
| fogo.production.orders                  | 7                    |
| nexo.catalog.view                       | 3                    |
| nexo.cost_center.view                   | 4                    |
| nexo.internal_reports.full_margin       | 3                    |
| nexo.internal_reports.view              | 4                    |
| nexo.inventory.remissions.view_dispatch | 2                    |
| nexo.inventory.validation               | 3                    |
| nexo.new.view                           | 3                    |
| nexo.presentations.view                 | 4                    |
| nexo.printing.designer                  | 2                    |
| nexo.settings.categories.manage         | 2                    |
| nexo.settings.remissions.manage         | 2                    |
| nexo.settings.sites.manage              | 2                    |
| nexo.settings.supply_routes.manage      | 2                    |
| nexo.settings.units.manage              | 2                    |

Total:

15 permisos
45 asignaciones base sin efecto observable
Caso pendiente: NUMERA
numera.reports.view

El permiso:

está asignado a propietario y gerente_general;
no aparece en navegación activa;
no aparece en el registro de pantallas;
no aparece en SQL o RLS;
no produjo resultados en la búsqueda del repositorio.

Sin embargo, vento-numera todavía no tiene índice de búsqueda de código disponible en GitHub.

Por tanto, se clasifica como:

🟡 Probablemente sin uso
pero no confirmado con el mismo nivel de certeza

No debe eliminarse todavía sin revisar localmente el repositorio o habilitar su índice.

Falsos positivos descartados
Permisos *.access

Inicialmente aparecían sin referencia literal:

anima.access
aura.access
pass.access
shell.access

No se clasifican como muertos porque los guards construyen el permiso dinámicamente:

`${appId}.access`

El guard de PULSO, por ejemplo, verifica el acceso general de esta forma antes de comprobar permisos específicos.

Este patrón se replica entre aplicaciones.

ANIMA

Inicialmente aparecían como candidatos:

anima.shift.create
anima.shift.edit
anima.shift.cancel
anima.team.invite
anima.team.view

Pero sí existen referencias en las pantallas actuales:

app/(app)/shifts.tsx
app/(app)/team.tsx

La búsqueda identifica shift.create en la pantalla de turnos y team.invite en la pantalla de equipo.

No son permisos muertos.

PULSO

Los tres permisos asignados están usados:

pulso.access
pulso.pos.main
pulso.delivery.override

pos.main protege la vista de salón mediante requireAppAccess.

delivery.override se consulta antes de habilitar la confirmación manual excepcional de una entrega.

VISO

viso.staff.manage aparecía inicialmente sin referencia de base de datos, pero sí se utiliza en varias pantallas del repositorio:

staff/new
staff/[id]
staff/shared-devices/new

Por tanto, no está muerto.

Hallazgos principales
⚠️ 1. Existen 45 asignaciones que no conceden capacidades reales

Estas filas aumentan artificialmente el tamaño de las matrices de:

propietario;
gerente general;
gerente;
contador;
roles productivos;
bodeguero;
conductor.
⚠️ 2. NEXO concentra nuevamente la deuda
14 de 15 permisos confirmados sin uso

pertenecen a NEXO.

Esto es consistente con:

generación histórica desde rutas;
cambios de nombres;
duplicados singular/plural;
permisos semánticos reemplazados por códigos técnicos.
⚠️ 3. Permiso asignado no equivale a funcionalidad protegida

Un rol puede mostrar decenas de permisos en VISO aunque varios:

no sean consultados;
no controlen ninguna ruta;
no protejan ninguna RPC;
no tengan efecto observable.
⚠️ 4. La navegación dinámica debe incluirse siempre en la auditoría

Buscar solamente cadenas en GitHub habría producido falsos positivos.

NEXO carga required_permission_code desde base de datos y evalúa cada elemento de navegación dinámicamente.

⚠️ 5. El sincronizador todavía puede crear nuevos residuos

Cuando una ruta no tiene override, el script genera permisos a partir del último segmento o de toda la ruta.

Esto explica códigos técnicos y duplicados, y significa que limpiar solo los datos actuales no evitaría su reaparición.

Diagnóstico
✅ Confirmado sin uso
fogo.production.orders

nexo.catalog.view
nexo.cost_center.view
nexo.internal_reports.full_margin
nexo.internal_reports.view
nexo.inventory.remissions.view_dispatch
nexo.inventory.validation
nexo.new.view
nexo.presentations.view
nexo.printing.designer
nexo.settings.categories.manage
nexo.settings.remissions.manage
nexo.settings.sites.manage
nexo.settings.supply_routes.manage
nexo.settings.units.manage
🟡 Pendiente de confirmación
numera.reports.view

### ✅ AUTH-AUD-017 — Buscar nombres inconsistentes o duplicados

Resumen general
Permisos activos:                         177
Códigos con formato técnicamente válido: 177
Códigos con segmentos "_id":              12
Códigos con "page_tsx":                    1
Permisos sin human_label:                122
Permisos sin human_description:          122
Permisos sin descripción básica:          13

No existen errores sintácticos como espacios, mayúsculas o caracteres inválidos en los códigos.

El problema es semántico y de convención, no de formato PostgreSQL.

#### 1. Duplicados semánticos en NEXO

Se identificaron al menos 12 familias donde varios permisos representan la misma entidad o una capacidad difícil de distinguir.

Catálogo
nexo.catalog.products
nexo.catalog.view
nexo.inventory_catalog.view
nexo.inventory_catalog_id.view
nexo.products.view

Impacto:

5 permisos
12 asignaciones

Problemas:

catalog frente a inventory_catalog;
products como entidad y como ruta;
permiso técnico de detalle inventory_catalog_id.view;
mezcla de navegación y capacidad funcional.
Centros de costo
nexo.cost_center.view
nexo.cost_centers.view
nexo.cost_centers.manage

numera.cost_centers.view
numera.cost_centers.manage

Impacto:

5 permisos
15 asignaciones

Dentro de NEXO existe el duplicado directo:

cost_center.view
cost_centers.view

El sincronizador actual normaliza las rutas singular y plural hacia:

cost_centers.view

Por tanto, cost_center.view es el alias legado.

Los permisos equivalentes de NUMERA no son duplicados técnicamente porque pertenecen a otra aplicación, pero representan la misma entidad empresarial y necesitan una frontera clara de responsabilidad.

Remisiones
nexo.inventory.remissions
nexo.inventory_remissions.view
nexo.inventory_remissions_id.view
nexo.inventory_settings_remissions.view

Impacto:

4 permisos
26 asignaciones

El primero es funcional:

inventory.remissions

Los otros tres están derivados de rutas:

inventory_remissions.view
inventory_remissions_id.view
inventory_settings_remissions.view

No existe una diferencia inteligible para un administrador que configure permisos desde VISO.

Ubicaciones
nexo.inventory.locations
nexo.locations.view
nexo.inventory_locations_id.view

Impacto:

3 permisos
11 asignaciones
Movimientos
nexo.inventory.movements
nexo.movements.view

Impacto:

2 permisos
10 asignaciones
Stock
nexo.inventory.stock
nexo.stock.view

Impacto:

2 permisos
11 asignaciones
Traslados
nexo.inventory.transfers
nexo.transfers.view

Impacto:

2 permisos
8 asignaciones
Retiros
nexo.inventory.withdraw
nexo.withdraw.view

Impacto:

2 permisos
16 asignaciones

En estas cuatro familias se repite el mismo patrón:

permiso funcional:
inventory.`<entidad>`

permiso generado por pantalla:
`<entidad>.view`

#### 2. Duplicación en FOGO

Lotes de producción
fogo.production.batches
fogo.production.batches.view
fogo.production.batches.create

La separación entre view y create es razonable.

El problema es:

production.batches

porque no expresa una acción.

Impacto solo en FOGO:

3 permisos
23 asignaciones

Además, NEXO tiene sus propios permisos para el mismo concepto:

nexo.inventory.production_batches
nexo.production_batches.view

Familia completa:

5 permisos
33 asignaciones

Debe definirse si:

FOGO administra producción;
NEXO solo refleja movimientos resultantes;
o ambos pueden crear y consultar lotes.

Actualmente los nombres no hacen visible esa diferencia.

Recetas
fogo.production.recipes
fogo.production.recipes.manage
fogo.production.recipe_book.view

Impacto:

3 permisos
30 asignaciones

production.recipes está descrito como “Consultar recetas internas”, pero su código no termina en .view.

La forma consistente sería algo como:

production.recipes.view
production.recipes.manage

production.recipe_book.view parece otra vista del mismo dominio, pero no queda claro si es:

recetario operacional;
catálogo administrativo;
o una experiencia diferente de consulta.

#### 3. Códigos técnicos derivados de rutas

Se encontraron:

12 permisos con segmento "_id"
1 permiso con "page_tsx"

Ejemplos:

nexo.inventory_assets_counts_id.view
nexo.inventory_assets_groups_id.view
nexo.inventory_assets_items_id.view
nexo.inventory_catalog_id.view
nexo.inventory_count_initial_session_id.view
nexo.inventory_locations_id.view
nexo.inventory_remissions_id.view
nexo.page_tsx.view

Estos códigos revelan directamente la estructura de carpetas de Next.js:

[id]
page.tsx

No representan una capacidad empresarial.

Impacto

Los permisos técnicos tienen actualmente:

24 asignaciones en role_permissions

Es decir, no son únicamente residuos sin usar: algunos están concedidos a roles reales.

Causa confirmada

El sincronizador genera el permiso desde los segmentos de la ruta cuando no existe un override explícito:

ruta
→ último segmento o ruta concatenada
→ permiso *.view

Por eso rutas como:

/inventory/catalog/[id]

terminan representadas como:

inventory_catalog_id.view

#### 4. Nombres completamente genéricos

Se encontraron nombres repetidos que no explican qué capacidad representan.

ID

Siete permisos tienen exactamente:

name = ID
description = Permite acceder a ID.

Incluyen detalles de:

activos;
grupos;
productos;
conteos;
ubicaciones;
remisiones.

Desde VISO serían prácticamente indistinguibles.

New
nexo.inventory_assets_new.view
nexo.inventory_catalog_new.view
nexo.new.view

Los tres aparecen con:

name = New
Presentations
nexo.inventory_catalog_id_presentations.view
nexo.inventory_catalog_presentations.view
nexo.presentations.view
Request Policies
nexo.inventory_catalog_id_request_policies.view
nexo.inventory_settings_request_policies.view
nexo.request_policies.view
Catalog
nexo.catalog.view
nexo.inventory_catalog.view
nexo.inventory_settings_locations_id_catalog.view

Los nombres genéricos proceden de humanizar únicamente el último segmento de la ruta, perdiendo el contexto del módulo.

#### 5. Mezcla de español e inglés

NEXO contiene aproximadamente:

47 nombres claramente en inglés
69 descripciones genéricas:
"Permite acceder a ..."
21 nombres especialmente genéricos

Ejemplos:

Products
Locations
Movements
Transfers
Withdraw
Production Batches
Login
No Access
New
Open
Prepare
Transit
Warehouse

Mientras otros permisos usan español:

Ver stock
Registrar retiros de inventario
Crear y administrar centros de costo
Solicitar remisiones

AURA y PASS también mantienen:

name = Access

mientras las demás aplicaciones usan:

Entrar a NEXO
Entrar a FOGO
Entrar a PULSO
Entrar a VISO
Entrar al Hub

#### 6. Convenciones de lectura inconsistentes

Actualmente se usan tres modelos:

*.view
*.read
código sin acción terminal

Distribución:

.view    89 permisos
.read    11 permisos
.manage  20 permisos
VISO

VISO mezcla deliberadamente:

businesses.read
menu.read
pass_users.read
website_cms.read

accounting.view
operational_preview.view
staff.calendar.view

No hay una regla visible que explique por qué una entidad usa .read y otra .view.

FOGO
production.batches
production.recipes
production.orders

no expresan acción, mientras conviven con:

production.batches.view
production.batches.create
production.recipes.manage
ORIGO
procurement.purchase_orders
procurement.receipts

tampoco expresan acción.

Sus nombres indican que son permisos de consulta, pero el código no lo especifica.

PULSO
pos.main

representa una pantalla o módulo, no una acción.

Esto puede ser válido como permiso de entrada a una superficie, pero necesita una categoría explícita diferente de los permisos funcionales.

#### 7. Duplicados entre aplicaciones

Existen códigos relativos iguales en diferentes apps:

access                       10 aplicaciones
cost_centers.view            NEXO y NUMERA
cost_centers.manage          NEXO y NUMERA
login.view                   NEXO y ORIGO
no_access.view               NEXO y ORIGO
production_batches.view      FOGO y NEXO
Evaluación
Aceptable
`<app>.access`

Es una convención común y queda aislada por el prefijo de aplicación.

Requiere definición de propiedad
nexo.cost_centers.*
numera.cost_centers.*

La entidad es transversal. Debe decidirse qué aplicación es la propietaria administrativa y cuál solo la consume.

No deberían ser permisos
login.view
no_access.view

Login y “sin acceso” son infraestructura de autenticación, no capacidades que deban asignarse a trabajadores.

#### 8. Metadatos humanos incompletos

La tabla ya contiene campos preparados para mostrar permisos comprensibles:

human_label
human_description
human_group
human_sort_order

Pero:

122 de 177 permisos no tienen human_label
122 de 177 no tienen human_description

Cobertura aproximada:

55 de 177
31,1 %

Por aplicación:

| Aplicación | Permisos | Con metadatos humanos |
| ---------- | -------- | --------------------- |
| ANIMA      | 10       | 10                    |
| FOGO       | 8        | 8                     |
| PULSO      | 3        | 3                     |
| SHELL      | 1        | 1                     |
| ORIGO      | 8        | 5                     |
| VISO       | 26       | 12                    |
| NEXO       | 111      | 16                    |
| AURA       | 1        | 0                     |
| NUMERA     | 8        | 0                     |
| PASS       | 1        | 0                     |

NEXO tiene la peor combinación:

111 permisos
16 con metadatos humanos
95 sin presentación administrativa curada

#### 9. Descripciones ausentes

Existen 13 permisos sin descripción básica.

Esto coincide principalmente con permisos de VISO detectados anteriormente, como:

viso.accounting.view
viso.app_updates.read
viso.businesses.read
viso.commercial_categories.read
viso.content_blocks.read
viso.delivery_rates.read
viso.menu.read
viso.pass_products.read
viso.pass_users.read
viso.staff.calendar.view
viso.staff.schedule.view
viso.vacancies.read
viso.website_cms.read

No son necesariamente duplicados, pero impiden distinguir su propósito desde la matriz administrativa.

#### 10. El catálogo mezcla tres tipos de permisos

Actualmente app_permissions contiene en una sola lista:

Acceso a aplicación
nexo.access
pulso.access
viso.access
Navegación o pantalla
nexo.stock.view
nexo.inventory_catalog_id.view
nexo.login.view
pulso.pos.main
Acción empresarial
nexo.inventory.remissions.prepare
nexo.inventory.remissions.receive
pulso.delivery.override
viso.staff.manage

No existe un campo que clasifique claramente:

app_access
navigation
business_action
administrative_action
technical/internal

Aunque ya existen:

permission_audience
is_operational
requires_active_work_context

no sustituyen completamente esa clasificación.

Esta mezcla es la causa principal de que dos permisos con nombres distintos parezcan conceder la misma capacidad.

Hallazgos principales
⚠️ 1. NEXO concentra casi toda la inconsistencia
111 permisos.
69 descripciones generadas desde rutas.
47 nombres en inglés.
12 códigos con _id.
1 código con page_tsx.
95 sin metadatos humanos completos.
⚠️ 2. Existen duplicados funcionales y de navegación

Las familias más afectadas son:

catálogo
centros de costo
remisiones
ubicaciones
movimientos
stock
traslados
retiros
lotes de producción
recetas
presentaciones
políticas de solicitud
⚠️ 3. Los nombres administrativos no son fiables

Valores como:

ID
New
Catalog
Presentations
Request Policies

no permiten configurar una matriz de permisos de forma segura.

⚠️ 4. No existe una convención única de acciones
view
read
manage
código sin acción
nombre de pantalla

coexisten sin una taxonomía formal.

⚠️ 5. El sincronizador puede recrear el problema

Aunque se limpien los registros actuales, nuevas rutas sin override volverán a generar códigos técnicos.

Diagnóstico
✅ Correcto
Todos los códigos cumplen el formato técnico.
Los prefijos por aplicación evitan colisiones directas.
access funciona como convención transversal.
Algunas apps ya tienen metadatos humanos completos.
Los permisos funcionales más recientes son más claros.
❌ Inconsistente
Singular y plural para la misma entidad.
Puntos y guiones bajos usados para conceptos equivalentes.
Permisos funcionales mezclados con permisos de ruta.
Nombres en español e inglés.
.view, .read y códigos sin acción.
Códigos con [id] y page.tsx.
Login y No Access tratados como permisos.
Varias aplicaciones reclaman la misma entidad sin propiedad definida.

### ✅ AUTH-AUD-018 — Buscar decisiones hardcodeadas por rol

Resultado general

El sistema todavía contiene una cantidad relevante de decisiones como:

role === "propietario"
["propietario", "gerente_general"].includes(role)
role === "gerente"

en paralelo con:

has_permission(...)
has_operational_permission(...)
role_permissions
operational_role_permissions

Por tanto, la autorización efectiva continúa distribuida entre:

matriz de permisos
+
rol base hardcodeado
+
rol operativo
+
RLS
+
bypass administrativos

#### 1. Hardcode en funciones PostgreSQL

Se encontraron referencias directas a roles en funciones del esquema public.

Roles más utilizados

| Rol             | Funciones que lo mencionan | SECURITY DEFINER |
| --------------- | -------------------------- | ---------------- |
| gerente         | 9                          | 8                |
| propietario     | 7                          | 7                |
| gerente_general | 6                          | 6                |
| bodeguero       | 1                          | 1                |
| marketing       | 1                          | 1                |

Las referencias de los demás roles aparecieron principalmente por cuerpos auxiliares o coincidencias menores; no todas representan una decisión activa de acceso.

Funciones relevantes
is_owner
is_manager
is_global_manager
is_manager_or_owner
get_operational_context
can_manage_context_simulation_v1
can_access_recipe_scope
fogo_recipe_area_options
reconcile_staff_invitations
⚠️ Implicación

Las funciones auxiliares:

is_owner()
is_manager()
is_global_manager()

centralizan parcialmente el hardcode, lo cual es mejor que repetir listas en todas las políticas.

Sin embargo, siguen haciendo que la capacidad dependa directamente de:

employees.role

y no de un permiso como:

viso.staff.manage
viso.operational_preview.view
fogo.production.recipes.manage

#### 2. Bypass hardcodeado en get_operational_context

Continúa confirmado el bypass para:

propietario
gerente_general

Estos roles obtienen contexto operativo sin requerir:

turno activo;
check-in;
rol operativo;
permiso operativo;
coincidencia de sede.

Esto no proviene de la matriz de permisos, sino de una lista fija dentro de la función.

Consecuencia

Modificar role_permissions no puede retirar ese bypass.

Por ejemplo:

Eliminar todos los permisos NEXO de gerente_general

no impediría que get_operational_context continúe marcando:

bypass_applied = true
can_operate = true

#### 3. Hardcode en RLS

Se encontraron políticas RLS con referencias directas a roles.

Conteo aproximado

| Rol             | Políticas que lo mencionan |
| --------------- | -------------------------- |
| gerente         | 32                         |
| propietario     | 17                         |
| gerente_general | 16                         |
| cajero          | 2                          |
| mesero          | 2                          |
| barista         | 1                          |
| bodeguero       | 1                          |
| cocinero        | 1                          |
| panadero        | 1                          |
| pastelero       | 1                          |
| repostero       | 1                          |

Áreas afectadas

El hardcode aparece en políticas de:

employees
employee_shifts
employee_sites
attendance_logs
attendance_breaks
attendance_shift_events
staff_invitations
production_batches
product_images
announcements
document_types
support_tickets
users

#### 4. gerente es el rol más incrustado

El rol gerente aparece en 32 políticas RLS, más que cualquier otro.

Entre ellas:

employee_shifts_select_manager
employee_shifts_write_manager
attendance_logs_select_manager_scoped
attendance_logs_update_notes_scoped
attendance_breaks_select_manager_scoped
employees_select
employees_select_area
employees_update_management
staff_invitations_insert_management
staff_invitations_select_management
Problema

Esto convierte a gerente en una identidad técnica especial distribuida por toda la base.

Aunque se corrijan sus 115 permisos globales en role_permissions, todavía podría conservar capacidades por RLS.

Por tanto:

role_permissions

no es actualmente la única fuente de autoridad.

#### 5. Oficios operativos hardcodeados en RLS

La política:

production_batches_write_production

incluye directamente roles base como:

barista
cocinero
panadero
pastelero
repostero
gerente
gerente_general
propietario
⚠️ Inconsistencia con el modelo nuevo

El modelo operativo definitivo ya contiene:

produccion_cocina
produccion_panaderia
produccion_reposteria

Pero la política de escritura continúa autorizando mediante oficios base permanentes.

Eso permite que un trabajador con rol base cocinero pueda conservar acceso sobre producción aunque:

no tenga turno;
no tenga rol operativo activo;
esté trabajando en otra área;
esté en otra sede.

Esta es una colisión directa entre el modelo antiguo y el operativo.

#### 6. Cajeros y meseros hardcodeados para usuarios de Pass

Dos políticas:

users_select_cashier
users_select_cashier_for_qr

mencionan directamente roles como:

cajero
mesero
gerente
gerente_general
propietario

Esto vincula la lectura de usuarios o QR de Pass con nombres de puestos.

La capacidad debería expresarse como un permiso, por ejemplo:

pulso.clients.identify
pass.users.lookup
pulso.loyalty.scan

y no depender de que el trabajador se llame técnicamente cajero o mesero.

#### 7. Hardcode en NEXO

NEXO contiene múltiples decisiones directas basadas en roles.

Override de roles

Existe una configuración fija:

export const PRIVILEGED_ROLE_OVERRIDES = new Set([
  "propietario",
  "gerente_general",
]);

Esto permite que solo esos dos roles utilicen el sistema de simulación o cambio de rol de navegación.

La decisión no consulta un permiso como:

viso.operational_preview.view
nexo.role_override.use
Bypass de contexto de trabajo

Los componentes compartidos también mantienen una lista fija:

propietario
gerente_general

para evitar bloqueos por ausencia de jornada.

Esta misma decisión está repetida conceptualmente en:

frontend;
get_operational_context;
helpers SQL.
Pantallas con listas de roles

Se encontraron decisiones del tipo:

["propietario", "gerente_general", "gerente", "bodeguero"].includes(role)

para habilitar funcionalidades como listas o controles de inventario. Un ejemplo histórico y posiblemente aún representativo aparece en NEXO para habilitar un checklist.

El riesgo principal es que una pantalla migre a permisos mientras otra continúe usando la lista antigua.

#### 8. Hardcode en remisiones de NEXO

El módulo de remisiones ha migrado parcialmente a:

has_operational_permission

pero todavía contiene caminos especiales para roles privilegiados.

Las modificaciones recientes incorporaron tratamiento especial para propietario y gerente general durante creación y selección de áreas de remisión.

Problema

Una misma acción puede terminar autorizada por:

permiso operativo
OR
rol privilegiado
OR
permiso base

Esto dificulta probar que retirar un permiso realmente retire la capacidad.

#### 9. Hardcode en ANIMA

ANIMA todavía usa roles directamente para:

visibilidad de secciones;
administración de turnos;
acceso a equipo;
compatibilidad con la lógica anterior;
presentación del menú.

La propia documentación del repositorio reconoce una transición desde lógica hardcodeada hacia capacidades configurables.

Evaluación

No toda referencia a rol en ANIMA es incorrecta.

Uso legítimo
mostrar etiqueta del cargo
seleccionar diseño
explicar el perfil
Uso de autorización
permitir crear turnos
invitar trabajadores
ver equipo completo
administrar documentos

Estas últimas decisiones deberían depender de permisos, no del nombre del rol.

#### 10. Hardcode en ORIGO

Se encontraron decisiones por rol en:

proveedores
órdenes de compra
componentes del shell
configuración de role override

ORIGO ya dispone de permisos como:

origo.suppliers.view
origo.suppliers.manage
origo.procurement.purchase_orders
origo.procurement.receipts

Pero algunos caminos continúan verificando roles administrativos o privilegiados directamente.

Esto genera el patrón:

propietario o gerente_general
OR
has_permission(...)
Consecuencia

Los roles privilegiados pueden pasar aunque no tengan la fila correspondiente en role_permissions.

#### 11. Role override duplicado por aplicación

Se localizaron archivos como:

vento-nexo/src/lib/auth/role-override-config.ts
vento-pulso/src/lib/auth/role-override-config.ts
vento-origo/src/lib/auth/role-override-config.ts

Cada aplicación mantiene sus propias listas y reglas.

Riesgo

Una app puede considerar privilegiados:

propietario
gerente_general

mientras otra podría incluir o excluir:

gerente

No existe una fuente central única para decidir:

quién puede simular roles;
qué roles se pueden simular;
qué permisos se usan durante la simulación.

#### 12. Hardcode legítimo frente a hardcode de autorización

No toda comparación de rol debe eliminarse.

✅ Hardcode aceptable
Presentación
role === "bodeguero"
  ? "Vista de bodega"
  : "Vista general"
Compatibilidad de experiencia
elegir landing inicial
ordenar accesos
mostrar ayudas específicas
Conversión temporal entre modelos
cocinero → produccion_cocina
conductor → conductor_logistica

si está centralizada y documentada.

❌ Hardcode de autorización
if (role === "propietario") {
  permitirModificar();
}
if (["gerente", "bodeguero"].includes(role)) {
  permitirInventario();
}
using (current_employee_role() in ('propietario','gerente_general'))

cuando ya existe o debería existir un permiso específico.

#### 13. Por qué el hardcode es especialmente riesgoso ahora

El sistema ya permite modificar matrices desde datos:

role_permissions
employee_permissions
operational_role_permissions

Pero una decisión hardcodeada no responde a esos cambios.

Ejemplo

VISO podría retirar:

nexo.inventory.stock

a un gerente.

Sin embargo, si una página contiene:

role === "gerente"

el gerente seguirá entrando.

Caso inverso

VISO podría conceder un nuevo permiso a auxiliar_administrativa.

Pero si la pantalla exige:

["propietario", "gerente_general"].includes(role)

la concesión no tendrá efecto.

Esto hace que la interfaz administrativa de permisos pueda mostrar una realidad distinta al comportamiento de la aplicación.

#### 14. Fuentes actuales de privilegio

La autorización efectiva tiene actualmente al menos seis fuentes:

#### 1. role_permissions

#### 2. employee_permissions

#### 3. operational_role_permissions

#### 4. RLS por rol

#### 5. funciones helper por rol

#### 6. listas de roles en frontend/backend

Además existen:

#### 7. bypass de get_operational_context

#### 8. role override por aplicación

Diagnóstico

No es posible afirmar:

“Este trabajador puede hacer X”

consultando únicamente una tabla.

Hay que revisar toda la cadena.

Hallazgos críticos
🔴 1. gerente aparece en 32 políticas RLS

Corregir únicamente su matriz de permisos no retiraría todas sus capacidades.

🔴 2. Roles productivos base siguen autorizando escritura

La política de lotes de producción ignora el modelo de rol operativo del turno.

🔴 3. Propietario y gerente general tienen bypass repetido

La excepción existe en:

PostgreSQL;
frontend;
componentes compartidos;
configuración de role override.
🟠 4. Algunas apps mezclan permiso y rol

Patrón frecuente:

rol privilegiado OR permiso

Los privilegios del rol no son revocables desde la matriz.

🟠 5. El role override está duplicado

NEXO, ORIGO y PULSO mantienen configuraciones separadas.

🟠 6. Permisos configurables pueden no producir efecto

Una concesión o revocación puede ser ignorada por una decisión hardcodeada.

Diagnóstico por capa
Base de datos

❌ RLS depende extensamente de roles base.
❌ Varias funciones privilegiadas contienen listas de roles.
❌ Producción sigue usando oficios base.
❌ El bypass operativo no depende de un permiso.

Aplicaciones

❌ Existen listas fijas de roles privilegiados.
❌ Hay páginas que habilitan funciones por cargo.
❌ El override está duplicado entre repositorios.
🟡 Parte de NEXO y las apps nuevas ya usa guards y permisos correctamente.

Modelo operativo

❌ El rol operativo aún no reemplaza por completo al rol base.
❌ Los oficios antiguos siguen concediendo capacidad permanente.
❌ Retirar un permiso operativo no garantiza retirar el acceso.

### ✅ AUTH-AUD-019 — Buscar vistas protegidas solo desde la interfaz

Resultado general

Se confirmaron dos tipos de problema:

| Clasificación                                                               | Casos                      |
| --------------------------------------------------------------------------- | -------------------------- |
| 🔴 Permiso existente solo en navegación; servidor acepta un permiso inferior | 7 superficies confirmadas  |
| 🟠 Acción sin repetir autorización, pero protegida por RLS                   | 3 superficies confirmadas  |
| 🟡 Candidatos que requieren auditoría funcional individual                   | Entradas y retiros de NEXO |

La concentración principal está en VISO.

#### 1. VISO — Tarifas de domicilio

Permiso declarado

La navegación exige:

viso.delivery_rates.read
Protección real

La página solo llama:

requireAppAccess({
  appId: "viso",
  returnTo: "/delivery-rates",
});

Eso comprueba únicamente:

viso.access

Después utiliza:

createAdminClient()

para leer todas las tarifas. Las acciones saveDeliveryRate y deleteDeliveryRate también utilizan el cliente administrativo y no ejecutan ninguna comprobación de permiso.

Consecuencia

Un usuario que tenga:

viso.access = true
viso.delivery_rates.read = false

puede:

abrir directamente /delivery-rates;
consultar tarifas;
crear o modificar rangos;
eliminar tarifas.

Como createAdminClient() usa privilegios administrativos, RLS no representa una barrera.

Clasificación: 🔴 crítica.

#### 2. VISO — Vacantes

Permiso declarado
viso.vacancies.read
Lista de vacantes

La página /vacancies solo exige viso.access y luego usa createAdminClient() para consultar el esquema talento.

Creación

La ruta /vacancies/new y su Server Action createVacancy también exigen únicamente acceso general a VISO.

La acción posteriormente inserta la vacante mediante el cliente administrativo.

Consecuencia

Cualquier usuario con entrada general a VISO podría:

consultar vacantes;
abrir directamente la página de creación;
crear y publicar una vacante;
establecer salario, sede y condiciones laborales.

El permiso específico viso.vacancies.read no controla realmente la superficie.

Clasificación: 🔴 crítica.

#### 3. VISO — Usuarios de Vento Pass

Permiso declarado
viso.pass_users.read
Lista

La página solo exige viso.access y utiliza createAdminClient() para leer:

nombre;
correo;
teléfono;
puntos;
estado;
fecha de creación.
Creación manual

La ruta /pass-users/new y su Server Action también exigen únicamente acceso general.

La acción permite insertar un cliente y definir directamente:

loyalty_points
Consecuencia

Un usuario con viso.access, pero sin viso.pass_users.read, podría:

consultar datos personales de clientes;
buscar por nombre, correo o teléfono;
crear clientes manualmente;
asignarles un saldo inicial de puntos.

Clasificación: 🔴 crítica por exposición de datos y mutación financiera.

#### 4. VISO — Menú comercial y reordenamiento

Permiso declarado
viso.menu.read
Página

La página /menu solo exige acceso general y carga el catálogo mediante createAdminClient().

Mutación

El componente permite cambiar el orden enviando:

POST /api/viso/menu/reorder

La ruta API verifica solamente:

requireAppAccess({
  appId: "viso",
  returnTo: "/menu",
});

Después usa createAdminClient() para modificar catalog_item_collections.

Consecuencia

Cualquier usuario con viso.access puede llamar directamente el endpoint y reordenar productos del menú comercial.

Clasificación: 🔴 crítica.

#### 5. VISO — Contabilidad

Permiso declarado
viso.accounting.view
Página

La página /accounting solo exige:

viso.access

y llama la RPC:

viso_accounting_dashboard
RPC

La función es:

SECURITY DEFINER
owner = postgres
authenticated puede ejecutarla

Su única comprobación interna es:

has_permission('viso.access')

No verifica:

viso.accounting.view

La RPC devuelve información como:

valoración total de inventario;
costos unitarios;
compras del mes;
impuestos estimados;
órdenes de compra comprometidas;
productos con mayor valor;
resultados por sede.
Consecuencia

El permiso contable específico no tiene efecto real.

Cualquier trabajador con viso.access puede invocar directamente:

rpc/viso_accounting_dashboard

incluso sin abrir la página.

Además, si p_site_id es nulo, el cálculo incluye todas las sedes activas; la función no filtra por employee_sites.

Clasificación: 🔴 crítica por exposición financiera transversal.

#### 6. VISO — Contenido de Vento Pass

Permiso declarado
viso.content_blocks.read
Página

La lista /content-blocks solo exige viso.access.

La página de detalle también exige solamente acceso general.

Acción de actualización

updateContentBlock no repite ningún guard. Intenta actualizar directamente app_content_blocks.

Protección efectiva

En este caso sí existe una barrera RLS:

product/app content write:
is_owner() OR is_global_manager()

Por tanto:

cualquier usuario con viso.access puede intentar abrir la superficie;
los bloques activos son además públicamente seleccionables;
la modificación queda bloqueada por RLS para usuarios no privilegiados.
Evaluación

El permiso:

viso.content_blocks.read

no controla la lectura de la página.

La escritura no depende solo de la interfaz porque RLS actúa como segunda barrera.

Clasificación: 🟠 acceso de página incorrecto, escritura respaldada por RLS.

#### 7. VISO — Negocios

Permiso declarado
viso.businesses.read
Protección real

La página /businesses solo exige:

viso.access

y muestra enlaces directos para crear y editar negocios.

La consulta accede a la configuración de pass.pass_satellites.

Consecuencia

El permiso específico de negocios no controla el acceso directo a la lista.

Las mutaciones de páginas secundarias requieren revisión individual antes de afirmar que todas puedan ejecutarse, pero la lectura y navegación ya quedan expuestas a cualquier usuario con acceso general a VISO.

Clasificación: 🔴 lectura protegida solo por permiso general.

#### 8. VISO — Otras superficies con el mismo patrón

La navegación define permisos específicos para:

viso.menu.read
viso.vacancies.read
viso.pass_users.read
viso.businesses.read
viso.delivery_rates.read
viso.content_blocks.read
viso.accounting.view

Pero sus páginas utilizan solamente:

requireAppAccess({ appId: "viso" })
Patrón estructural
Sidebar
  ↓ filtra con permiso específico

URL directa
  ↓ página verifica solo viso.access

Server Action / API / RPC
  ↓ en varios casos usa createAdminClient

Esto significa que el sidebar da una apariencia de aislamiento que no coincide con el servidor.

Ocultar el enlace no representa autorización.

#### 9. NEXO — Rutas de abastecimiento

Interfaz

La página solo muestra la administración a:

propietario
gerente_general
Server Actions

Estas acciones no repiten la validación:

addRoute
toggleRoute
deleteRoute
RLS

La tabla sí tiene:

is_owner() OR is_global_manager()

tanto en USING como en WITH CHECK.

Resultado

Una llamada directa a la Server Action llegaría hasta PostgreSQL, pero RLS impediría la modificación para un trabajador no autorizado.

Clasificación: 🟠 defensa en profundidad incompleta, no bypass confirmado.

#### 10. NEXO — Sedes y capacidades operativas

Las acciones:

createSite
updateSiteCapabilities

no verifican el rol dentro de la acción. La página solo oculta o deshabilita los controles según canManage.

Sin embargo, las tablas tienen políticas:

sites_write_owner
site_operational_capabilities_write_admin

con:

is_owner() OR is_global_manager()
Resultado

No se confirmó modificación no autorizada, pero la seguridad depende exclusivamente de RLS y no de la acción de servidor.

Clasificación: 🟠.

#### 11. NEXO — Categorías

La interfaz calcula:

canManage =
propietario OR gerente_general

En este caso las acciones llaman a:

requireCategoryManager()

antes de modificar datos.

Además, product_categories cuenta con RLS equivalente.

Resultado

Existe control en:

interfaz
+ Server Action
+ RLS

Clasificación: ✅ correctamente protegido, aunque sigue hardcodeado por rol.

#### 12. NEXO — Políticas de solicitud

saveRequestConfiguration verifica de nuevo:

nexo.catalog.products

o el rol administrativo privilegiado antes de realizar la modificación.

Clasificación: ✅ control en servidor confirmado.

#### 13. ORIGO — Proveedores

La lista oculta los controles cuando canManageSuppliers es falso.

Las acciones de creación, actualización y eliminación repiten:

requireCanManageSuppliers

Clasificación: ✅ correctamente protegido en servidor.

#### 14. VISO — Roles y permisos

Las mutaciones administrativas sí exigen explícitamente:

viso.staff.permissions.manage

antes de utilizar el cliente administrativo.

Clasificación: ✅ correctamente protegido.

#### 15. Candidatos pendientes de endurecimiento en NEXO

Entradas de inventario

La página exige:

nexo.inventory.entries_emergency

Pero createEntry empieza verificando únicamente:

sesión;
trabajador;
sede seleccionada.

No repite el permiso de la página en el tramo inicial auditado.

La mutación posterior depende de varias tablas y posiblemente RPC/RLS adicionales. No se clasificó como bypass confirmado sin revisar toda la cadena transaccional.

Retiros

La vista oculta el formulario cuando la configuración del LOC deshabilita el retiro manual.

La acción submitWithdraw comienza comprobando sesión y sede, pero no muestra una comprobación explícita de:

nexo.inventory.withdraw

en el inicio auditado.

También requiere revisión completa de la RPC o inserción final para determinar la barrera definitiva.

Clasificación de ambos: 🟡 riesgo de defensa en profundidad; no declarados como vulnerabilidad confirmada en este paso.

Hallazgos principales
🔴 1. La navegación no es una frontera de seguridad

Los permisos de app_navigation_items determinan qué enlaces se muestran, pero no obligan automáticamente a la página a verificar el mismo permiso.

🔴 2. createAdminClient() amplifica el problema

Cuando una página o acción usa el cliente administrativo:

RLS deja de ser la segunda barrera

Por tanto, el guard de la propia página o acción debe ser exacto.

🔴 3. VISO usa viso.access como permiso universal

Varias superficies sensibles aceptan acceso general aunque ya existen permisos específicos:

accounting.view
pass_users.read
vacancies.read
delivery_rates.read
businesses.read
menu.read
content_blocks.read
🔴 4. Algunos permisos solo tienen efecto visual

Retirar viso.accounting.view, por ejemplo:

elimina o esconde el enlace;
no bloquea la URL;
no bloquea la RPC;
no evita consulta de información financiera.
🟠 5. Hay Server Actions que confían solo en RLS

En NEXO esto evita actualmente el bypass, pero cualquier cambio futuro de política podría abrir la acción sin modificar el código de la aplicación.

🟠 6. Los permisos .read también controlan páginas de escritura

Permisos como:

delivery_rates.read
vacancies.read
menu.read

están asociados a superficies que permiten modificar datos.

La taxonomía actual no distingue adecuadamente:

view
create
update
delete
publish
reorder
Diagnóstico
🔴 Bypass o exposición confirmada
VISO /delivery-rates
VISO /vacancies y /vacancies/new
VISO /pass-users y /pass-users/new
VISO /menu y /api/viso/menu/reorder
VISO /accounting y viso_accounting_dashboard
VISO /businesses
🟠 Permiso de navegación no respetado, pero RLS protege mutación
VISO /content-blocks
NEXO /inventory/settings/supply-routes
NEXO /inventory/settings/sites
✅ Servidor vuelve a autorizar
NEXO categorías
NEXO políticas de solicitud
ORIGO proveedores
VISO roles y permisos
🟡 Requiere profundización transaccional
NEXO entradas
NEXO retiros

### ✅ AUTH-AUD-020 — Crear informe de riesgos y brechas

Resultado principal

La arquitectura actual tiene una base funcional, pero no existe todavía una frontera única de autorización. La seguridad depende de una combinación variable de:

permisos declarados;
navegación;
guards de aplicación;
comparaciones hardcodeadas por rol;
RLS;
RPC y funciones SECURITY DEFINER;
clientes administrativos.
Riesgos consolidados

| Severidad  | Cantidad |
| ---------- | -------- |
| 🔴 Críticos | 3        |
| 🟠 Altos    | 6        |
| 🟡 Medios   | 7        |
| 🔵 Bajos    | 1        |
| Total      | 17       |

Los riesgos críticos se concentran en:

Permisos específicos de VISO que solo afectan la navegación, mientras el servidor acepta viso.access.
Uso de createAdminClient() después de guards insuficientes, eliminando la protección adicional de RLS.
RPC contable SECURITY DEFINER con alcance demasiado amplio, protegida por viso.access en vez de viso.accounting.view.
Indicadores estructurales incluidos
177 permisos activos.
14 permisos sin ninguna asignación.
117 permisos asignados que no aparecen en navegación.
13 roles operativos, de los cuales varios no tienen permisos.
1 de 40 empleados activos con perfil operativo por sede.
2 dispositivos compartidos activos.
0 sesiones persistidas de actor en dispositivos compartidos.
17 permisos individuales revisados, todos redundantes respecto al rol base.
Modelo esencialmente aditivo, sin denegaciones efectivas.
Secuencia recomendada
P0: cerrar los bypasses confirmados de VISO.
P0: detener nuevos hardcodes y excepciones.
P1: aprobar la matriz canónica de autorización.
P1: unificar has_permission, has_operational_permission y los guards.
P1: normalizar el catálogo de permisos.
P2: completar contexto operativo, turnos y sesiones compartidas.
P2: endurecer RLS, RPC y funciones privilegiadas.
P3: limpiar duplicados, excepciones y asignaciones heredadas.

El informe contiene el registro completo de riesgos, evidencia, impacto, prioridad, tratamiento recomendado, decisiones pendientes y criterios de cierre.
Riesgos y brechas de autorización en Vento OS
Informe consolidado de AUTH-AUD-001 a AUTH-AUD-019. Corte: 17 de julio de 2026. Alcance: roles, permisos, contexto operativo, turnos, dispositivos compartidos, RLS, RPC, funciones privilegiadas y protecciones de aplicación.

17
riesgos consolidados
3
riesgos críticos
177
permisos activos
14
permisos sin asignación
117
asignados fuera de navegación
2
dispositivos compartidos activos
Executive Summary
La arquitectura tiene una base útil, pero no una frontera de autorización única. La seguridad efectiva depende de una combinación variable de navegación, guards, roles hardcodeados, RLS, RPC y clientes administrativos.
El riesgo inmediato está en VISO. Se confirmaron superficies donde un permiso específico solo oculta el enlace, mientras la URL, acción, API o RPC acepta viso.access y, en varios casos, opera con privilegios administrativos.
El modelo operativo todavía no reemplaza el legado. La mayoría de empleados no tiene perfil operativo por sede, varios roles operativos carecen de permisos y el rol base continúa otorgando capacidades amplias.
No debe iniciarse una limpieza destructiva todavía. Primero deben aprobarse la matriz definitiva, la precedencia de contexto y el contrato único de autorización; después se endurecen las superficies críticas y finalmente se depura el legado.
Mapa de riesgo
Crítico — acceso privilegiado
Guards insuficientes combinados con createAdminClient() o RPC SECURITY DEFINER.

Decisión: remediación inmediata antes de ampliar usuarios de VISO.

Alto — modelo inconsistente
Roles base y operativos se solapan; permisos aditivos y contexto parcial producen resultados distintos por aplicación.

Decisión: aprobar arquitectura canónica antes de nuevas asignaciones.

Medio — deuda de control
Acciones que confían solo en RLS, nombres inconsistentes, sesiones operativas incompletas y catálogo sobredimensionado.

Decisión: resolver durante la estabilización.

Bajo — infraestructura sin uso
Simulación y otros componentes existen pero no participan de forma consistente en producción.

Decisión: completar o retirar, no mantener ambiguos.

Registro consolidado de riesgos

| ID   | Severidad | Riesgo                                                      | Evidencia                                                                                                                     | Impacto                                                                                                  | Estado     | Tratamiento recomendado                                                                                  |
| ---- | --------- | ----------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- | ---------- | -------------------------------------------------------------------------------------------------------- |
| R-01 | Crítico   | Permisos específicos no aplicados en servidor               | Varias superficies de VISO solo exigen viso.access aunque la navegación declara permisos específicos.                         | Acceso directo por URL o API a datos de clientes, contabilidad, vacantes, tarifas, negocios y menú.      | Confirmado | Corregir guards de página, acciones, rutas API y RPC; prohibir que navegación sea la única barrera.      |
| R-02 | Crítico   | Cliente administrativo tras guard insuficiente              | createAdminClient() se usa después de comprobar únicamente acceso general.                                                    | RLS deja de actuar como segunda barrera; una falla de guard se convierte en acceso privilegiado.         | Confirmado | Exigir permiso exacto antes de cada uso privilegiado y reducir el uso de service role.                   |
| R-03 | Crítico   | RPC contable SECURITY DEFINER demasiado amplia              | viso_accounting_dashboard valida viso.access, no viso.accounting.view, y puede consolidar todas las sedes.                    | Exposición transversal de inventario, costos, compras e impuestos.                                       | Confirmado | Cambiar validación interna, limitar alcance por sede y revisar EXECUTE.                                  |
| R-04 | Alto      | Modelo aditivo sin denegaciones efectivas                   | Permisos base, operativos y por empleado se acumulan; no hay un mecanismo de deny utilizado.                                  | Un permiso amplio de rol base no puede restringirse con contexto operativo o excepción individual.       | Confirmado | Definir precedencia, deny explícito o modelo de grants mínimos por contexto.                             |
| R-05 | Alto      | Rol base mezcla identidad administrativa y oficio operativo | El catálogo de roles base contiene cargos administrativos y trabajos operativos heredados.                                    | Duplicidad conceptual, grants heredados excesivos y ambigüedad al resolver contexto.                     | Confirmado | Separar rol administrativo, perfil laboral y rol operativo sin eliminar datos hasta migrar dependencias. |
| R-06 | Alto      | Roles operativos incompletos                                | 6 de 13 roles operativos no tienen permisos; FOGO, ORIGO y NUMERA casi no usan asignaciones operativas.                       | El sistema depende del rol base o de decisiones de interfaz en vez del contexto real del turno.          | Confirmado | Completar matriz operacional por aplicación y definir qué módulos requieren turno activo.                |
| R-07 | Alto      | Contexto operativo con cobertura parcial                    | Solo 1 de 40 empleados activos tiene perfil operativo por sede; la mayoría depende del turno y valores manuales.              | Defaults inconsistentes, comportamiento distinto por app y mayor probabilidad de fallback incorrecto.    | Confirmado | Definir fuente canónica y precedencia para sede, área, turno, perfil y simulación.                       |
| R-08 | Alto      | Funciones de autorización con semántica no uniforme         | has_permission, has_operational_permission y guards de aplicación no siempre consumen el mismo contexto o código normalizado. | La misma persona puede ser aceptada por una capa y rechazada por otra.                                   | Confirmado | Unificar contrato, normalización, precedencia y pruebas de paridad.                                      |
| R-09 | Alto      | Decisiones hardcodeadas por rol                             | Varias páginas y acciones comparan propietario/gerente_general en código.                                                     | Cambiar la matriz en VISO no cambia el comportamiento real; aparecen privilegios invisibles al catálogo. | Confirmado | Reemplazar comparaciones por permisos con una excepción transitoria documentada.                         |
| R-10 | Medio     | Server Actions dependen solo de RLS                         | Algunas acciones de NEXO no repiten autorización, aunque RLS actualmente bloquea escrituras.                                  | Una futura relajación de RLS abriría la acción sin cambios de aplicación.                                | Confirmado | Aplicar defensa en profundidad con guard exacto dentro de cada mutación.                                 |
| R-11 | Medio     | Catálogo sobredimensionado y no gobernado                   | Hay 177 permisos activos; 14 no tienen asignación y 117 asignados no aparecen en navegación.                                  | Permisos obsoletos, técnicos, de acción o no usados son difíciles de distinguir y mantener.              | Confirmado | Clasificar permisos por audiencia, operación, acción y estado de uso antes de depurar.                   |
| R-12 | Medio     | Nombres duplicados e inconsistentes                         | Conviven códigos semánticos, rutas generadas, access genérico y nombres con distintas convenciones.                           | Asignaciones erróneas, búsquedas incompletas y dificultad para auditar consumo real.                     | Confirmado | Adoptar taxonomía app.recurso.acción y tabla de alias/deprecaciones.                                     |
| R-13 | Medio     | Estados de turno no representan el ciclo real               | La mayoría de turnos históricos permanece scheduled y aproximadamente la mitad de marcas no enlaza shift_id.                  | Contexto activo, auditoría y permisos dependientes de turno pueden divergir.                             | Confirmado | Definir estados reales, enlace obligatorio cuando aplique y reconciliación automática.                   |
| R-14 | Medio     | Dispositivos compartidos sin sesiones de actor persistidas  | Existen 2 dispositivos activos que exigen PIN y turno, pero hay 0 actor_sessions y solo 3 eventos.                            | Trazabilidad insuficiente de quién realizó acciones desde terminales compartidos.                        | Confirmado | Cerrar flujo de apertura, renovación y cierre de sesión de actor con auditoría obligatoria.              |
| R-15 | Medio     | Asignaciones inactivas y excepciones redundantes            | Empleados inactivos conservan sedes activas y permisos individuales; las 17 excepciones revisadas duplican grants base.       | Ruido, riesgo de reactivación accidental y falsa percepción de personalización.                          | Confirmado | Desactivar vínculos al inactivar empleado y eliminar excepciones redundantes tras validación.            |
| R-16 | Medio     | RLS, RPC y SECURITY DEFINER heterogéneos                    | La protección combina políticas, funciones privilegiadas, vistas y guards con criterios diferentes.                           | La seguridad efectiva no puede inferirse desde una única matriz.                                         | Confirmado | Crear estándar de RLS/RPC, inventario de privilegios y pruebas automatizadas negativas.                  |
| R-17 | Bajo      | Infraestructura de simulación sin uso                       | context_simulation_sessions existe, pero no contiene sesiones y su integración no es uniforme.                                | Complejidad sin beneficio y riesgo de activar una ruta poco probada.                                     | Confirmado | Definir si se elimina, se limita a administradores o se completa con auditoría y expiración.             |

Brechas estructurales que explican los riesgos
No existe una fuente única de verdad para autorizar. La matriz de permisos no controla por sí sola las decisiones del código ni de la base de datos.
La navegación se usa como proxy de seguridad. Un permiso puede ocultar una opción sin bloquear la URL, la acción o la RPC.
El contexto tiene demasiados fallbacks. Sede, área y rol pueden provenir del turno, perfil, configuración, empleado o selección de interfaz.
El modelo nuevo convive con el legado. Los roles operativos existen, pero muchos módulos todavía dependen de roles base y comparaciones directas.
La nomenclatura no representa la capacidad real. Permisos .read controlan pantallas que también crean, editan, publican o eliminan.
La capa privilegiada no exige siempre autorización equivalente. Un cliente administrativo o SECURITY DEFINER requiere un guard exacto y verificable antes de entrar.
Prioridad de remediación

| Prioridad | Objetivo                     | Alcance                                                                            | Resultado esperado                                                       |
| --------- | ---------------------------- | ---------------------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| P0        | Cerrar bypasses confirmados  | VISO contabilidad, Pass users, vacantes, tarifas, menú/reorder y negocios.         | Guard exacto en página y mutación; revisar cliente administrativo y RPC. |
| P0        | Congelar nuevas excepciones  | Evitar nuevos hardcodes y permisos ad hoc durante el rediseño.                     | Regla de arquitectura y checklist de revisión.                           |
| P1        | Aprobar matriz canónica      | Rol administrativo × rol operativo × sede × área × turno × aplicación.             | Documento de decisión antes de migrar datos.                             |
| P1        | Unificar autorización        | Contrato único para has_permission, has_operational_permission y requireAppAccess. | Funciones, tipos compartidos y pruebas de paridad.                       |
| P1        | Normalizar catálogo          | Clasificar 177 permisos, 14 sin asignación y 117 fuera de navegación.              | Mantener, fusionar, deprecar o eliminar con evidencia de consumo.        |
| P2        | Completar contexto operativo | Perfiles por sede, defaults, sesiones de dispositivo y turno real.                 | Migraciones graduales y telemetría.                                      |
| P2        | Endurecer base de datos      | RLS, EXECUTE, SECURITY DEFINER, search_path y vistas.                              | Estándar técnico y pruebas negativas por rol.                            |
| P3        | Limpiar legado               | Asignaciones inactivas, duplicados y excepciones redundantes.                      | Limpieza posterior a la estabilización.                                  |

Decisiones que deben aprobarse antes de migrar
Qué representa exactamente el rol base: jerarquía administrativa, cargo contractual o ambos.
Qué capacidades solo pueden existir con turno activo y rol operativo válido.
Qué precedencia se aplica entre rol base, rol operativo, excepción individual, simulación y dispositivo compartido.
Si el modelo soportará denegaciones explícitas o únicamente grants mínimos.
Cómo se limita el alcance por sede y área en lecturas globales y funciones privilegiadas.
Qué permisos técnicos, de navegación y de negocio deben estar separados.
Qué uso legítimo conservará createAdminClient() y qué operaciones migrarán a RLS/RPC restringidas.
Criterios de cierre para la fase de remediación
Cada ruta sensible verifica en servidor el mismo permiso que declara la navegación.
Cada mutación vuelve a autorizar, incluso cuando RLS también protege.
Cada función SECURITY DEFINER valida identidad, permiso exacto y alcance.
La misma matriz de prueba produce el mismo resultado en todas las aplicaciones.
No existen comparaciones de rol sin una excepción aprobada y documentada.
Los dispositivos compartidos registran actor, turno, sede, área, inicio, expiración y cierre.
Los permisos deprecados no se asignan y tienen ruta de reemplazo.
Las pruebas incluyen casos negativos: URL directa, Server Action, REST, RPC y contexto fuera de turno.
Preguntas abiertas
¿Propietario y gerente general deben conservar bypass absoluto o recibir permisos explícitos como cualquier otro rol?
¿Contabilidad y datos de clientes requieren un segundo nivel de autorización o solo permisos separados?
¿Las apps operativas deben negar toda acción fuera de turno o permitir funciones administrativas específicas?
¿La simulación operativa será una herramienta permanente de VISO o una infraestructura temporal?
¿Cómo se versionará la matriz de permisos y quién aprobará cambios futuros?

Criterio de cierre
Existe un mapa verificable de:
usuario → rol base → permisos base → turno → rol operativo
→ sede → área → permisos operativos → aplicación → acción

Criterio de cierre — Bloque A: Auditoría

La fase de auditoría podrá cerrarse antes de iniciar el Bloque B — Modelo definitivo de identidad y autorización cuando exista un mapa completo, trazable y verificable de la cadena de autorización:

Usuario → rol base → permisos base → turno activo → rol operativo → sede → área → permisos operativos → aplicación → acción

El mapa deberá permitir determinar, para cualquier trabajador y acción del sistema:

Quién es el usuario autenticado y a qué empleado corresponde.
Cuál es su rol base y qué permisos permanentes hereda.
Qué excepciones individuales modifican esos permisos.
Si existe un turno operativo válido, publicado y vigente.
Qué rol operativo está activo durante ese turno.
En qué sede y área se desarrolla la operación.
Qué permisos operativos se derivan de ese contexto.
Qué aplicación está solicitando la autorización.
Qué acción concreta intenta ejecutar el usuario.
Qué capa toma la decisión final: guard, RPC, RLS, función de permisos o política operativa.
Condiciones mínimas de verificación

El criterio se considera cumplido únicamente si:

Cada relación de la cadena tiene una fuente de datos identificada.
Se conoce la precedencia entre permisos base, individuales y operativos.
Se identificaron los bypasses, hardcodes y decisiones externas a la matriz.
Se documentaron las rutas donde la interfaz y el servidor aplican controles diferentes.
Se puede explicar por qué una acción resulta permitida o denegada.
Las brechas, contradicciones y elementos todavía no implementados están registrados.
No quedan fuentes de autorización desconocidas dentro del alcance auditado.
Resultado de cierre

✅ El Bloque A cumple este criterio.

La auditoría permitió reconstruir la cadena completa y detectar dónde el comportamiento actual se aparta del modelo esperado. El mapa es verificable, aunque todavía no es uniforme ni constituye una arquitectura definitiva.

El Bloque B deberá convertir este mapa auditado en una única especificación canónica de identidad, contexto y autorización.

