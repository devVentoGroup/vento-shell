# @vento/contracts/handoffs

Contrato estático interno de relaciones de traspaso entre aplicaciones de Vento OS.

## Estado

Esta materialización corresponde a `SHELL-CON-014::GLOBAL`.

Es una fundación `PRE_E5_FOUNDATION`.

El namespace lógico reservado es:

```text
@vento/contracts/handoffs
```

La materialización es interna al workspace `@vento/contracts`; no añade `exports` públicos, no publica una release y no adopta consumidores.

## Autoridades

La relación se deriva y reconcilia desde:

- `PROC-CAT-005`: aplicación propietaria de cada proceso;
- `PROC-CAT-006`: consumidoras directas, consumidoras condicionales y modalidad dominante;
- `SHELL-CON-002`: `AppCode`;
- `SHELL-CON-009`: `ProcessId`;
- `SHELL-CON-010`: `ProcessStateId` cuando un payload runtime futuro deba referenciar un estado;
- `SHELL-CON-012`: `FunctionalActionId` cuando un trabajo pendiente futuro ya pertenezca a ese catálogo;
- `SHELL-CON-013`: separación entre definición de evento empresarial y solicitud de handoff;
- `INT-APP-003`: perfil `HANDOFF_PROJECTION`;
- `INT-APP-004`: idempotencia de aceptación o efecto;
- `INT-APP-010`: familia `HANDOFF_REQUEST` y prohibición de escritura cruzada;
- `SHELL-CON-014`: matriz contractual de las relaciones compartidas.

## Universo materializado

El corte vigente contiene exactamente:

```text
49 relaciones
27 directas
22 condicionales
8 procesos
1 aplicación propietaria: viso
9 aplicaciones participantes
0 tuplas duplicadas
0 relaciones owner=participant
```

Los ocho procesos son:

```text
VPROC-0005
VPROC-0006
VPROC-0007
VPROC-0009
VPROC-0011
VPROC-0059
VPROC-0065
VPROC-0066
```

Las nueve aplicaciones participantes son:

```text
shell
anima
nexo
fogo
origo
pulso
numera
aura
pass
```

AURA permanece como relación documental cuando aparece en la matriz; esta materialización no afirma readiness operativo.

## Identidad de relación

La identidad contractual es únicamente la tupla:

```text
ProcessId + owner_application + participant_application
```

El contrato no crea un identificador serializado paralelo.

Una tupla solo pertenece al universo cuando está aprobada simultáneamente por `PROC-CAT-006` y `SHELL-CON-014`.

La sintaxis válida de `ProcessId` y `AppCode` no demuestra por sí sola pertenencia a una relación de handoff.

## Proyección estática

Cada `ApplicationHandoffRelation` contiene exclusivamente:

```text
process_id
owner_application
participant_application
participation_class
consumer_mode
integration_profile
exchange_family
```

Los vocabularios fijados son:

```text
participation_class = DIRECTA | CONDICIONAL
consumer_mode = SOLICITUD_HANDOFF_Y_EVENTO
integration_profile = HANDOFF_PROJECTION
exchange_family = HANDOFF_REQUEST
```

`DIRECTA` y `CONDICIONAL` conservan la clasificación de `PROC-CAT-006`. Una relación `CONDICIONAL` no queda habilitada por existir en esta matriz.

## Continuidad dinámica reservada

`SHELL-CON-014` exige que una materialización runtime posterior preserve, cuando aplique:

- el mismo proceso y la misma instancia;
- el recurso empresarial exacto;
- propietaria y participante;
- actor emisor y actor o función receptora;
- sede y área;
- estado vigente;
- trabajo o acción pendiente;
- destino de retorno;
- correlación y causalidad;
- evidencia;
- emisión, recepción, aceptación y resultado;
- idempotencia suficiente para impedir doble aceptación o doble efecto.

Este módulo no implementa el payload runtime de esos campos. Tampoco inventa tipos locales para identidades cuyo contrato compartido debe provenir de otra tarea.

## Autoridad y aceptación

Una relación admitida no transfiere propiedad del proceso.

```text
owner_application
-> conserva registro principal, reglas, estado, corrección y cierre

participant_application
-> solicita, recibe o ejecuta únicamente el efecto permitido
```

Enviar un handoff no equivale a aceptación.

Recibirlo no concede autorización.

La aplicación receptora debe revalidar contrato, actor, contexto, recurso, estado y permiso aplicables antes de ejecutar un efecto.

La etapa siguiente no se considera completada por el solo despacho.

## Separación con eventos

Se mantienen separados:

```text
BusinessEventId
HANDOFF_REQUEST
HANDOFF_PROJECTION
HANDOFF_FACT
```

Una solicitud no es un hecho empresarial confirmado.

Un `HANDOFF_FACT` no crea una relación nueva.

Una relación admitida no obliga a enviar todos los eventos del proceso a la participante.

## Idempotencia

El contrato conserva la obligación de `INT-APP-004` para `HANDOFF_PROJECTION`:

```text
consumer inbox
+
consumer effect key para aceptación o handoff
+
un único resultado por alcance de efecto
```

La implementación física de inbox, outbox, persistencia, locks, retries, colas o conciliación pertenece a sus tareas técnicas propietarias y no se adelanta aquí.

## Navegación

Un handoff puede requerir navegación entre aplicaciones, pero esta materialización:

- no crea rutas;
- no crea URLs;
- no crea deep links;
- no define dominios;
- no convierte parámetros de navegación en autorización;
- no implementa destino de retorno runtime.

La navegación deberá preservar continuidad y volver a validar contexto cuando su tarea propietaria la materialice.

## Fronteras

Esta instancia no:

- modifica `packages/contracts/package.json`;
- añade `exports` públicos;
- cambia la versión de `@vento/contracts`;
- modifica `AppCode`, `ProcessId`, `ProcessStateId`, `FunctionalActionId` o `BusinessEventId`;
- implementa productores o consumidores;
- implementa autorización runtime;
- implementa escritura cruzada;
- implementa payloads de handoff;
- implementa inbox u outbox;
- crea topics, colas, brokers o webhooks;
- crea APIs, Server Actions o RPC;
- crea rutas o deep links;
- toca Supabase, RLS, migraciones o datos;
- modifica 04A/TREQ;
- publica registry, tag, release o despliegue.

## Siguiente responsabilidad reservada

`SHELL-CON-015` permanece reservada para el contrato de tareas pendientes y no forma parte de `SHELL-CON-014::GLOBAL`.
