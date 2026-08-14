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
