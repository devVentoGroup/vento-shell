### INFRAESTRUCTURA CANÓNICA DE COLAS

### ✅ QUEUE-ARC-001 — Inventariar colas, cron, jobs y automatizaciones existentes

**Estado:** APROBADA
**Tarea anterior:** `TSVC-CAT-010 — Definir adopción progresiva y retiro de soluciones legacy`
**Tarea siguiente:** `QUEUE-ARC-002 — Definir contrato canónico de trabajo asíncrono`
**Tipo de tarea:** documental; inventario materializado y reconciliado del trabajo asíncrono, programado, disparado por eventos, local u operado mediante webhooks que existe actualmente en Vento OS, separando definición en código, despliegue remoto, persistencia, propietario empresarial, ejecutor técnico, estado observable y brechas de gobierno sin diseñar todavía el contrato objetivo de colas
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/03_INFRAESTRUCTURA_CANONICA_DE_COLAS.md`
**Proyecto Supabase observado:** `vento-os-dev` — `clzdpinthhtknkmefsxx`
**Línea base del inventario auditado:** `vento-shell@9f502235ee3b32951f960f4c378641fa282d5da9`
**Línea base documental de corrección:** `vento-shell@de41def880376a013b8d1c2fd12335323eee7944`
**Líneas base de consumidores con activos materializados:** `vento-anima@50b77742cc0ae85f873d42152108a50acc9d6964`; `vento-nexo@142c4d696221e3ce3fda4ed3b62f3d1fe5b58799`; `vento-pass@b5a4aec908ef12226f798078577ab089a29ccda2`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Materializar un inventario reproducible de los mecanismos actuales que ejecutan trabajo fuera del flujo inmediato de una solicitud de usuario o que difieren, reintentan, programan, transportan o disparan efectos técnicos en Vento OS.

La tarea debe distinguir obligatoriamente:

```text
DEFINIDO EN CÓDIGO
≠
DESPLEGADO
≠
ACTIVO
≠
EJECUTADO CON ÉXITO
≠
CANÓNICO OBJETIVO
```

También debe preservar:

```text
PROPIETARIO EMPRESARIAL DEL HECHO
≠
PLANIFICADOR
≠
COLA
≠
WORKER
≠
TRIGGER
≠
WEBHOOK
≠
SERVICIO TÉCNICO
```

`QUEUE-ARC-001` registra el estado comprobado. No selecciona la arquitectura objetivo ni migra activos existentes.

---

#### 2. Resultado sustantivo

Se establece el inventario `QUEUE-CURRENT-ASSET-INVENTORY-001` con **19 identidades materiales** dentro del alcance verificado.

Balance del inventario:

| Métrica                                                                 |  Resultado |
| ----------------------------------------------------------------------- | ---------: |
| Identidades esperadas después del descubrimiento                        |     **19** |
| Identidades materializadas                                              |     **19** |
| Identificadores duplicados                                              |      **0** |
| Identidades sin clase                                                   |      **0** |
| Identidades sin propietaria o autoridad identificable                   |      **0** |
| Jobs `pg_cron` activos observados remotamente                           |      **7** |
| Jobs `pg_cron` con última ejecución observada `succeeded`               | **7 de 7** |
| Schedules presentes en migraciones actuales pero ausentes de `cron.job` |      **1** |
| Workflows GitHub Actions programados y activos inventariados            |      **1** |
| Colas locales o técnicas explícitas inventariadas                       |      **4** |
| Automatizaciones móviles o de refresco recurrente inventariadas         |      **3** |
| Automatizaciones por trigger PostgreSQL inventariadas                   |      **1** |
| Webhooks externos con efecto empresarial inventariados                  |      **2** |
| Pendientes sin tarea propietaria                                        |      **0** |

El inventario usa IDs `QAI-*` exclusivamente como identidades internas de activos inventariados. No son tareas del roadmap ni requisitos `TREQ-*`.

---

#### 3. Fuentes consumidas

Esta tarea consume sin redefinir:

- `TSVC-CAT-001` a `TSVC-CAT-010`, especialmente la clasificación de orquestación asíncrona, programación recurrente, integraciones externas y adopción progresiva;
- `TREQ-INTEGRATION-003`, que protege identidad estable, idempotencia, estado durable, retry, claim, conciliación y recuperación de operaciones asíncronas;
- `TREQ-INTEGRATION-004`, que protege trazabilidad de triggers, funciones, jobs, webhooks y notificaciones;
- `TREQ-SHELL-009`, que exige distinguir configuración, migraciones, funciones y objetos activos por ambiente;
- `TREQ-SHELL-010`, que mantiene credenciales y secretos separados de autoridad y evita exposición de secretos;
- las migraciones actuales de `vento-shell` que crean funciones, triggers y schedules;
- las Edge Functions actualmente versionadas en `vento-shell`;
- la rama principal vigente de los repositorios VENTO inspeccionados;
- el estado remoto de `vento-os-dev`, incluido `pg_cron`, `pg_net`, triggers no internos y ejecuciones recientes;
- el workflow programado de eliminación de cuentas en `vento-pass`.

Ninguna fuente se modifica por esta tarea.

#### 3.1. Mapa canónico de handoff `QUEUE-ARC-002` a `QUEUE-ARC-012`

Para impedir que una brecha sea asignada a una tarea con otra responsabilidad, todo destino de este inventario se resuelve contra los títulos canónicos vigentes:

| Tarea           | Responsabilidad canónica                                        |
| --------------- | --------------------------------------------------------------- |
| `QUEUE-ARC-002` | Definir contrato canónico de trabajo asíncrono                  |
| `QUEUE-ARC-003` | Definir clave de idempotencia por trabajo                       |
| `QUEUE-ARC-004` | Definir prioridad, programación y vencimiento                   |
| `QUEUE-ARC-005` | Definir asignación a trabajador, dispositivo o adaptador        |
| `QUEUE-ARC-006` | Definir reintentos, backoff y límite máximo                     |
| `QUEUE-ARC-007` | Definir cancelación antes y durante ejecución                   |
| `QUEUE-ARC-008` | Definir cola de fallos y recuperación manual                    |
| `QUEUE-ARC-009` | Definir bloqueo de duplicados y concurrencia                    |
| `QUEUE-ARC-010` | Definir estados y eventos canónicos                             |
| `QUEUE-ARC-011` | Definir métricas de espera, ejecución y error                   |
| `QUEUE-ARC-012` | Definir autorización para crear, cancelar y reintentar trabajos |

Regla de handoff: una referencia posterior solo puede usar un `QUEUE-ARC-*` cuando la brecha descrita corresponda a la responsabilidad canónica de esa tarea. Una misma identidad puede consumir varias tareas cuando existan necesidades distintas, pero cada relación deberá ser semánticamente explícita.

---

#### 4. Alcance del inventario

Se incluye una identidad cuando cumple al menos una de estas condiciones verificadas:

1. existe como job activo de `pg_cron`;
2. existe como schedule declarado en una migración vigente aunque no esté activo remotamente;
3. existe como workflow programado activo en GitHub Actions;
4. existe como cola persistida o semipersistida que conserva trabajo pendiente;
5. existe como worker o temporizador que reintenta o procesa una cola;
6. existe como tarea móvil en segundo plano con capacidad de producir un efecto empresarial;
7. existe como trigger PostgreSQL que dispara trabajo HTTP o una automatización equivalente;
8. existe como webhook externo que produce efectos empresariales de forma desacoplada respecto del flujo interno que originó el hecho;
9. existe como automatización recurrente de aplicación que actualiza una proyección operacional aunque no sea durable.

No se contabilizan como activo independiente:

- temporizadores usados únicamente para un reloj visual;
- polling de bootstrap de una librería sin trabajo empresarial pendiente;
- funciones que solo están disponibles para invocación explícita y no poseen por sí mismas trigger, schedule, cola o fuente asíncrona actual;
- documentación objetivo sin implementación actual;
- tareas futuras de `QUEUE-ARC-002` a `QUEUE-ARC-012`.

---

#### 5. Inventario materializado

| ID        | Clase                            | Identidad observada                                                                                | Propietaria / autoridad empresarial                                                     | Ejecutor o soporte técnico                                                                                      | Estado comprobado                                                                                                                                                | Riesgo o frontera actual                                                                                                                                                                                          | Destino documental                                                                                                                                                                                                                                                                                                                                                                             |
| --------- | -------------------------------- | -------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `QAI-001` | `PG_CRON`                        | `anima_attendance_day_end_close_0005` — `5 0 * * *`                                                | `ANIMA` / asistencia                                                                    | `pg_cron` → `public.close_open_attendance_day_end()`                                                            | `DESPLEGADO_ACTIVO`; última ejecución observada `succeeded`; definición versionada en `vento-shell`                                                              | comparte propósito de cierre diario con `QAI-004`; la identidad lógica y precedencia deben quedar explícitas                                                                                                      | contrato en `QUEUE-ARC-002`; idempotencia en `QUEUE-ARC-003`; programación en `QUEUE-ARC-004`; concurrencia en `QUEUE-ARC-009`                                                                                                                                                                                                                                                                 |
| `QAI-002` | `PG_CRON_HTTP_WORKER`            | `anima_shift_runtime_processor_every_5m` — `*/5 * * * *`                                           | `ANIMA` / runtime de turnos                                                             | `pg_cron` → función SQL → `pg_net` → Edge Function `shift-runtime-processor`                                    | `DESPLEGADO_ACTIVO`; última ejecución observada `succeeded`; definición y endurecimiento de secreto versionados                                                  | es una cadena multi-etapa; el cron exitoso no demuestra por sí solo entrega y resultado final de cada notificación                                                                                                | contrato en `QUEUE-ARC-002`; programación en `QUEUE-ARC-004`; asignación de ejecutor en `QUEUE-ARC-005`; reintentos en `QUEUE-ARC-006`; recuperación de fallos en `QUEUE-ARC-008`; estados y eventos en `QUEUE-ARC-010`; métricas en `QUEUE-ARC-011`                                                                                                                                           |
| `QAI-003` | `PG_CRON`                        | `attendance_stale_open_shift_autoclose_daily_bogota` — `10 5 * * *`                                | `ANIMA` / asistencia                                                                    | `pg_cron` → `public.close_stale_open_attendance_shifts()`                                                       | `DESPLEGADO_ACTIVO`; última ejecución observada `succeeded`; definición versionada                                                                               | cierre correctivo distinto del cierre diario ordinario; debe conservar causa y no competir con otros cierres                                                                                                      | contrato en `QUEUE-ARC-002`; idempotencia en `QUEUE-ARC-003`; programación en `QUEUE-ARC-004`; concurrencia en `QUEUE-ARC-009`; estados en `QUEUE-ARC-010`                                                                                                                                                                                                                                     |
| `QAI-004` | `PG_CRON_LEGACY_OR_TRANSITIONAL` | `auto-close-attendance` — `59 4 * * *`                                                             | `ANIMA` / asistencia                                                                    | `pg_cron` → `public.close_open_attendance_day_end()`                                                            | `DESPLEGADO_ACTIVO`; última ejecución observada `succeeded`; inventariado por E3, sin schedule homónimo localizado entre las migraciones actuales inspeccionadas | segunda autoridad programada que invoca el mismo cierre base de `QAI-001`; requiere reconciliar identidad, necesidad y retiro sin doble efecto                                                                    | contrato en `QUEUE-ARC-002`; idempotencia en `QUEUE-ARC-003`; programación en `QUEUE-ARC-004`; concurrencia en `QUEUE-ARC-009`; transición bajo `TSVC-CAT-010`                                                                                                                                                                                                                                 |
| `QAI-005` | `PG_CRON_HTTP_AUTOMATION`        | `document-alerts-daily` — `0 14 * * *`                                                             | `ANIMA` / documentos y alertas                                                          | `pg_cron` → `pg_net` → Edge Function `document-alerts`                                                          | `DESPLEGADO_ACTIVO`; última ejecución observada `succeeded`; Edge Function versionada; job reconocido por el mapa E3                                             | el comando remoto contiene material de autorización y material de clave cron embebidos; sus valores no forman parte de este inventario                                                                            | contrato en `QUEUE-ARC-002`; programación en `QUEUE-ARC-004`; reintentos en `QUEUE-ARC-006`; recuperación de fallos en `QUEUE-ARC-008`; estados en `QUEUE-ARC-010`; métricas en `QUEUE-ARC-011`; autorización en `QUEUE-ARC-012`; protección de secretos en `TI-AUTH-004`                                                                                                                      |
| `QAI-006` | `PG_CRON_MAINTENANCE`            | `pass_delivery_quotes_cleanup_hourly` — `17 * * * *`                                               | `PASS` / cotizaciones de entrega                                                        | `pg_cron` → `pass.cleanup_delivery_quotes()`                                                                    | `DESPLEGADO_ACTIVO`; última ejecución observada `succeeded`; definición versionada                                                                               | mantenimiento de vigencia; debe distinguir limpieza técnica de decisión empresarial de entrega                                                                                                                    | contrato en `QUEUE-ARC-002`; programación y vencimiento en `QUEUE-ARC-004`; estados y eventos en `QUEUE-ARC-010`; métricas en `QUEUE-ARC-011`                                                                                                                                                                                                                                                  |
| `QAI-007` | `PG_CRON_RECONCILIATION`         | `pass_payment_checkout_expiry_reconciliation` — `*/5 * * * *`                                      | `PASS/PULSO` / checkout y pago                                                          | `pg_cron` → `public.reconcile_expired_payment_checkouts()`                                                      | `DESPLEGADO_ACTIVO`; última ejecución observada `succeeded`; definición versionada                                                                               | reconcilia expiraciones; debe preservar idempotencia y no confundir timeout con fallo definitivo                                                                                                                  | contrato en `QUEUE-ARC-002`; idempotencia en `QUEUE-ARC-003`; programación y vencimiento en `QUEUE-ARC-004`; reintentos en `QUEUE-ARC-006`; estados y eventos en `QUEUE-ARC-010`; métricas en `QUEUE-ARC-011`                                                                                                                                                                                  |
| `QAI-008` | `PG_CRON_DECLARED_NOT_DEPLOYED`  | `purge_inventory_form_drafts_daily` — `15 3 * * *`                                                 | `NEXO` / borradores de inventario                                                       | migración `vento-shell` → `public.purge_inventory_form_drafts()`                                                | `DECLARADO_EN_MIGRACION`; no aparece en `cron.job` del proyecto remoto observado                                                                                 | existe deriva entre definición versionada y estado desplegado; no se presume si fue retirado, omitido o falló su creación                                                                                         | contrato en `QUEUE-ARC-002`; programación en `QUEUE-ARC-004`; estados y eventos en `QUEUE-ARC-010`; métricas en `QUEUE-ARC-011`                                                                                                                                                                                                                                                                |
| `QAI-009` | `GITHUB_ACTIONS_CRON`            | `Process Account Deletions` — schedule fuente `0 3 * * *` y ejecución manual permitida             | `PASS/SHELL` / eliminación de cuenta                                                    | GitHub Actions `vento-pass` → Edge Function `process-account-deletions` en `vento-shell`                        | workflow `active`; última ejecución programada observada el `2026-08-13` con conclusión `success`                                                                | el schedule y el worker viven en repositorios distintos; requiere identidad transversal, autorización y conciliación por solicitud                                                                                | contrato en `QUEUE-ARC-002`; programación en `QUEUE-ARC-004`; asignación de ejecutor en `QUEUE-ARC-005`; recuperación de fallos en `QUEUE-ARC-008`; estados y eventos en `QUEUE-ARC-010`; métricas en `QUEUE-ARC-011`; autorización en `QUEUE-ARC-012`                                                                                                                                         |
| `QAI-010` | `MANAGED_HTTP_QUEUE`             | `net.http_request_queue`                                                                           | servicio técnico; no adquiere propiedad empresarial                                     | extensión Supabase `pg_net` `0.20.0`                                                                            | tabla de cola presente; **1** solicitud pendiente observada durante la auditoría                                                                                 | es cola técnica de transporte HTTP, no cola empresarial canónica ni evidencia de procesamiento final                                                                                                              | contrato en `QUEUE-ARC-002`; idempotencia en `QUEUE-ARC-003`; asignación de adaptador en `QUEUE-ARC-005`; reintentos en `QUEUE-ARC-006`; cola de fallos y recuperación en `QUEUE-ARC-008`; bloqueo y concurrencia en `QUEUE-ARC-009`; estados y eventos en `QUEUE-ARC-010`; métricas en `QUEUE-ARC-011`                                                                                        |
| `QAI-011` | `MOBILE_OFFLINE_QUEUE`           | cola ANIMA de operaciones de asistencia                                                            | `ANIMA` / asistencia                                                                    | `SecureStore` en `vento-anima`; entradas con `queued_attempt_id`, `idempotency_key`, intentos y siguiente retry | `IMPLEMENTADA_EN_CLIENTE`; persistencia local y deduplicación observadas                                                                                         | la durabilidad depende del dispositivo; no es una cola central ni debe convertirse en fuente del hecho                                                                                                            | contrato en `QUEUE-ARC-002`; idempotencia en `QUEUE-ARC-003`; asignación a dispositivo en `QUEUE-ARC-005`; reintentos en `QUEUE-ARC-006`; recuperación manual en `QUEUE-ARC-008`; concurrencia en `QUEUE-ARC-009`; estados en `QUEUE-ARC-010`; métricas en `QUEUE-ARC-011`; autorización en `QUEUE-ARC-012`                                                                                    |
| `QAI-012` | `MOBILE_OFFLINE_QUEUE`           | cola ANIMA de operaciones de descanso                                                              | `ANIMA` / asistencia                                                                    | `SecureStore` en `vento-anima`; almacenamiento separado de la cola de asistencia                                | `IMPLEMENTADA_EN_CLIENTE`; persistencia local observada                                                                                                          | comparte worker con `QAI-011` pero conserva una identidad de cola separada; debe evitar orden o efectos cruzados                                                                                                  | contrato en `QUEUE-ARC-002`; idempotencia en `QUEUE-ARC-003`; asignación a dispositivo en `QUEUE-ARC-005`; reintentos en `QUEUE-ARC-006`; recuperación manual en `QUEUE-ARC-008`; bloqueo y concurrencia en `QUEUE-ARC-009`; estados en `QUEUE-ARC-010`; métricas en `QUEUE-ARC-011`; autorización en `QUEUE-ARC-012`                                                                          |
| `QAI-013` | `MOBILE_RETRY_WORKER`            | procesador recurrente de colas de asistencia y descansos cada `15000 ms` cuando existen pendientes | `ANIMA` / asistencia                                                                    | `setInterval` en `vento-anima` + `queue-sync.ts`                                                                | `IMPLEMENTADO_EN_CLIENTE`; se activa solo con pendientes                                                                                                         | worker efímero ligado al proceso de la app; reinicio o pérdida de contexto no puede asumirse como procesamiento concluido                                                                                         | asignación de worker en `QUEUE-ARC-005`; reintentos en `QUEUE-ARC-006`; bloqueo de ejecuciones incompatibles en `QUEUE-ARC-009`; estados en `QUEUE-ARC-010`; métricas en `QUEUE-ARC-011`                                                                                                                                                                                                       |
| `QAI-014` | `MOBILE_BACKGROUND_TASK`         | `vento.attendance.background-location.v1`                                                          | `ANIMA` / asistencia y geocerca                                                         | Expo `TaskManager` → validación de ubicación → RPC `register_departure_event`                                   | `IMPLEMENTADO_EN_CLIENTE`; ejecución dependiente del SO, permisos y ubicación                                                                                    | una señal de salida puede producir un cierre; requiere conservar causa, actor técnico, dispositivo, zona y resultado sin asumir disponibilidad continua                                                           | contrato en `QUEUE-ARC-002`; idempotencia en `QUEUE-ARC-003`; asignación a dispositivo en `QUEUE-ARC-005`; concurrencia en `QUEUE-ARC-009`; estados y eventos en `QUEUE-ARC-010`; métricas en `QUEUE-ARC-011`                                                                                                                                                                                  |
| `QAI-015` | `BROWSER_LOCAL_QUEUE`            | `vento-nexo:printing:queue:v1`                                                                     | aplicación propietaria de la intención de impresión; NEXO en las superficies observadas | `localStorage` de navegador → BrowserPrint                                                                      | `IMPLEMENTADO_LOCALMENTE`; cola visible en la pantalla de trabajos de impresión                                                                                  | no existe cola servidor durable, claim central, retry transversal ni conciliación de resultado; BrowserPrint local no debe convertirse en autoridad empresarial                                                   | gobierno transversal en `QUEUE-ARC-002` a `QUEUE-ARC-012`; arquitectura específica de impresión en `PRINT-ARC-001` a `PRINT-ARC-020`                                                                                                                                                                                                                                                           |
| `QAI-016` | `UI_RECURRING_REFRESH`           | auto-refresh del tablero de ubicaciones NEXO cada `20 s` cuando está habilitado                    | `NEXO` / proyección de inventario                                                       | temporizador de cliente → `refreshPath`                                                                         | `IMPLEMENTADO_EN_CLIENTE`; lectura/refresco, sin cola durable                                                                                                    | automatización de lectura, no trabajo empresarial durable; se inventaría para evitar migrarla indebidamente como job                                                                                              | `NO_APLICA` para materialización como cola; cualquier cambio de experiencia permanece en la tarea propietaria de NEXO                                                                                                                                                                                                                                                                          |
| `QAI-017` | `DB_TRIGGER_HTTP_AUTOMATION`     | `trg_support_messages_notify_inserted` sobre `public.support_messages`                             | proceso propietario de soporte/mensaje; transporte técnico transversal                  | trigger → `public.notify_support_message_inserted` → `pg_net` → Edge Function `support-message-notify`          | `DESPLEGADO_ACTIVO`; único trigger no interno con `net.http_post` observado remotamente                                                                          | fallo de transporte no debe borrar el mensaje ni convertir notificación en fuente del hecho; requiere conciliación de entrega separada                                                                            | contrato en `QUEUE-ARC-002`; idempotencia en `QUEUE-ARC-003`; asignación de adaptador en `QUEUE-ARC-005`; reintentos en `QUEUE-ARC-006`; recuperación de fallos en `QUEUE-ARC-008`; concurrencia en `QUEUE-ARC-009`; estados en `QUEUE-ARC-010`; métricas en `QUEUE-ARC-011`; autorización en `QUEUE-ARC-012`; notificaciones en `NOTIFY-ARC-*`                                                |
| `QAI-018` | `EXTERNAL_WEBHOOK_AUTOMATION`    | Edge Function `payments-webhook` para eventos Wompi                                                | `PULSO/PASS` para transacción; proveedor solo aporta evento                             | webhook externo → verificación de checksum → RPC de estado y registro de evento                                 | función desplegada y versionada; contrato actual detecta evento previamente procesado                                                                            | reintentos, orden tardío y estado desconocido deben permanecer reconciliables; el proveedor no es fuente de venta                                                                                                 | contrato en `QUEUE-ARC-002`; idempotencia en `QUEUE-ARC-003`; asignación al adaptador en `QUEUE-ARC-005`; reintentos en `QUEUE-ARC-006`; recuperación de fallos en `QUEUE-ARC-008`; concurrencia en `QUEUE-ARC-009`; estados y eventos en `QUEUE-ARC-010`; métricas en `QUEUE-ARC-011`; autorización en `QUEUE-ARC-012`; integración externa bajo `TREQ-INTEGRATION-003` y tareas propietarias |
| `QAI-019` | `EXTERNAL_WEBHOOK_AUTOMATION`    | Edge Function `club-revenuecat-webhook`                                                            | `PASS/CLUB` / membresía y entitlement                                                   | webhook RevenueCat → verificación de secreto → escrituras de suscripción, entitlement y auditoría               | función desplegada y versionada                                                                                                                                  | el código observado no materializa una reclamación idempotente de evento equivalente a la existente en pagos; reintentos del proveedor requieren protección antes de confiar en el flujo como exactamente-una-vez | contrato en `QUEUE-ARC-002`; idempotencia en `QUEUE-ARC-003`; asignación al adaptador en `QUEUE-ARC-005`; reintentos en `QUEUE-ARC-006`; recuperación de fallos en `QUEUE-ARC-008`; concurrencia en `QUEUE-ARC-009`; estados y eventos en `QUEUE-ARC-010`; métricas en `QUEUE-ARC-011`; autorización en `QUEUE-ARC-012`; integración propietaria de PASS                                       |

---

#### 6. Reconciliación de `pg_cron`

El proyecto remoto observado tiene `pg_cron 1.6.4` y siete jobs activos.

| Identidad                                            | En migración actual inspeccionada                                           | En `cron.job` remoto | Último estado remoto observado | Clasificación             |
| ---------------------------------------------------- | --------------------------------------------------------------------------- | -------------------- | ------------------------------ | ------------------------- |
| `anima_attendance_day_end_close_0005`                | sí                                                                          | sí                   | `succeeded`                    | `DECLARADO_Y_DESPLEGADO`  |
| `anima_shift_runtime_processor_every_5m`             | sí                                                                          | sí                   | `succeeded`                    | `DECLARADO_Y_DESPLEGADO`  |
| `attendance_stale_open_shift_autoclose_daily_bogota` | sí                                                                          | sí                   | `succeeded`                    | `DECLARADO_Y_DESPLEGADO`  |
| `auto-close-attendance`                              | no se localizó schedule homónimo en las migraciones actuales inspeccionadas | sí                   | `succeeded`                    | `DESPLEGADO_TRANSICIONAL` |
| `document-alerts-daily`                              | no se localizó schedule homónimo en las migraciones actuales inspeccionadas | sí                   | `succeeded`                    | `DESPLEGADO_TRANSICIONAL` |
| `pass_delivery_quotes_cleanup_hourly`                | sí                                                                          | sí                   | `succeeded`                    | `DECLARADO_Y_DESPLEGADO`  |
| `pass_payment_checkout_expiry_reconciliation`        | sí                                                                          | sí                   | `succeeded`                    | `DECLARADO_Y_DESPLEGADO`  |
| `purge_inventory_form_drafts_daily`                  | sí                                                                          | no                   | no aplica                      | `DECLARADO_NO_DESPLEGADO` |

Balance de reconciliación:

```text
UNIÓN DE IDENTIDADES DE SCHEDULE = 8
INTERSECCIÓN CÓDIGO / REMOTO = 5
SOLO REMOTO = 2
SOLO CÓDIGO = 1
```

La existencia de `auto-close-attendance` y `document-alerts-daily` no es desconocida para el plan: ambos ya aparecen en el inventario y mapa de transición de E3. La brecha de esta tarea es que su schedule operativo actual no está materializado mediante una migración homónima vigente dentro del conjunto inspeccionado, mientras `purge_inventory_form_drafts_daily` presenta la situación inversa.

---

#### 7. Reconciliación de cierre automático de asistencia

Se observan tres automatizaciones de cierre relacionadas pero no equivalentes:

```text
QAI-001
cierre diario base a 00:05 UTC

QAI-004
segunda ejecución de close_open_attendance_day_end a 04:59 UTC

QAI-003
cierre de turnos abiertos stale a 05:10 UTC
```

La coexistencia no se interpreta automáticamente como defecto porque los momentos y condiciones no son idénticos. Sin embargo, `QAI-001` y `QAI-004` comparten la misma función base, por lo que `QUEUE-ARC-002` deberá fijar su identidad lógica y contrato; `QUEUE-ARC-004` deberá gobernar su programación y vigencia; `QUEUE-ARC-003` deberá preservar idempotencia; y `QUEUE-ARC-009` deberá impedir ejecución concurrente incompatible.

No se retira ni modifica ninguno desde esta tarea.

---

#### 8. Reconciliación de secretos y credenciales de automatización

La inspección remota se realizó sin incorporar valores de secretos al inventario.

Resultado observado:

- seis de los siete jobs `pg_cron` no presentan material de autorización ni clave cron embebidos en su comando;
- `document-alerts-daily` sí presenta material de autorización y material de clave cron dentro de la definición remota del comando;
- los valores concretos permanecen excluidos de este documento;
- `shift-runtime-processor` ya dispone de un mecanismo versionado distinto, basado en `internal_job_secrets` y cabecera interna derivada en servidor;
- la diferencia entre ambos mecanismos impide asumir una política homogénea de secretos para todos los schedulers actuales.

Destino obligatorio:

- `QUEUE-ARC-012` deberá definir la autorización para crear, cancelar y reintentar trabajos sin convertir una credencial técnica en permiso empresarial;
- `TI-AUTH-004` conserva la protección de secretos y datos sensibles;
- la materialización física posterior deberá conservar la regla global de que Supabase se reproduce desde `vento-shell`.

---

#### 9. Colas locales y durabilidad

Las colas actuales no forman un servicio transversal único.

Se distinguen:

```text
ANIMA SecureStore
→ cola offline de asistencia
→ cola offline de descansos
→ worker móvil de retry

NEXO localStorage
→ cola local de impresión
→ BrowserPrint local

Supabase pg_net
→ net.http_request_queue
→ transporte HTTP administrado por extensión
```

Consecuencias:

1. existen al menos tres tecnologías de persistencia o transporte para trabajo diferido;
2. ninguna constituye por sí sola la cola canónica de Vento OS;
3. una cola local conserva trabajo del dispositivo, no propiedad empresarial del hecho;
4. `pg_net` conserva transporte HTTP y no reemplaza una identidad empresarial de job;
5. el navegador de impresión no demuestra entrega, impresión física o consumo exitoso solo porque el elemento desaparezca de una lista local;
6. reiniciar la aplicación, navegador, dispositivo o worker no puede convertirse en señal de éxito.

Estas decisiones no migran activos. Preparan el contrato de `QUEUE-ARC-002`.

---

#### 10. Automatizaciones por eventos y webhooks

Las automatizaciones event-driven observadas se mantienen separadas de cron:

| ID        | Origen             | Disparo                                    | Efecto técnico                                     | Regla de frontera                                                        |
| --------- | ------------------ | ------------------------------------------ | -------------------------------------------------- | ------------------------------------------------------------------------ |
| `QAI-014` | ANIMA móvil        | cambio de ubicación recibido en background | RPC de salida y posible autocierre                 | ubicación no es por sí sola cierre; servidor decide bajo reglas vigentes |
| `QAI-017` | `support_messages` | inserción en PostgreSQL                    | envío HTTP para notificación                       | mensaje permanece fuente del hecho; notificación es efecto derivado      |
| `QAI-018` | Wompi              | webhook firmado                            | reconciliación de transacción y registro de evento | proveedor no crea venta ni puede duplicar efecto por replay              |
| `QAI-019` | RevenueCat         | webhook autenticado                        | suscripción, entitlement y auditoría CLUB          | proveedor aporta evento; PASS conserva relación y debe proteger replay   |

El trigger histórico de publicación de turnos no se contabiliza como activo porque la migración vigente lo retira y deja la notificación de publicación bajo invocación explícita del flujo propietario.

---

#### 11. Hallazgos materializados

| Hallazgo  | Descripción                                                                                                                            | Riesgo                                                                  | Propietaria exacta de resolución                                                                                                                        |
| --------- | -------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `QAI-H01` | ocho identidades de schedule aparecen en la unión código/remoto, pero solo cinco coinciden entre ambos estados                         | drift, retiro incompleto o schedule esperado ausente                    | `QUEUE-ARC-002`; programación en `QUEUE-ARC-004`; estados y eventos en `QUEUE-ARC-010`; métricas en `QUEUE-ARC-011`                                     |
| `QAI-H02` | `QAI-001` y `QAI-004` invocan la misma función base de cierre diario desde dos schedules distintos                                     | doble autoridad o ejecución redundante si no se define identidad lógica | `QUEUE-ARC-002`; `QUEUE-ARC-003`; `QUEUE-ARC-004`; `QUEUE-ARC-009`                                                                                      |
| `QAI-H03` | `document-alerts-daily` contiene material sensible de autorización dentro del comando remoto                                           | exposición de secreto y gobierno técnico heterogéneo                    | `QUEUE-ARC-012`; `TI-AUTH-004`                                                                                                                          |
| `QAI-H04` | `purge_inventory_form_drafts_daily` está definido en migración pero no está activo en el proyecto remoto observado                     | falsa suposición de mantenimiento automático                            | `QUEUE-ARC-002`; `QUEUE-ARC-004`; `QUEUE-ARC-010`; `QUEUE-ARC-011`                                                                                      |
| `QAI-H05` | ANIMA mantiene dos colas SecureStore con un worker móvil periódico                                                                     | trabajo pendiente dependiente del dispositivo y recuperación parcial    | `QUEUE-ARC-002`; `QUEUE-ARC-003`; `QUEUE-ARC-005`; `QUEUE-ARC-006`; `QUEUE-ARC-008`; `QUEUE-ARC-009`; `QUEUE-ARC-010`; `QUEUE-ARC-011`; `QUEUE-ARC-012` |
| `QAI-H06` | NEXO conserva una cola de impresión solo en `localStorage` y entrega directa a BrowserPrint                                            | pérdida de trabajo, ausencia de claim y conciliación física             | `QUEUE-ARC-002` a `QUEUE-ARC-012`; detalle de impresión en `PRINT-ARC-*`                                                                                |
| `QAI-H07` | `net.http_request_queue` existe como cola técnica administrada y tenía una solicitud pendiente durante la observación                  | confundir transporte HTTP con job empresarial y perder el estado final  | `QUEUE-ARC-002`; `QUEUE-ARC-003`; `QUEUE-ARC-005`; `QUEUE-ARC-006`; `QUEUE-ARC-008`; `QUEUE-ARC-009`; `QUEUE-ARC-010`; `QUEUE-ARC-011`                  |
| `QAI-H08` | el webhook RevenueCat observado escribe efectos sin una reclamación de evento equivalente a la protección explícita observada en pagos | replay o duplicidad de efectos                                          | `QUEUE-ARC-003`; `QUEUE-ARC-006`; `QUEUE-ARC-009`                                                                                                       |
| `QAI-H09` | la eliminación programada de cuentas usa GitHub Actions en `vento-pass` y un worker en `vento-shell`                                   | identidad y observabilidad distribuidas entre dos repositorios          | `QUEUE-ARC-002`; `QUEUE-ARC-004`; `QUEUE-ARC-005`; `QUEUE-ARC-010`; `QUEUE-ARC-011`; `QUEUE-ARC-012`                                                    |

Ningún hallazgo queda sin destino documental explícito.

---

#### 12. Clasificación frente al servicio transversal objetivo

El inventario confirma la decisión previa de `TSVC-CAT-001`:

```text
ORQUESTACIÓN ASÍNCRONA TRANSVERSAL
= NO EXISTE COMO SERVICIO ÚNICO ACTUAL
```

Existen implementaciones parciales y especializadas:

- `pg_cron` para scheduling dentro de Supabase;
- `pg_net` para transporte HTTP diferido;
- GitHub Actions para una automatización recurrente de PASS;
- SecureStore y temporizador móvil para retry offline de ANIMA;
- TaskManager móvil para geocerca en background;
- `localStorage` + BrowserPrint para impresión NEXO;
- triggers PostgreSQL para notificación;
- webhooks de proveedores para pagos y membresía.

Por tanto, `QUEUE-ARC-002` no parte de cero, pero tampoco puede declarar que alguna de estas implementaciones sea la arquitectura canónica por su sola existencia.

---

#### 13. Prohibiciones

Queda prohibido interpretar esta tarea como autorización para:

1. crear una cola transversal;
2. modificar schedules;
3. activar `purge_inventory_form_drafts_daily`;
4. retirar `auto-close-attendance`;
5. cambiar `document-alerts-daily`;
6. rotar o mover secretos;
7. modificar GitHub Actions;
8. cambiar Edge Functions;
9. alterar triggers;
10. cambiar retries o backoff;
11. introducir tablas outbox, inbox o dead-letter;
12. modificar código de ANIMA, NEXO o PASS;
13. cambiar Supabase, datos, RLS, RPC, grants, extensiones o configuración;
14. convertir `pg_net`, SecureStore, localStorage o GitHub Actions en servicio canónico por inferencia;
15. iniciar o desarrollar `QUEUE-ARC-002`.

---

#### 14. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea materializa el inventario y reconcilia estado actual sin introducir un comportamiento ejecutable nuevo ni modificar una obligación protegida. La cobertura canónica vigente ya protege identidad estable, idempotencia, retry, claim, estado durable, reconciliación, recuperación, trazabilidad de cadenas asíncronas, coherencia por ambiente y separación de credenciales y secretos. Los hallazgos de esta tarea consumen esa cobertura existente y asignan su diseño posterior a tareas propietarias concretas.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

---

#### 15. Cobertura de prueba existente preservada

Se preserva sin modificación, en especial:

- `TREQ-INTEGRATION-003`, para identidad estable, idempotencia, retry, estado durable, claim, conciliación y recuperación de operaciones asíncronas;
- `TREQ-INTEGRATION-004`, para reconstrucción de cadenas trigger, función, job, webhook y notificación con resultado y error;
- `TREQ-SHELL-009`, para distinguir configuración, migraciones, funciones y objetos realmente activos por ambiente;
- `TREQ-SHELL-010`, para separar credenciales y secretos de identidad, autorización y exposición operativa;
- la cobertura vigente de autorización, seguridad, integración, Supabase, concurrencia y auditoría relacionada con los 19 activos inventariados.

Ninguna fila del registro canónico cambia de identidad, regla, estado, responsable, relación, evidencia ni secuencia por esta tarea.

---

#### 16. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. conserva `TSVC-CAT-010` como tarea anterior;
2. conserva `QUEUE-ARC-002` como única tarea siguiente reservada;
3. materializa las 19 identidades del universo descubierto;
4. asigna un identificador `QAI-*` único a cada activo;
5. distingue definición en código, despliegue remoto y ejecución observada;
6. registra los siete jobs `pg_cron` activos actuales;
7. conserva la reconciliación de ocho identidades de schedule en la unión código/remoto;
8. identifica cinco schedules coincidentes, dos solo remotos y uno solo declarado en migración;
9. registra el workflow programado de eliminación de cuentas y su frontera entre `vento-pass` y `vento-shell`;
10. registra `net.http_request_queue` como cola técnica administrada, no como cola empresarial;
11. registra las dos colas offline ANIMA y su worker recurrente;
12. registra la tarea móvil de ubicación en background;
13. registra la cola local de impresión NEXO;
14. registra el refresco recurrente NEXO sin convertirlo en job durable;
15. registra el trigger remoto de `support_messages` y su transporte por `pg_net`;
16. registra los webhooks Wompi y RevenueCat como automatizaciones externas con efecto empresarial;
17. documenta la coexistencia de los dos schedules que invocan el cierre diario base;
18. documenta la presencia de material sensible en `document-alerts-daily` sin reproducir sus valores;
19. documenta la deriva de `purge_inventory_form_drafts_daily`;
20. asigna cada brecha a una tarea existente exacta;
21. crea cero requisitos de prueba;
22. modifica cero requisitos de prueba;
23. crea cero objetos físicos;
24. modifica cero objetos físicos;
25. no modifica repositorios, Supabase ni estado remoto;
26. no inicia ni desarrolla `QUEUE-ARC-002`.

---

#### 17. Resultado de la tarea

`QUEUE-ARC-001` deja establecido un inventario verificable del trabajo asíncrono actual de Vento OS:

```text
19 ACTIVOS / CADENAS MATERIALIZADAS

7 PG_CRON ACTIVOS
1 SCHEDULE DECLARADO NO DESPLEGADO
1 GITHUB ACTIONS CRON ACTIVO
1 COLA PG_NET ADMINISTRADA
2 COLAS OFFLINE ANIMA
1 WORKER DE RETRY ANIMA
1 BACKGROUND TASK ANIMA
1 COLA LOCAL DE IMPRESIÓN NEXO
1 REFRESCO RECURRENTE NEXO
1 TRIGGER HTTP POSTGRESQL
2 WEBHOOKS EXTERNOS CON EFECTO EMPRESARIAL
```

El estado actual es fragmentado y heterogéneo. No existe una cola transversal única ni un scheduler empresarial único que pueda declararse canónico por inferencia.

La salida de esta tarea es suficiente para que `QUEUE-ARC-002` defina posteriormente el contrato canónico de trabajo asíncrono sobre identidades y brechas comprobadas, sin volver a descubrir el universo base.

---

#### 18. Continuidad

ÚLTIMA TAREA APROBADA

`TSVC-CAT-010 — Definir adopción progresiva y retiro de soluciones legacy`

TAREA ACTUAL APROBADA

`QUEUE-ARC-001 — Inventariar colas, cron, jobs y automatizaciones existentes`

SIGUIENTE TAREA RESERVADA

`QUEUE-ARC-002 — Definir contrato canónico de trabajo asíncrono`


### ✅ QUEUE-ARC-002 — Definir contrato canónico de trabajo asíncrono

**Estado:** APROBADA
**Tarea anterior:** `QUEUE-ARC-001 — Inventariar colas, cron, jobs y automatizaciones existentes`
**Tarea siguiente:** `QUEUE-ARC-003 — Definir clave de idempotencia por trabajo`
**Tipo de tarea:** documental; definición normativa y consumible del contrato base de trabajo asíncrono de Vento OS, especializado sobre `TSVC-SVC-001.CONTRACT@1.0.0`, con identidad, propiedad, causalidad, versionado, sobre mínimo, aceptación, resultado, error, composición con triggers y transportes, y reconciliación explícita de las 19 identidades `QAI-*`, sin materializar todavía persistencia, workers, colas, schedulers, endpoints ni políticas reservadas a `QUEUE-ARC-003..012`
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/03_INFRAESTRUCTURA_CANONICA_DE_COLAS.md`
**Servicio transversal propietario:** `TSVC-SVC-001 — Orquestación genérica de trabajos asíncronos`
**Contrato base consumido:** `TSVC-SVC-001.CONTRACT@1.0.0`
**Entrada inventariada:** `QUEUE-CURRENT-ASSET-INVENTORY-001` — 19 identidades `QAI-*`
**Línea base documental:** `vento-shell@a26c13c1cebf6ff985a3aed05c5cffdd5b65ad52`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir una unidad contractual única para representar trabajo asíncrono dentro de Vento OS sin convertir una tecnología de cola, un scheduler, un worker, un trigger, un webhook, un dispositivo o un repositorio local en propietario del proceso empresarial.

El contrato deberá permitir que una intención aceptada pueda identificarse, consultarse, correlacionarse, ejecutarse y cerrar con resultado o error verificable aunque su transporte, scheduler, worker o almacenamiento cambien durante la evolución del sistema.

La separación canónica queda fijada así:

```text
INTENCIÓN EMPRESARIAL O TÉCNICA
!=
TRABAJO CANÓNICO
!=
INTENTO DE EJECUCIÓN
!=
CLAIM O LEASE
!=
TRANSPORTE
!=
EFECTO EMPRESARIAL O FÍSICO
!=
RESULTADO AUTORITATIVO
```

Y también:

```text
TRIGGER != TRABAJO
SCHEDULE != TRABAJO
WEBHOOK != TRABAJO
WORKER != TRABAJO
COLA FÍSICA != TRABAJO
ACK TÉCNICO != RESULTADO EMPRESARIAL
```

---

#### 2. Base canónica consumida

`QUEUE-ARC-002` especializa, sin cambiar identidad ni versión, el contrato transversal ya aprobado:

| Campo                             | Valor canónico                                 |
| --------------------------------- | ---------------------------------------------- |
| `service_id`                      | `TSVC-SVC-001`                                 |
| `service_name`                    | `Orquestación genérica de trabajos asíncronos` |
| `contract_id`                     | `TSVC-SVC-001.CONTRACT`                        |
| `contract_version`                | `1.0.0`                                        |
| Solicitud canónica                | `WORK_SUBMISSION`                              |
| Resultado canónico                | `WORK_OUTCOME`                                 |
| Error canónico                    | `WORK_ERROR`                                   |
| Estado documental del contrato    | `DEFINED`                                      |
| Propietario técnico institucional | Tecnología de Vento Group                      |
| Repositorio canónico              | `vento-shell`                                  |

Reglas:

1. `QUEUE-ARC-002` no crea otro `contract_id` para la misma capacidad.
2. La identidad `TSVC-SVC-001.CONTRACT` no cambia por tecnología, proveedor, cola, repositorio, scheduler o worker.
3. La versión `1.0.0` permanece inmutable como versión inicial aprobada.
4. Todo cambio incompatible posterior deberá seguir la regla de versionado de `TSVC-CAT-004`.
5. El servicio transversal ejecuta capacidad técnica compartida; la aplicación propietaria conserva la decisión y el resultado empresarial.
6. Un adaptador específico de proveedor, dispositivo o transporte no adquiere identidad de contrato canónico por existir primero.

---

#### 3. Unidad conceptual de trabajo

La unidad `WORK_SUBMISSION` representa una intención aceptable para ejecución desacoplada del request, pantalla, dispositivo o proceso que la originó.

Un trabajo canónico debe poder responder, sin depender de la implementación física, estas preguntas:

1. ¿qué operación es?;
2. ¿qué versión contractual gobierna su semántica?;
3. ¿qué aplicación produjo la solicitud?;
4. ¿qué aplicación conserva la propiedad del resultado empresarial?;
5. ¿qué consumidoras pueden consultar o utilizar el resultado?;
6. ¿qué solicitud, evento u operación lo causó?;
7. ¿a qué coordinación mayor pertenece?;
8. ¿qué recurso o referencia empresarial afecta?;
9. ¿qué esquema valida la entrada?;
10. ¿qué esquema valida el resultado?;
11. ¿qué esquema valida el error?;
12. ¿cuándo fue creado?;
13. ¿cuál es su estado operativo actual?;
14. ¿cuál es el resultado autoritativo o error recuperable cuando termine?;
15. ¿qué extensión normativa gobierna idempotencia, programación, asignación, retry, cancelación, fallos, concurrencia, estados, métricas y autorización?

Un trabajo no se identifica por el proceso del worker que lo ejecuta ni por el registro físico de la cola que lo contiene.

---

#### 4. Sobre base `WORK_SUBMISSION`

Toda materialización futura del trabajo asíncrono deberá soportar conceptualmente el siguiente sobre base:

```text
service_id
contract_id
contract_version
operation_id
operation_type
producer_application
business_owner_application
consumer_application
request_id
correlation_id
causation_id
source_reference
request_schema_ref
result_schema_ref
error_schema_ref
created_at
payload
operation_status
receipt_id
result_ref
error_code
```

Reglas de obligatoriedad:

| Campo                        | Regla                                                                                                                                      |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| `service_id`                 | obligatorio; para este contrato conserva `TSVC-SVC-001`                                                                                    |
| `contract_id`                | obligatorio; conserva `TSVC-SVC-001.CONTRACT`                                                                                              |
| `contract_version`           | obligatorio; nunca se infiere por ausencia                                                                                                 |
| `operation_id`               | obligatorio; identifica una operación concreta y no se reutiliza para otra                                                                 |
| `operation_type`             | obligatorio; identifica de forma estable la clase lógica de trabajo definida por su contrato propietario                                   |
| `producer_application`       | obligatorio; debe corresponder a una aplicación productora autorizada por el catálogo transversal                                          |
| `business_owner_application` | obligatorio; conserva la autoridad sobre el resultado empresarial                                                                          |
| `consumer_application`       | obligatorio cuando exista una consumidora empresarial concreta; no convierte al worker en aplicación consumidora                           |
| `request_id`                 | obligatorio cuando el origen disponga de una solicitud identificable; si no existe deberá quedar semánticamente `NO_APLICA`, no inventarse |
| `correlation_id`             | obligatorio para preservar la coordinación de operaciones relacionadas                                                                     |
| `causation_id`               | obligatorio cuando exista una causa directa identificable; si no aplica deberá quedar declarado                                            |
| `source_reference`           | obligatorio cuando la solicitud deriva de un recurso, evento, documento, schedule, webhook u otra fuente identificable                     |
| `request_schema_ref`         | obligatorio; identifica el esquema versionado de entrada                                                                                   |
| `result_schema_ref`          | obligatorio; identifica el esquema versionado de resultado                                                                                 |
| `error_schema_ref`           | obligatorio; identifica el esquema versionado de error                                                                                     |
| `created_at`                 | obligatorio; registra creación del trabajo, no inicio de intento                                                                           |
| `payload`                    | obligatorio salvo operación sin parámetros; debe validar contra `request_schema_ref`                                                       |
| `operation_status`           | obligatorio; su vocabulario y transiciones pertenecen a `QUEUE-ARC-010`                                                                    |
| `receipt_id`                 | obligatorio después de aceptación durable o reserva equivalente; no prueba ejecución ni efecto                                             |
| `result_ref`                 | obligatorio cuando exista resultado autoritativo recuperable; no apunta a un log, spinner ni ACK transitorio                               |
| `error_code`                 | obligatorio cuando el trabajo exponga un error contractual; taxonomía y transición permanecen gobernadas por las tareas propietarias       |

Cuando la operación afecte un recurso versionado, el `payload` o el esquema referenciado deberá conservar obligatoriamente la identidad del recurso y la versión esperada. Esa versión no podrá inferirse desde el estado más reciente al momento de ejecutar si hacerlo cambia la intención original.

---

#### 5. Inmutabilidad y proyección operativa

El trabajo se divide conceptualmente en dos capas.

##### 5.1. Descriptor inmutable

Después de aceptar una intención no podrán cambiar silenciosamente:

```text
service_id
contract_id
contract_version
operation_id
operation_type
producer_application
business_owner_application
request_id
correlation_id
causation_id
source_reference
request_schema_ref
result_schema_ref
error_schema_ref
payload lógico
recurso objetivo y versión esperada cuando apliquen
```

Cambiar semántica, propietario, contrato, recurso, versión o payload material representa otra intención o una operación de corrección explícitamente relacionada; no una mutación silenciosa del trabajo original.

##### 5.2. Proyección operativa mutable

Podrán evolucionar mediante reglas controladas:

- estado del trabajo;
- prioridad y programación;
- asignación técnica;
- intentos y retry;
- solicitud o resultado de cancelación;
- aislamiento de fallos;
- claim, lease y fencing;
- métricas y tiempos operativos;
- referencias de resultado, error y conciliación.

La mutabilidad operativa no cambia la identidad empresarial ni contractual de la intención.

---

#### 6. Contrato de aceptación

Aceptar un `WORK_SUBMISSION` significa exclusivamente que la intención superó las validaciones aplicables de contrato y quedó registrada de manera consultable o reservada mediante un mecanismo equivalente.

La aceptación deberá producir o devolver:

```text
operation_id
receipt_id
contract_id
contract_version
operation_status
correlation_id
```

Reglas:

1. `receipt_id` es un acuse consultable; no demuestra ejecución, entrega, impresión, pago, notificación, cierre empresarial ni otro efecto final.
2. Un `2xx`, ACK de proveedor, inserción en una cola técnica o respuesta del scheduler no equivale por sí solo a `WORK_OUTCOME` exitoso.
3. La ausencia de confirmación final no autoriza a declarar éxito.
4. Un trabajo aceptado deberá poder recuperarse por su identidad estable aunque cambie de worker o intento.
5. El contrato de aceptación no define todavía cómo se deduplican solicitudes repetidas; esa decisión pertenece a `QUEUE-ARC-003`.
6. El contrato de aceptación no define todavía prioridad, calendario ni vencimiento; esa decisión pertenece a `QUEUE-ARC-004`.
7. La autorización requerida para crear el trabajo pertenece a `QUEUE-ARC-012`; una credencial técnica válida no concede por sí sola autoridad empresarial.

---

#### 7. Contrato de resultado `WORK_OUTCOME`

Un `WORK_OUTCOME` representa la conclusión autoritativa conocida de un trabajo y deberá conservar al menos:

```text
service_id
contract_id
contract_version
operation_id
correlation_id
operation_status
result_schema_ref
result_ref
```

Reglas:

1. el resultado conserva la misma identidad y versión contractual del trabajo que lo originó;
2. `result_ref` apunta a una fuente autoritativa o artefacto verificable;
3. el resultado no se redefine a partir de logs, UI, tiempo transcurrido o desaparición del elemento de una cola local;
4. el servicio transversal puede registrar el resultado técnico, pero no inventa un resultado empresarial que pertenece a otra aplicación;
5. cuando el efecto sea físico o externo y la confirmación sea ambigua, el trabajo no se declara exitoso solo por haber enviado la solicitud;
6. una consumidora puede proyectar el resultado, pero no modificar retroactivamente la intención original;
7. el vocabulario exacto de estados terminales y eventos se cierra en `QUEUE-ARC-010`.

---

#### 8. Contrato de error `WORK_ERROR`

Un `WORK_ERROR` deberá conservar al menos:

```text
service_id
contract_id
contract_version
operation_id
correlation_id
operation_status
error_schema_ref
error_code
```

Reglas:

1. un error debe ser consultable y correlacionable con el trabajo original;
2. error técnico, rechazo empresarial, conflicto contractual, timeout ambiguo y cancelación no se fusionan bajo un único significado genérico;
3. un error no reescribe el payload ni la identidad del trabajo;
4. la clasificación de retry y backoff corresponde a `QUEUE-ARC-006`;
5. la cola de fallos y recuperación manual corresponde a `QUEUE-ARC-008`;
6. la transición exacta entre estados corresponde a `QUEUE-ARC-010`;
7. las métricas derivadas del error corresponden a `QUEUE-ARC-011`.

---

#### 9. Composición con otros servicios y mecanismos

El contrato de trabajo no absorbe los contratos de otros servicios transversales.

##### 9.1. Programación recurrente

```text
TSVC-SVC-009.CONTRACT
SCHEDULE_DEFINITION / ocurrencia lógica
        ↓
puede originar
        ↓
TSVC-SVC-001.CONTRACT
WORK_SUBMISSION
```

El schedule conserva su identidad propia. Una ocurrencia y el trabajo que genera son correlacionables, no intercambiables.

##### 9.2. Integraciones y webhooks

```text
TSVC-SVC-008.CONTRACT
INTEGRATION_MESSAGE
        ↓
validación / mapping / deduplicación de frontera
        ↓
puede originar
        ↓
WORK_SUBMISSION
```

El evento de proveedor no se convierte en aplicación VENTO ni en fuente de verdad del resultado empresarial.

##### 9.3. Outbox y eventos

`TSVC-SVC-002.CONTRACT` conserva la identidad del evento empresarial. Si una consumidora necesita procesamiento asíncrono, el evento puede causar un trabajo distinto con `causation_id` y `correlation_id` preservados.

##### 9.4. Impresión, notificaciones, documentos, archivos y evidencia

Los contratos `TSVC-SVC-003..007` conservan su semántica especializada. La orquestación genérica puede ejecutar o coordinar sus trabajos sin convertir `WORK_SUBMISSION` en sustituto de `PRINT_REQUEST`, `NOTIFICATION_REQUEST`, `DOCUMENT_GENERATION_REQUEST`, `FILE_INGEST_REQUEST` o `EVIDENCE_CAPTURE_REQUEST`.

---

#### 10. Propiedad, productor, consumidor y ejecutor

Se fija la siguiente separación:

| Rol                      | Responsabilidad                                   | No puede asumir                                  |
| ------------------------ | ------------------------------------------------- | ------------------------------------------------ |
| aplicación productora    | someter la intención bajo contrato compatible     | propiedad automática del servicio transversal    |
| aplicación propietaria   | decidir semántica y resultado empresarial         | usar la cola como fuente de verdad del dominio   |
| servicio transversal     | registrar y coordinar ejecución técnica           | alterar reglas del proceso empresarial           |
| worker                   | ejecutar un intento bajo identidad técnica        | cambiar propietario, contrato o payload material |
| scheduler                | originar una ocurrencia programada                | declarar por sí solo éxito empresarial           |
| adaptador                | traducir transporte o proveedor                   | inventar campos autoritativos ausentes           |
| dispositivo o periférico | ejecutar o confirmar efecto físico cuando aplique | conceder autorización empresarial                |
| consumidor autorizado    | leer o usar resultado compatible                  | reabrir o reescribir la intención original       |

La aplicación propietaria del resultado deberá permanecer identificable durante toda la vida del trabajo, aun cuando productora, worker, dispositivo, adaptador y consumidora sean entidades distintas.

---

#### 11. Identidad técnica y secretos

El contrato conserva la separación aprobada entre actor, aplicación, servicio, worker, dispositivo, proveedor y scheduler.

Reglas:

1. el payload empresarial no incorpora secretos, `service_role`, API keys, tokens privados ni claves cron;
2. una referencia de secreto o principal técnico no forma parte de la semántica empresarial del payload;
3. el worker no conserva como credencial persistente el token del actor originador;
4. rotar una credencial no cambia `operation_id`, `contract_id` ni propiedad empresarial;
5. logs, errores y evidencia no deberán copiar payloads sensibles completos cuando una referencia segura sea suficiente;
6. autorización empresarial y autenticación técnica permanecen separadas;
7. el detalle de autorización para crear, cancelar y reintentar trabajos se cierra en `QUEUE-ARC-012`.

---

#### 12. Extensiones normativas reservadas `QUEUE-ARC-003..012`

`QUEUE-ARC-002` fija los puntos de extensión y sus propietarios exactos. Ninguna tarea posterior podrá reasignar silenciosamente estas responsabilidades.

| Tarea           | Responsabilidad exclusiva o principal                   | Relación con el contrato base                                                                                  |
| --------------- | ------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `QUEUE-ARC-003` | clave de idempotencia por trabajo                       | define `idempotency_key`, ámbito, huella y conflicto de repetición                                             |
| `QUEUE-ARC-004` | prioridad, programación y vencimiento                   | define prioridad, disponibilidad temporal, calendario, vigencia, deadline, expiración y misfire cuando aplique |
| `QUEUE-ARC-005` | asignación a trabajador, dispositivo o adaptador        | define destinatario técnico de ejecución y reglas de asignación                                                |
| `QUEUE-ARC-006` | reintentos, backoff y límite máximo                     | define intento, contador, clases reintentables, backoff, presupuesto y agotamiento                             |
| `QUEUE-ARC-007` | cancelación antes y durante ejecución                   | define solicitud, aceptación, carrera con ejecución y resultado de cancelación                                 |
| `QUEUE-ARC-008` | cola de fallos y recuperación manual                    | define aislamiento, dead-letter, cuarentena y reanudación controlada                                           |
| `QUEUE-ARC-009` | bloqueo de duplicados y concurrencia                    | define claim, lease, fencing, exclusión y conflictos concurrentes                                              |
| `QUEUE-ARC-010` | estados y eventos canónicos                             | define estado, transiciones, eventos y terminalidad                                                            |
| `QUEUE-ARC-011` | métricas de espera, ejecución y error                   | define tiempos, contadores, SLIs y dimensiones operativas                                                      |
| `QUEUE-ARC-012` | autorización para crear, cancelar y reintentar trabajos | define autoridad empresarial y técnica de las acciones de control                                              |

Los siguientes nombres de estado permanecen reservados por el bloque y no se redefinen en esta tarea:

```text
queued
scheduled
assigned
processing
succeeded
retry_pending
failed
cancelled
expired
```

Su significado exacto, transición y evento correspondiente pertenecen a `QUEUE-ARC-010`.

---

#### 13. Reconciliación de las 19 identidades `QAI-*`

Se materializa una decisión explícita para cada identidad del inventario `QUEUE-CURRENT-ASSET-INVENTORY-001`.

| ID        | Identidad actual                                     | Relación con el contrato canónico                        | Decisión de `QUEUE-ARC-002`                                                                                                                                                                    |
| --------- | ---------------------------------------------------- | -------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `QAI-001` | `anima_attendance_day_end_close_0005`                | schedule que ejecuta cierre diario                       | la ocurrencia programada deberá conservar identidad de schedule y correlacionarse con un `WORK_SUBMISSION` o mecanismo contractualmente equivalente; el cron no será la identidad del trabajo  |
| `QAI-002` | `anima_shift_runtime_processor_every_5m`             | cadena cron → SQL → `pg_net` → Edge Function             | cada ocurrencia y procesamiento deberá ser reconstruible como trabajo, intentos y resultado; `pg_net` permanece transporte, no fuente del resultado                                            |
| `QAI-003` | `attendance_stale_open_shift_autoclose_daily_bogota` | schedule correctivo de asistencia                        | cada ocurrencia lógica deberá conservar causa y trabajo distinguibles del cierre diario ordinario                                                                                              |
| `QAI-004` | `auto-close-attendance`                              | schedule transicional que comparte función con `QAI-001` | conserva identidad independiente mientras exista; cualquier ejecución deberá correlacionarse con trabajo canónico sin fusionarse con `QAI-001` por usar la misma función                       |
| `QAI-005` | `document-alerts-daily`                              | cron → `pg_net` → Edge Function                          | deberá separar schedule, trabajo, transporte y resultado; los secretos del comando no forman parte del payload contractual                                                                     |
| `QAI-006` | `pass_delivery_quotes_cleanup_hourly`                | mantenimiento recurrente                                 | la ocurrencia deberá representar una intención técnica con propietario PASS y resultado consultable, sin convertir limpieza técnica en decisión empresarial de entrega                         |
| `QAI-007` | `pass_payment_checkout_expiry_reconciliation`        | reconciliación programada                                | cada ocurrencia deberá conservar contrato, causa y resultado; timeout o ausencia de filas no se interpretan automáticamente como éxito empresarial                                             |
| `QAI-008` | `purge_inventory_form_drafts_daily`                  | schedule declarado en migración y no observado activo    | queda sujeto al mismo contrato si se materializa; la definición en código no equivale a un trabajo ejecutado ni a un resultado                                                                 |
| `QAI-009` | `Process Account Deletions`                          | GitHub Actions cron → Edge Function                      | schedule y worker en repositorios distintos deberán compartir `operation_id`, correlación y resultado contractual cuando la operación se implemente bajo la arquitectura objetivo              |
| `QAI-010` | `net.http_request_queue`                             | cola administrada de transporte HTTP                     | se clasifica como soporte técnico, no como registro canónico de trabajo; toda solicitud transportada deberá correlacionarse con el trabajo propietario cuando exista                           |
| `QAI-011` | cola ANIMA de operaciones de asistencia              | cola offline local                                       | representa staging local de una intención; deberá converger a una identidad de trabajo/operación estable sin que `SecureStore` se convierta en fuente del hecho empresarial                    |
| `QAI-012` | cola ANIMA de operaciones de descanso                | cola offline local                                       | misma regla que `QAI-011`, conservando identidad separada de la intención de descanso y sin mezclar órdenes ni resultados                                                                      |
| `QAI-013` | worker móvil de retry cada `15000 ms`                | ejecutor periódico local                                 | se clasifica como worker, no como trabajo; procesa trabajos o intenciones pendientes y no genera una nueva identidad por cada tick                                                             |
| `QAI-014` | `vento.attendance.background-location.v1`            | trigger móvil en background                              | el callback no es un trabajo por sí solo; cuando produzca una acción diferida o reintentable deberá originar/correlacionar trabajo conservando dispositivo, causa y resultado del servidor     |
| `QAI-015` | `vento-nexo:printing:queue:v1`                       | cola local de impresión                                  | cada intención de impresión deberá conservar identidad contractual estable y resultado separado de BrowserPrint; `localStorage` no será la identidad canónica                                  |
| `QAI-016` | auto-refresh NEXO cada `20 s`                        | refresco de lectura de UI                                | `NO_APLICA` como trabajo durable mientras permanezca lectura recurrente sin efecto empresarial; no deberá migrarse a la cola genérica por el solo hecho de usar temporizador                   |
| `QAI-017` | `trg_support_messages_notify_inserted`               | trigger PostgreSQL → `pg_net` → notificación             | el mensaje original conserva propiedad; la entrega derivada deberá tener trabajo/operación correlacionable sin convertir la notificación en fuente del mensaje                                 |
| `QAI-018` | `payments-webhook`                                   | webhook externo Wompi                                    | el evento entrante conserva contrato de integración; cualquier procesamiento diferido originado deberá vincularse a trabajo distinto mediante causalidad y no duplicar el efecto transaccional |
| `QAI-019` | `club-revenuecat-webhook`                            | webhook externo RevenueCat                               | el evento entrante conserva contrato de integración; cualquier procesamiento diferido deberá usar trabajo correlacionable y no convertir al proveedor en propietario de la relación PASS/CLUB  |

Balance:

```text
IDENTIDADES ESPERADAS = 19
IDENTIDADES MATERIALIZADAS = 19
IDENTIFICADORES DUPLICADOS = 0
IDENTIDADES SIN DECISIÓN = 0
```

---

#### 14. Reglas de adaptación del estado actual

1. Ningún `QAI-*` se declara migrado por esta tarea.
2. La existencia de un activo actual no modifica `TSVC-SVC-001.CONTRACT@1.0.0`.
3. Los activos locales podrán conservarse durante transición si preservan identidad, causalidad y resultado sin competir con la fuente autoritativa.
4. `pg_cron`, GitHub Actions y temporizadores son fuentes de disparo; no constituyen por sí solos el registro de trabajo.
5. `pg_net` es transporte HTTP; no constituye resultado empresarial ni cola empresarial canónica.
6. `SecureStore` y `localStorage` pueden conservar intenciones offline/locales, pero no adquieren propiedad del hecho empresarial.
7. Un Edge Function puede ejecutar un trabajo, pero su nombre de función no sustituye `operation_id` ni `operation_type`.
8. Un webhook puede causar un trabajo; el ID externo y el `operation_id` permanecen conceptos distintos.
9. Una automatización que permanezca exclusivamente de lectura, como `QAI-016`, no se fuerza al contrato de trabajo durable.
10. La implementación física, migración o retiro de estos activos se realizará únicamente mediante los paquetes posteriores que correspondan y bajo las reglas aprobadas de adopción progresiva.

---

#### 15. Garantía de entrega y efecto

El contrato base adopta la decisión transversal ya aprobada:

```text
ENTREGA / EJECUCIÓN TÉCNICA
= puede requerir procesamiento AL MENOS UNA VEZ

EFECTO OBSERVABLE
= debe protegerse contra duplicidad mediante contrato e idempotencia

GARANTÍA EXACTLY-ONCE END-TO-END
= NO SE DECLARA SIN EVIDENCIA END-TO-END
```

Por tanto:

1. una cola o proveedor puede entregar más de una vez;
2. el trabajo conserva identidad estable a través de reentregas;
3. el efecto empresarial no puede depender de que la infraestructura entregue una sola vez;
4. `QUEUE-ARC-003`, `QUEUE-ARC-006` y `QUEUE-ARC-009` completarán las protecciones específicas;
5. un efecto ambiguo deberá permanecer recuperable o conciliable y nunca convertirse automáticamente en otra intención.

---

#### 16. Compatibilidad y evolución

1. `contract_version` viaja con solicitud, resultado y error.
2. No existe versión implícita por ausencia del campo.
3. Una versión desconocida o incompatible se rechaza antes de producir un efecto.
4. Campos opcionales futuros solo podrán agregarse mediante una versión compatible cuando su ausencia sea semánticamente segura.
5. Cambiar propietario, semántica del resultado, estado terminal, garantía de aceptación, obligatoriedad de un campo, tipo o significado exige la clasificación de cambio correspondiente de `TSVC-CAT-004`.
6. Un adaptador de compatibilidad conserva versión de origen, versión de destino e identidad del adaptador.
7. Una versión de contrato no se reescribe retroactivamente para acomodar implementaciones legacy.
8. `QUEUE-ARC-003..012` podrán completar extensiones del trabajo sin cambiar la identidad contractual base; si una decisión posterior resulta incompatible, deberá versionarse de forma explícita.

---

#### 17. Persistencia y tecnología física

Esta tarea no selecciona ni crea:

- tabla de trabajos;
- tabla de intentos;
- outbox o inbox;
- queue/topic físico;
- broker;
- extensión PostgreSQL adicional;
- RPC de submit, claim o complete;
- Edge Function de worker;
- cron;
- scheduler empresarial;
- DLQ física;
- API HTTP;
- esquema RLS;
- grants;
- Realtime;
- secretos;
- dashboards;
- alertas.

La materialización posterior deberá conservar el contrato aunque cambie la tecnología utilizada.

Toda modificación futura de Supabase perteneciente a VENTO deberá crearse, versionarse, documentarse y ejecutarse desde `vento-shell` durante una fase que lo autorice.

---

#### 18. Prohibiciones

Queda prohibido interpretar este contrato como autorización para:

1. crear tablas o colas;
2. activar o retirar jobs actuales;
3. cambiar cron expressions;
4. modificar GitHub Actions;
5. modificar Edge Functions;
6. modificar webhooks;
7. modificar colas locales de ANIMA o NEXO;
8. cambiar retry o backoff;
9. definir idempotency keys finales;
10. definir prioridades, calendars o expiraciones finales;
11. asignar workers, dispositivos o adaptadores finales;
12. definir cancelación final;
13. crear dead-letter o recuperación manual;
14. definir leases, fencing o concurrencia final;
15. cerrar el state machine de trabajos;
16. fijar SLIs, SLOs o umbrales de alerta;
17. conceder permisos para crear, cancelar o reintentar trabajos;
18. declarar un activo actual como arquitectura objetivo solo por estar desplegado;
19. declarar `exactly once` sin evidencia end-to-end;
20. iniciar o desarrollar `QUEUE-ARC-003`.

---

#### 19. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea especializa documentalmente el contrato `TSVC-SVC-001.CONTRACT@1.0.0` y materializa su aplicación al inventario `QAI-*` sin introducir una obligación técnicamente verificable que no esté ya protegida por el registro canónico vigente. La identidad estable de operación, contrato y versión, el recurso afectado, el estado durable, el resultado recuperable, la trazabilidad de causa y payload, la no duplicidad observable, la conciliación y la reconstrucción de cadenas asíncronas ya cuentan con cobertura transversal. Las tareas `QUEUE-ARC-003..012` completarán sus dimensiones propietarias sin que esta tarea cree un requisito paralelo o duplicado.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

---

#### 20. Cobertura de prueba existente preservada

Se preserva sin modificación, en especial:

- `TREQ-INTEGRATION-003`, que protege identidad estable de operación, huella del contenido lógico, recurso y versión, estado durable, resultado recuperable, idempotencia, retry, claim, observabilidad, conciliación, cola de fallos y recuperación;
- `TREQ-INTEGRATION-004`, que exige reconstruir causa, payload, actor o principal técnico, recurso, destinatario, intento, resultado, error y efecto final de cadenas trigger, función, job, webhook o notificación;
- la cobertura ya relacionada por `TSVC-CAT-004`, `TSVC-CAT-005` y `TSVC-CAT-006` para propiedad, contrato versionado, identidad técnica, seguridad, deduplicación y confiabilidad transversal.

Ninguna fila del registro canónico cambia de identidad, regla, estado, responsable, relación, evidencia ni secuencia por esta tarea.

---

#### 21. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. conserva `QUEUE-ARC-001` como tarea anterior aprobada;
2. conserva `QUEUE-ARC-003` como única tarea siguiente reservada;
3. utiliza `TSVC-SVC-001.CONTRACT@1.0.0` sin crear un contrato paralelo;
4. preserva `WORK_SUBMISSION`, `WORK_OUTCOME` y `WORK_ERROR` como unidades canónicas del servicio;
5. define la diferencia entre intención, trabajo, intento, claim, transporte, efecto y resultado;
6. define el sobre base del trabajo con identidad, propiedad, causalidad, esquema, payload, estado, receipt, resultado y error;
7. distingue descriptor inmutable y proyección operativa mutable;
8. define qué significa aceptación sin confundirla con éxito;
9. define resultado autoritativo sin inferirlo desde ACK, logs, UI o desaparición de una cola;
10. define error correlacionable sin mezclar error técnico, rechazo empresarial y efecto ambiguo;
11. conserva aplicación productora, aplicación propietaria, servicio, worker, scheduler, adaptador, dispositivo y consumidora como identidades separadas;
12. preserva separación entre autenticación técnica y autorización empresarial;
13. fija la composición con `TSVC-SVC-002`, `TSVC-SVC-003..007`, `TSVC-SVC-008` y `TSVC-SVC-009` sin absorber sus contratos;
14. asigna exactamente una decisión de relación contractual a cada `QAI-001..QAI-019`;
15. materializa **19 de 19** identidades, con **0** faltantes y **0** duplicados;
16. mantiene `QAI-010` como transporte técnico y no como registro empresarial de trabajo;
17. mantiene `QAI-013` como worker y no como trabajo independiente;
18. mantiene `QAI-016` como `NO_APLICA` al trabajo durable mientras continúe siendo refresco de lectura sin efecto empresarial;
19. reserva idempotencia a `QUEUE-ARC-003`;
20. reserva prioridad, programación y vencimiento a `QUEUE-ARC-004`;
21. reserva asignación a `QUEUE-ARC-005`;
22. reserva retry y backoff a `QUEUE-ARC-006`;
23. reserva cancelación a `QUEUE-ARC-007`;
24. reserva cola de fallos y recuperación a `QUEUE-ARC-008`;
25. reserva bloqueo y concurrencia a `QUEUE-ARC-009`;
26. reserva estados y eventos a `QUEUE-ARC-010`;
27. reserva métricas a `QUEUE-ARC-011`;
28. reserva autorización a `QUEUE-ARC-012`;
29. conserva los estados mínimos ya listados por el bloque sin definir aún sus transiciones;
30. declara cero cambios `TREQ-*` con justificación concreta;
31. crea cero objetos físicos;
32. modifica cero objetos físicos;
33. no ejecuta DDL, DML, migraciones, despliegues ni cambios de Supabase;
34. no modifica repositorios ni estado remoto;
35. no inicia ni desarrolla `QUEUE-ARC-003`.

---

#### 22. Resultado de la tarea

`QUEUE-ARC-002` deja establecido el contrato canónico base de trabajo asíncrono de Vento OS:

```text
TSVC-SVC-001.CONTRACT@1.0.0

WORK_SUBMISSION
    ↓
IDENTIDAD + PROPIEDAD + CAUSALIDAD + VERSIÓN + PAYLOAD VALIDADO
    ↓
ACEPTACIÓN CONSULTABLE
    ↓
EJECUCIÓN TÉCNICA DESACOPLADA
    ↓
WORK_OUTCOME O WORK_ERROR
```

La tecnología de cola queda desacoplada de la identidad del trabajo. Los 19 activos inventariados tienen una disposición contractual explícita y las responsabilidades `QUEUE-ARC-003..012` permanecen separadas y correctamente asignadas.

---

#### 23. Continuidad

ÚLTIMA TAREA APROBADA

`QUEUE-ARC-001 — Inventariar colas, cron, jobs y automatizaciones existentes`

TAREA ACTUAL APROBADA

`QUEUE-ARC-002 — Definir contrato canónico de trabajo asíncrono`

SIGUIENTE TAREA RESERVADA

`QUEUE-ARC-003 — Definir clave de idempotencia por trabajo`


### ✅ QUEUE-ARC-003 — Definir clave de idempotencia por trabajo

**Estado:** APROBADA
**Tarea anterior:** `QUEUE-ARC-002 — Definir contrato canónico de trabajo asíncrono`
**Tarea siguiente:** `QUEUE-ARC-004 — Definir prioridad, programación y vencimiento`
**Tipo de tarea:** documental; especialización canónica de identidad idempotente para trabajos asíncronos, ocurrencias programadas, eventos disparadores, colas locales y webhooks inventariados, definiendo ámbito de unicidad, origen de clave, huella lógica, reserva, recuperación del trabajo existente y conflicto semántico sin implementar persistencia, retry, concurrencia, estados, métricas ni autorización física
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/03_INFRAESTRUCTURA_CANONICA_DE_COLAS.md`
**Línea base documental:** `vento-shell@791b70dee38d48535fbf65b423a25feca68f6ed3`
**Contrato base consumido:** `TSVC-SVC-001.CONTRACT@1.0.0`
**Registro de confiabilidad consumido:** `TRANSVERSE-SERVICE-RELIABILITY-REGISTRY-001@1.0.0`
**Inventario consumido:** `QUEUE-CURRENT-ASSET-INVENTORY-001` — 19 identidades `QAI-*`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma cerrada cómo una intención de trabajo obtiene y conserva una identidad idempotente antes de su primera entrega al servicio asíncrono, de modo que una repetición técnica pueda recuperar el mismo trabajo y su resultado sin crear un segundo efecto, mientras el uso de la misma clave para una intención distinta produzca conflicto verificable.

La regla raíz es:

```text
MISMO ÁMBITO
+
MISMA CLAVE IDEMPOTENTE
+
MISMA HUELLA LÓGICA
=
MISMA INTENCIÓN REGISTRADA
→ MISMO operation_id
→ MISMO work_receipt_id
→ MISMO ESTADO / RESULTADO RECUPERABLE

MISMO ÁMBITO
+
MISMA CLAVE IDEMPOTENTE
+
HUELLA LÓGICA DISTINTA
=
IDEMPOTENCY_CONFLICT
→ CERO SEGUNDO TRABAJO
→ CERO SEGUNDO EFECTO AUTORIZADO POR ESA CLAVE
```

Una intención nueva usa una clave nueva. Una ejecución nueva de la misma intención no la usa.

---

#### 2. Resultado sustantivo

Se establece `WORK-IDEMPOTENCY-CONTRACT-001@1.0.0` como especialización del contrato de trabajo asíncrono aprobado en `QUEUE-ARC-002` y de la confiabilidad transversal aprobada en `TSVC-CAT-006`.

El resultado material fija:

1. la unidad exacta que se reserva idempotentemente;
2. la diferencia entre `idempotency_key`, `operation_id`, `attempt_id`, `request_id`, `correlation_id` y `causation_id`;
3. el ámbito de unicidad de una clave de trabajo;
4. el límite responsable de originar la clave;
5. los campos semánticos que deben participar en la huella lógica;
6. los campos técnicos que no deben convertir un reintento en otra intención;
7. la conducta ante repetición válida, conflicto y resultado desconocido;
8. la propagación de la identidad por scheduler, cola, worker, adaptador y transporte;
9. una decisión explícita para cada una de las 19 identidades `QAI-*` del inventario aprobado;
10. el handoff exacto hacia las responsabilidades reservadas de `QUEUE-ARC-004..012`.

Balance:

| Métrica                               | Resultado |
| ------------------------------------- | --------: |
| Identidades `QAI-*` esperadas         |    **19** |
| Identidades materializadas            |    **19** |
| `APLICA_IDEMPOTENCIA_DE_TRABAJO`      |    **16** |
| `PROPAGA_NO_GENERA`                   |     **2** |
| `NO_APLICA`                           |     **1** |
| Identificadores `QAI-*` duplicados    |     **0** |
| Identidades sin decisión              |     **0** |
| Requisitos `TREQ-*` creados           |     **0** |
| Objetos físicos creados o modificados |     **0** |

---

#### 3. Herencia contractual obligatoria

`WORK-IDEMPOTENCY-CONTRACT-001@1.0.0` no crea un contrato paralelo ni sustituye los contratos transversales ya aprobados.

Hereda obligatoriamente:

- de `TSVC-SVC-001.CONTRACT@1.0.0`, la solicitud `WORK_SUBMISSION`, el resultado `WORK_OUTCOME`, el error `WORK_ERROR`, la versión contractual y la autoridad de la aplicación propietaria;
- de `QUEUE-ARC-002`, la separación entre intención, trabajo, intento, claim, transporte, efecto y resultado;
- de `TRANSVERSE-SERVICE-RELIABILITY-REGISTRY-001@1.0.0`, el modelo `AT_LEAST_ONCE_WITH_IDEMPOTENT_EFFECTS`, la clave estable previa al primer envío, la huella lógica, la reserva atómica, el resultado recuperable y `IDEMPOTENCY_CONFLICT`;
- de `TSVC-CAT-005`, la separación entre actor, aplicación llamadora, principal de servicio, worker, dispositivo, proveedor y scheduler;
- de `QUEUE-ARC-001`, las 19 identidades materiales y su clasificación técnica actual.

No se declara garantía de ejecución exactamente una vez.

La no duplicidad observable se obtiene mediante identidad estable, reserva de intención, recuperación del trabajo existente, efecto idempotente y conciliación cuando el resultado sea ambiguo.

---

#### 4. Unidad idempotente canónica

La unidad reservada es una **intención lógica de trabajo**, no un intento, una petición HTTP, un mensaje de transporte, un tick de temporizador ni una ejecución concreta de worker.

La identidad de reserva queda definida conceptualmente por:

```text
WORK_IDEMPOTENCY_IDENTITY =
  service_id
  + producer_application
  + operation_type
  + business_reference
  + idempotency_key
```

Reglas:

1. `service_id` identifica el servicio transversal al que pertenece la intención.
2. `producer_application` identifica la aplicación que somete la intención.
3. `operation_type` fija la semántica de trabajo solicitada.
4. `business_reference` identifica el hecho, recurso, solicitud, ocurrencia, evento, documento o propósito empresarial al que pertenece el trabajo.
5. `idempotency_key` distingue una intención concreta dentro de ese ámbito.
6. La reserva se evalúa junto con `payload_fingerprint` para distinguir repetición válida de reutilización incompatible.
7. La misma clave puede existir en ámbitos distintos únicamente cuando la identidad completa anterior sea distinta y el contrato lo permita.
8. Una implementación no podrá reducir el ámbito a `idempotency_key` global si ello permite colisiones entre aplicaciones, operaciones o referencias empresariales.
9. Una implementación tampoco podrá ampliar silenciosamente el ámbito hasta volver imposible reconocer reintentos legítimos de la misma intención.

---

#### 5. Identificadores que no son equivalentes

| Campo                                            | Función canónica                                                           | ¿Se conserva en el reintento de la misma intención? | ¿Puede sustituir `idempotency_key`?                                    |
| ------------------------------------------------ | -------------------------------------------------------------------------- | --------------------------------------------------- | ---------------------------------------------------------------------- |
| `idempotency_key`                                | Identifica la misma intención dentro de su ámbito                          | **sí**                                              | no aplica                                                              |
| `operation_id`                                   | Identifica el trabajo canónico registrado después de reservar la intención | **sí**                                              | **no**                                                                 |
| `attempt_id`                                     | Identifica una ejecución concreta                                          | **no**; cada intento recibe otro                    | **no**                                                                 |
| `request_id`                                     | Identifica una llamada o petición técnica                                  | puede cambiar                                       | **no**                                                                 |
| `correlation_id`                                 | Agrupa operaciones relacionadas                                            | normalmente se conserva en la coordinación          | **no**                                                                 |
| `causation_id`                                   | Identifica la causa directa                                                | se conserva mientras la causa lógica sea la misma   | **no**                                                                 |
| `deduplication_key`                              | Detecta repetición de un elemento transportado o fuente                    | depende del elemento                                | **no**                                                                 |
| ID de mensaje HTTP, `pg_net`, broker o proveedor | Identidad de transporte                                                    | puede cambiar                                       | **no**, salvo que sea a la vez el ID estable de evento fuente aprobado |
| `lease_token` / `fencing_token`                  | Controla reclamación y concurrencia                                        | cambia según claim                                  | **no**                                                                 |

Una fila local, una solicitud de red, un tick de cron o un identificador de ejecución no adquieren semántica idempotente por llamarse `id`.

---

#### 6. Origen permitido de la clave

Se establecen las siguientes clases de procedencia:

| Clase                    | Uso                                                                                          | Regla                                                                                                                                                             |
| ------------------------ | -------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `PRODUCER_STABLE_KEY`    | intención iniciada por aplicación o API sin registro empresarial previo suficiente           | la productora crea una clave una sola vez antes del primer envío, la conserva durablemente durante la vida de la intención y la reutiliza en todos los reintentos |
| `BUSINESS_RECORD_ID`     | existe una solicitud o registro empresarial estable que representa exactamente una intención | el identificador empresarial puede ser origen de la clave dentro de un ámbito que impida colisiones semánticas                                                    |
| `SOURCE_EVENT_ID`        | trigger o webhook recibe un evento fuente con ID estable                                     | el ID del evento fuente se combina con proveedor/origen y operación; el replay conserva la misma identidad                                                        |
| `SCHEDULE_OCCURRENCE_ID` | trabajo generado por una ocurrencia lógica programada                                        | la clave deriva de la identidad estable del schedule y de `logical_fire_at_utc`, no de la hora real en que un worker despertó                                     |
| `AUTHORIZED_COPY_ID`     | impresión o emisión donde una nueva copia puede ser una intención legítimamente distinta     | la clave incorpora la identidad de copia autorizada y no trata una reimpresión deliberada como simple retry                                                       |
| `UPSTREAM_PROPAGATED`    | transporte, adaptador o worker recibe un trabajo ya registrado                               | conserva la clave y el `operation_id` upstream; no genera otra identidad de intención                                                                             |
| `NO_APLICA`              | mecanismo sin trabajo durable ni efecto empresarial asíncrono                                | no genera clave de trabajo                                                                                                                                        |

No se permite una clase implícita o desconocida.

---

#### 7. Reglas de generación y estabilidad

1. La clave se obtiene en el límite que conoce la intención, **antes del primer envío o registro del trabajo**.
2. El worker no genera una nueva clave para un trabajo ya aceptado.
3. Un adaptador no sustituye la clave porque cambie el protocolo o proveedor.
4. Un reintento conserva la misma clave aunque cambien `request_id`, conexión, worker, transporte o `attempt_id`.
5. Una intención nueva obtiene otra clave, aunque provenga de la misma pantalla, cron, usuario, documento o recurso.
6. Una clave aleatoria es válida únicamente si se crea una sola vez, se persiste antes de depender de ella y se reutiliza para la misma intención. Regenerar otro valor aleatorio en cada intento está prohibido.
7. Un timestamp, contador de proceso, PID, índice de array, posición en memoria o combinación `Date.now + random` creada de nuevo en cada envío no constituye una clave estable.
8. La clave no debe contener secretos, credenciales, tokens de sesión ni datos personales innecesarios.
9. La clave no prueba autorización; una solicitud repetida sigue sometida a las reglas de autoridad aplicables a consulta, cancelación o reintento según su contrato.
10. La clave no prueba éxito; únicamente permite resolver la intención registrada y recuperar su estado o resultado.
11. El retiro o expiración operativa de registros no autoriza reutilizar una clave histórica con otro significado.
12. La serialización física, longitud, índice y almacenamiento se definirán únicamente durante la implementación autorizada, manteniendo esta semántica.

---

#### 8. Huella lógica del trabajo

`payload_fingerprint` protege el significado de la intención asociada a una clave.

Toda implementación futura deberá calcular una huella criptográfica del contenido lógico normalizado y conservar un `fingerprint_version` verificable.

La huella incluirá, cuando apliquen y cuando alteren el efecto:

- `contract_id` y `contract_version`;
- `operation_type`;
- `business_owner_application`;
- `business_reference` o `source_reference` estable;
- `source_version`;
- finalidad o propósito de la operación;
- identificadores del recurso, documento, destinatario, proveedor o destino que formen parte de la intención;
- cantidades, unidades, parámetros, plantilla, versión, contenido o snapshot lógico que alteren el resultado;
- cualquier dato cuya modificación pudiera producir otro efecto empresarial o físico.

La huella excluirá los campos puramente técnicos o volátiles que no cambian la intención, entre ellos:

- `request_id`;
- `attempt_id`, `attempt_no` y `retry_count`;
- tiempos de recepción o ejecución técnica;
- latencia, trace/span IDs y metadata de observabilidad;
- token de autenticación o credencial técnica;
- `lease_token`, `fencing_token` y heartbeat;
- ID de transporte generado después de aceptar el trabajo;
- worker asignado dinámicamente;
- dispositivo o adaptador asignado dinámicamente, salvo que el contrato declare que elegir ese destino concreto forma parte de la intención empresarial;
- respuesta transitoria o código de conexión.

`correlation_id` y `causation_id` se conservan para trazabilidad, pero no deberán alterar por sí solos la huella cuando el contenido lógico y la intención sean idénticos.

---

#### 9. Reserva idempotente

La frontera lógica de aceptación es:

```text
RECIBIR WORK_SUBMISSION
        ↓
VALIDAR CONTRATO Y CAMPOS BASE
        ↓
RESOLVER business_reference E idempotency_scope
        ↓
OBTENER idempotency_key ESTABLE
        ↓
CALCULAR payload_fingerprint
        ↓
RESERVAR (scope + key) DE FORMA ATÓMICA O EQUIVALENTE
        ↓
┌──────────────────────────────────────────────────────────┐
│ NUEVA IDENTIDAD                                          │
│ → crear un solo operation_id y work_receipt_id           │
│                                                          │
│ MISMA IDENTIDAD + MISMA HUELLA                           │
│ → recuperar el mismo trabajo                             │
│ → no crear otro operation_id                             │
│                                                          │
│ MISMA IDENTIDAD + HUELLA DISTINTA                        │
│ → IDEMPOTENCY_CONFLICT                                   │
│ → no ejecutar el segundo contenido                       │
└──────────────────────────────────────────────────────────┘
```

Esta tarea define la semántica. El mecanismo físico de constraint, transacción, lock, upsert, advisory lock, tabla, función o servicio se implementará únicamente en la fase autorizada.

---

#### 10. Resultado de una repetición

| Situación                                               | Resultado canónico de idempotencia                                                                                  |
| ------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| clave nueva dentro del ámbito                           | registrar una intención y producir un solo `operation_id`                                                           |
| misma clave + misma huella, trabajo pendiente           | devolver el mismo `operation_id`, `work_receipt_id` y estado consultable                                            |
| misma clave + misma huella, trabajo terminado con éxito | devolver o referenciar el mismo resultado autoritativo                                                              |
| misma clave + misma huella, trabajo con error terminal  | devolver el mismo estado/error terminal; no reiniciar por crear otra operación                                      |
| misma clave + huella distinta                           | `IDEMPOTENCY_CONFLICT`; no sobrescribir contenido anterior                                                          |
| misma clave + resultado externo o físico desconocido    | conservar la misma intención y entrar a consulta/conciliación; no crear otra intención automáticamente              |
| clave distinta + misma huella                           | se considera otra intención salvo que una regla empresarial o de deduplicación independiente demuestre lo contrario |
| replay de un evento fuente estable                      | recuperar la operación asociada al mismo ID de evento y origen                                                      |

La igualdad de huella por sí sola no convierte todas las solicitudes iguales en una única intención. Dos acciones empresariales legítimamente distintas pueden tener el mismo contenido y claves distintas.

---

#### 11. Relación entre idempotencia y deduplicación

La tarea distingue:

```text
IDEMPOTENCIA
= repetir la misma intención sin repetir su efecto

DEDUPLICACIÓN
= detectar repetición del mismo elemento transportado o fuente
```

Reglas:

1. Un webhook puede deduplicarse por `provider_event_id` y además mantener una operación idempotente interna.
2. Un outbox puede deduplicar `event_id` sin usar ese valor como identidad de una operación empresarial diferente.
3. Un scheduler deduplica una ocurrencia lógica; sus trabajos hijos pueden tener claves propias.
4. Una cola local no convierte su ID de fila en clave idempotente salvo que ese ID haya sido creado y persistido como identidad de intención antes del primer envío.
5. Un transport request ID nunca reemplaza la clave de intención.
6. La deduplicación entre trabajos distintos o la exclusión de ejecuciones concurrentes se completa en `QUEUE-ARC-009`; esta tarea no decide locks ni fencing físicos.

---

#### 12. Relación con programación recurrente

Para trabajos originados por schedule se adopta la identidad ya definida por la confiabilidad transversal:

```text
SCHEDULE_DEFINITION_IDENTITY
= business_owner_application
  + schedule_id
  + schedule_version

SCHEDULE_OCCURRENCE_IDENTITY
= business_owner_application
  + schedule_id
  + logical_fire_at_utc
  + contract_version
```

La ocurrencia lógica obtiene un `schedule_occurrence_id` estable y este valor origina o alimenta la clave idempotente del trabajo que la ocurrencia crea.

Reglas:

1. `logical_fire_at_utc` representa la ocurrencia prevista, no la hora real del retry.
2. Un misfire, retraso o reanudación de la misma ocurrencia conserva la misma identidad.
3. Una ejecución manual deliberadamente adicional utiliza otra clave y queda vinculada con la ocurrencia original cuando corresponda.
4. Modificar prioridad, ventana, deadline, misfire o vencimiento pertenece a `QUEUE-ARC-004`.
5. La coexistencia de dos schedules distintos que produzcan un efecto semejante no se colapsa automáticamente en esta tarea; la detección de duplicado semántico y la concurrencia pertenecen a `QUEUE-ARC-009`.

---

#### 13. Relación con colas offline y dispositivos

Una cola offline deberá conservar la clave de la intención independientemente de:

- reinicio de la aplicación;
- pérdida y recuperación de conectividad;
- reanudación del sistema operativo;
- cambio de `attempt_id`;
- cambio de request de red;
- reejecución del worker local.

El dispositivo puede custodiar temporalmente la intención, pero no adquiere propiedad empresarial del hecho.

Un `queued_attempt_id`, ID de fila local o tick del worker es técnico y no puede sustituir la clave idempotente salvo que sea exactamente la identidad estable creada para la intención y se mantenga con esa semántica.

La asignación a dispositivo o worker queda reservada para `QUEUE-ARC-005`; los reintentos y backoff para `QUEUE-ARC-006`.

---

#### 14. Relación con webhooks

Para webhooks entrantes:

```text
INBOUND_WEBHOOK_IDEMPOTENCY_SCOPE
= service_id
  + provider_identity
  + provider_event_id
  + operation_type
```

Reglas:

1. El ID de evento estable del proveedor identifica el replay del mismo evento cuando el proveedor lo suministra.
2. El secreto, firma o checksum autentican/verifican el mensaje, pero no son la clave idempotente.
3. El replay válido del mismo evento devuelve o reconstruye el mismo acuse y operación interna.
4. Un mismo `provider_event_id` con contenido incompatible produce conflicto y evidencia; no se sobrescribe silenciosamente.
5. Si el proveedor no ofrece una identidad de evento suficiente, el adaptador deberá materializar una identidad estable a partir del contrato específico antes de confiar en el flujo; no se inventa en esta tarea una fórmula universal que pueda confundir eventos legítimos.
6. Un timeout después de un efecto externo potencialmente aplicado conserva `RESULT_UNKNOWN` y exige conciliación; una clave nueva no se usa para ocultar la incertidumbre.

---

#### 15. Relación con impresión y efectos físicos

La intención de impresión utiliza como ámbito lógico, cuando aplique:

```text
business_owner_application
+ document_or_command_reference
+ source_version
+ print_purpose
+ authorized_copy_identity
+ idempotency_key
```

Reglas:

1. Repetir técnicamente la misma impresión pendiente conserva la misma clave.
2. Una reimpresión autorizada como nueva copia es una intención distinta y usa otra identidad de copia y otra clave.
3. Un job eliminado de `localStorage` no prueba que el efecto físico ocurrió.
4. Un ID de BrowserPrint o periférico no es la identidad empresarial del trabajo.
5. Un resultado físico ambiguo no se repite ciegamente solo por cambiar la clave.
6. La selección o asignación física del dispositivo pertenece a `QUEUE-ARC-005` y al bloque `PRINT-ARC-*`.

---

#### 16. Matriz materializada de las 19 identidades `QAI-*`

| ID        | Clasificación en esta tarea      | Origen canónico de la clave                                                                      | Referencia / ámbito lógico                                                     | Conducta idempotente exigida                                                                                                                     | Situación documental actual                                                                                        |
| --------- | -------------------------------- | ------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------ |
| `QAI-001` | `APLICA_IDEMPOTENCIA_DE_TRABAJO` | `SCHEDULE_OCCURRENCE_ID`                                                                         | schedule de cierre diario + ocurrencia lógica                                  | misma ocurrencia conserva una operación; retry no crea otro cierre                                                                               | objetivo definido; la coexistencia con `QAI-004` no se resuelve por cambiar claves                                 |
| `QAI-002` | `APLICA_IDEMPOTENCIA_DE_TRABAJO` | `SCHEDULE_OCCURRENCE_ID`                                                                         | schedule del runtime de turnos + ocurrencia lógica                             | cron, SQL, `pg_net` y Edge Function propagan la misma identidad raíz; IDs de transporte no la sustituyen                                         | objetivo definido para cadena multi-etapa                                                                          |
| `QAI-003` | `APLICA_IDEMPOTENCIA_DE_TRABAJO` | `SCHEDULE_OCCURRENCE_ID`                                                                         | schedule de autocierre stale + ocurrencia lógica                               | la misma ocurrencia no crea un segundo trabajo correctivo                                                                                        | objetivo definido                                                                                                  |
| `QAI-004` | `APLICA_IDEMPOTENCIA_DE_TRABAJO` | `SCHEDULE_OCCURRENCE_ID`                                                                         | schedule `auto-close-attendance` + ocurrencia lógica                           | retry de su ocurrencia conserva clave; no se fusiona silenciosamente con `QAI-001` por compartir función                                         | objetivo definido; reconciliación entre schedules queda para `QUEUE-ARC-009` y transición legacy                   |
| `QAI-005` | `APLICA_IDEMPOTENCIA_DE_TRABAJO` | `SCHEDULE_OCCURRENCE_ID`                                                                         | `document-alerts-daily` + ocurrencia lógica                                    | el schedule conserva identidad; `pg_net` propaga; secretos no forman parte de la clave                                                           | objetivo definido; seguridad de credenciales sigue en su tarea propietaria                                         |
| `QAI-006` | `APLICA_IDEMPOTENCIA_DE_TRABAJO` | `SCHEDULE_OCCURRENCE_ID`                                                                         | limpieza de cotizaciones + ocurrencia lógica                                   | una reejecución técnica de la misma ocurrencia conserva trabajo; una ocurrencia futura es otra intención                                         | objetivo definido                                                                                                  |
| `QAI-007` | `APLICA_IDEMPOTENCIA_DE_TRABAJO` | `SCHEDULE_OCCURRENCE_ID`                                                                         | reconciliación de expiraciones + ocurrencia lógica                             | misma ocurrencia no crea operación paralela por retry; los efectos por checkout conservan además identidad empresarial propia                    | objetivo definido                                                                                                  |
| `QAI-008` | `APLICA_IDEMPOTENCIA_DE_TRABAJO` | `SCHEDULE_OCCURRENCE_ID`                                                                         | purga de borradores + ocurrencia lógica                                        | si se despliega en el futuro, cada ocurrencia usa identidad estable; ausencia remota no autoriza asumir ejecución                                | contrato definido; activo sigue sin acreditación de despliegue según inventario aprobado                           |
| `QAI-009` | `APLICA_IDEMPOTENCIA_DE_TRABAJO` | `SCHEDULE_OCCURRENCE_ID` para el batch + `BUSINESS_RECORD_ID` para cada solicitud de eliminación | ocurrencia del workflow y solicitud individual de eliminación de cuenta        | el batch no debe ser la única clave de los efectos hijos; cada solicitud conserva su identidad estable                                           | objetivo definido para frontera entre workflow y worker                                                            |
| `QAI-010` | `PROPAGA_NO_GENERA`              | `UPSTREAM_PROPAGATED`                                                                            | `operation_id` + identidad idempotente del trabajo que originó la llamada HTTP | `net.http_request_queue` transporta la identidad upstream; su request ID no crea otra intención                                                  | cola técnica, no trabajo empresarial autónomo                                                                      |
| `QAI-011` | `APLICA_IDEMPOTENCIA_DE_TRABAJO` | `PRODUCER_STABLE_KEY` o registro empresarial estable existente                                   | operación de asistencia + referencia laboral/turno aplicable                   | la misma operación offline conserva clave tras reinicio, conectividad y retries                                                                  | existe patrón local con `idempotency_key`; esta tarea fija su semántica canónica sin afirmar cumplimiento integral |
| `QAI-012` | `APLICA_IDEMPOTENCIA_DE_TRABAJO` | `PRODUCER_STABLE_KEY` o registro empresarial estable existente                                   | operación de descanso + referencia laboral/turno aplicable                     | la misma intención de descanso conserva clave; la cola separada no autoriza duplicar el hecho                                                    | existe persistencia local; cumplimiento integral queda sujeto a implementación y pruebas                           |
| `QAI-013` | `PROPAGA_NO_GENERA`              | `UPSTREAM_PROPAGATED`                                                                            | elementos pendientes `QAI-011` y `QAI-012`                                     | cada tick procesa la clave ya almacenada; el intervalo de 15 s no crea una intención nueva                                                       | worker técnico efímero                                                                                             |
| `QAI-014` | `APLICA_IDEMPOTENCIA_DE_TRABAJO` | `SOURCE_EVENT_ID` o `PRODUCER_STABLE_KEY` materializado al aceptar el evento de salida           | trabajador + relación laboral/turno + evento lógico de salida                  | callbacks repetidos de ubicación no deben crear múltiples cierres; la coordenada o timestamp crudo no bastan por sí solos como clave empresarial | objetivo definido; servidor conserva decisión final                                                                |
| `QAI-015` | `APLICA_IDEMPOTENCIA_DE_TRABAJO` | `AUTHORIZED_COPY_ID`                                                                             | documento/comanda + versión + propósito + identidad de copia                   | retry conserva trabajo; reimpresión deliberada usa otra copia autorizada y otra clave                                                            | cola local actual no acredita resultado físico durable                                                             |
| `QAI-016` | `NO_APLICA`                      | `NO_APLICA`                                                                                      | refresco de lectura de tablero                                                 | no genera trabajo durable ni efecto empresarial en el alcance actual                                                                             | permanece excluido de materialización como job                                                                     |
| `QAI-017` | `APLICA_IDEMPOTENCIA_DE_TRABAJO` | `SOURCE_EVENT_ID`                                                                                | mensaje fuente estable + propósito de notificación                             | un mismo mensaje insertado no genera dos trabajos raíz por replay del trigger; `pg_net` conserva identidad upstream                              | objetivo definido; entrega de notificación se gobierna además por `NOTIFY-ARC-*`                                   |
| `QAI-018` | `APLICA_IDEMPOTENCIA_DE_TRABAJO` | `SOURCE_EVENT_ID` del proveedor                                                                  | proveedor Wompi + ID de evento + operación                                     | replay recupera la misma operación y no aplica segundo efecto; incertidumbre externa entra a conciliación                                        | el inventario aprobado ya observó protección de evento procesado; esta tarea no declara certificación E2E          |
| `QAI-019` | `APLICA_IDEMPOTENCIA_DE_TRABAJO` | `SOURCE_EVENT_ID` del proveedor                                                                  | RevenueCat + ID de evento + operación                                          | replay debe recuperar la misma operación; mismo ID con contenido incompatible produce conflicto                                                  | brecha explícita del inventario: protección equivalente no estaba materializada en el código observado             |

Resultado de reconciliación:

```text
19 IDENTIDADES ESPERADAS
19 IDENTIDADES MATERIALIZADAS
16 APLICAN CLAVE DE TRABAJO
2 PROPAGAN Y NO GENERAN
1 NO APLICA
0 FALTANTES
0 DUPLICADOS
```

---

#### 17. Reglas específicas para schedules duplicados o solapados

`QAI-001` y `QAI-004` invocan la misma función base desde schedules distintos.

Esta tarea fija únicamente que:

1. cada schedule tiene identidad de definición propia;
2. cada ocurrencia lógica tiene identidad propia;
3. un retry de una ocurrencia no crea otra intención;
4. usar claves distintas para dos schedules distintos **no demuestra** que ambos efectos empresariales sean legítimamente distintos;
5. la relación causal, referencia empresarial y función/propósito deberán permanecer visibles para que `QUEUE-ARC-009` pueda decidir bloqueo de duplicados y concurrencia;
6. esta tarea no retira, fusiona ni desactiva ninguno de los schedules.

La clave idempotente protege repetición de una intención; no corrige por sí sola dos autoridades distintas que ordenen el mismo efecto.

---

#### 18. Reglas para trabajos contenedores y trabajos hijos

Cuando una automatización procese múltiples unidades empresariales, se separan:

```text
IDENTIDAD DE LA EJECUCIÓN CONTENEDORA
≠
IDENTIDAD IDEMPOTENTE DE CADA EFECTO HIJO
```

Ejemplos del inventario:

- `QAI-009`: la ocurrencia del workflow de eliminación de cuentas tiene clave de schedule; cada solicitud de eliminación procesada conserva su propia identidad empresarial;
- `QAI-007`: la ocurrencia de reconciliación tiene clave de schedule; cada checkout afectado conserva sus identificadores autoritativos y no debe duplicarse por reejecutar el batch;
- `QAI-006`: la limpieza tiene identidad de ocurrencia, pero no puede convertir todos los registros limpiados en una única entidad empresarial.

Un batch reintentado no autoriza repetir efectos hijos ya confirmados únicamente porque el batch tenga otro `attempt_id`.

---

#### 19. Recuperación del trabajo existente

Una repetición válida deberá poder recuperar como mínimo:

```text
operation_id
work_receipt_id
idempotency_scope
idempotency_key
payload_fingerprint
fingerprint_version
contract_id
contract_version
operation_type
business_reference
work_status
result_ref
error_code
```

Reglas:

1. si el trabajo sigue activo, se devuelve la misma identidad y estado;
2. si terminó, se recupera el resultado o error autoritativo;
3. si el efecto permanece incierto, se conserva el mismo trabajo en condición conciliable;
4. nunca se crea otra operación únicamente porque el cliente perdió la respuesta;
5. el detalle de los estados canónicos se cierra en `QUEUE-ARC-010`;
6. la política de retry que decide cuándo ejecutar otro intento se cierra en `QUEUE-ARC-006`.

---

#### 20. Conflicto idempotente

`IDEMPOTENCY_CONFLICT` ocurre cuando la misma identidad de reserva pretende representar contenido materialmente distinto.

El conflicto incluye, entre otros:

- cambio de `contract_version` incompatible bajo la misma intención;
- cambio de `operation_type` o referencia empresarial;
- cambio de recurso, destinatario, proveedor, cantidad, plantilla, versión, propósito o payload material;
- cambio de identidad de copia autorizada;
- reuso de una clave de evento para otro evento;
- reuso de una clave de schedule para otra ocurrencia lógica;
- reuso de una clave persistida localmente para una acción empresarial nueva.

Reglas:

1. el segundo contenido no reemplaza al primero;
2. el conflicto no se corrige actualizando silenciosamente la huella almacenada;
3. el conflicto no se convierte en retry automático;
4. una intención empresarial realmente nueva exige una clave nueva y su relación causal correspondiente;
5. la respuesta exacta de error y sus estados se materializan en `QUEUE-ARC-010` sin cambiar esta semántica.

---

#### 21. Handoff exacto a `QUEUE-ARC-004..012`

| Tarea                                                                             | Responsabilidad reservada recibida desde esta tarea                                                                                                                                    |
| --------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `QUEUE-ARC-004 — Definir prioridad, programación y vencimiento`                   | usar la identidad de intención ya estable para decidir prioridad, `scheduled_at`, ocurrencia, deadline y vencimiento sin regenerar la clave                                            |
| `QUEUE-ARC-005 — Definir asignación a trabajador, dispositivo o adaptador`        | asignar ejecutor o destino sin convertir la asignación dinámica en otra intención salvo que el contrato declare ese destino como parte material de la solicitud                        |
| `QUEUE-ARC-006 — Definir reintentos, backoff y límite máximo`                     | crear nuevos `attempt_id` conservando `idempotency_key`, huella, `operation_id`, contrato y referencia empresarial                                                                     |
| `QUEUE-ARC-007 — Definir cancelación antes y durante ejecución`                   | cancelar el mismo trabajo identificado sin reutilizar su clave para una operación de cancelación semánticamente distinta cuando esta requiera identidad propia                         |
| `QUEUE-ARC-008 — Definir cola de fallos y recuperación manual`                    | aislar y recuperar el mismo trabajo sin borrar ni sustituir su identidad idempotente                                                                                                   |
| `QUEUE-ARC-009 — Definir bloqueo de duplicados y concurrencia`                    | impedir ganadores simultáneos, trabajos semánticamente solapados o cierres concurrentes mediante claim, lock, lease, fencing o mecanismo equivalente sin cambiar la clave de intención |
| `QUEUE-ARC-010 — Definir estados y eventos canónicos`                             | representar aceptación, conflicto, procesamiento, resultado, incertidumbre y terminalidad alrededor del mismo `operation_id`                                                           |
| `QUEUE-ARC-011 — Definir métricas de espera, ejecución y error`                   | medir duplicados recuperados, conflictos, intentos y tiempos sin usar la telemetría como identidad de intención                                                                        |
| `QUEUE-ARC-012 — Definir autorización para crear, cancelar y reintentar trabajos` | validar quién puede crear o actuar sobre la intención sin tratar la posesión de una clave como permiso empresarial                                                                     |

Ninguna de esas responsabilidades se desarrolla en esta tarea.

---

#### 22. Prohibiciones

Esta tarea no autoriza:

1. crear tablas o columnas de idempotencia;
2. crear índices únicos o constraints;
3. modificar RPC, funciones SQL, triggers o Edge Functions;
4. cambiar schedules;
5. alterar `pg_net`;
6. cambiar SecureStore, localStorage, BrowserPrint o TaskManager;
7. modificar webhooks de Wompi o RevenueCat;
8. crear locks, leases o fencing físicos;
9. definir o modificar perfiles de retry;
10. definir prioridades o deadlines;
11. definir estados finales de la cola;
12. desplegar una cola transversal;
13. afirmar que los 16 activos aplicables cumplen ya el contrato objetivo;
14. convertir un ID técnico existente en clave idempotente sin demostrar su estabilidad y ámbito;
15. tratar `idempotency_key` como autenticación o autorización;
16. tratar una reserva o receipt como éxito empresarial;
17. iniciar `QUEUE-ARC-004`.

---

#### 23. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea especializa para el trabajo canónico una obligación de idempotencia ya registrada y vigente: clave estable antes del primer envío, huella del contenido lógico, recuperación del mismo resultado para la misma identidad, conflicto ante reutilización incompatible y protección frente a efectos duplicados. No introduce una obligación verificable nueva ni modifica la semántica de un requisito existente; materializa su aplicación a las 19 identidades del inventario de colas y conserva las tareas responsables ya asignadas.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

---

#### 24. Cobertura de prueba existente preservada

Se preserva sin modificación, en especial:

- `TREQ-INTEGRATION-003`, que exige clave estable, huella lógica, estado durable, resultado recuperable, conflicto ante contenido distinto, idempotencia, claim, conciliación y recuperación para operaciones asíncronas;
- `TREQ-INTEGRATION-004`, que exige reconstruir causa, payload, principal técnico, recurso, intento, resultado, error y efecto final en cadenas trigger, job y webhook;
- la cobertura específica de ANIMA, NEXO, PASS, Supabase e integraciones ya relacionada con esas obligaciones.

Ninguna fila del registro canónico cambia de identificador, dominio, regla protegida, estado, responsable, evidencia, relación o secuencia por esta tarea.

---

#### 25. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. conserva `QUEUE-ARC-002` como tarea anterior aprobada;
2. conserva `QUEUE-ARC-004` como única siguiente tarea reservada;
3. especializa `TSVC-SVC-001.CONTRACT@1.0.0` sin crear un contrato paralelo;
4. conserva el modelo `AT_LEAST_ONCE_WITH_IDEMPOTENT_EFFECTS` sin afirmar exactamente-una-vez;
5. define la intención lógica como unidad idempotente;
6. define el ámbito `service_id + producer_application + operation_type + business_reference + idempotency_key`;
7. separa `idempotency_key`, `operation_id`, `attempt_id`, `request_id`, `correlation_id` y `causation_id`;
8. obliga a crear u obtener la clave antes del primer envío;
9. obliga a conservar la misma clave en todos los retries y handoffs de la misma intención;
10. define una nueva clave para una intención empresarial nueva;
11. define la función de `payload_fingerprint` y `fingerprint_version`;
12. separa campos lógicos de campos técnicos volátiles en la huella;
13. define recuperación del mismo trabajo para misma clave y misma huella;
14. define `IDEMPOTENCY_CONFLICT` para misma clave y huella incompatible;
15. prohíbe crear otro trabajo por pérdida de respuesta o resultado desconocido;
16. distingue idempotencia de deduplicación;
17. define identidad idempotente de ocurrencias programadas;
18. define persistencia de clave para colas offline;
19. define propagación de identidad por transportes y workers;
20. define replay idempotente de webhooks mediante identidad estable de evento fuente;
21. define identidad de copia autorizada para impresión;
22. materializa las 19 identidades `QAI-*` exactamente una vez;
23. obtiene 16 `APLICA_IDEMPOTENCIA_DE_TRABAJO`, 2 `PROPAGA_NO_GENERA` y 1 `NO_APLICA`;
24. deja 0 identidades faltantes y 0 duplicadas;
25. no fusiona `QAI-001` y `QAI-004` por inferencia;
26. separa identidad del batch e identidad de sus efectos hijos;
27. asigna de forma exacta los handoffs `QUEUE-ARC-004..012` sin intercambiar responsabilidades;
28. crea cero requisitos de prueba;
29. modifica cero requisitos de prueba;
30. crea cero objetos físicos;
31. modifica cero repositorios consumidores, Supabase, cron, colas, workers o webhooks;
32. no inicia ni desarrolla `QUEUE-ARC-004`.

---

#### 26. Resultado de la tarea

`QUEUE-ARC-003` deja establecido que todo trabajo aplicable del inventario canónico debe poder reconocer inequívocamente la misma intención antes de ejecutar efectos:

```text
INTENCIÓN
→ ÁMBITO IDEMPOTENTE
→ CLAVE ESTABLE
→ HUELLA LÓGICA
→ RESERVA
→ operation_id ÚNICO PARA ESA INTENCIÓN
→ RECUPERACIÓN DEL MISMO TRABAJO EN REPETICIONES

MISMA CLAVE + MISMA HUELLA
→ MISMO TRABAJO

MISMA CLAVE + HUELLA DISTINTA
→ IDEMPOTENCY_CONFLICT

NUEVA INTENCIÓN
→ NUEVA CLAVE
```

El contrato queda completamente definido a nivel documental y listo para que las tareas siguientes añadan programación, asignación, retry, cancelación, recuperación, concurrencia, estados, métricas y autorización sin redefinir la identidad de la intención.

---

#### 27. Continuidad

ÚLTIMA TAREA APROBADA

`QUEUE-ARC-002 — Definir contrato canónico de trabajo asíncrono`

TAREA ACTUAL APROBADA

`QUEUE-ARC-003 — Definir clave de idempotencia por trabajo`

SIGUIENTE TAREA RESERVADA

`QUEUE-ARC-004 — Definir prioridad, programación y vencimiento`


### ✅ QUEUE-ARC-004 — Definir prioridad, programación y vencimiento

**Estado:** APROBADA
**Tarea anterior:** `QUEUE-ARC-003 — Definir clave de idempotencia por trabajo`
**Tarea siguiente:** `QUEUE-ARC-005 — Definir asignación a trabajador, dispositivo o adaptador`
**Tipo de tarea:** documental; especialización canónica de prioridad, elegibilidad temporal, programación, ocurrencias recurrentes, deadline, vencimiento y tratamiento de misfire para el trabajo asíncrono inventariado, con decisión explícita para las 19 identidades `QAI-*`, sin modificar schedules, colas, workers, webhooks, código, datos ni estado desplegado
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/03_INFRAESTRUCTURA_CANONICA_DE_COLAS.md`
**Línea base documental:** `vento-shell@abfe4611d79f0a96659814581af585b7ed0cb9cf`
**Contrato base de trabajo:** `TSVC-SVC-001.CONTRACT@1.0.0`
**Contrato base de programación:** `TSVC-SVC-009.CONTRACT@1.0.0`
**Registro de confiabilidad consumido:** `TRANSVERSE-SERVICE-RELIABILITY-REGISTRY-001@1.0.0`
**Contrato de idempotencia consumido:** `WORK-IDEMPOTENCY-CONTRACT-001@1.0.0`
**Inventario consumido:** `QUEUE-CURRENT-ASSET-INVENTORY-001` — 19 identidades `QAI-*`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma cerrada cuándo un trabajo aplicable puede empezar a competir por ejecución, con qué prioridad relativa, cuándo representa una ocurrencia programada, hasta qué instante puede iniciar una ejecución ordinaria y qué debe ocurrir cuando una ejecución prevista llega tarde.

La regla raíz es:

```text
IDENTIDAD DE INTENCIÓN ESTABLE
        +
PROGRAMACIÓN EXPLÍCITA
        +
PRIORIDAD ACOTADA
        +
DEADLINE FINITO
        +
POLÍTICA DE MISFIRE CUANDO EXISTA SCHEDULE
        ↓
TRABAJO TEMPORALMENTE ELEGIBLE Y ORDENABLE
```

La prioridad no concede autorización, no cambia la intención, no crea otra clave idempotente y no puede romper causalidad, dependencia, versión, exclusión concurrente ni deadline.

---

#### 2. Resultado sustantivo

Se establece `WORK-SCHEDULING-POLICY-CONTRACT-001@1.0.0` como especialización temporal de los contratos aprobados de trabajo asíncrono y programación recurrente.

El resultado material fija:

1. cuatro clases cerradas de prioridad de trabajo;
2. los campos temporales mínimos para trabajo inmediato, diferido y recurrente;
3. la diferencia entre definición de schedule, ocurrencia lógica, ejecución real, reintento y ejecución manual;
4. una regla única de elegibilidad y ordenación que preserva causalidad y deadline;
5. un deadline finito para toda intención de trabajo aplicable antes de su ejecución ordinaria;
6. la prohibición de ampliar silenciosamente el deadline por espera, reconexión, retry o cambio de worker;
7. dos políticas canónicas de misfire suficientes para las ocurrencias recurrentes inventariadas;
8. la relación entre calendario empresarial, zona horaria declarada y `logical_fire_at_utc`;
9. la semántica de vencimiento sin cerrar todavía estados ni eventos, responsabilidad de `QUEUE-ARC-010`;
10. una decisión explícita para cada una de las 19 identidades `QAI-*`.

Balance:

| Métrica                                        | Resultado |
| ---------------------------------------------- | --------: |
| Identidades `QAI-*` esperadas                  |    **19** |
| Identidades materializadas                     |    **19** |
| `APLICA_POLITICA_TEMPORAL_DE_TRABAJO`          |    **16** |
| `PROPAGA_NO_DECIDE_POLITICA_TEMPORAL`          |     **2** |
| `NO_APLICA`                                    |     **1** |
| Identificadores `QAI-*` duplicados             |     **0** |
| Identidades sin decisión                       |     **0** |
| Clases canónicas de prioridad                  |     **4** |
| Políticas de misfire para schedules aplicables |     **2** |
| Requisitos de prueba creados o modificados     |     **0** |
| Objetos físicos creados o modificados          |     **0** |

---

#### 3. Herencia contractual obligatoria

`WORK-SCHEDULING-POLICY-CONTRACT-001@1.0.0` no crea una fuente de verdad paralela ni sustituye contratos aprobados.

Hereda obligatoriamente:

- de `TSVC-SVC-001.CONTRACT@1.0.0`, `WORK_SUBMISSION`, `WORK_OUTCOME`, `WORK_ERROR`, `operation_id`, propiedad empresarial y versión contractual;
- de `TSVC-SVC-009.CONTRACT@1.0.0`, la identidad separada de definición y ocurrencia programada, junto con calendario, zona horaria, vigencia y misfire;
- de `TRANSVERSE-SERVICE-RELIABILITY-REGISTRY-001@1.0.0`, deadline, límites de edad, prioridad subordinada al orden causal, `logical_fire_at_utc`, tratamiento de resultado ambiguo y regla de que el deadline prevalece sobre el presupuesto de intentos;
- de `WORK-IDEMPOTENCY-CONTRACT-001@1.0.0`, `idempotency_key`, `payload_fingerprint`, `operation_id` y `schedule_occurrence_id` estables durante la misma intención;
- de `QUEUE-CURRENT-ASSET-INVENTORY-001`, las 19 identidades materiales y su clasificación actual.

Esta tarea no redefine retry, backoff, claim, lease, fencing, estados, métricas ni autorización.

---

#### 4. Vocabulario temporal canónico

| Campo / término          | Definición canónica                                                                                                                                                |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `priority_class`         | clase relativa de despacho entre trabajos temporalmente elegibles e independientes; no representa severidad empresarial ni autorización                            |
| `created_at`             | instante de creación de la intención registrada; no se reescribe por espera ni retry                                                                               |
| `scheduled_at`           | primer instante UTC en que una intención ordinaria puede ser considerada para ejecución; para trabajo inmediato coincide con su disponibilidad inicial             |
| `deadline_at`            | instante UTC exclusivo a partir del cual no puede iniciarse un nuevo intento ordinario                                                                             |
| `schedule_id`            | identidad estable de una definición programada; no es el ID del intento ni el job físico                                                                           |
| `schedule_version`       | versión de una definición concreta de calendario, zona horaria, vigencia, misfire y política temporal                                                              |
| `logical_fire_at_utc`    | instante UTC de la ocurrencia prevista; no cambia porque el worker se ejecute tarde                                                                                |
| `schedule_occurrence_id` | identidad estable de la ocurrencia lógica definida por el contrato de idempotencia                                                                                 |
| `schedule_timezone`      | zona horaria IANA declarada por la definición cuando el calendario se expresa en tiempo civil; nunca se infiere de un nombre, comentario o cron expression         |
| `effective_from_at`      | inicio de vigencia de una definición de schedule                                                                                                                   |
| `effective_until_at`     | fin de vigencia de una definición de schedule cuando exista                                                                                                        |
| `misfire`                | condición en la que una ocurrencia no inició cuando debía y sigue pendiente de decisión temporal                                                                   |
| `manual_occurrence`      | ejecución deliberadamente disparada fuera del calendario ordinario; es nueva ocurrencia salvo que sea recuperación explícita de una ocurrencia previa identificada |
| `temporal_expiry`        | pérdida de elegibilidad para iniciar ejecución ordinaria por alcanzar `deadline_at`; el estado y evento exactos pertenecen a `QUEUE-ARC-010`                       |

Todos los instantes persistidos o intercambiados por el contrato temporal se expresan en UTC. Una regla empresarial basada en tiempo civil conserva además la zona horaria IANA que permitió calcular el instante UTC.

---

#### 5. Clases canónicas de prioridad

El vocabulario cerrado inicial es:

| Clase            | Orden | Uso objetivo                                                                                                        |
| ---------------- | ----: | ------------------------------------------------------------------------------------------------------------------- |
| `P1_TIME_BOUND`  |     1 | trabajo cuyo valor o corrección depende directamente de una ventana operacional, estado vigente o vencimiento       |
| `P2_STANDARD`    |     2 | trabajo empresarial ordinario que debe progresar de forma durable sin ser mantenimiento ni procesamiento de fondo   |
| `P3_BACKGROUND`  |     3 | trabajo derivado o informativo que puede esperar mientras preserve su deadline y no bloquee un efecto prioritario   |
| `P4_MAINTENANCE` |     4 | limpieza, purga, mantenimiento o reconciliación periódica cuya ejecución no representa interacción directa de actor |

Reglas:

1. un número menor representa mayor prioridad relativa;
2. la prioridad solo ordena trabajos que ya son elegibles y compatibles entre sí;
3. una prioridad mayor no puede ejecutar un trabajo antes de `scheduled_at`;
4. una prioridad mayor no puede ejecutar un trabajo después de `deadline_at`;
5. una prioridad mayor no puede saltar una dependencia, versión, causalidad u orden obligatorio;
6. una prioridad mayor no concede permiso ni sustituye la autorización de `QUEUE-ARC-012`;
7. cambiar la prioridad de una intención existente no cambia `idempotency_key`, `operation_id`, huella, payload ni propietario;
8. cualquier cambio de prioridad después de la aceptación deberá ser reconstruible; el evento exacto pertenece a `QUEUE-ARC-010` y la autoridad para realizarlo a `QUEUE-ARC-012`;
9. no existe promoción automática por antigüedad en esta versión del contrato; evitar starvation deberá resolverse respetando deadline y la política de selección, no reescribiendo silenciosamente la clase.

---

#### 6. Modos de programación

Toda identidad aplicable se clasifica en uno de estos modos:

| Modo              | Regla                                                                                                                                       |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `IMMEDIATE`       | `scheduled_at` coincide con el instante inicial de disponibilidad de la intención                                                           |
| `DEFERRED`        | `scheduled_at` es un instante futuro explícito y anterior a `deadline_at`                                                                   |
| `RECURRENT`       | una definición versionada produce ocurrencias con `logical_fire_at_utc`, `schedule_occurrence_id`, `scheduled_at` y `deadline_at`           |
| `EVENT_DRIVEN`    | un evento fuente aceptado origina trabajo; `scheduled_at` se deriva de la aceptación salvo que el contrato propietario declare diferimiento |
| `OFFLINE_DURABLE` | la intención se crea antes o durante pérdida de conectividad y conserva `scheduled_at` y `deadline_at` originales a través de reconexiones  |
| `OS_BACKGROUND`   | un callback del sistema operativo puede originar trabajo, pero la demora del SO no amplía la vigencia de la intención                       |
| `PROPAGATED`      | transporte o worker técnico recibe la política temporal del trabajo upstream y no genera otra                                               |
| `NO_APLICA`       | el mecanismo no representa trabajo durable ni efecto empresarial dentro del alcance actual                                                  |

Un retry no es un nuevo modo de programación de intención. Su `next_retry_at` y presupuesto pertenecen a `QUEUE-ARC-006` y siempre quedan subordinados al `deadline_at` definido aquí.

---

#### 7. Campos mínimos del sobre temporal

Para las 16 identidades que aplican política temporal, el trabajo deberá poder conservar:

```text
operation_id
idempotency_key
priority_class
created_at
scheduled_at
deadline_at
```

Cuando exista programación recurrente deberá conservar además:

```text
schedule_id
schedule_version
schedule_timezone
logical_fire_at_utc
schedule_occurrence_id
misfire_policy
```

Reglas de obligatoriedad:

1. `scheduled_at` y `deadline_at` son obligatorios para toda intención aplicable;
2. `scheduled_at < deadline_at` debe cumplirse antes de aceptar programación ordinaria;
3. `deadline_at` es finito y se calcula de forma determinista desde el contrato propietario, la vigencia del recurso o la regla de ocurrencia aplicable;
4. si el recurso empresarial expira antes del deadline técnico propuesto, prevalece el instante empresarial más restrictivo;
5. un retry, reconnect, reinicio, handoff, cambio de worker o espera de cola no amplía `deadline_at`;
6. un `Retry-After` puede desplazar un intento solamente si el nuevo instante permanece antes de `deadline_at`;
7. una acción de recuperación posterior al vencimiento no puede ocultarse extendiendo el deadline original; cualquier recuperación extraordinaria se gobierna por `QUEUE-ARC-008` y su autoridad por `QUEUE-ARC-012`;
8. transportes y workers no crean otro deadline ni otra prioridad cuando reciben trabajo upstream.

---

#### 8. Regla canónica de elegibilidad y ordenación

Un trabajo puede competir por ejecución ordinaria únicamente cuando:

```text
scheduled_at <= now_utc < deadline_at
```

y además no existe una restricción causal, de versión, dependencia, concurrencia o control que lo haga inelegible.

Entre trabajos independientes y simultáneamente elegibles, la selección deberá respetar, en este orden:

1. causalidad, dependencia, versión y orden obligatorio del recurso;
2. `deadline_at` más próximo;
3. `priority_class` de mayor prioridad;
4. `scheduled_at` más antiguo;
5. `created_at` más antiguo;
6. `operation_id` como desempate estable, sin significado empresarial adicional.

Consecuencias:

- un trabajo `P1_TIME_BOUND` no rompe causalidad para adelantar uno dependiente;
- un trabajo de prioridad inferior próximo a vencer puede preceder a otro con deadline posterior;
- la hora de llegada aislada nunca sustituye dependencia, versión ni deadline;
- esta regla define orden lógico de elegibilidad, no claim, locking ni exclusión física, responsabilidad de `QUEUE-ARC-009`.

---

#### 9. Programación recurrente y versión

Una definición recurrente se identifica por:

```text
business_owner_application
+ schedule_id
+ schedule_version
```

Una ocurrencia se identifica por:

```text
business_owner_application
+ schedule_id
+ logical_fire_at_utc
+ contract_version
```

Reglas:

1. `logical_fire_at_utc` representa la ocurrencia prevista y permanece igual si la ejecución comienza tarde;
2. el cron expression, regla de calendario o mecanismo físico no es por sí solo la identidad de la ocurrencia;
3. `schedule_timezone` es obligatoria cuando el calendario depende de tiempo civil;
4. un nombre que contenga una ciudad o una hora no acredita por sí mismo la zona horaria;
5. cambiar calendario, zona horaria, vigencia, misfire, prioridad por defecto o regla de deadline exige una nueva `schedule_version`; no se reescriben ocurrencias históricas;
6. cambiar la semántica contractual incompatible de `SCHEDULE_DEFINITION` exige además el versionado aplicable de `TSVC-SVC-009.CONTRACT`;
7. las expresiones actualmente observadas se conservan como evidencia del estado existente; esta tarea no las reinterpreta ni las modifica;
8. una implementación posterior deberá materializar explícitamente zona horaria y versión antes de presentar una definición existente como conforme al contrato objetivo.

---

#### 10. Política canónica de misfire

Para las ocurrencias recurrentes actuales se utilizan exactamente estas decisiones:

| Política                   | Semántica                                                                                                                                                                                           |
| -------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `RUN_ONCE_IF_STILL_VALID`  | la ocurrencia retrasada puede iniciar una sola vez mientras siga antes de su deadline y el recurso o contexto empresarial continúe siendo válido                                                    |
| `COALESCE_TO_LATEST_VALID` | varias ocurrencias vencidas o no iniciadas no se ejecutan como una ráfaga; la última ocurrencia todavía válida representa la reanudación y las anteriores no generan efectos tardíos independientes |

Reglas comunes:

1. un misfire conserva la identidad de la ocurrencia que intenta recuperarse;
2. un retry de esa ocurrencia conserva la misma identidad y se gobierna por `QUEUE-ARC-006`;
3. si `now_utc >= deadline_at`, no se inicia un intento ordinario de la ocurrencia vencida;
4. coalescer no fusiona claves idempotentes ni reescribe historia; solo determina qué ocurrencia sigue siendo elegible;
5. una ocurrencia descartada por vigencia no implica que el hecho empresarial subyacente se considere resuelto;
6. una consecuencia empresarial no resuelta deberá quedar disponible para la siguiente ocurrencia, conciliación o tarea propietaria según el contrato de dominio;
7. la transición de estado y el evento exacto de misfire o vencimiento pertenecen a `QUEUE-ARC-010`.

---

#### 11. Ejecución manual frente a ocurrencia programada

Una ejecución manual de un schedule puede representar dos casos distintos:

```text
RECUPERAR UNA OCURRENCIA EXISTENTE
→ conservar schedule_occurrence_id
→ conservar idempotency_key
→ conservar logical_fire_at_utc

CREAR UNA EJECUCIÓN ADICIONAL DELIBERADA
→ nueva ocurrencia manual
→ nueva clave idempotente
→ correlación con schedule y motivo de origen
```

Nunca se genera una clave nueva para fingir que una ocurrencia vencida es la misma intención. La autorización para disparar una ejecución manual o recuperar trabajo pertenece a `QUEUE-ARC-012`; el tratamiento de recuperación fallida pertenece a `QUEUE-ARC-008`.

---

#### 12. Vencimiento

`deadline_at` define la frontera temporal de ejecución ordinaria.

Al alcanzarse el deadline:

1. no comienza un nuevo intento ordinario;
2. no se crea otra intención automáticamente;
3. no se cambia la clave idempotente para eludir el vencimiento;
4. no se amplía el deadline por ausencia de worker, falta de conectividad, throttling o indisponibilidad de dispositivo;
5. un efecto externo o físico potencialmente producido pero no confirmado permanece sujeto a conciliación y no se clasifica como fallido solo por el reloj;
6. un resultado que llega tarde no sobrescribe silenciosamente una decisión posterior del recurso;
7. el estado y evento canónicos que representan vencimiento, resultado tardío o conciliación se cierran en `QUEUE-ARC-010`;
8. las métricas de espera hasta deadline, lateness y expiración se cierran en `QUEUE-ARC-011`.

El vencimiento del trabajo no elimina ni invalida por sí mismo la fuente empresarial que lo originó. Un mensaje, pago, solicitud, documento o registro puede seguir requiriendo conciliación bajo su propietaria.

---

#### 13. Matriz temporal materializada de las 19 identidades `QAI-*`

| ID        | Clasificación                         | Prioridad objetivo | Modo              | Programación / ocurrencia                                                                 | Regla de deadline                                                                                                                       | Misfire / atraso                                                  | Estado y decisión documental                                                                                                                                                                         |
| --------- | ------------------------------------- | ------------------ | ----------------- | ----------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `QAI-001` | `APLICA_POLITICA_TEMPORAL_DE_TRABAJO` | `P1_TIME_BOUND`    | `RECURRENT`       | expresión observada `5 0 * * *`; cada fire lógico conserva identidad propia               | se deriva de la vigencia del día, turno o contexto de asistencia afectado; nunca se extiende por retry                                  | `RUN_ONCE_IF_STILL_VALID`                                         | `ESPECIFICADO`; no obtiene precedencia automática sobre `QAI-004`; cualquier solapamiento sobre el mismo recurso se resuelve en `QUEUE-ARC-009` y la transición legacy permanece bajo `TSVC-CAT-010` |
| `QAI-002` | `APLICA_POLITICA_TEMPORAL_DE_TRABAJO` | `P1_TIME_BOUND`    | `RECURRENT`       | expresión observada `*/5 * * * *`; una ocurrencia representa el ciclo de evaluación       | la ocurrencia de barrido vence al llegar la siguiente ocurrencia lógica; trabajos hijos conservan su propio deadline                    | `COALESCE_TO_LATEST_VALID`                                        | `ESPECIFICADO`; cron, SQL, `pg_net` y Edge Function no pueden crear fechas o prioridades divergentes para la misma intención                                                                         |
| `QAI-003` | `APLICA_POLITICA_TEMPORAL_DE_TRABAJO` | `P1_TIME_BOUND`    | `RECURRENT`       | expresión observada `10 5 * * *`; ocurrencia correctiva separada del cierre ordinario     | vigencia del turno o contexto stale que todavía pueda corregirse sin contradecir un cierre posterior                                    | `RUN_ONCE_IF_STILL_VALID`                                         | `ESPECIFICADO`; si el recurso ya fue cerrado o sustituido, la ocurrencia tardía no fuerza otro efecto                                                                                                |
| `QAI-004` | `APLICA_POLITICA_TEMPORAL_DE_TRABAJO` | `P1_TIME_BOUND`    | `RECURRENT`       | expresión remota observada `59 4 * * *`; conserva identidad de schedule independiente     | misma frontera empresarial del cierre de asistencia que pretende ejecutar                                                               | `RUN_ONCE_IF_STILL_VALID`                                         | `ESPECIFICADO`; estar antes en el reloj o tener la misma prioridad no concede autoridad sobre `QAI-001`; exclusión y duplicidad quedan en `QUEUE-ARC-009`                                            |
| `QAI-005` | `APLICA_POLITICA_TEMPORAL_DE_TRABAJO` | `P3_BACKGROUND`    | `RECURRENT`       | expresión observada `0 14 * * *`; cada ciclo de alertas es una ocurrencia                 | vigencia de la intención de notificación; una entrega tardía no puede superar el deadline de la comunicación                            | `RUN_ONCE_IF_STILL_VALID`                                         | `ESPECIFICADO`; `pg_net` propaga la política y no la redefine; la protección de credenciales conserva su tarea propietaria                                                                           |
| `QAI-006` | `APLICA_POLITICA_TEMPORAL_DE_TRABAJO` | `P4_MAINTENANCE`   | `RECURRENT`       | expresión observada `17 * * * *`; barrido de limpieza por ocurrencia                      | la ocurrencia vence al llegar la siguiente; la expiración real de cada cotización sigue perteneciendo al recurso                        | `COALESCE_TO_LATEST_VALID`                                        | `ESPECIFICADO`; no se ejecuta una ráfaga de limpiezas históricas al recuperar capacidad                                                                                                              |
| `QAI-007` | `APLICA_POLITICA_TEMPORAL_DE_TRABAJO` | `P1_TIME_BOUND`    | `RECURRENT`       | expresión observada `*/5 * * * *`; reconciliación periódica de checkouts                  | la ocurrencia vence al llegar la siguiente; el vencimiento del checkout continúa siendo la fuente empresarial                           | `COALESCE_TO_LATEST_VALID`                                        | `ESPECIFICADO`; perder una ocurrencia no convierte timeout ni pago ambiguo en fallo definitivo                                                                                                       |
| `QAI-008` | `APLICA_POLITICA_TEMPORAL_DE_TRABAJO` | `P4_MAINTENANCE`   | `RECURRENT`       | expresión declarada `15 3 * * *`; contrato temporal definido aunque no esté activo remoto | la ocurrencia vence al llegar la siguiente; la edad de borradores sigue gobernada por la regla propietaria                              | `COALESCE_TO_LATEST_VALID`                                        | `PENDIENTE_DE_EVIDENCIA`; esta tarea no activa el job; despliegue, estado y evidencia continúan gobernados por `QUEUE-ARC-010`, `QUEUE-ARC-011` y la planificación de `DELIV-PKG-001`                |
| `QAI-009` | `APLICA_POLITICA_TEMPORAL_DE_TRABAJO` | `P2_STANDARD`      | `RECURRENT`       | workflow observado `0 3 * * *` UTC y ejecución manual permitida                           | la ocurrencia batch vence al llegar la siguiente; las solicitudes pendientes permanecen en su fuente de verdad                          | `COALESCE_TO_LATEST_VALID`; manual adicional usa nueva ocurrencia | `ESPECIFICADO`; recuperar una ocurrencia conserva su identidad; una ejecución manual extra no se hace pasar por el schedule perdido                                                                  |
| `QAI-010` | `PROPAGA_NO_DECIDE_POLITICA_TEMPORAL` | `UPSTREAM`         | `PROPAGATED`      | transporta la solicitud HTTP ya originada                                                 | conserva el deadline upstream; el request técnico de `pg_net` no crea otro                                                              | `NO_APLICA`                                                       | `ESPECIFICADO`; la cola administrada es transporte y no autoridad para prioridad, schedule o vencimiento                                                                                             |
| `QAI-011` | `APLICA_POLITICA_TEMPORAL_DE_TRABAJO` | `P1_TIME_BOUND`    | `OFFLINE_DURABLE` | intención disponible desde su creación local; reconexión no cambia `scheduled_at`         | vigencia del contexto de asistencia, turno y versión capturada al originar la intención                                                 | `NO_APLICA`                                                       | `ESPECIFICADO`; una operación offline tardía no se vuelve válida por reconectar el dispositivo                                                                                                       |
| `QAI-012` | `APLICA_POLITICA_TEMPORAL_DE_TRABAJO` | `P1_TIME_BOUND`    | `OFFLINE_DURABLE` | intención de descanso conserva programación original durante offline                      | vigencia del descanso, turno y contexto que originaron la intención                                                                     | `NO_APLICA`                                                       | `ESPECIFICADO`; la cola separada no amplía la ventana temporal ni cruza prioridad con asistencia                                                                                                     |
| `QAI-013` | `PROPAGA_NO_DECIDE_POLITICA_TEMPORAL` | `UPSTREAM`         | `PROPAGATED`      | loop observado cada `15000 ms` solo busca pendientes                                      | no crea deadline; cada elemento conserva el suyo                                                                                        | `NO_APLICA`                                                       | `ESPECIFICADO`; el intervalo del worker no es `scheduled_at` del trabajo y el timing de retry se define en `QUEUE-ARC-006`                                                                           |
| `QAI-014` | `APLICA_POLITICA_TEMPORAL_DE_TRABAJO` | `P1_TIME_BOUND`    | `OS_BACKGROUND`   | callback de ubicación puede originar trabajo al ser aceptado                              | vigencia de relación laboral, turno y evento lógico de salida; retraso del SO no la amplía                                              | `NO_APLICA`                                                       | `ESPECIFICADO`; una ubicación tardía no autoriza por sí sola un cierre fuera del contexto vigente                                                                                                    |
| `QAI-015` | `APLICA_POLITICA_TEMPORAL_DE_TRABAJO` | `P2_STANDARD`      | `OFFLINE_DURABLE` | impresión queda disponible según intención y disponibilidad técnica                       | vigencia de documento o comanda, versión, propósito e identidad de copia autorizada                                                     | `NO_APLICA`                                                       | `ESPECIFICADO`; esperar BrowserPrint o dispositivo no amplía el deadline; efecto físico ambiguo exige conciliación y detalle posterior `PRINT-ARC-*`                                                 |
| `QAI-016` | `NO_APLICA`                           | `NO_APLICA`        | `NO_APLICA`       | refresco de lectura cada `20 s`                                                           | `NO_APLICA`                                                                                                                             | `NO_APLICA`                                                       | `NO_APLICA`; continúa siendo refresco de UI sin trabajo durable ni efecto empresarial                                                                                                                |
| `QAI-017` | `APLICA_POLITICA_TEMPORAL_DE_TRABAJO` | `P2_STANDARD`      | `EVENT_DRIVEN`    | la inserción fuente origina la intención de notificación                                  | vigencia contractual de la notificación; el mensaje fuente no vence por fallar su entrega                                               | `NO_APLICA`                                                       | `ESPECIFICADO`; trigger y `pg_net` no pueden redefinir prioridad ni deadline; detalle de entrega permanece bajo `NOTIFY-ARC-*`                                                                       |
| `QAI-018` | `APLICA_POLITICA_TEMPORAL_DE_TRABAJO` | `P1_TIME_BOUND`    | `EVENT_DRIVEN`    | evento Wompi aceptado origina procesamiento inmediato salvo diferimiento contractual      | deadline del procesamiento automático derivado del contrato de integración; al agotarse, el evento pasa a conciliación y no se descarta | `NO_APLICA`                                                       | `ESPECIFICADO`; un evento tardío o resultado incierto conserva trazabilidad y no crea una venta ni un segundo efecto                                                                                 |
| `QAI-019` | `APLICA_POLITICA_TEMPORAL_DE_TRABAJO` | `P1_TIME_BOUND`    | `EVENT_DRIVEN`    | evento RevenueCat aceptado origina procesamiento inmediato salvo diferimiento contractual | deadline del procesamiento automático derivado del contrato de integración; al agotarse, la fuente queda conciliable                    | `NO_APLICA`                                                       | `ESPECIFICADO`; la política temporal no oculta ni corrige la brecha de replay ya identificada y no afirma cumplimiento end-to-end                                                                    |

Resultado de reconciliación:

```text
19 IDENTIDADES ESPERADAS
19 IDENTIDADES MATERIALIZADAS
16 APLICAN POLÍTICA TEMPORAL DE TRABAJO
2 PROPAGAN Y NO DECIDEN POLÍTICA TEMPORAL
1 NO APLICA
0 FALTANTES
0 DUPLICADOS

DISTRIBUCIÓN DE PRIORIDAD ENTRE LAS 16 APLICABLES
P1_TIME_BOUND  = 10
P2_STANDARD    = 3
P3_BACKGROUND  = 1
P4_MAINTENANCE = 2
```

---

#### 14. Reconciliación de schedules actuales

El inventario aprobado conserva nueve mecanismos con programación recurrente explícita dentro del universo materializado: ocho identidades de schedule `QAI-001..QAI-008` provenientes de la unión código/remoto y el workflow `QAI-009`.

Esta tarea fija:

1. las siete identidades `pg_cron` observadas activas conservan sus expresiones actuales como evidencia, no como aprobación de una nueva configuración;
2. `QAI-008` conserva su expresión declarada y su ausencia remota; la especificación temporal no acredita despliegue;
3. `QAI-009` conserva el schedule fuente `0 3 * * *` UTC y la posibilidad de ejecución manual observada;
4. ninguna expresión actual se modifica, normaliza o reinterpreta;
5. una futura adopción deberá declarar explícitamente `schedule_timezone`, `schedule_version`, prioridad por defecto, regla de deadline y misfire antes de presentarse como conforme;
6. la falta de zona horaria explícita en un mecanismo actual es una brecha de materialización del contrato, no una licencia para inferir UTC o una zona local desde el nombre;
7. la planificación de implementación y transición de estas brechas se recibe en `DELIV-PKG-001`; los estados y eventos observables de adopción permanecen vinculados a `QUEUE-ARC-010` y sus métricas a `QUEUE-ARC-011`.

---

#### 15. Solapamiento `QAI-001` / `QAI-004`

Los dos schedules que invocan el cierre diario base mantienen:

```text
DOS DEFINICIONES
DOS OCURRENCIAS
DOS IDENTIDADES IDEMPOTENTES
MISMA PRIORIDAD TEMPORAL OBJETIVO
```

Esta tarea prohíbe resolver la doble autoridad mediante una prioridad artificial.

Reglas:

1. ninguno adquiere autoridad por ejecutarse primero en el reloj;
2. ninguno se fusiona con el otro por usar la misma función;
3. cada ocurrencia conserva su propio deadline y misfire;
4. si ambos resultan elegibles sobre el mismo recurso, la exclusión semántica y concurrente se resuelve en `QUEUE-ARC-009`;
5. la decisión de coexistencia o retiro legacy permanece bajo `TSVC-CAT-010`;
6. esta tarea no retira, desactiva ni cambia horario a ninguno.

---

#### 16. Relación con idempotencia

Prioridad y tiempo pertenecen a la proyección operativa y no cambian la identidad original.

Por tanto:

- cambiar `priority_class` no crea otra `idempotency_key`;
- esperar hasta `scheduled_at` no cambia `operation_id`;
- un misfire recuperable conserva `schedule_occurrence_id`;
- un retry conserva deadline y clave;
- alcanzar el deadline no autoriza una clave nueva;
- una ejecución manual adicional sí representa una intención distinta y usa nueva identidad;
- una ejecución manual que recupera exactamente una ocurrencia previa conserva la identidad de esa ocurrencia.

---

#### 17. Handoff exacto a `QUEUE-ARC-005..012`

| Tarea                                                                             | Responsabilidad reservada recibida desde esta tarea                                                                                                                       |
| --------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `QUEUE-ARC-005 — Definir asignación a trabajador, dispositivo o adaptador`        | seleccionar destino técnico sin alterar `priority_class`, `scheduled_at` ni `deadline_at` de la intención                                                                 |
| `QUEUE-ARC-006 — Definir reintentos, backoff y límite máximo`                     | calcular `next_retry_at` y presupuesto únicamente dentro de la ventana anterior a `deadline_at`                                                                           |
| `QUEUE-ARC-007 — Definir cancelación antes y durante ejecución`                   | cancelar trabajo temporalmente válido o en ejecución sin confundir cancelación con vencimiento                                                                            |
| `QUEUE-ARC-008 — Definir cola de fallos y recuperación manual`                    | recuperar trabajo sin extender silenciosamente el deadline original y dejando explícita cualquier intervención extraordinaria                                             |
| `QUEUE-ARC-009 — Definir bloqueo de duplicados y concurrencia`                    | aplicar claim, lease, fencing y exclusión después de la selección temporal, preservando causalidad y resolviendo solapamientos como `QAI-001` / `QAI-004`                 |
| `QUEUE-ARC-010 — Definir estados y eventos canónicos`                             | materializar los estados y eventos exactos de programación, misfire, inicio tardío, vencimiento y resultado posterior al deadline                                         |
| `QUEUE-ARC-011 — Definir métricas de espera, ejecución y error`                   | medir queue wait, lateness, tiempo hasta deadline, misfires, vencimientos y distribución por prioridad                                                                    |
| `QUEUE-ARC-012 — Definir autorización para crear, cancelar y reintentar trabajos` | definir quién puede programar, disparar manualmente, cambiar prioridad o autorizar recuperación sin convertir la posesión de una identidad técnica en permiso empresarial |

Ninguna de esas responsabilidades se desarrolla en esta tarea.

---

#### 18. Prohibiciones

Esta tarea no autoriza:

1. modificar cron expressions existentes;
2. activar `QAI-008`;
3. desactivar o retirar `QAI-004`;
4. cambiar GitHub Actions;
5. crear schedulers, tablas, columnas, índices, constraints, funciones o triggers;
6. modificar `pg_net`;
7. cambiar colas SecureStore o localStorage;
8. cambiar el intervalo del worker móvil;
9. modificar TaskManager, BrowserPrint, webhooks o Edge Functions;
10. cambiar perfiles de retry o backoff;
11. asignar workers, dispositivos o adaptadores;
12. definir claims, leases, fencing o locks;
13. cerrar el vocabulario de estados o sus transiciones;
14. fijar métricas, SLOs o alertas;
15. conceder autoridad para cambiar prioridad, schedule o recuperación;
16. inferir cumplimiento del contrato objetivo por observar un job activo;
17. iniciar o desarrollar `QUEUE-ARC-005`.

---

#### 19. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea especializa y materializa para el inventario de colas reglas temporales ya protegidas por la cobertura transversal vigente: límite de edad, deadline, orden seguro, programación recurrente, ocurrencia lógica, misfire, prioridad subordinada a causalidad, resultado desconocido, conciliación y prohibición de efectos tardíos ordinarios. No introduce un comportamiento verificable adicional fuera de esas obligaciones ni modifica el alcance, estado, responsable o relación de requisitos existentes.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

---

#### 20. Cobertura de prueba existente preservada

Se preserva sin modificación, en especial:

- `TREQ-INTEGRATION-003`, que protege límites de intentos y edad, retry controlado, resultado desconocido, claim, conciliación, cola de fallos, recuperación y no duplicidad para operaciones asíncronas;
- `TREQ-INTEGRATION-004`, que exige reconstruir trigger, función, job, webhook o notificación con causa, intento, resultado, error y efecto final;
- la cobertura ya consumida por `TSVC-CAT-006` para deadline, orden causal, schedule, misfire, reintento y ejecución manual.

Ninguna fila del registro canónico cambia de identificador, dominio, regla protegida, estado, responsable, evidencia, relación o secuencia por esta tarea.

---

#### 21. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. conserva `QUEUE-ARC-003` como tarea anterior aprobada;
2. conserva `QUEUE-ARC-005` como única tarea siguiente reservada;
3. consume `TSVC-SVC-001.CONTRACT@1.0.0` y `TSVC-SVC-009.CONTRACT@1.0.0` sin crear una fuente de verdad paralela;
4. consume `WORK-IDEMPOTENCY-CONTRACT-001@1.0.0` sin regenerar claves por cambios temporales;
5. define exactamente cuatro clases de prioridad;
6. define `scheduled_at` como frontera inicial de elegibilidad;
7. define `deadline_at` como frontera exclusiva para iniciar intentos ordinarios;
8. exige deadline finito para las 16 identidades aplicables;
9. impide que retry, reconexión, espera o cambio de worker amplíen el deadline;
10. mantiene `logical_fire_at_utc` estable aunque la ejecución real sea tardía;
11. distingue `schedule_id`, `schedule_version`, `schedule_occurrence_id` e intento;
12. exige zona horaria declarada cuando el calendario dependa de tiempo civil;
13. prohíbe inferir zona horaria desde nombre o cron expression;
14. define dos políticas de misfire y asigna una a cada schedule recurrente aplicable;
15. distingue recuperación de una ocurrencia existente de una ejecución manual adicional;
16. ordena trabajo elegible preservando primero causalidad, dependencia, versión y deadline;
17. materializa exactamente una decisión para cada `QAI-001..QAI-019`;
18. obtiene 16 `APLICA_POLITICA_TEMPORAL_DE_TRABAJO`, 2 `PROPAGA_NO_DECIDE_POLITICA_TEMPORAL` y 1 `NO_APLICA`;
19. obtiene 10 `P1_TIME_BOUND`, 3 `P2_STANDARD`, 1 `P3_BACKGROUND` y 2 `P4_MAINTENANCE` entre las 16 identidades aplicables;
20. mantiene 0 identidades faltantes y 0 duplicadas;
21. conserva las siete expresiones `pg_cron` activas actuales sin modificarlas;
22. conserva `QAI-008` como definido pero no acreditado remotamente;
23. conserva `QAI-009` con schedule fuente UTC y ejecución manual diferenciada;
24. no utiliza prioridad para resolver la doble autoridad `QAI-001` / `QAI-004`;
25. mantiene `QAI-010` y `QAI-013` como propagadores, no originadores de política temporal;
26. mantiene `QAI-016` como `NO_APLICA`;
27. separa vencimiento de cancelación, error terminal y resultado ambiguo;
28. asigna con exactitud las responsabilidades `QUEUE-ARC-005..012`;
29. declara cero cambios de requisitos de prueba con justificación concreta;
30. crea cero objetos físicos;
31. modifica cero repositorios, Supabase, cron, colas, workers, webhooks o dispositivos;
32. no inicia ni desarrolla `QUEUE-ARC-005`.

---

#### 22. Resultado de la tarea

`QUEUE-ARC-004` deja establecido el contrato temporal del trabajo asíncrono de Vento OS:

```text
INTENCIÓN IDEMPOTENTE
        ↓
PRIORITY_CLASS
        ↓
SCHEDULED_AT
        ↓
ELEGIBILIDAD
        ↓
DEADLINE_AT
        ↓
EJECUCIÓN ORDINARIA SOLO DENTRO DE LA VENTANA

SI ES RECURRENTE
SCHEDULE VERSIONADO
→ LOGICAL_FIRE_AT_UTC
→ OCURRENCIA ESTABLE
→ MISFIRE EXPLÍCITO
→ SIN RÁFAGAS NI EFECTOS TARDÍOS POR INFERENCIA
```

Las 19 identidades inventariadas quedan reconciliadas una a una. La política temporal está completamente definida a nivel documental sin modificar la implementación actual ni anticipar asignación, retry, cancelación, recuperación, concurrencia, estados, métricas o autorización.

---

#### 23. Continuidad

ÚLTIMA TAREA APROBADA

`QUEUE-ARC-003 — Definir clave de idempotencia por trabajo`

TAREA ACTUAL APROBADA

`QUEUE-ARC-004 — Definir prioridad, programación y vencimiento`

SIGUIENTE TAREA RESERVADA

`QUEUE-ARC-005 — Definir asignación a trabajador, dispositivo o adaptador`


### ✅ QUEUE-ARC-005 — Definir asignación a trabajador, dispositivo o adaptador

**Estado:** APROBADA
**Tarea anterior:** `QUEUE-ARC-004 — Definir prioridad, programación y vencimiento`
**Tarea siguiente:** `QUEUE-ARC-006 — Definir reintentos, backoff y límite máximo`
**Tipo de tarea:** documental; especialización canónica de asignación técnica de trabajos asíncronos a worker, dispositivo o adaptador, con separación entre selección de destino, identidad técnica, transporte, ejecución y claim, y decisión explícita para las 19 identidades `QAI-*`, sin implementar workers, enrolamiento, adaptadores, colas, locks, retries, estados, métricas ni autorización física
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/03_INFRAESTRUCTURA_CANONICA_DE_COLAS.md`
**Línea base documental:** `vento-shell@f280a78a81ec94066a31ae4095e3ba2ee0e22bfb`
**Contrato base de trabajo:** `TSVC-SVC-001.CONTRACT@1.0.0`
**Registro de identidad técnica consumido:** `TRANSVERSE-SERVICE-TECHNICAL-IDENTITY-REGISTRY-001@1.0.0`
**Registro de confiabilidad consumido:** `TRANSVERSE-SERVICE-RELIABILITY-REGISTRY-001@1.0.0`
**Contrato de idempotencia consumido:** `WORK-IDEMPOTENCY-CONTRACT-001@1.0.0`
**Contrato temporal consumido:** `WORK-SCHEDULING-POLICY-CONTRACT-001@1.0.0`
**Inventario consumido:** `QUEUE-CURRENT-ASSET-INVENTORY-001` — 19 identidades `QAI-*`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma cerrada cómo un trabajo ya identificado, temporalmente elegible y contractualmente válido obtiene un destino técnico de ejecución sin transferir propiedad empresarial, sin convertir una decisión de routing en otra intención y sin confundir asignación con claim, intento, transporte, autenticación o autorización.

La regla raíz es:

```text
TRABAJO CANÓNICO ELEGIBLE
        +
CAPACIDAD TÉCNICA REQUERIDA
        +
ÁMBITO Y AMBIENTE COMPATIBLES
        +
DESTINO TÉCNICO IDENTIFICABLE
        ↓
ASIGNACIÓN RECONSTRUIBLE
        ↓
WORKER / DISPOSITIVO / ADAPTADOR COMPATIBLE
```

Asignar significa seleccionar el destino técnico que puede intentar ejecutar o encaminar el trabajo. No significa que el destino ya haya reclamado la unidad, que tenga autoridad empresarial para ordenar el efecto, que el efecto haya comenzado ni que haya terminado correctamente.

---

#### 2. Resultado sustantivo

Se establece `WORK-ASSIGNMENT-CONTRACT-001@1.0.0` como especialización de routing y destino técnico del contrato de trabajo asíncrono.

El resultado material fija:

1. tres clases cerradas de destino técnico: `WORKER`, `DEVICE` y `ADAPTER`;
2. la posibilidad de componer una ruta ordenada con más de una clase cuando el efecto exige custodia local, adaptación o ejecución servidora;
3. la diferencia entre asignación, claim, intento, transporte y resultado;
4. el sobre mínimo de asignación y su historial versionado;
5. la regla de compatibilidad por servicio, contrato, ambiente, operación, capacidad y scopes aplicables;
6. la prohibición de usar un destino técnico como sustituto de actor, aplicación propietaria o autorización;
7. reglas específicas para worker, dispositivo y adaptador;
8. la relación entre asignación dinámica e identidad idempotente;
9. la relación entre asignación y la ventana temporal ya definida en `QUEUE-ARC-004`;
10. la conducta ante reasignación sin definir todavía retry, claim, lease, fencing, estados ni eventos;
11. una decisión explícita para las 19 identidades `QAI-*` del inventario aprobado.

Balance:

| Métrica                                    | Resultado |
| ------------------------------------------ | --------: |
| Identidades `QAI-*` esperadas              |    **19** |
| Identidades materializadas                 |    **19** |
| `APLICA_ASIGNACION_DE_TRABAJO`             |    **16** |
| `PROPAGA_NO_DECIDE_ASIGNACION`             |     **2** |
| `NO_APLICA`                                |     **1** |
| Rutas `WORKER`                             |    **10** |
| Rutas `DEVICE → WORKER`                    |     **3** |
| Rutas `WORKER → DEVICE`                    |     **1** |
| Rutas `ADAPTER → WORKER`                   |     **2** |
| Identificadores `QAI-*` duplicados         |     **0** |
| Identidades sin decisión                   |     **0** |
| Requisitos de prueba creados o modificados |     **0** |
| Objetos físicos creados o modificados      |     **0** |

---

#### 3. Herencia contractual obligatoria

`WORK-ASSIGNMENT-CONTRACT-001@1.0.0` no crea una fuente de verdad paralela ni una identidad técnica nueva.

Hereda obligatoriamente:

- de `TSVC-SVC-001.CONTRACT@1.0.0`, `operation_id`, `operation_type`, versión contractual, aplicación productora y aplicación propietaria del resultado;
- de `TRANSVERSE-SERVICE-TECHNICAL-IDENTITY-REGISTRY-001@1.0.0`, las clases `WORKER_IDENTITY`, `DEVICE_IDENTITY`, `PROVIDER_IDENTITY`, `SERVICE_RUNTIME_IDENTITY`, `CALLER_IDENTITY` y `SCHEDULER_IDENTITY`, junto con la separación entre identidad técnica y autoridad empresarial;
- de `TRANSVERSE-SERVICE-RELIABILITY-REGISTRY-001@1.0.0`, el sobre de ejecución, la obligación de preservar identidad durante handoffs y la separación entre worker, dispositivo, proveedor, scheduler, claim, lease y fencing;
- de `WORK-IDEMPOTENCY-CONTRACT-001@1.0.0`, la intención estable, su huella y la regla de que un cambio dinámico de worker, dispositivo o adaptador no crea otra intención salvo que ese destino concreto forme parte material del contrato empresarial;
- de `WORK-SCHEDULING-POLICY-CONTRACT-001@1.0.0`, `priority_class`, `scheduled_at`, `deadline_at` y la regla de que una reasignación no amplía la ventana temporal;
- de `QUEUE-CURRENT-ASSET-INVENTORY-001`, las 19 identidades materiales y su clasificación técnica actual.

La tarea no aprovisiona principals, credenciales, enrolamientos, workers, dispositivos ni adaptadores y no presenta las identidades objetivo como activas.

---

#### 4. Asignación no equivale a claim ni ejecución

Se fijan las siguientes fronteras:

```text
ASIGNACIÓN
= seleccionar un destino técnico compatible

CLAIM
= adquirir temporalmente derecho técnico de procesamiento

INTENTO
= una ejecución concreta

TRANSPORTE
= mover la solicitud o el mensaje entre fronteras

EFECTO
= modificación técnica, empresarial o física producida
```

Reglas:

1. una unidad puede estar asignada sin haber sido reclamada;
2. una unidad reclamada no demuestra que el efecto haya ocurrido;
3. un `request_id`, mensaje HTTP, ID de `pg_net` o callback no es un `assignment_id`;
4. el claim, lease y fencing se definen en `QUEUE-ARC-009` y no se anticipan aquí;
5. la creación de un nuevo intento y su contador se definen en `QUEUE-ARC-006`;
6. un cambio de destino no convierte por sí mismo el trabajo en retry ni en nueva intención;
7. la aplicación propietaria continúa siendo autoridad sobre el resultado aunque el trabajo cambie de worker, dispositivo o adaptador.

---

#### 5. Clases canónicas de destino técnico

El vocabulario cerrado inicial es:

| Clase     | Función                                                                                               | No representa                                                                  |
| --------- | ----------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------ |
| `WORKER`  | runtime técnico que puede ejecutar una operación o etapa del trabajo bajo el servicio correspondiente | actor humano, propiedad empresarial, scheduler ni autorización general         |
| `DEVICE`  | dispositivo o periférico identificado que custodia o ejecuta una etapa física/local cuando aplica     | usuario, sede completa, fuente de verdad ni confirmación automática del efecto |
| `ADAPTER` | frontera técnica que valida, traduce o encamina entre contrato interno y transporte/proveedor         | proveedor como propietario, worker empresarial ni permiso para inventar datos  |

Una ruta puede contener varias etapas. La composición describe responsabilidad técnica; no crea trabajos hijos por sí sola y no sustituye la causalidad ni los contratos especializados.

---

#### 6. Vocabulario y sobre mínimo de asignación

Toda materialización futura de una asignación deberá poder conservar, cuando aplique:

```text
operation_id
assignment_id
assignment_version
service_id
contract_id
contract_version
environment
assignment_route
required_capabilities
target_kind
target_identity
worker_identity
device_identity
adapter_identity
provider_identity
resource_scope
site_scope
tenant_scope
assigned_at
assignment_reason
```

Definiciones:

| Campo                   | Regla canónica                                                                                                                      |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| `assignment_id`         | identidad única de una decisión de asignación; no reemplaza `operation_id`, `attempt_id` ni identidad del target                    |
| `assignment_version`    | versión monotónica de la decisión de routing de una misma operación; una reasignación incrementa la versión sin reescribir historia |
| `assignment_route`      | secuencia ordenada de clases técnicas necesarias para llegar al efecto; cada etapa conserva identidad y responsabilidad separadas   |
| `required_capabilities` | capacidades técnicas mínimas que un candidato debe demostrar según contrato; no constituye autorización empresarial                 |
| `target_kind`           | una de `WORKER`, `DEVICE` o `ADAPTER`                                                                                               |
| `target_identity`       | identidad técnica concreta seleccionada o referencia resoluble a la identidad autorizada                                            |
| `assignment_reason`     | causa reconstruible de selección o reasignación; no se usa para esconder cambios de intención                                       |

Reglas:

1. `assignment_id` no se reutiliza para dos decisiones distintas;
2. una reasignación conserva `operation_id`, `idempotency_key`, contrato, huella, prioridad y deadline;
3. los campos no aplicables se omiten o se declaran `NO_APLICA`; no se inventan identidades;
4. ninguna referencia de credencial o secreto forma parte del routing empresarial;
5. la asignación conserva la identidad del servicio, ambiente y aplicación propietaria;
6. un `assignment_route` con varias etapas debe preservar el mismo `operation_id` salvo que un contrato especializado cree explícitamente otro trabajo causal;
7. la versión de asignación es operativa y no modifica por sí sola `contract_version`.

---

#### 7. Regla canónica de compatibilidad del destino

Un candidato solo puede ser seleccionado cuando satisface simultáneamente los criterios aplicables:

```text
MISMO SERVICIO O SERVICIO DE DESTINO DECLARADO
+
AMBIENTE COMPATIBLE
+
CONTRATO Y VERSIÓN SOPORTADOS
+
OPERATION_TYPE SOPORTADO
+
CAPACIDAD TÉCNICA REQUERIDA
+
RESOURCE / TENANT / SITE / DEVICE / PROVIDER SCOPE COMPATIBLE
+
VENTANA TEMPORAL AÚN VÁLIDA
```

Reglas:

1. conocer el ID de una cola, función, dispositivo o proveedor no hace elegible al candidato;
2. un worker de otro servicio no se usa por conveniencia técnica salvo contrato explícito compatible;
3. un dispositivo debe pertenecer al ambiente, sitio y capacidades aplicables cuando esas dimensiones gobiernen el efecto;
4. un adaptador debe soportar dirección, proveedor, mapping y versión contractual requeridos;
5. la selección no concede acciones fuera del alcance técnico mínimo del target;
6. la ausencia de un candidato compatible no autoriza fallback silencioso a otro ambiente, dispositivo, proveedor o principal amplio;
7. la forma de representar el estado de espera o bloqueo pertenece a `QUEUE-ARC-010`;
8. la recuperación ante indisponibilidad o agotamiento se gobierna por `QUEUE-ARC-006` y `QUEUE-ARC-008` según corresponda.

---

#### 8. Asignación a `WORKER`

Un worker es elegible únicamente cuando su identidad técnica corresponde al servicio y ambiente de la operación y declara la capacidad requerida.

Reglas:

1. el worker recibe el `operation_id` existente; no genera otra intención;
2. el worker no sustituye `caller_application`, `business_owner_application`, actor, recurso ni causa;
3. un token delegado de usuario no se convierte en credencial persistente del worker;
4. la asignación puede referir una clase o pool de worker compatible y resolverse a una identidad concreta antes de ejecutar, sin convertir el pool en propietario;
5. cambiar de worker por disponibilidad conserva la misma operación y deja una nueva versión de asignación;
6. un worker no puede asumir trabajo de otra operación únicamente porque comparta función SQL, runtime o Edge Function;
7. un scheduler puede originar una ocurrencia, pero no se convierte por ello en el worker de la operación;
8. una función SQL o Edge Function observada actualmente es evidencia de ejecución existente, no acreditación de que exista el worker transversal objetivo.

---

#### 9. Asignación a `DEVICE`

Un dispositivo o periférico puede participar cuando el trabajo requiere custodia local, disponibilidad del equipo o un efecto físico.

Reglas:

1. el dispositivo conserva una identidad técnica separada del usuario y de la aplicación;
2. la selección debe respetar ambiente, sede, enrolamiento y capacidades requeridas cuando apliquen;
3. el dispositivo no adquiere propiedad empresarial del hecho que custodia o ejecuta;
4. reinicio, desconexión o cierre de la aplicación no prueban que el trabajo haya terminado;
5. asignar un dispositivo no demuestra resultado físico;
6. si el dispositivo concreto forma parte material de la intención, su identidad debe existir ya en el contrato o huella lógica y no puede cambiarse silenciosamente;
7. si el dispositivo es puramente técnico y sustituible, una reasignación compatible conserva la misma intención y queda registrada;
8. la indisponibilidad del dispositivo no amplía `deadline_at`;
9. un dispositivo no puede usar una credencial administrativa general como sustituto de enrolamiento y alcance mínimo.

---

#### 10. Asignación a `ADAPTER`

Un adaptador es la frontera técnica que traduce o transporta entre contratos, proveedores o mecanismos sin apropiarse del proceso empresarial.

Reglas:

1. el adaptador conserva `operation_id`, correlación, causalidad y versión de origen;
2. debe declarar proveedor o frontera técnica, dirección, versión y mapping compatibles;
3. no puede inventar campos autoritativos ausentes en la fuente;
4. no puede convertir un ACK de transporte en resultado empresarial;
5. la credencial del proveedor permanece separada de la identidad del adaptador y del trabajo;
6. un proveedor externo no se convierte en aplicación VENTO ni en propietario del proceso;
7. cambiar de adaptador compatible no cambia la intención salvo que proveedor o destino formen parte material del contrato;
8. `pg_net` y un request HTTP son mecanismos de transporte y no deciden por sí mismos el destino empresarial;
9. el replay o deduplicación de proveedor conserva las reglas de idempotencia ya aprobadas y no se redefine aquí.

---

#### 11. Rutas técnicas compuestas

Se admiten rutas compuestas solo cuando cada etapa tiene responsabilidad distinta y necesaria.

Patrones materializados por esta tarea:

```text
WORKER
DEVICE → WORKER
WORKER → DEVICE
ADAPTER → WORKER
```

Semántica:

- `WORKER`: una etapa servidora o técnica ejecuta la operación;
- `DEVICE → WORKER`: el dispositivo captura o custodia una intención y el worker servidor conserva la decisión autoritativa del efecto;
- `WORKER → DEVICE`: un worker prepara o coordina un efecto que debe ejecutarse en un dispositivo o periférico identificado;
- `ADAPTER → WORKER`: un adaptador valida/mapea una entrada externa y un worker interno procesa la consecuencia bajo autoridad VENTO.

Reglas:

1. la flecha indica handoff técnico, no transferencia de ownership;
2. cada etapa conserva la identidad del trabajo y su causalidad;
3. un transporte intermedio no se materializa como etapa de negocio por el solo hecho de mover bytes;
4. una ruta compuesta no permite saltar validación contractual, temporal o de scope;
5. la decisión de claim concurrente para cada etapa se cierra en `QUEUE-ARC-009`.

---

#### 12. Regla de selección y asignación

La selección lógica de destino deberá seguir este orden:

1. resolver `operation_id`, servicio, contrato, versión y operación;
2. confirmar que el trabajo sigue dentro de su ventana temporal de `QUEUE-ARC-004`;
3. derivar la ruta técnica y capacidades requeridas desde el contrato, sin inventarlas desde infraestructura disponible;
4. filtrar candidatos por ambiente, servicio, versión, operación y scopes aplicables;
5. excluir targets incompatibles, suspendidos o ajenos al ámbito de la operación cuando esa condición sea conocida;
6. seleccionar un target compatible según la política técnica del servicio;
7. materializar `assignment_id`, `assignment_version`, `target_identity`, `assigned_at` y motivo;
8. conservar el descriptor para que el claim posterior pueda operar sobre una decisión reconstruible.

No se define aquí un algoritmo de balanceo físico, round-robin, least-loaded, afinidad de infraestructura ni mecanismo de descubrimiento. Esas decisiones se materializan dentro del paquete de implementación que adopte este contrato sin cambiar su semántica.

---

#### 13. Reasignación y estabilidad

Una reasignación está permitida cuando el destino anterior deja de ser compatible o utilizable y el contrato admite sustitución técnica.

Reglas:

1. se conserva `operation_id`, clave idempotente, huella, contrato y referencia empresarial;
2. se crea una nueva `assignment_version` y no se sobrescribe la asignación anterior;
3. la reasignación no amplía `deadline_at` ni aumenta prioridad;
4. la reasignación no concede permiso adicional;
5. un cambio de target material para la intención no se trata como simple reasignación; exige la semántica contractual e idempotente correspondiente;
6. la reasignación no decide por sí misma si existe un nuevo intento; esa frontera pertenece a `QUEUE-ARC-006`;
7. la reasignación no autoriza dos ejecutores simultáneos; la exclusión efectiva pertenece a `QUEUE-ARC-009`;
8. la reasignación forzada por operador requiere la autoridad que defina `QUEUE-ARC-012`;
9. la recuperación de una unidad aislada o fallida conserva además las reglas de `QUEUE-ARC-008`.

---

#### 14. Relación con programación, prioridad y vencimiento

La asignación consume y no reescribe la política temporal.

Por tanto:

- `priority_class` puede influir en qué trabajo se selecciona antes, pero no en qué identidad técnica está autorizada;
- un target no puede iniciar antes de `scheduled_at`;
- un target no puede obtener una nueva ventana por ser lento, remoto u offline;
- si `now_utc >= deadline_at`, no se crea una asignación ordinaria para iniciar otro intento;
- una reasignación conserva el deadline original;
- un scheduler identifica la ocurrencia, pero el worker, dispositivo o adaptador se asigna por esta política de routing;
- la asignación no resuelve el solapamiento empresarial entre `QAI-001` y `QAI-004`; esa exclusión permanece en `QUEUE-ARC-009`.

---

#### 15. Relación con idempotencia

La asignación es parte de la proyección operativa mutable.

Reglas:

1. cambiar un worker dinámico no cambia `idempotency_key`;
2. cambiar un dispositivo sustituible no cambia `idempotency_key`;
3. cambiar un adaptador técnicamente equivalente no cambia `idempotency_key`;
4. `assignment_id` nunca sustituye `operation_id` ni `idempotency_key`;
5. si proveedor, dispositivo, destinatario o destino concreto alteran materialmente el efecto empresarial, deben formar parte de la intención y de su huella antes de asignar;
6. una reasignación técnica no permite modificar payload para adaptarlo al target;
7. un target incompatible no se vuelve compatible mediante una nueva clave creada por el worker.

---

#### 16. Matriz materializada de asignación de las 19 identidades `QAI-*`

| ID        | Clasificación                  | Ruta canónica         | Destino técnico principal                                | Regla de asignación                                                                                                                                                              | Estado y decisión documental                                                                                                                 |
| --------- | ------------------------------ | --------------------- | -------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| `QAI-001` | `APLICA_ASIGNACION_DE_TRABAJO` | `WORKER`              | worker del servicio de cierre de asistencia              | la ocurrencia se asigna a capacidad servidora compatible; `pg_cron` origina el fire pero no adquiere ownership ni sustituye la identidad del worker                              | `ESPECIFICADO`; compartir función con `QAI-004` no fusiona asignaciones ni resuelve concurrencia                                             |
| `QAI-002` | `APLICA_ASIGNACION_DE_TRABAJO` | `WORKER`              | worker compatible con procesamiento de runtime de turnos | cron y SQL originan/encaminan; `pg_net` transporta; la etapa ejecutora conserva el mismo `operation_id`                                                                          | `ESPECIFICADO`; la cadena multi-etapa no convierte IDs de transporte en destino de trabajo                                                   |
| `QAI-003` | `APLICA_ASIGNACION_DE_TRABAJO` | `WORKER`              | worker de corrección de asistencia stale                 | la capacidad correctiva debe quedar separada del cierre ordinario y conservar recurso, contexto y operación                                                                      | `ESPECIFICADO`; compartir dominio no autoriza intercambio de operación                                                                       |
| `QAI-004` | `APLICA_ASIGNACION_DE_TRABAJO` | `WORKER`              | worker compatible con cierre de asistencia               | conserva asignación propia mientras el schedule transicional exista; usar la misma función que `QAI-001` no convierte ambos trabajos en una unidad                               | `ESPECIFICADO`; coexistencia y exclusión permanecen fuera de esta tarea                                                                      |
| `QAI-005` | `APLICA_ASIGNACION_DE_TRABAJO` | `WORKER`              | worker de alertas documentales                           | `pg_net` conserva transporte; la función ejecutora recibe identidad, contrato y scope sin heredar la credencial del scheduler                                                    | `ESPECIFICADO`; material sensible actual no forma parte del descriptor de asignación                                                         |
| `QAI-006` | `APLICA_ASIGNACION_DE_TRABAJO` | `WORKER`              | worker de mantenimiento de cotizaciones                  | el trabajo de limpieza solo puede dirigirse a una capacidad compatible con su operación y ámbito PASS                                                                            | `ESPECIFICADO`; mantenimiento técnico no adquiere autoridad para decidir entrega                                                             |
| `QAI-007` | `APLICA_ASIGNACION_DE_TRABAJO` | `WORKER`              | worker de reconciliación de expiraciones                 | el worker procesa la ocurrencia y preserva identidades empresariales de cada checkout afectado                                                                                   | `ESPECIFICADO`; la asignación batch no convierte los efectos hijos en una sola entidad                                                       |
| `QAI-008` | `APLICA_ASIGNACION_DE_TRABAJO` | `WORKER`              | worker de purga de borradores                            | si la definición llega a desplegarse, la ocurrencia deberá asignarse a capacidad de purga compatible; esta tarea no activa ni acredita ese target                                | `PENDIENTE_DE_EVIDENCIA`; el insumo faltante es evidencia de despliegue y operación, a planificar en `DELIV-PKG-001` antes de implementación |
| `QAI-009` | `APLICA_ASIGNACION_DE_TRABAJO` | `WORKER`              | worker de procesamiento de eliminaciones de cuenta       | GitHub Actions actúa como scheduler; la ejecución autoritativa se dirige al worker del servicio sin convertir el workflow en worker ni propietario                               | `ESPECIFICADO`; la frontera entre repositorios conserva `operation_id`, causa y resultado                                                    |
| `QAI-010` | `PROPAGA_NO_DECIDE_ASIGNACION` | `UPSTREAM_PROPAGATED` | target upstream                                          | `net.http_request_queue` mueve la solicitud al destino ya resuelto por el trabajo; su request ID no genera otra asignación empresarial                                           | `ESPECIFICADO`; `pg_net` es transporte administrado y no autoridad de routing empresarial                                                    |
| `QAI-011` | `APLICA_ASIGNACION_DE_TRABAJO` | `DEVICE → WORKER`     | dispositivo ANIMA que custodia → worker servidor         | la intención offline queda vinculada al dispositivo que la custodia y posteriormente al worker servidor que decide/aplica el efecto bajo contrato                                | `ESPECIFICADO`; SecureStore conserva trabajo local, no propiedad del hecho                                                                   |
| `QAI-012` | `APLICA_ASIGNACION_DE_TRABAJO` | `DEVICE → WORKER`     | dispositivo ANIMA que custodia → worker servidor         | la cola de descanso conserva identidad y routing propios; compartir dispositivo o worker con asistencia no mezcla operaciones                                                    | `ESPECIFICADO`; cualquier orden o exclusión cruzada pertenece a `QUEUE-ARC-009`                                                              |
| `QAI-013` | `PROPAGA_NO_DECIDE_ASIGNACION` | `UPSTREAM_PROPAGATED` | asignaciones de `QAI-011` y `QAI-012`                    | el loop móvil es un ejecutor técnico actual de pendientes y consume la asignación existente; cada tick no crea un trabajo ni una decisión de routing nueva                       | `ESPECIFICADO`; su disponibilidad y retry se gobiernan en `QUEUE-ARC-006` sin convertir el intervalo en identidad                            |
| `QAI-014` | `APLICA_ASIGNACION_DE_TRABAJO` | `DEVICE → WORKER`     | dispositivo móvil → worker servidor de asistencia        | el callback del SO se vincula al dispositivo/contexto que lo originó; el servidor conserva la decisión final del cierre y no delega ownership al dispositivo                     | `ESPECIFICADO`; ubicación y dispositivo son contexto, no prueba automática del efecto                                                        |
| `QAI-015` | `APLICA_ASIGNACION_DE_TRABAJO` | `WORKER → DEVICE`     | worker de impresión → impresora/periférico enrolado      | la intención se enruta primero por capacidad de impresión y después al dispositivo compatible; BrowserPrint/localStorage actuales no acreditan identidad de dispositivo objetivo | `ESPECIFICADO`; la adopción física y enrolamiento se planifican en `DELIV-PKG-001` sin declarar cumplimiento actual                          |
| `QAI-016` | `NO_APLICA`                    | `NO_APLICA`           | `NO_APLICA`                                              | refresco recurrente de lectura sin trabajo durable ni efecto empresarial                                                                                                         | `NO_APLICA`; no se fuerza al contrato de asignación                                                                                          |
| `QAI-017` | `APLICA_ASIGNACION_DE_TRABAJO` | `WORKER`              | worker de notificación derivada de mensaje de soporte    | el trigger origina el efecto derivado y `pg_net` lo transporta; el worker procesa la notificación sin convertirla en fuente del mensaje                                          | `ESPECIFICADO`; el mensaje original conserva ownership y la entrega mantiene resultado separado                                              |
| `QAI-018` | `APLICA_ASIGNACION_DE_TRABAJO` | `ADAPTER → WORKER`    | adaptador Wompi → worker interno de procesamiento        | el adaptador valida/mapea el evento de proveedor y lo entrega a capacidad interna; Wompi no recibe autoridad sobre la venta ni sobre otros recursos                              | `ESPECIFICADO`; la protección de replay observada no se reinterpreta como cumplimiento transversal completo                                  |
| `QAI-019` | `APLICA_ASIGNACION_DE_TRABAJO` | `ADAPTER → WORKER`    | adaptador RevenueCat → worker interno de procesamiento   | el adaptador conserva proveedor, evento, mapping y contrato; el worker interno aplica la consecuencia bajo propiedad PASS/CLUB                                                   | `ESPECIFICADO`; la brecha de replay ya identificada permanece bajo `QUEUE-ARC-006` y `QUEUE-ARC-009` y no se oculta mediante routing         |

Resultado de reconciliación:

```text
19 IDENTIDADES ESPERADAS
19 IDENTIDADES MATERIALIZADAS
16 APLICAN ASIGNACIÓN DE TRABAJO
2 PROPAGAN Y NO DECIDEN ASIGNACIÓN
1 NO APLICA
0 FALTANTES
0 DUPLICADOS

DISTRIBUCIÓN DE RUTAS ENTRE LAS 16 APLICABLES
WORKER            = 10
DEVICE → WORKER   = 3
WORKER → DEVICE   = 1
ADAPTER → WORKER  = 2
```

---

#### 17. Reconciliación con activos actuales

##### 17.1. `pg_cron`, GitHub Actions y schedulers

Los schedulers actuales pueden originar ocurrencias, pero no se adoptan como workers por inferencia.

- `QAI-001..QAI-008` separan schedule de capacidad ejecutora;
- `QAI-009` separa el workflow de GitHub Actions del worker de eliminación;
- una credencial o secreto de cron no se transporta al descriptor empresarial de asignación;
- la asignación conserva el ambiente y contrato del trabajo, no el repositorio donde vive el scheduler.

##### 17.2. `pg_net`

`QAI-010` permanece como transporte técnico. `pg_net` puede trasladar una invocación a un target resuelto, pero no decide por sí solo ownership, prioridad, deadline, worker empresarial ni resultado.

##### 17.3. ANIMA offline y background

`QAI-011`, `QAI-012` y `QAI-014` usan una ruta objetivo `DEVICE → WORKER`. El dispositivo conserva custodia y contexto local; la decisión autoritativa del efecto permanece en la frontera servidora. `QAI-013` procesa localmente pendientes existentes y no crea otro routing cada quince segundos.

##### 17.4. Impresión NEXO

`QAI-015` usa una ruta objetivo `WORKER → DEVICE`. La implementación actual `localStorage` + BrowserPrint se conserva como evidencia funcional, pero no se presenta como cumplimiento de identidad, enrolamiento, worker transversal o resultado físico. La transición física deberá quedar incorporada al paquete de implementación correspondiente a partir de `DELIV-PKG-001`.

##### 17.5. Webhooks externos

`QAI-018` y `QAI-019` usan `ADAPTER → WORKER`. El proveedor aporta el evento y autenticidad técnica; el adaptador valida y mapea; la capacidad interna conserva la propiedad de la consecuencia empresarial. Una credencial de proveedor nunca sustituye la identidad del adaptador ni del worker.

---

#### 18. Handoff exacto a `QUEUE-ARC-006..012`

| Tarea                                                                             | Responsabilidad reservada recibida desde esta tarea                                                                                                                                |
| --------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `QUEUE-ARC-006 — Definir reintentos, backoff y límite máximo`                     | decidir cuándo una indisponibilidad o fallo de target produce un nuevo intento, con qué presupuesto y backoff, conservando la operación y la asignación histórica                  |
| `QUEUE-ARC-007 — Definir cancelación antes y durante ejecución`                   | invalidar o detener la ejecución del mismo trabajo sin confundir la solicitud de cancelación con una reasignación                                                                  |
| `QUEUE-ARC-008 — Definir cola de fallos y recuperación manual`                    | permitir recuperación controlada y eventual reasignación sin borrar historial ni extender silenciosamente la intención original                                                    |
| `QUEUE-ARC-009 — Definir bloqueo de duplicados y concurrencia`                    | aplicar claim, lease, fencing y exclusión sobre trabajo elegible/asignado y evitar que dos targets cierren simultáneamente la misma versión                                        |
| `QUEUE-ARC-010 — Definir estados y eventos canónicos`                             | representar asignación, reasignación, espera de target, inicio, resultado y cambios de routing mediante estados/eventos canónicos sin redefinir el contrato de asignación          |
| `QUEUE-ARC-011 — Definir métricas de espera, ejecución y error`                   | medir latencia de asignación, reasignaciones, disponibilidad por clase de target y errores de routing sin convertir telemetría en identidad                                        |
| `QUEUE-ARC-012 — Definir autorización para crear, cancelar y reintentar trabajos` | definir quién puede forzar o cambiar destino cuando exista elección manual y quién puede actuar sobre el trabajo sin convertir credencial técnica o posesión del target en permiso |

Ninguna de esas responsabilidades se desarrolla en esta tarea.

---

#### 19. Prohibiciones

Esta tarea no autoriza:

1. crear tablas, columnas, índices, constraints, funciones, triggers o RPC de asignación;
2. aprovisionar principals, credenciales, tokens, certificados o secretos;
3. enrolar dispositivos o impresoras;
4. desplegar workers o adaptadores;
5. modificar Edge Functions, GitHub Actions, `pg_cron`, `pg_net`, TaskManager, SecureStore, localStorage o BrowserPrint;
6. activar `QAI-008`;
7. retirar `QAI-004`;
8. modificar prioridad, `scheduled_at` o `deadline_at`;
9. definir `attempt_id`, backoff, presupuesto o agotamiento de retry;
10. definir cancelación;
11. crear dead-letter o recuperación manual física;
12. definir claim, lease, fencing o locks;
13. cerrar estados, eventos, métricas o SLOs;
14. conceder autorización empresarial a un worker, dispositivo, scheduler, adaptador o proveedor;
15. presentar una identidad objetivo como aprovisionada o validada operativamente;
16. iniciar o desarrollar `QUEUE-ARC-006`.

---

#### 20. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea especializa para el inventario de colas reglas de identidad técnica, mínimo privilegio, trazabilidad de destino, handoff, idempotencia y ejecución asíncrona ya protegidas por la cobertura transversal vigente. La asignación documentada no introduce una obligación verificable independiente de esas invariantes ni cambia alcance, estado, responsable, evidencia o relación de requisitos existentes.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

---

#### 21. Cobertura de prueba existente preservada

Se preserva sin modificación, en especial:

- `TREQ-INTEGRATION-003`, que protege identidad estable, estado durable, claim seguro, no duplicidad, retry controlado, conciliación y recuperación del trabajo asíncrono;
- `TREQ-INTEGRATION-004`, que exige reconstruir causa, payload, principal técnico, recurso, destinatario, intento, resultado, error y efecto final de cadenas asíncronas;
- la cobertura de identidad técnica y mínimo privilegio ya consumida por `TSVC-CAT-005`;
- la cobertura de confiabilidad, worker, dispositivo, proveedor, scheduler, deadline y resultado desconocido ya materializada por `TSVC-CAT-006` y `QUEUE-ARC-004`.

Ninguna fila del registro canónico cambia de identificador, dominio, regla protegida, estado, responsable, evidencia, relación o secuencia por esta tarea.

---

#### 22. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. conserva `QUEUE-ARC-004` como tarea anterior aprobada;
2. conserva `QUEUE-ARC-006` como única tarea siguiente reservada;
3. establece `WORK-ASSIGNMENT-CONTRACT-001@1.0.0` sin crear una fuente de verdad paralela;
4. consume las identidades técnicas aprobadas en `TSVC-CAT-005` sin presentar principals como aprovisionados;
5. distingue asignación de claim, intento, transporte y efecto;
6. define exactamente tres clases de destino técnico: `WORKER`, `DEVICE` y `ADAPTER`;
7. define las cuatro rutas materializadas `WORKER`, `DEVICE → WORKER`, `WORKER → DEVICE` y `ADAPTER → WORKER`;
8. define `assignment_id` y `assignment_version` sin sustituir `operation_id` ni `idempotency_key`;
9. exige compatibilidad de servicio, ambiente, contrato, operación, capacidad y scopes antes de seleccionar target;
10. impide fallback silencioso a otro ambiente, proveedor, dispositivo o principal incompatible;
11. conserva aplicación propietaria, actor, causa y recurso durante la asignación;
12. prohíbe que scheduler, transporte o credencial se conviertan en worker o autorización por inferencia;
13. conserva prioridad, `scheduled_at` y `deadline_at` durante asignación y reasignación;
14. conserva identidad idempotente durante cambios puramente técnicos de target;
15. obliga a tratar un destino material para la intención como parte del contrato/huella y no como reasignación silenciosa;
16. define asignación a worker sin usar el token del usuario como credencial persistente;
17. define asignación a dispositivo sin transferir ownership ni inferir resultado físico;
18. define asignación a adaptador sin convertir proveedor ni ACK en fuente de verdad empresarial;
19. materializa exactamente una decisión para cada `QAI-001..QAI-019`;
20. obtiene 16 `APLICA_ASIGNACION_DE_TRABAJO`, 2 `PROPAGA_NO_DECIDE_ASIGNACION` y 1 `NO_APLICA`;
21. obtiene 10 rutas `WORKER`, 3 `DEVICE → WORKER`, 1 `WORKER → DEVICE` y 2 `ADAPTER → WORKER` entre las 16 aplicables;
22. mantiene 0 identidades faltantes y 0 duplicadas;
23. mantiene `QAI-010` como transporte que propaga y no decide asignación;
24. mantiene `QAI-013` como worker actual que procesa asignaciones upstream y no como trabajo autónomo;
25. mantiene `QAI-016` como `NO_APLICA`;
26. conserva `QAI-008` como `PENDIENTE_DE_EVIDENCIA` sin activar el schedule;
27. no usa asignación para resolver el solapamiento `QAI-001` / `QAI-004`;
28. preserva la brecha de replay de `QAI-019` bajo sus tareas propietarias y no la oculta mediante routing;
29. asigna con exactitud los handoffs `QUEUE-ARC-006..012`;
30. declara cero cambios de requisitos de prueba con justificación concreta;
31. crea cero objetos físicos;
32. modifica cero repositorios, Supabase, cron, colas, workers, dispositivos, adaptadores o webhooks;
33. no inicia ni desarrolla `QUEUE-ARC-006`.

---

#### 23. Resultado de la tarea

`QUEUE-ARC-005` deja establecido el contrato de asignación técnica del trabajo asíncrono:

```text
OPERACIÓN CANÓNICA
        ↓
VENTANA TEMPORAL VÁLIDA
        ↓
CAPACIDADES REQUERIDAS
        ↓
RUTA TÉCNICA
        ↓
TARGET COMPATIBLE
        ↓
ASIGNACIÓN VERSIONADA
        ↓
CLAIM / INTENTO / EJECUCIÓN
SE DEFINEN EN SUS TAREAS PROPIETARIAS
```

Las 19 identidades inventariadas quedan reconciliadas una a una. La asignación preserva ownership, contrato, idempotencia, prioridad y deadline, y separa de forma explícita worker, dispositivo, adaptador, scheduler y transporte.

---

#### 24. Continuidad

ÚLTIMA TAREA APROBADA

`QUEUE-ARC-004 — Definir prioridad, programación y vencimiento`

TAREA ACTUAL APROBADA

`QUEUE-ARC-005 — Definir asignación a trabajador, dispositivo o adaptador`

SIGUIENTE TAREA RESERVADA

`QUEUE-ARC-006 — Definir reintentos, backoff y límite máximo`


### ✅ QUEUE-ARC-006 — Definir reintentos, backoff y límite máximo

**Estado:** APROBADA
**Tarea anterior:** `QUEUE-ARC-005 — Definir asignación a trabajador, dispositivo o adaptador`
**Tarea siguiente:** `QUEUE-ARC-007 — Definir cancelación antes y durante ejecución`
**Tipo de tarea:** documental; especialización canónica de intentos, clasificación de errores, perfiles de reintento, backoff, presupuesto máximo y agotamiento para el trabajo asíncrono inventariado, con decisión explícita para las 19 identidades `QAI-*`, sin modificar colas, workers, schedules, webhooks, dispositivos, código, datos, Supabase ni estados desplegados
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/03_INFRAESTRUCTURA_CANONICA_DE_COLAS.md`
**Línea base documental:** `vento-shell@a1e4369bdd4a1e23fa994d3d737117586df21569`
**Contrato base de trabajo:** `TSVC-SVC-001.CONTRACT@1.0.0`
**Registro de confiabilidad consumido:** `TRANSVERSE-SERVICE-RELIABILITY-REGISTRY-001@1.0.0`
**Contrato de idempotencia consumido:** `WORK-IDEMPOTENCY-CONTRACT-001@1.0.0`
**Contrato temporal consumido:** `WORK-SCHEDULING-POLICY-CONTRACT-001@1.0.0`
**Contrato de asignación consumido:** `WORK-ASSIGNMENT-CONTRACT-001@1.0.0`
**Inventario consumido:** `QUEUE-CURRENT-ASSET-INVENTORY-001` — 19 identidades `QAI-*`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma cerrada cuándo una ejecución fallida o una dependencia temporalmente indisponible puede producir otro intento de la **misma intención**, cuánto debe esperar antes de ese intento, qué límite máximo la detiene y qué condiciones prohíben repetir automáticamente un efecto.

La regla raíz es:

```text
MISMA operation_id
+
MISMA idempotency_key
+
MISMO payload_fingerprint
+
ERROR REINTENTABLE
+
PRESUPUESTO DISPONIBLE
+
DEADLINE VIGENTE
        ↓
NUEVO attempt_id
        ↓
BACKOFF ACOTADO + JITTER
        ↓
SIGUIENTE INTENTO DE LA MISMA INTENCIÓN
```

Un retry no crea otra intención, no reinicia el deadline, no cambia silenciosamente el payload y no autoriza repetir un efecto externo o físico cuyo resultado permanezca desconocido.

---

#### 2. Resultado sustantivo

Se establece `WORK-RETRY-POLICY-CONTRACT-001@1.0.0` como especialización de intentos y reintentos del contrato canónico de trabajo asíncrono.

El resultado material fija:

1. la unidad exacta de `attempt` y su relación con `operation_id`;
2. la diferencia entre fallo reintentable, espera por disponibilidad, resultado ambiguo y agotamiento;
3. la adopción sin renombrar de los seis perfiles `RR0..RR5` ya aprobados transversalmente;
4. el contador de intentos y el significado de `max_attempts`;
5. las secuencias de backoff base ya aprobadas para cada perfil;
6. la regla de jitter acotado sin introducir una segunda taxonomía de retry;
7. el tratamiento de `Retry-After` sin ampliar deadline ni presupuesto;
8. la frontera de edad de la intención, subordinada a `deadline_at` y a cualquier límite propietario más restrictivo;
9. la prohibición de que capas locales, SDK, transportes o workers reinicien o multipliquen el presupuesto de intentos;
10. la conducta ante errores no reintentables y efectos externos o físicos ambiguos;
11. la relación entre retry, reasignación y pérdida de target sin anticipar claim, lease ni fencing;
12. una decisión explícita para las 19 identidades `QAI-*` del inventario aprobado.

Balance:

| Métrica                                    | Resultado |
| ------------------------------------------ | --------: |
| Identidades `QAI-*` esperadas              |    **19** |
| Identidades materializadas                 |    **19** |
| `APLICA_POLITICA_DE_RETRY`                 |    **16** |
| `PROPAGA_NO_DECIDE_RETRY`                  |     **2** |
| `NO_APLICA`                                |     **1** |
| Perfil base `RR2_DURABLE_DELIVERY`         |     **3** |
| Perfil base `RR3_DEVICE_OR_OFFLINE`        |     **4** |
| Perfil base `RR4_SCHEDULED_OCCURRENCE`     |     **9** |
| Identificadores `QAI-*` duplicados         |     **0** |
| Identidades sin decisión                   |     **0** |
| Requisitos de prueba creados o modificados |     **0** |
| Objetos físicos creados o modificados      |     **0** |

Los perfiles `RR0_NO_RETRY`, `RR1_SHORT_TRANSIENT` y `RR5_COALESCING_SIGNAL` permanecen vigentes dentro del registro transversal aunque ninguna de las 16 identidades materiales de este inventario los use como perfil base. `RR0_NO_RETRY` sigue actuando como disposición obligatoria cuando la clase de error prohíbe retry.

---

#### 3. Herencia contractual obligatoria

`WORK-RETRY-POLICY-CONTRACT-001@1.0.0` no crea perfiles paralelos ni sustituye las decisiones aprobadas de confiabilidad.

Hereda obligatoriamente:

- de `TSVC-SVC-001.CONTRACT@1.0.0`, `operation_id`, `WORK_SUBMISSION`, `WORK_OUTCOME`, `WORK_ERROR`, propiedad empresarial y versión contractual;
- de `TRANSVERSE-SERVICE-RELIABILITY-REGISTRY-001@1.0.0`, el modelo `AT_LEAST_ONCE_WITH_IDEMPOTENT_EFFECTS`, los seis perfiles `RR0..RR5`, sus máximos de intentos, secuencias base, clasificación de errores, jitter, `Retry-After`, tratamiento de resultado desconocido y regla de que el deadline prevalece sobre el presupuesto;
- de `WORK-IDEMPOTENCY-CONTRACT-001@1.0.0`, `idempotency_key`, `payload_fingerprint`, `operation_id` y la prohibición de crear otra intención por un retry;
- de `WORK-SCHEDULING-POLICY-CONTRACT-001@1.0.0`, `scheduled_at`, `deadline_at`, vigencia de la intención y la prohibición de ampliar la ventana por espera, reconnect, retry o cambio de worker;
- de `WORK-ASSIGNMENT-CONTRACT-001@1.0.0`, `assignment_id`, `assignment_version`, destino técnico y la regla de que una reasignación no decide por sí sola si existe un nuevo intento;
- de `QUEUE-CURRENT-ASSET-INVENTORY-001`, las 19 identidades materiales y su evidencia actual.

La tarea no modifica los máximos, secuencias o clases ya aprobados por `TSVC-CAT-006`; los aplica al universo `QAI-*` y cierra su semántica operativa como contrato documental.

---

#### 4. Unidad canónica de intento

Un `attempt` es una ejecución concreta de una operación ya registrada.

Se fija:

```text
INTENCIÓN / TRABAJO
operation_id = estable
idempotency_key = estable
payload_fingerprint = estable

INTENTO 1
attempt_id = nuevo
attempt_no = 1

RETRY
attempt_id = nuevo
attempt_no = anterior + 1
operation_id = el mismo
idempotency_key = la misma
payload_fingerprint = la misma
```

Reglas:

1. `attempt_no = 1` corresponde al primer intento real de ejecución.
2. `max_attempts` **incluye** el primer intento.
3. `max_retries = max_attempts - 1`.
4. Esperar conectividad, disponibilidad de dispositivo, capacidad o `next_retry_at` sin iniciar otra llamada o ejecución no consume un intento.
5. Un retry solo existe cuando comienza otra ejecución capaz de producir el efecto técnico, empresarial o físico correspondiente.
6. Un `request_id`, tick de worker, wake-up, polling, callback o claim no constituye por sí solo otro intento.
7. Un intento no puede ocultar múltiples envíos capaces de producir el mismo efecto para eludir el presupuesto canónico.
8. Si una librería, transporte o helper realiza reenvíos internos capaces de producir efecto, esas ejecuciones deberán contabilizarse dentro del presupuesto efectivo de la operación; ninguna capa reinicia el contador.
9. Cambiar worker, dispositivo o adaptador no reinicia `attempt_no`.
10. Un payload corregido, una operación distinta o una intención nueva no se materializan como otro intento del trabajo anterior.

---

#### 5. Sobre mínimo de retry

Toda materialización futura deberá poder conservar, cuando aplique:

```text
operation_id
attempt_id
attempt_no
retry_profile
max_attempts
first_requested_at
attempt_started_at
attempt_finished_at
last_attempt_at
next_retry_at
deadline_at
error_code
error_class
retryable
retry_after_at
assignment_id
assignment_version
worker_identity
device_identity
adapter_identity
result_ref
reconciliation_status
```

Definiciones:

| Campo                   | Regla canónica                                                                                                                 |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| `attempt_id`            | identidad única de una ejecución concreta; nunca sustituye `operation_id` ni `idempotency_key`                                 |
| `attempt_no`            | ordinal monotónico de intentos realmente iniciados para la misma operación                                                     |
| `retry_profile`         | una de las identidades `RR0..RR5` del registro transversal vigente                                                             |
| `max_attempts`          | techo total de intentos, incluido el primero                                                                                   |
| `first_requested_at`    | origen temporal estable para medir edad; no se reescribe por retry o reasignación                                              |
| `last_attempt_at`       | instante del intento más reciente efectivamente iniciado                                                                       |
| `next_retry_at`         | primer instante en que otro intento puede volver a ser elegible; no garantiza que será ejecutado                               |
| `retry_after_at`        | límite inferior derivado de `Retry-After` o equivalente cuando exista; no amplía el deadline                                   |
| `error_class`           | clase canónica que determina si el fallo admite retry directo, espera, conciliación o cierre                                   |
| `retryable`             | proyección derivada de la clase y del contexto; no convierte en transitorio un error que el contrato clasifica como definitivo |
| `reconciliation_status` | referencia a la condición de conciliación cuando el efecto pudo ocurrir y no existe confirmación autoritativa suficiente       |

Los campos de estado exacto y sus transiciones pertenecen a `QUEUE-ARC-010`; esta tarea define únicamente la semántica de retry que esos estados deberán representar.

---

#### 6. Perfiles canónicos heredados

Se adoptan exactamente los perfiles aprobados por el registro de confiabilidad:

| Perfil                     | Uso objetivo                                                                                     | `max_attempts` | Esperas base después del primer fallo            | Disposición al agotar                               |
| -------------------------- | ------------------------------------------------------------------------------------------------ | -------------: | ------------------------------------------------ | --------------------------------------------------- |
| `RR0_NO_RETRY`             | validación, autorización, conflicto, contrato incompatible, rechazo empresarial o señal obsoleta |              1 | no aplica                                        | error terminal                                      |
| `RR1_SHORT_TRANSIENT`      | fallo técnico breve, runtime reiniciado o dependencia interna momentánea                         |              4 | `5 s`, `30 s`, `2 min`                           | aislamiento o terminal según contrato               |
| `RR2_DURABLE_DELIVERY`     | entrega durable, notificación, integración o trabajo que tolera espera                           |              7 | `15 s`, `1 min`, `5 min`, `15 min`, `1 h`, `6 h` | aislamiento y conciliación                          |
| `RR3_DEVICE_OR_OFFLINE`    | dispositivo, periférico, operación offline o conectividad intermitente                           |              6 | `10 s`, `1 min`, `5 min`, `30 min`, `2 h`        | bloqueo o conciliación; sin repetición física ciega |
| `RR4_SCHEDULED_OCCURRENCE` | ejecución de una ocurrencia lógica de schedule                                                   |              4 | `30 s`, `2 min`, `10 min`                        | ocurrencia agotada o conciliación                   |
| `RR5_COALESCING_SIGNAL`    | heartbeat o señal donde una más reciente sustituye la necesidad de reenviar una antigua          |              1 | no aplica                                        | señal vencida u omitida de forma registrada         |

Reglas de aplicación:

1. El perfil base expresa el máximo permitido, no una obligación de consumir todos los intentos.
2. Una aplicación propietaria puede ser **más restrictiva** por operación.
3. Aumentar intentos, ampliar deadline o reclasificar como reintentable una clase previamente no reintentable exige una decisión contractual versionada y evidencia de seguridad.
4. Un error no reintentable detiene la repetición aunque el perfil base conserve presupuesto.
5. Alcanzar el deadline detiene la repetición aunque `attempt_no < max_attempts`.
6. El perfil no concede autorización para ejecutar, cancelar o forzar retry; la autoridad se define en `QUEUE-ARC-012`.

---

#### 7. Clasificación de errores y decisión de retry

La clasificación transversal se aplica sin renombrar:

| Clase                             | Retry directo   | Decisión de `QUEUE-ARC-006`                                                                 |
| --------------------------------- | --------------- | ------------------------------------------------------------------------------------------- |
| `VALIDATION_ERROR`                | no              | no repetir el mismo payload; una corrección es otra intención u operación explícita         |
| `AUTHENTICATION_OR_AUTHORIZATION` | no              | bloquear la ejecución ordinaria; renovar identidad no revive por sí sola el intento fallido |
| `CONTRACT_OR_VERSION_ERROR`       | no              | rechazar; requiere compatibilidad o contrato correcto                                       |
| `IDEMPOTENCY_CONFLICT`            | no              | conservar conflicto; no sobrescribir ni reintentar                                          |
| `BUSINESS_REJECTION`              | no              | devolver decisión propietaria; una solicitud nueva requiere nueva intención                 |
| `TRANSIENT_INTERNAL`              | sí              | aplicar perfil y backoff asignados                                                          |
| `THROTTLED`                       | sí              | respetar `Retry-After`, presupuesto y deadline                                              |
| `DEPENDENCY_UNAVAILABLE`          | sí              | aplicar backoff sin ampliar autoridad ni deadline                                           |
| `LEASE_LOST`                      | sí condicionado | abandonar el intento; otro claim puede continuar la misma intención bajo `QUEUE-ARC-009`    |
| `OFFLINE_OR_DEVICE_UNREACHABLE`   | espera          | esperar disponibilidad; no consumir intento hasta emitir una nueva ejecución                |
| `AMBIGUOUS_EXTERNAL_EFFECT`       | no directo      | conservar `RESULT_UNKNOWN`; consultar o conciliar antes de decidir otra ejecución           |
| `AMBIGUOUS_PHYSICAL_EFFECT`       | no directo      | conservar `RESULT_UNKNOWN`; confirmar o inspeccionar antes de repetir                       |
| `DEADLINE_EXCEEDED`               | no              | no iniciar otro intento ordinario                                                           |
| `POISON_MESSAGE`                  | no              | aislar; no repetir automáticamente un elemento determinísticamente no procesable            |

La disposición física de aislamiento, dead-letter, cuarentena o recuperación manual pertenece a `QUEUE-ARC-008` y no se implementa en esta tarea.

---

#### 8. Regla canónica de backoff

Para un fallo reintentable se utiliza la espera base del perfil correspondiente al `attempt_no` que acaba de fallar.

Ejemplo conceptual:

```text
attempt_no = 1 falla
→ usar primera espera del perfil

attempt_no = 2 falla
→ usar segunda espera del perfil

...

si ya no existe otra espera porque se alcanzó max_attempts
→ no programar otro intento
```

La programación del siguiente intento debe cumplir simultáneamente:

```text
base_delay = espera del perfil para el fallo actual
jittered_delay = base_delay con jitter acotado según política implementada
retry_after_floor = espera mínima de proveedor cuando exista
actual_delay = máximo entre jittered_delay y retry_after_floor aplicable
next_retry_at = failure_observed_at + actual_delay
```

Reglas:

1. Todo backoff aplica jitter acotado, determinista o aleatorio seguro, según la política implementada y versionada.
2. Esta tarea no inventa un porcentaje universal de jitter distinto del registro transversal.
3. La espera nunca se reduce a un loop inmediato.
4. `next_retry_at` debe quedar estrictamente antes del límite temporal de retry aplicable.
5. Si la espera calculada alcanza o supera ese límite, no se programa otro intento ordinario.
6. Un proceso que despierta antes de `next_retry_at` no consume intento ni adelanta la ejecución.
7. Un proceso que despierta después de `next_retry_at` puede intentar únicamente si la operación sigue vigente y conserva presupuesto.
8. El polling del worker no reemplaza la espera contractual: despertar cada cierto intervalo no transforma ese intervalo en backoff del trabajo.

---

#### 9. Presupuesto de intentos y límite de edad

El retry está acotado por **dos fronteras simultáneas**:

```text
PRESUPUESTO DE CONTEO
attempt_no <= max_attempts

PRESUPUESTO TEMPORAL
now_utc < retry_cutoff_at
```

Para esta versión del contrato:

```text
retry_cutoff_at =
  el menor entre:
  - deadline_at de la intención;
  - un límite de edad propietario más restrictivo, cuando el contrato especializado ya lo declare.
```

Reglas:

1. `deadline_at` nunca se extiende por retry, backoff, throttling, reconnect, cambio de worker, reasignación o indisponibilidad de dispositivo.
2. Si no existe otro límite propietario más restrictivo, `deadline_at` es la frontera temporal máxima del retry ordinario.
3. Alcanzar `max_attempts` agota el presupuesto aunque todavía quede tiempo.
4. Alcanzar `retry_cutoff_at` agota el retry ordinario aunque queden intentos numéricos.
5. El presupuesto no se reinicia al reiniciar una aplicación, worker, navegador, dispositivo o proceso.
6. El presupuesto no se reinicia al cambiar `assignment_id` o `assignment_version`.
7. El presupuesto de un batch no autoriza repetir efectos hijos ya confirmados; cada efecto hijo conserva su propia identidad y resultado.
8. Una recuperación extraordinaria posterior al agotamiento pertenece a `QUEUE-ARC-008` y requiere la autoridad que defina `QUEUE-ARC-012`.

---

#### 10. `Retry-After`, throttling y dependencia no disponible

Cuando una dependencia entregue `Retry-After` o una señal equivalente:

1. se interpreta como **límite inferior de espera**, no como ampliación del contrato;
2. no incrementa `max_attempts`;
3. no amplía `deadline_at` ni otro límite de edad más restrictivo;
4. si `retry_after_at >= retry_cutoff_at`, no se inicia otro intento ordinario;
5. si el valor es inválido, se aplica el backoff del perfil y se registra el error técnico correspondiente; no se crea una espera arbitraria infinita;
6. cambiar de worker o adaptador para eludir una restricción legítima de proveedor no está permitido;
7. la aplicación propietaria puede imponer una espera mayor o terminar antes, pero no una política más permisiva sin versionado contractual.

---

#### 11. Resultado ambiguo y prohibición de retry ciego

Un timeout o desconexión **después de que el efecto pudo haber sido aceptado** no se clasifica automáticamente como fallo reintentable.

```text
ENVÍO REALIZADO
+
NO HAY CONFIRMACIÓN AUTORITATIVA
=
RESULT_UNKNOWN
```

Reglas:

1. `AMBIGUOUS_EXTERNAL_EFFECT` no produce retry directo.
2. `AMBIGUOUS_PHYSICAL_EFFECT` no produce retry directo.
3. Se consulta proveedor, dispositivo, receipt, fuente autoritativa o mecanismo de conciliación antes de otra ejecución.
4. Una nueva clave idempotente no se utiliza para ocultar la incertidumbre.
5. Una reimpresión deliberada, una nueva solicitud empresarial o una corrección son intenciones nuevas cuando su contrato así lo define; no son retry del trabajo ambiguo.
6. La recuperación manual y la cola de fallos se cierran en `QUEUE-ARC-008`.
7. El estado y los eventos exactos de incertidumbre, agotamiento o resultado tardío se cierran en `QUEUE-ARC-010`.

---

#### 12. Relación entre retry y reasignación

Retry y reasignación son conceptos distintos.

```text
REASIGNACIÓN
= cambia destino técnico compatible

RETRY
= inicia otra ejecución de la misma operación
```

Reglas:

1. Una reasignación sin ejecución nueva no consume intento.
2. Una nueva ejecución después de reasignar sí recibe otro `attempt_id` y consume presupuesto.
3. Reasignar conserva `operation_id`, idempotencia, huella, prioridad y deadline.
4. La pérdida de un target antes de iniciar ejecución puede causar espera o reasignación sin consumir intento.
5. La pérdida de un target después de iniciar una ejecución capaz de producir efecto conserva ese intento como iniciado; cualquier nueva ejecución deberá respetar la clasificación de resultado y presupuesto.
6. Dos targets no pueden ejecutar simultáneamente la misma versión bajo la excusa de retry; claim, lease, fencing y exclusión pertenecen a `QUEUE-ARC-009`.
7. Una reasignación forzada o retry manual requiere la autorización que defina `QUEUE-ARC-012`.

---

#### 13. Reintentos anidados y presupuesto end-to-end

El presupuesto canónico gobierna la operación completa y no puede multiplicarse por capas.

Queda fijado:

```text
RETRY DE APLICACIÓN
+
RETRY DE WORKER
+
RETRY DE SDK
+
RETRY DE TRANSPORTE
+
RETRY DE DISPOSITIVO
≠
PRESUPUESTOS INDEPENDIENTES ILIMITADOS
```

Reglas:

1. Ninguna capa puede reiniciar `attempt_no` al recibir el mismo `operation_id`.
2. Una llamada capaz de producir el efecto no puede repetirse internamente sin quedar incluida en el presupuesto efectivo de la operación.
3. Un helper local puede encapsular detalle técnico, pero no ocultar ejecuciones adicionales que hagan posible superar `max_attempts`.
4. El worker debe conocer o poder recuperar el presupuesto restante antes de iniciar otra ejecución.
5. Un retry de transporte que solo reanuda una transferencia sin posibilidad de duplicar el efecto deberá demostrar esa semántica en su contrato especializado; no se presume por biblioteca o proveedor.
6. La ausencia de visibilidad sobre cuántos envíos capaces de producir efecto realizó una capa impide declarar conformidad con el contrato de retry.
7. La implementación futura deberá reconciliar cualquier retry legacy anidado antes de declarar el presupuesto end-to-end como validado.

---

#### 14. Matriz materializada de retry de las 19 identidades `QAI-*`

| ID        | Clasificación              | Perfil base                | `max_attempts` | Regla materializada de retry                                                                                                                                                              | Estado y brecha documental                                                                                                                                                  |
| --------- | -------------------------- | -------------------------- | -------------: | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `QAI-001` | `APLICA_POLITICA_DE_RETRY` | `RR4_SCHEDULED_OCCURRENCE` |              4 | la misma ocurrencia puede reintentarse con `30 s`, `2 min`, `10 min` de espera base mientras siga antes de su deadline; el retry no crea otro cierre                                      | `ESPECIFICADO`; el solapamiento con `QAI-004` no se resuelve mediante retry y permanece bajo `QUEUE-ARC-009`                                                                |
| `QAI-002` | `APLICA_POLITICA_DE_RETRY` | `RR4_SCHEDULED_OCCURRENCE` |              4 | el retry de la ocurrencia conserva identidad raíz a través de cron, SQL, transporte y worker; un fallo de entrega hijo puede generar trabajo durable separado bajo su contrato            | `ESPECIFICADO`; el éxito del cron no agota ni acredita el resultado de etapas posteriores                                                                                   |
| `QAI-003` | `APLICA_POLITICA_DE_RETRY` | `RR4_SCHEDULED_OCCURRENCE` |              4 | solo se reintenta la misma ocurrencia correctiva mientras el contexto stale siga vigente y antes del deadline                                                                             | `ESPECIFICADO`; un recurso ya corregido o sustituido no se fuerza mediante retry                                                                                            |
| `QAI-004` | `APLICA_POLITICA_DE_RETRY` | `RR4_SCHEDULED_OCCURRENCE` |              4 | conserva presupuesto propio como schedule transicional; retry no fusiona su ocurrencia con `QAI-001` ni legitima doble autoridad                                                          | `ESPECIFICADO`; coexistencia y exclusión siguen bajo `TSVC-CAT-010` y `QUEUE-ARC-009`                                                                                       |
| `QAI-005` | `APLICA_POLITICA_DE_RETRY` | `RR4_SCHEDULED_OCCURRENCE` |              4 | la ocurrencia diaria usa el perfil de schedule; entregas de notificación hijas que se materialicen como trabajos separados usan su política especializada, no reinician este batch        | `ESPECIFICADO`; `pg_net` no crea presupuesto adicional y la credencial del cron no altera retry                                                                             |
| `QAI-006` | `APLICA_POLITICA_DE_RETRY` | `RR4_SCHEDULED_OCCURRENCE` |              4 | una ocurrencia de limpieza reintenta solo dentro de su vigencia; el siguiente schedule es otra ocurrencia y no un retry de la anterior                                                    | `ESPECIFICADO`; el coalescing temporal aprobado evita ráfagas de ocurrencias históricas                                                                                     |
| `QAI-007` | `APLICA_POLITICA_DE_RETRY` | `RR4_SCHEDULED_OCCURRENCE` |              4 | la ocurrencia de reconciliación conserva identidad; cada checkout afectado conserva además su identidad propia y un timeout ambiguo no se vuelve fallo definitivo                         | `ESPECIFICADO`; un batch reintentado no autoriza duplicar efectos hijos confirmados                                                                                         |
| `QAI-008` | `APLICA_POLITICA_DE_RETRY` | `RR4_SCHEDULED_OCCURRENCE` |              4 | si llega a desplegarse, la ocurrencia usa el mismo perfil de schedule y queda sujeta a su deadline y misfire                                                                              | `PENDIENTE_DE_EVIDENCIA`; no existe acreditación remota del job; la adopción se recibe en `DELIV-PKG-001`                                                                   |
| `QAI-009` | `APLICA_POLITICA_DE_RETRY` | `RR4_SCHEDULED_OCCURRENCE` |              4 | el workflow programado conserva presupuesto de la ocurrencia batch; cada solicitud de eliminación mantiene identidad y resultado propios                                                  | `ESPECIFICADO`; reejecutar el workflow no autoriza reprocesar solicitudes ya terminadas                                                                                     |
| `QAI-010` | `PROPAGA_NO_DECIDE_RETRY`  | `UPSTREAM_PROPAGATED`      |     `UPSTREAM` | `pg_net` transporta el presupuesto, deadline e identidad del trabajo upstream; cualquier política interna no puede ampliar silenciosamente el número efectivo de envíos                   | `ESPECIFICADO`; la cola técnica no es autoridad para decidir retry empresarial                                                                                              |
| `QAI-011` | `APLICA_POLITICA_DE_RETRY` | `RR3_DEVICE_OR_OFFLINE`    |              6 | la intención offline espera disponibilidad sin consumir intento; cuando ejecuta usa `10 s`, `1 min`, `5 min`, `30 min`, `2 h` de espera base con jitter y deadline                        | `ESPECIFICADO`; el código actual usa política legacy distinta y deberá reconciliarse en la planificación recibida por `DELIV-PKG-001` antes de declarar conformidad         |
| `QAI-012` | `APLICA_POLITICA_DE_RETRY` | `RR3_DEVICE_OR_OFFLINE`    |              6 | misma política que `QAI-011`, conservando identidad y presupuesto separados para descanso; compartir worker no mezcla contadores                                                          | `ESPECIFICADO`; la implementación local actual no acredita todavía límite end-to-end ni jitter canónico                                                                     |
| `QAI-013` | `PROPAGA_NO_DECIDE_RETRY`  | `UPSTREAM_PROPAGATED`      |     `UPSTREAM` | el worker periódico consume `next_retry_at` y presupuesto de `QAI-011`/`QAI-012`; su tick de `15000 ms` no es otro intento ni perfil de backoff                                           | `ESPECIFICADO`; el worker actual no debe reiniciar contadores al despertar                                                                                                  |
| `QAI-014` | `APLICA_POLITICA_DE_RETRY` | `RR3_DEVICE_OR_OFFLINE`    |              6 | indisponibilidad de SO, ubicación o conectividad espera sin consumir ejecución; una nueva llamada efectiva consume intento y conserva la misma intención                                  | `ESPECIFICADO`; un callback repetido no crea cierres nuevos y la demora del SO no amplía deadline                                                                           |
| `QAI-015` | `APLICA_POLITICA_DE_RETRY` | `RR3_DEVICE_OR_OFFLINE`    |              6 | solo se reintenta antes de resultado físico ambiguo; después de aceptación incierta del periférico se concilia antes de otra impresión                                                    | `ESPECIFICADO`; `localStorage` + BrowserPrint actuales no acreditan presupuesto, resultado físico ni conciliación canónica; detalle continúa en `PRINT-ARC-*`               |
| `QAI-016` | `NO_APLICA`                | `NO_APLICA`                |    `NO_APLICA` | refresco de lectura sin trabajo durable ni efecto empresarial                                                                                                                             | `NO_APLICA`; no se fuerza al contrato de retry                                                                                                                              |
| `QAI-017` | `APLICA_POLITICA_DE_RETRY` | `RR2_DURABLE_DELIVERY`     |              7 | la entrega derivada del mensaje usa `15 s`, `1 min`, `5 min`, `15 min`, `1 h`, `6 h` de espera base con jitter; el mensaje fuente no se pierde por agotar entrega                         | `ESPECIFICADO`; trigger y `pg_net` no reinician presupuesto y la recuperación física pertenece a `QUEUE-ARC-008` / `NOTIFY-ARC-*`                                           |
| `QAI-018` | `APLICA_POLITICA_DE_RETRY` | `RR2_DURABLE_DELIVERY`     |              7 | el procesamiento interno del evento Wompi usa entrega durable; un replay del proveedor es repetición de evento fuente, no un nuevo retry interno, y un efecto externo ambiguo se concilia | `ESPECIFICADO`; la protección de evento ya observada no se eleva a certificación end-to-end                                                                                 |
| `QAI-019` | `APLICA_POLITICA_DE_RETRY` | `RR2_DURABLE_DELIVERY`     |              7 | el procesamiento interno usa entrega durable solo bajo identidad estable; replay del proveedor no debe abrir otra intención y resultado ambiguo no admite repetición ciega                | `ESPECIFICADO`; la brecha de reclamación idempotente observada impide declarar conformidad de retry hasta resolver protección de replay y concurrencia bajo `QUEUE-ARC-009` |

Resultado de reconciliación:

```text
19 IDENTIDADES ESPERADAS
19 IDENTIDADES MATERIALIZADAS
16 APLICAN POLÍTICA DE RETRY
2 PROPAGAN Y NO DECIDEN RETRY
1 NO APLICA
0 FALTANTES
0 DUPLICADOS

DISTRIBUCIÓN DE PERFIL BASE ENTRE LAS 16 APLICABLES
RR2_DURABLE_DELIVERY     = 3
RR3_DEVICE_OR_OFFLINE    = 4
RR4_SCHEDULED_OCCURRENCE = 9
```

---

#### 15. Reconciliación con retry actual de ANIMA

El código vigente de ANIMA materializa dos niveles distintos de retry alrededor de asistencia:

1. el helper de escritura directa intenta hasta **3** veces y, para fallos de red, espera de forma lineal `700 ms × attempt` entre envíos;
2. las colas offline de asistencia y descanso conservan `attempts`, `nextRetryAt`, `lastError` y estado local; para errores semejantes a offline calculan un backoff exponencial desde `700 ms`, con tope de `2 min`;
3. el worker de cola se despierta aproximadamente cada `15000 ms` cuando existen pendientes;
4. el flujo observado no presenta en la cola un corte canónico por `max_attempts` ni la política de jitter exigida por el registro transversal;
5. conflicto deja de ser reintentable automáticamente, coherente con la clasificación canónica;
6. el intervalo del worker y el backoff de la intención son dimensiones distintas.

Decisión documental:

```text
IMPLEMENTACIÓN ACTUAL ANIMA
= EVIDENCIA DE RETRY LEGACY / PARCIAL

CONTRATO OBJETIVO QAI-011 / QAI-012
= RR3_DEVICE_OR_OFFLINE
= max_attempts 6
= secuencia base 10 s / 1 min / 5 min / 30 min / 2 h
= jitter acotado
= deadline vigente
= cero reinicio de presupuesto entre capas
```

Esta tarea no modifica ANIMA. La reconciliación de código, pruebas, almacenamiento de presupuesto y migración de la política se recibe en la planificación de implementación a partir de `DELIV-PKG-001`, preservando `QUEUE-ARC-009` para exclusión concurrente y `QUEUE-ARC-010` para estados/eventos.

---

#### 16. Schedules y ocurrencias recurrentes

`QAI-001..QAI-009` usan `RR4_SCHEDULED_OCCURRENCE` como perfil base de la **ocurrencia raíz**.

Reglas:

1. un retry conserva `schedule_occurrence_id`, `logical_fire_at_utc`, `idempotency_key` y `operation_id`;
2. el siguiente fire del schedule es otra ocurrencia y no consume ni repone el presupuesto de la anterior;
3. un misfire recuperable conserva la misma identidad y su propio presupuesto;
4. una ejecución manual adicional deliberada es otra intención; una ejecución manual que recupera la misma ocurrencia conserva identidad y presupuesto restante;
5. `COALESCE_TO_LATEST_VALID` no crea una ráfaga de retries de ocurrencias antiguas;
6. `RUN_ONCE_IF_STILL_VALID` permite la recuperación únicamente mientras exista vigencia y presupuesto;
7. el solapamiento `QAI-001` / `QAI-004` no se resuelve por consumir retries; su exclusión permanece en `QUEUE-ARC-009`.

Los trabajos hijos que una ocurrencia origine pueden tener contrato y perfil propios. El presupuesto del contenedor nunca reemplaza la identidad ni el presupuesto del efecto hijo.

---

#### 17. Dispositivos, impresión y trabajo offline

Para `RR3_DEVICE_OR_OFFLINE`:

1. indisponibilidad del dispositivo o ausencia de conectividad no consume intento mientras no se inicie otra ejecución;
2. reconectar no reinicia `attempt_no` ni `deadline_at`;
3. una nueva ejecución real sí consume intento;
4. si el efecto físico pudo ocurrir y no existe confirmación, se detiene el retry directo y se concilia;
5. una reimpresión autorizada como copia nueva no utiliza el presupuesto de la intención anterior;
6. el dispositivo no decide ampliar intentos ni edad por permanecer offline;
7. la recuperación después de agotamiento pertenece a `QUEUE-ARC-008` y su autoridad a `QUEUE-ARC-012`.

---

#### 18. Transportes, notificaciones y webhooks

Para `RR2_DURABLE_DELIVERY` y transportes propagadores:

1. `QAI-010` no crea un presupuesto independiente del trabajo que transporta;
2. `QAI-017` preserva el mensaje fuente aunque la entrega de notificación agote sus intentos;
3. los replays de `QAI-018` y `QAI-019` se resuelven primero por identidad de evento e idempotencia, no creando una nueva intención por cada entrega del proveedor;
4. el proveedor puede tener su propia política externa de reenvío, pero esa política no aumenta `max_attempts` interno de VENTO;
5. timeout posterior a un posible efecto externo produce `RESULT_UNKNOWN`, no retry ciego;
6. una respuesta `Retry-After` válida solo desplaza el siguiente intento dentro del deadline vigente;
7. la brecha de replay de `QAI-019` permanece explícita y no se declara resuelta por asignarle un perfil documental.

---

#### 19. Handoff exacto a `QUEUE-ARC-007..012`

| Tarea                                                                             | Responsabilidad reservada recibida desde esta tarea                                                                                                                    |
| --------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `QUEUE-ARC-007 — Definir cancelación antes y durante ejecución`                   | decidir cómo una solicitud de cancelación impide intentos futuros o interactúa con un intento en curso, sin confundir cancelación con agotamiento o deadline           |
| `QUEUE-ARC-008 — Definir cola de fallos y recuperación manual`                    | materializar aislamiento, dead-letter, cuarentena, conciliación y recuperación después de agotamiento o error no procesable sin reiniciar silenciosamente la intención |
| `QUEUE-ARC-009 — Definir bloqueo de duplicados y concurrencia`                    | gobernar claim, lease, fencing y exclusión para que retry, reasignación o pérdida de lease no produzcan dos ejecutores válidos simultáneos                             |
| `QUEUE-ARC-010 — Definir estados y eventos canónicos`                             | representar intento iniciado, retry pendiente, agotamiento, resultado ambiguo, fallo, expiración y demás transiciones sin redefinir presupuesto o backoff              |
| `QUEUE-ARC-011 — Definir métricas de espera, ejecución y error`                   | medir intentos, retries, backoff efectivo, agotamientos, edad y distribución de errores sin convertir métricas en política                                             |
| `QUEUE-ARC-012 — Definir autorización para crear, cancelar y reintentar trabajos` | definir quién puede forzar retry, recuperación o cambio de política más restrictiva sin convertir posesión técnica del trabajo en autoridad empresarial                |

Ninguna de esas responsabilidades se desarrolla en esta tarea.

---

#### 20. Prohibiciones

Esta tarea no autoriza:

1. cambiar el retry real de ANIMA, NEXO, PASS o cualquier otra aplicación;
2. modificar `ATTENDANCE_WRITE_MAX_ATTEMPTS`, intervalos, constantes o helpers actuales;
3. crear tablas de intentos, columnas, índices, constraints, funciones, RPC o triggers;
4. crear o modificar dead-letter, cuarentena o recuperación manual;
5. modificar `pg_cron`, `pg_net`, GitHub Actions, Edge Functions, webhooks, TaskManager, SecureStore, localStorage o BrowserPrint;
6. activar `QAI-008`;
7. retirar `QAI-004`;
8. ampliar `deadline_at`;
9. crear otra `idempotency_key` para un retry;
10. repetir automáticamente un efecto externo o físico ambiguo;
11. convertir un error de validación, autorización, contrato, conflicto o rechazo empresarial en transitorio;
12. reiniciar presupuesto por cambio de worker, dispositivo, adaptador, proceso o repositorio;
13. definir cancelación final;
14. definir claim, lease, fencing, locks o exclusión concurrente;
15. cerrar estados, eventos, métricas, SLOs o alertas;
16. conceder autorización para retry manual o recuperación;
17. declarar conformidad operativa de los activos actuales por esta definición documental;
18. iniciar o desarrollar `QUEUE-ARC-007`.

---

#### 21. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea especializa y materializa para el inventario de colas una obligación de confiabilidad ya registrada: clasificación canónica del error, retry únicamente cuando corresponde, backoff con jitter, límite de intentos y edad, respeto de una espera de proveedor sin ampliar deadline, preservación de identidad durante el retry, tratamiento de resultado desconocido y prohibición de efectos duplicados. No introduce una obligación verificable independiente ni cambia alcance, estado, responsable, evidencia o relación de requisitos vigentes.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

---

#### 22. Cobertura de prueba existente preservada

Se preserva sin modificación, en especial:

- `TREQ-INTEGRATION-003`, que ya exige códigos canónicos, backoff con jitter, límites de intentos y edad, `Retry-After`, tratamiento de timeout desconocido, idempotencia, claim, conciliación, cola de fallos y recuperación controlada;
- `TREQ-INTEGRATION-004`, que exige reconstruir cada intento, resultado, error y efecto final sin pérdida silenciosa ni duplicación por retries;
- la cobertura específica vigente de ANIMA, PASS, NEXO, Supabase e integraciones relacionada con trabajo offline, webhooks, colas, dispositivos y reintentos.

Ninguna fila del registro canónico cambia de identificador, dominio, regla protegida, estado, responsable, evidencia, relación o secuencia por esta tarea.

---

#### 23. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. conserva `QUEUE-ARC-005` como tarea anterior aprobada;
2. conserva `QUEUE-ARC-007` como única tarea siguiente reservada;
3. establece `WORK-RETRY-POLICY-CONTRACT-001@1.0.0` sin crear perfiles paralelos;
4. adopta exactamente `RR0_NO_RETRY`, `RR1_SHORT_TRANSIENT`, `RR2_DURABLE_DELIVERY`, `RR3_DEVICE_OR_OFFLINE`, `RR4_SCHEDULED_OCCURRENCE` y `RR5_COALESCING_SIGNAL`;
5. conserva sus máximos y secuencias base aprobados;
6. define `attempt_id` como ejecución concreta y `attempt_no` como ordinal monotónico;
7. define que `max_attempts` incluye el primer intento;
8. conserva `operation_id`, `idempotency_key`, payload y huella entre retries;
9. impide reiniciar presupuesto por reasignación, reconnect, restart o cambio de capa;
10. no consume intento por mera espera offline o de disponibilidad antes de una nueva ejecución;
11. obliga a que cualquier ejecución capaz de producir efecto quede dentro del presupuesto efectivo;
12. prohíbe retries anidados que multipliquen silenciosamente `max_attempts`;
13. aplica jitter acotado a las esperas sin inventar una segunda política transversal;
14. trata `Retry-After` como límite inferior sin ampliar deadline ni intentos;
15. utiliza el menor límite temporal aplicable entre `deadline_at` y cualquier edad propietaria más restrictiva;
16. detiene retry por agotamiento numérico o temporal, lo que ocurra primero;
17. aplica la clasificación canónica de errores sin convertir errores definitivos en transitorios;
18. conserva `RESULT_UNKNOWN` ante efecto externo o físico ambiguo y prohíbe repetición ciega;
19. distingue reasignación de retry;
20. mantiene claim, lease, fencing y exclusión para `QUEUE-ARC-009`;
21. materializa exactamente una decisión para cada `QAI-001..QAI-019`;
22. obtiene 16 `APLICA_POLITICA_DE_RETRY`, 2 `PROPAGA_NO_DECIDE_RETRY` y 1 `NO_APLICA`;
23. obtiene 9 perfiles base `RR4`, 4 perfiles base `RR3` y 3 perfiles base `RR2` entre las 16 identidades aplicables;
24. mantiene 0 identidades faltantes y 0 duplicadas;
25. mantiene `QAI-010` y `QAI-013` como propagadores, no como autoridades de retry;
26. mantiene `QAI-016` como `NO_APLICA`;
27. mantiene `QAI-008` como `PENDIENTE_DE_EVIDENCIA` sin activar su schedule;
28. registra la política actual de retry de ANIMA como evidencia legacy/parcial sin declarar cumplimiento del contrato objetivo;
29. conserva la brecha de replay de `QAI-019` y no la oculta mediante un perfil documental;
30. asigna con exactitud los handoffs `QUEUE-ARC-007..012`;
31. declara cero cambios de requisitos de prueba con justificación concreta;
32. crea cero objetos físicos;
33. modifica cero repositorios, Supabase, cron, colas, workers, dispositivos, adaptadores o webhooks;
34. no inicia ni desarrolla `QUEUE-ARC-007`.

---

#### 24. Resultado de la tarea

`QUEUE-ARC-006` deja establecido el contrato canónico de retry del trabajo asíncrono:

```text
MISMA INTENCIÓN
        ↓
INTENTO IDENTIFICADO
        ↓
ERROR CLASIFICADO
        ↓
¿REINTENTABLE?
        ↓ sí
¿QUEDA PRESUPUESTO?
        ↓ sí
¿SIGUE VIGENTE?
        ↓ sí
BACKOFF DEL PERFIL + JITTER
        ↓
next_retry_at
        ↓
NUEVO attempt_id

SI NO QUEDA PRESUPUESTO
O SE ALCANZA EL DEADLINE
O EL EFECTO ES AMBIGUO
→ NO RETRY CIEGO
→ AISLAMIENTO / CONCILIACIÓN / RESULTADO
  SEGÚN TAREAS PROPIETARIAS
```

Las 19 identidades inventariadas quedan reconciliadas una a una. El retry conserva identidad, contrato, payload, asignación histórica y deadline; ninguna capa técnica puede multiplicar silenciosamente el presupuesto de intentos.

---

#### 25. Continuidad

ÚLTIMA TAREA APROBADA

`QUEUE-ARC-005 — Definir asignación a trabajador, dispositivo o adaptador`

TAREA ACTUAL APROBADA

`QUEUE-ARC-006 — Definir reintentos, backoff y límite máximo`

SIGUIENTE TAREA RESERVADA

`QUEUE-ARC-007 — Definir cancelación antes y durante ejecución`


### ✅ QUEUE-ARC-007 — Definir cancelación antes y durante ejecución

**Estado:** APROBADA
**Tarea anterior:** `QUEUE-ARC-006 — Definir reintentos, backoff y límite máximo`
**Tarea siguiente:** `QUEUE-ARC-008 — Definir cola de fallos y recuperación manual`
**Tipo de tarea:** documental; especialización canónica de solicitud, aceptación y efectividad de cancelación sobre trabajo asíncrono antes y durante ejecución, con frontera de efecto, detención cooperativa, interacción con retry, asignación, trabajo contenedor e hijos y decisión explícita para las 19 identidades `QAI-*`, sin implementar mecanismos físicos de aborto, locks, leases, fencing, estados, métricas ni autorización
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/03_INFRAESTRUCTURA_CANONICA_DE_COLAS.md`
**Línea base documental:** `vento-shell@dbed0056eeb575a820cde7fc83b480b8d006c103`
**Contrato base de trabajo:** `TSVC-SVC-001.CONTRACT@1.0.0`
**Registro de confiabilidad consumido:** `TRANSVERSE-SERVICE-RELIABILITY-REGISTRY-001@1.0.0`
**Contrato de idempotencia consumido:** `WORK-IDEMPOTENCY-CONTRACT-001@1.0.0`
**Contrato temporal consumido:** `WORK-SCHEDULING-POLICY-CONTRACT-001@1.0.0`
**Contrato de asignación consumido:** `WORK-ASSIGNMENT-CONTRACT-001@1.0.0`
**Contrato de retry consumido:** `WORK-RETRY-POLICY-CONTRACT-001@1.0.0`
**Inventario consumido:** `QUEUE-CURRENT-ASSET-INVENTORY-001` — 19 identidades `QAI-*`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma cerrada cómo una operación asíncrona ya aceptada puede recibir una solicitud de cancelación antes de iniciar un efecto o mientras existe una ejecución en curso, sin confundir la intención de cancelar con eliminación de registros, vencimiento, agotamiento de retry, fallo técnico, rollback, compensación empresarial ni certeza de que un efecto externo o físico fue detenido.

La regla raíz es:

```text
OPERACIÓN IDENTIFICADA
+
SOLICITUD DE CANCELACIÓN IDENTIFICABLE
+
AUTORIDAD A VALIDAR POR SU TAREA PROPIETARIA
+
FRONTERA DE EFECTO CONOCIDA
        ↓
DECISIÓN DE CANCELACIÓN RECONSTRUIBLE
        ↓
IMPEDIR NUEVOS EFECTOS ORDINARIOS CUANDO AÚN ES SEGURO
        ↓
DETENER COOPERATIVAMENTE CUANDO EL INTENTO ESTÁ EN CURSO
        ↓
CONCILIAR SI EL EFECTO PUDO OCURRIR Y NO HAY CERTEZA
```

La separación canónica queda fijada así:

```text
SOLICITAR CANCELACIÓN
≠
CANCELACIÓN EFECTIVA
≠
INTERRUMPIR UN PROCESO
≠
DESHACER UN EFECTO
≠
COMPENSAR UN EFECTO
≠
VENCER UNA OPERACIÓN
≠
AGOTAR RETRIES
```

---

#### 2. Resultado sustantivo

Se establece `WORK-CANCELLATION-CONTRACT-001@1.0.0` como especialización de control de cancelación del contrato canónico de trabajo asíncrono.

El resultado material fija:

1. la diferencia entre solicitud de cancelación, aceptación de la solicitud, cancelación efectiva y resultado demasiado tardío;
2. una identidad propia para la solicitud de control sin reutilizar la clave idempotente del trabajo;
3. el sobre mínimo que debe permitir reconstruir quién pidió cancelar, qué operación observó y en qué punto de ejecución se resolvió;
4. cuatro modos cerrados de tratamiento de cancelación para el inventario actual;
5. la conducta antes de iniciar ejecución y durante un intento ya iniciado;
6. la obligación de comprobar cancelación antes de cada frontera capaz de producir un efecto nuevo cuando el trabajo admita detención cooperativa;
7. la interacción entre cancelación, retry pendiente, reasignación y disponibilidad de dispositivo;
8. la regla para efectos externos o físicos ya enviados o potencialmente aceptados;
9. la separación entre cancelación, rollback y compensación;
10. las reglas para trabajos contenedores, trabajos hijos, schedules, colas offline, dispositivos y webhooks;
11. la frontera exacta con concurrencia, estados, métricas y autorización, que permanecen en sus tareas propietarias;
12. una decisión explícita para las 19 identidades `QAI-*` del inventario aprobado.

Balance:

| Métrica                                    | Resultado |
| ------------------------------------------ | --------: |
| Identidades `QAI-*` esperadas              |    **19** |
| Identidades materializadas                 |    **19** |
| `APLICA_CANCELACION_DE_TRABAJO`            |    **16** |
| `PROPAGA_NO_DECIDE_CANCELACION`            |     **2** |
| `NO_APLICA`                                |     **1** |
| Modo `COOPERATIVE_SAFE_POINT`              |    **12** |
| Modo `BEFORE_EFFECT_BOUNDARY_ONLY`         |     **4** |
| Modo `UPSTREAM_PROPAGATED`                 |     **2** |
| Modo `NO_APLICA`                           |     **1** |
| Identificadores `QAI-*` duplicados         |     **0** |
| Identidades sin decisión                   |     **0** |
| Requisitos de prueba creados o modificados |     **0** |
| Objetos físicos creados o modificados      |     **0** |

---

#### 3. Herencia contractual obligatoria

`WORK-CANCELLATION-CONTRACT-001@1.0.0` no crea otra fuente de verdad del trabajo ni modifica la identidad de la intención original.

Hereda obligatoriamente:

- de `TSVC-SVC-001.CONTRACT@1.0.0`, `operation_id`, `WORK_SUBMISSION`, `WORK_OUTCOME`, `WORK_ERROR`, propiedad empresarial, causalidad, resultado autoritativo y versión contractual;
- de `TRANSVERSE-SERVICE-RELIABILITY-REGISTRY-001@1.0.0`, el modelo `AT_LEAST_ONCE_WITH_IDEMPOTENT_EFFECTS`, estado durable, resultado recuperable, tratamiento `RESULT_UNKNOWN` y la regla aprobada que impide efectos tardíos ordinarios de una operación cancelada, vencida o revocada;
- de `WORK-IDEMPOTENCY-CONTRACT-001@1.0.0`, la identidad estable de la intención, su huella y la prohibición de reutilizar la misma clave para una intención materialmente distinta;
- de `WORK-SCHEDULING-POLICY-CONTRACT-001@1.0.0`, `scheduled_at`, `deadline_at`, identidad de ocurrencia y la separación entre cancelación y vencimiento;
- de `WORK-ASSIGNMENT-CONTRACT-001@1.0.0`, `assignment_id`, `assignment_version`, destino técnico y la separación entre asignación, claim, intento y efecto;
- de `WORK-RETRY-POLICY-CONTRACT-001@1.0.0`, `attempt_id`, presupuesto, `next_retry_at`, clasificación de resultado ambiguo y la obligación de impedir nuevos intentos ordinarios cuando el trabajo deja de ser elegible;
- de `QUEUE-CURRENT-ASSET-INVENTORY-001`, las 19 identidades materiales y sus fronteras técnicas actuales.

La tarea no define quién posee autoridad para cancelar. Esa decisión pertenece a `QUEUE-ARC-012`.

---

#### 4. Unidad canónica de cancelación

Una solicitud de cancelación es una **acción de control sobre una operación existente**.

No es una nueva ejecución del trabajo ni una mutación silenciosa del descriptor original.

Se fija:

```text
TRABAJO ORIGINAL
operation_id = estable
idempotency_key = estable
payload_fingerprint = estable

SOLICITUD DE CONTROL
cancellation_request_id = identidad propia
operation_id = referencia al trabajo original
requested_at = instante de solicitud
request_reason = causa declarada
```

Reglas:

1. `cancellation_request_id` identifica una solicitud de control concreta y no sustituye `operation_id`, `idempotency_key`, `attempt_id` ni `assignment_id`.
2. Repetir la misma solicitud de cancelación debe resolver a la misma decisión registrada y no crear acciones de control ilimitadas.
3. Una solicitud de cancelación no cambia el payload, propietario, contrato ni huella de la intención original.
4. La posesión de `operation_id`, `receipt_id`, `idempotency_key`, `attempt_id` o una credencial técnica no demuestra autoridad para cancelar.
5. Una cancelación efectiva impide nuevos efectos ordinarios de la misma operación; no borra su historia ni reutiliza su identidad.
6. Si el trabajo ya tiene un resultado terminal autoritativo, solicitar cancelación no reescribe retroactivamente ese resultado.
7. Si el negocio necesita una reversa o compensación después de un efecto confirmado, esa acción es una operación empresarial distinta, con identidad y causalidad propias.

---

#### 5. Sobre mínimo de cancelación

Toda materialización futura deberá poder conservar, cuando aplique:

```text
operation_id
cancellation_request_id
requested_at
request_reason
requested_by_reference
operation_version_observed
attempt_id_at_request
assignment_version_at_request
cancel_mode
effect_boundary
cancel_observed_at
cancel_effective_at
cancellation_resolution
result_ref
reconciliation_status
```

Definiciones:

| Campo                           | Regla canónica                                                                                                                 |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| `cancellation_request_id`       | identidad única de una solicitud de control; sus repeticiones recuperan la misma resolución                                    |
| `requested_by_reference`        | referencia auditada al solicitante o principal que deberá validarse bajo `QUEUE-ARC-012`; no transporta secretos               |
| `operation_version_observed`    | versión o referencia observable del trabajo al solicitar cancelar; no define por sí sola el mecanismo de exclusión concurrente |
| `attempt_id_at_request`         | intento conocido al momento de la solicitud cuando exista; no supone que el intento siga siendo el vigente                     |
| `assignment_version_at_request` | versión de asignación observada cuando aplique; no autoriza al target a ignorar una cancelación posterior                      |
| `cancel_mode`                   | una de las cuatro decisiones cerradas de esta tarea                                                                            |
| `effect_boundary`               | punto contractual a partir del cual un efecto puede ser irreversible, externo, físico o no detenible con certeza               |
| `cancel_observed_at`            | instante en que el ejecutor o coordinador observa la solicitud de cancelación                                                  |
| `cancel_effective_at`           | instante en que queda garantizado que no se iniciarán nuevos efectos ordinarios de la operación                                |
| `cancellation_resolution`       | resultado semántico de la solicitud; los nombres de estados y eventos persistidos se cierran en `QUEUE-ARC-010`                |
| `reconciliation_status`         | condición consultable cuando la solicitud llegó después de una frontera incierta y debe resolverse contra fuente autoritativa  |

La representación física, constraints, locks, versiones, tokens y transacciones se definirán durante implementación y bajo `QUEUE-ARC-009` cuando correspondan.

---

#### 6. Modos canónicos de cancelación

El vocabulario cerrado inicial es:

| Modo                          | Uso                                                                                                             | Regla principal                                                                                                      |
| ----------------------------- | --------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `COOPERATIVE_SAFE_POINT`      | trabajo servidor, recurrente, local u operativo que puede comprobar control entre etapas o unidades             | acepta cancelación antes del efecto y durante ejecución en puntos seguros; no deshace efectos ya confirmados         |
| `BEFORE_EFFECT_BOUNDARY_ONLY` | operación destructiva, externa o física donde después del envío o commit no existe garantía universal de aborto | garantiza cancelación solo antes de cruzar la frontera; después debe conservar resultado conocido o `RESULT_UNKNOWN` |
| `UPSTREAM_PROPAGATED`         | transporte o worker técnico que procesa una decisión tomada por el trabajo propietario                          | propaga y respeta la resolución upstream; no crea autoridad ni semántica propia de cancelación                       |
| `NO_APLICA`                   | mecanismo sin trabajo durable ni efecto empresarial cancelable en el alcance actual                             | no se fuerza al contrato de cancelación                                                                              |

Reglas:

1. `COOPERATIVE_SAFE_POINT` no promete interrupción instantánea; exige puntos seguros suficientes para impedir nuevos efectos después de observar una cancelación efectiva.
2. `BEFORE_EFFECT_BOUNDARY_ONLY` no convierte un efecto posterior a la frontera en cancelable por nomenclatura.
3. La elección del modo describe capacidad semántica; no acredita que la implementación actual ya la materialice.
4. Un contrato especializado puede ser más restrictivo, pero no puede declarar cancelable un efecto irreversible sin evidencia de un mecanismo seguro.
5. El mecanismo de carrera entre ejecución y cancelación se cierra en `QUEUE-ARC-009`.

##### 6.1. Resoluciones canónicas de la solicitud

El resultado de control utiliza este vocabulario cerrado sin sustituir los estados de operación que definirá `QUEUE-ARC-010`:

| Resolución                               | Significado                                                                                                                      |
| ---------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `REQUEST_ACCEPTED_PENDING_EFFECTIVENESS` | la solicitud válida fue registrada, pero todavía debe ser observada por la ejecución o coordinador antes de garantizar detención |
| `EFFECTIVE_BEFORE_EXECUTION`             | se garantiza que no inició una ejecución capaz de producir el efecto                                                             |
| `EFFECTIVE_AT_SAFE_POINT`                | un intento estaba activo y fue detenido en un punto seguro antes de producir efectos posteriores                                 |
| `TOO_LATE_EFFECT_CONFIRMED`              | el efecto autoritativo ya quedó confirmado antes de que la cancelación pudiera hacerse efectiva                                  |
| `RESULT_UNKNOWN_RECONCILIATION_REQUIRED` | la frontera pudo cruzarse, pero no existe confirmación suficiente para afirmar efecto ni cancelación                             |
| `ALREADY_TERMINAL_NO_CHANGE`             | la operación ya había terminado de forma autoritativa y la solicitud no modifica su resultado                                    |
| `NOT_CANCELLABLE_BY_CONTRACT`            | el contrato especializado no admite cancelación de esa operación o de esa etapa                                                  |

Reglas:

1. Aceptar la solicitud para evaluación no equivale a hacerla efectiva.
2. `REQUEST_ACCEPTED_PENDING_EFFECTIVENESS` no autoriza a presentar el trabajo como cancelado.
3. `EFFECTIVE_BEFORE_EXECUTION` y `EFFECTIVE_AT_SAFE_POINT` impiden efectos ordinarios posteriores de la misma operación.
4. `TOO_LATE_EFFECT_CONFIRMED` conserva el resultado autoritativo y no inicia compensación automática.
5. `RESULT_UNKNOWN_RECONCILIATION_REQUIRED` exige conciliación y prohíbe inferir éxito, fallo o cancelación.
6. `ALREADY_TERMINAL_NO_CHANGE` es idempotente respecto del resultado existente.
7. La autoridad necesaria para aceptar o rechazar la solicitud se define en `QUEUE-ARC-012`; esta tabla no concede permisos.

---

#### 7. Cancelación antes de iniciar ejecución

Cuando una solicitud válida queda efectiva antes de que comience una ejecución capaz de producir efecto:

1. no se inicia un nuevo `attempt_id` ordinario;
2. no se consume presupuesto de retry adicional;
3. un `next_retry_at` pendiente deja de habilitar otra ejecución ordinaria;
4. una reasignación pendiente no autoriza a otro target a iniciar la misma operación;
5. despertar un worker, reconectar un dispositivo o reanudar una aplicación no revive el trabajo;
6. una ocurrencia programada cancelada conserva su identidad e historia; la siguiente ocurrencia del schedule sigue siendo una intención distinta si la definición continúa vigente;
7. cancelar una ocurrencia no desactiva, elimina ni reprograma la definición del schedule;
8. retirar físicamente un elemento de una cola no es suficiente: la decisión debe poder reconstruirse por `operation_id` y solicitud de control;
9. el source record, evento, mensaje, pago, documento o hecho que originó el trabajo no se borra por cancelar su procesamiento asíncrono;
10. la forma exacta en que se representa la terminalidad pertenece a `QUEUE-ARC-010`.

---

#### 8. Cancelación durante ejecución

Un intento ya iniciado se gobierna mediante cancelación cooperativa y una frontera explícita de efecto.

La regla conceptual es:

```text
INTENTO EN CURSO
        ↓
OBSERVAR SOLICITUD DE CANCELACIÓN
        ↓
¿AÚN NO CRUZÓ FRONTERA DE EFECTO?
        ├─ SÍ → detener en punto seguro
        │       → no iniciar efectos posteriores
        │       → conservar historia del intento
        │
        └─ NO → ¿RESULTADO AUTORITATIVO CONOCIDO?
                ├─ SÍ → conservar resultado; cancelación llegó demasiado tarde
                └─ NO → RESULT_UNKNOWN
                        → conciliación
                        → no declarar cancelación efectiva por inferencia
```

Reglas:

1. Un worker debe volver a evaluar control antes de cada frontera capaz de producir un efecto nuevo cuando el modo sea `COOPERATIVE_SAFE_POINT`.
2. Una espera larga, backoff, reanudación, reconexión o reasignación requiere reevaluar cancelación antes de iniciar otra ejecución.
3. Observar la solicitud durante una etapa puramente preparatoria obliga a detener las etapas posteriores que aún no produjeron efecto.
4. Si una etapa atómica ya confirmó el efecto, cancelar no la revierte.
5. Si el efecto pudo haber ocurrido pero el ejecutor perdió confirmación, la resolución es incierta y entra en conciliación.
6. Matar un proceso, cerrar una aplicación o perder conectividad no demuestra cancelación efectiva.
7. La ausencia de un callback de éxito tampoco demuestra que el efecto fue cancelado.
8. Una operación cancelada no puede producir nuevos efectos ordinarios después de que la cancelación haya quedado efectiva.
9. El mecanismo que impide que un worker con visión obsoleta cierre el trabajo pertenece a `QUEUE-ARC-009`.

---

#### 9. Frontera de efecto

Cada operación cancelable deberá identificar conceptualmente la frontera a partir de la cual ya no puede prometerse aborto seguro sin consultar el contrato especializado.

Ejemplos de fronteras válidas según el tipo de trabajo:

- antes de ejecutar una mutación autoritativa de base de datos;
- antes de emitir una llamada a proveedor con potencial de efecto;
- antes de enviar una orden a dispositivo o periférico;
- antes de confirmar una unidad empresarial dentro de un batch;
- antes de crear un trabajo hijo con efecto independiente;
- antes de emitir una notificación o documento cuyo envío constituya un efecto observable.

Reglas:

1. La frontera es semántica, no una línea de código universal.
2. Un ACK de transporte no prueba por sí solo si la frontera empresarial fue cruzada.
3. Una operación con varias etapas puede tener varias fronteras; la cancelación detiene las etapas aún no iniciadas, pero conserva los efectos ya confirmados.
4. Si una capa no puede distinguir si la frontera fue cruzada, no puede declarar cancelación efectiva; debe conservar incertidumbre y conciliar.
5. Diseñar compensación para efectos ya producidos pertenece al contrato empresarial propietario y no se sustituye por este mecanismo de cancelación.

---

#### 10. Cancelación no equivale a rollback ni compensación

Se fija:

```text
CANCELAR
= impedir trabajo o efectos futuros de la misma operación cuando todavía es seguro

ROLLBACK TÉCNICO
= revertir una transacción que aún no fue comprometida según su tecnología

COMPENSAR
= ejecutar una nueva acción empresarial que contrarresta total o parcialmente un efecto ya confirmado
```

Reglas:

1. La cancelación nunca reescribe un `WORK_OUTCOME` autoritativo ya confirmado.
2. Una transacción local que pueda abortarse antes de commit puede formar parte de la detención segura, pero no se generaliza a proveedores ni dispositivos.
3. Una compensación usa su propia identidad, contrato, autorización y causalidad cuando el dominio la permita.
4. Una nueva intención no se disfraza como cancelación para conservar una clave previa.
5. El historial del trabajo original permanece consultable aunque exista compensación posterior.

---

#### 11. Relación con retry

Cancelación y retry se ordenan así:

1. una cancelación efectiva vuelve inelegible cualquier retry ordinario futuro de esa operación;
2. `next_retry_at` no vence ni prevalece sobre una cancelación efectiva;
3. un worker que despierta para retry debe reevaluar cancelación antes de iniciar otro intento;
4. cancelar no devuelve intentos consumidos ni reinicia `max_attempts`;
5. un intento en curso conserva su identidad aunque se detenga cooperativamente;
6. un fallo posterior a una cancelación efectiva no crea otra ventana de retry;
7. `RESULT_UNKNOWN` posterior a una frontera incierta se concilia antes de cualquier decisión adicional;
8. una operación cancelada no se reactiva mediante retry manual; si el negocio necesita ejecutar otra vez el efecto, debe crear una nueva intención causalmente vinculada y autorizada;
9. agotamiento de retry, deadline y cancelación son causas distintas y no se intercambian para obtener otra política.

---

#### 12. Relación con asignación y disponibilidad

1. Cancelar un trabajo no cambia su `assignment_id` histórico ni borra targets anteriores.
2. Una cancelación efectiva impide que una nueva asignación ordinaria se convierta en ejecución.
3. Si el target desaparece antes de la frontera de efecto, puede detenerse sin consumir otra ejecución y la cancelación puede resolverse sin reasignar.
4. Si un dispositivo estaba offline, la cancelación debe sobrevivir a reconexión y ser observada antes de reenviar la intención.
5. Un adaptador no puede ignorar una cancelación efectiva porque conserve una solicitud de transporte pendiente.
6. Ningún target adquiere autoridad para cancelar por estar asignado.
7. La reasignación y la cancelación que compitan sobre la misma operación deben resolverse con el mecanismo de versión, claim, lease, fencing o exclusión que defina `QUEUE-ARC-009`.

---

#### 13. Trabajos contenedores, hijos y propagación

La cancelación de un trabajo contenedor no cancela automáticamente todas las operaciones relacionadas por correlación.

Reglas:

1. El contenedor deja de crear nuevos trabajos hijos después de que la cancelación sea efectiva.
2. Un hijo ya registrado conserva su propio `operation_id`, resultado y control de cancelación.
3. La cancelación de hijos existentes solo se propaga cuando el contrato propietario declare explícitamente ese alcance y el hijo no haya cruzado su frontera de efecto.
4. `correlation_id` por sí solo no constituye alcance de cancelación.
5. En un batch, las unidades ya confirmadas permanecen confirmadas; la cancelación detiene las unidades todavía no iniciadas cuando el contrato lo permita.
6. Cancelar el batch no autoriza repetir ni borrar efectos hijos ya cerrados.
7. Los resultados parciales deben permanecer reconstruibles; su representación de estado y eventos pertenece a `QUEUE-ARC-010`.

---

#### 14. Schedules y ocurrencias recurrentes

Para `QAI-001..QAI-009` se distingue obligatoriamente:

```text
CANCELAR UNA OCURRENCIA
≠
DESACTIVAR EL SCHEDULE
≠
CAMBIAR SU CALENDARIO
≠
CANCELAR FUTURAS OCURRENCIAS
```

Reglas:

1. La cancelación se aplica a la `schedule_occurrence_id` o al trabajo derivado identificado.
2. La definición de schedule conserva `schedule_id` y `schedule_version` sin cambios.
3. La siguiente ocurrencia ordinaria conserva su identidad propia si la definición sigue vigente.
4. Cambiar calendario, vigencia, misfire o desactivar la definición se gobierna por el contrato temporal y la autoridad correspondiente; no se simula mediante cancelación de una sola ocurrencia.
5. Una ejecución manual adicional sigue siendo otra intención según las reglas ya aprobadas.
6. `QAI-001` y `QAI-004` no se resuelven cancelando arbitrariamente uno: la coexistencia y exclusión semántica permanecen en `TSVC-CAT-010` y `QUEUE-ARC-009`.

---

#### 15. Dispositivos, offline e impresión

Para operaciones locales, offline o físicas:

1. una intención cancelada localmente debe conservar una marca o resolución durable suficiente para impedir que reaparezca como trabajo ejecutable después de reinicio o reconexión;
2. eliminar la fila o texto local sin evidencia de control no demuestra que un servidor, dispositivo o proveedor haya observado la cancelación;
3. el dispositivo revalida la decisión antes de enviar una operación pendiente cuando recupere conectividad;
4. si una orden de impresión fue enviada al periférico y no existe confirmación de aborto o de impresión, no se declara cancelada ni fallida por inferencia;
5. una nueva copia deliberada después de una cancelación o resultado ambiguo es una intención distinta cuando el contrato de impresión la autorice;
6. la indisponibilidad del dispositivo no extiende `deadline_at` ni vuelve reversible un efecto ya confirmado;
7. los mecanismos específicos de impresión continúan bajo `PRINT-ARC-*` sin alterar este contrato transversal.

---

#### 16. Webhooks y eventos externos

Una cancelación del procesamiento interno no borra ni niega el evento fuente recibido de un proveedor.

Reglas:

1. `provider_event_id`, firma, payload recibido y evidencia de recepción permanecen como hechos de integración.
2. La cancelación puede detener procesamiento downstream todavía no ejecutado cuando el contrato empresarial lo permita.
3. No se utiliza cancelación para ignorar un hecho autoritativo de pago, suscripción, entitlement u otro estado externo que deba conciliarse.
4. Si el procesamiento ya produjo o pudo producir un efecto externo o empresarial, se conserva el resultado o `RESULT_UNKNOWN` y se concilia.
5. Un replay del proveedor se resuelve por idempotencia y deduplicación; no se interpreta como revocación de una cancelación anterior.
6. La autoridad para cancelar procesamiento derivado y sus límites pertenece a `QUEUE-ARC-012` y al contrato de dominio correspondiente.

---

#### 17. Matriz materializada de cancelación de las 19 identidades `QAI-*`

| ID        | Clasificación                   | Modo                          | Frontera principal                                                    | Regla materializada de cancelación                                                                                                                                         | Estado y brecha documental                                                                                                                                                                                 |
| --------- | ------------------------------- | ----------------------------- | --------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `QAI-001` | `APLICA_CANCELACION_DE_TRABAJO` | `COOPERATIVE_SAFE_POINT`      | antes de aplicar cada cierre autoritativo elegible                    | cancelar la ocurrencia impide nuevos cierres de esa operación; si un cierre ya confirmó efecto, se conserva y no se revierte                                               | `ESPECIFICADO`; la exclusión con `QAI-004` permanece bajo `QUEUE-ARC-009`                                                                                                                                  |
| `QAI-002` | `APLICA_CANCELACION_DE_TRABAJO` | `COOPERATIVE_SAFE_POINT`      | antes de cada etapa o trabajo hijo con efecto                         | la ocurrencia deja de generar etapas nuevas y cada hijo ya registrado conserva control propio; `pg_net` no decide cancelación                                              | `ESPECIFICADO`; la cadena multi-etapa requiere observación de control entre fronteras durante la implementación                                                                                            |
| `QAI-003` | `APLICA_CANCELACION_DE_TRABAJO` | `COOPERATIVE_SAFE_POINT`      | antes de cada corrección de turno stale                               | la ocurrencia cancelada no inicia nuevas correcciones; una corrección ya confirmada permanece como hecho                                                                   | `ESPECIFICADO`; cancelación no sustituye vigencia ni resolución del recurso                                                                                                                                |
| `QAI-004` | `APLICA_CANCELACION_DE_TRABAJO` | `COOPERATIVE_SAFE_POINT`      | antes de aplicar cada cierre bajo el schedule transicional            | conserva identidad propia; cancelar su ocurrencia no desactiva el schedule ni resuelve por sí sola la coexistencia con `QAI-001`                                           | `ESPECIFICADO`; transición legacy sigue bajo `TSVC-CAT-010`                                                                                                                                                |
| `QAI-005` | `APLICA_CANCELACION_DE_TRABAJO` | `COOPERATIVE_SAFE_POINT`      | antes de crear o enviar cada alerta derivada                          | cancelar el ciclo impide nuevas entregas hijas; una notificación ya enviada conserva su resultado y no se borra                                                            | `ESPECIFICADO`; transporte `pg_net` solo propaga la decisión y la entrega especializada continúa bajo `NOTIFY-ARC-*`                                                                                       |
| `QAI-006` | `APLICA_CANCELACION_DE_TRABAJO` | `COOPERATIVE_SAFE_POINT`      | antes de cada mutación de limpieza dentro de la ocurrencia            | detiene unidades aún no procesadas sin restaurar registros ya limpiados válidamente                                                                                        | `ESPECIFICADO`; una reversa empresarial no se inventa como cancelación                                                                                                                                     |
| `QAI-007` | `APLICA_CANCELACION_DE_TRABAJO` | `COOPERATIVE_SAFE_POINT`      | antes de cada reconciliación o efecto hijo sobre checkout             | detiene unidades futuras; resultados de checkout ya confirmados permanecen y cualquier efecto ambiguo entra en conciliación                                                | `ESPECIFICADO`; cancelación del batch no invalida la fuente empresarial de expiración o pago                                                                                                               |
| `QAI-008` | `APLICA_CANCELACION_DE_TRABAJO` | `COOPERATIVE_SAFE_POINT`      | antes de purgar cada borrador elegible                                | si el job se materializa, una ocurrencia cancelada no borra nuevas unidades; esta tarea no activa ni acredita ejecución                                                    | `PENDIENTE_DE_EVIDENCIA`; despliegue y adopción se reciben en `DELIV-PKG-001`                                                                                                                              |
| `QAI-009` | `APLICA_CANCELACION_DE_TRABAJO` | `BEFORE_EFFECT_BOUNDARY_ONLY` | antes de anonimizar datos o eliminar la identidad de cada solicitud   | una solicitud pendiente puede detenerse antes del efecto destructivo; después de anonimización o borrado confirmado no existe rollback por cancelación                     | `ESPECIFICADO`; el worker actual observado pasa de `pending` a `processing` sin una revalidación visible de cancelación antes de ambos efectos destructivos; cierre físico a planificar en `DELIV-PKG-001` |
| `QAI-010` | `PROPAGA_NO_DECIDE_CANCELACION` | `UPSTREAM_PROPAGATED`         | la frontera pertenece al trabajo que originó la solicitud HTTP        | `pg_net` conserva y respeta la decisión upstream cuando el contrato físico lo permita; borrar o retirar un request técnico no sustituye cancelación empresarial            | `ESPECIFICADO`; transporte administrado sin autoridad empresarial                                                                                                                                          |
| `QAI-011` | `APLICA_CANCELACION_DE_TRABAJO` | `COOPERATIVE_SAFE_POINT`      | antes de sincronizar la intención offline contra el servidor          | una cancelación durable debe sobrevivir reinicio y reconexión e impedir que el worker vuelva a enviar la misma intención                                                   | `ESPECIFICADO`; el tipo de cola inspeccionado no materializa un estado de cancelación; adopción física a planificar en `DELIV-PKG-001`                                                                     |
| `QAI-012` | `APLICA_CANCELACION_DE_TRABAJO` | `COOPERATIVE_SAFE_POINT`      | antes de ejecutar la acción de descanso contra el servidor            | misma regla que asistencia, conservando identidad y control separados; compartir worker no mezcla cancelaciones                                                            | `ESPECIFICADO`; el flujo de cola inspeccionado no materializa un checkpoint explícito de cancelación; adopción física a planificar en `DELIV-PKG-001`                                                      |
| `QAI-013` | `PROPAGA_NO_DECIDE_CANCELACION` | `UPSTREAM_PROPAGATED`         | antes de iniciar un intento de `QAI-011` o `QAI-012`                  | el loop móvil debe reevaluar la decisión de cada elemento; el tick no cancela ni revive operaciones                                                                        | `ESPECIFICADO`; worker técnico, no autoridad de cancelación                                                                                                                                                |
| `QAI-014` | `APLICA_CANCELACION_DE_TRABAJO` | `COOPERATIVE_SAFE_POINT`      | antes de convertir el callback en una mutación autoritativa servidora | una señal todavía no aplicada puede detenerse; si el servidor ya confirmó el cierre, la cancelación no lo deshace                                                          | `ESPECIFICADO`; demora del SO o pérdida de conectividad no demuestra cancelación                                                                                                                           |
| `QAI-015` | `APLICA_CANCELACION_DE_TRABAJO` | `BEFORE_EFFECT_BOUNDARY_ONLY` | antes de enviar ZPL al periférico                                     | se puede impedir el envío mientras la intención siga local y no haya cruzado la frontera; post-envío sin confirmación de aborto se conserva como resultado físico incierto | `ESPECIFICADO`; la implementación observada vacía la cola local después de invocar el envío sin acreditar resultado físico durable; detalle y transición continúan en `PRINT-ARC-*` y `DELIV-PKG-001`      |
| `QAI-016` | `NO_APLICA`                     | `NO_APLICA`                   | `NO_APLICA`                                                           | refresco de lectura sin trabajo durable ni efecto empresarial                                                                                                              | `NO_APLICA`; no se fuerza al contrato de cancelación                                                                                                                                                       |
| `QAI-017` | `APLICA_CANCELACION_DE_TRABAJO` | `COOPERATIVE_SAFE_POINT`      | antes de crear o enviar la notificación derivada                      | cancelar la entrega no elimina el `support_message` fuente; cualquier envío ya aceptado conserva resultado o incertidumbre                                                 | `ESPECIFICADO`; trigger y transporte no adquieren autoridad para borrar el mensaje                                                                                                                         |
| `QAI-018` | `APLICA_CANCELACION_DE_TRABAJO` | `BEFORE_EFFECT_BOUNDARY_ONLY` | antes de aplicar la consecuencia interna del evento Wompi             | el evento de proveedor no se cancela; solo puede detenerse procesamiento aún no aplicado, y un efecto ya confirmado o incierto se conserva y concilia                      | `ESPECIFICADO`; la protección de replay observada permanece separada de la posibilidad de cancelar procesamiento                                                                                           |
| `QAI-019` | `APLICA_CANCELACION_DE_TRABAJO` | `BEFORE_EFFECT_BOUNDARY_ONLY` | antes de aplicar suscripción, entitlement o auditoría derivada        | el evento RevenueCat permanece como hecho fuente; la cancelación no oculta replay ni permite ignorar un entitlement que deba reconciliarse                                 | `ESPECIFICADO`; la brecha de replay existente permanece bajo `QUEUE-ARC-009` y no se declara resuelta por este contrato                                                                                    |

Resultado de reconciliación:

```text
19 IDENTIDADES ESPERADAS
19 IDENTIDADES MATERIALIZADAS
16 APLICAN CANCELACIÓN DE TRABAJO
2 PROPAGAN Y NO DECIDEN CANCELACIÓN
1 NO APLICA
0 FALTANTES
0 DUPLICADOS

DISTRIBUCIÓN DE MODOS
COOPERATIVE_SAFE_POINT      = 12
BEFORE_EFFECT_BOUNDARY_ONLY = 4
UPSTREAM_PROPAGATED         = 2
NO_APLICA                   = 1
```

---

#### 18. Reconciliación con implementación actual

##### 18.1. Eliminación programada de cuentas

El esquema vigente de `account_deletion_requests` permite `canceled` y conserva `canceled_at`. El worker programado inspeccionado selecciona solicitudes `pending`, las actualiza a `processing` y después ejecuta anonimización y eliminación de la identidad. En ese flujo inspeccionado no existe una segunda lectura visible de cancelación entre el cambio a `processing` y los dos efectos destructivos.

Decisión documental:

```text
VOCABULARIO DE CANCELACIÓN EN ESQUEMA
= EXISTE PARCIALMENTE

GARANTÍA DE CANCELACIÓN ANTES DEL EFECTO DESTRUCTIVO
= NO ACREDITADA POR EL WORKER INSPECCIONADO
```

La materialización física deberá planificarse en `DELIV-PKG-001`. La resolución segura de carrera entre cancelación, claim y commit pertenece a `QUEUE-ARC-009`; los estados y eventos exactos a `QUEUE-ARC-010`; la autoridad de cancelación a `QUEUE-ARC-012`.

##### 18.2. Colas offline ANIMA

Los tipos y el worker de las colas de asistencia y descanso inspeccionados conservan `pending`, `syncing`, `failed`, `conflict`, intentos y `nextRetryAt`. No se observó en ese recorrido un campo de cancelación ni un checkpoint explícito que impida un envío posterior después de que una decisión de cancelación haya sido registrada en otra frontera.

Decisión documental:

```text
CUSTODIA OFFLINE Y RETRY
= IMPLEMENTADOS

CANCELACIÓN DURABLE TRANSVERSAL
= NO ACREDITADA EN EL RECORRIDO INSPECCIONADO
```

La adopción física se recibe en `DELIV-PKG-001`; esta tarea no modifica ANIMA.

##### 18.3. Impresión local NEXO

La cola local observada usa `localStorage`. `printAll()` invoca el envío por BrowserPrint y vacía total o parcialmente la cola local inmediatamente después de iniciar el envío, mientras la confirmación de BrowserPrint ocurre mediante callbacks separados.

Decisión documental:

```text
RETIRAR EL ELEMENTO DE LA COLA LOCAL
≠
CANCELACIÓN CONFIRMADA
≠
RESULTADO FÍSICO CONFIRMADO
```

Una cancelación post-envío no puede declararse efectiva sin evidencia del periférico o conciliación. La arquitectura específica permanece en `PRINT-ARC-*` y su adopción física se recibe en `DELIV-PKG-001`.

---

#### 19. Carrera entre cancelación y terminación

Esta tarea fija la semántica, pero no el mecanismo físico de exclusión.

Reglas:

1. Una solicitud de cancelación y una terminación pueden competir sobre la misma operación.
2. La decisión válida debe ser reconstruible respecto de la versión del trabajo, intento y frontera de efecto observados.
3. Un worker no puede cerrar un efecto nuevo usando una vista anterior después de que otra decisión haya hecho efectiva la cancelación.
4. Si el efecto ganó la carrera y quedó confirmado antes de que la cancelación fuera efectiva, se conserva el resultado.
5. Si no puede probarse cuál decisión precedió a la frontera de efecto, se conserva incertidumbre y se concilia.
6. La materialización de claim, lease, fencing, compare-and-set, locking, versión u otro mecanismo equivalente pertenece a `QUEUE-ARC-009`.
7. Los nombres exactos de estados y eventos para solicitud, aceptación, demasiado tarde e incertidumbre pertenecen a `QUEUE-ARC-010`.

---

#### 20. Handoff exacto a `QUEUE-ARC-008..012`

| Tarea                                                                             | Responsabilidad reservada recibida desde esta tarea                                                                                                                                     |
| --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `QUEUE-ARC-008 — Definir cola de fallos y recuperación manual`                    | aislar y recuperar fallos sin convertir una operación cancelada en trabajo reactivable por defecto ni borrar la historia de cancelación                                                 |
| `QUEUE-ARC-009 — Definir bloqueo de duplicados y concurrencia`                    | materializar claim, lease, fencing, exclusión y orden seguro para resolver carreras entre cancelación, ejecución, reasignación, retry y terminación                                     |
| `QUEUE-ARC-010 — Definir estados y eventos canónicos`                             | representar solicitud, observación, efectividad, resolución demasiado tardía, resultado ambiguo y terminalidad mediante estados/eventos canónicos sin redefinir la semántica de control |
| `QUEUE-ARC-011 — Definir métricas de espera, ejecución y error`                   | medir solicitudes, latencia hasta observación, cancelaciones efectivas, demasiado tardías, carreras e incertidumbre sin convertir telemetría en política                                |
| `QUEUE-ARC-012 — Definir autorización para crear, cancelar y reintentar trabajos` | definir quién puede solicitar o forzar cancelación, con qué scope y sobre qué operación, sin convertir identidad técnica, token, worker, dispositivo o posesión de una clave en permiso |

Ninguna de esas responsabilidades se desarrolla en esta tarea.

---

#### 21. Prohibiciones

Esta tarea no autoriza:

1. modificar tablas, columnas, constraints, índices, funciones, RPC, triggers o RLS;
2. crear endpoints, tokens de cancelación, abort controllers, locks, leases o fencing físicos;
3. cambiar Edge Functions, GitHub Actions, `pg_cron`, `pg_net`, TaskManager, SecureStore, localStorage o BrowserPrint;
4. modificar la eliminación de cuentas, ANIMA, NEXO, webhooks o notificaciones actuales;
5. activar `QAI-008`;
6. retirar `QAI-004`;
7. alterar schedules o sus expresiones;
8. redefinir `deadline_at`, perfiles de retry, backoff o `max_attempts`;
9. reutilizar `idempotency_key` como identidad de una solicitud de control distinta;
10. borrar el registro fuente, evento, mensaje o evidencia por cancelar su procesamiento;
11. declarar rollback o compensación como consecuencia automática de cancelación;
12. declarar cancelado un efecto externo o físico cuyo resultado permanezca incierto;
13. reactivar una operación cancelada mediante retry ordinario;
14. cancelar hijos únicamente por compartir `correlation_id`;
15. cerrar claims, leases, fencing, locks o algoritmos de concurrencia;
16. cerrar el vocabulario final de estados o sus transiciones;
17. fijar métricas, SLOs o umbrales de alerta;
18. conceder autoridad empresarial para cancelar;
19. declarar conformidad operativa de activos actuales por esta definición documental;
20. iniciar o desarrollar `QUEUE-ARC-008`.

---

#### 22. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea especializa para la cancelación del trabajo asíncrono obligaciones de confiabilidad ya registradas y asignadas a la arquitectura de colas: estado durable y recuperable, no duplicidad de efectos, control concurrente, resultado autoritativo, conciliación ante incertidumbre, preservación de historia y la regla transversal ya aprobada que impide efectos tardíos ordinarios después de cancelación o revocación. La materialización documental no introduce una obligación verificable independiente ni modifica alcance, estado, responsable, evidencia, relación o secuencia de requisitos vigentes.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

---

#### 23. Cobertura de prueba existente preservada

Se preserva sin modificación, en especial:

- `TREQ-INTEGRATION-003`, que protege identidad estable, estado durable, resultado recuperable, no duplicidad, claim seguro, conciliación, cola de fallos y recuperación de operaciones asíncronas, y asigna responsabilidad explícita a `QUEUE-ARC-001` a `QUEUE-ARC-010`;
- `TREQ-INTEGRATION-004`, que exige reconstruir causa, payload, principal técnico, recurso, intento, resultado, error y efecto final de cadenas trigger, función, job, webhook o notificación;
- la cobertura específica vigente de ANIMA, PASS, NEXO, Supabase e integraciones relacionada con trabajo offline, dispositivos, impresión, webhooks, concurrencia, idempotencia y resultados ambiguos.

Ninguna fila del registro canónico cambia de identificador, dominio, regla protegida, estado, responsable, evidencia, relación o secuencia por esta tarea.

---

#### 24. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. conserva `QUEUE-ARC-006` como tarea anterior aprobada;
2. conserva `QUEUE-ARC-008` como única tarea siguiente reservada;
3. establece `WORK-CANCELLATION-CONTRACT-001@1.0.0` sin crear una fuente de verdad paralela;
4. conserva `operation_id`, `idempotency_key`, payload, huella, propietario y contrato durante la cancelación;
5. distingue solicitud de cancelación, cancelación efectiva, interrupción, rollback, compensación, vencimiento y agotamiento de retry;
6. define `cancellation_request_id` como identidad propia de control sin sustituir identidades del trabajo;
7. define el sobre mínimo de cancelación y la frontera de efecto;
8. define exactamente cuatro modos: `COOPERATIVE_SAFE_POINT`, `BEFORE_EFFECT_BOUNDARY_ONLY`, `UPSTREAM_PROPAGATED` y `NO_APLICA`;
9. impide iniciar otro intento ordinario después de una cancelación efectiva;
10. impide que `next_retry_at`, reconexión, wake-up o reasignación revivan trabajo cancelado;
11. exige reevaluar cancelación antes de una nueva ejecución y antes de fronteras de efecto cuando el modo sea cooperativo;
12. conserva la identidad e historia de un intento detenido durante ejecución;
13. conserva resultados ya confirmados y prohíbe reescribirlos como cancelados;
14. conserva `RESULT_UNKNOWN` cuando una frontera externa o física pudo haberse cruzado sin confirmación;
15. prohíbe interpretar pérdida de proceso, conexión o callback como cancelación efectiva;
16. distingue cancelación de rollback técnico y de compensación empresarial;
17. exige nueva intención para una ejecución empresarial posterior a una operación cancelada cuando realmente se requiera repetir el efecto;
18. impide cancelar automáticamente hijos solo por correlación;
19. detiene creación de hijos nuevos después de cancelación efectiva del contenedor;
20. conserva efectos hijos ya confirmados dentro de batches;
21. distingue cancelación de una ocurrencia de desactivación o modificación de su schedule;
22. obliga a conservar una decisión durable de cancelación en trabajo offline antes de reenviar tras reconexión;
23. impide declarar cancelada una impresión post-envío sin evidencia suficiente;
24. preserva eventos externos como hechos fuente aunque se cancele procesamiento downstream;
25. materializa exactamente una decisión para cada `QAI-001..QAI-019`;
26. obtiene 16 `APLICA_CANCELACION_DE_TRABAJO`, 2 `PROPAGA_NO_DECIDE_CANCELACION` y 1 `NO_APLICA`;
27. obtiene 12 `COOPERATIVE_SAFE_POINT`, 4 `BEFORE_EFFECT_BOUNDARY_ONLY`, 2 `UPSTREAM_PROPAGATED` y 1 `NO_APLICA`;
28. mantiene 0 identidades faltantes y 0 duplicadas;
29. mantiene `QAI-010` y `QAI-013` como propagadores, no como autoridades de cancelación;
30. mantiene `QAI-016` como `NO_APLICA`;
31. conserva `QAI-008` como `PENDIENTE_DE_EVIDENCIA` sin activar su schedule;
32. documenta la brecha de cancelación del worker programado de eliminación de cuentas sin modificarlo;
33. documenta la ausencia de cancelación durable acreditada en el recorrido inspeccionado de las colas ANIMA sin modificar código;
34. documenta que vaciar la cola local NEXO después de iniciar BrowserPrint no acredita cancelación ni resultado físico;
35. reserva carreras de cancelación y terminación para `QUEUE-ARC-009`;
36. reserva estados y eventos exactos para `QUEUE-ARC-010`;
37. reserva métricas para `QUEUE-ARC-011`;
38. reserva autoridad de cancelación para `QUEUE-ARC-012`;
39. declara cero cambios de requisitos de prueba con justificación concreta;
40. crea cero objetos físicos;
41. modifica cero repositorios, Supabase, cron, colas, workers, dispositivos, adaptadores o webhooks;
42. no inicia ni desarrolla `QUEUE-ARC-008`.

---

#### 25. Resultado de la tarea

`QUEUE-ARC-007` deja establecido el contrato canónico de cancelación del trabajo asíncrono:

```text
MISMA OPERACIÓN
        ↓
SOLICITUD DE CANCELACIÓN IDENTIFICADA
        ↓
VALIDACIÓN DE CONTROL
        ↓
¿ANTES DE FRONTERA DE EFECTO?
        ├─ SÍ → IMPEDIR NUEVOS EFECTOS
        │       → DETENER EN PUNTO SEGURO SI ESTÁ EN CURSO
        │
        └─ NO → ¿RESULTADO CONOCIDO?
                ├─ SÍ → CONSERVAR RESULTADO
                └─ NO → RESULT_UNKNOWN
                        → CONCILIACIÓN

CANCELACIÓN
≠ ROLLBACK
≠ COMPENSACIÓN
≠ VENCIMIENTO
≠ AGOTAMIENTO DE RETRY
```

Las 19 identidades inventariadas quedan reconciliadas una a una. La cancelación preserva identidad, historia y resultados autoritativos; detiene efectos futuros cuando aún es seguro y no oculta como cancelado aquello que ya ocurrió o cuyo resultado permanece incierto.

---

#### 26. Continuidad

ÚLTIMA TAREA APROBADA

`QUEUE-ARC-006 — Definir reintentos, backoff y límite máximo`

TAREA ACTUAL APROBADA

`QUEUE-ARC-007 — Definir cancelación antes y durante ejecución`

SIGUIENTE TAREA RESERVADA

`QUEUE-ARC-008 — Definir cola de fallos y recuperación manual`


### ✅ QUEUE-ARC-008 — Definir cola de fallos y recuperación manual

**Estado:** APROBADA
**Tarea anterior:** `QUEUE-ARC-007 — Definir cancelación antes y durante ejecución`
**Tarea siguiente:** `QUEUE-ARC-009 — Definir bloqueo de duplicados y concurrencia`
**Tipo de tarea:** documental; especialización canónica de aislamiento de fallos, dead-letter, cuarentena, conciliación y recuperación manual controlada para trabajo asíncrono, con preservación de identidad, historia, resultado y causalidad, y decisión explícita para las 19 identidades `QAI-*`, sin implementar colas físicas, claims, locks, estados, métricas ni autorización
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/03_INFRAESTRUCTURA_CANONICA_DE_COLAS.md`
**Línea base documental:** `vento-shell@d9460ce668e78fcb59ca1daa3dc741b491675843`
**Contrato base de trabajo:** `TSVC-SVC-001.CONTRACT@1.0.0`
**Registro de confiabilidad consumido:** `TRANSVERSE-SERVICE-RELIABILITY-REGISTRY-001@1.0.0`
**Contrato de idempotencia consumido:** `WORK-IDEMPOTENCY-CONTRACT-001@1.0.0`
**Contrato temporal consumido:** `WORK-SCHEDULING-POLICY-CONTRACT-001@1.0.0`
**Contrato de asignación consumido:** `WORK-ASSIGNMENT-CONTRACT-001@1.0.0`
**Contrato de retry consumido:** `WORK-RETRY-POLICY-CONTRACT-001@1.0.0`
**Contrato de cancelación consumido:** `WORK-CANCELLATION-CONTRACT-001@1.0.0`
**Inventario consumido:** `QUEUE-CURRENT-ASSET-INVENTORY-001` — 19 identidades `QAI-*`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma cerrada qué ocurre cuando una operación asíncrona ya no puede continuar de forma automática y segura, cómo se aísla sin perder identidad ni evidencia, cuándo debe pasar a conciliación en lugar de reintentarse, y bajo qué condiciones una intervención manual puede recuperar el resultado, reanudar la misma intención o exigir una operación correctiva distinta.

La regla raíz es:

```text
OPERACIÓN IDENTIFICADA
+
TRATAMIENTO AUTOMÁTICO AGOTADO O EJECUCIÓN INSEGURA
+
RESULTADO AÚN NO RESUELTO DE FORMA SEGURA
        ↓
CLASIFICAR LA CAUSA
        ↓
┌───────────────────────────────────────┐
│ DEAD_LETTER                          │
│ QUARANTINE                           │
│ RECONCILIATION                       │
└───────────────────────────────────────┘
        ↓
PRESERVAR IDENTIDAD + HISTORIA + EVIDENCIA
        ↓
REVISIÓN / CONCILIACIÓN CONTROLADA
        ↓
RESULTADO RECUPERADO
O REEJECUCIÓN SEGURA DE LA MISMA INTENCIÓN
O NUEVA OPERACIÓN CORRECTIVA
O PERMANENCIA AISLADA
```

La separación canónica queda fijada así:

```text
FALLO
≠ DEAD_LETTER
≠ QUARANTINE
≠ RESULT_UNKNOWN
≠ CANCELACIÓN
≠ VENCIMIENTO
≠ RECHAZO EMPRESARIAL
≠ NUEVA INTENCIÓN

RECUPERACIÓN MANUAL
≠ EDITAR EL PAYLOAD ORIGINAL
≠ REINICIAR EL PRESUPUESTO AUTOMÁTICO
≠ BORRAR HISTORIA
≠ FORZAR UN EFECTO AMBIGUO
```

---

#### 2. Resultado sustantivo

Se establece `WORK-FAILURE-RECOVERY-CONTRACT-001@1.0.0` como especialización de aislamiento y recuperación controlada del contrato canónico de trabajo asíncrono.

El resultado material fija:

1. tres carriles semánticos cerrados de aislamiento: `DEAD_LETTER`, `QUARANTINE` y `RECONCILIATION`;
2. la diferencia entre error terminal, agotamiento automático, mensaje no procesable, conflicto, resultado desconocido y efecto parcial;
3. un registro de aislamiento que conserva la misma `operation_id` sin crear otra intención;
4. las causas cerradas que permiten enviar una operación a cada carril;
5. los datos mínimos que deben preservarse sin copiar secretos ni payloads sensibles completos;
6. una identidad propia para cada solicitud de recuperación manual;
7. precondiciones obligatorias antes de cualquier recuperación;
8. un catálogo cerrado de acciones y resoluciones de recuperación sin definir todavía estados persistidos;
9. la prohibición de reejecución ciega ante efectos externos, físicos, destructivos o parcialmente confirmados;
10. el tratamiento de operaciones canceladas, vencidas, terminales y parcialmente ejecutadas;
11. la relación entre contenedores, hijos, schedules, colas offline, impresión y webhooks;
12. la frontera exacta con concurrencia, estados, métricas y autorización;
13. la reconciliación documental con fallos actuales observados en eliminación de cuentas, ANIMA, impresión NEXO y webhooks;
14. una decisión explícita para las 19 identidades `QAI-*` del inventario aprobado.

Balance:

| Métrica                                    | Resultado |
| ------------------------------------------ | --------: |
| Identidades `QAI-*` esperadas              |    **19** |
| Identidades materializadas                 |    **19** |
| `APLICA_AISLAMIENTO_Y_RECUPERACION`        |    **16** |
| `PROPAGA_NO_DECIDE_AISLAMIENTO`            |     **2** |
| `NO_APLICA`                                |     **1** |
| Carril primario `DEAD_LETTER`              |     **7** |
| Carril primario `QUARANTINE`               |     **3** |
| Carril primario `RECONCILIATION`           |     **6** |
| Modo `UPSTREAM_PROPAGATED`                 |     **2** |
| Modo `NO_APLICA`                           |     **1** |
| Identificadores `QAI-*` duplicados         |     **0** |
| Identidades sin decisión                   |     **0** |
| Requisitos de prueba creados o modificados |     **0** |
| Objetos físicos creados o modificados      |     **0** |

---

#### 3. Herencia contractual obligatoria

`WORK-FAILURE-RECOVERY-CONTRACT-001@1.0.0` no crea otra identidad de trabajo ni sustituye los contratos aprobados.

Hereda obligatoriamente:

- de `TSVC-SVC-001.CONTRACT@1.0.0`, `operation_id`, `WORK_SUBMISSION`, `WORK_OUTCOME`, `WORK_ERROR`, causalidad, propiedad empresarial, versión y resultado autoritativo;
- de `TRANSVERSE-SERVICE-RELIABILITY-REGISTRY-001@1.0.0`, `DEAD_LETTER`, `QUARANTINED`, `RESULT_UNKNOWN`, conciliación, preservación de intentos y prohibición de repetición ciega;
- de `WORK-IDEMPOTENCY-CONTRACT-001@1.0.0`, `idempotency_key`, `payload_fingerprint`, recuperación del mismo trabajo y prohibición de mutar silenciosamente una intención;
- de `WORK-SCHEDULING-POLICY-CONTRACT-001@1.0.0`, `deadline_at`, vigencia, identidad de ocurrencia y prohibición de extender la ventana original mediante recuperación ordinaria;
- de `WORK-ASSIGNMENT-CONTRACT-001@1.0.0`, historial de `assignment_id`, `assignment_version` y separación entre reasignación y nueva intención;
- de `WORK-RETRY-POLICY-CONTRACT-001@1.0.0`, `attempt_id`, `attempt_no`, `max_attempts`, agotamiento, error no reintentable y regla de que el presupuesto automático no se reinicia;
- de `WORK-CANCELLATION-CONTRACT-001@1.0.0`, la prohibición de revivir por defecto una operación cancelada y la obligación de conciliar cualquier efecto tardío o incierto;
- de `TRANSVERSE-SERVICE-CONTINGENCY-REGISTRY-001@1.0.0`, la separación entre recuperación de una operación concreta y los modos generales de contingencia o degradación del servicio;
- de `QUEUE-CURRENT-ASSET-INVENTORY-001`, las 19 identidades materiales y sus brechas actuales.

La retención física, archivado y limpieza de entradas aisladas permanecen gobernados por el registro transversal de retención. Esta tarea no fija ventanas temporales de conservación.

---

#### 4. Unidad canónica de aislamiento

Una entrada de fallo representa una proyección controlada sobre **la misma operación** que requiere tratamiento fuera del flujo automático ordinario.

```text
OPERACIÓN ORIGINAL
operation_id = estable
idempotency_key = estable
payload_fingerprint = estable

ENTRADA DE AISLAMIENTO
failure_entry_id = identidad propia
operation_id = referencia a la operación original
failure_lane = carril semántico
isolation_reason = causa cerrada
```

Reglas:

1. `failure_entry_id` identifica un episodio de aislamiento; no sustituye `operation_id`, `idempotency_key`, `attempt_id` ni `cancellation_request_id`.
2. Aislar no crea otra intención ni otra clave idempotente.
3. Un trabajo puede tener más de un episodio de aislamiento a lo largo de su historia si una recuperación controlada vuelve a ejecutarlo y falla nuevamente.
4. Cada episodio conserva referencia al intento, error, resultado conocido y contexto contractual que lo originaron.
5. El aislamiento nunca borra intentos previos ni sobrescribe un resultado autoritativo.
6. Una entrada no se considera resuelta por eliminarla físicamente de una tabla, lista, cola local o interfaz.
7. La fuente empresarial que originó el trabajo permanece intacta salvo que su propio contrato ordene otra cosa.
8. El servicio transversal no adquiere autoridad para decidir el resultado empresarial por custodiar una entrada aislada.

---

#### 5. Carriles canónicos de aislamiento

Se definen exactamente tres carriles semánticos para las operaciones aplicables.

| Carril           | Uso canónico                                                                                                                                             | Regla de seguridad                                                        |
| ---------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| `DEAD_LETTER`    | el tratamiento automático terminó o agotó presupuesto y no existe un efecto ambiguo que haga insegura una nueva ejecución                                | detener automatismos y exigir decisión controlada antes de otra ejecución |
| `QUARANTINE`     | existe contenido no procesable, conflicto, orden inválido, contrato incompatible o condición que exige revisión antes de permitir ejecución              | no ejecutar ni corregir silenciosamente el trabajo aislado                |
| `RECONCILIATION` | el efecto pudo ocurrir, ocurrió parcialmente o existe divergencia entre fuentes y no puede decidirse con seguridad desde el resultado técnico disponible | consultar fuentes autoritativas antes de repetir, completar o cerrar      |

Reglas:

1. Los tres carriles son semánticos; no obligan a tres tecnologías o tablas físicas distintas.
2. Un elemento puede pasar de `DEAD_LETTER` o `QUARANTINE` a `RECONCILIATION` si la revisión descubre un posible efecto previo.
3. Una operación en `RECONCILIATION` no vuelve a `DEAD_LETTER` para eludir la incertidumbre.
4. `DEAD_LETTER` no significa fallo empresarial definitivo.
5. `QUARANTINE` no significa que el payload pueda editarse y reenviarse con la misma identidad.
6. `RECONCILIATION` no significa retry ni compensación.
7. Cancelación y expiración no son carriles de fallo; sus reglas siguen siendo propias.
8. Una operación ya `succeeded` no ingresa a aislamiento por un fallo de telemetría posterior; el fallo técnico secundario conserva su propia identidad cuando corresponda.
9. El vocabulario final de estados y eventos que materializa estos carriles pertenece a `QUEUE-ARC-010`.

---

#### 6. Causas canónicas de aislamiento

El campo `isolation_reason` utiliza el siguiente vocabulario cerrado inicial:

| Causa                         | Carril primario  | Regla                                                                                                         |
| ----------------------------- | ---------------- | ------------------------------------------------------------------------------------------------------------- |
| `RETRY_BUDGET_EXHAUSTED`      | `DEAD_LETTER`    | se agotó el tratamiento automático permitido sin resultado exitoso ni ambigüedad material                     |
| `PERMANENT_TECHNICAL_FAILURE` | `DEAD_LETTER`    | el fallo técnico conocido no admite otro intento automático bajo la política vigente                          |
| `POISON_OR_UNPROCESSABLE`     | `QUARANTINE`     | la unidad no puede procesarse de forma segura y repetirla produciría el mismo fallo o riesgo                  |
| `CONFLICT_OR_OUT_OF_ORDER`    | `QUARANTINE`     | existe conflicto idempotente, causal, de versión o de orden que exige revisión controlada                     |
| `RESULT_UNKNOWN`              | `RECONCILIATION` | el efecto pudo ocurrir pero no existe confirmación autoritativa suficiente                                    |
| `PARTIAL_EFFECT`              | `RECONCILIATION` | algunas etapas o componentes produjeron efecto y otras no tienen cierre compatible                            |
| `SOURCE_OR_RESULT_DIVERGENCE` | `RECONCILIATION` | fuentes o registros relevantes no convergen a un resultado único y seguro                                     |
| `OPERATOR_REVIEW_REQUIRED`    | según evidencia  | el contrato exige revisión humana antes de decidir; el carril se selecciona por la naturaleza real del riesgo |

Reglas:

1. La clasificación parte de evidencia del intento y del contrato, no de un texto libre del operador.
2. Un error de validación corregible no se convierte en `DEAD_LETTER` para reutilizar la misma intención con contenido distinto.
3. Un rechazo empresarial no se vuelve reintentable por entrar a una cola de fallos.
4. Un conflicto idempotente no se resuelve eligiendo silenciosamente uno de los payloads.
5. Un error de autorización no se corrige ejecutando el trabajo con un principal más amplio sin una nueva evaluación contractual.
6. Cuando exista posibilidad material de efecto externo, físico o destructivo, prevalece `RECONCILIATION` sobre una reejecución directa.
7. Un fallo conocido antes de cualquier efecto puede aislarse en `DEAD_LETTER` o `QUARANTINE` según si el problema es agotamiento recuperable o incompatibilidad que exige revisión.

---

#### 7. Sobre mínimo de aislamiento y recuperación

Toda materialización futura deberá poder conservar, cuando aplique:

```text
failure_entry_id
failure_entry_version
failure_lane
isolation_reason
isolated_at
operation_id
contract_id
contract_version
operation_type
business_owner_application
idempotency_key
payload_fingerprint
source_reference
resource_reference
resource_version
source_attempt_id
attempt_no
retry_profile
max_attempts
error_code
error_class
failed_at
deadline_at
cancellation_resolution
result_ref
reconciliation_status
reconciliation_evidence_ref
recovery_request_id
recovery_action
recovery_requested_at
requested_by_reference
operation_version_observed
failure_entry_version_observed
recovery_attempt_id
replacement_operation_id
recovery_resolution_ref
```

Reglas:

1. Los campos no aplicables se omiten o se declaran `NO_APLICA`; no se inventan identidades.
2. El registro conserva referencias suficientes para reconstruir causa, intento, recurso, contrato y efecto conocido.
3. Secretos, tokens, credenciales, payloads sensibles completos, documentos y evidencia física no se copian a la cola de fallos cuando una referencia protegida sea suficiente.
4. `failure_entry_version` conserva evolución del episodio de aislamiento sin reescribir historia.
5. `reconciliation_evidence_ref` apunta a evidencia protegida o fuente autoritativa, no a un mensaje de UI ni a un log aislado.
6. `recovery_attempt_id` solo existe cuando una recuperación controlada inicia otra ejecución real.
7. `replacement_operation_id` solo existe cuando la resolución exige una intención correctiva o empresarial nueva.
8. La representación física de estas relaciones queda para la implementación autorizada.

---

#### 8. Ingreso a aislamiento

Una operación deja el flujo automático ordinario cuando se cumple una condición que impide continuar con seguridad.

```text
INTENTO / DECISIÓN AUTOMÁTICA
        ↓
¿EXISTE RESULTADO AUTORITATIVO SUFICIENTE?
        ├─ SÍ, ÉXITO → conservar resultado; no aislar por la operación principal
        └─ NO
             ↓
¿EFECTO POSIBLE, PARCIAL O DIVERGENTE?
        ├─ SÍ → RECONCILIATION
        └─ NO
             ↓
¿CONFLICTO / POISON / ORDEN / INCOMPATIBILIDAD?
        ├─ SÍ → QUARANTINE
        └─ NO
             ↓
¿TRATAMIENTO AUTOMÁTICO AGOTADO O FALLO TÉCNICO TERMINAL?
        ├─ SÍ → DEAD_LETTER
        └─ NO → seguir política ordinaria propietaria
```

Reglas:

1. El ingreso no reinicia `attempt_no` ni `max_attempts`.
2. No se programa `next_retry_at` ordinario para una unidad ya aislada por agotamiento o inseguridad.
3. Un worker con un item en memoria no puede continuar ejecutándolo solo porque no haya observado todavía el almacenamiento físico de aislamiento; la exclusión efectiva se resuelve en `QUEUE-ARC-009`.
4. Aislar conserva la operación original para consulta y reconstrucción.
5. Si el fallo pertenece a un trabajo hijo, el contenedor no se marca automáticamente como recuperado, fallido o exitoso sin aplicar su contrato de resultados parciales.
6. Un transporte técnico que falle propaga evidencia al trabajo propietario; no se convierte automáticamente en su cola de fallos empresarial.

---

#### 9. Semántica de `DEAD_LETTER`

`DEAD_LETTER` se utiliza cuando la automatización ya no puede continuar sin intervención controlada y no existe evidencia de efecto ambiguo que exija conciliación previa.

Reglas:

1. Entrar a `DEAD_LETTER` detiene retries ordinarios de esa operación.
2. El presupuesto consumido permanece consumido; no se resetea.
3. La entrada conserva el último error y todos los intentos anteriores por referencia.
4. La operación no se presenta como resultado empresarial fallido únicamente por estar aislada.
5. Un operador no puede sacar la unidad de `DEAD_LETTER` y volver a encolarla sin ejecutar las precondiciones de recuperación de esta tarea.
6. Si la revisión encuentra evidencia de un posible efecto previo, la unidad pasa a tratamiento de conciliación antes de cualquier reejecución.
7. Si resolver el fallo exige cambiar payload, recurso, versión, destinatario, finalidad o contrato material, se requiere una nueva operación correctiva o nueva intención; no se muta el trabajo original.
8. La entrada puede permanecer aislada indefinidamente desde el punto de vista semántico hasta que su política de retención propietaria disponga archivo o cierre; esta tarea no define duración física.

---

#### 10. Semántica de `QUARANTINE`

`QUARANTINE` protege al sistema frente a una unidad cuyo contenido, contexto, versión, orden o contrato no permiten ejecución segura.

Reglas:

1. Un mensaje venenoso o determinísticamente no procesable no se reintenta automáticamente.
2. Un `IDEMPOTENCY_CONFLICT` conserva las dos evidencias incompatibles sin sobrescribir la intención reservada.
3. Un elemento fuera de orden no puede aplicar una versión antigua sobre una más nueva.
4. Un contrato o versión desconocidos no se interpretan mediante un esquema parecido por conveniencia.
5. Una unidad en cuarentena no se corrige editando el payload original.
6. Si la causa se resuelve sin cambiar el significado de la intención —por ejemplo, disponibilidad de una dependencia contractual ya compatible— podrá evaluarse recuperación de la misma operación.
7. Si la corrección cambia significado, recurso, versión material, destinatario o efecto, se crea una operación nueva causalmente vinculada.
8. Una liberación masiva de cuarentena sin evaluación individual o criterio contractual explícito queda prohibida.
9. La autoridad para liberar, crear corrección o descartar una acción permanece reservada a `QUEUE-ARC-012`.

---

#### 11. Semántica de `RECONCILIATION`

`RECONCILIATION` es obligatoria cuando repetir puede duplicar, contradecir o destruir un efecto que quizá ya ocurrió.

Debe consultar, según el contrato aplicable:

- clave idempotente o `operation_id`;
- identificador de proveedor o evento;
- receipt técnico confiable;
- recurso y versión autoritativos;
- hash u objeto persistido;
- estado de dispositivo o periférico;
- registro empresarial propietario;
- evidencia de componentes o etapas ya completadas.

La conciliación clasifica el resultado en una de estas condiciones:

| Condición                      | Decisión                                                                                                                                     |
| ------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------- |
| `CONFIRMED_EXECUTED`           | recuperar el resultado existente; no repetir el efecto                                                                                       |
| `CONFIRMED_NOT_EXECUTED`       | evaluar reejecución de la misma intención solo si sigue vigente, no está cancelada y la repetición es segura                                 |
| `PARTIALLY_EXECUTED`           | completar únicamente componentes faltantes de forma idempotente cuando el contrato lo permita; en otro caso crear acción correctiva separada |
| `EXECUTED_INCOMPATIBLE_RESULT` | escalar a la aplicación propietaria; no sobrescribir el resultado ni repetir ciegamente                                                      |
| `UNDETERMINABLE`               | mantener aislamiento y prohibir reejecución destructiva, física o externa insegura                                                           |

Reglas:

1. La vuelta de conectividad o disponibilidad no cierra conciliación.
2. Un proveedor que responde nuevamente no prueba por sí solo qué ocurrió en el intento anterior.
3. La conciliación debe preservar todas las evidencias consultadas mediante referencias auditables.
4. Completar componentes faltantes conserva la identidad original únicamente cuando el contrato permita demostrar que son partes pendientes del mismo efecto.
5. Una compensación empresarial es una operación distinta y no se disfraza como conciliación.
6. La aplicación propietaria decide cuando el servicio técnico no puede inferir de forma segura el resultado empresarial.

---

#### 12. Unidad de recuperación manual

La recuperación manual es una acción de control identificada sobre una operación aislada.

```text
RECOVERY REQUEST
recovery_request_id = identidad propia
failure_entry_id = episodio de aislamiento observado
operation_id = operación original
requested_by_reference = solicitante auditable
recovery_action = acción propuesta
```

Reglas:

1. `recovery_request_id` no sustituye `operation_id`, `attempt_id`, `failure_entry_id` ni `cancellation_request_id`.
2. Repetir la misma solicitud de recuperación debe recuperar la misma decisión y no crear múltiples intentos.
3. Una nueva solicitud para una segunda intervención distinta utiliza otro `recovery_request_id`.
4. La solicitud registra la versión de operación y de entrada de fallo observadas para permitir control concurrente posterior.
5. La solicitud no concede por sí misma autoridad para actuar; la autoridad y segregación se cierran en `QUEUE-ARC-012`.
6. Abrir una solicitud no modifica la intención original ni reabre automáticamente el trabajo.
7. La recuperación manual debe dejar una resolución consultable aunque se decida no ejecutar nada.

---

#### 13. Precondiciones obligatorias de recuperación

Antes de aprobar cualquier acción que pueda producir un nuevo efecto, se debe comprobar en este orden:

1. identidad exacta de `operation_id`, `failure_entry_id` y contrato;
2. que la entrada observada continúa vigente y no fue resuelta por otro resultado;
3. que no existe `WORK_OUTCOME` exitoso autoritativo que haga innecesaria la repetición;
4. estado de cancelación y su resolución efectiva;
5. vigencia temporal y `deadline_at` del trabajo original;
6. recurso, versión y fuente empresarial actuales;
7. payload y `payload_fingerprint` originales, sin mutación;
8. último intento, error, presupuesto consumido y resultado conocido;
9. existencia de efecto ambiguo, parcial o externo que obligue a conciliar;
10. compatibilidad actual de contrato, target y dependencias;
11. identidad y referencia del solicitante para que la tarea de autorización determine su autoridad;
12. versión observada necesaria para que la tarea de concurrencia impida dos recuperaciones simultáneas.

Si cualquiera de estas comprobaciones impide ejecución segura, la recuperación no puede convertirse en reintento por conveniencia operativa.

---

#### 14. Acciones canónicas de recuperación

El campo `recovery_action` utiliza este vocabulario cerrado:

| Acción                          | Uso                                                                                                                                              |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| `RECOVER_EXISTING_RESULT`       | registrar o enlazar un resultado autoritativo ya producido sin repetir efecto                                                                    |
| `RECONCILE_ONLY`                | investigar y cerrar incertidumbre sin iniciar nueva ejecución                                                                                    |
| `SAFE_REEXECUTE_SAME_INTENTION` | iniciar una ejecución extraordinaria de la misma operación cuando se demostró que no hubo efecto incompatible y la intención sigue siendo válida |
| `COMPLETE_MISSING_COMPONENTS`   | completar partes faltantes de un efecto parcial únicamente cuando el contrato permita hacerlo idempotentemente                                   |
| `CREATE_CORRECTIVE_OPERATION`   | crear una nueva operación causalmente vinculada porque corregir exige otra intención, payload, versión, recurso o efecto                         |
| `KEEP_ISOLATED`                 | conservar la unidad sin ejecución porque no existe una salida segura o falta decisión propietaria                                                |

Reglas:

1. `SAFE_REEXECUTE_SAME_INTENTION` no reinicia el presupuesto automático original.
2. `COMPLETE_MISSING_COMPONENTS` no permite volver a ejecutar componentes ya confirmados.
3. `CREATE_CORRECTIVE_OPERATION` utiliza una nueva `operation_id` y la identidad idempotente que corresponda a la nueva intención.
4. `KEEP_ISOLATED` es una resolución válida cuando ejecutar sería más riesgoso que conservar el pendiente.
5. Ninguna acción modifica retroactivamente intentos, errores ni resultados anteriores.
6. La materialización de permisos para cada acción pertenece a `QUEUE-ARC-012`.

---

#### 15. Resoluciones canónicas de recuperación

Sin sustituir el state machine de `QUEUE-ARC-010`, una solicitud de recuperación puede resolver semánticamente a:

| Resolución                              | Significado                                                                                      |
| --------------------------------------- | ------------------------------------------------------------------------------------------------ |
| `RESULT_RECOVERED`                      | se localizó y vinculó el resultado autoritativo existente                                        |
| `SAFE_REEXECUTION_APPROVED`             | se demostró que otra ejecución de la misma intención puede iniciarse bajo control extraordinario |
| `MISSING_COMPONENT_COMPLETION_APPROVED` | se identificaron componentes faltantes que pueden completarse sin repetir los ya confirmados     |
| `CORRECTIVE_OPERATION_REQUIRED`         | el trabajo original no debe mutarse; se necesita una operación nueva relacionada                 |
| `NO_SAFE_REEXECUTION`                   | repetir no es seguro por ambigüedad, cancelación, vencimiento, conflicto o efecto previo         |
| `OWNER_DECISION_REQUIRED`               | el resultado técnico no basta para decidir la consecuencia empresarial                           |
| `KEEP_ISOLATED`                         | no existe todavía condición de salida segura                                                     |
| `ALREADY_RESOLVED_NO_CHANGE`            | la entrada ya había sido resuelta y la solicitud no cambia el resultado                          |

La resolución no concede autorización ni define el nombre final del estado persistido.

---

#### 16. Recuperación extraordinaria después de agotamiento

Cuando el presupuesto automático se agotó y una revisión concluye que la **misma intención** sigue siendo segura y vigente:

1. la recuperación utiliza un `recovery_request_id` explícito;
2. la operación conserva `operation_id`, `idempotency_key`, payload y huella;
3. el siguiente intento recibe un `attempt_id` nuevo y continúa la historia monotónica de intentos;
4. `max_attempts` original no se reescribe ni se presenta como si nunca se hubiera agotado;
5. una solicitud de recuperación autoriza semánticamente como máximo una nueva ejecución extraordinaria; no abre otro loop automático de retries;
6. si ese intento falla, se clasifica nuevamente y vuelve a aislamiento según evidencia;
7. una segunda ejecución extraordinaria requiere otra solicitud de recuperación identificada y una nueva evaluación;
8. la exclusión que impide dos ejecuciones por la misma solicitud se materializa en `QUEUE-ARC-009`;
9. la autoridad para solicitar o permitir la recuperación se materializa en `QUEUE-ARC-012`.

La recuperación extraordinaria no convierte el modelo en retries ilimitados.

---

#### 17. Cancelación, vencimiento y terminalidad

##### 17.1. Operación cancelada

Una cancelación efectiva impide reencolar la misma operación para producir el efecto ordinario.

Se permite únicamente:

- conciliar un efecto tardío o incierto;
- recuperar un resultado ya producido;
- crear una nueva operación empresarial o correctiva cuando el dominio lo requiera y exista la autoridad correspondiente.

No se utiliza recuperación manual para revocar la cancelación original.

##### 17.2. Operación vencida

Al alcanzar `deadline_at`, la operación original no recupera elegibilidad ordinaria mediante una cola de fallos.

Se permite:

- conciliar y recuperar resultados ya existentes;
- determinar que no hubo efecto;
- crear una nueva intención cuando el proceso todavía requiera una acción vigente bajo un nuevo contexto contractual.

La recuperación no extiende silenciosamente `deadline_at`.

##### 17.3. Operación con resultado terminal

Un resultado exitoso o rechazo empresarial autoritativo no se reabre por una solicitud de recuperación. Si existe una acción posterior legítima, se modela como una nueva operación causalmente vinculada.

---

#### 18. Trabajos contenedores e hijos

1. El aislamiento de un contenedor no convierte automáticamente todos sus hijos en fallidos.
2. Un hijo ya registrado conserva su `operation_id`, resultado e historial propios.
3. Un contenedor recuperado no vuelve a ejecutar hijos que ya tengan resultado confirmado.
4. Si un hijo está en `RESULT_UNKNOWN`, se concilia ese hijo antes de decidir el cierre del contenedor.
5. Un batch parcialmente ejecutado conserva por unidad qué efectos fueron confirmados, faltantes o inciertos.
6. La recuperación de un batch solo procesa unidades pendientes compatibles y nunca usa un nuevo `attempt_id` del contenedor para justificar duplicar efectos hijos.
7. La causalidad entre contenedor, hijos y una eventual operación correctiva permanece visible.

---

#### 19. Schedules y ocurrencias recurrentes

Para `QAI-001..QAI-009`:

1. aislar una ocurrencia conserva `schedule_occurrence_id` y `logical_fire_at_utc`;
2. la siguiente ocurrencia ordinaria del schedule es otra intención y no recupera automáticamente la anterior;
3. `DEAD_LETTER` de una ocurrencia no desactiva la definición del schedule;
4. una ocurrencia vencida no se revive extendiendo su deadline;
5. una ocurrencia que produjo efectos parciales concilia por recurso o trabajo hijo antes de cualquier recuperación;
6. una ejecución manual adicional deliberada sigue siendo una nueva ocurrencia;
7. una ejecución manual destinada a recuperar la misma ocurrencia conserva su identidad únicamente si sigue vigente y se cumplen las precondiciones de recuperación;
8. el solapamiento `QAI-001` / `QAI-004` no se resuelve liberando ambas unidades de aislamiento; su exclusión permanece en `QUEUE-ARC-009` y la transición legacy en `TSVC-CAT-010`.

---

#### 20. Dispositivos, offline e impresión

1. Un fallo local debe conservar identidad suficiente para sobrevivir reinicio y reconexión.
2. El dispositivo no decide que un error sea recuperable por tener nuevamente conectividad.
3. Un item `failed` o `conflict` local no se vuelve seguro porque un operador pulse una acción equivalente a forzar sincronización.
4. Conflictos de versión o negocio se revisan antes de ejecutar; no se fuerzan con el mismo payload contra una fuente más nueva.
5. Una impresión cuyo envío pudo llegar al periférico entra primero a conciliación física; no se reimprime para comprobar si la primera salió.
6. Si se confirma que no hubo impresión y la intención sigue vigente, puede evaluarse recuperación controlada de la misma intención.
7. Si se confirma impresión y se necesita otra copia, la reimpresión autorizada es otra intención con identidad de copia propia.
8. El detalle especializado de recuperación de impresión permanece bajo `PRINT-ARC-*` sin alterar estas invariantes transversales.

---

#### 21. Webhooks, integraciones y efectos externos

1. Un evento de proveedor recibido permanece como hecho fuente aunque su procesamiento interno falle.
2. El replay del proveedor no se modela automáticamente como recuperación manual ni como nueva intención.
3. Cuando una mutación interna puede haberse aplicado antes de fallar el registro del evento o acuse, la operación entra a conciliación.
4. La conciliación compara identificador de evento, transacción o recurso, versión y resultado interno antes de cualquier reejecución.
5. Un `200 OK` previo no prueba que todas las etapas internas terminaron si el flujo no conserva un resultado autoritativo compuesto.
6. Un `500` tampoco prueba que ninguna etapa produjo efecto.
7. Una integración con varias escrituras debe conciliar cada componente relevante cuando una respuesta o error no demuestre atomicidad.
8. Una recuperación nunca convierte al proveedor externo en propietario de la decisión empresarial.

---

#### 22. Matriz materializada de aislamiento y recuperación de las 19 identidades `QAI-*`

| ID        | Clasificación                       | Carril primario       | Disparador de aislamiento                                                                                   | Regla de recuperación manual                                                                                                                                                                               | Estado y brecha documental                                                                                                                                                                                          |
| --------- | ----------------------------------- | --------------------- | ----------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `QAI-001` | `APLICA_AISLAMIENTO_Y_RECUPERACION` | `DEAD_LETTER`         | agotamiento de la ocurrencia de cierre diario sin efecto ambiguo confirmado                                 | recuperar la misma ocurrencia solo si continúa vigente, no fue cancelada y no existe cierre ya confirmado; efectos por recurso se concilian antes de repetir                                               | `ESPECIFICADO`; el solapamiento con `QAI-004` continúa bajo `QUEUE-ARC-009`                                                                                                                                         |
| `QAI-002` | `APLICA_AISLAMIENTO_Y_RECUPERACION` | `DEAD_LETTER`         | agotamiento del procesamiento raíz o fallo terminal conocido en la cadena cron → transporte → worker        | recuperar la ocurrencia raíz sin volver a ejecutar trabajos hijos ya cerrados; cada hijo conserva aislamiento y resultado propios                                                                          | `ESPECIFICADO`; éxito del cron o transporte no acredita el resultado de etapas hijas                                                                                                                                |
| `QAI-003` | `APLICA_AISLAMIENTO_Y_RECUPERACION` | `DEAD_LETTER`         | agotamiento de la corrección stale cuando no existe efecto previo incierto                                  | antes de recuperar se revalida si el turno o contexto continúa stale; un recurso ya corregido no vuelve a mutarse                                                                                          | `ESPECIFICADO`; vigencia del recurso prevalece sobre el deseo de drenar backlog                                                                                                                                     |
| `QAI-004` | `APLICA_AISLAMIENTO_Y_RECUPERACION` | `QUARANTINE`          | fallo, solapamiento o necesidad de recuperación mientras coexiste con `QAI-001` sobre la misma función base | no liberar para ejecución hasta resolver exclusión de autoridad y versión; la recuperación no legitima doble cierre                                                                                        | `ESPECIFICADO`; coexistencia legacy sigue bajo `TSVC-CAT-010` y exclusión bajo `QUEUE-ARC-009`                                                                                                                      |
| `QAI-005` | `APLICA_AISLAMIENTO_Y_RECUPERACION` | `DEAD_LETTER`         | entrega conocida como fallida después de agotar política                                                    | puede recuperarse la entrega pendiente preservando mensaje y propósito; si el proveedor pudo aceptarla, cambia a `RECONCILIATION` antes de reenviar                                                        | `ESPECIFICADO`; `pg_net` no es la fuente de resultado y la entrega especializada continúa bajo `NOTIFY-ARC-*`                                                                                                       |
| `QAI-006` | `APLICA_AISLAMIENTO_Y_RECUPERACION` | `DEAD_LETTER`         | ocurrencia de limpieza agotada o fallo técnico terminal conocido                                            | recuperar solo trabajo de limpieza todavía aplicable; no restaurar ni volver a modificar registros ya procesados válidamente mediante retry del batch                                                      | `ESPECIFICADO`; mantenimiento no adquiere autoridad empresarial adicional                                                                                                                                           |
| `QAI-007` | `APLICA_AISLAMIENTO_Y_RECUPERACION` | `DEAD_LETTER`         | agotamiento de la ocurrencia de reconciliación sin ambigüedad sobre el root job                             | cada checkout hijo se revisa por separado; cualquier pago o estado ambiguo entra a `RECONCILIATION` antes de otra mutación                                                                                 | `ESPECIFICADO`; el batch no permite repetir efectos hijos confirmados                                                                                                                                               |
| `QAI-008` | `APLICA_AISLAMIENTO_Y_RECUPERACION` | `DEAD_LETTER`         | política objetivo si la purga llega a desplegarse y agota tratamiento                                       | misma regla de ocurrencia y recurso que mantenimiento; la definición documental no crea una cola física ni acredita el job                                                                                 | `PENDIENTE_DE_EVIDENCIA`; adopción y despliegue quedan para `DELIV-PKG-001`                                                                                                                                         |
| `QAI-009` | `APLICA_AISLAMIENTO_Y_RECUPERACION` | `RECONCILIATION`      | fallo durante el procesamiento destructivo de una solicitud de eliminación                                  | comprobar por solicitud si anonimización, eliminación de identidad y cierre de registro ocurrieron; nunca repetir todas las etapas solo porque el registro diga `failed`                                   | `ESPECIFICADO`; el worker actual puede marcar `failed` después de una excepción sin conservar una fase durable por cada efecto destructivo; materialización física en `DELIV-PKG-001`                               |
| `QAI-010` | `PROPAGA_NO_DECIDE_AISLAMIENTO`     | `UPSTREAM_PROPAGATED` | error o request pendiente de transporte HTTP                                                                | propagar error, receipt y referencia al trabajo propietario; retirar un request de `pg_net` no resuelve el trabajo ni autoriza recovery empresarial                                                        | `ESPECIFICADO`; transporte administrado, no autoridad de aislamiento                                                                                                                                                |
| `QAI-011` | `APLICA_AISLAMIENTO_Y_RECUPERACION` | `QUARANTINE`          | item local `failed` o `conflict` que no admite retry automático                                             | `conflict` exige revalidar fuente y versión; `failed` exige clasificar causa; el parámetro actual de ejecución forzada no equivale a recuperación canónica auditada                                        | `ESPECIFICADO`; el cliente conserva fallo y conflicto, pero no materializa solicitud de recuperación canónica; transición en `DELIV-PKG-001`                                                                        |
| `QAI-012` | `APLICA_AISLAMIENTO_Y_RECUPERACION` | `QUARANTINE`          | item de descanso `failed` o `conflict` fuera del retry automático                                           | misma regla que asistencia, con identidad independiente; no se fuerza un descanso contra un turno o estado empresarial cambiado                                                                            | `ESPECIFICADO`; recuperación controlada no está acreditada en el cliente actual; transición en `DELIV-PKG-001`                                                                                                      |
| `QAI-013` | `PROPAGA_NO_DECIDE_AISLAMIENTO`     | `UPSTREAM_PROPAGATED` | recibe items pendientes o aislados de `QAI-011` / `QAI-012`                                                 | el tick procesa únicamente unidades elegibles según su resolución upstream; no libera cuarentena ni crea recovery por sí mismo                                                                             | `ESPECIFICADO`; worker técnico, no propietario de recuperación                                                                                                                                                      |
| `QAI-014` | `APLICA_AISLAMIENTO_Y_RECUPERACION` | `RECONCILIATION`      | callback de background cuyo efecto servidor pudo haberse aplicado antes de perder confirmación              | consultar el registro autoritativo de asistencia/salida; si el cierre existe recuperar resultado, y si no existe evaluar vigencia antes de nueva ejecución                                                 | `ESPECIFICADO`; pérdida del callback o del proceso móvil no demuestra ausencia de efecto                                                                                                                            |
| `QAI-015` | `APLICA_AISLAMIENTO_Y_RECUPERACION` | `RECONCILIATION`      | envío a BrowserPrint con resultado físico fallido o desconocido                                             | confirmar si el periférico aceptó o imprimió antes de reemitir; solo un resultado `CONFIRMED_NOT_EXECUTED` y una intención vigente permiten recuperación de la misma copia                                 | `ESPECIFICADO`; la cola local se vacía al iniciar envío y no conserva aislamiento ni resultado físico durable; detalle en `PRINT-ARC-*` y adopción en `DELIV-PKG-001`                                               |
| `QAI-016` | `NO_APLICA`                         | `NO_APLICA`           | `NO_APLICA`                                                                                                 | refresco de lectura sin trabajo durable ni efecto empresarial                                                                                                                                              | `NO_APLICA`; no se fuerza al contrato de recuperación                                                                                                                                                               |
| `QAI-017` | `APLICA_AISLAMIENTO_Y_RECUPERACION` | `RECONCILIATION`      | fallo de entrega derivada cuando no puede probarse si el proveedor o destino recibió la notificación        | conservar `support_message` como fuente; una entrega claramente no enviada puede aislarse como dead-letter, pero una aceptación incierta exige conciliación antes de reenviar                              | `ESPECIFICADO`; trigger y `pg_net` no se convierten en fuente del resultado de entrega                                                                                                                              |
| `QAI-018` | `APLICA_AISLAMIENTO_Y_RECUPERACION` | `RECONCILIATION`      | divergencia o fallo entre evento Wompi, actualización de transacción y registro del evento                  | conciliar `provider_event_id`, transacción y registro procesado; si la transacción ya cambió no repetir el efecto, y si falta solo evidencia completar únicamente el componente faltante cuando sea seguro | `ESPECIFICADO`; el flujo actual puede aplicar estado y luego fallar el registro de evento, por lo que un error HTTP aislado no prueba ausencia de efecto                                                            |
| `QAI-019` | `APLICA_AISLAMIENTO_Y_RECUPERACION` | `RECONCILIATION`      | fallo o divergencia entre suscripción, entitlement y auditoría derivados de RevenueCat                      | comparar los tres componentes antes de replay; completar solo lo faltante cuando pueda demostrarse, y mantener aislamiento si el evento no tiene protección suficiente contra repetición                   | `ESPECIFICADO`; el handler actual no comprueba explícitamente los errores devueltos por sus tres mutaciones antes de responder éxito; replay/concurrencia quedan bajo `QUEUE-ARC-009` y adopción en `DELIV-PKG-001` |

Resultado de reconciliación:

```text
19 IDENTIDADES ESPERADAS
19 IDENTIDADES MATERIALIZADAS
16 APLICAN AISLAMIENTO Y RECUPERACIÓN
2 PROPAGAN Y NO DECIDEN AISLAMIENTO
1 NO APLICA
0 FALTANTES
0 DUPLICADOS

DISTRIBUCIÓN DE CARRIL PRIMARIO ENTRE LAS 16 APLICABLES
DEAD_LETTER     = 7
QUARANTINE      = 3
RECONCILIATION  = 6
```

---

#### 23. Reconciliación con implementación actual

##### 23.1. Eliminación programada de cuentas

El worker vigente de eliminación selecciona solicitudes pendientes, las cambia a `processing`, ejecuta anonimización, elimina la identidad de Auth y después intenta registrar `completed`. Ante cualquier excepción dentro de ese tramo actualiza la solicitud a `failed`.

Esto implica que el valor `failed` por sí solo no demuestra cuál de las etapas destructivas ocurrió.

Decisión documental:

```text
FALLO DEL WORKER
+
POSIBLE EFECTO PARCIAL DESTRUCTIVO
=
RECONCILIATION
NO REEJECUCIÓN CIEGA DEL PIPELINE COMPLETO
```

La materialización física de checkpoints, aislamiento y recuperación se planifica en `DELIV-PKG-001`. La exclusión de dos recuperadores pertenece a `QUEUE-ARC-009`; los estados y eventos a `QUEUE-ARC-010`; la autoridad a `QUEUE-ARC-012`.

##### 23.2. Colas offline ANIMA

Las colas inspeccionadas conservan estados locales `pending`, `syncing`, `failed` y `conflict`, además de intentos, error y `nextRetryAt`. Los elementos `failed` o `conflict` dejan de procesarse automáticamente salvo cuando la ejecución se fuerza mediante el parámetro actual `force`.

Decisión documental:

```text
FORCE ACTUAL
= CAPACIDAD TÉCNICA DE REPROCESAMIENTO
≠ RECUPERACIÓN MANUAL CANÓNICA
```

Una recuperación canónica requiere identificar la solicitud, revisar conflicto y versión, conservar evidencia y evitar que `force` omita la causa que hizo insegura la ejecución. La adopción física queda en `DELIV-PKG-001`.

##### 23.3. Impresión local NEXO

El cliente conserva la lista pendiente en `localStorage`. `printAll()` invoca BrowserPrint y retira de la cola total o parcialmente los elementos inmediatamente después de iniciar el envío, mientras los callbacks de resultado se resuelven por separado.

Decisión documental:

```text
ELEMENTO RETIRADO DE LA COLA LOCAL
≠ RESULTADO FÍSICO
≠ RECUPERACIÓN CERRADA
```

Un fallo o timeout post-envío se concilia antes de imprimir de nuevo. La arquitectura específica continúa en `PRINT-ARC-*` y la adopción física en `DELIV-PKG-001`.

##### 23.4. Webhook Wompi

El handler vigente protege replay mediante consulta del evento de proveedor. No obstante, la actualización de estado de transacción y el registro posterior del evento son operaciones separadas. Un error al registrar el evento después de una actualización de transacción puede dejar evidencia técnica divergente.

Decisión documental:

```text
ERROR DE REGISTRO DE EVENTO
DESPUÉS DE POSIBLE MUTACIÓN DE TRANSACCIÓN
=
RECONCILIATION
```

La recuperación debe consultar evento, transacción y estado procesado antes de volver a aplicar el efecto.

##### 23.5. Webhook RevenueCat

El handler vigente ejecuta secuencialmente inserción de suscripción, `upsert` de entitlement e inserción de auditoría. En el recorrido inspeccionado las respuestas de esas tres mutaciones no son comprobadas mediante sus campos de error antes de devolver `{ ok: true }`.

Decisión documental:

```text
RESPUESTA OK DEL HANDLER ACTUAL
≠ PRUEBA DE QUE LAS TRES MUTACIONES CONVERGIERON
```

Cualquier recuperación deberá conciliar suscripción, entitlement y auditoría como componentes separados. La brecha de replay y exclusión permanece bajo `QUEUE-ARC-009`; la materialización física se planifica en `DELIV-PKG-001`.

---

#### 24. Recuperación manual frente a contingencia

La recuperación de esta tarea actúa sobre una operación aislada e identificada.

El modo transversal `DEGRADED_MANUAL_HANDOFF` de contingencia actúa sobre la capacidad del servicio durante una afectación más amplia.

```text
RECUPERACIÓN MANUAL DE TRABAJO
= resolver una operación concreta y su resultado

HANDOFF MANUAL DE CONTINGENCIA
= mantener una capacidad limitada mediante procedimiento alterno gobernado
```

Reglas:

1. un handoff manual no libera automáticamente elementos de `DEAD_LETTER` o `QUARANTINE`;
2. una recuperación de una operación no declara restaurado el servicio completo;
3. ambos mecanismos preservan identidad, ownership, autoridad y conciliación;
4. una operación generada por un procedimiento manual debe tener la identidad y causalidad que su contrato exija;
5. volver a modo normal no elimina backlog o resultados ambiguos pendientes.

---

#### 25. Handoff exacto a `QUEUE-ARC-009..012`

| Tarea                                                                             | Responsabilidad reservada recibida desde esta tarea                                                                                                                                                                       |
| --------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `QUEUE-ARC-009 — Definir bloqueo de duplicados y concurrencia`                    | materializar claim, lease, fencing, compare-and-set, exclusión y orden seguro para que una entrada aislada o un `recovery_request_id` no produzcan dos recuperadores válidos, y para impedir carreras con workers tardíos |
| `QUEUE-ARC-010 — Definir estados y eventos canónicos`                             | representar ingreso a dead-letter, cuarentena y conciliación, apertura y resolución de recovery, reejecución extraordinaria, permanencia aislada y resultado recuperado sin redefinir la semántica de esta tarea          |
| `QUEUE-ARC-011 — Definir métricas de espera, ejecución y error`                   | medir profundidad y edad de aislamiento, tiempo de conciliación, tasa de recuperación, fallos repetidos y residuales sin convertir métricas en política de liberación                                                     |
| `QUEUE-ARC-012 — Definir autorización para crear, cancelar y reintentar trabajos` | definir quién puede inspeccionar, conciliar, liberar, solicitar recuperación, ejecutar un intento extraordinario o crear una operación correctiva, con segregación y alcance explícitos                                   |

Ninguna de esas responsabilidades se desarrolla en esta tarea.

---

#### 26. Prohibiciones

Esta tarea no autoriza:

1. crear tablas, columnas, índices, constraints, funciones, RPC, triggers, buckets o colas físicas de dead-letter;
2. modificar Supabase, datos, RLS, grants, Realtime, cron, Edge Functions o secretos;
3. modificar ANIMA, NEXO, PASS o cualquier repositorio consumidor;
4. activar `QAI-008`;
5. retirar `QAI-004`;
6. crear un retry loop nuevo después de agotamiento;
7. resetear `attempt_no`, `max_attempts` o `deadline_at`;
8. mutar payload, huella, recurso, versión o contrato de la operación original;
9. reejecutar una operación cancelada para producir el efecto ordinario;
10. revivir una operación vencida extendiendo silenciosamente su ventana;
11. repetir un efecto externo, físico o destructivo antes de conciliar incertidumbre;
12. liberar un conflicto idempotente por sobrescritura;
13. tratar `force`, un botón administrativo o acceso a base de datos como autoridad suficiente para recuperación;
14. declarar un item recuperado porque fue eliminado de una cola o lista;
15. declarar una operación fallida solo porque esté en `DEAD_LETTER`;
16. crear una compensación empresarial como efecto automático de la cola de fallos;
17. cerrar claim, lease, fencing, locking o compare-and-set;
18. cerrar el state machine final ni los nombres de eventos persistidos;
19. fijar métricas, SLOs, umbrales o alertas;
20. conceder permisos para inspeccionar, liberar, reintentar o corregir operaciones;
21. fijar periodos físicos de retención de fallos;
22. declarar conformidad operativa de los activos actuales por esta definición documental;
23. iniciar o desarrollar `QUEUE-ARC-009`.

---

#### 27. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea especializa para el inventario canónico una obligación de confiabilidad ya registrada: aislamiento de trabajo no procesable o agotado, preservación de identidad e historia, conciliación ante resultado desconocido o parcial, prohibición de repetición insegura y recuperación manual controlada. No introduce una obligación verificable independiente ni modifica el alcance, estado, responsable, evidencia, relación o secuencia de requisitos vigentes.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

---

#### 28. Cobertura de prueba existente preservada

Se preserva sin modificación, en especial:

- `TREQ-INTEGRATION-003`, que ya exige estado durable y resultado recuperable, límites de retry, tratamiento de resultado desconocido, claim seguro, conciliación, cola de fallos y recuperación manual controlada, y asigna responsabilidad explícita a `QUEUE-ARC-001` a `QUEUE-ARC-010`;
- `TREQ-INTEGRATION-004`, que exige reconstruir causa, payload, principal técnico, recurso, intento, resultado, error y efecto final de cadenas asíncronas sin pérdida silenciosa ni efectos duplicados;
- la cobertura específica vigente de ANIMA, PASS, NEXO, Supabase e integraciones relacionada con offline, dispositivos, impresión, webhooks, idempotencia, concurrencia, resultados ambiguos y recuperación.

Ninguna fila del registro canónico cambia de identificador, dominio, regla protegida, estado, responsable, evidencia, relación o secuencia por esta tarea.

---

#### 29. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. conserva `QUEUE-ARC-007` como tarea anterior aprobada;
2. conserva `QUEUE-ARC-009` como única tarea siguiente reservada;
3. establece `WORK-FAILURE-RECOVERY-CONTRACT-001@1.0.0` sin crear una fuente de verdad paralela;
4. conserva `operation_id`, `idempotency_key`, payload, huella, propietario, contrato e historial al aislar;
5. define exactamente tres carriles semánticos: `DEAD_LETTER`, `QUARANTINE` y `RECONCILIATION`;
6. distingue error terminal, agotamiento, conflicto, poison, resultado desconocido, efecto parcial, cancelación, vencimiento y rechazo empresarial;
7. define `failure_entry_id` y `failure_entry_version` sin sustituir identidades del trabajo;
8. define el sobre mínimo de aislamiento y recuperación sin copiar secretos ni payloads sensibles completos;
9. define causas cerradas de aislamiento y su carril primario;
10. impide retries ordinarios después de entrar a aislamiento por agotamiento o inseguridad;
11. impide que `DEAD_LETTER` se interprete como resultado empresarial;
12. impide editar el payload original para liberar una cuarentena;
13. exige conciliación antes de repetir cualquier efecto ambiguo, externo, físico o destructivo;
14. clasifica conciliación en ejecutado, no ejecutado, parcial, incompatible o indeterminable;
15. recupera un resultado existente sin repetir el efecto cuando este ya se produjo;
16. completa únicamente componentes faltantes cuando el contrato permita demostrar seguridad e idempotencia;
17. define `recovery_request_id` como identidad propia e idempotente de intervención;
18. define acciones `RECOVER_EXISTING_RESULT`, `RECONCILE_ONLY`, `SAFE_REEXECUTE_SAME_INTENTION`, `COMPLETE_MISSING_COMPONENTS`, `CREATE_CORRECTIVE_OPERATION` y `KEEP_ISOLATED`;
19. define resoluciones canónicas de recovery sin apropiarse del state machine de `QUEUE-ARC-010`;
20. obliga a revalidar resultado, cancelación, deadline, recurso, versión, contrato, payload, error y evidencia antes de otro efecto;
21. impide reiniciar `max_attempts` mediante recuperación extraordinaria;
22. limita cada solicitud de recuperación extraordinaria a una nueva ejecución real como máximo;
23. exige otra solicitud identificada para una intervención extraordinaria posterior;
24. impide reejecutar una operación cancelada para producir el efecto ordinario;
25. impide revivir una operación vencida extendiendo su deadline;
26. conserva resultados terminales autoritativos sin reabrirlos;
27. conserva identidad separada de contenedores e hijos y no duplica efectos hijos confirmados;
28. conserva identidad de ocurrencia de schedules y no confunde dead-letter con desactivación de schedule;
29. exige tratamiento seguro de items offline `failed` y `conflict` antes de forzarlos;
30. exige conciliación física antes de reimpresión cuando BrowserPrint pudo aceptar el trabajo;
31. preserva eventos de proveedor como hechos fuente durante recuperación;
32. materializa exactamente una decisión para cada `QAI-001..QAI-019`;
33. obtiene 16 `APLICA_AISLAMIENTO_Y_RECUPERACION`, 2 `PROPAGA_NO_DECIDE_AISLAMIENTO` y 1 `NO_APLICA`;
34. obtiene 7 `DEAD_LETTER`, 3 `QUARANTINE` y 6 `RECONCILIATION` entre las 16 aplicables;
35. mantiene 0 identidades faltantes y 0 duplicadas;
36. mantiene `QAI-010` y `QAI-013` como propagadores, no como autoridades de recovery;
37. mantiene `QAI-016` como `NO_APLICA`;
38. mantiene `QAI-008` como `PENDIENTE_DE_EVIDENCIA` sin activar su schedule;
39. documenta que el `failed` actual del worker de eliminación de cuentas no prueba qué efectos destructivos ocurrieron;
40. documenta que el `force` actual de ANIMA no equivale a recuperación manual canónica;
41. documenta que retirar items de la cola local NEXO no prueba resultado físico ni recovery;
42. documenta la necesidad de reconciliar Wompi cuando mutación y registro de evento divergen;
43. documenta que la respuesta exitosa actual de RevenueCat no acredita por sí sola convergencia de sus tres mutaciones observadas;
44. distingue recuperación manual por operación de handoff manual de contingencia del servicio;
45. reserva exclusión, claim, lease, fencing y compare-and-set para `QUEUE-ARC-009`;
46. reserva estados y eventos exactos para `QUEUE-ARC-010`;
47. reserva métricas para `QUEUE-ARC-011`;
48. reserva autoridad y segregación para `QUEUE-ARC-012`;
49. declara cero cambios de requisitos de prueba con justificación concreta;
50. crea cero objetos físicos;
51. modifica cero repositorios, Supabase, cron, colas, workers, dispositivos, adaptadores o webhooks;
52. no inicia ni desarrolla `QUEUE-ARC-009`.

---

#### 30. Resultado de la tarea

`QUEUE-ARC-008` deja establecido el contrato canónico de aislamiento y recuperación del trabajo asíncrono:

```text
FALLO O CONDICIÓN INSEGURA
        ↓
CLASIFICAR EVIDENCIA
        ↓
DEAD_LETTER
O QUARANTINE
O RECONCILIATION
        ↓
PRESERVAR MISMA OPERACIÓN E HISTORIA
        ↓
RECOVERY REQUEST IDENTIFICADA
        ↓
REVALIDAR RESULTADO + CANCELACIÓN + VIGENCIA + RECURSO + VERSIÓN
        ↓
┌──────────────────────────────────────────┐
│ RECUPERAR RESULTADO EXISTENTE           │
│ CONCILIAR SIN EJECUTAR                  │
│ REEJECUTAR MISMA INTENCIÓN SI ES SEGURO│
│ COMPLETAR SOLO COMPONENTES FALTANTES    │
│ CREAR OPERACIÓN CORRECTIVA NUEVA        │
│ MANTENER AISLADA                        │
└──────────────────────────────────────────┘

NUNCA:
- borrar historia;
- resetear presupuesto;
- mutar intención original;
- repetir un efecto ambiguo a ciegas;
- revivir cancelaciones o vencimientos por conveniencia.
```

Las 19 identidades inventariadas quedan reconciliadas una a una. La cola de fallos deja de ser una bolsa genérica de errores y se convierte en una frontera contractual de seguridad: cada unidad conserva su identidad, evidencia y resultado conocido, y solo puede abandonar el aislamiento mediante una decisión reconstruible que no duplique ni contradiga efectos previos.

---

#### 31. Continuidad

ÚLTIMA TAREA APROBADA

`QUEUE-ARC-007 — Definir cancelación antes y durante ejecución`

TAREA ACTUAL APROBADA

`QUEUE-ARC-008 — Definir cola de fallos y recuperación manual`

SIGUIENTE TAREA RESERVADA

`QUEUE-ARC-009 — Definir bloqueo de duplicados y concurrencia`


### ✅ QUEUE-ARC-009 — Definir bloqueo de duplicados y concurrencia

**Estado:** APROBADA
**Tarea anterior:** `QUEUE-ARC-008 — Definir cola de fallos y recuperación manual`
**Tarea siguiente:** `QUEUE-ARC-010 — Definir estados y eventos canónicos`
**Tipo de tarea:** documental; especialización canónica de exclusión concurrente, reclamación atómica, lease, fencing, compare-and-set, control de versión, orden causal y bloqueo de efectos duplicados para trabajo asíncrono, con decisión explícita para las 19 identidades `QAI-*`, sin implementar tablas, locks, índices, funciones, workers, estados, métricas ni autorización
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/03_INFRAESTRUCTURA_CANONICA_DE_COLAS.md`
**Línea base documental:** `vento-shell@2670b43c317a1493a5d32fdfbb24d0287b60fabf`
**Contrato base de trabajo:** `TSVC-SVC-001.CONTRACT@1.0.0`
**Registro de confiabilidad consumido:** `TRANSVERSE-SERVICE-RELIABILITY-REGISTRY-001@1.0.0`
**Contrato de idempotencia consumido:** `WORK-IDEMPOTENCY-CONTRACT-001@1.0.0`
**Contrato temporal consumido:** `WORK-SCHEDULING-POLICY-CONTRACT-001@1.0.0`
**Contrato de asignación consumido:** `WORK-ASSIGNMENT-CONTRACT-001@1.0.0`
**Contrato de retry consumido:** `WORK-RETRY-POLICY-CONTRACT-001@1.0.0`
**Contrato de cancelación consumido:** `WORK-CANCELLATION-CONTRACT-001@1.0.0`
**Contrato de recuperación consumido:** `WORK-FAILURE-RECOVERY-CONTRACT-001@1.0.0`
**Inventario consumido:** `QUEUE-CURRENT-ASSET-INVENTORY-001` — 19 identidades `QAI-*`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma cerrada cómo Vento OS impide que dos solicitudes equivalentes, dos workers, dos dispositivos, dos recuperadores o dos operaciones técnicamente distintas produzcan simultáneamente un efecto que solo puede tener un ganador válido.

La regla raíz es:

```text
INTENCIÓN YA RESERVADA
+
TRABAJO ELEGIBLE
+
FRONTERA DE CONCURRENCIA IDENTIFICADA
        ↓
CLAIM ATÓMICO
        ↓
LEASE ACOTADO
        ↓
FENCING MONOTÓNICO
        ↓
EJECUCIÓN BAJO VERSIÓN OBSERVADA
        ↓
CIERRE CONDICIONAL
        ↓
UN SOLO CIERRE VÁLIDO POR FRONTERA Y VERSIÓN
```

La separación canónica queda fijada así:

```text
IDEMPOTENCIA DE INTENCIÓN
≠ DEDUPLICACIÓN DE FUENTE O TRANSPORTE
≠ ASIGNACIÓN DE TARGET
≠ CLAIM DE EJECUCIÓN
≠ LEASE
≠ FENCING TOKEN
≠ ATTEMPT
≠ VERSIÓN DEL RECURSO
≠ LOCK FÍSICO
≠ RESULTADO EMPRESARIAL
```

`QUEUE-ARC-009` no promete ejecución exactamente una vez. La protección se obtiene mediante reserva idempotente, un único claim válido por frontera, fencing contra ejecutores tardíos, control de versión sobre recursos, deduplicación de fuente y conciliación cuando no puede demostrarse si el efecto ocurrió.

---

#### 2. Resultado sustantivo

Se establece `WORK-CONCURRENCY-CONTROL-CONTRACT-001@1.0.0` como especialización de exclusión y concurrencia del contrato canónico de trabajo asíncrono.

El resultado material fija:

1. la diferencia entre duplicado de intención, duplicado de fuente, duplicado de claim y duplicado de efecto;
2. una `concurrency_key` que representa la frontera mínima donde dos ejecuciones no pueden producir simultáneamente efectos incompatibles;
3. la reclamación atómica de una unidad elegible;
4. la semántica de `claim_id`, `lease_token`, `lease_expires_at` y `fencing_token`;
5. la obligación de que un nuevo ganador obtenga una generación de fencing estrictamente posterior dentro de su frontera;
6. la prohibición de que un worker con lease perdido cierre o siga mutando bajo autoridad obsoleta;
7. el uso de compare-and-set, versión esperada, constraint o mecanismo equivalente para cambios concurrentes de operación y recurso;
8. la diferencia entre exclusión por operación y exclusión entre operaciones distintas que convergen sobre el mismo recurso o efecto;
9. la conducta ante pérdida de lease antes y después de una posible frontera de efecto;
10. la interacción con reasignación, retry, cancelación, recuperación manual, schedules, dispositivos y webhooks;
11. el orden obligatorio por recurso, versión, dependencia, evento u ocurrencia cuando la hora de llegada no es criterio suficiente;
12. la prohibición de `last write wins` para efectos empresariales o físicos;
13. la reconciliación con controles actuales observados sin declarar cumplimiento transversal completo;
14. una decisión explícita para las 19 identidades `QAI-*` del inventario aprobado.

Balance:

| Métrica                                    | Resultado |
| ------------------------------------------ | --------: |
| Identidades `QAI-*` esperadas              |    **19** |
| Identidades materializadas                 |    **19** |
| `APLICA_CONTROL_DE_CONCURRENCIA`           |    **16** |
| `PROPAGA_NO_DECIDE_CONCURRENCIA`           |     **2** |
| `NO_APLICA`                                |     **1** |
| Frontera primaria `RESOURCE_VERSION_GUARD` |    **10** |
| Frontera primaria `OPERATION_CLAIM`        |     **2** |
| Frontera primaria `DEVICE_EFFECT_GUARD`    |     **1** |
| Frontera primaria `SOURCE_EVENT_GUARD`     |     **3** |
| Identificadores `QAI-*` duplicados         |     **0** |
| Identidades sin decisión                   |     **0** |
| Requisitos de prueba creados o modificados |     **0** |
| Objetos físicos creados o modificados      |     **0** |

Las fronteras primarias describen el conflicto dominante de cada identidad. Toda identidad aplicable conserva además la exclusión básica de una sola autoridad válida de ejecución por `operation_id`.

---

#### 3. Herencia contractual obligatoria

`WORK-CONCURRENCY-CONTROL-CONTRACT-001@1.0.0` no sustituye la idempotencia, el routing, el retry ni la recuperación ya aprobados.

Hereda obligatoriamente:

- de `TSVC-SVC-001.CONTRACT@1.0.0`, `operation_id`, causalidad, propiedad empresarial, versión contractual, resultado autoritativo y separación entre solicitud, ejecución y resultado;
- de `TRANSVERSE-SERVICE-RELIABILITY-REGISTRY-001@1.0.0`, reserva atómica, `lease_token`, `fencing_token`, `row_version`, orden causal, conciliación, no duplicidad observable y prohibición de `last write wins`;
- de `WORK-IDEMPOTENCY-CONTRACT-001@1.0.0`, `idempotency_key`, `payload_fingerprint`, ámbito de unicidad y regla de una sola intención registrada para la misma clave y huella;
- de `WORK-SCHEDULING-POLICY-CONTRACT-001@1.0.0`, `schedule_occurrence_id`, `logical_fire_at_utc`, `scheduled_at`, `deadline_at` y separación entre ocurrencia y ejecución real;
- de `WORK-ASSIGNMENT-CONTRACT-001@1.0.0`, `assignment_id`, `assignment_version`, target técnico y separación entre asignación y claim;
- de `WORK-RETRY-POLICY-CONTRACT-001@1.0.0`, `attempt_id`, `attempt_no`, pérdida de lease, mismo trabajo durante retry y prohibición de repetir ciegamente un efecto ambiguo;
- de `WORK-CANCELLATION-CONTRACT-001@1.0.0`, control concurrente entre cancelación, efecto y terminación;
- de `WORK-FAILURE-RECOVERY-CONTRACT-001@1.0.0`, `failure_entry_id`, `failure_entry_version`, `recovery_request_id` y obligación de impedir dos recuperadores válidos simultáneos;
- de `QUEUE-CURRENT-ASSET-INVENTORY-001`, las 19 identidades materiales y sus fronteras técnicas actuales.

La tarea conserva la autoridad empresarial en la aplicación propietaria. Obtener un claim o poseer una credencial técnica no concede permiso empresarial para crear, cancelar, recuperar o forzar una operación.

---

#### 4. Clases de duplicidad que no pueden confundirse

| Clase                       | Definición                                                                                | Tratamiento propietario                                                                            |
| --------------------------- | ----------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- |
| `DUPLICATE_INTENTION`       | dos submissions representan la misma intención idempotente                                | recuperar la misma operación mediante `WORK-IDEMPOTENCY-CONTRACT-001@1.0.0`                        |
| `DUPLICATE_SOURCE_EVENT`    | el mismo evento, ocurrencia o elemento fuente llega más de una vez                        | reservar/deduplicar por identidad de fuente estable antes del efecto                               |
| `DUPLICATE_ACTIVE_CLAIM`    | dos ejecutores intentan adquirir autoridad sobre la misma frontera vigente                | admitir un solo ganador atómico                                                                    |
| `DUPLICATE_EFFECT`          | operaciones distintas o caminos distintos convergen sobre un efecto que no debe repetirse | compartir `concurrency_key` o guardia de recurso/versión aunque sus `operation_id` sean diferentes |
| `STALE_EXECUTOR`            | un ejecutor conserva memoria de un claim que ya perdió vigencia                           | rechazar cualquier cierre o mutación protegida mediante fencing/versionado                         |
| `RESOURCE_VERSION_CONFLICT` | dos operaciones intentan modificar versiones incompatibles del mismo recurso              | compare-and-set, bloqueo o conciliación explícita; nunca sobrescritura por llegada tardía          |
| `OUT_OF_ORDER_DEPENDENCY`   | una unidad llega antes que su predecesora o con una versión causal obsoleta               | bloquear, diferir o conciliar sin violar orden causal                                              |
| `RECOVERY_RACE`             | dos intervenciones manuales intentan resolver o reejecutar la misma entrada aislada       | un único ganador por `recovery_request_id` y versión observada                                     |
| `CANCEL_COMPLETION_RACE`    | cancelación y cierre compiten por la misma operación                                      | resolver respecto de versión, fencing y frontera de efecto; incertidumbre entra a conciliación     |

No se usa el término “duplicado” como razón genérica para borrar una unidad. Cada clase conserva evidencia y tratamiento propios.

---

#### 5. Unidad canónica de concurrencia

La unidad básica de autoridad temporal es un **claim sobre una frontera de concurrencia identificada**.

```text
operation_id
+
concurrency_key
+
operation_version / resource_version aplicable
        ↓
CLAIM ATÓMICO
        ↓
claim_id
lease_token
lease_expires_at
fencing_token
```

Reglas:

1. `claim_id` identifica una concesión concreta de ejecución y no sustituye `operation_id`, `attempt_id`, `assignment_id` ni `recovery_request_id`.
2. `concurrency_key` identifica el dominio donde dos efectos serían incompatibles o duplicados; puede ser igual a la operación cuando solo existe exclusión interna, o abarcar varias operaciones cuando comparten un recurso o efecto.
3. `lease_token` identifica la posesión temporal del claim y no constituye autorización empresarial.
4. `lease_expires_at` limita la vigencia de la autoridad técnica; no extiende `deadline_at`.
5. `fencing_token` identifica una generación monotónica o versión equivalente del derecho de cierre dentro de la frontera.
6. `operation_version` y `resource_version` representan versiones observadas distintas del fencing; no se intercambian.
7. Un claim no constituye por sí solo un intento. `attempt_id` aparece cuando comienza una ejecución capaz de producir efecto.
8. Un claim perdido antes de comenzar ejecución no consume por sí solo otro intento.
9. Un claim perdido después de iniciar ejecución conserva el intento histórico y obliga a aplicar las reglas de resultado conocido o ambiguo.
10. La persistencia física de estas identidades se decide en implementación; la semántica no depende de una tabla, broker o lock concreto.

---

#### 6. Sobre mínimo de concurrencia

Toda materialización futura deberá poder conservar, cuando aplique:

```text
operation_id
operation_version
idempotency_key
payload_fingerprint
concurrency_key
concurrency_key_version
claim_id
claim_owner_identity
claim_scope
claimed_at
lease_token
lease_expires_at
fencing_token
assignment_id
assignment_version
attempt_id
attempt_no
resource_reference
resource_version
expected_resource_version
schedule_occurrence_id
provider_event_id
failure_entry_id
failure_entry_version
recovery_request_id
cancellation_request_id
result_ref
reconciliation_status
```

Reglas:

1. los campos no aplicables se omiten o se declaran `NO_APLICA`;
2. `concurrency_key_version` identifica la semántica de derivación cuando esta requiera evolución; no permite reinterpretar claves históricas;
3. `claim_owner_identity` identifica al runtime técnico titular del claim, no al propietario empresarial;
4. `claim_scope` declara si la exclusión se aplica a operación, recurso/versión, evento fuente, efecto de dispositivo u otra frontera contractualmente aprobada;
5. ningún token de autenticación, secreto, credencial ni payload sensible completo forma parte del sobre de concurrencia;
6. la información del claim debe ser suficiente para rechazar cierres obsoletos sin depender de memoria de proceso;
7. una referencia de recurso puede materializarse de forma protegida u opaca cuando contenga información sensible;
8. la forma exacta de los estados y eventos que transportan estos campos pertenece a `QUEUE-ARC-010`.

---

#### 7. `concurrency_key` y frontera de efecto

`concurrency_key` responde a la pregunta:

> ¿Qué conjunto mínimo de ejecuciones debe compartir una exclusión para impedir dos efectos incompatibles?

Reglas:

1. toda operación aplicable posee exclusión por `operation_id` aunque su frontera primaria sea más amplia;
2. operaciones con `operation_id` distintos deben compartir una frontera cuando puedan modificar el mismo recurso, la misma versión o el mismo efecto de manera incompatible;
3. la frontera no se deriva de worker, request HTTP, PID, proceso, sesión, hora de llegada o posición en una cola;
4. la frontera puede incorporar `resource_reference`, versión, clase de efecto, ocurrencia, evento fuente o identidad de copia cuando esas dimensiones determinan incompatibilidad;
5. una clave demasiado amplia que serialice trabajo independiente queda prohibida cuando impida progreso seguro sin necesidad;
6. una clave demasiado estrecha que permita dos efectos incompatibles queda prohibida;
7. cambiar de worker, adaptador o dispositivo sustituible no cambia la frontera del efecto;
8. cuando el dispositivo o proveedor concreto formen parte material de la intención, su identidad ya debe estar protegida por contrato e idempotencia;
9. la clave no sustituye la validación de `resource_version` cuando el recurso puede cambiar entre claim y commit;
10. la derivación física y serialización se implementarán de manera versionada y determinista.

##### 7.1. Operaciones diferentes sobre el mismo efecto

La idempotencia no fusiona automáticamente operaciones distintas.

Por tanto:

```text
operation_id A != operation_id B
```

puede coexistir con:

```text
concurrency_key A == concurrency_key B
```

cuando ambas operaciones compiten por el mismo efecto.

Esta regla es obligatoria para el solapamiento documentado entre `QAI-001` y `QAI-004`, que conservan ocurrencias e identidades distintas pero no pueden producir dos cierres incompatibles sobre el mismo turno abierto.

---

#### 8. Adquisición atómica del claim

Una reclamación válida debe comportarse conceptualmente así:

```text
RESOLVER OPERACIÓN ELEGIBLE
        ↓
RESOLVER CONCURRENCY_KEY
        ↓
VALIDAR ASIGNACIÓN + VERSIÓN + VIGENCIA
        ↓
INTENTAR CLAIM DE FORMA ATÓMICA
        ↓
┌───────────────────────────────────────────────┐
│ SIN CLAIM VIGENTE                            │
│ → conceder un único claim                    │
│ → emitir lease y fencing vigentes            │
│                                               │
│ CLAIM VIGENTE COMPATIBLE                     │
│ → no conceder segundo ganador                │
│ → conservar la autoridad existente           │
│                                               │
│ CLAIM EXPIRADO / REVOCADO                    │
│ → evaluar seguridad y resultado              │
│ → solo después conceder nueva generación     │
└───────────────────────────────────────────────┘
```

Reglas:

1. seleccionar trabajo y reservarlo para ejecución forman una operación atómica o un mecanismo equivalente que garantice un solo ganador;
2. leer una fila y actualizarla después sin condición de versión no constituye por sí solo un claim atómico;
3. marcar localmente una unidad como `syncing`, `processing` o equivalente no constituye exclusión distribuida si otro runtime puede actuar fuera de esa memoria;
4. un assignment vigente permite ser candidato, pero no constituye claim;
5. un retry obtiene un claim vigente antes de comenzar otro intento;
6. una recuperación manual que pueda ejecutar adquiere un claim después de validar la versión observada de la entrada de fallo;
7. una cancelación o invalidación concurrente puede volver inelegible la operación antes de que el claim produzca efecto;
8. si la atomicidad no puede mantenerse entre almacenamiento técnico y efecto externo, se exige idempotencia del efecto y conciliación ante respuesta incierta;
9. la tecnología física puede utilizar transacción, conditional update, unique constraint, row lock, advisory lock, broker claim, compare-and-set u otro mecanismo equivalente, siempre que satisfaga estas garantías;
10. la tarea no selecciona un producto, motor o primitiva única.

---

#### 9. Semántica del lease

El lease limita temporalmente la autoridad de un claim.

Reglas:

1. un lease siempre pertenece a un claim identificable;
2. la vigencia se comprueba contra una referencia temporal confiable del componente que custodia la autoridad;
3. la duración debe ser acotada y adecuada al tipo de trabajo; esta tarea no fija segundos universales;
4. un lease ordinario no puede ampliar la vigencia empresarial ni convertir una operación vencida en ejecutable;
5. renovar un lease conserva `claim_id`, `fencing_token` y `attempt_id` mientras continúe la misma ejecución autorizada;
6. renovar no incrementa `attempt_no`;
7. solo el titular vigente puede renovar, y la renovación debe comprobar que su generación no fue sustituida;
8. perder conectividad o heartbeat no demuestra que el efecto no ocurrió;
9. expirar un lease permite evaluar un nuevo claim, pero no autoriza automáticamente otra emisión de un efecto externo, físico o destructivo;
10. si el intento anterior pudo cruzar la frontera de efecto, el siguiente paso es conciliación antes de cualquier nueva ejecución capaz de duplicar ese efecto;
11. una suspensión operativa, cancelación efectiva o vencimiento vuelve inelegible la ejecución aunque el lease técnico todavía no haya vencido;
12. el mecanismo físico de renovación y heartbeat queda para implementación y observabilidad posterior.

---

#### 10. Semántica del fencing

El fencing impide que una autoridad técnica antigua cierre sobre una generación más nueva.

```text
CLAIM A
fencing_token = N
        ↓
LEASE A PIERDE VIGENCIA
        ↓
CLAIM B
fencing_token = N+1 o generación estrictamente posterior
        ↓
WORKER A INTENTA CERRAR
        ↓
RECHAZADO POR GENERACIÓN OBSOLETA
```

Reglas:

1. cada nuevo ganador dentro de una misma frontera obtiene una generación estrictamente posterior a la anterior;
2. renovar el mismo claim no crea una generación de fencing nueva;
3. un ejecutor debe presentar o quedar ligado a su fencing al realizar mutaciones o cierres protegidos;
4. el custodio de la operación o recurso rechaza una generación anterior a la vigente;
5. un worker tardío no puede marcar éxito, fallo, cancelación, retry, aislamiento o recovery sobre una versión que ya perdió;
6. la protección debe alcanzar la escritura autoritativa donde pueda rechazarse un cierre obsoleto, no limitarse a un log;
7. cuando el efecto externo no soporte fencing, la identidad idempotente del efecto y su receipt constituyen la defensa externa, y cualquier pérdida de confirmación entra a conciliación;
8. el fencing no sustituye la versión empresarial del recurso;
9. el fencing no concede autorización empresarial;
10. la representación física puede ser un contador monotónico, versión comparable o mecanismo equivalente que permita demostrar orden entre generaciones.

---

#### 11. Compare-and-set y control de versión

El control de concurrencia no termina en el claim del trabajo. Antes de mutar una fuente de verdad se debe verificar que el recurso observado continúa siendo compatible con la decisión que originó el efecto.

Reglas:

1. toda mutación sensible utiliza la versión esperada, condición previa o predicado equivalente cuando el recurso pueda cambiar concurrentemente;
2. el cierre solo tiene éxito si la versión de operación, claim/fencing y versión de recurso aplicables siguen siendo vigentes;
3. una condición que ya cambió produce conflicto, reevaluación o conciliación; no se sobrescribe el estado más nuevo;
4. `last write wins` queda prohibido para estados, cantidades, turnos, custodia, pagos, suscripciones, documentos, evidencia y otros efectos empresariales sensibles;
5. una operación batch protege cada unidad cuya consistencia sea independiente; no utiliza un único lock global si eso permite separar trabajo seguro;
6. una transacción puede proteger varios recursos cuando su invariancia exige atomicidad conjunta;
7. una restricción única puede impedir un efecto duplicado, pero no sustituye por sí sola causalidad, resultado recuperable ni conciliación;
8. un row lock actual puede ser una primitiva compatible, pero la conformidad depende del flujo completo y no del nombre de la instrucción SQL;
9. una falla de compare-and-set no se convierte automáticamente en retry transitorio; primero se reevalúa contrato, recurso y versión;
10. los nombres finales de estados derivados del conflicto pertenecen a `QUEUE-ARC-010`.

---

#### 12. Orden causal y dependencia

La hora de llegada no define por sí sola el orden correcto.

Se prioriza, cuando aplique:

1. dependencia explícita entre trabajos;
2. versión monotónica del recurso o agregado;
3. `schedule_occurrence_id` y su `logical_fire_at_utc`;
4. secuencia del evento fuente cuando el proveedor o contrato la garantice;
5. relación contenedor-hijo;
6. orden empresarial aprobado para acciones incompatibles;
7. prioridad únicamente entre unidades independientes después de respetar las restricciones anteriores.

Reglas:

- una operación tardía no sobrescribe una versión posterior;
- una prioridad mayor no rompe causalidad;
- dos trabajos independientes no se serializan artificialmente solo por pertenecer a la misma aplicación;
- una unidad bloqueada por dependencia no consume un intento solo por esperar;
- un replay antiguo se deduplica, bloquea o concilia según su contrato y no desplaza una consecuencia más nueva;
- la taxonomía final de estados y eventos de espera pertenece a `QUEUE-ARC-010`.

---

#### 13. Relación con asignación y reasignación

1. `assignment_id` determina el target técnico seleccionado; `claim_id` determina quién posee temporalmente autoridad para ejecutar.
2. Un target asignado no ejecuta solo por figurar en una asignación.
3. El claim debe corresponder a la `assignment_version` vigente cuando la operación requiera target específico.
4. Una reasignación no crea por sí sola una segunda autoridad simultánea.
5. Si el target anterior todavía conserva un lease válido, la reasignación debe invalidar, esperar o resolver esa autoridad mediante el mecanismo concurrente aprobado antes de habilitar otro efecto incompatible.
6. Una nueva generación de claim protege el cierre frente al target anterior mediante fencing.
7. Cambiar target no reinicia idempotencia, deadline ni presupuesto de retry.
8. Un target que perdió compatibilidad no obtiene un nuevo claim bajo la asignación obsoleta.
9. La autoridad para forzar una reasignación manual pertenece a `QUEUE-ARC-012`.

---

#### 14. Relación con retry y pérdida de lease

Un retry sigue siendo la misma intención y debe adquirir una autoridad de ejecución vigente.

Reglas:

1. el retry conserva `operation_id`, `idempotency_key` y `payload_fingerprint`;
2. un nuevo intento obtiene un `attempt_id` nuevo y, cuando corresponda, un claim/fencing vigente;
3. perder el lease durante un intento obliga al ejecutor a dejar de cerrar o producir nuevas mutaciones protegidas;
4. si el lease se pierde antes de cualquier efecto y puede probarse esa condición, otro claim puede continuar conforme al presupuesto y deadline vigentes;
5. si el efecto pudo ocurrir antes de perder el lease, la operación entra a conciliación antes de otro efecto equivalente;
6. `LEASE_LOST` no crea una intención nueva;
7. un worker obsoleto que termina después no puede sobrescribir el resultado de la nueva generación;
8. el nuevo claim no devuelve intentos consumidos ni amplía `max_attempts`;
9. backoff y elegibilidad continúan gobernados por `WORK-RETRY-POLICY-CONTRACT-001@1.0.0`.

---

#### 15. Carrera entre cancelación y terminación

La cancelación y la ejecución pueden observar versiones diferentes de la misma operación.

Reglas:

1. una solicitud de cancelación no invalida por memoria local un efecto ya confirmado;
2. antes de una nueva frontera de efecto, el ejecutor verifica que su claim, fencing y versión de operación siguen autorizados técnicamente para continuar;
3. una cancelación que queda efectiva antes del efecto impide el cierre ordinario posterior del worker obsoleto;
4. si el efecto quedó confirmado antes de hacerse efectiva la cancelación, se conserva ese resultado;
5. si no puede probarse cuál decisión precedió a la frontera de efecto, se conserva `RESULT_UNKNOWN` y se concilia;
6. ningún orden de llegada HTTP o timestamp de UI sustituye el orden transaccional o versionado de las decisiones;
7. la autoridad para solicitar cancelación pertenece a `QUEUE-ARC-012` y los estados/eventos finales a `QUEUE-ARC-010`.

---

#### 16. Concurrencia de recuperación manual

Una entrada aislada no puede tener dos recuperadores válidos que produzcan efectos concurrentes.

Reglas:

1. `recovery_request_id` identifica una intervención y se procesa idempotentemente;
2. la decisión de recovery se toma sobre `failure_entry_version` y `operation_version` observadas;
3. abrir dos solicitudes no concede dos ejecuciones; toda acción de efecto debe adquirir la exclusión de la operación y de su recurso;
4. una solicitud que ya fue resuelta devuelve su resolución y no inicia otra ejecución;
5. `SAFE_REEXECUTE_SAME_INTENTION` adquiere un nuevo claim/fencing antes de iniciar el intento extraordinario;
6. `COMPLETE_MISSING_COMPONENTS` protege cada componente pendiente y no reabre componentes confirmados;
7. si otro proceso recupera el resultado, cancela, vence o modifica la entrada antes del commit, una solicitud con versión observada anterior pierde elegibilidad;
8. una liberación masiva no omite el control por entrada o por clave de concurrencia;
9. el operador no adquiere autoridad por poseer el claim técnico;
10. la autoridad y segregación de funciones pertenecen a `QUEUE-ARC-012`.

---

#### 17. Schedules y ocurrencias recurrentes

Para `QAI-001..QAI-009` se distinguen tres dimensiones:

```text
IDENTIDAD DE DEFINICIÓN DEL SCHEDULE
≠ IDENTIDAD DE OCURRENCIA LÓGICA
≠ FRONTERA DE EFECTO SOBRE EL RECURSO
```

Reglas:

1. un replay o retry de la misma ocurrencia conserva `schedule_occurrence_id` y no crea otro efecto por duplicar el fire;
2. dos fires de la misma ocurrencia resuelven a una sola intención y un único claim válido;
3. ocurrencias distintas pueden ejecutarse en paralelo únicamente si sus recursos y dependencias son independientes;
4. una ocurrencia posterior no invalida automáticamente el resultado de una anterior;
5. cuando dos schedules distintos producen un efecto equivalente sobre el mismo recurso, sus operaciones conservan identidad propia pero comparten la frontera de efecto correspondiente;
6. `QAI-001` y `QAI-004` mantienen schedules e identidades separados y deben converger a una misma guardia por turno/recurso de cierre para impedir doble efecto;
7. `QAI-003` y `QAI-014` también deben respetar la versión vigente del turno abierto cuando compitan con cierres ordinarios o por salida de sede;
8. activar, retirar o reconciliar el schedule legacy `QAI-004` continúa bajo `TSVC-CAT-010`; esta tarea solo define seguridad mientras coexista;
9. `QAI-008` permanece sin evidencia de despliegue y esta definición no lo activa.

---

#### 18. Trabajos contenedores, hijos y batches

1. un claim del contenedor no concede automáticamente claim sobre todos sus hijos;
2. cada hijo con efecto independiente conserva `operation_id`, idempotencia y exclusión propias;
3. el contenedor puede coordinar el orden, pero no justificar dos workers válidos sobre el mismo hijo;
4. un batch puede ejecutar unidades independientes en paralelo si cada una conserva su frontera de recurso;
5. una unidad ya confirmada no se repite porque el contenedor reintente;
6. un hijo en `RESULT_UNKNOWN` se concilia antes de volver a emitir su efecto;
7. el cierre del contenedor debe basarse en resultados hijos autoritativos y no en la mera ausencia de items pendientes;
8. un fencing del contenedor no sustituye el fencing o versión de un hijo cuando este posee autoridad independiente.

---

#### 19. Dispositivos, offline e impresión

##### 19.1. Colas offline

1. una marca local `syncing` reduce solapamiento dentro de un runtime, pero no constituye por sí sola exclusión distribuida frente a otro proceso, dispositivo o servidor;
2. cada evento offline conserva identidad idempotente antes de cruzar la red;
3. dos dispositivos o dos ejecuciones que envíen el mismo evento deben converger a una sola aplicación del efecto cuando la identidad fuente sea la misma;
4. eventos diferentes sobre el mismo turno deben respetar versión y orden empresarial, no solo unicidad de evento;
5. conflictos no se fuerzan como si fueran errores transitorios;
6. reconectar no crea una nueva generación de intención;
7. el worker móvil técnico consume decisiones de cada unidad y no se convierte en owner de concurrencia por despertar periódicamente.

##### 19.2. Impresión

1. una intención de copia autorizada tiene una frontera de efecto propia;
2. solo un dispatch activo válido puede cruzar la frontera hacia el periférico para esa intención y versión;
3. un callback tardío de BrowserPrint no puede cerrar una generación distinta;
4. retirar texto de `localStorage` no libera ni prueba el claim físico;
5. si el envío pudo ser aceptado y el resultado es incierto, no se concede otro dispatch equivalente hasta conciliar;
6. si se confirma que la impresión no ocurrió y la intención sigue vigente, una recuperación controlada puede obtener un nuevo claim;
7. una reimpresión deliberada es otra intención de copia y no un bypass de concurrencia;
8. el detalle especializado permanece bajo `PRINT-ARC-*`.

---

#### 20. Webhooks, replays y eventos externos

1. un webhook se protege primero por identidad estable de evento o clave determinista aprobada;
2. la reserva de la identidad fuente debe impedir que dos entregas concurrentes se conviertan en dos procesadores válidos del mismo evento;
3. la comprobación “no procesado” seguida de efectos y registro posterior solo es suficiente si el conjunto conserva una garantía equivalente de un único ganador y resultado recuperable;
4. un unique constraint posterior puede impedir duplicar el registro del evento, pero no demuestra por sí solo que los efectos ejecutados antes de esa escritura fueron únicos;
5. una mutación de recurso usa además control de versión o lock compatible sobre el recurso cuando múltiples eventos legítimamente distintos puedan competir;
6. un evento viejo no sobrescribe un estado más nuevo solo por llegar después;
7. replays del proveedor recuperan el mismo procesamiento o resultado, no una intención nueva;
8. un proveedor que no ofrezca un ID estable exige una clave determinista según el contrato de idempotencia; no se inventa una identidad en el worker después del efecto;
9. si el procesamiento puede haber sido parcial, la siguiente entrega entra a conciliación antes de repetir los componentes ambiguos;
10. el proveedor no adquiere ownership empresarial por originar el evento.

---

#### 21. Primitivas físicas compatibles sin selección anticipada

La implementación futura puede combinar, según la frontera:

- unique constraint o índice de unicidad para reserva estable;
- transacción con bloqueo de fila;
- actualización condicional por estado y versión esperados;
- compare-and-set sobre versión monotónica;
- claim con lease persistido;
- advisory lock con identidad durable y mecanismo de recuperación compatible;
- mecanismo de broker que entregue claim y visibility timeout con fencing equivalente;
- fencing token monotónico en la fuente autoritativa;
- constraint de efecto único;
- lock de recurso o agregado;
- serialización por partición o clave cuando preserve paralelismo seguro.

Reglas:

1. ninguna primitiva se considera suficiente solo por existir;
2. el flujo completo debe impedir dos cierres válidos y conservar resultado recuperable;
3. un mutex exclusivamente en memoria no es suficiente cuando existen múltiples runtimes, reinicios o handoffs;
4. un lock sin expiración o recuperación segura puede producir bloqueo permanente y no satisface por sí solo el contrato;
5. un lease sin fencing permite cierre tardío y no satisface por sí solo el contrato;
6. un fencing sin idempotencia externa no elimina ambigüedad después de enviar a un proveedor o periférico;
7. la selección física se materializará en los paquetes de implementación autorizados sin alterar estas invariantes.

---

#### 22. Reconciliación con implementación actual

##### 22.1. Cierre diario de asistencia

La función versionada `public.close_open_attendance_day_end()` selecciona turnos abiertos mediante consulta y `not exists` antes de insertar cierres. El recorrido inspeccionado de esa función no materializa por sí mismo `claim_id`, lease o fencing. Además, el inventario conserva dos schedules distintos, `QAI-001` y `QAI-004`, que invocan la misma función base.

Decisión documental:

```text
DOS SCHEDULES DISTINTOS
+
MISMO DOMINIO DE EFECTO DE CIERRE
=
IDENTIDADES DE OCURRENCIA SEPARADAS
+
FRONTERA COMPARTIDA POR TURNO / RECURSO
```

La tarea no afirma ausencia de toda protección física fuera del recorrido inspeccionado. La implementación deberá demostrar la guardia efectiva completa antes de declarar conformidad.

##### 22.2. Sincronización offline ANIMA

La sincronización actual dispone de `client_event_id` y una unicidad por `employee_id + client_event_id`; el RPC `sync_attendance_events` devuelve `duplicate` ante `unique_violation`. El cliente, además, marca elementos como `syncing` antes de procesarlos.

Decisión documental:

```text
UNICIDAD DE EVENTO EN SERVIDOR
= PROTECCIÓN COMPATIBLE DE IDEMPOTENCIA

MARCA LOCAL syncing
= CONTROL LOCAL ÚTIL
≠ LEASE DISTRIBUIDO
≠ FENCING
```

Eventos distintos sobre el mismo turno continúan requiriendo versión, orden y exclusión del recurso cuando puedan producir efectos incompatibles.

##### 22.3. Reconciliación de checkout PASS/PULSO

`public.reconcile_expired_payment_checkouts()` obtiene locks de las filas de transacción y orden seleccionadas antes de actualizarlas. Esta es una primitiva compatible de exclusión del recurso dentro de ese flujo.

Decisión documental:

```text
FOR UPDATE SOBRE TRANSACCIÓN + ORDEN
= PROTECCIÓN ACTUAL RELEVANTE

CONFORMIDAD TRANSVERSAL COMPLETA
= NO SE INFIERE SOLO POR ESA PRIMITIVA
```

La ocurrencia raíz conserva identidad y el efecto por checkout debe seguir respetando estado, versión, deadline e idempotencia.

##### 22.4. Eliminación programada de cuentas

El worker vigente lee solicitudes `pending` y después cambia cada registro a `processing` mediante una actualización por `id`. En el recorrido inspeccionado no se observa una condición de compare-and-set sobre el estado previamente leído, `claim_id`, lease o fencing antes de iniciar anonimización y eliminación de Auth.

Decisión documental:

```text
LECTURA pending
→ UPDATE POR id
→ EFECTOS DESTRUCTIVOS

NO ACREDITA POR SÍ SOLO
UN ÚNICO GANADOR CON CLAIM VERSIONADO
```

La materialización futura deberá adquirir una autoridad única por solicitud y proteger la transición y las fronteras destructivas. Si un ejecutor pierde autoridad después de un posible efecto, el siguiente procesador concilia antes de repetir.

##### 22.5. Impresión NEXO

La pantalla actual envía ZPL mediante BrowserPrint y retira total o parcialmente los elementos de la cola local inmediatamente después de iniciar el envío, mientras el callback del dispositivo se resuelve por separado.

Decisión documental:

```text
RETIRAR DE localStorage
≠ CLAIM DISTRIBUIDO
≠ RESULTADO FÍSICO
≠ PERMISO PARA SEGUNDO ENVÍO
```

La intención de copia requiere guardia de dispatch y conciliación física ante resultado incierto.

##### 22.6. Webhook Wompi

El flujo vigente consulta si el evento ya fue procesado, después ejecuta `mark_payment_transaction_status()` y finalmente registra el evento. La migración actual contiene unicidad `provider + provider_event_id` en el registro mediante `on conflict`, y `mark_payment_transaction_status()` bloquea la transacción con `for update`.

Decisión documental:

```text
UNICIDAD DE EVENTO
+
ROW LOCK DE TRANSACCIÓN
= CONTROLES ACTUALES COMPATIBLES

CONSULTA PREVIA
→ EFECTO
→ REGISTRO DEL EVENTO
= NO EQUIVALE POR SÍ SOLA A CLAIM ATÓMICO DEL EVENTO COMPLETO
```

La arquitectura objetivo preserva los controles existentes compatibles y exige una única autoridad de procesamiento por evento, además del control de versión del recurso.

##### 22.7. Webhook RevenueCat

El handler vigente procesa suscripción, entitlement y auditoría de forma secuencial. La tabla de suscripciones inspeccionada no declara una unicidad por evento de proveedor, mientras `entitlements` usa `user_id` como clave primaria. El handler observado tampoco materializa una reserva previa de evento o claim de procesamiento.

Decisión documental:

```text
REPLAY O DOS ENTREGAS CONCURRENTES
DEBEN CONVERGER PRIMERO A UNA IDENTIDAD DE EVENTO
ANTES DE PRODUCIR EFECTOS REPETIBLES
```

No se infiere una identidad de evento a partir de un campo que el contrato actual no haya aprobado como tal. La adopción deberá usar el ID estable del proveedor o la clave determinista definida por el contrato de idempotencia.

---

#### 23. Matriz materializada de concurrencia de las 19 identidades `QAI-*`

| ID        | Clasificación                    | Frontera primaria        | Clave o recurso de exclusión                                 | Regla materializada                                                                                                                                                             | Estado y brecha documental                                                                                                           |
| --------- | -------------------------------- | ------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| `QAI-001` | `APLICA_CONTROL_DE_CONCURRENCIA` | `RESOURCE_VERSION_GUARD` | turno abierto / cierre diario aplicable                      | conserva su ocurrencia, pero comparte guardia de efecto con cualquier operación que pretenda cerrar el mismo turno; un claim de schedule no autoriza doble cierre               | `ESPECIFICADO`; coexistencia con `QAI-004` requiere guardia compartida y transición legacy permanece bajo `TSVC-CAT-010`             |
| `QAI-002` | `APLICA_CONTROL_DE_CONCURRENCIA` | `OPERATION_CLAIM`        | operación raíz y cada trabajo hijo independiente             | cron, SQL, `pg_net` y worker no pueden convertirse en ganadores paralelos del mismo trabajo; cada etapa con efecto independiente obtiene su autoridad propia                    | `ESPECIFICADO`; transporte no constituye claim ni resultado                                                                          |
| `QAI-003` | `APLICA_CONTROL_DE_CONCURRENCIA` | `RESOURCE_VERSION_GUARD` | turno stale / versión de asistencia                          | una corrección stale verifica que el turno sigue abierto y compatible antes de cerrar; compite por la misma frontera si otro cierre ya actuó                                    | `ESPECIFICADO`; no se sobrescribe un cierre más nuevo                                                                                |
| `QAI-004` | `APLICA_CONTROL_DE_CONCURRENCIA` | `RESOURCE_VERSION_GUARD` | mismo dominio de cierre de `QAI-001`                         | mantiene operación y schedule propios pero usa la misma exclusión por turno/recurso para que dos ocurrencias distintas no produzcan doble efecto                                | `ESPECIFICADO`; schedule transicional no adquiere precedencia por horario de llegada                                                 |
| `QAI-005` | `APLICA_CONTROL_DE_CONCURRENCIA` | `OPERATION_CLAIM`        | ocurrencia raíz y entregas hijas                             | la ocurrencia se ejecuta con un único claim; cada alerta hija mantiene idempotencia y resultado propios, y `pg_net` no crea otra autoridad                                      | `ESPECIFICADO`; claim raíz no fusiona resultados de destinatarios distintos                                                          |
| `QAI-006` | `APLICA_CONTROL_DE_CONCURRENCIA` | `RESOURCE_VERSION_GUARD` | cotización elegible / condición de vigencia                  | dos ejecuciones de mantenimiento no pueden aplicar una mutación incompatible sobre la misma cotización; una unidad ya procesada se omite por condición actual                   | `ESPECIFICADO`; se preserva paralelismo entre recursos independientes                                                                |
| `QAI-007` | `APLICA_CONTROL_DE_CONCURRENCIA` | `RESOURCE_VERSION_GUARD` | checkout, transacción y orden afectados                      | cada recurso se procesa bajo condición vigente; los row locks actuales son primitiva compatible, y otra ocurrencia no debe revertir o duplicar un resultado más nuevo           | `ESPECIFICADO`; lock actual no se presenta como certificación transversal completa                                                   |
| `QAI-008` | `APLICA_CONTROL_DE_CONCURRENCIA` | `RESOURCE_VERSION_GUARD` | borrador elegible / versión actual                           | si el job llega a desplegarse, dos ejecuciones no podrán purgar dos veces ni actuar sobre una versión que dejó de ser elegible                                                  | `PENDIENTE_DE_EVIDENCIA`; la tarea no activa el schedule ni presume mecanismo físico                                                 |
| `QAI-009` | `APLICA_CONTROL_DE_CONCURRENCIA` | `RESOURCE_VERSION_GUARD` | solicitud de eliminación / fase destructiva                  | `pending` debe reclamarse con un único ganador condicionado a versión/estado; el ejecutor obsoleto no continúa anonimización, eliminación ni cierre después de perder autoridad | `ESPECIFICADO`; el worker actual inspeccionado no acredita claim versionado, lease ni fencing end-to-end                             |
| `QAI-010` | `PROPAGA_NO_DECIDE_CONCURRENCIA` | `UPSTREAM_PROPAGATED`    | autoridad del trabajo upstream                               | `pg_net` transporta una invocación ya identificada; su request ID o visibilidad de cola no sustituyen claim empresarial ni fencing del trabajo                                  | `ESPECIFICADO`; transporte administrado sin ownership de concurrencia                                                                |
| `QAI-011` | `APLICA_CONTROL_DE_CONCURRENCIA` | `RESOURCE_VERSION_GUARD` | evento de asistencia + turno/versión afectada                | unicidad de `client_event_id` deduplica el mismo evento; eventos distintos sobre el mismo turno respetan orden y versión, y la marca local `syncing` no es lease distribuido    | `ESPECIFICADO`; se preserva la protección actual sin equipararla a claim transversal completo                                        |
| `QAI-012` | `APLICA_CONTROL_DE_CONCURRENCIA` | `RESOURCE_VERSION_GUARD` | descanso + turno/estado vigente                              | compartir worker con asistencia no mezcla exclusiones; start/end y otros eventos del mismo turno se aplican solo contra estado compatible y en orden                            | `ESPECIFICADO`; conflicto no se fuerza como retry ordinario                                                                          |
| `QAI-013` | `PROPAGA_NO_DECIDE_CONCURRENCIA` | `UPSTREAM_PROPAGATED`    | claims de `QAI-011` y `QAI-012`                              | cada tick consume unidades elegibles sin crear autoridad nueva; solapamientos de sweeps no permiten dos cierres válidos porque la autoridad pertenece a cada operación/recurso  | `ESPECIFICADO`; worker técnico y efímero, no propietario de la exclusión empresarial                                                 |
| `QAI-014` | `APLICA_CONTROL_DE_CONCURRENCIA` | `RESOURCE_VERSION_GUARD` | turno abierto y evento de salida                             | el callback de background verifica turno y versión antes del autocierre; si un cierre manual o programado ganó, la señal tardía no produce otro checkout                        | `ESPECIFICADO`; ubicación o callback no constituyen claim ni resultado                                                               |
| `QAI-015` | `APLICA_CONTROL_DE_CONCURRENCIA` | `DEVICE_EFFECT_GUARD`    | intención de copia + dispatch físico                         | solo una autoridad vigente envía la copia; callback obsoleto no cierra otra generación y una aceptación física incierta bloquea segundo envío hasta conciliar                   | `ESPECIFICADO`; `localStorage` + BrowserPrint actuales no acreditan claim/fencing físico durable                                     |
| `QAI-016` | `NO_APLICA`                      | `NO_APLICA`              | `NO_APLICA`                                                  | refresco de lectura sin trabajo durable ni efecto empresarial                                                                                                                   | `NO_APLICA`; no se fuerza al contrato de concurrencia                                                                                |
| `QAI-017` | `APLICA_CONTROL_DE_CONCURRENCIA` | `SOURCE_EVENT_GUARD`     | mensaje fuente + intención de notificación derivada          | reejecución del trigger o transporte recupera la misma entrega; el mensaje fuente permanece único y `pg_net` no crea un segundo procesador empresarial                          | `ESPECIFICADO`; resultado de notificación se mantiene separado del mensaje                                                           |
| `QAI-018` | `APLICA_CONTROL_DE_CONCURRENCIA` | `SOURCE_EVENT_GUARD`     | `provider_event_id` + transacción/orden                      | el evento Wompi se reserva con un único procesador; la transacción mantiene control de recurso y cualquier replay recupera resultado sin aplicar otra transición incompatible   | `ESPECIFICADO`; se preservan unicidad de evento y row lock actuales, pero se exige autoridad única del flujo completo                |
| `QAI-019` | `APLICA_CONTROL_DE_CONCURRENCIA` | `SOURCE_EVENT_GUARD`     | identidad estable de evento RevenueCat + usuario/entitlement | dos entregas del mismo evento deben converger antes de insertar suscripción, actualizar entitlement o crear auditoría; un evento posterior no se degrada por uno obsoleto       | `ESPECIFICADO`; el handler actual no acredita reserva previa de evento ni claim de procesamiento; adopción física en `DELIV-PKG-001` |

Resultado de reconciliación:

```text
19 IDENTIDADES ESPERADAS
19 IDENTIDADES MATERIALIZADAS
16 APLICAN CONTROL DE CONCURRENCIA
2 PROPAGAN Y NO DECIDEN CONCURRENCIA
1 NO APLICA
0 FALTANTES
0 DUPLICADOS

FRONTERA PRIMARIA ENTRE LAS 16 APLICABLES
RESOURCE_VERSION_GUARD = 10
OPERATION_CLAIM        = 2
DEVICE_EFFECT_GUARD    = 1
SOURCE_EVENT_GUARD     = 3
```

---

#### 24. Reglas transversales por frontera primaria

##### 24.1. `RESOURCE_VERSION_GUARD`

- siempre conserva un claim de operación válido;
- valida recurso y versión antes del efecto;
- comparte `concurrency_key` entre operaciones distintas cuando compiten por el mismo efecto;
- admite row lock, compare-and-set, constraint o versión equivalente;
- nunca resuelve conflicto mediante sobrescritura tardía.

##### 24.2. `OPERATION_CLAIM`

- un solo ejecutor posee autoridad de cierre por operación y generación;
- contenedor e hijos no comparten autoridad por inferencia;
- un transporte o scheduler no recibe claim empresarial por mover o disparar la operación;
- una pérdida de lease aplica fencing antes de cualquier nuevo cierre.

##### 24.3. `DEVICE_EFFECT_GUARD`

- protege la frontera antes de emitir el efecto al periférico;
- el receipt del adaptador y el resultado físico permanecen separados;
- una generación nueva no repite un envío cuya aceptación anterior es incierta;
- una copia nueva usa identidad nueva y no elude la guardia anterior.

##### 24.4. `SOURCE_EVENT_GUARD`

- reserva la identidad estable de evento antes del efecto;
- múltiples entregas concurrentes convergen a un único procesamiento válido;
- los recursos internos afectados mantienen su propia guardia de versión;
- la ausencia de ID de proveedor exige clave determinista aprobada antes de procesar;
- el orden entre eventos distintos se decide por versión/causalidad cuando corresponda.

---

#### 25. Handoff exacto a `QUEUE-ARC-010..012`

| Tarea                                                                             | Responsabilidad reservada recibida desde esta tarea                                                                                                                                                                                         |
| --------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `QUEUE-ARC-010 — Definir estados y eventos canónicos`                             | representar adquisición o rechazo de claim, renovación y pérdida de lease, cierre válido, rechazo por fencing, conflicto de versión, espera causal y resolución concurrente mediante estados/eventos canónicos sin redefinir esta semántica |
| `QUEUE-ARC-011 — Definir métricas de espera, ejecución y error`                   | medir contención, latencia de claim, expiraciones de lease, rechazos por fencing, conflictos CAS, duplicados suprimidos y colisiones por `concurrency_key` sin convertir métricas en política                                               |
| `QUEUE-ARC-012 — Definir autorización para crear, cancelar y reintentar trabajos` | definir quién puede forzar reasignación, romper o recuperar una exclusión, solicitar recovery, cancelar o ejecutar acciones extraordinarias sin convertir posesión de claim, lease, fencing o credencial técnica en permiso empresarial     |

Ninguna de esas responsabilidades se desarrolla en esta tarea.

---

#### 26. Prohibiciones

Esta tarea no autoriza:

1. crear tablas, columnas, constraints, índices, locks, funciones, RPC, triggers, queues o leases físicos;
2. modificar Supabase, datos, RLS, grants, Realtime, cron, Edge Functions, Storage o secretos;
3. modificar ANIMA, NEXO, PASS ni otro repositorio consumidor;
4. activar `QAI-008`;
5. retirar `QAI-004`;
6. alterar schedules, prioridades, `scheduled_at` o `deadline_at`;
7. redefinir `idempotency_key`, `payload_fingerprint`, perfiles de retry o presupuestos;
8. convertir assignment en claim;
9. convertir `syncing`, `processing`, un mutex de proceso o un request ID en garantía distribuida por inferencia;
10. conceder un segundo claim mientras el primero conserve autoridad válida sobre la misma frontera incompatible;
11. permitir que un worker con fencing obsoleto cierre o mutile una versión posterior;
12. repetir un efecto externo, físico o destructivo únicamente porque venció el lease;
13. usar `last write wins` para resolver estados o efectos empresariales sensibles;
14. fusionar `QAI-001` y `QAI-004` como una sola operación para ocultar su coexistencia;
15. usar un lock global que serialice trabajo independiente sin justificación contractual;
16. presentar row lock, unique constraint o cualquier primitiva aislada como prueba suficiente de conformidad end-to-end;
17. inventar un identificador de evento RevenueCat después de producir el efecto;
18. tratar `pg_net` como propietario de concurrencia empresarial;
19. cerrar el state machine ni los nombres finales de eventos;
20. fijar métricas, SLOs o alertas;
21. conceder autorización para romper locks, cancelar, recuperar o reintentar;
22. declarar conformidad operativa o física de los activos actuales por esta definición documental;
23. iniciar o desarrollar `QUEUE-ARC-010`.

---

#### 27. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea especializa para las 19 identidades inventariadas una obligación de confiabilidad ya registrada: reserva atómica de intención, un único ganador concurrente, bloqueo/versionado de recursos, control de claims, lease y fencing, rechazo de workers obsoletos, no duplicidad de efectos, orden causal y conciliación ante resultados inciertos. No introduce una obligación verificable independiente ni modifica alcance, estado, responsable, evidencia, relación o secuencia de requisitos vigentes.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

---

#### 28. Cobertura de prueba existente preservada

Se preserva sin modificación, en especial:

- `TREQ-INTEGRATION-003`, que ya exige identidad estable, no duplicidad, claim atómico, bloqueo, versión o mecanismo equivalente, retry controlado, conciliación, cola de fallos y recuperación manual sobre operaciones asíncronas;
- `TREQ-INTEGRATION-004`, que exige reconstruir causa, principal técnico, recurso, intento, resultado, error y efecto final de cadenas asíncronas sin pérdida silenciosa ni efectos duplicados;
- la cobertura específica vigente de ANIMA, PASS, NEXO, Supabase e integraciones relacionada con concurrencia, idempotencia, offline, webhooks, dispositivos, pagos y resultados ambiguos.

Ninguna fila del registro canónico cambia de identificador, dominio, regla protegida, estado, responsable, evidencia, relación o secuencia por esta tarea.

---

#### 29. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. conserva `QUEUE-ARC-008` como tarea anterior aprobada;
2. conserva `QUEUE-ARC-010` como única tarea siguiente reservada;
3. establece `WORK-CONCURRENCY-CONTROL-CONTRACT-001@1.0.0` sin crear una fuente de verdad paralela;
4. distingue idempotencia, deduplicación, asignación, claim, lease, fencing, attempt, versión de recurso, lock físico y resultado;
5. define las nueve clases de duplicidad o carrera materializadas sin reducirlas a una etiqueta genérica;
6. define `concurrency_key` como frontera mínima de efectos incompatibles;
7. permite que operaciones distintas compartan `concurrency_key` sin fusionar sus identidades;
8. define `claim_id`, `lease_token`, `lease_expires_at` y `fencing_token` con funciones separadas;
9. exige adquisición atómica de un único claim válido por frontera;
10. impide interpretar assignment o estado local como claim distribuido;
11. define que un claim no consume intento hasta que comienza una ejecución capaz de efecto;
12. define lease acotado sin ampliar deadline;
13. conserva claim, fencing y attempt durante una renovación de la misma ejecución;
14. exige nueva generación de fencing cuando cambia el ganador;
15. impide cierres y mutaciones de un worker obsoleto;
16. exige conciliación antes de repetir cuando el lease se pierde después de un posible efecto externo, físico o destructivo;
17. exige compare-and-set, versión esperada o mecanismo equivalente sobre recursos sensibles;
18. prohíbe `last write wins` para efectos empresariales sensibles;
19. conserva paralelismo entre unidades realmente independientes;
20. ordena por dependencia, versión, ocurrencia y causalidad antes que por mera llegada o prioridad;
21. separa assignment de claim y evita dos autoridades por reasignación;
22. integra retry sin reiniciar identidad, deadline ni presupuesto;
23. resuelve carrera cancelación/terminación por versión, fencing y frontera de efecto;
24. impide dos recuperadores válidos para la misma entrada o `recovery_request_id`;
25. exige claim nuevo antes de una reejecución extraordinaria autorizada;
26. conserva identidad separada de contenedores e hijos;
27. distingue schedule, ocurrencia y frontera de recurso;
28. obliga a `QAI-001` y `QAI-004` a compartir guardia de efecto por turno/recurso sin fusionar sus schedules;
29. obliga a `QAI-003` y `QAI-014` a respetar la versión vigente del turno al competir con otros cierres;
30. mantiene `QAI-008` como `PENDIENTE_DE_EVIDENCIA` sin activarlo;
31. conserva la unicidad actual de eventos de asistencia como protección compatible sin equipararla a lease/fencing;
32. conserva el row lock actual de reconciliación de checkout como protección compatible sin declararlo certificación completa;
33. documenta que el worker de eliminación de cuentas no acredita claim versionado end-to-end en el recorrido inspeccionado;
34. documenta que retirar trabajo de `localStorage` no acredita exclusión física de impresión;
35. preserva las protecciones actuales de Wompi y exige un único procesamiento válido por evento;
36. conserva la brecha de replay/concurrencia de RevenueCat sin inventar una identidad de proveedor ausente del contrato inspeccionado;
37. materializa exactamente una decisión para cada `QAI-001..QAI-019`;
38. obtiene 16 `APLICA_CONTROL_DE_CONCURRENCIA`, 2 `PROPAGA_NO_DECIDE_CONCURRENCIA` y 1 `NO_APLICA`;
39. obtiene 10 `RESOURCE_VERSION_GUARD`, 2 `OPERATION_CLAIM`, 1 `DEVICE_EFFECT_GUARD` y 3 `SOURCE_EVENT_GUARD` entre las 16 aplicables;
40. mantiene 0 identidades faltantes y 0 duplicadas;
41. mantiene `QAI-010` y `QAI-013` como propagadores técnicos, no como autoridades empresariales de concurrencia;
42. mantiene `QAI-016` como `NO_APLICA`;
43. reserva estados y eventos exactos para `QUEUE-ARC-010`;
44. reserva métricas y alertas para `QUEUE-ARC-011`;
45. reserva autoridad y segregación para `QUEUE-ARC-012`;
46. declara cero cambios de requisitos de prueba con justificación concreta;
47. crea cero objetos físicos;
48. modifica cero repositorios, Supabase, cron, colas, workers, dispositivos, adaptadores o webhooks;
49. no inicia ni desarrolla `QUEUE-ARC-010`.

---

#### 30. Resultado de la tarea

`QUEUE-ARC-009` deja establecido el contrato canónico de concurrencia del trabajo asíncrono:

```text
MISMA INTENCIÓN REPETIDA
→ MISMA OPERACIÓN
→ NO SEGUNDO EFECTO

MISMA OPERACIÓN
→ UN SOLO CLAIM VÁLIDO
→ LEASE ACOTADO
→ FENCING MONOTÓNICO

OPERACIONES DISTINTAS
+
MISMO RECURSO / EFECTO INCOMPATIBLE
→ MISMA FRONTERA DE CONCURRENCIA
→ VERSIÓN / CAS / LOCK EQUIVALENTE

LEASE PERDIDO
+
EFECTO POSIBLE
→ NO REPETIR A CIEGAS
→ CONCILIAR

WORKER TARDÍO
→ FENCING OBSOLETO
→ CIERRE RECHAZADO
```

Las 19 identidades inventariadas quedan reconciliadas una a una. La concurrencia deja de depender de que “un worker llegue primero” y pasa a exigir una autoridad técnica temporal, verificable y versionada; la idempotencia evita crear otra intención, el claim limita quién puede ejecutar, el fencing neutraliza ejecutores tardíos y la versión del recurso evita que una operación válida en el pasado sobrescriba una realidad empresarial más nueva.

---

#### 31. Continuidad

ÚLTIMA TAREA APROBADA

`QUEUE-ARC-008 — Definir cola de fallos y recuperación manual`

TAREA ACTUAL APROBADA

`QUEUE-ARC-009 — Definir bloqueo de duplicados y concurrencia`

SIGUIENTE TAREA RESERVADA

`QUEUE-ARC-010 — Definir estados y eventos canónicos`


### ✅ QUEUE-ARC-010 — Definir estados y eventos canónicos

**Estado:** APROBADA
**Tarea anterior:** `QUEUE-ARC-009 — Definir bloqueo de duplicados y concurrencia`
**Tarea siguiente:** `QUEUE-ARC-011 — Definir métricas de espera, ejecución y error`
**Tipo de tarea:** documental; especialización canónica del ciclo de vida durable y del registro inmutable de eventos del trabajo asíncrono, consolidando programación, asignación, claim, ejecución, retry, cancelación, incertidumbre, conciliación, aislamiento, recuperación, concurrencia y terminalidad para las 19 identidades `QAI-*`, sin implementar tablas, enums, triggers, workers, métricas, alertas ni autorización
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/03_INFRAESTRUCTURA_CANONICA_DE_COLAS.md`
**Línea base documental:** `vento-shell@622c29e32fa52db970d0a88916d884a57a3bace7`
**Contrato base de trabajo:** `TSVC-SVC-001.CONTRACT@1.0.0`
**Registro de confiabilidad consumido:** `TRANSVERSE-SERVICE-RELIABILITY-REGISTRY-001@1.0.0`
**Contrato de idempotencia consumido:** `WORK-IDEMPOTENCY-CONTRACT-001@1.0.0`
**Contrato temporal consumido:** `WORK-SCHEDULING-POLICY-CONTRACT-001@1.0.0`
**Contrato de asignación consumido:** `WORK-ASSIGNMENT-CONTRACT-001@1.0.0`
**Contrato de retry consumido:** `WORK-RETRY-POLICY-CONTRACT-001@1.0.0`
**Contrato de cancelación consumido:** `WORK-CANCELLATION-CONTRACT-001@1.0.0`
**Contrato de recuperación consumido:** `WORK-FAILURE-RECOVERY-CONTRACT-001@1.0.0`
**Contrato de concurrencia consumido:** `WORK-CONCURRENCY-CONTROL-CONTRACT-001@1.0.0`
**Inventario consumido:** `QUEUE-CURRENT-ASSET-INVENTORY-001` — 19 identidades `QAI-*`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir un único ciclo de vida durable para el trabajo asíncrono de Vento OS y un vocabulario inmutable de eventos capaz de reconstruir cómo una operación fue recibida, programada, asignada, reclamada, ejecutada, bloqueada, reintentada, cancelada, conciliada, aislada, recuperada o cerrada.

La regla raíz es:

```text
INTENCIÓN REGISTRADA
        ↓
ESTADO DURABLE ACTUAL
        +
HISTORIA INMUTABLE DE EVENTOS
        +
VERSIONADO MONOTÓNICO
        ↓
TRANSICIONES CONDICIONALES Y RECONSTRUIBLES
        ↓
RESULTADO AUTORITATIVO O AISLAMIENTO CONTROLADO
```

La separación canónica queda fijada así:

```text
ESTADO DEL TRABAJO ASÍNCRONO
≠ ESTADO EMPRESARIAL DEL RECURSO
≠ ESTADO DEL TRANSPORTE
≠ ESTADO DE UI
≠ ESTADO DEL PROVEEDOR
≠ RESULTADO FÍSICO
≠ EVENTO DE AUDITORÍA
≠ MÉTRICA
```

El estado del trabajo describe la situación operativa de una `operation_id`. No sustituye el estado de una orden, turno, pago, suscripción, solicitud de eliminación, mensaje, documento, impresión física ni otro recurso empresarial.

---

#### 2. Resultado sustantivo

Se establece `WORK-STATE-EVENT-CONTRACT-001@1.0.0` como especialización del ciclo de vida y de la historia de transición del contrato canónico de trabajo asíncrono.

El resultado material fija:

1. exactamente dieciséis estados durables de operación;
2. cuatro estados terminales y doce estados no terminales;
3. el mapeo explícito entre el vocabulario histórico de confiabilidad y los estados persistibles de esta tarea;
4. treinta y tres tipos de evento canónicos;
5. un sobre mínimo de estado y un sobre mínimo de evento;
6. versionado monotónico del estado y secuencia monotónica de eventos por operación;
7. la obligación de conservar `status_before` y `status_after` en todo evento que cambie estado;
8. la diferencia entre evento de transición y evento informativo que no cambia estado;
9. las transiciones admitidas entre programación, elegibilidad, asignación, claim, ejecución, retry, bloqueo, cancelación, incertidumbre, conciliación, aislamiento y cierre;
10. la representación de misfire, claim rechazado, lease perdido, fencing rechazado, conflicto de versión y duplicado suprimido sin inventar un segundo trabajo;
11. la integración exacta de las resoluciones aprobadas de cancelación y recuperación;
12. la regla de terminalidad que impide reabrir silenciosamente una operación ya cerrada;
13. el tratamiento de resultados tardíos sin sobrescribir una decisión terminal previa;
14. la separación entre estado actual y estados legacy observados en implementaciones existentes;
15. una decisión explícita para las 19 identidades `QAI-*`.

Balance:

| Métrica                                    | Resultado |
| ------------------------------------------ | --------: |
| Identidades `QAI-*` esperadas              |    **19** |
| Identidades materializadas                 |    **19** |
| `APLICA_ESTADOS_Y_EVENTOS`                 |    **16** |
| `PROPAGA_NO_DECIDE_ESTADO`                 |     **2** |
| `NO_APLICA`                                |     **1** |
| Estados durables canónicos                 |    **16** |
| Estados terminales                         |     **4** |
| Estados no terminales                      |    **12** |
| Tipos de evento canónicos                  |    **33** |
| Perfil `SCHEDULED_WORK`                    |     **9** |
| Perfil `OFFLINE_OR_DEVICE_WORK`            |     **4** |
| Perfil `EVENT_DRIVEN_WORK`                 |     **3** |
| Identificadores `QAI-*` duplicados         |     **0** |
| Identidades sin decisión                   |     **0** |
| Requisitos de prueba creados o modificados |     **0** |
| Objetos físicos creados o modificados      |     **0** |

---

#### 3. Herencia contractual obligatoria

`WORK-STATE-EVENT-CONTRACT-001@1.0.0` no redefine las decisiones sustantivas de las tareas anteriores. Únicamente les asigna una representación durable y una historia de eventos común.

Hereda obligatoriamente:

- de `TSVC-SVC-001.CONTRACT@1.0.0`, `operation_id`, `WORK_SUBMISSION`, `WORK_OUTCOME`, `WORK_ERROR`, causalidad, propiedad empresarial, versión contractual y resultado autoritativo;
- de `TRANSVERSE-SERVICE-RELIABILITY-REGISTRY-001@1.0.0`, `operation_status`, estado durable, resultado recuperable, `RESULT_UNKNOWN`, conciliación, `DEAD_LETTER`, `QUARANTINED`, claim, lease, fencing y prohibición de reabrir una intención terminal por retry;
- de `WORK-IDEMPOTENCY-CONTRACT-001@1.0.0`, reserva estable de intención, `receipt_id`, `idempotency_key`, `payload_fingerprint`, conflicto y recuperación del mismo trabajo;
- de `WORK-SCHEDULING-POLICY-CONTRACT-001@1.0.0`, `scheduled_at`, `deadline_at`, `schedule_occurrence_id`, `logical_fire_at_utc`, misfire y elegibilidad temporal;
- de `WORK-ASSIGNMENT-CONTRACT-001@1.0.0`, `assignment_id`, `assignment_version`, target técnico y reasignación versionada;
- de `WORK-RETRY-POLICY-CONTRACT-001@1.0.0`, `attempt_id`, `attempt_no`, `next_retry_at`, presupuesto, agotamiento y resultado ambiguo;
- de `WORK-CANCELLATION-CONTRACT-001@1.0.0`, `cancellation_request_id`, siete resoluciones de cancelación y separación entre solicitud, efectividad y llegada demasiado tardía;
- de `WORK-FAILURE-RECOVERY-CONTRACT-001@1.0.0`, `failure_entry_id`, `failure_entry_version`, tres carriles de aislamiento, `recovery_request_id`, seis acciones y ocho resoluciones de recovery;
- de `WORK-CONCURRENCY-CONTROL-CONTRACT-001@1.0.0`, `concurrency_key`, `claim_id`, lease, fencing, compare-and-set, conflicto de versión, orden causal y rechazo de ejecutores obsoletos;
- de `QUEUE-CURRENT-ASSET-INVENTORY-001`, las 19 identidades materiales y sus brechas observadas.

La tarea no concede autoridad empresarial. Registrar o producir un evento técnico no autoriza a crear, cancelar, recuperar, reintentar o forzar una operación; esa decisión permanece en `QUEUE-ARC-012`.

---

#### 4. Separación entre estado de trabajo y estado empresarial

Toda implementación futura deberá conservar dos planos distintos:

```text
PLANO EMPRESARIAL
orden / turno / pago / suscripción / solicitud / mensaje / documento / recurso

PLANO DE TRABAJO ASÍNCRONO
operation_id / operation_status / intentos / claims / eventos / resultado técnico
```

Reglas:

1. el estado de una entidad empresarial no se copia ni renombra automáticamente como `operation_status`;
2. `operation_status = succeeded` significa que el trabajo produjo o recuperó su resultado autoritativo; no significa que el recurso empresarial deba llamarse `succeeded`;
3. `operation_status = failed` no obliga a marcar como fallido el proceso empresarial cuando el contrato propietario admita otra decisión;
4. `operation_status = cancelled` describe terminalidad del trabajo, no rollback ni compensación del recurso;
5. `operation_status = expired` describe vencimiento de la intención de trabajo, no borrado de la fuente que la originó;
6. un booleano `processed`, un estado de workflow, un callback HTTP, un status de proveedor o una marca local de UI no sustituyen el estado transversal;
7. una aplicación puede proyectar el estado transversal a su UI con vocabulario propio, siempre que no altere su significado;
8. la aplicación propietaria conserva la autoridad sobre el resultado empresarial y sobre cualquier compensación o acción posterior.

---

#### 5. Estados durables canónicos

El campo `operation_status` utiliza exactamente este vocabulario cerrado inicial:

| Estado             | Clase       | Semántica canónica                                                                                                                                   |
| ------------------ | ----------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| `queued`           | no terminal | intención reservada y admitida, temporalmente elegible o pendiente de selección técnica, sin ejecución activa                                        |
| `scheduled`        | no terminal | intención registrada cuyo `scheduled_at` o condición temporal todavía impide ejecución ordinaria                                                     |
| `assigned`         | no terminal | existe una `assignment_version` compatible y la operación puede intentar adquirir claim cuando sea elegible                                          |
| `blocked`          | no terminal | existe una condición concreta de dependencia, versión, capacidad, autoridad, dispositivo u otra restricción que impide ejecutar sin consumir intento |
| `claimed`          | no terminal | existe un claim técnico vigente con lease/fencing aplicables, pero todavía no se acredita inicio de una ejecución capaz de efecto                    |
| `processing`       | no terminal | existe un `attempt_id` iniciado bajo autoridad técnica vigente y la operación está ejecutando una etapa capaz de producir efecto                     |
| `cancel_requested` | no terminal | existe una solicitud de cancelación válida registrada cuya efectividad todavía no se ha resuelto                                                     |
| `retry_pending`    | no terminal | el intento anterior terminó sin éxito, el error admite otra ejecución y existe `next_retry_at`, presupuesto y vigencia suficientes                   |
| `result_unknown`   | no terminal | el efecto pudo ocurrir, pero no existe evidencia suficiente para declarar éxito, fallo, cancelación ni seguridad de repetición                       |
| `reconciling`      | no terminal | se están consultando fuentes autoritativas para resolver `result_unknown`, efecto parcial o divergencia                                              |
| `quarantined`      | no terminal | la operación está aislada por conflicto, orden inválido, contrato incompatible o unidad no procesable y requiere revisión controlada                 |
| `dead_letter`      | no terminal | el tratamiento automático terminó o agotó presupuesto y la operación permanece aislada para resolución controlada                                    |
| `succeeded`        | terminal    | existe un resultado autoritativo compatible y no queda efecto ordinario pendiente de la misma operación                                              |
| `failed`           | terminal    | existe cierre técnico o contractual definitivo para la misma operación y no queda retry ordinario ni recovery de la misma intención pendiente        |
| `cancelled`        | terminal    | quedó garantizado que no habrá efectos ordinarios posteriores de la operación por cancelación efectiva                                               |
| `expired`          | terminal    | venció la intención sin efecto ambiguo pendiente y no pueden iniciarse nuevos intentos ordinarios                                                    |

Reglas:

1. los cuatro estados terminales son `succeeded`, `failed`, `cancelled` y `expired`;
2. `dead_letter` y `quarantined` no son terminales porque `QUEUE-ARC-008` permite revisión o recuperación controlada;
3. `result_unknown` y `reconciling` no son equivalentes a fallo;
4. `cancel_requested` no es equivalente a `cancelled`;
5. `claimed` no es equivalente a `processing`;
6. `assigned` no es equivalente a `claimed`;
7. `scheduled` no es equivalente a `queued` cuando la ventana temporal aún no permite ejecución;
8. un error transitorio no utiliza `failed`; utiliza `retry_pending` cuando procede otro intento;
9. un presupuesto automático agotado no se fuerza directamente a `failed` si la política aprobada exige `dead_letter` o conciliación;
10. un conflicto que exige revisión utiliza `quarantined` o `blocked` según si la unidad debe aislarse o solo esperar una condición resoluble.

---

#### 6. Mapeo del vocabulario de confiabilidad ya aprobado

El ciclo de `TSVC-CAT-006` se conserva sin cambiar su significado. Esta tarea fija cómo se representa en el campo persistible `operation_status` y en los eventos:

| Término aprobado en confiabilidad | Representación de `QUEUE-ARC-010`                                                                    |
| --------------------------------- | ---------------------------------------------------------------------------------------------------- |
| `RECEIVED`                        | evento `WORK_RECEIVED`; todavía no obliga a crear un estado durable si la intención no fue reservada |
| `RESERVED`                        | evento `WORK_RESERVED`; produce `scheduled` o `queued` según la política temporal                    |
| `CLAIMED`                         | `claimed`                                                                                            |
| `EXECUTING`                       | `processing`                                                                                         |
| `RETRY_SCHEDULED`                 | `retry_pending`                                                                                      |
| `SUCCEEDED`                       | `succeeded`                                                                                          |
| `FAILED_TERMINAL`                 | `failed`                                                                                             |
| `RESULT_UNKNOWN`                  | `result_unknown`                                                                                     |
| `RECONCILING`                     | `reconciling`                                                                                        |
| `BLOCKED`                         | `blocked`                                                                                            |
| `CANCEL_REQUESTED`                | `cancel_requested`                                                                                   |
| `CANCELLED`                       | `cancelled`                                                                                          |
| `EXPIRED`                         | `expired`                                                                                            |
| `QUARANTINED`                     | `quarantined`                                                                                        |
| `DEAD_LETTER`                     | `dead_letter`                                                                                        |

`scheduled` y `assigned` completan dimensiones ya aprobadas en `QUEUE-ARC-004` y `QUEUE-ARC-005` que el ciclo de confiabilidad general no representaba como estados persistibles separados.

---

#### 7. Sobre mínimo de estado

Toda materialización futura del estado actual deberá poder conservar, cuando aplique:

```text
operation_id
operation_version
operation_status
status_version
status_changed_at
status_reason_code
status_event_id
previous_status
service_id
contract_id
contract_version
business_owner_application
producer_application
idempotency_key
payload_fingerprint
scheduled_at
deadline_at
next_retry_at
assignment_id
assignment_version
attempt_id
attempt_no
claim_id
lease_expires_at
fencing_token
resource_reference
resource_version
schedule_occurrence_id
cancellation_request_id
failure_entry_id
failure_entry_version
recovery_request_id
result_ref
error_code
reconciliation_status
```

Reglas:

1. `status_version` es monotónico por `operation_id` y aumenta exactamente una vez por cada transición durable aceptada;
2. `status_event_id` identifica el evento que produjo la versión actual;
3. `previous_status` conserva el estado inmediatamente anterior sin sustituir la historia de eventos;
4. un evento informativo que no cambie `operation_status` no incrementa `status_version`;
5. los campos no aplicables permanecen ausentes o `NO_APLICA`; no se inventan identidades;
6. el estado actual y el evento que lo produce se persisten atómicamente o mediante un mecanismo equivalente que impida una proyección sin historia o una historia que afirme una transición no aplicada;
7. la implementación puede usar snapshot más historial, event log con proyección, outbox o mecanismo equivalente; esta tarea no impone event sourcing como tecnología;
8. secretos, tokens, credenciales y payloads sensibles completos no forman parte del estado.

---

#### 8. Sobre mínimo de evento

Todo evento canónico de trabajo deberá poder conservar:

```text
event_id
event_type
event_version
operation_id
operation_version
event_sequence
status_version
status_before
status_after
occurred_at
recorded_at
reason_code
correlation_id
causation_id
producer_application
business_owner_application
actor_reference
service_principal_id
assignment_id
assignment_version
attempt_id
attempt_no
claim_id
fencing_token
schedule_occurrence_id
cancellation_request_id
failure_entry_id
failure_entry_version
recovery_request_id
provider_event_id
resource_reference
resource_version
result_ref
error_code
reconciliation_status
metadata_ref
```

Reglas:

1. `event_id` es único e inmutable;
2. reingresar el mismo `event_id` recupera el mismo evento y no crea una segunda transición;
3. `event_sequence` es monotónico por `operation_id` y ordena la historia aceptada de la operación;
4. `occurred_at` representa cuándo ocurrió el hecho observado y `recorded_at` cuándo fue registrado; ninguno sustituye el orden causal o el versionado;
5. eventos recibidos tarde conservan su tiempo real sin poder sobrescribir una versión posterior únicamente por timestamp;
6. todo evento que cambie estado declara `status_before`, `status_after` y la nueva `status_version`;
7. todo evento que no cambie estado conserva `status_before = status_after` y la `status_version` vigente;
8. `actor_reference` y `service_principal_id` identifican participación técnica o humana sin incluir credenciales;
9. `metadata_ref` apunta a metadata protegida cuando sea necesaria; no convierte el evento en depósito de payloads sensibles;
10. una corrección de metadata o interpretación se agrega como otro evento o versión relacionada; no se reescribe silenciosamente la historia previa.

---

#### 9. Catálogo cerrado de eventos canónicos

Se definen exactamente treinta y tres tipos iniciales.

| Evento                         | Cambio de estado | Semántica                                                                                                                       |
| ------------------------------ | ---------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `WORK_RECEIVED`                | no obligatorio   | una solicitud llegó a la frontera del servicio antes de completar reserva idempotente                                           |
| `WORK_RESERVED`                | sí               | la intención fue reservada; el estado resultante es `scheduled` o `queued`                                                      |
| `WORK_SCHEDULED`               | sí o no          | se fijó o actualizó de forma versionada una espera temporal; usa `scheduled` cuando todavía no es elegible                      |
| `WORK_ELIGIBLE`                | sí               | la condición temporal dejó de bloquear y la operación pasa a `queued` o `assigned` después de revalidar                         |
| `WORK_MISFIRE_DETECTED`        | no obligatorio   | una ocurrencia no fue ejecutada en su momento lógico y requiere aplicar la política de misfire vigente                          |
| `WORK_MISFIRE_RESOLVED`        | sí o no          | registra si la ocurrencia sigue elegible, fue coalescida de forma compatible o quedó vencida según el contrato temporal         |
| `WORK_EXPIRED`                 | sí               | la operación cierra como `expired` únicamente cuando no existe efecto ambiguo pendiente                                         |
| `WORK_ASSIGNMENT_RECORDED`     | sí o no          | se materializó una asignación compatible; si la operación ya es temporalmente elegible puede pasar a `assigned`                 |
| `WORK_REASSIGNMENT_RECORDED`   | sí o no          | se registró una nueva `assignment_version` sin crear otra intención                                                             |
| `WORK_BLOCKED`                 | sí               | una condición concreta impide continuar y la operación pasa a `blocked`                                                         |
| `WORK_UNBLOCKED`               | sí               | desapareció el bloqueo y la operación se reevalúa hacia `scheduled`, `queued` o `assigned`                                      |
| `WORK_CLAIM_ACQUIRED`          | sí               | un único ganador obtuvo autoridad técnica vigente y la operación pasa a `claimed`                                               |
| `WORK_CLAIM_REJECTED`          | no               | otro claim, versión, bloqueo o condición vigente impidió adquirir autoridad; no crea intento                                    |
| `WORK_LEASE_RENEWED`           | no               | se extendió el lease del mismo claim sin crear otro intento ni fencing                                                          |
| `WORK_LEASE_LOST`              | sí o no          | el claim dejó de ser vigente; el destino posterior depende de si hubo ejecución y de si el efecto pudo ocurrir                  |
| `WORK_PROCESSING_STARTED`      | sí               | comenzó un `attempt_id` capaz de producir efecto y la operación pasa a `processing`                                             |
| `WORK_FENCING_REJECTED`        | no               | una generación obsoleta intentó cerrar o mutar y fue rechazada sin alterar el estado válido actual                              |
| `WORK_VERSION_CONFLICT`        | sí o no          | una versión observada dejó de ser compatible; puede bloquear o aislar según la naturaleza del conflicto                         |
| `WORK_DUPLICATE_SUPPRESSED`    | no               | una repetición de intención, fuente o efecto fue reconocida y no produjo otro trabajo o efecto                                  |
| `WORK_ATTEMPT_RETRY_SCHEDULED` | sí               | un intento reintentable terminó y la operación pasa a `retry_pending` con `next_retry_at` válido                                |
| `WORK_RETRY_DUE`               | sí               | llegó la próxima oportunidad de retry y la operación se reevalúa hacia `queued` o `assigned`                                    |
| `WORK_CANCELLATION_REQUESTED`  | sí               | se registró una solicitud válida y la operación pasa a `cancel_requested` mientras se resuelve su efectividad                   |
| `WORK_CANCELLATION_RESOLVED`   | sí o no          | registra una de las resoluciones aprobadas de cancelación y aplica el estado resultante correspondiente                         |
| `WORK_RESULT_UNKNOWN`          | sí               | existe un posible efecto sin confirmación y la operación pasa a `result_unknown`                                                |
| `WORK_RECONCILIATION_STARTED`  | sí               | comenzó conciliación contra fuentes autoritativas y la operación pasa a `reconciling`                                           |
| `WORK_RECONCILIATION_RESOLVED` | sí o no          | registra el resultado de conciliación y conduce a terminalidad, retry, aislamiento o permanencia según evidencia                |
| `WORK_QUARANTINED`             | sí               | un conflicto, orden inválido, contrato incompatible o unidad no procesable lleva a `quarantined`                                |
| `WORK_DEAD_LETTERED`           | sí               | agotamiento o fallo técnico terminal automático lleva a `dead_letter` sin declarar resultado empresarial                        |
| `WORK_RECOVERY_REQUESTED`      | no obligatorio   | se abrió una intervención identificada sobre una entrada aislada; no ejecuta por sí sola                                        |
| `WORK_RECOVERY_RESOLVED`       | sí o no          | registra la resolución de recovery y solo cambia estado cuando esa resolución lo exige                                          |
| `WORK_SUCCEEDED`               | sí               | el resultado autoritativo queda confirmado y la operación pasa a `succeeded`                                                    |
| `WORK_FAILED`                  | sí               | la operación obtiene un cierre definitivo compatible con `failed`                                                               |
| `WORK_LATE_RESULT_OBSERVED`    | no automático    | se observó evidencia después de una decisión terminal o pérdida de autoridad; nunca sobrescribe directamente el estado terminal |

Los eventos no crean una segunda taxonomía de errores, cancelación, recovery o concurrencia. `reason_code`, `cancellation_resolution`, `recovery_action`, `recovery_resolution`, `isolation_reason` y `error_class` conservan los vocabularios aprobados por sus contratos propietarios.

---

#### 10. Regla de transición y consistencia

Toda transición durable deberá satisfacer simultáneamente:

```text
OPERATION_ID CORRECTA
+
STATUS_VERSION ESPERADA
+
ESTADO ACTUAL COMPATIBLE
+
CONTRATO Y VERSIÓN VIGENTES
+
TEMPORALIDAD VÁLIDA CUANDO APLIQUE
+
CLAIM / FENCING VIGENTES CUANDO APLIQUE
+
RESOURCE_VERSION COMPATIBLE CUANDO APLIQUE
+
CONTROL DE CANCELACIÓN VIGENTE
        ↓
TRANSICIÓN ACEPTADA
        ↓
NUEVA STATUS_VERSION + EVENTO INMUTABLE
```

Reglas:

1. dos escritores no pueden producir dos `status_version` distintas desde la misma versión esperada sin que una sea rechazada o conciliada;
2. un evento de transición con `status_before` incompatible no se aplica por conveniencia;
3. un worker con fencing obsoleto no puede emitir una transición autoritativa de cierre;
4. una operación no cambia a terminal únicamente porque el runtime desaparezca, el transporte se vacíe o un callback no llegue;
5. el estado proyectado actual y la historia deben converger al mismo resultado;
6. `last write wins` queda prohibido para resolver el estado canónico;
7. una transición rechazada puede producir un evento informativo de conflicto o fencing sin modificar el estado vigente;
8. un evento externo puede causar una transición, pero el evento del proveedor y el evento canónico del trabajo conservan identidades distintas.

---

#### 11. Transiciones canónicas permitidas

La siguiente matriz describe destinos permitidos. La existencia de un destino no concede autoridad para ejecutarlo; solo declara compatibilidad semántica.

| Estado actual      | Destinos permitidos por transición válida                                                                                                       |
| ------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `scheduled`        | `queued`, `assigned`, `blocked`, `cancel_requested`, `expired`                                                                                  |
| `queued`           | `scheduled`, `assigned`, `blocked`, `cancel_requested`, `expired`, `quarantined`                                                                |
| `assigned`         | `scheduled`, `blocked`, `claimed`, `cancel_requested`, `expired`, `quarantined`                                                                 |
| `blocked`          | `scheduled`, `queued`, `assigned`, `cancel_requested`, `expired`, `quarantined`, `dead_letter`, `result_unknown`                                |
| `claimed`          | `processing`, `queued`, `assigned`, `blocked`, `cancel_requested`, `retry_pending`, `result_unknown`, `expired`                                 |
| `processing`       | `succeeded`, `retry_pending`, `blocked`, `cancel_requested`, `result_unknown`, `quarantined`, `dead_letter`, `failed`, `expired`                |
| `cancel_requested` | `cancelled`, `processing`, `retry_pending`, `blocked`, `result_unknown`, `reconciling`, `succeeded`, `failed`, `expired`                        |
| `retry_pending`    | `scheduled`, `queued`, `assigned`, `blocked`, `cancel_requested`, `result_unknown`, `dead_letter`, `expired`                                    |
| `result_unknown`   | `reconciling`, `succeeded`, `failed`, `cancelled`, `expired`, `quarantined`, `dead_letter`                                                      |
| `reconciling`      | `succeeded`, `failed`, `cancelled`, `expired`, `retry_pending`, `queued`, `assigned`, `blocked`, `quarantined`, `dead_letter`, `result_unknown` |
| `quarantined`      | `reconciling`, `queued`, `assigned`, `blocked`, `failed`, `cancelled`, `expired`, `dead_letter`                                                 |
| `dead_letter`      | `reconciling`, `queued`, `assigned`, `blocked`, `failed`, `cancelled`, `expired`, `quarantined`                                                 |
| `succeeded`        | ninguno; terminal                                                                                                                               |
| `failed`           | ninguno; terminal                                                                                                                               |
| `cancelled`        | ninguno; terminal                                                                                                                               |
| `expired`          | ninguno; terminal                                                                                                                               |

Reglas adicionales:

1. volver desde aislamiento a `queued` o `assigned` solo ocurre mediante recovery controlado, nunca por un retry automático que reinicie presupuesto;
2. `claimed → queued` o `claimed → assigned` solo procede cuando se pierde o libera autoridad antes de iniciar un efecto y la operación sigue elegible;
3. `processing → expired` solo procede si puede demostrarse que no existe efecto ambiguo; en caso contrario se usa `result_unknown`;
4. un conflicto de versión no obliga siempre a `quarantined`: puede utilizar `blocked` cuando la condición sea temporalmente resoluble sin alterar la intención;
5. las operaciones terminales no vuelven a estados activos; una acción posterior legítima se modela como nueva operación o como episodio de conciliación vinculado que no reabre silenciosamente el estado terminal.

---

#### 12. Programación, elegibilidad y misfire

Para trabajo recurrente:

1. la reserva de una ocurrencia futura usa `scheduled` mientras `scheduled_at > now_utc`;
2. al alcanzar elegibilidad se emite `WORK_ELIGIBLE` y la operación pasa a `queued` o `assigned` según exista asignación compatible;
3. `WORK_MISFIRE_DETECTED` conserva `schedule_id`, `schedule_version`, `schedule_occurrence_id` y `logical_fire_at_utc`;
4. `RUN_ONCE_IF_STILL_VALID` permite continuar la misma ocurrencia únicamente si sigue antes de `deadline_at` y satisface las demás precondiciones;
5. `COALESCE_TO_LATEST_VALID` decide qué ocurrencia sigue siendo elegible sin fusionar identidades ni borrar las ocurrencias omitidas;
6. una ocurrencia vencida sin efecto ambiguo usa `WORK_EXPIRED`;
7. una ocurrencia que pudo ejecutar efecto antes de ser detectada como tardía utiliza `result_unknown` y conciliación, no `expired` por inferencia;
8. modificar calendario, zona horaria, vigencia o regla de misfire conserva las reglas de versionado de `QUEUE-ARC-004` y no se representa como edición retroactiva de eventos históricos.

---

#### 13. Asignación, claim, lease y fencing

1. `WORK_ASSIGNMENT_RECORDED` puede existir mientras una operación sigue `scheduled`; la asignación no la vuelve temporalmente elegible;
2. cuando la operación es elegible y existe una asignación compatible, el estado puede ser `assigned`;
3. `WORK_CLAIM_ACQUIRED` produce `claimed` y registra `claim_id`, lease y fencing aplicables;
4. `WORK_CLAIM_REJECTED` no crea `attempt_id` ni cambia estado por sí solo;
5. `WORK_LEASE_RENEWED` mantiene el mismo claim, fencing y intento cuando la ejecución ya comenzó;
6. `WORK_LEASE_LOST` antes de iniciar intento puede devolver la operación a `queued` o `assigned` después de revalidar;
7. si el lease se pierde durante ejecución y puede probarse que no hubo efecto, la política de retry decide entre `retry_pending`, `blocked` o cierre;
8. si el efecto pudo ocurrir antes de la pérdida de lease, el destino obligatorio es `result_unknown`;
9. `WORK_FENCING_REJECTED` nunca permite al ejecutor obsoleto cambiar el estado actual;
10. `WORK_VERSION_CONFLICT` conserva la versión observada y la vigente para decidir bloqueo, cuarentena o conciliación;
11. `WORK_DUPLICATE_SUPPRESSED` conserva el estado original y referencia el receipt, resultado o intención ya existente.

---

#### 14. Retry y agotamiento

1. un intento transitorio fallido que conserva presupuesto y vigencia emite `WORK_ATTEMPT_RETRY_SCHEDULED` y pasa a `retry_pending`;
2. `retry_pending` exige `next_retry_at`, `error_class`, presupuesto restante y `deadline_at` vigente;
3. al llegar `next_retry_at`, `WORK_RETRY_DUE` no inicia ejecución por sí solo: revalida temporalidad, cancelación, asignación, dependencia y recurso;
4. después de la revalidación vuelve a `queued` o `assigned` y debe adquirir un claim nuevo antes del siguiente intento;
5. agotar el presupuesto sin efecto ambiguo utiliza `dead_letter` cuando la política exige aislamiento;
6. un error no reintentable con cierre definitivo puede producir `failed`;
7. un error no reintentable que exige revisión de contenido, contrato, orden o versión puede producir `quarantined`;
8. un timeout posterior a posible efecto nunca produce directamente `retry_pending`; primero usa `result_unknown`;
9. la recuperación extraordinaria desde aislamiento no reinicia `max_attempts` ni reutiliza el evento de retry ordinario.

---

#### 15. Cancelación

La resolución de `WORK_CANCELLATION_RESOLVED` utiliza exactamente el vocabulario aprobado por `WORK-CANCELLATION-CONTRACT-001@1.0.0`.

| Resolución de cancelación                | Estado resultante                                                                 |
| ---------------------------------------- | --------------------------------------------------------------------------------- |
| `REQUEST_ACCEPTED_PENDING_EFFECTIVENESS` | `cancel_requested`                                                                |
| `EFFECTIVE_BEFORE_EXECUTION`             | `cancelled`                                                                       |
| `EFFECTIVE_AT_SAFE_POINT`                | `cancelled`                                                                       |
| `TOO_LATE_EFFECT_CONFIRMED`              | conservar o completar el resultado autoritativo; nunca `cancelled` por inferencia |
| `RESULT_UNKNOWN_RECONCILIATION_REQUIRED` | `result_unknown`                                                                  |
| `ALREADY_TERMINAL_NO_CHANGE`             | conservar el estado terminal existente                                            |
| `NOT_CANCELLABLE_BY_CONTRACT`            | revalidar y conservar el estado operativo previo compatible; no `cancelled`       |

Reglas:

1. `WORK_CANCELLATION_REQUESTED` conserva la referencia al estado desde el que se solicitó control para poder reconstruir la resolución;
2. una solicitud aceptada pero pendiente de efectividad no oculta un intento que todavía pueda estar ejecutando;
3. hacer efectiva la cancelación impide nuevos intentos y nuevos efectos ordinarios;
4. una cancelación demasiado tardía conserva el resultado ya confirmado;
5. cuando no puede demostrarse precedencia entre cancelación y efecto, se usa `result_unknown`;
6. una operación terminal no se reabre para marcarla cancelada;
7. rechazo por falta de autoridad se representará conforme a `QUEUE-ARC-012` sin convertir automáticamente la operación en terminal.

---

#### 16. Resultado desconocido y conciliación

1. `WORK_RESULT_UNKNOWN` exige evidencia concreta de que un efecto pudo ocurrir sin confirmación suficiente;
2. mientras el estado sea `result_unknown`, quedan prohibidos reintentos ciegos del mismo efecto;
3. `WORK_RECONCILIATION_STARTED` produce `reconciling` y conserva referencias a las fuentes que deben consultarse;
4. la conciliación distingue `CONFIRMED_EXECUTED`, `CONFIRMED_NOT_EXECUTED`, `PARTIALLY_EXECUTED`, `EXECUTED_INCOMPATIBLE_RESULT` y `UNDETERMINABLE` según `QUEUE-ARC-008`;
5. `CONFIRMED_EXECUTED` cierra con el estado que corresponda al resultado autoritativo recuperado, sin repetir efecto;
6. `CONFIRMED_NOT_EXECUTED` solo vuelve a trabajo ejecutable si retry o recovery lo permiten, la intención sigue vigente y no está cancelada;
7. `PARTIALLY_EXECUTED` permanece bajo conciliación hasta resolver componentes faltantes o crear una operación correctiva compatible;
8. `EXECUTED_INCOMPATIBLE_RESULT` no se corrige mediante `last write wins`; permanece aislado o bloqueado hasta decisión propietaria;
9. `UNDETERMINABLE` conserva `result_unknown` o `reconciling` y prohíbe repetición insegura;
10. un resultado empresarial que el servicio técnico no pueda inferir queda para la aplicación propietaria.

---

#### 17. Aislamiento y recuperación manual

##### 17.1. Aislamiento

- `WORK_QUARANTINED` produce `quarantined` para conflicto, poison, orden inválido, contrato incompatible o revisión obligatoria;
- `WORK_DEAD_LETTERED` produce `dead_letter` cuando el tratamiento automático terminó o agotó presupuesto sin efecto ambiguo que exija primero conciliación;
- ninguna de las dos condiciones equivale a resultado empresarial terminal;
- aislar conserva `operation_id`, intentos, errores, resultado conocido y causalidad.

##### 17.2. Recovery

`WORK_RECOVERY_REQUESTED` registra `recovery_request_id` sin sacar automáticamente la operación del aislamiento.

`WORK_RECOVERY_RESOLVED` aplica las resoluciones aprobadas por `QUEUE-ARC-008`:

| Resolución de recovery                  | Regla de estado                                                                                                     |
| --------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| `RESULT_RECOVERED`                      | cerrar con el estado que corresponda al resultado autoritativo recuperado; no asumir siempre `succeeded`            |
| `SAFE_REEXECUTION_APPROVED`             | revalidar vigencia y asignación; después pasar a `queued` o `assigned` antes de adquirir un claim nuevo             |
| `MISSING_COMPONENT_COMPLETION_APPROVED` | conservar causalidad y habilitar únicamente componentes faltantes mediante trabajo compatible                       |
| `CORRECTIVE_OPERATION_REQUIRED`         | la operación original no se muta para cambiar intención; se crea una operación nueva relacionada cuando corresponda |
| `NO_SAFE_REEXECUTION`                   | permanecer aislada o cerrar según la decisión propietaria compatible; nunca repetir a ciegas                        |
| `OWNER_DECISION_REQUIRED`               | permanecer `blocked`, `quarantined`, `dead_letter` o `reconciling` según la condición real                          |
| `KEEP_ISOLATED`                         | conservar `quarantined` o `dead_letter` sin ejecución                                                               |
| `ALREADY_RESOLVED_NO_CHANGE`            | conservar el estado y resultado ya vigentes                                                                         |

Una ejecución extraordinaria aprobada sigue utilizando `WORK_CLAIM_ACQUIRED` y `WORK_PROCESSING_STARTED`; no crea un ciclo paralelo de estados de recovery.

---

#### 18. Terminalidad y resultados tardíos

Los estados `succeeded`, `failed`, `cancelled` y `expired` son inmutables respecto de la operación original.

Reglas:

1. un retry no reabre un estado terminal;
2. una reasignación no reabre un estado terminal;
3. un claim tardío no reabre un estado terminal;
4. una solicitud de cancelación tardía conserva `ALREADY_TERMINAL_NO_CHANGE` o `TOO_LATE_EFFECT_CONFIRMED` según evidencia;
5. una nueva necesidad empresarial después de terminalidad utiliza una nueva operación causalmente vinculada;
6. `expired` solo se usa como terminal cuando al cerrar no existe un efecto previo ambiguo pendiente;
7. si un callback, proveedor, dispositivo o worker reporta después un posible efecto que contradice una terminalidad previa, se emite `WORK_LATE_RESULT_OBSERVED` y se abre un episodio de conciliación vinculado sin sobrescribir directamente el estado terminal;
8. el episodio tardío conserva la decisión anterior, la nueva evidencia y cualquier operación correctiva posterior;
9. un resultado tardío de un worker con fencing obsoleto no se convierte automáticamente en resultado válido;
10. la aplicación propietaria decide cualquier consecuencia empresarial derivada de una discrepancia terminal.

---

#### 19. Contenedores, hijos y batches

1. un contenedor y cada hijo con efecto independiente conservan `operation_id`, `operation_status`, `status_version` y eventos propios;
2. el estado del contenedor no se infiere únicamente de que una cola local quede vacía;
3. un hijo `succeeded` no vuelve a ejecutarse porque el contenedor entre a retry;
4. un hijo `result_unknown` mantiene al contenedor sin cierre incompatible hasta resolver la dependencia requerida;
5. un batch puede estar `processing` mientras hijos distintos estén en estados diferentes;
6. el cierre del contenedor se calcula desde resultados hijos autoritativos y su contrato, no por conteo de callbacks;
7. los eventos hijos conservan `causation_id` o referencia equivalente al contenedor cuando corresponda;
8. el orden causal prevalece sobre timestamps de llegada.

---

#### 20. Perfiles de ciclo de vida para el inventario `QAI-*`

Se utilizan tres perfiles de aplicación y dos clasificaciones no propietarias:

| Perfil                   | Identidades                                | Regla base                                                                                                                                            |
| ------------------------ | ------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| `SCHEDULED_WORK`         | `QAI-001..QAI-009`                         | reserva de ocurrencia, `scheduled` cuando corresponda, elegibilidad, asignación, claim, intento y cierre; misfire conserva la identidad de ocurrencia |
| `OFFLINE_OR_DEVICE_WORK` | `QAI-011`, `QAI-012`, `QAI-014`, `QAI-015` | custodia local o dispositivo antes del efecto servidor/físico; persistencia local no sustituye estado autoritativo ni resultado                       |
| `EVENT_DRIVEN_WORK`      | `QAI-017`, `QAI-018`, `QAI-019`            | evento fuente estable, reserva/deduplicación, procesamiento interno y resultado; replay recupera la misma operación                                   |
| `UPSTREAM_PROPAGATED`    | `QAI-010`, `QAI-013`                       | mecanismo técnico que transporta o ejecuta decisiones de operaciones upstream y no crea su propio ciclo empresarial                                   |
| `NO_APLICA`              | `QAI-016`                                  | refresco de lectura sin trabajo durable ni efecto empresarial                                                                                         |

---

#### 21. Reconciliación con implementaciones actuales

##### 21.1. Jobs recurrentes y schedules

Los estados de ejecución que expongan `pg_cron`, GitHub Actions, un runtime o un scheduler son evidencia técnica de esa capa. No reemplazan `operation_status` de una ocurrencia ni el resultado de los trabajos hijos.

Una ejecución del scheduler puede terminar técnicamente mientras una entrega hija permanezca `processing`, `retry_pending`, `result_unknown` o aislada.

##### 21.2. Eliminación programada de cuentas

La tabla `account_deletion_requests` utiliza actualmente `pending`, `processing`, `completed`, `rejected`, `canceled` y `failed` como vocabulario del proceso de eliminación.

Decisión documental:

```text
account_deletion_requests.status
= ESTADO DEL PROCESO / SOLICITUD EMPRESARIAL EXISTENTE

operation_status
= ESTADO DEL TRABAJO ASÍNCRONO QUE PROCESA LA SOLICITUD
```

Por tanto:

- `processing` del registro actual no acredita por sí solo `claimed` ni fencing vigente;
- `failed` del registro actual no equivale automáticamente a `failed` canónico porque `QUEUE-ARC-008` ya documentó posibles efectos parciales destructivos;
- `completed` puede correlacionarse con un trabajo `succeeded` únicamente cuando exista resultado autoritativo suficiente;
- `canceled` empresarial no sustituye la resolución de `cancellation_request_id` del trabajo.

La adopción física se recibe en `DELIV-PKG-001`.

##### 21.3. Colas offline ANIMA

Las colas actuales conservan `pending`, `syncing`, `failed` y `conflict`.

La reconciliación queda así:

| Estado local actual | Relación con el contrato canónico                                                                                                        |
| ------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `pending`           | evidencia de trabajo local pendiente; puede corresponder a `queued` o `retry_pending` según `nextRetryAt`, pero no se mapea sin contexto |
| `syncing`           | indica procesamiento local en curso; no acredita por sí solo `claimed`, lease ni fencing distribuido                                     |
| `failed`            | exige clasificar error; puede terminar en `retry_pending`, `dead_letter`, `quarantined`, `failed` o conciliación según evidencia         |
| `conflict`          | exige preservar conflicto y versión; puede corresponder a `blocked` o `quarantined`, nunca a retry ciego                                 |

Los estados locales permanecen evidencia de compatibilidad y no se declaran cumplimiento transversal completo. La transición física se recibe en `DELIV-PKG-001`.

##### 21.4. Impresión local NEXO

Vaciar o reducir `vento-nexo:printing:queue:v1` después de iniciar BrowserPrint no produce por sí solo `succeeded`.

- antes del dispatch, el trabajo puede estar `queued`, `assigned` o `claimed` según la materialización futura;
- durante el envío capaz de efecto se utiliza `processing`;
- aceptación o impresión incierta utiliza `result_unknown`;
- solo evidencia autoritativa suficiente permite `succeeded`;
- una reimpresión autorizada posterior es otra intención, no una transición desde un terminal previo.

La arquitectura especializada continúa en `PRINT-ARC-*` y la adopción física se recibe en `DELIV-PKG-001`.

##### 21.5. Wompi

`payments.webhook_events.processed` y los estados de transacción existentes permanecen fuentes específicas del dominio de pago. No se renombran como estados de trabajo.

La operación canónica del evento debe poder registrar:

```text
WORK_RESERVED
→ WORK_CLAIM_ACQUIRED
→ WORK_PROCESSING_STARTED
→ WORK_SUCCEEDED
```

cuando el resultado completo sea conocido, o `WORK_RESULT_UNKNOWN` / conciliación cuando exista divergencia entre mutación y registro de evento.

Las protecciones actuales de unicidad de evento y row lock se conservan como primitivas compatibles; no se declaran por sí solas state machine transversal completo.

##### 21.6. RevenueCat

El handler actual no materializa una reserva previa de evento ni un estado transversal único antes de sus tres mutaciones observadas.

La adopción objetivo deberá conservar la identidad estable del evento, registrar la operación antes del efecto y producir estados/eventos sin confundir:

- fila de suscripción;
- entitlement;
- auditoría;
- acuse HTTP;
- estado del trabajo asíncrono.

La adopción física se recibe en `DELIV-PKG-001`.

##### 21.7. `pg_net` y workers técnicos

`QAI-010` y `QAI-013` no adquieren un ciclo empresarial independiente.

- una fila o request de `pg_net` conserva metadata de transporte, no `operation_status` empresarial;
- el tick de `QAI-013` no crea un nuevo estado ni otra operación;
- errores de esas capas se correlacionan con la operación upstream y producen eventos de esa operación cuando el contrato lo requiera.

---

#### 22. Matriz materializada de estados y eventos para las 19 identidades `QAI-*`

| ID        | Clasificación              | Perfil                   | Estados/eventos propietarios                                                                                               | Regla materializada                                                                                                               | Estado y brecha documental                                                                                         |
| --------- | -------------------------- | ------------------------ | -------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| `QAI-001` | `APLICA_ESTADOS_Y_EVENTOS` | `SCHEDULED_WORK`         | `scheduled`, `queued`, `assigned`, `claimed`, `processing`, retry/aislamiento/terminales; misfire, claim, versión y cierre | cada ocurrencia conserva su estado propio; el cierre del turno usa eventos de conflicto/versión cuando compita con otra operación | `ESPECIFICADO`; comparte guardia de efecto con `QAI-004` y la coexistencia legacy sigue bajo `TSVC-CAT-010`        |
| `QAI-002` | `APLICA_ESTADOS_Y_EVENTOS` | `SCHEDULED_WORK`         | ciclo de ocurrencia raíz y ciclos separados para hijos con efecto independiente                                            | éxito del cron o transporte no cierra hijos; cada hijo conserva estado y resultado propios                                        | `ESPECIFICADO`; cadena multi-etapa requiere correlación por causalidad                                             |
| `QAI-003` | `APLICA_ESTADOS_Y_EVENTOS` | `SCHEDULED_WORK`         | ciclo programado con `WORK_VERSION_CONFLICT`, bloqueo, retry y cierre                                                      | una corrección stale no pasa a éxito si el turno ya cambió; conflicto se registra sin sobrescribir la versión vigente             | `ESPECIFICADO`; comparte frontera de recurso con otros cierres de asistencia                                       |
| `QAI-004` | `APLICA_ESTADOS_Y_EVENTOS` | `SCHEDULED_WORK`         | mismo ciclo de ocurrencia que un schedule normal, con identidad propia                                                     | mantener schedule transicional no fusiona su estado con `QAI-001`; doble efecto se suprime por concurrencia                       | `ESPECIFICADO`; retiro o adopción legacy permanece bajo `TSVC-CAT-010`                                             |
| `QAI-005` | `APLICA_ESTADOS_Y_EVENTOS` | `SCHEDULED_WORK`         | ciclo raíz programado; entregas hijas usan ciclos propios cuando se materialicen como trabajos                             | un batch `succeeded` exige resultado raíz compatible y no convierte un ACK de `pg_net` en entrega final                           | `ESPECIFICADO`; entrega especializada continúa bajo `NOTIFY-ARC-*`                                                 |
| `QAI-006` | `APLICA_ESTADOS_Y_EVENTOS` | `SCHEDULED_WORK`         | ocurrencia de mantenimiento con misfire, retry, bloqueo y terminalidad                                                     | cada ocurrencia se cierra sin reabrir registros ya tratados; siguiente schedule es otra operación                                 | `ESPECIFICADO`; estado técnico no decide resultado empresarial de entrega                                          |
| `QAI-007` | `APLICA_ESTADOS_Y_EVENTOS` | `SCHEDULED_WORK`         | ciclo raíz de reconciliación y estados propios por checkout cuando corresponda                                             | row locks actuales son evidencia de concurrencia; un checkout ambiguo usa conciliación, no éxito del batch                        | `ESPECIFICADO`; no se fusionan estados de transacción, orden y operación de cola                                   |
| `QAI-008` | `APLICA_ESTADOS_Y_EVENTOS` | `SCHEDULED_WORK`         | modelo objetivo completo de schedule y trabajo                                                                             | si se despliega, deberá registrar ocurrencia, misfire, claim, intento y cierre; esta tarea no activa el job                       | `PENDIENTE_DE_EVIDENCIA`; evidencia de despliegue y adopción se recibe en `DELIV-PKG-001`                          |
| `QAI-009` | `APLICA_ESTADOS_Y_EVENTOS` | `SCHEDULED_WORK`         | ciclo de batch y trabajo por solicitud destructiva; cancelación, claim, resultado ambiguo y recovery                       | estados empresariales `pending/processing/completed/rejected/canceled/failed` permanecen separados de `operation_status`          | `ESPECIFICADO`; checkpoints y state machine físicos se reciben en `DELIV-PKG-001`                                  |
| `QAI-010` | `PROPAGA_NO_DECIDE_ESTADO` | `UPSTREAM_PROPAGATED`    | eventos y estado pertenecen a la operación upstream                                                                        | request de transporte no se convierte en trabajo empresarial ni terminaliza por desaparecer de la cola técnica                    | `ESPECIFICADO`; transporte administrado sin ownership de estado                                                    |
| `QAI-011` | `APLICA_ESTADOS_Y_EVENTOS` | `OFFLINE_OR_DEVICE_WORK` | `queued`, `retry_pending`, `blocked`, `processing`, conflicto/aislamiento y terminales; eventos de sync y reconciliación   | `pending/syncing/failed/conflict` locales se conservan como evidencia parcial y se correlacionan por contexto                     | `ESPECIFICADO`; no se acredita state machine transversal end-to-end actual                                         |
| `QAI-012` | `APLICA_ESTADOS_Y_EVENTOS` | `OFFLINE_OR_DEVICE_WORK` | mismo conjunto general con identidad propia de descanso                                                                    | compartir worker no mezcla estado, `status_version`, intentos ni conflictos de asistencia y descanso                              | `ESPECIFICADO`; adopción física se recibe en `DELIV-PKG-001`                                                       |
| `QAI-013` | `PROPAGA_NO_DECIDE_ESTADO` | `UPSTREAM_PROPAGATED`    | consume estados de `QAI-011` y `QAI-012`                                                                                   | cada tick procesa unidades elegibles; despertar o terminar el loop no cambia el estado empresarial por sí solo                    | `ESPECIFICADO`; worker técnico efímero                                                                             |
| `QAI-014` | `APLICA_ESTADOS_Y_EVENTOS` | `OFFLINE_OR_DEVICE_WORK` | evento local/background, operación servidora, conflicto de versión y resultado                                             | callback tardío no produce otro cierre si el turno ya cambió; resultado incierto usa conciliación                                 | `ESPECIFICADO`; ubicación y callback no equivalen a resultado autoritativo                                         |
| `QAI-015` | `APLICA_ESTADOS_Y_EVENTOS` | `OFFLINE_OR_DEVICE_WORK` | cola local, claim de dispatch, `processing`, `result_unknown`, conciliación y resultado físico confirmado                  | vaciar `localStorage` no terminaliza; callback tardío o ambiguo no autoriza otro envío                                            | `ESPECIFICADO`; detalle especializado en `PRINT-ARC-*`, adopción en `DELIV-PKG-001`                                |
| `QAI-016` | `NO_APLICA`                | `NO_APLICA`              | `NO_APLICA`                                                                                                                | refresco de lectura sin trabajo durable ni efecto empresarial                                                                     | `NO_APLICA`; no se fuerza al contrato                                                                              |
| `QAI-017` | `APLICA_ESTADOS_Y_EVENTOS` | `EVENT_DRIVEN_WORK`      | reserva de trabajo derivado, entrega, retry, incertidumbre y terminalidad                                                  | `support_message` permanece fuente; trigger y `pg_net` no se convierten en estado de la entrega                                   | `ESPECIFICADO`; resultado de notificación separado del mensaje                                                     |
| `QAI-018` | `APLICA_ESTADOS_Y_EVENTOS` | `EVENT_DRIVEN_WORK`      | reserva de evento Wompi, claim, procesamiento, conciliación y cierre                                                       | `processed` y estados de pago se correlacionan, pero no reemplazan `operation_status`; replay recupera la misma operación         | `ESPECIFICADO`; controles actuales compatibles se preservan sin declarar adopción transversal completa             |
| `QAI-019` | `APLICA_ESTADOS_Y_EVENTOS` | `EVENT_DRIVEN_WORK`      | reserva de evento RevenueCat, procesamiento compuesto, conciliación y cierre                                               | suscripción, entitlement y auditoría permanecen componentes/resultados del dominio; el acuse HTTP no terminaliza por sí solo      | `ESPECIFICADO`; reserva/state machine de evento no acreditados actualmente y adopción se recibe en `DELIV-PKG-001` |

Resultado de reconciliación:

```text
19 IDENTIDADES ESPERADAS
19 IDENTIDADES MATERIALIZADAS
16 APLICAN ESTADOS Y EVENTOS
2 PROPAGAN Y NO DECIDEN ESTADO
1 NO APLICA
0 FALTANTES
0 DUPLICADOS

PERFILES ENTRE LAS 16 APLICABLES
SCHEDULED_WORK         = 9
OFFLINE_OR_DEVICE_WORK = 4
EVENT_DRIVEN_WORK      = 3
```

---

#### 23. Invariantes de integridad de la historia

1. una `operation_id` conserva una sola secuencia lógica de estados;
2. `status_version` no retrocede ni se reutiliza;
3. `event_sequence` no retrocede ni se reutiliza dentro de la operación;
4. un estado terminal no se sobrescribe mediante retry, callback tardío o worker obsoleto;
5. un evento repetido con el mismo `event_id` no vuelve a aplicar la transición;
6. un evento distinto con causa duplicada no elude idempotencia ni concurrencia;
7. una transición incompatible conserva evidencia del conflicto y no se corrige editando historia;
8. el payload empresarial original permanece referenciado por fuente o huella y no se copia indiscriminadamente a eventos;
9. estado, resultado, error, cancelación, recovery y conciliación mantienen identidades separadas;
10. el orden de historia se decide por secuencia/versionado y causalidad, no por el timestamp más reciente únicamente;
11. el historial permite reconstruir qué worker, dispositivo, adaptador o principal técnico participó cuando aplique, sin convertir esa identidad en autoridad empresarial;
12. cualquier materialización que use eventos de dominio, outbox o auditoría compartida preserva estas identidades y no fusiona hechos distintos por conveniencia.

---

#### 24. Handoff exacto a `QUEUE-ARC-011..012`

| Tarea                                                                             | Responsabilidad reservada recibida desde esta tarea                                                                                                                                                                                               |
| --------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `QUEUE-ARC-011 — Definir métricas de espera, ejecución y error`                   | medir tiempos y conteos derivados de `operation_status`, eventos, intentos, claims, retries, bloqueos, cancelaciones, conciliaciones, aislamiento, conflictos y terminalidad sin convertir telemetría en política de transición                   |
| `QUEUE-ARC-012 — Definir autorización para crear, cancelar y reintentar trabajos` | definir quién puede producir solicitudes o decisiones de control y qué eventos deben registrar dichas decisiones, sin convertir posesión de `operation_id`, claim, lease, fencing, dispositivo, token o credencial técnica en permiso empresarial |

Ninguna de esas responsabilidades se desarrolla en esta tarea.

---

#### 25. Prohibiciones

Esta tarea no autoriza:

1. crear tablas, columnas, enums, índices, constraints, triggers, funciones, RPC, topics, colas, outbox o event stores;
2. modificar Supabase, datos, RLS, grants, Realtime, Storage, cron, Edge Functions o secretos;
3. modificar ANIMA, NEXO, PASS ni otro repositorio consumidor;
4. activar `QAI-008`;
5. retirar `QAI-004`;
6. cambiar `priority_class`, `scheduled_at`, `deadline_at`, misfire o calendario;
7. cambiar routing, capacidades o target técnico;
8. cambiar perfiles de retry, `max_attempts`, backoff, jitter o `Retry-After`;
9. modificar las resoluciones aprobadas de cancelación;
10. modificar carriles, acciones o resoluciones aprobadas de recovery;
11. cambiar `concurrency_key`, lease, fencing o reglas de compare-and-set;
12. interpretar un estado de transporte como resultado empresarial;
13. declarar éxito porque una cola quede vacía;
14. declarar fallo terminal porque un intento falle una sola vez;
15. declarar cancelación por cerrar un proceso o borrar un item local;
16. reabrir una operación terminal mediante retry o recovery ordinario;
17. editar o borrar eventos históricos para corregir el estado actual;
18. guardar secretos, tokens o payloads sensibles completos dentro de eventos;
19. fijar métricas, SLOs, umbrales, dashboards o alertas;
20. conceder autoridad para crear, cancelar, reintentar, recuperar o forzar trabajos;
21. declarar implementación, despliegue o adopción física de este contrato;
22. iniciar o desarrollar `QUEUE-ARC-011`.

---

#### 26. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea especializa y unifica en un único ciclo durable obligaciones de estado, resultado recuperable, trazabilidad, no duplicidad, retry controlado, cancelación, resultado desconocido, conciliación, aislamiento, recovery y concurrencia que ya están registradas para la arquitectura asíncrona. La tarea no introduce una obligación verificable independiente ni modifica alcance, estado, responsable, evidencia, relación o secuencia de requisitos vigentes.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

---

#### 27. Cobertura de prueba existente preservada

Se preserva sin modificación, en especial:

- `TREQ-INTEGRATION-003`, que exige identidad estable, estado durable, resultado recuperable, retry controlado, claim seguro, bloqueo/versionado, conciliación, cola de fallos y recuperación manual y asigna responsabilidad explícita a `QUEUE-ARC-001` a `QUEUE-ARC-010`;
- `TREQ-INTEGRATION-004`, que exige reconstruir causa, payload, principal técnico, recurso, intento, resultado, error y efecto final de cadenas trigger, función, job, webhook o notificación;
- la cobertura vigente de ANIMA, PASS, NEXO, Supabase e integraciones relacionada con offline, concurrencia, idempotencia, webhooks, dispositivos, pagos, impresión y resultados ambiguos.

Ninguna fila del registro canónico cambia de identificador, dominio, regla protegida, estado, responsable, evidencia, relación o secuencia por esta tarea.

---

#### 28. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. conserva `QUEUE-ARC-009` como tarea anterior aprobada;
2. conserva `QUEUE-ARC-011` como única tarea siguiente reservada;
3. establece `WORK-STATE-EVENT-CONTRACT-001@1.0.0` sin crear una fuente empresarial paralela;
4. define exactamente 16 estados durables;
5. conserva exactamente cuatro terminales: `succeeded`, `failed`, `cancelled`, `expired`;
6. conserva `dead_letter`, `quarantined`, `result_unknown` y `reconciling` como no terminales cuando requieren resolución controlada;
7. incluye los nueve estados mínimos del marcador: `queued`, `scheduled`, `assigned`, `processing`, `succeeded`, `retry_pending`, `failed`, `cancelled`, `expired`;
8. incorpora `blocked`, `claimed`, `cancel_requested`, `result_unknown`, `reconciling`, `quarantined` y `dead_letter` sin crear significados incompatibles con `TSVC-CAT-006`;
9. mapea explícitamente `RECEIVED`, `RESERVED`, `CLAIMED`, `EXECUTING`, `RETRY_SCHEDULED`, `SUCCEEDED` y `FAILED_TERMINAL` al modelo persistible;
10. separa estado de trabajo de estado empresarial, transporte, UI, proveedor y resultado físico;
11. define `status_version` monotónico y `status_event_id`;
12. define `event_id`, `event_sequence`, `status_before`, `status_after`, `occurred_at` y `recorded_at`;
13. define exactamente 33 tipos de evento canónicos;
14. distingue eventos que cambian estado de eventos informativos que no lo cambian;
15. impide aplicar dos transiciones desde la misma versión esperada sin conflicto explícito;
16. prohíbe `last write wins` para estado canónico;
17. representa programación, elegibilidad y misfire sin cambiar identidad de ocurrencia;
18. representa assignment sin convertirlo en claim;
19. representa claim adquirido y rechazado sin crear intentos espurios;
20. representa renovación y pérdida de lease sin reiniciar identidad;
21. representa fencing rechazado sin permitir al worker obsoleto cerrar;
22. representa conflictos de versión sin sobrescribir el recurso más nuevo;
23. representa duplicados suprimidos sin crear una segunda operación;
24. representa inicio de procesamiento con `attempt_id` real;
25. representa retry pendiente solo con presupuesto, `next_retry_at` y deadline compatibles;
26. impide retry directo ante efecto ambiguo;
27. mapea las siete resoluciones aprobadas de cancelación al state machine;
28. impide equiparar `cancel_requested` con `cancelled`;
29. representa `result_unknown` y `reconciling` como condiciones distintas de fallo;
30. mapea las cinco condiciones de conciliación aprobadas sin inventar resultados;
31. representa `quarantined` y `dead_letter` como aislamiento recuperable;
32. mapea las ocho resoluciones de recovery sin abrir un ciclo paralelo de estados;
33. impide que recovery ordinario reinicie una operación terminal;
34. trata resultados tardíos mediante evento vinculado y conciliación sin sobrescribir terminalidad;
35. conserva contenedores e hijos con estados y secuencias propias;
36. materializa tres perfiles aplicables: 9 `SCHEDULED_WORK`, 4 `OFFLINE_OR_DEVICE_WORK` y 3 `EVENT_DRIVEN_WORK`;
37. materializa exactamente una decisión para `QAI-001..QAI-019`;
38. obtiene 16 `APLICA_ESTADOS_Y_EVENTOS`, 2 `PROPAGA_NO_DECIDE_ESTADO` y 1 `NO_APLICA`;
39. mantiene 0 identidades faltantes y 0 duplicadas;
40. mantiene `QAI-010` y `QAI-013` como propagadores técnicos sin ciclo empresarial propio;
41. mantiene `QAI-016` como `NO_APLICA`;
42. mantiene `QAI-008` como `PENDIENTE_DE_EVIDENCIA` sin activar su schedule;
43. distingue `account_deletion_requests.status` de `operation_status`;
44. reconcilia `pending`, `syncing`, `failed` y `conflict` de ANIMA sin declararlos equivalencias universales;
45. impide que vaciar la cola NEXO signifique éxito físico;
46. distingue `payments.webhook_events.processed` y estados de transacción del estado del trabajo Wompi;
47. documenta la ausencia de state machine transversal acreditada para RevenueCat sin inventar un ID de proveedor;
48. conserva las decisiones de idempotencia, scheduling, asignación, retry, cancelación, recovery y concurrencia ya aprobadas;
49. reserva métricas para `QUEUE-ARC-011`;
50. reserva autoridad y segregación para `QUEUE-ARC-012`;
51. declara cero cambios de requisitos de prueba con justificación concreta;
52. crea cero objetos físicos;
53. modifica cero repositorios, Supabase, cron, colas, workers, dispositivos, adaptadores o webhooks;
54. no inicia ni desarrolla `QUEUE-ARC-011`.

---

#### 29. Resultado de la tarea

`QUEUE-ARC-010` deja establecido un único contrato de estado e historia para el trabajo asíncrono:

```text
RESERVA DE INTENCIÓN
        ↓
scheduled / queued
        ↓
assigned
        ↓
claimed
        ↓
processing
        ├─→ succeeded
        ├─→ retry_pending → queued / assigned
        ├─→ cancel_requested → cancelled / resultado previo / result_unknown
        ├─→ result_unknown → reconciling
        ├─→ quarantined
        ├─→ dead_letter
        └─→ failed / expired cuando corresponda

CADA CAMBIO DURABLE
= STATUS_VERSION NUEVA
+ EVENTO INMUTABLE
+ CAUSA RECONSTRUIBLE

ESTADO EMPRESARIAL
≠ OPERATION_STATUS
```

Las 19 identidades inventariadas quedan reconciliadas una a una. El trabajo asíncrono obtiene una semántica de estado común sin apropiarse de estados empresariales ni de tecnologías concretas, y cada transición puede reconstruirse por identidad, versión, causa, intento, claim, control y resultado.

---

#### 30. Continuidad

ÚLTIMA TAREA APROBADA

`QUEUE-ARC-009 — Definir bloqueo de duplicados y concurrencia`

TAREA ACTUAL APROBADA

`QUEUE-ARC-010 — Definir estados y eventos canónicos`

SIGUIENTE TAREA RESERVADA

`QUEUE-ARC-011 — Definir métricas de espera, ejecución y error`


### ✅ QUEUE-ARC-011 — Definir métricas de espera, ejecución y error

**Estado:** APROBADA
**Tarea anterior:** `QUEUE-ARC-010 — Definir estados y eventos canónicos`
**Tarea siguiente:** `QUEUE-ARC-012 — Definir autorización para crear, cancelar y reintentar trabajos`
**Tipo de tarea:** documental; especialización canónica de las métricas de espera, ejecución, retry, error, aislamiento, recuperación y concurrencia del trabajo asíncrono, utilizando el catálogo transversal de observabilidad ya aprobado y la máquina de estados y eventos de `QUEUE-ARC-010`, con decisión explícita para las 19 identidades `QAI-*`, sin implementar instrumentación, almacenamiento de telemetría, dashboards, alertas, SLO ni autorización
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/03_INFRAESTRUCTURA_CANONICA_DE_COLAS.md`
**Línea base documental:** `vento-shell@5e3a2dc9a39ab84bcac029d08b6fc916f6359808`
**Registro de observabilidad consumido:** `TRANSVERSE-SERVICE-OBSERVABILITY-REGISTRY-001@1.0.0`
**Contrato de estados y eventos consumido:** `WORK-STATE-EVENT-CONTRACT-001@1.0.0`
**Inventario consumido:** `QUEUE-CURRENT-ASSET-INVENTORY-001` — 19 identidades `QAI-*`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir cómo Vento OS mide el tiempo que una operación espera, el tiempo durante el cual realmente ejecuta, la presión de backlog, los reintentos, los conflictos, los errores, la incertidumbre y la recuperación, sin confundir una medición técnica con el resultado empresarial ni convertir una métrica en una decisión de scheduling, retry, cancelación, recuperación o autorización.

La regla raíz es:

```text
ESTADO DURABLE + EVENTOS CANÓNICOS + RELOJ DECLARADO
        ↓
MEDICIONES RECONSTRUIBLES
        ↓
ESPERA / EJECUCIÓN / ERROR / AISLAMIENTO / RECUPERACIÓN
        ↓
AGREGADOS Y DISTRIBUCIONES CON SEMÁNTICA ESTABLE
```

La separación obligatoria queda fijada así:

```text
MÉTRICA
≠ EVENTO
≠ LOG
≠ TRAZA
≠ ALERTA
≠ SLO
≠ RESULTADO EMPRESARIAL
≠ AUTORIZACIÓN
```

Una métrica resume evidencia técnica dentro de un alcance y una ventana. No modifica el estado del trabajo, no concede permisos y no demuestra por sí sola que el efecto empresarial o físico haya ocurrido.

---

#### 2. Resultado sustantivo

`QUEUE-ARC-011` especializa `TRANSVERSE-SERVICE-OBSERVABILITY-REGISTRY-001@1.0.0` para las 19 identidades `QAI-*` y fija la semántica de medición que deberá derivarse de `WORK-STATE-EVENT-CONTRACT-001@1.0.0`.

La tarea **no crea un segundo catálogo de identidades `TSVC-MET-*`**. Conserva exactamente `TSVC-MET-001..020` y define vistas, distribuciones y relaciones derivadas necesarias para medir el ciclo de vida de colas y jobs sin renombrar ni reemplazar las métricas transversales aprobadas.

El resultado material fija:

1. una base temporal única y verificable para medir transiciones;
2. la diferencia entre tiempo programado, tiempo elegible, espera de cola, bloqueo, espera de retry y ejecución;
3. la medición de dwell por estado sin inferir estados ausentes;
4. la latencia de adquisición de claim y la contención concurrente;
5. la duración de cada intento y la duración end-to-end de la operación;
6. la separación entre duración activa, tiempo de dependencia y tiempo total calendario;
7. la medición de drift y misfire para trabajo programado;
8. la medición de retry sin contar reintentos como operaciones nuevas;
9. la medición separada de `failed`, `result_unknown`, `quarantined`, `dead_letter`, `expired` y cancelación;
10. la edad y duración de conciliación y recuperación;
11. reglas de cohortes, denominadores y ventanas para tasas y proporciones;
12. reglas de cardinalidad, privacidad y frescura heredadas de `TSVC-CAT-007`;
13. la prohibición de presentar ausencia de instrumentación como valor cero;
14. una decisión explícita de medición para las 19 identidades `QAI-*`.

Balance:

| Métrica de control                            | Resultado |
| --------------------------------------------- | --------: |
| Identidades `QAI-*` esperadas                 |    **19** |
| Identidades materializadas                    |    **19** |
| `APLICA_METRICAS_DE_TRABAJO`                  |    **16** |
| `PROPAGA_NO_DECIDE_METRICAS`                  |     **2** |
| `NO_APLICA`                                   |     **1** |
| Perfil `SCHEDULED_WORK`                       |     **9** |
| Perfil `OFFLINE_OR_DEVICE_WORK`               |     **4** |
| Perfil `EVENT_DRIVEN_WORK`                    |     **3** |
| Métricas transversales `TSVC-MET-*` heredadas |    **20** |
| Nuevas identidades `TSVC-MET-*` creadas       |     **0** |
| Identificadores `QAI-*` duplicados            |     **0** |
| Identidades sin decisión                      |     **0** |
| Requisitos de prueba creados o modificados    |     **0** |
| Objetos físicos creados o modificados         |     **0** |

---

#### 3. Herencia contractual obligatoria

Esta tarea no redefine estados, eventos, retry, concurrencia ni observabilidad.

Hereda obligatoriamente:

- de `TRANSVERSE-SERVICE-OBSERVABILITY-REGISTRY-001@1.0.0`, las siete clases de señal, las veinte métricas `TSVC-MET-001..020`, la política de cardinalidad, la separación entre resultado empresarial y observabilidad, el uso de distribuciones para latencia y la prohibición de fijar umbrales sin baseline y SLO aprobados;
- de `WORK-STATE-EVENT-CONTRACT-001@1.0.0`, los dieciséis estados durables, los treinta y tres eventos canónicos, `status_version`, `event_sequence`, `occurred_at`, `recorded_at`, terminalidad y transiciones;
- de `WORK-SCHEDULING-POLICY-CONTRACT-001@1.0.0`, `scheduled_at`, `deadline_at`, `logical_fire_at_utc`, prioridad, misfire y elegibilidad;
- de `WORK-ASSIGNMENT-CONTRACT-001@1.0.0`, `assignment_id`, `assignment_version` y la diferencia entre assignment y claim;
- de `WORK-RETRY-POLICY-CONTRACT-001@1.0.0`, `attempt_id`, `attempt_no`, `next_retry_at`, perfiles `RR0..RR5`, presupuesto y clasificación de errores;
- de `WORK-CANCELLATION-CONTRACT-001@1.0.0`, la separación entre solicitud, efectividad, llegada demasiado tardía e incertidumbre;
- de `WORK-FAILURE-RECOVERY-CONTRACT-001@1.0.0`, aislamiento, conciliación, `failure_entry_id`, `recovery_request_id` y recuperación controlada;
- de `WORK-CONCURRENCY-CONTROL-CONTRACT-001@1.0.0`, `claim_id`, lease, fencing, `concurrency_key`, conflictos de versión y rechazo de ejecutores obsoletos;
- de `QUEUE-CURRENT-ASSET-INVENTORY-001`, las 19 identidades materiales y sus fronteras actuales.

La autoridad para crear, cancelar o forzar reintentos permanece reservada a `QUEUE-ARC-012`. Una métrica, alerta, dashboard, rol de observación o señal de health no concede esa autoridad.

---

#### 4. Planos de medición

Toda medición de trabajo asíncrono pertenece a uno de estos planos semánticos:

| Plano           | Pregunta                                                          | Fuente principal                                                    | Prohibición                                                     |
| --------------- | ----------------------------------------------------------------- | ------------------------------------------------------------------- | --------------------------------------------------------------- |
| `WAIT`          | ¿cuánto tiempo permaneció sin ejecutar y por qué?                 | estados/eventos de programación, cola, bloqueo, retry e aislamiento | sumar toda espera como si fuera retraso de worker               |
| `EXECUTION`     | ¿cuánto tiempo ejecutó realmente un intento o dependencia?        | `WORK_PROCESSING_STARTED`, cierre del intento, spans/dependencias   | incluir tiempo programado u offline como CPU/ejecución          |
| `OUTCOME_ERROR` | ¿cómo terminó o se desvió la operación?                           | eventos de resultado, retry, aislamiento, conflicto y error         | reducir todo resultado no exitoso a `failed`                    |
| `CONCURRENCY`   | ¿hubo contención, pérdida de lease o rechazo por versión/fencing? | eventos de claim, lease, fencing y versión                          | usar `concurrency_key` libre como etiqueta de alta cardinalidad |
| `RECOVERY`      | ¿cuánto duró la incertidumbre, conciliación o recuperación?       | eventos `result_unknown`, reconciliation y recovery                 | considerar resuelto por desaparecer de una cola                 |
| `CAPACITY`      | ¿el sistema recibe y drena trabajo al ritmo necesario?            | backlog, inflight y tasas de entrada/salida                         | convertir capacidad observada en SLO no aprobado                |

Una misma operación puede aportar mediciones a varios planos. Los planos no son estados ni clases de error.

---

#### 5. Base temporal y reloj de medición

La precisión temporal debe ser demostrable.

Reglas:

1. Las duraciones entre transiciones del state machine utilizan preferentemente `recorded_at` de los eventos aceptados por la fuente durable común, porque esos tiempos pertenecen al mismo plano de registro.
2. `occurred_at` conserva el momento del hecho observado y puede utilizarse para latencia real cuando las fuentes implicadas comparten una referencia temporal confiable o existe corrección de clock skew documentada.
3. No se restan timestamps de dispositivos, proveedores, navegadores, GitHub Actions, Supabase y móviles como si pertenecieran automáticamente al mismo reloj.
4. Una dependencia mide su duración dentro de la frontera que controla el inicio y fin de la llamada o span; esa medición alimenta `TSVC-MET-014`.
5. Todos los intervalos se conservan con precisión suficiente para expresar milisegundos cuando la fuente la soporte; las edades agregadas pueden exponerse en segundos conforme al catálogo transversal.
6. Un intervalo negativo, una secuencia temporal imposible o un salto de reloj no se corrigen a cero por conveniencia: se registran como problema de calidad de telemetría y se excluyen de agregados que requieran orden temporal válido.
7. `event_sequence` y `status_version` gobiernan el orden lógico cuando el timestamp no permite probar causalidad.
8. Los percentiles se calculan sobre distribuciones válidas y con ventana declarada; el promedio aislado no representa la latencia canónica.
9. Toda serie declara ambiente, versión del catálogo, fuente y frescura.
10. La ausencia de muestras no equivale a duración cero ni a ausencia de trabajo.

---

#### 6. Catálogo `TSVC-MET-*` heredado

Se conservan sin modificación las veinte métricas comunes de `TSVC-CAT-007`:

| ID             | Métrica                         | Uso dentro de `QUEUE-ARC-011`                                                              |
| -------------- | ------------------------------- | ------------------------------------------------------------------------------------------ |
| `TSVC-MET-001` | `operations_accepted_total`     | denominador de operaciones aceptadas; nunca incluye retries como operaciones nuevas        |
| `TSVC-MET-002` | `operations_completed_total`    | operaciones con cierre técnico satisfactorio compatible con `succeeded`                    |
| `TSVC-MET-003` | `operations_failed_total`       | operaciones cerradas técnicamente como `failed`; no absorbe otros estados                  |
| `TSVC-MET-004` | `operations_deduplicated_total` | repeticiones suprimidas o resueltas sin segundo efecto                                     |
| `TSVC-MET-005` | `attempts_total`                | ejecuciones reales iniciadas, incluido el primer intento y retries                         |
| `TSVC-MET-006` | `retries_scheduled_total`       | retries programados por política después de un intento                                     |
| `TSVC-MET-007` | `result_unknown_total`          | entradas a incertidumbre por posible efecto no confirmado                                  |
| `TSVC-MET-008` | `dead_letter_total`             | entradas a `dead_letter`; no representa fallo empresarial terminal                         |
| `TSVC-MET-009` | `quarantine_total`              | entradas a `quarantined` por conflicto, integridad o incompatibilidad                      |
| `TSVC-MET-010` | `backlog_depth`                 | profundidad pendiente según el scope de backlog declarado                                  |
| `TSVC-MET-011` | `oldest_backlog_age_seconds`    | edad del elemento pendiente más antiguo dentro del mismo scope                             |
| `TSVC-MET-012` | `in_flight_operations`          | operaciones reclamadas o activas bajo autoridad vigente                                    |
| `TSVC-MET-013` | `operation_duration_ms`         | duración técnica end-to-end de una operación cerrada con frontera temporal declarada       |
| `TSVC-MET-014` | `dependency_duration_ms`        | duración observada de dependencia, proveedor, dispositivo o servicio                       |
| `TSVC-MET-015` | `lease_expired_total`           | leases vencidos antes de cierre válido                                                     |
| `TSVC-MET-016` | `claim_conflict_total`          | conflictos de adquisición o cierre por concurrencia, fencing o versión según evento fuente |
| `TSVC-MET-017` | `contract_rejected_total`       | solicitudes rechazadas por contrato o versión incompatible                                 |
| `TSVC-MET-018` | `authentication_rejected_total` | solicitudes rechazadas por identidad o autenticación técnica                               |
| `TSVC-MET-019` | `worker_heartbeat_age_seconds`  | edad del heartbeat aceptado del worker cuando exista servicio de health aplicable          |
| `TSVC-MET-020` | `worker_state`                  | proyección cerrada del estado de health del worker; no estado empresarial del trabajo      |

Reglas de especialización:

1. `operations_completed_total` y `operations_failed_total` se derivan de operaciones, no de intentos.
2. `attempts_total` crece una vez por `WORK_PROCESSING_STARTED` aceptado para un `attempt_id` nuevo.
3. `retries_scheduled_total` crece por `WORK_ATTEMPT_RETRY_SCHEDULED`, no por cada wake-up de un worker.
4. `operations_deduplicated_total` se deriva de `WORK_DUPLICATE_SUPPRESSED` o equivalente compatible sin crear otro efecto.
5. `result_unknown_total`, `dead_letter_total` y `quarantine_total` permanecen separados aunque una misma operación atraviese más de una condición en episodios distintos.
6. Los gauges representan el instante de observación y su frescura; no se reconstruyen como contadores acumulativos.
7. Ninguna de estas métricas sustituye los 33 eventos de `QUEUE-ARC-010`.

---

#### 7. Métricas de espera

La espera se mide por **causa**, no como un único tiempo de cola.

##### 7.1. Dwell por estado

Para cada episodio continuo en un estado no terminal:

```text
state_dwell = recorded_at(evento_de_salida) - recorded_at(evento_de_entrada)
```

Cuando la operación sigue en el estado durante una consulta:

```text
current_state_age = observed_at - recorded_at(evento_de_entrada)
```

Se conservan por separado, como mínimo:

- tiempo en `scheduled`;
- tiempo en `queued`;
- tiempo en `assigned` antes de claim;
- tiempo en `blocked`;
- tiempo en `retry_pending`;
- tiempo en `cancel_requested`;
- tiempo en `result_unknown`;
- tiempo en `reconciling`;
- tiempo en `quarantined`;
- tiempo en `dead_letter`.

No se suma `scheduled` con `queued` como si toda programación futura fuera atraso.

##### 7.2. Espera elegible hasta claim

La espera elegible se calcula como la suma de los episodios `queued` y `assigned` durante los cuales la operación podía competir por un claim, excluyendo periodos `scheduled`, `blocked`, `retry_pending`, `cancel_requested`, `result_unknown`, `reconciling`, `quarantined` y `dead_letter`.

El claim wait de una operación no puede ser negativo y no se mide desde `first_requested_at` cuando existió una programación deliberada futura.

##### 7.3. Backlog

`TSVC-MET-010` y `TSVC-MET-011` se reportan con un scope explícito que declare qué estados incluye.

Un backlog operativo puede distinguir, sin mezclarlos:

- elegible: `queued` + `assigned`;
- bloqueado: `blocked`;
- retry: `retry_pending`;
- incertidumbre: `result_unknown` + `reconciling`;
- aislamiento: `quarantined` + `dead_letter`.

La suma global puede mostrarse cuando el consumidor conserva la composición por estado. Un único número sin composición no permite distinguir capacidad insuficiente de bloqueo, retry o recovery.

##### 7.4. Espera de retry

Se distinguen:

```text
planned_retry_wait = next_retry_at - failure_observed_at
retry_lateness = WORK_RETRY_DUE.observed_at - next_retry_at
```

El primer valor describe la política aplicada. El segundo describe qué tan tarde se reactivó la elegibilidad respecto de lo programado. El tick de un worker no se interpreta como backoff contractual.

##### 7.5. Edad de incertidumbre e aislamiento

- la edad de `result_unknown` comienza en `WORK_RESULT_UNKNOWN`;
- la conciliación se mide desde `WORK_RECONCILIATION_STARTED` hasta `WORK_RECONCILIATION_RESOLVED` o la observación vigente;
- la edad de cuarentena comienza en `WORK_QUARANTINED`;
- la edad de dead-letter comienza en `WORK_DEAD_LETTERED`;
- una solicitud de recovery no resetea la edad histórica del episodio de aislamiento;
- un nuevo episodio posterior se mide por separado y conserva causalidad.

---

#### 8. Métricas de ejecución

##### 8.1. Duración de intento

Cada `attempt_id` se mide desde `WORK_PROCESSING_STARTED` hasta el primer evento autoritativo que cierre esa ejecución concreta o la saque de `processing`.

```text
attempt_duration = attempt_exit_at - processing_started_at
```

Reglas:

1. adquirir un claim sin iniciar `WORK_PROCESSING_STARTED` no genera duración de intento;
2. espera de lease, assignment o queue no se suma a la duración del intento;
3. un intento que termina en retry conserva su duración propia y no se fusiona con el intento siguiente;
4. un intento que pierde lease conserva su duración histórica hasta la pérdida o salida autoritativa;
5. si el efecto puede haber ocurrido y el intento termina en incertidumbre, su duración termina al salir de `processing`; el tiempo posterior pertenece a `result_unknown` o conciliación;
6. la distribución se segmenta por `operation_type`, ambiente y perfil cerrado cuando sea útil y seguro.

##### 8.2. Duración end-to-end de operación

`TSVC-MET-013` mide desde la reserva aceptada de la intención hasta su cierre técnico terminal.

```text
operation_duration = terminal_recorded_at - WORK_RESERVED.recorded_at
```

Incluye las esperas deliberadas, retry, bloqueo y recuperación que hayan ocurrido antes del terminal. Por esa razón siempre debe interpretarse junto con los dwell de estado y no como sustituto de tiempo activo.

Una operación todavía no terminal no se incorpora a la distribución de terminales como si ya hubiera terminado; su edad actual se analiza como operación abierta.

##### 8.3. Tiempo activo acumulado

La suma de las duraciones válidas de todos los intentos de la misma operación representa tiempo activo observado. No es igual a `operation_duration` y no se usa para esconder espera, backoff o conciliación.

##### 8.4. Dependencias

`TSVC-MET-014` mide por llamada o span controlado el tiempo de:

- proveedor externo;
- base de datos o RPC;
- Storage;
- dispositivo o periférico;
- adaptador;
- consumidor downstream;
- otra dependencia técnica identificada.

La dependencia conserva una clase cerrada y, cuando sea seguro, proveedor o servicio de baja cardinalidad. URLs, identificadores individuales, payloads y errores libres no son etiquetas métricas.

##### 8.5. Inflight y throughput

- `TSVC-MET-012` cuenta operaciones con claim o procesamiento vigente dentro del scope declarado;
- throughput es la tasa de cambio de contadores terminales dentro de una ventana explícita;
- la tasa de entrada deriva de operaciones aceptadas, no de intentos;
- la tasa de salida distingue éxito, fallo y otros cierres sin fusionarlos;
- el sistema puede comparar entrada, salida y backlog para evaluar capacidad, pero no convierte esa comparación en un SLO no aprobado.

---

#### 9. Programación, drift y misfire

Para `SCHEDULED_WORK` se distinguen:

```text
logical_fire_at_utc
actual_trigger_at
eligibility_recorded_at
claim_recorded_at
processing_started_at
terminal_recorded_at
```

Reglas:

1. `schedule drift` describe la diferencia entre el instante lógico y el disparo real observado por el scheduler bajo un reloj confiable.
2. `eligibility lag` describe la demora entre la ocurrencia que debía ser elegible y `WORK_ELIGIBLE` cuando ambas marcas son comparables.
3. `claim wait` comienza después de elegibilidad, no desde `logical_fire_at_utc` si hubo bloqueo o condición adicional.
4. `WORK_MISFIRE_DETECTED` se contabiliza separado de un fallo de intento porque puede ocurrir sin haber iniciado ejecución.
5. `WORK_MISFIRE_RESOLVED` clasifica la salida de cada misfire sin borrar la ocurrencia omitida o coalescida.
6. `WORK_EXPIRED` contabiliza vencimiento del trabajo; no se fusiona con `operations_failed_total`.
7. dos schedules distintos que producen un efecto equivalente, como `QAI-001` y `QAI-004`, conservan sus métricas de ocurrencia separadas y pueden compartir agregados de contención por clase de recurso sin fusionar `operation_id`.
8. no se fija un valor universal de drift permitido; cualquier umbral requiere baseline, SLO, criticidad y ambiente aprobados.

---

#### 10. Retry y amplificación

Las métricas de retry conservan las identidades de operación e intento.

Se distinguen:

- operaciones con al menos un retry;
- `attempts_total`;
- `retries_scheduled_total`;
- distribución de `attempt_no` al cierre;
- espera programada y lateness de retry;
- errores que originaron retry;
- operaciones que agotaron política y pasaron a aislamiento;
- operaciones que terminaron después de uno o más retries.

La **amplificación de intentos** se calcula dentro de una cohorte compatible como:

```text
attempt_amplification = attempts_started / operations_with_execution
```

Reglas:

1. el denominador cuenta operaciones únicas con al menos un intento;
2. una operación que solo espera conectividad y nunca inicia intento no incrementa el numerador;
3. el indicador no se interpreta como error automáticamente: algunos retries están permitidos;
4. una subida debe analizarse junto con `error_class`, dependencia, backlog y resultado;
5. no se agregan perfiles de retry incompatibles como si tuvieran el mismo presupuesto.

---

#### 11. Métricas de error y resultado

El error se mide en niveles separados.

##### 11.1. Error de intento

Un intento puede terminar sin éxito y aun así dejar la operación no terminal. El conteo por intento utiliza `attempt_id` y `error_class` y nunca incrementa `operations_failed_total` por sí solo.

##### 11.2. Fallo terminal de operación

`TSVC-MET-003` crece únicamente cuando la operación entra a `failed` mediante `WORK_FAILED`.

No se consideran equivalentes a `failed`:

- `retry_pending`;
- `result_unknown`;
- `reconciling`;
- `quarantined`;
- `dead_letter`;
- `cancelled`;
- `expired`.

##### 11.3. Incertidumbre y aislamiento

- `TSVC-MET-007` cuenta entradas a `result_unknown`;
- `TSVC-MET-008` cuenta entradas a `dead_letter`;
- `TSVC-MET-009` cuenta entradas a `quarantined`;
- una operación puede generar más de un episodio histórico de aislamiento si fue recuperada y volvió a fallar; la métrica de episodios no se presenta como número de operaciones únicas sin declarar esa diferencia.

##### 11.4. Rechazos

- `TSVC-MET-017` conserva rechazos por contrato o versión;
- `TSVC-MET-018` conserva rechazo de identidad o autenticación técnica;
- una denegación empresarial o de autorización no se reetiqueta como fallo interno del worker;
- la política de quién puede ejecutar la acción queda en `QUEUE-ARC-012`.

##### 11.5. Otros resultados medibles por eventos

Sin crear nuevas identidades `TSVC-MET-*`, las vistas de análisis pueden contar de forma derivada:

- `WORK_EXPIRED`;
- `WORK_CANCELLATION_REQUESTED` y resoluciones de cancelación;
- `WORK_RECONCILIATION_STARTED` y resultados de conciliación;
- `WORK_RECOVERY_REQUESTED` y resoluciones de recovery;
- `WORK_LATE_RESULT_OBSERVED`;
- `WORK_MISFIRE_DETECTED` y sus resoluciones;
- `WORK_FENCING_REJECTED`;
- `WORK_VERSION_CONFLICT`.

Cada vista conserva el evento fuente y no se publica como nueva métrica canónica global sin versionar el catálogo transversal correspondiente.

---

#### 12. Concurrencia, claim, lease y duplicados

La medición de concurrencia utiliza las primitivas ya aprobadas.

1. `TSVC-MET-015` crece cuando un lease pierde vigencia antes de un cierre válido.
2. `TSVC-MET-016` agrega conflictos de claim/concurrencia a partir de eventos compatibles como `WORK_CLAIM_REJECTED`, `WORK_FENCING_REJECTED` o conflictos de versión que realmente pertenezcan a la misma clase semántica.
3. Un mismo hecho no se contabiliza dos veces únicamente porque produzca log y evento.
4. `WORK_DUPLICATE_SUPPRESSED` alimenta `TSVC-MET-004` cuando la repetición fue suprimida de forma segura.
5. Colisiones por `concurrency_key` se agregan por clase cerrada de frontera, servicio, tipo de operación o recurso tipificado; la clave concreta no se usa como etiqueta libre.
6. La latencia de claim se mide desde elegibilidad hasta `WORK_CLAIM_ACQUIRED`, excluyendo periodos en los que la operación no era elegible.
7. Un claim rechazado que no inicia intento no incrementa `attempts_total`.
8. Un fencing rechazado no se registra como fallo de la operación vigente si solo impidió el cierre de un ejecutor obsoleto.
9. La pérdida de lease después de posible efecto se correlaciona con `result_unknown` y no se cuenta como retry seguro por inferencia.

---

#### 13. Cancelación, incertidumbre, conciliación y recovery

##### 13.1. Cancelación

Se miden por separado:

- solicitudes de cancelación;
- tiempo desde `WORK_CANCELLATION_REQUESTED` hasta `WORK_CANCELLATION_RESOLVED`;
- distribución de las siete resoluciones aprobadas por el contrato de cancelación;
- operaciones que terminan `cancelled`;
- cancelaciones demasiado tardías;
- cancelaciones que derivan a `result_unknown`.

La demora de resolución de cancelación no es igual al tiempo de ejecución ni al tiempo de cola.

##### 13.2. Resultado desconocido

La edad de incertidumbre se mide desde `WORK_RESULT_UNKNOWN` hasta una resolución autoritativa o hasta el instante observado. Una operación que entra a `result_unknown` no incrementa `operations_failed_total`.

##### 13.3. Conciliación

Se mide:

- número de conciliaciones iniciadas;
- duración desde `WORK_RECONCILIATION_STARTED` hasta `WORK_RECONCILIATION_RESOLVED`;
- resolución final por vocabulario aprobado;
- permanencia sin resolución;
- resultado recuperado sin repetir efecto;
- necesidad de operación correctiva cuando corresponda.

##### 13.4. Recovery

Se mide:

- solicitudes `WORK_RECOVERY_REQUESTED`;
- tiempo hasta `WORK_RECOVERY_RESOLVED`;
- acción y resolución aprobadas;
- reejecuciones extraordinarias efectivamente iniciadas como nuevos `attempt_id` de la misma intención cuando el contrato lo permita;
- reincidencia en aislamiento después de recovery.

Recovery no reinicia el histórico de la operación ni borra el episodio anterior.

---

#### 14. Cohortes, tasas y denominadores

Toda tasa debe declarar qué cuenta y sobre qué conjunto.

Reglas:

1. Una tasa por operación utiliza `operation_id` única como unidad, no `attempt_id`.
2. Una tasa por intento utiliza `attempt_id` y no se presenta como tasa de operaciones.
3. El denominador de una cohorte terminal excluye operaciones aún abiertas o las reporta explícitamente como censuradas.
4. No se mezcla una cohorte de un minuto con un backlog cuya edad cubre días sin indicar la diferencia de ventana.
5. Una tasa de éxito técnico no representa éxito empresarial.
6. Una tasa de error de proveedor se calcula sobre llamadas a esa dependencia, no sobre todas las operaciones del sistema.
7. Una tasa de misfire se calcula sobre ocurrencias programadas debidas dentro del scope, no sobre intentos.
8. Una tasa de deduplicación se calcula sobre submissions o eventos repetidos observados, no sobre operaciones únicas sin exposición a replay.
9. Una tasa de recovery se separa entre solicitudes resueltas y operaciones que finalmente alcanzaron terminalidad compatible.
10. Un porcentaje no se publica cuando su denominador sea cero, desconocido o incompleto; se presenta como sin evidencia suficiente, no como `0 %`.

---

#### 15. Dimensiones, cardinalidad y privacidad

Se hereda la política de `TSVC-CAT-007`.

Dimensiones cerradas compatibles, cuando apliquen y permanezcan acotadas:

- `service_id`;
- `contract_version`;
- `operation_type`;
- `operation_status`;
- `error_class`;
- `retry_profile`;
- `priority_class`;
- `environment`;
- clase de dependencia;
- clase de frontera de concurrencia;
- perfil de ciclo `SCHEDULED_WORK`, `OFFLINE_OR_DEVICE_WORK` o `EVENT_DRIVEN_WORK`.

Reglas:

1. `operation_id`, `attempt_id`, `claim_id`, `event_id`, `trace_id`, `span_id`, `idempotency_key`, `concurrency_key`, `recovery_request_id`, `cancellation_request_id` y referencias individuales no se usan como etiquetas libres de métricas.
2. Los identificadores individuales permanecen disponibles en logs, trazas, eventos o auditoría con acceso gobernado.
3. `QAI-*` identifica el inventario documental y puede emplearse como dimensión analítica cerrada únicamente durante la coexistencia si la implementación declara su mapping estable; no se deriva de nombres libres de cola o URLs.
4. Sitio, dispositivo, proveedor o consumidor solo se exponen como dimensión cuando cardinalidad, finalidad y sensibilidad lo permitan.
5. Ningún payload, mensaje de error libre, correo, teléfono, documento, firma, secreto, token, URL completa o dato personal se incorpora a etiquetas.
6. Cambiar la semántica de una métrica requiere versionado del catálogo; un dashboard no redefine su significado.

---

#### 16. Frescura, completitud y ausencia de instrumentación

La ausencia de una muestra puede significar al menos:

- no hubo trabajo;
- la fuente no está instrumentada;
- la telemetría no llegó;
- la consulta está incompleta;
- el pipeline de observabilidad está degradado;
- el componente no existe o no está desplegado en ese ambiente.

Por tanto:

1. no se transforma ausencia de señal en valor cero sin evidencia de cobertura completa;
2. toda métrica debe permitir conocer `observed_at` o frescura equivalente;
3. un contador que reinicia declara instancia o ventana de reset sin usar esa instancia como etiqueta de alta cardinalidad global;
4. un gauge stale no se presenta como valor actual;
5. una consulta parcial no se extrapola a todos los ambientes;
6. `QAI-008` permanece `PENDIENTE_DE_EVIDENCIA`: que no exista ejecución observada no demuestra una tasa cero de trabajo objetivo;
7. los activos `DEFINED_NOT_INSTRUMENTED` de `TSVC-CAT-007` no pasan a instrumentados por quedar definida esta semántica;
8. el fallo del pipeline de observabilidad se mide y declara como visibilidad degradada, no como salud de los servicios observados.

---

#### 17. Matriz materializada de métricas para las 19 identidades `QAI-*`

| ID        | Clasificación                | Perfil                   | Espera y capacidad                                                                                       | Ejecución                                                                                                       | Error, incertidumbre y control                                                                    | Estado y brecha documental                                                                                                                                       |
| --------- | ---------------------------- | ------------------------ | -------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `QAI-001` | `APLICA_METRICAS_DE_TRABAJO` | `SCHEDULED_WORK`         | drift de ocurrencia, misfire, elegibilidad, wait hasta claim, backlog y edad                             | intento de cierre y duración end-to-end de la ocurrencia                                                        | retry, expiry, conflicto de versión, claim/fencing y colisión de efecto con otros cierres         | `ESPECIFICADO`; métricas de la ocurrencia permanecen separadas de `QAI-004`, aunque comparten análisis de contención por turno/recurso                           |
| `QAI-002` | `APLICA_METRICAS_DE_TRABAJO` | `SCHEDULED_WORK`         | drift del schedule, espera de ocurrencia raíz y espera de cada hijo/etapa                                | duración raíz, transporte, Edge Function y trabajos hijos con efecto independiente                              | retry por etapa, backlog downstream, resultado desconocido, aislamiento y fallo de dependencia    | `ESPECIFICADO`; éxito del cron o del transporte no equivale a cierre de los trabajos hijos                                                                       |
| `QAI-003` | `APLICA_METRICAS_DE_TRABAJO` | `SCHEDULED_WORK`         | drift, misfire, wait y bloqueo por versión del turno                                                     | duración del intento de corrección stale                                                                        | conflicto de versión, retry, expiry, claim rechazado y terminalidad                               | `ESPECIFICADO`; no se cuenta como error que otro cierre legítimo haya dejado el turno no elegible sin clasificar primero el evento                               |
| `QAI-004` | `APLICA_METRICAS_DE_TRABAJO` | `SCHEDULED_WORK`         | drift y wait propios del schedule transicional                                                           | duración de su propia ocurrencia                                                                                | overlap, duplicado suprimido, conflicto de recurso y efectos rechazados frente a `QAI-001`        | `ESPECIFICADO`; continuidad legacy y retiro permanecen bajo `TSVC-CAT-010`                                                                                       |
| `QAI-005` | `APLICA_METRICAS_DE_TRABAJO` | `SCHEDULED_WORK`         | drift del batch, backlog raíz y de entregas hijas, edad por canal cuando aplique                         | duración del batch, `pg_net`, worker y proveedor como fronteras separadas                                       | rate limit, retry, dependencia, dedup, resultado desconocido y aislamiento                        | `ESPECIFICADO`; ACK técnico no se cuenta como entrega final de alerta                                                                                            |
| `QAI-006` | `APLICA_METRICAS_DE_TRABAJO` | `SCHEDULED_WORK`         | drift de ocurrencia, wait y backlog de mantenimiento                                                     | duración de limpieza por ocurrencia y, cuando aplique, por unidad                                               | retry, misfire, expiry y error técnico                                                            | `ESPECIFICADO`; la vigencia empresarial de una cotización permanece separada del resultado técnico del job                                                       |
| `QAI-007` | `APLICA_METRICAS_DE_TRABAJO` | `SCHEDULED_WORK`         | drift, wait de la ocurrencia y backlog de checkouts a reconciliar                                        | duración raíz y duración por unidad/checkout cuando tenga efecto independiente                                  | retry, conflictos de lock/versión, `result_unknown`, conciliación y fallos terminales             | `ESPECIFICADO`; un batch técnico exitoso no oculta un checkout todavía ambiguo                                                                                   |
| `QAI-008` | `APLICA_METRICAS_DE_TRABAJO` | `SCHEDULED_WORK`         | modelo completo de drift, misfire, wait, backlog y edad objetivo                                         | intento y duración de la ocurrencia cuando exista despliegue acreditado                                         | retry, expiry, error y aislamiento según contrato                                                 | `PENDIENTE_DE_EVIDENCIA`; no se publica cero como sustituto de la ausencia de despliegue/telemetría; adopción y evidencia corresponden a `DELIV-PKG-001`         |
| `QAI-009` | `APLICA_METRICAS_DE_TRABAJO` | `SCHEDULED_WORK`         | lag del workflow programado, wait del batch y edad de solicitudes elegibles                              | duración del workflow/worker y de cada solicitud destructiva como unidad independiente                          | cancelación, efecto parcial, `result_unknown`, recovery, retry y fallo por solicitud              | `ESPECIFICADO`; conclusión `success` del workflow no demuestra que toda solicitud hija alcanzó resultado autoritativo                                            |
| `QAI-010` | `PROPAGA_NO_DECIDE_METRICAS` | `UPSTREAM_PROPAGATED`    | profundidad, edad y latencia de transporte pueden medirse como señales técnicas                          | duración HTTP o de transporte como dependencia upstream                                                         | errores de transporte, timeout y backlog se correlacionan con el trabajo propietario              | `ESPECIFICADO`; `pg_net` no crea contadores de operaciones empresariales ni terminalidad propia por inferencia                                                   |
| `QAI-011` | `APLICA_METRICAS_DE_TRABAJO` | `OFFLINE_OR_DEVICE_WORK` | edad de custodia local, espera offline, retry_pending y backlog por dispositivo bajo cardinalidad segura | duración de cada intento de sync y dependencia servidora                                                        | retry, conflicto, error local/servidor, dedup y conciliación                                      | `ESPECIFICADO`; `pending/syncing/failed/conflict` actuales son evidencia local parcial, no métricas transversales completas                                      |
| `QAI-012` | `APLICA_METRICAS_DE_TRABAJO` | `OFFLINE_OR_DEVICE_WORK` | misma familia que `QAI-011`, conservando backlog y edad separados para descansos                         | duración de intento y RPC start/end aplicable                                                                   | retry, conflicto, error, dedup y conciliación propios                                             | `ESPECIFICADO`; compartir worker no mezcla denominadores, backlog ni intentos con asistencia                                                                     |
| `QAI-013` | `PROPAGA_NO_DECIDE_METRICAS` | `UPSTREAM_PROPAGATED`    | frecuencia real de wake-up, capacidad y frescura pueden observarse como health técnico                   | tiempo del sweep técnico sin convertirlo en duración de cada operación                                          | errores del loop se correlacionan con `QAI-011`/`QAI-012`; el tick no es retry                    | `ESPECIFICADO`; intervalo de `15000 ms` no se utiliza como backoff ni como nueva operación                                                                       |
| `QAI-014` | `APLICA_METRICAS_DE_TRABAJO` | `OFFLINE_OR_DEVICE_WORK` | espera atribuible al SO/conectividad y tiempo hasta ejecución servidora, sin ampliar deadline            | duración del callback procesado y de la mutación servidora                                                      | conflicto de turno/versión, retry cuando aplique, incertidumbre y conciliación                    | `ESPECIFICADO`; ubicación o callback no constituyen resultado autoritativo por sí solos                                                                          |
| `QAI-015` | `APLICA_METRICAS_DE_TRABAJO` | `OFFLINE_OR_DEVICE_WORK` | edad de cola local, wait hasta dispatch y disponibilidad de dispositivo                                  | duración del dispatch/adaptador y dependencia de impresora                                                      | timeout, duplicado suprimido, resultado físico desconocido, conciliación y reimpresión autorizada | `ESPECIFICADO`; vaciar `localStorage` no produce `operations_completed_total`; detalle especializado continúa en `PRINT-ARC-*`                                   |
| `QAI-016` | `NO_APLICA`                  | `NO_APLICA`              | `NO_APLICA`                                                                                              | `NO_APLICA`                                                                                                     | `NO_APLICA`                                                                                       | `NO_APLICA`; refresco de lectura sin trabajo durable ni efecto empresarial; su telemetría de UI pertenece a su propio contrato, no a métricas de trabajo de cola |
| `QAI-017` | `APLICA_METRICAS_DE_TRABAJO` | `EVENT_DRIVEN_WORK`      | tiempo desde evento fuente hasta reserva/entrega derivada y backlog de notificación                      | duración de worker, transporte y proveedor cuando aplique                                                       | retry, dependencia, dedup, timeout, resultado desconocido y terminalidad de la entrega            | `ESPECIFICADO`; el `support_message` sigue siendo fuente y no se contabiliza como resultado de notificación                                                      |
| `QAI-018` | `APLICA_METRICAS_DE_TRABAJO` | `EVENT_DRIVEN_WORK`      | latencia de recepción a reserva/claim y espera de procesamiento del evento Wompi                         | duración del procesamiento y de la mutación de transacción/recurso                                              | replay suprimido, firma inválida, conflicto, `result_unknown`, conciliación y error de proveedor  | `ESPECIFICADO`; `processed` y HTTP `200` permanecen señales específicas y no sustituyen el resultado empresarial del pago                                        |
| `QAI-019` | `APLICA_METRICAS_DE_TRABAJO` | `EVENT_DRIVEN_WORK`      | latencia desde recepción a procesamiento y backlog/replay cuando se materialice la reserva canónica      | duración del procesamiento y de componentes suscripción/entitlement/auditoría cuando sean medibles por separado | replay, componente fallido, resultado parcial, conciliación y terminalidad                        | `ESPECIFICADO`; el flujo actual no acredita reserva/state machine transversal ni éxito verificable de los tres componentes; adopción en `DELIV-PKG-001`          |

Resultado de reconciliación:

```text
19 IDENTIDADES ESPERADAS
19 IDENTIDADES MATERIALIZADAS
16 APLICAN MÉTRICAS DE TRABAJO
2 PROPAGAN Y NO DECIDEN MÉTRICAS
1 NO APLICA
0 FALTANTES
0 DUPLICADOS

PERFILES ENTRE LAS 16 APLICABLES
SCHEDULED_WORK         = 9
OFFLINE_OR_DEVICE_WORK = 4
EVENT_DRIVEN_WORK      = 3
```

---

#### 18. Reconciliación con implementación actual

##### 18.1. Schedulers y jobs recurrentes

Las ejecuciones actuales de `pg_cron` y GitHub Actions pueden aportar evidencia de disparo, duración o conclusión de su propia capa. No acreditan por sí solas:

- `WORK_RESERVED` de cada intención;
- claim/fencing de la operación;
- estado de trabajos hijos;
- resultado empresarial;
- conciliación de efectos ambiguos.

Por tanto, un `succeeded` del scheduler no alimenta automáticamente `TSVC-MET-002` del trabajo end-to-end.

##### 18.2. `QAI-008`

La definición está versionada, pero el inventario aprobado no acredita despliegue remoto del schedule. La cobertura métrica se mantiene `PENDIENTE_DE_EVIDENCIA` hasta que `DELIV-PKG-001` reciba evidencia de adopción/despliegue y la instrumentación correspondiente. La ausencia de señal no se registra como backlog cero, misfire cero ni éxito.

##### 18.3. ANIMA offline

La implementación actual conserva estados locales `pending`, `syncing`, `failed`, `conflict`, contador de intentos y `nextRetryAt`. Esos campos permiten diagnóstico local y mediciones parciales, pero no acreditan:

- estado transversal end-to-end;
- claim/lease/fencing distribuido;
- reloj común con servidor;
- métricas centrales completas;
- resultado empresarial únicamente por desaparecer de la cola local.

La adopción física y la reconciliación de instrumentación corresponden a `DELIV-PKG-001`.

##### 18.4. NEXO impresión

La cola local y BrowserPrint permiten observar intención local y dispatch, pero el vaciado de la cola después de iniciar envío no demuestra impresión física. `TSVC-MET-002` solo puede crecer cuando exista resultado autoritativo suficiente conforme al contrato de impresión. Timeout o callback incierto alimentan incertidumbre/conciliación, no éxito ni retry ciego.

##### 18.5. Wompi

El handler vigente conserva controles específicos de firma, lookup de evento, estado `processed`, mutación de transacción y registro de evento. Esos elementos son señales parciales útiles, pero no constituyen por sí solos el conjunto de métricas de `QUEUE-ARC-011`. La observabilidad futura correlaciona replay, procesamiento, dependencia, resultado y conciliación sin usar el estado de transacción como `operation_status`.

##### 18.6. RevenueCat

El handler vigente produce suscripción, entitlement y auditoría de forma secuencial y no acredita una reserva transversal previa del evento ni una máquina común de estado. Una respuesta HTTP exitosa no permite, por sí sola, construir una tasa de éxito end-to-end de los tres componentes. La instrumentación futura deberá registrar cada frontera suficiente para distinguir resultado completo, parcial e incierto; su adopción corresponde a `DELIV-PKG-001`.

##### 18.7. `pg_net` y worker móvil

`QAI-010` y `QAI-013` pueden exponer señales técnicas propias de transporte o health, pero no se convierten en otra población de operaciones empresariales. Sus errores, latencias y backlog se correlacionan con las operaciones upstream.

---

#### 19. Umbrales, SLO y alertas

Esta tarea define **qué medir y cómo interpretar la medición**, no objetivos numéricos universales.

Queda fijado:

1. no se aprueba un máximo universal de queue wait;
2. no se aprueba un máximo universal de attempt duration;
3. no se aprueba una tasa universal de error, retry, misfire, dead-letter o result unknown;
4. no se aprueba un percentil objetivo universal;
5. no se aprueba un umbral de backlog común a todos los servicios;
6. no se aprueba un timeout de dependencia por inferencia métrica;
7. los futuros thresholds deberán provenir de baseline medido, criticidad, contrato, capacidad, ambiente y SLO aprobado;
8. una alerta consume métricas; no modifica por sí misma retry, prioridad, cancelación, recovery ni autorización;
9. `TSVC-CAT-007` continúa siendo propietario del catálogo transversal de alertas y observabilidad;
10. cualquier instrumentación física y baseline se materializan dentro de los paquetes de implementación recibidos por `DELIV-PKG-001`.

---

#### 20. Handoff exacto

| Destino                                                                           | Responsabilidad recibida                                                                                                                                                                                                                                  |
| --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `QUEUE-ARC-012 — Definir autorización para crear, cancelar y reintentar trabajos` | definir quién puede crear trabajo, solicitar o hacer efectiva cancelación, forzar retry, recovery o acciones extraordinarias; las métricas de esta tarea son evidencia de contexto y nunca permiso                                                        |
| `DELIV-PKG-001`                                                                   | recibir las brechas de instrumentación del inventario, planificar adopción física de estados/eventos/métricas, repositorios consumidores, almacenamiento de telemetría, pruebas, baseline y evidencia sin declarar instrumentación antes de implementarla |
| `TSVC-CAT-010`                                                                    | conservar la transición y retiro controlado de soluciones legacy, incluida coexistencia de observabilidad parcial durante adopción                                                                                                                        |
| `PRINT-ARC-*`                                                                     | especializar la evidencia y medición física de impresión sin redefinir la métrica transversal de trabajo                                                                                                                                                  |

No se desarrolla ninguna de esas responsabilidades dentro de `QUEUE-ARC-011`.

---

#### 21. Prohibiciones

Esta tarea no autoriza:

1. crear tablas, vistas, índices, funciones, triggers, colas, buckets o esquemas de métricas;
2. modificar Supabase, RLS, grants, Realtime, Storage, Edge Functions, cron o configuración;
3. instalar SDK, agente, collector, exporter, OpenTelemetry, Prometheus, Sentry ni otro proveedor;
4. crear dashboards, paneles, consultas operativas o alertas físicas;
5. fijar SLO, SLA, percentiles objetivo o umbrales universales;
6. modificar los veinte `TSVC-MET-*` aprobados por `TSVC-CAT-007`;
7. crear nuevas identidades `TSVC-MET-*` desde esta especialización;
8. modificar los dieciséis estados o treinta y tres eventos de `QUEUE-ARC-010`;
9. tratar un retry como operación nueva;
10. tratar un claim como resultado;
11. tratar `dead_letter`, `quarantined` o `result_unknown` como `failed` por conveniencia estadística;
12. tratar un scheduler exitoso como resultado end-to-end;
13. tratar ausencia de telemetría como cero;
14. usar identificadores de alta cardinalidad, payloads, secretos o datos personales como etiquetas métricas;
15. derivar autoridad de una métrica, alerta, dashboard o estado de health;
16. activar `QAI-008`;
17. retirar `QAI-004`;
18. modificar ANIMA, NEXO, PASS ni otro consumidor;
19. declarar instrumentación, baseline, monitoreo operativo o validación física inexistentes;
20. iniciar o desarrollar `QUEUE-ARC-012`.

---

#### 22. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea especializa para el inventario `QAI-*` la semántica de observabilidad y métricas ya aprobada transversalmente. No crea comportamiento ejecutable, no altera estados, transiciones, retry, concurrencia, integración, seguridad ni resultado empresarial, y no modifica el catálogo `TSVC-MET-*`; únicamente define cómo derivar y separar mediciones de espera, ejecución y error a partir de fuentes canónicas existentes.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

---

#### 23. Cobertura de prueba existente preservada

Se preserva sin modificación la cobertura que `TSVC-CAT-007` ya declaró suficiente para observabilidad, métricas, capacidad, backlog, latencias, retry, resultado desconocido, idempotencia, salud, privacidad y reconstrucción end-to-end, incluyendo:

- `TREQ-PROC-095` a `TREQ-PROC-110`;
- `TREQ-PROC-251` a `TREQ-PROC-269`;
- `TREQ-PROC-271` a `TREQ-PROC-294`;
- `TREQ-PROC-355` a `TREQ-PROC-368`;
- `TREQ-INTEGRATION-003`;
- `TREQ-INTEGRATION-019`;
- `TREQ-INTEGRATION-023`.

También permanece vigente la trazabilidad de `TREQ-INTEGRATION-004` para reconstruir cadenas de jobs, triggers, webhooks y notificaciones con causa, intento, error y efecto final.

Ninguna fila del registro canónico cambia de identificador, regla, estado, responsable, evidencia, relación o secuencia por esta tarea.

---

#### 24. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. conserva `QUEUE-ARC-010` como tarea anterior aprobada;
2. conserva `QUEUE-ARC-012` como única tarea siguiente reservada;
3. especializa `TRANSVERSE-SERVICE-OBSERVABILITY-REGISTRY-001@1.0.0` sin crear un catálogo paralelo;
4. conserva exactamente las veinte métricas `TSVC-MET-001..020`;
5. crea cero identidades nuevas `TSVC-MET-*`;
6. conserva los dieciséis estados y treinta y tres eventos de `QUEUE-ARC-010` sin modificarlos;
7. distingue wait, execution, outcome/error, concurrency, recovery y capacity;
8. define reloj y fuente comparables antes de restar timestamps;
9. usa `event_sequence` y `status_version` para orden lógico cuando los relojes no bastan;
10. rechaza intervalos negativos o temporalidad imposible en vez de corregirlos silenciosamente a cero;
11. mide dwell por estado no terminal;
12. separa `scheduled`, wait elegible, `blocked`, `retry_pending`, incertidumbre e aislamiento;
13. define wait hasta claim solo durante elegibilidad real;
14. conserva `backlog_depth` y `oldest_backlog_age_seconds` con scope de estados explícito;
15. distingue backoff programado de lateness real de retry;
16. mide duración de intento por `attempt_id` sin incluir espera previa;
17. mide duración end-to-end de operación desde reserva hasta terminalidad;
18. conserva tiempo activo separado de duración end-to-end;
19. mide dependencias dentro de fronteras de reloj controladas;
20. conserva retries como intentos y no como operaciones;
21. define amplificación de intentos con denominador de operaciones que realmente ejecutaron;
22. mantiene `failed`, `result_unknown`, `quarantined`, `dead_letter`, `cancelled` y `expired` separados;
23. conserva rechazos de contrato y autenticación separados del fallo interno;
24. mide claim, lease, fencing, versión y duplicados sin doble conteo;
25. mide cancelación, incertidumbre, conciliación y recovery por episodios identificables;
26. define cohortes y denominadores antes de publicar tasas;
27. no publica `0 %` cuando el denominador o la cobertura son desconocidos;
28. aplica dimensiones cerradas y cardinalidad acotada;
29. excluye identificadores individuales, payloads, secretos y datos personales de labels libres;
30. no interpreta ausencia de señal como valor cero;
31. conserva `QAI-008` como `PENDIENTE_DE_EVIDENCIA`;
32. materializa exactamente una decisión para `QAI-001..QAI-019`;
33. obtiene 16 `APLICA_METRICAS_DE_TRABAJO`, 2 `PROPAGA_NO_DECIDE_METRICAS` y 1 `NO_APLICA`;
34. obtiene 9 `SCHEDULED_WORK`, 4 `OFFLINE_OR_DEVICE_WORK` y 3 `EVENT_DRIVEN_WORK` entre las 16 aplicables;
35. mantiene 0 identidades faltantes y 0 duplicadas;
36. mantiene `QAI-010` y `QAI-013` como propagadores técnicos sin población empresarial propia;
37. mantiene `QAI-016` como `NO_APLICA`;
38. distingue scheduler success de resultado end-to-end;
39. conserva estados locales ANIMA como evidencia parcial y no equivalencia automática;
40. impide que vaciar la cola NEXO signifique impresión exitosa;
41. conserva Wompi como observabilidad específica parcial sin convertir `processed` en estado transversal;
42. documenta la falta de state machine e instrumentación transversal acreditada para RevenueCat;
43. no fija SLO ni umbrales universales;
44. asigna adopción física, baseline e instrumentación a `DELIV-PKG-001`;
45. reserva autoridad exclusivamente para `QUEUE-ARC-012`;
46. declara cero cambios de requisitos de prueba con justificación concreta;
47. crea cero objetos físicos;
48. modifica cero repositorios, Supabase, cron, colas, workers, dispositivos, adaptadores o webhooks;
49. no inicia ni desarrolla `QUEUE-ARC-012`.

---

#### 25. Resultado de la tarea

`QUEUE-ARC-011` deja definida la semántica de métricas del trabajo asíncrono sin crear una segunda fuente de verdad:

```text
ESTADO + EVENTOS
        ↓
DWELL POR CAUSA
        ↓
ESPERA ELEGIBLE / BLOQUEO / RETRY / AISLAMIENTO
        ↓
CLAIM
        ↓
INTENTO Y DEPENDENCIAS
        ↓
RESULTADO / ERROR / INCERTIDUMBRE
        ↓
CONCILIACIÓN Y RECOVERY CUANDO APLIQUE
        ↓
AGREGADOS CON COHORTE, VENTANA, FRESCURA Y CARDINALIDAD CONTROLADAS
```

Las 19 identidades quedan reconciliadas una a una. Las veinte métricas transversales existentes siguen siendo la base común; esta tarea determina cómo interpretarlas y qué mediciones derivar del ciclo de vida para distinguir espera, ejecución y error sin fabricar resultados, tasas, salud ni cumplimiento cuando la instrumentación aún no existe.

---

#### 26. Continuidad

ÚLTIMA TAREA APROBADA

`QUEUE-ARC-010 — Definir estados y eventos canónicos`

TAREA ACTUAL APROBADA

`QUEUE-ARC-011 — Definir métricas de espera, ejecución y error`

SIGUIENTE TAREA RESERVADA

`QUEUE-ARC-012 — Definir autorización para crear, cancelar y reintentar trabajos`



### ✅ QUEUE-ARC-012 — Definir autorización para crear, cancelar y reintentar trabajos

**Estado:** APROBADA
**Tarea anterior:** `QUEUE-ARC-011 — Definir métricas de espera, ejecución y error`
**Tarea siguiente:** `DELIV-PKG-001 — Crear identificador estable para cada paquete de implementación`
**Tipo de tarea:** documental; especialización canónica de autorización y control para crear trabajo asíncrono, disparar ocurrencias manuales, cambiar prioridad o asignación, solicitar cancelación, forzar retry elegible, iniciar recuperación y recuperar exclusiones técnicas, separando autorización empresarial, identidad técnica, ejecución automática y acciones extraordinarias para las 19 identidades `QAI-*`, sin crear PermissionKeys, grants, roles, RPC, RLS, colas, workers, credenciales, interfaces ni cambios físicos
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/03_INFRAESTRUCTURA_CANONICA_DE_COLAS.md`
**Línea base documental:** `vento-shell@e462f6f962646cfe7dc7ed106b90856cf63a06db`
**Contrato base de trabajo:** `TSVC-SVC-001.CONTRACT@1.0.0`
**Registro de identidad técnica consumido:** `TRANSVERSE-SERVICE-TECHNICAL-IDENTITY-REGISTRY-001@1.0.0`
**Registro de confiabilidad consumido:** `TRANSVERSE-SERVICE-RELIABILITY-REGISTRY-001@1.0.0`
**Contrato de idempotencia consumido:** `WORK-IDEMPOTENCY-CONTRACT-001@1.0.0`
**Contrato temporal consumido:** `WORK-SCHEDULING-POLICY-CONTRACT-001@1.0.0`
**Contrato de asignación consumido:** `WORK-ASSIGNMENT-CONTRACT-001@1.0.0`
**Contrato de retry consumido:** `WORK-RETRY-POLICY-CONTRACT-001@1.0.0`
**Contrato de cancelación consumido:** `WORK-CANCELLATION-CONTRACT-001@1.0.0`
**Contrato de recuperación consumido:** `WORK-FAILURE-RECOVERY-CONTRACT-001@1.0.0`
**Contrato de concurrencia consumido:** `WORK-CONCURRENCY-CONTROL-CONTRACT-001@1.0.0`
**Contrato de estados y eventos consumido:** `WORK-STATE-EVENT-CONTRACT-001@1.0.0`
**Registro de observabilidad consumido:** `TRANSVERSE-SERVICE-OBSERVABILITY-REGISTRY-001@1.0.0`
**Contrato canónico de decisión consumido:** `AuthorizationDecision@1.0.0`
**Inventario consumido:** `QUEUE-CURRENT-ASSET-INVENTORY-001` — 19 identidades `QAI-*`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Cerrar la dimensión de autoridad del trabajo asíncrono de Vento OS: quién puede originar una intención, quién puede solicitar una acción de control sobre una operación existente, qué decisiones pueden continuar automáticamente bajo la autoridad ya validada de la intención original y qué acciones extraordinarias exigen una nueva decisión de autorización antes de modificar el tratamiento técnico del trabajo.

La regla raíz es:

```text
IDENTIDAD TÉCNICA AUTENTICADA
≠
AUTORIZACIÓN EMPRESARIAL
≠
AUTORIDAD PARA UNA ACCIÓN DE CONTROL
≠
CLAIM / LEASE / FENCING
≠
RESULTADO EMPRESARIAL
```

Y también:

```text
POSEER operation_id
POSEER receipt_id
POSEER idempotency_key
POSEER claim_id
POSEER lease_token
POSEER fencing_token
POSEER UNA CREDENCIAL DE SERVICIO
POSEER UNA CREDENCIAL DE DISPOSITIVO
POSEER UNA CREDENCIAL DE PROVEEDOR
        ↓
NO CONCEDE POR SÍ SOLO PERMISO PARA
CREAR / CANCELAR / REINTENTAR / RECUPERAR / REASIGNAR
```

Toda acción protegida debe resolverse mediante el modelo canónico de autorización de Vento OS y permanecer separada de la credencial que permite al servicio, worker, dispositivo, scheduler o adaptador autenticarse técnicamente.

---

#### 2. Resultado sustantivo

Se establece `WORK-AUTHORIZATION-CONTRACT-001@1.0.0` como especialización de autoridad y control del contrato canónico de trabajo asíncrono.

El resultado material fija:

1. la separación obligatoria entre autenticación técnica, autorización empresarial, autoridad de control y ejecución técnica;
2. un modelo cerrado para autorizar creación ordinaria, creación derivada por reglas del sistema y acciones manuales o extraordinarias;
3. nueve acciones canónicas de control, sin convertir sus nombres en nuevas PermissionKeys;
4. un sobre mínimo de solicitud y decisión de control;
5. la obligación de resolver un `required_permission_ref` canónico por operación y acción, sin inventar permisos por nombre de cola, worker, endpoint o interfaz;
6. default-deny cuando una acción manual no tenga permiso, recurso, ámbito, owner o política de control explícitos;
7. la regla de que el retry automático ordinario continúa la misma intención y no exige una nueva intención ni una nueva concesión por intento;
8. la regla de que un retry manual solo puede acelerar o solicitar una ejecución todavía permitida por la política vigente y nunca anular un error no reintentable, un deadline, un efecto ambiguo, una cancelación o un presupuesto agotado;
9. la separación entre `FORCE_RETRY` y la recuperación extraordinaria `SAFE_REEXECUTE_SAME_INTENTION` ya definida en `QUEUE-ARC-008`;
10. la autoridad requerida para solicitud de cancelación, disparo manual, cambio de prioridad, reasignación forzada, recovery y recuperación de una exclusión técnica;
11. la prohibición de romper un claim, lease, fencing o guardia de recurso todavía válidos únicamente porque el solicitante tenga una capacidad administrativa;
12. la conducta de identidades `SERVICE_RUNTIME_IDENTITY`, `WORKER_IDENTITY`, `DEVICE_IDENTITY`, `PROVIDER_IDENTITY`, `SCHEDULER_IDENTITY`, `OBSERVER_IDENTITY` y `BREAK_GLASS_IDENTITY` frente a acciones de control;
13. la regla de que un sistema programado o event-driven puede originar trabajo solamente desde una regla contractual aprobada, versionada y vigente de la aplicación propietaria;
14. la regla de que un proveedor externo aporta un evento y autenticidad de frontera, pero nunca autoridad para gobernar la cola interna ni el resultado empresarial;
15. la integración con los 33 eventos ya aprobados sin crear un segundo state machine ni un segundo catálogo de eventos;
16. una decisión explícita para las 19 identidades `QAI-*` del inventario aprobado;
17. el cierre documental de `QUEUE-ARC-001..012` y el handoff exclusivo a planificación de implementación.

Balance:

| Métrica                                        | Resultado |
| ---------------------------------------------- | --------: |
| Identidades `QAI-*` esperadas                  |    **19** |
| Identidades materializadas                     |    **19** |
| `APLICA_AUTORIZACION_DE_CONTROL`               |    **16** |
| `PROPAGA_NO_DECIDE_AUTORIZACION`               |     **2** |
| `NO_APLICA`                                    |     **1** |
| Perfil `SCHEDULED_SYSTEM_AUTHORITY`            |     **9** |
| Perfil `OFFLINE_OR_DEVICE_DELEGATED_AUTHORITY` |     **4** |
| Perfil `EVENT_DERIVED_AUTHORITY`               |     **3** |
| Perfil `UPSTREAM_PROPAGATED`                   |     **2** |
| Perfil `NO_APLICA`                             |     **1** |
| Acciones canónicas de control                  |     **9** |
| PermissionKeys nuevas creadas                  |     **0** |
| Identificadores `QAI-*` duplicados             |     **0** |
| Identidades sin decisión                       |     **0** |
| Requisitos de prueba creados o modificados     |     **0** |
| Objetos físicos creados o modificados          |     **0** |

---

#### 3. Herencia contractual obligatoria

`WORK-AUTHORIZATION-CONTRACT-001@1.0.0` no sustituye el modelo general de autorización ni crea una segunda fuente de verdad de permisos.

Hereda obligatoriamente:

- de `AuthorizationDecision@1.0.0`, aplicación, permiso exacto, requisito de autorización, recurso real, decisión base, decisión operativa, allows coincidentes, denegaciones, razones de bloqueo y decisión final `ALLOW` o `DENY`;
- de `ADR-AUTH-001`, la separación entre principal autenticado, identidad de dominio, actor efectivo, contexto, permiso, recurso, alcance, allows, denegaciones y decisión efectiva;
- del catálogo canónico de autorización, que un permiso representa una capacidad empresarial y no una pantalla, endpoint, método HTTP, cola, worker o credencial;
- de `TRANSVERSE-SERVICE-TECHNICAL-IDENTITY-REGISTRY-001@1.0.0`, la separación entre actor, caller, aplicación propietaria, servicio, worker, dispositivo, proveedor, scheduler, observador y break-glass;
- de `TSVC-SVC-001.CONTRACT@1.0.0`, `operation_id`, `operation_type`, productor, aplicación propietaria, causalidad, resultado y versión contractual;
- de `WORK-IDEMPOTENCY-CONTRACT-001@1.0.0`, la identidad estable de la intención y la prohibición de crear otra operación para ocultar repetición, conflicto o incertidumbre;
- de `WORK-SCHEDULING-POLICY-CONTRACT-001@1.0.0`, prioridad, schedule, ocurrencia, `scheduled_at`, `deadline_at`, misfire y ejecución manual diferenciada;
- de `WORK-ASSIGNMENT-CONTRACT-001@1.0.0`, `assignment_id`, `assignment_version`, target técnico y reasignación sin transferencia de ownership;
- de `WORK-RETRY-POLICY-CONTRACT-001@1.0.0`, intentos, presupuesto, `next_retry_at`, error no reintentable, resultado ambiguo y agotamiento;
- de `WORK-CANCELLATION-CONTRACT-001@1.0.0`, `cancellation_request_id`, resolución de cancelación y separación entre solicitud, efectividad, rollback y compensación;
- de `WORK-FAILURE-RECOVERY-CONTRACT-001@1.0.0`, aislamiento, `recovery_request_id`, seis acciones de recovery y ocho resoluciones de recuperación;
- de `WORK-CONCURRENCY-CONTROL-CONTRACT-001@1.0.0`, claim, lease, fencing, `concurrency_key`, guardias de recurso y rechazo de ejecutores obsoletos;
- de `WORK-STATE-EVENT-CONTRACT-001@1.0.0`, los dieciséis estados y treinta y tres eventos que representan el ciclo de vida sin conceder autoridad;
- de `TRANSVERSE-SERVICE-OBSERVABILITY-REGISTRY-001@1.0.0` y su especialización en `QUEUE-ARC-011`, la regla de que telemetría, health, dashboard, alerta o ausencia de señal no conceden autoridad;
- de `QUEUE-CURRENT-ASSET-INVENTORY-001`, las 19 identidades materiales y las brechas actuales documentadas.

Ninguna identidad técnica se convierte en rol empresarial. Ningún rol empresarial se convierte en bypass universal. Ningún token, secreto, claim o estado operativo sustituye `AuthorizationDecision@1.0.0`.

---

#### 4. Cuatro planos de autoridad separados

Toda implementación futura deberá distinguir los siguientes planos:

| Plano                       | Pregunta                                                                                       | Evidencia mínima                                                              | No concede                                      |
| --------------------------- | ---------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- | ----------------------------------------------- |
| `BUSINESS_AUTHORIZATION`    | ¿el actor o regla propietaria puede ordenar esta capacidad sobre este recurso y ámbito?        | decisión canónica o regla propietaria aprobada y versionada                   | credencial técnica del worker                   |
| `CONTROL_AUTHORIZATION`     | ¿puede el solicitante ejecutar esta acción de control sobre esta operación concreta?           | permiso requerido + recurso + acción + política de control + decisión vigente | claim, lease o ownership técnico                |
| `TECHNICAL_EXECUTION_SCOPE` | ¿puede esta identidad técnica ejecutar la etapa aprobada para este servicio, ambiente y scope? | identidad técnica + credencial mínima + scope                                 | autoridad para inventar otra acción empresarial |
| `CONCURRENCY_AUTHORITY`     | ¿qué ejecutor conserva temporalmente derecho técnico de cierre sobre esta versión?             | claim/lease/fencing/guardia vigente                                           | permiso empresarial ni capacidad administrativa |

Reglas:

1. los cuatro planos pueden coincidir temporalmente en un mismo proceso, pero nunca se fusionan conceptualmente;
2. un `ALLOW` empresarial no entrega automáticamente credenciales técnicas;
3. una credencial técnica válida no transforma un `DENY` empresarial en `ALLOW`;
4. una acción de control aprobada no permite a un worker obsoleto ignorar fencing;
5. poseer un claim vigente permite ejecutar únicamente el trabajo ya autorizado y dentro de su scope técnico;
6. un administrador técnico no puede concederse a sí mismo la capacidad empresarial que pretende ejercer;
7. un sistema de observabilidad conserva lectura y evidencia; observar una operación no autoriza modificarla;
8. el resultado empresarial continúa perteneciendo a la aplicación propietaria aunque la acción técnica haya sido autorizada correctamente.

---

#### 5. Regla canónica de decisión de control

Una acción de control sobre trabajo asíncrono solo puede aceptarse cuando todas las condiciones aplicables son verdaderas:

```text
PRINCIPAL AUTENTICADO Y VIGENTE
+
ACTOR EFECTIVO O REGLA DE SISTEMA RESOLUBLE
+
APLICACIÓN PROPIETARIA CORRECTA
+
OPERACIÓN / CONTRATO / VERSIÓN CORRECTOS
+
ACCIÓN DE CONTROL DECLARADA
+
required_permission_ref RESUELTO
+
RECURSO REAL Y VERSIÓN RESUELTOS
+
ÁMBITO TERRITORIAL / EMPRESARIAL COMPATIBLE
+
AuthorizationDecision = ALLOW
+
POLÍTICA DEL TRABAJO ADMITE LA ACCIÓN
+
ESTADO / DEADLINE / CANCELACIÓN / RESULTADO COMPATIBLES
+
VERSIÓN OBSERVADA NO OBSOLETA
+
CONTROLES DE SEGURIDAD Y CONCURRENCIA VIGENTES
        ↓
CONTROL_ACTION_ALLOWED
```

La ausencia o ambigüedad de cualquiera de los elementos obligatorios produce denegación. No se aplica un permiso parecido, un rol de emergencia informal, un owner técnico genérico ni una credencial amplia como fallback.

---

#### 6. `required_permission_ref` y prohibición de inventar PermissionKeys

Cada `operation_type` aplicable deberá declarar, por acción protegida, la referencia exacta al permiso empresarial que gobierna la capacidad.

Esta tarea no crea PermissionKeys nuevas.

El contrato de una operación deberá poder resolver, cuando la acción exista:

```text
create_permission_ref
manual_trigger_permission_ref
priority_change_permission_ref
reassignment_permission_ref
cancel_permission_ref
manual_retry_permission_ref
recovery_permission_ref
concurrency_recovery_permission_ref
corrective_create_permission_ref
```

Reglas:

1. cada referencia apunta a una PermissionKey canónica publicada y vigente;
2. dos referencias pueden apuntar al mismo permiso únicamente cuando el contrato propietario declare que la misma capacidad cubre ambos controles;
3. un control más sensible puede exigir una referencia más restrictiva que la creación ordinaria;
4. la ausencia de una referencia para una acción manual significa `DENY`, no autorización implícita;
5. una aplicación cliente no elige el permiso requerido; el servidor o contrato propietario lo deriva desde la operación y acción solicitadas;
6. el permiso no se deriva del nombre del endpoint, job, queue, workflow, Edge Function, worker o dispositivo;
7. una referencia no publicada, retirada, incompatible o perteneciente a otra aplicación produce denegación;
8. una capacidad administrativa global sigue requiriendo el permiso explícito correspondiente; el nombre del rol no actúa como bypass;
9. el acceso a una herramienta técnica, GitHub, Supabase, un dashboard o un proveedor no crea una PermissionKey empresarial;
10. si la adopción física detecta que un control necesario no posee permiso canónico compatible, ese control permanece deshabilitado hasta que el gobierno de autorización apruebe la evolución contractual correspondiente.

---

#### 7. Sobre mínimo de solicitud y decisión de control

Toda materialización futura de una acción manual o extraordinaria deberá poder conservar, cuando aplique:

```text
control_request_id
control_action
operation_id
operation_version_observed
contract_id
contract_version
operation_type
business_owner_application
caller_application
principal_reference
actor_reference
authority_basis
required_permission_ref
authorization_decision_ref
resource_reference
resource_version_observed
site_scope
area_scope
tenant_scope
device_scope
provider_scope
assignment_version_observed
failure_entry_id
failure_entry_version_observed
cancellation_request_id
recovery_request_id
claim_id_observed
fencing_token_observed
request_reason
requested_at
control_decision
control_decided_at
control_expires_at
correlation_id
causation_id
technical_executor_identity
```

Reglas:

1. `control_request_id` identifica una solicitud de control, no la intención empresarial ni un intento;
2. `control_action` usa únicamente el vocabulario cerrado de esta tarea;
3. `authorization_decision_ref` referencia la decisión canónica utilizada y no contiene credenciales;
4. `authority_basis` identifica si la acción procede de actor autorizado, regla de sistema aprobada o recovery autorizado;
5. `operation_version_observed`, `assignment_version_observed` y las versiones de recovery permiten detectar solicitudes obsoletas antes de actuar;
6. una decisión autorizada puede expirar y nunca se conserva como token empresarial reutilizable indefinidamente;
7. `technical_executor_identity` identifica quién ejecuta el efecto técnico después de aprobarlo y permanece separada del actor que lo solicitó;
8. `request_reason` es obligatorio para acciones extraordinarias y usa catálogo o clasificación gobernada cuando exista; un texto libre no sustituye la autorización;
9. secretos, tokens, service-role, credenciales de proveedor, PIN y material sensible no forman parte del sobre;
10. campos no aplicables se omiten o se declaran `NO_APLICA`; no se inventan identidades ni permisos.

---

#### 8. Catálogo cerrado de acciones de control

Se definen exactamente nueve acciones semánticas de control. **No son PermissionKeys**.

| Acción                        | Propósito                                                                           | Autoridad requerida                                                         | Restricción principal                                                           |
| ----------------------------- | ----------------------------------------------------------------------------------- | --------------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| `CREATE_WORK`                 | registrar una nueva intención de trabajo                                            | permiso empresarial de creación de la operación o regla de sistema aprobada | debe crear una sola intención idempotente                                       |
| `TRIGGER_MANUAL_OCCURRENCE`   | originar una ocurrencia adicional deliberada de un schedule                         | permiso explícito para disparo manual                                       | no se hace pasar por una ocurrencia perdida ni extiende deadline anterior       |
| `CHANGE_PRIORITY`             | modificar prioridad de una intención existente cuando su contrato lo permita        | permiso de control declarado por la operación                               | no cambia deadline, causalidad ni dependencia                                   |
| `FORCE_REASSIGNMENT`          | solicitar un cambio manual de target compatible                                     | permiso de control + scope del recurso/target                               | no concede claim ni autoridad empresarial al nuevo target                       |
| `REQUEST_CANCELLATION`        | solicitar control de cancelación sobre una operación existente                      | permiso de cancelación + versión vigente                                    | solicitud no equivale a cancelación efectiva                                    |
| `FORCE_RETRY`                 | solicitar manualmente otro intento todavía permitido por retry ordinario            | permiso de retry + presupuesto y ventana vigentes                           | no ignora backoff, deadline, error no reintentable ni resultado ambiguo         |
| `REQUEST_RECOVERY`            | iniciar una intervención identificada sobre trabajo aislado o incierto              | permiso de recovery + precondiciones de `QUEUE-ARC-008`                     | no reabre ni reejecuta por sí sola                                              |
| `RECOVER_CONCURRENCY_GUARD`   | recuperar una exclusión demostrablemente vencida, huérfana o inválida               | permiso extraordinario + evidencia de pérdida de autoridad                  | no rompe un claim, lease o fencing todavía válido                               |
| `CREATE_CORRECTIVE_OPERATION` | crear una nueva intención porque corregir cambia payload, recurso, versión o efecto | nueva autorización empresarial completa                                     | nueva `operation_id`, nueva idempotencia y causalidad con la operación original |

Las acciones automáticas internas como claim ordinario, renovación de lease, ejecución de un retry ya programado o escritura de una métrica no se convierten en acciones manuales de este catálogo.

---

#### 9. Bases de autoridad permitidas

El campo `authority_basis` usa este vocabulario cerrado:

| Base                           | Uso                                                                                                           | Regla                                                                                                          |
| ------------------------------ | ------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `ACTOR_AUTHORIZATION_DECISION` | acción iniciada por una persona o actor empresarial                                                           | requiere `AuthorizationDecision@1.0.0` vigente sobre permiso, recurso y contexto reales                        |
| `APPROVED_SYSTEM_RULE`         | schedule, evento interno o automatización aprobada que origina trabajo sin intervención humana por ocurrencia | la regla debe estar versionada, activa, vinculada a owner y operación y ejecutada por identidad técnica mínima |
| `AUTHORIZED_RECOVERY_DECISION` | acción posterior a aislamiento, incertidumbre o agotamiento                                                   | requiere decisión de recovery compatible y permiso de control aplicable; no elude seguridad                    |
| `UPSTREAM_PROPAGATED`          | transporte o worker recibe una decisión ya resuelta upstream                                                  | conserva la referencia de autoridad y no crea otra por sí mismo                                                |
| `NO_APLICA`                    | mecanismo fuera del contrato de trabajo durable                                                               | no genera decisión de control                                                                                  |

Reglas:

1. un evento de proveedor no constituye por sí solo `APPROVED_SYSTEM_RULE`; el adaptador debe validar identidad de proveedor y mapping contra un contrato VENTO aprobado;
2. un schedule no constituye autoridad por existir en `cron.job` o GitHub Actions; su definición y versión deben pertenecer a una regla aprobada de la aplicación propietaria;
3. un dispositivo no constituye `ACTOR_AUTHORIZATION_DECISION`; debe existir actor efectivo cuando el efecto empresarial lo requiera;
4. una ejecución automática ordinaria puede continuar bajo la misma autoridad de la intención mientras esta permanezca vigente y ninguna denegación o revocación aplicable la invalide;
5. una acción manual extraordinaria nunca usa `UPSTREAM_PROPAGATED` para fabricar autoridad ausente;
6. break-glass se trata como una identidad técnica excepcional y no como una quinta base de autoridad empresarial.

---

#### 10. Creación de trabajo iniciada por actor

Cuando una persona inicia una capacidad que debe ejecutarse de forma asíncrona:

1. la aplicación propietaria determina `operation_type` y `create_permission_ref`;
2. el servidor resuelve principal, actor efectivo, contexto, recurso y versión;
3. se evalúa el permiso exacto mediante el contrato canónico de autorización;
4. un `DENY` impide reservar la intención;
5. un `ALLOW` permite continuar únicamente dentro del recurso, ámbito y modalidad aprobados;
6. la productora genera u obtiene la identidad idempotente antes del primer envío;
7. la reserva de trabajo conserva referencia a la decisión de autorización sin almacenar la credencial del actor;
8. el worker posterior utiliza identidad técnica propia y no reutiliza persistentemente el token del usuario;
9. cambiar el worker, dispositivo o adaptador no cambia el permiso con el que se originó la intención;
10. si el trabajo se materializa mucho después y el contrato exige revalidación de condiciones mutables antes del efecto, el executor debe resolverlas desde fuentes autoritativas; una autorización histórica no obliga a ejecutar contra un recurso que ya no admite la acción.

---

#### 11. Creación por schedule o regla automática

Una regla automática puede originar trabajo sin una nueva interacción humana por cada ocurrencia únicamente cuando existe una definición aprobada y versionada.

Para una ocurrencia programada deben mantenerse:

```text
business_owner_application
schedule_id
schedule_version
operation_type
contract_version
logical_fire_at_utc
schedule_occurrence_id
authority_basis = APPROVED_SYSTEM_RULE
scheduler_identity
```

Reglas:

1. la aprobación de la definición no convierte al scheduler en owner empresarial;
2. la identidad técnica del scheduler solo permite disparar las operaciones, ambientes y ventanas declarados;
3. un fire ordinario no exige inventar un actor humano;
4. una definición suspendida, retirada, incompatible o fuera de vigencia no puede seguir originando trabajo por conservar una credencial válida;
5. una ocurrencia manual adicional utiliza `TRIGGER_MANUAL_OCCURRENCE` y una decisión de control nueva;
6. recuperar exactamente una ocurrencia anterior conserva su identidad y sigue las reglas de recovery, no crea una ocurrencia manual nueva;
7. un schedule legacy observado no se declara conforme únicamente porque se ejecute correctamente;
8. cambiar calendario, prioridad, vigencia o política exige la autoridad y el versionado ya definidos por el contrato temporal.

---

#### 12. Creación derivada de evento, trigger o webhook

Un evento fuente puede causar trabajo asíncrono sin otorgar autoridad de control al emisor externo.

```text
EVENTO / HECHO FUENTE
        ↓
VALIDACIÓN DE ORIGEN
+
CONTRATO / MAPPING APROBADO
+
IDEMPOTENCIA DE FUENTE
+
APLICACIÓN PROPIETARIA
        ↓
APPROVED_SYSTEM_RULE
        ↓
WORK_SUBMISSION DERIVADO
```

Reglas:

1. el proveedor externo aporta un evento, no una PermissionKey de Vento OS;
2. firma, secreto o autenticación del proveedor prueban origen técnico, no permiso para mutar cualquier recurso interno;
3. el adaptador solo puede mapear operaciones y recursos aprobados por su contrato;
4. un trigger de base de datos puede originar un efecto derivado solo dentro de la regla aprobada del evento fuente;
5. `pg_net` transporta y no autoriza;
6. un replay conserva la misma identidad de fuente y no crea otra autoridad;
7. una acción manual posterior sobre la operación interna exige la autorización de control correspondiente;
8. un `200 OK` al proveedor no representa una decisión empresarial ni una autorización para repetir efectos.

---

#### 13. Trabajo offline, dispositivo y actor efectivo

Para operaciones creadas o custodiadas en un dispositivo:

1. el dispositivo mantiene identidad técnica propia y separada del actor;
2. una sesión, PIN, enrolamiento o credencial de dispositivo no expande los permisos del actor;
3. cuando el trabajo representa una acción humana, la creación debe conservar referencia al actor efectivo y al permiso requerido;
4. la persistencia local conserva la intención y la decisión/referencia necesaria, pero no un token de usuario de larga duración para el worker;
5. al sincronizar, el servidor valida contrato, recurso, versión, temporalidad, cancelación y las condiciones de autorización que el contrato exija en ese momento;
6. un evento offline que perdió vigencia no se ejecuta por reconectar;
7. el retry automático de la misma intención no crea otra autorización por cada tick del worker;
8. una acción manual de cancelación, retry o recovery usa una nueva decisión de control;
9. cambiar de dispositivo no transfiere automáticamente autoridad humana ni empresarial;
10. el dispositivo nunca decide por sí solo que un cierre, impresión, movimiento o resultado empresarial es válido.

---

#### 14. Retry automático ordinario

El retry automático ordinario **no es una nueva acción empresarial**. Es otro intento de la misma intención ya autorizada.

Puede proceder sin una nueva solicitud humana cuando simultáneamente:

1. la operación conserva la misma identidad, payload y huella;
2. la clase de error admite retry;
3. existe presupuesto restante;
4. `next_retry_at` ya llegó;
5. el deadline sigue vigente;
6. no existe cancelación efectiva;
7. no existe resultado terminal o `RESULT_UNKNOWN` que prohíba repetición directa;
8. el recurso y versión siguen permitiendo la ejecución cuando el contrato exige revalidación;
9. la identidad técnica ejecutora conserva scope válido;
10. ninguna denegación, suspensión o revocación aplicable bloquea la operación.

Reglas:

- el retry conserva la referencia de autoridad de la intención original;
- no conserva como credencial persistente el token original del actor;
- una renovación de credencial técnica no convierte un error de autorización en error transitorio;
- el worker no puede aumentar `max_attempts` ni extender deadline por tener permisos técnicos;
- la política puede terminar una operación antes de consumir todo el presupuesto;
- si la intención dejó de ser válida, la operación se bloquea, cancela, expira o concilia según sus contratos; no se fuerza ejecución por haber sido autorizada en el pasado.

---

#### 15. `FORCE_RETRY` manual

`FORCE_RETRY` significa solicitar manualmente otro intento **todavía ordinariamente permitido**. No significa ignorar la política de retry.

La acción exige:

1. `manual_retry_permission_ref` resuelto y autorizado;
2. `operation_id` y versión observada vigentes;
3. error reintentable;
4. presupuesto restante;
5. deadline vigente;
6. ausencia de cancelación efectiva;
7. ausencia de resultado terminal;
8. ausencia de efecto externo o físico ambiguo pendiente de conciliación;
9. revalidación de resource/version cuando corresponda;
10. claim nuevo antes de la ejecución real.

Queda prohibido que `FORCE_RETRY`:

- cambie `retry_profile` a uno más permisivo;
- reinicie `attempt_no`;
- aumente `max_attempts`;
- ignore `next_retry_at` cuando la política vigente exige respetarlo;
- convierta un error de validación, autorización, contrato, conflicto o rechazo empresarial en transitorio;
- reviva una operación terminal;
- repita un efecto ambiguo;
- sustituya la recovery extraordinaria de `QUEUE-ARC-008`.

Cuando el presupuesto ordinario se agotó, una nueva ejecución de la misma intención solo puede proceder mediante `REQUEST_RECOVERY` y una resolución `SAFE_REEXECUTION_APPROVED` compatible con el contrato de recuperación.

---

#### 16. Cancelación

`REQUEST_CANCELLATION` es una acción de control protegida sobre una operación existente.

Reglas:

1. conocer `operation_id`, receipt, idempotency key o estado no concede permiso para cancelar;
2. la solicitud exige `cancel_permission_ref`, recurso, ámbito y decisión `ALLOW`;
3. la solicitud registra `cancellation_request_id` y la versión observada;
4. aceptar la solicitud no declara todavía cancelación efectiva;
5. el worker ejecuta la detención cooperativa bajo su identidad técnica una vez exista una solicitud válida y compatible;
6. un target no puede ignorar una cancelación válida porque conserve una credencial técnica;
7. un actor no puede cancelar un trabajo de otro recurso, owner, sede o ámbito únicamente porque pueda verlo;
8. una operación terminal conserva su resultado y no se reabre para marcarla cancelada;
9. si el efecto pudo ocurrir antes de resolver la cancelación, se utiliza resultado desconocido y conciliación;
10. rollback y compensación empresarial continúan siendo operaciones distintas con autorización propia.

---

#### 17. Cambio de prioridad, disparo manual y reasignación

##### 17.1. `CHANGE_PRIORITY`

Cambiar prioridad exige autorización de control y nunca puede:

- modificar `scheduled_at` o `deadline_at` por inferencia;
- romper causalidad, dependencia o guardia de recurso;
- convertir una operación vencida en elegible;
- crear otra idempotency key;
- conceder autoridad adicional al target.

##### 17.2. `TRIGGER_MANUAL_OCCURRENCE`

Una ocurrencia manual adicional:

- exige permiso explícito de control;
- recibe nueva identidad de ocurrencia e idempotencia;
- conserva referencia al schedule y motivo;
- no se utiliza para esconder una ocurrencia perdida, vencida o ya ejecutada;
- no obtiene privilegios empresariales por ejecutarse desde GitHub, Supabase o una consola técnica.

##### 17.3. `FORCE_REASSIGNMENT`

Una reasignación manual:

- exige `reassignment_permission_ref` y scope compatible;
- conserva `operation_id`, idempotencia, payload, prioridad y deadline;
- selecciona únicamente target compatible;
- crea otra `assignment_version`;
- no concede claim al nuevo target;
- no revoca por sí sola un claim válido del target anterior;
- se coordina con `QUEUE-ARC-009` antes de permitir otra ejecución real;
- no convierte al operador en owner del resultado empresarial.

---

#### 18. Recovery y acciones extraordinarias

`REQUEST_RECOVERY` abre una intervención sobre una operación aislada, incierta o agotada; no produce un efecto por sí sola.

Las seis acciones de recovery ya aprobadas se gobiernan así:

| Acción de recovery              | Autoridad de `QUEUE-ARC-012`                                                          | Regla adicional                                           |
| ------------------------------- | ------------------------------------------------------------------------------------- | --------------------------------------------------------- |
| `RECOVER_EXISTING_RESULT`       | permiso de recovery + acceso al recurso/resultados necesarios                         | enlaza resultado existente; no repite efecto              |
| `RECONCILE_ONLY`                | permiso de recovery o conciliación aplicable                                          | consulta fuentes; no ejecuta el efecto original           |
| `SAFE_REEXECUTE_SAME_INTENTION` | permiso de recovery + resolución de seguridad + autoridad sobre la operación original | no reinicia presupuesto automático ni cambia la intención |
| `COMPLETE_MISSING_COMPONENTS`   | permiso de recovery + autoridad sobre cada componente faltante                        | jamás repite componentes confirmados                      |
| `CREATE_CORRECTIVE_OPERATION`   | autorización empresarial completa para una nueva intención                            | nueva operación, clave y causalidad                       |
| `KEEP_ISOLATED`                 | permiso para resolver la solicitud de recovery sin ejecución                          | conserva aislamiento y evidencia                          |

Reglas:

1. liberar una unidad de dead-letter o cuarentena no es una acción anónima de operador;
2. una liberación masiva requiere criterio contractual explícito, scope definido y autoridad suficiente para cada unidad; la mera selección múltiple de UI no la autoriza;
3. un `AUTHENTICATION_OR_AUTHORIZATION` previo no se corrige ejecutando con una credencial más amplia sin una nueva decisión válida;
4. cambiar payload, recurso, versión, destinatario, finalidad o efecto exige `CREATE_CORRECTIVE_OPERATION` y nueva autorización empresarial;
5. una recovery autorizada sigue subordinada a idempotencia, cancelación, concurrencia, estado y evidencia de efecto;
6. el servicio técnico no decide consecuencias empresariales que el owner de dominio deba resolver.

---

#### 19. Recuperación de exclusiones y break-glass

`RECOVER_CONCURRENCY_GUARD` se utiliza únicamente cuando existe evidencia de que una exclusión técnica dejó de representar autoridad vigente.

Puede aplicarse a:

- claim abandonado;
- lease realmente vencido;
- worker definitivamente reemplazado;
- registro de exclusión huérfano;
- situación equivalente comprobada por el contrato de concurrencia.

No puede aplicarse para:

- romper un claim válido por conveniencia operativa;
- permitir dos ejecutores simultáneos;
- hacer que un worker con fencing obsoleto cierre otra versión;
- repetir un efecto externo, físico o destructivo incierto;
- eludir una guardia de versión del recurso;
- convertir `last write wins` en política de resolución.

La identidad `BREAK_GLASS_IDENTITY`:

1. solo existe para incidente o recuperación documentados;
2. requiere autoridad designada, ambiente, scope, duración y razón explícitos;
3. se audita y revoca o suspende al terminar la intervención;
4. no se usa como credencial ordinaria;
5. no convierte `DENY` empresarial en `ALLOW` por sí misma;
6. no puede inventar un resultado empresarial;
7. no permite al ejecutor obsoleto ignorar fencing;
8. no sustituye la decisión propietaria cuando una recovery exige decidir consecuencias de negocio.

---

#### 20. Identidades técnicas y límites de acción

| Identidad técnica          | Puede hacer bajo contrato                                                        | No puede hacer por su sola identidad                                                              |
| -------------------------- | -------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| `SERVICE_RUNTIME_IDENTITY` | ejecutar operaciones del servicio dentro del scope y decisiones ya autorizadas   | crear capacidad empresarial nueva, ampliar scopes o autorizarse a sí misma                        |
| `WORKER_IDENTITY`          | claim/ejecución/cierre técnico de trabajos de su servicio bajo authority vigente | cancelar, reintentar extraordinariamente, cambiar owner o alterar payload por conveniencia        |
| `CALLER_IDENTITY`          | someter solicitudes dentro del contrato y scope permitidos                       | elegir un permiso menos restrictivo ni falsificar actor/recurso                                   |
| `DEVICE_IDENTITY`          | custodiar o ejecutar etapa local/física dentro de enrolamiento y scope           | actuar como usuario humano, ampliar permisos del actor o confirmar efecto empresarial por existir |
| `PROVIDER_IDENTITY`        | autenticar evento o llamada del proveedor dentro del adaptador aprobado          | administrar operaciones internas, cancelar/retry arbitrario o convertirse en owner VENTO          |
| `SCHEDULER_IDENTITY`       | disparar schedules/operaciones declarados en ambiente y ventana aprobados        | ejecutar como worker genérico, disparar operaciones manuales adicionales sin control autorizado   |
| `OBSERVER_IDENTITY`        | consultar señales y estado autorizado en modo de solo lectura                    | mutar, reintentar, cancelar, conciliar o cambiar configuración                                    |
| `BREAK_GLASS_IDENTITY`     | ejecutar recuperación excepcional previamente autorizada y acotada               | uso diario, bypass empresarial, ampliación permanente o eliminación de auditoría                  |

`SUPABASE_SERVICE_ROLE_KEY` continúa siendo una credencial amplia legacy. Su posesión no representa ninguna de las nueve acciones de control aprobadas ni sustituye `AuthorizationDecision@1.0.0`.

---

#### 21. Estados y eventos

`QUEUE-ARC-012` no crea nuevos estados ni eventos de trabajo.

Las acciones autorizadas utilizan el vocabulario ya aprobado:

| Acción de control             | Representación de estado/evento ya existente                                                           |
| ----------------------------- | ------------------------------------------------------------------------------------------------------ |
| `CREATE_WORK`                 | `WORK_RECEIVED` / `WORK_RESERVED` después de superar validación y reserva                              |
| `TRIGGER_MANUAL_OCCURRENCE`   | crea una nueva ocurrencia y después usa los eventos normales de reserva/scheduling                     |
| `CHANGE_PRIORITY`             | conserva la operación; el cambio deberá ser reconstruible sin inventar estado empresarial              |
| `FORCE_REASSIGNMENT`          | `WORK_REASSIGNMENT_RECORDED` cuando la reasignación sea aceptada                                       |
| `REQUEST_CANCELLATION`        | `WORK_CANCELLATION_REQUESTED`; la resolución usa `WORK_CANCELLATION_RESOLVED`                          |
| `FORCE_RETRY`                 | no crea evento especial; si procede usa la secuencia ordinaria de retry ya definida                    |
| `REQUEST_RECOVERY`            | `WORK_RECOVERY_REQUESTED`; la resolución usa `WORK_RECOVERY_RESOLVED`                                  |
| `RECOVER_CONCURRENCY_GUARD`   | los eventos de claim/lease/fencing existentes representan el resultado técnico; no reabre terminalidad |
| `CREATE_CORRECTIVE_OPERATION` | nueva operación causalmente vinculada que inicia su propio ciclo de eventos                            |

Una denegación de autorización no cambia `operation_status`. La decisión negativa se conserva en la auditoría de autorización y, cuando corresponda, en evidencia técnica correlacionada, sin fabricar una transición de trabajo.

---

#### 22. Auditoría mínima de control

Toda acción manual o extraordinaria deberá dejar evidencia suficiente para reconstruir:

```text
control_request_id
control_action
principal_reference
actor_reference
business_owner_application
required_permission_ref
authorization_decision_ref
operation_id
operation_version_observed
resource_reference
resource_version_observed
scope
request_reason
requested_at
control_decision
control_decided_at
technical_executor_identity
correlation_id
causation_id
```

Reglas:

1. la auditoría no contiene secretos ni payloads completos;
2. una denegación se registra cuando la sensibilidad o el contrato lo requieran;
3. una intervención excepcional conserva antes, después, motivo, autoridad y resultado técnico;
4. aprobar una solicitud no borra solicitudes o decisiones previas;
5. la auditoría técnica del servicio permanece correlacionada con la auditoría empresarial del owner, pero no la sustituye;
6. un evento de auditoría no concede autorización retroactiva;
7. cambiar la política de control es un cambio contractual/configuracional y no una acción ordinaria sobre un item;
8. observabilidad y auditoría no se convierten en superficies de mutación por defecto.

---

#### 23. Matriz materializada de autorización para las 19 identidades `QAI-*`

| ID        | Clasificación                    | Perfil de autoridad                     | Creación / origen autorizado                                                                                                                            | Cancelación, retry y control extraordinario                                                                                                                                          | Estado y decisión documental                                                                                         |
| --------- | -------------------------------- | --------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------- |
| `QAI-001` | `APLICA_AUTORIZACION_DE_CONTROL` | `SCHEDULED_SYSTEM_AUTHORITY`            | una ocurrencia del cierre diario solo se origina desde definición ANIMA aprobada y versionada bajo `APPROVED_SYSTEM_RULE`; `pg_cron` es trigger técnico | ejecución automática conserva autoridad de la ocurrencia; disparo manual, cambio de prioridad, cancelación, retry manual, reasignación forzada o recovery exigen decisión de control | `ESPECIFICADO`; compartir efecto con `QAI-004` no crea autoridad dual y la exclusión sigue bajo concurrencia         |
| `QAI-002` | `APLICA_AUTORIZACION_DE_CONTROL` | `SCHEDULED_SYSTEM_AUTHORITY`            | la ocurrencia de runtime se origina por regla ANIMA aprobada; cron/SQL/`pg_net` no adquieren permiso empresarial                                        | cada trabajo hijo conserva su propia autoridad; un error de transporte no autoriza retry ilimitado ni control manual sin permiso                                                     | `ESPECIFICADO`; cadena multi-etapa conserva owner y causalidad                                                       |
| `QAI-003` | `APLICA_AUTORIZACION_DE_CONTROL` | `SCHEDULED_SYSTEM_AUTHORITY`            | cierre stale solo bajo schedule/contrato ANIMA vigente y recurso compatible                                                                             | una ejecución manual o recovery exige control autorizado; un turno ya resuelto no se reabre por credencial del scheduler                                                             | `ESPECIFICADO`; versión del turno sigue siendo guardia empresarial                                                   |
| `QAI-004` | `APLICA_AUTORIZACION_DE_CONTROL` | `SCHEDULED_SYSTEM_AUTHORITY`            | mientras el schedule transicional permanezca activo, solo su regla aprobada puede originar la ocurrencia                                                | su existencia remota no autoriza ampliar vigencia, duplicar `QAI-001` ni disparar manualmente sin control; retiro/adopción sigue bajo `TSVC-CAT-010`                                 | `ESPECIFICADO`; no se eleva el patrón legacy a autoridad objetivo                                                    |
| `QAI-005` | `APLICA_AUTORIZACION_DE_CONTROL` | `SCHEDULED_SYSTEM_AUTHORITY`            | `document-alerts-daily` solo origina su operación declarada; la credencial embebida observada autentica técnicamente y no es permiso empresarial        | manual trigger, cancelación, retry/recovery o cambio de política requieren control canónico; secretos continúan bajo `TI-AUTH-004`                                                   | `ESPECIFICADO`; material sensible actual no se convierte en fuente de autoridad                                      |
| `QAI-006` | `APLICA_AUTORIZACION_DE_CONTROL` | `SCHEDULED_SYSTEM_AUTHORITY`            | limpieza de cotizaciones procede únicamente desde regla PASS aprobada y scope del mantenimiento                                                         | ejecución adicional deliberada, cambio de prioridad o recovery requieren control; el worker no decide sobre entrega empresarial                                                      | `ESPECIFICADO`; mantenimiento técnico conserva owner PASS                                                            |
| `QAI-007` | `APLICA_AUTORIZACION_DE_CONTROL` | `SCHEDULED_SYSTEM_AUTHORITY`            | reconciliación de expiraciones procede desde schedule/contrato aprobado; cada checkout mantiene recurso y versión propios                               | force retry no puede convertir timeout/resultado ambiguo en fallo repetible; recovery y control manual requieren autorización                                                        | `ESPECIFICADO`; row lock o ejecución del cron no conceden autoridad de negocio                                       |
| `QAI-008` | `APLICA_AUTORIZACION_DE_CONTROL` | `SCHEDULED_SYSTEM_AUTHORITY`            | si el schedule se despliega, solo una definición NEXO aprobada podrá originar la purga dentro del scope y vigencia declarados                           | no existe autorización implícita para activarlo por estar en migración; cualquier activación/control físico deberá planificarse en `DELIV-PKG-001`                                   | `PENDIENTE_DE_EVIDENCIA`; no se activa ni se presume desplegado                                                      |
| `QAI-009` | `APLICA_AUTORIZACION_DE_CONTROL` | `SCHEDULED_SYSTEM_AUTHORITY`            | ejecución programada de eliminación de cuentas usa la regla propietaria aprobada; el workflow GitHub solo dispara                                       | `workflow_dispatch` o mecanismo manual equivalente se trata como `TRIGGER_MANUAL_OCCURRENCE`; permiso de GitHub por sí solo no autoriza la acción empresarial ni recovery            | `ESPECIFICADO`; frontera `vento-pass` → `vento-shell` requiere adopción física en `DELIV-PKG-001`                    |
| `QAI-010` | `PROPAGA_NO_DECIDE_AUTORIZACION` | `UPSTREAM_PROPAGATED`                   | transporta una solicitud ya autorizada upstream                                                                                                         | request ID, fila de `pg_net`, extensión o credencial técnica no pueden crear, cancelar, retry o recuperar trabajo empresarial                                                        | `ESPECIFICADO`; transporte sin ownership de autorización                                                             |
| `QAI-011` | `APLICA_AUTORIZACION_DE_CONTROL` | `OFFLINE_OR_DEVICE_DELEGATED_AUTHORITY` | la intención de asistencia conserva actor efectivo, permiso/recurso y contexto originadores; el dispositivo solo custodia                               | retry automático conserva la misma intención; cancelación, retry manual, recovery o corrección requieren decisión de control y revalidación servidora                                | `ESPECIFICADO`; SecureStore y enrolamiento no constituyen permiso empresarial                                        |
| `QAI-012` | `APLICA_AUTORIZACION_DE_CONTROL` | `OFFLINE_OR_DEVICE_DELEGATED_AUTHORITY` | la intención de descanso conserva autoridad y contexto propios separados de asistencia                                                                  | compartir dispositivo o worker no comparte permiso; control extraordinario se evalúa sobre la operación de descanso y su recurso vigente                                             | `ESPECIFICADO`; no se hereda autoridad de `QAI-011` por proximidad técnica                                           |
| `QAI-013` | `PROPAGA_NO_DECIDE_AUTORIZACION` | `UPSTREAM_PROPAGATED`                   | el loop móvil consume operaciones autorizadas de `QAI-011` y `QAI-012`; cada tick no crea autoridad                                                     | el worker no autoriza retry por despertarse ni puede convertir un item bloqueado/denegado en ejecutable                                                                              | `ESPECIFICADO`; worker técnico efímero sin authority propia de negocio                                               |
| `QAI-014` | `APLICA_AUTORIZACION_DE_CONTROL` | `OFFLINE_OR_DEVICE_DELEGATED_AUTHORITY` | callback de ubicación puede causar trabajo solo bajo contrato ANIMA y contexto de actor/turno compatibles; el servidor decide el efecto                 | SO, ubicación y dispositivo no conceden permiso para cerrar; control manual o corrección exige autorización canónica                                                                 | `ESPECIFICADO`; callback tardío no supera versión, deadline ni denegación vigente                                    |
| `QAI-015` | `APLICA_AUTORIZACION_DE_CONTROL` | `OFFLINE_OR_DEVICE_DELEGATED_AUTHORITY` | una impresión nace de una operación propietaria autorizada y una identidad de copia válida; worker y printer solo ejecutan técnicamente                 | reimpresión deliberada es nueva intención autorizada; efecto físico ambiguo no admite `FORCE_RETRY` y requiere recovery/conciliación antes de otra copia                             | `ESPECIFICADO`; BrowserPrint, `localStorage` o credencial de impresora no conceden autoridad empresarial             |
| `QAI-016` | `NO_APLICA`                      | `NO_APLICA`                             | refresco de lectura sin trabajo durable ni efecto empresarial                                                                                           | `NO_APLICA`                                                                                                                                                                          | `NO_APLICA`; no se fuerza una autorización de control de queue                                                       |
| `QAI-017` | `APLICA_AUTORIZACION_DE_CONTROL` | `EVENT_DERIVED_AUTHORITY`               | inserción del mensaje puede causar notificación derivada únicamente bajo contrato aprobado; trigger y `pg_net` no son owner                             | resend manual, cancelación, retry extraordinario o recovery de entrega requieren control autorizado; mensaje fuente permanece intacto                                                | `ESPECIFICADO`; autoridad de entrega separada del mensaje y del transporte                                           |
| `QAI-018` | `APLICA_AUTORIZACION_DE_CONTROL` | `EVENT_DERIVED_AUTHORITY`               | evento Wompi autenticado y deduplicado puede causar procesamiento interno solo mediante mapping y contrato VENTO aprobados                              | Wompi no puede cancelar/retry trabajo interno; ante efecto ambiguo no existe force retry directo y la recovery exige decisión canónica                                               | `ESPECIFICADO`; autenticidad del proveedor no equivale a autoridad sobre venta, orden o cola                         |
| `QAI-019` | `APLICA_AUTORIZACION_DE_CONTROL` | `EVENT_DERIVED_AUTHORITY`               | evento RevenueCat puede causar procesamiento interno únicamente tras autenticación, identidad estable y mapping aprobado                                | proveedor no gobierna retry/cancelación; la brecha de replay ya documentada permanece bajo idempotencia/concurrencia y no se corrige con autorización                                | `ESPECIFICADO`; adopción física y cierre de replay se planifican en `DELIV-PKG-001` sin declarar cumplimiento actual |

Resultado de reconciliación:

```text
19 IDENTIDADES ESPERADAS
19 IDENTIDADES MATERIALIZADAS
16 APLICAN AUTORIZACIÓN DE CONTROL
2 PROPAGAN Y NO DECIDEN AUTORIZACIÓN
1 NO APLICA
0 FALTANTES
0 DUPLICADOS

PERFILES
SCHEDULED_SYSTEM_AUTHORITY            = 9
OFFLINE_OR_DEVICE_DELEGATED_AUTHORITY = 4
EVENT_DERIVED_AUTHORITY               = 3
UPSTREAM_PROPAGATED                   = 2
NO_APLICA                             = 1
```

---

#### 24. Reconciliación con superficies actuales

##### 24.1. `pg_cron` y schedules Supabase

La capacidad de ejecutar un job técnico no constituye permiso empresarial.

- cada schedule aplicable debe estar vinculado a owner, contrato, versión, operación y ambiente;
- una credencial cron o función SQL no concede ejecución manual adicional;
- cambiar schedule, prioridad o vigencia exige control autorizado y versionado;
- `QAI-008` no puede activarse por inferencia;
- `QAI-004` no puede retirarse o ampliarse por esta tarea.

##### 24.2. GitHub Actions de eliminación de cuentas

El workflow `Process Account Deletions` admite ejecución programada y manual en el estado inventariado.

Decisión:

```text
ACCESO A GITHUB ACTIONS
≠
AUTORIZACIÓN EMPRESARIAL PARA DISPARAR EL TRABAJO
```

La ejecución programada consume la regla aprobada del schedule. Una ejecución manual adicional debe pasar por el control canónico de disparo manual y conservar actor, motivo, alcance, causalidad y decisión. La adopción física se recibe en `DELIV-PKG-001`.

##### 24.3. ANIMA offline

Las colas locales y el worker móvil no mantienen una autoridad empresarial independiente.

- el actor y contexto pertenecen a la intención;
- el dispositivo custodia, no concede;
- reconectar no reactiva una autoridad revocada;
- el retry automático no pide otra intención;
- una corrección de payload no es retry y requiere nueva operación autorizada;
- las diferencias entre policy objetivo y retry legacy se reciben en `DELIV-PKG-001`.

##### 24.4. Impresión NEXO

La impresión requiere separar:

```text
AUTORIZACIÓN DE LA ACCIÓN EMPRESARIAL
+
IDENTIDAD DE COPIA AUTORIZADA
+
IDENTIDAD TÉCNICA DEL WORKER
+
IDENTIDAD DEL DISPOSITIVO
```

Una nueva copia deliberada exige nueva intención y autorización. Una aceptación física incierta exige conciliación; ningún privilegio técnico habilita repetición ciega. El detalle especializado continúa en `PRINT-ARC-*` y la adopción física se recibe en `DELIV-PKG-001`.

##### 24.5. Webhooks y triggers

- `QAI-017`: el trigger deriva una notificación bajo contrato del mensaje fuente;
- `QAI-018`: la firma/identidad Wompi autentica el evento, no concede control de cola;
- `QAI-019`: la autenticación RevenueCat no corrige por sí sola la brecha de reserva/replay;
- `pg_net` sigue siendo transporte;
- proveedor, trigger y adaptador nunca se convierten en owner empresarial.

##### 24.6. Credenciales amplias y secretos

Una credencial amplia permite técnicamente más acciones de las que un servicio debería ejecutar, por lo que su mera posesión no puede definir authority.

- `SUPABASE_SERVICE_ROLE_KEY` permanece `LEGACY_BROAD_CREDENTIAL`;
- los secretos de scheduler o proveedor se separan de PermissionKeys;
- ninguna credencial puede autocrear scopes, desactivar auditoría o ampliar su propia finalidad;
- `QAI-H03` continúa bajo `TI-AUTH-004` para la protección del material sensible asociado a `document-alerts-daily`.

---

#### 25. Denegaciones obligatorias

Una acción de control se deniega, como mínimo, cuando ocurra cualquiera de estas condiciones aplicables:

1. principal inexistente, inactivo, revocado o no autenticado;
2. actor efectivo requerido no resoluble;
3. aplicación o permiso desconocidos, retirados o incompatibles;
4. `required_permission_ref` ausente para una acción manual;
5. decisión canónica distinta de `ALLOW`;
6. recurso inexistente, incompatible o fuera del scope del actor;
7. sede, área, tenant, dispositivo o proveedor fuera del alcance permitido;
8. owner de la operación distinto del que el control pretende usar;
9. operación, contrato o versión incompatibles;
10. versión observada obsoleta respecto del estado actual;
11. acción no admitida por el contrato de la operación;
12. operación terminal que la acción pretende reabrir;
13. deadline vencido para retry ordinario;
14. presupuesto agotado cuando se intenta `FORCE_RETRY` en lugar de recovery;
15. error no reintentable;
16. efecto externo o físico ambiguo sin conciliación;
17. cancelación efectiva que prohíbe nuevos efectos;
18. claim o lease todavía válidos cuando se intenta recuperar exclusión;
19. fencing obsoleto del ejecutor;
20. target incompatible con servicio, ambiente o scope;
21. credencial técnica presentada como única evidencia de business authority;
22. acceso a GitHub, Supabase, dashboard, logs o consola presentado como permiso empresarial;
23. identidad de proveedor intentando gobernar recursos internos fuera del mapping aprobado;
24. observer intentando mutar o iniciar acciones;
25. break-glass sin incidente, autoridad, scope, duración y auditoría aprobados;
26. corrección que cambia payload, recurso, versión o efecto pero intenta conservar la intención original;
27. intento de ejecutar dos veces un componente ya confirmado durante recovery;
28. intento de usar prioridad, reasignación o retry para eludir causalidad, versión o concurrencia.

La denegación no se corrige eligiendo un principal más amplio, cambiando de worker, regenerando una idempotency key o editando la evidencia original.

---

#### 26. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea especializa para el trabajo asíncrono obligaciones de autorización, identidad, contexto, alcance, mínimo privilegio, segregación entre credencial y permiso, default-deny, dispositivo compartido, trazabilidad y control extraordinario que ya están protegidas por el registro canónico vigente. No crea una capacidad empresarial nueva ni modifica una obligación de prueba existente; define cómo esas invariantes ya aprobadas se aplican a las acciones de control y a las 19 identidades inventariadas.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

---

#### 27. Cobertura de prueba existente preservada

Se preserva sin modificación, en especial:

- `TREQ-AUTH-001`, para resolver capacidades protegidas mediante permisos, contexto y alcance canónicos sin autorización por nombres de rol;
- `TREQ-AUTH-004`, para que todos los evaluadores produzcan la misma decisión y no ignoren scopes ni incorporen excepciones locales;
- `TREQ-AUTH-008`, para separar autorización base y operativa y exigir las condiciones contextuales correspondientes;
- `TREQ-AUTH-009`, para resolución territorial determinista y denegación de cruces fuera de scope;
- `TREQ-AUTH-011`, para impedir que un dispositivo compartido transfiera privilegios del administrador o amplíe permisos del actor;
- `TREQ-SHELL-010`, para separar cuenta, permiso, credencial, secreto, endpoint, dispositivo y sesión y conservar autoridad, alcance, vigencia, actor y evidencia;
- `TREQ-INTEGRATION-003`, para identidad estable, idempotencia, retry, claim, conciliación y recuperación segura del trabajo asíncrono;
- `TREQ-INTEGRATION-004`, para reconstruir principal técnico, causa, intento, resultado, error y efecto final de cadenas asíncronas;
- la cobertura vigente relacionada por `TSVC-CAT-005` para mínimo privilegio, credenciales técnicas y separación entre actor, servicio, worker, dispositivo, proveedor y scheduler.

Ninguna fila del registro canónico cambia de identificador, dominio, regla protegida, estado, responsable, evidencia, relación o secuencia por esta tarea.

---

#### 28. Handoff a implementación

`QUEUE-ARC-012` cierra documentalmente la familia `QUEUE-ARC-001..012`.

La planificación de implementación deberá recibir, como mínimo:

1. `TSVC-SVC-001.CONTRACT@1.0.0`;
2. los contratos `WORK-*` aprobados por `QUEUE-ARC-003..012`;
3. las 19 decisiones `QAI-*`;
4. la separación entre business authority y technical execution scope;
5. el catálogo de nueve acciones de control;
6. las referencias de permiso requeridas por operación y acción;
7. la regla de default-deny cuando falte mapping de permiso;
8. la distinción entre retry automático, `FORCE_RETRY` y recovery extraordinaria;
9. la prohibición de control por credencial, claim, dashboard o acceso administrativo técnico;
10. las brechas actuales de ANIMA, NEXO, GitHub Actions, schedules, `pg_net` y webhooks;
11. la exigencia de instrumentar auditoría, concurrencia y state machine sin alterar la semántica aprobada;
12. las decisiones pendientes de evidencia ya asignadas a `DELIV-PKG-001`.

La planificación debe decidir paquetes, repositorios, migraciones, contratos compartidos, código, pruebas, rollback, cutover y evidencia antes de cualquier implementación física. Esta tarea no selecciona esos archivos ni ejecuta cambios.

---

#### 29. Prohibiciones

Esta tarea no autoriza:

1. crear o modificar PermissionKeys, roles, matrices, grants o denegaciones canónicas;
2. crear tablas, columnas, constraints, índices, funciones, RPC, RLS, triggers, queues, leases o eventos físicos;
3. modificar Supabase, datos, Auth, Storage, Realtime, Edge Functions, cron, `pg_net`, secretos o configuración;
4. modificar GitHub Actions;
5. modificar ANIMA, NEXO, PASS ni otro repositorio consumidor;
6. activar `QAI-008`;
7. retirar `QAI-004`;
8. cambiar `document-alerts-daily` ni su material sensible;
9. convertir acceso a GitHub o Supabase en business authority;
10. utilizar `service_role` como permiso empresarial;
11. persistir el token del actor como credencial del worker;
12. conceder wildcard de acciones, recursos, ambientes, devices o providers;
13. permitir que un scheduler ejecute operaciones no declaradas;
14. permitir que un provider gobierne la cola interna;
15. permitir que un observer mutile estado o dispare control;
16. permitir que un worker se autorice a sí mismo;
17. permitir `FORCE_RETRY` sobre error no reintentable, resultado ambiguo, operación cancelada, terminal o fuera de deadline;
18. reiniciar presupuesto mediante control manual;
19. liberar dead-letter o quarantine sin recovery identificada;
20. romper un claim o fencing vigente por privilegio administrativo;
21. reabrir una operación terminal;
22. cambiar payload o recurso de la operación original mediante recovery;
23. repetir una impresión o efecto externo ambiguo a ciegas;
24. inferir autoridad desde prioridad, assignment, claim, status, métrica, alerta o health;
25. declarar que los activos actuales implementan este contrato por quedar documentados;
26. iniciar `DELIV-PKG-001`.

---

#### 30. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. conserva `QUEUE-ARC-011` como tarea anterior aprobada;
2. conserva `DELIV-PKG-001` como única tarea siguiente reservada;
3. establece `WORK-AUTHORIZATION-CONTRACT-001@1.0.0` sin crear otra fuente de verdad de permisos;
4. consume `AuthorizationDecision@1.0.0` y el modelo canónico de identidad/contexto/autorización;
5. separa business authorization, control authorization, technical execution scope y concurrency authority;
6. define que credencial técnica, claim, lease, fencing, operation ID y receipt no conceden permiso empresarial;
7. define exactamente nueve acciones semánticas de control;
8. declara explícitamente que esas acciones no son PermissionKeys;
9. define `required_permission_ref` por operación y acción;
10. aplica default-deny cuando falta una referencia de permiso manual;
11. impide que el cliente elija un permiso menos restrictivo;
12. define un sobre de solicitud/decisión de control con identidad, actor, recurso, versión, scope, motivo, decisión y executor técnico;
13. define cinco bases cerradas de autoridad, incluida propagación y `NO_APLICA`;
14. define creación iniciada por actor con decisión canónica y actor efectivo;
15. define creación programada por `APPROVED_SYSTEM_RULE` sin inventar un actor humano por ocurrencia;
16. define creación derivada de evento sin convertir proveedor, trigger o transport en owner;
17. define trabajo offline sin convertir device identity en permiso humano;
18. define que retry automático ordinario conserva la misma autoridad de intención sin crear otra autorización por intento;
19. define `FORCE_RETRY` como control manual subordinado a la política y no como bypass;
20. impide force retry tras agotamiento y deriva ese caso a recovery segura;
21. define cancelación como control protegido y separado de efectividad, rollback y compensación;
22. define autoridad para cambio de prioridad, disparo manual y reasignación forzada;
23. mapea las seis acciones de recovery aprobadas a requisitos de autoridad sin redefinirlas;
24. exige nueva autorización completa para `CREATE_CORRECTIVE_OPERATION`;
25. define recuperación de exclusión sin romper una autoridad concurrente todavía válida;
26. conserva break-glass como identidad excepcional, temporal, auditable y no empresarial;
27. define límites explícitos para ocho clases de identidad técnica;
28. conserva los 33 eventos de `QUEUE-ARC-010` sin crear un catálogo paralelo;
29. impide que una denegación de autorización cambie `operation_status` por sí sola;
30. define auditoría mínima de toda acción manual o extraordinaria;
31. materializa exactamente una decisión para cada `QAI-001..QAI-019`;
32. obtiene 16 `APLICA_AUTORIZACION_DE_CONTROL`, 2 `PROPAGA_NO_DECIDE_AUTORIZACION` y 1 `NO_APLICA`;
33. obtiene 9 `SCHEDULED_SYSTEM_AUTHORITY`, 4 `OFFLINE_OR_DEVICE_DELEGATED_AUTHORITY`, 3 `EVENT_DERIVED_AUTHORITY`, 2 `UPSTREAM_PROPAGATED` y 1 `NO_APLICA`;
34. mantiene 0 identidades faltantes y 0 duplicadas;
35. mantiene `QAI-010` y `QAI-013` como propagadores técnicos sin autoridad propia;
36. mantiene `QAI-016` como `NO_APLICA`;
37. mantiene `QAI-008` como `PENDIENTE_DE_EVIDENCIA` sin activarlo;
38. documenta que la ejecución manual de `QAI-009` no queda autorizada por acceso a GitHub;
39. documenta que el material sensible de `QAI-005` no constituye business authority;
40. documenta que SecureStore, device enrollment y worker loop de ANIMA no conceden permisos;
41. documenta que BrowserPrint y la printer identity no conceden permiso de reimpresión;
42. documenta que Wompi y RevenueCat autentican eventos pero no gobiernan operaciones internas;
43. conserva la brecha de replay de `QAI-019` bajo sus tareas propietarias previas y la planificación de implementación;
44. declara cero PermissionKeys nuevas;
45. declara cero cambios de requisitos de prueba con justificación concreta;
46. crea cero objetos físicos;
47. modifica cero repositorios, Supabase, cron, colas, workers, dispositivos, adaptadores, webhooks o workflows;
48. cierra documentalmente la familia `QUEUE-ARC-001..012`;
49. reserva exclusivamente `DELIV-PKG-001`;
50. no inicia ni desarrolla la tarea reservada.

---

#### 31. Resultado de la tarea

`QUEUE-ARC-012` deja cerrada la autoridad del trabajo asíncrono de Vento OS:

```text
INTENCIÓN NUEVA
→ PERMISO EMPRESARIAL O REGLA DE SISTEMA APROBADA
→ RECURSO + CONTEXTO + SCOPE
→ DECISIÓN CANÓNICA
→ RESERVA DE TRABAJO

MISMA INTENCIÓN + RETRY AUTOMÁTICO VÁLIDO
→ MISMA AUTORIDAD DE INTENCIÓN
→ NUEVO INTENTO SOLO DENTRO DE POLÍTICA

ACCIÓN MANUAL / EXTRAORDINARIA
→ ACCIÓN DE CONTROL IDENTIFICADA
→ PERMISO DE CONTROL RESUELTO
→ NUEVA DECISIÓN DE AUTORIZACIÓN
→ PRECONDICIONES DE ESTADO / SEGURIDAD / CONCURRENCIA
→ EJECUCIÓN TÉCNICA ACOTADA

CREDENCIAL TÉCNICA
≠ PERMISO

CLAIM / LEASE / FENCING
≠ PERMISO

PROVEEDOR / DISPOSITIVO / SCHEDULER
≠ OWNER EMPRESARIAL
```

Las 19 identidades inventariadas quedan reconciliadas una a una. La familia `QUEUE-ARC-001..012` queda documentalmente cerrada: identidad, idempotencia, tiempo, asignación, retry, cancelación, recovery, concurrencia, estados, métricas y autorización conservan fronteras separadas y consumibles por la planificación de implementación.

---

#### 32. Continuidad

ÚLTIMA TAREA APROBADA

`QUEUE-ARC-011 — Definir métricas de espera, ejecución y error`

TAREA ACTUAL APROBADA

`QUEUE-ARC-012 — Definir autorización para crear, cancelar y reintentar trabajos`

SIGUIENTE TAREA RESERVADA

`DELIV-PKG-001 — Crear identificador estable para cada paquete de implementación`


Estados mínimos:

```text
queued
scheduled
assigned
processing
succeeded
retry_pending
failed
cancelled
expired
```
