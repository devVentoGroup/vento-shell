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


### [ ] AUTH-SRV-015 — Registrar rol simulado en auditoría
### [ ] AUTH-SRV-016 — Normalizar errores de autorización
### [ ] AUTH-SRV-017 — Crear helpers server compartidos
### [ ] AUTH-SRV-018 — Revisar acciones administrativas sin turno

### Package VISO mensual

- 014: actor real/efectivo y `published_by`.
- 015: simulación no publica sin regla.
- 016: códigos estables para límite/conflicto/alcance/concurrencia.
- 017: cálculo compartido/versionado entre semana, mes y DB.
- 018: prerrequisitos administrativos explícitos.

Auditoría: antes/después, periodo, sede, bloques, motivo y resultado de notificación.
