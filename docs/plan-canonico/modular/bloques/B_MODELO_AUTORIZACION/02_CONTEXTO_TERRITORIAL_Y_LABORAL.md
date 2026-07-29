### SECCIÓN — CONTEXTO TERRITORIAL Y LABORAL

<!-- PLAN-SECTION-META:START -->
Esta sección reúne contenido canónico con una responsabilidad documental única dentro del plan. Debe conservarse cohesionada y actualizarse junto con sus referencias y validaciones dependientes.

**Cobertura canónica:** `AUTH-MOD-007` a `AUTH-MOD-012` — 6 tareas.
<!-- PLAN-SECTION-META:END -->

### ✅ AUTH-MOD-007 — Definir sede asignada y sede activa

#### 1. Decisión aprobada

Vento OS no tendrá una única propiedad genérica llamada “sede actual” para resolver navegación, operación y autorización.

Se reconocen seis conceptos distintos:

MODELO TERRITORIAL

#### 1. Sede asignada

#### 2. Sede primaria

#### 3. Sede seleccionada

#### 4. Sede activa administrativa

#### 5. Sede activa operativa

#### 6. Sede del recurso

Regla principal
Sede asignada
≠ sede primaria
≠ sede seleccionada
≠ sede activa operativa
≠ sede del recurso

Cada concepto tiene una fuente de verdad y una responsabilidad independiente.

#### 2. Catálogo de sedes

Fuente de verdad
public.sites

public.sites es la fuente de verdad del catálogo de:

sedes organizacionales;
sedes operativas;
puntos físicos de marcación;
espacios técnicos;
entornos aislados.
Restricción

No todo registro de public.sites es una sede laboral asignable.

public.sites
├── sede laboral
├── punto de check-in
├── punto de checkout
├── espacio técnico
└── entorno aislado

Las funciones deben distinguir tipo y visibilidad.

#### 3. Sede asignada

3.1 Definición

Relación válida entre un empleado y una sede laboral.

empleado
+
sede organizacional
+
asignación activa
**=**
sede asignada
3.2 Fuente de verdad
public.employee_sites

No procede de:

employees.site_id;
sede seleccionada;
turno;
check-in;
parámetros del cliente;
rol.
3.3 Requisitos
employees.is_active = true
AND employee_sites.is_active = true
AND sites.is_active = true
AND sede asignable

#### 4. Función de la sede asignada

Permite:

vinculación laboral;
elegibilidad de turnos;
cobertura administrativa;
navegación local;
perfiles operativos;
roles operativos;
visibilidad territorial (según permiso).
Regla
Asignación de sede
→ habilita elegibilidad

Asignación de sede
≠ concede permisos

#### 5. Cobertura multisede

Un empleado puede tener múltiples sedes asignadas.

empleado
├── Vento Café
├── Saudo
└── Centro de Producción
Regla
Varias sedes asignadas
≠ alcance global

#### 6. Sede primaria

6.1 Definición
employee_sites.is_primary = true
6.2 Fuente canónica
public.employee_sites.is_primary

employees.site_id queda como:

campo legado
6.3 Invariante
exactamente una sede primaria activa
6.4 Función

Sirve para:

valor inicial;
referencia laboral;
configuración;
fallback visual;
reportes.

No sirve para autorización.

#### 7. Ausencia de sede primaria

Sin primaria
assigned_sites > 0
AND primary_site = null

Resultado:

site_configuration_incomplete
Varias primarias
primary_site_count > 1
→ site_configuration_ambiguous
→ DENEGAR

#### 8. Sede seleccionada

Definición
public.employee_settings.selected_site_id

Preferencia de interfaz.

Regla
selected_site_id
≠ autorización

#### 9. Validación de sede seleccionada

Debe:

existir;
estar activa;
ser navegable;
no ser punto físico;
estar dentro de cobertura;
no ser aislada.
Selección inválida

#### 1. ignorar

#### 2. limpiar

#### 3. fallback a primaria

#### 4. no afectar autorización

Regla crítica

No puede bloquear un turno válido.

#### 10. Relación primaria vs seleccionada

Primaria → base estable
Seleccionada → preferencia temporal

No deben sincronizarse automáticamente.

#### 11. Sede activa administrativa

Definición
AdministrativeSiteContext
Resolución

#### 1. requested_site

#### 2. validar

#### 3. selected_site

#### 4. primary_site

#### 5. sin sede

Modos
single_site
assigned_sites
organization
Regla
null ≠ todas las sedes

#### 12. Sede activa operativa

Fuente
public.employee_shifts.site_id
Regla
OperationalActiveSite = turno válido
Consecuencia
Sin turno → sin sede operativa

#### 13. Check-in

turno.site_id → fuente
check-in → evidencia
Regla

No reemplaza la sede del turno.

#### 14. Contexto híbrido

AdministrativeActiveSite ≠ OperationalActiveSite

Es válido.

#### 15. Sede del recurso

Definición

Territorio real del objeto.

Regla
Sede del recurso → controla autorización

#### 16. Precedencia

Administrativa
identidad → permiso → recurso → alcance → asignaciones → contexto
Operativa
identidad → turno → sede → rol → área → permiso → recurso
Navegación
selected → primary → none

#### 17. Permisos globales

global permission ≠ asignación

#### 18. Elegibilidad operativa

empleado activo
AND asignación activa
AND sede activa
AND rol válido

#### 19. Sedes especiales

APP-REVIEW

Entorno aislado.

Check-in

No son sedes laborales.

#### 20. Desactivación

employee_sites.is_active = false

Preserva historial.

#### 21. Retiro de sede

Debe validar:

turnos;
primaria;
selección;
contexto activo.

#### 22. Sin sedes asignadas

employee_has_no_assigned_sites

Sin operación ni administración territorial.

#### 23. Parámetros del cliente

dato no confiable

Siempre validar en servidor.

#### 24. Ausencias

| Caso              | Resultado     |
| ----------------- | ------------- |
| Empleado inactivo | Denegar       |
| Sin sedes         | Sin contexto  |
| Sin turno         | Sin operación |
| Sede inválida     | Denegar       |

#### 25. Denegación

employee_inactive
site_not_allowed
operational_site_mismatch
resource_site_missing

#### 26. Bypass

Solo permitidos:

permisos globales explícitos;
asignaciones válidas;
service roles controlados;
APP-REVIEW aislado.

#### 27. Contratos

AssignedSite
employee_id
site_id
is_active
is_primary
AdministrativeSiteContext
mode
active_site_id
accessible_site_ids
OperationalSiteContext
shift_id
site_id
role_valid
ResourceSiteContext
resource_id
site_ids

#### 28. Invariantes

employee_sites es fuente canónica.
Una sola primaria.
employees.site_id es legado.
Multisede ≠ global.
Asignación ≠ permiso.
Selección ≠ autorización.
Turno define operación.
Check-in no reemplaza turno.
Recurso define territorio.
Cliente no es confiable.

#### 29. Guards

No usar:

selectedSite
employee.site_id

#### 30. RPC

Siempre:

resolver actor → recurso → sede → permiso → validar

#### 31. RLS

Evitar:

employees.site_id = resource.site_id

#### 32. Aplicaciones

Shell: contexto administrativo
VISO: gestión de sedes
ANIMA: validación de turno
NEXO/FOGO/ORIGO/PULSO: operación
NUMERA: contexto global o local

#### 33. Visualización

Separación clara entre:

sede administrativa
sede operativa

#### 34. Alternativas descartadas

usar employees.site_id
usar sede seleccionada como autoridad
usar check-in como sede
fallback a primaria
asignación como permiso

#### 35. Riesgos

doble fuente primaria
triggers incorrectos
funciones con prioridad incorrecta
RLS inconsistente
catálogo mixto

#### 36. Pendientes

AUTH-MOD-008
AUTH-MOD-009
AUTH-MOD-010
AUTH-MOD-011
AUTH-MOD-014
AUTH-MOD-015

#### 37. Decisión final

SEDE ASIGNADA → employee_sites
SEDE PRIMARIA → is_primary
SEDE SELECCIONADA → preferencia
SEDE ADMINISTRATIVA → navegación
SEDE OPERATIVA → turno
SEDE DEL RECURSO → autorización

✅ AUTH-MOD-007 aprobado

### ✅ AUTH-MOD-008 — Definir área asignada y área activa

#### 1. Decisión aprobada

Vento OS reconoce siete conceptos distintos relacionados con áreas:

MODELO DE ÁREAS

#### 1. Área organizacional

#### 2. Área asignada

#### 3. Área primaria por sede

#### 4. Área seleccionada

#### 5. Área activa administrativa

#### 6. Área activa operativa

#### 7. Área del recurso

Regla principal
Área asignada
≠ área primaria
≠ área seleccionada
≠ área activa operativa
≠ tipo de área
≠ área del recurso

Cada concepto cumple una función específica dentro del modelo de autorización.

#### 2. Área organizacional

Fuente de verdad
public.areas

Un área representa una división funcional dentro de una sede.

Ejemplos:

Vento Café
├── Caja
├── Barra
├── Cocina
├── Mostrador
└── Salón

Centro de Producción
├── Bodega
├── Cocina caliente
├── Galletería y Panadería
└── Repostería
Invariante territorial

Toda área pertenece a exactamente una sede:

areas.site_id
→ public.sites.id

No puede existir un área simultáneamente en varias sedes.

Si dos sedes tienen un área denominada Caja, serán registros independientes:

Vento Café / Caja
Saudo / Caja

#### 3. Área específica y tipo de área

Se mantienen separados:

area_id
→ área concreta dentro de una sede

y:

area_kind
→ clasificación funcional del área

Ejemplo:

Área:
Vento Café / Caja

Tipo:
caja
Regla
Área específica
≠ tipo de área

Un permiso sobre:

area_id = Caja de Vento Café

solo afecta esa área.

Un permiso sobre:

area_kind = caja

puede afectar múltiples áreas del mismo tipo en distintas sedes, según el alcance del permiso.

La semántica final se definirá en AUTH-MOD-016.

#### 4. Área asignada

4.1 Definición

Representa una afiliación laboral permanente o habitual entre un empleado y un área específica.

empleado
+
sede asignada
+
área de esa sede
+
asignación activa
**=**
área asignada
4.2 Fuente de verdad
public.employee_areas
4.3 Requisitos

Una asignación es válida cuando:

employees.is_active = true
AND employee_areas.is_active = true
AND areas.is_active = true
AND sites.is_active = true
AND área pertenece a la sede indicada
AND empleado tiene la sede asignada
4.4 Función

Se utiliza para:

afiliación organizacional;
configuración habitual;
planificación de turnos;
filtros administrativos;
permisos administrativos por área;
sugerencias operativas;
reportes;
perfiles futuros.
Regla crítica
Área asignada
→ afiliación permanente

Área asignada
≠ área operativa activa

#### 5. employee_areas no es requisito operativo

La operación no depende obligatoriamente de employee_areas.

Fuente operativa:

employee_shifts.area_id
Modelo aprobado
Área asignada
→ configuración habitual

Área del turno
→ asignación operativa

Un gerente puede asignar temporalmente un área distinta si:

el empleado pertenece a la sede;
el rol es válido en esa área;
el turno está aprobado;
no hay restricciones;
queda auditado.

#### 6. Área primaria

Definición

Área habitual principal dentro de una sede.

Fuente
public.employee_areas.is_primary
Regla
empleado + sede
→ máximo una primaria

Puede existir una primaria distinta por sede.

#### 7. Área primaria opcional

No es obligatoria.

Se omite cuando:

el rol es transversal;
no hay afiliación fija;
el trabajo rota constantemente;
el rol es administrativo;
el turno define completamente la operación.
sin área primaria
→ válido

#### 8. Campo legado employees.area_id

public.employees.area_id

Se considera:

campo legado
Regla

No se usa para:

autorización;
contexto operativo;
permisos;
turnos.

#### 9. Área seleccionada

Definición

Preferencia administrativa de navegación.

employee_settings.selected_area_id
Regla
Área seleccionada
≠ autorización

No afecta:

turno;
rol;
permisos;
área operativa.

#### 10. Relación sede–área seleccionada

selected_area.site_id
**=**
administrative_active_site_id
Cambio de sede

#### 1. validar área actual

#### 2. conservar si aplica

#### 3. usar primaria si existe

#### 4. si no, sin área

#### 11. Área activa administrativa

Definición

Filtro territorial de vistas administrativas.

AdministrativeAreaContext
Modos
single_area
assigned_areas
site_wide
organization
Regla
active_area_id = null
≠ todas las áreas

#### 12. Resolución administrativa

#### 1. área solicitada

#### 2. validar

#### 3. área seleccionada

#### 4. área primaria

#### 5. sin área

#### 13. Administración por sede y área

Permiso de sede
→ cubre todas las áreas

Permiso de área
→ requiere coincidencia

#### 14. Área activa operativa

Fuente
employee_shifts.area_id
Regla
OperationalActiveArea
**=**
shift.area_id

#### 15. Área obligatoria por rol

Si el rol lo exige:

area_id = null
→ DENEGAR

#### 16. Roles site-wide

site_operational_roles.area_id = null

Permiten operar sin área.

#### 17. Validación única

rol + sede + área
→ una sola configuración válida

Ambigüedad:

→ DENEGAR

#### 18. Check-in

check-in
≠ fuente de área

#### 19. Dispositivos

acción =
actor ∩ turno ∩ dispositivo

No cambia el área del turno.

#### 20. Área del recurso

Se resuelve desde el backend.

#### 21. Recursos sin área

null ≠ todas las áreas

Debe representar:

site_level
multi_area
organization

#### 22. Recursos multiárea

El permiso define:

source_area
target_area
both

#### 23. Permisos operativos

permiso ∩ turno ∩ área ∩ recurso

#### 24. Permisos administrativos

global
site
area
area_kind

#### 25. can_access_area

No es suficiente.

Debe considerar contexto completo.

#### 26. Precedencia

Administrativa
identidad → permiso → recurso → sede → alcance
Operativa
identidad → turno → sede → área → rol → permiso → recurso

#### 27. Ausencia de datos

Denegar cuando falte información crítica.

#### 28. Denegaciones

area_not_found
area_inactive
operational_area_required
device_area_mismatch
...

#### 29. Bypass

Solo permitidos:

permiso de sede
permiso global
turno válido
service role controlado

#### 30. Contratos

Se definen:

AssignedArea
AdministrativeAreaContext
OperationalAreaContext
ResourceAreaContext

#### 31. Invariantes

Área pertenece a una sede
public.areas es fuente
employee_areas es afiliación
No es requisito operativo
Turno define área operativa
Área primaria por sede
Área primaria opcional
Campo legado no autoriza
Área seleccionada no autoriza
Área operativa viene del turno
Check-in no reemplaza
Dispositivo no cambia área
Rol puede exigir área
Rol site-wide puede omitirla
Área del recurso es backend
null no es wildcard
Área ≠ tipo
Validación única
Ambigüedad → denegar

#### 32. Impacto en guards

No usar:

employee.area_id
selectedArea
device.area_id

#### 33. Impacto en RPC

Siempre validar:

actor → permiso → turno → área → recurso

#### 34. Impacto en RLS

Separar:

administrativo
operativo

#### 35. Impacto en apps

Todas las apps respetan:

área del turno
área del recurso
permisos

#### 36. Visualización

Administrativo
Sede
Área
Operativo
Turno
Área
Rol

#### 37. Alternativas descartadas

Todas rechazadas por inconsistentes o inseguras.

#### 38. Riesgos

baja cobertura de employee_areas
turnos incompletos
validación duplicada
permisos heredados

#### 39. Pendientes

Continuar con:

AUTH-MOD-009
AUTH-MOD-010
AUTH-MOD-011
...

#### 40. Decisión final

ÁREA ASIGNADA
→ afiliación

ÁREA PRIMARIA
→ opcional

ÁREA SELECCIONADA
→ navegación

ÁREA ADMINISTRATIVA
→ filtro

ÁREA OPERATIVA
→ turno

ÁREA DEL RECURSO
→ autorización real

✅ AUTH-MOD-008 aprobado

### ✅ AUTH-MOD-009 — Definir turno publicado

#### 1. Problema actual

public.employee_shifts contiene actualmente:

status
published_at
published_by
shift_kind
shift_date
start_time
end_time
site_id
area_id
operational_role
checkin_site_id
checkout_site_id

El campo status admite:

scheduled
confirmed
completed
cancelled
no_show

mientras published_at indica cuándo el turno fue publicado oficialmente al horario visible del empleado.

Sin embargo, la auditoría encontró que casi todos los turnos, incluso los históricos, permanecen en:

status = scheduled

Por tanto, status no representa de forma confiable el ciclo real de publicación o ejecución.

Problema estructural

Actualmente se mezclan tres dimensiones:

PUBLICACIÓN
→ ¿el turno fue comunicado oficialmente?

EJECUCIÓN
→ ¿el trabajador inició o terminó la jornada?

RESULTADO
→ ¿se completó, canceló o fue no-show?

Estas dimensiones no deben resolverse mediante un único estado ambiguo.

#### 2. Decisión principal

Vento OS separará los siguientes conceptos:

#### 1. Turno borrador

#### 2. Turno publicado

#### 3. Revisión publicada

#### 4. Turno vigente

#### 5. Turno elegible para check-in

#### 6. Turno activo

#### 7. Turno finalizado

#### 8. Turno cancelado o retirado

Regla principal
Turno publicado
≠ turno activo

Y:

Turno dentro del horario
≠ turno activo

El turno publicado es una asignación oficial.

El turno activo requerirá además un check-in válido, según AUTH-MOD-010.

#### 13. Publicación y estado confirmed

La publicación no dependerá de que el trabajador confirme el turno.

published
≠ confirmed
Decisión final

La confirmación del empleado no es necesaria en el modelo operativo actual.

Motivo:

Los turnos son obligatorios por contrato.
El trabajador no tiene capacidad de aceptar o rechazar turnos.
La empresa define unilateralmente la asignación laboral.
Interpretación del campo confirmed

El campo confirmed:

no será requerido;
no será utilizado para autorización;
no será utilizado para check-in;
no será utilizado para permisos operativos.

Podrá mantenerse únicamente como:

indicador opcional de lectura o reconocimiento

pero sin impacto funcional.

Regla
turno publicado
→ es obligatorio
→ no requiere confirmación
turno no confirmado
→ sigue siendo válido
→ sigue siendo exigible
Decisión de diseño

El sistema:

no bloqueará operaciones por falta de confirmación;
no exigirá confirmación para check-in;
no utilizará confirmación como señal de validez;
no dependerá de confirmación para autorización.
Futuro opcional

La confirmación podría utilizarse en el futuro únicamente para:

métricas de comunicación;
evidencia de lectura;
procesos disciplinarios o administrativos;

pero nunca como requisito técnico para operar.

#### 42. Invariantes (actualizado)

Una fila de turno no implica publicación.
status no será la fuente de publicación.
Un turno borrador no autoriza.
La publicación oficializa una revisión concreta.
Cambios posteriores no se publican automáticamente.
La revisión publicada es inmutable.
Todo cambio relevante requiere republicación.
Un turno laboral requiere rol operativo.
El área es obligatoria cuando el rol la exige.
Un descanso publicado no crea contexto operativo.
La confirmación del empleado no es requerida ni afecta la validez del turno.
Un turno publicado no equivale a turno activo.
Un turno activo requiere check-in válido.
Dos turnos laborales publicados no pueden solaparse.
Ante varios turnos elegibles se deniega.
Los turnos cruzados de medianoche usan timestamps inequívocos.
show_end_as_close es solo presentación.
La publicación tardía no crea permisos retroactivos.
Un turno publicado no se elimina físicamente como procedimiento normal.
Toda publicación, republicación y retiro queda auditada.

#### 48. Alternativas descartadas (actualizado)

E. Exigir confirmación del empleado para toda autorización

❌ Descartada.

Motivo:

El turno es obligatorio por contrato.
La confirmación no cambia la validez del turno.
Introducir confirmación como requisito generaría fricción innecesaria.
No aporta valor operativo ni de seguridad.

#### 51. Decisión resumida (actualizado)

BORRADOR
→ planificación interna
→ no autoriza
PUBLICADO
→ revisión oficial
→ obligatorio para el trabajador
→ habilita posibilidad de check-in
CONFIRMACIÓN
→ opcional
→ sin impacto operativo
→ no requerida
VIGENTE
→ publicación dentro de su intervalo
→ todavía sin permisos por sí sola
ACTIVO
→ turno publicado
+ check-in válido
CAMBIO POSTERIOR
→ nueva revisión
→ requiere republicación
CANCELACIÓN
→ retiro auditado
→ no eliminación
Criterio de aprobación

AUTH-MOD-009 queda aprobado con la condición de que:

La confirmación del empleado no es requerida.
La confirmación no afecta autorización ni operación.
El turno publicado es obligatorio independientemente de confirmación.
El sistema no dependerá de confirmación para ningún flujo crítico.
La confirmación, si existe, será únicamente informativa.

### ✅ AUTH-MOD-010 — Definir check-in activo

#### 1. Problema actual

El sistema actual registra asistencia mediante eventos:

attendance_logs.action
├── check_in
└── check_out

Los eventos pueden contener:

employee_id
shift_id
site_id
geofence_site_id
occurred_at
source
device_info

El modelo actual ya intenta:

alternar check_in → check_out;
bloquear marcaciones concurrentes por empleado;
resolver automáticamente shift_id;
normalizar la sede operativa;
conservar por separado el punto físico de geocerca.

Sin embargo, existen problemas importantes:

Hay marcaciones históricas sin shift_id.
La resolución del turno está duplicada en distintos triggers.
El check-in abierto se resuelve globalmente, no por sesión canónica.
Un check-out posterior puede cerrar lógicamente cualquier check-in anterior.
El área de check-in actualmente siempre es nula.
El contrato entre sede operativa y punto físico depende de que el cliente envíe los campos correctamente.
Las colas offline pueden contener eventos todavía no confirmados por Supabase.
Riesgo principal
último check-in sin check-out
≠ necesariamente contexto operativo válido

Una marcación abierta puede corresponder a:

un turno antiguo;
un evento sin turno;
un turno cancelado;
una sesión expirada;
un evento duplicado;
un evento pendiente offline;
un registro corregido administrativamente.

Por tanto, el último evento no puede ser la única fuente de autorización.

#### 2. Decisión principal

Vento OS separará cinco conceptos:

#### 1. Evento de check-in solicitado

#### 2. Evento de check-in confirmado

#### 3. Check-in válido

#### 4. Check-in activo

#### 5. Sesión de asistencia cerrada o expirada

Regla principal
check-in registrado
≠ check-in válido
≠ check-in activo
Definición resumida
CHECK-IN ACTIVO
**=**
evento confirmado por Supabase
+
turno publicado válido
+
actor correcto
+
sesión laboral abierta
+
ventana operativa vigente
+
sin evento terminal

#### 3. Evento solicitado

Definición

Es la intención de registrar entrada generada por:

ANIMA;
un dispositivo compartido;
una terminal autorizada;
una corrección administrativa;
una cola offline.

Ejemplo:

AttendanceCheckInRequest
├── employee_id
├── shift_id
├── occurred_at
├── operational_site_id
├── geofence_site_id
├── coordinates
├── device_id
├── source
└── client_event_id
Regla

Un evento solicitado todavía no cambia la autorización.

evento creado en cliente
→ sin efecto de permisos

#### 4. Evento confirmado

Definición

Un evento está confirmado cuando:

fue recibido por Supabase;
pasó todas las validaciones;
quedó persistido;
la transacción confirmó;
recibió identificador definitivo;
está vinculado a un turno publicado válido.
Regla crítica
check-in pendiente offline
≠ check-in confirmado

Un evento pendiente podrá mostrarse en ANIMA como:

Entrada pendiente de sincronización

pero no podrá activar permisos operativos en el servidor.

#### 5. Fuente de verdad

Eventos

La fuente histórica de verdad será:

public.attendance_logs
Estado activo

El contexto activo será una proyección canónica derivada de:

attendance_logs
+
turno publicado
+
política temporal
+
estado del empleado

Podrá implementarse como:

vista;
función canónica;
tabla materializada de sesiones;
combinación controlada de las anteriores.
Regla

La proyección activa no podrá modificarse manualmente de forma independiente de sus eventos y decisiones administrativas.

attendance events
→ fuente histórica

active attendance session
→ estado derivado autoritativo

#### 6. Vinculación obligatoria al turno

Todo check-in operativo nuevo deberá vincularse a exactamente un turno publicado.

attendance_logs.shift_id
→ obligatorio para activar operación
Regla
shift_id = null
→ puede existir como incidencia de asistencia
→ no crea contexto operativo

Las marcaciones históricas sin turno podrán conservarse para:

reportes;
conciliación;
análisis;
corrección de nómina;
auditoría.

No podrán utilizarse para justificar permisos operativos.

#### 7. Resolución del turno

Regla

El cliente podrá proponer:

shift_id

pero el servidor deberá comprobarlo completamente.

Validaciones
shift.employee_id = effective_actor_id
AND shift está publicado
AND revisión publicada es vigente
AND shift_kind = laboral
AND shift no está retirado
AND shift no está cancelado
AND turno es temporalmente elegible
AND sede, área y rol siguen siendo válidos
Sin shift_id

Cuando el cliente no lo suministre, el servidor podrá resolverlo únicamente si existe:

exactamente un turno publicado elegible
Ambigüedad
eligible_shift_count > 1
→ DENEGAR

#### 8. Revisión publicada vinculada

El check-in deberá quedar vinculado no solo al turno, sino conceptualmente a la revisión publicada utilizada.

shift_id
+
published_revision
Regla
check-in activo
→ queda fijado a la revisión publicada con la que inició

#### 9. Requisitos de un check-in válido

Un check-in será válido cuando cumpla todas estas condiciones:

empleado autenticado o actor de dispositivo válido
AND empleado activo
AND turno publicado válido
AND turno pertenece al empleado
AND turno laboral
AND revisión publicada vigente
AND dentro de ventana autorizada
AND sede operativa válida
AND área válida cuando aplique
AND rol operativo válido
AND punto de entrada válido
AND geocerca válida cuando aplique
AND sin otra sesión activa
AND evento idempotente
AND persistencia confirmada

#### 10. Actor del check-in

Dispositivo personal

El actor será el empleado autenticado.

auth subject
→ employee_id
→ shift.employee_id
Dispositivo compartido

Debe existir:

dispositivo activo
+
sesión de actor humano válida
+
empleado activo
+
turno del mismo empleado

#### 11. Una sola sesión activa por empleado

1 empleado
→ máximo 1 check-in activo
check-in activo existente
+
nuevo check-in
→ DENEGAR

#### 12. Sesión de asistencia

AttendanceSession
├── session_id
├── employee_id
├── shift_id
├── published_revision
├── checkin_log_id
├── checked_in_at
├── operational_site_id
├── operational_area_id
├── operational_role
├── geofence_site_id
├── device_id
├── source
├── status
└── expires_at

#### 13. Check-in activo

status = active o on_break
AND checkin confirmado
AND sin check-out terminal
AND turno no invalidado
AND empleado activo
AND current_time < operational_expiry_at

#### 14. Inicio de permisos

insert confirmado
→ activar autorización operativa

#### 15. Tiempo confiable

client_occurred_at
≠ tiempo confiable de autorización

#### 16. Ventana de check-in

checkin_open_at
checkin_close_at

#### 17. Check-in fuera del horario

sin turno publicado elegible
→ DENEGAR check-in operativo

#### 18. Geocerca

geofence_site_id
≠ operational_site_id

#### 19. Orden de validación

#### 1. actor

#### 2. turno

#### 3. sede

#### 4. punto físico

#### 5. validaciones

#### 6. ventana

#### 7. geocerca

#### 8. sesión previa

#### 9. persistencia

#### 10. sesión

#### 20. Precisión de ubicación

accuracy_meters <= máximo permitido

#### 21. Fuente del check-in

anima_personal
shared_device
kiosk
admin_correction
offline_sync
migration
system

#### 22. Idempotencia

client_event_id

#### 23. Check-in offline

offline event
→ no activa operación

#### 24. Activación offline

sin confirmación de servidor
→ sin autoridad

#### 25. Check-out

check-out
→ cierra una sesión exacta

#### 26. Check-out accesible

sin permiso operativo
≠ bloquear check-out

#### 27. Fin de permisos

session.status = closed

#### 28. Expiración

operational_expiry_at

#### 29. Autocierre

revocación
≠ depender del job

#### 30. Sesión expirada

sin permisos operativos

#### 31. Nueva entrada

open_session_exists
→ DENEGAR

#### 32. Cierre administrativo

Auditado y con permiso.

#### 33. Corrección histórica

attendance correction
≠ authorization correction

#### 34. Turno retirado

terminar contexto

#### 35. Empleado desactivado

revocar inmediatamente

#### 36. Cambios durante sesión

session snapshot inmutable

#### 37. Descansos

on_break ≠ check-out

#### 38. Sede y área

turno define
check-in activa

#### 39. Rol operativo

check-in ≠ selección de rol

#### 40. Apps antes

Siempre disponibles.

#### 41. Apps después

check-in activo ≠ acceso total

#### 42. Apps administrativas

Independientes del check-in.

#### 43. Dispositivo compartido

Requiere actor humano válido.

#### 44. Simulación

no crea sesión real

#### 45. Precedencia

Validación estricta en orden.

#### 46. Inconsistencias

→ Denegar o no activar.

#### 47. Denegaciones

Códigos definidos.

#### 48. Bypass

Solo casos explícitos permitidos.

#### 49. Contratos

Definidos para request, evento y sesión.

#### 50. Invariantes

Se mantienen todas las reglas críticas del modelo.

#### 51. Guards

Separación clara entre elegibilidad, sesión y permisos.

#### 52. RPC

Flujos controlados y centralizados.

#### 53. RLS

Basado en sesión activa, no en último evento.

#### 54. Aplicaciones

Consumen contexto canónico.

#### 55. Presentación

Estados claros: pendiente, activo, expirado.

#### 56. Alternativas descartadas

Modelo simplificado rechazado.

#### 57. Riesgos

Identificados y controlados.

#### 58. Pendientes

Se trasladan a siguientes módulos.

#### 59. Decisión final

CHECK-IN SOLICITADO → no autoriza
CHECK-IN CONFIRMADO → evento válido
CHECK-IN ACTIVO → sesión vigente
CHECK-OUT → cierra sesión
EXPIRACIÓN → revoca permisos

✅ AUTH-MOD-010 aprobado

### ✅ AUTH-MOD-011 — Definir dispositivo compartido

#### 1. Problema que se resuelve

Vento OS ya dispone parcialmente de:

shared_operational_devices
shared_operational_device_actor_sessions
shared_operational_device_events
plantillas de dispositivo
aplicaciones permitidas
políticas de actor
usuarios técnicos de Supabase Auth

También existen dos dispositivos activos:

CAJA_VENTO_CAFE_01
KIOSCO_BODEGA_CP

Sin embargo, actualmente:

Dispositivos activos:       2
Sesiones de actor:          0
Eventos registrados:       3
last_seen_at actualizado:   0

Esto indica que la infraestructura existe, pero no está siendo utilizada conforme a su propósito real.

Problema conceptual detectado

El modelo actual mezcla dos ideas distintas:

dispositivo compartido
≠ terminal de asistencia (check-in / check-out)

En la práctica real:

dispositivos compartidos
→ interfaz operativa compartida

NO
→ sistema principal de asistencia

Ejemplos reales:

KIOSCO_BODEGA_CP
→ ver inventario en tiempo real
→ registrar retiros

CAJA_VENTO_CAFE_01
→ ejecutar ventas
→ múltiples trabajadores en distintos turnos
→ sin login/logout completo de Auth

Por lo tanto, el problema no es cómo hacer check-in desde el dispositivo, sino:

cómo atribuir correctamente acciones a personas
sin requerir login completo por cada cambio de turno

#### 2. Decisión principal (ajustada)

Un dispositivo compartido será una interfaz operativa compartida con identidad técnica, diseñada para:

permitir acciones empresariales rápidas
atribuidas a un actor humano identificado
sin requerir autenticación completa por usuario
Flujo real esperado
DISPOSITIVO COMPARTIDO

Usuario técnico autenticado (persistente)
        ↓
Dispositivo activo (siempre disponible)
        ↓
Empleado se identifica (PIN)
        ↓
Sesión de actor ligera
        ↓
Acción empresarial
        ↓
Auditoría con actor humano
Regla clave
DISPOSITIVO
→ siempre disponible para uso

ACTOR
→ debe cumplir condiciones para ejecutar acciones

#### 3. Ajuste conceptual crítico

Se redefine el rol del dispositivo compartido:

ANTES (modelo teórico):
→ dependiente de check-in y turno

AHORA (modelo real):
→ independiente del sistema de asistencia
→ siempre habilitado como interfaz
→ enfocado en atribución de acciones

#### 4. Actor humano (ajustado)

Definición

Empleado que se identifica en el dispositivo para ejecutar acciones.

Regla clave
actor identificado
→ puede intentar ejecutar acciones

PERO para acciones operativas:
→ debe tener turno activo
→ en la sede del dispositivo
→ y en el área del dispositivo (cuando aplique)

Esto es fundamental:

el dispositivo no tiene turno
el trabajador sí

#### 5. Prueba de identificación humana

PIN correcto
→ identifica al empleado

Además:

PIN correcto
→ permite iniciar sesión de actor ligera

#### 6. Sesión de actor (ajustada)

Definición

Relación temporal entre:

dispositivo
+
empleado
Cambio clave

Se elimina la dependencia estructural del dispositivo con:

check-in
turno
attendance_session

Pero se mantiene una validación contextual para acciones:

la sesión existe
→ pero la autorización depende del contexto del empleado

#### 7. Tipos de sesión de actor

OPERATIONAL
ADMINISTRATIVE
7.1 Sesión operacional (ajustada)

Requiere:

dispositivo activo
AND empleado activo
AND política del dispositivo satisfecha

Para ejecutar acciones operativas:

empleado debe tener:
→ turno activo
→ en la sede del dispositivo
→ en el área del dispositivo (cuando aplique)
Regla clave
sesión de actor
≠ autorización completa

autorización
→ depende del contexto laboral del empleado

#### 8. Relación con asistencia

Regla
DISPOSITIVO COMPARTIDO
NO DEPENDE DE:

attendance_session
shift
check-in

Pero:

EL EMPLEADO SÍ PUEDE REQUERIR:

turno activo
contexto válido (sede / área)
Interpretación
dispositivo
→ siempre disponible

empleado
→ debe cumplir condiciones para operar

#### 9. Flujo real recomendado

Caso: Kiosco de bodega

#### 1. Dispositivo autenticado

#### 2. Usuario ingresa PIN

#### 3. Se identifica empleado

#### 4. Se crea sesión de actor

5. Se valida:
   → turno activo
   → sede = dispositivo
   → área = bodega

#### 6. Realiza retiro de inventario

#### 7. Se registra actor en auditoría

Caso: Caja compartida

#### 1. Dispositivo autenticado todo el día

#### 2. Empleado A ingresa PIN

#### 3. Se valida su contexto

#### 4. Atiende clientes

#### 5. Empleado B llega

#### 6. Cambia actor (PIN)

#### 7. Se valida nuevo contexto

#### 8. Continúa operación

SIN:

login/logout de Auth

#### 10. Política de actor

Sigue definiendo:

quién puede usar el dispositivo

Ejemplo:

role_in_area
→ solo personal de bodega

#### 11. Cambio de actor

#### 1. Actor actual termina acción

#### 2. Se limpia contexto

#### 3. Nuevo empleado ingresa PIN

#### 4. Nueva sesión de actor

#### 5. Se valida su contexto laboral

Regla
cambio de actor
→ operación frecuente y rápida

#### 12. Auditoría

Cada acción debe registrar:

device_id
employee_id
actor_session_id

Este es el objetivo principal del modelo.

#### 13. Qué NO debe hacer el dispositivo

NO gestionar asistencia
NO tener turno
NO requerir turno propio
NO depender de turnos para existir
NO bloquearse por ausencia de turno del dispositivo

#### 14. Qué SÍ debe hacer

estar siempre disponible
atribuir acciones correctamente
restringir acceso por política
validar contexto del empleado
permitir cambio rápido de actor
mantener trazabilidad completa

#### 15. Impacto en aplicaciones

NEXO (bodega)
requiere actor
requiere turno activo del empleado
valida sede y área
PULSO (caja)
requiere actor
requiere contexto válido del empleado
permite cambio rápido
NO requiere login completo
ANIMA (asistencia)
maneja check-in/out
independiente del dispositivo

#### 16. Decisión final

DISPOSITIVO COMPARTIDO
→ interfaz operativa siempre disponible

ACTOR HUMANO
→ responsable de la acción

PIN
→ mecanismo de identificación rápida

SESIÓN DE ACTOR
→ contexto temporal ligero

TURNO DEL EMPLEADO
→ requisito para acciones operativas

ASISTENCIA
→ sistema separado
Fórmula final
DISPOSITIVO (siempre activo)
+
ACTOR IDENTIFICADO
+
CONTEXTO LABORAL VÁLIDO DEL EMPLEADO
+
PERMISO DEL ACTOR
+
POLÍTICA DEL DISPOSITIVO
**=**
ACCIÓN AUTORIZADA

#### 17. Criterio de aprobación

La tarea queda aprobada bajo los siguientes principios:

El dispositivo compartido NO es una terminal de asistencia.
El dispositivo NO tiene turno ni requiere turno.
El dispositivo está siempre disponible para uso.
El actor humano es quien debe cumplir condiciones laborales.
El empleado debe tener turno activo para acciones operativas.
El turno debe coincidir con la sede y área del dispositivo.
El PIN permite identificación rápida sin login completo.
La sesión de actor es ligera y desacoplada del dispositivo.
El cambio de actor es frecuente y debe ser rápido.
La auditoría siempre registra al empleado real.
Las políticas restringen quién puede usar el dispositivo.
El sistema de asistencia es independiente del dispositivo.

✅ Conclusión

el dispositivo no tiene turno
el trabajador sí

Los dispositivos compartidos se consolidan como:

interfaces operativas siempre disponibles
con validación de contexto del empleado

Este modelo es:

✅ más claro
✅ más realista
✅ más seguro
✅ alineado con la operación real
✅ fácil de mantener

### ✅ AUTH-MOD-012 — Definir simulación de rol

#### 1. Problema que se resuelve

Vento OS necesita permitir que un administrador compruebe cómo se comportaría el sistema para:

un rol base;
un rol operativo;
una sede;
un área;
una aplicación;
un permiso;
una combinación concreta de contexto.

Ejemplos:

¿Cómo verá NEXO un bodeguero del Centro de Producción?

¿Qué opciones tendrá un cajero de Vento Café?

¿Por qué un gerente de sede no puede administrar otra sede?

¿FOGO mostrará correctamente las funciones de panadería?

¿Qué cambiaría si se asigna un permiso nuevo a un rol?

Actualmente existe infraestructura parcial para almacenar:

administrative_role
operational_role
site_id
area_id

Pero no existe un contrato definitivo que determine:

qué puede simularse;
quién puede simular;
qué datos pueden mostrarse;
si la simulación afecta permisos reales;
si puede ejecutar acciones;
cómo se distingue del actor verdadero;
cómo se evita una escalación de privilegios.

#### 2. Aclaración del nombre

La tarea conserva el nombre:

AUTH-MOD-012 — Definir simulación de rol

Pero la unidad real que se simula no será solamente un rol.

Regla
ROL AISLADO
≠ CONTEXTO DE AUTORIZACIÓN

Para producir un resultado útil se necesita simular, según el caso:

rol base
+
rol operativo
+
sede
+
área
+
estado de turno
+
estado de check-in
+
aplicación
+
permiso solicitado
+
recurso hipotético

Por tanto, el concepto canónico será:

SIMULACIÓN DE CONTEXTO DE AUTORIZACIÓN

La interfaz podrá seguir llamándola:

Simulación de rol
Vista previa operativa
Vista como rol

pero el contrato interno deberá evaluar el contexto completo.

#### 3. Decisión principal

La simulación será una herramienta administrativa de lectura, diagnóstico y vista previa.

Permitirá calcular:

qué navegación aparecería;
qué componentes se mostrarían;
qué permisos resultarían aplicables;
qué acción hipotética sería permitida o denegada;
por qué se produciría esa decisión.

No permitirá ejecutar acciones empresariales reales.

Regla central
SIMULACIÓN
→ calcula una decisión hipotética

AUTORIZACIÓN REAL
→ permite o deniega una acción real
Resultado canónico

La simulación nunca devolverá:

allow

como autorización ejecutable.

Devolverá:

would_allow
would_deny
indeterminate
Fórmula
CONTEXTO SIMULADO
+
REGLAS CANÓNICAS
+
PERMISO HIPOTÉTICO
+
RECURSO HIPOTÉTICO
**=**
RESULTADO EXPLICATIVO

No:

CONTEXTO SIMULADO
**=**
AUTORIDAD REAL

#### 4. Separación entre actor real y sujeto simulado

Toda simulación reconocerá dos entidades diferentes:

ACTOR REAL
→ administrador autenticado que inició la simulación

SUJETO SIMULADO
→ rol, empleado o contexto hipotético evaluado
Actor real

La fuente de verdad será:

auth.users
        ↓
public.employees

El actor real conserva:

su identidad;
su rol base;
sus permisos;
su alcance administrativo;
su auditoría;
su auth.uid().
Sujeto simulado

El sujeto simulado podrá representar:

un rol base;
un rol operativo;
un empleado existente;
un contexto hipotético construido;
una combinación de sede y área;
un escenario con o sin turno;
un escenario con o sin check-in.
Regla crítica
real_actor_id
≠ simulated_subject_id

La actividad queda siempre atribuida al actor real.

#### 5. La simulación no es impersonación

La simulación no permitirá:

iniciar sesión como otro empleado;
reemplazar auth.uid();
emitir un JWT del sujeto simulado;
utilizar sus credenciales;
abrir una sesión real en su nombre;
crear una sesión de actor de dispositivo;
registrar asistencia;
asumir sus permisos reales;
actuar sobre datos como si fuera esa persona.
Diferencia
SIMULACIÓN
→ “¿Qué ocurriría en este contexto?”

IMPERSONACIÓN
→ “Ejecutar acciones como otra persona”

La impersonación no forma parte del modelo aprobado.

#### 6. Fuente de verdad

Sesión de simulación

La fuente de verdad de una simulación activa será:

public.context_simulation_sessions
Catálogos evaluados

La simulación utilizará las mismas fuentes canónicas del modelo real:

public.roles
public.operational_roles
public.apps
public.app_permissions
public.role_permissions
public.employee_permissions
public.operational_role_permissions
public.employee_sites
public.employee_areas
public.sites
public.areas
public.site_operational_roles
public.employee_shifts

La implementación física definitiva se resolverá posteriormente.

Regla

La simulación podrá leer las reglas reales, pero no modificarlas.

catálogo real
→ entrada de evaluación

sesión simulada
→ contexto hipotético

resultado
→ solo lectura

#### 7. Modos de simulación

Se reconocen tres modos.

7.1 Simulación por rol

Permite seleccionar:

rol base
o
rol operativo

y construir un contexto hipotético.

Ejemplos:

propietario
gerente_general
gerente
supervisor
cajero_satelite
bodeguero
produccion_panaderia
Uso
revisar matriz del rol;
validar navegación;
comprobar permisos;
detectar permisos ausentes;
comparar roles.
Regla

El rol no se considera una persona real.

simulated_employee_id = null
7.2 Simulación por empleado

Permite seleccionar un empleado existente y construir una vista basada en su configuración actual.

Podrá considerar:

rol base;
sedes asignadas;
áreas asignadas;
permisos individuales;
perfiles operativos;
turnos disponibles;
estado activo o inactivo.
Regla

Seleccionar un empleado no permite actuar como él.

empleado seleccionado
→ sujeto de análisis

NO
→ actor efectivo
Empleado inactivo

Un empleado inactivo podrá seleccionarse únicamente para diagnóstico autorizado.

El resultado deberá mostrar:

employee_inactive

y cualquier evaluación de acción real deberá resultar:

would_deny
7.3 Simulación de escenario personalizado

Permite construir un escenario hipotético sin modificar datos reales:

rol base;
rol operativo;
sede;
área;
estado del turno;
estado del check-in;
aplicación;
permiso;
recurso;
alcance.

Ejemplo:

Rol base:        auxiliar_administrativa
Rol operativo:  bodeguero
Sede:            Centro de Producción
Área:            Bodega
Turno:           activo
Check-in:        activo
Aplicación:      NEXO
Permiso:         inventory.withdraw
Regla

El escenario personalizado no crea:

employee_shift;
attendance_log;
employee_site;
employee_area;
role_permission;
operational_role_permission.

#### 8. Contextos simulables

La simulación deberá mantener separados:

AdministrativeSimulationContext
OperationalSimulationContext
8.1 Contexto administrativo simulado

Podrá contener:

base_role
individual_permissions
administrative_sites
administrative_areas
selected_site
selected_area
requested_permission
resource_scope

No requiere:

turno;
check-in;
rol operativo.
Regla
acción administrativa simulada
→ se evalúa con permisos administrativos simulados
8.2 Contexto operativo simulado

Podrá contener:

operational_role
shift_state
shift_publication_state
checkin_state
operational_site
operational_area
site_role_assignment
requested_permission
resource_scope
Regla
acción operativa simulada
→ se evalúa con contexto operativo completo

El rol base no reemplazará:

turno;
rol operativo;
sede operativa;
área operativa;
check-in cuando sea requerido.

#### 9. Simulación de turno y check-in

La simulación podrá representar estados hipotéticos como:

sin turno
turno borrador
turno publicado
turno fuera de horario
turno activo
turno retirado
turno cancelado

y:

sin check-in
check-in solicitado
check-in confirmado
check-in activo
check-in expirado
check-out realizado
Regla

Estos estados no crean ni modifican registros reales.

simulated_shift_state
≠ employee_shifts real

simulated_checkin_state
≠ attendance session real
Propósito

Permite comprobar escenarios como:

¿qué ve antes de marcar entrada?

¿qué cambia después del check-in?

¿qué ocurre si el turno está publicado pero fuera de horario?

¿qué ocurre si falta el área?

¿qué ocurre al terminar el turno?

#### 10. Simulación desde dispositivos compartidos

La simulación administrativa no podrá iniciarse desde:

un usuario técnico de dispositivo;
una sesión ligera de actor;
un kiosco operacional;
una terminal POS compartida.
Regla
SIMULACIÓN
→ requiere sesión personal autenticada del administrador

No bastará con:

PIN en dispositivo compartido

Esto evita que una terminal operativa se convierta en una herramienta de exploración de permisos o configuración organizacional.

#### 11. Permiso requerido para iniciar simulación

La simulación requerirá un permiso administrativo explícito.

El catálogo actual dispone de:

viso.operational_preview.view

Este permiso podrá utilizarse como transición.

Sin embargo, su significado definitivo deberá cubrir:

iniciar simulación;
consultar resultados;
cambiar parámetros simulados;
cerrar la simulación;
visualizar explicaciones de autorización.
Regla
nombre del rol
≠ permiso para simular

No existirá bypass automático para:

propietario;
gerente_general;
gerente;
supervisor.

#### 12. Alcance del administrador que simula

La simulación no podrá superar el alcance administrativo real del actor.

Fórmula
ALCANCE SIMULABLE
**=**
alcance administrativo real del actor
∩ alcance permitido por el permiso de simulación
Ejemplos
Administrador global autorizado

Podrá simular:

roles globales;
roles por sede;
roles operativos;
cualquier sede real autorizada;
cualquier área autorizada;
contextos organizacionales.
Gerente de sede autorizado

Podrá simular únicamente:

su sede;
sus áreas administrativas permitidas;
roles válidos dentro de esa sede;
recursos pertenecientes a esa sede.

No podrá utilizar la simulación para explorar:

otras sedes;
permisos globales reservados;
APP-REVIEW;
configuración fuera de su alcance.
Regla
simular acceso fuera del alcance
≠ obtener acceso de lectura a esa configuración

#### 13. Sedes y áreas aisladas

Las sedes aisladas deberán conservar su aislamiento durante la simulación.

Ejemplo:

APP-REVIEW
Regla
sede aislada
→ solo simulable mediante permiso explícito para esa sede

Compartir el mismo rol no permite atravesar el aislamiento.

role = propietario
≠ acceso automático a APP-REVIEW

#### 14. Datos reales durante la simulación

La simulación de permisos no concede acceso adicional a información empresarial.

Regla principal
PERMISO SIMULADO
→ controla la representación hipotética

PERMISO REAL DEL ADMINISTRADOR
→ controla el acceso a datos reales
Ejemplo

Un administrador simula:

bodeguero
→ puede consultar stock

Esto no significa que el administrador pueda cargar datos reales de inventario si su permiso real no se lo permite.

Datos permitidos

La vista previa podrá utilizar:

datos sintéticos;
datos de ejemplo;
estructuras vacías;
metadatos no sensibles;
datos reales que el actor real ya pueda consultar;
datos anonimizados o enmascarados.
Datos prohibidos

La simulación no podrá revelar por sí sola:

información financiera;
datos personales;
inventario reservado;
costos;
márgenes;
documentos laborales;
credenciales;
información de otras sedes;
recursos fuera del alcance real del administrador.

#### 15. Operaciones permitidas

Durante una simulación se permitirá:

cambiar rol simulado;
cambiar sede simulada;
cambiar área simulada;
cambiar estado hipotético del turno;
cambiar estado hipotético del check-in;
seleccionar aplicación;
seleccionar permiso;
seleccionar recurso hipotético;
visualizar navegación;
visualizar componentes;
consultar would_allow o would_deny;
consultar razones;
comparar escenarios;
cerrar la simulación.

#### 16. Operaciones prohibidas

Durante una simulación no se permitirá:

INSERT empresarial;
UPDATE empresarial;
DELETE empresarial;
ejecutar ventas;
crear pedidos;
crear remisiones;
preparar remisiones;
recibir inventario;
retirar inventario;
ajustar inventario;
crear producción;
cerrar caja;
procesar pagos;
modificar permisos;
modificar trabajadores;
publicar turnos;
registrar check-in;
registrar check-out;
enviar notificaciones como el sujeto;
aprobar acciones;
exportar información usando permisos simulados.
Regla
simulación activa
+
acción de mutación
**=**
DENEGAR

#### 17. Navegación simulada

La simulación podrá modificar la representación visual de:

aplicaciones visibles;
módulos visibles;
rutas visibles;
acciones visibles;
botones habilitados o deshabilitados;
mensajes de bloqueo;
explicaciones de permisos.
Regla

La navegación simulada debe construirse desde el resultado:

would_allow
would_deny

No desde modificaciones del contexto real del usuario.

Protección

Aunque aparezca un botón dentro de la vista simulada:

el botón no podrá ejecutar la acción real

Las acciones deberán:

estar deshabilitadas;
interceptarse antes de la mutación;
o ejecutar únicamente una evaluación simulada.

#### 18. Presentación obligatoria

Toda pantalla simulada deberá mostrar permanentemente un indicador visible.

Cómo se verá
┌──────────────────────────────────────────────────────┐
│ MODO SIMULACIÓN — SOLO LECTURA                       │
│                                                      │
│ Actor real:        Carlos Alejandro Ibarra            │
│ Rol simulado:     bodeguero                          │
│ Sede simulada:    Centro de Producción               │
│ Área simulada:    Bodega                             │
│ Turno simulado:   Activo                             │
│ Check-in:         Activo                             │
│                                                      │
│ [ Cambiar contexto ]              [ Salir ]           │
└──────────────────────────────────────────────────────┘
Reglas visuales

La interfaz deberá mostrar:

modo simulación;
actor real;
sujeto o rol simulado;
sede;
área;
estado de turno;
estado de check-in;
tiempo restante;
botón de salida.

No podrá ocultarse el indicador mientras la simulación esté activa.

#### 19. Ciclo de vida

La sesión reconocerá los siguientes estados:

REQUESTED
→ solicitud recibida

ACTIVE
→ simulación válida y visible

STOPPED
→ cerrada voluntariamente

EXPIRED
→ finalizada por tiempo

REVOKED
→ cerrada administrativamente o por seguridad

INVALIDATED
→ contexto o configuración dejó de ser válido
Flujo

#### 1. Administrador solicita simulación

#### 2. Se valida identidad real

#### 3. Se valida permiso

#### 4. Se valida alcance simulable

#### 5. Se valida coherencia del contexto

#### 6. Se crea sesión

#### 7. Se muestra indicador permanente

#### 8. Se realizan evaluaciones hipotéticas

#### 9. Se cierra, expira o revoca

#### 10. Se restaura la interfaz real

#### 20. Duración

Toda sesión deberá tener:

started_at
expires_at
ended_at
status
Decisión
duración máxima por sesión
→ 30 minutos

La actividad no podrá extender indefinidamente la sesión.

Para continuar después de la expiración:

revalidar permiso
+
crear nueva sesión
Regla
sin expires_at
→ sesión inválida

#### 21. Concurrencia

Cada actor real podrá mantener:

máximo una simulación activa

No se permitirá:

simulaciones anidadas;
dos roles simultáneos;
dos sedes simuladas simultáneas;
abrir una simulación desde otra simulación.
Nueva simulación

Si ya existe una sesión activa:

cerrar sesión anterior
o
DENEGAR nueva apertura

La implementación deberá elegir un comportamiento único y auditable.

No podrá sobrescribir silenciosamente la sesión anterior.

#### 22. Cambio de contexto simulado

Durante una sesión activa podrá modificarse el contexto hipotético.

Cada cambio deberá:

validar alcance;
validar catálogos;
validar coherencia sede–área;
validar rol–sede–área;
registrar auditoría;
recalcular resultados.
Regla
cambiar contexto simulado
≠ cambiar datos reales
