# @vento/contracts/events

Materialización interna del contrato de identidad de eventos empresariales de Vento OS.

## Estado

`SHELL-CON-013::GLOBAL` materializa la proyección estática interna definida por `SHELL-CON-013`.

La autoridad semántica permanece en `PROC-CAT-017`.

La identidad de proceso consumida permanece en `SHELL-CON-009::GLOBAL` y su contrato `ProcessId`.

Esta materialización pertenece a `PRE_E5_FOUNDATION`.

No publica el subpath `@vento/contracts/events`, no modifica la versión de `@vento/contracts`, no crea una release, tag o publicación en registry y no adopta productores ni consumidores.

## Universo vigente

El corte materializado contiene exactamente:

- 395 definiciones normales de eventos empresariales;
- 69 procesos `VPROC-0001..VPROC-0069`;
- 4 procesos con 4 definiciones;
- 11 procesos con 5 definiciones;
- 54 procesos con 6 definiciones;
- 12 clases;
- 4 sensibilidades;
- 8 familias condicionales fuera de las 395 definiciones normales.

Las identidades normales conservan la forma:

`VPROC-####.EVT-###`

La identidad contractual compartida es `BusinessEventId`.

## Sintaxis y pertenencia

La forma estructural es:

`^VPROC-[0-9]{4}\.EVT-[0-9]{3}$`

Sintaxis y pertenencia son comprobaciones distintas.

Una cadena solo se acepta como `BusinessEventId` vigente cuando:

1. cumple la forma;
2. su `ProcessId` pertenece al contrato vigente;
3. la identidad completa pertenece exactamente a `BUSINESS_EVENT_IDS`.

Por ejemplo:

- `VPROC-0003.EVT-004` pertenece al conjunto vigente;
- `VPROC-0003.EVT-005` tiene forma válida, pero no pertenece al corte vigente;
- `VPROC-0070.EVT-001` tiene forma válida, pero referencia un `ProcessId` no asignado en este corte.

## Superficie interna

La salida generada expone internamente:

- `BUSINESS_EVENT_ID_PATTERN_SOURCE`;
- `BUSINESS_EVENT_ID_PATTERN`;
- `BUSINESS_EVENT_CLASSES`;
- `BusinessEventClass`;
- `BUSINESS_EVENT_SENSITIVITIES`;
- `BusinessEventSensitivity`;
- `BUSINESS_EVENT_IDS`;
- `BusinessEventId`;
- `BUSINESS_EVENT_TYPES`;
- `BusinessEventType`;
- `CONDITIONAL_BUSINESS_EVENT_TYPE_TEMPLATES`;
- `ConditionalBusinessEventTypeTemplate`;
- `BUSINESS_EVENT_DEFINITIONS`;
- `BusinessEventDefinition`;
- `BUSINESS_EVENT_REGISTRY_METADATA`;
- `BusinessEventRegistryMetadata`;
- `isBusinessEventIdFormat()`;
- `isBusinessEventId()`;
- `assertBusinessEventId()`;
- `isBusinessEventType()`;
- `resolveBusinessEventProcessId()`;
- `resolveBusinessEventType()`;
- `resolveBusinessEventClass()`;
- `resolveBusinessEventSensitivity()`.

`BusinessEventId` se deriva de `BUSINESS_EVENT_IDS`; no existe una lista manual paralela.

## Metadata proyectada

Cada definición normal materializada conserva únicamente:

- `business_event_id`;
- `process_id`;
- `event_type`;
- `event_class`;
- `sensitivity`.

El estado o hecho fuente y la descripción del hecho confirmado permanecen gobernados exclusivamente por `PROC-CAT-017`; no se copian al contrato compartido como una segunda autoridad semántica.

`BusinessEventId`, `event_type` y una ocurrencia runtime son conceptos diferentes.

## Familias condicionales

Las ocho plantillas canónicas se proyectan separadamente mediante `CONDITIONAL_BUSINESS_EVENT_TYPE_TEMPLATES`:

- `vento.process.vproc-####.exception-applied.v1`;
- `vento.process.vproc-####.exception-resolved.v1`;
- `vento.process.vproc-####.cancellation-recorded.v1`;
- `vento.process.vproc-####.void-recorded.v1`;
- `vento.process.vproc-####.reversal-applied.v1`;
- `vento.process.vproc-####.compensation-posted.v1`;
- `vento.process.vproc-####.correction-applied.v1`;
- `vento.process.vproc-####.linked-review-opened.v1`.

Estas plantillas no reciben artificialmente un `BusinessEventId` normal y no aumentan el conteo 395.

## Reconciliación

El generador exige simultáneamente:

- 69 `ProcessId` físicos vigentes;
- 395 filas normales de `PROC-CAT-017`;
- 395 `event_type` únicos;
- secuencias locales exactas `EVT-001..EVT-004/005/006`;
- la distribución 4/11/54 aprobada;
- las 12 clases aprobadas;
- las 4 sensibilidades aprobadas;
- las 8 plantillas condicionales exactas;
- 395 filas coincidentes en la matriz de `SHELL-CON-013`;
- decisión `Centralizar sin renumerar`;
- resultado `Incluido en contrato lógico`;
- estado `Definición normal vigente`;
- bloqueo `No aplica`;
- ausencia de aliases `PROC.FAMILY.*`.

La proyección generada no sustituye ninguna de sus fuentes.

## Separaciones obligatorias

`BusinessEventId` no es:

- `event_id` de una ocurrencia runtime;
- `event_type`;
- `ProcessId`;
- `ProcessStateId`;
- `ScreenId`;
- `FunctionalActionId`;
- un permiso;
- `correlation_id`;
- un comando;
- una notificación;
- una entrada de auditoría;
- un log;
- un tópico, cola, outbox, webhook, API o RPC.

Conocer un `BusinessEventId` no concede autorización y no demuestra que exista una emisión concreta.

## Generación

Los artefactos bajo `generated/` se regeneran determinísticamente desde:

- `PROC-CAT-017`;
- `SHELL-CON-013`;
- el contrato `ProcessId` de `SHELL-CON-009`.

Los derivados no se editan para cambiar significado.

La comprobación de freshness normaliza LF/CRLF para evitar divergencias falsas en Windows.

## Límites

Esta instancia no materializa:

- producción o consumo runtime de eventos;
- `event_id`, `process_instance_id`, correlación o causalidad runtime;
- outbox, tópicos, colas, brokers o suscripciones;
- webhooks, APIs, Server Actions o RPC;
- persistencia;
- Supabase, RLS, migraciones o datos;
- permisos o autorización;
- nuevos eventos;
- cambios semánticos en `PROC-CAT-017`;
- consumidores;
- exports públicos;
- publicación del package;
- traspasos entre aplicaciones, reservados a `SHELL-CON-014`.

Reconocer una definición empresarial no demuestra emisión, entrega, consumo ni efecto exitoso.
