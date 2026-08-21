# @vento/contracts/work-items

Contrato estático interno de ítems de trabajo de Vento OS.

## Estado

Esta materialización corresponde a `SHELL-CON-015::GLOBAL`.

Es una fundación `PRE_E5_FOUNDATION`.

El namespace lógico reservado es:

```text
@vento/contracts/work-items
```

La materialización es interna al workspace `@vento/contracts`; no añade `exports` públicos, no publica una release y no adopta consumidores.

## Autoridades

La superficie se deriva y reconcilia desde:

- `UX-BASE-002`, autoridad semántica del foco, ítem de trabajo, clases, estados, readiness, prioridad, claim, interrupción, handoff, offline y recuperación;
- `SHELL-CON-015`, autoridad de centralización del contrato compartido;
- `SHELL-CON-002`, autoridad compartida de `AppCode`;
- `SHELL-CON-009`, autoridad compartida de `ProcessId`;
- `SHELL-CON-010`, autoridad compartida de `ProcessStateId`;
- `SHELL-CON-012`, autoridad compartida de `FunctionalActionId`;
- `SHELL-CON-013`, autoridad compartida de `BusinessEventId`;
- `SHELL-CON-014`, autoridad compartida de `ApplicationHandoffRelation`;
- `TREQ-UX-024` a `TREQ-UX-040`, cobertura de prueba vigente reutilizada sin modificación.

La aplicación indicada por `owner_app_code` conserva la propiedad empresarial de cada obligación runtime. Este módulo no adquiere esa propiedad.

## Superficie estática materializada

El corte vigente contiene exactamente:

```text
29 campos contractuales
8 clases de item de trabajo
16 estados conceptuales
7 estados de readiness
6 niveles de prioridad
0 instancias runtime
0 catalogos de work_item_id
```

La materialización centraliza vocabularios y metadata. No fabrica obligaciones empresariales actuales.

## Identidad del ítem

`work_item_id` identifica una obligación runtime concreta y se trata como referencia opaca.

Esta materialización:

- no define patrón de `work_item_id`;
- no define longitud, UUID, prefijo, encoding ni serialización;
- no publica `WORK_ITEM_IDS`;
- no crea un registro estático de instancias;
- no permite inferir proceso, aplicación, actor, permiso, prioridad, territorio o estado desde el valor;
- no convierte conocer la referencia en autorización para ver, reclamar, iniciar, completar o cancelar.

Las separaciones obligatorias permanecen:

```text
work_item_id != ProcessId
work_item_id != process_instance_id
work_item_id != ProcessStateId
work_item_id != FunctionalActionId
work_item_id != BusinessEventId
work_item_id != PermissionId
work_item_id != ScreenId
work_item_id != navigation_id
work_item_id != claim_or_lease_ref
work_item_id != handoff_relation
work_item_id != alert_or_notification_id
```

## Campos contractuales

La superficie mínima conserva exactamente estos 29 nombres:

```text
work_item_id
process_id
process_instance_id
process_step
owner_app_code
source_ref
work_item_type
work_lane
status
readiness_status
assignment_mode
assigned_actor_ref
eligible_actor_set_ref
queue_ref
required_context_ref
required_permission_ref
resource_ref
location_ref
available_at
due_at
priority_class
priority_policy_version
blocking_refs
next_action_code
work_item_version
claim_or_lease_ref
idempotency_scope
created_at
updated_at
```

Esta lista define semántica compartida. No fija tabla, columna, schema, endpoint, payload de red ni almacenamiento.

## Clases

El vocabulario cerrado contiene exactamente 8 clases:

```text
EXECUTE_STEP
VERIFY_STEP
HANDOFF_ACCEPTANCE
PERSONAL_OBLIGATION
SUPERVISORY_RESPONSE
SAFETY_RESPONSE
FOLLOW_UP
RECOVERY
```

Una clase no es permiso, rol, prioridad ni estado de proceso.

## Estados conceptuales

El vocabulario cerrado contiene exactamente 16 estados:

```text
NOT_READY
AVAILABLE
OFFERED
ASSIGNED
CLAIMED
IN_PROGRESS
WAITING
BLOCKED
PAUSED
COMPLETION_PENDING_SYNC
COMPLETED
CANCELLED
SUPERSEDED
EXPIRED
CONFLICT
RECONCILIATION_REQUIRED
```

`WAITING`, `BLOCKED`, `PAUSED`, `COMPLETION_PENDING_SYNC` y `COMPLETED` permanecen diferenciados.

## Readiness

El vocabulario cerrado contiene exactamente 7 estados de readiness:

```text
EXECUTABLE_NOW
VISIBLE_NOT_EXECUTABLE
WAITING_EXTERNAL
BLOCKED_RECOVERABLE
BLOCKED_REQUIRES_OTHER_ACTOR
STALE_REQUIRES_REFRESH
NOT_ELIGIBLE
```

Visible no equivale a ejecutable. Ejecutable no equivale a autorizado de forma irrevocable: la acción efectiva se revalida en su autoridad propietaria.

## Prioridad

Se conservan exactamente 6 niveles conceptuales:

```text
0 - Seguridad, emergencia o custodia crítica.
1 - Trabajo ya en ejecución que debe continuar.
2 - Compromiso inmediato con cliente, producción, entrega o cadena.
3 - Tarea asignada con vencimiento o bloqueo de terceros.
4 - Tarea disponible priorizada por política.
5 - Mantenimiento, seguimiento o trabajo sin urgencia.
```

La prioridad debe permanecer determinista, versionada y explicable. Este módulo no implementa el algoritmo, no calcula scores y no modifica prioridades runtime.

## Autoridades tipadas

Cuando una referencia pertenece a una autoridad compartida ya materializada, el contrato reutiliza sus tipos:

```text
owner_app_code -> AppCode
process_id -> ProcessId
process_step cuando corresponda a una identidad de estado -> ProcessStateId
next_action_code cuando pertenezca al catalogo -> FunctionalActionId
evento correlacionado cuando aplique -> BusinessEventId
handoff cross-app cuando aplique -> ApplicationHandoffRelation
```

No se crean copias locales de esas identidades.

## Elegibilidad, oferta, asignación, claim y ejecución

Permanecen separados:

```text
ELIGIBILITY
!= OFFER
!= ASSIGNMENT
!= CLAIM
!= EXECUTION
!= COMPLETION
```

Abrir, visualizar, navegar, recibir una notificación o aparecer como candidato no produce claim ni inicio.

El contrato estático no ejecuta claims, leases, asignaciones, starts, completions ni cancelaciones.

## Concurrencia e idempotencia

`work_item_version`, `claim_or_lease_ref` e `idempotency_scope` permanecen como nombres contractuales necesarios para una implementación futura.

Esta instancia no implementa:

- lock;
- lease;
- persistencia;
- deduplicación;
- atomicidad;
- retry;
- scheduler;
- worker;
- motor de workflow.

Esas responsabilidades permanecen en sus tareas técnicas propietarias.

## Offline y frescura

`COMPLETION_PENDING_SYNC` y `STALE_REQUIRES_REFRESH` conservan su significado contractual.

Este módulo no implementa caché, almacenamiento local, cola offline, sincronización, reconciliación ni política de red. Una implementación futura deberá revalidar actor, contexto, versión, claim, permiso, estado y dependencias cuando aplique.

## Handoffs

`SHELL-CON-014` conserva autoridad sobre los traspasos entre aplicaciones.

Un handoff puede conservar la misma referencia `work_item_id` cuando corresponda, pero:

- no crea automáticamente otra obligación;
- no transfiere autoridad por navegación;
- enviar u ofrecer no equivale a aceptación;
- recibir no equivale a `IN_PROGRESS`;
- la aplicación receptora revalida contexto, autorización, estado y versión.

## Eventos y acciones

`SHELL-CON-012` conserva autoridad sobre `FunctionalActionId`.

`SHELL-CON-013` conserva autoridad sobre `BusinessEventId`.

`next_action_code` es una referencia a la acción aplicable cuando pertenezca al catálogo compartido; no concede permiso.

Los eventos pueden correlacionarse con un ítem, pero el evento no se convierte en la identidad del trabajo.

## Proyección cross-app

SHELL y otras consumidoras podrán usar posteriormente una proyección mínima autorizada para foco, cola y navegación. Esta materialización no implementa esa proyección.

SHELL no se convierte en propietario, scheduler, ejecutor ni autorizador universal de los ítems.

## Cobertura vigente

La semántica materializada está protegida por `TREQ-UX-024` a `TREQ-UX-040`.

Esta instancia no crea, modifica, difiere ni vuelve obsoleto ningún `TREQ-*`.

## Fronteras

Esta instancia no:

- modifica `packages/contracts/package.json`;
- añade `exports` públicos;
- cambia la versión de `@vento/contracts`;
- crea instancias runtime de trabajo;
- define serialización de `work_item_id`;
- crea tablas, schemas, columnas o migraciones;
- crea RLS, RPC, funciones o triggers;
- crea APIs, Server Actions o webhooks;
- crea topics, colas, brokers, inbox u outbox;
- implementa scheduler, workflow engine, claim engine o autorización;
- crea rutas, deep links, labels, componentes o UI;
- toca Supabase o datos empresariales;
- modifica 04A/TREQ;
- publica registry, tag, release o despliegue.

## Siguiente responsabilidad reservada

`SHELL-CON-016` permanece reservada para el contrato de propiedad funcional y no forma parte de `SHELL-CON-015::GLOBAL`.
