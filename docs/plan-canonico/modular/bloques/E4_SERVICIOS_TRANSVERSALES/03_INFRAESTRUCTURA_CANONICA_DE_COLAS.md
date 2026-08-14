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


### [ ] QUEUE-ARC-008 — Definir cola de fallos y recuperación manual
### [ ] QUEUE-ARC-009 — Definir bloqueo de duplicados y concurrencia
### [ ] QUEUE-ARC-010 — Definir estados y eventos canónicos
### [ ] QUEUE-ARC-011 — Definir métricas de espera, ejecución y error
### [ ] QUEUE-ARC-012 — Definir autorización para crear, cancelar y reintentar trabajos

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
