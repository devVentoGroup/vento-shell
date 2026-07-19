### ✅ AUTH-MOD-020 — Documentar el modelo mediante ADR

#### ADR-AUTH-001 — Modelo canónico de identidad, contexto y autorización de Vento OS

##### Estado del ADR

✅ **ACCEPTED**

##### Estado de la tarea

✅ **AUTH-MOD-020 aprobada**

Esta ADR constituye el registro canónico aprobado de las decisiones:

`AUTH-MOD-001 a AUTH-MOD-019`

##### Fecha

17 de julio de 2026

##### Ámbito

Esta decisión aplica a:

```
vento-shell
vento-anima
vento-viso
vento-nexo
vento-fogo
vento-origo
vento-pulso
vento-numera
```

También aplica a:

```
Supabase
guards de aplicaciones
Server Actions
RPC
políticas RLS
dispositivos compartidos
simulación de autorización
navegación
componentes protegidos
procesos técnicos
auditoría
```

##### Decisiones consolidadas

`AUTH-MOD-001 a AUTH-MOD-019`

##### Implementación

❌ Esta ADR no implementa código.
❌ Esta ADR no crea migraciones.
❌ Esta ADR no modifica Supabase.
❌ Esta ADR no define todavía la matriz exacta de cada rol.
❌ Esta ADR no normaliza todavía todos los permisos existentes.

---

#### 1. Contexto

Vento OS evolucionó desde un modelo donde:

```
employees.role
→ rol laboral
→ permisos permanentes
```

hacia un modelo que también contiene:

```
turnos publicados
roles operativos
sedes y áreas
check-in
perfiles por trabajador
dispositivos compartidos
permisos operativos
simulación
```

La evolución se produjo de forma progresiva y dejó coexistiendo varias fuentes de autorización.

Actualmente pueden intervenir:

```
auth.users
employees
public.users
roles
operational_roles
employee_sites
employee_areas
employee_shifts
attendance_logs
role_permissions
employee_permissions
operational_role_permissions
site_operational_roles
app_operation_policies
shared_operational_devices
context_simulation_sessions
guards
RPC
RLS
```

La auditoría confirmó problemas como:

permisos operativos concedidos permanentemente por roles base antiguos;

bypasses por nombres de rol;

gerentes de sede con permisos globales;

diferencias entre los controles del frontend y del servidor;

permisos derivados de rutas en lugar de capacidades empresariales;

roles operativos sin permisos;

aplicaciones sin política operativa;

dispositivos técnicos sin sesión persistida de actor humano;

ausencia de denegaciones explícitas reales;

funciones distintas para permisos base y operativos sin una decisión combinada canónica.

Era necesario definir una única arquitectura de identidad, contexto y autorización antes de normalizar catálogos, construir matrices y modificar las aplicaciones.

---

#### 2. Problema arquitectónico

El sistema necesita responder de manera uniforme:

```
¿Quién está actuando?

¿A qué entidad laboral representa?

¿Qué responsabilidad permanente tiene?

¿Qué función está ejecutando ahora?

¿En qué sede y área ocurre la acción?

¿Qué recurso empresarial está afectando?

¿Qué permiso exacto requiere la acción?

¿El permiso admite autorización base, operativa o ambas?

¿Existe una denegación aplicable?

¿Por qué se permite o deniega?
```

La respuesta no puede depender de:

la aplicación que realizó la consulta;

el guard utilizado;

una condición escrita directamente contra el nombre de un rol;

la sede seleccionada en la interfaz;

el último check-in sin validar;

el usuario técnico del dispositivo;

una simulación;

un parámetro territorial enviado por el cliente;

la existencia de una fila positiva en cualquier matriz.

---

#### 3. Decisión

Vento OS adoptará un modelo único basado en cuatro capas:

```
### 1. IDENTIDAD

### 2. CONTEXTO

### 3. AUTORIZACIÓN

### 4. PRESENTACIÓN

```

Arquitectura resumida:

```
IDENTIDAD

principal autenticado
        ↓
identidad de dominio
        ↓
actor efectivo

CONTEXTO

actor efectivo
        ↓
contexto administrativo
y/o
contexto operativo
        ↓
sede
        ↓
área

AUTORIZACIÓN

actor
+
contexto
+
permiso exacto
+
modalidad del permiso
+
recurso real
+
alcance
+
allows
+
denegaciones
        ↓
decisión efectiva

PRESENTACIÓN

decisión efectiva
        ↓
navegación
componentes
acciones visibles
```

La interfaz presentará la decisión.

No será la fuente de la decisión.

---

#### 4. Principio de autorización

La regla central será:

```
ROL
→ plantilla de capacidades posibles

PERMISO
→ capacidad empresarial concreta

CONTEXTO
→ condiciones temporales y territoriales

RECURSO
→ objeto real afectado

DECISIÓN EFECTIVA
→ autorización final
```

Por tanto:

```
ROL
≠ AUTORIZACIÓN
```

y:

```
PERMISO SIN CONTEXTO SUFICIENTE
≠ AUTORIZACIÓN
```

---

#### 5. Identidad

##### 5.1 Principal autenticado

Vento OS reconoce tres clases de principal autenticado:

```
PRINCIPAL AUTENTICADO
├── Persona
├── Dispositivo técnico
└── Servicio del sistema
```

El principal autenticado identifica quién presenta la credencial.

No determina por sí solo la autorización empresarial.

---

##### 5.2 Identidad laboral

La fuente de verdad de identidad laboral será:

`employees`

Una identidad laboral válida requiere:

```
empleado existente
+
empleado activo
+
vinculación válida con la identidad autenticada
```

El rol no constituye una identidad independiente.

---

##### 5.3 Identidad de cliente

`public.users`

representará identidades de cliente.

No se utilizará como sustituto de:

`employees`

para acceder a aplicaciones laborales.

Una persona podrá tener simultáneamente identidad de cliente e identidad laboral, pero cada aplicación deberá declarar qué identidad admite.

---

##### 5.4 Actor efectivo

Toda acción empresarial deberá atribuirse a un actor efectivo.

```
PERSONA AUTENTICADA
        ↓
empleado activo
        ↓
actor efectivo = empleado
```

```
DISPOSITIVO TÉCNICO
        ↓
sesión de actor humano
        ↓
empleado activo
        ↓
actor efectivo = empleado
```

```
SERVICIO DEL SISTEMA
        ↓
proceso técnico autorizado
        ↓
actor efectivo = sistema
o
empleado delegado explícitamente
```

No se permitirá una acción empresarial sensible sin actor efectivo resoluble.

---

##### 5.5 Empleado inactivo

`employees.is_active = false`

produce denegación estructural inmediata.

No importa que existan:

roles;

permisos;

sedes asignadas;

turnos;

check-ins;

sesiones de dispositivos;

excepciones individuales.

---

#### 6. Roles

##### 6.1 Separación canónica

Vento OS mantendrá dos catálogos independientes:

```
ROL BASE
→ responsabilidad permanente

ROL OPERATIVO
→ función temporal del turno
```

Un empleado:

`tiene exactamente un rol base vigente`

y puede tener:

`cero o un rol operativo efectivo`

en un contexto operativo determinado.

---

##### 6.2 Rol base

El rol base representa:

responsabilidad laboral permanente;

administración;

configuración;

consulta autorizada que no depende de jornada;

plantilla inicial de permisos base.

Fuente conceptual:

```
employees.role
→ roles
→ role_permissions
```

El rol base no crea:

turno;

check-in;

sede operativa;

área operativa;

rol operativo;

permiso operativo.

---

##### 6.3 Rol operativo

El rol operativo representa una función ejecutada durante un turno.

```
EMPLEADO
        ↓
TURNO PUBLICADO
        ↓
CHECK-IN ACTIVO CUANDO APLIQUE
        ↓
ROL OPERATIVO
        ↓
SEDE + ÁREA
        ↓
PERMISOS OPERATIVOS
```

El rol operativo:

```
≠ cargo contractual
≠ identidad
≠ rol base
≠ sede
≠ área
≠ aplicación
≠ permiso
```

---

#### 7. Roles administrativos

##### 7.1 Roles administrativos globales

Se reconocen:

```
propietario
gerente_general
```

###### Propietario

Representa gobierno organizacional.

Puede recibir capacidades reservadas explícitas.

No obtiene bypass universal por el nombre del rol.

###### Gerente general

Representa administración ejecutiva global.

Puede recibir permisos globales explícitos.

No obtiene automáticamente capacidades reservadas de propietario.

###### Regla

```
ROL GLOBAL
+
PERMISO EXPLÍCITO
=
CAPACIDAD GLOBAL POSIBLE
```

No:

```
ROL GLOBAL
=
TODOS LOS PERMISOS
```

---

##### 7.2 Roles administrativos por sede

Se reconocen:

```
gerente
supervisor
```

Su autoridad natural está limitada a:

`sedes asignadas y autorizadas`

Modelo:

```
ROL ADMINISTRATIVO LOCAL
+
PERMISO EXPLÍCITO
+
SEDE DEL RECURSO AUTORIZADA
=
ACCIÓN ADMINISTRATIVA POSIBLE
```

La sede primaria no constituye el límite completo cuando existen asignaciones multisede.

---

##### 7.3 Roles funcionales administrativos

Roles como:

```
auxiliar_administrativa
contador
marketing
```

podrán recibir capacidades permanentes específicas.

No se clasifican automáticamente como:

administradores globales;

administradores de todas las sedes;

actores operativos.

---

#### 8. Catálogo operativo canónico

Vento OS reconoce 12 roles operativos canónicos.

```
OPERACIÓN SATÉLITE
├── cajero_satelite
├── barista_satelite
├── cocinero_satelite
├── servicio_salon
├── mostrador_satelite
└── operador_integral_satelite
```

```
PRODUCCIÓN
├── produccion_cocina
├── produccion_panaderia
└── produccion_reposteria
```

```
LOGÍSTICA
├── bodeguero
└── conductor_logistica
```

```
COORDINACIÓN OPERATIVA
└── gerencia_operativa
```

El rol:

`propietario_admin`

queda:

```
NO CANÓNICO
EN DEPRECACIÓN
SIN NUEVOS TURNOS
SIN NUEVOS PERMISOS
```

---

#### 9. Casos híbridos

No se creará un catálogo de roles híbridos.

Un caso híbrido se representa mediante dos contextos independientes:

```
EMPLEADO
├── CONTEXTO BASE
│   ├── rol base
│   ├── permisos base
│   └── cobertura administrativa
│
└── CONTEXTO OPERATIVO
    ├── turno
    ├── check-in
    ├── rol operativo
    ├── sede
    ├── área
    └── permisos operativos
```

Ejemplos válidos:

```
propietario + gerencia_operativa
gerente_general + gerencia_operativa
gerente + cajero_satelite
supervisor + bodeguero
auxiliar_administrativa + operador_integral_satelite
```

No se crearán roles como:

```
gerente_cajero
propietario_operativo
supervisor_bodeguero
administrador_produccion
```

El turno no elimina los permisos base.

El cierre del turno elimina el contexto operativo, no el contexto base.

---

#### 10. Modelo territorial de sedes

Vento OS reconoce seis conceptos distintos:

```
### 1. Sede organizacional

### 2. Sede asignada

### 3. Sede primaria

### 4. Sede seleccionada

### 5. Sede operativa

### 6. Sede del recurso

```

##### 10.1 Catálogo

La fuente canónica del catálogo será:

`sites`

El catálogo puede contener:

sedes laborales;

puntos de check-in;

espacios técnicos;

entornos aislados;

otros puntos físicos.

No todo registro de `sites` será asignable como sede laboral.

---

##### 10.2 Sede asignada

La relación laboral entre empleado y sede procederá de:

`employee_sites`

Una sede asignada sirve para:

vinculación laboral;

elegibilidad de turnos;

cobertura administrativa potencial;

configuración de perfiles;

visibilidad territorial, cuando el permiso la admite.

Una asignación de sede no concede por sí sola ninguna acción.

---

##### 10.3 Sede primaria

La sede primaria será:

valor predeterminado;

referencia organizacional;

selección inicial.

No será:

la única sede autorizada;

un permiso;

un bypass.

La fuente canónica será la asignación marcada como primaria.

Los campos legacy no deberán convertirse en fuentes alternativas de autorización.

---

##### 10.4 Sede seleccionada

La sede seleccionada será una preferencia de navegación.

```
selected_site
→ qué sede muestra la interfaz
```

No:

```
selected_site
→ qué sede puede administrar
```

---

##### 10.5 Sede operativa

La sede operativa será determinada por el turno válido.

No será determinada por:

sede seleccionada;

sede primaria;

último check-in aislado;

rol base;

parámetros del frontend.

---

##### 10.6 Sede del recurso

La sede real del recurso será la referencia territorial principal de la autorización.

Ejemplos:

```
remisión.origin_site_id
remisión.destination_site_id
inventario.site_id
venta.site_id
turno.site_id
recepción.site_id
```

La sede deberá resolverse en el servidor desde el recurso o sus relaciones verificables.

---

#### 11. Modelo territorial de áreas

Vento OS reconoce:

```
### 1. Área organizacional

### 2. Área asignada

### 3. Área primaria por sede

### 4. Área seleccionada

### 5. Área administrativa

### 6. Área operativa

### 7. Área del recurso

### 8. Tipo de área

```

##### 11.1 Catálogo

La fuente canónica será:

`areas`

Toda área pertenece a una sola sede:

`areas.site_id`

Dos áreas llamadas `Caja` en sedes distintas serán áreas diferentes.

---

##### 11.2 Área asignada

La afiliación permanente procederá de:

`employee_areas`

Se utilizará para:

organización;

planificación;

preferencias;

filtros administrativos;

permisos base por área;

sugerencias de turno.

No será un requisito universal para operar.

---

##### 11.3 Área primaria

Podrá existir una área primaria distinta por sede.

Será opcional.

Los trabajadores transversales o rotativos podrán no tenerla.

---

##### 11.4 Área seleccionada

Será contexto de navegación.

No concederá autorización.

---

##### 11.5 Área operativa

Procederá del turno.

`employee_shifts.area_id`

Cuando el rol operativo requiera área, un turno sin área válida no podrá activar ese rol.

---

##### 11.6 Área del recurso

El servidor deberá resolverla desde el recurso.

La autorización no confiará únicamente en un `area_id` enviado por el cliente.

---

##### 11.7 Tipo de área

```
area_id
→ área específica

area_kind
→ categoría funcional
```

Un tipo de área:

no es un área;

no es un nombre;

no es un rol;

no es una sede;

no es una ubicación de inventario.

---

#### 12. Turnos

##### 12.1 Turno publicado

Un turno publicado representa una asignación laboral oficial.

```
published_at válido
+
turno no retirado
+
datos operativos coherentes
+
revisión publicada identificable
```

La publicación oficializa una revisión concreta del turno.

```
PUBLICACIÓN
→ fija una revisión inmutable

CAMBIO POSTERIOR RELEVANTE
→ crea una nueva revisión
→ requiere republicación
```

Los cambios posteriores no se considerarán publicados automáticamente.

La publicación tardía no creará permisos retroactivos.

Un turno publicado no se eliminará físicamente como procedimiento normal. Su retiro, cancelación o sustitución deberá quedar auditado.

La publicación no depende de que el empleado acepte o confirme el turno.

```
published
≠ confirmed
```

La confirmación, cuando exista, será únicamente informativa y no participará en:

```
autorización
check-in
vigencia
contexto operativo
```

---

##### 12.2 Separación de estados

Se separan:

```
PUBLICACIÓN
→ comunicado oficialmente

VIGENCIA
→ dentro de la ventana temporal

EJECUCIÓN
→ inició o terminó la jornada

RESULTADO
→ trabajado, cancelado, no-show u otro
```

Un único campo ambiguo no deberá representar todas estas dimensiones.

---

##### 12.3 Turno vigente

Un turno vigente cumple:

turno publicado;

revisión publicada vigente;

no cancelado ni retirado;

empleado activo;

sede válida;

área válida cuando sea requerida;

rol operativo válido;

hora dentro de la ventana permitida.

Un turno vigente todavía no crea permisos operativos por sí solo.

Los turnos laborales publicados no podrán solaparse para el mismo empleado.

Cuando existan varios turnos elegibles y no pueda resolverse uno de forma inequívoca:

```
AMBIGÜEDAD DE TURNO
→ DENEGAR
```

Los turnos que crucen medianoche deberán representarse mediante timestamps inequívocos y no depender únicamente de comparar una fecha con horas locales aisladas.

---

##### 12.4 Turno activo

La decisión aprobada distingue:

```
TURNO PUBLICADO
≠ TURNO VIGENTE
≠ TURNO ACTIVO
```

La definición canónica será:

```
TURNO ACTIVO
=
TURNO VIGENTE
+
CHECK-IN ACTIVO
```

Una capacidad operativa cuyo contrato no exija check-in podrá evaluar un turno vigente o elegible según sus prerrequisitos específicos.

Eso no convierte dicho turno en un turno activo.

---

##### 12.5 Fuente del rol operativo

La única fuente del rol operativo efectivo será el turno publicado y válido.

```
ROL OPERATIVO EFECTIVO
=
employee_shifts.operational_role
DE LA REVISIÓN PUBLICADA VIGENTE
```

El perfil operativo podrá sugerir un rol durante la planificación del turno.

```
PERFIL OPERATIVO
→ sugiere
→ no autoriza
→ no reemplaza el rol del turno
```

El rol base legacy:

```
no es fallback operativo;
no crea contexto operativo;
no sustituye un rol operativo ausente;
no concede capacidades OPERATIONAL_ONLY.
```

---

#### 13. Check-in

Vento OS separará:

```
### 1. Check-in solicitado

### 2. Check-in confirmado

### 3. Check-in válido

### 4. Check-in activo

### 5. Sesión cerrada o expirada

```

##### 13.1 Solicitud

Una solicitud generada por cliente u offline no altera permisos.

```
evento pendiente
≠ evento confirmado
≠ autorización
```

Una cola offline no podrá activar contexto operativo antes de que Supabase reciba, valide y confirme el evento.

---

##### 13.2 Confirmación

Un check-in confirmado:

fue recibido por Supabase;

pasó validaciones;

fue persistido;

está relacionado con un turno válido y una revisión publicada vigente;

recibió una identidad definitiva de sesión;

conserva un tiempo de confirmación confiable del servidor.

El tiempo informado por el cliente podrá conservarse para auditoría, pero no será suficiente para activar permisos.

```
client_occurred_at
≠ tiempo confiable de autorización
```

---

##### 13.3 Check-in activo

```
CHECK-IN ACTIVO
=
evento confirmado
+
turno publicado válido
+
revisión publicada vigente
+
actor correcto
+
sesión laboral identificable
+
ventana vigente
+
sin checkout, expiración o cierre terminal
```

El último `check_in` sin un `check_out` posterior no será suficiente por sí solo.

Solo podrá existir una sesión laboral abierta por empleado dentro del modelo canónico.

La sesión conservará un snapshot inmutable del contexto con el que fue activada, incluyendo como mínimo:

```
employee_id
shift_id
published_revision_id
site_id
area_id
operational_role
confirmed_at
```

Los cambios posteriores del turno no modificarán silenciosamente una sesión ya iniciada.

---

##### 13.4 Cierre

El contexto operativo termina por:

check-out asociado a la sesión concreta;

expiración;

retiro del turno o de su revisión publicada;

cierre administrativo autorizado;

desactivación del empleado;

invalidación de la sesión.

Un check-out no cerrará de forma ambigua cualquier check-in anterior del empleado. Deberá identificar la sesión laboral que termina.

La expiración deberá evaluarse al tomar decisiones de autorización y no depender exclusivamente de la ejecución posterior de un proceso programado.

---

##### 13.5 Descansos

```
on_break
≠ check-out
```

Un descanso no destruye necesariamente la sesión laboral.

Las capacidades disponibles durante el descanso podrán depender de políticas específicas posteriores.

---

#### 14. Dispositivos compartidos

##### 14.1 Naturaleza

Un dispositivo compartido es una identidad técnica.

No es:

empleado;

rol laboral;

actor empresarial;

terminal de asistencia;

fuente de permisos.

---

##### 14.2 Disponibilidad

El dispositivo puede permanecer autenticado y disponible.

```
DISPOSITIVO
→ siempre disponible

TRABAJADOR
→ debe cumplir su contexto laboral
```

El dispositivo no tiene turno.

El trabajador sí.

---

##### 14.3 Sesión de actor

Para ejecutar acciones empresariales se requiere:

```
dispositivo técnico válido
+
actor humano identificado
+
sesión de actor vigente
+
contexto del empleado
+
permiso del empleado
+
política del dispositivo
```

El PIN será un mecanismo de identificación rápida.

No será una fuente de autorización.

---

##### 14.4 Restricción

La acción disponible será:

```
PERMISOS DEL ACTOR
∩
CAPACIDADES DEL DISPOSITIVO
∩
CONTEXTO VÁLIDO
```

El dispositivo puede restringir.

Nunca amplía.

---

##### 14.5 Auditoría

Toda acción deberá atribuirse al empleado real.

El usuario técnico podrá registrarse como principal autenticado, pero no como actor empresarial final.

---

#### 15. Simulación

La simulación será una herramienta administrativa de lectura.

Simulará un contexto completo:

```
rol base
rol operativo
sede
área
turno
check-in
aplicación
permiso
recurso hipotético
```

No simulará únicamente un nombre de rol.

---

##### 15.1 Resultado

La simulación devolverá:

```
would_allow
would_deny
indeterminate
```

No devolverá una autorización ejecutable.

---

##### 15.2 Restricciones

La simulación no podrá:

ejecutar mutaciones;

crear turnos reales;

crear check-ins;

crear sesiones de actor;

alterar RLS;

activar permisos;

firmar acciones como el empleado simulado.

---

##### 15.3 Separación de identidades

La simulación conservará separados:

```
ACTOR REAL
→ administrador que inicia y controla la simulación

SUJETO SIMULADO
→ identidad y contexto hipotéticos evaluados
```

El sujeto simulado nunca sustituirá al actor real para efectos de auditoría, mutaciones o firma de acciones.

---

##### 15.4 Sesión de simulación

Toda sesión deberá registrar:

```
started_at
expires_at
ended_at
status
actor_real
subject_simulated
context_revision
```

La duración máxima será:

`30 minutos`

La actividad no extenderá indefinidamente la sesión.

Cada actor real podrá mantener como máximo una simulación activa.

No se permitirán:

```
simulaciones anidadas;
dos sujetos simulados simultáneos;
dos contextos activos dentro de la misma sesión;
abrir una simulación desde otra simulación.
```

Una nueva simulación deberá cerrar de forma explícita la anterior o denegar la nueva apertura. No podrá sobrescribirla silenciosamente.

---

##### 15.5 Presentación y auditoría

Mientras exista una simulación activa, la interfaz mostrará un indicador permanente e inequívoco.

Cada creación, cambio de contexto, cierre, expiración o revocación deberá quedar auditado.

Modificar el contexto simulado exige volver a validar:

```
alcance del actor real;
catálogos;
coherencia sede–área;
coherencia rol–sede–área;
permiso de simulación.
```

---

#### 16. Permisos

##### 16.1 Capacidad exacta

Un permiso representa una capacidad empresarial concreta.

```
PERMISO
→ qué puede hacerse
```

El alcance representa:

```
ALCANCE
→ dónde puede hacerse
```

El rol representa:

```
ROL
→ quién puede heredar inicialmente el permiso
```

---

##### 16.2 Código exacto

La autorización se evaluará contra el código exacto.

No existirán:

wildcards implícitos;

herencia por prefijo;

equivalencia por nombres parecidos;

concesiones por una ruta relacionada.

---

##### 16.3 Acceso a aplicación

`<app>.access`

controlará la entrada general según su modalidad.

No concederá automáticamente todas las capacidades internas de la aplicación.

---

#### 17. Alcances territoriales

El modelo admite:

```
GLOBAL
ASSIGNED_SITES
SPECIFIC_SITE
SITE_TYPE
SPECIFIC_AREA
AREA_TYPE
```

---

##### 17.1 Global

Un permiso global permite la capacidad concreta con cobertura organizacional ordinaria.

No significa:

todos los permisos;

bypass operativo;

acceso a entornos aislados;

acceso a recursos técnicos;

inmunidad frente a denegaciones.

---

##### 17.2 Sedes asignadas

`assigned_sites`

limita la capacidad a las sedes laborales activas asignadas al empleado.

Durante la transición:

```
scope_type = site
scope_site_id = null
```

se interpretará como `assigned_sites`, no como global.

---

##### 17.3 Sede específica

```
specific_site
+
site_id
```

solo aplica a la sede exacta.

No se extiende a otras sedes del mismo tipo.

---

##### 17.4 Tipo de sede

El alcance por tipo de sede requiere una modalidad explícita:

```
assigned_sites_of_type
all_sites_of_type
```

No incluirá automáticamente:

puntos de check-in;

entornos demo;

sitios técnicos;

sedes inactivas;

registros ocultos.

---

##### 17.5 Área específica

```
specific_area
+
area_id
```

limita la capacidad al área exacta.

No concede la capacidad sobre toda la sede.

---

##### 17.6 Tipo de área

El alcance por tipo de área requiere una modalidad explícita.

```
AREA_TYPE
├── assigned_areas_of_type
├── all_areas_of_type_within_site_scope
└── active_operational_area_of_type
```

###### `assigned_areas_of_type`

Autoriza únicamente áreas que cumplan simultáneamente:

```
asignación activa del empleado al área
+
área perteneciente a una sede autorizada
+
tipo de área coincidente
+
sede dentro del alcance superior del permiso
```

Será la modalidad administrativa predeterminada para permisos por tipo de área.

###### `all_areas_of_type_within_site_scope`

Autoriza todas las áreas activas y autorizables del tipo indicado dentro de un alcance superior de sede ya resuelto.

No crea acceso a sedes adicionales.

Una nueva área podrá quedar incluida automáticamente solo cuando:

```
pertenece a una sede ya autorizada;
coincide con el tipo autorizado;
está activa;
es autorizable;
no pertenece a un entorno aislado.
```

###### `active_operational_area_of_type`

Autoriza únicamente el área operativa activa cuando:

```
existe contexto operativo válido;
el turno contiene un área válida;
el área pertenece a la sede operativa;
el tipo del área coincide;
el recurso pertenece a esa área.
```

Esta modalidad no se extenderá a otras áreas del mismo tipo.

###### Regla de alcance superior

```
AREA_TYPE
+
SIN ALCANCE SUPERIOR DE SEDE RESOLUBLE
=
DENEGAR
```

El alcance por tipo de área requiere además:

permiso concreto;

límite de sede;

tipo exacto;

área real del recurso;

modalidad administrativa u operativa;

contexto operativo cuando corresponda.

Fórmula:

```
PERMISO
∩
SEDES AUTORIZADAS
∩
TIPO DE ÁREA
∩
ÁREA REAL DEL RECURSO
∩
MODALIDAD DE AREA_TYPE
∩
MODALIDAD DE AUTORIZACIÓN
∩
CONTEXTO OPERATIVO CUANDO APLIQUE
```

---

#### 18. Modalidades de autorización

Cada permiso deberá declarar una modalidad canónica.

```
BASE_ONLY
OPERATIONAL_ONLY
BASE_OR_OPERATIONAL
BASE_AND_OPERATIONAL
```

La modalidad no se inferirá desde:

la tabla de asignación;

la aplicación;

el rol;

la ruta;

el guard.

---

##### 18.1 BASE_ONLY

Solo puede autorizar el carril base.

Ejemplos conceptuales:

administrar trabajadores;

gestionar permisos;

configurar aplicaciones;

administrar catálogos organizacionales.

Una asignación operativa incompatible no concede acceso.

---

##### 18.2 OPERATIONAL_ONLY

Solo puede autorizar el carril operativo.

Ejemplos conceptuales:

operar caja;

preparar remisiones;

registrar tránsito;

ejecutar producción;

recibir inventario físicamente.

Una asignación base legacy no sustituye turno, check-in, sede, área o rol operativo.

---

##### 18.3 BASE_OR_OPERATIONAL

Cualquiera de los carriles puede autorizar completamente la acción.

Ejemplo conceptual:

```
consultar remisiones

gerente
→ carril base

bodeguero en turno
→ carril operativo
```

No se combinarán fragmentos incompletos de ambos carriles.

---

##### 18.4 BASE_AND_OPERATIONAL

Ambos carriles deben autorizar la acción.

Se reservará para capacidades sensibles que requieren:

responsabilidad permanente;

participación operativa real;

coincidencia territorial.

---

##### 18.5 Modalidad ausente

```
authorization_requirement = null
→ DENEGAR
```

No se utilizará una modalidad permisiva por defecto.

---

#### 19. Carril base

El carril base podrá obtener permisos desde:

```
rol base
excepciones individuales base
```

Deberá validar:

actor;

empleado activo;

aplicación;

permiso;

modalidad compatible;

recurso;

alcance;

allows;

denegaciones.

No consultará el rol operativo para completar una capacidad faltante.

---

#### 20. Carril operativo

El carril operativo podrá obtener permisos desde:

```
rol operativo
excepciones individuales operativas
```

Deberá validar:

actor efectivo;

empleado activo;

turno;

check-in cuando corresponda;

sede operativa;

área operativa;

rol operativo;

rol permitido en sede y área;

aplicación;

permiso;

recurso;

alcance;

dispositivo cuando corresponda;

allows;

denegaciones.

Una concesión operativa no crea el contexto que necesita.

---

#### 21. Precedencia entre carriles

No existe:

`BASE > OPERATIVO`

ni:

`OPERATIVO > BASE`

La modalidad del permiso determina qué carriles se evalúan.

```
CONTRATO DEL PERMISO
>
MATRIZ DE ASIGNACIÓN
>
NOMBRE DEL ROL
>
DECISIÓN DEL FRONTEND
```

---

#### 22. Reglas de combinación

##### BASE_ONLY

```
base allow
→ permitir

base deny o ausencia
→ denegar
```

##### OPERATIONAL_ONLY

```
operational allow + contexto válido
→ permitir

operational deny, ausencia o contexto inválido
→ denegar
```

##### BASE_OR_OPERATIONAL

```
base allow OR operational allow
→ permitir
```

Cada carril debe producir por sí mismo una autorización completa.

##### BASE_AND_OPERATIONAL

```
base allow AND operational allow
→ permitir
```

La ausencia o denegación de cualquiera de los carriles produce denegación final.

---

#### 23. Denegaciones

El modelo reconoce tres clases:

```
STRUCTURAL_DENY
LANE_DENY
ACTOR_WIDE_DENY
```

---

##### 23.1 Denegación estructural

Procede de condiciones inválidas como:

empleado inactivo;

aplicación inexistente;

permiso inactivo;

recurso no resoluble;

turno inválido;

sesión de dispositivo inválida;

modalidad ausente.

Tiene máxima precedencia.

---

##### 23.2 Denegación de carril

Bloquea un permiso dentro del carril base u operativo.

```
BASE_DENY
OPERATIONAL_DENY
```

Un deny base no bloquea automáticamente el carril operativo.

Un deny operativo no bloquea automáticamente el carril base.

---

##### 23.3 Bloqueo transversal

`ACTOR_WIDE_DENY`

bloquea el permiso para el empleado en todos los carriles compatibles.

Se utilizará para restricciones individuales de seguridad o separación de funciones.

Una matriz de rol no podrá crear un bloqueo transversal entre carriles.

---

##### 23.4 Sujetos de una denegación explícita

```
subject_type
├── base_role
├── operational_role
└── employee
```

Reglas:

```
base_role
→ solo carril base

operational_role
→ solo carril operativo

employee
→ carril base, operativo o all_compatible
```

---

##### 23.5 Contrato y ciclo de vida

Una denegación explícita deberá representar como mínimo:

```
ExplicitPermissionDeny
├── deny_id
├── subject_type
├── subject_id
├── permission_code
├── authorization_lane
├── deny_class
├── scope_type
├── scope_mode
├── site_id
├── site_type
├── area_id
├── area_type
├── starts_at
├── ends_at
├── duration_mode
├── reason_code
├── reason_text
├── reference_type
├── reference_id
├── is_active
├── created_by
├── created_at
├── revoked_by
├── revoked_at
└── revocation_reason
```

El motivo será obligatorio.

Una denegación podrá ser:

```
permanente;
temporal;
programada.
```

Será aplicable temporalmente cuando:

```
is_active = true
AND now >= starts_at
AND (ends_at IS NULL OR now < ends_at)
AND revoked_at IS NULL
```

Una denegación expirada o revocada dejará de participar en nuevas decisiones, pero se conservará para auditoría.

El actor afectado no podrá revocar, reducir o neutralizar su propia denegación.

---

##### 23.6 Contrato de coincidencia

Una denegación será aplicable solamente cuando todas las condiciones coincidan:

```
permission_code exacto
+
sujeto coincidente
+
carril coincidente
+
deny activo
+
vigencia activa
+
alcance compatible
+
recurso dentro del alcance
+
aplicación activa
+
permiso activo
```

Fórmula:

```
DENY APLICABLE
=
PERMISO EXACTO
∩
SUJETO COINCIDENTE
∩
CARRIL COINCIDENTE
∩
VIGENCIA ACTIVA
∩
ALCANCE COINCIDENTE
∩
RECURSO DENTRO DEL ALCANCE
```

Para `ACTOR_WIDE_DENY`, el carril coincidirá con todos los carriles compatibles de la modalidad del permiso.

La especificidad territorial decidirá si la regla coincide. No permitirá que un allow más específico venza un deny aplicable.

---

##### 23.7 Prevención de bloqueo organizacional

Las capacidades reservadas de seguridad deberán conservar mecanismos especiales de recuperación.

El sistema no permitirá que una combinación de denegaciones elimine todos los actores capaces de:

```
administrar seguridad;
recuperar permisos;
gestionar propietarios;
revocar bloqueos críticos.
```

`security_recovery_principal_required`

Deberá existir al menos un principal de recuperación válido.

---

#### 24. Precedencia de denegaciones

La precedencia canónica será:

```
STRUCTURAL_DENY
>
ACTOR_WIDE_DENY
>
LANE_DENY
>
ALLOW
>
DEFAULT_DENY
```

Dentro de un carril:

```
CUALQUIER DENY APLICABLE
>
CUALQUIER ALLOW APLICABLE
```

Una concesión individual no puede vencer un deny.

Un allow específico no puede vencer un deny global.

La especificidad territorial determina si una regla coincide.

No determina qué efecto gana.

---

#### 25. Denegación por defecto

```
SIN ALLOW APLICABLE
→ DENEGAR
```

La ausencia de allow no es una denegación explícita.

La decisión deberá distinguir:

```
default_deny
explicit_deny
structural_deny
```

---

#### 26. Recursos reales

La autorización deberá identificar el recurso empresarial afectado.

Según la acción:

```
resource_id
resource_site_id
resource_area_id
origin_site_id
destination_site_id
origin_area_id
destination_area_id
```

La sede y el área seleccionadas por el usuario no reemplazarán el territorio real del recurso.

---

#### 27. Operaciones con varios recursos

Cuando una operación afecte varios recursos o territorios:

```
deny en cualquiera de los recursos requeridos
→ denegar operación completa
```

Una autorización parcial deberá estar explícitamente soportada por el contrato de esa acción.

No se aplicará silenciosamente solo a los recursos permitidos.

---

#### 28. Procesos técnicos

Un proceso técnico deberá declarar su actor efectivo.

##### Proceso del sistema

`actor_effective_type = system`

Será evaluado mediante capacidades técnicas específicas.

##### Proceso delegado

`actor_effective_type = employee`

Deberá respetar las restricciones del empleado.

`service_role` no equivale a autorización empresarial.

---

#### 29. Excepciones y emergencias

No existirá un bypass universal.

Una acción excepcional tendrá un permiso diferente.

Ejemplo:

```
inventory.adjustments.execute
inventory.adjustments.emergency_execute
```

La acción excepcional deberá incluir:

permiso específico;

motivo;

auditoría reforzada;

alcance limitado;

posible aprobación adicional.

No se creará:

`permissions.ignore_denials`

---

#### 30. Decisión efectiva

La decisión canónica deberá poder representar:

```
EffectiveAuthorizationDecision
├── principal
├── actor_effective
├── employee
├── app_code
├── permission_code
├── authorization_requirement
├── resource
├── resource_site
├── resource_area
├── base_decision
├── operational_decision
├── structural_denies
├── actor_wide_denies
├── lane_denies
├── matched_allows
├── device_context
├── blocked_reasons
└── final_decision
```

El resultado final será:

```
ALLOW
DENY
```

La explicación conservará la causa exacta.

---

#### 31. Orden canónico de evaluación

```
### 1. Resolver principal autenticado

### 2. Resolver identidad de dominio

### 3. Resolver actor efectivo

### 4. Validar empleado activo cuando aplique

### 5. Validar aplicación

### 6. Validar permiso

### 7. Resolver modalidad del permiso

### 8. Resolver recurso real

### 9. Resolver sede y área del recurso

### 10. Evaluar denegaciones estructurales

### 11. Evaluar bloqueo transversal

### 12. Evaluar carril base cuando corresponda

### 13. Resolver contexto operativo cuando corresponda

### 14. Evaluar carril operativo cuando corresponda

### 15. Aplicar denegaciones de cada carril

### 16. Combinar carriles según la modalidad

### 17. Validar prerrequisitos del permiso

### 18. Producir decisión final

### 19. Registrar auditoría

```

---

#### 32. Responsabilidades por componente

##### Supabase

Será la fuente de verdad de:

identidad laboral;

estado del empleado;

catálogos;

asignaciones;

turnos;

check-ins confirmados;

sesiones;

roles;

permisos;

alcances;

denegaciones;

decisiones sensibles;

auditoría.

---

##### Vento Shell

Conservará:

contratos canónicos;

tipos compartidos;

catálogo versionado;

helpers autorizados;

componentes de contexto;

migraciones;

documentación ADR;

pruebas contractuales.

---

##### ANIMA

Administrará:

visualización de turnos;

check-in;

check-out;

estado de sesión laboral;

sincronización de asistencia.

No concederá permisos por sí misma.

---

##### VISO

Administrará:

trabajadores;

roles base;

roles operativos;

perfiles;

sedes;

áreas;

turnos;

matrices;

excepciones;

denegaciones;

simulación;

auditoría.

VISO administra la configuración.

No sustituye la decisión de autorización del servidor.

---

##### NEXO, FOGO, ORIGO, PULSO y NUMERA

Consumirán el mismo contexto canónico.

Cada acción declarará:

```
required_permission
authorization_requirement
resource_resolver
scope_requirements
operational_requirements
device_requirements
```

---

#### 33. Guards

Los guards:

pueden mejorar experiencia;

pueden ocultar navegación;

pueden bloquear interacción anticipadamente;

deben explicar restricciones.

No serán el control definitivo de una mutación sensible.

No utilizarán:

```
role === "propietario"
role === "gerente"
selectedSite
selectedArea
lastCheckIn
```

como autorización suficiente.

---

#### 34. RPC y Server Actions

Toda mutación deberá validar en el servidor:

actor;

empleado;

permiso exacto;

modalidad;

recurso;

alcance;

contexto operativo;

dispositivo;

denegaciones;

decisión final.

No será válido utilizar indiscriminadamente:

```
has_permission(...)
OR
has_operational_permission(...)
```

sin consultar primero la modalidad del permiso.

---

#### 35. RLS

RLS deberá aplicar el mismo modelo.

No reconstruirá una autorización diferente mediante:

comparación directa de roles;

comparación con `employees.site_id`;

existencia aislada de un turno;

existencia de cualquier allow;

sede seleccionada.

Las políticas deberán utilizar decisiones o funciones canónicas y consistentes.

---

#### 36. Navegación y presentación

La navegación se deriva de permisos.

Los permisos no se derivan de la navegación.

La interfaz deberá diferenciar visualmente:

```
CONTEXTO ADMINISTRATIVO
Sede seleccionada
Cobertura autorizada

CONTEXTO OPERATIVO
Turno
Sede
Área
Rol operativo
Estado de check-in
```

Cuando una capacidad proceda de un carril concreto, la interfaz podrá explicarlo.

Ejemplo:

```
NEXO · Consultar remisiones

✅ Permitido por rol base gerente
Alcance: sedes asignadas
```

o:

```
✅ Permitido por rol operativo bodeguero
Sede: Centro de Producción
Área: Bodega
Vigencia: turno activo
```

---

#### 37. Auditoría

Toda acción sensible deberá registrar:

principal autenticado;

actor efectivo;

empleado;

aplicación;

permiso;

modalidad;

recurso;

sede;

área;

rol base;

rol operativo;

turno;

check-in;

dispositivo;

sesión de actor;

allows coincidentes;

denegaciones coincidentes;

decisión final;

motivo de bloqueo;

fecha.

---

#### 38. Invariantes

1. La autenticación no equivale a autorización.
2. Toda acción tiene actor efectivo.
3. `employees` es la fuente de identidad laboral.
4. Un empleado inactivo no puede autorizarse.
5. El dispositivo técnico no es el actor empresarial.
6. Service role no concede autoridad empresarial universal.
7. Un empleado tiene un rol base vigente.
8. El rol base representa responsabilidad permanente.
9. El rol operativo representa función temporal.
10. El rol base y el operativo no se fusionan.
11. No existen roles híbridos.
12. El turno determina el rol operativo efectivo.
13. El perfil operativo sugiere; no autoriza.
14. El rol base legacy no es fallback operativo.
15. Una fila de turno no implica publicación.
16. La publicación oficializa una revisión concreta.
17. La revisión publicada es inmutable.
18. Todo cambio relevante requiere republicación.
19. La confirmación del empleado no afecta la autorización.
20. Un turno publicado no equivale a turno vigente.
21. Un turno vigente no equivale a turno activo.
22. Un turno activo requiere check-in activo.
23. Sin turno válido no existe contexto operativo.
24. Un turno vigente no crea permisos operativos por sí solo.
25. Dos turnos laborales publicados no pueden solaparse.
26. Ante varios turnos elegibles ambiguos se deniega.
27. Los turnos nocturnos utilizan timestamps inequívocos.
28. La publicación tardía no crea permisos retroactivos.
29. El retiro o cancelación de un turno queda auditado.
30. Un check-in solicitado no activa permisos.
31. Un evento offline pendiente no activa contexto operativo.
32. Un check-in confirmado aún debe ser válido y vigente.
33. El tiempo informado por el cliente no es suficiente para autorizar.
34. Solo puede existir una sesión laboral abierta por empleado.
35. El check-out cierra una sesión concreta.
36. El snapshot de una sesión laboral iniciada es inmutable.
37. La expiración se valida al autorizar y no solo mediante procesos programados.
38. El cierre o expiración revoca el contexto operativo.
39. El turno no elimina los permisos base.
40. La sede asignada no es un permiso.
41. La sede primaria no es la única sede autorizada.
42. La sede seleccionada no autoriza.
43. La sede operativa procede del turno.
44. La sede del recurso determina la validación territorial.
45. Un área pertenece a una sede.
46. El área asignada no es necesariamente el área operativa.
47. El área operativa procede del turno.
48. El área seleccionada no autoriza.
49. Área específica y tipo de área son conceptos diferentes.
50. Un alcance por tipo de área siempre requiere alcance superior de sede.
51. `assigned_areas_of_type`, `all_areas_of_type_within_site_scope` y `active_operational_area_of_type` no son equivalentes.
52. Un permiso define una capacidad exacta.
53. Un alcance limita territorio; no crea acciones.
54. Todo permiso declara modalidad.
55. Un permiso sin modalidad se deniega.
56. No existe precedencia universal entre base y operación.
57. BASE_OR_OPERATIONAL exige un carril completo.
58. BASE_AND_OPERATIONAL exige ambos carriles.
59. No se combinan fragmentos incompletos entre carriles.
60. Un deny aplicable vence cualquier allow del mismo carril.
61. Un bloqueo transversal afecta todos los carriles compatibles.
62. La ausencia de allow produce default deny.
63. La ausencia de allow no equivale a deny explícito.
64. Los permisos no utilizan wildcards implícitos.
65. Una denegación exige sujeto, carril, alcance, vigencia y motivo explícitos.
66. Una denegación solo aplica cuando coincide exactamente con su contrato.
67. Un actor no puede neutralizar su propia denegación.
68. Debe conservarse al menos un principal de recuperación de seguridad.
69. El recurso se resuelve en el servidor.
70. El cliente no define libremente sede o área.
71. El dispositivo restringe; nunca amplía.
72. La simulación no produce autoridad real.
73. El actor real y el sujeto simulado permanecen separados.
74. Cada actor real mantiene como máximo una simulación activa.
75. Una simulación dura como máximo 30 minutos.
76. No existen simulaciones anidadas.
77. Toda simulación activa muestra un indicador visible permanente.
78. No existe bypass por nombre de rol.
79. No existe override universal de denegaciones.
80. Las emergencias usan permisos específicos.
81. Guards, RPC y RLS aplican la misma decisión.
82. Toda decisión sensible es explicable.
83. Toda decisión sensible es auditable.

---

#### 39. Consecuencias positivas

✅ Se elimina la ambigüedad entre rol laboral y función operativa.

✅ Propietarios y gerentes dejan de depender de bypasses implícitos.

✅ Los oficios legacy no podrán operar permanentemente sin turno.

✅ Las aplicaciones híbridas podrán distinguir claramente administración y operación.

✅ La cobertura multisede queda correctamente representada.

✅ La sede seleccionada deja de influir indebidamente en la autorización.

✅ El área del turno y el área del recurso adquieren responsabilidades claras.

✅ Los dispositivos compartidos podrán atribuir acciones al trabajador real.

✅ La simulación podrá explicar decisiones sin crear privilegios.

✅ Las denegaciones explícitas tendrán una precedencia uniforme.

✅ Guards, RPC y RLS podrán compartir una semántica única.

✅ La auditoría podrá explicar por qué una acción fue permitida o denegada.

---

#### 40. Consecuencias negativas y costos

⚠️ El modelo es más estricto que el estado actual.

⚠️ Varias funciones, RLS y guards existentes deberán reemplazarse.

⚠️ Los permisos actuales deberán clasificarse individualmente.

⚠️ Las matrices de roles deberán reconstruirse.

⚠️ Los roles operativos sin permisos dejarán de funcionar mediante fallbacks legacy.

⚠️ Turnos incompletos podrán bloquear operaciones que actualmente funcionan por caminos informales.

⚠️ Las áreas operativas deberán configurarse correctamente.

⚠️ Los dispositivos compartidos necesitarán sesiones reales de actor.

⚠️ La autorización requerirá resolver recursos y territorio en el servidor.

⚠️ Las aplicaciones deberán invalidar cachés cuando cambien permisos o contexto.

⚠️ La transición deberá ser gradual para no interrumpir la operación.

---

#### 41. Alternativas descartadas

##### Un solo catálogo de roles

❌ Descartado.

Mezcla responsabilidad permanente y función temporal.

##### Permisos base más permisos operativos por unión

❌ Descartado.

Produce escalación y mantiene los oficios legacy como acceso permanente.

##### Rol operativo reemplaza rol base

❌ Descartado.

Eliminaría responsabilidades administrativas durante el turno.

##### Rol base reemplaza turno

❌ Descartado.

Permitiría ejecutar operación sin jornada válida.

##### Bypass para propietario y gerente general

❌ Descartado.

El nombre del rol no constituye permiso.

##### Sede primaria como autorización

❌ Descartado.

No representa cobertura multisede.

##### Sede seleccionada como autorización

❌ Descartado.

Es una preferencia de presentación.

##### Último check-in como contexto activo

❌ Descartado.

Puede corresponder a eventos antiguos, duplicados o inválidos.

##### Dispositivo técnico como trabajador

❌ Descartado.

Elimina trazabilidad humana.

##### Simulación mediante impersonación real

❌ Descartado.

Crearía escalación de privilegios.

##### Permisos derivados automáticamente de rutas

❌ Descartado como modelo canónico.

Las rutas deben consumir capacidades empresariales.

##### Allow más específico vence deny

❌ Descartado.

Complica la precedencia y debilita restricciones de seguridad.

##### Wildcards de permisos

❌ Descartado.

Los permisos son capacidades exactas.

##### Service role como bypass

❌ Descartado.

Los procesos técnicos deben conservar actor y propósito.

---

#### 42. Compatibilidad y transición

La ADR define el modelo objetivo.

No afirma que el estado actual ya cumpla la arquitectura.

Durante la transición coexistirán:

```
MODELO LEGACY
+
MODELO CANÓNICO EN IMPLEMENTACIÓN
```

Las reglas serán:

1. No eliminar datos legacy sin comprobar dependencias.
2. No usar datos legacy para nuevas capacidades.
3. No crear nuevos permisos operativos en roles base antiguos.
4. No crear nuevos bypasses por rol.
5. No crear permisos nuevos derivados directamente de rutas.
6. Clasificar permisos antes de mover matrices.
7. Implementar validadores canónicos antes de endurecer RLS.
8. Migrar aplicación por aplicación.
9. Mantener trazabilidad de equivalencias legacy.
10. Aplicar cambios de base de datos mediante migraciones versionadas en `vento-shell`.
11. Probar la autorización antes de retirar fallbacks.
12. Denegar de forma cerrada cuando falten datos críticos.

---

#### 43. Fuera del alcance de esta ADR

Esta ADR no define:

el código final de cada permiso;

las descripciones humanas definitivas;

la matriz exacta de propietario;

la matriz exacta de gerente general;

la matriz exacta de roles por sede;

la matriz exacta de cada rol operativo;

el esquema físico final de las tablas;

los nombres finales de RPC;

la estrategia de caché;

la implementación de cada RLS;

el orden exacto de despliegue;

los cambios concretos en cada repositorio.

Estos puntos corresponden a los bloques siguientes.

---

#### 44. Trabajo posterior obligatorio

##### BLOQUE C — Catálogo de permisos

Deberá:

normalizar códigos;

eliminar duplicados;

definir capacidades empresariales;

clasificar modalidades;

definir alcances admitidos;

definir requisitos operativos;

definir sensibilidad;

versionar el catálogo.

##### BLOQUE D — Matrices

Deberá construir:

matrices base;

matrices operativas;

excepciones individuales;

denegaciones;

capacidades reservadas.

##### BLOQUE E — Contexto efectivo

Deberá implementar:

resolución de actor;

contexto base;

contexto operativo;

decisión unificada;

códigos de bloqueo.

##### BLOQUES posteriores

Deberán migrar:

guards;

navegación;

RPC;

RLS;

aplicaciones;

dispositivos;

simulación;

auditoría.

---

#### 45. Representación visual final

```
┌──────────────────────────────────────────────┐
│              PRINCIPAL AUTENTICADO           │
│ Persona | Dispositivo | Servicio             │
└──────────────────────┬───────────────────────┘
                       │
                       ▼
┌──────────────────────────────────────────────┐
│                ACTOR EFECTIVO                │
│ Empleado activo | Sistema autorizado         │
└──────────────────────┬───────────────────────┘
                       │
          ┌────────────┴────────────┐
          ▼                         ▼
┌─────────────────────┐   ┌─────────────────────┐
│   CONTEXTO BASE     │   │ CONTEXTO OPERATIVO  │
│ Rol base            │   │ Turno publicado     │
│ Permisos base       │   │ Check-in activo     │
│ Cobertura admin.    │   │ Rol operativo       │
└──────────┬──────────┘   │ Sede + área         │
           │              │ Permisos operativos │
           │              └──────────┬──────────┘
           └──────────────┬──────────┘
                          ▼
┌──────────────────────────────────────────────┐
│             PERMISO SOLICITADO               │
│ BASE_ONLY | OPERATIONAL_ONLY                 │
│ BASE_OR_OPERATIONAL | BASE_AND_OPERATIONAL   │
└──────────────────────┬───────────────────────┘
                       │
                       ▼
┌──────────────────────────────────────────────┐
│                 RECURSO REAL                 │
│ Sede | Área | Origen | Destino               │
└──────────────────────┬───────────────────────┘
                       │
                       ▼
┌──────────────────────────────────────────────┐
│          ALLOWS Y DENEGACIONES               │
│ Structural > Actor-wide > Lane > Allow       │
└──────────────────────┬───────────────────────┘
                       │
                       ▼
┌──────────────────────────────────────────────┐
│             DECISIÓN EFECTIVA                │
│ ALLOW / DENY + razones + auditoría            │
└──────────────────────────────────────────────┘
```

---

#### 46. Decisión resumida

```
IDENTIDAD
→ determina quién actúa

ROL BASE
→ responsabilidad permanente

TURNO
→ asignación operativa oficial

CHECK-IN
→ activa la sesión laboral válida

ROL OPERATIVO
→ función temporal

SEDE Y ÁREA
→ contexto territorial

PERMISO
→ capacidad exacta

MODALIDAD
→ define qué carriles pueden autorizar

RECURSO
→ determina el territorio real

DENEGACIONES
→ restringen capacidades aplicables

DECISIÓN EFECTIVA
→ permite o bloquea la acción
```

La fórmula canónica será:

```
ACTOR EFECTIVO VÁLIDO
+
APLICACIÓN ACTIVA
+
PERMISO ACTIVO
+
MODALIDAD DEFINIDA
+
RECURSO RESUELTO
+
ALCANCE COINCIDENTE
+
CONTEXTO REQUERIDO
+
ALLOW APLICABLE
+
SIN DENEGACIÓN SUPERIOR
=
AUTORIZACIÓN
```

---

#### 47. Registro de aprobación

AUTH-MOD-020 queda aprobada porque esta ADR:

1. es el registro canónico de AUTH-MOD-001 a AUTH-MOD-019;
2. separa identidad, contexto, autorización y presentación;
3. distingue principal autenticado y actor efectivo;
4. establece `employees` como identidad laboral;
5. separa rol base y rol operativo;
6. reconoce los roles administrativos globales y locales;
7. establece los 12 roles operativos canónicos;
8. depreca `propietario_admin`;
9. prohíbe roles híbridos;
10. separa sede asignada, primaria, seleccionada, operativa y del recurso;
11. separa área asignada, seleccionada, operativa, del recurso y tipo de área;
12. distingue turno publicado y turno activo;
13. define check-in activo como sesión validada;
14. establece que el dispositivo no tiene turno;
15. atribuye acciones del dispositivo al actor humano;
16. limita la simulación a resultados hipotéticos;
17. define permisos como capacidades exactas;
18. conserva los seis alcances territoriales aprobados;
19. establece las cuatro modalidades de autorización;
20. niega la precedencia universal entre permisos base y operativos;
21. establece la jerarquía de denegaciones;
22. conserva la denegación por defecto;
23. exige resolver el recurso en el servidor;
24. prohíbe bypasses por rol;
25. prohíbe override universal de denegaciones;
26. exige permisos específicos para emergencias;
27. obliga a guards, RPC y RLS a compartir la misma semántica;
28. establece Supabase como fuente de verdad;
29. establece Vento Shell como fuente de contratos y migraciones;
30. reconoce que el estado actual todavía no implementa completamente el modelo;
31. conserva la transición como trabajo futuro;
32. no implementa código ni migraciones dentro de AUTH-MOD-020.

##### Resultado de aprobación

```
AUTH-MOD-020 = APROBADA
ADR-AUTH-001 = ACCEPTED
```

La ADR entra en vigor como referencia arquitectónica para los bloques posteriores del roadmap.

Cualquier cambio que contradiga una decisión aquí consolidada requerirá:

```
nueva decisión explícita
+
trazabilidad documental
+
actualización o sustitución formal de esta ADR
```

#### Conclusión

```
VENTO OS NO AUTORIZA POR NOMBRES DE ROL.

VENTO OS AUTORIZA MEDIANTE:

ACTOR
+
PERMISO
+
MODALIDAD
+
CONTEXTO
+
TERRITORIO
+
RECURSO
+
PRECEDENCIA
+
AUSENCIA DE DENEGACIONES APLICABLES.
```

Regla principal

ROL BASE
→ responsabilidad laboral permanente
→ puede heredar capacidades base explícitas

ROL OPERATIVO DEL TURNO
→ función temporal dentro de una sede y área
→ puede heredar capacidades operativas explícitas

PERMISO
→ capacidad empresarial exacta

MODALIDAD
→ determina qué carriles pueden autorizar

ROL
→ plantilla de capacidades posibles
→ no constituye una autorización final

AUTORIZACIÓN
**=**
ACTOR VÁLIDO
+
PERMISO ACTIVO
+
MODALIDAD
+
CONTEXTO
+
ALCANCE
+
RECURSO
+
ALLOW APLICABLE
+
SIN DENEGACIÓN SUPERIOR

El modelo canónico establece que el turno publicado y válido asigna el rol
operativo, mientras que el check-in activo habilita el contexto operativo
cuando corresponda.

El carril base se conservará conceptualmente para las capacidades
administrativas y funcionales permanentes, sin fijar todavía una estructura
física definitiva para sus matrices.

