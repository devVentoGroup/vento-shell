### MINI-BLOQUE — AUDITORÍA ERRORES Y HELPERS COMPARTIDOS

<!-- PLAN-SECTION-META:START -->
**Cobertura canónica:** `AUTH-SRV-014` a `AUTH-SRV-018` — 5 tareas.
<!-- PLAN-SECTION-META:END -->

### ✅ AUTH-SRV-014 — Registrar actor real y actor operativo

**Estado:** APROBADA
**Tarea anterior:** AUTH-SRV-013 — Evitar operaciones entre áreas no autorizadas
**Tarea siguiente:** AUTH-SRV-015 — Registrar rol simulado en auditoría
**Tipo de tarea:** Contrato global con materialización por unidad (`PER_IMPLEMENTATION_UNIT`) — contrato de atribución y evidencia de ejecución para que toda acción protegida conserve de forma correlacionable el principal técnico real, el actor efectivo al que se atribuye la acción y, cuando exista carril operativo, el contexto operativo de ese mismo actor, sin confundir credencial, trabajador, rol, dispositivo, simulación, delegación ni campos empresariales como `published_by`
**Bloque:** BLOQUE J — Protección de acciones de servidor
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/J_ACCIONES_DE_SERVIDOR/03_AUDITORIA_ERRORES_Y_HELPERS_COMPARTIDOS.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global; las futuras materializaciones ocurren únicamente mediante `AUTH-SRV-014::<implementation_unit_id>` después de que `DELIV-PKG-025::<package_id>` asigne la unidad y el paquete propietario supere `E5-GATE-008::<package_id>`
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el contrato obligatorio de atribución para las acciones de servidor protegidas después de que `AUTH-SRV-004..013` hayan reconstruido el efecto y validado permiso, sede, área, turno, rol, dispositivo y estado cuando correspondan.

La regla vinculante queda:

```text
principal técnico real
+
actor efectivo resuelto
+
contexto operativo aplicable
+
decisión de autorización
+
recurso y transición validados
+
resultado de ejecución
=
evidencia correlacionable de quién actuó realmente
```

La auditoría no puede inferir al actor desde el frontend ni reconstruirlo después desde un dato ambiguo.

#### 2. Handoff recibido de `AUTH-SRV-013`

La tarea anterior deja disponible para cada decisión aplicable:

```text
resource identity
required_sides
resolved site by side
resolved area by side when required
area resolution source
area scope or operational basis
area authorization result by side
cross-area detection result
state/version basis
privileged path usage when applicable
final decision
```

Además permanecen vigentes los resultados acumulados del minibloque anterior:

```text
required_permission_key
effective principal
effective actor
validated site and area
shift when required
operational role when required
device context when applicable
current resource state
validated transition
```

`AUTH-SRV-014` consume esa evidencia y fija cómo conservar la atribución de la acción y de su ejecución. No reabre la autorización ya decidida.

#### 3. Pregunta contractual propietaria

Esta tarea responde:

```text
¿QUIÉN PRESENTÓ LA CREDENCIAL?
```

```text
¿A QUIÉN SE ATRIBUYE REALMENTE LA ACCIÓN EMPRESARIAL?
```

```text
¿BAJO QUÉ CONTEXTO OPERATIVO ACTUÓ ESE ACTOR, SI APLICA?
```

Y exige que la respuesta pueda correlacionarse con la decisión, el recurso y el efecto finalmente producido o rechazado.

#### 4. Frontera con `AUTH-SRV-015..018`

Las responsabilidades permanecen separadas:

```text
AUTH-SRV-014
→ actor real / efectivo, contexto operativo y evidencia de ejecución

AUTH-SRV-015
→ rol o sujeto simulado dentro de la auditoría de simulación

AUTH-SRV-016
→ códigos y respuestas públicas estables de autorización

AUTH-SRV-017
→ helpers server compartidos

AUTH-SRV-018
→ prerrequisitos explícitos de acciones administrativas sin turno
```

`AUTH-SRV-014` no absorbe ninguna de esas decisiones.

#### 5. Modelo canónico de identidad consumido

La atribución conserva la separación aprobada:

```text
credencial validada
→ principal autenticado
→ identidad de dominio
→ actor efectivo
→ contexto laboral u operativo
→ decisión de autorización
```

Por tanto:

```text
principal
≠
actor efectivo
≠
rol
≠
dispositivo
≠
sujeto simulado
```

Aunque dos identificadores coincidan accidentalmente en un sistema legacy, su semántica no se fusiona.

#### 6. Principal técnico real

El principal representa quién o qué presentó la credencial técnica aceptada.

Puede ser:

```text
HUMAN_USER
SHARED_DEVICE
SYSTEM_SERVICE
ANONYMOUS
```

La evidencia deberá conservar el identificador técnico autoritativo disponible, su clase y la referencia de sesión o ejecución cuando el contrato la provea.

No se registran tokens, secretos ni credenciales completas.

#### 7. Actor efectivo

El actor efectivo es la entidad empresarial a la que se atribuye la acción.

Los tipos canónicos permanecen:

```text
EMPLOYEE
CUSTOMER
SYSTEM
UNRESOLVED
```

La identidad se conserva mediante el par conceptual:

```text
actor_type
+
actor_id
```

`actor_id` se interpreta únicamente dentro del namespace de `actor_type`.

#### 8. Fuentes canónicas de atribución

Se conservan como fuentes de atribución:

```text
PERSONAL_SESSION
DEVICE_ACTOR_SESSION
SYSTEM_PROCESS
DOMAIN_IDENTITY
NONE
```

La fuente forma parte de la explicación de por qué una identidad concreta es el actor efectivo.

No basta registrar un identificador sin conservar cómo fue resuelto.

#### 9. El rol no es actor

Ni el rol base ni el rol operativo sustituyen al actor.

Se mantiene:

```text
role_code
≠
actor_id
```

Los roles pueden formar parte del contexto de decisión y de auditoría, pero nunca se usan para identificar a la persona o sistema que ejecutó la acción.

#### 10. Actor operativo

`actor operativo` no introduce un segundo sujeto empresarial independiente de `actor_effective`.

Cuando el carril operativo participa, la evidencia debe vincular al mismo actor efectivo con su contexto operativo validado:

```text
actor_effective
+
active_shift
+
active_checkin when required
+
operational_role
+
operational_site
+
operational_area when required
=
operational attribution context
```

Si la capacidad es administrativa y no requiere carril operativo, la ausencia de ese contexto no constituye una brecha de atribución.

#### 11. Prohibición de fabricar un segundo `actor_id`

No se creará por conveniencia un identificador separado denominado conceptualmente `operational_actor_id` cuando la persona que actúa ya está representada por `actor_effective`.

Si cambia la persona que actúa, debe cambiar la resolución del actor efectivo y producirse un nuevo contexto.

Un cambio de rol, turno o área no convierte al mismo empleado en otra identidad.

#### 12. Sesión personal

Para una sesión laboral personal válida, la evidencia mínima conserva:

```text
principal_type = HUMAN_USER
principal_id = auth_user_id validado
actor_type = EMPLOYEE
actor_id = employee_id canónico
attribution_source = PERSONAL_SESSION
```

La relación entre `auth_user_id` y `employee_id` se resuelve en servidor.

No se supone por igualdad de UUID.

#### 13. `auth_user_id` no es `employee_id`

Queda prohibido tratar automáticamente:

```text
auth_user_id
=
employee_id
```

El primero identifica al sujeto técnico de autenticación.

El segundo identifica al trabajador empresarial.

Una escritura cuyo campo físico exige `employee_id` debe recibir el empleado resuelto, no el identificador Auth por conveniencia.

#### 14. Dispositivo compartido

En un dispositivo compartido se conservan simultáneamente:

```text
principal técnico del dispositivo
device_id canónico
actor_session_id vigente
actor efectivo humano
```

El principal técnico no se convierte en trabajador.

El dispositivo no hereda el actor autenticado que lo administró o configuró.

#### 15. Sesión de actor en dispositivo

Cuando existe una sesión de actor válida:

```text
principal_type = SHARED_DEVICE
actor_type = EMPLOYEE
attribution_source = DEVICE_ACTOR_SESSION
```

La evidencia debe conservar la correlación con `device_id` y `actor_session_id` sin registrar el secreto de autenticación del trabajador.

El `actor_session_id` utilizado debe corresponder al actor efectivo vigente.

#### 16. Dispositivo sin actor resoluble

Si una acción empresarial exige actor humano y el dispositivo no tiene una sesión de actor válida:

```text
actor_type = UNRESOLVED
actor_id = null
→ no efecto empresarial
```

No se reutiliza:

- el último trabajador;
- el administrador que configuró el dispositivo;
- un usuario técnico;
- `navigation_role`;
- el rol del turno de otra persona.

#### 17. Ambigüedad de actor

Dos o más candidatos incompatibles producen:

```text
actor_type = UNRESOLVED
resolved = false
→ fail closed
```

La auditoría conserva la causa estructurada disponible sin elegir silenciosamente el primer registro encontrado.

#### 18. Proceso de sistema autónomo

Un proceso técnico autónomo conserva:

```text
principal_type = SYSTEM_SERVICE
actor_type = SYSTEM
attribution_source = SYSTEM_PROCESS
```

El uso de `service_role`, admin client o una función privilegiada no explica por sí mismo la autoridad empresarial.

Debe existir una identidad técnica estable y no secreta del proceso.

#### 19. Proceso delegado

Cuando un proceso de sistema ejecuta una acción atribuida explícitamente a un empleado:

```text
principal_type = SYSTEM_SERVICE
actor_type = EMPLOYEE
attribution_source = SYSTEM_PROCESS
delegation_id = referencia válida
```

La delegación debe ser explícita, vigente y correlacionable.

No se infiere desde `created_by`, un correo, un nombre de job o un parámetro cliente.

#### 20. Principal anónimo o actor no resuelto

La evidencia de una denegación puede conservar un principal anónimo o un actor no resuelto.

No se inventa `employee_id` para llenar la auditoría.

Cuando la operación exige actor y no existe uno resoluble, el resultado normal es denegación sin efecto.

#### 21. Actor real y simulación

El actor real no se reemplaza por el sujeto o rol simulado.

Toda simulación conserva como base:

```text
real actor
≠
simulated subject
```

`AUTH-SRV-014` garantiza que la atribución real permanezca disponible.

`AUTH-SRV-015` añadirá el contrato específico para rol y sujeto simulados sin alterar el actor real.

#### 22. Decisión y ejecución son hechos relacionados pero distintos

Se mantienen separados:

```text
authorization decision
```

y:

```text
business execution result
```

Una decisión `ALLOW` no demuestra por sí sola que la escritura se ejecutó.

Una escritura ejecutada debe poder enlazarse con la decisión que la autorizó.

#### 23. Correlación obligatoria

Cuando la infraestructura contractual lo proporcione, la ejecución conserva:

```text
decision_id
correlation_id
```

`decision_id` identifica la decisión inmutable.

`correlation_id` vincula los hechos de una misma operación lógica.

Ninguno de ellos concede permiso ni funciona como bearer token.

#### 24. Resultado de ejecución

La evidencia de una mutación debe distinguir al menos:

```text
AUTHORIZED_NOT_EXECUTED
EXECUTED
EXECUTION_FAILED
NO_EFFECT_DENIED
NO_EFFECT_CONFLICT
```

Estas etiquetas son categorías documentales de resultado y no reemplazan los códigos públicos que definirá `AUTH-SRV-016`.

La implementación puede utilizar nombres físicos diferentes si conserva la misma semántica.

#### 25. Denegaciones

Una denegación no elimina la obligación de atribución cuando el contrato mínimo puede resolverse.

Debe conservarse, según disponibilidad autoritativa:

- principal;
- actor efectivo o estado no resuelto;
- dispositivo;
- capacidad;
- recurso o intento de recurso;
- territorio;
- decisión;
- razones estructuradas;
- timestamp;
- correlación.

No existe efecto `after` porque no existió mutación.

#### 26. Fallo antes de construir evidencia mínima

Si un fallo técnico impide construir una decisión y atribución contractualmente coherentes:

```text
no se emite evidencia empresarial parcialmente válida
+
operación falla cerrada
+
telemetría técnica separada
```

Los logs de infraestructura no se reinterpretan después como auditoría empresarial completa.

#### 27. Estado anterior y posterior

Cuando una acción modifica estado empresarial, la evidencia debe permitir reconstruir el cambio mediante una representación mínima y autorizada de:

```text
before
→ transition
→ after
```

No se exige copiar indiscriminadamente la fila completa.

La proyección de auditoría debe conservar los campos necesarios para demostrar el efecto sin incorporar datos personales o secretos no requeridos.

#### 28. Inmutabilidad histórica

Una vez emitida, la evidencia histórica de una decisión o ejecución no se reinterpreta con el estado actual del recurso.

Si el recurso cambia después:

```text
old evidence remains historical
new attempt → new decision and execution evidence
```

Una corrección posterior produce nueva evidencia; no reescribe silenciosamente el evento anterior.

#### 29. Frescura antes del efecto

La atribución usada por una mutación debe corresponder al mismo contexto que autorizó el efecto o a una revalidación equivalente inmediatamente anterior.

Cambios en:

- actor;
- sesión;
- turno;
- check-in;
- rol operativo;
- sede;
- área;
- dispositivo;
- permiso;
- recurso;
- estado;
- versión;

invalidan la reutilización silenciosa de una atribución anterior cuando afectan la decisión.

#### 30. Reintentos

Un reintento no reutiliza como autoridad una decisión obsoleta.

Puede conservar `correlation_id` cuando pertenece al mismo intento lógico, pero debe producir una decisión nueva si cambió el contexto o el recurso.

La evidencia distingue cada intento y su resultado.

#### 31. Operaciones masivas

Una mutación masiva debe conservar:

- actor y principal comunes cuando realmente sean comunes;
- capacidad exacta;
- conjunto de recursos o descriptor reproducible;
- política de atomicidad;
- resultado global;
- resultados por miembro cuando el contrato permita parcialidad.

No se reduce el universo afectado a un único recurso representativo para simplificar auditoría.

#### 32. Operaciones asíncronas y colas

Cuando una acción se difiere:

```text
request actor/context
≠
execution-time authority automatically
```

La ejecución debe conservar quién originó la intención, quién o qué ejecutó técnicamente y qué actor efectivo fue autorizado en el momento aplicable.

La cola no transforma al worker técnico en autor empresarial por defecto.

#### 33. Operación offline

Una intención sincronizada desde offline conserva su actor originador cuando sea verificable, pero debe reautorizarse bajo el estado vigente.

La evidencia distingue:

```text
originated_at
executed_at
```

sin convertir el snapshot offline en autoridad vigente.

#### 34. Cliente privilegiado

El uso de:

```text
createAdminClient
service role
SECURITY DEFINER
```

se registra como característica técnica cuando sea material para investigar la ejecución.

No sustituye:

- principal;
- actor efectivo;
- permiso;
- territorio;
- recurso;
- decisión.

#### 35. Campos de auditoría y datos personales

La evidencia usa identificadores canónicos y metadatos de autorización.

No incorpora por defecto:

- nombre;
- documento;
- correo;
- teléfono;
- cargo humano libre;
- tokens;
- cookies;
- contraseñas;
- OTP;
- API keys;
- headers completos.

Una investigación autorizada puede resolver después atributos descriptivos desde sus fuentes correspondientes.

#### 36. Auditoría empresarial y observabilidad

Se mantienen separadas:

```text
business audit evidence
≠
metrics / traces / application logs
```

Pueden compartir `correlation_id`.

No deben compartir automáticamente retención, exposición, sensibilidad ni esquema.

#### 37. Superficies cubiertas

La misma atribución se exige, cuando aplique, en:

- Server Actions;
- Route Handlers;
- API routes;
- RPC;
- Data API;
- RLS que participe en la decisión;
- Edge Functions;
- jobs;
- colas;
- integraciones internas;
- clientes nativos;
- dispositivos compartidos.

Una superficie no queda exenta porque la interfaz ya hubiera identificado al usuario.

#### 38. Llamada directa

Una llamada directa o manipulada debe conservar la misma atribución que el flujo visible.

Cambiar en el request:

- `employee_id`;
- `actor_id`;
- `published_by`;
- `created_by`;
- `updated_by`;
- `role`;
- `site_id`;
- `area_id`;

no cambia quién es el actor efectivo resuelto en servidor.

#### 39. Campos empresariales de autoría

Campos como:

```text
created_by
updated_by
approved_by
published_by
cancelled_by
```

son proyecciones empresariales de atribución.

Deben declarar un namespace físico y semántico único.

No pueden recibir indistintamente `auth_user_id`, `employee_id`, `device_id` o `service_id` según el caller.

#### 40. Regla de namespace

Para cada campo empresarial de autoría, la futura unidad deberá demostrar:

```text
field semantic owner
+
referenced namespace
+
resolved actor value
=
coherent attribution
```

Si el campo referencia `public.employees(id)`, solo puede recibir un `employee_id` canónico.

Si un caso legítimo exige otro tipo de actor y el campo físico no puede representarlo, la materialización debe utilizar el owner de schema correspondiente para ampliar el modelo; nunca debe insertar un identificador de otro namespace.

#### 41. `published_by` en programación laboral

El contrato físico vigente de `employee_shifts.published_by` lo define como referencia al empleado que publicó el turno.

Por tanto, para una publicación atribuida a un trabajador:

```text
published_by
=
actor_effective.actor_id
```

solo cuando:

```text
actor_effective.actor_type = EMPLOYEE
```

La fuente no es directamente `principal.auth_user_id`.

#### 42. Incompatibilidad de namespace en `published_by`

Queda prohibido:

```text
published_by = auth_user_id
```

sin resolver primero la identidad laboral y demostrar que el valor insertado pertenece al namespace `public.employees(id)`.

La igualdad accidental de UUID no constituye contrato.

#### 43. Publicación por actor no empleado

Si en una futura capacidad se autorizara legítimamente una publicación cuyo actor efectivo no sea `EMPLOYEE`, la unidad no puede colocar un `SYSTEM`, `DEVICE` o `CUSTOMER` ID dentro de `employee_shifts.published_by`.

La compatibilidad física deberá resolverse mediante el owner de schema y el paquete correspondiente antes de habilitar ese caso.

`AUTH-SRV-014` no concede por sí solo esa capacidad.

#### 44. Baseline VISO mensual

Se conserva como baseline de solo lectura el snapshot vigente de `vento-group-sas/vento-viso` utilizado por el package mensual.

Las superficies relevantes incluyen:

```text
src/app/staff/schedule/month/actions.ts
src/app/staff/schedule/helpers.ts
src/lib/auth/guard.ts
src/lib/auth/permissions.ts
src/lib/auth/operational-session.ts
```

La regla propietaria del package para esta tarea es:

```text
014
→ actor real / efectivo y published_by
```

#### 45. VISO mensual — estado del contrato físico

La migración vigente de `employee_shifts` declara conceptualmente:

```text
published_by
→ public.employees(id)
```

y describe el campo como el empleado que publicó el turno.

Ese contrato físico fija el namespace que debe respetar la aplicación.

#### 46. VISO mensual — implementación observada

La publicación mensual obtiene actualmente `user` desde el guard de acceso y escribe:

```text
published_by = user.id
```

El `user.id` observado pertenece al principal de autenticación.

El modelo canónico de Vento separa `auth_user_id` de `employee_id`.

Por tanto, el baseline no demuestra todavía que `published_by` reciba el `employee_id` canónico del actor efectivo.

#### 47. VISO mensual — contrato de corrección futura

La futura materialización de VISO deberá:

1. resolver el `AccessContext` o una proyección equivalente autorizada;
2. conservar el principal técnico real;
3. resolver `actor_effective`;
4. exigir actor `EMPLOYEE` cuando la semántica de `published_by` siga siendo la vigente;
5. escribir el `employee_id` resuelto en `published_by`;
6. conservar por separado el principal técnico en la evidencia de auditoría;
7. conservar dispositivo y actor session cuando intervengan;
8. no derivar `published_by` desde un parámetro de formulario;
9. fallar cerrado ante identidad laboral ausente o ambigua;
10. no alterar el permiso, territorio o estado para reparar una brecha de atribución.

#### 48. VISO mensual — creación de borradores

La creación de un turno deja actualmente:

```text
published_at = null
published_by = null
```

Esto es coherente con la semántica de borrador no publicado.

La autoría de creación, si el dominio la requiere, deberá conservarse mediante el campo o evento que sea propietario de esa semántica; `published_by` no se reutiliza como `created_by`.

#### 49. VISO mensual — eliminación de borrador

Eliminar un borrador no debe inventar `published_by`.

La auditoría de eliminación conserva al actor que ejecutó la acción y el estado previo del recurso mediante la evidencia de ejecución aplicable.

La distinción borrador/publicado permanece bajo `AUTH-SRV-011`.

#### 50. VISO mensual — publicación masiva

La publicación del mes puede afectar múltiples turnos.

La evidencia deberá conservar un conjunto reproducible de recursos o un descriptor determinista del lote, junto con:

- periodo mensual;
- sede validada;
- actor real y actor efectivo;
- rol y contexto aplicables;
- cantidad de turnos o bloques afectados;
- estado anterior y posterior relevante;
- decisión;
- resultado de ejecución.

La autorización de sedes y áreas permanece en `AUTH-SRV-012` y `AUTH-SRV-013`.

#### 51. VISO mensual — periodo

El periodo mensual forma parte de la identidad empresarial del comando.

La evidencia conserva el mes normalizado utilizado para seleccionar los recursos.

No se reconstruye posteriormente desde la fecha del log.

#### 52. VISO mensual — sede

La sede auditada debe ser la sede autoritativa validada para el conjunto publicado.

No se toma únicamente del filtro visual o del parámetro cliente sin el gate territorial correspondiente.

#### 53. VISO mensual — bloques

Cuando la operación se origine en bloques de planificación, la evidencia deberá conservar una representación determinista y mínima de los bloques realmente aplicados o afectados.

Puede utilizar identidades persistidas, conjuntos de turnos o un descriptor reproducible conforme al diseño físico del package.

No se exige serializar todo el payload del formulario.

#### 54. VISO mensual — motivo

Cuando el comando disponga de un motivo empresarial explícito, la evidencia conserva su código o referencia normalizada y la justificación permitida por el dominio.

No se inventa un motivo cuando el proceso no lo exige.

La política de exposición de mensajes pertenece a `AUTH-SRV-016`.

#### 55. VISO mensual — notificación

La publicación mensual invoca posteriormente la notificación hacia ANIMA.

La evidencia de ejecución debe distinguir:

```text
publication result
notification result
```

La notificación no convierte una publicación fallida en exitosa ni viceversa.

La idempotencia, recuperación y correlación funcional de la notificación permanecen bajo su contrato de integración correspondiente.

#### 56. VISO mensual — resultado de notificación

Cuando exista notificación, el evento de ejecución deberá poder correlacionar como mínimo:

- intento de notificación;
- resultado observable;
- referencia técnica no secreta cuando exista;
- relación con la versión o conjunto publicado.

`AUTH-SRV-014` no define el proveedor, cola ni mecanismo de reintento.

#### 57. VISO mensual — actor y simulación

La publicación real siempre conserva al actor real que originó o ejecutó la operación.

Si la interfaz se encuentra en modo simulación, esa simulación no puede sustituir el actor real ni escribir un sujeto simulado en `published_by`.

La regla exacta de si una simulación puede publicar y cómo registrar su rol simulado pertenece a `AUTH-SRV-015`.

#### 58. Antes y después en VISO

La publicación debe permitir demostrar:

```text
before
→ draft/unpublished set

after
→ published set with published_at and valid published_by
```

La evidencia no necesita duplicar notas, datos personales o columnas que no participen en la transición.

#### 59. Falla parcial de notificación

Una publicación persistida seguida de una notificación fallida son dos resultados distintos.

La evidencia debe reflejar la verdad de ambos hechos.

No se revierte o se declara fallida la publicación únicamente para ocultar el fallo de integración, salvo que el contrato empresarial de la integración exija atomicidad y esa política esté materializada.

#### 60. Acciones administrativas

`AUTH-SRV-014` registra quién ejecutó una acción administrativa cuando esta sea válida.

No decide si esa acción requiere turno, check-in u otro prerrequisito operativo.

Esa frontera permanece reservada a `AUTH-SRV-018`.

#### 61. Normalización de errores

La evidencia interna conserva causas y resultados estructurados suficientes para investigación.

Los códigos públicos, mensajes y traducción segura de errores pertenecen a `AUTH-SRV-016`.

#### 62. Helpers compartidos

Este contrato define qué datos deben conservarse.

No prescribe todavía un helper TypeScript, una RPC o una biblioteca concreta para recolectarlos.

La reutilización técnica entre superficies pertenece a `AUTH-SRV-017`.

#### 63. Persistencia física de auditoría

La arquitectura física de decisiones y eventos no se redefine aquí.

Se conservan los owners canónicos de auditoría, persistencia, acceso, retención, índices, pruebas y certificación.

Una unidad de `AUTH-SRV-014` debe integrarse con esas fuentes y no crear un log paralelo incompatible.

#### 64. Proyección segura

La respuesta al cliente no recibe por defecto la evidencia completa de auditoría.

Puede recibir únicamente la proyección segura definida por los contratos de autorización y errores.

La existencia de una auditoría rica no amplía exposición de:

- IDs internos;
- hashes;
- grants;
- denies;
- contexto laboral;
- dispositivo;
- datos personales.

#### 65. Lineage obligatorio

Cada futura unidad deberá conservar:

```text
surface_identity
→ principal
→ actor_effective
→ attribution_source
→ operational context when applicable
→ device/delegation when applicable
→ required_permission_key
→ resolved resource
→ validated territory
→ state/version basis
→ authorization decision
→ execution result
→ business authorship fields
→ audit/correlation evidence
```

#### 66. Materialización futura

Cada instancia:

```text
AUTH-SRV-014::<implementation_unit_id>
```

deberá registrar como mínimo:

```text
implementation_unit_id
repository
commit_before
surface_identity[]
write_operation[]
required_permission_key[]
principal_type
principal_reference
actor_type
actor_id
attribution_source
delegation_reference
device_id
actor_session_reference
base_role_when_applicable
operational_role_when_applicable
shift_reference
checkin_reference
validated_sites[]
validated_areas[]
resource_type[]
resource_identity[]
resource_version[]
state_before_summary
state_after_summary
decision_reference
correlation_reference
business_authorship_fields[]
privileged_path_usage
bulk_or_single_mode
async_or_offline_mode
notification_result_when_applicable
package_id[]
change_set
rollback
validation_commands
evidence
commit_after
```

Los nombres anteriores describen evidencia contractual. No obligan a crear columnas SQL homónimas.

#### 67. Evidencia mínima de una futura unidad

La materialización deberá demostrar, cuando aplique:

1. `auth_user_id` no se trata como `employee_id` por identidad implícita;
2. una sesión personal conserva principal y actor efectivo separados;
3. el rol no sustituye al actor;
4. un contexto operativo vincula al mismo actor efectivo;
5. una acción administrativa no fabrica actor operativo;
6. un dispositivo compartido conserva principal técnico, dispositivo y actor humano;
7. la sesión de actor del dispositivo coincide con el actor efectivo;
8. un dispositivo sin actor válido no reutiliza el actor anterior;
9. dos actores incompatibles producen estado no resuelto;
10. un sistema autónomo conserva actor SYSTEM;
11. un proceso delegado conserva principal técnico, empleado delegado y referencia de delegación;
12. `service_role` no se convierte en explicación de autoridad;
13. un actor no resuelto no recibe `employee_id` inventado;
14. una denegación conserva evidencia cuando el contrato mínimo es resoluble;
15. un fallo previo al contrato mínimo usa telemetría separada y fail closed;
16. una escritura enlaza decisión y resultado de ejecución;
17. `decision_id` y `correlation_id` no se usan como credenciales;
18. la evidencia conserva before/after mínimo cuando existe mutación;
19. reintentos no reusan decisiones obsoletas;
20. cambio de actor o contexto invalida atribución stale;
21. un lote conserva universo o descriptor reproducible;
22. una cola distingue actor originador y ejecutor técnico;
23. una intención offline se reautoriza al sincronizar;
24. datos personales descriptivos y secretos quedan fuera de la evidencia ordinaria;
25. observabilidad no sustituye auditoría empresarial;
26. una llamada directa no puede escoger `actor_id` ni autoría persistida;
27. cada campo `*_by` conserva un namespace único;
28. un campo que referencia empleado recibe `employee_id` canónico;
29. VISO conserva `published_by = null` mientras el turno siga en borrador;
30. VISO resuelve el empleado efectivo antes de publicar;
31. VISO no escribe `auth_user_id` directamente en `published_by`;
32. VISO conserva el principal técnico separado del empleado publicador;
33. VISO compartido atribuye la publicación al trabajador de la sesión de actor, no al principal técnico;
34. VISO no escribe sujeto simulado en `published_by`;
35. publicación mensual conserva periodo, sede y conjunto reproducible afectado;
36. before/after demuestra borrador frente a publicado;
37. publicación y notificación conservan resultados distintos;
38. el resultado de notificación queda correlacionable sin secretos;
39. rollback no elimina evidencia histórica legítima;
40. la evidencia puede reconstruirse sin depender de logs de texto libres.

#### 68. Rollback

El rollback de una futura unidad deberá restaurar únicamente el mecanismo técnico anterior sin:

- borrar evidencia histórica ya válida;
- reasignar eventos a otro actor;
- fusionar `principal_id` y `actor_id`;
- convertir `auth_user_id` en `employee_id` por fallback;
- reactivar una sesión de actor expirada;
- sustituir al trabajador por el dispositivo;
- sustituir al actor por un rol;
- escribir sujeto simulado en campos reales de autoría;
- convertir `service_role` en autoridad empresarial;
- eliminar correlación con la decisión;
- perder el resultado real de una mutación ya ocurrida;
- ocultar una falla de notificación posterior;
- reescribir before/after histórico;
- degradar una evidencia estructurada a logs de texto.

#### 69. Criterios de aceptación

`AUTH-SRV-014` queda documentalmente satisfecha cuando:

1. principal técnico y actor efectivo permanecen separados;
2. `auth_user_id` y `employee_id` no se consideran equivalentes;
3. actor efectivo conserva tipo, ID y fuente de atribución;
4. actor operativo se modela como contexto del actor efectivo y no como nueva identidad arbitraria;
5. roles base y operativos no sustituyen al actor;
6. una acción administrativa válida puede carecer de contexto operativo;
7. dispositivo compartido conserva principal, dispositivo, sesión de actor y humano efectivo;
8. actor ausente o ambiguo falla cerrado cuando es requerido;
9. procesos SYSTEM conservan identidad técnica y actor correctos;
10. una delegación humana es explícita y correlacionable;
11. simulación no sustituye al actor real;
12. decisión y ejecución permanecen diferenciadas;
13. una escritura puede correlacionarse con su decisión;
14. denegaciones conservan atribución disponible sin inventar actor;
15. fallos técnicos previos al contrato mínimo no producen auditoría empresarial falsa;
16. before/after conserva evidencia mínima del efecto;
17. una nueva realidad produce nueva decisión o revalidación;
18. reintentos conservan historia sin convertir la correlación en autoridad;
19. operaciones masivas conservan universo reproducible;
20. colas y offline distinguen intención, ejecución y reautorización;
21. cliente privilegiado no sustituye autorización ni atribución;
22. PII descriptiva y secretos quedan fuera de la evidencia ordinaria;
23. auditoría y observabilidad continúan separadas;
24. llamadas directas no pueden escoger actor ni campos de autoría;
25. cada campo empresarial de autoría conserva namespace único;
26. `employee_shifts.published_by` mantiene semántica de `public.employees(id)`;
27. VISO mensual identifica como brecha el uso actual del principal Auth en `published_by` sin resolución laboral demostrada;
28. la futura materialización de VISO usa el `employee_id` del actor efectivo para `published_by` bajo la semántica física vigente;
29. VISO conserva por separado el principal técnico;
30. borradores continúan con `published_by = null`;
31. simulación no publica atribuyéndose al sujeto simulado;
32. publicación mensual conserva periodo, sede, conjunto afectado y resultado;
33. publicación y notificación quedan diferenciadas y correlacionables;
34. motivo se conserva solo cuando exista contractualmente;
35. el contrato no redefine códigos públicos de error;
36. el contrato no prescribe todavía helpers compartidos;
37. el contrato no decide prerrequisitos administrativos sin turno;
38. no se autorizan cambios físicos desde el marcador global;
39. no se crean ni modifican requisitos de prueba.

#### 70. Límites

Este marcador no certifica todavía:

- implementación física de `AccessContext`;
- implementación física de persistencia de decisiones;
- esquema físico final de eventos de ejecución;
- RLS de auditoría;
- grants de consulta;
- retención, archivado o particionamiento;
- migraciones adicionales de campos `*_by`;
- implementación física de actor session en dispositivos;
- implementación física del cambio de `published_by` en VISO;
- simulación ni rol simulado;
- normalización de errores;
- helpers server compartidos;
- prerrequisitos administrativos sin turno;
- proveedor o cola de notificaciones;
- idempotencia física de notificaciones;
- despliegue;
- comportamiento productivo.

Estas responsabilidades conservan sus owners canónicos.

#### 71. Evidencia de validación

| Clase     | Estado           | Evidencia                                                                                                                                                                                                                                                                                                                                                                           |
| --------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | `NOT_EXECUTED`   | no se ejecutó build durante el desarrollo documental                                                                                                                                                                                                                                                                                                                                |
| LOCAL     | `NOT_EXECUTED`   | no se ejecutaron comandos contra el checkout del usuario                                                                                                                                                                                                                                                                                                                            |
| REMOTA    | `PASS`           | se auditaron en solo lectura la continuidad vigente, la topología `PER_IMPLEMENTATION_UNIT`, el owner de `AUTH-SRV-014`, los contratos canónicos de principal, actor efectivo, dispositivo y auditoría, los fragmentos 04A AUTH/VISO, el snapshot vigente de VISO mensual y la migración vigente que define `employee_shifts.published_by` como referencia a `public.employees(id)` |
| OPERATIVA | `NOT_APPLICABLE` | el marcador no cambia operación real                                                                                                                                                                                                                                                                                                                                                |
| FÍSICA    | `NOT_APPLICABLE` | no existe instancia física autorizada para esta tarea                                                                                                                                                                                                                                                                                                                               |

#### 72. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Justificación:** la atribución separada de principal y actor, la identificación del trabajador en dispositivo compartido, la evidencia correlacionable de decisiones y acciones protegidas y la auditoría de `published_by` en VISO ya disponen de requisitos canónicos vigentes. `AUTH-SRV-014` materializa el contrato de enforcement y ejecución que consumirá esa cobertura sin crear una obligación verificable nueva.

#### 73. Cobertura de prueba vigente reutilizada

Se reutiliza sin modificar el registro vigente:

- `TREQ-AUTH-004` — la decisión debe ser equivalente para el mismo principal, actor, simulación, permiso, territorio y contexto;
- `TREQ-AUTH-011` — en dispositivo compartido la acción conserva dispositivo, principal y trabajador identificado sin transferir privilegios administrativos;
- `TREQ-AUTH-013` — toda mutación valida principal y actor efectivos en servidor junto con permiso, territorio, contexto y estado;
- `TREQ-AUTH-014` — cambios de trabajador, turno, área, dispositivo, rol o asignación invalidan contexto y decisiones derivadas;
- `TREQ-AUTH-015` — toda decisión y acción protegida conserva evidencia correlacionable de principal, actor efectivo, rol, turno, check-in, sede, área, dispositivo, permiso, recurso, decisión, razones, versión y timestamp;
- `TREQ-VISO-043` — la auditoría de programación conserva actor real, actor efectivo, simulación, versión, política y `published_by`.

Estas referencias son trazabilidad heredada y no representan requisitos creados o modificados por `AUTH-SRV-014`.

#### 74. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-SRV-013 — Evitar operaciones entre áreas no autorizadas`

**TAREA ACTUAL APROBADA**
`AUTH-SRV-014 — Registrar actor real y actor operativo`

**SIGUIENTE TAREA RESERVADA**
`AUTH-SRV-015 — Registrar rol simulado en auditoría`


### ✅ AUTH-SRV-015 — Registrar rol simulado en auditoría

**Estado:** APROBADA
**Tarea anterior:** AUTH-SRV-014 — Registrar actor real y actor operativo
**Tarea siguiente:** AUTH-SRV-016 — Normalizar errores de autorización
**Tipo de tarea:** Contrato global con materialización por unidad (`PER_IMPLEMENTATION_UNIT`) — contrato de enforcement y evidencia para que toda evaluación de simulación resuelta en servidor conserve de forma tipada el actor y la sesión reales, el sujeto simulado cuando exista, el rol simulado exacto, el contexto hipotético, el resultado no ejecutable y sus versiones, razones y fingerprints, sin convertir autoridad simulada en permiso, sesión, actor, territorio, recurso, autoría empresarial ni efecto real
**Bloque:** BLOQUE J — Protección de acciones de servidor
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/J_ACCIONES_DE_SERVIDOR/03_AUDITORIA_ERRORES_Y_HELPERS_COMPARTIDOS.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global; las futuras materializaciones ocurren únicamente mediante `AUTH-SRV-015::<implementation_unit_id>` después de que `DELIV-PKG-025::<package_id>` asigne la unidad y el paquete propietario supere `E5-GATE-008::<package_id>`
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el contrato obligatorio de servidor para registrar de forma inequívoca el rol y el sujeto simulados dentro de la evidencia de una simulación, preservando simultáneamente la identidad y autoridad reales fijadas por `AUTH-SRV-014`.

La regla vinculante queda:

```text
principal técnico real
+
actor efectivo real
+
sesión real
+
autoridad real
+
solicitud de simulación válida
+
sujeto simulado cuando exista
+
rol simulado tipado
+
contexto hipotético completo cuando aplique
+
resultado simulado no ejecutable
+
razones + versiones + fingerprints
=
evidencia de simulación reproducible
```

Y siempre:

```text
actor real
≠
sujeto simulado
≠
rol simulado
≠
autoridad ejecutable
```

#### 2. Handoff recibido de `AUTH-SRV-014`

`AUTH-SRV-014` deja disponible para toda acción o decisión protegida:

```text
principal técnico real
actor efectivo real
fuente de atribución
contexto operativo real cuando aplique
dispositivo o delegación cuando aplique
required_permission_key
recurso resuelto
territorio validado
estado o versión
decisión de autorización
resultado de ejecución
correlación
campos empresariales de autoría
```

`AUTH-SRV-015` no reabre esa atribución.

La simulación se adjunta como un plano separado y nunca sustituye al actor efectivo real.

#### 3. Base contractual de simulación consumida

La tarea consume sin redefinir los contratos ya aprobados de `AUTH-SIM-001..006`:

```text
AUTH-SIM-001
→ quién puede solicitar una simulación

AUTH-SIM-002
→ roles objetivo simulables e identidad tipada

AUTH-SIM-003
→ sede simulada

AUTH-SIM-004
→ área simulada

AUTH-SIM-005
→ turno y check-in simulados

AUTH-SIM-006
→ separación estricta entre autoridad real y simulada
```

La implementación de servidor deberá aplicar esos contratos como entradas normativas.

#### 4. Pregunta contractual propietaria

Esta tarea responde:

```text
¿QUÉ ROL O SUJETO SE ESTABA EVALUANDO HIPOTÉTICAMENTE?
```

```text
¿QUIÉN ERA EL ACTOR REAL QUE SOLICITÓ ESA EVALUACIÓN?
```

```text
¿QUÉ RESULTADO HIPOTÉTICO PRODUJO EL SERVIDOR Y BAJO QUÉ VERSIÓN DEL CONTEXTO?
```

```text
¿SE MANTUVO IMPOSIBLE CONVERTIR ESE RESULTADO EN AUTORIDAD O EFECTO REAL?
```

#### 5. Frontera con `AUTH-SRV-016..018`

Las responsabilidades permanecen separadas:

```text
AUTH-SRV-015
→ rol/sujeto simulado y evidencia autoritativa de simulación

AUTH-SRV-016
→ códigos y respuestas públicas estables de autorización

AUTH-SRV-017
→ helpers server compartidos

AUTH-SRV-018
→ prerrequisitos explícitos de acciones administrativas sin turno
```

`AUTH-SRV-015` no define mensajes públicos, no prescribe todavía un helper compartido y no decide si una capacidad administrativa exige turno.

#### 6. Cuatro planos obligatoriamente separados

Toda implementación deberá conservar cuatro planos:

```text
1. AUTORIDAD REAL
2. EVALUACIÓN SIMULADA
3. PRESENTACIÓN / PREVIEW
4. AUDITORÍA
```

Solo el plano de autoridad real puede producir un `ALLOW` ejecutable.

Los otros tres planos no conceden autoridad empresarial.

#### 7. Identidades reales y simuladas

La separación mínima queda:

| Plano real               | Plano simulado                 | Regla                                                   |
| ------------------------ | ------------------------------ | ------------------------------------------------------- |
| `real_actor_id`          | `simulated_subject_reference`  | el sujeto simulado no reemplaza al actor real           |
| `real_session_id`        | `simulation_session_id`        | la sesión de simulación no autentica                    |
| `real_base_role`         | `simulated_base_role`          | el rol base simulado no se vuelve efectivo              |
| `real_operational_role`  | `simulated_operational_role`   | el rol operativo simulado no autoriza operación         |
| `real_site_ids`          | `simulated_site_id`            | la sede simulada no amplía cobertura real               |
| `real_area_ids`          | `simulated_area_id`            | el área simulada no amplía cobertura real               |
| `real_active_shift_id`   | `simulated_shift_reference`    | el turno simulado no satisface prerrequisitos reales    |
| `real_active_checkin_id` | `simulated_checkin_state`      | el check-in simulado no crea presencia                  |
| `real_permission_key`    | `target_permission_key`        | la clave evaluada no queda concedida                    |
| `real_resource_scope`    | `simulated_resource_reference` | el recurso hipotético no amplía lectura real            |
| `real_decision`          | `simulation_result`            | `ALLOW` y `WOULD_ALLOW` pertenecen a dominios distintos |

#### 8. Actor real obligatorio

Toda solicitud de simulación interactiva deberá conservar un actor humano real resuelto desde una sesión personal válida y un contexto real autoritativo.

El servidor no podrá usar como actor real:

```text
simulated_subject_reference
simulated_role_code
technical_principal_id
shared_device_id
navigation_role
target employee enviado por cliente
```

La elegibilidad del simulador se evalúa antes de aceptar el escenario hipotético.

#### 9. Principal técnico

El principal técnico real se conserva como parte de la evidencia de atribución, pero no se convierte automáticamente en simulador humano.

Una sesión de simulación no puede iniciarse únicamente desde:

```text
SHARED_DEVICE
SYSTEM_SERVICE
ANONYMOUS
cuenta compartida
service role
integración técnica
```

cuando no exista el actor humano personal exigido por el contrato de simulación.

#### 10. Sujeto simulado

`simulated_subject_reference` representa el sujeto hipotético o explícito sobre el que se evalúa el escenario cuando esa dimensión exista.

No es:

```text
actor_effective
employee_id real ejecutor
principal técnico
propietario del recurso por defecto
autor empresarial
```

Puede ser `null` únicamente cuando el tipo de simulación no requiera un sujeto explícito y el contrato aplicable lo permita.

#### 11. Rol simulado tipado

Toda referencia de rol simulada deberá conservar como mínimo:

```text
role_kind
role_code
role_catalog_version
role_matrix_version
```

`role_kind` distingue obligatoriamente:

```text
BASE
OPERATIONAL
```

Un `role_code` sin `role_kind` no constituye una identidad simulada suficiente.

#### 12. Prohibición de rol ambiguo

Queda prohibido resolver un rol simulado únicamente desde:

```text
label visible
nombre humano
alias legacy
role_code bare
navigation_role
ruta
área
sede
employee_id
valor cliente
```

Si dos catálogos contienen el mismo código, la identidad tipada decide el significado.

Una referencia ambigua produce fallo cerrado del escenario.

#### 13. Roles base simulados

Un rol base simulado representa únicamente la hipótesis:

```text
"¿qué ocurriría si el sujeto evaluado tuviera este rol base bajo este escenario?"
```

No altera:

```text
rol base real
matriz real del actor
grants reales
denies reales
sesión real
RLS
claims
```

La disponibilidad física y canónica del rol se valida contra las versiones exigidas por `AUTH-SIM-002`.

#### 14. Roles operativos simulados

Un rol operativo simulado requiere el contexto hipotético que el contrato de la acción necesite.

El rol aislado no puede producir por sí solo:

```text
WOULD_ALLOW
```

cuando faltan sede, área, turno, check-in, permiso, recurso o cualquier otro prerrequisito obligatorio.

La ausencia contextual produce `INDETERMINATE` o `WOULD_DENY` según corresponda al contrato.

#### 15. Roles legacy, deprecados y desconocidos

No se permite convertir automáticamente en rol simulable:

```text
rol legacy
rol deprecado
rol retirado
rol inactivo
rol desconocido
rol futuro no aprobado
```

No existe migración implícita por semejanza textual.

El servidor falla cerrado y conserva una razón estructurada.

#### 16. Colisiones de catálogo

Una colisión como:

```text
BASE/bodeguero
OPERATIONAL/bodeguero
```

representa dos identidades distintas.

Nunca se resolverá mediante:

```text
role_code = bodeguero
→ elegir el primero encontrado
```

La evidencia deberá conservar `role_kind` y las versiones utilizadas para evitar reinterpretación posterior.

#### 17. Solicitud de simulación

La evaluación de servidor deberá vincularse a una identidad de solicitud:

```text
simulation_request_id
```

La solicitud identifica el intento lógico de simulación.

No funciona como:

```text
bearer token
permiso
actor
sesión autenticada
idempotency key de una mutación real
```

#### 18. Sesión de simulación

Cuando exista una sesión de preview:

```text
simulation_session_id
```

deberá permanecer separada de la sesión autenticada real.

La sesión simulada:

```text
no autentica
no concede RLS
no concede permisos
no cambia claims
no puede ejecutar mutaciones
no reemplaza real_session_id
```

#### 19. Elegibilidad del simulador

Antes de evaluar el rol simulado, el servidor deberá comprobar desde fuentes reales:

```text
actor humano efectivo
sesión personal real válida
viso.access efectivo
viso.authorization.context_simulations.view efectivo
carril base real
alcance real suficiente
justificación válida
reautenticación fuerte cuando aplique
ausencia de denegaciones
contexto real no simulado
```

Un componente ausente, ambiguo o incompatible produce `DENY`.

#### 20. La simulación no se autoautoriza

El rol o sujeto simulado no puede aportar:

```text
viso.access
viso.authorization.context_simulations.view
alcance del simulador
reautenticación
identidad real
carril real
```

Todos esos prerrequisitos se resuelven desde la autoridad real anterior a la simulación.

#### 21. Alcance real como techo

La simulación nunca amplía la capacidad de inspección del solicitante.

Debe cumplirse:

```text
alcance solicitado
⊆
alcance real autorizado del simulador
```

La regla aplica, según el escenario, a:

```text
sujeto
organización
sede
área
permiso
acción
recurso
```

`null`, ausencia o valor desconocido no significan alcance global.

#### 22. Sede simulada

Cuando el escenario requiera sede, el servidor deberá conservar una referencia territorial tipada y validada conforme a `AUTH-SIM-003`.

La sede simulada no puede derivarse únicamente de:

```text
filtro visual
sede primaria
sede seleccionada
preferencia del empleado
única sede visible
valor cliente
```

Una sede simulada no modifica ni sustituye la sede real del actor.

#### 23. Área simulada

Cuando el escenario requiera área, el servidor deberá conservar la identidad exacta del área, su sede padre, clase y versiones compatibles.

Queda prohibido usar como área exacta:

```text
agregado "todos"
GENERAL agregado
fallback por única área
área de dispositivo
área seleccionada
área real del actor cuando falta la simulada
```

La ausencia de un área obligatoria no se completa desde el plano real.

#### 24. Turno simulado

Cuando el escenario requiera turno, la evidencia deberá distinguir el modo aprobado por `AUTH-SIM-005` y conservar la referencia reproducible aplicable.

Un turno real no completa automáticamente un turno simulado ausente.

Un turno simulado no satisface un prerrequisito real de ejecución.

#### 25. Check-in simulado

El check-in hipotético pertenece exclusivamente al escenario.

No puede reutilizarse como:

```text
active_checkin real
presencia real
prueba de dispositivo
prerrequisito de mutación
evidencia de asistencia
```

El check-in real tampoco completa un escenario simulado incompleto.

#### 26. Recurso y acción simulados

Cuando la evaluación sea sobre una acción concreta deberán conservarse:

```text
target_permission_key
simulated_action_reference
simulated_resource_reference
```

El servidor debe distinguir:

```text
vista de matriz o navegación
≠
evaluación concreta de acción
```

Una vista general sin contexto suficiente nunca produce un permiso ejecutable.

#### 27. Resultado simulado

Los únicos resultados de autorización simulada permitidos son:

```text
WOULD_ALLOW
WOULD_DENY
INDETERMINATE
```

Toda respuesta simulada deberá declarar:

```text
executable = false
```

Quedan prohibidos para el resultado simulado:

```text
ALLOW
can_operate = true
can_execute = true
authorized = true ambiguo
token ejecutable
booleano de permiso sin procedencia
```

#### 28. `WOULD_ALLOW` no es autoridad

La equivalencia queda prohibida:

```text
WOULD_ALLOW
=
ALLOW
```

`WOULD_ALLOW` significa únicamente que, bajo el escenario hipotético completo y la versión evaluada, la decisión simulada resultaría positiva.

No autoriza ningún efecto real.

#### 29. `INDETERMINATE`

`INDETERMINATE` se utiliza cuando falta evidencia suficiente para construir un escenario hipotético reproducible.

No se degrada a:

```text
WOULD_ALLOW por conveniencia
WOULD_DENY genérico para ocultar brechas
ALLOW real
```

La evidencia conserva la razón estructurada de indeterminación.

#### 30. Contrato de auditoría mínimo

Cada evaluación deberá conservar un envelope equivalente en semántica a:

```text
audit_event_id
real_actor_id
real_session_id
real_authority_decision
real_permission_key
real_scope_reference
simulation_request_id
simulation_session_id
simulated_subject_reference
simulated role identity
target_permission_key
simulated_action_reference
simulated_resource_reference
simulation_result
executable=false
real_reason_codes
simulated_reason_codes
real_context_fingerprint
scenario_fingerprint
policy_version
evaluated_at
simulated_resolved_at
```

Los nombres físicos pueden variar si preservan inequívocamente estas identidades y relaciones.

#### 31. Identidad de rol dentro de la auditoría

La expresión `simulated role identity` del envelope anterior debe materializar como mínimo:

```text
simulated_role_kind
simulated_role_code
role_catalog_version
role_matrix_version
```

Si el escenario diferencia rol base y operativo en campos separados, la evidencia deberá conservar cuál de ellos fue evaluado y no fusionarlos en un único valor ambiguo.

#### 32. Versiones

La evidencia de simulación deberá conservar las versiones autoritativas necesarias para reproducir la decisión.

Según el escenario incluyen:

```text
role catalog
role matrix
site catalog
area catalog
shift snapshot o revisión
permission catalog
policy version
contract version
```

No se reconstruye una decisión histórica usando automáticamente las versiones actuales.

#### 33. Fingerprints

La evidencia deberá distinguir:

```text
real_context_fingerprint
scenario_fingerprint
```

El primero representa el contexto real utilizado para determinar elegibilidad y techo de acceso.

El segundo representa el escenario hipotético evaluado.

No son intercambiables.

#### 34. Tiempo real y tiempo simulado

Se conservan separados:

```text
evaluated_at
simulated_resolved_at
```

Cuando un escenario evalúe otro instante, ese tiempo hipotético no modifica el reloj ni el estado reales.

La zona horaria y reglas temporales aplicables deben permanecer reproducibles.

#### 35. Razones reales y simuladas

La evidencia separa:

```text
real_reason_codes
simulated_reason_codes
```

Una causa que deniega al simulador real no se presenta como una conclusión sobre el rol simulado.

Una causa hipotética no se utiliza para negar o conceder autoridad real fuera de la simulación.

#### 36. Denegación de entrada a simulación

Si el solicitante real no está autorizado para simular:

```text
real_authority_decision = DENY
simulation_result = no evaluado
no efecto empresarial
```

La auditoría conserva la solicitud mínima autorizada, las razones reales y la correlación permitida.

No se fabrica un escenario completo para un solicitante que no puede inspeccionarlo.

#### 37. Escenario inválido después de entrada válida

Si el simulador real es elegible pero el rol, sede, área, turno, sujeto o recurso son inválidos o incompletos:

```text
autoridad real para usar el simulador
puede permanecer válida

resultado hipotético
=
WOULD_DENY o INDETERMINATE
```

Las dos decisiones permanecen separadas.

#### 38. Lectura de datos reales

Toda lectura de filas, documentos o recursos reales necesaria para construir el preview permanece gobernada exclusivamente por la autoridad real.

Queda prohibido:

```text
simulated role
+
simulated territory
→ ampliar RLS o filas reales visibles
```

El servidor minimiza los datos expuestos al escenario.

#### 39. Mutaciones y efectos reales

Toda superficie mutante deberá rechazar autoridad simulada antes del primer efecto.

Incluye:

```text
Server Actions
Route Handlers
API routes
RPC
Data API
RLS que participe en la decisión
Edge Functions
jobs
colas
webhooks
integraciones
exportaciones
impresiones
notificaciones
Realtime cuando implique acceso protegido
clientes nativos
operaciones offline sincronizadas
```

El escenario hipotético nunca se convierte en payload de autoridad.

#### 40. Acción real después de una simulación

Ejecutar una acción real después de consultar un preview exige:

```text
salir o cerrar la vista previa
+
descartar autoridad y contexto simulados
+
emitir una nueva solicitud real
+
resolver nuevamente actor
+
resolver nuevamente permiso
+
resolver nuevamente territorio
+
resolver nuevamente estado y versión
+
autorizar desde cero
```

La simulación no funciona como preautorización.

#### 41. Reintentos

Un reintento de simulación puede conservar correlación cuando pertenezca al mismo análisis lógico, pero debe producir una evaluación nueva si cambió:

```text
actor real
sesión
alcance
rol objetivo
sujeto
sede
área
turno
recurso
permiso
catálogo
matriz
política
snapshot
```

Una decisión simulada anterior no se reutiliza como autoridad.

#### 42. Idempotencia y replay

Una identidad o clave usada para un preview no podrá reutilizarse como idempotency key de una mutación real.

Queda prohibido:

```text
simulation request
→ replay automático
→ efecto real
```

Una ejecución posterior usa su propia identidad y autorización real.

#### 43. Offline y colas

Un preview conservado offline no mantiene autoridad vigente.

Al reconectarse:

```text
contexto real
se revalida

escenario simulado
se revalida o expira

acción real
requiere autorización nueva
```

Un worker técnico nunca convierte un resultado simulado en autorización empresarial.

#### 44. Preview y controles de interfaz

Un control mostrado por un escenario `WOULD_ALLOW` pertenece exclusivamente a la superficie de preview.

No debe conservar:

```text
handler de negocio activo
deep link ejecutable privilegiado
token de mutación
guard alimentado por WOULD_ALLOW
```

La interfaz real continúa gobernada por autoridad real.

#### 45. Auditoría empresarial y observabilidad

Se conserva:

```text
simulation business audit
≠
application logs
≠
metrics
≠
traces
```

Pueden compartir:

```text
correlation_id
```

La observabilidad no reemplaza el envelope de simulación.

#### 46. Minimización de datos

La auditoría de simulación no almacena por defecto:

```text
tokens
cookies
contraseñas
OTP
API keys
headers completos
documentos sensibles completos
payloads completos
datos médicos completos
PII descriptiva innecesaria
```

Se conservan identificadores, referencias, versiones, fingerprints y razones suficientes para reproducir y explicar la decisión.

#### 47. Historial inmutable

Una evaluación histórica no se reinterpreta con:

```text
rol actual
matriz actual
catálogo actual
territorio actual
turno actual
política actual
```

Un cambio posterior produce una nueva evaluación.

La evidencia histórica conserva las versiones originales utilizadas.

#### 48. Cambio del actor real

Si cambia el actor humano real:

```text
old simulation session
≠
new actor authority
```

La simulación previa no se transfiere.

Debe cerrarse o invalidarse conforme al contrato de ciclo de vida y requerirse una nueva autorización real.

#### 49. Dispositivo compartido

Un dispositivo compartido puede formar parte del contexto técnico desde el cual se presenta una superficie, pero no se convierte por ello en simulador humano.

Si una futura implementación habilita simulación desde una estación compartida, deberá existir una sesión personal humana inequívoca y controles expresamente aprobados.

Hasta entonces, la ausencia de identidad personal suficiente falla cerrada.

#### 50. Campos empresariales `*_by`

Los campos reales de autoría:

```text
created_by
updated_by
approved_by
published_by
cancelled_by
```

nunca reciben:

```text
simulated_subject_reference
simulated_role_code
simulation_request_id
simulation_session_id
```

La simulación pertenece a la evidencia de preview, no a la autoría de un efecto empresarial real.

#### 51. VISO mensual — regla de publicación

Para la publicación mensual de programación laboral queda:

```text
SIMULATION ACTIVE
+
publishMonthAction real
=
NO EFECTO EMPRESARIAL
```

El preview puede evaluar hipotéticamente si una capacidad resultaría permitida, pero no puede publicar turnos.

La publicación real exige salir de simulación y reautorizar la operación desde el contexto real.

#### 52. VISO mensual — `published_by`

Cuando una publicación real sea finalmente autorizada:

```text
published_by
=
employee_id canónico del actor efectivo real
```

bajo la semántica física vigente.

Queda prohibido:

```text
published_by = simulated_subject_reference
published_by = simulated_role_code
published_by = simulation_request_id
published_by = auth_user_id sin resolución laboral
```

El rol simulado se conserva únicamente en la auditoría de la evaluación hipotética.

#### 53. VISO mensual — borradores

Crear o revisar un borrador dentro de una vista simulada no convierte la simulación en autoría.

Mientras un turno permanezca sin publicar:

```text
published_at = null
published_by = null
```

La simulación no se usa para poblar esos campos.

#### 54. VISO mensual — periodo, sede y conjunto

Una evaluación simulada sobre publicación mensual deberá conservar de forma reproducible:

```text
periodo mensual normalizado
sede simulada exacta cuando aplique
rol simulado tipado
sujeto simulado cuando exista
conjunto o descriptor reproducible de turnos
target_permission_key
scenario_fingerprint
resultado hipotético
```

La existencia del preview no autoriza lectura o publicación fuera del alcance real del simulador.

#### 55. VISO mensual — notificación

Una simulación de publicación no genera notificación empresarial hacia ANIMA ni hacia otro consumidor.

Puede representar en el preview que una notificación sería parte del efecto esperado, pero:

```text
preview
≠
notification attempt
```

Solo una publicación real ejecutada puede producir un resultado real de notificación.

#### 56. Llamada directa o manipulada

Una llamada directa que envíe:

```text
simulated_role_code
simulated_subject_reference
simulation_request_id
simulation_session_id
simulated_site_id
simulated_area_id
simulated_shift_reference
```

no convierte esos datos en hechos autoritativos.

El servidor valida y resuelve el escenario contra las fuentes canónicas y el techo real del simulador.

#### 57. Prohibición de contexto efectivo único

Queda prohibido un modelo equivalente a:

```text
effective_context =
real_context o simulated_context
```

si el mismo resultado puede ser consumido por operaciones reales.

También quedan prohibidos nombres ambiguos como:

```text
effective_role
effective_permission
effective_context
can_operate
```

para representar indistintamente valores reales y simulados.

#### 58. Contratos compartidos futuros

`AUTH-SRV-015` define la semántica de servidor que deberá respetarse.

No prescribe todavía:

```text
nombre del helper TypeScript
módulo compartido
RPC concreta
SDK concreto
middleware concreto
adapter concreto
```

La reutilización técnica pertenece a `AUTH-SRV-017` y a los owners físicos correspondientes.

#### 59. Normalización de errores

La evidencia conserva razones internas estructuradas y distingue autoridad real de resultado simulado.

Los códigos públicos, status HTTP, mensajes seguros y traducción entre canales pertenecen a `AUTH-SRV-016` y a los contratos `AUTH-ERR-*`.

Esta tarea no crea códigos públicos alternativos.

#### 60. Acciones administrativas sin turno

La ausencia de turno real en una capacidad administrativa no se corrige fabricando un turno simulado.

`AUTH-SRV-018` conserva la decisión especializada sobre prerrequisitos administrativos.

La simulación únicamente evalúa el contrato que resulte aplicable.

#### 61. Persistencia física

La arquitectura física de persistencia de simulación y auditoría no se redefine aquí.

Las futuras unidades deberán integrarse con los owners canónicos de:

```text
persistencia
RLS
grants
índices
retención
versionado
auditoría
contratos compartidos
certificación
```

No se creará un log paralelo incompatible.

#### 62. Lineage obligatorio

Cada futura unidad deberá conservar:

```text
surface_identity
→ principal real
→ actor efectivo real
→ real_session_id
→ real authority
→ simulation_request_id
→ simulation_session_id when applicable
→ simulated_subject_reference when applicable
→ simulated_role_kind
→ simulated_role_code
→ role versions
→ simulated site/area/shift when applicable
→ target_permission_key
→ simulated action/resource
→ simulation_result
→ executable=false
→ real reasons
→ simulated reasons
→ fingerprints
→ policy/contract versions
→ timestamps
→ audit/correlation evidence
```

#### 63. Materialización futura

Cada instancia:

```text
AUTH-SRV-015::<implementation_unit_id>
```

deberá registrar como mínimo:

```text
implementation_unit_id
repository
commit_before
surface_identity[]
simulation_entry_surface[]
real_principal_type
real_principal_reference
real_actor_type
real_actor_id
real_session_reference
real_permission_key[]
real_scope_reference[]
simulation_request_reference[]
simulation_session_reference[]
simulated_subject_reference[]
simulated_role_kind[]
simulated_role_code[]
role_catalog_version[]
role_matrix_version[]
simulated_site_reference[]
simulated_area_reference[]
simulated_shift_reference[]
simulated_checkin_state[]
target_permission_key[]
simulated_action_reference[]
simulated_resource_reference[]
simulation_result[]
real_reason_codes[]
simulated_reason_codes[]
real_context_fingerprint[]
scenario_fingerprint[]
policy_version[]
evaluated_at[]
simulated_resolved_at[]
blocked_real_effect_surface[]
business_authorship_fields[]
package_id[]
change_set
rollback
validation_commands
evidence
commit_after
```

Los nombres anteriores describen evidencia contractual y no obligan a crear columnas SQL homónimas.

#### 64. Evidencia mínima de una futura unidad

La materialización deberá demostrar, cuando aplique:

1. el actor real permanece separado del sujeto simulado;
2. el principal técnico no se convierte en simulador humano;
3. la simulación exige sesión personal real cuando corresponda;
4. el permiso para simular se resuelve desde autoridad real;
5. el rol simulado no aporta el permiso para iniciar simulación;
6. `role_kind` y `role_code` forman una identidad tipada;
7. un código bare ambiguo falla cerrado;
8. roles legacy no se convierten por alias;
9. roles deprecados, inactivos o desconocidos fallan cerrado;
10. un rol base simulado no modifica el rol base real;
11. un rol operativo simulado no sustituye al rol operativo real;
12. un rol operativo aislado no produce `WOULD_ALLOW` si falta contexto obligatorio;
13. sede simulada y sede real permanecen separadas;
14. área simulada y área real permanecen separadas;
15. un área agregada no se convierte en wildcard;
16. un turno real no completa un escenario simulado;
17. un turno simulado no satisface un prerrequisito real;
18. un check-in real no completa un check-in simulado;
19. un check-in simulado no crea presencia real;
20. el alcance simulado nunca excede el alcance real del solicitante;
21. `WOULD_ALLOW` nunca se convierte en `ALLOW`;
22. toda respuesta simulada declara `executable=false`;
23. no existe booleano ambiguo consumible por guards reales;
24. `INDETERMINATE` conserva una razón estructurada;
25. la lectura de datos reales usa autoridad real;
26. RLS no consume territorio ni rol simulados como autoridad;
27. una mutación rechaza procedencia simulada antes del primer efecto;
28. Server Actions y API routes aplican la misma separación;
29. RPC y Edge Functions aplican la misma separación;
30. jobs, colas e integraciones no ejecutan desde `WOULD_ALLOW`;
31. una operación offline se reautoriza al sincronizar;
32. una acción real posterior a preview exige solicitud nueva;
33. una idempotency key de preview no se reutiliza para una mutación real;
34. la auditoría conserva decisión real y resultado simulado por separado;
35. la auditoría conserva identidad tipada del rol simulado;
36. la auditoría conserva versiones y fingerprints suficientes;
37. una decisión histórica no se reinterpreta con catálogos actuales;
38. secretos y PII innecesaria quedan fuera de la auditoría ordinaria;
39. cambiar de actor invalida la simulación previa;
40. un dispositivo compartido sin actor personal suficiente no inicia simulación;
41. ningún campo `*_by` recibe sujeto o rol simulado;
42. VISO no publica mientras la autoridad consumida sea simulada;
43. VISO no escribe sujeto simulado en `published_by`;
44. una publicación real posterior usa el empleado efectivo real;
45. un borrador no inventa `published_by`;
46. una simulación de publicación no dispara notificaciones empresariales;
47. una llamada directa no puede fabricar la identidad simulada autoritativa;
48. contexto real y simulado usan contratos separados;
49. observabilidad no sustituye auditoría de simulación;
50. rollback conserva evidencia histórica legítima.

#### 65. Rollback

El rollback de una futura unidad deberá restaurar únicamente el mecanismo técnico anterior sin:

- fusionar actor real y sujeto simulado;
- convertir el rol simulado en rol efectivo;
- convertir `WOULD_ALLOW` en `ALLOW`;
- reintroducir `can_operate=true` desde simulación;
- permitir que RLS consuma contexto simulado;
- reutilizar una sesión simulada como autenticación;
- transferir simulación entre actores;
- utilizar contexto real para completar silenciosamente un escenario incompleto;
- utilizar contexto simulado para completar autorización real;
- escribir sujeto o rol simulado en campos reales `*_by`;
- borrar evidencia histórica válida;
- perder versiones o fingerprints de una evaluación histórica;
- convertir logs de texto en sustituto de la auditoría estructurada;
- reactivar una mutación que antes estaba bloqueada bajo simulación;
- disparar efectos pendientes desde una simulación antigua.

#### 66. Criterios de aceptación

`AUTH-SRV-015` queda documentalmente satisfecha cuando:

1. actor real, sujeto simulado y rol simulado permanecen inequívocamente separados;
2. el principal técnico no se confunde con el simulador humano;
3. se conserva `real_session_id` separado de `simulation_session_id`;
4. el rol simulado usa identidad tipada y versionada;
5. roles base y operativos se distinguen;
6. colisiones de códigos se resuelven por tipo y no por orden;
7. roles legacy no se convierten automáticamente;
8. roles deprecados, inactivos, retirados, desconocidos o futuros no aprobados fallan cerrado;
9. la elegibilidad del simulador se resuelve exclusivamente desde autoridad real;
10. la simulación no puede autoautorizarse;
11. el alcance real es techo del escenario;
12. sede, área, turno y check-in simulados permanecen separados de sus equivalentes reales;
13. ausencia de contexto obligatorio no se completa mediante fallback entre planos;
14. la evaluación concreta conserva permiso, acción y recurso;
15. los únicos resultados simulados son `WOULD_ALLOW`, `WOULD_DENY` e `INDETERMINATE`;
16. todo resultado simulado declara `executable=false`;
17. `WOULD_ALLOW` nunca equivale a `ALLOW`;
18. las razones reales y simuladas permanecen separadas;
19. la auditoría conserva las identidades del rol simulado;
20. la auditoría conserva actor y sesión reales;
21. la auditoría conserva versiones, fingerprints y tiempos;
22. las decisiones históricas no se reinterpretan con estado actual;
23. la lectura de datos reales continúa bajo autoridad real;
24. RLS no amplía filas por simulación;
25. toda mutación rechaza autoridad simulada antes del efecto;
26. una acción real posterior exige solicitud y autorización nuevas;
27. reintentos y replay no convierten preview en autoridad;
28. offline y colas revalidan antes de cualquier efecto;
29. controles de preview no conservan handlers empresariales ejecutables;
30. auditoría y observabilidad continúan separadas;
31. secretos y PII innecesaria quedan fuera de la evidencia ordinaria;
32. campos empresariales `*_by` nunca reciben sujeto o rol simulados;
33. VISO mensual no publica desde simulación;
34. una publicación real de VISO conserva `published_by` con el actor efectivo real bajo el namespace físico vigente;
35. borradores mantienen `published_by = null` mientras no estén publicados;
36. una simulación de publicación no dispara notificaciones empresariales;
37. el contrato no redefine mensajes públicos de error;
38. el contrato no prescribe todavía helpers compartidos;
39. el contrato no redefine prerrequisitos administrativos sin turno;
40. no se autorizan cambios físicos desde el marcador global;
41. no se crean ni modifican requisitos de prueba.

#### 67. Límites

Este marcador no certifica todavía:

- implementación física de servicios de simulación;
- implementación física de `SimulationContext`;
- implementación física de persistencia de auditoría de simulación;
- RLS específica de auditoría;
- grants de consulta;
- retención o particionamiento;
- migración de resolvers legacy;
- retiro físico de `can_operate`;
- contratos TypeScript compartidos;
- helpers server compartidos;
- UI de preview;
- ciclo de vida completo de sesión simulada;
- mensajes públicos de bloqueo;
- normalización de errores;
- prerrequisitos administrativos sin turno;
- cambio físico de `published_by` en VISO;
- despliegue;
- comportamiento productivo.

Estas responsabilidades conservan sus owners canónicos.

#### 68. Evidencia de validación

| Clase     | Estado           | Evidencia                                                                                                                                                                                                                                                                                                                                                 |
| --------- | ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | `NOT_EXECUTED`   | no se ejecutó build durante el desarrollo documental                                                                                                                                                                                                                                                                                                      |
| LOCAL     | `NOT_EXECUTED`   | no se ejecutaron comandos contra el checkout del usuario                                                                                                                                                                                                                                                                                                  |
| REMOTA    | `PASS`           | se auditaron en solo lectura la continuidad vigente, el contrato de entrega, la topología `PER_IMPLEMENTATION_UNIT`, las políticas de formato y desarrollo, el owner de `AUTH-SRV-015`, `AUTH-SRV-014`, los contratos aprobados `AUTH-SIM-001..006`, la familia 04A AUTH relevante, el contrato de `AccessContext` y los scripts documentales disponibles |
| OPERATIVA | `NOT_APPLICABLE` | el marcador no cambia operación real                                                                                                                                                                                                                                                                                                                      |
| FÍSICA    | `NOT_APPLICABLE` | no existe instancia física autorizada para esta tarea                                                                                                                                                                                                                                                                                                     |

#### 69. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Justificación:** la separación entre autoridad real y simulada, la identidad tipada del rol objetivo, la elegibilidad del simulador, el techo de alcance real, el contexto hipotético de sede/área/turno, el resultado no ejecutable, la prohibición de mutaciones desde simulación y la evidencia correlacionable ya disponen de requisitos canónicos vigentes. `AUTH-SRV-015` materializa el contrato de enforcement y auditoría de servidor que consumirá esa cobertura sin crear una obligación verificable nueva.

#### 70. Cobertura de prueba vigente reutilizada

Se reutiliza sin modificar el registro vigente:

- `TREQ-AUTH-012` — simulación separada de autoridad real y sin mutaciones reales;
- `TREQ-AUTH-015` — evidencia correlacionable de principal, actor, simulación, roles, contexto, decisión y versiones;
- `TREQ-AUTH-069` — elegibilidad completa del solicitante de simulación;
- `TREQ-AUTH-071` a `TREQ-AUTH-077` — grants, actor humano, alcance, reautenticación, sesión, no mutación y auditoría;
- `TREQ-AUTH-079` a `TREQ-AUTH-087` — identidad tipada del rol, colisiones, roles inválidos, completitud y sensibilidad;
- `TREQ-AUTH-089` a `TREQ-AUTH-108` — sede y área simuladas, alcance, compatibilidad, aislamiento y auditoría;
- `TREQ-AUTH-109` a `TREQ-AUTH-118` — turno, check-in, temporalidad, replay y auditoría reproducible;
- `TREQ-AUTH-119` a `TREQ-AUTH-128` — cuatro planos, resultados no ejecutables, separación de APIs, RLS, mutaciones, cachés y auditoría;
- `TREQ-AUTH-279` a `TREQ-AUTH-288` — bloqueo transversal de ejecución desde simulación, separación física de autoridad y certificación multicanal.

Estas referencias son trazabilidad heredada y no representan requisitos creados o modificados por `AUTH-SRV-015`.

#### 71. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-SRV-014 — Registrar actor real y actor operativo`

**TAREA ACTUAL APROBADA**
`AUTH-SRV-015 — Registrar rol simulado en auditoría`

**SIGUIENTE TAREA RESERVADA**
`AUTH-SRV-016 — Normalizar errores de autorización`


### ✅ AUTH-SRV-016 — Normalizar errores de autorización

**Estado:** APROBADA
**Tarea anterior:** AUTH-SRV-015 — Registrar rol simulado en auditoría
**Tarea siguiente:** AUTH-SRV-017 — Crear helpers server compartidos
**Tipo de tarea:** Contrato global con materialización por unidad (`PER_IMPLEMENTATION_UNIT`) — contrato de normalización server-side para que toda decisión negativa de autorización y toda indisponibilidad técnica de la evaluación se proyecten mediante respuestas públicas tipadas, estables, equivalentes y seguras entre canales, consumiendo los códigos y contratos `AUTH-ERR-*` ya aprobados sin redefinir copy, autorización, helpers compartidos ni prerrequisitos administrativos
**Bloque:** BLOQUE J — Protección de acciones de servidor
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/J_ACCIONES_DE_SERVIDOR/03_AUDITORIA_ERRORES_Y_HELPERS_COMPARTIDOS.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global; las futuras materializaciones ocurren únicamente mediante `AUTH-SRV-016::<implementation_unit_id>` después de que `DELIV-PKG-025::<package_id>` asigne la unidad y el paquete propietario supere `E5-GATE-008::<package_id>`
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir la frontera canónica de servidor que transforma un resultado autoritativo de autorización o una indisponibilidad técnica de su evaluación en una respuesta estable para el consumidor, sin perder la causa, sin inventar permisos y sin exponer detalles internos.

La regla vinculante queda:

```text
resultado autoritativo completo
+
causa canónica
+
canal de entrega
+
contrato público vigente
=
respuesta normalizada estable
```

Y siempre:

```text
DENY válido
≠
TECHNICAL_FAILURE
≠
error de negocio
≠
conflicto de estado
≠
mensaje libre
```

La normalización ocurre después de resolver la causa. No decide nuevamente si el actor está autorizado.

#### 2. Handoff recibido de `AUTH-SRV-015`

`AUTH-SRV-015` deja disponible, cuando exista simulación:

```text
principal técnico real
actor efectivo real
sesión real
autoridad real
solicitud de simulación
sujeto simulado cuando exista
rol simulado tipado
contexto hipotético
simulation_result
executable=false
razones reales
razones simuladas
versiones
fingerprints
correlación
```

Además permanecen vigentes las salidas acumuladas de `AUTH-SRV-004..014`:

```text
required_permission_key
principal
actor efectivo
contexto real
territorio
turno cuando aplique
rol operativo cuando aplique
dispositivo cuando aplique
recurso
estado y versión
decisión de autorización
atribución
resultado de ejecución
correlación
```

`AUTH-SRV-016` no reabre ninguna de esas resoluciones.

#### 3. Contratos consumidos

La tarea consume sin redefinir:

```text
AuthorizationDecision@1.0.0
AccessContext
AUTH-ERR-001..019
AUTH-ERR-020
AUTHORIZATION-MESSAGE-CATALOG-001
AUTHORIZATION-MESSAGE-DISTRIBUTION-CONTRACT-001
AUTHORIZATION-MESSAGE-PRESENTATION-PROFILE-REGISTER-001
AUTHORIZATION-MESSAGE-CONSUMER-CHANNEL-MATRIX-001
```

La fuente de identidad pública de un bloqueo de autorización es el `reason_code` canónico ya resuelto.

El copy humano, acciones visuales, perfiles y localización permanecen gobernados por `AUTH-ERR-020`.

#### 4. Pregunta contractual propietaria

Esta tarea responde:

```text
¿CÓMO EXPRESA EL SERVIDOR UNA DENEGACIÓN YA RESUELTA
SIN PERDER SU CAUSA NI FILTRAR DETALLES INTERNOS?
```

```text
¿CÓMO DISTINGUE UNA DENEGACIÓN VÁLIDA
DE UNA EVALUACIÓN QUE NO PUDO COMPLETARSE?
```

```text
¿CÓMO CONSERVA LA MISMA SEMÁNTICA
EN SERVER ACTIONS, HTTP, RPC, RLS, EDGE, REALTIME,
OFFLINE Y PROCESOS ASÍNCRONOS?
```

No responde nuevamente quién tiene permiso.

#### 5. Frontera con `AUTH-SRV-015`, `AUTH-SRV-017` y `AUTH-SRV-018`

Las responsabilidades quedan:

```text
AUTH-SRV-015
→ evidencia de rol/sujeto simulado

AUTH-SRV-016
→ normalización tipada y estable de resultados de autorización

AUTH-SRV-017
→ helpers server compartidos que materialicen los contratos

AUTH-SRV-018
→ prerrequisitos explícitos de acciones administrativas sin turno
```

`AUTH-SRV-016` define semántica y shape.

No prescribe nombre de helper, módulo TypeScript, middleware, adapter, RPC, paquete físico ni tecnología de implementación.

#### 6. Resultado contractual

Toda futura unidad deberá poder representar tres resultados raíz sin colapsarlos:

```text
AUTHORIZED
AUTHORIZATION_DENIED
AUTHORIZATION_TECHNICAL_FAILURE
```

Semántica:

```text
AUTHORIZED
→ existe AuthorizationDecision completa
→ final_decision.outcome = ALLOW
→ no es un error de autorización

AUTHORIZATION_DENIED
→ existe AuthorizationDecision completa
→ final_decision.outcome = DENY
→ existe reason_code público canónico
→ executable=false

AUTHORIZATION_TECHNICAL_FAILURE
→ no existe AuthorizationDecision completa
→ no se publica decision_id candidato
→ reason_code = AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE
→ executable=false
```

#### 7. Unión discriminada obligatoria

El contrato conceptual será equivalente a:

```ts
type NormalizedServerAuthorizationResult =
  | {
      kind: "AUTHORIZED";
      authorization_result: "DECIDED";
      final_outcome: "ALLOW";
      decision_id: string;
      correlation_id: string;
    }
  | {
      kind: "AUTHORIZATION_DENIED";
      authorization_result: "DECIDED";
      final_outcome: "DENY";
      reason_code: AuthorizationDenialReasonCode;
      decision_id: string;
      correlation_id: string;
      executable: false;
    }
  | {
      kind: "AUTHORIZATION_TECHNICAL_FAILURE";
      authorization_result: "TECHNICAL_FAILURE";
      reason_code: "AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE";
      decision_id: null;
      evaluation_attempt_id: string;
      correlation_id: string;
      executable: false;
    };
```

La sintaxis es documental.

Los nombres físicos podrán variar si conservan la discriminación y los invariantes.

#### 8. `AUTHORIZED` no utiliza contrato de error

Una decisión:

```text
final_decision.outcome = ALLOW
```

no debe envolverse artificialmente como:

```text
error = false
reason_code = null
AUTH_OK
SUCCESS_AUTH
```

`AUTH-SRV-016` no crea un código de éxito.

La ejecución posterior continúa gobernada por el contrato de la acción y por la frescura de la decisión.

#### 9. Índice público cerrado de autorización

La normalización consume exactamente estas veinte identidades públicas vigentes:

```text
AUTH_NO_SESSION
AUTH_USER_INACTIVE
AUTH_APP_ACCESS_DENIED
AUTH_ADMIN_PERMISSION_DENIED
AUTH_OPERATIONAL_PERMISSION_DENIED
AUTH_SITE_ASSIGNMENT_REQUIRED
AUTH_ACTIVE_SITE_REQUIRED
AUTH_AREA_ASSIGNMENT_REQUIRED
AUTH_ACTIVE_AREA_REQUIRED
AUTH_PUBLISHED_SHIFT_REQUIRED
AUTH_OUTSIDE_SHIFT_WINDOW
AUTH_CHECKIN_REQUIRED
AUTH_OPERATIONAL_ROLE_REQUIRED
AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE
AUTH_OPERATIONAL_ROLE_INVALID_FOR_AREA
AUTH_SHARED_DEVICE_NOT_AUTHORIZED
AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION
AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT
AUTH_PERMISSION_NOT_REGISTERED
AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE
```

`AUTH-SRV-016` no agrega, renombra, traduce ni fusiona códigos de esta unión.

#### 10. Mapping canónico de transporte HTTP

Cuando el canal utilice HTTP, la proyección queda:

| `reason_code`                                    | Resultado                  |  HTTP |
| ------------------------------------------------ | -------------------------- | ----: |
| `AUTH_NO_SESSION`                                | `DENY`                     | `401` |
| `AUTH_USER_INACTIVE`                             | `DENY`                     | `403` |
| `AUTH_APP_ACCESS_DENIED`                         | `DENY`                     | `403` |
| `AUTH_ADMIN_PERMISSION_DENIED`                   | `DENY`                     | `403` |
| `AUTH_OPERATIONAL_PERMISSION_DENIED`             | `DENY`                     | `403` |
| `AUTH_SITE_ASSIGNMENT_REQUIRED`                  | `DENY`                     | `403` |
| `AUTH_ACTIVE_SITE_REQUIRED`                      | `DENY`                     | `403` |
| `AUTH_AREA_ASSIGNMENT_REQUIRED`                  | `DENY`                     | `403` |
| `AUTH_ACTIVE_AREA_REQUIRED`                      | `DENY`                     | `403` |
| `AUTH_PUBLISHED_SHIFT_REQUIRED`                  | `DENY`                     | `403` |
| `AUTH_OUTSIDE_SHIFT_WINDOW`                      | `DENY`                     | `403` |
| `AUTH_CHECKIN_REQUIRED`                          | `DENY`                     | `403` |
| `AUTH_OPERATIONAL_ROLE_REQUIRED`                 | `DENY`                     | `403` |
| `AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE`         | `DENY`                     | `403` |
| `AUTH_OPERATIONAL_ROLE_INVALID_FOR_AREA`         | `DENY`                     | `403` |
| `AUTH_SHARED_DEVICE_NOT_AUTHORIZED`              | `DENY`                     | `403` |
| `AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION`          | `DENY`                     | `403` |
| `AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT` | `DENY`                     | `409` |
| `AUTH_PERMISSION_NOT_REGISTERED`                 | `DENY` / `STRUCTURAL_DENY` | `500` |
| `AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE`      | `TECHNICAL_FAILURE`        | `503` |

Un canal no HTTP conserva la misma identidad y semántica sin inventar un status artificial.

#### 11. HTTP no es la identidad del error

Queda prohibido seleccionar la causa únicamente desde:

```text
401
403
409
500
503
```

El status es una proyección de transporte.

La identidad es el `reason_code` canónico y la clase de resultado.

Dos razones con `403` no se vuelven equivalentes por compartir status.

#### 12. Envelope de denegación

Una denegación pública deberá ser equivalente en semántica a:

```text
kind = AUTHORIZATION_DENIED
authorization_result = DECIDED
final_outcome = DENY
reason_code = código canónico
decision_id = decisión completa emitida
correlation_id = correlación de la solicitud
executable = false
```

Cuando el canal lo soporte podrá incluir metadatos públicos aprobados de sesión, retry y soporte definidos por el contrato propietario.

No se serializa el objeto privado completo de autorización.

#### 13. Envelope de indisponibilidad técnica

Una indisponibilidad previa a una decisión completa deberá conservar:

```text
kind = AUTHORIZATION_TECHNICAL_FAILURE
authorization_result = TECHNICAL_FAILURE
reason_code = AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE
decision_id = null
evaluation_attempt_id = identificador técnico del intento
correlation_id = correlación
executable = false
```

Queda prohibido fabricar:

```text
final_outcome = DENY
decision_id
matched_allow
matched_deny
lane_decision
reason_code de permiso
```

cuando la evaluación no pudo concluir.

#### 14. Fuente de `reason_code`

El normalizador solo puede consumir una causa procedente de:

```text
AuthorizationDecision completa
```

o:

```text
contrato técnico canónico de indisponibilidad
```

No podrá derivarla desde:

```text
texto de excepción
mensaje de Supabase
mensaje PostgreSQL
status HTTP
cero filas
booleano false
nombre de ruta
nombre de helper
copy de interfaz
query string
body
localStorage
navigation_role
```

#### 15. Precedencia

La precedencia se decide antes de normalizar.

Si la evaluación concluyó una causa canónica:

```text
normalizador
→ conserva esa causa
→ no busca otra causa más conveniente
```

Si existen múltiples hechos internos, la respuesta pública conserva la razón que el evaluador canónico haya determinado como propietaria según precedencia y carril.

El normalizador no ordena razones por texto ni por número HTTP.

#### 16. Una respuesta pública no mezcla causas incompatibles

Queda prohibido devolver simultáneamente, como causas públicas del mismo resultado:

```text
AUTH_NO_SESSION
+
AUTH_OPERATIONAL_PERMISSION_DENIED
```

o:

```text
AUTH_PERMISSION_NOT_REGISTERED
+
AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE
```

La evidencia privada puede conservar hechos relacionados.

La respuesta pública conserva una identidad principal determinista.

#### 17. Código desconocido o incompatible

Un `reason_code` desconocido no se mapea a:

```text
AUTH_APP_ACCESS_DENIED
AUTH_ADMIN_PERMISSION_DENIED
AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE
```

por conveniencia.

Una incompatibilidad contractual se trata como fallo cerrado de integración.

No se inventa un mensaje ni una denegación distinta para ocultar el drift.

#### 18. Separación pública y privada

La proyección pública puede conservar, según el canal:

```text
kind
reason_code
http_status cuando aplique
executable
retryable cuando esté aprobado
session disposition pública
correlation_id o referencia opaca de soporte
```

La evidencia privada puede conservar:

```text
principal
actor
permiso
grant
deny
sede
área
turno
check-in
rol
dispositivo
recurso
causa interna
structural issue
versiones
fingerprints
stack técnico protegido
dependencia fallida
```

La segunda lista no se expone por convertirla en JSON de error.

#### 19. Copy y presentación

El servidor no inventa:

```text
title
message
help_text
primary_action_label
secondary_action_label
```

El `reason_code` se proyecta mediante `AUTHORIZATION-MESSAGE-CATALOG-001` y su perfil vigente.

Los `null` aprobados permanecen `null`.

Una aplicación no completa copy faltante con texto local.

#### 20. Locale

La normalización del error no traduce el código.

Se mantiene:

```text
reason_code estable
+
perfil
+
locale
=
presentación
```

La falta de un locale puede utilizar el fallback aprobado a `es-CO` de la misma versión.

La falta del perfil o una incompatibilidad de versión no autoriza inventar copy.

#### 21. Sesión

La respuesta respeta la disposición de sesión definida por la razón propietaria.

Queda prohibido:

```text
403 → cerrar sesión
409 → limpiar cookies
500 → invalidar sesión
503 → redirigir a login
```

como regla genérica.

`AUTH_NO_SESSION` describe una sesión ausente o no válida.

Las demás razones no se convierten en ausencia de sesión por el status transportado.

#### 22. Cero efectos antes de la ejecución

Toda denegación o fallo técnico resuelto antes del primer efecto deberá conservar:

```text
executable = false
effects_committed = false
```

La normalización no puede confirmar éxito parcial.

Si una falla ocurre después de comenzar una mutación y no existe atomicidad demostrada, deja de ser seguro afirmar `effects_committed=false`.

Ese caso pertenece al incidente y reconciliación de ejecución del proceso propietario.

#### 23. Reintentos

Una respuesta normalizada nunca ordena reejecutar automáticamente la misma mutación.

Cuando el contrato permita reintento:

```text
nueva solicitud
+
fuentes frescas
+
nueva evaluación
+
idempotencia válida
```

son obligatorios.

Un `503` no constituye una autorización diferida.

#### 24. Idempotencia

Una clave de idempotencia no convierte:

```text
DENY
TECHNICAL_FAILURE
```

en una futura ejecución exitosa sin nueva evaluación.

Una clave marcada por una ejecución real conserva el contrato del proceso.

Una clave asociada a un intento no ejecutado no funciona como permiso.

#### 25. Concurrencia y frescura

Si cambian antes del efecto:

```text
actor
sesión
permiso
grants
denies
turno
check-in
rol
sede
área
dispositivo
recurso
estado
versión
catálogo
política
```

la decisión stale no se normaliza como si siguiera vigente.

Debe resolverse una nueva decisión o producirse el conflicto de dominio que corresponda.

#### 26. Frontera con errores de negocio y estado

`AuthorizationReasonCode` no es un catálogo universal de errores empresariales.

Quedan separados:

```text
AUTHORIZATION_DENIED
BUSINESS_RULE_REJECTED
RESOURCE_STATE_CONFLICT
RESOURCE_SCOPE_CONFLICT
CONCURRENCY_CONFLICT
TECHNICAL_FAILURE
```

Solo `AUTHORIZATION_DENIED` consume una razón `AUTH_*` de denegación.

Un conflicto empresarial no se convierte en `AUTH_ADMIN_PERMISSION_DENIED`.

Una falta de autorización no se disfraza como conflicto de negocio.

#### 27. Límites, conflictos, alcance y concurrencia

Las superficies de servidor deberán transportar códigos estables para:

```text
límite de negocio
conflicto de negocio
alcance de recurso
conflicto de concurrencia
```

cuando el contrato propietario ya los haya aprobado.

`AUTH-SRV-016` fija estas obligaciones:

1. el código procede del contrato propietario de la operación;
2. no se deriva de texto libre;
3. no usa el namespace `AUTH_*` salvo que la causa sea realmente autorización;
4. se preserva sin traducción entre canales;
5. el mensaje humano no reemplaza la identidad;
6. una causa de negocio no modifica la `AuthorizationDecision` previa;
7. una causa de concurrencia obliga a revalidar antes de un nuevo intento.

La tarea no inventa literales de dominio que aún no estén aprobados por sus owners.

#### 28. VISO mensual

Para la programación mensual de VISO se conserva:

```text
autorización
→ decide si el actor puede intentar la operación

reglas de programación
→ deciden límites, integridad y conflictos

concurrencia
→ decide si la versión que se intenta modificar sigue vigente
```

La nota del paquete mensual se materializa así:

```text
límite
conflicto
alcance
concurrencia
→ códigos estables
→ no texto libre
→ no AUTH_ERROR genérico
→ no permiso falso
```

La identidad concreta del límite mensual permanece bajo `VISO-SCH-004`.

Los conflictos, integridad y concurrencia permanecen bajo `VISO-SCH-006`.

La publicación y corrección permanecen bajo `VISO-SCH-005`.

`AUTH-SRV-016` garantiza que esas identidades futuras podrán atravesar el envelope de servidor sin ser reclasificadas como autorización.

#### 29. Alcance de autorización frente a alcance de recurso

Cuando una evaluación de permiso concluye que el actor carece del alcance requerido:

```text
carril base
→ AUTH_ADMIN_PERMISSION_DENIED

carril operativo
→ AUTH_OPERATIONAL_PERMISSION_DENIED
```

según el contrato aplicable.

Cuando el actor sí está autorizado pero el recurso solicitado viola una regla funcional de alcance del proceso, el código pertenece al proceso o recurso propietario.

No se crea un tercer significado ambiguo de `scope`.

#### 30. Server Actions

Una Server Action protegida deberá:

```text
resolver autorización
→ obtener resultado normalizado
→ bloquear antes del efecto si no es AUTHORIZED
→ devolver o lanzar únicamente la forma contractual del adapter
```

No deberá usar:

```text
throw new Error("No autorizado")
return false
return { ok: false }
```

como único contrato de causa.

El mecanismo físico exacto pertenece a `AUTH-SRV-017`.

#### 31. Route Handlers y APIs

Un endpoint HTTP protegido deberá preservar:

```text
reason_code
status canónico
flags públicos
correlación segura
```

No devolverá HTML de login para una API no navegacional.

No utilizará `200` con un booleano ambiguo para representar una denegación.

#### 32. RSC y navegación

Una superficie navegacional puede aplicar una recuperación aprobada, incluida la autenticación cuando la razón sea `AUTH_NO_SESSION`.

La navegación no cambia el `reason_code`.

Una redirección no convierte por sí sola la causa en sesión ausente.

#### 33. RPC y PostgREST

Una RPC no debe obligar al consumidor a inferir la razón desde:

```text
texto SQL
SQLSTATE genérico
booleano
null
cero filas
```

Cuando el canal físico no pueda transportar el envelope completo, un adapter autoritativo deberá preservar la equivalencia.

La forma de ese adapter pertenece a las materializaciones posteriores.

#### 34. RLS y Data API

RLS continúa siendo enforcement y no se convierte en motor de presentación.

Un resultado de cero filas no basta para afirmar:

```text
AUTH_ADMIN_PERMISSION_DENIED
```

ni cualquier otra causa.

La superficie que necesite explicación pública deberá obtener la razón mediante el contrato autoritativo correspondiente sin debilitar RLS.

#### 35. Edge Functions

Una Edge Function protegida deberá consumir la misma semántica:

```text
DECIDED / DENY
o
TECHNICAL_FAILURE
```

No podrá crear un catálogo local de errores de autorización.

Un secreto o `service_role` técnico no modifica la causa empresarial.

#### 36. Realtime

Una suscripción o evento protegido no puede interpretar:

```text
sin evento
=
sin permiso
```

La denegación, indisponibilidad técnica y ausencia legítima de cambios permanecen separadas.

La revocación o cambio de contexto invalida la autoridad stale.

#### 37. Offline y sincronización

Un error conservado offline es evidencia histórica del intento, no autoridad.

Al sincronizar:

```text
nueva solicitud
+
estado vigente
+
nueva autorización
+
nueva comprobación de conflicto
```

son obligatorios.

Una denegación vieja no bloquea para siempre.

Un `ALLOW` viejo no autoriza después.

#### 38. Jobs, colas, webhooks e integraciones

Un proceso asíncrono no podrá transformar:

```text
AUTHORIZATION_DENIED
```

en retry técnico.

Tampoco podrá transformar:

```text
TECHNICAL_FAILURE
```

en denegación empresarial.

La política de retry del transporte no altera la clase semántica del resultado.

#### 39. Dispositivo compartido e interacción

Los estados:

```text
ACTOR_IDENTIFICATION_REQUIRED
STRONG_REAUTHENTICATION_REQUIRED
```

no pertenecen a los veinte `AuthorizationReasonCode`.

No se normalizan como:

```text
AUTH_SHARED_DEVICE_NOT_AUTHORIZED
```

cuando el dispositivo y actor continúan dentro de un flujo interactivo válido.

La tarea preserva esa exclusión.

#### 40. Simulación

Una simulación conserva:

```text
WOULD_ALLOW
WOULD_DENY
INDETERMINATE
```

como resultado hipotético.

Si intenta producir un efecto real, la causa canónica es:

```text
AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION
```

No se normaliza `WOULD_ALLOW` como `AUTHORIZED`.

#### 41. Correlación y soporte

La normalización deberá permitir correlacionar:

```text
solicitud
→ evaluación
→ decisión o fallo técnico
→ respuesta
→ ejecución o no efecto
```

`correlation_id` no concede permiso.

`decision_id` no es bearer token.

`evaluation_attempt_id` no es una decisión.

Una referencia pública de soporte debe ser opaca y no revelar infraestructura.

#### 42. Versionado

Toda futura materialización deberá registrar las versiones consumidas de:

```text
AuthorizationDecision
catálogo de razones
catálogo de mensajes
schema público
contrato del adapter
```

No se mezclan versiones incompatibles.

Un código válido en una versión no se reinterpreta silenciosamente con otra.

#### 43. Caches

Una cache de respuesta puede conservar presentación solo dentro de su contrato de frescura.

No puede reutilizar como autoridad:

```text
decision_id
ALLOW
DENY
reason_code
```

fuera de la vigencia autorizada.

Cambios materiales invalidan la evaluación, no únicamente el texto visible.

#### 44. Auditoría

La evidencia privada deberá poder distinguir:

```text
AUTHORIZATION_DENIED
AUTHORIZATION_TECHNICAL_FAILURE
BUSINESS_RULE_REJECTED
RESOURCE_STATE_CONFLICT
CONCURRENCY_CONFLICT
EXECUTION_FAILED
```

La métrica de denegaciones no incluye `TECHNICAL_FAILURE`.

La métrica de errores técnicos no convierte fallos en decisiones.

La observabilidad no sustituye la auditoría de autorización.

#### 45. Minimización de datos

La respuesta pública no almacena ni expone por defecto:

```text
tokens
cookies
JWT
API keys
SQL
stack traces
headers completos
payload completo
employee_id
auth_user_id
roles candidatos
sedes candidatas
áreas candidatas
grants
denies
permission_key exacta
resource_id sensible
```

Los datos privados estrictamente necesarios permanecen bajo el contrato de auditoría correspondiente.

#### 46. Lineage obligatorio

Cada futura unidad deberá conservar:

```text
surface_identity
→ authorization evaluation
→ result kind
→ reason_code when applicable
→ transport projection
→ message contract reference
→ correlation
→ execution boundary
→ final effect state
```

Para un fallo técnico:

```text
surface_identity
→ evaluation_attempt_id
→ TECHNICAL_FAILURE
→ AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE
→ transport projection
→ zero effect when proven before execution
```

#### 47. Materialización futura

Cada instancia:

```text
AUTH-SRV-016::<implementation_unit_id>
```

deberá registrar como mínimo:

```text
implementation_unit_id
repository
commit_before
surface_identity[]
channel[]
authorization_result_kind[]
authorization_decision_reference[]
decision_id[]
evaluation_attempt_id[]
correlation_id[]
reason_code[]
http_status[]
message_contract_version[]
session_disposition[]
retry_policy[]
effects_committed[]
business_error_passthrough[]
legacy_error_shape_removed[]
package_id[]
change_set
rollback
validation_commands
evidence
commit_after
```

Los nombres describen evidencia contractual y no obligan a crear columnas, tablas o tipos homónimos.

#### 48. Evidencia mínima de una futura unidad

La materialización deberá demostrar, cuando aplique:

1. `ALLOW` no se convierte en error;
2. `DENY` conserva una `AuthorizationDecision` completa;
3. `TECHNICAL_FAILURE` no fabrica `DENY`;
4. `TECHNICAL_FAILURE` no publica `decision_id`;
5. el `reason_code` procede de fuente canónica;
6. los veinte códigos admitidos se consumen sin renombrar;
7. un código desconocido falla cerrado;
8. `401` solo representa `AUTH_NO_SESSION` dentro de este catálogo;
9. las razones ordinarias de autorización usan su `403` aprobado;
10. configuración inconsistente conserva `409`;
11. permiso no registrado conserva `500`;
12. indisponibilidad de evaluación conserva `503`;
13. HTTP no se usa como identidad;
14. una causa pública principal es determinista;
15. detalles privados no aparecen en el envelope público;
16. el copy procede del catálogo compartido;
17. `null` de presentación no se completa localmente;
18. una denegación no cierra sesión por regla genérica;
19. un fallo técnico no redirige a login por regla genérica;
20. un resultado pre-efecto conserva cero efectos;
21. una falla post-efecto incierta no afirma rollback inexistente;
22. no existe replay automático de mutaciones;
23. la idempotencia no funciona como permiso;
24. decisión stale obliga a revalidar;
25. error de negocio no se convierte en autorización;
26. falta de autorización no se convierte en conflicto de negocio;
27. códigos futuros de límite/conflicto/alcance/concurrencia se preservan desde su owner;
28. un scope de permiso usa la razón del carril aplicable;
29. Server Actions conservan la causa;
30. APIs conservan causa y status;
31. RPC no depende de texto libre;
32. RLS no usa cero filas como explicación suficiente;
33. Edge Functions no crean catálogo local;
34. Realtime separa ausencia de evento y denegación;
35. offline reautoriza al sincronizar;
36. jobs separan retry técnico y deny;
37. estados interactivos de dispositivo no se degradan a bloqueo;
38. `WOULD_ALLOW` nunca se convierte en `AUTHORIZED`;
39. correlación no concede autoridad;
40. versiones incompatibles no se mezclan;
41. métricas de deny y fallos técnicos permanecen separadas;
42. rollback no reintroduce errores genéricos.

#### 49. Rollback

El rollback de una futura unidad deberá restaurar únicamente el mecanismo técnico anterior sin:

- convertir `TECHNICAL_FAILURE` en `DENY`;
- convertir `DENY` en `TECHNICAL_FAILURE`;
- perder el `reason_code` canónico;
- mapear todos los `403` a una razón genérica;
- reintroducir `return false` como contrato único;
- reintroducir `AUTH_ERROR` genérico;
- exponer mensajes SQL o de proveedor;
- borrar la separación entre evidencia pública y privada;
- cerrar sesiones por inferencia;
- repetir mutaciones automáticamente;
- reutilizar una decisión stale;
- convertir un error de negocio en falta de permiso;
- inventar códigos VISO aún no aprobados;
- convertir un estado interactivo de dispositivo en denegación;
- convertir `WOULD_ALLOW` en autoridad;
- perder correlación histórica válida.

#### 50. Criterios de aceptación

`AUTH-SRV-016` queda documentalmente satisfecha cuando:

1. se distinguen `AUTHORIZED`, `AUTHORIZATION_DENIED` y `AUTHORIZATION_TECHNICAL_FAILURE`;
2. `AUTHORIZED` no crea un código de éxito;
3. una denegación exige decisión completa;
4. una indisponibilidad técnica no fabrica decisión;
5. se preserva la unión cerrada de veinte códigos;
6. no se crean códigos alternativos de autorización;
7. se fija el mapping HTTP canónico;
8. HTTP queda definido como transporte y no identidad;
9. `AUTH_NO_SESSION` conserva `401`;
10. las denegaciones ordinarias conservan `403`;
11. configuración inconsistente conserva `409`;
12. permiso no registrado conserva `500`;
13. indisponibilidad técnica conserva `503`;
14. se prohíbe inferir causa desde mensaje, status, booleano o cero filas;
15. la precedencia permanece propiedad del evaluador;
16. una respuesta pública principal no mezcla causas incompatibles;
17. un código desconocido falla cerrado;
18. la proyección pública está minimizada;
19. la evidencia privada permanece separada;
20. el copy continúa gobernado por `AUTH-ERR-020`;
21. la localización no cambia el código;
22. ninguna razón cierra sesión por regla genérica;
23. una denegación pre-efecto conserva cero efectos;
24. una falla post-efecto incierta pasa al owner de ejecución;
25. retry e idempotencia no conceden autoridad;
26. decisiones stale se revalidan;
27. error de autorización y error de negocio permanecen separados;
28. límite, conflicto, alcance y concurrencia exigen códigos estables de sus owners;
29. no se inventan códigos VISO antes de `VISO-SCH-004..006`;
30. scope de autorización y scope funcional no se confunden;
31. Server Actions conservan la semántica;
32. HTTP APIs conservan la semántica;
33. RSC y navegación conservan la causa;
34. RPC/PostgREST no dependen de texto libre;
35. RLS/Data API no fabrican causas desde cero filas;
36. Edge Functions no crean un catálogo paralelo;
37. Realtime conserva separación de estados;
38. offline reautoriza antes de ejecutar;
39. procesos asíncronos separan deny y retry técnico;
40. estados interactivos de dispositivo siguen fuera del catálogo de bloqueos;
41. simulación no se convierte en autoridad;
42. correlación, decisión e intento técnico mantienen identidades distintas;
43. versiones y caches no reinterpretan decisiones;
44. auditoría y métricas distinguen deny de fallo técnico;
45. no se autorizan cambios físicos desde el marcador global;
46. no se crean ni modifican requisitos de prueba.

#### 51. Límites

Este marcador no certifica todavía:

- implementación física del envelope;
- tipos TypeScript;
- helpers compartidos;
- middleware;
- adapters HTTP;
- adapters RPC;
- integración RLS;
- Edge Functions;
- instrumentación Realtime;
- cola o worker;
- SDK consumidor;
- componentes UI;
- paquetes npm;
- cambios de Supabase;
- migraciones;
- nuevos códigos de negocio de VISO;
- valor o unidad del límite mensual;
- reglas de solapamiento;
- política de concurrencia de programación;
- prerrequisitos administrativos sin turno;
- despliegue;
- comportamiento productivo.

Owners pendientes y condición de salida:

```text
VISO-SCH-004
→ aprobar límite mensual, vigencia y excepciones
→ entonces su código de límite podrá ser consumido de forma estable

VISO-SCH-005
→ aprobar publicación y corrección
→ entonces sus conflictos de estado podrán ser consumidos de forma estable

VISO-SCH-006
→ aprobar conflictos, integridad y concurrencia
→ entonces sus códigos concretos podrán ser consumidos de forma estable

AUTH-SRV-017
→ materializar helpers compartidos
→ entonces las unidades podrán reutilizar una implementación común

AUTH-SRV-018
→ fijar prerrequisitos administrativos sin turno
→ entonces la normalización consumirá esas decisiones sin inferir turno
```

#### 52. Evidencia de validación

| Clase     | Estado           | Evidencia                                                                                                                                                                                                                                                                                                                                                                                                       |
| --------- | ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | `NOT_EXECUTED`   | no se ejecutó build durante el desarrollo documental                                                                                                                                                                                                                                                                                                                                                            |
| LOCAL     | `NOT_EXECUTED`   | no se ejecutaron comandos contra el checkout del usuario                                                                                                                                                                                                                                                                                                                                                        |
| REMOTA    | `PASS`           | se auditaron en solo lectura la continuidad vigente, el contrato de entrega, la topología `PER_IMPLEMENTATION_UNIT`, las políticas de formato y desarrollo, el owner de `AUTH-SRV-016`, `AUTH-SRV-014`, `AUTH-SRV-015`, `AuthorizationDecision`, `AUTH-ERR-001..020`, la familia 04A AUTH relevante, los scripts documentales declarados en `package.json` y la frontera pendiente de programación laboral VISO |
| OPERATIVA | `NOT_APPLICABLE` | el marcador no cambia operación real                                                                                                                                                                                                                                                                                                                                                                            |
| FÍSICA    | `NOT_APPLICABLE` | no existe instancia física autorizada para esta tarea                                                                                                                                                                                                                                                                                                                                                           |

#### 53. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Justificación:** los códigos públicos de autorización, sus estados HTTP, la separación entre denegación y fallo técnico, la equivalencia multicanal, privacidad, recuperación, versionado, mensajes compartidos, invalidación, concurrencia e idempotencia ya disponen de requisitos canónicos vigentes. `AUTH-SRV-016` consolida el contrato server-side que deberá consumir esa cobertura sin introducir una obligación verificable nueva ni alterar el registro 04A.

#### 54. Cobertura de prueba vigente reutilizada

Se reutiliza sin modificar el registro vigente:

- `TREQ-AUTH-004` — equivalencia de decisión y razones entre evaluadores;
- `TREQ-AUTH-015` — evidencia correlacionable de contexto, decisión y resultado;
- `TREQ-AUTH-129` a `TREQ-AUTH-318` — contratos de bloqueo `AUTH-ERR-001..019`, incluidos códigos, canales, cero efectos, privacidad, invalidación y separación entre `DENY` y `TECHNICAL_FAILURE`;
- `TREQ-AUTH-319` a `TREQ-AUTH-331` — catálogo compartido de veinte códigos, perfiles, distribución, compatibilidad, consumo multicanal y prevención de drift.

Estas referencias son trazabilidad heredada y no representan requisitos creados o modificados por `AUTH-SRV-016`.

#### 55. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-SRV-015 — Registrar rol simulado en auditoría`

**TAREA ACTUAL APROBADA**
`AUTH-SRV-016 — Normalizar errores de autorización`

**SIGUIENTE TAREA RESERVADA**
`AUTH-SRV-017 — Crear helpers server compartidos`


### ✅ AUTH-SRV-017 — Crear helpers server compartidos

**Estado:** APROBADA
**Tarea anterior:** AUTH-SRV-016 — Normalizar errores de autorización
**Tarea siguiente:** AUTH-SRV-018 — Revisar acciones administrativas sin turno
**Tipo de tarea:** Contrato global con materialización por unidad (`PER_IMPLEMENTATION_UNIT`) — contrato de composición y reutilización de helpers server para que las superficies protegidas consuman una sola orquestación por operación, deleguen contexto y autorización a las fronteras canónicas de `@vento/os-context/server`, recalculen reglas de dominio desde fuentes server-side versionadas, conserven frescura, auditoría y errores normalizados, y eliminen copias locales divergentes sin convertir el helper compartido en una nueva fuente de autoridad
**Bloque:** BLOQUE J — Protección de acciones de servidor
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/J_ACCIONES_DE_SERVIDOR/03_AUDITORIA_ERRORES_Y_HELPERS_COMPARTIDOS.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global; las futuras materializaciones ocurren únicamente mediante `AUTH-SRV-017::<implementation_unit_id>` después de que `DELIV-PKG-025::<package_id>` asigne la unidad y el paquete propietario supere `E5-GATE-008::<package_id>`
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir cómo deben componerse y reutilizarse los helpers de servidor que protegen operaciones empresariales de Vento OS, evitando que cada Server Action, Route Handler, RPC adapter, job o superficie equivalente reconstruya por su cuenta autenticación, contexto, autorización, territorio, estado, reglas de dominio, auditoría y manejo de errores.

La regla vinculante queda:

```text
UNA OPERACION PROTEGIDA
+
UN BINDING SERVER-SIDE
+
UNA ORQUESTACION COMPARTIDA
+
FUENTES CANONICAS
+
REGLAS DE DOMINIO VERSIONADAS
=
UNA DECISION REPRODUCIBLE
+
UN EFECTO CONTROLADO
+
UNA EVIDENCIA CORRELACIONABLE
```

Y nunca:

```text
HELPER COMPARTIDO
=
NUEVO EVALUADOR DE AUTORIZACION
=
NUEVO CATALOGO DE PERMISOS
=
NUEVA FUENTE DE VERDAD DE NEGOCIO
```

El helper compartido coordina contratos ya aprobados. No los reemplaza.

#### 2. Handoff recibido de `AUTH-SRV-016`

`AUTH-SRV-016` deja congelada la normalización de resultados de autorización:

```text
AUTHORIZED
AUTHORIZATION_DENIED
AUTHORIZATION_TECHNICAL_FAILURE
```

También deja definidos:

- la preservación del `reason_code` canónico;
- la separación entre `DENY` y `TECHNICAL_FAILURE`;
- la separación entre autorización y errores de negocio, estado o concurrencia;
- la proyección segura por canal;
- la prohibición de usar booleanos, texto libre, cero filas o HTTP como identidad de la causa;
- la obligación de no repetir automáticamente una mutación;
- la obligación de revalidar decisiones stale;
- la frontera entre evidencia pública y privada.

`AUTH-SRV-017` consume esas decisiones y define cómo una implementación compartida debe llegar hasta ese resultado sin reabrir la semántica de errores.

#### 3. Handoff acumulado de `AUTH-SRV-004..015`

El helper compartido debe poder componer los contratos ya cerrados para:

```text
intencion del request
binding server-side de operacion
permiso exacto
principal
actor efectivo
sede
area
turno
check-in cuando aplique
rol operativo cuando aplique
dispositivo cuando aplique
estado actual del recurso
cruce entre sedes
cruce entre areas
atribucion real
simulacion cuando aplique
recurso
version
correlacion
```

Ninguna de esas dimensiones se vuelve opcional por estar escondida detrás de un helper.

La reutilización reduce duplicación; no reduce controles.

#### 4. Pregunta contractual propietaria

Esta tarea responde:

```text
¿QUE RESPONSABILIDADES DE SERVIDOR DEBEN REUTILIZARSE
EN VEZ DE COPIARSE EN CADA SUPERFICIE?
```

```text
¿COMO SE COMPONEN CONTEXTO, AUTORIZACION,
REGLAS DE DOMINIO, FRESCURA, EFECTO, AUDITORIA Y ERROR
SIN CREAR UNA SEGUNDA FUENTE DE AUTORIDAD?
```

```text
¿COMO SE GARANTIZA QUE DOS SUPERFICIES
QUE PROTEGEN LA MISMA REGLA
CALCULEN Y VALIDEN LO MISMO?
```

Para el paquete VISO mensual responde además:

```text
¿COMO EVITAR QUE SEMANA, MES Y BASE DE DATOS
MANTENGAN CALCULOS O POLITICAS DIVERGENTES?
```

#### 5. Frontera con `AUTH-SRV-016` y `AUTH-SRV-018`

Las responsabilidades permanecen separadas:

```text
AUTH-SRV-016
→ normaliza el resultado y los errores

AUTH-SRV-017
→ define la composicion y reutilizacion de helpers server

AUTH-SRV-018
→ define prerrequisitos administrativos sin turno
```

Por tanto `AUTH-SRV-017` no decide si una acción administrativa necesita turno, check-in o rol operativo.

El helper consumirá esa decisión cuando `AUTH-SRV-018` la cierre.

#### 6. Frontera con la fundación compartida de autorización

La arquitectura aprobada se conserva:

```text
@vento/contracts/authorization
→ contratos
→ catalogos
→ schemas
→ codigos
→ tipos derivados
→ metadata estatica

@vento/os-context/server
→ runtime server compartido de contexto y autorizacion

Supabase / backend canonico
→ resolucion autoritativa
→ evaluacion autoritativa
→ enforcement de datos aplicable

aplicacion / dominio propietario
→ reglas empresariales propias
→ composicion de proceso
→ efecto empresarial
```

`AUTH-SRV-017` no crea:

```text
@vento/auth
@vento/server-auth
@vento/business-rules
@vento/operational-context
```

ni otro núcleo competidor por inferencia.

#### 7. Operaciones de autorización ya reservadas

La composición compartida debe reutilizar las operaciones públicas ya aprobadas de `@vento/os-context/server`:

```text
resolveAccessContext
evaluateAuthorization
requireAuthorization
getSafeContextProjection
getSafeDecisionProjection
createAuthorizationScope
```

Distribución preservada:

```text
resolveAccessContext
evaluateAuthorization
requireAuthorization
getSafeContextProjection
getSafeDecisionProjection
→ contrato materializable de SHELL-AUTH-002

createAuthorizationScope
→ contrato materializable de SHELL-AUTH-003
```

`AUTH-SRV-017` no renombra estas operaciones ni crea wrappers públicos equivalentes que compitan con ellas.

#### 8. Qué significa “helper server compartido”

Un helper server compartido es una pieza reutilizable que:

1. corre dentro de una frontera de servidor o produce una función pura consumible por ella;
2. recibe únicamente intención y referencias permitidas;
3. resuelve o consume hechos autoritativos desde sus propietarios;
4. compone contratos aprobados;
5. conserva una semántica estable para operaciones equivalentes;
6. falla cerrado;
7. expone solo el resultado permitido;
8. no se convierte en propietario accidental de una regla que pertenece a otro dominio.

“Compartido” puede significar:

```text
misma unidad de implementacion
+
varias superficies consumidoras
```

No obliga a convertir todo helper en package público.

La ubicación física se decide durante la instancia material y según ownership real.

#### 9. Taxonomía obligatoria de helpers

La implementación futura deberá clasificar cada helper en una sola responsabilidad primaria:

| Clase                   | Responsabilidad                                       |     Puede decidir autorización |              Puede producir efecto |
| ----------------------- | ----------------------------------------------------- | -----------------------------: | ---------------------------------: |
| `CONTRACT_VALIDATION`   | validar shapes, códigos, versiones y contratos        |                             No |                                 No |
| `AUTHORIZATION_RUNTIME` | adaptar y consumir contexto/decisión canónicos        | Solo mediante backend canónico |                                 No |
| `DOMAIN_CALCULATION`    | cálculo puro de regla empresarial aprobada            |                             No |                                 No |
| `DOMAIN_RESOLUTION`     | resolver hechos del dominio desde fuentes server-side |                 No por sí solo |                                 No |
| `PERSISTENCE_ADAPTER`   | traducir un efecto ya autorizado hacia persistencia   |                             No | Sí, dentro de la frontera aprobada |
| `AUDIT_ADAPTER`         | conservar evidencia y correlación                     |                             No |                     Solo evidencia |
| `RESPONSE_ADAPTER`      | proyectar resultado normalizado por canal             |                             No |                                 No |
| `LEGACY_ADAPTER`        | compatibilidad temporal explícita                     |             No autoridad nueva |                     No por sí solo |

Un mismo archivo podrá contener más de una clase solo si la frontera permanece explícita y testeable.

La clasificación no autoriza un módulo monolítico.

#### 10. Regla de composición y no reemplazo

La composición correcta es:

```text
helper de operacion
→ consume primitive canonico
→ consume regla de dominio propietaria
→ consume estado autoritativo
→ coordina orden
```

No:

```text
helper de operacion
→ vuelve a implementar permiso
→ vuelve a implementar precedencia
→ vuelve a implementar territorio
→ vuelve a implementar catalogo
```

Si dos capas tienen el mismo cálculo o decisión por copia manual, existe una brecha hasta demostrar que una es proyección generada o adapter estrictamente compatible.

#### 11. Binding server-side de operación

Toda operación protegida deberá poseer un binding server-side estable que determine, sin elección libre del cliente:

```text
aplicacion
operacion
permiso requerido
tipo de recurso
clase de efecto
reglas de dominio aplicables
requisitos de frescura
politica de atomicidad
```

El cliente puede seleccionar el recurso o proponer contenido cuando el contrato lo permite.

No puede seleccionar:

```text
permiso mas debil
modalidad de autorizacion
bypass
rol efectivo
sede efectiva
area efectiva
decision
politica de limite
politica de conflicto
```

El binding pertenece al código de servidor y a contratos versionados, no al `FormData`.

#### 12. Request scope obligatorio

La composición compartida debe operar dentro del `AuthorizationScope` aprobado para la solicitud cuando la materialización aplicable exista.

Regla:

```text
UN REQUEST
→ UN SCOPE AISLADO
→ CONTEXTO Y DECISIONES DEDUPLICABLES SOLO DENTRO DE SUS CLAVES EXACTAS
```

No se permite:

```text
singleton global de autoridad
cache cross-request no gobernada
ultimo actor
ultima sede
ultimo permiso
ultima decision
```

como fuente de la operación actual.

#### 13. Pipeline mínimo de una operación protegida

La secuencia conceptual obligatoria es:

```text
1. recibir intencion
2. parsear y validar forma
3. resolver binding server-side
4. resolver identidad exacta del recurso
5. resolver estado actual requerido
6. crear/obtener scope de autorizacion de la solicitud
7. resolver contexto canonico
8. evaluar y exigir autorizacion exacta
9. resolver reglas de dominio aplicables
10. recalcular limites/conflictos/alcances funcionales desde estado vigente
11. comprobar frescura y concurrencia inmediatamente antes del efecto
12. construir payload efectivo
13. ejecutar efecto con atomicidad aplicable
14. aplicar write barrier si el efecto invalida contexto/decision
15. registrar atribucion, decision, before/after y resultado
16. normalizar respuesta o fallo
```

Una operación podrá omitir un paso solo cuando su contrato demuestre que es `NOT_APPLICABLE`.

No puede omitirlo porque el frontend ya lo calculó.

#### 14. Parseo no es autorización

Los parsers compartidos podrán:

- validar tipo;
- validar forma;
- limitar longitud;
- normalizar representación cuando el contrato lo permita;
- rechazar campos desconocidos;
- producir una intención tipada.

No podrán:

- resolver automáticamente autoridad;
- transformar un rol enviado por cliente en rol efectivo;
- transformar una sede seleccionada en cobertura;
- transformar un permiso textual en binding;
- convertir ausencia de error de forma en `ALLOW`.

#### 15. Resolver no es autorizar

Los helpers de resolución podrán obtener:

```text
recurso
estado
relaciones
configuracion
politica
version
```

pero esa resolución no equivale a autorización.

La regla se mantiene:

```text
HECHO RESUELTO
≠
PERMISO CONCEDIDO
```

Un helper de resolución no expone una función booleana denominada de forma que sugiera autoridad final si solo comprueba existencia o compatibilidad.

#### 16. Autorización exacta

El helper de operación no implementa `hasPermission` local.

Debe delegar la decisión a la frontera canónica.

Solo:

```text
AuthorizationDecision valida
+
final_decision.outcome = ALLOW
```

permite continuar hacia el efecto protegido.

Un `DENY`, fallo contractual o fallo técnico bloquea.

#### 17. Regla de dominio después de autorización

Una autorización positiva significa:

```text
el actor puede intentar la capacidad
```

No significa:

```text
el recurso esta en estado valido
el limite no fue superado
no existe conflicto
la version sigue vigente
la operacion es atomicamente ejecutable
```

Las reglas de dominio conservan propietarios propios.

El helper compartido coordina su evaluación sin redefinirlas como permisos.

#### 18. Helpers de cálculo de dominio

Un `DOMAIN_CALCULATION` deberá ser, cuando sea técnicamente posible:

- determinista;
- sin efectos;
- sin red;
- sin cookies;
- sin redirects;
- sin acceso implícito a sesión;
- sin `service_role`;
- sin dependencia de UI;
- explícito respecto de la versión de política que consume;
- reproducible con fixtures;
- capaz de distinguir input inválido de resultado empresarial válido.

Su salida no concede autoridad.

#### 19. Helpers de resolución de dominio

Un `DOMAIN_RESOLUTION` puede consultar fuentes autoritativas para construir los inputs del cálculo.

Debe conservar:

```text
fuente
version o revision aplicable
instante o snapshot relevante
identidad exacta
```

cuando esos elementos sean materiales para reproducir la decisión.

No seleccionará “la primera fila” ante ambigüedad contractual.

#### 20. Helpers de persistencia

Un `PERSISTENCE_ADAPTER` recibe un efecto ya reconstruido y autorizado.

No recibe un body completo para pasarlo sin filtrado.

Regla:

```text
intencion
→ resolucion
→ autorizacion
→ reglas
→ payload efectivo
→ persistencia
```

No:

```text
request body
→ insert/update directo
```

El adapter no convierte `service_role` en permiso empresarial.

#### 21. Redirección y navegación

Los helpers puros, contractuales o de dominio no deben depender de `redirect()` para expresar su semántica.

La navegación pertenece al adapter de canal.

Por tanto:

```text
resultado estructurado
→ RESPONSE_ADAPTER
→ redirect / HTTP / action result / worker outcome
```

No:

```text
calculo de dominio
→ redirect inmediato con texto libre
```

Esta separación permite reutilizar la misma regla desde semana, mes, API, pruebas y procesos no navegacionales.

#### 22. Error estructurado

Toda falla controlada deberá conservar una identidad estructurada antes de la presentación.

Para autorización se consume `AUTH-SRV-016`.

Para reglas empresariales se consume el código de dominio aprobado por su owner.

Para fallos técnicos se conserva la clase técnica correspondiente.

Queda prohibido usar como contrato primario:

```text
throw new Error("No autorizado")
return false
return null
redirect("?error=texto")
SQLSTATE sin adapter
mensaje de Supabase
```

aunque un adapter final pueda mostrar copy aprobado.

#### 23. Frontera con `@vento/contracts`

`@vento/contracts` puede contener:

- identidad de política;
- versión;
- schema;
- catálogo;
- código;
- tipo derivado;
- metadata estática;
- fixture contractual cuando su propietario lo apruebe.

No contiene la lógica operacional específica de una aplicación por conveniencia.

Una política VISO no se mueve automáticamente a `@vento/contracts` solo para llamarla “compartida”.

#### 24. Frontera con `@vento/os-context`

`@vento/os-context` conserva:

- contexto;
- autorización;
- request scope;
- adapters y proyecciones seguras;
- compatibilidad runtime aprobada.

No absorbe:

- cálculo de horas de programación;
- reglas de descanso;
- solapamientos de turnos;
- límites mensuales;
- reglas de publicación;
- stock;
- precio;
- conciliación;
- reglas funcionales de otra aplicación.

La separación evita convertir el SDK de autorización en un motor de negocio universal.

#### 25. Frontera con Supabase y base de datos

La existencia de un helper server no reemplaza:

- constraints;
- transacciones;
- locks;
- funciones/RPC;
- RLS;
- triggers;
- validaciones de integridad;
- enforcement concurrente;

cuando el contrato de datos exija esas protecciones.

La regla es:

```text
HELPER SERVER
→ prepara y coordina

DB ENFORCEMENT
→ protege invariantes que deben sobrevivir a concurrencia y callers alternos
```

Una regla crítica protegida solo en TypeScript no se considera equivalente a una invariante que el contrato exige en base de datos.

#### 26. Una sola política, varias representaciones

Cuando una regla de dominio deba existir tanto en runtime TypeScript como en PostgreSQL, la arquitectura deberá evitar dos fuentes normativas independientes.

Modelo:

```text
POLITICA CANONICA VERSIONADA
        ↓
representacion runtime
        +
representacion DB
        ↓
fixtures/oracle compartidos
        ↓
prueba de paridad
```

La equivalencia se demuestra por:

- misma identidad de política;
- misma versión;
- mismos casos de frontera;
- mismos inputs semánticos;
- mismos resultados esperados;
- misma regla de redondeo, tiempo o inclusión cuando aplique.

No se exige compartir el mismo lenguaje ejecutable.

Se exige compartir el mismo significado.

#### 27. Cambio de política

Un cambio en una regla compartida deberá producir una nueva versión o revisión identificable antes de que dos capas adopten semánticas distintas.

Queda prohibido:

```text
actualizar TypeScript
+
dejar PostgreSQL anterior
+
seguir declarando misma politica
```

o lo inverso.

Durante una transición, la compatibilidad y orden de adopción deberán quedar explícitos.

#### 28. Helpers de preview

Un cálculo puro podrá reutilizarse para preview de cliente únicamente si:

1. no contiene autoridad;
2. no contiene secretos;
3. no requiere fuentes privadas;
4. su versión es identificable;
5. el servidor vuelve a calcular desde estado vigente antes del efecto;
6. el resultado cliente nunca funciona como autorización ni como bypass.

La experiencia reactiva no sustituye el gate server-side.

#### 29. Baseline físico de `@vento/os-context`

El package físico observado es transitorio.

Actualmente conserva wrappers legacy que:

```text
get_effective_context_v1
has_effective_permission_v1
start_context_simulation_v1
stop_context_simulation_v1
```

y una comprobación booleana de permiso.

`AUTH-SRV-017` no los convierte en helpers canónicos.

Su destino permanece gobernado por:

```text
SHELL-AUTH-001..005
```

hasta materializar las fronteras aprobadas y migrar consumidores.

#### 30. Prohibición de helpers de autorización paralelos

Después de materializar la unidad aplicable, no se considerarán arquitectura válida nuevos helpers equivalentes a:

```text
hasPermission
canAccess
canOperate
isAllowed
checkRole
requireRole
canUseSite
canUseArea
```

cuando implementen autoridad local por:

- rol;
- strings;
- booleanos;
- listas;
- cookies;
- navegación;
- permisos copiados;
- contexto legacy;
- sede o área del caller.

Un nombre similar no es automáticamente inválido; lo inválido es duplicar o degradar la decisión canónica.

#### 31. Helpers legacy existentes

Un helper local existente puede conservarse temporalmente solo como adapter si:

```text
1. esta inventariado
2. no agrega autoridad
3. delega a la frontera canonica
4. conserva semantica
5. tiene owner y retiro
6. no recibe nuevos consumidores
```

Cambiar internamente un helper legacy para que delegue al SDK puede ser una estrategia de migración.

Mantener su algoritmo anterior detrás de un nuevo nombre no lo es.

#### 32. Baseline VISO de autorización

El control actual de programación VISO contiene un helper local de acceso y guards locales.

Ese baseline no prueba:

- permiso atómico correcto para cada escritura;
- misma autorización entre semana y mes;
- misma semántica que el evaluador canónico;
- separación correcta de carril base y operativo;
- ausencia de role override legacy;
- respuesta normalizada `AUTH-SRV-016`.

La futura materialización debe migrar el control hacia la frontera canónica aplicable sin convertir el helper local en una excepción permanente.

#### 33. Package VISO mensual — obligación específica

El carryover de este minibloque exige:

```text
AUTH-SRV-017
→ calculo compartido/versionado entre semana, mes y DB
```

Esto se materializa contractualmente como:

```text
SEMANA
MES
PREVIEW
GUARDADO
PUBLICACION
DB ENFORCEMENT
```

consumiendo la misma política aplicable cuando evalúan la misma regla.

No significa que todas las superficies tengan idénticas responsabilidades.

Significa que una misma regla no puede tener significados distintos por pantalla o capa.

#### 34. VISO — fuente única del proceso de programación

Semana y Mes son proyecciones del mismo proceso de programación laboral.

Por tanto:

```text
vista semanal
≠ fuente de turnos independiente

vista mensual
≠ fuente de turnos independiente
```

Los helpers compartidos deberán operar sobre las mismas identidades persistidas y la misma semántica aprobada de turno, periodo y versión.

No se crean turnos “mensuales” como universo paralelo solo para facilitar una vista.

#### 35. VISO — duración de turno

La duración deberá depender de la política aprobada de programación.

La implementación actual de un cálculo no congela todavía:

- overnight;
- descanso;
- redondeo;
- límites de duración;
- pausas;
- tratamiento de turno de descanso.

Estas decisiones permanecen bajo `VISO-SCH-003`.

`AUTH-SRV-017` fija únicamente que, una vez aprobadas, semana, mes, preview, servidor y DB no podrán usar fórmulas divergentes.

#### 36. VISO — bloques mensuales

El máximo de bloques y las reglas de exclusividad de fechas forman parte del contrato funcional de programación.

Los valores físicos actuales no se promueven a canon por esta tarea.

Cuando `VISO-SCH-003` cierre esas reglas:

```text
parser
preview
guardado
publicacion
tests
```

deberán consumir la misma definición versionada o una representación derivada con paridad demostrada.

#### 37. VISO — límite mensual

`AUTH-SRV-017` no decide el valor del límite mensual.

Tampoco decide el umbral preventivo.

Los valores físicos observados continúan siendo provisionales hasta `VISO-SCH-004`.

La obligación que sí queda cerrada es:

```text
UNA POLITICA DE LIMITE APROBADA
→ UNA IDENTIDAD/VERSION
→ MISMO SIGNIFICADO EN PREVIEW, SERVER Y DB
```

No se permiten constantes independientes con el mismo significado en distintos módulos sin lineage o generación demostrable.

#### 38. VISO — total mensual

El cálculo mensual deberá usar exactamente el universo de turnos definido por la política aprobada.

La futura implementación no podrá calcular para mostrar una cosa y calcular para bloquear otra.

Cuando la regla exija considerar múltiples sedes:

- la resolución server-side obtiene el universo autorizado necesario;
- el cálculo puede incluir datos que el usuario no tiene derecho a listar individualmente;
- la respuesta pública devuelve solo el agregado permitido;
- el helper no amplía visibilidad para poder calcular.

Cálculo y exposición permanecen separados.

#### 39. VISO — conflictos

Los conflictos deberán ser recalculados en servidor desde estado actual inmediatamente antes del efecto cuando el contrato así lo exija.

Una lista de conflictos enviada por cliente sirve como UX, no como evidencia.

Cuando Semana y Mes detecten el mismo tipo de conflicto:

```text
misma politica
+
mismos inputs semanticos
→
mismo resultado
```

La política concreta de solapamientos, disponibilidad, descanso, territorio y demás conflictos permanece bajo `VISO-SCH-006`.

#### 40. VISO — guardado y publicación

Guardar borrador y publicar son comandos distintos.

El helper compartido podrá reutilizar primitives de:

- parseo;
- duración;
- total;
- conflictos;
- política;
- auditoría;

pero no fusiona sus permisos, transición ni efecto.

El pipeline debe permitir:

```text
GUARDAR BORRADOR
→ contrato propio

PUBLICAR
→ contrato propio
→ revalidacion completa de las reglas exigidas para publicacion
```

La política concreta de estados y publicación permanece bajo `VISO-SCH-005`.

#### 41. VISO — paridad Semana/Mes

La certificación futura deberá incluir fixtures equivalentes procesados por las rutas semanal y mensual.

Para una misma política y conjunto de turnos, se compararán al menos:

- minutos calculados;
- clasificación de descanso;
- periodo;
- conflictos comunes;
- límite aplicable;
- estado de bloqueo o advertencia cuando corresponda;
- versión de política utilizada.

Las diferencias solo son válidas cuando el contrato de la vista las declare expresamente como diferencia de presentación o comando.

#### 42. VISO — paridad TypeScript/PostgreSQL

Toda protección de base de datos que implemente la misma regla deberá verificarse contra el mismo oracle contractual.

La evidencia no se limita a comparar constantes.

Debe cubrir casos de frontera suficientes para detectar diferencias en:

- inclusión de fechas;
- cambio de mes;
- pausas;
- redondeo;
- límites exactos;
- acumulados;
- estados excluidos;
- concurrencia;
- reglas overnight cuando sean aprobadas.

Una coincidencia en el caso nominal no demuestra paridad.

#### 43. VISO — concurrencia

El helper server no puede resolver por sí solo una carrera entre dos publicaciones concurrentes cuando ambas observaron un estado previo válido.

La implementación deberá combinar:

```text
recalculo server
+
control transaccional/DB aplicable
+
version/frescura
+
idempotencia
```

según lo que apruebe `VISO-SCH-006` y la arquitectura física correspondiente.

Un precheck TypeScript sin enforcement aplicable no satisface la protección concurrente.

#### 44. VISO — notificación

La notificación posterior a una publicación no forma parte del cálculo que autoriza o valida el turno.

El helper de proceso deberá distinguir:

```text
efecto empresarial confirmado
+
evento/notificacion posterior
```

La falla de notificación no debe reescribir históricamente la autorización ni fingir que la publicación no ocurrió.

La política exacta de eventos y notificaciones permanece bajo `VISO-SCH-007` y los contratos de integración correspondientes.

#### 45. Política de tiempo

Todo helper que calcule periodos, vigencias o límites temporales deberá consumir una política explícita de tiempo cuando el dominio lo requiera.

No se permiten divergencias silenciosas por:

- timezone del navegador;
- timezone del proceso;
- `Date` local;
- UTC implícito;
- inicio de semana distinto;
- fecha inclusiva en una capa y exclusiva en otra.

La decisión exacta de zona horaria y horizontes de programación pertenece a `VISO-SCH-002`.

#### 46. Orden determinista

Cuando el orden de registros afecte un resultado, el helper deberá definirlo explícitamente o consumir un conjunto cuya semántica sea independiente del orden.

Queda prohibido:

```text
primera fila devuelta
→ autoridad
```

o:

```text
ultima fila sin orden contractual
→ estado vigente
```

La ambigüedad que impida decidir falla cerrada.

#### 47. Operaciones masivas

Un helper compartido para operaciones masivas deberá conservar:

- universo objetivo exacto;
- binding de operación;
- política de atomicidad;
- autorización de cada dimensión necesaria;
- reglas globales;
- reglas por miembro cuando apliquen;
- resultado por miembro cuando la atomicidad lo permita;
- evidencia de cero efectos parciales cuando se declare atomicidad total.

No se autoriza el lote por evaluar solo el primer elemento.

#### 48. Idempotencia

La idempotencia pertenece al efecto, no a la autorización.

Un helper podrá coordinar una clave idempotente aprobada, pero:

```text
idempotency key
≠ permission
≠ decision_id
≠ bypass
```

Una nueva realidad material que invalide la decisión exige reevaluación aunque la intención lógica pertenezca al mismo proceso.

#### 49. Write barrier

Después de una mutación que pueda cambiar:

- actor;
- contexto;
- permisos;
- turno;
- check-in;
- rol;
- sede;
- área;
- dispositivo;
- recurso;
- versión;
- política;

el scope debe invalidar los snapshots afectados conforme al contrato de write barrier.

Un helper no puede seguir utilizando una decisión anterior solo porque vive en la misma función.

#### 50. Simulación

La composición compartida mantiene:

```text
actor real
≠ sujeto simulado
```

y:

```text
WOULD_ALLOW
≠ ALLOW ejecutable
```

Un helper de dominio puede calcular un escenario hipotético si la simulación lo autoriza.

No puede convertir ese cálculo en persistencia real.

Toda tentativa de efecto real desde simulación conserva la razón canónica correspondiente.

#### 51. Dispositivo compartido

El helper no convierte:

```text
device principal
→ employee
```

ni:

```text
device app allowlist
→ permiso humano
```

La sesión de actor, el dispositivo, la capacidad y el contexto conservan identidades separadas.

La composición consume la decisión canónica y no reconstruye una segunda matriz local para terminales.

#### 52. Privacidad

Los helpers compartidos deberán minimizar:

- payloads;
- logs;
- traces;
- errores;
- metadata;
- caches;
- evidencia.

No se registran por defecto:

```text
JWT
cookies
service_role
API keys
grants completos
denies completos
payload empresarial completo
PII innecesaria
stack en respuesta pública
SQL bruto
```

La evidencia privada conserva únicamente lo exigido por su contrato de auditoría.

#### 53. Observabilidad

Una implementación compartida deberá permitir medir, sin alterar la decisión:

- versión de helper;
- versión de contratos;
- versión de política de dominio cuando aplique;
- consumidor;
- operación;
- latencia agregada;
- outcome agregado;
- clase de fallo;
- uso legacy;
- cache/single-flight cuando corresponda.

La ausencia de métrica no significa ausencia de uso.

Una etiqueta de observabilidad no concede autoridad.

#### 54. Compatibilidad y versionado

Cada futura unidad deberá declarar las combinaciones compatibles de:

```text
contratos
SDK
helper de operacion
politica de dominio
backend
consumidor
```

cuando sean materiales para el resultado.

Una evidencia obtenida con otra combinación no certifica automáticamente la actual.

Los consumidores podrán migrar de forma escalonada sin crear dos semánticas válidas para la misma regla.

#### 55. Adopción por consumidores

Cada superficie que adopte el helper compartido deberá conservar lineage:

```text
consumer identity
current behavior
target helper/composition
binding
contracts
domain policy
backend
tests
rollback
```

El cambio se considera completo solo cuando la superficie deja de depender de la autoridad local reemplazada.

Importar un helper nuevo mientras se conserva el fallback legacy no constituye migración completa.

#### 56. Reglas anti-“god helper”

Queda prohibido consolidar todo el servidor en una función que simultáneamente:

- lea sesión;
- decida permiso localmente;
- elija rol;
- elija sede;
- calcule negocio;
- ejecute SQL;
- redirija;
- construya copy;
- envíe notificación;
- escriba auditoría;

sin fronteras testeables.

Compartir no significa mezclar.

La composición puede ser central mientras las responsabilidades permanecen separadas.

#### 57. Disposición del helper VISO actual

El módulo helper actual de programación constituye baseline transitorio.

La futura materialización deberá clasificar sus funciones en:

```text
CONSERVAR COMO PRIMITIVE PURA
MOVER A CONTRATO/SDK EXISTENTE
MOVER A DOMINIO VERSIONADO
DELEGAR A BACKEND
MANTENER COMO ADAPTER DE PRESENTACION
DEPRECAR/RETIRAR
```

La clasificación se hará contra el código del commit asignado a la instancia.

Este marcador no prescribe nombres de archivos nuevos ni declara que el módulo actual deba borrarse completo.

#### 58. Disposición de guards locales

Un guard local puede seguir existiendo como adapter de framework si su única responsabilidad es traducir una decisión canónica hacia navegación o respuesta del framework.

No puede conservar como autoridad propia:

- role overrides;
- booleanos legacy;
- permisos construidos localmente;
- sede o área enviada como autoridad;
- fallback de aplicación;
- redirects cuyo query revele permiso o causa interna.

La lógica de autorización permanece en la frontera canónica.

#### 59. Materialización futura

Cada instancia:

```text
AUTH-SRV-017::<implementation_unit_id>
```

deberá registrar como mínimo evidencia de:

```text
implementation_unit_id
repository
commit_before
consumer_surface_identities
shared_helper_scope
helper_responsibility_classes
canonical_authorization_operations_consumed
operation_bindings
domain_policies_consumed
policy_versions
backend_enforcement_dependencies
legacy_helpers_replaced_or_adapted
request_scope_and_write_barrier
error_normalization
audit_lineage
validation_commands
rollback
package_ids
evidence
commit_after
```

Los nombres anteriores describen contenido mínimo del expediente.

No obligan a crear campos físicos homónimos.

#### 60. Evidencia mínima de una futura unidad

La materialización deberá demostrar, cuando aplique:

1. cada superficie tiene binding server-side;
2. el cliente no selecciona permiso;
3. el cliente no selecciona outcome;
4. contexto y autorización delegan a la frontera canónica;
5. no existe un segundo evaluador local;
6. `requireAuthorization` o su frontera canónica equivalente bloquea todo excepto `ALLOW`;
7. `DENY` y fallo técnico permanecen diferenciados;
8. reglas de dominio no se convierten en códigos de autorización;
9. parsing no concede autoridad;
10. resolución no concede autoridad;
11. payload final se reconstruye;
12. ningún body completo llega directo a persistencia;
13. `service_role` no sustituye autorización;
14. los helpers puros no ejecutan red ni redirects;
15. los adapters de canal no deciden negocio;
16. errores estructurados preceden al copy;
17. no existen nuevos booleanos de autoridad;
18. no existen nuevos role/bypass helpers;
19. legacy nuevo = 0;
20. consumers no inventariados = 0;
21. el request scope no se comparte entre actores;
22. la write barrier invalida decisiones afectadas;
23. idempotencia no funciona como permiso;
24. decisiones stale se reevalúan;
25. las operaciones masivas no autorizan solo el primer miembro;
26. la simulación no ejecuta efectos reales;
27. el dispositivo no aporta autoridad humana;
28. observabilidad no contiene secretos;
29. evidencia corresponde a la misma combinación de versiones y commits;
30. rollback no restaura autoridad local eliminada;
31. cuando una política existe en TS y DB, ambas declaran la misma identidad/version;
32. fixtures de paridad cubren casos de frontera;
33. preview cliente no sustituye recálculo server;
34. Semana y Mes no mantienen fuentes de turnos paralelas;
35. Semana y Mes producen el mismo resultado para reglas comunes;
36. el valor de límite VISO proviene del owner aprobado, no del baseline provisional;
37. el umbral preventivo proviene del mismo owner;
38. duración/overnight provienen del contrato funcional aprobado;
39. conflictos se recalculan server-side;
40. publicación revalida reglas aplicables;
41. DB enforcement protege concurrencia cuando el contrato lo exige;
42. una carrera concurrente no se resuelve solo con precheck TypeScript;
43. agregados multi-sede no amplían visibilidad;
44. notificación posterior no reescribe el resultado empresarial;
45. timezone y fronteras de periodo coinciden donde la regla es común;
46. un cambio de política no conserva falsamente la misma versión.

#### 61. Rollback

El rollback de una futura unidad deberá restaurar una combinación previamente soportada sin:

- volver a crear un evaluador local;
- restaurar `hasPermission` booleano como autoridad final;
- restaurar role override como bypass;
- restaurar `can_operate` como decisión;
- volver a confiar en sede, área, actor o permiso del caller;
- reintroducir una política de dominio divergente;
- reactivar constantes desactualizadas bajo la misma versión;
- convertir un helper legacy retirado en arquitectura estable;
- perder el binding server-side;
- mezclar `DENY` y fallo técnico;
- perder el write barrier;
- reutilizar decisiones stale;
- retirar enforcement DB requerido;
- perder lineage de auditoría;
- borrar evidencia histórica válida.

Si una versión anterior ya no es segura o compatible, no constituye rollback permitido.

#### 62. Criterios de aceptación

`AUTH-SRV-017` queda documentalmente satisfecha cuando:

1. se define qué es un helper server compartido;
2. se fija que compartir no implica package público;
3. se preserva `@vento/contracts` como autoridad estática;
4. se preserva `@vento/os-context/server` como runtime canónico de autorización;
5. se preserva Supabase/backend como productor autoritativo aplicable;
6. no se crea un package competidor;
7. se consumen las seis operaciones ya aprobadas del SDK;
8. no se crean wrappers públicos alternativos de autorización;
9. se define la taxonomía de helpers;
10. se separa validación contractual de autorización;
11. se separa cálculo de dominio de autorización;
12. se separa resolución de dominio de autorización;
13. se separa persistencia de autorización;
14. se separa auditoría de decisión;
15. se separa presentación de causa;
16. cada operación exige binding server-side;
17. el cliente no selecciona un permiso más débil;
18. se fija request scope;
19. se fija el pipeline mínimo de operación;
20. parsear no equivale a autorizar;
21. resolver no equivale a autorizar;
22. solo `ALLOW` válido continúa;
23. un `ALLOW` no satisface reglas empresariales posteriores;
24. se definen propiedades de cálculo puro;
25. se definen propiedades de resolución autoritativa;
26. el payload efectivo se reconstruye;
27. redirects quedan en adapters de canal;
28. errores se estructuran antes del copy;
29. `@vento/contracts` no absorbe lógica empresarial runtime;
30. `@vento/os-context` no absorbe programación laboral;
31. helpers no reemplazan enforcement DB;
32. una regla TS/DB consume una política semánticamente única;
33. cambios de política exigen identidad/versionado coherente;
34. previews de cliente permanecen no autoritativos;
35. el package físico `@vento/os-context@0.1.0` permanece baseline transitorio;
36. wrappers legacy actuales no se promueven;
37. se prohíbe nuevo evaluador local;
38. se define compatibilidad temporal de helpers legacy;
39. VISO Semana y Mes conservan una sola fuente de programación;
40. VISO comparte cálculo/versionado para reglas comunes;
41. esta tarea no fija overnight;
42. esta tarea no fija máximo de bloques;
43. esta tarea no fija límite mensual;
44. esta tarea no fija umbral preventivo;
45. los valores físicos provisionales no se canonizan;
46. agregados y exposición permanecen separados;
47. conflictos se recalculan en servidor;
48. guardar y publicar conservan comandos distintos;
49. se exige paridad Semana/Mes;
50. se exige paridad semántica TS/PostgreSQL cuando aplique;
51. concurrencia crítica no se protege solo con precheck;
52. notificación queda fuera de la autoridad del cálculo;
53. tiempo y periodo deben ser coherentes;
54. ambigüedad falla cerrada;
55. operaciones masivas conservan universo y atomicidad;
56. idempotencia no concede autoridad;
57. write barrier invalida snapshots;
58. simulación no se convierte en ejecución;
59. dispositivo no se convierte en actor;
60. privacidad y observabilidad quedan minimizadas;
61. adopción conserva lineage por consumidor;
62. se prohíbe un “god helper”;
63. el helper VISO actual se clasifica en la instancia y no se canoniza por existencia;
64. guards locales solo podrán sobrevivir como adapters no autoritativos;
65. se define evidencia mínima por unidad;
66. se define rollback sin reactivar autoridad legacy;
67. no se autorizan cambios físicos desde el marcador global;
68. no se crean ni modifican requisitos de prueba.

#### 63. Límites

Este marcador no certifica todavía:

- código físico de helpers;
- nombres de nuevos módulos internos;
- layout físico definitivo;
- publicación de packages;
- materialización de `@vento/contracts`;
- materialización estable de `@vento/os-context`;
- migración de guards;
- migración de Server Actions;
- retiro de wrappers legacy;
- implementación de RPC;
- implementación de RLS;
- constraints o triggers;
- transacciones;
- migraciones Supabase;
- datos;
- despliegues;
- límite mensual definitivo de VISO;
- umbral preventivo definitivo;
- máximo definitivo de bloques;
- overnight;
- descanso definitivo;
- redondeo;
- política de excepciones;
- reglas completas de conflicto;
- mecanismo definitivo de concurrencia;
- estados definitivos de publicación/corrección;
- prerrequisitos administrativos sin turno;
- comportamiento productivo.

Owners pendientes y condición de salida:

```text
VISO-SCH-002
→ aprobar horizontes y politica temporal
→ entonces helpers temporales consumen esa definicion

VISO-SCH-003
→ aprobar bloques, duracion, overnight y descansos
→ entonces los calculos comunes consumen esa politica

VISO-SCH-004
→ aprobar limite, advertencia, vigencia y excepciones
→ entonces preview/server/DB consumen una politica definitiva

VISO-SCH-005
→ aprobar borrador, revision, publicacion y correccion
→ entonces la composicion aplica las transiciones definitivas

VISO-SCH-006
→ aprobar conflictos, integridad y concurrencia
→ entonces helper y DB materializan el enforcement definitivo

VISO-SCH-007
→ aprobar auditoria, eventos y notificaciones
→ entonces el proceso materializa su post-efecto definitivo

AUTH-SRV-018
→ aprobar prerrequisitos administrativos sin turno
→ entonces los helpers consumen esa clasificacion sin inferencias

SHELL-AUTH-001..005
→ materializar SDK, adapters, scope, gates y migracion de consumidores
→ entonces las unidades dejan de depender de autoridad legacy
```

#### 64. Evidencia de validación

| Clase     | Estado           | Evidencia                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| --------- | ---------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | `NOT_EXECUTED`   | no se ejecutó build durante el desarrollo documental                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| LOCAL     | `NOT_EXECUTED`   | no se ejecutaron comandos contra el checkout del usuario                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| REMOTA    | `PASS`           | se auditaron en solo lectura la continuidad vigente, el contrato de entrega, la topología `PER_IMPLEMENTATION_UNIT`, las políticas de formato y desarrollo, el archivo propietario de `AUTH-SRV-017`, `AUTH-SRV-004..016`, la arquitectura de `@vento/contracts` y `@vento/os-context`, el registro 04A AUTH/SHELL/VISO relevante, el baseline físico transitorio de `packages/os-context`, los helpers y guards actuales de programación VISO, las tareas `VISO-SCH-001..008` y los scripts documentales declarados en `package.json` |
| OPERATIVA | `NOT_APPLICABLE` | el marcador no cambia operación real                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| FÍSICA    | `NOT_APPLICABLE` | no existe instancia física autorizada para esta tarea                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |

#### 65. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Justificación:** la reutilización de autorización y contexto compartidos, el request scope, la prohibición de autoridad legacy local, la migración de consumidores, el cálculo común de programación, la paridad entre Semana/Mes y entre runtime/base de datos, el recálculo server-side, la concurrencia, la auditoría y el rollback ya cuentan con cobertura canónica vigente. Esta tarea organiza esas obligaciones dentro del contrato de composición de helpers server sin introducir una regla verificable nueva ni modificar el registro de pruebas.

#### 66. Cobertura de prueba vigente reutilizada

Se reutiliza sin modificar el registro vigente:

- `TREQ-AUTH-004` — misma decisión y razones equivalentes entre evaluadores;
- `TREQ-AUTH-015` — evidencia correlacionable de contexto, decisión y resultado;
- `TREQ-SHELL-002` — responsabilidades compartidas no se resuelven mediante copias divergentes;
- `TREQ-SHELL-061` a `TREQ-SHELL-098` — SDK, adapters, request scope, write barrier, consumer registry, freeze legacy, migración, paridad, seguridad, compatibilidad, lineage y rollback;
- `TREQ-VISO-025` — Semana y Mes consumen una sola fuente de programación;
- `TREQ-VISO-026` — preview mensual recalcula minutos actuales, propuestos y proyectados;
- `TREQ-VISO-029` y `TREQ-VISO-030` — bloques y duración se validan con reglas equivalentes;
- `TREQ-VISO-032` a `TREQ-VISO-036` — política mensual versionada, total multi-sede, umbral/límite únicos y paridad de publicación;
- `TREQ-VISO-038` a `TREQ-VISO-040` — recálculo de conflictos, concurrencia y rollback;
- `TREQ-VISO-042` a `TREQ-VISO-045` — revalidación server-side, auditoría, notificación y error canónico.

Estas referencias son trazabilidad heredada y no representan requisitos creados o modificados por `AUTH-SRV-017`.

#### 67. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-SRV-016 — Normalizar errores de autorización`

**TAREA ACTUAL APROBADA**
`AUTH-SRV-017 — Crear helpers server compartidos`

**SIGUIENTE TAREA RESERVADA**
`AUTH-SRV-018 — Revisar acciones administrativas sin turno`


### ✅ AUTH-SRV-018 — Revisar acciones administrativas sin turno

**Estado:** APROBADA
**Tarea anterior:** AUTH-SRV-017 — Crear helpers server compartidos
**Tarea siguiente:** AUTH-DB-015 — Documentar y versionar todas las migraciones en vento-shell
**Tipo de tarea:** Contrato global con materialización por unidad (`PER_IMPLEMENTATION_UNIT`) — contrato de clasificación y prerrequisitos para que toda acción administrativa protegida pueda ejecutarse sin turno ni check-in únicamente cuando su permiso y modalidad canónicos habiliten el carril base, conservando identidad, aplicación, permiso exacto, cobertura administrativa, territorio, recurso, estado, denegaciones, frescura, dispositivo, simulación, auditoría y reglas de dominio sin convertir la ausencia de contexto operativo en bypass
**Bloque:** BLOQUE J — Protección de acciones de servidor
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/J_ACCIONES_DE_SERVIDOR/03_AUDITORIA_ERRORES_Y_HELPERS_COMPARTIDOS.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global; las futuras materializaciones ocurren únicamente mediante `AUTH-SRV-018::<implementation_unit_id>` después de que `DELIV-PKG-025::<package_id>` asigne la unidad y el paquete propietario supere `E5-GATE-008::<package_id>`
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Cerrar la frontera pendiente entre administración y operación para que ninguna Server Action, Route Handler, RPC adapter, job o superficie equivalente:

- exija un turno al administrador cuando el permiso canónico pertenece al carril base y declara prerrequisito `N`;
- elimine controles de autorización por el hecho de no exigir turno;
- use un rol, una sede seleccionada, un dispositivo, una sesión denominada “operativa”, un admin client o `service_role` como sustituto de autoridad administrativa;
- transforme una capacidad operativa en administrativa para evitar turno o check-in;
- reutilice un permiso de consulta como autoridad implícita para crear, modificar, eliminar, publicar o corregir.

La regla vinculante queda:

```text
ACCION ADMINISTRATIVA SIN TURNO
=
BINDING SERVER-SIDE EXACTO
+
PERMISO CANONICO QUE ADMITE CARRIL BASE
+
PRERREQUISITO BASE N
+
PRINCIPAL Y ACTOR VALIDOS
+
CARRIL BASE VALIDO
+
COBERTURA ADMINISTRATIVA SUFICIENTE
+
TERRITORIO Y RECURSO COMPATIBLES
+
ESTADO Y REGLAS DE DOMINIO VIGENTES
+
DENEGACIONES Y RESTRICCIONES SATISFECHAS
+
EVIDENCIA Y AUDITORIA
```

Nunca:

```text
SIN TURNO
=
SIN CONTEXTO
=
SIN PERMISO
=
SIN ALCANCE
=
SIN RECURSO
=
SIN AUDITORIA
```

#### 2. Handoff recibido de `AUTH-SRV-017`

`AUTH-SRV-017` deja definida una composición compartida de servidor que separa:

```text
validacion contractual
autorizacion runtime
calculo de dominio
resolucion de dominio
persistencia
auditoria
respuesta
compatibilidad legacy
```

También deja fijado que:

- el helper compartido no crea autoridad;
- el binding de operación se resuelve en servidor;
- contexto y autorización se delegan a la frontera canónica;
- las reglas de dominio se ejecutan después de una autorización positiva;
- el payload efectivo se reconstruye en servidor;
- una misma regla debe conservar semántica y versión coherentes entre consumidores;
- los guards locales solo podrán sobrevivir como adapters no autoritativos;
- el baseline VISO actual no se promueve a arquitectura final.

`AUTH-SRV-018` consume ese contrato y añade la decisión que `AUTH-SRV-017` dejó expresamente pendiente: qué debe exigirse cuando la acción es administrativa y no necesita turno.

#### 3. Handoff acumulado de `AUTH-SRV-004..017`

La acción administrativa sin turno continúa consumiendo, cuando aplique, los contratos ya aprobados para:

```text
intencion no autoritativa del cliente
permiso exacto
sede
area
turno cuando corresponda
rol operativo cuando corresponda
dispositivo compartido
estado actual de la entidad
cruces entre sedes
cruces entre areas
actor real y efectivo
simulacion
errores normalizados
helpers compartidos
frescura
auditoria
```

La palabra “administrativa” modifica únicamente los prerrequisitos del carril que corresponden a turno, check-in, rol operativo y territorio derivado del turno.

No elimina los demás controles.

#### 4. Pregunta contractual propietaria

Esta tarea responde:

```text
¿QUE DEBE VALIDAR UNA ACCION ADMINISTRATIVA
CUANDO EL ACTOR NO TIENE TURNO?
```

```text
¿QUE CONTEXTO OPERATIVO DEJA DE SER OBLIGATORIO
Y QUE AUTORIDAD BASE SIGUE SIENDO OBLIGATORIA?
```

```text
¿COMO EVITAR QUE "SIN TURNO"
SE CONVIERTA EN UN BYPASS ADMINISTRATIVO?
```

Para el package VISO mensual responde además:

```text
¿COMO PUEDE UN ADMINISTRADOR
PROGRAMAR, CORREGIR O PUBLICAR TURNOS DE TERCEROS
SIN NECESITAR EL MISMO UN TURNO OPERATIVO,
PERO CONSERVANDO PERMISO, TERRITORIO,
ESTADO, AUDITORIA Y REGLAS DE PROGRAMACION?
```

#### 5. Frontera con `AUTH-SRV-008`

`AUTH-SRV-008` ya decidió:

```text
CAPACIDAD ADMINISTRATIVA
→ puede no requerir turno cuando el contrato lo permita

CAPACIDAD OPERATIVA
→ exige turno publicado y vigente
```

`AUTH-SRV-018` no reabre esa decisión.

La especializa para las acciones administrativas y fija qué controles permanecen obligatorios cuando el turno es `NOT_APPLICABLE`.

Por tanto:

```text
AUTH-SRV-008
→ decide cuándo corresponde validar turno

AUTH-SRV-018
→ cierra el contrato completo del carril administrativo cuando no corresponde
```

#### 6. Autoridad de clasificación

Una acción no se clasifica como administrativa por:

- estar dentro de VISO;
- aparecer en una pantalla de administración;
- ser ejecutada por un gerente;
- utilizar `createAdminClient`;
- utilizar `service_role`;
- operar datos de trabajadores;
- modificar turnos;
- ejecutarse fuera del horario laboral;
- estar en una ruta denominada `admin`;
- recibir una sede seleccionada;
- no encontrar un turno vigente.

La clasificación procede de:

```text
permission_key canonica
+
authorization modality
+
prerrequisitos contractuales
+
binding server-side de la operacion
```

La implementación no puede cambiar de carril después de observar que el carril esperado sería denegado.

#### 7. Semántica de prerrequisito `N`

Para el carril base:

```text
N
=
turno no requerido
+
check-in no requerido
```

`N` no significa:

```text
actor no requerido
permiso no requerido
app access no requerido
rol base no requerido cuando aplique
cobertura administrativa no requerida
sede no requerida cuando el recurso es territorial
area administrativa no requerida cuando el permiso la exige
recurso no requerido
estado no requerido
denegaciones ignoradas
dispositivo ignorado
simulacion ejecutable
frescura ignorada
auditoria opcional
```

El prerrequisito `N` elimina dos dependencias concretas; no elimina el modelo de autorización.

#### 8. Matriz de modalidad y posibilidad de ejecutar sin turno

| Modalidad              | Carril base | Carril operativo | ¿Puede una operación autorizada por base ejecutarse sin turno?               |
| ---------------------- | ----------- | ---------------- | ---------------------------------------------------------------------------- |
| `BASE_ONLY`            | `N`         | no aplica        | Sí, si todos los demás controles son válidos                                 |
| `BASE_OR_OPERATIONAL`  | `N`         | `T` o `T+C`      | Sí, solo cuando el binding permite que el carril base autorice esa operación |
| `BASE_AND_OPERATIONAL` | `N`         | `T+C`            | No; ambos carriles son obligatorios                                          |
| `OPERATIONAL_ONLY`     | no aplica   | `T` o `T+C`      | No                                                                           |

La modalidad es parte del contrato versionado del permiso.

No se infiere desde el actor ni desde la pantalla.

#### 9. Carriles independientes

El contexto conserva:

```text
BASE LANE
→ identidad laboral aplicable
→ rol base
→ grants y denies
→ cobertura administrativa

OPERATIONAL LANE
→ turno
→ check-in
→ rol operativo
→ sede operativa
→ area operativa
```

La ausencia de turno, check-in, rol operativo o área operativa no invalida por sí sola un carril base válido.

A la inversa, un turno válido no crea un carril base.

#### 10. Un turno existente no transforma la acción administrativa

Si el actor administrativo además tiene un turno vigente:

```text
accion administrativa
+
turno vigente
=
accion administrativa
```

El turno:

- no amplía cobertura administrativa;
- no concede el permiso administrativo;
- no reemplaza el rol base;
- no reemplaza grants;
- no elimina denies;
- no convierte su sede operativa en alcance administrativo;
- no obliga a usar su área operativa para administrar otro recurso.

El contexto operativo puede conservarse como evidencia cuando sea relevante, pero no se convierte en fuente del carril base.

#### 11. Ausencia de turno

Para una operación cuyo binding se resuelve válidamente por carril base con `N`:

```text
active_shift = null
active_checkin = null
operational_role = null
operational_site = null
operational_area = null
```

puede ser un estado completamente válido.

La implementación no debe fabricar:

- un turno ficticio;
- un turno “administrativo”;
- un rol operativo por defecto;
- una sede operativa tomada del selector;
- un área operativa tomada del recurso;
- un check-in técnico.

#### 12. Problemas estructurales del carril operativo

Un problema que invalida exclusivamente el carril operativo no debe bloquear automáticamente una operación que:

1. admite autorización por carril base;
2. obtuvo un carril base completo y válido;
3. no exige el carril operativo por modalidad;
4. no depende funcionalmente del dato operativo inválido.

Ejemplos conceptuales:

```text
no active shift
expired shift
missing operational role
missing operational area
```

no son por sí solos razones para denegar un `BASE_ONLY` válido.

La clasificación de la causa debe conservar el carril al que pertenece.

#### 13. Problemas que sí bloquean una acción administrativa

La acción administrativa falla cerrada cuando sea obligatorio y resulte inválido, ausente, ambiguo o incompatible cualquiera de estos elementos:

```text
sesion o principal
actor efectivo
identidad de dominio
identidad laboral
app access
permission binding
permission contract
base lane
rol base o fuente equivalente requerida
grant aplicable
deny
administrative coverage
site scope
area scope administrativo cuando aplique
resource identity
resource state
resource ownership/territory
policy/version
device restriction
strong reauthentication cuando aplique
simulation restriction
freshness
concurrency
domain invariant
audit correlation
```

La ausencia de turno no repara una inconsistencia del carril base.

#### 14. Principal autenticado y sesión

Una acción administrativa humana exige una sesión personal válida cuando su contrato sea humano.

Debe distinguir:

```text
principal tecnico
actor efectivo
identidad laboral
```

No se admite:

```text
auth_user_id
=
employee_id
```

por inferencia.

Una sesión válida prueba autenticación.

No prueba autorización administrativa.

#### 15. Actor efectivo

Toda mutación administrativa debe poder atribuirse a un actor efectivo válido.

Para una acción laboral humana:

```text
principal HUMAN_USER
+
employee resuelto
+
employee activo
=
candidato a actor efectivo
```

La resolución se realiza en servidor.

Un actor `UNRESOLVED` no produce una mutación empresarial que requiera actor humano.

#### 16. Estado de la identidad

La ausencia de turno no permite ignorar:

- trabajador inactivo;
- vínculo terminado;
- identidad ambigua;
- identidad laboral ausente cuando la capacidad la exige;
- sesión expirada;
- principal conflictivo;
- configuración contradictoria.

Una identidad inactiva no se vuelve administradora porque la capacidad sea `N`.

#### 17. Acceso a la aplicación

El acceso a la aplicación y el permiso de acción permanecen separados:

```text
app access
≠
action permission
```

Entrar a VISO no autoriza:

- crear programación;
- modificar programación;
- eliminar borradores;
- publicar;
- corregir;
- aprobar excepciones.

Cada operación protegida conserva su binding propio.

#### 18. Permiso exacto de la acción

Toda mutación administrativa deberá exigir el permiso exacto definido para su operación.

Regla:

```text
view
≠
create
≠
update
≠
delete
≠
review
≠
publish
≠
correct
≠
approve exception
```

Un permiso de consulta no se convierte en permiso de mutación porque:

- la misma pantalla contenga el botón;
- el código actual lo reutilice;
- el actor sea gerente;
- la ruta esté protegida;
- el cliente use un admin client después del guard.

Si el permiso exacto todavía no está cerrado por su owner funcional, la materialización permanece bloqueada para esa operación.

#### 19. Rol base no equivale a permiso

El rol base puede participar en la resolución de grants y cobertura.

No concede por sí solo la operación.

Quedan prohibidos bypasses conceptuales como:

```text
if propietario → allow
if gerente_general → allow
if gerente → allow
if admin → allow
```

sin una decisión de permiso canónica.

La jerarquía organizacional no sustituye el catálogo.

#### 20. Concesiones y denegaciones

La evaluación administrativa debe conservar:

- grants de rol base;
- grants individuales cuando existan;
- denies transversales;
- denies por rol;
- denies individuales;
- restricciones de segregación;
- restricciones de recurso;
- restricciones territoriales.

Una denegación aplicable no desaparece por ejecutar la acción fuera de turno.

#### 21. Cobertura administrativa

La cobertura administrativa es el territorio disponible para el carril base.

Puede representar, según el contrato:

```text
organization
assigned sites
specific site
assigned areas
specific area
own resource
third-party explicit scope
```

La cobertura se resuelve desde fuentes autoritativas.

No se deriva automáticamente de:

- sede primaria;
- sede del turno;
- sede seleccionada;
- última sede usada;
- área del dispositivo;
- área del recurso;
- rol textual.

#### 22. Sede administrativa

Una acción administrativa sobre un recurso con sede debe comprobar que la sede objetivo pertenece al alcance administrativo del actor.

El `site_id` recibido por formulario o URL es:

```text
SELECTOR_INTENT
```

El servidor debe resolver:

```text
site objetivo
+
site activa
+
relacion del recurso con la site
+
cobertura administrativa del actor
```

antes del efecto.

`site_id` seleccionado no crea cobertura.

#### 23. Área administrativa y área operativa

Se mantienen separadas:

```text
administrative area scope
≠
operational area
```

Una capacidad administrativa puede:

- no requerir área;
- aplicar a toda una sede autorizada;
- exigir una o varias áreas administrativas específicas;

según su contrato.

No se debe fabricar un área operativa solo porque el recurso administrado tenga área.

#### 24. El recurso administrado puede ser operativo

Administrar un recurso operativo no convierte al administrador en actor operativo.

Ejemplo conceptual:

```text
ADMINISTRADOR
→ programa un turno para EMPLEADO OBJETIVO
```

Los datos:

```text
target shift
target operational role
target site
target area
target check-in policy
```

pertenecen al recurso o trabajador administrado.

No describen el turno, rol operativo o área operativa del administrador.

Esta separación es obligatoria para programación laboral.

#### 25. Estado actual del recurso

Una capacidad administrativa sin turno sigue obligada a revalidar el estado actual del recurso antes del efecto.

Según la operación puede incluir:

```text
existencia
activo/inactivo
draft/published/cancelled
version
revision
owner
site
area
period
locks
conflicts
relations
```

Una autorización base positiva no autoriza una transición imposible.

#### 26. Reglas de dominio

Después de autorizar el carril base todavía deben cumplirse las reglas empresariales.

Ejemplos:

```text
limite
conflicto
periodo
estado
atomicidad
concurrencia
version
excepcion
integridad
```

La ausencia de turno del administrador no modifica esas reglas.

#### 27. Frontera de confianza del cliente

Para una acción administrativa:

```text
formData
URL
query
JSON
hidden input
client calculation
```

continúan siendo intención.

No pueden decidir:

- actor;
- permission key;
- modalidad;
- cobertura;
- rol base;
- sede autorizada;
- área autorizada;
- `published_by`;
- límite;
- conflicto;
- estado final;
- autorización.

El payload efectivo se reconstruye en servidor.

#### 28. `service_role` y clientes administrativos

`service_role`, un admin client o una función privilegiada son mecanismos técnicos de persistencia.

No son autoridad empresarial.

La regla es:

```text
autorizacion empresarial valida
+
efecto reconstruido
+
adapter privilegiado cuando aplique
=
persistencia permitida
```

Nunca:

```text
admin client disponible
=
accion administrativa autorizada
```

#### 29. Simulación

Una acción simulada puede mostrar:

```text
WOULD_ALLOW
WOULD_DENY
preview
decision
```

según su contrato.

No puede convertir una capacidad administrativa sin turno en efecto real.

La simulación conserva:

```text
real actor
≠
simulated subject
```

y:

```text
WOULD_ALLOW
≠
ALLOW ejecutable
```

#### 30. Dispositivo compartido

La ejecución desde dispositivo compartido no elimina ningún prerrequisito administrativo.

Cuando la clasificación de dispositivo de un permiso administrativo exija control `STRONG`, la futura materialización deberá demostrar:

- dispositivo permitido para la aplicación;
- actor humano efectivo;
- permiso real del actor;
- cobertura real del actor;
- soporte de reautenticación fuerte aprobado;
- reautenticación personal vigente;
- restricción territorial del dispositivo cuando aplique;
- cero herencia de privilegios desde `navigation_role`, plantilla o paquete del dispositivo.

Un PIN ligero no sustituye una exigencia `STRONG`.

#### 31. Terminal administrativa

Una terminal administrativa autorizada:

```text
habilita una superficie compatible
```

No:

```text
concede cobertura administrativa
concede rol base
concede permiso
concede organizacion completa
convierte al dispositivo en actor
```

La autoridad continúa perteneciendo al actor humano y a su decisión canónica.

#### 32. Reautenticación fuerte

Cuando el catálogo o la política del dispositivo exijan reautenticación fuerte, una acción `N` sigue siendo:

```text
sin turno
+
sin check-in
```

pero no:

```text
sin reautenticacion
```

Turno y reautenticación protegen riesgos diferentes.

#### 33. Pipeline mínimo de una acción administrativa sin turno

La composición aplicable es:

```text
1. recibir intencion
2. validar forma
3. resolver binding server-side
4. resolver principal y actor
5. resolver identidad de dominio/laboral aplicable
6. resolver app access
7. resolver contrato exacto del permiso
8. confirmar modalidad y prerrequisito base N
9. resolver carril base
10. resolver cobertura administrativa
11. resolver recurso y territorio objetivo
12. evaluar permiso y denies
13. resolver estado actual
14. recalcular reglas de dominio
15. comprobar frescura y concurrencia
16. reconstruir payload efectivo
17. ejecutar efecto autorizado
18. aplicar invalidacion/write barrier cuando corresponda
19. registrar auditoria
20. normalizar respuesta
```

No aparece como paso obligatorio:

```text
resolver un turno del administrador
```

cuando el permiso es válidamente `N`.

#### 34. Operaciones de consulta

Una consulta administrativa sin turno sigue exigiendo:

- identidad;
- aplicación;
- permiso de consulta;
- cobertura;
- recurso o colección autorizada;
- proyección mínima;
- privacidad;
- filtros server-side;
- auditoría cuando corresponda.

La ausencia de turno no habilita listas globales.

#### 35. Operaciones de mutación

Una mutación administrativa sin turno añade, como mínimo:

- permiso mutante exacto;
- recurso actual;
- transición válida;
- allowlist de campos;
- reconstrucción del payload;
- frescura;
- concurrencia cuando aplique;
- evidencia before/after;
- idempotencia cuando aplique;
- rollback o compensación según el dominio.

Que la mutación sea administrativa no reduce el estándar de protección.

#### 36. Package VISO mensual — clasificación del proceso

La programación laboral administrativa opera sobre los turnos de otros trabajadores y puede realizarse fuera del turno operativo del administrador.

El catálogo vigente ya distingue:

```text
viso.workforce.schedules.view
→ BASE_ONLY
→ N
```

y clasifica la programación del personal como administrativa.

También existen capacidades canónicas de planificación laboral que crean, actualizan o cancelan turnos sin depender del turno operativo del administrador.

Esta evidencia fija la naturaleza administrativa de la planificación.

No fija por sí sola qué clave exacta debe autorizar cada mutación del package mensual.

#### 37. Package VISO mensual — acciones observadas

El baseline físico contiene cuatro superficies mutantes:

```text
createMonthlyShiftsAction
deleteMonthlyDraftShiftAction
deleteMonthlyDraftsAction
publishMonthAction
```

Todas pertenecen al proceso de programación laboral, pero no son la misma operación.

La futura materialización debe tratarlas como bindings distintos.

#### 38. Matriz de prerrequisitos del administrador para VISO mensual

| Acción observada                | Naturaleza del actor | Turno del administrador | Check-in del administrador | Obligación principal                                                             |
| ------------------------------- | -------------------- | ----------------------- | -------------------------- | -------------------------------------------------------------------------------- |
| `createMonthlyShiftsAction`     | administrativa       | no por inferencia       | no por inferencia          | permiso mutante exacto + cobertura sobre persona/sede + reglas de programación   |
| `deleteMonthlyDraftShiftAction` | administrativa       | no por inferencia       | no por inferencia          | permiso mutante exacto + recurso draft autorizado + territorio + estado          |
| `deleteMonthlyDraftsAction`     | administrativa       | no por inferencia       | no por inferencia          | permiso mutante exacto + universo exacto de borradores + atomicidad + territorio |
| `publishMonthAction`            | administrativa       | no por inferencia       | no por inferencia          | permiso de publicación exacto + periodo/recursos + reglas finales + auditoría    |

“no por inferencia” significa que este marcador no agrega turno/check-in a una operación base.

Si el owner funcional futuro reclasificara una operación mediante un contrato canónico explícito, esa nueva versión deberá reconciliarse antes de materializar.

#### 39. El permiso de consulta no autoriza las mutaciones VISO

El baseline actual utiliza un helper denominado `requireStaffScheduleAccess` con el permiso legacy:

```text
staff.schedule.view
```

normalizado hacia la familia canónica de programación VISO.

Ese baseline es suficiente como evidencia de que existe un guard.

No demuestra que:

```text
view
→ create
view
→ delete
view
→ publish
```

sean bindings válidos.

La futura unidad no podrá preservar esa equivalencia por conveniencia.

#### 40. Owner del binding funcional VISO

La diferenciación definitiva entre:

```text
consultar
crear
modificar
eliminar borrador
revisar
publicar
corregir
autorizar excepcion
```

pertenece a:

```text
VISO-SCH-007 — Definir autorización, auditoría, eventos y notificaciones
```

y deberá reconciliarse con el catálogo canónico y el package E5 antes de materializar las acciones.

`AUTH-SRV-018` no inventa nuevas claves de permiso.

Fija que el binding exacto es obligatorio y que una clave de consulta no puede heredarse como mutación.

#### 41. Creación mensual

Para `createMonthlyShiftsAction`, no se exige turno al administrador por el mero hecho de crear turnos.

Sí se exige, cuando corresponda:

```text
actor administrativo valido
permiso exacto
cobertura sobre la sede
cobertura sobre el trabajador o recurso
trabajador activo
vinculo trabajador-sede valido
periodo valido
politica de bloques
rol y area objetivo validos
duracion
limite
conflictos
estado actual
concurrencia
auditoria
```

El rol operativo insertado pertenece al turno objetivo, no al administrador.

#### 42. Eliminación de un borrador

Para `deleteMonthlyDraftShiftAction`:

```text
shift_id
site_id
month
```

son referencias de intención.

La acción deberá resolver:

- turno exacto;
- estado actual;
- condición de borrador;
- trabajador;
- sede;
- periodo;
- cobertura administrativa;
- permiso de eliminación aplicable;
- ausencia de transición incompatible.

No se puede borrar un turno publicado solo porque el actor tenga cobertura administrativa.

#### 43. Eliminación masiva

Para `deleteMonthlyDraftsAction`, el universo objetivo debe reconstruirse en servidor.

La futura unidad deberá demostrar:

```text
mismo periodo
+
misma cobertura administrativa
+
solo estados eliminables
+
permiso exacto
+
politica de atomicidad
+
auditoria del conjunto
```

No se autoriza el lote validando únicamente la primera fila.

#### 44. Publicación mensual

`publishMonthAction` representa una transición distinta de guardar borrador.

La publicación deberá revalidar inmediatamente antes del efecto:

- actor administrativo;
- permiso exacto de publicación;
- cobertura;
- periodo;
- recursos incluidos;
- estado draft aplicable;
- reglas de límite;
- conflictos;
- versión de política;
- frescura;
- concurrencia;
- simulación;
- auditoría.

El administrador no necesita adquirir un turno operativo para publicar una programación cuando el binding aprobado sea base.

#### 45. Publicar crea contexto futuro de otros, no del publicador

La publicación de turnos puede crear o activar contexto operativo futuro para trabajadores objetivo.

Eso no convierte al publicador en trabajador operativo del turno publicado.

Se conserva:

```text
PUBLISHER ADMINISTRATIVE CONTEXT
≠
TARGET EMPLOYEE OPERATIONAL CONTEXT
```

y:

```text
published_by
→ actor efectivo validado del publicador
```

no:

```text
published_by
→ actor enviado por cliente
published_by
→ empleado objetivo
published_by
→ auth user copiado sin resolver
```

#### 46. `published_by`

`published_by` es un campo `SERVER_DERIVED`.

La futura unidad deberá derivarlo del actor efectivo conforme al contrato de atribución aprobado.

La ausencia de turno del publicador no vuelve nulo el actor.

Si no puede resolverse un actor válido para una acción humana atribuible:

```text
no publication
```

#### 47. Auditoría obligatoria del package VISO mensual

La evidencia de las operaciones administrativas debe permitir reconstruir, cuando aplique:

```text
actor real
actor efectivo
simulacion
operacion
permiso
periodo
sede
universo de trabajadores/turnos
bloques
before
after
motivo
version de politica
published_by
resultado empresarial
resultado de notificacion
correlation_id
decision_id cuando exista
```

La auditoría se minimiza para no copiar indiscriminadamente payloads o PII.

#### 48. Before/after

Para una mutación:

```text
before
→ transition
→ after
```

debe conservar una proyección suficiente para demostrar el efecto.

No se exige almacenar la fila completa.

Para una denegación:

```text
before aplicable
+
decision
+
reason
+
effects_committed = false
```

sin fabricar `after`.

#### 49. Periodo

Toda operación mensual debe preservar la identidad del periodo que realmente fue evaluado.

El periodo de la URL no se convierte automáticamente en el periodo de la mutación.

Debe reconciliarse con:

- fechas objetivo;
- registros existentes;
- política temporal;
- límites del mes;
- estado vigente.

La política temporal definitiva permanece bajo `VISO-SCH-002`.

#### 50. Sede

La sede administrativa sobre la que se programa debe:

- existir;
- estar activa;
- ser administrable;
- coincidir con el recurso cuando corresponda;
- estar cubierta por la autoridad administrativa del actor.

La sede objetivo no necesita coincidir con una sede de turno del administrador cuando el carril base le concede cobertura válida.

#### 51. Bloques y fechas

Los bloques del formulario siguen siendo intención.

El servidor debe reconstruir y validar:

- cardinalidad;
- fechas;
- pertenencia al periodo;
- duplicados;
- área;
- rol objetivo;
- horas;
- duración;
- descansos;
- conflictos;
- límites.

Los valores definitivos pertenecen a `VISO-SCH-003..006`.

`AUTH-SRV-018` fija únicamente que esas validaciones no dependen de que el administrador tenga turno.

#### 52. Motivo

Cuando una operación o excepción exija motivo:

- se valida como contenido empresarial permitido;
- se limita y normaliza;
- se conserva en auditoría conforme al contrato;
- no concede autoridad;
- no repara un permiso ausente;
- no reemplaza una excepción aprobada.

Un texto “administrativo” no habilita un bypass.

#### 53. Resultado de notificación

La notificación posterior conserva un resultado independiente del resultado empresarial.

Debe ser posible distinguir:

```text
PUBLICACION CONFIRMADA
+
NOTIFICACION ENVIADA
```

de:

```text
PUBLICACION CONFIRMADA
+
NOTIFICACION PENDIENTE/FALLIDA
```

Una falla de notificación no reescribe la autorización ni falsifica que el efecto empresarial no ocurrió.

El contrato definitivo permanece bajo `VISO-SCH-007` y la integración correspondiente.

#### 54. Baseline de `requireStaffScheduleAccess`

El helper físico actual:

```text
requireStaffScheduleAccess
```

es baseline transitorio.

La futura materialización deberá decidir, contra el commit exacto de la instancia, si:

```text
se adapta
se divide
se reemplaza
se retira
```

pero su destino obligatorio es delegar en la frontera canónica sin:

- rol local;
- permiso genérico;
- sede inferida;
- autoridad desde navegación;
- dependencia accidental de una sesión operativa.

Este marcador no prescribe el nombre de su reemplazo.

#### 55. Baseline de `requireAppAccess`

El guard físico actual resuelve una estructura denominada sesión operativa incluso para accesos administrativos y mantiene caminos legacy de permiso y role override.

Ese hecho no se canoniza.

La futura unidad deberá separar:

```text
resolucion de carril base
```

de:

```text
resolucion de carril operativo
```

y evitar que un fallo o ausencia puramente operacional bloquee una acción `BASE_ONLY` válida.

Tampoco podrá permitir que un fallback operacional conceda una acción base.

#### 56. Baseline de `resolveOperationalSession`

La resolución física actual puede utilizar:

```text
preferredSiteId
employee_sites
employee.site_id
employees.role
navigationRole
```

como parte de su modelo legacy.

`AUTH-SRV-018` no reconoce esos valores como sustitutos automáticos de:

```text
administrative_coverage
canonical base role
canonical authorization decision
```

La futura materialización consume `AccessContext` y la frontera de autorización aprobada.

#### 57. Falla cerrada sin turno

Una acción administrativa `N` falla cerrada cuando no puede demostrar sus prerrequisitos reales.

No debe degradarse a:

```text
no shift
→ use selected site
→ use current role string
→ use admin client
→ allow
```

La ausencia de un dato operacional no habilita un fallback administrativo.

#### 58. Configuración contradictoria

Si el permission contract, modalidad, prerrequisito o cobertura necesarios son contradictorios o no resolubles de forma concluyente:

```text
no effect
```

La implementación no elige la interpretación más permisiva.

La causa se normaliza mediante el contrato de errores aplicable.

#### 59. Permiso no registrado

Una clave de permiso no registrada o un binding incompleto no se interpreta como:

- permiso genérico;
- `app.access`;
- permiso `view`;
- rol administrativo;
- bypass temporal.

La operación queda bloqueada hasta que el owner canónico resuelva el contrato.

#### 60. Fallo técnico

La indisponibilidad de la fuente de autorización no se transforma en:

```text
"como es administrativa, permitir"
```

Un fallo técnico conserva su clase y bloquea el efecto cuando impide una decisión segura.

#### 61. Errores normalizados

La respuesta pública deberá conservar la semántica cerrada por `AUTH-SRV-016`.

La causa interna distingue, entre otras clases:

```text
autorizacion denegada
configuracion incompatible
permiso no registrado
estado invalido
conflicto
concurrencia
fallo tecnico
```

La ausencia de turno solo puede ser la causa cuando el carril requerido realmente exige turno.

No debe mostrarse “turno requerido” para un permiso base `N`.

#### 62. Frescura

Una decisión administrativa debe ser fresca respecto de los hechos que sí la gobiernan.

Cambios en:

- actor;
- vínculo;
- rol base;
- grants;
- denies;
- cobertura;
- sede;
- área administrativa;
- recurso;
- estado;
- política;
- dispositivo;
- reautenticación;

pueden invalidar la decisión aunque el turno siga siendo irrelevante.

#### 63. Write barrier

Una acción administrativa que modifique autorización, trabajadores, asignaciones, programación, territorio, políticas o recursos que participan en decisiones posteriores deberá invalidar los snapshots afectados conforme al contrato compartido.

La ausencia de turno no permite conservar un `ALLOW` obsoleto.

#### 64. Concurrencia

Cuando dos acciones administrativas compiten por el mismo estado:

```text
autorizacion base valida
```

no resuelve la carrera.

La implementación deberá aplicar el mecanismo de versión, transacción, lock, constraint o enforcement de base de datos que corresponda al dominio.

En VISO mensual, la protección concreta permanece bajo `VISO-SCH-006` y las tareas físicas de base de datos aplicables.

#### 65. Idempotencia

Una clave idempotente no sustituye:

- permiso;
- actor;
- cobertura;
- estado;
- frescura.

Un reintento administrativo vuelve a validar la autoridad y el estado material que puedan haber cambiado.

#### 66. Operaciones fuera de horario

Una capacidad `BASE_ONLY` no se vuelve inválida porque:

- sea de noche;
- el administrador no tenga turno;
- su último turno haya terminado;
- todavía no haya marcado entrada.

Si existe una política temporal empresarial específica para la operación, esa política debe estar definida por su owner y evaluarse como regla de dominio, no fabricarse como requisito de turno.

#### 67. Acciones administrativas sobre varias sedes

Una capacidad administrativa multi-sede exige demostrar cobertura sobre cada sede afectada.

No basta:

```text
actor tiene una sede autorizada
→ puede modificar todas
```

Una operación masiva debe validar el universo completo.

`ORGANIZATION` solo existe cuando la cobertura canónica lo declare.

#### 68. Acciones administrativas sobre varias áreas

Cuando el recurso exige áreas administrativas:

- se resuelve el conjunto completo;
- cada área se valida;
- se verifica pertenencia a sede;
- se comprueba cobertura;
- no se autoriza parcialmente una operación atómica.

Un área `null` no se interpreta como toda la sede salvo contrato explícito que declare que el recurso es site-level.

#### 69. Privacidad

El carril administrativo puede exponer información sensible.

La ausencia de turno no amplía la proyección permitida.

Los helpers, errores, logs y auditoría deben minimizar:

```text
PII
documentos
grants
denies
JWT
cookies
tokens
secretos
payloads completos
```

Una capacidad administrativa de consulta conserva finalidad y mínimo necesario.

#### 70. Evidencia mínima de una futura unidad

Cada instancia:

```text
AUTH-SRV-018::<implementation_unit_id>
```

deberá demostrar, cuando aplique:

1. identidad exacta de la unidad;
2. repositorio y commit de entrada;
3. superficies administrativas incluidas;
4. binding exacto por superficie;
5. permiso canónico por operación;
6. modalidad de autorización;
7. prerrequisito por carril;
8. operaciones que usan `N`;
9. actor y principal resueltos;
10. carril base resuelto;
11. cobertura administrativa;
12. sede y área administrativa aplicables;
13. recurso y estado revalidados;
14. ausencia de dependencia artificial del turno;
15. separación del carril operativo;
16. configuración de dispositivo aplicable;
17. reautenticación fuerte cuando corresponda;
18. simulación bloqueada para efectos;
19. legacy guard adaptado o retirado;
20. permisos de consulta no usados como mutación salvo contrato exacto que lo autorice;
21. reglas de dominio;
22. frescura;
23. concurrencia;
24. auditoría;
25. errores normalizados;
26. validation commands;
27. rollback;
28. package IDs consumidores;
29. commit de salida y evidencia.

Los nombres anteriores describen contenido mínimo del expediente.

No obligan a crear campos físicos homónimos.

#### 71. Escenarios mínimos de certificación futura

La materialización deberá cubrir al menos:

1. `BASE_ONLY + N + sin turno + permiso/cobertura válidos → ALLOW`;
2. `BASE_ONLY + N + sin turno + permiso ausente → DENY`;
3. `BASE_ONLY + N + sin turno + cobertura insuficiente → DENY`;
4. `BASE_ONLY + N + turno presente → mismo resultado del carril base`;
5. `BASE_ONLY + N + problema exclusivamente operacional → no contamina base`;
6. identidad inactiva + `N` → DENY;
7. configuración base contradictoria + `N` → fail closed;
8. `BASE_OR_OPERATIONAL` con base válido y operativo ausente → resultado conforme al binding del carril base;
9. `BASE_OR_OPERATIONAL` con base inválido y operativo sin turno → DENY;
10. `BASE_AND_OPERATIONAL` sin turno → DENY;
11. `OPERATIONAL_ONLY` sin turno → DENY;
12. rol privilegiado sin permiso → DENY;
13. `service_role` sin decisión empresarial → no efecto;
14. selector de sede fuera de cobertura → DENY;
15. área operativa ausente en acción site-level base válida → no bloqueo artificial;
16. área administrativa requerida ausente → DENY;
17. dispositivo no compatible → DENY;
18. permiso `STRONG` sin reautenticación fuerte → DENY;
19. simulación con `WOULD_ALLOW` intenta mutar → DENY;
20. permiso `view` intenta una mutación sin binding mutante → DENY;
21. permiso exacto mutante + recurso en estado inválido → no efecto;
22. decisión válida pero conflicto de dominio → no efecto;
23. decisión stale después de cambio de cobertura → reevaluación;
24. auditoría de operación permitida conserva actor, decisión y efecto;
25. auditoría de denegación conserva cero efectos;
26. VISO creación mensual por administrador sin turno válido → puede avanzar solo si binding, permiso, cobertura y dominio son válidos;
27. VISO publicación por administrador sin turno válido → puede avanzar solo si binding de publicación y reglas finales son válidos;
28. VISO publicación con permiso solo de consulta → DENY;
29. VISO publicación sobre sede fuera de cobertura → DENY;
30. VISO publicación con notificación fallida después de efecto confirmado → publicación y notificación conservan resultados distintos.

#### 72. Rollback

El rollback de una futura unidad debe volver a una combinación previamente soportada sin reintroducir:

- turno artificial para capacidades base;
- bypass por rol;
- permiso `view` como autoridad genérica de mutación;
- `service_role` como autorización;
- cobertura inferida;
- sede seleccionada como autoridad;
- área operativa como cobertura administrativa;
- role override legacy;
- `navigation_role` como permiso;
- decisión booleana parcial;
- simulación ejecutable;
- actor no resuelto;
- ausencia de auditoría;
- mezcla de errores;
- decisión stale.

Si el comportamiento anterior bloqueaba incorrectamente administración base o permitía mutaciones con autoridad insuficiente, restaurarlo no constituye rollback seguro.

#### 73. Criterios de aceptación

`AUTH-SRV-018` queda documentalmente satisfecha cuando:

1. se define que una acción administrativa sin turno utiliza el carril base cuando su contrato lo permite;
2. `N` se limita a turno y check-in no requeridos;
3. `N` no elimina autorización;
4. la clasificación procede del permission contract y binding;
5. la ruta o pantalla no decide el carril;
6. el rol del actor no decide el carril;
7. `service_role` no decide el carril;
8. `BASE_ONLY` puede ejecutarse sin turno;
9. `BASE_OR_OPERATIONAL` conserva carriles independientes;
10. `BASE_AND_OPERATIONAL` no elimina turno;
11. `OPERATIONAL_ONLY` no puede degradarse a base;
12. la ausencia de contexto operativo no invalida automáticamente base;
13. un problema únicamente operacional no contamina una base independiente válida;
14. los problemas del carril base continúan bloqueando;
15. la sesión válida no equivale a permiso;
16. el actor efectivo continúa siendo obligatorio;
17. la identidad inactiva continúa bloqueada;
18. `app.access` no equivale a permiso de acción;
19. cada mutación exige binding exacto;
20. `view` no se hereda como `create`, `delete` o `publish`;
21. no existe bypass por nombre de rol;
22. grants y denies siguen aplicando;
23. la cobertura administrativa sigue aplicando;
24. `site_id` del cliente es intención;
25. área administrativa y área operativa quedan separadas;
26. administrar un recurso operativo no vuelve operativo al administrador;
27. se revalida estado del recurso;
28. se ejecutan reglas de dominio después de autorización;
29. el payload se reconstruye en servidor;
30. admin client no concede autoridad;
31. simulación no ejecuta;
32. dispositivo compartido no concede autoridad;
33. `STRONG` sigue exigiendo reautenticación cuando aplica;
34. se define pipeline sin turno artificial;
35. consultas administrativas conservan mínimo necesario;
36. mutaciones administrativas conservan estándar completo;
37. se clasifica la programación laboral como administrativa conforme al catálogo vigente;
38. se identifican las cuatro acciones mensuales observadas;
39. cada acción mensual obtiene binding independiente;
40. el administrador no necesita turno por inferencia para programar;
41. el target shift no se confunde con el turno del administrador;
42. el permiso legacy de consulta no certifica las mutaciones;
43. `VISO-SCH-007` conserva ownership del binding funcional definitivo;
44. creación mensual revalida persona, sede y dominio;
45. eliminación individual revalida estado draft;
46. eliminación masiva valida el universo completo;
47. publicación revalida reglas finales;
48. publicar no transforma al publicador en actor operativo;
49. `published_by` se deriva del actor efectivo;
50. auditoría conserva before/after cuando aplica;
51. auditoría conserva periodo y sede;
52. auditoría conserva bloques o universo reproducible;
53. auditoría conserva motivo cuando aplica;
54. resultado de notificación permanece separado;
55. `requireStaffScheduleAccess` queda baseline transitorio;
56. `requireAppAccess` no se canoniza;
57. `resolveOperationalSession` no sustituye cobertura base;
58. no existe fallback permisivo ante ausencia de turno;
59. configuración contradictoria falla cerrada;
60. permiso no registrado no se sustituye;
61. fallo técnico no se transforma en allow;
62. el error de turno solo aparece cuando el carril requerido exige turno;
63. frescura del carril base se conserva;
64. write barrier se conserva;
65. concurrencia no se resuelve con autorización;
66. idempotencia no concede autoridad;
67. operar fuera de horario no bloquea por sí solo un permiso base;
68. multi-sede valida cada territorio;
69. multiárea valida el conjunto requerido;
70. privacidad no se amplía;
71. se define evidencia futura;
72. se definen escenarios mínimos;
73. se define rollback seguro;
74. no se autorizan cambios físicos desde el marcador global;
75. no se crean ni modifican requisitos de prueba.

#### 74. Límites

Este marcador no certifica todavía:

- código físico del evaluador;
- cambios en VISO;
- cambios en ANIMA;
- cambios en `@vento/os-context`;
- cambios en `@vento/contracts`;
- nuevas claves de permiso;
- aliases de permisos;
- migración de guards;
- retiro de role overrides;
- retiro de `resolveOperationalSession`;
- cambios en RLS;
- RPC;
- grants;
- migraciones;
- constraints;
- triggers;
- reautenticación fuerte física;
- enrolamiento de dispositivos;
- publicación productiva;
- políticas definitivas de programación;
- límite mensual definitivo;
- conflictos definitivos;
- atomicidad definitiva;
- mecanismo definitivo de concurrencia;
- copy final de errores;
- despliegues.

Owners pendientes y condición de salida:

```text
VISO-SCH-002
→ aprobar politica temporal
→ entonces las operaciones mensuales consumen periodo y timezone definitivos

VISO-SCH-003
→ aprobar bloques, fechas, duracion y modalidad
→ entonces la validacion de inputs usa reglas definitivas

VISO-SCH-004
→ aprobar limites, advertencias, vigencia y excepciones
→ entonces guardar/publicar consumen la politica definitiva

VISO-SCH-005
→ aprobar borrador, revision, publicacion y correccion
→ entonces cada mutacion usa transicion y atomicidad definitivas

VISO-SCH-006
→ aprobar conflictos, integridad, concurrencia y recuperacion
→ entonces server y DB materializan enforcement definitivo

VISO-SCH-007
→ aprobar permiso por accion, auditoria, eventos y notificaciones
→ entonces cada accion mensual obtiene binding funcional definitivo

VISO-SCH-008
→ aprobar el contrato completo antes de E5
→ entonces el package puede consumir la reconciliacion cerrada de programacion

SHELL-AUTH-001..005
→ materializar SDK, adapters, scope, gates y migracion
→ entonces el carril base deja de depender de guards legacy

AUTH-DB-033..035 y tareas DB aplicables
→ materializar evaluacion, paridad e invalidacion en backend
→ entonces las capas fisicas pueden demostrar decision equivalente
```

#### 75. Evidencia de validación

| Clase     | Estado           | Evidencia                                                                                                                                                                                                                                                                                                                                |
| --------- | ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | `NOT_EXECUTED`   | no se ejecutó build durante el desarrollo documental                                                                                                                                                                                                                                                                                     |
| LOCAL     | `NOT_EXECUTED`   | no se ejecutaron comandos ni validadores contra el checkout del usuario                                                                                                                                                                                                                                                                  |
| REMOTA    | `PASS`           | se auditó en solo lectura la continuidad vigente, las políticas de entrega/formato/desarrollo/topología, el owner de `AUTH-SRV-018`, `AUTH-SRV-004..017`, los prerrequisitos del catálogo, `AccessContext`, el registro 04A AUTH/VISO relevante, el baseline actual de acciones, helpers y guards VISO, y los owners `VISO-SCH-001..008` |
| OPERATIVA | `NOT_APPLICABLE` | el marcador no modifica la operación real                                                                                                                                                                                                                                                                                                |
| FÍSICA    | `NOT_APPLICABLE` | no existe instancia física autorizada para esta tarea                                                                                                                                                                                                                                                                                    |

#### 76. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Justificación:** la distinción entre carril base y operativo, la ejecución administrativa sin turno cuando el contrato lo permite, la obligación de permiso exacto, el control territorial, la protección server-side, la atribución, la frescura, la simulación, los dispositivos compartidos y las validaciones específicas del package VISO mensual ya cuentan con requisitos canónicos vigentes. Esta tarea cierra la composición explícita de esos prerrequisitos para acciones administrativas sin introducir una regla verificable nueva ni modificar el registro de pruebas.

#### 77. Cobertura de prueba vigente reutilizada

Se reutiliza sin modificar el registro vigente:

- `TREQ-AUTH-007` — administración de roles, perfiles, permisos y disponibilidad exige capacidad administrativa explícita y territorio autorizado;
- `TREQ-AUTH-008` — capacidades administrativas pueden resolverse por carril base sin turno/check-in cuando el contrato lo permita y las operativas conservan sus prerrequisitos;
- `TREQ-AUTH-009` — sede y área efectivas se resuelven determinísticamente y el cruce territorial se deniega;
- `TREQ-AUTH-013` — toda mutación valida permiso exacto, actor, territorio, contexto requerido, estado y columnas permitidas;
- `TREQ-AUTH-014` — cambios materiales invalidan contexto, caché y decisiones derivadas;
- `TREQ-AUTH-015` — toda decisión y acción, incluidas las administrativas, conserva evidencia correlacionable;
- `TREQ-AUTH-063` — permisos `STRONG` en dispositivo compartido exigen reautenticación fuerte personal y no se degradan a PIN ligero;
- `TREQ-AUTH-292` — problemas estructurales bloquean únicamente los carriles que les corresponden y `BASE_OR_OPERATIONAL` conserva independencia de carriles;
- `TREQ-AUTH-293` — modalidad, prerrequisitos, cobertura, turno, check-in, dispositivo y simulación se resuelven desde contratos server-side versionados;
- `TREQ-VISO-037` — guardar borrador y publicar son comandos separados con permisos y resultados distintos;
- `TREQ-VISO-041` — eliminación masiva afecta solo borradores autorizados y conserva auditoría;
- `TREQ-VISO-042` — persona, sede, área, rol, fechas y alcance se revalidan en servidor;
- `TREQ-VISO-043` — auditoría conserva actor real, actor efectivo, simulación, versión, política y `published_by`;
- `TREQ-VISO-044` — notificación hacia ANIMA es idempotente, recuperable y correlacionada;
- `TREQ-VISO-045` — URL, formulario o Server Action manipulados quedan bloqueados con error canónico comprensible.

Estas referencias son trazabilidad heredada y no representan requisitos creados o modificados por `AUTH-SRV-018`.

### Package VISO mensual

- 014: actor real/efectivo y `published_by`.
- 015: simulación no publica sin regla.
- 016: códigos estables para límite/conflicto/alcance/concurrencia.
- 017: cálculo compartido/versionado entre semana, mes y DB.
- 018: prerrequisitos administrativos explícitos.

Auditoría: antes/después, periodo, sede, bloques, motivo y resultado de notificación.

---

#### 78. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-SRV-017 — Crear helpers server compartidos`

**TAREA ACTUAL APROBADA**
`AUTH-SRV-018 — Revisar acciones administrativas sin turno`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-015 — Documentar y versionar todas las migraciones en vento-shell`
