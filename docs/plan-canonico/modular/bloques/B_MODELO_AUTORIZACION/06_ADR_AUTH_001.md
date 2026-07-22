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

### ✅ AUTH-MOD-021 — Definir rol base mínimo no privilegiado para trabajadores puramente operativos

**Estado:** APROBADA  
**Bloque:** BLOQUE B — Modelo definitivo de identidad y autorización  
**Naturaleza:** definición documental aditiva del catálogo de roles base y de su matriz mínima  
**Implementación física:** no incluida  
**ADR vigente:** `ADR-AUTH-001 — ACCEPTED`  
**Tarea anterior vigente:** `AUTH-CTX-027 — Definir consumo centralizado del contexto por las aplicaciones — APROBADA`  
**Tarea posterior reservada:** `AUTH-CTX-028 — Definir compatibilidad temporal con get_operational_context`  
**Restricción:** no implementar código, migraciones ni cambios en Supabase durante esta tarea

---

#### 1. Objetivo

Definir el rol base canónico mínimo que deberá asignarse a los trabajadores cuya responsabilidad permanente es exclusivamente operativa y cuya autoridad para ejecutar procesos empresariales debe proceder del rol operativo de un turno válido.

La tarea cierra expresamente:

1. el código canónico definitivo del rol;
2. su nombre humano y propósito empresarial;
3. sus capacidades base permanentes mínimas;
4. las capacidades que permanecerán prohibidas;
5. su relación con los siete roles base ya publicados;
6. el versionado requerido del catálogo lógico de roles y del dataset de matriz base;
7. el tratamiento de los oficios base legacy;
8. la compatibilidad temporal previa al cutover;
9. el impacto sobre matrices, `AccessContext`, evaluación, pruebas y migración;
10. el impacto sobre `ADR-AUTH-001`;
11. las tareas físicas exactas de E3, H, VISO, R y QA que materializarán la decisión.

---

#### 2. Problema que se resuelve

El modelo canónico exige que todo empleado activo tenga exactamente un rol base vigente.

Sin embargo, los trabajadores puramente operativos no deben conservar como rol base permanente códigos como:

```text
barista
bodeguero
cajero
cocinero
conductor
mesero
panadero
pastelero
repostero
```

Esos códigos representan oficios legacy que históricamente otorgaron permisos permanentes y mezclaron:

```text
RESPONSABILIDAD PERMANENTE
+
FUNCIÓN OPERATIVA DEL TURNO
```

La separación aprobada exige:

```text
ROL BASE
→ responsabilidad laboral permanente

ROL OPERATIVO
→ función temporal asignada por un turno válido
```

La ausencia de un rol base mínimo produjo una brecha contractual:

```text
trabajador puramente operativo
→ necesita identidad laboral y autoservicio permanente
→ no debe recibir autoridad administrativa
→ no debe operar sin turno
→ necesita un rol base válido no privilegiado
```

---

#### 3. Base normativa

Esta propuesta conserva sin reinterpretar:

- `ADR-AUTH-001`;
- `AUTH-MOD-001` — identidad laboral y actor efectivo;
- `AUTH-MOD-002` — separación entre rol base y rol operativo;
- `AUTH-MOD-003` a `AUTH-MOD-006` — roles base administrativos y casos híbridos;
- `AUTH-MOD-007` a `AUTH-MOD-017` — contexto territorial y laboral;
- `AUTH-MOD-018` y `AUTH-MOD-019` — precedencia y denegaciones;
- `AUTH-CAT-001` a `AUTH-CAT-024` — catálogo canónico de permisos;
- `AUTH-RBAC-001` a `AUTH-RBAC-028` — matrices, datasets y validaciones;
- `AUTH-CTX-001` a `AUTH-CTX-027` — contratos, contexto y decisión unificada.

Principios obligatorios:

```text
ROL BASE
≠ IDENTIDAD

ROL BASE
≠ AUTORIZACIÓN FINAL

ROL BASE
≠ ROL OPERATIVO

OFICIO LEGACY
≠ ROL BASE CANÓNICO

TURNO
≠ PERMISO

APP.ACCESS
≠ ACCESO TOTAL A LA APLICACIÓN

AUSENCIA DE FILA
→ DEFAULT_DENY
```

---

#### 4. Decisión principal

Se crea el octavo rol base canónico:

```text
role_code = trabajador_operativo
```

Nombre humano:

```text
Trabajador operativo
```

Definición:

> Rol base mínimo no privilegiado para empleados cuya responsabilidad permanente consiste en pertenecer a la fuerza laboral de Vento y utilizar las superficies personales esenciales, mientras que toda autoridad para ejecutar procesos operativos procede exclusivamente de un rol operativo válido asignado mediante turno.

Fórmula:

```text
EMPLEADO ACTIVO
+
base_role = trabajador_operativo
=
IDENTIDAD LABORAL BASE VÁLIDA
+
AUTOSERVICIO PERSONAL MÍNIMO
+
CERO AUTORIDAD OPERATIVA POR EL ROL BASE
```

Y:

```text
trabajador_operativo
+
turno publicado y vigente
+
rol operativo válido
+
check-in cuando corresponda
+
permiso operativo exacto
+
territorio y recurso compatibles
=
AUTORIZACIÓN OPERATIVA POSIBLE
```

---

#### 5. Identidad canónica del rol

| Propiedad                          | Valor                                                            |
| ---------------------------------- | ---------------------------------------------------------------- |
| Código                             | `trabajador_operativo`                                           |
| Nombre humano                      | Trabajador operativo                                             |
| Catálogo                           | Rol base                                                         |
| Naturaleza                         | Permanente                                                       |
| Nivel de privilegio                | Mínimo no privilegiado                                           |
| Autoridad administrativa implícita | Ninguna                                                          |
| Autoridad operativa implícita      | Ninguna                                                          |
| Dependencia de turno               | No para sus capacidades base; sí para toda operación             |
| Dependencia de check-in            | No para sus capacidades base; según contrato para toda operación |
| Alcance administrativo natural     | Ninguno                                                          |
| Alcance operativo natural          | Ninguno; procede del turno                                       |
| Asignación                         | Explícita, auditable y singular                                  |
| Uso como fallback                  | Prohibido                                                        |
| Uso por dispositivos               | No propio; se utiliza el rol del actor humano                    |
| Uso en simulación                  | Admitido únicamente como sujeto hipotético                       |

---

#### 6. Justificación del código

Se adopta:

```text
trabajador_operativo
```

porque expresa simultáneamente:

- que pertenece al catálogo de trabajadores;
- que es un rol base de clasificación laboral;
- que no describe un oficio específico;
- que la persona obtiene su función operativa concreta mediante el turno;
- que no equivale a administrador, supervisor ni especialista funcional.

Se descartan:

| Código        | Motivo                                                              |
| ------------- | ------------------------------------------------------------------- |
| `empleado`    | Confunde identidad laboral con rol base.                            |
| `trabajador`  | Es demasiado amplio y podría abarcar cualquier empleado.            |
| `staff`       | Es genérico, anglicado y ambiguo frente al dominio laboral.         |
| `colaborador` | No distingue personal puramente operativo de roles administrativos. |
| `operativo`   | Puede confundirse con el carril o el rol operativo efectivo.        |
| `sin_rol`     | Modela ausencia en lugar de una asignación válida.                  |
| `default`     | Sugiere fallback automático y permisivo.                            |

---

#### 7. Propósito empresarial

`trabajador_operativo` deberá permitir que el empleado:

- exista como trabajador activo dentro de Vento OS;
- ingrese al hub laboral;
- ingrese a ANIMA antes de iniciar un turno;
- consulte sus propios documentos laborales autorizados;
- cargue documentos propios únicamente cuando el tipo documental permita autoservicio;
- cargue o actualice su propia fotografía laboral conforme al contrato aplicable;
- reciba posteriormente capacidades operativas exclusivamente por el turno y el rol operativo.

No deberá convertir el rol en:

- cargo contractual completo;
- oficio diario;
- rol de sede;
- rol de área;
- permiso de aplicación;
- reemplazo de turno;
- reemplazo de check-in;
- reemplazo de perfil operativo;
- autorización administrativa mínima implícita.

---

#### 8. Matriz base mínima exacta

El rol recibe exactamente cinco concesiones base directas dentro del catálogo vigente:

| Permiso                                     | Modalidad   | Tipo de concesión | Alcance  | Decisión                    |
| ------------------------------------------- | ----------- | ----------------- | -------- | --------------------------- |
| `shell.access`                              | `BASE_ONLY` | `DIRECT`          | `NT-APP` | **ASIGNAR**                 |
| `anima.access`                              | `BASE_ONLY` | `DIRECT`          | `NT-APP` | **ASIGNAR**                 |
| `anima.workforce.employee_documents.view`   | `BASE_ONLY` | `DIRECT`          | `OWN`    | **ASIGNAR**                 |
| `anima.workforce.employee_documents.upload` | `BASE_ONLY` | `DIRECT`          | `OWN`    | **ASIGNAR CON RESTRICCIÓN** |
| `anima.workforce.employee_photos.upload`    | `BASE_ONLY` | `DIRECT`          | `OWN`    | **ASIGNAR CON RESTRICCIÓN** |

Condiciones obligatorias:

##### `shell.access`

```text
permite entrar al hub laboral
≠ permite entrar a todas las aplicaciones
≠ concede permisos internos
```

##### `anima.access`

```text
permite abrir ANIMA antes del turno
≠ permite administrar trabajadores
≠ permite administrar turnos
≠ concede check-in automáticamente
```

##### `anima.workforce.employee_documents.view`

```text
target_employee_id
=
actor_employee_id
```

Solo admite documentos propios que el contrato de retención, sensibilidad y visibilidad permita mostrar al empleado.

##### `anima.workforce.employee_documents.upload`

Solo admite:

- trabajador objetivo igual al actor;
- tipos documentales configurados como autoservicio;
- validación de formato, tamaño, hash y destino;
- trazabilidad de creación;
- ausencia de capacidad de aprobar, validar o eliminar el documento.

##### `anima.workforce.employee_photos.upload`

Solo admite:

- fotografía propia;
- formato y tamaño aprobados;
- flujo de revisión cuando corresponda;
- trazabilidad del reemplazo;
- ausencia de acceso a fotografías de terceros.

---

#### 9. Resultado cuantitativo de la matriz

Sobre el catálogo vigente de 140 permisos:

| Resultado                           | Cantidad |
| ----------------------------------- | -------: |
| Concesiones directas                |        5 |
| Componentes base de doble condición |        0 |
| Permisos no concedidos              |      135 |
| Total evaluado                      |      140 |

Regla:

```text
5 FILAS PRESENTES
→ CANDIDATOS DE ALLOW BASE

135 FILAS AUSENTES
→ DEFAULT_DENY
```

No se crearán 135 denegaciones explícitas redundantes.

---

#### 10. Capacidades expresamente prohibidas

El rol no recibe por defecto:

- `viso.access`;
- `numera.access`;
- `aura.access`;
- `pass.access`;
- acceso base a NEXO, FOGO u ORIGO;
- capacidades de PULSO;
- consulta de trabajadores distintos del actor;
- invitación de trabajadores;
- creación, actualización o cancelación de turnos;
- administración de documentos de terceros;
- eliminación de documentos;
- administración de roles, permisos, matrices o denegaciones;
- configuración de sedes, áreas, dispositivos o aplicaciones;
- finanzas, contabilidad, compras o proveedores;
- auditoría organizacional;
- simulación administrativa;
- capacidades de seguridad;
- lectura transversal entre sedes;
- acceso a APP-REVIEW, demo, pruebas o recursos aislados;
- cualquier permiso `OPERATIONAL_ONLY`;
- cualquier componente base de `BASE_AND_OPERATIONAL`.

También queda prohibido:

```text
trabajador_operativo
→ todos los permisos operativos

trabajador_operativo
→ permiso de la aplicación del turno

trabajador_operativo
→ turno implícito

trabajador_operativo
→ rol operativo predeterminado

trabajador_operativo
→ acceso por nombre del rol
```

---

#### 11. Comportamiento por estado laboral

##### Sin turno vigente

El empleado conserva únicamente las cinco capacidades base definidas.

```text
base_role = trabajador_operativo
active_shift = null
operational_role = null
```

Resultado:

```text
puede usar SHELL y autoservicio ANIMA
no puede ejecutar operación empresarial
```

##### Con turno vigente, sin check-in

Puede obtener únicamente capacidades operativas cuyo contrato exija `T` y no `T+C`.

El rol base no elimina el requisito de check-in.

##### Con turno y check-in válidos

Las capacidades operativas proceden del rol operativo efectivo, no de `trabajador_operativo`.

##### Después del cierre o expiración del contexto

```text
fin de contexto operativo
→ fin de autoridad operativa
```

Las cinco capacidades base permanecen porque no dependen del turno.

---

#### 12. Excepciones individuales

Un empleado con `base_role = trabajador_operativo` podrá recibir una concesión individual base únicamente cuando:

- el permiso admite el carril base;
- la responsabilidad permanente está documentada;
- el alcance es explícito;
- existe vigencia cuando corresponde;
- no existe una denegación aplicable;
- la concesión no sustituye un rol operativo;
- la concesión no reproduce de hecho la matriz completa de otro rol base.

Regla:

```text
EXCEPCIÓN INDIVIDUAL BASE
≠ CAMBIO AUTOMÁTICO DE ROL
```

Pero:

```text
CONJUNTO RECURRENTE DE EXCEPCIONES
QUE REPRODUCE OTRO ROL BASE
→ REVISAR CLASIFICACIÓN LABORAL
→ ASIGNAR EL ROL BASE CORRECTO
```

Una excepción individual nunca podrá conceder un permiso `OPERATIONAL_ONLY` por el carril base.

---

#### 13. Relación con los siete roles base vigentes

El catálogo objetivo queda compuesto por ocho roles:

```text
propietario
gerente_general
gerente
supervisor
auxiliar_administrativa
contador
marketing
trabajador_operativo
```

Clasificación:

| Familia                              | Roles                                              |
| ------------------------------------ | -------------------------------------------------- |
| Gobierno organizacional              | `propietario`, `gerente_general`                   |
| Administración territorial           | `gerente`, `supervisor`                            |
| Funciones permanentes especializadas | `auxiliar_administrativa`, `contador`, `marketing` |
| Fuerza laboral puramente operativa   | `trabajador_operativo`                             |

`trabajador_operativo` no es inferior jerárquico de los demás roles dentro del motor de autorización.

Es una plantilla diferente y mínima.

```text
menos permisos
≠ menor identidad
≠ menor trazabilidad
≠ autorización operativa incompleta
```

No existe herencia entre roles base.

---

#### 14. Tratamiento de oficios legacy

Los códigos legacy permanecen clasificados como no canónicos:

```text
barista
bodeguero
cajero
cocinero
conductor
mesero
panadero
pastelero
repostero
```

No se convierten automáticamente durante esta tarea.

La clasificación de cada empleado deberá seguir:

| Situación permanente real                        | Rol base objetivo                                                 |
| ------------------------------------------------ | ----------------------------------------------------------------- |
| Solo ejecuta funciones operativas por turno      | `trabajador_operativo`                                            |
| Tiene responsabilidad administrativa permanente  | Uno de los siete roles base vigentes                              |
| Tiene una combinación administrativa y operativa | Rol base administrativo correspondiente + rol operativo del turno |
| La evidencia es ambigua o contradictoria         | Sin conversión automática; reconciliación obligatoria             |
| Empleado inactivo                                | No se reactiva ni se migra para conceder autoridad                |

Regla:

```text
legacy_role_code
≠ prueba suficiente para elegir rol base objetivo
```

La decisión se basa en la responsabilidad permanente real, no en el texto histórico.

---

#### 15. Candidatos operativos derivados del legado

Las siguientes equivalencias son únicamente candidatos de reconciliación y nunca conversiones automáticas:

| Oficio legacy | Rol operativo candidato                                         |
| ------------- | --------------------------------------------------------------- |
| `barista`     | `barista_satelite`                                              |
| `bodeguero`   | `bodeguero`                                                     |
| `cajero`      | `cajero_satelite`                                               |
| `cocinero`    | `cocinero_satelite` o `produccion_cocina`, según sede y proceso |
| `conductor`   | `conductor_logistica`                                           |
| `mesero`      | `servicio_salon`                                                |
| `panadero`    | `produccion_panaderia`                                          |
| `pastelero`   | `produccion_reposteria`                                         |
| `repostero`   | `produccion_reposteria`                                         |

Cada caso requiere comprobar:

- sede laboral;
- área;
- proceso real;
- perfiles operativos;
- turnos publicados;
- compatibilidad del rol con sede y área;
- consumidores legacy;
- datos históricos.

El perfil puede sugerir el rol al crear el turno; no lo convierte en autoridad vigente.

---

#### 16. Caso especial `bodeguero`

El texto `bodeguero` podrá continuar existiendo temporalmente en dos fuentes físicas, pero con significados distintos:

```text
employees.role = bodeguero
→ asignación base legacy inválida

active_shift.operational_role = bodeguero
→ rol operativo potencialmente válido
```

El cutover objetivo será:

```text
employees.role = trabajador_operativo
active_shift.operational_role = bodeguero
```

para empleados sin responsabilidad administrativa permanente.

La coincidencia textual histórica no permite copiar permisos base, fusionar matrices ni omitir el turno.

---

#### 17. Compatibilidad temporal antes del cutover

Hasta materializar la migración:

1. los siete roles base canónicos actuales continúan válidos;
2. `trabajador_operativo` será válido solo después de publicarse en el catálogo físico correspondiente;
3. los oficios base legacy continúan con `role_status = INVALID`;
4. un oficio legacy no se interpreta automáticamente como `trabajador_operativo`;
5. no se crea alias de autorización entre el oficio legacy y el nuevo rol;
6. un carril operativo válido puede seguir evaluándose independientemente del carril base inválido, conforme a la modalidad del permiso;
7. toda asignación migrada debe conservar el código anterior, la causa, el actor y la fecha para auditoría;
8. la transición debe admitir rollback mientras no se hayan retirado los objetos legacy.

`AUTH-CTX-028` deberá diseñar el adaptador temporal con esta regla:

```text
COMPATIBILIDAD
→ conserva forma y diagnóstico
→ no inventa grants
→ no transforma silenciosamente el rol
→ no crea fallback operativo
```

---

#### 18. Impacto sobre `AccessContext`

No cambia la forma de `AccessContext@1.x`.

El nodo `base_role` podrá representar:

```text
role_code = trabajador_operativo
role_status = ACTIVE
assignment_source = CANONICAL_EMPLOYEE_BASE_ROLE_ASSIGNMENT
```

cuando exista una asignación explícita y vigente.

Invariantes:

```text
employee.base_role_code
=
base_role.role_code
=
trabajador_operativo
```

Solo entonces el carril base podrá consultar la matriz del nuevo rol.

El nodo no incluirá la lista completa de permisos.

El evaluador consultará el snapshot versionado de matriz base.

Un código legacy no podrá proyectarse como `trabajador_operativo` dentro de `AccessContext` sin una asignación migrada o un contrato de compatibilidad expresamente aprobado.

---

#### 19. Impacto sobre la decisión de autorización

Para permisos `BASE_ONLY` o para el componente base de permisos compatibles:

```text
base_role = trabajador_operativo
+
fila exacta en matriz
+
alcance coincidente
+
recurso compatible
+
sin deny aplicable
=
base_decision = ALLOW
```

La ausencia de fila produce:

```text
base_decision = DENY
reason_code = base_allow_not_found
```

Para permisos `OPERATIONAL_ONLY`, el rol base no participa como fuente de allow.

Para permisos `BASE_OR_OPERATIONAL`, las cinco concesiones base podrán autorizar únicamente las cinco claves exactas. No autorizan otras claves por prefijo, aplicación o proximidad semántica.

Para permisos `BASE_AND_OPERATIONAL`, el nuevo rol no contiene componentes base iniciales.

---

#### 20. Versionado del catálogo de roles base

La introducción de `trabajador_operativo` es un cambio aditivo.

Decisión:

```text
catálogo lógico de roles base
1.0.0
→
1.1.0
```

Cambios:

| Dimensión                                  | Versión actual | Versión objetivo |
| ------------------------------------------ | -------------: | ---------------: |
| Roles base                                 |              7 |                8 |
| Nuevos códigos                             |              0 |                1 |
| Roles retirados                            |              0 |                0 |
| Cambios de significado en roles existentes |              0 |                0 |

No se reutiliza ningún código existente.

No se altera el significado de los siete roles ya publicados.

---

#### 21. Versionado del dataset de matriz base

El snapshot aprobado actual permanece inmutable:

```text
vento.authorization.base-role-grants@1.0.0
```

Se define como sucesor lógico:

```text
vento.authorization.base-role-grants@1.1.0
```

Diff exacto:

```text
+ role_code = trabajador_operativo
+ 5 concesiones DIRECT
+ 0 componentes BASE_COMPONENT
```

Resultado objetivo:

| Campo                  |      `1.0.0` |      `1.1.0` |
| ---------------------- | -----------: | -----------: |
| `role_count`           |            7 |            8 |
| `record_count`         |          499 |          504 |
| `direct_base_count`    |          463 |          468 |
| `base_component_count` |           36 |           36 |
| `effect`               | `ALLOW_ONLY` | `ALLOW_ONLY` |

El catálogo de permisos:

```text
vento.authorization@1.0.0
```

no cambia, porque esta tarea no crea, retira ni modifica ninguna clave de permiso.

El hash de `vento.authorization.base-role-grants@1.1.0` deberá calcularse sobre la serialización física determinista durante `SHELL-CON-004` y verificarse mediante `AUTH-DB-027`. Esta tarea define el contenido lógico exacto, pero no publica el archivo físico.

---

#### 22. Capacidades personales todavía no representadas por claves atómicas

El catálogo vigente no contiene claves específicas para:

- consultar el perfil laboral propio;
- consultar los turnos propios;
- consultar notificaciones laborales propias.

Estas necesidades no se conceden mediante `anima.access` ni mediante una clave aproximada.

Quedan vinculadas expresamente a:

| Necesidad                                   | Tarea responsable                              | Momento                   |
| ------------------------------------------- | ---------------------------------------------- | ------------------------- |
| Consolidar la brecha contractual            | `GAP-CTRL-001`                                 | BLOQUE E1                 |
| Clasificar y asignar destino                | `GAP-CTRL-003`, `GAP-CTRL-004`, `GAP-CTRL-006` | Antes de cerrar E1        |
| Diseñar inicio con turno actual y siguiente | `ANIMA-UX-004`                                 | Diseño funcional de ANIMA |
| Simplificar datos personales y documentos   | `ANIMA-UX-013`                                 | Diseño funcional de ANIMA |
| Definir recordatorios laborales             | `ANIMA-UX-016`                                 | Diseño funcional de ANIMA |
| Asignar permiso exacto a vistas y acciones  | `AUTH-UI-030`, `AUTH-UI-031`                   | BLOQUE I                  |
| Impedir cierre con brecha sin paquete       | `E5-GATE-002`, `E5-GATE-008`                   | BLOQUE E5                 |

Cuando esas tareas demuestren que se requiere una nueva clave, aplicará la regla canónica de evolución del catálogo y se generará una nueva versión, un diff de matrices y la regeneración de datasets afectados.

Hasta entonces:

```text
CLAVE AUSENTE
→ NO GRANT
→ DEFAULT_DENY
```

---

#### 23. Impacto sobre `ADR-AUTH-001`

La decisión es compatible con `ADR-AUTH-001`.

No contradice:

- la separación de rol base y rol operativo;
- la singularidad del rol base;
- la ausencia de roles híbridos;
- la prohibición de bypass por nombre;
- la exigencia de permisos exactos;
- la precedencia de denegaciones;
- la denegación por defecto.

La tarea cierra una definición expresamente diferida por `AUTH-MOD-002`.

Decisión documental:

```text
ADR-AUTH-001
→ permanece ACCEPTED
→ no se sustituye
→ recibe ENMIENDA ADITIVA AUTH-MOD-021
```

La enmienda deberá registrar:

1. `trabajador_operativo` como octavo rol base;
2. su matriz mínima de cinco concesiones;
3. la prohibición de autoridad operativa permanente;
4. la versión `1.1.0` del catálogo lógico de roles base;
5. el sucesor `vento.authorization.base-role-grants@1.1.0`;
6. el tratamiento de oficios legacy;
7. la puerta contractual previa a `AUTH-CTX-028`.

---

#### 24. Materialización exacta en BLOQUE E3

| Tarea            | Responsabilidad sobre esta decisión                                         |
| ---------------- | --------------------------------------------------------------------------- |
| `SUPA-AUD-004`   | Inventariar tablas y vistas que almacenan roles base, permisos y empleados. |
| `SUPA-AUD-005`   | Inventariar FK, constraints, enums e índices afectados.                     |
| `SUPA-AUD-018`   | Identificar códigos y estructuras legacy de oficios base.                   |
| `SUPA-AUD-019`   | Detectar duplicidades, huérfanos y fuentes competidoras.                    |
| `SUPA-ARC-002`   | Ubicar roles y autorización dentro del dominio empresarial estable.         |
| `SUPA-ARC-003`   | Definir esquema propietario de las fuentes de verdad.                       |
| `SUPA-ARC-008`   | Incorporar el rol dentro del modelo canónico de identidad y autorización.   |
| `SUPA-ARC-009`   | Conservar el vínculo entre Auth y empleado sin usar el rol como identidad.  |
| `SUPA-ARC-012`   | Definir constraints, estados, cardinalidad y timestamps de asignación.      |
| `SUPA-ARC-015`   | Definir exposición, grants y RLS del catálogo y las asignaciones.           |
| `SUPA-ARC-023`   | Definir generación de tipos que incluya el nuevo código.                    |
| `SUPA-TRANS-001` | Mapear cada objeto actual hacia la arquitectura objetivo.                   |
| `SUPA-TRANS-002` | Clasificar oficios legacy y objetos relacionados.                           |
| `SUPA-TRANS-003` | Identificar consumidores y dependencias.                                    |
| `SUPA-TRANS-004` | Definir orden de migración del dominio de autorización.                     |
| `SUPA-TRANS-005` | Definir backfill y reconciliación empleado por empleado.                    |
| `SUPA-TRANS-006` | Definir wrappers temporales sin crear aliases permisivos.                   |
| `SUPA-TRANS-007` | Coordinar adaptación de consumidores.                                       |
| `SUPA-TRANS-009` | Definir pruebas antes y después del cutover.                                |
| `SUPA-TRANS-011` | Definir rollback del paquete.                                               |
| `SUPA-TRANS-012` | Definir retiro progresivo de oficios base legacy.                           |
| `SUPA-TRANS-014` | Actualizar tipos, contratos y documentación.                                |
| `SUPA-TRANS-015` | Convertir el plan en roadmap ejecutable de migraciones.                     |

---

#### 25. Materialización exacta en BLOQUE H

| Tarea            | Responsabilidad sobre esta decisión                                       |
| ---------------- | ------------------------------------------------------------------------- |
| `SHELL-PKG-002`  | Aplicar versionado semántico al cambio aditivo.                           |
| `SHELL-PKG-003`  | Publicar tag y release correspondientes.                                  |
| `SHELL-PKG-004`  | Declarar compatibilidad entre snapshots `1.0.0` y `1.1.0`.                |
| `SHELL-PKG-005`  | Declarar deprecación de códigos legacy.                                   |
| `SHELL-CON-001`  | Publicar contratos y schemas compartidos.                                 |
| `SHELL-CON-004`  | Centralizar el catálogo de ocho roles base y generar el dataset `1.1.0`.  |
| `SHELL-CON-007`  | Actualizar tipos de contexto sin cambiar la forma de `AccessContext@1.x`. |
| `SHELL-AUTH-001` | Incluir la nueva versión en el SDK canónico.                              |
| `SHELL-CTX-001`  | Resolver el nuevo código dentro del módulo contextual.                    |
| `SHELL-AUTH-004` | Bloquear nuevos usos de oficios legacy como roles base válidos.           |
| `SHELL-AUTH-005` | Certificar adopción en todos los repositorios antes del retiro.           |

---

#### 26. Materialización exacta en VISO

| Tarea           | Responsabilidad sobre esta decisión                                      |
| --------------- | ------------------------------------------------------------------------ |
| `VISO-AUTH-001` | Administrar el catálogo de roles base incluyendo `trabajador_operativo`. |
| `VISO-AUTH-003` | Administrar su matriz mínima sin conceder permisos implícitos.           |
| `VISO-AUTH-008` | Conservar sedes asignadas separadas del rol base.                        |
| `VISO-AUTH-009` | Conservar áreas asignadas separadas del rol base.                        |
| `VISO-AUTH-013` | Mostrar la vista previa trabajador × sede × área × turno.                |
| `VISO-AUTH-015` | Mostrar el origen base u operativo de cada permiso.                      |
| `VISO-AUTH-016` | Mostrar conflictos y asignaciones legacy todavía no reconciliadas.       |

VISO no podrá asignar `trabajador_operativo` como fallback silencioso.

---

#### 27. Materialización exacta en BLOQUE R

| Tarea         | Responsabilidad sobre esta decisión                                     |
| ------------- | ----------------------------------------------------------------------- |
| `AUTH-DB-015` | Crear y versionar las migraciones exclusivamente en `vento-shell`.      |
| `AUTH-DB-027` | Probar catálogo, dataset, FK, constraints, RLS, RPC y migraciones.      |
| `AUTH-DB-028` | Comparar local, staging y producción antes del cambio.                  |
| `AUTH-DB-029` | Verificar respaldo, restauración y rollback.                            |
| `AUTH-DB-020` | Migrar catálogo, matriz y asignaciones con compatibilidad temporal.     |
| `AUTH-DB-011` | Aplicar constraints después de backfill y reconciliación.               |
| `AUTH-DB-026` | Generar y publicar tipos después del paquete aprobado.                  |
| `AUTH-DB-033` | Proyectar `trabajador_operativo` correctamente en `get_access_context`. |
| `AUTH-DB-034` | Evaluar las cinco concesiones exactas sin reglas especiales por nombre. |
| `AUTH-DB-030` | Retirar códigos y objetos legacy solo después de adopción comprobada.   |
| `AUTH-DB-031` | Certificar paridad documental, técnica y operativa.                     |

---

#### 28. Orden obligatorio de implementación

```text
AUTH-MOD-021 APROBADA
        ↓
AUTH-CTX-028
        ↓
AUTH-CTX-029
        ↓
AUTH-CTX-030
        ↓
SUPA-AUD-004, 005, 018, 019
        ↓
SUPA-ARC-002, 003, 008, 009, 012, 015, 023
        ↓
SUPA-TRANS-001 a 007, 009, 011, 012, 014, 015
        ↓
SHELL-PKG-002 a 005
        ↓
SHELL-CON-001, 004, 007
        ↓
SHELL-AUTH-001 y SHELL-CTX-001
        ↓
AUTH-DB-015, 027, 028, 029
        ↓
AUTH-DB-020
        ↓
AUTH-DB-011, 026, 033, 034
        ↓
VISO-AUTH-001, 003, 008, 009, 013, 015, 016
        ↓
migración progresiva de consumidores
        ↓
SHELL-AUTH-004 y SHELL-AUTH-005
        ↓
AUTH-DB-030
        ↓
AUTH-DB-031
```

Este orden no autoriza implementación durante la fase documental actual.

---

#### 29. Reglas de migración de empleados

La futura migración deberá:

1. inventariar todos los empleados con oficios base legacy;
2. distinguir empleados activos e inactivos;
3. identificar responsabilidades permanentes reales;
4. detectar asignaciones administrativas vigentes;
5. detectar permisos individuales activos;
6. identificar perfiles y turnos operativos existentes;
7. clasificar cada empleado como migrable, administrativo, ambiguo o excluido;
8. producir un plan de cambio individual;
9. ejecutar backfill idempotente;
10. conservar el código anterior y la fuente;
11. validar que ningún permiso operativo quede concedido por el carril base;
12. validar que el empleado conserve acceso mínimo a SHELL y ANIMA;
13. validar que la operación proceda exclusivamente del turno;
14. permitir rollback mientras el retiro legacy no haya comenzado;
15. registrar evidencia de reconciliación y resultado.

No se permite una sentencia masiva basada únicamente en:

```text
WHERE role IN (...)
```

sin reconciliación previa.

---

#### 30. Auditoría obligatoria

La asignación, cambio o migración del rol deberá registrar:

```text
employee_id
previous_base_role_code
new_base_role_code
assignment_reason
assignment_source
legacy_role_code
decision_reference = AUTH-MOD-021
catalog_version
dataset_version
changed_by
changed_at
migration_batch_id
rollback_reference
```

También deberá registrar:

- responsabilidades permanentes consideradas;
- conflictos detectados;
- perfil operativo existente;
- turnos activos o futuros relevantes;
- permisos individuales vigentes;
- resultado de pruebas;
- estado de reconciliación.

---

#### 31. Pruebas contractuales obligatorias

`AUTH-CTX-030`, `AUTH-DB-027` y `AUTH-QA-030` deberán cubrir como mínimo:

1. empleado activo con `trabajador_operativo` obtiene `shell.access`;
2. obtiene `anima.access` sin turno;
3. puede consultar únicamente documentos propios autorizados;
4. no puede consultar documentos de otro trabajador;
5. solo puede cargar documentos propios de tipos autoservicio;
6. puede cargar únicamente su propia fotografía;
7. no puede eliminar documentos;
8. no obtiene acceso base a NEXO, FOGO, ORIGO, PULSO, VISO, NUMERA, AURA o PASS;
9. sin turno no obtiene permisos operativos;
10. con turno válido obtiene únicamente permisos del rol operativo;
11. sin check-in se bloquean los permisos `T+C`;
12. al cerrar el contexto pierde la autoridad operativa;
13. un oficio legacy no se convierte automáticamente en el nuevo rol;
14. un rol legacy inválido no produce allow base;
15. `bodeguero` base legacy y `bodeguero` operativo permanecen separados;
16. una excepción individual no concede permisos `OPERATIONAL_ONLY` por base;
17. una denegación aplicable vence las cinco concesiones;
18. una URL directa no evita la decisión;
19. un dispositivo compartido no amplía las capacidades;
20. rollback restaura la asignación anterior sin perder trazabilidad.

Las pruebas funcionales existentes relacionadas incluyen:

- `AUTH-QA-004`;
- `AUTH-QA-005`;
- `AUTH-QA-006`;
- `AUTH-QA-007`;
- `AUTH-QA-008`;
- `AUTH-QA-009`;
- `AUTH-QA-012`;
- `AUTH-QA-017`;
- `AUTH-QA-020`;
- `AUTH-QA-021`;
- `AUTH-QA-022`;
- `AUTH-QA-027`;
- `AUTH-QA-028`;
- `AUTH-QA-029`;
- `AUTH-QA-030`.

---

#### 32. Riesgos controlados

##### Riesgo 1 — Convertir el rol mínimo en acceso general

Control:

```text
solo 5 filas exactas
+
135 ausencias
+
default deny
```

##### Riesgo 2 — Operar sin turno

Control:

```text
0 permisos OPERATIONAL_ONLY
+
0 componentes BASE_AND_OPERATIONAL
```

##### Riesgo 3 — Convertir automáticamente el legado

Control:

```text
reconciliación por empleado
+
sin alias permisivo
+
sin fallback
```

##### Riesgo 4 — Perder autoservicio laboral

Control:

```text
shell.access
+
anima.access
+
documentos propios
+
fotografía propia
```

##### Riesgo 5 — Crear una tercera clase de rol

Control:

```text
trabajador_operativo
→ pertenece al catálogo base
→ no crea catálogo híbrido
```

##### Riesgo 6 — Romper consumidores de versiones anteriores

Control:

```text
snapshot 1.0.0 inmutable
+
snapshot 1.1.0 aditivo
+
adaptación por consumidor
+
rollback
```

##### Riesgo 7 — Contradecir la ADR

Control:

```text
enmienda aditiva
+
ADR permanece ACCEPTED
```

---

#### 33. Fuera del alcance

AUTH-MOD-021 no:

- modifica Supabase;
- crea migraciones;
- cambia `employees.role`;
- inserta el nuevo rol físicamente;
- actualiza matrices físicas;
- publica paquetes;
- genera hashes;
- migra empleados;
- elimina oficios legacy;
- crea permisos nuevos;
- resuelve las brechas de perfil, turnos propios o notificaciones;
- implementa compatibilidad;
- modifica guards, RPC, RLS o aplicaciones;
- inicia `AUTH-CTX-028`.

Cada responsabilidad física o diferida tiene destino exacto en las secciones 22 y 24 a 31.

---

#### 34. Invariantes

1. `trabajador_operativo` es un rol base canónico.
2. Es el octavo rol base.
3. Su asignación es explícita; no es fallback.
4. No es identidad laboral.
5. No es rol operativo.
6. No representa un oficio.
7. No concede operación por el nombre.
8. Tiene exactamente cinco concesiones iniciales.
9. Tiene cero permisos `OPERATIONAL_ONLY`.
10. Tiene cero componentes `BASE_AND_OPERATIONAL`.
11. Los restantes 135 permisos se deniegan por ausencia.
12. `shell.access` no concede acceso a otras aplicaciones.
13. `anima.access` no concede capacidades internas.
14. Los documentos se limitan a `OWN`.
15. La carga documental se limita a tipos autoservicio.
16. La fotografía se limita al actor.
17. No consulta terceros.
18. No administra turnos.
19. No administra personal.
20. No administra permisos.
21. No recibe autoridad territorial permanente.
22. El turno determina la función operativa.
23. El check-in continúa siendo obligatorio cuando el permiso lo exige.
24. El rol operativo continúa siendo la única plantilla operativa.
25. Los oficios legacy permanecen no canónicos.
26. No existe conversión automática del legado.
27. `bodeguero` base y operativo permanecen separados.
28. El catálogo de permisos no cambia.
29. El catálogo lógico de roles base pasa a `1.1.0`.
30. El dataset base objetivo pasa a `1.1.0`.
31. El snapshot `1.0.0` permanece inmutable.
32. `AccessContext@1.x` conserva su forma.
33. La ADR permanece `ACCEPTED`.
34. La decisión requiere una enmienda aditiva.
35. No se implementa código, migraciones ni cambios en Supabase.

---

#### 35. Criterios de aprobación

AUTH-MOD-021 podrá aprobarse cuando se acepte que:

1. el código definitivo es `trabajador_operativo`;
2. el nombre humano es Trabajador operativo;
3. pertenece al catálogo de roles base;
4. es mínimo y no privilegiado;
5. recibe exactamente cinco concesiones base;
6. las cinco claves y sus alcances están definidos;
7. no recibe permisos operativos;
8. no recibe autoridad administrativa implícita;
9. los demás 135 permisos quedan en default deny;
10. el catálogo de roles base pasa de siete a ocho roles;
11. el catálogo lógico de roles base pasa a `1.1.0`;
12. `vento.authorization.base-role-grants@1.1.0` será el snapshot sucesor;
13. sus conteos objetivo son 504 registros, 468 directos y 36 componentes;
14. `vento.authorization@1.0.0` no cambia;
15. los oficios legacy no se convierten automáticamente;
16. la migración se decide empleado por empleado;
17. `bodeguero` conserva separación de namespaces;
18. `AccessContext@1.x` no cambia de forma;
19. `AUTH-CTX-028` deberá diseñar compatibilidad sin inventar grants;
20. `ADR-AUTH-001` permanece `ACCEPTED`;
21. la decisión constituye una enmienda aditiva a la ADR;
22. E3, H, VISO, R y QA tienen tareas exactas asignadas;
23. las capacidades personales todavía ausentes tienen destino documental exacto;
24. no se implementa código, migraciones ni cambios en Supabase.

---

#### 36. Cierre y continuidad

| Relación                  | Tarea          | Estado        |
| ------------------------- | -------------- | ------------- |
| Tarea anterior            | `AUTH-CTX-027` | ✅ APROBADA    |
| Tarea propuesta           | `AUTH-MOD-021` | ✅ APROBADA    |
| Tarea siguiente reservada | `AUTH-CTX-028` | ⬜ NO INICIADA |

```text
AUTH-CTX-027 — APROBADA
        ↓
AUTH-MOD-021 — APROBADA
        ↓
AUTH-CTX-028 — NO INICIADA
```

No se inicia `AUTH-CTX-028` hasta recibir aprobación explícita de `AUTH-MOD-021`.


