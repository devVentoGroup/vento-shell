### SECCIÓN — CONTEXTO DISPOSITIVOS Y SEGURIDAD

<!-- PLAN-SECTION-META:START -->
Esta sección reúne contenido canónico con una responsabilidad documental única dentro del plan. Debe conservarse cohesionada y actualizarse junto con sus referencias y validaciones dependientes.

**Cobertura canónica:** `AUTH-AUD-010` a `AUTH-AUD-014` — 5 tareas.
<!-- PLAN-SECTION-META:END -->

### ✅ AUTH-AUD-010 — Inventariar turnos, check-ins y sesiones operativas

Inventario general

| Entidad                                  | Registros | Cobertura       |
| ---------------------------------------- | --------- | --------------- |
| employee_shifts                          | 2.364     | 42 trabajadores |
| attendance_logs                          | 4.479     | 47 trabajadores |
| attendance_shift_events                  | 137       | 38 trabajadores |
| attendance_breaks                        | 11        | 7 trabajadores  |
| shift_runtime_events                     | 386       | 250 turnos      |
| context_simulation_sessions              | 0         | Sin uso         |
| shared_operational_device_actor_sessions | 0         | Sin uso         |

La hora comprobada durante la auditoría fue:

Bogotá: 16 de julio de 2026, 9:27 p. m.
UTC:    17 de julio de 2026, 2:27 a. m.

#### 1. Turnos programados

Distribución temporal
Turnos históricos:         2.257
Turnos del 16 de julio:       37
Turnos futuros:               70
Total:                     2.364

Rango de fechas:

Primer turno: 16 de marzo de 2026
Último turno: 19 de julio de 2026
Estados

| Estado    | Cantidad |
| --------- | -------- |
| scheduled | 2.361    |
| cancelled | 2        |
| confirmed | 1        |

⚠️ El campo status casi no representa el ciclo real del turno.

Incluso los turnos históricos terminados siguen apareciendo como:

scheduled

El cierre real de la jornada se determina mediante las marcaciones, no actualizando el estado del turno.

Tipo de turno

| Tipo     | Cantidad |
| -------- | -------- |
| laboral  | 2.015    |
| descanso | 349      |

#### 2. Cobertura operativa de los turnos

Del total histórico:

Con rol operativo:      474
Sin rol operativo:    1.890

Con área:                373
Sin área:              1.991

Esto refleja que el modelo operativo fue incorporado después de que ya existiera una cantidad importante de turnos.

Turnos actuales y futuros

Para el periodo desde el 16 de julio de 2026:

Total:                   143
Sin rol operativo:        21
Sin área:                 46
Sin punto de check-in:   141
Sin punto de check-out:  141
Interpretación

La cobertura reciente mejoró sustancialmente:

Rol operativo configurado:
122 de 143 turnos
85,3 %

Área configurada:

97 de 143 turnos
67,8 %

Los puntos de marcación específicos solo aparecen en dos turnos, probablemente los correspondientes al conductor.

Eso no es necesariamente incorrecto, porque los trabajadores normales pueden marcar en la propia sede del turno y solo los roles externos requieren un punto diferente.

#### 3. Integridad de los turnos

✅ Validaciones correctas

No se encontraron:

Roles operativos inexistentes:       0
Áreas inexistentes:                  0
Áreas pertenecientes a otra sede:    0
Turnos actuales en sedes no
asignadas al trabajador:             0
⚠️ Dos turnos con contexto incompleto

Se encontraron dos turnos históricos:

Trabajador: Geovanni Andres Osorio Bonilla
Sede:       SAUDO
Rol:        cocinero_satelite
Área:       null
Fechas:     26 y 27 de junio de 2026
Estado:     scheduled

En Saudo, cocinero_satelite está habilitado específicamente para:

Cocina / Barra

Como los dos turnos no tienen area_id, no coinciden completamente con la configuración de site_operational_roles.

El rol existe y la sede es válida, pero falta el área que completa el contexto.

#### 4. Marcaciones de asistencia

Acciones

| Acción    | Cantidad |
| --------- | -------- |
| check_in  | 2.243    |
| check_out | 2.236    |

Balance:

7 entradas más que salidas
Fuentes

| Fuente | Cantidad |
| ------ | -------- |
| mobile | 3.822    |
| system | 657      |

Aproximadamente:

85,3 % móvil
14,7 % sistema
Geolocalización
Con coordenadas:   4.242 de 4.479
Con geocerca:        743 de 4.479

La mayoría contiene coordenadas, pero solo una fracción conserva información explícita de geocerca.

Vinculación con turnos
Marcaciones vinculadas a shift_id: 2.217
Marcaciones sin shift_id:          2.262

Aproximadamente la mitad de las marcaciones no está enlazada directamente con un registro de employee_shifts.

Esto probablemente representa:

marcaciones anteriores a la integración con turnos;
jornadas espontáneas;
flujo antiguo de ANIMA;
registros creados sin turno programado.
✅ Integridad de los enlaces existentes

Entre las marcaciones que sí tienen shift_id:

Enlaces a turnos inexistentes:      0
Trabajador diferente al turno:      0
Sede diferente a la del turno:      0

Los enlaces existentes son consistentes.

#### 5. Jornadas aparentemente abiertas

Siete trabajadores tenían una entrada más que salida:

Carlos Daniel Romero Jaimes
Claudia Paola Villamediana Calderón
Leidy Velásquez
Linda Salazar
María Alexandra Arias Díaz
Nicol Sebastian Rojas Velandia
Yoli Carolina Rojas Contreras

En todos los casos:

Balance:       +1
Última acción: check_in
Fecha:         16 de julio de 2026

⚠️ Esto no debe clasificarse todavía como error.

La auditoría se realizó a las 9:27 p. m. en Bogotá, por lo que podían ser jornadas legítimamente abiertas.

Debe evaluarse después del cierre esperado o mediante la lógica de auto-checkout.

#### 6. Eventos automáticos del turno

Existen 386 eventos en shift_runtime_events.

Tipos

| Evento                     | Cantidad |
| -------------------------- | -------- |
| end_reminder_sent          | 238      |
| end_reminder_followup_sent | 141      |
| scheduled_auto_checkout    | 7        |

Estado

| Estado  | Cantidad |
| ------- | -------- |
| applied | 373      |
| skipped | 13       |

Esto confirma que ya existe una capa automática para:

Recordatorio de fin de turno
Segundo recordatorio
Auto-checkout programado

Sin embargo, solo se observan siete eventos de auto-checkout frente a cientos de recordatorios.

Debe verificarse posteriormente:

cuándo se programa el auto-checkout;
qué condiciones lo omiten;
si el checkout automático crea attendance_logs;
si las siete jornadas abiertas actuales quedarán cerradas automáticamente.

#### 7. attendance_shift_events

Existen 137 registros en una tabla distinta:

attendance_shift_events

Esta tabla almacena eventos por:

employee_id
site_id
shift_start_at
event_type
occurred_at
distance_meters
accuracy_meters

⚠️ Coexisten al menos tres sistemas relacionados:

attendance_logs
attendance_shift_events
shift_runtime_events

Sus responsabilidades parecen ser:

attendance_logs
→ marcación real del trabajador

attendance_shift_events
→ eventos asociados a una jornada calculada por hora de inicio

shift_runtime_events
→ automatizaciones, recordatorios y checkout programado

La separación puede ser válida, pero debe confirmarse que no estén duplicando la misma verdad operativa.

#### 8. Descansos

Registros:          11
Trabajadores:        7
Descansos abiertos:  0

El sistema de descansos se ha usado muy poco.

Todos los descansos registrados están cerrados correctamente.

#### 9. Sesiones operativas

Simulación de contexto
context_simulation_sessions
Registros: 0

La infraestructura para simular:

sede
área
rol operativo
rol administrativo

existe, pero no tiene sesiones históricas.

Esto indica que la función de preview/simulación de VISO todavía no se está usando o no persiste resultados.

Dispositivos compartidos
shared_operational_device_actor_sessions
Registros: 0

No existen sesiones de actor en tablets o dispositivos operativos compartidos.

La infraestructura permite almacenar:

dispositivo
trabajador activo
turno
rol operativo
sede
área
inicio y fin de sesión

Pero todavía no está implementada en uso real.

Hallazgos principales
⚠️ 1. El estado del turno no refleja su ciclo de vida

Casi todos los turnos, incluso los históricos, permanecen en:

scheduled

Debe definirse si employee_shifts.status representa:

estado de publicación;
estado administrativo;
estado de ejecución;
o una mezcla de los anteriores.

Actualmente no sirve para saber si el turno fue trabajado o completado.

⚠️ 2. La mitad de las marcaciones no está ligada a un turno
2.262 marcaciones sin shift_id

No son huérfanas porque shift_id es opcional, pero dificultan reconstruir:

turno planificado
vs.
jornada realmente trabajada
⚠️ 3. El modelo operativo reciente todavía tiene vacíos

Desde el 16 de julio:

21 turnos sin rol operativo
46 turnos sin área

El rol operativo tiene buena cobertura, pero aún no es obligatorio.

⚠️ 4. Dos turnos tienen rol sin área requerida

El caso de Geovanni en Saudo demuestra que la base permite seleccionar un rol habilitado únicamente para un área sin guardar esa área en el turno.

⚠️ 5. Existen múltiples tablas de eventos laborales
attendance_logs
attendance_shift_events
shift_runtime_events

Debe definirse claramente cuál es:

la fuente de verdad de marcación;
la fuente de automatizaciones;
la fuente de auditoría.
⚠️ 6. Las sesiones operativas todavía no existen

Tanto la simulación de contexto como las sesiones de dispositivos compartidos tienen cero registros.

La autorización actual depende de:

usuario autenticado
+
turno
+
rol operativo del turno

No de una sesión operativa persistente.

Diagnóstico
✅ Correcto
No hay turnos con roles o áreas inexistentes.
No hay áreas pertenecientes a otra sede.
Los turnos actuales corresponden a sedes asignadas.
Las marcaciones enlazadas coinciden con trabajador y sede.
No hay descansos abiertos.
La cantidad de entradas y salidas está casi balanceada.
Los eventos automáticos están siendo procesados.
⚠️ Pendiente
status no representa la ejecución real.
Hay 2.262 marcaciones sin turno.
Hay 21 turnos actuales/futuros sin rol.
Hay 46 turnos actuales/futuros sin área.
Dos turnos históricos tienen contexto operativo incompleto.
Hay siete jornadas posiblemente abiertas.
Coexisten tres sistemas de eventos.
No existen sesiones operativas persistentes.
No existen sesiones de dispositivos compartidos.

### ✅ AUTH-AUD-011 — Inventariar dispositivos compartidos

Inventario general

| Entidad                   | Registros | Activos |
| ------------------------- | --------- | ------- |
| Dispositivos compartidos  | 2         | 2       |
| Plantillas                | 6         | 6       |
| Apps por dispositivo      | 4         | 4       |
| Apps por plantilla        | 17        | 17      |
| Políticas por dispositivo | 2         | 2       |
| Políticas por plantilla   | 7         | 7       |
| Sesiones de actor         | 0         | 0       |
| Eventos registrados       | 3         | —       |

Dispositivos configurados
CAJA_VENTO_CAFE_01
Nombre:               Caja Vento Café 01
Tipo:                 pos_terminal
Sede:                 VENTO_CAFE
Área:                 Caja
Plantilla:            pos_satellite
App predeterminada:   PULSO
Rol de navegación:    cajero_satelite
Estado:               active

Aplicaciones habilitadas:

PULSO
NEXO
SHELL

Política activa:

role_in_area

Seguridad:

PIN obligatorio:             sí
Turno activo obligatorio:    sí
Actor sin PIN:               no
Acciones sin actor:          no
Usuario técnico asociado:    sí
KIOSCO_BODEGA_CP
Nombre:               Kiosco Bodega CP
Tipo:                 warehouse_terminal
Sede:                 CENTRO_PROD
Área:                 Bodega
Plantilla:            warehouse_kiosk
App predeterminada:   NEXO
Rol de navegación:    bodeguero
Estado:               active

Aplicaciones habilitadas:

NEXO

Política activa:

same_site_active_worker

Seguridad:

PIN obligatorio:             sí
Turno activo obligatorio:    sí
Actor sin PIN:               no
Acciones sin actor:          no
Usuario técnico asociado:    sí
Hallazgo importante: dispositivos activos pero sin uso persistido

Ambos dispositivos tienen:

activation_status = active
is_active = true
auth_user_id configurado

Pero:

last_seen_at = null
sesiones de actor = 0

Solo existen tres eventos históricos, todos del 9 de julio de 2026.

Esto indica una de estas situaciones:

los dispositivos todavía no están usando la capa de sesión compartida;
sí están siendo usados, pero las aplicaciones no actualizan last_seen_at;
los eventos se generan únicamente durante pruebas;
el dispositivo sigue autenticado como usuario técnico, pero el trabajador no inicia una sesión de actor.
Plantillas disponibles

#### 1. pos_satellite

Caja satélite
App principal: PULSO
Rol navegación: cajero_satelite
Apps: PULSO, NEXO, SHELL
Política: role_in_area
Dispositivos reales: 1

✅ Es la plantilla más completa y ya está instanciada.

#### 2. bar_satellite

Barra satélite
App principal: PULSO
Rol navegación: barista
Apps: PULSO, NEXO, SHELL
Política: same_area_active_worker
Dispositivos reales: 0

⚠️ Usa barista, que es el rol base antiguo, no barista_satelite.

#### 3. warehouse_kiosk

Kiosco de bodega
App principal: NEXO
Rol navegación: bodeguero
Apps: NEXO, SHELL
Política: same_site_active_worker
Dispositivos reales: 1

⚠️ bodeguero existe simultáneamente como rol base y operativo, por lo que el significado del campo no es inequívoco.

#### 4. procurement_reception

Recepción de compras
App principal: ORIGO
Rol navegación: auxiliar_administrativa
Apps: ORIGO, NEXO, SHELL
Política: same_area_active_worker
Dispositivos reales: 0

⚠️ El rol de navegación es administrativo, aunque el dispositivo exige turno activo.

#### 5. production_center

Producción centro
App principal: FOGO
Rol navegación: cocinero
Apps: FOGO, NEXO, SHELL
Política: same_site_active_worker
Dispositivos reales: 0

⚠️ Usa cocinero, el rol base antiguo, en lugar de uno de los roles operativos:

produccion_cocina
produccion_panaderia
produccion_reposteria

La plantilla no diferencia las áreas de producción.

#### 6. management_terminal

Gerencia
App principal: NUMERA
Rol navegación: gerente_general
Apps: NUMERA, VISO, SHELL
Políticas: role_in_site, role_in_site
Dispositivos reales: 0

⚠️ Tiene dos políticas del mismo tipo. Pueden corresponder a roles o configuraciones diferentes, pero visualmente aparecen como duplicadas y requieren revisión detallada posterior.

Políticas de actor

El sistema soporta políticas como:

same_site_active_worker
same_area_active_worker
role_in_site
role_in_area

Estas políticas determinan quién puede convertirse en actor efectivo dentro del dispositivo.

Dispositivos reales
Caja Vento Café:
role_in_area

Kiosco Bodega:
same_site_active_worker
Diferencia funcional
role_in_area
→ exige un rol concreto habilitado dentro del área

same_site_active_worker
→ permite cualquier trabajador activo de la sede

⚠️ La política del kiosco de bodega es mucho más amplia.

Con same_site_active_worker, cualquier trabajador activo asignado al Centro de Producción podría potencialmente iniciar una sesión, sujeto a las demás validaciones de turno y PIN.

Eso incluiría personal de:

cocina;
panadería;
repostería;
bodega;
logística;
gerencia asignada a la sede.

Debe confirmarse si después se valida además el rol operativo requerido por la app.

Navegación y autorización

Existe un campo:

navigation_role

tanto en plantillas como en dispositivos.

Actualmente mezcla dos catálogos:

Roles operativos
cajero_satelite
bodeguero
Roles base
barista
auxiliar_administrativa
cocinero
gerente_general
⚠️ Problema conceptual

El campo no establece si espera:

public.roles.code

o:

public.operational_roles.code

La auditoría verificó que todos los valores existen en al menos uno de los dos catálogos, pero no existe una semántica única.

Esto puede producir lógica como:

navigation_role = cocinero

mientras el turno contiene:

operational_role = produccion_cocina

El sistema necesitaría traducir entre ambos conceptos o podría bloquear navegación válida.

Apps por dispositivo y plantilla
Dispositivos reales
Caja:
NEXO, PULSO, SHELL

Kiosco:
NEXO

La plantilla de kiosco contiene:

NEXO, SHELL

pero el dispositivo real solo contiene:

NEXO

⚠️ Esto indica que las aplicaciones de una plantilla no se heredan necesariamente en tiempo real o que el dispositivo puede sobreescribirlas.

Debe definirse si:

apps efectivas = plantilla + overrides

o:

apps efectivas = solo filas del dispositivo

Sin esa regla, modificar una plantilla podría no afectar dispositivos ya creados.

Sesiones de actor
shared_operational_device_actor_sessions
Registros: 0

La tabla está diseñada para guardar:

dispositivo;
trabajador;
turno;
rol operativo;
sede;
área;
inicio;
expiración;
cierre;
motivo de cierre.

Pero actualmente no existe ninguna sesión.

Consecuencia

No hay evidencia persistida de una secuencia como:

Tablet autenticada como dispositivo técnico
        ↓
Trabajador ingresa PIN
        ↓
Se valida turno activo
        ↓
Se crea sesión del actor
        ↓
Las acciones quedan atribuidas al trabajador

La infraestructura existe, pero no está siendo utilizada de forma observable.

Eventos

Existen tres registros en:

shared_operational_device_events

Rango temporal:

9 de julio de 2026

No existen:

eventos sin dispositivo
eventos con aplicación desconocida

✅ Los tres eventos están referencialmente consistentes.

Sin embargo, tres eventos son insuficientes para considerar la capa implementada operacionalmente.

Integridad referencial
✅ Correcto

No se encontraron:

Apps predeterminadas inexistentes:       0
Apps de dispositivo inexistentes:        0
Apps de plantilla inexistentes:          0
Áreas pertenecientes a otra sede:        0
Roles de navegación inexistentes:        0
Eventos sin dispositivo:                 0
Eventos con app desconocida:             0
⚠️ Aclaración

Que un rol de navegación “exista” no significa que sea semánticamente correcto, porque puede existir en el catálogo base cuando la plantilla debería utilizar el catálogo operativo.

Hallazgos principales
⚠️ 1. La infraestructura está mucho más avanzada que su uso real
Plantillas:            6
Dispositivos:          2
Sesiones:              0
Eventos:               3

El modelo está diseñado, pero no desplegado completamente.

⚠️ 2. Roles base y operativos están mezclados

Plantillas nuevas siguen usando:

barista
cocinero
gerente_general

mientras otras usan:

cajero_satelite

No existe una convención única para navigation_role.

⚠️ 3. La política del kiosco puede ser demasiado amplia
same_site_active_worker

no restringe explícitamente a bodegueros.

⚠️ 4. No existen sesiones de actor

No hay trazabilidad persistida que vincule:

dispositivo técnico
→ trabajador real
→ turno
→ rol operativo
⚠️ 5. last_seen_at nunca se ha actualizado

Ambos dispositivos activos tienen:

last_seen_at = null

No puede determinarse si están conectados o abandonados.

⚠️ 6. Plantillas sin dispositivos

Cuatro plantillas activas no tienen ninguna instancia:

bar_satellite
procurement_reception
production_center
management_terminal
⚠️ 7. La plantilla de producción es demasiado genérica

Usa:

navigation_role = cocinero

y no diferencia panadería, repostería y cocina.

⚠️ 8. Apps de plantilla y dispositivo no coinciden siempre

El kiosco no tiene shell en sus apps propias, aunque sí aparece en la plantilla.

Diagnóstico
✅ Correcto
Los dos dispositivos existen y están activos.
Ambos tienen usuario técnico.
Sus sedes y áreas son coherentes.
Las aplicaciones referenciadas existen.
Las plantillas y políticas están activas.
Los eventos registrados son válidos.
La configuración exige PIN y turno activo.
⚠️ Pendiente
No hay sesiones de actor.
No hay actividad registrada en last_seen_at.
Solo tres eventos históricos.
Se mezclan roles base y operativos.
El kiosco permite cualquier trabajador activo de la sede.
Cuatro plantillas no están implementadas.
La plantilla de producción no representa las tres áreas.
No está clara la herencia entre plantilla y dispositivo.

### ✅ AUTH-AUD-012 — Auditar funciones has_permission y has_operational_permission

#### 1. Dos sistemas de autorización separados

has_permission

Evalúa permisos permanentes derivados de:

empleado
  ↓
employee_permissions
  ↓
role_permissions

Firma:

has_permission(
  p_permission_code text,
  p_site_id uuid default null,
  p_area_id uuid default null
)

Ejemplo esperado:

viso.staff.manage
nexo.inventory.stock
numera.reports.view
has_operational_permission

Evalúa permisos temporales derivados del rol operativo del turno:

turno activo
  ↓
operational_role
  ↓
operational_role_permissions

Firma:

has_operational_permission(
  p_permission_code text,
  p_site_id uuid default null,
  p_area_id uuid default null,
  p_app_code text default null
)

Ejemplo:

nexo.inventory.remissions.request
nexo.inventory.remissions.prepare
pulso.pos.main
Hallazgo central

Las funciones no combinan automáticamente ambos modelos.

has_permission
≠
has_operational_permission

Cada aplicación o ruta debe decidir explícitamente cuál consulta.

Esto permite inconsistencias como:

Pantalla A
→ usa has_permission

Pantalla B
→ usa has_operational_permission

Operación SQL
→ no usa ninguna o usa otra condición

La autorización efectiva depende de que todo el ecosistema utilice la función correcta.

#### 2. Precedencia de has_permission

La secuencia real es:

#### 1. Verificar usuario autenticado

#### 2. Verificar empleado activo

#### 3. Verificar que el permiso exista y esté activo

#### 4. Resolver sede y área

#### 5. Buscar denegación individual

#### 6. Buscar concesión individual

#### 7. Buscar concesión por rol base

#### 8. Denegar por defecto

Representación:

employee deny
      ↓
   DENEGAR

employee allow
      ↓
   PERMITIR

role allow
      ↓
   PERMITIR

sin coincidencia
      ↓
   DENEGAR
✅ Precedencia correcta

Una denegación individual tiene prioridad sobre:

concesión individual;
concesión del rol base.
employee deny > employee allow > role allow

Esto es conceptualmente correcto.

⚠️ No existen denegaciones reales

En los datos actuales:

employee_permissions deny = 0
role_permissions deny     = 0

Por tanto, la ruta de denegación existe en código, pero no ha sido ejercitada con datos reales.

#### 3. has_permission no considera roles operativos

La función consulta exclusivamente:

employees.role
employee_permissions
role_permissions

No consulta:

employee_shifts.operational_role
operational_role_permissions

Por tanto:

has_permission('nexo.inventory.remissions.request')

puede devolver true por el rol base cocinero, aunque el trabajador:

no tenga turno activo;
no haya marcado entrada;
esté trabajando en otra sede;
tenga un rol operativo distinto.

Este es el principal riesgo del modelo híbrido actual.

#### 4. has_operational_permission depende del contexto activo

La secuencia real es:

#### 1. Validar código de permiso

#### 2. Inferir app desde el prefijo si no se suministra

#### 3. Ejecutar get_operational_context

#### 4. Verificar empleado encontrado

#### 5. Aplicar bypass si corresponde

#### 6. Exigir can_operate

#### 7. Exigir active_operational_role

#### 8. Validar rol habilitado en la sede/área

#### 9. Buscar operational_role_permissions

#### 10. Denegar por defecto

Regla de permiso

La concesión requiere:

role_code = active_operational_role
permission_code = código solicitado
is_allowed = true

Y opcionalmente coincide con:

site_id
area_id
area_kind

Actualmente todas las asignaciones operativas son globales, por lo que las tres dimensiones están en null.

#### 5. Bypass administrativo

get_operational_context aplica bypass directo cuando:

employees.role in (
  'propietario',
  'gerente_general'
)

Resultado:

bypass_applied = true

Luego has_operational_permission devuelve inmediatamente:

true
Consecuencia

Propietario y gerente general no necesitan:

turno activo;
check-in;
rol operativo;
fila en operational_role_permissions;
permiso operativo concreto.

Ejemplo:

has_operational_permission(
  'nexo.permission_inexistente'
)

El código de permiso solo se valida como texto no vacío. No se comprueba contra app_permissions.

Si el usuario tiene bypass, la función devuelve true antes de verificar que el permiso exista.

⚠️ Hallazgo crítico

El bypass permite cualquier cadena de permiso no vacía:

nexo.permission_inexistente
fogo.accion_ficticia
texto_arbitrario

para propietario y gerente_general.

Esto no suele provocar acceso por sí solo si el código llama siempre permisos conocidos, pero elimina la validación de integridad dentro de la función.

#### 6. Bypass mediante permiso base

Además del bypass directo, cada aplicación puede configurar:

app_operation_policies.bypass_permission_code

La función construye:

`<app_code>.<bypass_permission_code>`

y llama:

has_permission(...)

Esto permite que un permiso administrativo permanente evite:

turno;
check-in;
coincidencia de sede.
Implicación

El flujo puede ser:

has_operational_permission
    ↓
get_operational_context
    ↓
has_permission

No existe recursión infinita porque has_permission no vuelve a llamar a has_operational_permission.

La separación técnica es válida, pero el permiso de bypass debe ser extremadamente restringido.

#### 7. Resolución de sede en has_permission

La sede utilizada es:

p_site_id
    ↓ si es null
current_employee_site_id()
    ↓
current_employee_selected_site_id()

La sede seleccionada procede de:

employee_settings.selected_site_id

o, en ausencia de selección:

sede primaria del trabajador
⚠️ La sede suministrada no se valida inicialmente

Si se llama:

has_permission(permission, otra_sede_id)

la función acepta esa sede como contexto.

La restricción se aplica después dentro de:

permission_scope_matches

Para permisos globales:

scope_type = global
→ siempre true

Por tanto, un permiso global permanece permitido sin importar qué sede se suministre.

Eso es esperado para un permiso verdaderamente global, pero es riesgoso para roles como gerente, cuyos 115 permisos están configurados como globales aunque conceptualmente sea gerente de sede.

#### 8. Semántica del alcance site

La lógica real es:

scope_type = site
Debe existir una sede de contexto.
Si scope_site_id no es null, debe coincidir.
Se llama can_access_site(context_site_id).
Caso problemático ya encontrado

Existen 14 filas de role_permissions con:

scope_type = site
scope_site_id = null

La función interpreta eso como:

cualquier sede a la que el trabajador pueda acceder

No como una configuración incompleta.

Por tanto, la semántica real es:

site + site_id null
→ todas las sedes asignadas al trabajador

Esto aclara la duda encontrada en AUTH-AUD-005.

El nombre site no significa necesariamente “una sede concreta”; también significa “cualquier sede autorizada”.

#### 9. can_access_site

La función permite acceso cuando:

p_site_id pertenece a employee_sites activo

o coincide con:

employees.site_id

También permite siempre a:

propietario
gerente_general
⚠️ Empleados inactivos en employee_sites

La primera ruta no comprueba:

employees.is_active

Solo comprueba:

employee_sites.is_active = true

En la auditoría anterior se encontraron:

15 empleados inactivos
con employee_sites activos

Sin embargo, has_permission verifica primero que el empleado esté activo, por lo que esa función concreta queda protegida.

Pero can_access_site es pública y puede ser utilizada directamente desde otras políticas o funciones sin esa validación previa.

#### 10. Semántica del alcance area

La lógica es:

scope_type = area
Debe existir p_context_area_id.
Si el permiso especifica un área, debe coincidir.
Se llama can_access_area(area_id).
Problema operativo

can_access_area depende de:

employee_areas
employees.area_id

Pero:

employee_areas tiene 1 fila
employees.area_id está vacío

Por tanto, para 39 de los 40 trabajadores activos:

can_access_area(area_id) = false

salvo propietario o gerente general.

Esto significa que los permisos base con alcance:

area
area_kind

son prácticamente inutilizables para la mayoría del personal.

Afectación conocida

En role_permissions se encontraron cinco filas area_kind, correspondientes principalmente a:

barista
cocinero

Como estos empleados no tienen employee_areas, esos permisos podrían no concederse aunque el turno sí tenga un área válida.

has_permission no utiliza el área del turno automáticamente.

#### 11. has_operational_permission y la sede del turno

get_operational_context resuelve la sede activa con esta prioridad:

#### 1. p_site_id explícito

#### 2. employee_settings.selected_site_id

#### 3. sede del check-in abierto

#### 4. sede del turno activo

#### 5. sede primaria del empleado

⚠️ Prioridad potencialmente peligrosa

La sede seleccionada manualmente tiene prioridad sobre la sede del turno:

selected_site_id
>
shift_site_id

Si la política exige coincidencia de sede, se genera:

shift_site_mismatch

Eso bloquea la operación.

Es seguro en términos de autorización, pero puede generar bloqueos si la aplicación conserva una sede seleccionada antigua mientras el empleado inicia turno en otra sede.

#### 12. Detección de turno activo

El turno activo se determina mediante:

shift_date = fecha actual Bogotá
published_at is not null
status <> cancelled
hora actual dentro del horario
✅ Considera turnos nocturnos

La condición soporta turnos donde:

start_time > end_time

como un turno que cruza medianoche.

⚠️ Posible problema con la fecha

Para un turno nocturno iniciado el día anterior:

shift_date = ayer
22:00 → 06:00

A las 02:00 del día siguiente, la consulta exige:

shift_date = hoy

Aunque la condición horaria reconoce el cruce de medianoche, el filtro de fecha probablemente excluye el turno iniciado ayer.

Por tanto, el soporte de turnos nocturnos parece incompleto.

#### 13. Detección de check-in abierto

La función busca el último check_in para el cual no exista ningún check_out posterior del mismo trabajador.

No exige:

mismo shift_id
misma sede
misma fecha
Consecuencia

Un check-out posterior en cualquier sede cierra conceptualmente todos los check-ins anteriores.

Esto funciona si se garantiza una sola jornada abierta por trabajador.

Pero si existieran:

check-ins duplicados;
cambios de sede;
marcaciones corregidas;
sesiones simultáneas;

la lógica podría identificar incorrectamente la jornada activa.

#### 14. Área del check-in no existe realmente

En get_operational_context:

select al.id, al.site_id, null::uuid

La variable:

v_open_checkin_area_id

siempre queda en null.

Por tanto:

active_area_id
**=**
shift_area_id

El check-in nunca aporta área.

Aunque el resultado expone:

active_checkin_area_id

ese campo siempre será null con la implementación actual.

#### 15. Validación de rol por sede y área

get_operational_context valida:

site_operational_roles.site_id = shift.site_id
role_code = shift.operational_role

Y para área:

sor.area_id is null
o
sor.area_id = shift.area_id

Esta validación es estricta cuando el rol está configurado para un área concreta.

Eso explica los dos turnos históricos de Saudo detectados anteriormente:

cocinero_satelite
area_id = null

La función los clasificaría como:

invalid_operational_role

#### 16. Diferencia de validación entre contexto y permiso

Después de obtener el contexto, has_operational_permission vuelve a validar site_operational_roles, pero usa:

sor.area_id is null
OR v_area_id is null
OR sor.area_id = v_area_id
⚠️ Regla más permisiva

Si:

v_area_id = null

la validación de has_operational_permission acepta cualquier rol de esa sede, aunque esté configurado para un área específica.

Sin embargo, normalmente get_operational_context ya lo habría bloqueado con can_operate = false.

La segunda validación queda redundante y utiliza una semántica distinta.

Esto aumenta el riesgo de futuras inconsistencias si cambia uno de los dos métodos.

#### 17. Validación del permiso operativo

has_operational_permission no verifica que el código exista en:

apps
app_permissions

Solo busca coincidencia textual en:

operational_role_permissions.permission_code

Para usuarios normales, una cadena inexistente devuelve false porque no habrá fila.

Para bypass administrativo, devuelve true.

Comparación
has_permission
✅ valida app activa
✅ valida permiso activo

has_operational_permission
❌ no valida app
❌ no valida app_permission

#### 18. Seguridad de ejecución

Todas estas funciones son:

SECURITY DEFINER
owner = postgres
search_path = public

Esto significa que ejecutan con privilegios elevados y pueden saltarse RLS. La documentación de seguridad de Supabase advierte que las funciones SECURITY DEFINER expuestas deben tener controles internos estrictos.

Permisos de ejecución
has_permission
anon          ✅ puede ejecutar
authenticated ✅ puede ejecutar
service_role  ✅ puede ejecutar
has_operational_permission
anon          ❌
authenticated ✅
service_role  ✅
Evaluación

has_permission devuelve false para un usuario sin auth.uid(), por lo que un anónimo no obtiene permisos.

Aun así:

anon puede invocar una función SECURITY DEFINER

sin necesidad funcional aparente.

Lo mismo ocurre con auxiliares como:

can_access_site
can_access_area
permission_scope_matches
current_employee_site_id

Su ejecución pública amplía innecesariamente la superficie de API.

Diagnóstico final
has_permission
✅ Correcto
Verifica empleado activo.
Valida app y permiso activos.
Deniega por defecto.
Denegación individual tiene prioridad.
Soporta alcance global, sede, tipo de sede, área y tipo de área.
⚠️ Problemas
No considera turno ni rol operativo.
Los permisos globales ignoran sede.
El alcance de área depende de tablas prácticamente vacías.
Es ejecutable por anon.
Usa SECURITY DEFINER.
Puede mantener vivos permisos permanentes de oficios operativos antiguos.
has_operational_permission
✅ Correcto
Requiere contexto operativo válido.
Usa el rol del turno.
Deniega si no existe asignación operativa.
Considera sede, área y tipo de área.
No es ejecutable por anon.
⚠️ Problemas
Bypass concede cualquier código no vacío.
No valida el permiso contra app_permissions.
Depende de una detección de turno nocturno posiblemente incompleta.
La sede seleccionada puede bloquear un turno válido.
El área del check-in siempre es null.
Duplica la validación de rol con una regla diferente.
No soporta denegaciones operativas efectivas.
Depende de texto libre en permission_code.

### ✅ AUTH-AUD-013 — Auditar get_operational_context

#### 1. Función y resultado

get_operational_context devuelve una fila con:

employee_id
app_code

active_site_id
selected_site_id
employee_default_site_id

active_shift_id
active_shift_site_id
active_shift_area_id
active_operational_role
on_shift_now

active_checkin_id
active_checkin_site_id
active_checkin_area_id
checked_in_now

active_area_id
active_area_kind

policy_requires_shift
policy_requires_checkin
policy_requires_site_match

bypass_applied
can_operate
blocked_reasons

Su propósito es consolidar en una sola respuesta:

trabajador
+ aplicación
+ sede
+ turno
+ rol operativo
+ check-in
+ área
+ política operativa

#### 2. Políticas por aplicación

Solo existe una política activa:

NEXO
requires_shift       = true
requires_checkin     = true
requires_site_match  = true

bypass_permission_code =
inventory.remissions.all_sites

Las otras nueve aplicaciones activas no tienen política:

ANIMA
AURA
FOGO
NUMERA
ORIGO
PASS
PULSO
SHELL
VISO
⚠️ Consecuencia

La ausencia de política no genera un error.

La función interpreta los valores faltantes como:

requires_shift       = false
requires_checkin     = false
requires_site_match  = false

Por tanto, no existe una política operativa uniforme para el ecosistema.

#### 3. Resultado real de NEXO

Durante la comprobación había 40 empleados activos.

Podían operar NEXO:         8
Bloqueados:                32

De los ocho permitidos:

Bypass administrativo:      7
Contexto operativo real:    1

El único trabajador autorizado mediante turno y check-in fue:

Carlos Daniel Romero Jaimes
Rol base:          cajero
Sede activa:       SAUDO
Rol operativo:     cajero_satelite
En turno:          sí
Check-in abierto:  sí
Bypass:            no

Los otros siete correspondían a propietarios y gerentes generales.

#### 4. Motivos de bloqueo observados

| Motivo                                          | Trabajadores |
| ----------------------------------------------- | ------------ |
| Fuera de turno y sin check-in                   | 24           |
| Sin bloqueo                                     | 8            |
| Sin check-in, rol inválido y sede inconsistente | 4            |
| Sin check-in y rol inválido                     | 2            |
| Solo sin check-in                               | 1            |
| Solo fuera de turno                             | 1            |

Esto confirma que la política de NEXO sí está siendo aplicada.

#### 5. Resolución de la sede activa

La prioridad exacta es:

#### 1. p_site_id suministrado

#### 2. employee_settings.selected_site_id

#### 3. sede del check-in abierto

#### 4. sede del turno activo

#### 5. employees.site_id

⚠️ La sede seleccionada prevalece sobre el turno

Ejemplo:

Sede seleccionada: VENTO_CAFE
Turno activo:      SAUDO

Resultado:

active_site_id = VENTO_CAFE
blocked_reason = shift_site_mismatch

Esto bloquea correctamente la operación, pero una selección antigua en el frontend puede impedir que un turno válido funcione.

#### 6. p_site_id no se valida como sede autorizada

La función acepta directamente cualquier UUID suministrado como:

p_site_id

No ejecuta internamente:

can_access_site(p_site_id)

antes de adoptarlo como sede activa.

Para NEXO, la coincidencia con turno y check-in puede bloquearlo.

Pero para una aplicación sin política:

requires_site_match = false

la sede arbitraria puede quedar como active_site_id sin generar una razón de bloqueo.

⚠️ En propietarios y gerentes generales

El bypass evita todas las validaciones de sede.

Un propietario puede solicitar contexto para una sede no asignada y obtener:

bypass_applied = true
can_operate    = true

#### 7. p_app_code tampoco se valida

La función busca una política con:

app_operation_policies.app_code

pero no verifica previamente que la aplicación exista en:

public.apps

Una llamada con:

p_app_code = 'aplicacion_inexistente'

produce un contexto con esa cadena como app_code.

Al no encontrar política:

requires_shift       = false
requires_checkin     = false
requires_site_match  = false

Para un propietario o gerente general, además:

bypass_applied = true
can_operate    = true

⚠️ La función debería fallar de forma cerrada ante una aplicación inexistente, no asumir una política vacía.

#### 8. Hallazgo crítico: p_employee_id es arbitrario

La firma permite:

get_operational_context(
  p_employee_id uuid default auth.uid(),
  ...
)

Pero la función no exige que:

p_employee_id = auth.uid()

ni comprueba que el solicitante tenga un permiso administrativo para consultar otro trabajador.

Además:

SECURITY DEFINER
owner = postgres
authenticated puede ejecutarla
Consecuencia

Cualquier usuario autenticado que pueda invocar el RPC podría solicitar:

get_operational_context(
  '`<ID_DE_OTRO_TRABAJADOR>`',
  null,
  'nexo'
)

y consultar información como:

sede seleccionada;
sede principal;
turno activo;
área;
rol operativo;
estado de check-in;
motivos de bloqueo;
bypass administrativo.
⚠️ Riesgo BOLA/IDOR

La función constituye potencialmente un endpoint de lectura de contexto de otros trabajadores sin autorización interna.

Este es uno de los hallazgos de seguridad más importantes de la auditoría.

Las funciones SECURITY DEFINER deben implementar controles internos estrictos porque ejecutan con privilegios elevados y pueden saltarse RLS.

#### 9. No verifica que el trabajador esté activo

La función consulta:

select e.site_id, e.role
from employees e
where e.id = p_employee_id

No incluye:

and e.is_active = true
Consecuencia

Un empleado inactivo puede obtener contexto si se invoca directamente con su ID.

Actualmente ninguno de los 15 empleados inactivos podía operar NEXO en el momento de la prueba, porque no tenía turno/check-in o bypass aplicable.

Pero eso depende de los datos actuales, no de una protección de la función.

Un empleado inactivo podría volver a obtener capacidad si conserva:

turno vigente;
check-in abierto;
rol operativo;
o un rol base con bypass.

#### 10. Bypass administrativo

Existe bypass directo para:

propietario
gerente_general

Durante la prueba fueron autorizados siete registros:

App Review (Apple/Google)
Carlos Alejandro Ibarra Ariza
Denaly Liliana Perez Sepulveda
Jeo Garcia
Johanna García
Juliandy Garabito
Nathalia Carolina Ibarra Ariza

Todos recibieron:

on_shift_now           = false
checked_in_now         = false
active_operational_role = null
bypass_applied         = true
can_operate            = true
⚠️ App Review

La identidad de revisión de tiendas tiene:

base_role = propietario

Por tanto, obtiene bypass operativo completo, no solamente acceso controlado al entorno demo.

Debe revisarse posteriormente que su aislamiento dependa realmente de la sede APP-REVIEW y no solo de convenciones frontend.

#### 11. Bypass mediante permiso

Si el usuario no es propietario ni gerente general, la función busca el permiso:

`<app>.bypass_permission_code`

Para NEXO:

nexo.inventory.remissions.all_sites

y llama:

has_permission(...)

Si devuelve true, se omiten:

turno;
check-in;
coincidencia de sede;
rol operativo.
Riesgo conceptual

Un permiso llamado:

Ver remisiones de todas las sedes

termina concediendo bypass de toda la política operacional de NEXO, no solamente acceso transversal a remisiones.

Es decir, puede funcionar como:

permiso de remisiones
→ bypass general de operación NEXO

El nombre y el efecto no coinciden.

#### 12. Resolución del turno activo

La función busca un turno que cumpla:

employee_id = trabajador
shift_date = hoy en Bogotá
published_at no nulo
status distinto de cancelled
hora actual dentro del turno

Luego toma:

order by start_time asc
limit 1
⚠️ Múltiples turnos simultáneos

Si existen dos turnos superpuestos, escoge el de inicio más temprano.

No existe:

detección de conflicto;
prioridad por turno más reciente;
selección por sede solicitada;
selección por check-in;
error por ambigüedad.
⚠️ Turnos nocturnos

Aunque la condición horaria admite:

start_time > end_time

la consulta exige:

shift_date = hoy

Un turno:

15 de julio, 22:00
hasta
16 de julio, 06:00

probablemente no se encontrará el 16 de julio a las 02:00, porque su shift_date es el día anterior.

#### 13. El turno debe estar publicado

La función exige:

published_at is not null

Un turno existente pero no publicado no activa contexto operacional.

Esto es correcto si la publicación representa aprobación final.

Sin embargo, status = scheduled no es suficiente por sí solo.

#### 14. Resolución del check-in abierto

La función busca un check_in para el cual no exista ningún check_out posterior del trabajador.

No empareja por:

shift_id
site_id
geofence_site_id
fecha
Consecuencia

Un checkout posterior en cualquier sede cierra todos los check-ins anteriores a efectos del contexto.

El modelo presupone:

máximo una jornada abierta por trabajador

Si existen marcaciones duplicadas o correcciones, puede resolver un check-in incorrecto.

#### 15. El área del check-in siempre es nula

La consulta asigna explícitamente:

select
  al.id,
  al.site_id,
  null::uuid

Por tanto:

active_checkin_area_id = null

en todos los casos.

Aunque la firma expone ese dato, actualmente no existe resolución de área desde la marcación.

El área activa queda determinada por:

active_area_id = shift.area_id

#### 16. Validación del rol operativo

Cuando la política exige turno, el rol debe cumplir:

shift.operational_role no nulo

y existir en:

site_operational_roles

para:

sede del turno
área del turno, cuando aplica

Si no cumple:

blocked_reasons += invalid_operational_role

Esta validación es correcta y estricta.

También explica los dos turnos históricos de Saudo con cocinero_satelite pero sin área.

#### 17. Área activa y tipo de área

La función obtiene:

active_area_id =
checkin_area_id o shift_area_id

Pero como el área de check-in siempre es nula:

active_area_id = shift_area_id

Luego consulta:

areas.kind

para construir:

active_area_kind

Por tanto, un permiso operativo por area_kind depende completamente de que el turno tenga un area_id.

#### 18. Aplicaciones sin política

Aunque una aplicación no tenga política, la función sigue buscando:

turno actual;
check-in;
sede;
área;
rol operativo.

Pero no añade bloqueos por ausencia de ellos.

Ejemplo conceptual para PULSO:

requires_shift       = false
requires_checkin     = false
requires_site_match  = false

El contexto puede reportar:

can_operate = true

aunque no haya turno.

Sin embargo, has_operational_permission después exige que exista:

active_operational_role

Por eso la combinación actual termina siendo inconsistente:

get_operational_context.can_operate = true
has_operational_permission = false

cuando no hay turno ni rol operativo.

can_operate no significa lo mismo para todas las aplicaciones.

#### 19. Semántica de can_operate

La función establece:

can_operate =
blocked_reasons está vacío

No verifica:

que la app exista;
que el empleado esté activo;
que tenga acceso base a la aplicación;
que tenga algún permiso operativo;
que tenga rol operativo si la política no exige turno;
que la sede esté asignada;
que el área esté asignada.

Por tanto:

can_operate = true

significa únicamente:

no incumplió la política configurada

No significa:

tiene autorización efectiva para ejecutar acciones

El nombre puede inducir a una interpretación más amplia de la que realmente representa.

#### 20. Seguridad y exposición

La función es:

SECURITY DEFINER
owner = postgres
search_path = public

Permisos:

anon          ❌
authenticated ✅
service_role  ✅

El bloqueo a anon es correcto.

El problema es que cualquier autenticado puede suministrar un p_employee_id distinto.

Requisito futuro

La función deberá distinguir entre:

Consultar mi propio contexto

y:

Simular o consultar el contexto de otro trabajador

La segunda operación debería exigir un permiso administrativo explícito, por ejemplo:

viso.operational_preview.view

o ejecutarse mediante una función administrativa separada.

Diagnóstico
✅ Correcto
Usa hora local de Bogotá.
Requiere turno publicado para NEXO.
Excluye turnos cancelados.
Valida rol operativo contra sede y área.
Controla check-in y coincidencia de sede para NEXO.
Devuelve motivos de bloqueo explícitos.
No puede ser ejecutada por anon.
Los bloqueos observados concuerdan con la política.
⚠️ Crítico
Cualquier autenticado puede solicitar el contexto de otro empleado.
Es SECURITY DEFINER.
No verifica employees.is_active.
Acepta aplicaciones inexistentes.
Acepta sedes arbitrarias.
El bypass evita toda validación.
inventory.remissions.all_sites actúa como bypass general de NEXO.
App Review tiene rol propietario y bypass completo.
🟡 Diseño incompleto
Solo NEXO tiene política.
PULSO, FOGO y ORIGO no tienen política operacional.
El área de check-in siempre es nula.
El soporte para turnos nocturnos parece incompleto.
No resuelve turnos simultáneos de forma segura.
can_operate no equivale a autorización efectiva.
No valida acceso base a la aplicación.

### ✅ AUTH-AUD-014 — Auditar RLS, RPC, triggers y SECURITY DEFINER

#### 1. Estado general de RLS

Las 27 tablas objetivo tienen RLS habilitado.

Tablas revisadas:       27
Con RLS habilitado:     27
Con FORCE RLS:           0
Sin políticas:           0

Esto incluye:

employees
employee_sites
employee_areas
employee_shifts
attendance_logs
role_permissions
employee_permissions
operational_role_permissions
site_operational_roles
app_operation_policies
context_simulation_sessions
tablas de dispositivos compartidos
✅ Correcto

No se encontraron tablas críticas del alcance auditado con RLS desactivado.

⚠️ FORCE ROW LEVEL SECURITY no se usa

Todas presentan:

relforcerowsecurity = false

Esto no afecta normalmente a clientes authenticated, pero significa que:

el propietario de la tabla puede ignorar RLS;
las funciones SECURITY DEFINER propiedad de postgres pueden saltarse RLS;
la seguridad depende de los controles internos de cada RPC privilegiada.

#### 2. Políticas RLS duplicadas

Se encontraron políticas funcionalmente redundantes.

roles

Tiene dos políticas equivalentes de lectura:

roles_select
roles_select_all

Ambas permiten:

SELECT
TO authenticated
USING (true)
employee_sites

Tiene varias políticas superpuestas:

employee_sites_read_self
employee_sites_select_self

employee_sites_read_management
employee_sites_select
employee_sites_select_owner

employee_sites_write_admin
employee_sites_write_owner

Las dos políticas de escritura tienen esencialmente la misma condición:

is_owner() OR is_global_manager()
attendance_breaks

Tiene dos políticas de lectura propia:

attendance_breaks_employee_select_own_v20260706
attendance_breaks_select_self
Consecuencia

No es una vulnerabilidad directa, porque las políticas son permisivas y producen el mismo acceso. Sin embargo:

más políticas
→ más dificultad de diagnóstico
→ mayor riesgo de que una política antigua sobreviva a una corrección

Eliminar o endurecer una política podría no cambiar el comportamiento porque otra continúa concediendo acceso.

#### 3. Políticas heredadas y semánticas inconsistentes

Varias políticas siguen dependiendo del modelo antiguo:

employees.role
employees.site_id

en lugar de usar consistentemente:

employee_sites
employee_areas
rol operativo del turno
Ejemplo: gerente y turnos

employee_shifts_select_manager exige:

e.role = 'gerente'
and e.site_id = employee_shifts.site_id

Esto limita al gerente a su sede primaria.

No considera sedes secundarias registradas en:

employee_sites
Ejemplo: asistencia

Algunas políticas de asistencia usan:

can_access_site(site_id)

mientras otras comparan directamente:

employees.site_id = attendance_shift_events.site_id

Por tanto, dos tablas del mismo dominio pueden reconocer diferente cobertura multisede.

Ejemplo: valor antiguo de rol

En employees_select_manager aparece:

current_employee_role() = 'logistics'

Pero logistics no forma parte del catálogo actual de roles base auditado.

Esto parece una condición heredada sin efecto real.

#### 4. Lectura excesivamente amplia de configuración

Varias tablas permiten a cualquier trabajador activo o autenticado leer la configuración completa.

Cualquier autenticado
apps
app_permissions
role_permissions
roles
operational_roles
app_operation_policies
plantillas de dispositivos
apps de plantillas
políticas de plantillas

Ejemplos:

USING (true)
Cualquier empleado activo
operational_role_permissions
site_operational_roles
employee_site_operational_profiles

Ejemplo:

employee_site_operational_profiles_select_staff
→ is_active_staff()

Esto permite que cualquier trabajador activo consulte perfiles operativos de todos los trabajadores, no solamente el suyo.

Actualmente solo existe un perfil, pero al poblar la tabla podría exponer:

rol operativo habitual;
sede laboral;
puntos especiales de check-in y check-out;
notas administrativas.
Evaluación

No todo catálogo de permisos necesita ser secreto, pero la exposición excede el principio de mínimo privilegio.

Para la interfaz normal de un trabajador, probablemente bastaría con:

su propio contexto;
roles válidos para su turno;
permisos efectivos ya calculados.

No necesita necesariamente descargar toda la matriz organizacional.

#### 5. Políticas de administración operativa demasiado amplias

site_operational_roles

Permite escritura cuando:

is_owner()
OR is_global_manager()
OR is_manager()
employee_site_operational_profiles

Utiliza la misma lógica.

El problema es que is_manager() identifica el rol, pero las políticas no agregan una restricción explícita por sede.

Por tanto, un gerente de sede podría potencialmente modificar:

roles operativos de otra sede;
perfiles operativos de trabajadores de otra sede.

Esto depende de cómo esté implementado is_manager(), pero la política no incluye una condición como:

can_access_site(site_id)
operational_role_permissions

La política de escritura utiliza:

is_manager_or_owner()

La tabla representa la matriz global de permisos de todos los roles operativos.

Si is_manager_or_owner() incluye a gerente, un gerente de sede podría modificar permisos operativos globales, no solo la configuración de su sede.

⚠️ La administración de la matriz global debería estar reservada a un rol administrativo global o a un permiso explícito de VISO.

#### 6. context_simulation_sessions

Solo tiene política directa de lectura:

context_simulation_sessions_select_own

No tiene políticas directas de:

INSERT;
UPDATE;
DELETE.

Esto es coherente si todas las escrituras ocurren exclusivamente mediante RPC:

start_context_simulation_v1
stop_context_simulation_v1

La tabla no se puede administrar directamente desde el cliente.

✅ Este patrón es adecuado cuando las RPC contienen controles estrictos.

#### 7. Dispositivos compartidos

Las tablas de instancias reales están limitadas al usuario técnico del dispositivo.

Ejemplo:

shared_operational_devices
→ auth.uid() = auth_user_id

Las apps, políticas, sesiones y eventos validan que el dispositivo pertenezca al usuario autenticado.

✅ Correcto
Un dispositivo solo consulta su propia configuración.
Los eventos solo pueden insertarse desde un dispositivo activo.
session_user_id debe coincidir con auth.uid().
El dispositivo debe tener activation_status = active.
⚠️ Plantillas globales

Las plantillas, sus apps y sus políticas son legibles por cualquier autenticado.

Esto expone la arquitectura de terminales y las políticas de actor, aunque no las credenciales técnicas.

No es crítico, pero podría restringirse al personal administrativo o a dispositivos técnicos.

#### 8. Superficie SECURITY DEFINER

La base contiene:

Funciones public SECURITY DEFINER:       164
Ejecutables por authenticated:           123
Ejecutables por anon:                     36
Funciones SECURITY INVOKER:               82

Esto es una superficie privilegiada considerable.

Las funciones SECURITY DEFINER ejecutan con privilegios del propietario —normalmente postgres— y pueden saltarse RLS. Por eso requieren autorización interna completa y permisos EXECUTE mínimos.

Importante

Que una función sea ejecutable por anon no implica automáticamente una vulnerabilidad. Algunas RPC públicas pueden ser intencionales, por ejemplo:

crear borrador de pedido
consultar estado público
chat de cliente

Pero cada una debe verificarse individualmente.

La concesión predeterminada a PUBLIC no debe tomarse como autorización intencional.

#### 9. Funciones de autorización ejecutables por anon

Entre las funciones SECURITY DEFINER ejecutables por anon están:

has_permission
can_access_site
can_access_area
permission_scope_matches

current_employee_role
current_employee_site_id
current_employee_area_id
current_employee_primary_site_id
current_employee_selected_site_id
current_employee_selected_area_id

is_employee
is_active_staff
is_owner
is_manager
is_global_manager
is_manager_or_owner

En ausencia de auth.uid(), muchas devolverán false o null.

No obstante, no existe una razón clara para que el rol anon pueda invocarlas directamente.

Riesgo

Cada función es un endpoint RPC público adicional.

Aunque hoy devuelva un resultado inocuo, una modificación futura podría introducir exposición sin que se revise nuevamente el GRANT EXECUTE.

#### 10. Funciones mutadoras ejecutables por anon

Se encontraron funciones privilegiadas y mutadoras ejecutables por anon, entre ellas:

archive_finished_order_conversations
ensure_order_conversation
mark_order_conversation_read
set_order_conversation_archived
update_order_operational_state

register_shift_departure_event
register_shift_departure_event_autoclose

También existen RPC públicas de checkout, algunas posiblemente intencionales.

⚠️ Punto de atención

Funciones como:

update_order_operational_state
archive_finished_order_conversations
register_shift_departure_event_autoclose

no parecen, por su nombre, operaciones que un usuario anónimo deba invocar libremente.

No se auditó todavía el cuerpo completo de todas ellas, por lo que no se afirma que permitan una acción no autorizada. Pero su EXECUTE para anon debe revisarse como prioridad.

#### 11. RPC administrativas para cualquier autenticado

Numerosas funciones mutadoras SECURITY DEFINER son ejecutables por cualquier authenticated, por ejemplo:

apply_inventory_count_adjustments
apply_inventory_site_count
apply_restock_receipt
apply_restock_shipment
assign_inventory_stock_to_location
close_inventory_count_session
fogo_create_real_production_batch
grant_loyalty_points
origo_reverse_inventory_entry
process_order_payment
set_employee_kiosk_pin
upsert_driver_checkin_point
upsert_employee_site_operational_profile
upsert_site_operational_role
Interpretación

Esto puede ser seguro solamente si cada función realiza internamente:

comprobación de auth.uid();
empleado activo;
permiso efectivo;
sede autorizada;
área autorizada;
validación del recurso objetivo.

RLS por sí solo no protege estas funciones porque son SECURITY DEFINER.

⚠️ Hallazgo estructural

El acceso general:

authenticated → EXECUTE

se está usando como puerta de entrada, dejando toda la autorización al cuerpo de la función.

Eso exige una auditoría individual de cada RPC mutadora.

#### 12. RPC crítica ya confirmada: get_operational_context

Continúa el hallazgo de AUTH-AUD-013:

get_operational_context
SECURITY DEFINER
authenticated puede ejecutar
p_employee_id arbitrario

No valida que:

p_employee_id = auth.uid()

ni exige permiso administrativo para consultar otro trabajador.

Por tanto, RLS de:

employees
employee_shifts
attendance_logs

queda saltado por la RPC.

⚠️ Es un riesgo BOLA/IDOR confirmado por inspección de la función.

#### 13. Triggers sobre asistencia

attendance_logs tiene cuatro triggers BEFORE INSERT:

attendance_logs_00_geofence
attendance_logs_01_resolve_shift
attendance_logs_enforce_sequence
attendance_logs_resolve_shift_id_bi

Se ejecutan por nombre, en este orden:

#### 1. geofence

#### 2. resolve_shift_before_insert

#### 3. enforce_sequence

#### 4. set_attendance_log_shift_context

Responsabilidades
enforce_attendance_geofence
sobrescribe occurred_at con now() salvo fuente system;
valida empleado activo;
valida sede asignada para check-in;
valida coordenadas, precisión y geocerca;
detecta señales de ubicación simulada;
calcula distancia.
resolve_attendance_shift_before_insert
intenta resolver shift_id;
convierte site_id en sede operativa;
conserva el punto físico como geofence_site_id.
enforce_attendance_sequence
utiliza bloqueo transaccional por trabajador;
obliga a alternar check-in/check-out;
impide registros retrospectivos;
exige checkout en la misma sede del último check-in.
set_attendance_log_shift_context
vuelve a resolver shift_id;
vuelve a normalizar site_id;
vuelve a conservar geofence_site_id.

#### 14. Duplicación de resolución del turno

Estas dos funciones hacen prácticamente el mismo trabajo:

resolve_attendance_shift_before_insert
set_attendance_log_shift_context

Ambas:

llaman resolve_attendance_shift_id;
establecen shift_id;
consultan la sede del turno;
normalizan site_id;
preservan geofence_site_id.
Consecuencia

Actualmente probablemente producen el mismo resultado, pero representan lógica duplicada dentro de la misma operación.

un cambio en una función
+ olvido de la otra
→ comportamientos distintos

Debe existir una sola función canónica de resolución de turno y sede.

#### 15. Orden sensible entre geocerca y turno

La geocerca se valida antes de resolver y normalizar el turno.

geofence
→ resolve shift

enforce_attendance_geofence valida para check-in:

new.site_id debe ser sede asignada al empleado

Pero un conductor puede marcar físicamente en:

pickup_camioneta_principal

que es un punto oculto y no una sede de employee_sites.

El flujo funciona únicamente si el cliente envía correctamente:

site_id          = sede operativa, por ejemplo CENTRO_PROD
geofence_site_id = punto físico de marcación

Si el cliente envía el punto físico en site_id, la validación de geocerca puede rechazarlo antes de que el trigger de turno tenga oportunidad de normalizarlo.

⚠️ El contrato de inserción depende de conocer esta diferencia técnica.

#### 16. Secuencia de asistencia robusta, pero global

enforce_attendance_sequence usa:

pg_advisory_xact_lock(employee_id)

✅ Esto reduce correctamente el riesgo de doble marcación concurrente.

También exige:

check_in → check_out → check_in

Sin embargo, compara la secuencia global del trabajador, no por:

turno;
jornada;
dispositivo;
sede.

Esta es una decisión válida si solo puede existir una jornada activa global, pero debe mantenerse como regla explícita.

#### 17. Triggers de sincronización de sede

Existen dos sentidos de sincronización:

employees.site_id
→ employee_sites primaria

employee_sites primaria
→ employees.site_id

Funciones:

sync_employee_site_assignment_from_employee
sync_employee_primary_site_assignment

Ambas también actualizan:

employee_settings.selected_site_id
✅ Resultado observado

En AUTH-AUD-008, los 55 empleados estaban perfectamente sincronizados.

⚠️ Efecto secundario importante

Cambiar la sede primaria actualiza automáticamente la sede seleccionada del trabajador.

Por tanto:

modificar sede primaria
→ cambiar contexto seleccionado en aplicaciones

Esto puede alterar inmediatamente el contexto operativo y provocar shift_site_mismatch.

La sede seleccionada no se conserva como una preferencia independiente cuando cambia la sede primaria.

#### 18. Triggers de perfil operativo

validate_employee_site_operational_profile comprueba:

sede operativa activa;
operational_visibility = operational;
punto de check-in activo;
punto de check-out activo.
⚠️ Validaciones faltantes

El trigger no verifica directamente:

que el trabajador tenga esa sede en employee_sites;
que default_operational_role esté permitido en la sede;
que el rol esté activo;
que el punto de check-in sea realmente type = checkin_point;
que el punto de checkout sea realmente un punto de marcación.

En el perfil actual estas condiciones sí se cumplen, pero dependen de la RPC o de controles externos.

#### 19. Triggers de dispositivos compartidos

Se validan correctamente:

área pertenece a sede
updated_at
política de actor coherente con sede/área

No se encontraron triggers para:

actualizar last_seen_at;
iniciar automáticamente una sesión de actor;
cerrar sesión por expiración;
aplicar automáticamente plantilla al modificarla.

Esto coincide con los hallazgos anteriores:

last_seen_at = null
sesiones = 0

#### 20. shift_runtime_events

Tiene una política:

no_client_access_shift_runtime_events

con:

USING (false)
WITH CHECK (false)

para anon y authenticated.

✅ La tabla está correctamente cerrada al cliente.

Solo procesos privilegiados pueden leerla o modificarla.

Riesgos prioritarios
🔴 Críticos
get_operational_context permite consultar otro empleado mediante RPC privilegiada.
123 funciones SECURITY DEFINER están ejecutables por cualquier autenticado.
36 funciones SECURITY DEFINER están ejecutables por anon.
Existen RPC mutadoras aparentemente internas con acceso para anon.
La administración de permisos operativos puede estar disponible para gerentes de sede sin restricción territorial.
🟠 Altos
Políticas de perfiles y roles operativos permiten lectura organizacional amplia.
Políticas heredadas usan employees.site_id y no cobertura multisede.
RPC mutadoras dependen completamente de controles internos no auditados individualmente.
Resolución de turno duplicada en dos triggers.
Orden de geocerca anterior a normalización del turno es sensible al formato del cliente.
🟡 Deuda técnica
Políticas RLS duplicadas.
Condición heredada para rol logistics.
Plantillas de dispositivo legibles para cualquier autenticado.
Perfiles operativos incompletamente validados por trigger.
Sin triggers de actividad o expiración para dispositivos compartidos.
Diagnóstico
✅ Correcto
Todas las tablas objetivo tienen RLS.
Las políticas de escritura suelen incluir WITH CHECK.
Las tablas de dispositivos reales se restringen al usuario técnico.
shift_runtime_events está cerrado al cliente.
La geocerca valida trabajador activo y ubicación.
La secuencia de asistencia usa bloqueo contra concurrencia.
La sincronización de sede primaria funciona actualmente.
Los triggers de dispositivos validan coherencia sede/área.
⚠️ Problemático
RLS no protege operaciones realizadas desde SECURITY DEFINER.
La superficie RPC privilegiada es excesivamente amplia.
Hay funciones internas ejecutables por anon.
Algunas políticas operativas no restringen por sede.
Existen políticas redundantes y antiguas.
Hay doble resolución del turno en asistencia.
La validación del perfil operativo es incompleta.
La seguridad efectiva depende de revisar individualmente los cuerpos de las RPC mutadoras.
