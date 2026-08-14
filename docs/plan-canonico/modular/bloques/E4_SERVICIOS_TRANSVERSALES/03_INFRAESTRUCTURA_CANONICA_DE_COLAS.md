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


### [ ] QUEUE-ARC-003 — Definir clave de idempotencia por trabajo
### [ ] QUEUE-ARC-004 — Definir prioridad, programación y vencimiento
### [ ] QUEUE-ARC-005 — Definir asignación a trabajador, dispositivo o adaptador
### [ ] QUEUE-ARC-006 — Definir reintentos, backoff y límite máximo
### [ ] QUEUE-ARC-007 — Definir cancelación antes y durante ejecución
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
