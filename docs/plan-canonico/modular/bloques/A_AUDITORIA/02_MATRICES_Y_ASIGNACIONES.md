### ✅ AUTH-AUD-005 — Inventariar role_permissions

Resumen general
Filas físicas registradas:       613
Asignaciones lógicas únicas:     605
Asignaciones permitidas:         613
Denegaciones explícitas:           0
Roles con permisos:               15

⚠️ La tabla actualmente funciona únicamente como catálogo de concesiones. Aunque tiene is_allowed, no existe ninguna fila con false.

Distribución por alcance

| Alcance   | Filas | Roles | Observación                              |
| --------- | ----- | ----- | ---------------------------------------- |
| global    | 503   | 7     | Predomina ampliamente                    |
| site      | 14    | 2     | ⚠️ Todas sin scope_site_id                |
| site_type | 91    | 10    | Principalmente roles operativos antiguos |
| area_kind | 5     | 2     | Uso mínimo                               |
| area      | 0     | 0     | No se utiliza                            |

global       █████████████████████████  82 %
site_type    ████                        15 %
site         █                            2 %
area_kind    ▏                            1 %
area                                      0 %
Asignaciones por rol

| Rol base                | Filas | Permisos distintos | Apps | Alcance principal |
| ----------------------- | ----- | ------------------ | ---- | ----------------- |
| propietario             | 163   | 163                | 10   | Global            |
| gerente_general         | 148   | 148                | 10   | Global            |
| gerente                 | 115   | 115                | 9    | Global            |
| auxiliar_administrativa | 40    | 40                 | 7    | Global            |
| contador                | 33    | 33                 | 9    | Global            |
| cocinero                | 23    | 16                 | 3    | Tipo de sede      |
| bodeguero               | 20    | 20                 | 3    | Sede/tipo/global  |
| barista                 | 15    | 11                 | 3    | Tipo de sede/área |
| cajero                  | 12    | 8                  | 2    | Tipo de sede      |
| mesero                  | 10    | 2                  | 1    | Tipo de sede      |
| panadero                | 9     | 9                  | 2    | Tipo de sede      |
| pastelero               | 9     | 9                  | 2    | Tipo de sede      |
| repostero               | 9     | 9                  | 2    | Tipo de sede      |
| conductor               | 6     | 4                  | 1    | Mixto             |
| marketing               | 1     | 1                  | 1    | Tipo de sede      |

Hallazgo crítico 1: administración con alcance global

Los siguientes roles tienen todos sus permisos globales:

propietario              163 globales
gerente_general          148 globales
gerente                  115 globales
auxiliar_administrativa   40 globales
contador                  33 globales
⚠️ gerente

El rol definido como “Gerente de sede” tiene:

115 permisos
9 aplicaciones
115 permisos globales
0 restricciones por sede

Esto contradice su significado funcional.

Modelo esperado
gerente
→ administración limitada a su sede

Modelo actual
gerente
→ permisos globales en 9 aplicaciones

Es uno de los riesgos de autorización más importantes encontrados hasta ahora.

⚠️ Auxiliar administrativa

También tiene sus 40 permisos como globales. Aunque los permisos son más limitados, no existe restricción de sede, trabajador o negocio.

⚠️ Contador

Tiene acceso a 9 aplicaciones con alcance global. Debe comprobarse si todos esos accesos son realmente necesarios.

Hallazgo crítico 2: permisos duplicados físicamente

Se encontraron duplicados exactos en PULSO.

mesero
pulso.access
scope: site_type / satellite
filas idénticas: 4

pulso.pos.main
scope: site_type / satellite
filas idénticas: 4

El rol tiene 10 filas, pero solamente 2 permisos distintos.

cajero
pulso.access
scope: site_type / satellite
filas idénticas: 2

pulso.pos.main
scope: site_type / satellite
filas idénticas: 2

En total existen:

8 filas redundantes

⚠️ La restricción única actual no evitó estos duplicados. Esto suele ocurrir porque una clave UNIQUE que contiene columnas nullable permite múltiples filas cuando alguna parte de la clave es NULL.

No se eliminan todavía porque primero debe comprobarse qué migraciones los insertaron.

Hallazgo crítico 3: alcance site sin sede concreta

Existen 14 filas con:

scope_type = 'site'
scope_site_id = null

Afectan principalmente a:

bodeguero
conductor

Esto puede significar una de dos cosas:

Interpretación A
site + scope_site_id null
→ cualquier sede asociada al trabajador
Interpretación B
site + scope_site_id null
→ configuración incompleta

⚠️ La semántica debe quedar definida explícitamente. Actualmente el nombre site sugiere una sede concreta, pero no almacena ninguna.

La restricción de consistencia actual permite ese estado: para alcance site, exige que los demás campos estén vacíos, pero no obliga a que scope_site_id esté presente.

Hallazgo 4: area no se utiliza

Aunque el enum y la tabla soportan:

scope_type = 'area'
scope_area_id

Actualmente existen:

0 asignaciones por área específica

Todo el alcance territorial se está manejando mediante:

global
site
site_type
area_kind

Debe decidirse si el alcance area es necesario o si quedó como diseño no implementado.

Hallazgo 5: los oficios antiguos conservan permisos base

Los siguientes roles ya tienen reemplazo conceptual en operational_roles, pero todavía conservan permisos permanentes:

cocinero
barista
cajero
mesero
panadero
pastelero
repostero
bodeguero
conductor

Ejemplo:

employees.role = cocinero
    ↓
16 permisos base distintos

turno.operational_role = cocinero_satelite
    ↓
3 permisos operativos

⚠️ Esto puede provocar que el permiso base permanente domine o complemente indebidamente el permiso temporal del turno.

La arquitectura aún está funcionando como un modelo híbrido:

PERMISO EFECTIVO ACTUAL

rol base permanente
        +
rol operativo del turno
        +
excepción individual

Todavía no se ha confirmado cómo se combinan exactamente esos tres componentes; eso corresponde a las auditorías de funciones y contexto.

Hallazgo 6: no existe política de denegación

Aunque role_permissions incluye:

is_allowed boolean

Todos los registros tienen:

is_allowed = true

Esto implica que actualmente no existe uso real de:

deny explícito
precedencia deny > allow
exclusión de capacidades heredadas

La autorización solo suma permisos; no puede retirar uno específico de un rol amplio.

Hallazgo 7: propietario no tiene todos los permisos actuales

El catálogo contiene 177 permisos activos, pero propietario tiene 163.

Permisos activos:       177
Propietario asignados:  163
Diferencia:              14

gerente_general tiene aún menos:

148 de 177

Esto indica que la matriz no se actualiza automáticamente cuando se crean permisos nuevos, aunque algunas migraciones intentan reconstruirla.

⚠️ No debe asumirse que propietario tiene acceso total solamente por el nombre del rol. Debe revisarse si existe un bypass en las funciones de autorización.

Diagnóstico
✅ Correcto
Todas las asignaciones apuntan a roles existentes.
Todas apuntan a permisos existentes.
No hay roles inactivos con permisos.
Los alcances site_type y area_kind contienen su dimensión correspondiente.
No existen denegaciones contradictorias.
⚠️ Problemático
Gerente de sede tiene permisos globales.
Existen ocho filas duplicadas.
site permite sede nula.
Los roles operativos antiguos siguen autorizando permanentemente.
No existe uso real de denegaciones.
La matriz global no cubre automáticamente permisos nuevos.
Los roles administrativos dependen de matrices enormes y manuales.

### ✅ AUTH-AUD-006 — Inventariar operational_role_permissions

Resumen general
Filas registradas:              32
Roles con permisos:              7 de 13
Permisos completos distintos:   11
Aplicaciones cubiertas:          2
Concesiones:                    32
Denegaciones:                    0
Duplicados exactos:              0
Permisos huérfanos actuales:     0

Todos los códigos usados actualmente corresponden a aplicaciones y permisos existentes.

Cobertura por aplicación

| Aplicación | Filas | Roles | Permisos distintos |
| ---------- | ----- | ----- | ------------------ |
| NEXO       | 28    | 7     | 9                  |
| PULSO      | 4     | 2     | 2                  |
| FOGO       | 0     | 0     | 0                  |
| ORIGO      | 0     | 0     | 0                  |
| NUMERA     | 0     | 0     | 0                  |
| ANIMA      | 0     | 0     | 0                  |
| VISO       | 0     | 0     | 0                  |

El modelo operativo está implementado únicamente en NEXO y parcialmente en PULSO.

Matriz operativa actual
barista_satelite
nexo.access
nexo.inventory.remissions
nexo.inventory.remissions.request
cocinero_satelite
nexo.access
nexo.inventory.remissions
nexo.inventory.remissions.request
cajero_satelite
nexo.access
nexo.inventory.remissions
nexo.inventory.remissions.request
pulso.access
pulso.pos.main
operador_integral_satelite
nexo.access
nexo.inventory.remissions
nexo.inventory.remissions.request
nexo.inventory.remissions.receive
pulso.access
pulso.pos.main
bodeguero
nexo.access
nexo.inventory.movements
nexo.inventory.remissions
nexo.inventory.remissions.prepare
nexo.inventory.stock
conductor_logistica
nexo.access
nexo.inventory.remissions
nexo.inventory.remissions.transit
gerencia_operativa
nexo.access
nexo.inventory.remissions
nexo.inventory.remissions.request
nexo.inventory.remissions.prepare
nexo.inventory.remissions.transit
nexo.inventory.remissions.receive
nexo.inventory.remissions.cancel
Roles sin permisos operativos

| Rol                   | Turnos históricos | Asignaciones sede/área |
| --------------------- | ----------------- | ---------------------- |
| servicio_salon        | 66                | 2                      |
| mostrador_satelite    | 0                 | 1                      |
| produccion_cocina     | 16                | 1                      |
| produccion_panaderia  | 17                | 1                      |
| produccion_reposteria | 15                | 1                      |
| propietario_admin     | 0                 | 0                      |

⚠️ Servicio de salón
66 turnos
2 sedes
0 permisos operativos

Es un rol utilizado activamente, pero no puede obtener capacidades desde la matriz operativa.

Su funcionamiento actual puede depender de:

permisos permanentes del rol base mesero;
rutas que solo verifican turno;
pantallas que no verifican permisos;
lógica especial en las aplicaciones.
⚠️ Producción

Los tres roles de producción acumulan:

produccion_cocina        16
produccion_panaderia     17
produccion_reposteria    15
────────────────────────────
Total                    48 turnos

Pero ninguno tiene:

fogo.access
fogo.production.*

La autorización de FOGO continúa dependiendo del modelo base antiguo o todavía no está integrada.

Alcances

Las 32 asignaciones tienen:

site_id    = null
area_id    = null
area_kind  = null

Por tanto, todas son globales dentro de la matriz operativa.

| Alcance         | Filas |
| --------------- | ----- |
| Global          | 32    |
| Sede específica | 0     |
| Área específica | 0     |
| Tipo de área    | 0     |

Interpretación

La tabla permite representar permisos como:

rol + permiso + sede
rol + permiso + área
rol + permiso + tipo de área

Pero actualmente solamente implementa:

rol + permiso

Esto significa que la matriz no distingue, por ejemplo:

bodeguero en Centro de Producción
bodeguero en otra sede

La restricción territorial dependería del contexto operativo y de las asignaciones disponibles por sede, no del permiso mismo. Esa dependencia debe verificarse cuando se auditen get_operational_context y has_operational_permission.

Integridad técnica
✅ Roles protegidos por FK
role_code
→ public.operational_roles(code)

La FK está validada.

✅ Dimensiones protegidas por FK
site_id
→ public.sites(id)

area_id
→ public.areas(id)

area_kind
→ public.area_kinds(code)
✅ Duplicados controlados

Existe un índice único que normaliza los valores nulos mediante COALESCE.

Por eso no aparece el problema de duplicados encontrado en role_permissions.

La combinación única es esencialmente:

role_code
permission_code
site_id normalizado
area_id normalizado
area_kind normalizado
⚠️ permission_code no tiene FK

La columna almacena directamente valores como:

nexo.inventory.remissions.request
pulso.pos.main

Pero no tiene una clave foránea hacia public.app_permissions.

El sistema depende de una convención textual:

`<app_code>.<permission_code>`

Actualmente los 32 valores son válidos, pero la base permitiría insertar:

nexo.permission_inexistente
app_falsa.access
texto_arbitrario

Siempre que no esté vacío.

Esto es un riesgo de integridad referencial.

⚠️ Restricción de alcance insuficiente

La única validación funcional del alcance es:

area_id y area_kind no pueden existir simultáneamente

No verifica:

que el área pertenezca a la sede indicada;
que una sede sea obligatoria al indicar un área;
que site_id y area_kind sean compatibles;
que solo se utilice una dimensión territorial;
que el rol esté habilitado en esa sede o área.

Actualmente no produce datos inválidos porque todas las filas son globales, pero el modelo lo permitiría.

Denegaciones

Todas las filas tienen:

is_allowed = true

No existe ningún:

is_allowed = false

Por tanto, al igual que role_permissions, esta matriz solamente suma capacidades.

No hay una regla utilizada de:

deny > allow
Hallazgos principales
⚠️ 1. La matriz está incompleta

Solo 7 de los 13 roles operativos tienen permisos.

Con permisos     7
Sin permisos     6
⚠️ 2. Solo cubre dos aplicaciones
NEXO     ✅ parcial
PULSO    🟡 mínimo
FOGO     ❌
ORIGO    ❌
NUMERA   ❌
⚠️ 3. Todas las concesiones son globales

La capacidad de restringir por sede o área existe técnicamente, pero no se utiliza.

⚠️ 4. Los roles base todavía compensan la matriz incompleta

Ejemplo probable:

employees.role = mesero
    ↓
permisos base de PULSO

operational_role = servicio_salon
    ↓
0 permisos operativos

El sistema continúa necesitando el rol laboral antiguo para cubrir funciones que deberían proceder del turno.

⚠️ 5. bodeguero existe en ambos catálogos
public.roles.code             = bodeguero
public.operational_roles.code = bodeguero

Esto permite que un mismo trabajador acumule simultáneamente:

permisos base de bodeguero
+
permisos operativos de bodeguero

Además dificulta identificar desde registros y código cuál de los dos conceptos se está usando.

⚠️ 6. La matriz no controla navegación técnica

Los permisos operativos utilizan únicamente permisos funcionales razonables:

inventory.remissions.request
inventory.remissions.prepare
inventory.remissions.transit

Esto es positivo.

No utiliza permisos técnicos como:

page_tsx.view
slug.view
inventory_remissions_id.view

Sin embargo, si las aplicaciones exigen estos permisos de ruta, el trabajador operativo podría tener capacidad funcional pero seguir bloqueado por navegación.

Diagnóstico
✅ Correcto
No existen duplicados.
No existen roles operativos huérfanos.
Los 32 permisos actuales existen.
Todas las aplicaciones referenciadas existen.
Las claves territoriales tienen FK.
El índice único trata correctamente los valores nulos.
Los permisos asignados son principalmente funcionales.
⚠️ Pendiente
Seis roles no tienen permisos.
FOGO no está integrado.
ORIGO no está integrado.
La matriz solo usa NEXO y PULSO.
No existen restricciones de permiso por sede o área.
permission_code carece de FK.
No existen denegaciones.
El mismo código bodeguero pertenece a los dos catálogos.
El modelo todavía depende de permisos base antiguos.

### ✅ AUTH-AUD-007 — Inventariar employee_permissions y excepciones individuales

Resumen general
Filas registradas:                    17
Trabajadores con asignaciones:         2
Concesiones individuales:             17
Denegaciones individuales:             0
Asignaciones globales:                  9
Asignaciones por sede:                  8
Asignaciones por área:                  0
Asignaciones por tipo de sede:          0
Asignaciones por tipo de área:          0
Permisos realmente excepcionales:       0

⚠️ Las 17 asignaciones individuales ya están concedidas por el rol base correspondiente.

Por tanto, actualmente employee_permissions no contiene excepciones funcionales reales. Contiene copias redundantes de permisos heredados.

Trabajadores encontrados

#### 1. Chelsea Barbosa

Estado:       activa
Rol base:     auxiliar_administrativa
Sede base:    VENTO_GROUP
Filas:        9
Aplicaciones: ANIMA y VISO
Alcance:      global
Permisos individuales
ANIMA
documents.delete
documents.upload
documents.view_all
employee_photos.upload
VISO
access
staff.documents.manage
staff.employee_photos.manage
staff.manage
staff.read
Resultado de comparación

Los nueve permisos ya están autorizados mediante:

role_permissions
→ role = auxiliar_administrativa

Por tanto:

Permiso individual
        +
Permiso heredado por rol
        **=**
Asignación redundante

⚠️ Si se eliminaran estas filas individuales, Chelsea conservaría actualmente las mismas capacidades mediante su rol base.

No se eliminaron durante la auditoría.

#### 2. Tablet Bodega

Estado:       inactiva
Rol base:     bodeguero
Sede base:    CENTRO_PROD
Filas:        8
Aplicación:   NEXO
Alcance:      sede CENTRO_PROD
Permisos registrados
nexo.access                         3 filas
nexo.inventory.locations           1 fila
nexo.inventory.stock               1 fila
nexo.inventory.transfers           1 fila
nexo.inventory.withdraw            2 filas

Esto representa solamente cinco permisos distintos:

access
inventory.locations
inventory.stock
inventory.transfers
inventory.withdraw
Resultado de comparación

Los cinco permisos ya están concedidos por el rol base bodeguero.

Además, este empleado está marcado como:

is_active = false

Por tanto existen dos problemas:

1. Permisos redundantes frente al rol base.
2. Permisos asociados a una identidad inactiva.
Duplicados detectados

Dentro de Tablet Bodega existen duplicaciones exactas aparentes:

nexo.access
scope: site / CENTRO_PROD
cantidad: 3

nexo.inventory.withdraw
scope: site / CENTRO_PROD
cantidad: 2

Filas redundantes estimadas:

access       → sobran 2
withdraw     → sobra 1
───────────────────────
Total        → 3 filas duplicadas

⚠️ Esto indica que la protección de unicidad de employee_permissions es insuficiente o no normaliza correctamente columnas nulas dentro de la clave.

Es el mismo tipo de problema encontrado anteriormente en role_permissions.

Uso de alcances
Chelsea

Las nueve asignaciones tienen:

scope_type = global

No existe restricción por:

sede;
área;
tipo de sede;
tipo de área.

Esto significa que sus permisos individuales no limitan el alcance concedido por su rol base.

Tablet Bodega

Las ocho filas tienen:

scope_type    = site
scope_site_id = CENTRO_PROD

Estas filas sí contienen una sede concreta, a diferencia de algunas asignaciones problemáticas de role_permissions.

Sin embargo, como el rol base bodeguero ya concede esos permisos, debe comprobarse si el alcance individual:

restringe el permiso base

o simplemente:

vuelve a concederlo para CENTRO_PROD
sin retirar el permiso más amplio

Dado que todas las filas tienen is_allowed = true, la segunda interpretación es la más probable.

Denegaciones individuales

Actualmente existen:

0 filas con is_allowed = false

Esto significa que employee_permissions no se utiliza para casos como:

Este trabajador hereda el permiso por rol,
pero debe tenerlo bloqueado individualmente.

Solo se utiliza para sumar permisos, aunque en los datos actuales ni siquiera está sumando capacidades nuevas.

Hallazgo crítico: no existen excepciones reales

La intención aparente de la tabla es soportar:

Permiso individual adicional
Denegación individual
Permiso limitado a sede
Permiso limitado a área

Pero su uso real es:

17 permisos ya heredados por rol
0 permisos adicionales
0 denegaciones

Por tanto, el estado actual es:

employee_permissions
→ redundancia
→ complejidad adicional
→ ninguna capacidad diferencial
Riesgo de precedencia

Todavía debe verificarse cómo las funciones calculan el permiso efectivo.

Un posible modelo es:

rol base allow
+
rol operativo allow
+
empleado allow

Pero no está confirmado qué ocurriría con:

rol base allow
+
empleado deny

Como no existen denegaciones reales en los datos, esa ruta probablemente no ha sido probada.

Esto deberá inspeccionarse directamente en:

has_permission
has_operational_permission
get_operational_context
Diagnóstico
✅ Correcto
Todos los trabajadores referenciados existen.
Todos los permisos referenciados existen.
Las aplicaciones asociadas existen.
Las filas de Tablet Bodega tienen una sede concreta.
No hay permisos individuales huérfanos.
⚠️ Problemático
Las 17 filas son redundantes frente al rol base.
Hay tres duplicados aparentes en Tablet Bodega.
Un empleado inactivo conserva ocho asignaciones.
No existen denegaciones individuales.
No hay excepciones funcionales reales.
Los permisos globales de Chelsea duplican una matriz de rol ya global.
No está definida la precedencia entre rol, operación y excepción individual.

### ✅ AUTH-AUD-008 — Inventariar employee_sites y employee_areas

Resumen general

| Tabla          | Filas | Trabajadores | Activas | Primarias |
| -------------- | ----- | ------------ | ------- | --------- |
| employee_sites | 86    | 55           | 86      | 55        |
| employee_areas | 1     | 1            | 1       | 1         |

Actualmente existen:

55 trabajadores registrados
40 activos
15 inactivos
employee_sites
Cobertura

✅ Los 40 trabajadores activos tienen al menos una sede asignada.

✅ Los 55 trabajadores tienen exactamente una sede primaria.

✅ No se encontraron trabajadores con múltiples sedes primarias.

✅ La sede primaria de employee_sites coincide en los 55 casos con el campo legado:

employees.site_id

Resultado:

Coincidencias:     55
Inconsistencias:    0

Esto confirma que ambos modelos están sincronizados actualmente.

Distribución por sede

| Sede                 | Asignaciones | Primarias | Activos | Inactivos |
| -------------------- | ------------ | --------- | ------- | --------- |
| Centro de Producción | 31           | 21        | 21      | 10        |
| Vento Café           | 28           | 20        | 24      | 4         |
| Vento Group          | 10           | 9         | 9       | 1         |
| Saudo                | 9            | 2         | 9       | 0         |
| Molka                | 7            | 2         | 7       | 0         |
| App Review           | 1            | 1         | 1       | 0         |

⚠️ Asignaciones activas de empleados inactivos

Los 15 empleados inactivos conservan asignaciones de sede activas.

Empleados inactivos:                     15
Inactivos con employee_sites activo:     15

Distribución:

Centro de Producción   10
Vento Café              4
Vento Group             1

La tabla no desactiva automáticamente las asignaciones cuando se desactiva al trabajador.

Esto puede ser seguro si todas las consultas filtran también:

employees.is_active = true

Pero representa un riesgo si alguna función consulta solo employee_sites.is_active.

Trabajadores con múltiples sedes

Distribución actual:

| Sedes activas por trabajador | Trabajadores |
| ---------------------------- | ------------ |
| 1                            | 36           |
| 2                            | 13           |
| 3                            | 3            |
| 5                            | 3            |

Existen 19 trabajadores asignados a más de una sede.

Con acceso a cinco sedes
Carlos Alejandro Ibarra Ariza
Johanna García
Juliandy Garabito

Sedes:

VENTO_GROUP
CENTRO_PROD
MOLKA_PRINCIPAL
SAUDO
VENTO_CAFE
Con acceso a tres sedes
Denaly Liliana Pérez Sepúlveda
Elizabeth Contreras
Geovanni Andrés Osorio Bonilla
Asignaciones operativas multisede destacadas

Se encontraron trabajadores operativos con combinaciones como:

Cocinero:
VENTO_CAFE + CENTRO_PROD

Cocinero:
VENTO_CAFE + CENTRO_PROD + SAUDO

Barista:
VENTO_CAFE + MOLKA_PRINCIPAL

Mesero:
VENTO_CAFE + SAUDO

Cajero:
VENTO_CAFE + SAUDO

Conductor:
CENTRO_PROD + VENTO_GROUP

Estas asignaciones pueden ser correctas, pero refuerzan que el permiso no puede determinarse solamente desde:

employees.site_id

El campo legado contiene solo la sede primaria, mientras que employee_sites representa la cobertura real.

employee_areas

La tabla prácticamente no está implementada.

Filas:          1
Trabajadores:   1
Activas:        1
Primarias:      1

Única asignación:

Trabajador: Carlos Alejandro Ibarra Ariza
Sede:       VENTO_GROUP
Área:       Dirección
Tipo:       liderazgo
Primaria:   sí

La asignación es coherente:

✅ El área pertenece a Vento Group.
✅ El trabajador tiene Vento Group entre sus sedes activas.
✅ La asignación está activa.
✅ Es la única área primaria.

Hallazgo crítico

De los 40 trabajadores activos:

Con área asignada:       1
Sin área asignada:      39

Por tanto, employee_areas no puede utilizarse actualmente como fuente confiable para determinar el área laboral del personal.

Cobertura real: 2,5 %

Además:

employees.area_id = null

para todos los trabajadores.

Esto significa que tanto el modelo legado como el nuevo carecen de asignación de área para casi toda la plantilla.

Diferencia entre sede y área
Sedes
employee_sites
✅ ampliamente poblada
✅ soporta múltiples sedes
✅ tiene sede primaria
✅ sincronizada con employees.site_id
Áreas
employee_areas
❌ casi vacía
❌ no representa la operación real
❌ no sincronizada con employees.area_id
❌ no puede alimentar permisos o contexto general

Actualmente las áreas operativas parecen resolverse principalmente desde:

employee_shifts.area_id
site_operational_roles.area_id

y no desde una asignación permanente del trabajador.

Esto puede ser correcto si el área siempre depende del turno, pero debe quedar explícitamente definido.

Hallazgos principales
⚠️ 1. Modelo duplicado para sede primaria

La sede primaria existe en dos lugares:

employees.site_id
employee_sites.is_primary

Actualmente coinciden en los 55 casos, pero mantener ambas fuentes introduce riesgo de divergencia futura.

Debe definirse cuál será la fuente canónica.

⚠️ 2. Empleados inactivos conservan asignaciones activas
15 empleados inactivos
15 con sedes activas

No implica acceso necesariamente, pero obliga a que cada función filtre el estado del trabajador.

⚠️ 3. employee_areas no está implementada operacionalmente

Solo un trabajador tiene área permanente.

No debe asumirse que:

trabajador sin employee_areas
→ trabajador sin área autorizada

porque actualmente eso bloquearía a casi toda la organización.

⚠️ 4. La sede primaria no representa toda la cobertura

Diecinueve trabajadores tienen más de una sede activa.

Una autorización basada exclusivamente en:

employees.site_id

ignoraría sedes secundarias válidas.

⚠️ 5. App Review aparece como sede real

Existe una sede:

APP-REVIEW
App Review (Demo)

con un trabajador activo y asignación primaria.

Debe verificarse posteriormente que esta sede de demostración:

no aparezca en operación normal;
no otorgue acceso a información real;
esté aislada de sedes productivas.
⚠️ 6. No hay historial de desactivación en las asignaciones

Todas las 86 filas de employee_sites están activas.

No se está utilizando is_active = false para conservar historial de cambios de sede.

Esto puede indicar que:

las asignaciones se eliminan físicamente;
nunca se han desactivado;
el estado aún no está siendo administrado desde VISO.
Diagnóstico
✅ Correcto
Todos los trabajadores activos tienen sede.
Todos tienen una única sede primaria.
No hay inconsistencias entre employees.site_id y la sede primaria.
Las asignaciones multisede están representadas.
La única asignación de área es coherente con su sede.
No se detectaron duplicados evidentes.
⚠️ Pendiente
Quince empleados inactivos conservan sedes activas.
employee_areas solo cubre un trabajador.
Existen dos fuentes de sede primaria.
Las funciones podrían estar usando solo la sede primaria.
App Review debe tratarse como sede especial.
No se utiliza la desactivación histórica de asignaciones.

### ✅ AUTH-AUD-009 — Inventariar perfiles operativos por trabajador y sede

Resumen general
Perfiles registrados:           1
Perfiles activos:               1
Trabajadores cubiertos:         1
Sedes cubiertas:                1
Trabajadores activos totales:  40
Activos con perfil:             1
Activos sin perfil:            39

Cobertura actual:

1 de 40 trabajadores activos
2,5 %

La tabla existe y su estructura es coherente, pero prácticamente no está implementada en la operación general.

Perfil existente
Anderson Sneider Fuentes Echeverry
Estado trabajador:       activo
Rol base:                 conductor
Sede del perfil:          CENTRO_PROD
Rol operativo por defecto: conductor_logistica
Familia:                  logistica
Perfil activo:            sí
Puntos predeterminados de marcación
Check-in:
pickup_camioneta_principal

Check-out:
pickup_camioneta_principal

Nombre físico:

Punto recogida camioneta principal
Validaciones

✅ Anderson tiene asignación activa en employee_sites para CENTRO_PROD.

✅ conductor_logistica existe y está activo en operational_roles.

✅ conductor_logistica está habilitado para CENTRO_PROD.

✅ El punto de check-in existe y está activo.

✅ El punto de check-out existe y está activo.

✅ El rol exige marcación externa:

requires_external_checkin  = true
requires_external_checkout = true
Diferencia entre sede laboral y punto de marcación

El perfil utiliza dos tipos distintos de registros dentro de sites.

Sede laboral
Código:                 CENTRO_PROD
Tipo:                   centro_produccion
site_type:              production_center
site_kind:              satellite
Visibilidad operativa:  operational
Pública:                sí
Radio de marcación:      40 m
Punto físico del conductor
Código:                 pickup_camioneta_principal
Tipo:                   checkin_point
site_type:              admin
site_kind:              vehicle_yard
Visibilidad operativa:  hidden
Pública:                no
Radio de marcación:      100 m

Por tanto, que Anderson no tenga el punto de recogida dentro de employee_sites no es necesariamente un error.

employee_sites
→ sedes laborales autorizadas

default_checkin_site_id
→ punto físico donde debe marcar

El nombre de las columnas puede inducir a confusión porque ambos conceptos referencian la misma tabla sites.

Estructura de la tabla

Campos principales:

employee_id
site_id
default_operational_role
default_checkin_site_id
default_checkout_site_id
is_active
notes
created_by
updated_by

Existe una restricción única:

(employee_id, site_id)

Esto significa que cada trabajador puede tener como máximo un perfil por sede.

Ejemplo permitido:

Anderson + CENTRO_PROD
Anderson + VENTO_GROUP

Ejemplo no permitido:

Anderson + CENTRO_PROD + perfil A
Anderson + CENTRO_PROD + perfil B

✅ Esto evita duplicados por trabajador y sede.

Hallazgo crítico 1: cobertura casi inexistente

De los 40 trabajadores activos:

Con perfil operativo:       1
Sin perfil operativo:      39

La tabla no puede ser actualmente la fuente principal para resolver:

rol operativo predeterminado;
punto de marcación;
comportamiento por sede;
preferencias operativas del trabajador.

El sistema está obteniendo el rol operativo principalmente desde:

employee_shifts.operational_role

y no desde el perfil permanente.

Hallazgo 2: solo el conductor utiliza el modelo completo

El único perfil corresponde justamente al caso especial:

conductor
→ trabaja para CENTRO_PROD
→ marca en un patio o punto externo
→ requiere check-in y check-out externos

Esto indica que la tabla fue introducida para resolver inicialmente el caso del conductor, pero no se extendió al resto de trabajadores.

Hallazgo 3: no hay perfiles para trabajadores multisede

En la auditoría anterior se encontraron 19 trabajadores con más de una sede activa.

Sin embargo:

Perfiles multisede: 0

No existen perfiles que permitan definir, por ejemplo:

Trabajador en VENTO_CAFE
→ cajero_satelite

El mismo trabajador en SAUDO
→ servicio_salon

En esos casos, el rol depende completamente del turno creado.

Hallazgo 4: no existen perfiles para producción

No hay perfiles para:

produccion_cocina
produccion_panaderia
produccion_reposteria
bodeguero

Esto impide que VISO tenga configurada una relación permanente como:

Trabajador
    +
Centro de Producción
    +
Rol operativo predeterminado

Aunque los roles aparecen en los turnos históricos, no están almacenados como configuración habitual del trabajador.

Hallazgo 5: el perfil no establece área predeterminada

La tabla contiene:

site_id
default_operational_role

pero no contiene:

default_area_id
default_area_kind

Para roles como:

cocinero_satelite
barista_satelite
produccion_panaderia

el área puede ser esencial para determinar la función concreta.

Actualmente el área debe proceder de:

employee_shifts.area_id;
site_operational_roles.area_id;
una selección manual al crear el turno.
Hallazgo 6: puntos de marcación y sedes comparten tabla

Los campos:

site_id
default_checkin_site_id
default_checkout_site_id

referencian todos public.sites.

Pero almacenan conceptos distintos:

site_id
→ sede laboral

default_checkin_site_id
→ punto físico de marcación

default_checkout_site_id
→ punto físico de marcación

Esto es funcional, pero requiere que todas las consultas filtren correctamente:

type = checkin_point
site_kind
operational_visibility

De lo contrario, los puntos ocultos podrían aparecer como sedes laborales seleccionables.

Hallazgo 7: sin notas ni trazabilidad humana

El único perfil tiene:

notes = null

Aunque existen created_by y updated_by, no se ha registrado una explicación funcional como:

El conductor inicia y termina jornada
en el punto de recogida de la camioneta.

No es obligatorio, pero dificultaría entender configuraciones especiales desde VISO.

Diagnóstico
✅ Correcto
El único perfil es válido.
El trabajador está activo.
La sede laboral está asignada al trabajador.
El rol operativo existe y está habilitado en la sede.
Los puntos de marcación existen y están activos.
El índice único evita perfiles duplicados por sede.
El caso del conductor está modelado correctamente.
⚠️ Pendiente
39 trabajadores activos no tienen perfil.
No hay perfiles multisede.
No hay perfiles de producción.
No hay perfiles de satélites.
La tabla no permite área predeterminada.
Sedes laborales y puntos de marcación comparten catálogo.
El modelo depende casi totalmente de los turnos.
No existe configuración operativa habitual administrada para la mayoría del personal.

