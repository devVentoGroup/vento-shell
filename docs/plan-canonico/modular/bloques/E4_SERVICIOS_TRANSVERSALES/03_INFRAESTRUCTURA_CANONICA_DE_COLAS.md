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
**Línea base documental:** `vento-shell@9f502235ee3b32951f960f4c378641fa282d5da9`
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

| ID        | Clase                            | Identidad observada                                                                                | Propietaria / autoridad empresarial                                                     | Ejecutor o soporte técnico                                                                                      | Estado comprobado                                                                                                                                                | Riesgo o frontera actual                                                                                                                                                                                          | Destino documental                                                                                                                              |
| --------- | -------------------------------- | -------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `QAI-001` | `PG_CRON`                        | `anima_attendance_day_end_close_0005` — `5 0 * * *`                                                | `ANIMA` / asistencia                                                                    | `pg_cron` → `public.close_open_attendance_day_end()`                                                            | `DESPLEGADO_ACTIVO`; última ejecución observada `succeeded`; definición versionada en `vento-shell`                                                              | comparte propósito de cierre diario con `QAI-004`; la identidad lógica y precedencia deben quedar explícitas                                                                                                      | `QUEUE-ARC-002`; idempotencia en `QUEUE-ARC-003`; concurrencia en `QUEUE-ARC-005`                                                               |
| `QAI-002` | `PG_CRON_HTTP_WORKER`            | `anima_shift_runtime_processor_every_5m` — `*/5 * * * *`                                           | `ANIMA` / runtime de turnos                                                             | `pg_cron` → función SQL → `pg_net` → Edge Function `shift-runtime-processor`                                    | `DESPLEGADO_ACTIVO`; última ejecución observada `succeeded`; definición y endurecimiento de secreto versionados                                                  | es una cadena multi-etapa; el cron exitoso no demuestra por sí solo entrega y resultado final de cada notificación                                                                                                | contrato en `QUEUE-ARC-002`; retry en `QUEUE-ARC-004`; observabilidad en `QUEUE-ARC-008` a `QUEUE-ARC-010`                                      |
| `QAI-003` | `PG_CRON`                        | `attendance_stale_open_shift_autoclose_daily_bogota` — `10 5 * * *`                                | `ANIMA` / asistencia                                                                    | `pg_cron` → `public.close_stale_open_attendance_shifts()`                                                       | `DESPLEGADO_ACTIVO`; última ejecución observada `succeeded`; definición versionada                                                                               | cierre correctivo distinto del cierre diario ordinario; debe conservar causa y no competir con otros cierres                                                                                                      | `QUEUE-ARC-002`; `QUEUE-ARC-003`; `QUEUE-ARC-005`                                                                                               |
| `QAI-004` | `PG_CRON_LEGACY_OR_TRANSITIONAL` | `auto-close-attendance` — `59 4 * * *`                                                             | `ANIMA` / asistencia                                                                    | `pg_cron` → `public.close_open_attendance_day_end()`                                                            | `DESPLEGADO_ACTIVO`; última ejecución observada `succeeded`; inventariado por E3, sin schedule homónimo localizado entre las migraciones actuales inspeccionadas | segunda autoridad programada que invoca el mismo cierre base de `QAI-001`; requiere reconciliar identidad, necesidad y retiro sin doble efecto                                                                    | `QUEUE-ARC-002`; `QUEUE-ARC-003`; `QUEUE-ARC-005`; transición bajo `TSVC-CAT-010`                                                               |
| `QAI-005` | `PG_CRON_HTTP_AUTOMATION`        | `document-alerts-daily` — `0 14 * * *`                                                             | `ANIMA` / documentos y alertas                                                          | `pg_cron` → `pg_net` → Edge Function `document-alerts`                                                          | `DESPLEGADO_ACTIVO`; última ejecución observada `succeeded`; Edge Function versionada; job reconocido por el mapa E3                                             | el comando remoto contiene material de autorización y material de clave cron embebidos; sus valores no forman parte de este inventario                                                                            | identidad y contrato en `QUEUE-ARC-002`; autorización del trabajo en `QUEUE-ARC-012`; protección de secretos en `TI-AUTH-004`                   |
| `QAI-006` | `PG_CRON_MAINTENANCE`            | `pass_delivery_quotes_cleanup_hourly` — `17 * * * *`                                               | `PASS` / cotizaciones de entrega                                                        | `pg_cron` → `pass.cleanup_delivery_quotes()`                                                                    | `DESPLEGADO_ACTIVO`; última ejecución observada `succeeded`; definición versionada                                                                               | mantenimiento de vigencia; debe distinguir limpieza técnica de decisión empresarial de entrega                                                                                                                    | `QUEUE-ARC-002`; observabilidad en `QUEUE-ARC-008` a `QUEUE-ARC-010`                                                                            |
| `QAI-007` | `PG_CRON_RECONCILIATION`         | `pass_payment_checkout_expiry_reconciliation` — `*/5 * * * *`                                      | `PASS/PULSO` / checkout y pago                                                          | `pg_cron` → `public.reconcile_expired_payment_checkouts()`                                                      | `DESPLEGADO_ACTIVO`; última ejecución observada `succeeded`; definición versionada                                                                               | reconcilia expiraciones; debe preservar idempotencia y no confundir timeout con fallo definitivo                                                                                                                  | `QUEUE-ARC-002`; `QUEUE-ARC-003`; `QUEUE-ARC-004`; `QUEUE-ARC-010`                                                                              |
| `QAI-008` | `PG_CRON_DECLARED_NOT_DEPLOYED`  | `purge_inventory_form_drafts_daily` — `15 3 * * *`                                                 | `NEXO` / borradores de inventario                                                       | migración `vento-shell` → `public.purge_inventory_form_drafts()`                                                | `DECLARADO_EN_MIGRACION`; no aparece en `cron.job` del proyecto remoto observado                                                                                 | existe deriva entre definición versionada y estado desplegado; no se presume si fue retirado, omitido o falló su creación                                                                                         | reconciliación de identidad y estado en `QUEUE-ARC-002`; visibilidad en `QUEUE-ARC-008` a `QUEUE-ARC-010`                                       |
| `QAI-009` | `GITHUB_ACTIONS_CRON`            | `Process Account Deletions` — schedule fuente `0 3 * * *` y ejecución manual permitida             | `PASS/SHELL` / eliminación de cuenta                                                    | GitHub Actions `vento-pass` → Edge Function `process-account-deletions` en `vento-shell`                        | workflow `active`; última ejecución programada observada el `2026-08-13` con conclusión `success`                                                                | el schedule y el worker viven en repositorios distintos; requiere identidad transversal, autorización y conciliación por solicitud                                                                                | `QUEUE-ARC-002`; `QUEUE-ARC-008`; `QUEUE-ARC-012`                                                                                               |
| `QAI-010` | `MANAGED_HTTP_QUEUE`             | `net.http_request_queue`                                                                           | servicio técnico; no adquiere propiedad empresarial                                     | extensión Supabase `pg_net` `0.20.0`                                                                            | tabla de cola presente; **1** solicitud pendiente observada durante la auditoría                                                                                 | es cola técnica de transporte HTTP, no cola empresarial canónica ni evidencia de procesamiento final                                                                                                              | contrato en `QUEUE-ARC-002`; retry en `QUEUE-ARC-004`; DLQ/recuperación en `QUEUE-ARC-007`; observabilidad en `QUEUE-ARC-009` y `QUEUE-ARC-010` |
| `QAI-011` | `MOBILE_OFFLINE_QUEUE`           | cola ANIMA de operaciones de asistencia                                                            | `ANIMA` / asistencia                                                                    | `SecureStore` en `vento-anima`; entradas con `queued_attempt_id`, `idempotency_key`, intentos y siguiente retry | `IMPLEMENTADA_EN_CLIENTE`; persistencia local y deduplicación observadas                                                                                         | la durabilidad depende del dispositivo; no es una cola central ni debe convertirse en fuente del hecho                                                                                                            | contrato en `QUEUE-ARC-002`; idempotencia en `QUEUE-ARC-003`; retry en `QUEUE-ARC-004`; recuperación en `QUEUE-ARC-007`                         |
| `QAI-012` | `MOBILE_OFFLINE_QUEUE`           | cola ANIMA de operaciones de descanso                                                              | `ANIMA` / asistencia                                                                    | `SecureStore` en `vento-anima`; almacenamiento separado de la cola de asistencia                                | `IMPLEMENTADA_EN_CLIENTE`; persistencia local observada                                                                                                          | comparte worker con `QAI-011` pero conserva una identidad de cola separada; debe evitar orden o efectos cruzados                                                                                                  | `QUEUE-ARC-002`; `QUEUE-ARC-003`; orden en `QUEUE-ARC-006`; recuperación en `QUEUE-ARC-007`                                                     |
| `QAI-013` | `MOBILE_RETRY_WORKER`            | procesador recurrente de colas de asistencia y descansos cada `15000 ms` cuando existen pendientes | `ANIMA` / asistencia                                                                    | `setInterval` en `vento-anima` + `queue-sync.ts`                                                                | `IMPLEMENTADO_EN_CLIENTE`; se activa solo con pendientes                                                                                                         | worker efímero ligado al proceso de la app; reinicio o pérdida de contexto no puede asumirse como procesamiento concluido                                                                                         | `QUEUE-ARC-004`; worker registry en `QUEUE-ARC-008`; heartbeat/estado en `QUEUE-ARC-009`                                                        |
| `QAI-014` | `MOBILE_BACKGROUND_TASK`         | `vento.attendance.background-location.v1`                                                          | `ANIMA` / asistencia y geocerca                                                         | Expo `TaskManager` → validación de ubicación → RPC `register_departure_event`                                   | `IMPLEMENTADO_EN_CLIENTE`; ejecución dependiente del SO, permisos y ubicación                                                                                    | una señal de salida puede producir un cierre; requiere conservar causa, actor técnico, dispositivo, zona y resultado sin asumir disponibilidad continua                                                           | `QUEUE-ARC-002`; idempotencia en `QUEUE-ARC-003`; worker/heartbeat en `QUEUE-ARC-008` y `QUEUE-ARC-009`                                         |
| `QAI-015` | `BROWSER_LOCAL_QUEUE`            | `vento-nexo:printing:queue:v1`                                                                     | aplicación propietaria de la intención de impresión; NEXO en las superficies observadas | `localStorage` de navegador → BrowserPrint                                                                      | `IMPLEMENTADO_LOCALMENTE`; cola visible en la pantalla de trabajos de impresión                                                                                  | no existe cola servidor durable, claim central, retry transversal ni conciliación de resultado; BrowserPrint local no debe convertirse en autoridad empresarial                                                   | `QUEUE-ARC-002` a `QUEUE-ARC-010`; arquitectura específica de impresión en `PRINT-ARC-001` a `PRINT-ARC-020`                                    |
| `QAI-016` | `UI_RECURRING_REFRESH`           | auto-refresh del tablero de ubicaciones NEXO cada `20 s` cuando está habilitado                    | `NEXO` / proyección de inventario                                                       | temporizador de cliente → `refreshPath`                                                                         | `IMPLEMENTADO_EN_CLIENTE`; lectura/refresco, sin cola durable                                                                                                    | automatización de lectura, no trabajo empresarial durable; se inventaría para evitar migrarla indebidamente como job                                                                                              | `NO_APLICA` para materialización como cola; cualquier cambio de experiencia permanece en la tarea propietaria de NEXO                           |
| `QAI-017` | `DB_TRIGGER_HTTP_AUTOMATION`     | `trg_support_messages_notify_inserted` sobre `public.support_messages`                             | proceso propietario de soporte/mensaje; transporte técnico transversal                  | trigger → `public.notify_support_message_inserted` → `pg_net` → Edge Function `support-message-notify`          | `DESPLEGADO_ACTIVO`; único trigger no interno con `net.http_post` observado remotamente                                                                          | fallo de transporte no debe borrar el mensaje ni convertir notificación en fuente del hecho; requiere conciliación de entrega separada                                                                            | `QUEUE-ARC-002`; `QUEUE-ARC-003`; `QUEUE-ARC-004`; notificaciones en `NOTIFY-ARC-*`                                                             |
| `QAI-018` | `EXTERNAL_WEBHOOK_AUTOMATION`    | Edge Function `payments-webhook` para eventos Wompi                                                | `PULSO/PASS` para transacción; proveedor solo aporta evento                             | webhook externo → verificación de checksum → RPC de estado y registro de evento                                 | función desplegada y versionada; contrato actual detecta evento previamente procesado                                                                            | reintentos, orden tardío y estado desconocido deben permanecer reconciliables; el proveedor no es fuente de venta                                                                                                 | `QUEUE-ARC-002` a `QUEUE-ARC-007`; integración externa bajo `TREQ-INTEGRATION-003` y tareas propietarias                                        |
| `QAI-019` | `EXTERNAL_WEBHOOK_AUTOMATION`    | Edge Function `club-revenuecat-webhook`                                                            | `PASS/CLUB` / membresía y entitlement                                                   | webhook RevenueCat → verificación de secreto → escrituras de suscripción, entitlement y auditoría               | función desplegada y versionada                                                                                                                                  | el código observado no materializa una reclamación idempotente de evento equivalente a la existente en pagos; reintentos del proveedor requieren protección antes de confiar en el flujo como exactamente-una-vez | idempotencia en `QUEUE-ARC-003`; retry en `QUEUE-ARC-004`; concurrencia en `QUEUE-ARC-005`; integración propietaria de PASS                     |

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

La coexistencia no se interpreta automáticamente como defecto porque los momentos y condiciones no son idénticos. Sin embargo, `QAI-001` y `QAI-004` comparten la misma función base, por lo que `QUEUE-ARC-002` deberá definir identidad lógica, propósito y autoridad de scheduling; `QUEUE-ARC-003` deberá preservar idempotencia; y `QUEUE-ARC-005` deberá impedir ejecución concurrente incompatible.

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

| Hallazgo  | Descripción                                                                                                                            | Riesgo                                                                  | Propietaria exacta de resolución                                         |
| --------- | -------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| `QAI-H01` | ocho identidades de schedule aparecen en la unión código/remoto, pero solo cinco coinciden entre ambos estados                         | drift, retiro incompleto o schedule esperado ausente                    | `QUEUE-ARC-002`; visibilidad en `QUEUE-ARC-008` a `QUEUE-ARC-010`        |
| `QAI-H02` | `QAI-001` y `QAI-004` invocan la misma función base de cierre diario desde dos schedules distintos                                     | doble autoridad o ejecución redundante si no se define identidad lógica | `QUEUE-ARC-002`, `QUEUE-ARC-003`, `QUEUE-ARC-005`                        |
| `QAI-H03` | `document-alerts-daily` contiene material sensible de autorización dentro del comando remoto                                           | exposición de secreto y gobierno técnico heterogéneo                    | `QUEUE-ARC-012`; `TI-AUTH-004`                                           |
| `QAI-H04` | `purge_inventory_form_drafts_daily` está definido en migración pero no está activo en el proyecto remoto observado                     | falsa suposición de mantenimiento automático                            | `QUEUE-ARC-002`; `QUEUE-ARC-010`                                         |
| `QAI-H05` | ANIMA mantiene dos colas SecureStore con un worker móvil periódico                                                                     | trabajo pendiente dependiente del dispositivo y recuperación parcial    | `QUEUE-ARC-002` a `QUEUE-ARC-009` según contrato, retry y worker         |
| `QAI-H06` | NEXO conserva una cola de impresión solo en `localStorage` y entrega directa a BrowserPrint                                            | pérdida de trabajo, ausencia de claim y conciliación física             | `QUEUE-ARC-002` a `QUEUE-ARC-010`; detalle de impresión en `PRINT-ARC-*` |
| `QAI-H07` | `net.http_request_queue` existe como cola técnica administrada y tenía una solicitud pendiente durante la observación                  | confundir transporte HTTP con job empresarial y perder el estado final  | `QUEUE-ARC-002`, `QUEUE-ARC-004`, `QUEUE-ARC-007`, `QUEUE-ARC-010`       |
| `QAI-H08` | el webhook RevenueCat observado escribe efectos sin una reclamación de evento equivalente a la protección explícita observada en pagos | replay o duplicidad de efectos                                          | `QUEUE-ARC-003`, `QUEUE-ARC-004`, `QUEUE-ARC-005`                        |
| `QAI-H09` | la eliminación programada de cuentas usa GitHub Actions en `vento-pass` y un worker en `vento-shell`                                   | identidad y observabilidad distribuidas entre dos repositorios          | `QUEUE-ARC-002`, `QUEUE-ARC-008`, `QUEUE-ARC-012`                        |

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


### [ ] QUEUE-ARC-002 — Definir contrato canónico de trabajo asíncrono
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
