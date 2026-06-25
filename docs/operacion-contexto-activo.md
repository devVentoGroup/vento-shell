# Operación: contexto activo, matriz de roles y puntos de marcación

## Estado del documento

Documento maestro de implementación para VENTO OS.

Ruta propuesta en repo:

```txt
docs/operacion-contexto-activo.md
```

Última actualización de trabajo:

```txt
2026-06-24
```

Este documento debe actualizarse cada vez que cambiemos base de datos, guards, shell, ANIMA, VISO, NEXO o FOGO relacionados con contexto operativo.

---

## 0. Estado actual de implementación

### Implementado / listo para subir a producción

#### Base de datos

1. Se creó el catálogo cerrado:

```txt
public.operational_roles
```

2. Se sembró catálogo V1 de roles operativos.

3. Se corrigió `site_operational_roles.role_code` para que apunte a:

```txt
public.operational_roles(code)
```

y no a la tabla antigua:

```txt
public.roles(code)
```

4. Se corrigió el índice de default para permitir:

```txt
1 rol default por sede + área
```

No solo un default por sede completa.

Índice esperado:

```txt
site_operational_roles_one_default_per_site_area_uidx
```

5. Se creó o dejó disponible la vista:

```txt
public.vento_operational_roles_v1
```

6. Se creó o dejó disponible la vista:

```txt
public.vento_site_operational_role_matrix_v1
```

7. Se creó la RPC:

```txt
public.upsert_site_operational_role(...)
```

Uso previsto:

```txt
/operations/site-roles
```

#### VISO / Operación

1. Sidebar principal ya debe tener una sola entrada:

```txt
Operación → /operations
```

2. Se trabajó la navegación interna de Operación:

```txt
/operations
/operations/checkin-points
/operations/site-roles
/operations/preview
```

3. `/operations/site-roles` quedó usando:

```txt
catálogo cerrado
matriz por sede/área
RPC upsert_site_operational_role
selector de áreas filtrado por sede seleccionada
```

4. Se creó el archivo nuevo:

```txt
src/app/operations/preview/page.tsx
```

Objetivo:

```txt
auditoría de solo lectura de la matriz operativa
```

5. Se ajustó `src/app/staff/schedule/page.tsx` para que la creación de horarios use la matriz operativa y no roles libres.

6. `/staff/schedule` quedó enfocado en la vista:

```txt
Tabla semanal
```

La pestaña `Planner` se ocultó/removió del flujo visible para no generar ruido operativo.

Estado exacto de esta fase:

```txt
VISO ya puede guardar employee_shifts.operational_role usando códigos de la matriz.
VISO ya puede guardar employee_shifts.area_id desde la Tabla semanal.
VISO ya puede guardar employee_shifts.checkin_site_id / checkout_site_id cuando el rol operativo los exige.
La Tabla semanal muestra alertas de turnos sin rol operativo, roles fuera de matriz y puntos externos faltantes.
```

---

### Pendiente / no considerar terminado todavía

#### ANIMA

ANIMA quedó adaptado en implementación inicial al modelo nuevo.

Hecho:

```txt
ANIMA lee checkin_site_id / checkout_site_id cuando existen.
ANIMA usa esos puntos para geocerca física.
ANIMA sigue usando employee_shifts.site_id como sede operativa.
ANIMA no debe mutar employees.role.
ANIMA conserva contexto activo en asistencia/device_info: shift_id, site_id, area_id, operational_role, checkin_site_id, checkout_site_id.
ANIMA envía geofence_site_id en el payload de attendance_logs.
Home y Turnos cargan area_id, operational_role, checkin_site_id y checkout_site_id desde employee_shifts.
```

Importante:

```txt
No re-agregar todavía FKs ambiguas entre employee_shifts.checkin_site_id / checkout_site_id y sites.id sin revisar ANIMA.
```

Ya ocurrió una ruptura previa por relaciones ambiguas en PostgREST.

#### Horarios VISO

La fase actual de `/staff/schedule` ya incluye en la Tabla semanal:

```txt
employee_shifts.area_id
employee_shifts.checkin_site_id
employee_shifts.checkout_site_id
filtrado de roles por sede + área
alertas visuales por contexto operativo incompleto
```

Lo crítico implementado es:

```txt
operational_role desde matriz
area_id desde matriz
puntos de marcación externos para conductor_logistica y roles equivalentes que los exijan
```

Siguiente mejora necesaria:

```txt
validar en producción que los nuevos turnos quedan con area_id, operational_role y puntos externos correctos
auditar turnos históricos que aparecen en alertas de Tabla semanal
validar Fase 3 ANIMA en dispositivo con turnos reales
```

#### Guards / apps operativas

Todavía falta revisar y cerrar:

```txt
FOGO
NEXO
PULSO
ORIGO
VISO operativo
```

Regla futura:

```txt
trabajador normal sin turno activo => no opera apps no-ANIMA
```

Excepción futura explícita:

```txt
system.work_without_shift
```

---

## 1. Objetivo

Construir un modelo operativo donde el acceso a las aplicaciones de VENTO dependa de:

```txt
usuario autenticado
+ trabajador activo
+ turno activo cuando aplique
+ sede operativa del turno
+ área operativa cuando aplique
+ rol operativo del turno
+ permisos efectivos para ese contexto
```

El sistema no debe usar el login por sí solo como autorización suficiente para operar.

---

## 2. Problemas que resuelve

### 2.1 Trabajadores desactivados

Un trabajador desactivado no debe poder operar en el ecosistema.

Regla:

```txt
employees.is_active = false
=> no acceso operativo
```

Esta regla es independiente de turnos, sedes, roles o puntos de marcación.

### 2.2 Apps operativas solo con turno activo

ANIMA debe estar disponible antes del turno porque es la app para iniciar asistencia.

Las apps operativas no deben estar disponibles para trabajadores normales sin turno activo:

```txt
NEXO
FOGO
PULSO
ORIGO
VISO operativo
```

Excepción futura:

```txt
system.work_without_shift
```

Esta excepción debe ser permiso explícito, no hardcode por nombre ni por rol textual.

### 2.3 Rol operativo por sede y turno

El rol base del trabajador no debe cambiar con el check-in.

Separación obligatoria:

| Concepto | Campo / fuente | Qué significa |
|---|---|---|
| Rol base | `employees.role` | Identidad laboral estable |
| Sede del turno | `employee_shifts.site_id` | Dónde se reporta la operación |
| Área del turno | `employee_shifts.area_id`, si existe | Área operativa |
| Rol operativo | `employee_shifts.operational_role` | Función efectiva del turno |
| Punto de entrada | `employee_shifts.checkin_site_id` | Geocerca física de entrada |
| Punto de salida | `employee_shifts.checkout_site_id` | Geocerca física de salida |

### 2.4 Caso conductor

El conductor no cambia el modelo general.

Solo agrega este caso:

```txt
la sede operativa real no es necesariamente el lugar físico de check-in
```

Ejemplo correcto:

```txt
site_id = Centro de Producción
operational_role = conductor_logistica
checkin_site_id = Patio vehículo
checkout_site_id = Patio vehículo
```

Regla:

```txt
Permisos => site_id + operational_role
Geocerca => checkin_site_id / checkout_site_id
```

`checkin_site_id` y `checkout_site_id` no deben definir permisos.

---

## 3. Decisiones tomadas

### 3.1 No crear roles operativos libres

No se permite crear cualquier `role_code` manualmente desde la UI.

Incorrecto:

```txt
conductor_perrito_123
barista_temporal_x
cualquier texto libre
```

Correcto:

```txt
Seleccionar roles desde un catálogo cerrado: operational_roles
```

### 3.2 Crear matriz controlada

La matriz define:

```txt
sede + área opcional + rol operativo permitido
```

No define permisos directamente. Los permisos deben resolverse mediante el sistema de permisos existente.

### 3.3 VISO define el rol operativo al crear horario

Al crear un horario/turno en VISO:

1. Se selecciona trabajador.
2. Se selecciona sede.
3. Se selecciona área si aplica.
4. VISO consulta roles operativos permitidos por matriz.
5. Si el rol base del trabajador corresponde a un rol operativo permitido, se selecciona automáticamente.
6. Si solo hay un rol operativo disponible, se selecciona automáticamente.
7. Si hay varios y no hay match, se obliga a seleccionar uno de la matriz.
8. Nunca se escribe un rol libre.
9. Si el rol requiere punto externo, se exige `checkin_site_id` y `checkout_site_id`.

### 3.4 ANIMA activa el contexto

ANIMA no cambia el rol base.

ANIMA activa el contexto del turno programado:

```txt
employee_id
shift_id
site_id
area_id
operational_role
checkin_site_id
checkout_site_id
```

### 3.5 Apps operativas consumen contexto

VISO, NEXO, FOGO y demás apps deben calcular permisos usando el contexto activo:

```txt
activeSiteId
activeAreaId
operationalRole
```

---

## 4. Catálogo V1 de roles operativos

Tabla:

```txt
public.operational_roles
```

Roles V1:

| Código | Nombre | Familia | Requiere check-in externo |
|---|---|---|---|
| cajero_satelite | Cajero satélite | satelite | no |
| barista_satelite | Barista satélite | satelite | no |
| cocinero_satelite | Cocinero satélite | satelite | no |
| servicio_salon | Servicio salón | satelite | no |
| mostrador_satelite | Mostrador satélite | satelite | no |
| operador_integral_satelite | Operador integral satélite | satelite | no |
| produccion_cocina | Producción cocina | produccion | no |
| produccion_panaderia | Producción panadería | produccion | no |
| produccion_reposteria | Producción repostería | produccion | no |
| bodeguero | Bodeguero | logistica | no |
| conductor_logistica | Conductor logística | logistica | sí |
| gerencia_operativa | Gerencia operativa | gerencia | no |
| propietario_admin | Propietario admin | administracion | no |

---

## 5. Matriz V1 por sede y área

### Estado cargado confirmado

#### Vento Café

| Área | Rol operativo | Default | Activo |
|---|---|---:|---:|
| Caja | cajero_satelite | sí | sí |
| Barra | barista_satelite | sí | sí |
| Cocina | cocinero_satelite | sí | sí |
| Mostrador | mostrador_satelite | sí | sí |
| Salón | servicio_salon | sí | sí |

#### Saudo

| Área | Rol operativo | Default | Activo |
|---|---|---:|---:|
| Caja | cajero_satelite | sí | sí |
| Cocina / Barra | barista_satelite | no | sí |
| Cocina / Barra | cocinero_satelite | no | sí |

Pendiente recomendado:

```txt
Saudo / Salón → servicio_salon, default sí, activo sí
```

Opcional:

```txt
Saudo / General → operador_integral_satelite, default no, activo sí
```

#### Molka

Confirmado por usuario como cargado.

Configuración esperada:

```txt
Molka / General → operador_integral_satelite
```

Default recomendado:

```txt
sí
```

#### Centro de Producción

Confirmado por usuario como cargado.

Configuración esperada:

```txt
Centro de Producción / Cocina caliente → produccion_cocina
Centro de Producción / Panadería → produccion_panaderia
Centro de Producción / Repostería → produccion_reposteria
Centro de Producción / Bodega → bodeguero
Centro de Producción / Ruta o General → conductor_logistica
```

Para `conductor_logistica`:

```txt
default recomendado: no
requires_external_checkin: true
requires_external_checkout: true
```

---

## 6. Permisos sugeridos por rol operativo

Estos permisos no se guardan en la matriz de sede. Deben estar en el sistema de permisos por rol.

### cajero_satelite

```txt
pulso.access
pulso.pos.main
```

### barista_satelite

```txt
fogo.access
fogo.production.recipe_book.view
fogo.production.recipes
```

### cocinero_satelite

```txt
fogo.access
fogo.production.recipe_book.view
fogo.production.recipes
```

### servicio_salon

```txt
pulso.access
pulso.pos.main limitado si existe
```

### mostrador_satelite

```txt
pulso.access
pulso.pos.main
nexo.inventory.remissions.receive si recibe remisiones
```

### operador_integral_satelite

Permitidos:

```txt
pulso.access
pulso.pos.main
fogo.access
fogo.production.recipe_book.view
fogo.production.recipes
nexo.access
nexo.kiosk_withdraw.view
nexo.inventory.withdraw
nexo.inventory.stock
nexo.inventory.remissions
nexo.inventory.remissions.receive
nexo.inventory.remissions.request
```

Con cuidado:

```txt
nexo.inventory.movements
nexo.inventory.transfers
nexo.inventory.entries
```

No permitidos:

```txt
viso.staff.manage
viso.staff.permissions.manage
fogo.production.recipes.manage
nexo.settings.*
nexo.internal_prices.*
nexo.internal_reports.*
nexo.inventory.adjustments
nexo.inventory.remissions.cancel
nexo.internal_variances.approve
```

### produccion_cocina

```txt
fogo.access
fogo.production.orders
fogo.production.batches
fogo.production.batches.create
fogo.production.batches.view
fogo.production.recipe_book.view
fogo.production.recipes
```

### produccion_panaderia

Mismos permisos de producción, con alcance por área/tipo:

```txt
area_kind = panaderia
```

### produccion_reposteria

Mismos permisos de producción, con alcance por área/tipo:

```txt
area_kind = reposteria
```

### bodeguero

```txt
nexo.access
nexo.inventory.stock
nexo.inventory.movements
nexo.inventory.entries
nexo.inventory.remissions
nexo.inventory.remissions.prepare
nexo.inventory.transfers
nexo.inventory.locations
```

### conductor_logistica

```txt
nexo.access
nexo.inventory.remissions
nexo.inventory.remissions.transit
nexo.inventory.remissions.receive limitado
```

### gerencia_operativa

Permisos globales operativos según app.

### propietario_admin

Permisos globales + bypass futuro:

```txt
system.work_without_shift
```

---

## 7. Reglas de creación de turnos en VISO

### 7.1 Estado actual

Implementado parcialmente en:

```txt
src/app/staff/schedule/page.tsx
```

Estado:

```txt
la Tabla semanal ya guarda employee_shifts.operational_role con código de matriz
la Tabla semanal ya guarda employee_shifts.area_id cuando aplica
la Tabla semanal ya exige checkin_site_id / checkout_site_id si la matriz marca el rol con punto externo
la Tabla semanal muestra área, rol operativo y punto externo dentro de la tarjeta de turno
la Tabla semanal muestra alertas de revisión operativa para turnos incompletos o fuera de matriz
```

Todavía pendiente:

```txt
validación SQL contra turnos nuevos en producción
limpiar o corregir turnos históricos detectados por alertas
mantener fuera de alcance la vista Planner si no se vuelve a usar
```

### 7.2 Resolver rol operativo default

Inputs:

```txt
employee_id
employee.role
site_id
area_id opcional
```

Proceso final esperado:

1. Consultar matriz activa para `site_id` y `area_id`.
2. Si no hay matriz para área, consultar matriz general de sede.
3. Mapear rol base a candidato operativo.
4. Si candidato existe en matriz, usarlo.
5. Si la matriz tiene un solo rol, usarlo.
6. Si hay varios y no hay match, exigir selección manual desde catálogo permitido.
7. Guardar en `employee_shifts.operational_role`.

### 7.3 Mapeo base sugerido

| Rol base | Rol operativo candidato |
|---|---|
| cajero | cajero_satelite |
| barista | barista_satelite |
| cocinero | cocinero_satelite |
| mesero | servicio_salon |
| bodeguero | bodeguero |
| conductor | conductor_logistica |
| panadero | produccion_panaderia |
| pastelero | produccion_reposteria |
| repostero | produccion_reposteria |
| gerente | gerencia_operativa |
| gerente_general | gerencia_operativa |
| propietario | propietario_admin |

### 7.4 Resolver puntos de marcación

Si el rol operativo tiene:

```txt
requires_external_checkin = true
```

entonces el horario debe exigir:

```txt
employee_shifts.checkin_site_id
```

Si el rol operativo tiene:

```txt
requires_external_checkout = true
```

entonces el horario debe exigir:

```txt
employee_shifts.checkout_site_id
```

Para `conductor_logistica`, ambos son true.

---

## 8. Reglas de acceso por turno activo

### 8.1 Siempre permitido

```txt
login
logout
ANIMA check-in
ANIMA check-out
pantalla de bloqueo
perfil básico
recuperación de sesión
```

### 8.2 Bloqueado sin turno activo

Para trabajadores normales:

```txt
FOGO operación
NEXO operación
PULSO operación
VISO operativo
ORIGO operación
acciones de inventario
acciones de caja
acciones de producción
```

### 8.3 Excepción futura

```txt
system.work_without_shift
```

Debe ser permiso explícito.

---

## 9. Reglas para conductor

El rol `conductor_logistica`:

```txt
requires_external_checkin = true
requires_external_checkout = true
```

Ejemplo:

```txt
employee_shifts.site_id = Centro de Producción
employee_shifts.operational_role = conductor_logistica
employee_shifts.checkin_site_id = Patio vehículo
employee_shifts.checkout_site_id = Patio vehículo
```

ANIMA debe validar geocerca contra `checkin_site_id` y `checkout_site_id`.

Las apps deben resolver permisos contra `site_id` y `operational_role`.

---

## 10. Hoja de ruta de implementación

### Fase 1: Matriz controlada

Estado:

```txt
completada funcionalmente
```

Hecho:

1. Crear `operational_roles`.
2. Sembrar catálogo V1.
3. Ajustar `site_operational_roles` para referenciar catálogo.
4. Crear vistas de VISO para matriz.
5. Rehacer `/operations/site-roles` para usar catálogo cerrado.
6. Filtrar áreas por sede en `/operations/site-roles`.

Pendiente menor:

```txt
confirmar Saudo / Salón
confirmar Saudo / General operador_integral_satelite opcional
```

### Fase 2: Horarios en VISO

Estado:

```txt
implementada funcionalmente en Tabla semanal; pendiente validación operativa en producción
```

Hecho:

1. Revisar `src/app/staff/schedule/page.tsx`.
2. Conectar creación/edición de horario con matriz.
3. Guardar `employee_shifts.operational_role`.
4. Agregar selección explícita de área del turno.
5. Guardar `employee_shifts.area_id`.
6. Filtrar roles por sede + área.
7. Exigir `checkin_site_id` / `checkout_site_id` para roles con punto externo.
8. Mostrar contexto operativo y alertas en Tabla semanal.

Pendiente:

1. Validar con SQL que los nuevos turnos quedan con rol operativo, área y puntos externos correctos.
2. Corregir turnos históricos que aparezcan en alertas.
3. Revisar si se elimina definitivamente código heredado de planificación IA/Planner.

### Fase 3: ANIMA

Estado:

```txt
implementada inicial; validación operativa parcial en ANIMA
```

Hecho:

1. ANIMA lee turno programado con `area_id`, `operational_role`, `checkin_site_id` y `checkout_site_id`.
2. ANIMA usa `checkin_site_id` para check-in si existe.
3. ANIMA usa `checkout_site_id` para check-out si existe.
4. ANIMA registra contexto operativo en asistencia/device_info.
5. ANIMA envía `geofence_site_id` separado de `site_id`.
6. ANIMA no muta `employees.role`.

Pendiente:

1. Validar en dispositivo check-in normal.
2. Validar en dispositivo check-out normal.
3. Validar fallback a `site_id` cuando no haya punto físico externo.
4. Revisar embeds PostgREST si se agregan relaciones nuevas hacia `sites`.

Validado:

1. En Diagnóstico ANIMA, conductor muestra entrada y salida en el punto de recogida de la camioneta.

### Fase 4: Guards y Shell

Estado:

```txt
pendiente
```

Pendiente:

1. Confirmar que apps no-ANIMA requieren turno activo para trabajadores normales.
2. Usar `site_id`, `area_id`, `operational_role` del turno activo.
3. Bloquear apps sin contexto.
4. Mantener ANIMA accesible sin turno.
5. Agregar permiso futuro `system.work_without_shift`.

### Fase 5: Auditoría / preview

Estado:

```txt
implementada inicial
```

Hecho:

1. Crear `/operations/preview`.
2. Mostrar resumen y matriz activa.
3. Detectar alertas básicas.

Pendiente:

1. Detectar turnos sin rol operativo.
2. Detectar roles no permitidos por matriz.
3. Detectar conductor sin punto externo.
4. Mostrar apps permitidas por rol/contexto.

---

## 11. Checklist antes de producción

### Base de datos

Verificar:

```sql
select code from public.operational_roles order by sort_order;
```

Verificar FK correcta:

```sql
select
  conname,
  conrelid::regclass as source_table,
  confrelid::regclass as referenced_table,
  pg_get_constraintdef(oid) as definition
from pg_constraint
where conname = 'site_operational_roles_role_code_fkey';
```

Debe decir:

```txt
referenced_table = operational_roles
```

Verificar matriz:

```sql
select
  site_name,
  site_code,
  coalesce(area_name, 'General') as area_name,
  area_kind,
  role_code,
  role_label,
  is_default,
  is_active,
  requires_external_checkin,
  requires_external_checkout
from public.vento_site_operational_role_matrix_v1
order by site_name, area_name, role_code;
```

Verificar turnos nuevos:

```sql
select
  employee_id,
  site_id,
  shift_date,
  start_time,
  end_time,
  operational_role
from public.employee_shifts
order by created_at desc
limit 20;
```

### Frontend VISO

Subir archivos:

```txt
src/app/operations/site-roles/page.tsx
src/app/operations/site-roles/site-operational-role-form.tsx
src/app/operations/preview/page.tsx
src/app/staff/schedule/page.tsx
src/components/vento/standard/vento-shell.tsx
src/components/viso/operations-nav.tsx
```

Verificar rutas:

```txt
/operations
/operations/checkin-points
/operations/site-roles
/operations/preview
/staff/schedule
```

### ANIMA

Implementación inicial realizada.

Archivos relacionados:

```txt
src/hooks/use-attendance.ts
src/hooks/attendance/action-payloads.ts
src/hooks/attendance/shared.ts
src/hooks/attendance/geofence-target.ts
src/components/shifts/use-shifts-data.ts
src/components/home/use-next-scheduled-shift.ts
src/components/shifts/utils.ts
```

Validar en dispositivo:

```txt
check-in normal sigue funcionando
check-out normal sigue funcionando
turnos publicados se ven
si conductor tiene checkin_site_id, geofence usa ese punto
si no tiene checkin_site_id, geofence usa site_id como fallback
```

---

## 12. Pendientes abiertos

- Validar con SQL en producción que los turnos nuevos de Tabla semanal guardan `area_id`, `operational_role`, `checkin_site_id` y `checkout_site_id` correctamente.
- Corregir turnos históricos que aparezcan en alertas de revisión operativa en Tabla semanal.
- Confirmar si Saudo tendrá `servicio_salon`.
- Confirmar si Saudo tendrá `operador_integral_satelite`.
- Validar ANIMA Fase 3 en dispositivo con turnos reales: `checkin_site_id` / `checkout_site_id`, geocerca física y contexto operativo activo.
- Revisar guards de FOGO/NEXO/VISO.
- Mejorar `/operations/preview` con validaciones contra turnos reales.
- Revisar permisos por rol operativo en sistema de permisos existente.

---

## 13. Regla de trabajo

No crear ni modificar código relacionado con roles operativos sin revisar este documento.

Cada cambio debe responder a una fase de la hoja de ruta.

---

## 14. Cambio 2026-06-25: reporte de asistencia e incidencias históricas

### Archivo corregido

```txt
src/app/api/viso/attendance-report/route.ts
```

### Problema corregido

El reporte estaba contando como incidencia crítica toda sesión de asistencia que quedara sin consolidar contra un turno del rango:

```txt
Asistencia sin turno
```

Eso inflaba el panel de `Incidencias clave`, especialmente con asistencia histórica que nunca tuvo horario publicado o que ya no puede vincularse sin crear falsos positivos.

### Regla implementada

El reporte ahora aplica estas reglas antes de crear una incidencia `Asistencia sin turno`:

1. Si la sesión ya tiene `shift_id`, pero no se consolidó dentro del rango visual del reporte, no se clasifica como `Asistencia sin turno`.
2. Si la sesión no tiene `shift_id`, solo se clasifica como `Asistencia sin turno` cuando es reciente según la política del reporte.
3. La asistencia histórica no vinculable deja de contaminar el conteo operativo de incidencias clave.

### Configuración

Variables soportadas:

```txt
VISO_ATTENDANCE_UNLINKED_INCIDENT_START_DATE
VISO_ATTENDANCE_UNLINKED_INCIDENT_LOOKBACK_DAYS
```

Comportamiento:

```txt
Si VISO_ATTENDANCE_UNLINKED_INCIDENT_START_DATE existe:
  solo se cuentan como "Asistencia sin turno" registros desde esa fecha.

Si no existe:
  se usa VISO_ATTENDANCE_UNLINKED_INCIDENT_LOOKBACK_DAYS.

Si tampoco existe:
  default = últimos 14 días.
```

### Recomendación operativa

Para producción, definir explícitamente:

```txt
VISO_ATTENDANCE_UNLINKED_INCIDENT_START_DATE=2026-06-01
```

Ajustar esa fecha si la puesta en marcha real del schedule publicado fue otra.

### Estado de base de datos relacionado

Se confirmó con diagnóstico que:

```txt
recoverable_unlinked_logs_after_timezone_fix = 214
```

y que los registros fuera de tolerancia no representan entradas "un poco temprano", sino diferencias grandes contra el turno más cercano.

Resultado de diagnóstico relevante:

```txt
check_in antes del inicio: p50 ≈ -1428 min
check_in después del inicio: p50 ≈ 1440 min
check_out antes del fin: p50 ≈ -1350 min
check_out después del fin: p50 ≈ 600 min
```

Decisión:

```txt
No ampliar tolerancias de attendance_policy a ciegas.
Aplicar backfill solo a registros recuperables por resolve_attendance_shift_id.
Mantener históricos no vinculables fuera de incidencias críticas operativas.
```

### SQL pendiente recomendado

Aplicar backfill seguro para los registros recuperables:

```sql
with matches as (
  select
    l.id as attendance_log_id,
    public.resolve_attendance_shift_id(
      l.employee_id,
      l.site_id,
      l.geofence_site_id,
      l.action,
      l.occurred_at
    ) as shift_id
  from public.attendance_logs l
  where l.shift_id is null
),
valid_matches as (
  select
    m.attendance_log_id,
    m.shift_id
  from matches m
  where m.shift_id is not null
),
updated as (
  update public.attendance_logs l
  set
    shift_id = vm.shift_id,
    geofence_site_id = case
      when l.geofence_site_id is null
       and l.site_id is distinct from s.site_id
      then l.site_id
      else l.geofence_site_id
    end,
    site_id = s.site_id
  from valid_matches vm
  join public.employee_shifts s
    on s.id = vm.shift_id
  where l.id = vm.attendance_log_id
  returning l.id
)
select count(*) as updated_attendance_logs
from updated;
```

Validación esperada posterior:

```sql
select count(*) as remaining_recoverable
from public.attendance_logs l
where l.shift_id is null
  and public.resolve_attendance_shift_id(
    l.employee_id,
    l.site_id,
    l.geofence_site_id,
    l.action,
    l.occurred_at
  ) is not null;
```

Resultado esperado:

```txt
remaining_recoverable = 0
```

---

## 15. Registro actual y roadmap pendiente

### Estado más reciente

1. VISO / attendance-report ya fue ajustado para no contar asistencia histórica no vinculable como "Asistencia sin turno" crítica.
2. Fase 2 de VISO schedule quedó funcional en Tabla semanal:
   - `area_id`
   - roles por sede + área
   - `checkin_site_id` / `checkout_site_id`
   - tarjetas con contexto operativo
   - alertas operativas por turnos incompletos o fuera de matriz
3. No ampliar tolerancias de asistencia todavía.

### Pendiente inmediato

1. Subir el route corregido en `src/app/api/viso/attendance-report/route.ts`.
2. Validar con SQL los turnos nuevos creados después de la migración de `employee_shifts.area_id`.
3. Corregir turnos históricos que aparezcan en alertas operativas.
4. Validar Fase 3 ANIMA en dispositivo con turnos reales:
   - check-in normal
   - check-out normal
   - fallback a `site_id` cuando no haya punto físico externo

### Validaciones ejecutadas 2026-06-25

1. Migraciones de asistencia aplicadas en remoto:
   - `20260625140000_attendance_shift_resolver_timezone_safe`
   - `20260625141000_attendance_logs_resolve_shift_trigger`
   - `20260625142000_backfill_attendance_logs_shift_id`
2. Verificación posterior:

```txt
remaining_recoverable = 0
resolver_exists = true
trigger_exists = true
```

3. Se creó y aplicó la migración:

```txt
20260625162814_employee_shifts_area_id
```

Resultado:

```txt
employee_shifts.area_id existe en producción.
```

4. Se creó y aplicó la migración:

```txt
20260625163215_attendance_shift_context_function_permissions
```

Resultado:

```txt
anon_can_execute = false
authenticated_can_execute = false
```

5. Auditoría de los últimos 50 turnos laborales recientes:

```txt
missing_operational_role = 45
role_not_allowed_for_area = 0
missing_required_checkin_point = 5
missing_required_checkout_point = 5
```

Lectura operativa:

```txt
No hacer backfill ciego.
Hay turnos administrativos en Vento Group sin mapeo operativo claro.
Hay turnos de conductor_logistica en Centro de Producción que necesitan puntos externos.
```

6. Validación operativa parcial ANIMA:

```txt
Diagnóstico ANIMA muestra conductor con entrada y salida en el punto de recogida de la camioneta.
```
