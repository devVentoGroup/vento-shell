### CATÁLOGO DE SERVICIOS TRANSVERSALES

### ✅ TSVC-CAT-001 — Inventariar servicios transversales actuales y faltantes

**Estado:** APROBADA
**Tarea anterior:** `SHELL-PKG-008 — Evitar actualizaciones automáticas sin pruebas`
**Tarea siguiente:** `TSVC-CAT-002 — Definir un owner por servicio`
**Tipo de tarea:** inventario documental canónico de servicios transversales
**Fase:** definición documental vinculante; implementación física no autorizada
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Fecha de corte:** 2026-08-02
**Cambios en código, migraciones, funciones, workers, colas, despliegues, datos o Supabase:** no autorizados ni realizados

---

#### 1. Resultado material

Materializar el inventario canónico, exhaustivo y trazable de los servicios técnicos transversales que existen, existen de forma parcial o fragmentada, o faltan en el ecosistema VENTO, con separación explícita entre:

- procesos empresariales;
- capacidades técnicas compartidas;
- activos técnicos actualmente localizados;
- servicios transversales canónicos completos;
- brechas que deben ser resueltas por las tareas posteriores del bloque `TSVC-CAT` y por las fases de implementación correspondientes.

El inventario sirve como universo estable para continuar la línea prioritaria `NEXO-REMISSIONS-001` sin tratar como servicio transversal completo una pantalla, una tabla, una función, un webhook, un registro de dispositivo o una integración local aislada.

---

#### 2. Alcance

La tarea abarca las capacidades técnicas reutilizables que pueden ser consumidas por varias aplicaciones, dominios, procesos o sedes de VENTO y que no deben quedar duplicadas dentro de una aplicación consumidora.

El universo materializado comprende diez identidades de servicio:

1. orquestación genérica de trabajos asíncronos;
2. entrega transaccional de eventos y outbox;
3. impresión centralizada;
4. notificaciones y alertas;
5. generación de documentos;
6. custodia de archivos y documentos originales;
7. evidencia transaccional;
8. integraciones externas y webhooks;
9. programación y automatizaciones recurrentes;
10. monitoreo y heartbeat de workers.

La verificación documental y técnica considera:

- el bloque canónico `E4_SERVICIOS_TRANSVERSALES`;
- la matriz de cobertura capacidad–implementación aprobada;
- la matriz actividad–sistema–responsable–evidencia aprobada;
- los activos actuales localizados en `vento-shell`, `vento-nexo` y `vento-anima`;
- los nombres canónicos previstos para colas, funciones de claim y workers;
- la diferencia entre existencia en código y evidencia operativa suficiente.

Quedan fuera del alcance de esta tarea:

- asignar el owner definitivo de cada servicio, responsabilidad de `TSVC-CAT-002`;
- definir entradas y salidas, responsabilidad de `TSVC-CAT-003`;
- definir contratos y eventos, responsabilidad de `TSVC-CAT-004`;
- determinar todos los sistemas interesados, responsabilidad de `TSVC-CAT-005`;
- seleccionar proveedores externos, responsabilidad de `TSVC-CAT-006`;
- cerrar límites de seguridad, responsabilidad de `TSVC-CAT-007`;
- definir idempotencia y reintentos, responsabilidad de `TSVC-CAT-008`;
- definir telemetría y auditoría, responsabilidad de `TSVC-CAT-009`;
- definir contingencias y fallback, responsabilidad de `TSVC-CAT-010`;
- crear tablas, funciones, workers, migraciones, despliegues o configuración física;
- declarar validación operativa, remota, productiva o de dispositivo sin evidencia verificable.

---

#### 3. Decisiones aprobadas

##### 3.1. Regla de clasificación del inventario

Cada identidad utiliza exactamente uno de los siguientes estados de inventario:

| Estado     | Definición canónica                                                                                                                                              |
| ---------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ACTUAL`   | Existe un servicio transversal compartido, persistente, consumible, gobernado y trazable que satisface el límite de capacidad inventariado.                      |
| `PARCIAL`  | Existen uno o más activos funcionales o de infraestructura, pero permanecen locales, fragmentados, incompletos o sin los mecanismos compartidos exigidos por E4. |
| `FALTANTE` | No se localizó una implementación transversal verificable que satisfaga el límite de capacidad inventariado.                                                     |

La presencia de código fuente no equivale por sí sola a estado `ACTUAL`. Para esa clasificación deben existir, como mínimo, una frontera compartida consumible, persistencia o mecanismo de entrega cuando aplique, trazabilidad, operación y evidencia suficiente.

##### 3.2. Inventario canónico de servicios transversales

| ID estable     | Servicio transversal                         | Límite de capacidad                                                                                                       | Activos actuales localizados                                                                                                                   | Estado     | Estado material | Evidencia                                                                                          | Brecha explícita                                                                                                                                                                               | Disposición                                                                                                                                                  |
| -------------- | -------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- | ---------- | --------------- | -------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `TSVC-SVC-001` | Orquestación genérica de trabajos asíncronos | Registrar, reclamar, ejecutar y cerrar trabajos desacoplados de cualquier dominio consumidor.                             | No se localizó una implementación transversal verificable con cola genérica, claim, intentos y worker compartido.                              | `FALTANTE` | `ESPECIFICADO`  | `NO_APLICA`: no existe implementación transversal que validar.                                     | Falta la base reutilizable que permita ejecutar trabajos persistentes sin que cada aplicación construya su propia cola local.                                                                  | Conservar como identidad obligatoria; completar definiciones en `TSVC-CAT-002..010` e implementar solamente en la fase física asignada.                      |
| `TSVC-SVC-002` | Entrega transaccional de eventos y outbox    | Persistir eventos empresariales y entregarlos a consumidores sin perder atomicidad con la transacción de origen.          | No se localizaron `outbox_events`, `claim_outbox_events` ni `process-outbox-events` como servicio canónico vigente.                            | `FALTANTE` | `ESPECIFICADO`  | `NO_APLICA`: no existe implementación transversal que validar.                                     | Falta el outbox compartido, su reclamación, entrega, seguimiento y operación.                                                                                                                  | Mantener separado de webhooks entrantes y de Realtime; completar su definición en las tareas posteriores del bloque.                                         |
| `TSVC-SVC-003` | Impresión centralizada                       | Recibir trabajos de impresión, seleccionar dispositivo o cola, entregar, reintentar y conservar prueba de resultado.      | NEXO dispone de cola local en navegador, impresión directa con BrowserPrint, API de layouts y persistencia de plantillas ZPL en `vento-shell`. | `PARCIAL`  | `IMPLEMENTADO`  | `PENDIENTE_DE_EVIDENCIA`: existe código, pero no se acreditó operación transversal completa.       | La cola depende de `localStorage` y de ejecución directa en la aplicación; no se localizó `print_jobs`, `claim_print_jobs`, `process-print-jobs`, heartbeat ni prueba centralizada de entrega. | Reutilizar plantillas y experiencia vigente donde sea compatible; sustituir la orquestación local por el servicio transversal cuando sea implementado.       |
| `TSVC-SVC-004` | Notificaciones y alertas                     | Transformar eventos o condiciones en notificaciones dirigidas, renderizadas, entregadas y auditadas por canal.            | Existe registro autenticado de tokens push de empleados mediante Edge Function y persistencia de metadatos de dispositivo.                     | `PARCIAL`  | `IMPLEMENTADO`  | `PENDIENTE_DE_EVIDENCIA`: se verificó el activo de registro, no una cadena completa de entrega.    | No se localizaron `notification_jobs`, `claim_notification_jobs`, `process-notification-jobs`, renderizado central, entrega por canales, historial ni reintentos compartidos.                  | Conservar el registro de tokens como activo consumidor; definir y construir por separado el servicio de notificación.                                        |
| `TSVC-SVC-005` | Generación de documentos                     | Producir documentos derivados de datos canónicos mediante trabajos persistentes, versionados y trazables.                 | No se localizó una implementación transversal verificable de `generated_document_jobs` ni un worker compartido de generación.                  | `FALTANTE` | `ESPECIFICADO`  | `NO_APLICA`: no existe implementación transversal que validar.                                     | Faltan la cola de generación, el contrato de plantilla, el control de versión, el resultado y su vinculación con custodia y evidencia.                                                         | Mantener como servicio distinto de la mera carga de archivos y completar su diseño sin crear documentos desde aplicaciones consumidoras.                     |
| `TSVC-SVC-006` | Custodia de archivos y documentos originales | Almacenar, identificar y recuperar originales aportados por personas o sistemas con metadatos y control de acceso.        | ANIMA dispone de carga al bucket `documents` y registro de metadatos en `app.documents`; existen flujos de carga por aplicación.               | `PARCIAL`  | `IMPLEMENTADO`  | `PENDIENTE_DE_EVIDENCIA`: existe flujo de carga, sin validación transversal ni operativa completa. | La custodia permanece orientada por aplicación; no se localizó `file_jobs`, `claim_file_jobs`, `process-file-jobs` ni un contrato compartido de archivo, original y ciclo de vida.             | Reutilizar los activos de Storage y metadatos solamente después de decidir su compatibilidad; consolidar la capacidad transversal en las tareas posteriores. |
| `TSVC-SVC-007` | Evidencia transaccional                      | Conservar comprobantes inmutables o controlados que demuestren una acción empresarial, técnica o de entrega.              | No se localizó un servicio transversal verificable que distinga y gobierne evidencia transaccional frente a archivos generales.                | `FALTANTE` | `ESPECIFICADO`  | `NO_APLICA`: no existe implementación transversal que validar.                                     | Faltan identidad, vinculación con entidad y evento, integridad, retención, acceso y trazabilidad compartida.                                                                                   | Mantener separada de documentos originales y documentos generados; completar su definición en `TSVC-CAT-002..010`.                                           |
| `TSVC-SVC-008` | Integraciones externas y webhooks            | Recibir o emitir comunicaciones con proveedores externos bajo una frontera reutilizable, auditable y aislada del dominio. | Existen Edge Functions específicas para webhooks de pagos y RevenueCat; el webhook de pagos declara carácter temporal o de fallback.           | `PARCIAL`  | `IMPLEMENTADO`  | `PENDIENTE_DE_EVIDENCIA`: existe código de integración, sin validación transversal completa.       | Las integraciones son específicas por proveedor y dominio; no se localizó una capacidad compartida de recepción, deduplicación, despacho, auditoría y salida mediante outbox.                  | Preservar adaptadores de dominio vigentes mientras se define la frontera transversal; no confundirlos con el servicio compartido completo.                   |
| `TSVC-SVC-009` | Programación y automatizaciones recurrentes  | Disparar trabajos recurrentes o programados con identidad, calendario, control de concurrencia y registro de resultado.   | No se localizó una implementación transversal verificable de programación y automatización recurrente.                                         | `FALTANTE` | `ESPECIFICADO`  | `NO_APLICA`: no existe implementación transversal que validar.                                     | Falta un mecanismo gobernado que programe trabajos sin acoplar cron, temporizadores o automatizaciones a cada aplicación.                                                                      | Conservar como identidad obligatoria y vincularla a la orquestación genérica antes de cualquier implementación física.                                       |
| `TSVC-SVC-010` | Monitoreo y heartbeat de workers             | Registrar disponibilidad, actividad, retraso, error y salud de los workers que procesan colas transversales.              | No se localizó un servicio transversal verificable de heartbeat y monitoreo de workers.                                                        | `FALTANTE` | `ESPECIFICADO`  | `NO_APLICA`: no existe implementación transversal que validar.                                     | Faltan registro de worker, heartbeat, detección de atraso, exposición de salud y evidencia de operación.                                                                                       | Mantener como capacidad transversal obligatoria; su telemetría detallada corresponde a `TSVC-CAT-009`.                                                       |

##### 3.3. Registro de activos técnicos actuales

Los siguientes activos son evidencia de implementaciones existentes o parciales. Su inclusión no los convierte en servicios transversales completos ni acredita su operación remota o productiva.

| Activo                                     | Repositorio y ubicación                                                    | Capacidad relacionada | Decisión de inventario                                                                                                                      |
| ------------------------------------------ | -------------------------------------------------------------------------- | --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| Cola de trabajos de impresión en navegador | `vento-nexo/src/app/printing/jobs/page.tsx`                                | `TSVC-SVC-003`        | Activo local reutilizable como referencia funcional; no es una cola persistente transversal porque depende de `localStorage` y del cliente. |
| API de layouts de impresión                | `vento-nexo/src/app/api/printing/layouts/route.ts`                         | `TSVC-SVC-003`        | Configuración de plantillas consumida por NEXO; no ejecuta ni gobierna trabajos transversales.                                              |
| Migración de plantillas de impresión NEXO  | `vento-shell/supabase/migrations/20260416150000_nexo_printing_layouts.sql` | `TSVC-SVC-003`        | Persistencia y funciones de plantillas que deben evaluarse para reutilización; no sustituyen `print_jobs` ni su worker.                     |
| Registro de tokens push de empleados       | `vento-shell/supabase/functions/register-push-token/index.ts`              | `TSVC-SVC-004`        | Activo de direccionamiento de dispositivo; no constituye renderizado, cola, entrega ni historial de notificación.                           |
| Carga documental de ANIMA                  | `vento-anima/src/components/documents/use-document-upload.ts`              | `TSVC-SVC-006`        | Flujo vigente de Storage y metadatos; debe evaluarse para integración con la custodia transversal.                                          |
| Webhook temporal o fallback de pagos       | `vento-shell/supabase/functions/payments-webhook/index.ts`                 | `TSVC-SVC-008`        | Adaptador de proveedor y dominio; conserva valor operativo, pero no define la frontera transversal completa.                                |
| Webhook de RevenueCat para Club            | `vento-shell/supabase/functions/club-revenuecat-webhook/index.ts`          | `TSVC-SVC-008`        | Adaptador específico de proveedor; debe permanecer separado del contrato empresarial procesado por el dominio.                              |

##### 3.4. Reconciliación cuantitativa

| Control                            | Resultado |
| ---------------------------------- | --------: |
| Identidades esperadas              |        10 |
| Identidades materializadas         |        10 |
| Identificadores únicos             |        10 |
| Identidades duplicadas             |         0 |
| Identidades faltantes              |         0 |
| Servicios `ACTUAL`                 |         0 |
| Servicios `PARCIAL`                |         4 |
| Servicios `FALTANTE`               |         6 |
| Activos técnicos actuales trazados |         7 |

La distribución aprobada es:

- `PARCIAL`: `TSVC-SVC-003`, `TSVC-SVC-004`, `TSVC-SVC-006` y `TSVC-SVC-008`;
- `FALTANTE`: `TSVC-SVC-001`, `TSVC-SVC-002`, `TSVC-SVC-005`, `TSVC-SVC-007`, `TSVC-SVC-009` y `TSVC-SVC-010`;
- `ACTUAL`: ninguna identidad cumple todavía de forma verificable la frontera transversal completa.

##### 3.5. Decisiones sobre duplicidad y propiedad

1. Un activo localizado dentro de una aplicación consumidora se registra como evidencia actual, pero no se considera propietario definitivo del servicio.
2. La impresión local de NEXO no se elimina ni se declara obsoleta en esta tarea; queda clasificada como implementación parcial que deberá migrarse o integrarse de forma controlada.
3. El registro de tokens push no se duplica dentro del futuro servicio de notificaciones; se conserva como activo de direccionamiento sujeto a la decisión de owner y contrato.
4. La carga de archivos de ANIMA no se generaliza por inferencia a todas las aplicaciones; se registra como implementación parcial y entrada para la consolidación.
5. Los webhooks de pagos y RevenueCat no se convierten en contratos empresariales compartidos; permanecen como adaptadores de proveedor y evidencia de integraciones existentes.
6. Realtime no se clasifica como cola transaccional ni sustituye outbox, trabajos persistentes o workers.
7. Las cuatro colas canónicas previstas por E4 permanecen faltantes hasta que exista implementación verificable de sus tablas, funciones de claim, workers y operación:
   - `outbox_events`;
   - `print_jobs`;
   - `notification_jobs`;
   - `file_jobs`.
8. Los workers canónicos previstos permanecen faltantes hasta su implementación y evidencia:
   - `process-outbox-events`;
   - `process-print-jobs`;
   - `process-notification-jobs`;
   - `process-file-jobs`.
9. Esta tarea no asigna owner, proveedor, contrato, seguridad, política de reintento, telemetría o contingencia; cada dimensión conserva su tarea propietaria posterior.
10. Toda modificación física de Supabase derivada de este inventario deberá crearse, versionarse, documentarse y ejecutarse desde `vento-shell` en la fase autorizada.

##### 3.6. Handoff obligatorio a las tareas posteriores

| Tarea reservada o posterior | Insumo que recibe de `TSVC-CAT-001`                                                               |
| --------------------------- | ------------------------------------------------------------------------------------------------- |
| `TSVC-CAT-002`              | Las diez identidades estables para asignar exactamente un owner por servicio.                     |
| `TSVC-CAT-003`              | Los diez límites de capacidad para definir entradas y salidas sin mezclar procesos empresariales. |
| `TSVC-CAT-004`              | Las brechas de frontera compartida para definir contratos y eventos.                              |
| `TSVC-CAT-005`              | El inventario de servicios y activos actuales para identificar sistemas interesados.              |
| `TSVC-CAT-006`              | Las capacidades que pueden requerir proveedores externos, sin prejuzgar su selección.             |
| `TSVC-CAT-007`              | Los activos y fronteras que requieren límites de seguridad.                                       |
| `TSVC-CAT-008`              | Las capacidades asíncronas, colas e integraciones que requieren idempotencia y reintentos.        |
| `TSVC-CAT-009`              | Los diez servicios y sus estados para definir telemetría, auditoría y heartbeat.                  |
| `TSVC-CAT-010`              | Las capacidades cuya degradación requiere contingencia o fallback.                                |

---

#### 4. Entregables obligatorios

1. Inventario canónico de diez servicios transversales con identificador estable, límite de capacidad, estado, evidencia, brecha y disposición.
2. Registro de siete activos técnicos actuales trazados a repositorio y ubicación concreta.
3. Clasificación reconciliada de cero servicios actuales completos, cuatro parciales y seis faltantes.
4. Declaración expresa de que los activos fragmentados no equivalen a servicios transversales completos.
5. Separación entre colas canónicas, workers, impresión local, registro de tokens, custodia documental y webhooks de proveedor.
6. Handoff explícito de las diez identidades a `TSVC-CAT-002..010` sin anticipar las decisiones propietarias de esas tareas.

---

#### 5. Requisitos de prueba

`TSVC-CAT-001` genera cero cambios en requisitos `TREQ-*`:

| Tipo de cambio                     | Cantidad |
| ---------------------------------- | -------: |
| Requisitos creados                 |        0 |
| Requisitos modificados             |        0 |
| Requisitos diferidos               |        0 |
| Requisitos descartados u obsoletos |        0 |

Justificación: la tarea materializa un inventario documental de capacidades y brechas. No introduce comportamiento ejecutable, criterio de operación, contrato consumible, migración, despliegue ni resultado que pueda declararse satisfecho mediante una prueba nueva. Los requisitos de prueba se crearán o modificarán solamente en la tarea propietaria que defina o implemente el comportamiento verificable correspondiente.

---

#### 6. Criterios de aceptación

1. El inventario contiene exactamente diez identidades y diez identificadores únicos.
2. No existe ninguna identidad sin límite de capacidad, estado, estado material, evidencia, brecha y disposición.
3. La suma de estados es exacta: `0 ACTUAL + 4 PARCIAL + 6 FALTANTE = 10`.
4. Los siete activos actuales están vinculados a una ubicación concreta y a una identidad del inventario.
5. Ningún activo de aplicación se presenta como servicio transversal completo sin persistencia, gobierno, trazabilidad y evidencia suficiente.
6. Las colas canónicas y sus workers se mantienen como faltantes cuando no existe implementación transversal verificable.
7. Impresión, notificaciones, generación documental, custodia de originales y evidencia transaccional permanecen como capacidades distintas.
8. Los webhooks específicos de proveedor se registran como adaptadores actuales y no como sustitutos de outbox o integraciones compartidas completas.
9. No se asigna owner antes de `TSVC-CAT-002` ni se anticipan contratos, seguridad, reintentos, telemetría o contingencia.
10. No se ejecuta implementación física, DDL, DML, backfill, despliegue ni modificación de Supabase durante esta tarea documental.
11. El resultado conserva la línea prioritaria `NEXO-REMISSIONS-001` y reserva exclusivamente `TSVC-CAT-002`.
12. Se declaran cero cambios `TREQ-*` con justificación concreta.

---

#### 7. Dependencias y entradas

##### 7.1. Fuentes canónicas

- `docs/plan-canonico/modular/01_PROTOCOLO.md`;
- `docs/plan-canonico/modular/delivery-contract.json`;
- `docs/plan-canonico/modular/active-sequence.json`;
- `docs/plan-canonico/modular/execution-route.json`;
- `docs/plan-canonico/modular/priority-route-progress.json`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/00_INTRO.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/01_PRINCIPIO_DE_PROPIEDAD.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/02_CATALOGO_DE_SERVICIOS_TRANSVERSALES.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/03_INFRAESTRUCTURA_CANONICA_DE_COLAS.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/05_NOTIFICACIONES_Y_ALERTAS.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/06_ARCHIVOS_DOCUMENTOS_Y_EVIDENCIA.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/07_SALIDA_OBLIGATORIA.md`;
- `CAP-COVER-012 — Elaborar matriz capacidad–implementación`;
- `BIZ-ACT-004 — Elaborar matriz actividad–sistema–responsable–evidencia`.

##### 7.2. Evidencia técnica actual

- `vento-nexo/src/app/printing/jobs/page.tsx`;
- `vento-nexo/src/app/api/printing/layouts/route.ts`;
- `vento-shell/supabase/migrations/20260416150000_nexo_printing_layouts.sql`;
- `vento-shell/supabase/functions/register-push-token/index.ts`;
- `vento-anima/src/components/documents/use-document-upload.ts`;
- `vento-shell/supabase/functions/payments-webhook/index.ts`;
- `vento-shell/supabase/functions/club-revenuecat-webhook/index.ts`.

##### 7.3. Restricción de evidencia

La existencia de los archivos anteriores acredita solamente que el activo fue localizado en el estado técnico inspeccionado. No acredita, por sí sola, despliegue vigente, adopción operativa, funcionamiento remoto, ejecución productiva ni suficiencia como servicio transversal.

---

#### 8. Continuidad canónica del bloque

```text
ÚLTIMA TAREA APROBADA
SHELL-PKG-008 — Evitar actualizaciones automáticas sin pruebas
        ↓
TAREA ACTUAL APROBADA
TSVC-CAT-001 — Inventariar servicios transversales actuales y faltantes
        ↓
SIGUIENTE TAREA RESERVADA
TSVC-CAT-002 — Definir un owner por servicio
```


### ✅ TSVC-CAT-002 — Definir propietario técnico y gobierno de cada servicio

**Estado:** APROBADA
**Tarea anterior:** `TSVC-CAT-001 — Inventariar servicios transversales actuales y faltantes`
**Tarea siguiente:** `TSVC-CAT-003 — Definir aplicaciones productoras y consumidoras`
**Tipo de tarea:** definición documental canónica de propiedad técnica y gobierno de servicios transversales
**Fase:** definición documental vinculante; implementación física no autorizada
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Fecha de corte:** 2026-08-02
**Cambios en código, migraciones, funciones, workers, colas, despliegues, datos o Supabase:** no autorizados ni realizados

---

#### 1. Resultado material

Asignar un propietario técnico institucional único y un modelo de gobierno explícito a cada una de las diez identidades `TSVC-SVC-001..010` aprobadas en `TSVC-CAT-001`, sin convertir al servicio transversal en propietario del proceso empresarial, del permiso, de la fuente de verdad ni de la decisión operativa que origina el trabajo.

El resultado establece para cada servicio:

- propietario técnico institucional;
- repositorio técnico canónico;
- autoridad empresarial sobre el resultado;
- autoridad sobre los datos o documentos procesados;
- custodia operativa;
- autoridad de cambio;
- regla de incidentes y escalamiento;
- límite explícito de responsabilidad.

La propiedad técnica se asigna a una responsabilidad institucional y no a una persona concreta. Un cambio de trabajador, proveedor, equipo o responsable nominal no modifica por sí mismo el propietario canónico del servicio.

---

#### 2. Alcance

La tarea abarca las diez identidades aprobadas:

1. `TSVC-SVC-001` — Orquestación genérica de trabajos asíncronos.
2. `TSVC-SVC-002` — Entrega transaccional de eventos y outbox.
3. `TSVC-SVC-003` — Impresión centralizada.
4. `TSVC-SVC-004` — Notificaciones y alertas.
5. `TSVC-SVC-005` — Generación de documentos.
6. `TSVC-SVC-006` — Custodia de archivos y documentos originales.
7. `TSVC-SVC-007` — Evidencia transaccional.
8. `TSVC-SVC-008` — Integraciones externas y webhooks.
9. `TSVC-SVC-009` — Programación y automatizaciones recurrentes.
10. `TSVC-SVC-010` — Monitoreo y heartbeat de workers.

La tarea define el gobierno de la capacidad transversal, pero no asigna todavía el inventario completo de aplicaciones productoras y consumidoras, responsabilidad de `TSVC-CAT-003`.

Quedan fuera del alcance:

- definir productores y consumidores concretos;
- definir payloads, eventos, schemas, contratos y compatibilidad;
- crear identidades de servicio, secretos o credenciales;
- definir idempotencia, reintentos o deduplicación;
- definir métricas, alertas, auditoría o SLO;
- definir contingencia o degradación;
- definir retención, archivado o limpieza;
- definir adopción progresiva o retiro legacy;
- crear código, paquetes, tablas, funciones, workers, cron, colas, migraciones o despliegues;
- reasignar la lógica empresarial o la fuente de verdad de una aplicación consumidora.

---

#### 3. Decisiones aprobadas

##### 3.1. Modelo canónico de propiedad

Se distinguen cinco responsabilidades que no podrán fusionarse por conveniencia técnica:

| Responsabilidad                        | Definición canónica                                                                                                                                  |
| -------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| `PROPIETARIO_TECNICO`                  | Responsabilidad institucional que mantiene la capacidad transversal, su arquitectura, implementación compartida, operación técnica y ciclo de vida.  |
| `APLICACION_PROPIETARIA_DEL_RESULTADO` | Aplicación que decide qué resultado empresarial debe producirse y bajo qué autorización. Se materializará por flujo en `TSVC-CAT-003`.               |
| `AUTORIDAD_DE_DATOS`                   | Dominio o aplicación que conserva autoridad sobre la fuente de verdad, el documento, el evento o el recurso procesado.                               |
| `CUSTODIO_OPERATIVO`                   | Responsabilidad que atiende la condición física u operativa local sin adquirir propiedad del servicio ni del proceso.                                |
| `CONSUMIDOR`                           | Aplicación o sistema que solicita o recibe el servicio mediante contrato; no puede duplicar su lógica compartida ni declararse owner por consumirlo. |

Regla base:

```text
APLICACION PROPIETARIA DEL RESULTADO
→ autoriza y define el efecto empresarial

SERVICIO TRANSVERSAL
→ ejecuta la capacidad técnica compartida

PROPIETARIO TECNICO
→ mantiene la capacidad, el contrato técnico y su operación
```

##### 3.2. Propietario institucional y repositorio canónico

Para las diez identidades se establece:

```text
PROPIETARIO TECNICO INSTITUCIONAL
Tecnología de Vento Group

REPOSITORIO TECNICO CANONICO
vento-shell
```

Esta decisión significa:

1. `vento-shell` es el repositorio responsable de la infraestructura compartida, las migraciones VENTO de Supabase, las Edge Functions compartidas, los paquetes comunes y la evidencia técnica transversal.
2. La aplicación `shell` no se convierte por esta decisión en propietaria funcional de los diez servicios.
3. `shell` continúa siendo la aplicación hub contextual; `vento-shell` continúa siendo el repositorio técnico.
4. Una aplicación productora podrá contener adaptadores o clientes locales, pero no una implementación paralela de la lógica transversal canónica.
5. Toda modificación de Supabase perteneciente a estos servicios deberá crearse, versionarse, documentarse y ejecutarse desde `vento-shell` durante la fase autorizada.
6. Los contratos compartidos se publicarán desde el mecanismo canónico de paquetes de `vento-shell` cuando BLOQUE H los materialice; hasta entonces, las decisiones documentales de E4 gobiernan la definición.

##### 3.3. Matriz canónica de propiedad y gobierno

| ID             | Servicio                                     | Propietario técnico institucional | Repositorio canónico | Autoridad empresarial                                                                                                      | Autoridad de datos o recurso                                           | Custodia operativa                                                                                     | Regla de gobierno                                                                                                                                                           |
| -------------- | -------------------------------------------- | --------------------------------- | -------------------- | -------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `TSVC-SVC-001` | Orquestación genérica de trabajos asíncronos | Tecnología de Vento Group         | `vento-shell`        | Aplicación propietaria del resultado solicitado por cada trabajo                                                           | Dominio que conserva la fuente de verdad afectada                      | Tecnología de Vento Group                                                                              | El servicio administra ejecución, estados y operación técnica; no decide si la acción empresarial está autorizada ni qué compensación corresponde.                          |
| `TSVC-SVC-002` | Entrega transaccional de eventos y outbox    | Tecnología de Vento Group         | `vento-shell`        | Aplicación o dominio que confirma la transacción empresarial originadora                                                   | Dominio emisor del evento canónico                                     | Tecnología de Vento Group                                                                              | El servicio garantiza transporte y seguimiento; el emisor conserva propiedad de la semántica, versión empresarial y momento de emisión.                                     |
| `TSVC-SVC-003` | Impresión centralizada                       | Tecnología de Vento Group         | `vento-shell`        | Aplicación propietaria del documento o comprobante                                                                         | Aplicación o dominio propietario de los datos impresos                 | Tecnología de Vento Group; responsable local del dispositivo para papel, energía y conectividad física | El servicio gobierna cola, routing, adaptadores y resultado técnico; no crea, aprueba ni altera el documento empresarial.                                                   |
| `TSVC-SVC-004` | Notificaciones y alertas                     | Tecnología de Vento Group         | `vento-shell`        | Aplicación propietaria del evento o condición que origina la comunicación                                                  | Dominio propietario del contenido y destinatarios autorizados          | Tecnología de Vento Group                                                                              | El servicio gobierna renderizado técnico, canal y entrega; no inventa destinatarios, prioridad empresarial ni contenido sensible.                                           |
| `TSVC-SVC-005` | Generación de documentos                     | Tecnología de Vento Group         | `vento-shell`        | Aplicación propietaria del tipo documental y del resultado empresarial                                                     | Dominio propietario de los datos y de la versión de plantilla aprobada | Tecnología de Vento Group                                                                              | El servicio ejecuta generación reproducible y entrega resultado; no define el significado legal, contable u operativo del documento.                                        |
| `TSVC-SVC-006` | Custodia de archivos y documentos originales | Tecnología de Vento Group         | `vento-shell`        | Aplicación propietaria del proceso que recibe o exige el original                                                          | Dominio propietario del expediente o recurso vinculado                 | Tecnología de Vento Group                                                                              | El servicio gobierna almacenamiento, integridad técnica y acceso; no cambia clasificación, vigencia, autenticidad empresarial ni autoridad del original.                    |
| `TSVC-SVC-007` | Evidencia transaccional                      | Tecnología de Vento Group         | `vento-shell`        | Aplicación propietaria de la acción que debe demostrarse                                                                   | Dominio propietario del recurso y del evento evidenciado               | Tecnología de Vento Group                                                                              | El servicio conserva evidencia y trazabilidad; no declara por sí mismo que la operación empresarial fue correcta, válida o autorizada.                                      |
| `TSVC-SVC-008` | Integraciones externas y webhooks            | Tecnología de Vento Group         | `vento-shell`        | Aplicación o dominio propietario del proceso integrado                                                                     | Dominio propietario del dato canónico y del mapping empresarial        | Tecnología de Vento Group                                                                              | El servicio gobierna frontera técnica, adaptadores, recepción y salida; el proveedor externo no adquiere propiedad del proceso ni acceso directo a la fuente interna.       |
| `TSVC-SVC-009` | Programación y automatizaciones recurrentes  | Tecnología de Vento Group         | `vento-shell`        | Aplicación propietaria de la acción programada                                                                             | Dominio propietario del recurso afectado                               | Tecnología de Vento Group                                                                              | El servicio gobierna calendario técnico y ejecución; no crea reglas empresariales ni activa acciones sin mandato, autorización y vigencia definidos por el owner funcional. |
| `TSVC-SVC-010` | Monitoreo y heartbeat de workers             | Tecnología de Vento Group         | `vento-shell`        | Propietario técnico de cada servicio observado; aplicación propietaria cuando el incidente afecta un resultado empresarial | Servicio o dominio que produce la señal observada                      | Tecnología de Vento Group                                                                              | El servicio gobierna salud técnica, detección y escalamiento; no modifica silenciosamente datos, repite efectos empresariales ni ejecuta compensaciones no autorizadas.     |

##### 3.4. Regla de aplicación propietaria por instancia

Ningún trabajo, evento, impresión, notificación, documento, archivo, evidencia, integración, automatización o señal operativa podrá quedar huérfano de autoridad empresarial.

Cada instancia futura deberá poder resolverse hacia exactamente una aplicación propietaria del resultado mediante el catálogo que materializará `TSVC-CAT-003`.

La aplicación propietaria:

- autoriza la operación empresarial;
- conserva la semántica del resultado;
- determina el recurso y el contexto;
- define la acción de cancelación, corrección o compensación empresarial;
- responde por la exactitud del contenido o dato aportado;
- no administra internamente la infraestructura compartida.

El propietario técnico:

- mantiene la disponibilidad técnica;
- controla despliegues, versiones técnicas y compatibilidad de infraestructura;
- administra credenciales técnicas, secretos y adaptadores cuando corresponda;
- mantiene runbooks, diagnóstico y recuperación técnica;
- coordina incidentes transversales;
- no concede permisos empresariales ni sustituye al owner del proceso.

##### 3.5. Autoridad de cambio

Se establecen tres clases de cambio:

| Clase                  | Ejemplos                                                                                       | Autoridad mínima requerida                                                                                                      |
| ---------------------- | ---------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `INTERNO_COMPATIBLE`   | refactor interno, optimización, observabilidad sin cambio contractual                          | Propietario técnico, con validación aplicable y evidencia.                                                                      |
| `EXTENSION_COMPATIBLE` | nuevo campo opcional, nuevo adaptador, nuevo canal o nuevo consumidor sin ruptura              | Propietario técnico más revisión de las aplicaciones y dominios afectados.                                                      |
| `RUPTURA_CONTRACTUAL`  | cambio incompatible de payload, semántica, estado, identidad, versión, persistencia o garantía | Nueva versión, propietario técnico, aplicaciones propietarias afectadas, plan de compatibilidad, migración, pruebas y rollback. |

Ningún consumidor podrá imponer unilateralmente una ruptura al servicio compartido.

Ningún propietario técnico podrá cambiar unilateralmente la semántica empresarial aportada por un dominio.

##### 3.6. Gobierno de incidentes y recuperación

1. El propietario técnico abre, clasifica y coordina incidentes de disponibilidad, latencia, cola, worker, credencial, adaptador, almacenamiento, routing o entrega técnica.
2. La aplicación propietaria determina la consecuencia empresarial, la prioridad operativa y si corresponde cancelar, reintentar, corregir, compensar o escalar.
3. Un reintento técnico no podrá repetir un efecto empresarial ya confirmado.
4. Una compensación será una acción empresarial nueva y autorizada, no una reparación implícita del servicio técnico.
5. En impresión, el responsable local del dispositivo atiende papel, energía, atasco, conexión y disponibilidad física; no puede alterar documentos, routing canónico o políticas de reimpresión.
6. En integraciones externas, el proveedor participa como tercero operativo; no obtiene autoridad para escribir directamente en fuentes internas ni decidir mappings canónicos.
7. Todo incidente que afecte varias aplicaciones se coordina desde el propietario técnico y conserva responsables de dominio separados por efecto.
8. La definición concreta de métricas, alertas, auditoría, contingencia y degradación permanece en `TSVC-CAT-007` y `TSVC-CAT-008`.

##### 3.7. Gobierno de repositorios y activos existentes

| Activo actual                                          | Gobierno aprobado                                                                                                                                         |
| ------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Cola local de impresión de NEXO                        | NEXO conserva el cliente y la experiencia local mientras exista; el propietario técnico del servicio transversal gobierna su futura integración o retiro. |
| Plantillas ZPL y funciones de layouts en `vento-shell` | Permanecen bajo `vento-shell`; la aplicación propietaria de cada documento conserva autoridad sobre contenido, versión funcional y datos requeridos.      |
| Registro de tokens push                                | Permanece como activo técnico de `vento-shell`; las aplicaciones productoras no administrarán directamente el registro compartido.                        |
| Carga documental de ANIMA                              | ANIMA conserva propiedad del proceso y del expediente laboral; la infraestructura de custodia transversal será gobernada desde `vento-shell`.             |
| Webhooks de pagos y RevenueCat                         | Permanecen como adaptadores específicos; `vento-shell` gobierna la frontera técnica y el dominio correspondiente conserva semántica y fuente de verdad.   |

La existencia previa de un activo en una aplicación consumidora no le otorga propiedad técnica permanente del servicio transversal.

##### 3.8. Registro mínimo de gobierno por servicio

Cada servicio deberá mantener, cuando sea materializado, un registro canónico que incluya como mínimo:

- identidad `TSVC-SVC-*`;
- propietario técnico institucional;
- repositorio técnico;
- aplicaciones propietarias, productoras y consumidoras;
- contrato y versión vigentes;
- dependencias técnicas;
- autoridad de datos;
- credenciales y secretos aplicables sin exponer valores;
- estados de ciclo de vida;
- runbook y responsable de escalamiento;
- cambios incompatibles y ventanas de transición;
- incidentes y decisiones de recuperación;
- fecha de revisión de propiedad;
- sustituto institucional durante ausencia del responsable nominal.

La ausencia de una persona específica no suspende la responsabilidad institucional.

##### 3.9. Reconciliación cuantitativa

| Control                                                  | Resultado |
| -------------------------------------------------------- | --------: |
| Identidades esperadas desde `TSVC-CAT-001`               |        10 |
| Identidades con propietario técnico asignado             |        10 |
| Identidades con repositorio canónico asignado            |        10 |
| Identidades con autoridad empresarial definida por regla |        10 |
| Identidades con autoridad de datos definida por regla    |        10 |
| Identidades con custodia operativa definida              |        10 |
| Identidades duplicadas                                   |         0 |
| Identidades faltantes                                    |         0 |
| Propietarios técnicos institucionales distintos          |         1 |
| Repositorios técnicos canónicos distintos                |         1 |

Distribución aprobada:

```text
10 servicios
→ propietario técnico institucional: Tecnología de Vento Group
→ repositorio técnico canónico: vento-shell
→ aplicación propietaria del resultado: obligatoria por instancia
→ mapping concreto de aplicaciones: TSVC-CAT-003
```

##### 3.10. Handoff obligatorio

| Tarea posterior | Insumo recibido de `TSVC-CAT-002`                                                                                                                                     |
| --------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `TSVC-CAT-003`  | Las diez identidades, su propietario técnico único y la obligación de asignar aplicaciones productoras, consumidoras y propietarias del resultado sin huérfanos.      |
| `TSVC-CAT-004`  | Las tres clases de cambio y la separación entre autoridad técnica y semántica empresarial para versionar contratos y compatibilidad.                                  |
| `TSVC-CAT-005`  | El propietario técnico responsable de identidades de servicio, credenciales y secretos, sin transferir propiedad a consumidores o proveedores.                        |
| `TSVC-CAT-006`  | La regla de que reintentos y deduplicación pertenecen al servicio técnico, mientras compensaciones y decisiones empresariales pertenecen a la aplicación propietaria. |
| `TSVC-CAT-007`  | El responsable institucional de observabilidad, métricas, alertas, auditoría y coordinación de incidentes.                                                            |
| `TSVC-CAT-008`  | La separación entre recuperación técnica y decisión empresarial durante contingencia o degradación.                                                                   |
| `TSVC-CAT-009`  | La autoridad que aprobará retención, archivado y limpieza junto con el dominio propietario de los datos.                                                              |
| `TSVC-CAT-010`  | La autoridad para adopción progresiva y retiro de activos legacy sin que un consumidor bloquee indefinidamente la convergencia.                                       |

---

#### 4. Entregables obligatorios

1. Modelo canónico de cinco responsabilidades diferenciadas.
2. Asignación explícita de propietario técnico institucional a las diez identidades.
3. Asignación explícita de repositorio técnico canónico a las diez identidades.
4. Matriz de autoridad empresarial, autoridad de datos, custodia operativa y regla de gobierno por servicio.
5. Reglas de cambio compatible, extensión compatible y ruptura contractual.
6. Gobierno de incidentes, recuperación y compensaciones.
7. Decisión sobre los activos parciales ya localizados en NEXO, ANIMA y `vento-shell`.
8. Registro mínimo de gobierno requerido para la implementación futura.
9. Reconciliación cuantitativa completa de las diez identidades.
10. Handoff explícito hacia `TSVC-CAT-003..010`.

---

#### 5. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea asigna responsabilidad institucional y reglas documentales de gobierno. No introduce todavía contrato ejecutable, payload, transición de estado, autorización, persistencia, integración física, cola, worker, migración, despliegue ni comportamiento operativo nuevo o modificado. Las invariantes técnicamente verificables deberán materializarse en las tareas propietarias de contratos, identidad, idempotencia, observabilidad, contingencia, retención o adopción, según `TSVC-CAT-003..010` y los paquetes de implementación correspondientes.

| Tipo de cambio                     | Cantidad |
| ---------------------------------- | -------: |
| Requisitos creados                 |        0 |
| Requisitos modificados             |        0 |
| Requisitos diferidos               |        0 |
| Requisitos descartados u obsoletos |        0 |

---

#### 6. Criterios de aceptación

1. La matriz canónica de propiedad contiene exactamente diez filas de servicio, una por cada identidad de `TSVC-CAT-001`.
2. Cada identidad tiene propietario técnico institucional, repositorio canónico, autoridad empresarial, autoridad de datos, custodia operativa y regla de gobierno.
3. La suma es exacta: diez identidades esperadas y diez decisiones materializadas.
4. El propietario técnico institucional es una responsabilidad estable y no una persona nominal.
5. `vento-shell` queda definido como repositorio técnico sin convertir a la aplicación `shell` en propietaria funcional de todos los servicios.
6. Toda modificación de Supabase derivada de los servicios queda reservada a migraciones y configuración versionadas desde `vento-shell` durante la fase autorizada.
7. La aplicación propietaria conserva autorización, semántica empresarial, recurso, contenido y decisión de compensación.
8. El servicio transversal conserva operación técnica, arquitectura, compatibilidad, despliegue y recuperación técnica.
9. Ningún consumidor, adaptador o proveedor externo adquiere propiedad por uso, ubicación actual del código o acceso técnico.
10. Los activos parciales actuales conservan un gobierno transitorio explícito y no se presentan como servicios transversales completos.
11. Las aplicaciones productoras y consumidoras concretas no se inventan y quedan reservadas a `TSVC-CAT-003`.
12. No se implementa código, DDL, DML, backfill, credencial, worker, cola, cron, despliegue ni cambio remoto.
13. Se declaran cero cambios `TREQ-*` con justificación concreta.
14. La continuidad reserva exclusivamente `TSVC-CAT-003`.

---

#### 7. Dependencias y entradas

##### 7.1. Fuentes canónicas

- `docs/plan-canonico/modular/01_PROTOCOLO.md`;
- `docs/plan-canonico/modular/delivery-contract.json`;
- `docs/plan-canonico/modular/execution-route.json`;
- `docs/plan-canonico/modular/priority-route-progress.json`;
- `docs/plan-canonico/modular/active-sequence.json`;
- `docs/plan-canonico/modular/continuity-route.json`;
- `docs/plan-canonico/modular/bloques/C_CATALOGO/01_APLICACIONES_Y_CONVENCION.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/00_INTRO.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/01_PRINCIPIO_DE_PROPIEDAD.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/02_CATALOGO_DE_SERVICIOS_TRANSVERSALES.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/03_INFRAESTRUCTURA_CANONICA_DE_COLAS.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/05_NOTIFICACIONES_Y_ALERTAS.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/06_ARCHIVOS_DOCUMENTOS_Y_EVIDENCIA.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/07_SALIDA_OBLIGATORIA.md`;
- `package.json` y scripts documentales aplicables.

##### 7.2. Dependencia aprobada inmediata

- `TSVC-CAT-001 — Inventariar servicios transversales actuales y faltantes`.

La dependencia aporta las diez identidades estables, su límite de capacidad, cuatro estados parciales, seis estados faltantes y siete activos técnicos trazados.

##### 7.3. Restricción de evidencia

La asignación de gobierno no acredita implementación, despliegue, operación productiva, disponibilidad, cumplimiento de SLO, respuesta a incidentes ni adopción por consumidores. Esas evidencias solo podrán declararse cuando existan artefactos físicos y validaciones reales en las fases correspondientes.

---

#### 8. Continuidad canónica del bloque

```text
ÚLTIMA TAREA APROBADA
TSVC-CAT-001 — Inventariar servicios transversales actuales y faltantes
        ↓
TAREA ACTUAL APROBADA
TSVC-CAT-002 — Definir propietario técnico y gobierno de cada servicio
        ↓
SIGUIENTE TAREA RESERVADA
TSVC-CAT-003 — Definir aplicaciones productoras y consumidoras
```


### ✅ TSVC-CAT-003 — Definir aplicaciones productoras y consumidoras

**Estado:** APROBADA
**Tarea anterior:** `TSVC-CAT-002 — Definir propietario técnico y gobierno de cada servicio`
**Tarea siguiente:** `TSVC-CAT-004 — Definir contrato, versión y compatibilidad`
**Tipo de tarea:** definición documental canónica y matriz materializada de aplicaciones productoras y consumidoras de servicios transversales
**Fase:** definición documental vinculante; implementación física no autorizada
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Fecha de corte:** 2026-08-02
**Cambios en código, migraciones, funciones, workers, colas, despliegues, datos o Supabase:** no autorizados ni realizados

---

#### 1. Resultado material

Materializar, para cada una de las diez identidades `TSVC-SVC-001..010`, las aplicaciones VENTO que pueden producir solicitudes, trabajos, eventos o señales hacia el servicio y las aplicaciones que pueden consumir sus resultados, estados, documentos, archivos, evidencias, notificaciones o alertas.

La matriz distingue entre:

- relación directa aprobada;
- relación condicional que exige activación verificable;
- ausencia de relación;
- ausencia deliberada de aplicación productora cuando la señal nace de infraestructura técnica.

La definición no convierte a una aplicación productora o consumidora en propietaria técnica del servicio. La propiedad técnica de las diez identidades continúa en Tecnología de Vento Group y en el repositorio `vento-shell`, según `TSVC-CAT-002`.

---

#### 2. Alcance y vocabulario contractual

##### 2.1. Aplicaciones canónicas admitidas

La matriz utiliza exclusivamente los diez códigos aprobados del catálogo de aplicaciones:

```text
shell
anima
viso
nexo
fogo
origo
pulso
numera
aura
pass
```

No son aplicaciones y no podrán ocupar las columnas de productora o consumidora:

- `vento-shell`;
- un paquete `@vento/*`;
- Supabase;
- una tabla, función, trigger, worker, cron, cola o Edge Function;
- un adaptador;
- una impresora o dispositivo;
- un proveedor externo;
- el valor de proceso `shared`;
- una sede, área, canal o repositorio.

##### 2.2. Definiciones

| Concepto                  | Definición canónica                                                                                                                                       |
| ------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `PRODUCTORA`              | Aplicación propietaria del resultado empresarial que crea una solicitud, trabajo, evento, documento, evidencia o mandato técnico válido para el servicio. |
| `CONSUMIDORA`             | Aplicación nombrada que recibe un resultado, estado, proyección, evidencia, documento, alerta o evento del servicio para una finalidad aprobada.          |
| `PRODUCTORA_CONDICIONAL`  | Aplicación que solo podrá producir cuando un proceso, paquete o contrato aprobado active expresamente la relación.                                        |
| `CONSUMIDORA_CONDICIONAL` | Aplicación que solo podrá consumir cuando exista finalidad, proyección, autorización y contrato expresos.                                                 |
| `NO_APLICA_PRODUCTORA`    | El servicio recibe señales técnicas de workers, adaptadores o infraestructura; ninguna aplicación se declara productora del heartbeat.                    |

Una aplicación productora no adquiere autoridad técnica sobre el servicio. Una consumidora no adquiere autoridad sobre la fuente de verdad ni puede conservar una copia mutable competidora.

##### 2.3. Leyenda de matrices

| Código  | Significado                              |
| ------- | ---------------------------------------- |
| `P`     | productora directa aprobada              |
| `C`     | consumidora directa aprobada             |
| `P/C`   | productora y consumidora directas        |
| `P?`    | productora condicional                   |
| `C?`    | consumidora condicional                  |
| `P?/C?` | productora y consumidora condicionales   |
| `—`     | relación no aprobada                     |
| `NA-P`  | ninguna aplicación actúa como productora |

Una marca condicional no habilita operación por sí sola.

---

#### 3. Decisiones aprobadas

##### 3.1. Regla de productora única por instancia

Cada instancia de servicio deberá resolver exactamente una aplicación productora cuando la capacidad requiera un mandato empresarial.

La productora se determina por la aplicación propietaria del resultado empresarial, no por:

- ubicación del código;
- repositorio que ejecuta el worker;
- tabla que persiste el trabajo;
- aplicación que muestra el resultado;
- dispositivo que lo materializa;
- proveedor que entrega el canal;
- aplicación que reintenta o consulta el estado.

No se admiten productoras múltiples para la misma instancia. Cuando varias aplicaciones intervienen, una conserva la propiedad del resultado y las demás se registran como consumidoras, colaboradoras o fuentes mediante contratos separados.

Excepción cerrada:

```text
TSVC-SVC-010
→ aplicación productora: NO_APLICA_PRODUCTORA
→ emisor técnico: worker, adaptador o infraestructura observada
→ aplicación contextual: owner del workload afectado
```

##### 3.2. Regla de consumidoras nombradas

Una instancia podrá tener cero o más consumidoras, siempre que cada una quede identificada por código canónico y tenga:

- finalidad aprobada;
- proyección mínima;
- autorización aplicable;
- versión contractual;
- correlación con el recurso o proceso;
- tratamiento de indisponibilidad;
- evidencia de entrega o consumo cuando corresponda.

Quedan prohibidos:

- comodines como `all`, `*`, `any_app` o equivalentes;
- consumo inferido por acceso a la misma base de datos;
- publicación indiscriminada a todas las aplicaciones;
- alta automática de consumidores por detectar un endpoint, token o suscripción;
- lectura directa de almacenamiento o tablas privadas del servicio;
- duplicación local de la lógica transversal.

##### 3.3. Matriz canónica por servicio y aplicación

| ID             | Servicio                                     | `shell` | `anima` | `viso`  | `nexo`  | `fogo`  | `origo` | `pulso` | `numera` | `aura`  | `pass`  |
| -------------- | -------------------------------------------- | ------- | ------- | ------- | ------- | ------- | ------- | ------- | -------- | ------- | ------- |
| `TSVC-SVC-001` | Orquestación genérica de trabajos asíncronos | `C?`    | `P/C`   | `P/C`   | `P/C`   | `P/C`   | `P/C`   | `P/C`   | `P/C`    | `P?/C?` | `P/C`   |
| `TSVC-SVC-002` | Entrega transaccional de eventos y outbox    | `C?`    | `P/C`   | `P/C`   | `P/C`   | `P/C`   | `P/C`   | `P/C`   | `P/C`    | `P?/C?` | `P/C`   |
| `TSVC-SVC-003` | Impresión centralizada                       | `—`     | `P?/C?` | `P/C`   | `P/C`   | `P/C`   | `P/C`   | `P/C`   | `P/C`    | `P?/C?` | `P?/C?` |
| `TSVC-SVC-004` | Notificaciones y alertas                     | `C?`    | `P/C`   | `P/C`   | `P/C`   | `P/C`   | `P/C`   | `P/C`   | `P/C`    | `P?/C?` | `P/C`   |
| `TSVC-SVC-005` | Generación de documentos                     | `C?`    | `P/C`   | `P/C`   | `P/C`   | `P/C`   | `P/C`   | `P/C`   | `P/C`    | `P?/C?` | `P/C`   |
| `TSVC-SVC-006` | Custodia de archivos y documentos originales | `C?`    | `P/C`   | `P/C`   | `P/C`   | `P/C`   | `P/C`   | `P?/C?` | `P/C`    | `P?/C?` | `P/C`   |
| `TSVC-SVC-007` | Evidencia transaccional                      | `C?`    | `P/C`   | `P/C`   | `P/C`   | `P/C`   | `P/C`   | `P/C`   | `P/C`    | `P?/C?` | `P/C`   |
| `TSVC-SVC-008` | Integraciones externas y webhooks            | `C?`    | `P?/C?` | `P?/C?` | `P?/C?` | `P?/C?` | `P/C`   | `P/C`   | `P/C`    | `P?/C?` | `P/C`   |
| `TSVC-SVC-009` | Programación y automatizaciones recurrentes  | `C?`    | `P/C`   | `P/C`   | `P/C`   | `P/C`   | `P/C`   | `P/C`   | `P/C`    | `P?/C?` | `P/C`   |
| `TSVC-SVC-010` | Monitoreo y heartbeat de workers             | `C?`    | `C?`    | `C?`    | `C?`    | `C?`    | `C?`    | `C?`    | `C?`     | `C?`    | `C?`    |

La tabla define relaciones objetivo permitidas. No afirma que cada combinación esté implementada, desplegada o activa.

##### 3.4. Productoras y consumidoras materializadas por servicio

| ID             | Productoras directas                                                | Productoras condicionales               | Consumidoras directas                                               | Consumidoras condicionales                                                           | Exclusión explícita                                                                                 |
| -------------- | ------------------------------------------------------------------- | --------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------- |
| `TSVC-SVC-001` | `anima`, `viso`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `pass` | `aura`                                  | `anima`, `viso`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `pass` | `shell`, `aura`                                                                      | `shell` no produce trabajos empresariales por actuar como hub.                                      |
| `TSVC-SVC-002` | `anima`, `viso`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `pass` | `aura`                                  | `anima`, `viso`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `pass` | `shell`, `aura`                                                                      | Un proveedor, adaptador o worker no reemplaza la aplicación emisora.                                |
| `TSVC-SVC-003` | `viso`, `nexo`, `fogo`, `origo`, `pulso`, `numera`                  | `anima`, `aura`, `pass`                 | `viso`, `nexo`, `fogo`, `origo`, `pulso`, `numera`                  | `anima`, `aura`, `pass`                                                              | `shell` no genera ni recibe documentos imprimibles por defecto.                                     |
| `TSVC-SVC-004` | `anima`, `viso`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `pass` | `aura`                                  | `anima`, `viso`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `pass` | `shell`, `aura`                                                                      | El canal técnico no decide destinatarios ni prioridad empresarial.                                  |
| `TSVC-SVC-005` | `anima`, `viso`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `pass` | `aura`                                  | `anima`, `viso`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `pass` | `shell`, `aura`                                                                      | `shell` solo podrá consumir estado o metadata expresamente autorizados.                             |
| `TSVC-SVC-006` | `anima`, `viso`, `nexo`, `fogo`, `origo`, `numera`, `pass`          | `pulso`, `aura`                         | `anima`, `viso`, `nexo`, `fogo`, `origo`, `numera`, `pass`          | `shell`, `pulso`, `aura`                                                             | El bucket o Storage no es productor, consumidor ni owner empresarial.                               |
| `TSVC-SVC-007` | `anima`, `viso`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `pass` | `aura`                                  | `anima`, `viso`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `pass` | `shell`, `aura`                                                                      | La evidencia no autoriza ni corrige por sí misma la operación.                                      |
| `TSVC-SVC-008` | `origo`, `pulso`, `numera`, `pass`                                  | `anima`, `viso`, `nexo`, `fogo`, `aura` | `origo`, `pulso`, `numera`, `pass`                                  | `shell`, `anima`, `viso`, `nexo`, `fogo`, `aura`                                     | El proveedor externo no es aplicación productora ni consumidora.                                    |
| `TSVC-SVC-009` | `anima`, `viso`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `pass` | `aura`                                  | `anima`, `viso`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `pass` | `shell`, `aura`                                                                      | El cron o scheduler no adquiere propiedad del mandato empresarial.                                  |
| `TSVC-SVC-010` | Ninguna                                                             | Ninguna                                 | Ninguna por defecto                                                 | `shell`, `anima`, `viso`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `aura`, `pass` | La señal la produce infraestructura técnica; toda visualización o alerta exige relación contextual. |

##### 3.5. Condición única de activación

Toda relación marcada con `?` permanece inactiva hasta que exista una decisión aprobada que cumpla conjuntamente:

1. proceso `VPROC-*` o paquete exacto;
2. aplicación propietaria del resultado;
3. capacidad transversal requerida;
4. aplicación productora o consumidora nombrada;
5. finalidad y datos mínimos;
6. evento, comando, documento o señal contractual;
7. autorización y territorio aplicables;
8. versión compatible;
9. evidencia de implementación y validación;
10. tratamiento de error, indisponibilidad y retiro.

La ausencia de cualquiera de estos elementos mantiene la relación en estado condicional. El silencio no equivale a activación ni a `NO_APLICA`.

##### 3.6. Tratamiento de `shell`

La aplicación `shell`:

- no se convierte en productora general por compartir repositorio con la infraestructura;
- no es owner de procesos de las demás aplicaciones;
- podrá consumir estados globales de degradación, navegación, disponibilidad o trabajo pendiente únicamente cuando el contrato lo declare;
- no recibirá payloads empresariales completos cuando baste una proyección mínima;
- no podrá utilizar su función de hub para suscribirse indiscriminadamente a eventos, documentos, archivos o evidencias.

Separación obligatoria:

```text
shell
→ aplicación y hub contextual

vento-shell
→ repositorio técnico transversal
```

##### 3.7. Tratamiento de `aura`

`aura` conserva su código canónico, pero su roadmap permanece diferido.

Por tanto:

- todas sus relaciones se clasifican como condicionales;
- ninguna relación habilita pantalla, proceso, endpoint, worker, suscripción o despliegue;
- la activación exige paquete aprobado, cobertura funcional, autorización, contrato, readiness y pruebas;
- una relación de diseño no demuestra capacidad operativa.

##### 3.8. Relación con propiedad de procesos

Cuando un proceso empresarial usa un servicio transversal:

```text
APLICACION PROPIETARIA DEL VPROC
→ productora de la instancia de servicio

APLICACIONES CONSUMIDORAS DECLARADAS DEL VPROC
→ candidatas a consumidoras del resultado técnico

SERVICIO TRANSVERSAL
→ ejecutor técnico sin propiedad empresarial
```

La lista de consumidoras del proceso no se copia automáticamente al servicio. Cada consumidora del servicio deberá necesitar el resultado técnico concreto y cumplir minimización, autorización y finalidad.

El valor `shared` usado en el catálogo de procesos no es una aplicación. Para una instancia asociada a un proceso compartido deberá identificarse la aplicación que posee el resultado concreto antes de crear el trabajo.

##### 3.9. Decisión específica para el carril `NEXO-REMISSIONS-001`

La etapa prioritaria de remisiones NEXO deberá evaluar las diez identidades así:

| ID             | Clasificación para remisiones NEXO | Productora             | Consumidoras previstas                                                 | Condición o evidencia requerida                                                 |
| -------------- | ---------------------------------- | ---------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| `TSVC-SVC-001` | `OBLIGATORIA`                      | `nexo`                 | `nexo`; otras solo por contrato                                        | trabajos diferidos persistentes y correlacionados con la remisión               |
| `TSVC-SVC-002` | `OBLIGATORIA`                      | `nexo`                 | aplicaciones nombradas por los eventos de remisión                     | evento confirmado después del commit y entrega trazable                         |
| `TSVC-SVC-003` | `CONDICIONAL`                      | `nexo`                 | `nexo`                                                                 | se activa únicamente si el paquete imprime remisiones, comprobantes o etiquetas |
| `TSVC-SVC-004` | `OBLIGATORIA`                      | `nexo`                 | destinatarias nombradas; `shell` o `viso` solo si el contrato lo exige | alerta o notificación derivada de evento y responsabilidad aprobados            |
| `TSVC-SVC-005` | `OBLIGATORIA`                      | `nexo`                 | `nexo`; consumidoras expresas                                          | documento de remisión versionado y reproducible                                 |
| `TSVC-SVC-006` | `OBLIGATORIA`                      | `nexo`                 | `nexo`; consumidoras expresas                                          | original, comprobante o soporte vinculado a la remisión                         |
| `TSVC-SVC-007` | `OBLIGATORIA`                      | `nexo`                 | `nexo`; consumidoras expresas                                          | evidencia correlacionada por transición y actor                                 |
| `TSVC-SVC-008` | `CONDICIONAL`                      | `nexo`                 | contraparte interna nombrada; proveedor no se registra como aplicación | se activa si el paquete cruza una frontera externa o recibe webhook             |
| `TSVC-SVC-009` | `CONDICIONAL`                      | `nexo`                 | `nexo`                                                                 | se activa si existe conciliación, expiración o recuperación recurrente aprobada |
| `TSVC-SVC-010` | `OBLIGATORIA`                      | `NO_APLICA_PRODUCTORA` | `nexo`; `shell` o `viso` solo por proyección aprobada                  | heartbeat y estado técnico de workers que soportan el paquete                   |

Reconciliación del carril:

| Clasificación  | Cantidad |
| -------------- | -------: |
| Obligatorias   |        7 |
| Condicionales  |        3 |
| No aplicables  |        0 |
| Total evaluado |       10 |

##### 3.10. Estados de relación y evidencia

Cada relación futura deberá mantener uno de estos estados:

| Estado         | Significado                                                                       |
| -------------- | --------------------------------------------------------------------------------- |
| `ESPECIFICADA` | relación aprobada documentalmente, sin afirmar implementación                     |
| `IMPLEMENTADA` | productor o consumidor físico disponible bajo contrato versionado                 |
| `VALIDADA`     | comportamiento ejecutado con evidencia reproducible                               |
| `BLOQUEADA`    | falta un insumo obligatorio y se identifica su tarea propietaria                  |
| `NO_APLICA`    | exclusión explícita con fundamento y evidencia                                    |
| `RETIRADA`     | relación desactivada con compatibilidad, drenaje y evidencia de ausencia residual |

La matriz de esta tarea deja las relaciones directas y condicionales en estado `ESPECIFICADA`. No declara ninguna relación `IMPLEMENTADA` o `VALIDADA`.

##### 3.11. Reconciliación cuantitativa

| Control                                                   | Resultado |
| --------------------------------------------------------- | --------: |
| Servicios esperados desde `TSVC-CAT-002`                  |        10 |
| Servicios materializados                                  |        10 |
| Aplicaciones canónicas evaluadas por servicio             |        10 |
| Celdas evaluadas en la matriz                             |       100 |
| Servicios con productoras directas o condicionales        |         9 |
| Servicios con `NO_APLICA_PRODUCTORA`                      |         1 |
| Servicios con consumidoras directas o condicionales       |        10 |
| Identidades de servicio faltantes                         |         0 |
| Identidades de servicio duplicadas en la matriz principal |         0 |
| Códigos de aplicación fuera del catálogo                  |         0 |
| Comodines de productor o consumidor                       |         0 |

##### 3.12. Handoff obligatorio

| Tarea posterior | Insumo recibido de `TSVC-CAT-003`                                                                                                    |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| `TSVC-CAT-004`  | Matriz de productoras, consumidoras y condiciones que deberá expresarse mediante contratos versionados y compatibilidad verificable. |
| `TSVC-CAT-005`  | Aplicaciones que podrán obtener identidad técnica o invocar el servicio sin compartir secretos ni credenciales privilegiadas.        |
| `TSVC-CAT-006`  | Productora única, consumidoras nombradas y correlación necesarias para idempotencia, reintentos y deduplicación.                     |
| `TSVC-CAT-007`  | Aplicaciones y relaciones que deberán emitir métricas, alertas y evidencia de consumo sin exponer payloads excesivos.                |
| `TSVC-CAT-008`  | Productora y consumidoras que deberán participar en degradación, fallback, recuperación y conciliación.                              |
| `TSVC-CAT-009`  | Autoridad de datos y aplicaciones afectadas por retención, archivado y limpieza.                                                     |
| `TSVC-CAT-010`  | Relaciones actuales, condicionales y retirables que deberán migrarse sin consumidores residuales.                                    |

##### 3.13. Requisitos canónicos vigentes consumidos

La tarea no crea reglas de prueba nuevas. Sus invariantes ya están protegidas por:

- `TREQ-PROC-018` y `TREQ-PROC-019`, para propiedad empresarial única y autoridad de la aplicación propietaria;
- `TREQ-PROC-023` a `TREQ-PROC-027`, para listas válidas de consumidoras, finalidad, proyección mínima, evolución y retiro;
- `TREQ-INTEGRATION-003`, para idempotencia, correlación, estado durable y resultado recuperable;
- `TREQ-INTEGRATION-004`, para trazabilidad de causa, intento, entrega, error y efecto final.

La matriz materializada se convierte en insumo de esos requisitos sin cambiar sus identificadores, estados, responsables ni relaciones.

---

#### 4. Entregables obligatorios

1. Vocabulario contractual de productora, consumidora y relación condicional.
2. Matriz explícita de diez servicios por diez aplicaciones.
3. Listas materializadas de productoras y consumidoras por servicio.
4. Regla de una productora única por instancia.
5. Prohibición de consumidores implícitos, comodines y copias mutables competidoras.
6. Condición cerrada de activación para todas las relaciones condicionales.
7. Tratamiento separado de `shell`, `vento-shell`, `aura` y procesos `shared`.
8. Clasificación completa de los diez servicios para `NEXO-REMISSIONS-001`.
9. Estados futuros de especificación, implementación, validación, bloqueo, exclusión y retiro.
10. Reconciliación de cien celdas y handoff hacia `TSVC-CAT-004..010`.

---

#### 5. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa relaciones documentales de producción y consumo sin crear todavía contratos ejecutables, payloads, permisos, persistencia, suscripciones, colas, workers, adaptadores ni despliegues. Las invariantes aplicables ya están protegidas por los requisitos canónicos vigentes enumerados en la sección 3.13. Esta tarea no modifica sus reglas, identificadores, estados ni relaciones; materializa el catálogo que deberán consumir.

| Tipo de cambio                     | Cantidad |
| ---------------------------------- | -------: |
| Requisitos creados                 |        0 |
| Requisitos modificados             |        0 |
| Requisitos diferidos               |        0 |
| Requisitos descartados u obsoletos |        0 |

---

#### 6. Criterios de aceptación

1. La matriz principal contiene exactamente diez servicios y diez aplicaciones, para cien decisiones explícitas.
2. Las diez identidades `TSVC-SVC-001..010` se conservan sin renombrar, omitir ni duplicar.
3. Solo se utilizan códigos del catálogo canónico de aplicaciones.
4. Cada servicio salvo `TSVC-SVC-010` tiene al menos una productora directa o condicional.
5. `TSVC-SVC-010` declara expresamente `NO_APLICA_PRODUCTORA` y no atribuye el heartbeat a una aplicación.
6. Cada servicio tiene consumidoras directas, condicionales o ambas.
7. No existen comodines, consumidores implícitos ni referencias a repositorios, proveedores, infraestructura o `shared` como aplicaciones.
8. La relación condicional exige proceso o paquete, owner, finalidad, contrato, autorización, versión y evidencia.
9. `shell` no se convierte en productora general por compartir repositorio con la infraestructura transversal.
10. `aura` permanece condicional y no se presenta como desplegada ni operativa.
11. Las relaciones directas y condicionales quedan en estado `ESPECIFICADA`, no `IMPLEMENTADA` ni `VALIDADA`.
12. El carril NEXO clasifica las diez identidades: siete obligatorias y tres condicionales.
13. La tarea no implementa código, contratos físicos, DDL, DML, migraciones, workers, colas, cron, credenciales, despliegues ni cambios remotos.
14. Se declaran cero cambios `TREQ-*` porque las invariantes ya están cubiertas por requisitos canónicos vigentes.
15. La continuidad reserva exclusivamente `TSVC-CAT-004`.

---

#### 7. Dependencias y entradas

##### 7.1. Fuentes canónicas

- `docs/plan-canonico/modular/01_PROTOCOLO.md`;
- `docs/plan-canonico/modular/delivery-contract.json`;
- `docs/plan-canonico/modular/execution-route.json`;
- `docs/plan-canonico/modular/priority-route-progress.json`;
- `docs/plan-canonico/modular/active-sequence.json`;
- `docs/plan-canonico/modular/continuity-route.json`;
- `docs/plan-canonico/modular/priority-delivery-lanes.json`;
- `docs/plan-canonico/modular/bloques/C_CATALOGO/01_APLICACIONES_Y_CONVENCION.md`;
- `docs/plan-canonico/modular/bloques/E2_PROCESOS_Y_EXPERIENCIA/01_02_PROPOSITO_PROPIEDAD_CONSUMIDORES_Y_ACTORES.md`;
- `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/01_EVENTOS_ENTRE_APLICACIONES.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/00_INTRO.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/01_PRINCIPIO_DE_PROPIEDAD.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/02_CATALOGO_DE_SERVICIOS_TRANSVERSALES.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/03_INFRAESTRUCTURA_CANONICA_DE_COLAS.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/05_NOTIFICACIONES_Y_ALERTAS.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/06_ARCHIVOS_DOCUMENTOS_Y_EVIDENCIA.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/07_SALIDA_OBLIGATORIA.md`;
- `docs/plan-canonico/modular/bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`;
- `package.json` y scripts documentales aplicables.

##### 7.2. Dependencias aprobadas inmediatas

- `TSVC-CAT-001 — Inventariar servicios transversales actuales y faltantes`.
- `TSVC-CAT-002 — Definir propietario técnico y gobierno de cada servicio`.

Las dependencias aportan las diez identidades, el estado de cobertura, el propietario técnico institucional, el repositorio canónico y la separación entre autoridad técnica y resultado empresarial.

##### 7.3. Restricción de evidencia

La matriz define relaciones objetivo permitidas. No demuestra que exista:

- productor físico;
- consumidor desplegado;
- contrato publicado;
- autorización implementada;
- suscripción activa;
- entrega exitosa;
- evidencia de uso real;
- compatibilidad entre versiones;
- operación productiva.

Esas afirmaciones requerirán implementación y validación en las tareas y paquetes propietarios.

---

#### 8. Continuidad canónica del bloque

```text
ÚLTIMA TAREA APROBADA
TSVC-CAT-002 — Definir propietario técnico y gobierno de cada servicio
        ↓
TAREA ACTUAL APROBADA
TSVC-CAT-003 — Definir aplicaciones productoras y consumidoras
        ↓
SIGUIENTE TAREA RESERVADA
TSVC-CAT-004 — Definir contrato, versión y compatibilidad
```


### ✅ TSVC-CAT-004 — Definir contrato, versión y compatibilidad

**Estado:** APROBADA

**Tarea anterior:** `TSVC-CAT-003 — Definir aplicaciones productoras y consumidoras`

**Tarea siguiente:** `TSVC-CAT-005 — Definir identidad técnica y credenciales mínimas`

**Tipo de tarea:** definición documental canónica de contratos, versionado y compatibilidad de servicios transversales

**Fase:** definición documental vinculante; implementación física no autorizada

**Repositorio propietario:** `devVentoGroup/vento-shell`

**Fecha de corte:** `2026-08-02`

**Cambios en código, migraciones, funciones, workers, colas, despliegues, datos o Supabase:** no autorizados ni realizados

---

#### 1. Resultado material

Esta tarea materializa el registro canónico:

```text
TRANSVERSE-SERVICE-CONTRACT-REGISTRY-001@1.0.0
```

El registro define, para cada una de las diez identidades `TSVC-SVC-001..010`:

1. una identidad contractual estable;
2. una versión inicial explícita;
3. la unidad de operación intercambiada;
4. el contrato mínimo de solicitud, resultado y error;
5. la relación con la aplicación productora, la aplicación propietaria del resultado y las consumidoras autorizadas;
6. las reglas de compatibilidad directa, adaptación, incompatibilidad, deprecación y retiro;
7. las condiciones que obligan a incrementar versión mayor, menor o de parche;
8. la obligación de conservar la versión de origen durante traducciones y coexistencia;
9. la situación documental vigente del contrato sin afirmar implementación, despliegue ni validación operativa.

El resultado convierte la matriz de aplicaciones de `TSVC-CAT-003` en intercambios contractuales gobernados, sin modificar sus cien decisiones aplicación–servicio ni transferir propiedad empresarial al servicio transversal.

---

#### 2. Alcance

La tarea abarca exactamente estas diez identidades:

1. `TSVC-SVC-001` — Orquestación genérica de trabajos asíncronos.
2. `TSVC-SVC-002` — Entrega transaccional de eventos y outbox.
3. `TSVC-SVC-003` — Impresión centralizada.
4. `TSVC-SVC-004` — Notificaciones y alertas.
5. `TSVC-SVC-005` — Generación de documentos.
6. `TSVC-SVC-006` — Custodia de archivos y documentos originales.
7. `TSVC-SVC-007` — Evidencia transaccional.
8. `TSVC-SVC-008` — Integraciones externas y webhooks.
9. `TSVC-SVC-009` — Programación y automatizaciones recurrentes.
10. `TSVC-SVC-010` — Monitoreo y heartbeat de workers.

La tarea conserva:

- el propietario técnico institucional definido en `TSVC-CAT-002`;
- el repositorio canónico `vento-shell`;
- las diez aplicaciones canónicas;
- las diez decisiones productoras;
- las cien celdas aplicación–servicio de `TSVC-CAT-003`;
- la separación entre aplicación productora, propietaria del resultado, consumidora y servicio técnico;
- las reglas canónicas de eventos, correlación, causalidad, propiedad y consumo ya aprobadas.

Quedan fuera del alcance:

- definir identidad de ejecución, cuentas técnicas, credenciales, secretos o rotación, responsabilidad de `TSVC-CAT-005`;
- definir idempotencia, reintentos, backoff y deduplicación, responsabilidad de `TSVC-CAT-006`;
- definir métricas, alertas, trazas y auditoría operativa, responsabilidad de `TSVC-CAT-007`;
- definir contingencia y degradación controlada, responsabilidad de `TSVC-CAT-008`;
- definir retención, archivado y limpieza, responsabilidad de `TSVC-CAT-009`;
- definir adopción progresiva y retiro de soluciones legacy, responsabilidad de `TSVC-CAT-010`;
- crear tablas, colas, funciones, workers, endpoints, paquetes, migraciones o despliegues;
- declarar contratos implementados, publicados, probados o disponibles sin evidencia física.

---

#### 3. Decisiones aprobadas

##### 3.1. Identidad del registro

| Campo                    | Valor                                      |
| ------------------------ | ------------------------------------------ |
| `registry_id`            | `TRANSVERSE-SERVICE-CONTRACT-REGISTRY-001` |
| `registry_version`       | `1.0.0`                                    |
| `registry_status`        | `DEFINED`                                  |
| `covered_services`       | `10`                                       |
| `contract_identity_rule` | `<service_id>.CONTRACT`                    |
| `versioning_model`       | `SEMANTIC_VERSIONING_STRICT`               |
| `governing_task`         | `TSVC-CAT-004`                             |
| `technical_owner`        | Tecnología de Vento Group                  |
| `canonical_repository`   | `vento-shell`                              |

`DEFINED` significa que el contrato documental está completo y aprobado. No significa que exista implementación física, publicación, despliegue, adopción o evidencia operativa.

##### 3.2. Unidad contractual

Cada intercambio con un servicio transversal deberá resolver una unidad contractual completa:

```text
APLICACIÓN PRODUCTORA
        ↓
SOLICITUD VERSIONADA
        ↓
SERVICIO TRANSVERSAL
        ↓
RESULTADO O ERROR VERSIONADO
        ↓
APLICACIÓN PROPIETARIA DEL RESULTADO
+ CONSUMIDORAS AUTORIZADAS
```

El contrato técnico no reemplaza:

- el proceso empresarial;
- la autorización de la acción originadora;
- la fuente de verdad del dominio;
- la semántica del evento o documento;
- la decisión de compensación empresarial;
- la responsabilidad de la aplicación propietaria.

##### 3.3. Campos mínimos comunes

Toda materialización futura de los contratos deberá soportar, cuando aplique:

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
expires_at
contract_status
```

Reglas:

1. `service_id` conserva la identidad `TSVC-SVC-*`.
2. `contract_id` es estable y no cambia por tecnología, repositorio, proveedor o transporte.
3. `contract_version` identifica la semántica exacta del intercambio.
4. `operation_id` identifica una operación concreta y no se reutiliza.
5. `producer_application` debe pertenecer a la matriz aprobada en `TSVC-CAT-003`.
6. `business_owner_application` conserva la autoridad sobre el resultado empresarial.
7. `consumer_application` deberá estar declarada para el servicio o habilitada por una variante contractual aprobada.
8. las referencias de esquema apuntarán a definiciones versionadas; no se aceptarán payloads libres sin identidad contractual.
9. `correlation_id` y `causation_id` conservarán continuidad entre solicitud, efectos y resultado.
10. los campos de identidad técnica, seguridad, idempotencia, telemetría, retención y contingencia se incorporarán mediante las tareas propietarias posteriores sin alterar silenciosamente este contrato base.

##### 3.4. Registro canónico de contratos por servicio

| Servicio       | `contract_id`           | Versión inicial | Solicitud o entrada canónica  | Resultado canónico            | Error canónico              | Productora autorizada                                                                        | Frontera incompatible principal                                                                                                  | Estado    |
| -------------- | ----------------------- | --------------- | ----------------------------- | ----------------------------- | --------------------------- | -------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | --------- |
| `TSVC-SVC-001` | `TSVC-SVC-001.CONTRACT` | `1.0.0`         | `WORK_SUBMISSION`             | `WORK_OUTCOME`                | `WORK_ERROR`                | Aplicación que solicita un resultado asíncrono y figura como productora en `TSVC-CAT-003`    | Cambiar estados terminales, semántica de ejecución, autoridad del resultado o garantía de aceptación                             | `DEFINED` |
| `TSVC-SVC-002` | `TSVC-SVC-002.CONTRACT` | `1.0.0`         | `OUTBOX_EVENT_RECORD`         | `DELIVERY_OUTCOME`            | `DELIVERY_ERROR`            | Aplicación propietaria de la transacción y del evento empresarial                            | Cambiar atomicidad, identidad del evento, versión empresarial, garantía de entrega o significado del resultado                   | `DEFINED` |
| `TSVC-SVC-003` | `TSVC-SVC-003.CONTRACT` | `1.0.0`         | `PRINT_REQUEST`               | `PRINT_OUTCOME`               | `PRINT_ERROR`               | Aplicación propietaria del documento, etiqueta, comanda o comprobante                        | Cambiar campos obligatorios de plantilla, routing contractual, identidad del documento o significado de impresión confirmada     | `DEFINED` |
| `TSVC-SVC-004` | `TSVC-SVC-004.CONTRACT` | `1.0.0`         | `NOTIFICATION_REQUEST`        | `NOTIFICATION_OUTCOME`        | `NOTIFICATION_ERROR`        | Aplicación propietaria del evento o condición que origina la comunicación                    | Cambiar resolución de destinatarios, prioridad obligatoria, semántica de entrega o contenido empresarial                         | `DEFINED` |
| `TSVC-SVC-005` | `TSVC-SVC-005.CONTRACT` | `1.0.0`         | `DOCUMENT_GENERATION_REQUEST` | `GENERATED_DOCUMENT_RESULT`   | `DOCUMENT_GENERATION_ERROR` | Aplicación propietaria del tipo documental y de la plantilla aprobada                        | Cambiar significado del documento, campos autoritativos, formato comprometido, identidad de plantilla o integridad del resultado | `DEFINED` |
| `TSVC-SVC-006` | `TSVC-SVC-006.CONTRACT` | `1.0.0`         | `FILE_INGEST_REQUEST`         | `FILE_RECORD_RESULT`          | `FILE_INGEST_ERROR`         | Aplicación propietaria del proceso que recibe o exige el original                            | Cambiar identidad del original, integridad, vínculo con recurso, clasificación o semántica de sustitución                        | `DEFINED` |
| `TSVC-SVC-007` | `TSVC-SVC-007.CONTRACT` | `1.0.0`         | `EVIDENCE_CAPTURE_REQUEST`    | `EVIDENCE_RECORD_RESULT`      | `EVIDENCE_CAPTURE_ERROR`    | Aplicación propietaria de la acción o hecho que debe demostrarse                             | Cambiar inmutabilidad, lineage, vínculo causal, fuerza probatoria técnica o relación con acción y recurso                        | `DEFINED` |
| `TSVC-SVC-008` | `TSVC-SVC-008.CONTRACT` | `1.0.0`         | `INTEGRATION_MESSAGE`         | `INTEGRATION_DELIVERY_RESULT` | `INTEGRATION_ERROR`         | Aplicación o dominio propietario del proceso integrado                                       | Cambiar dirección, identidad externa, mapping empresarial, validación de origen, ACK o semántica de confirmación                 | `DEFINED` |
| `TSVC-SVC-009` | `TSVC-SVC-009.CONTRACT` | `1.0.0`         | `SCHEDULE_DEFINITION`         | `SCHEDULED_EXECUTION_RESULT`  | `SCHEDULE_ERROR`            | Aplicación propietaria de la acción programada                                               | Cambiar calendario, zona horaria, vigencia, misfire, concurrencia contractual o autoridad de activación                          | `DEFINED` |
| `TSVC-SVC-010` | `TSVC-SVC-010.CONTRACT` | `1.0.0`         | `WORKER_HEALTH_SIGNAL`        | `WORKER_HEALTH_STATE`         | `WORKER_HEALTH_ERROR`       | Servicio o worker observado; la aplicación empresarial solo referencia el resultado afectado | Cambiar identidad del worker, significado de liveness/readiness, estado de salud o interpretación de obsolescencia               | `DEFINED` |

##### 3.5. Regla de versión semántica

Toda versión utiliza:

```text
MAJOR.MINOR.PATCH
```

| Cambio                  | Incremento | Regla                                                                                                                    |
| ----------------------- | ---------- | ------------------------------------------------------------------------------------------------------------------------ |
| incompatible            | `MAJOR`    | modifica significado, obligatoriedad, tipo, identidad, estado, error, autoridad, garantía o comportamiento observable    |
| aditivo compatible      | `MINOR`    | agrega campos opcionales, operaciones opcionales o capacidades que consumidores compatibles pueden ignorar con seguridad |
| corrección no semántica | `PATCH`    | corrige documentación, validación o defecto sin cambiar el contrato observable ni exigir modificación del consumidor     |

Reglas obligatorias:

1. una versión publicada es inmutable;
2. no se reescribe `1.0.0` para incorporar un cambio posterior;
3. un cambio incompatible crea una nueva versión mayor;
4. una versión menor no puede cambiar el significado de un campo existente;
5. una versión de parche no puede cambiar estructura, resultado, error ni comportamiento esperado;
6. el `contract_id` permanece estable entre versiones del mismo servicio;
7. la versión deberá viajar en cada solicitud, resultado y error;
8. ninguna aplicación podrá asumir la versión más reciente por ausencia del campo;
9. los productores y consumidores deberán declarar versiones soportadas antes de la implementación;
10. una traducción conservará la versión de origen, la versión de destino y la identidad del adaptador aplicado.

##### 3.6. Cambios que obligan a versión mayor

Constituyen ruptura contractual, como mínimo:

- cambiar un campo requerido a otro nombre;
- eliminar un campo requerido u opcional previamente consumible;
- convertir un campo opcional en obligatorio;
- cambiar tipo, unidad, formato, cardinalidad o zona horaria;
- cambiar el significado de un valor, estado, error o resultado;
- cambiar identidad, ownership o fuente de verdad;
- cambiar una garantía de entrega, aceptación, confirmación o atomicidad;
- cambiar la forma de correlacionar solicitud, efecto y resultado;
- introducir un valor nuevo en un enum cuando los consumidores no estén obligados a tolerar valores desconocidos;
- cambiar un valor predeterminado cuando altera el resultado empresarial o técnico observable;
- exigir una identidad o credencial incompatible con consumidores existentes;
- cambiar la semántica de expiración, cancelación, sustitución, repetición o retiro;
- reinterpretar un error recuperable como terminal o viceversa.

##### 3.7. Cambios compatibles

Un cambio podrá clasificarse como compatible únicamente cuando se demuestre que:

1. conserva el mismo significado de todos los campos existentes;
2. no cambia las reglas empresariales ni la autoridad del resultado;
3. no exige que una productora o consumidora existente envíe información adicional;
4. no elimina ni restringe un resultado previamente válido;
5. los campos nuevos son opcionales y tienen ausencia semánticamente segura;
6. los consumidores pueden ignorar extensiones desconocidas sin perder integridad;
7. no cambia la exposición de información sensible;
8. no modifica garantías de entrega, orden, confirmación o error;
9. las pruebas de contrato de productores y consumidores continúan aprobando;
10. la matriz de `TSVC-CAT-003` permanece válida.

##### 3.8. Estados de compatibilidad

| Estado                    | Significado                                                                            |
| ------------------------- | -------------------------------------------------------------------------------------- |
| `COMPATIBLE_DIRECT`       | productora y consumidora comparten una versión admitida sin traducción                 |
| `COMPATIBLE_WITH_ADAPTER` | existe un adaptador versionado, probado y aprobado que traduce sin pérdida semántica   |
| `DEPRECATED_SUPPORTED`    | la versión está deprecada, pero permanece soportada durante una ventana explícita      |
| `INCOMPATIBLE`            | no existe intersección de versiones ni adaptación válida                               |
| `UNSUPPORTED`             | la versión no está publicada, fue retirada o nunca estuvo autorizada para esa relación |

No se admiten estados ambiguos como compatible parcialmente, probablemente compatible o compatible con observaciones sin una clasificación cerrada y evidencia contractual.

##### 3.9. Negociación y selección de versión

La selección futura deberá aplicar este orden:

```text
VERSIONES SOPORTADAS POR PRODUCTORA
∩
VERSIONES SOPORTADAS POR SERVICIO
∩
VERSIONES SOPORTADAS POR CONSUMIDORA
        ↓
MAYOR VERSIÓN COMPATIBLE APROBADA
```

Reglas:

1. la intersección se resuelve antes de aceptar la operación;
2. no se ejecuta una solicitud con versión desconocida;
3. no se actualiza automáticamente entre versiones mayores;
4. una consumidora no podrá aceptar una versión que no haya declarado y probado;
5. una productora no enviará campos o comportamientos pertenecientes a otra versión;
6. si no existe intersección válida, la operación se rechaza como `INCOMPATIBLE` o `UNSUPPORTED`;
7. el rechazo contractual ocurre antes de producir efectos empresariales;
8. la negociación no concede autorización ni sustituye las credenciales definidas por `TSVC-CAT-005`.

##### 3.10. Adaptadores de compatibilidad

Un adaptador solo podrá utilizarse cuando declare:

```text
adapter_id
source_contract_id
source_version
target_contract_id
target_version
mapping_version
loss_policy
owner
status
```

Reglas:

1. la traducción debe ser determinista;
2. la versión de origen no se sobrescribe;
3. no se inventan campos autoritativos ausentes;
4. toda pérdida deberá bloquear la operación, salvo que el campo sea opcional y su ausencia esté admitida por ambos contratos;
5. un adaptador no cambia propiedad empresarial;
6. un adaptador específico de proveedor no se convierte en contrato canónico;
7. las versiones mayores coexistentes permanecen separadas hasta completar una transición aprobada;
8. la adopción y retiro del adaptador se gobiernan en `TSVC-CAT-010`.

##### 3.11. Deprecación, coexistencia y retiro

Una versión podrá pasar por:

```text
DEFINED
IMPLEMENTED
DEPRECATED
RETIRED
```

Reglas:

1. esta tarea deja las diez versiones en `DEFINED`;
2. `IMPLEMENTED` exige código, publicación y pruebas verificables;
3. `DEPRECATED` exige versión sucesora, inventario de consumidores, ventana y plan de migración;
4. `RETIRED` exige cero productores y consumidores activos, evidencia de migración y rollback cerrado;
5. la deprecación no modifica el contrato publicado;
6. podrán coexistir versiones mayores durante una transición explícita;
7. no se retira una versión por fecha únicamente si persisten consumidores;
8. los detalles de adopción y retiro legacy corresponden a `TSVC-CAT-010`.

##### 3.12. Relación con aplicaciones productoras y consumidoras

1. Las cien decisiones aplicación–servicio de `TSVC-CAT-003` permanecen vigentes.
2. Una celda `NO_APLICA` no puede producir ni consumir el contrato.
3. Una celda `CONSUMIDORA` solo puede recibir solicitudes, resultados o proyecciones admitidas por su finalidad.
4. Una celda `PRODUCTORA_CONSUMIDORA` puede originar operaciones y consumir resultados sin adquirir propiedad del servicio.
5. La aplicación productora deberá declarar la aplicación propietaria del resultado cuando no coincidan.
6. El servicio no podrá aceptar códigos de aplicación fuera del catálogo canónico.
7. Proveedores, dispositivos, repositorios, tablas y plataformas no sustituyen códigos de aplicación.
8. Los sistemas externos participan mediante `TSVC-SVC-008` y adaptadores, no como aplicaciones VENTO.
9. La identidad `shell` representa la aplicación hub; `vento-shell` representa el repositorio técnico.
10. Una aplicación diferida puede conservar contrato objetivo, pero no se presenta como implementada o disponible.

##### 3.13. Aplicación al carril prioritario NEXO

| Servicio       | Decisión NEXO | Contrato exigido                                                           | Estado actual             |
| -------------- | ------------- | -------------------------------------------------------------------------- | ------------------------- |
| `TSVC-SVC-001` | `APLICA`      | `TSVC-SVC-001.CONTRACT@1.0.0`                                              | `DEFINED_NOT_IMPLEMENTED` |
| `TSVC-SVC-002` | `APLICA`      | `TSVC-SVC-002.CONTRACT@1.0.0`                                              | `DEFINED_NOT_IMPLEMENTED` |
| `TSVC-SVC-003` | `APLICA`      | `TSVC-SVC-003.CONTRACT@1.0.0`                                              | `DEFINED_NOT_IMPLEMENTED` |
| `TSVC-SVC-004` | `APLICA`      | `TSVC-SVC-004.CONTRACT@1.0.0`                                              | `DEFINED_NOT_IMPLEMENTED` |
| `TSVC-SVC-005` | `APLICA`      | `TSVC-SVC-005.CONTRACT@1.0.0`                                              | `DEFINED_NOT_IMPLEMENTED` |
| `TSVC-SVC-006` | `APLICA`      | `TSVC-SVC-006.CONTRACT@1.0.0`                                              | `DEFINED_NOT_IMPLEMENTED` |
| `TSVC-SVC-007` | `APLICA`      | `TSVC-SVC-007.CONTRACT@1.0.0`                                              | `DEFINED_NOT_IMPLEMENTED` |
| `TSVC-SVC-008` | `CONDICIONAL` | `TSVC-SVC-008.CONTRACT@1.0.0` cuando exista integración externa en alcance | `DEFINED_NOT_IMPLEMENTED` |
| `TSVC-SVC-009` | `APLICA`      | `TSVC-SVC-009.CONTRACT@1.0.0`                                              | `DEFINED_NOT_IMPLEMENTED` |
| `TSVC-SVC-010` | `APLICA`      | `TSVC-SVC-010.CONTRACT@1.0.0`                                              | `DEFINED_NOT_IMPLEMENTED` |

La existencia del contrato documental no habilita el paquete NEXO. La implementación, pruebas, readiness y adopción permanecen sujetas a las etapas y condiciones del carril prioritario.

##### 3.14. Reconciliación cuantitativa

| Control                                | Resultado |
| -------------------------------------- | --------: |
| Servicios esperados                    |        10 |
| Contratos materializados               |        10 |
| Identificadores contractuales únicos   |        10 |
| Versiones iniciales declaradas         |        10 |
| Servicios faltantes                    |         0 |
| Contratos duplicados                   |         0 |
| Contratos en estado `DEFINED`          |        10 |
| Contratos afirmados como implementados |         0 |
| Decisiones NEXO reconciliadas          |        10 |

##### 3.15. Handoff obligatorio

| Tarea posterior | Insumo recibido de `TSVC-CAT-004`                                                                                                          |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| `TSVC-CAT-005`  | Los diez contratos y sus campos mínimos para definir identidad técnica, cuentas, credenciales y secretos sin alterar identidad ni versión. |
| `TSVC-CAT-006`  | Las operaciones, resultados y errores versionados para definir idempotencia, reintentos, backoff y deduplicación por contrato.             |
| `TSVC-CAT-007`  | Las identidades contractuales y estados para asociar métricas, trazas, alertas y auditoría sin mezclar versiones.                          |
| `TSVC-CAT-008`  | Los resultados y errores canónicos para definir degradación, contingencia y recuperación por servicio.                                     |
| `TSVC-CAT-009`  | Las identidades de solicitud, resultado y evidencia para definir retención, archivado y limpieza.                                          |
| `TSVC-CAT-010`  | Las versiones, estados de compatibilidad y coexistencia para gobernar adopción y retiro legacy.                                            |

---

#### 4. Artefactos y entregables

1. `TRANSVERSE-SERVICE-CONTRACT-REGISTRY-001@1.0.0`.
2. Diez identidades contractuales estables derivadas de `TSVC-SVC-001..010`.
3. Diez versiones iniciales `1.0.0` en estado `DEFINED`.
4. Matriz materializada de solicitud, resultado, error, productora y frontera incompatible por servicio.
5. Reglas completas de versionado semántico estricto.
6. Vocabulario cerrado de compatibilidad.
7. Reglas de negociación, adaptación, deprecación, coexistencia y retiro.
8. Reconciliación específica del carril NEXO para los diez servicios.
9. Handoff hacia `TSVC-CAT-005..010` sin anticipar sus decisiones propietarias.

---

#### 5. Requisitos de prueba

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

Justificación:

- `TSVC-CAT-004` materializa contratos documentales para identidades, propietarias y consumidoras ya protegidas por `TREQ-PROC-018` a `TREQ-PROC-027`;
- la identidad, versión, correlación, causalidad y compatibilidad de eventos ya están protegidas por `TREQ-PROC-087` a `TREQ-PROC-094`, `TREQ-INTEGRATION-003` a `TREQ-INTEGRATION-004` y `TREQ-INTEGRATION-024` a `TREQ-INTEGRATION-053`;
- la tarea no introduce una nueva capacidad empresarial, criterio de implementación o evidencia operativa distinta de esas invariantes;
- los contratos quedan en estado `DEFINED`, por lo que no se declara satisfecha ninguna prueba de implementación, integración, despliegue o dispositivo;
- no se modifica, difiere, descarta ni vuelve obsoleto ningún requisito existente.

Cambios `TREQ-*`:

```text
CREADOS = 0
MODIFICADOS = 0
DIFERIDOS = 0
DESCARTADOS_U_OBSOLETOS = 0
```

---

#### 6. Criterios de aceptación

1. Existen exactamente diez contratos para `TSVC-SVC-001..010`.
2. Cada contrato utiliza un `contract_id` único y una versión inicial explícita.
3. Cada contrato declara solicitud, resultado y error canónicos.
4. Cada servicio conserva su productora según `TSVC-CAT-003`.
5. Ningún contrato transfiere propiedad empresarial al servicio transversal.
6. Los cambios mayores, menores y de parche están diferenciados sin ambigüedad.
7. Las versiones publicadas son inmutables.
8. La compatibilidad utiliza únicamente estados cerrados.
9. Una versión incompatible no se ejecuta ni se adapta silenciosamente.
10. Todo adaptador conserva versión de origen, destino y mapping.
11. La matriz de cien celdas de `TSVC-CAT-003` permanece sin cambios.
12. Las diez decisiones NEXO quedan vinculadas a un contrato `1.0.0`.
13. `TSVC-SVC-008` conserva aplicabilidad condicional para NEXO.
14. Ningún contrato se presenta como implementado o validado.
15. No se definen anticipadamente credenciales, reintentos, observabilidad, contingencia, retención o adopción legacy.
16. No se realizan cambios de código, Supabase, migraciones, despliegues ni datos.
17. Se declaran cero cambios `TREQ-*` con justificación concreta.
18. `TSVC-CAT-005` permanece exclusivamente reservada.

---

#### 7. Dependencias y entradas

La tarea consume y preserva:

- `TSVC-CAT-001` — inventario de diez servicios y clasificación actual;
- `TSVC-CAT-002` — propietario técnico institucional y gobierno;
- `TSVC-CAT-003` — productoras, consumidoras, cien celdas y aplicabilidad NEXO;
- catálogo canónico de aplicaciones `shell`, `anima`, `viso`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `aura` y `pass`;
- `PROC-CAT-005` — propietarias de procesos;
- `PROC-CAT-006` — consumidoras directas y condicionales;
- `PROC-CAT-017` e `INT-APP-001..010` — identidad de eventos, sobre común, versión, correlación, causalidad y compatibilidad;
- principios de propiedad de BLOQUE E4;
- carril prioritario `NEXO-REMISSIONS-001`.

Ninguna decisión aprobada por estas fuentes se modifica.

---

#### 8. Continuidad

```text
ÚLTIMA TAREA APROBADA
TSVC-CAT-003 — Definir aplicaciones productoras y consumidoras
        ↓
TAREA ACTUAL APROBADA
TSVC-CAT-004 — Definir contrato, versión y compatibilidad
        ↓
SIGUIENTE TAREA RESERVADA
TSVC-CAT-005 — Definir identidad técnica y credenciales mínimas
```


### ✅ TSVC-CAT-005 — Definir identidad técnica y credenciales mínimas

**Estado:** APROBADA

**Tarea anterior:** `TSVC-CAT-004 — Definir contrato, versión y compatibilidad`

**Tarea siguiente:** `TSVC-CAT-006 — Definir idempotencia, reintentos y deduplicación`

**Tipo de tarea:** definición documental canónica de identidades técnicas, credenciales mínimas y mínimo privilegio para servicios transversales

**Fase:** definición documental vinculante; aprovisionamiento, rotación, implementación física y despliegue no autorizados

**Repositorio propietario:** `devVentoGroup/vento-shell`

**Fecha de corte:** `2026-08-02`

**Cambios en código, secretos, credenciales, migraciones, funciones, workers, colas, despliegues, datos o Supabase:** no autorizados ni realizados

---

#### 1. Resultado material

Esta tarea materializa el registro canónico:

```text
TRANSVERSE-SERVICE-TECHNICAL-IDENTITY-REGISTRY-001@1.0.0
```

El registro define, para cada una de las diez identidades `TSVC-SVC-001..010`:

1. un principal técnico estable por servicio y ambiente;
2. las identidades adicionales de worker, dispositivo, proveedor, scheduler u observador cuando aplican;
3. el tipo mínimo de credencial permitido;
4. el alcance mínimo de recursos y acciones;
5. la separación entre actor humano, aplicación llamadora, aplicación propietaria, servicio y runtime;
6. las credenciales y exposiciones expresamente prohibidas;
7. el estado objetivo de aprovisionamiento sin afirmar que la identidad física exista;
8. el tratamiento de los patrones legacy localizados en el código actual;
9. las reglas de emisión, almacenamiento, rotación, revocación, recuperación y retiro;
10. el handoff obligatorio hacia idempotencia, observabilidad, contingencia, retención y adopción progresiva.

El resultado completa la dimensión de identidad y credenciales de los contratos `TSVC-SVC-001.CONTRACT` a `TSVC-SVC-010.CONTRACT`, todos definidos en versión inicial `1.0.0` por `TSVC-CAT-004`.

---

#### 2. Alcance

La tarea abarca exactamente estas diez identidades:

1. `TSVC-SVC-001` — Orquestación genérica de trabajos asíncronos.
2. `TSVC-SVC-002` — Entrega transaccional de eventos y outbox.
3. `TSVC-SVC-003` — Impresión centralizada.
4. `TSVC-SVC-004` — Notificaciones y alertas.
5. `TSVC-SVC-005` — Generación de documentos.
6. `TSVC-SVC-006` — Custodia de archivos y documentos originales.
7. `TSVC-SVC-007` — Evidencia transaccional.
8. `TSVC-SVC-008` — Integraciones externas y webhooks.
9. `TSVC-SVC-009` — Programación y automatizaciones recurrentes.
10. `TSVC-SVC-010` — Monitoreo y heartbeat de workers.

La tarea conserva sin modificación:

- el propietario técnico institucional `Tecnología de Vento Group`;
- el repositorio canónico `vento-shell`;
- la separación entre la aplicación `shell` y el repositorio `vento-shell`;
- las diez aplicaciones canónicas;
- la matriz de cien decisiones aplicación–servicio de `TSVC-CAT-003`;
- las productoras, consumidoras y condiciones aprobadas;
- los diez contratos `1.0.0` y sus fronteras de compatibilidad;
- la autoridad empresarial de la aplicación propietaria del resultado;
- la obligación de que toda modificación de Supabase perteneciente a VENTO se materialice desde `vento-shell` durante una fase autorizada.

Quedan fuera del alcance:

- crear cuentas técnicas, roles de base de datos, claves, certificados, tokens, secretos o credenciales reales;
- registrar valores secretos en repositorios, tablas, documentación o archivos de configuración;
- modificar `SUPABASE_SERVICE_ROLE_KEY`, secretos de proveedores o claves de cron existentes;
- ejecutar rotaciones, revocaciones, migraciones, despliegues o cambios remotos;
- definir idempotencia, reintentos, backoff y deduplicación, responsabilidad de `TSVC-CAT-006`;
- definir métricas, alertas, trazas y auditoría operativa, responsabilidad de `TSVC-CAT-007`;
- definir contingencia y degradación controlada, responsabilidad de `TSVC-CAT-008`;
- definir retención, archivado y limpieza, responsabilidad de `TSVC-CAT-009`;
- definir adopción progresiva y retiro de soluciones legacy, responsabilidad de `TSVC-CAT-010`;
- declarar identidades aprovisionadas, activas, rotadas o validadas sin evidencia física.

---

#### 3. Decisiones aprobadas

##### 3.1. Identidad del registro

| Campo                    | Valor                                                |
| ------------------------ | ---------------------------------------------------- |
| `registry_id`            | `TRANSVERSE-SERVICE-TECHNICAL-IDENTITY-REGISTRY-001` |
| `registry_version`       | `1.0.0`                                              |
| `registry_status`        | `DEFINED`                                            |
| `covered_services`       | `10`                                                 |
| `runtime_principal_rule` | `svc:<service-id-en-minusculas>:<environment>`       |
| `technical_owner`        | Tecnología de Vento Group                            |
| `canonical_repository`   | `vento-shell`                                        |
| `governing_task`         | `TSVC-CAT-005`                                       |

`DEFINED` significa que las identidades, clases de credencial y límites de privilegio están documentados. No significa que existan principals, roles, certificados, secretos o políticas físicas.

##### 3.2. Separación obligatoria de identidades

Toda ejecución deberá distinguir, cuando aplique:

```text
ACTOR HUMANO O EXTERNO
        +
APLICACIÓN LLAMADORA
        +
APLICACIÓN PROPIETARIA DEL RESULTADO
        +
IDENTIDAD DEL SERVICIO
        +
IDENTIDAD DEL RUNTIME O WORKER
        +
IDENTIDAD DE DISPOSITIVO O PROVEEDOR
```

Reglas:

1. la identidad del servicio no reemplaza al actor ni a la aplicación llamadora;
2. la aplicación llamadora no adquiere la identidad técnica del servicio;
3. un worker no actúa como usuario humano ni hereda sus permisos completos;
4. una credencial demuestra posesión o habilita autenticación; no constituye por sí sola autorización empresarial;
5. la aplicación propietaria conserva la decisión sobre el resultado empresarial;
6. el servicio solo ejecuta las operaciones técnicas permitidas por su contrato y su alcance;
7. un proveedor externo, impresora, scheduler o agente observador usa identidad separada y no recibe acceso general al ecosistema;
8. una identidad técnica nunca puede utilizarse para ocultar el actor, la aplicación, la causa o el recurso de origen.

##### 3.3. Clases canónicas de identidad técnica

| Clase                      | Uso permitido                                                                         | No representa                                                    |
| -------------------------- | ------------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| `SERVICE_RUNTIME_IDENTITY` | Ejecutar la frontera técnica de un servicio transversal.                              | Actor humano, aplicación propietaria o autorización empresarial. |
| `WORKER_IDENTITY`          | Reclamar y procesar unidades de trabajo de un servicio concreto.                      | Acceso administrativo general ni capacidad sobre otras colas.    |
| `CALLER_IDENTITY`          | Identificar la aplicación y, cuando corresponda, el actor que solicita una operación. | Identidad del servicio receptor.                                 |
| `DEVICE_IDENTITY`          | Identificar un dispositivo enrolado y su alcance físico aprobado.                     | Usuario, sede completa o permiso empresarial.                    |
| `PROVIDER_IDENTITY`        | Identificar una integración externa o contraparte técnica concreta.                   | Propietario del proceso interno.                                 |
| `SCHEDULER_IDENTITY`       | Disparar una ejecución programada aprobada.                                           | Decidir la regla empresarial ni ejecutar cualquier job.          |
| `OBSERVER_IDENTITY`        | Leer salud, latencia, métricas o heartbeat autorizados.                               | Leer payloads empresariales ni mutar estado.                     |
| `BREAK_GLASS_IDENTITY`     | Recuperación excepcional, temporal y autorizada.                                      | Credencial de operación ordinaria.                               |

##### 3.4. Tipos canónicos de credencial mínima

| Tipo                               | Uso permitido                                                              | Restricción obligatoria                                                               |
| ---------------------------------- | -------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |
| `DELEGATED_USER_TOKEN`             | Conservar actor y aplicación en una invocación iniciada por usuario.       | No puede convertirse en credencial persistente del worker.                            |
| `WORKLOAD_IDENTITY_TOKEN`          | Autenticar runtime o worker mediante identidad de carga de trabajo.        | Debe ser corto, acotado a servicio, ambiente y audiencia.                             |
| `SIGNED_INVOCATION_TOKEN`          | Autorizar una invocación máquina a máquina concreta.                       | Audiencia, emisor, expiración y propósito obligatorios.                               |
| `DEVICE_ENROLLMENT_CREDENTIAL`     | Enrolar y autenticar un dispositivo específico.                            | Un dispositivo, ambiente, sede y capacidades máximas aprobadas.                       |
| `PROVIDER_CREDENTIAL_REFERENCE`    | Referenciar secreto, certificado, OAuth o firma de un proveedor.           | Separado por proveedor, ambiente y finalidad; nunca contiene el valor en el contrato. |
| `OBJECT_SCOPED_CAPABILITY`         | Habilitar acceso temporal a un objeto o prefijo autorizado.                | Expiración corta, operación y recurso exactos; no es credencial general de Storage.   |
| `SIGNING_KEY_REFERENCE`            | Referenciar material de firma o sello protegido.                           | La clave privada nunca sale del custodio técnico autorizado.                          |
| `READ_ONLY_OBSERVER_TOKEN`         | Leer únicamente señales de salud y operación autorizadas.                  | Prohíbe payload empresarial, secretos y mutaciones.                                   |
| `ROTATING_SHARED_SECRET_REFERENCE` | Compatibilidad excepcional cuando no exista identidad de carga de trabajo. | Debe ser rotatorio, acotado, versionado y sustituible; no es opción preferida.        |

La preferencia obligatoria es `WORKLOAD_IDENTITY_TOKEN` o `SIGNED_INVOCATION_TOKEN`. Un secreto persistente solo se admite cuando el proveedor o plataforma no soporte una alternativa más estrecha y deberá quedar registrado como excepción controlada.

##### 3.5. Registro canónico por servicio

| Servicio       | Principal técnico objetivo       | Identidades adicionales                                                  | Credencial mínima objetivo                                                                                   | Alcance permitido                                                                                                                               | Prohibiciones principales                                                                                                                         | Estado objetivo           |
| -------------- | -------------------------------- | ------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------- |
| `TSVC-SVC-001` | `svc:tsvc-svc-001:<environment>` | `worker:tsvc-svc-001:<environment>`; `CALLER_IDENTITY` por operación     | `WORKLOAD_IDENTITY_TOKEN`; `DELEGATED_USER_TOKEN` cuando exista actor                                        | crear trabajos bajo contrato autorizado; reclamar, renovar lease y cerrar únicamente trabajos del servicio; leer referencias mínimas de origen  | `service_role` como credencial ordinaria; acceso a colas ajenas; usar el token del usuario como credencial persistente del worker                 | `DEFINED_NOT_PROVISIONED` |
| `TSVC-SVC-002` | `svc:tsvc-svc-002:<environment>` | `worker:tsvc-svc-002:<environment>`; identidad de aplicación emisora     | `WORKLOAD_IDENTITY_TOKEN`; identidad transaccional del emisor dentro de su frontera autorizada               | registrar outbox en la misma frontera transaccional; reclamar, entregar y actualizar únicamente eventos autorizados                             | escritura directa del consumidor en el outbox; credencial global compartida; emisión sin aplicación y evento de origen                            | `DEFINED_NOT_PROVISIONED` |
| `TSVC-SVC-003` | `svc:tsvc-svc-003:<environment>` | `worker:tsvc-svc-003:<environment>`; `device:printer:<device-id>`        | `WORKLOAD_IDENTITY_TOKEN`; `DEVICE_ENROLLMENT_CREDENTIAL`                                                    | crear y procesar trabajos de impresión autorizados; entregar únicamente al dispositivo, sede, cola y capacidades enroladas                      | secretos administrativos en navegador; `service_role` en cliente; una credencial común para todas las impresoras; dispositivo sin enrolamiento    | `DEFINED_NOT_PROVISIONED` |
| `TSVC-SVC-004` | `svc:tsvc-svc-004:<environment>` | `worker:tsvc-svc-004:<environment>`; `provider:<channel>:<environment>`  | `WORKLOAD_IDENTITY_TOKEN`; `PROVIDER_CREDENTIAL_REFERENCE`; `DELEGATED_USER_TOKEN` cuando aplique            | resolver destinatarios autorizados, renderizar y entregar por canales aprobados; usar solo credencial del proveedor y ambiente correspondientes | tratar push token como autorización; compartir credenciales entre canales; exponer secreto de proveedor o credencial privilegiada al cliente      | `DEFINED_NOT_PROVISIONED` |
| `TSVC-SVC-005` | `svc:tsvc-svc-005:<environment>` | `worker:tsvc-svc-005:<environment>`; identidad de aplicación propietaria | `WORKLOAD_IDENTITY_TOKEN`; `OBJECT_SCOPED_CAPABILITY` para resultado                                         | leer la proyección y plantilla aprobadas; generar bajo versión contractual; escribir únicamente el resultado autorizado                         | acceso general a tablas o buckets; modificar datos fuente; elegir plantillas no autorizadas; credencial persistente dentro del documento generado | `DEFINED_NOT_PROVISIONED` |
| `TSVC-SVC-006` | `svc:tsvc-svc-006:<environment>` | `CALLER_IDENTITY`; identidad de aplicación propietaria                   | `DELEGATED_USER_TOKEN`; `OBJECT_SCOPED_CAPABILITY`; `WORKLOAD_IDENTITY_TOKEN` para procesamiento servidor    | cargar, leer o transformar únicamente objetos, prefijos y metadatos autorizados para la finalidad declarada                                     | bucket-wide key en cliente; URL permanente; reutilizar capacidad para otro objeto; elevar acceso por conocer la ruta                              | `DEFINED_NOT_PROVISIONED` |
| `TSVC-SVC-007` | `svc:tsvc-svc-007:<environment>` | `worker:tsvc-svc-007:<environment>`; verificador autorizado              | `WORKLOAD_IDENTITY_TOKEN`; `SIGNING_KEY_REFERENCE` cuando exista firma o sello                               | anexar evidencia bajo contrato, verificar integridad y leer referencias mínimas autorizadas                                                     | actualizar o borrar evidencia por credencial ordinaria; exponer clave privada; usar evidencia como sustituto de autorización empresarial          | `DEFINED_NOT_PROVISIONED` |
| `TSVC-SVC-008` | `svc:tsvc-svc-008:<environment>` | `provider:<provider-code>:<environment>`; adaptador de salida autorizado | `PROVIDER_CREDENTIAL_REFERENCE`; `WORKLOAD_IDENTITY_TOKEN`; `SIGNED_INVOCATION_TOKEN`                        | verificar ingreso del proveedor; transformar bajo mapping aprobado; invocar únicamente operaciones y recursos del proveedor autorizado          | secreto único para proveedores distintos; acceso directo del proveedor a fuentes internas; `service_role` como credencial general del adaptador   | `DEFINED_NOT_PROVISIONED` |
| `TSVC-SVC-009` | `svc:tsvc-svc-009:<environment>` | `scheduler:tsvc-svc-009:<environment>`; worker del servicio destino      | `SIGNED_INVOCATION_TOKEN`; `WORKLOAD_IDENTITY_TOKEN`; `ROTATING_SHARED_SECRET_REFERENCE` solo como excepción | activar únicamente schedule, ambiente, servicio, operación y ventana aprobados; registrar la identidad de la regla                              | clave cron global; secreto sin rotación; scheduler con permiso para ejecutar cualquier función; omitir la regla causal                            | `DEFINED_NOT_PROVISIONED` |
| `TSVC-SVC-010` | `svc:tsvc-svc-010:<environment>` | `observer:tsvc-svc-010:<environment>`; identidades observadas            | `READ_ONLY_OBSERVER_TOKEN`; `WORKLOAD_IDENTITY_TOKEN` para el colector                                       | leer y registrar heartbeat, lag, disponibilidad y estado técnico mínimos; emitir señal de salud autorizada                                      | leer payloads empresariales o secretos; mutar trabajos; repetir efectos; ejecutar compensaciones; usar credenciales de los servicios observados   | `DEFINED_NOT_PROVISIONED` |

##### 3.6. Contrato mínimo de identidad por operación

Toda materialización futura deberá poder vincular, cuando aplique:

```text
service_id
contract_id
contract_version
operation_id
operation_type
environment
caller_application
business_owner_application
principal_type
principal_id
credential_reference
credential_version
audience
allowed_actions
resource_scope
tenant_scope
site_scope
device_scope
provider_scope
actor_id
correlation_id
causation_id
request_id
issued_at
expires_at
```

Reglas:

1. `credential_reference` identifica material protegido; nunca contiene el secreto.
2. `principal_id` y `credential_reference` son identidades distintas.
3. `caller_application` debe corresponder a una relación aprobada en `TSVC-CAT-003`.
4. `service_id`, `contract_id` y `contract_version` deben corresponder al contrato de `TSVC-CAT-004`.
5. `allowed_actions` usa una lista cerrada y mínima; no se permite `*`.
6. los scopes no aplicables se omiten o declaran `NO_APLICA`; no se rellenan con acceso global.
7. la expiración es obligatoria para tokens, capacidades y credenciales temporales.
8. las credenciales persistentes deben referenciar versión, custodio, fecha de rotación y estado sin exponer su valor.
9. actor, aplicación, servicio, dispositivo, proveedor y ambiente no pueden inferirse solamente del nombre de una clave.
10. la ausencia de actor humano no elimina la aplicación, regla, evento o proveedor causal.

##### 3.7. Mínimo privilegio

Toda credencial deberá limitar simultáneamente:

```text
QUIÉN
+ QUÉ SERVICIO
+ QUÉ OPERACIÓN
+ QUÉ RECURSO
+ QUÉ AMBIENTE
+ QUÉ TERRITORIO
+ QUÉ DURACIÓN
```

Reglas obligatorias:

1. un principal técnico pertenece a un solo servicio salvo excepción aprobada y demostrable;
2. las credenciales se separan por ambiente;
3. las credenciales de proveedor se separan por proveedor y finalidad;
4. las credenciales de dispositivo se separan por dispositivo;
5. un worker solo puede reclamar y actualizar las unidades de trabajo de su servicio;
6. una credencial de lectura no puede mutar estado;
7. un observador no puede acceder al payload empresarial completo;
8. la operación sensible requiere tanto autenticación técnica como autorización empresarial vigente;
9. conocer un identificador, ruta, topic, queue, bucket o función no concede acceso;
10. la credencial ordinaria no debe poder crear otras credenciales, alterar políticas, desactivar auditoría ni cambiar su propio alcance.

##### 3.8. Regla sobre credenciales amplias

`SUPABASE_SERVICE_ROLE_KEY` no se adopta como credencial ordinaria de ninguno de los diez servicios.

Su uso actual en funciones servidoras se clasifica como:

```text
LEGACY_BROAD_CREDENTIAL
```

Reglas:

1. su presencia actual no demuestra que el servicio transversal esté implementado;
2. no podrá copiarse a clientes, navegadores, aplicaciones móviles, dispositivos, eventos, documentos ni logs;
3. no podrá compartirse entre servicios como identidad técnica común;
4. cualquier permanencia temporal deberá estar acotada a runtime servidor, ambiente y transición aprobada;
5. la implementación futura deberá preferir roles, funciones, grants, RLS, claims, workload identity o endpoints internos de alcance menor;
6. una excepción deberá declarar operación, recursos, motivo, owner, vencimiento, monitoreo, rotación y tarea de retiro;
7. una excepción no convierte la clave amplia en modelo objetivo.

Las claves publicables o anónimas identifican el proyecto o cliente permitido, pero no sustituyen la identidad del actor, la aplicación, el servicio ni la autorización.

##### 3.9. Custodia y exposición

1. ningún valor secreto se almacena en este registro ni en documentación canónica;
2. el repositorio solo conserva nombres de variables, referencias, esquemas y contratos no secretos;
3. los valores se mantienen en un custodio de secretos o mecanismo servidor autorizado;
4. logs, errores, traces, eventos y evidencia deberán aplicar redacción antes de persistir;
5. las credenciales no se transportan en query strings, nombres de archivo, etiquetas, QR, payload empresarial o metadata visible;
6. una URL firmada es una capacidad temporal y debe tratarse como sensible hasta expirar;
7. push tokens, device tokens y direcciones de destino son datos de direccionamiento sensibles, no autorización suficiente;
8. claves privadas, refresh tokens y secretos de proveedor nunca se devuelven al cliente;
9. las referencias de credencial deberán poder rotarse sin cambiar `service_id`, `contract_id` ni identidad empresarial;
10. backups y exportaciones deben excluir valores secretos o conservarlos bajo cifrado y acceso específico.

##### 3.10. Ciclo de vida

| Estado                    | Significado                                                                     |
| ------------------------- | ------------------------------------------------------------------------------- |
| `DEFINED_NOT_PROVISIONED` | Identidad y alcance documentados; no existe evidencia de aprovisionamiento.     |
| `PROVISIONED_INACTIVE`    | Principal o referencia creados, todavía no habilitados para operación.          |
| `ACTIVE`                  | Credencial vigente y habilitada dentro del alcance aprobado.                    |
| `ROTATING`                | Conviven versiones controladas durante una ventana de transición.               |
| `SUSPENDED`               | Uso detenido temporalmente sin destruir evidencia ni identidad.                 |
| `COMPROMISED`             | Existe sospecha o confirmación de exposición; el uso ordinario queda prohibido. |
| `REVOKED`                 | Credencial invalidada y no reutilizable.                                        |
| `RETIRED`                 | Identidad técnica retirada del servicio, preservando historia y referencias.    |

En esta tarea las diez filas permanecen en `DEFINED_NOT_PROVISIONED`.

##### 3.11. Rotación y revocación

Toda implementación futura deberá:

1. versionar referencias de credencial sin exponer valores;
2. permitir coexistencia controlada de versión anterior y nueva cuando el proveedor o despliegue lo requiera;
3. validar la nueva credencial antes de revocar la anterior;
4. fijar una ventana máxima de solapamiento;
5. revocar inmediatamente ante compromiso confirmado cuando la seguridad prevalezca sobre continuidad;
6. registrar causa, owner, ambiente, servicios, consumidores afectados y resultado;
7. impedir reutilización de una credencial revocada;
8. conservar identidad histórica sin conservar el valor secreto en evidencia ordinaria;
9. coordinar rollback mediante reactivación autorizada o emisión de otra versión, nunca mediante publicación del secreto anterior;
10. separar rotación técnica de cambios incompatibles del contrato `TSVC-CAT-004`.

##### 3.12. Identidad de emergencia

`BREAK_GLASS_IDENTITY` solo se permite cuando:

- existe incidente o recuperación documentada;
- una autoridad designada aprueba la activación;
- el alcance, ambiente y duración están limitados;
- la identidad ordinaria no puede resolver el incidente;
- toda acción queda auditada;
- la credencial se revoca o suspende al terminar;
- se realiza revisión posterior y se corrige la causa.

No se permite mantener una credencial de emergencia activa para operación diaria.

##### 3.13. Reconciliación con activos técnicos actuales

| Activo o patrón observado                                                       | Servicio relacionado      | Clasificación                                | Decisión canónica                                                                                                                  |
| ------------------------------------------------------------------------------- | ------------------------- | -------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| Cola de impresión local y ejecución desde navegador                             | `TSVC-SVC-003`            | `LOCAL_WITHOUT_CANONICAL_DEVICE_IDENTITY`    | Conservar como evidencia funcional; la solución objetivo exige identidad de servicio, worker y dispositivo enrolado.               |
| Registro autenticado de tokens push con operación servidora privilegiada        | `TSVC-SVC-004`            | `PARTIAL_WITH_LEGACY_BROAD_CREDENTIAL`       | Conservar actor y registro de destino; sustituir la credencial amplia por alcance técnico menor durante implementación autorizada. |
| Flujos documentales iniciados por usuario                                       | `TSVC-SVC-006`            | `PARTIAL_DELEGATED_FLOW`                     | Conservar identidad delegada; limitar acceso a objeto, finalidad, recurso y expiración.                                            |
| Webhooks con secreto de proveedor y operación servidora privilegiada            | `TSVC-SVC-008`            | `PROVIDER_AUTH_WITH_LEGACY_BROAD_CREDENTIAL` | Conservar verificación de proveedor; separar secreto por proveedor y reemplazar acceso general por privilegios mínimos.            |
| Jobs protegidos por clave compartida de cron y operación servidora privilegiada | `TSVC-SVC-009`            | `SHARED_SECRET_LEGACY_PATTERN`               | Registrar scheduler y regla exactos; preferir identidad de carga o token firmado y retirar la clave global en la fase asignada.    |
| Procesamiento servidor con `SUPABASE_SERVICE_ROLE_KEY`                          | Servicios que lo consuman | `LEGACY_BROAD_CREDENTIAL`                    | No se adopta como identidad transversal común; cada permanencia exige excepción y retiro controlado.                               |

La reconciliación describe evidencia actual. No declara que existan principals mínimos aprovisionados ni que los activos hayan sido migrados.

##### 3.14. Aplicación al carril `NEXO-REMISSIONS-001`

Para el paquete prioritario de remisiones NEXO:

1. `nexo` se identifica como aplicación llamadora o propietaria según la matriz de `TSVC-CAT-003`; no se autentica como `vento-shell`.
2. el backend autoritativo utiliza identidades servidoras; el navegador no recibe credenciales administrativas.
3. cada trabajo asíncrono conserva `nexo`, actor, sede, área, recurso, contrato, correlación y causa.
4. la impresión exige identidad del servicio y del dispositivo enrolado.
5. los archivos o evidencias usan capacidades temporales acotadas al objeto.
6. las notificaciones usan credenciales separadas por canal y ambiente.
7. los schedules usan identidad propia y no una clave global reutilizada por múltiples jobs.
8. el observador de workers conserva privilegio de solo lectura.
9. las tres capacidades condicionales de la matriz no se activan únicamente por existir credenciales.
10. la definición documental no habilita el paquete, no crea secretos y no acredita operación.

##### 3.15. Reconciliación cuantitativa

| Control                                         | Resultado |
| ----------------------------------------------- | --------: |
| Identidades de servicio esperadas               |        10 |
| Identidades de servicio materializadas          |        10 |
| Principals técnicos objetivo únicos             |        10 |
| Servicios con worker dedicado o condicionado    |         8 |
| Servicios con identidad especial de dispositivo |         1 |
| Servicios con identidad especial de proveedor   |         2 |
| Servicios con identidad especial de scheduler   |         1 |
| Servicios con identidad especial de observador  |         1 |
| Servicios en `DEFINED_NOT_PROVISIONED`          |        10 |
| Credenciales reales creadas                     |         0 |
| Valores secretos documentados                   |         0 |
| Identidades faltantes                           |         0 |
| Identidades duplicadas                          |         0 |

Los conteos de identidades adicionales no son excluyentes: un servicio puede requerir runtime, worker y proveedor o dispositivo al mismo tiempo.

##### 3.16. Handoff obligatorio

| Tarea posterior | Insumo recibido de `TSVC-CAT-005`                                                                                                                                             |
| --------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `TSVC-CAT-006`  | Principal por servicio, caller, worker, dispositivo, proveedor y scheduler que deberán participar en idempotencia, claim, reintentos y deduplicación sin compartir autoridad. |
| `TSVC-CAT-007`  | Identidades técnicas que deberán producir métricas, logs, traces y auditoría, con redacción de secretos y separación de payloads.                                             |
| `TSVC-CAT-008`  | Estados de credencial, identidad de emergencia, revocación y alcance mínimo requeridos durante contingencia y degradación.                                                    |
| `TSVC-CAT-009`  | Referencias de credencial, estados e historia que deberán cumplir retención sin preservar valores secretos innecesarios.                                                      |
| `TSVC-CAT-010`  | Patrones legacy, excepciones y principals objetivo que deberán migrarse y retirarse progresivamente.                                                                          |

---

#### 4. Artefactos y entregables

1. `TRANSVERSE-SERVICE-TECHNICAL-IDENTITY-REGISTRY-001@1.0.0`.
2. Catálogo cerrado de ocho clases de identidad técnica.
3. Catálogo cerrado de nueve tipos de credencial mínima.
4. Matriz materializada para `TSVC-SVC-001..010` con principal, credenciales, scope, prohibiciones y estado.
5. Contrato mínimo de identidad por operación.
6. Política canónica de mínimo privilegio, custodia, exposición, rotación y revocación.
7. Clasificación explícita de `SUPABASE_SERVICE_ROLE_KEY` como credencial amplia legacy, no como identidad objetivo.
8. Reconciliación de seis patrones técnicos actuales sin afirmar migración o validación operativa.
9. Aplicación específica al carril `NEXO-REMISSIONS-001`.
10. Handoff cerrado a `TSVC-CAT-006..010`.

---

#### 5. Requisitos de prueba

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea materializa identidades técnicas, credenciales mínimas, separación de responsabilidades y mínimo privilegio para los diez contratos ya gobernados. No crea un dominio de comportamiento nuevo ni modifica los requisitos funcionales, de integración, autorización o seguridad vigentes. Las invariantes quedan cubiertas por los requisitos canónicos ya relacionados por `TSVC-CAT-004`, incluidos `TREQ-PROC-018`, `TREQ-PROC-019`, `TREQ-PROC-023`, `TREQ-PROC-024`, `TREQ-INTEGRATION-003`, `TREQ-INTEGRATION-004` y `TREQ-INTEGRATION-024` a `TREQ-INTEGRATION-053`, además de los requisitos vigentes de seguridad y secretos de la arquitectura Supabase.

La tarea genera:

- requisitos creados: `0`;
- requisitos modificados: `0`;
- requisitos diferidos: `0`;
- requisitos descartados u obsoletos: `0`.

Por tanto, no corresponde generar una nueva copia del registro `04A`.

---

#### 6. Criterios de aceptación

1. `TSVC-CAT-004` figura aprobada y sus diez contratos conservan versión `1.0.0` y estado `DEFINED`.
2. Las diez identidades `TSVC-SVC-001..010` aparecen exactamente una vez en el registro principal.
3. Cada servicio tiene un principal técnico objetivo único por ambiente.
4. Cada servicio declara identidades adicionales únicamente cuando aplican.
5. Cada servicio declara credencial mínima, alcance, prohibiciones y estado.
6. Actor, aplicación llamadora, aplicación propietaria, servicio, worker, dispositivo y proveedor permanecen separados.
7. Ninguna credencial equivale por sí sola a autorización empresarial.
8. No existen comodines de acciones, recursos o ambientes en el modelo objetivo.
9. `SUPABASE_SERVICE_ROLE_KEY` no se adopta como credencial ordinaria ni compartida de los servicios.
10. No se exponen valores secretos, claves privadas, tokens, certificados ni credenciales reales.
11. Push tokens, URLs firmadas y credenciales de dispositivo conservan su clasificación y límites específicos.
12. Se define rotación, revocación, compromiso, suspensión y retiro sin ejecutar operaciones físicas.
13. La identidad de emergencia queda separada, temporal y auditable.
14. Los activos actuales se clasifican como evidencia legacy o parcial, no como cumplimiento objetivo.
15. Las diez identidades permanecen `DEFINED_NOT_PROVISIONED`.
16. El carril NEXO conserva aplicaciones, contratos, actor, dispositivo y scopes sin credenciales administrativas en cliente.
17. Se declaran cero cambios `TREQ-*` con justificación concreta.
18. No se modifican código, configuración, secretos, Supabase, migraciones, funciones, workers, colas, datos ni despliegues.
19. La continuidad reserva exclusivamente `TSVC-CAT-006`.

---

#### 7. Dependencias y entradas

##### 7.1. Fuentes canónicas

- `docs/plan-canonico/modular/01_PROTOCOLO.md`;
- `docs/plan-canonico/modular/delivery-contract.json`;
- `docs/plan-canonico/modular/execution-route.json`;
- `docs/plan-canonico/modular/priority-route-progress.json`;
- `docs/plan-canonico/modular/active-sequence.json`;
- `docs/plan-canonico/modular/continuity-route.json`;
- `docs/plan-canonico/modular/priority-delivery-lanes.json`;
- `docs/plan-canonico/modular/bloques/C_CATALOGO/01_APLICACIONES_Y_CONVENCION.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/00_INTRO.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/01_PRINCIPIO_DE_PROPIEDAD.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/02_CATALOGO_DE_SERVICIOS_TRANSVERSALES.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/03_INFRAESTRUCTURA_CANONICA_DE_COLAS.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/05_NOTIFICACIONES_Y_ALERTAS.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/06_ARCHIVOS_DOCUMENTOS_Y_EVIDENCIA.md`;
- `docs/plan-canonico/modular/bloques/E3_SUPABASE/06_01_SUPA_TRANS_001.md`;
- `docs/plan-canonico/modular/bloques/E1_DESCUBRIMIENTO_OPERATIVO/04_04_VALIDACION_TECNICA_SEGURIDAD_RESILIENCIA_Y_BACKLOG.md`;
- `docs/plan-canonico/modular/bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`;
- `package.json` y scripts documentales aplicables;
- código vigente de Edge Functions y activos parciales consumidos para clasificar patrones actuales, sin alterar su implementación.

##### 7.2. Dependencias aprobadas inmediatas

- `TSVC-CAT-001 — Inventariar servicios transversales actuales y faltantes`.
- `TSVC-CAT-002 — Definir propietario técnico y gobierno de cada servicio`.
- `TSVC-CAT-003 — Definir aplicaciones productoras y consumidoras`.
- `TSVC-CAT-004 — Definir contrato, versión y compatibilidad`.

##### 7.3. Restricción de evidencia

Este registro no demuestra:

- principal aprovisionado;
- rol o grant implementado;
- secreto creado o rotado;
- certificado emitido;
- credencial activa;
- política RLS aplicada;
- worker desplegado;
- proveedor autenticado en producción;
- dispositivo enrolado;
- validación remota, operativa o de dispositivo;
- retiro de credenciales legacy.

Todas esas afirmaciones requieren implementación y evidencia de las tareas y paquetes propietarios.

---

#### 8. Continuidad canónica del bloque

```text
ÚLTIMA TAREA APROBADA
TSVC-CAT-004 — Definir contrato, versión y compatibilidad
        ↓
TAREA ACTUAL APROBADA
TSVC-CAT-005 — Definir identidad técnica y credenciales mínimas
        ↓
SIGUIENTE TAREA RESERVADA
TSVC-CAT-006 — Definir idempotencia, reintentos y deduplicación
```


### ✅ TSVC-CAT-006 — Definir idempotencia, reintentos y deduplicación

**Estado:** APROBADA

**Tarea anterior:** `TSVC-CAT-005 — Definir identidad técnica y credenciales mínimas`

**Tarea siguiente:** `TSVC-CAT-007 — Definir observabilidad, métricas, alertas y auditoría`

**Tipo de tarea:** definición documental canónica de idempotencia, deduplicación, reintentos, backoff, resultado desconocido y recuperación para servicios transversales

**Fase:** definición documental vinculante; implementación física, aprovisionamiento y despliegue no autorizados

**Repositorio propietario:** `devVentoGroup/vento-shell`

**Fecha de corte:** `2026-08-02`

**Cambios en código, migraciones, funciones, workers, colas, proveedores, dispositivos, despliegues, datos o Supabase:** no autorizados ni realizados

---

#### 1. Resultado material

Esta tarea materializa el registro canónico:

```text
TRANSVERSE-SERVICE-RELIABILITY-REGISTRY-001@1.0.0
```

El registro define, para cada una de las diez identidades `TSVC-SVC-001..010`:

1. la intención idempotente y su ámbito de unicidad;
2. la clave de deduplicación de transporte o entrega;
3. la huella canónica del contenido que permite distinguir repetición válida de conflicto;
4. el comportamiento ante solicitudes nuevas, duplicadas, concurrentes, tardías o incompatibles;
5. el perfil de reintento, presupuesto de intentos, backoff, jitter y deadline;
6. la clasificación entre error reintentable, error terminal, bloqueo y resultado desconocido;
7. la recuperación del resultado previo sin repetir el efecto empresarial, técnico o físico;
8. la relación entre principal llamador, identidad del servicio, worker, dispositivo, proveedor y scheduler;
9. la transición hacia conciliación, cuarentena o dead-letter cuando la ejecución no puede cerrarse automáticamente;
10. el handoff obligatorio hacia observabilidad, contingencia, retención y adopción progresiva.

La garantía base es:

```text
ENTREGA AL MENOS UNA VEZ
+
EFECTOS IDEMPOTENTES
+
DEDUPLICACIÓN EXPLÍCITA
+
RESULTADO RECUPERABLE
```

No se declara garantía de ejecución exactamente una vez. La no duplicidad observable se obtiene mediante claves estables, reserva atómica de intención, control de concurrencia, recuperación del resultado previo y conciliación de efectos ambiguos.

---

#### 2. Alcance

La tarea abarca exactamente estas diez identidades:

1. `TSVC-SVC-001` — Orquestación genérica de trabajos asíncronos.
2. `TSVC-SVC-002` — Entrega transaccional de eventos y outbox.
3. `TSVC-SVC-003` — Impresión centralizada.
4. `TSVC-SVC-004` — Notificaciones y alertas.
5. `TSVC-SVC-005` — Generación de documentos.
6. `TSVC-SVC-006` — Custodia de archivos y documentos originales.
7. `TSVC-SVC-007` — Evidencia transaccional.
8. `TSVC-SVC-008` — Integraciones externas y webhooks.
9. `TSVC-SVC-009` — Programación y automatizaciones recurrentes.
10. `TSVC-SVC-010` — Monitoreo y heartbeat de workers.

La tarea conserva sin modificación:

- las diez identidades y su clasificación material aprobadas en `TSVC-CAT-001`;
- el propietario técnico institucional definido en `TSVC-CAT-002`;
- la matriz de cien decisiones aplicación–servicio aprobada en `TSVC-CAT-003`;
- los diez contratos `TSVC-SVC-001.CONTRACT` a `TSVC-SVC-010.CONTRACT`, todos en versión inicial `1.0.0`;
- las identidades técnicas, clases de credencial y límites de mínimo privilegio de `TSVC-CAT-005`;
- la autoridad empresarial de la aplicación propietaria del resultado;
- la separación entre solicitud, acuse técnico, ejecución, resultado empresarial y evidencia física;
- la obligación de materializar cualquier modificación futura de Supabase perteneciente a VENTO desde `vento-shell` y únicamente durante una fase autorizada.

Quedan fuera del alcance:

- crear tablas, índices, constraints, funciones, triggers, colas, topics, buckets, workers, endpoints, adaptadores, secrets o credenciales;
- ejecutar DDL, DML, migraciones, backfills, despliegues, conciliaciones productivas o pruebas con proveedores y dispositivos;
- seleccionar una tecnología física de mensajería o scheduler;
- definir métricas, umbrales, alertas, trazas y auditoría operativa, responsabilidad de `TSVC-CAT-007`;
- definir operación degradada, fallback y recuperación empresarial, responsabilidad de `TSVC-CAT-008`;
- definir retención, archivado y limpieza de intentos, resultados y dead-letter, responsabilidad de `TSVC-CAT-009`;
- definir adopción, coexistencia y retiro de activos legacy, responsabilidad de `TSVC-CAT-010`;
- afirmar que los mecanismos documentados están implementados, desplegados o validados operativamente.

---

#### 3. Decisiones aprobadas

##### 3.1. Identidad del registro

| Campo                  | Valor                                         |
| ---------------------- | --------------------------------------------- |
| `registry_id`          | `TRANSVERSE-SERVICE-RELIABILITY-REGISTRY-001` |
| `registry_version`     | `1.0.0`                                       |
| `registry_status`      | `DEFINED`                                     |
| `covered_services`     | `10`                                          |
| `base_delivery_model`  | `AT_LEAST_ONCE_WITH_IDEMPOTENT_EFFECTS`       |
| `exactly_once_claim`   | `PROHIBITED_WITHOUT_END_TO_END_EVIDENCE`      |
| `technical_owner`      | Tecnología de Vento Group                     |
| `canonical_repository` | `vento-shell`                                 |
| `governing_task`       | `TSVC-CAT-006`                                |

`DEFINED` significa que las reglas documentales están cerradas para las diez identidades. No significa que exista persistencia, constraint, worker, política de proveedor, dispositivo o evidencia de ejecución.

##### 3.2. Vocabulario canónico

| Término                | Definición canónica                                                                                                                                                 |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `operation_id`         | Identificador único de una operación registrada. No se reutiliza para otra operación.                                                                               |
| `idempotency_key`      | Identificador estable de una misma intención empresarial o técnica. Se crea antes del primer envío y permanece en todos sus reintentos y handoffs técnicos.         |
| `deduplication_key`    | Identificador estable de un mensaje, evento, entrega, archivo, evidencia, ocurrencia o señal usado para detectar repetición del mismo elemento transportado.        |
| `payload_fingerprint`  | Huella `SHA-256` del contenido canónico normalizado que determina si dos usos de la misma clave representan exactamente la misma intención.                         |
| `attempt_id`           | Identificador único de una ejecución concreta. Cada intento recibe uno nuevo.                                                                                       |
| `attempt_no`           | Número ordinal del intento; comienza en `1`.                                                                                                                        |
| `retry_count`          | Cantidad de reintentos ya iniciados; equivale a `attempt_no - 1`.                                                                                                   |
| `result_ref`           | Referencia estable al resultado autoritativo previamente producido o conciliado.                                                                                    |
| `receipt_id`           | Acuse consultable de que la intención fue recibida o reservada; no prueba el efecto empresarial ni físico.                                                          |
| `correlation_id`       | Identificador que agrupa operaciones relacionadas dentro de una misma coordinación.                                                                                 |
| `causation_id`         | Identificador de la solicitud, evento u operación que causó directamente la operación actual.                                                                       |
| `lease_token`          | Identificador temporal de reclamación de trabajo. No reemplaza la identidad del worker ni concede autoridad empresarial.                                            |
| `fencing_token`        | Valor monotónico o versión equivalente que impide que un worker con lease vencido cierre o sobrescriba trabajo reclamado posteriormente por otro worker.            |
| `RESULT_UNKNOWN`       | Estado en el que la solicitud pudo haber producido efecto, pero no existe todavía confirmación suficiente para declararla exitosa, fallida o segura para repetir.   |
| `IDEMPOTENCY_CONFLICT` | Resultado terminal al reutilizar una clave con una huella, contrato, propietario, recurso o intención incompatible.                                                 |
| `DEAD_LETTER`          | Estado de aislamiento de una unidad no procesable automáticamente después de agotar política o detectar mensaje venenoso, sin convertirlo en resultado empresarial. |

Reglas obligatorias:

1. `operation_id`, `idempotency_key`, `attempt_id`, `correlation_id` y `causation_id` cumplen funciones distintas y no pueden reemplazarse entre sí.
2. La clave idempotente se genera en el límite que conoce la intención, no dentro de un worker después de comenzar el efecto.
3. Un reintento de la misma intención conserva `idempotency_key`, `payload_fingerprint`, contrato, propietario y recurso.
4. Una intención nueva utiliza una clave nueva, aunque se origine desde la misma pantalla, usuario, cron, documento o proveedor.
5. La huella excluye campos volátiles que no cambian la intención, como `attempt_id`, `attempt_no`, tiempos de recepción, tokens de autenticación y metadata técnica de transporte.
6. La huella incluye todos los campos cuyo cambio pueda alterar destinatario, recurso, cantidad, versión, plantilla, proveedor, dispositivo, finalidad, resultado o efecto.
7. El algoritmo de normalización y su versión deberán estar identificados cuando se implemente; una modificación incompatible del algoritmo exige transición versionada.
8. No se acepta una clave vacía, derivada únicamente de un timestamp no estable, generada de nuevo en cada reintento ni compartida entre intenciones distintas.

##### 3.3. Sobre mínimo de confiabilidad

Toda materialización futura deberá poder conservar, cuando aplique:

```text
service_id
contract_id
contract_version
operation_id
operation_type
idempotency_key
idempotency_scope
payload_fingerprint
fingerprint_version
deduplication_key
correlation_id
causation_id
attempt_id
attempt_no
retry_count
max_attempts
retry_profile
first_requested_at
last_attempt_at
next_retry_at
deadline_at
producer_application
business_owner_application
caller_identity
service_principal_id
worker_identity
device_identity
provider_identity
scheduler_identity
lease_token
fencing_token
row_version
operation_status
receipt_id
result_ref
error_code
retryable
reconciliation_status
```

Reglas:

1. los campos no aplicables permanecen ausentes o `NO_APLICA`; no se inventan identidades;
2. el actor y la aplicación originadora permanecen trazables durante todos los intentos;
3. el worker usa la identidad técnica de `TSVC-CAT-005` y no conserva como credencial persistente el token del actor;
4. `result_ref` apunta al resultado autoritativo y no a un log, spinner, acuse o respuesta transitoria;
5. un cambio de contrato, propietario, recurso o payload material no puede ocultarse bajo la misma clave;
6. `next_retry_at` solo existe cuando el error es reintentable, queda presupuesto y no venció el deadline;
7. el sobre permite reconstruir la secuencia sin copiar secretos ni payloads sensibles completos a logs o dead-letter.

##### 3.4. Reserva idempotente y recuperación del resultado

La aceptación de una intención deberá comportarse conceptualmente así:

```text
RECIBIR INTENCIÓN
      ↓
VALIDAR CONTRATO, IDENTIDAD, AUTORIDAD Y ÁMBITO
      ↓
CALCULAR HUELLA CANÓNICA
      ↓
RESERVAR CLAVE DE FORMA ATÓMICA
      ↓
┌────────────────────────────────────────────────────┐
│ NUEVA CLAVE        → crear receipt y continuar     │
│ MISMA HUELLA       → devolver estado/resultado     │
│ HUELLA DIFERENTE   → IDEMPOTENCY_CONFLICT          │
└────────────────────────────────────────────────────┘
```

Reglas obligatorias:

1. La comprobación y reserva de la clave forman una sola operación atómica o un mecanismo equivalente que impida dos ganadores.
2. Dos solicitudes concurrentes con la misma clave y huella resuelven a una sola intención registrada.
3. La solicitud duplicada no crea otro trabajo, evento, impresión, notificación, documento, archivo, evidencia, integración, ocurrencia o señal.
4. Si la intención sigue activa, la repetición devuelve el mismo `receipt_id`, estado y referencia de consulta.
5. Si terminó correctamente, la repetición devuelve o referencia el mismo resultado autoritativo.
6. Si terminó con error no reintentable, la repetición devuelve el mismo error terminal y no reinicia la operación.
7. Si el resultado permanece desconocido, la repetición entra en consulta o conciliación; no crea automáticamente otra intención.
8. Reutilizar la misma clave con huella incompatible produce `IDEMPOTENCY_CONFLICT`, queda registrado y no se corrige reemplazando silenciosamente el payload previo.
9. Una operación terminal no se reabre mediante un nuevo intento; una acción empresarial realmente nueva debe usar otra clave y vincularse con la anterior cuando corresponda.
10. La caducidad de una clave no autoriza su reutilización con otro significado. Las políticas de conservación se definirán en `TSVC-CAT-009` preservando la identidad histórica necesaria.

##### 3.5. Resultados cerrados de deduplicación

| Resultado                   | Significado                                                                                    | Respuesta obligatoria                                                                                               |
| --------------------------- | ---------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| `NEW_INTENTION`             | No existe una intención previa dentro del ámbito de unicidad.                                  | Reservar una sola vez, crear `receipt_id` y continuar.                                                              |
| `DUPLICATE_IN_PROGRESS`     | Existe la misma clave y huella en estado no terminal.                                          | Devolver el mismo receipt, estado y próxima condición de consulta; no encolar otra unidad.                          |
| `DUPLICATE_SUCCEEDED`       | La misma intención ya produjo resultado válido.                                                | Devolver `result_ref` o una proyección equivalente; no repetir el efecto.                                           |
| `DUPLICATE_FAILED_TERMINAL` | La misma intención terminó con error no reintentable o presupuesto agotado.                    | Devolver el error y estado previos; una nueva intención exige nueva clave.                                          |
| `IDEMPOTENCY_CONFLICT`      | La clave fue reutilizada con huella, contrato, recurso, propietario o finalidad incompatibles. | Rechazar, conservar evidencia del conflicto y no ejecutar.                                                          |
| `RESULT_UNKNOWN`            | El efecto pudo ocurrir, pero no existe confirmación autoritativa suficiente.                   | Consultar proveedor, dispositivo, registro o fuente de verdad; no repetir ciegamente.                               |
| `STALE_OR_OUT_OF_ORDER`     | El mensaje o señal es anterior a una versión ya aceptada o rompe orden causal obligatorio.     | Bloquear, ignorar de forma registrada o enviar a conciliación según contrato; nunca sobrescribir una versión nueva. |
| `POISON_OR_UNPROCESSABLE`   | El elemento no puede procesarse de forma segura con el contrato vigente.                       | Aislar en cuarentena o dead-letter sin marcar resultado empresarial.                                                |

##### 3.6. Perfiles canónicos de reintento

| Perfil                     | Uso objetivo                                                                                            | Máximo de intentos | Secuencia base de espera después del primer fallo | Disposición al agotar                              |
| -------------------------- | ------------------------------------------------------------------------------------------------------- | -----------------: | ------------------------------------------------- | -------------------------------------------------- |
| `RR0_NO_RETRY`             | Validación, autorización, conflicto, contrato incompatible, rechazo empresarial o señal obsoleta.       |                  1 | no aplica                                         | error terminal                                     |
| `RR1_SHORT_TRANSIENT`      | Fallo técnico breve, lock transitorio, runtime reiniciado o dependencia interna momentánea.             |                  4 | `5 s`, `30 s`, `2 min`                            | dead-letter o terminal según contrato              |
| `RR2_DURABLE_DELIVERY`     | Outbox, notificación, integración o entrega durable que tolera espera.                                  |                  7 | `15 s`, `1 min`, `5 min`, `15 min`, `1 h`, `6 h`  | dead-letter y conciliación                         |
| `RR3_DEVICE_OR_OFFLINE`    | Dispositivo, periférico, carga de archivo o captura local con conectividad intermitente.                |                  6 | `10 s`, `1 min`, `5 min`, `30 min`, `2 h`         | bloqueo o conciliación; no repetición física ciega |
| `RR4_SCHEDULED_OCCURRENCE` | Ejecución de una ocurrencia lógica de schedule.                                                         |                  4 | `30 s`, `2 min`, `10 min`                         | ocurrencia fallida o conciliación                  |
| `RR5_COALESCING_SIGNAL`    | Heartbeat o señal de salud donde una señal más reciente sustituye la necesidad de reenviar una antigua. |                  1 | no aplica                                         | señal vencida u omitida de forma registrada        |

Reglas obligatorias:

1. `max_attempts` incluye el primer intento; `max_retries = max_attempts - 1`.
2. Todo backoff aplica jitter acotado y determinista o aleatorio seguro para evitar reintentos sincronizados.
3. Un proveedor que responda `Retry-After` o equivalente puede ampliar la espera, pero no el deadline ni el presupuesto sin una decisión versionada.
4. La espera nunca se reduce a un loop inmediato.
5. El tiempo offline o de dispositivo no disponible no consume intentos mientras no se haya iniciado una nueva llamada o ejecución.
6. Un error de validación, autorización, contrato, conflicto idempotente, recurso inexistente definitivo o rechazo empresarial no se convierte en transitorio por repetición.
7. La pérdida de lease permite otro claim de la misma intención, pero no crea una intención nueva ni autoriza al worker vencido a cerrar.
8. El reintento conserva payload y huella. Corregir el contenido es una nueva intención o una operación de corrección explícita.
9. El deadline prevalece sobre el presupuesto de intentos.
10. Una operación cancelada, vencida o revocada no puede producir efectos tardíos ordinarios; cualquier resultado tardío entra en conciliación.
11. La aplicación propietaria puede definir un perfil más restrictivo por operación. Ampliar intentos, deadline o clases reintentables exige contrato versionado y evidencia de seguridad.

##### 3.7. Clasificación canónica de errores

| Clase                             | Reintentable | Tratamiento                                                                            |
| --------------------------------- | ------------ | -------------------------------------------------------------------------------------- |
| `VALIDATION_ERROR`                | no           | corregir mediante nueva intención; no repetir el mismo payload inválido                |
| `AUTHENTICATION_OR_AUTHORIZATION` | no           | bloquear; renovar identidad o autoridad no convierte el intento anterior en ejecutable |
| `CONTRACT_OR_VERSION_ERROR`       | no           | rechazar; adaptar o publicar compatibilidad mediante contrato versionado               |
| `IDEMPOTENCY_CONFLICT`            | no           | conservar conflicto; no sobrescribir ni aceptar el segundo contenido                   |
| `BUSINESS_REJECTION`              | no           | devolver decisión propietaria; una nueva solicitud requiere nueva intención            |
| `TRANSIENT_INTERNAL`              | sí           | aplicar perfil asignado y conservar la misma clave                                     |
| `THROTTLED`                       | sí           | respetar `Retry-After`, rate limit, deadline y presupuesto                             |
| `DEPENDENCY_UNAVAILABLE`          | sí           | backoff, circuit breaker cuando aplique y no ampliar autoridad                         |
| `LEASE_LOST`                      | sí           | abandonar el intento; otro worker puede reclamar con fencing vigente                   |
| `OFFLINE_OR_DEVICE_UNREACHABLE`   | diferido     | esperar conectividad o disponibilidad; no consumir intentos sin ejecución              |
| `AMBIGUOUS_EXTERNAL_EFFECT`       | no directo   | `RESULT_UNKNOWN`; consultar y conciliar antes de decidir reintento                     |
| `AMBIGUOUS_PHYSICAL_EFFECT`       | no directo   | `RESULT_UNKNOWN`; inspección o confirmación física antes de repetir                    |
| `DEADLINE_EXCEEDED`               | no           | cerrar como vencido o enviar a conciliación según contrato                             |
| `POISON_MESSAGE`                  | no           | aislar; no reiterar automáticamente un elemento determinísticamente no procesable      |

##### 3.8. Registro canónico por servicio

| Servicio       | Intención y ámbito de unicidad                                                                                                   | Clave de deduplicación                                 | Perfil base                | Decisión ante repetición o ambigüedad                                                                                                                                                     | Estado material |
| -------------- | -------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------ | -------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------- |
| `TSVC-SVC-001` | `service_id + producer_application + operation_type + business_reference + idempotency_key`                                      | `operation_id`                                         | `RR2_DURABLE_DELIVERY`     | La misma intención devuelve el mismo trabajo, receipt y resultado. Dos claims concurrentes usan lease y fencing; agotamiento termina en dead-letter o error terminal sin duplicar efecto. | `ESPECIFICADO`  |
| `TSVC-SVC-002` | `producer_application + event_id`; `event_id` es inmutable y pertenece a un solo hecho empresarial                               | `event_id`                                             | `RR2_DURABLE_DELIVERY`     | Registrar y entregar al menos una vez; productores no recrean el evento y consumidores deduplican por `event_id`. Una versión de agregado tardía no sobrescribe una posterior.            | `ESPECIFICADO`  |
| `TSVC-SVC-003` | `business_owner_application + document_or_command_reference + version + print_purpose + authorized_copy_identity`                | `print_job_id` y receipt del adaptador                 | `RR3_DEVICE_OR_OFFLINE`    | Antes de aceptación del periférico puede reintentarse. Después de aceptación ambigua queda `RESULT_UNKNOWN`; una reimpresión intencional usa nueva clave, motivo, autoridad y vínculo.    | `ESPECIFICADO`  |
| `TSVC-SVC-004` | `business_owner_application + notification_reference + template_version + recipient + channel + purpose`                         | `notification_job_id`; ID del proveedor cuando exista  | `RR2_DURABLE_DELIVERY`     | El duplicado devuelve el mismo estado. Un fallback de canal permanece bajo la misma intención, pero cada entrega por canal tiene identidad propia; un acuse incierto exige consulta.      | `ESPECIFICADO`  |
| `TSVC-SVC-005` | `business_owner_application + source_reference + source_version + template_id + template_version + output_purpose`               | `document_generation_job_id`                           | `RR1_SHORT_TRANSIENT`      | La misma fuente, plantilla y finalidad recuperan el mismo documento o resultado. Cambiar fuente, plantilla o finalidad crea una intención nueva y no reescribe el artefacto previo.       | `ESPECIFICADO`  |
| `TSVC-SVC-006` | `business_owner_application + resource_reference + ingest_purpose + content_hash + source_identity`                              | `file_operation_id` y `content_hash` dentro del ámbito | `RR3_DEVICE_OR_OFFLINE`    | Repetir la misma carga recupera el mismo registro. El hash no deduplica globalmente archivos válidos de recursos distintos. Misma clave con otro contenido produce conflicto.             | `ESPECIFICADO`  |
| `TSVC-SVC-007` | `business_owner_application + business_event_reference + evidence_type + capture_sequence + content_hash`                        | `evidence_operation_id` y hash dentro del hecho        | `RR3_DEVICE_OR_OFFLINE`    | La evidencia idéntica del mismo hecho devuelve la referencia existente. Una corrección crea nueva evidencia vinculada; nunca sobrescribe la original ni duplica el hecho probado.         | `ESPECIFICADO`  |
| `TSVC-SVC-008` | Entrante: `provider_identity + provider_event_id`; saliente: `owner + business_reference + provider + contract_version + key`    | ID externo y `integration_operation_id`                | `RR2_DURABLE_DELIVERY`     | Replays entrantes devuelven el mismo acuse sin segundo efecto. Timeout posterior al envío queda `RESULT_UNKNOWN` y exige consulta o conciliación con proveedor antes de reenviar.         | `ESPECIFICADO`  |
| `TSVC-SVC-009` | Definición: `owner + schedule_id + schedule_version`; ocurrencia: `owner + schedule_id + logical_fire_at_utc + contract_version` | `schedule_occurrence_id`                               | `RR4_SCHEDULED_OCCURRENCE` | Una ocurrencia lógica se ejecuta una sola vez de forma observable. Misfire y reintento conservan la misma clave; ejecución manual usa nueva clave vinculada a la ocurrencia original.     | `ESPECIFICADO`  |
| `TSVC-SVC-010` | `worker_identity + boot_id + heartbeat_sequence`; el estado agregado usa versión monotónica del worker                           | `worker_identity + boot_id + sequence`                 | `RR5_COALESCING_SIGNAL`    | Señales repetidas o antiguas no crean efectos empresariales ni degradan un estado más nuevo. La ausencia se evalúa por ventana; no se reenvía un heartbeat vencido.                       | `ESPECIFICADO`  |

##### 3.9. Reglas específicas de claves y huellas

1. `TSVC-SVC-001`: la aplicación llamadora crea la clave antes de someter el trabajo; el worker no puede sustituirla por su `attempt_id`.
2. `TSVC-SVC-002`: `event_id` identifica el hecho publicado y es simultáneamente la frontera principal de deduplicación; cada consumidora conserva su propio estado de consumo.
3. `TSVC-SVC-003`: la identidad de copia autorizada distingue original, copia controlada, reimpresión y prueba técnica. Pulsar nuevamente no crea automáticamente una copia distinta.
4. `TSVC-SVC-004`: destinatario, canal, plantilla, versión y finalidad forman parte de la huella; cambiar destinatario o contenido material requiere otra intención.
5. `TSVC-SVC-005`: una generación determinista puede reutilizar el resultado; una generación no determinista debe congelar snapshot, plantilla y parámetros antes de calcular la huella.
6. `TSVC-SVC-006`: `content_hash` confirma identidad de bytes, pero no sustituye recurso, clasificación, versión, procedencia ni finalidad.
7. `TSVC-SVC-007`: una evidencia idéntica puede estar legítimamente vinculada a hechos diferentes; la deduplicación se limita al hecho, tipo y secuencia declarados.
8. `TSVC-SVC-008`: el identificador del proveedor prevalece para replay entrante; cuando el proveedor no lo suministre, el adaptador deberá construir una clave determinista a partir del contrato y campos estables aprobados.
9. `TSVC-SVC-009`: `logical_fire_at_utc` representa la ocurrencia prevista, no la hora real en que un worker logró ejecutarla.
10. `TSVC-SVC-010`: `boot_id` separa reinicios del worker y `heartbeat_sequence` debe ser monotónico dentro de ese arranque.

##### 3.10. Ciclo de vida de la operación reintentable

```text
RECEIVED
   ↓
RESERVED
   ↓
CLAIMED
   ↓
EXECUTING
   ├──────────────→ SUCCEEDED
   ├─ error transitorio → RETRY_SCHEDULED → CLAIMED
   ├─ efecto ambiguo ───→ RESULT_UNKNOWN → RECONCILING
   │                                           ├→ SUCCEEDED
   │                                           ├→ RETRY_SCHEDULED
   │                                           └→ FAILED_TERMINAL
   ├─ error no reintentable ──────────────────→ FAILED_TERMINAL
   └─ presupuesto agotado ────────────────────→ DEAD_LETTER
```

Estados adicionales permitidos:

| Estado             | Regla                                                                                                                                                          |
| ------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `BLOCKED`          | Existe una condición concreta que impide ejecutar, como autoridad expirada, dependencia causal o dispositivo no disponible; no consume intentos sin ejecución. |
| `CANCEL_REQUESTED` | La propietaria solicitó cancelar; no implica que el worker ya se detuvo.                                                                                       |
| `CANCELLED`        | Se confirmó que no habrá efecto ordinario posterior; un resultado tardío entra en conciliación.                                                                |
| `EXPIRED`          | El deadline venció; no se inician nuevos intentos.                                                                                                             |
| `QUARANTINED`      | Existe conflicto, orden inválido, contrato desconocido o mensaje venenoso que requiere revisión controlada.                                                    |
| `DEAD_LETTER`      | Se agotó el tratamiento automático sin declarar resultado empresarial.                                                                                         |

Reglas:

1. Solo un estado terminal puede cerrar la unidad de trabajo.
2. `RETRY_SCHEDULED` exige `next_retry_at`, clase de error y presupuesto restante.
3. `RESULT_UNKNOWN` no es equivalente a fallo y prohíbe una nueva intención automática.
4. `DEAD_LETTER` no equivale a cancelación, rechazo empresarial ni éxito parcial.
5. La recuperación manual o automática conserva la misma intención y agrega un nuevo intento; no reescribe intentos previos.
6. Los efectos parciales se concilian por componente y no se ocultan bajo un único estado exitoso.

##### 3.11. Claim, lease, concurrencia y fencing

Toda implementación futura de trabajo reclamable deberá cumplir:

1. un claim selecciona y reserva de forma atómica una unidad elegible;
2. el claim identifica servicio, worker, lease, vencimiento y fencing vigente;
3. dos workers no pueden poseer simultáneamente autoridad válida para cerrar la misma versión de trabajo;
4. renovar lease no incrementa `attempt_no` mientras continúe la misma ejecución;
5. perder lease obliga al worker a detener cierre y mutaciones posteriores;
6. un worker tardío no puede sobrescribir el resultado de otro claim con fencing más reciente;
7. la reaparición de una unidad por lease vencido conserva la misma clave idempotente;
8. el efecto empresarial externo debe incluir clave o referencia que permita deduplicar aunque el worker pierda la respuesta;
9. el orden obligatorio se controla por recurso, agregado, versión, dependencia u ocurrencia, no por hora de llegada aislada;
10. la prioridad puede cambiar orden entre unidades independientes, pero nunca romper causalidad ni dependencia;
11. no se usa `last write wins` para resolver estados, cantidades, versiones, custodia, pagos, documentos, evidencia o efectos empresariales;
12. un conflicto concurrente se rechaza o concilia explícitamente.

##### 3.12. Identidad y autorización durante reintentos

1. Cada intento registra `caller_identity`, `service_principal_id`, `worker_identity` y las identidades adicionales aplicables de `TSVC-CAT-005`.
2. La identidad del worker no sustituye actor, aplicación originadora, recurso, alcance ni autoridad empresarial.
3. Un token delegado de usuario no se conserva como credencial persistente del worker.
4. Antes de un efecto sensible, el reintento revalida contrato, recurso, estado, deadline, cancelación y autoridad vigente cuando corresponda.
5. Un cambio de actor, permiso, sede, área, dispositivo, proveedor o política puede convertir la unidad en `BLOCKED` o terminal; no habilita ejecución bajo el contexto anterior.
6. Una rotación de credencial no cambia la clave idempotente ni el significado de la intención.
7. Un reintento nunca utiliza `SUPABASE_SERVICE_ROLE_KEY` como justificación de autoridad empresarial ni como identidad transversal compartida.
8. La recuperación de emergencia conserva la intención, agrega identidad y autorización de emergencia y no borra los intentos ordinarios.

##### 3.13. Conciliación de efectos ambiguos

Se exige conciliación antes de repetir cuando exista posibilidad material de que el efecto ocurrió y se perdió la respuesta, incluyendo:

- proveedor externo que recibió la solicitud, pero no devolvió respuesta concluyente;
- impresora o periférico que pudo aceptar el trabajo;
- upload cuyo objeto pudo persistirse sin que se confirmara el registro asociado;
- generación de documento que pudo crear artefacto antes de fallar la respuesta;
- webhook aceptado cuyo procesamiento interno no tiene resultado confirmado;
- schedule que pudo iniciar trabajo antes de perder lease;
- worker que cerró el efecto externo, pero no logró persistir el resultado local.

La conciliación deberá:

1. consultar por clave, identificador externo, receipt, hash, versión o referencia autoritativa;
2. distinguir no ejecutado, ejecutado, parcialmente ejecutado, ejecutado con resultado incompatible y no determinable;
3. recuperar el resultado existente cuando sea compatible;
4. completar únicamente componentes faltantes de forma idempotente;
5. bloquear repetición destructiva o física cuando no pueda demostrarse seguridad;
6. registrar la decisión y preservar los intentos anteriores;
7. escalar a la aplicación propietaria cuando el resultado empresarial no pueda inferirse desde el servicio técnico.

##### 3.14. Reconciliación con activos técnicos actuales

| Activo o patrón observado                    | Servicio relacionado | Clasificación de confiabilidad                      | Decisión canónica                                                                                                                                     |
| -------------------------------------------- | -------------------- | --------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| Cola de impresión local en navegador         | `TSVC-SVC-003`       | `PARTIAL_WITHOUT_TRANSVERSE_IDEMPOTENCY`            | Conservar como evidencia funcional; no acredita reserva atómica, lease, recuperación de resultado ni protección extremo a extremo contra copias.      |
| Registro autenticado de tokens push          | `TSVC-SVC-004`       | `ADDRESSING_ASSET_NOT_DELIVERY_RELIABILITY`         | Conservar como activo de direccionamiento; no demuestra cola, deduplicación, reintento, receipt ni resultado de entrega.                              |
| Flujo de carga documental por aplicación     | `TSVC-SVC-006`       | `PARTIAL_APPLICATION_SCOPED_INGEST`                 | Conservar carga y metadatos compatibles; la adopción futura deberá añadir ámbito, hash, receipt, conflicto y recuperación sin deduplicar globalmente. |
| Webhooks específicos de pagos y RevenueCat   | `TSVC-SVC-008`       | `PROVIDER_SPECIFIC_PARTIAL_RELIABILITY`             | Conservar identificadores y verificaciones existentes cuando sean compatibles; no asumir que constituyen el servicio transversal completo.            |
| Procesamiento servidor con credencial amplia | servicios aplicables | `LEGACY_BROAD_CREDENTIAL_WITHOUT_RELIABILITY_PROOF` | No se acepta como sustituto de clave idempotente, claim, lease, fencing, deduplicación, resultado recuperable ni autorización empresarial.            |

La reconciliación describe el estado documental conocido. No declara que los activos hayan sido migrados, endurecidos o probados con fallos.

##### 3.15. Aplicación al carril `NEXO-REMISSIONS-001`

Para el paquete prioritario de remisiones NEXO:

1. NEXO conserva la fuente de verdad del proceso y de sus cantidades; el servicio transversal no crea estados empresariales paralelos.
2. Cada comando asíncrono conserva aplicación, proceso, instancia, remisión, línea, versión, actor, sede, área, recurso, correlación y clave idempotente.
3. Repetir creación, preparación, impresión, evidencia o entrega técnica no duplica reservas, movimientos, documentos, etiquetas ni cierres.
4. Un trabajo de impresión conserva propósito, versión e identidad de copia. La reimpresión requiere nueva intención, motivo y autoridad.
5. Cargas y evidencias offline conservan clave, hash, actor, dispositivo, tiempo del hecho y referencia de remisión durante reinicio y reconexión.
6. La sincronización revalida contexto, versión, estado y autoridad antes de aplicar efectos pendientes.
7. Un receipt técnico, mensaje encolado, objeto cargado o comando enviado no marca la remisión como preparada, despachada, recibida ni completada.
8. Un timeout posterior a envío queda `RESULT_UNKNOWN`; se consulta y concilia antes de repetir.
9. Las operaciones de líneas distintas pueden progresar de forma independiente cuando no rompan causalidad, reserva, lote, LPN, custodia o cierre de remisión.
10. Un conflicto de versión o cantidad no se resuelve mediante sobrescritura; se bloquea y devuelve a la aplicación propietaria.
11. Las capacidades condicionales de la matriz de `TSVC-CAT-003` no se habilitan por la sola existencia de este registro.
12. La definición no implementa el paquete ni modifica Supabase, NEXO, dispositivos o impresoras.

##### 3.16. Reconciliación cuantitativa

| Control                                                  | Resultado |
| -------------------------------------------------------- | --------: |
| Identidades de servicio esperadas                        |        10 |
| Identidades de servicio materializadas                   |        10 |
| Identificadores de servicio únicos                       |        10 |
| Identidades faltantes                                    |         0 |
| Identidades duplicadas                                   |         0 |
| Contratos `1.0.0` preservados                            |        10 |
| Perfiles canónicos de reintento                          |         6 |
| Resultados cerrados de deduplicación                     |         8 |
| Clases canónicas de error                                |        14 |
| Servicios con decisión idempotente explícita             |        10 |
| Servicios con perfil de reintento explícito              |        10 |
| Servicios con tratamiento de resultado ambiguo explícito |        10 |
| Implementaciones físicas creadas                         |         0 |
| Migraciones o cambios Supabase                           |         0 |

##### 3.17. Handoff obligatorio

| Tarea posterior | Insumo recibido de `TSVC-CAT-006`                                                                                                                                                       |
| --------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `TSVC-CAT-007`  | Campos, estados y eventos que deberán producir métricas y auditoría: intentos, duplicados, conflictos, backoff, leases, resultado desconocido, conciliación, dead-letter y agotamiento. |
| `TSVC-CAT-008`  | Estados `BLOCKED`, `RESULT_UNKNOWN`, `DEAD_LETTER`, deadlines y reglas que deberán integrarse con contingencia, fallback y degradación controlada.                                      |
| `TSVC-CAT-009`  | Intentos, claves, huellas, receipts, resultados, conflictos, conciliaciones y dead-letter que requerirán políticas de retención sin permitir reutilización semántica de identidades.    |
| `TSVC-CAT-010`  | Clasificaciones de activos parciales y patrones legacy que deberán adoptar claves, deduplicación, claims, resultados recuperables y retiro progresivo.                                  |

---

#### 4. Artefactos y entregables

1. `TRANSVERSE-SERVICE-RELIABILITY-REGISTRY-001@1.0.0`.
2. Vocabulario cerrado de identidad de operación, intención, deduplicación, intento, receipt, resultado y conflicto.
3. Sobre mínimo de confiabilidad aplicable a los diez contratos transversales.
4. Regla atómica de reserva y recuperación del resultado previo.
5. Catálogo cerrado de ocho resultados de deduplicación.
6. Catálogo cerrado de seis perfiles de reintento con presupuesto y backoff explícitos.
7. Catálogo cerrado de catorce clases de error y tratamiento.
8. Matriz materializada de diez servicios con ámbito, clave, perfil, repetición, ambigüedad y estado.
9. Ciclo de vida de ejecución, resultado desconocido, conciliación, cuarentena y dead-letter.
10. Reglas de claim, lease, fencing, concurrencia, orden y deadlines.
11. Aplicación de identidad técnica y autorización durante reintentos.
12. Reconciliación de cinco patrones técnicos actuales sin afirmar cumplimiento.
13. Aplicación específica al carril `NEXO-REMISSIONS-001`.
14. Handoff cerrado hacia `TSVC-CAT-007..010`.

---

#### 5. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea materializa para los diez servicios transversales mecanismos ya exigidos por requisitos canónicos vigentes sobre intención idempotente, replay, deduplicación, entrega al menos una vez, outbox, resultado desconocido, reintentos, backoff, orden, conflictos, efectos físicos, integraciones externas, recuperación y trazabilidad. No introduce un comportamiento empresarial adicional ni modifica el alcance, estado, responsable, modalidad o relación de requisitos existentes.

La cobertura vigente incluye, entre otros:

- `TREQ-PROC-041`, `TREQ-PROC-075`, `TREQ-PROC-085`, `TREQ-PROC-089` y `TREQ-PROC-090`;
- `TREQ-PROC-186`, `TREQ-PROC-278`, `TREQ-PROC-279`, `TREQ-PROC-284` y `TREQ-PROC-285`;
- `TREQ-PROC-299` a `TREQ-PROC-301` y `TREQ-PROC-309` a `TREQ-PROC-314`;
- `TREQ-PROC-363`, `TREQ-PROC-364` y `TREQ-PROC-379`;
- `TREQ-INTEGRATION-003` y `TREQ-INTEGRATION-004`.

La tarea genera:

```text
CREADOS = 0
MODIFICADOS = 0
DIFERIDOS = 0
DESCARTADOS_U_OBSOLETOS = 0
```

Por tanto, el registro canónico `04A` permanece sin cambios y no corresponde generar una nueva copia.

---

#### 6. Criterios de aceptación

1. `TSVC-CAT-005` figura aprobada y `TSVC-CAT-006` corresponde a la continuidad vigente.
2. Existen exactamente diez filas para `TSVC-SVC-001..010`.
3. Cada servicio conserva su nombre, contrato, versión, propietaria, productoras y consumidoras aprobadas.
4. Cada servicio declara una intención y ámbito de unicidad explícitos.
5. Cada servicio declara una clave de deduplicación explícita.
6. Cada servicio declara un perfil base de reintento.
7. Cada servicio declara el comportamiento ante repetición y efecto ambiguo.
8. `idempotency_key`, `operation_id`, `attempt_id`, `deduplication_key`, `correlation_id` y `causation_id` permanecen diferenciados.
9. La clave se crea antes del primer envío y se conserva durante la misma intención.
10. La misma clave y huella recuperan el mismo receipt, estado o resultado sin repetir el efecto.
11. La misma clave con contenido incompatible produce `IDEMPOTENCY_CONFLICT`.
12. Una intención nueva utiliza una clave nueva y no reabre una operación terminal.
13. La comprobación y reserva de clave se define como atómica.
14. No se afirma ejecución exactamente una vez.
15. Los seis perfiles distinguen intentos, backoff, jitter, deadline y disposición al agotar.
16. Los errores no reintentables no se convierten en transitorios por repetición.
17. `RESULT_UNKNOWN` prohíbe repetición ciega y exige consulta o conciliación.
18. Claim, lease y fencing impiden que un worker vencido cierre una versión posterior.
19. Orden causal, versión y dependencias prevalecen sobre prioridad y hora de llegada.
20. No se utiliza `last write wins` para efectos empresariales o físicos.
21. La identidad técnica no sustituye actor, aplicación, autoridad ni recurso.
22. La impresión diferencia intento, aceptación del periférico, resultado físico y reimpresión intencional.
23. Outbox y consumidores deduplican por `event_id` y controlan orden por agregado y versión.
24. Archivos y evidencia usan hash dentro de un ámbito empresarial; no existe deduplicación global indiscriminada.
25. Webhooks e integraciones distinguen replay entrante, envío saliente y resultado externo ambiguo.
26. Schedules distinguen definición, ocurrencia lógica, misfire, reintento y ejecución manual.
27. Heartbeats aplican secuencia monotónica y no reintentan señales obsoletas.
28. El carril NEXO conserva propiedad de estados, cantidades, custodia y cierre.
29. Se declaran cero cambios `TREQ-*` con justificación concreta.
30. No se generan cambios en código, datos, Supabase, proveedores, dispositivos o despliegues.
31. `TSVC-CAT-007` permanece exclusivamente reservada.

---

#### 7. Dependencias y entradas

La tarea consume y preserva:

- `docs/plan-canonico/modular/01_PROTOCOLO.md`;
- `docs/plan-canonico/modular/delivery-contract.json`;
- `docs/plan-canonico/modular/active-sequence.json`;
- `docs/plan-canonico/modular/execution-route.json`;
- `docs/plan-canonico/modular/priority-route-progress.json`;
- `docs/plan-canonico/modular/00_CABECERA_Y_ESTADO.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/00_INTRO.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/01_PRINCIPIO_DE_PROPIEDAD.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/02_CATALOGO_DE_SERVICIOS_TRANSVERSALES.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/03_INFRAESTRUCTURA_CANONICA_DE_COLAS.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/05_NOTIFICACIONES_Y_ALERTAS.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/06_ARCHIVOS_DOCUMENTOS_Y_EVIDENCIA.md`;
- `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/01_EVENTOS_ENTRE_APLICACIONES.md`;
- `TSVC-CAT-001` a `TSVC-CAT-005`;
- `PROC-CAT-015` a `PROC-CAT-018`;
- `INT-APP-001` a `INT-APP-010`;
- el registro canónico vigente `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`;
- `package.json` y los validadores documentales aplicables.

Ninguna decisión aprobada por estas fuentes se modifica.

La tarea no afirma:

- existencia de tablas, constraints, claims, leases, fencing o dead-letter físicos;
- disponibilidad de workers, schedulers, dispositivos o proveedores;
- adopción por aplicaciones consumidoras;
- cumplimiento de backoff o deadlines en runtime;
- deduplicación efectiva extremo a extremo;
- conciliación productiva;
- validación remota, operativa o física.

Todas esas afirmaciones requieren implementación y evidencia de las tareas y paquetes propietarios.

---

#### 8. Continuidad canónica del bloque

```text
ÚLTIMA TAREA APROBADA
TSVC-CAT-005 — Definir identidad técnica y credenciales mínimas
        ↓
TAREA ACTUAL APROBADA
TSVC-CAT-006 — Definir idempotencia, reintentos y deduplicación
        ↓
SIGUIENTE TAREA RESERVADA
TSVC-CAT-007 — Definir observabilidad, métricas, alertas y auditoría
```


### ✅ TSVC-CAT-007 — Definir observabilidad, métricas, alertas y auditoría

**Estado:** APROBADA

**Tarea anterior:** `TSVC-CAT-006 — Definir idempotencia, reintentos y deduplicación`

**Tarea siguiente:** `TSVC-CAT-008 — Definir contingencia y degradación controlada`

**Tipo de tarea:** definición documental canónica de observabilidad, métricas, alertas y auditoría para servicios transversales

**Fase:** definición documental vinculante; instrumentación, configuración, despliegue y operación física no autorizados

**Repositorio propietario:** `devVentoGroup/vento-shell`

**Fecha de corte:** `2026-08-02`

**Cambios en código, configuración, dashboards, alertas, migraciones, funciones, workers, colas, despliegues, datos o Supabase:** no autorizados ni realizados

---

#### 1. Resultado material

Esta tarea materializa el registro canónico:

```text
TRANSVERSE-SERVICE-OBSERVABILITY-REGISTRY-001@1.0.0
```

El registro define, para cada una de las diez identidades `TSVC-SVC-001..010`:

1. las señales técnicas y operativas obligatorias;
2. las métricas comunes y específicas;
3. los eventos de auditoría mínimos;
4. las clases de alerta y su ciclo de vida;
5. la correlación entre contrato, operación, intento, resultado y efecto empresarial;
6. la separación entre métrica, log, traza, auditoría, alerta, señal de salud y resultado empresarial;
7. la minimización, redacción y protección de información sensible;
8. el tratamiento de fallos del propio pipeline de observabilidad;
9. la relación con idempotencia, reintentos, deduplicación, claims, leases, fencing y conciliación definidos en `TSVC-CAT-006`;
10. el handoff obligatorio hacia contingencia, retención y adopción progresiva.

El resultado completa la dimensión de observabilidad de los contratos `TSVC-SVC-001.CONTRACT` a `TSVC-SVC-010.CONTRACT`, todos definidos en versión inicial `1.0.0`, sin afirmar instrumentación, dashboards, alertas activas, retención física ni monitoreo productivo.

---

#### 2. Alcance

La tarea abarca exactamente estas diez identidades:

1. `TSVC-SVC-001` — Orquestación genérica de trabajos asíncronos.
2. `TSVC-SVC-002` — Entrega transaccional de eventos y outbox.
3. `TSVC-SVC-003` — Impresión centralizada.
4. `TSVC-SVC-004` — Notificaciones y alertas.
5. `TSVC-SVC-005` — Generación de documentos.
6. `TSVC-SVC-006` — Custodia de archivos y documentos originales.
7. `TSVC-SVC-007` — Evidencia transaccional.
8. `TSVC-SVC-008` — Integraciones externas y webhooks.
9. `TSVC-SVC-009` — Programación y automatizaciones recurrentes.
10. `TSVC-SVC-010` — Monitoreo y heartbeat de workers.

La tarea conserva sin modificación:

- el propietario técnico institucional `Tecnología de Vento Group`;
- el repositorio canónico `vento-shell`;
- las diez aplicaciones canónicas y las cien decisiones aplicación–servicio de `TSVC-CAT-003`;
- los diez contratos `1.0.0` de `TSVC-CAT-004`;
- las identidades y credenciales mínimas de `TSVC-CAT-005`;
- la semántica `AT_LEAST_ONCE_WITH_IDEMPOTENT_EFFECT` de `TSVC-CAT-006`;
- los seis perfiles de reintento, ocho resultados de deduplicación y catorce clases de error aprobados;
- la autoridad de la aplicación propietaria sobre el resultado empresarial;
- la separación entre acuse técnico, señal de observabilidad y hecho empresarial confirmado;
- la obligación de materializar futuras modificaciones de Supabase desde `vento-shell` durante una fase autorizada.

Quedan fuera del alcance:

- instalar SDK de telemetría, agentes, colectores o exportadores;
- crear tablas, vistas, índices, funciones, triggers, buckets, colas o migraciones;
- configurar dashboards, consultas, paneles, canales de alerta o guardias;
- fijar umbrales numéricos sin baseline, SLO, capacidad y ambiente aprobados;
- instrumentar aplicaciones, Edge Functions, workers, dispositivos, proveedores o impresoras;
- crear retención, archivo, disposición o limpieza, responsabilidad de `TSVC-CAT-009`;
- definir operación degradada, fallback y recuperación, responsabilidad de `TSVC-CAT-008`;
- retirar patrones legacy o adoptar progresivamente la solución objetivo, responsabilidad de `TSVC-CAT-010`;
- declarar monitoreo productivo, trazas distribuidas, alertas activas o auditoría completa sin evidencia física.

---

#### 3. Decisiones aprobadas

##### 3.1. Identidad del registro

| Campo                    | Valor                                           |
| ------------------------ | ----------------------------------------------- |
| `registry_id`            | `TRANSVERSE-SERVICE-OBSERVABILITY-REGISTRY-001` |
| `registry_version`       | `1.0.0`                                         |
| `registry_status`        | `DEFINED`                                       |
| `covered_services`       | `10`                                            |
| `signal_model`           | `SEVEN_SIGNAL_CLASSES_WITH_BUSINESS_SEPARATION` |
| `metric_catalog_version` | `1.0.0`                                         |
| `alert_catalog_version`  | `1.0.0`                                         |
| `audit_catalog_version`  | `1.0.0`                                         |
| `technical_owner`        | Tecnología de Vento Group                       |
| `canonical_repository`   | `vento-shell`                                   |
| `governing_task`         | `TSVC-CAT-007`                                  |

`DEFINED` significa que las señales, métricas, alertas y eventos auditables están documentados y gobernados. No significa que existan instrumentación, almacenamiento, consultas, dashboards, notificaciones, on-call, retención ni evidencia operativa.

##### 3.2. Separación obligatoria de señales

Toda materialización futura deberá distinguir:

```text
RESULTADO EMPRESARIAL PROPIETARIO
        ↕ correlación, no sustitución
OPERACIÓN DEL SERVICIO TRANSVERSAL
        ├── MÉTRICAS
        ├── LOGS
        ├── TRAZAS
        ├── AUDITORÍA
        ├── ALERTAS
        └── SEÑALES DE SALUD
```

Reglas:

1. una métrica resume comportamiento; no prueba por sí sola un hecho individual;
2. un log describe diagnóstico técnico; no sustituye auditoría ni evidencia;
3. una traza conecta etapas y dependencias; no concede autorización ni confirma el efecto empresarial;
4. una auditoría registra una acción material y su contexto; no debe copiar payloads completos;
5. una alerta deriva de una condición observable; no crea ni modifica el estado empresarial;
6. una señal de salud describe disponibilidad técnica; no implica que todos los procesos estén completos;
7. el resultado empresarial permanece gobernado por la aplicación propietaria;
8. un `200 OK`, mensaje encolado, span exitoso, contador incrementado o alerta resuelta no equivale a pago, entrega, impresión física, custodia, aceptación, documento válido ni cierre de proceso;
9. todas las señales deberán conservar correlación con el contrato y la operación sin convertir el sistema de observabilidad en fuente de verdad empresarial;
10. ninguna ausencia de telemetría podrá interpretarse automáticamente como ausencia de error o éxito operativo.

##### 3.3. Clases canónicas de señal

| Clase                       | Propósito                                                               | Persistencia conceptual                              | No representa                              |
| --------------------------- | ----------------------------------------------------------------------- | ---------------------------------------------------- | ------------------------------------------ |
| `METRIC`                    | Medir volumen, latencia, estado agregado, backlog, errores y capacidad. | Serie temporal o agregado equivalente.               | Evidencia individual completa.             |
| `LOG_EVENT`                 | Diagnosticar una ejecución o condición técnica concreta.                | Registro estructurado con nivel y contexto.          | Auditoría canónica ni payload empresarial. |
| `TRACE_SPAN`                | Reconstruir causalidad y duración entre etapas y dependencias.          | Traza distribuida correlacionada.                    | Resultado empresarial ni permiso.          |
| `AUDIT_EVENT`               | Registrar una acción material, decisión o cambio gobernado.             | Registro no destructivo y consultable por finalidad. | Log libre ni copia de contenido sensible.  |
| `ALERT_EVENT`               | Notificar una condición que exige atención o seguimiento.               | Incidente o señal con ciclo de vida.                 | Cambio automático del proceso empresarial. |
| `HEALTH_SIGNAL`             | Exponer liveness, readiness, heartbeat y capacidad de procesamiento.    | Estado técnico con frescura explícita.               | Garantía de completitud end-to-end.        |
| `BUSINESS_RESULT_REFERENCE` | Referenciar el resultado propietario relacionado.                       | Identificador o referencia mínima.                   | Copia mutable del resultado de dominio.    |

##### 3.4. Sobre común de observabilidad

Toda señal deberá incorporar, cuando aplique:

```text
service_id
contract_id
contract_version
operation_id
operation_type
producer_application
business_owner_application
consumer_application
principal_id
worker_id
device_id
provider_id
schedule_id
correlation_id
causation_id
trace_id
span_id
parent_span_id
idempotency_key_ref
request_fingerprint_ref
attempt_no
retry_profile_id
dedup_result
claim_id
lease_expires_at
fencing_token
deadline_at
status
error_class
signal_class
signal_name
severity
occurred_at
recorded_at
duration_ms
result_reference
audit_class
schema_version
environment
```

Reglas:

1. `idempotency_key_ref` y `request_fingerprint_ref` son referencias o valores protegidos; no exponen material sensible innecesario;
2. `trace_id`, `span_id` y `parent_span_id` conservan continuidad técnica sin reemplazar `correlation_id` ni `causation_id`;
3. `attempt_no` identifica el intento real y no altera `operation_id`;
4. `status` usa estados del contrato o del ciclo técnico aprobado; no inventa estados empresariales;
5. `result_reference` apunta al resultado propietario sin copiarlo íntegramente;
6. `principal_id`, `worker_id`, `device_id`, `provider_id` y `schedule_id` se incluyen solo cuando aplican;
7. `environment` es obligatorio para evitar mezclar desarrollo, pruebas, staging y producción;
8. `occurred_at` conserva el momento del hecho observado y `recorded_at` el momento de registro;
9. toda señal deberá declarar una versión de esquema;
10. campos ausentes no se completarán con valores inventados.

##### 3.5. Convención de nombres y cardinalidad

Las métricas futuras utilizarán una convención estable equivalente a:

```text
vento_tsvc_<service_id_normalizado>_<metric_name>
```

Reglas de cardinalidad:

1. no se usarán como etiquetas libres `operation_id`, `trace_id`, `span_id`, payload, correo, teléfono, documento, URL completa, mensaje de error completo ni identificadores de alta cardinalidad;
2. los identificadores individuales permanecerán en logs, trazas o auditoría según finalidad;
3. las etiquetas permitidas deberán pertenecer a catálogos cerrados y versionados;
4. `service_id`, `contract_version`, `operation_type`, `status`, `error_class`, `retry_profile_id`, `dedup_result`, `environment` y clases equivalentes podrán usarse cuando su cardinalidad permanezca acotada;
5. `site_id`, `area_id`, `device_id`, `provider_id` o `consumer_application` solo se expondrán cuando la finalidad, sensibilidad y escala lo permitan;
6. ninguna métrica deberá contener secretos, tokens, firmas, payloads ni datos personales;
7. los cambios de nombre o significado de una métrica requieren nueva versión del catálogo;
8. un dashboard no podrá recombinar métricas con semántica incompatible como si fueran equivalentes.

##### 3.6. Catálogo común de métricas

| ID             | Métrica canónica                | Tipo       | Unidad       | Semántica                                                                         |
| -------------- | ------------------------------- | ---------- | ------------ | --------------------------------------------------------------------------------- |
| `TSVC-MET-001` | `operations_accepted_total`     | contador   | operaciones  | Operaciones aceptadas por contrato.                                               |
| `TSVC-MET-002` | `operations_completed_total`    | contador   | operaciones  | Operaciones con resultado técnico terminal satisfactorio.                         |
| `TSVC-MET-003` | `operations_failed_total`       | contador   | operaciones  | Operaciones con resultado técnico terminal fallido.                               |
| `TSVC-MET-004` | `operations_deduplicated_total` | contador   | operaciones  | Repeticiones resueltas mediante resultado previo o supresión segura.              |
| `TSVC-MET-005` | `attempts_total`                | contador   | intentos     | Intentos ejecutados, incluidos reintentos.                                        |
| `TSVC-MET-006` | `retries_scheduled_total`       | contador   | reintentos   | Reintentos programados por política.                                              |
| `TSVC-MET-007` | `result_unknown_total`          | contador   | operaciones  | Operaciones cuyo resultado permanece desconocido y exige consulta o conciliación. |
| `TSVC-MET-008` | `dead_letter_total`             | contador   | operaciones  | Operaciones enviadas a dead-letter tras agotar tratamiento automático.            |
| `TSVC-MET-009` | `quarantine_total`              | contador   | operaciones  | Operaciones aisladas por integridad, contrato, seguridad o conflicto.             |
| `TSVC-MET-010` | `backlog_depth`                 | gauge      | operaciones  | Trabajo pendiente elegible o bloqueado según dimensión declarada.                 |
| `TSVC-MET-011` | `oldest_backlog_age_seconds`    | gauge      | segundos     | Antigüedad del trabajo pendiente más antiguo.                                     |
| `TSVC-MET-012` | `in_flight_operations`          | gauge      | operaciones  | Operaciones reclamadas o activas dentro de lease vigente.                         |
| `TSVC-MET-013` | `operation_duration_ms`         | histograma | milisegundos | Duración técnica end-to-end de la operación.                                      |
| `TSVC-MET-014` | `dependency_duration_ms`        | histograma | milisegundos | Duración de una dependencia externa, dispositivo o servicio.                      |
| `TSVC-MET-015` | `lease_expired_total`           | contador   | leases       | Leases vencidos antes del cierre válido.                                          |
| `TSVC-MET-016` | `claim_conflict_total`          | contador   | conflictos   | Claims rechazados por concurrencia, fencing o versión.                            |
| `TSVC-MET-017` | `contract_rejected_total`       | contador   | solicitudes  | Solicitudes rechazadas por contrato o versión incompatible.                       |
| `TSVC-MET-018` | `authentication_rejected_total` | contador   | solicitudes  | Solicitudes rechazadas por identidad o autenticación técnica.                     |
| `TSVC-MET-019` | `worker_heartbeat_age_seconds`  | gauge      | segundos     | Antigüedad del último heartbeat aceptado.                                         |
| `TSVC-MET-020` | `worker_state`                  | gauge enum | estado       | Estado cerrado de salud del worker según codificación versionada.                 |

Reglas:

1. las métricas de contador son monotónicas dentro de su ventana y reinicio declarado;
2. los gauges exponen el instante y la frescura de lectura;
3. las latencias se evalúan mediante distribución y percentiles, no únicamente promedio;
4. `operations_completed_total` describe finalización técnica, no resultado empresarial confirmado;
5. los conteos de reintentos no se suman como nuevas operaciones;
6. deduplicación, dead-letter, cuarentena y resultado desconocido permanecen separados;
7. cada métrica deberá declarar fuente, ambiente, ventana, dimensiones y versión;
8. los objetivos y umbrales se definirán con baseline y SLO aprobados, no dentro de esta tarea.

##### 3.7. Logs estructurados

Todo log futuro deberá:

1. utilizar nivel cerrado `DEBUG`, `INFO`, `WARN` o `ERROR` según ambiente y finalidad;
2. incluir `service_id`, `operation_id`, `attempt_no`, correlación, contrato, ambiente y clase de error cuando apliquen;
3. evitar concatenaciones libres que impidan consulta estructurada;
4. redaccionar secretos, credenciales, tokens, firmas, PIN, payloads completos y datos personales innecesarios;
5. conservar una referencia protegida cuando sea necesario recuperar contenido desde su fuente autorizada;
6. diferenciar error de validación, autenticación, dependencia, concurrencia, integridad, deadline, reintento agotado y fallo interno;
7. registrar la causa técnica sin afirmar un resultado empresarial no confirmado;
8. no utilizar `console.log` o `console.error` aislado como sustituto del contrato de observabilidad objetivo;
9. conservar stack o diagnóstico únicamente donde la sensibilidad y el ambiente lo permitan;
10. aplicar muestreo solo cuando no elimine auditoría, errores críticos, integridad, seguridad ni señales necesarias para conciliación.

##### 3.8. Trazas distribuidas

Toda operación que cruce aplicación, servicio, worker, dispositivo o proveedor deberá:

1. iniciar o continuar una traza con `trace_id` estable;
2. crear spans por frontera material, no por cada línea de código;
3. conservar `correlation_id` y `causation_id` además de la jerarquía de spans;
4. registrar contrato, versión, operación, intento, dependencia y resultado técnico;
5. representar el tiempo de cola separado del tiempo de ejecución;
6. distinguir la espera por proveedor, dispositivo, Storage, base de datos y consumidor;
7. marcar retry, deduplicación, claim, lease, fencing, deadline y conciliación como atributos cerrados;
8. no incorporar payloads completos ni información sensible en nombres o atributos;
9. conservar enlaces entre reintentos cuando cada intento requiera span independiente;
10. no presentar un span exitoso como prueba de cierre empresarial.

##### 3.9. Catálogo canónico de auditoría

| ID             | Clase                    | Cuándo se registra                                                                           |
| -------------- | ------------------------ | -------------------------------------------------------------------------------------------- |
| `TSVC-AUD-001` | `OPERATION_ACCEPTED`     | El servicio acepta una operación válida.                                                     |
| `TSVC-AUD-002` | `OPERATION_REJECTED`     | La operación se rechaza por contrato, identidad, autorización técnica, deadline o conflicto. |
| `TSVC-AUD-003` | `ATTEMPT_STARTED`        | Inicia un intento real de procesamiento.                                                     |
| `TSVC-AUD-004` | `CLAIM_ACQUIRED`         | Un worker obtiene el claim con lease y fencing.                                              |
| `TSVC-AUD-005` | `CLAIM_RENEWED`          | Se renueva un lease vigente dentro de política.                                              |
| `TSVC-AUD-006` | `CLAIM_RELEASED`         | El claim se libera, expira o se pierde de forma explícita.                                   |
| `TSVC-AUD-007` | `RESULT_RECORDED`        | Se registra un resultado técnico terminal o una referencia de resultado.                     |
| `TSVC-AUD-008` | `RETRY_SCHEDULED`        | Se programa un reintento con política, causa y deadline.                                     |
| `TSVC-AUD-009` | `DEDUP_REPLAYED`         | Se devuelve o reconcilia un resultado previo para la misma intención.                        |
| `TSVC-AUD-010` | `CONFLICT_REJECTED`      | La misma clave aparece con huella incompatible, versión obsoleta o fencing inválido.         |
| `TSVC-AUD-011` | `DEAD_LETTERED`          | La operación se transfiere a dead-letter con causa y estado.                                 |
| `TSVC-AUD-012` | `QUARANTINED`            | La operación se aísla por seguridad, integridad, contrato o contenido.                       |
| `TSVC-AUD-013` | `RECONCILIATION_DECIDED` | Se registra una decisión de conciliación y su autoridad.                                     |
| `TSVC-AUD-014` | `MANUAL_OVERRIDE`        | Una intervención excepcional modifica el tratamiento técnico permitido.                      |
| `TSVC-AUD-015` | `CONFIGURATION_CHANGED`  | Cambia una política versionada de retry, alertas, routing, contrato o instrumentación.       |
| `TSVC-AUD-016` | `ALERT_STATE_CHANGED`    | Una alerta se reconoce, suprime, resuelve o cierra con actor y razón.                        |

Reglas:

1. la auditoría es no destructiva y conserva la entrada original;
2. una corrección crea un nuevo evento vinculado;
3. toda intervención manual identifica actor, principal, finalidad, autoridad, antes, después y motivo;
4. los eventos auditables no contienen secretos ni payloads completos;
5. la consulta, exportación o administración privilegiada de auditoría deberá ser también auditable;
6. auditoría técnica y auditoría empresarial permanecen separadas pero correlacionadas;
7. el servicio registra su acción técnica; la aplicación propietaria registra su decisión o efecto empresarial;
8. un evento de auditoría no concede autorización retroactiva;
9. los eventos de configuración conservan versión anterior y nueva;
10. retención, legal hold, archivo y disposición se definen en sus tareas propietarias.

##### 3.10. Catálogo canónico de alertas

| ID             | Clase                            | Condición semántica                                                                   | Fuente mínima                                  | Acción esperada                                                      |
| -------------- | -------------------------------- | ------------------------------------------------------------------------------------- | ---------------------------------------------- | -------------------------------------------------------------------- |
| `TSVC-ALT-001` | `CONTRACT_VIOLATION`             | Aumentan rechazos por contrato, versión o esquema incompatibles.                      | `TSVC-MET-017`, logs y trazas.                 | Identificar productora, versión y cambio incompatible.               |
| `TSVC-ALT-002` | `AUTHENTICATION_ANOMALY`         | Existe patrón anómalo de autenticación técnica rechazada o identidad inesperada.      | `TSVC-MET-018` y auditoría.                    | Revisar principal, ambiente, credencial y posible compromiso.        |
| `TSVC-ALT-003` | `INTEGRITY_FAILURE`              | Hash, firma, original, evidencia, fencing o resultado presentan inconsistencia.       | Logs, auditoría y métricas específicas.        | Bloquear propagación y activar investigación.                        |
| `TSVC-ALT-004` | `DEADLINE_BREACH`                | Una operación supera su deadline o clase temporal aprobada.                           | Duración, deadline y estado.                   | Clasificar resultado, evitar retry ciego y escalar según criticidad. |
| `TSVC-ALT-005` | `BACKLOG_SATURATION`             | Backlog, edad o tiempo de drenaje exceden la envolvente aprobada.                     | `TSVC-MET-010`, `011`, throughput y capacidad. | Aplicar backpressure o capacidad según contrato.                     |
| `TSVC-ALT-006` | `RETRY_STORM`                    | Los reintentos crecen sin recuperación proporcional.                                  | `TSVC-MET-005`, `006`, errores y dependencia.  | Detener amplificación y revisar dependencia o política.              |
| `TSVC-ALT-007` | `DEPENDENCY_DEGRADATION`         | Un proveedor, dispositivo, Storage, base o consumidor presenta degradación sostenida. | `TSVC-MET-014`, errores y health.              | Aislar dependencia y evaluar contingencia.                           |
| `TSVC-ALT-008` | `RESULT_UNKNOWN_PERSISTENT`      | Permanecen resultados desconocidos sin conciliación dentro de la ventana aprobada.    | `TSVC-MET-007` y auditoría.                    | Consultar fuente autoritativa y conciliar.                           |
| `TSVC-ALT-009` | `WORKER_STALE`                   | Heartbeat, lease o actividad del worker pierden frescura.                             | `TSVC-MET-019`, `020`, leases e inflight.      | Impedir nuevos claims inseguros y evaluar reemplazo.                 |
| `TSVC-ALT-010` | `OBSERVABILITY_PIPELINE_FAILURE` | La propia captura, exportación o consulta de señales falla o pierde frescura.         | Señales internas del pipeline y canario.       | Declarar visibilidad degradada y no asumir salud.                    |

Los umbrales concretos deberán provenir de:

- SLO y criticidad aprobados;
- baseline medido y reproducible;
- capacidad y escenarios de carga;
- ambiente;
- contrato del proveedor o dispositivo;
- ventana temporal y estacionalidad;
- política versionada y owner explícito.

No se aprueban valores numéricos universales dentro de esta tarea.

##### 3.11. Severidad y ciclo de vida de alertas

| Severidad | Uso                                                                                               |
| --------- | ------------------------------------------------------------------------------------------------- |
| `SEV-1`   | Riesgo crítico de seguridad, integridad, pérdida, doble efecto o interrupción de proceso crítico. |
| `SEV-2`   | Degradación alta, backlog material, resultados desconocidos o dependencia principal afectada.     |
| `SEV-3`   | Condición anómala con capacidad de crecimiento o impacto acotado.                                 |
| `SEV-4`   | Información operativa que requiere seguimiento sin interrupción inmediata.                        |

| Estado                   | Significado                                                      |
| ------------------------ | ---------------------------------------------------------------- |
| `OPEN`                   | Condición activa y no reconocida.                                |
| `ACKNOWLEDGED`           | Responsable identificado y atención iniciada.                    |
| `SUPPRESSED_WITH_REASON` | Supresión temporal, justificada, con alcance y vencimiento.      |
| `RESOLVED`               | La condición dejó de cumplirse y existe evidencia técnica.       |
| `CLOSED_FALSE_POSITIVE`  | Se demostró que la alerta no representaba la condición prevista. |

Reglas:

1. toda alerta tiene owner, severidad, ambiente, fuente, ventana y condición de cierre;
2. reconocer no equivale a resolver;
3. suprimir exige razón, actor, vigencia y revisión;
4. una alerta resuelta no cierra automáticamente incidentes, conciliaciones ni procesos empresariales;
5. los cambios de estado generan `TSVC-AUD-016`;
6. una alerta sin señal suficiente deberá declararse incierta, no completarse mediante inferencia;
7. la deduplicación de alertas usa una identidad propia y no modifica la idempotencia de la operación observada;
8. múltiples síntomas de una misma causa pueden correlacionarse sin perder sus fuentes originales.

##### 3.12. Responsabilidad de señales y atención

| Responsabilidad                                | Owner                                                              |
| ---------------------------------------------- | ------------------------------------------------------------------ |
| Definir semántica común de señales y catálogos | Tecnología de Vento Group                                          |
| Emitir señal técnica correcta                  | Servicio, worker, dispositivo o adaptador que ejecuta la operación |
| Conservar resultado empresarial                | Aplicación propietaria del proceso o recurso                       |
| Definir SLO y criticidad empresarial           | Owner empresarial con Tecnología de Vento Group                    |
| Configurar instrumentación y exportación       | Tecnología de Vento Group durante fase autorizada                  |
| Atender alerta técnica                         | Owner técnico del servicio y guardia asignada                      |
| Atender efecto empresarial                     | Aplicación propietaria y responsable operativo                     |
| Conciliar resultado desconocido                | Owner del resultado con soporte del servicio transversal           |
| Gobernar acceso a telemetría y auditoría       | Tecnología de Vento Group y owner de información aplicable         |
| Aprobar supresión o override sensible          | Autoridad definida por criticidad y segregación                    |

##### 3.13. Registro canónico por servicio

| Servicio       | Métricas y señales obligatorias                                                                                                                                               | Alertas principales                                                                                | Auditoría mínima                                                                                                      | Frontera empresarial                                                              | Estado                     |
| -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | -------------------------- |
| `TSVC-SVC-001` | aceptadas, completadas, fallidas, intentos, retries, backlog, edad, inflight, claim, lease, duración, dead-letter y resultado desconocido                                     | backlog, retry storm, deadline, worker stale y pipeline failure                                    | submit, claim, renovación, intento, retry, resultado, cancelación técnica, dead-letter y conciliación                 | El servicio ejecuta trabajo; la productora conserva la autoridad del resultado.   | `DEFINED_NOT_INSTRUMENTED` |
| `TSVC-SVC-002` | eventos pendientes, edad del outbox, claim, entrega, duplicados, latencia por consumidor, errores, replay y dead-letter                                                       | outbox estancado, backlog, consumidor degradado, incompatibilidad y retry storm                    | registro transaccional, claim, intento de entrega, acuse, dedup, replay, error y conciliación                         | Publicar no sustituye el hecho ni la aplicación propietaria del evento.           | `DEFINED_NOT_INSTRUMENTED` |
| `TSVC-SVC-003` | trabajos pendientes, routing, receipt del adaptador, aceptación de dispositivo, resultado físico conocido o desconocido, copias suprimidas, duración y health del dispositivo | impresora o adaptador degradado, backlog, resultado desconocido, duplicidad e integridad de layout | solicitud, routing, layout y versión, dispositivo, intento, receipt, resultado, reimpresión autorizada y conciliación | Receipt o envío no prueban impresión física ni aceptación empresarial.            | `DEFINED_NOT_INSTRUMENTED` |
| `TSVC-SVC-004` | cola por canal, resolución de destinatario, resultado de proveedor, rate limit, bounce, retries, dedup, duración y supresión                                                  | proveedor degradado, rate limit, backlog, retry storm y destino inválido                           | solicitud, destinatario resuelto por referencia, canal, plantilla, intento, resultado y supresión                     | Notificación enviada no prueba lectura, aceptación ni cierre.                     | `DEFINED_NOT_INSTRUMENTED` |
| `TSVC-SVC-005` | generación iniciada, duración, plantilla y versión, resultado, tamaño, hash, retries, duplicados y errores                                                                    | render fallido, plantilla incompatible, hash inconsistente, backlog y deadline                     | solicitud, plantilla, versión, fuente, intento, salida, hash, error y supersesión                                     | Documento generado no equivale a aprobación, firma ni custodia definitiva.        | `DEFINED_NOT_INSTRUMENTED` |
| `TSVC-SVC-006` | ingestión, hash, clasificación, validación, Storage, duplicados, acceso, recuperación, cuarentena y duración                                                                  | integridad, objeto huérfano, clasificación inválida, acceso anómalo y dependencia degradada        | ingestión, actor, original, hash, vínculo, acceso, sustitución, cuarentena y recuperación                             | Custodia no prueba conformidad, aceptación ni valor probatorio.                   | `DEFINED_NOT_INSTRUMENTED` |
| `TSVC-SVC-007` | captura, integridad, lineage, vínculo causal, resultado, duplicados, acceso, correcciones y disponibilidad                                                                    | evidencia faltante, integridad o lineage roto, acceso anómalo y pipeline failure                   | captura, origen, hash, relación, consulta sensible, corrección, supersesión y exportación                             | Evidencia técnica no sustituye la decisión empresarial ni la identidad del actor. | `DEFINED_NOT_INSTRUMENTED` |
| `TSVC-SVC-008` | firma u origen, replay, mapping, latencia, timeout, rate limit, ACK, provider errors, retries, resultado desconocido y conciliación                                           | firma inválida, replay, proveedor degradado, backlog, deadline y resultado desconocido             | recepción o envío, proveedor, contrato, mapping, intento, ACK, dedup, error y conciliación                            | Estado del proveedor o `200 OK` no cierra el proceso propietario.                 | `DEFINED_NOT_INSTRUMENTED` |
| `TSVC-SVC-009` | ejecuciones debidas, iniciadas, completadas, fallidas, omitidas, misfire, drift, overlap, retries y duración                                                                  | ejecución omitida, solapamiento, regla incompatible, fallo repetido y worker stale                 | schedule y versión, trigger, scheduler, ventana, intento, resultado, cancelación y cambio de configuración            | El scheduler dispara; no decide la regla empresarial ni su aprobación.            | `DEFINED_NOT_INSTRUMENTED` |
| `TSVC-SVC-010` | heartbeat age, liveness, readiness, worker state, inflight, leases, lag, reinicios, capacidad y cobertura                                                                     | heartbeat ausente, worker stale, capacidad insuficiente, reloj inválido y pipeline failure         | registro de worker, inicio, heartbeat, transición de salud, suspensión, reemplazo y retiro                            | Salud del worker no demuestra éxito del proceso ni de su dependencia.             | `DEFINED_NOT_INSTRUMENTED` |

##### 3.14. Perfil específico de `TSVC-SVC-001`

La orquestación genérica deberá permitir responder:

- cuántos trabajos fueron aceptados, reclamados, completados, fallidos o deduplicados;
- cuánto tiempo permanecieron en cola y cuánto duró cada intento;
- qué worker obtuvo el claim y con qué fencing token;
- cuántos leases expiraron;
- qué reintentos se programaron y bajo qué perfil;
- qué trabajos agotaron política o quedaron con resultado desconocido;
- qué backlog existe por prioridad, contrato y ambiente sin introducir cardinalidad libre;
- si el throughput permite drenar el backlog dentro de la envolvente aprobada.

No podrá contar un reintento como trabajo nuevo ni presentar un claim como resultado.

##### 3.15. Perfil específico de `TSVC-SVC-002`

La entrega transaccional deberá permitir reconstruir:

```text
HECHO CONFIRMADO
  → REGISTRO OUTBOX
  → CLAIM
  → INTENTO DE ENTREGA
  → ACK O ERROR
  → REINTENTO, DEAD-LETTER O CONCILIACIÓN
```

La observabilidad conservará `event_id`, definición, versión, productor, consumidor, agregado, versión de agregado, correlación, causalidad, intento y resultado de entrega. El payload completo no se replica en métricas, logs ni trazas.

##### 3.16. Perfil específico de `TSVC-SVC-003`

La impresión deberá distinguir:

1. intención de impresión;
2. trabajo aceptado;
3. routing y layout versionado;
4. receipt del adaptador;
5. aceptación del dispositivo;
6. resultado físico conocido, fallido o desconocido;
7. reimpresión autorizada;
8. conciliación.

La observabilidad deberá detectar backlog, dispositivo sin heartbeat, layout incompatible, timeout, duplicidad y resultado físico desconocido sin generar copias adicionales por reintento ciego.

##### 3.17. Perfil específico de `TSVC-SVC-004`

Las notificaciones deberán medir por canal y proveedor:

- solicitudes aceptadas;
- destinos válidos o rechazados;
- renderizado y versión de plantilla;
- entrega al proveedor;
- resultado devuelto;
- rate limit;
- retries y deduplicación;
- latencia y backlog;
- supresión y preferencias aplicables.

La identidad del destinatario se conserva mediante referencia mínima. El contenido completo no se utiliza como etiqueta ni mensaje de log.

##### 3.18. Perfil específico de `TSVC-SVC-005`

La generación documental deberá correlacionar datos fuente, plantilla, versión, operación, intento, output, hash, tamaño, formato y resultado. Un documento regenerado deberá distinguir nueva versión, reproducción idéntica, supersesión o corrección. El servicio no declara firma, aprobación o custodia si esas acciones no fueron confirmadas por sus contratos propietarios.

##### 3.19. Perfil específico de `TSVC-SVC-006`

La custodia deberá observar:

- ingestión y origen;
- hash e identidad del original;
- clasificación y vínculo con recurso;
- validación y cuarentena;
- ubicación técnica protegida;
- accesos, recuperaciones y sustituciones;
- errores de integridad, referencia o Storage;
- duplicados idénticos y conflictos de contenido.

Una URL firmada, ruta o nombre de archivo no se registra en telemetría abierta cuando exponga capacidad o información sensible.

##### 3.20. Perfil específico de `TSVC-SVC-007`

La evidencia transaccional deberá conservar integridad, lineage, hecho relacionado, actor o principal, momento, dispositivo, versión y fuerza probatoria técnica definida. La observabilidad detectará evidencia obligatoria ausente, vínculo roto, hash incompatible, acceso extraordinario y corrección. Un archivo existente no se interpretará automáticamente como evidencia suficiente.

##### 3.21. Perfil específico de `TSVC-SVC-008`

Toda integración deberá separar:

```text
RECEPCIÓN TÉCNICA
VALIDACIÓN DE ORIGEN Y FIRMA
DEDUPLICACIÓN O REPLAY
TRANSFORMACIÓN VERSIONADA
COMANDO O EVENTO INTERNO
ACK TÉCNICO
RESULTADO EMPRESARIAL
CONCILIACIÓN
```

La observabilidad medirá firma inválida, replay, latencia, timeout, rate limit, errores de mapping, dependencia, resultado desconocido y conciliación. Los payloads de proveedor permanecerán en fuentes protegidas; logs y trazas usan referencias y campos permitidos.

##### 3.22. Perfil específico de `TSVC-SVC-009`

La programación deberá medir ejecución debida, disparo real, drift, misfire, solapamiento, omisión válida, cancelación, intento, resultado y duración. Cada señal conserva schedule, versión, zona horaria, vigencia y scheduler. Un trigger ejecutado no demuestra que la acción empresarial haya sido autorizada o completada.

##### 3.23. Perfil específico de `TSVC-SVC-010`

El monitoreo de workers deberá exponer:

- identidad del worker y servicio;
- versión y ambiente;
- liveness y readiness separados;
- último heartbeat y su edad;
- capacidad declarada y trabajo activo;
- leases y claims vigentes;
- lag o backlog relacionado;
- reinicios, suspensión, reemplazo y retiro;
- reloj y frescura de señal.

Estados mínimos de salud:

| Estado     | Significado                                           |
| ---------- | ----------------------------------------------------- |
| `STARTING` | Worker registrado, todavía no listo.                  |
| `READY`    | Puede aceptar trabajo dentro de su alcance.           |
| `BUSY`     | Ejecuta trabajo y mantiene heartbeat vigente.         |
| `DEGRADED` | Opera con capacidad o dependencia reducida.           |
| `DRAINING` | No acepta trabajo nuevo y termina trabajo vigente.    |
| `STALE`    | Heartbeat fuera de la ventana aprobada.               |
| `STOPPED`  | Detenido de forma conocida.                           |
| `UNKNOWN`  | No existe evidencia suficiente para determinar salud. |

`UNKNOWN` no se convierte automáticamente en `STOPPED` ni `READY`.

##### 3.24. Fallo del propio pipeline de observabilidad

La observabilidad deberá tratarse como una dependencia falible.

Reglas:

1. el fallo de exportación no podrá bloquear silenciosamente una operación empresarial cuando el contrato permita continuar;
2. las acciones sensibles que requieran auditoría obligatoria deberán fallar de forma cerrada o usar un mecanismo local duradero aprobado;
3. una señal perdida o retrasada deberá producir estado de visibilidad degradada;
4. el sistema no asumirá salud por ausencia de alertas;
5. la cola o buffer de telemetría deberá tener límites y backpressure;
6. un fallo de métricas no elimina logs o auditoría obligatoria;
7. un fallo de trazas no autoriza eliminar correlación e idempotencia del contrato principal;
8. el pipeline deberá tener health, frescura, backlog, errores y canarios propios;
9. la recuperación no duplicará eventos de auditoría ni reescribirá timestamps del hecho;
10. la contingencia concreta se define en `TSVC-CAT-008`.

##### 3.25. Seguridad, privacidad y acceso

1. secretos, claves, tokens, cookies, PIN, firmas privadas y credenciales nunca se registran;
2. payloads completos, documentos, fotografías, diagnósticos, datos bancarios y datos personales sensibles se sustituyen por referencias protegidas;
3. los mensajes de error se normalizan antes de exponerlos como etiqueta o dimensión;
4. acceso a logs, trazas, métricas, alertas y auditoría se autoriza por finalidad, ambiente, servicio, sensibilidad y acción;
5. observar no concede capacidad de mutar, reintentar, cancelar, conciliar ni cambiar configuración;
6. exportar o compartir telemetría sensible es una acción auditable;
7. el observador definido en `TSVC-CAT-005` conserva privilegio de solo lectura;
8. una herramienta externa de observabilidad no se convierte en propietaria del dato empresarial;
9. la eliminación o retención del proveedor no sustituye la política canónica;
10. las señales de seguridad críticas no se muestrean de forma que impida investigación.

##### 3.26. Reconciliación con activos técnicos actuales

| Activo o patrón observado                                                                                            | Servicio relacionado     | Clasificación                                        | Decisión canónica                                                                                                                      |
| -------------------------------------------------------------------------------------------------------------------- | ------------------------ | ---------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| Cola de impresión local y ejecución desde navegador registrada por `TSVC-CAT-001`                                    | `TSVC-SVC-003`           | `LOCAL_DIAGNOSTICS_WITHOUT_TRANSVERSE_OBSERVABILITY` | Conservar como evidencia funcional; no acredita métricas, trazas, alertas, heartbeat ni auditoría centralizada.                        |
| Registro autenticado de tokens push con timestamps de permiso y `last_seen`                                          | `TSVC-SVC-004`           | `PARTIAL_DEVICE_METADATA`                            | Puede aportar direccionamiento y frescura del destino; no constituye observabilidad de entrega end-to-end.                             |
| Flujo documental de ANIMA registrado por `TSVC-CAT-001`                                                              | `TSVC-SVC-006`           | `APPLICATION_LOCAL_FLOW`                             | Conservar metadatos actuales; la observabilidad transversal exige contrato, hash, acceso, integridad, correlación y auditoría comunes. |
| Webhook de pagos con verificación de firma, deduplicación, persistencia de evento y errores mediante `console.error` | `TSVC-SVC-008`           | `PROVIDER_SPECIFIC_PARTIAL_DIAGNOSTICS`              | Conservar controles vigentes; estructurar señales comunes, redacción, métricas, trazas, alertas y conciliación en la fase autorizada.  |
| Webhook de RevenueCat registrado por `TSVC-CAT-001`                                                                  | `TSVC-SVC-008`           | `PROVIDER_SPECIFIC_PARTIAL_ADAPTER`                  | No se considera servicio transversal observable completo por existir un adaptador específico.                                          |
| Ausencia de un servicio transversal verificado de heartbeat de workers                                               | `TSVC-SVC-010`           | `MISSING_CANONICAL_IMPLEMENTATION`                   | Mantener `DEFINED_NOT_INSTRUMENTED`; no declarar salud de workers sin implementación y evidencia.                                      |
| Uso aislado de logs de runtime o errores locales                                                                     | servicios que los emitan | `UNSTRUCTURED_OR_LOCAL_DIAGNOSTICS`                  | No sustituye métricas, trazas, alertas ni auditoría canónica.                                                                          |

La reconciliación describe activos observados y decisiones ya inventariadas. No afirma cobertura completa, despliegue, retención, consulta central ni operación productiva.

##### 3.27. Aplicación al carril `NEXO-REMISSIONS-001`

Para el paquete prioritario de remisiones NEXO:

1. cada trabajo conserva aplicación `nexo`, actor o principal, sede, área, recurso, contrato, operación, correlación, causa e idempotencia;
2. solicitud, aceptación, producción, preparación, carga, despacho, recepción y conciliación permanecen resultados empresariales de sus propietarias, no métricas del servicio;
3. la cola asíncrona mide backlog, edad, intentos, leases, deduplicación, dead-letter y resultado desconocido;
4. la impresión distingue intención, routing, receipt, aceptación del dispositivo y resultado físico;
5. el heartbeat identifica worker, dispositivo, versión, ambiente, readiness y frescura;
6. una alerta de worker o impresora no cambia el estado de la remisión;
7. una reimpresión requiere identidad, autorización, causa y auditoría propias;
8. los handoffs y firmas conservan evidencia y actor real fuera del payload de telemetría abierta;
9. la recuperación de red o worker no duplica remisiones, movimientos, impresiones ni aceptaciones;
10. ninguna capacidad se declara operativa por quedar documentada en este registro.

##### 3.28. Reconciliación cuantitativa

| Control                                 | Resultado |
| --------------------------------------- | --------: |
| Servicios esperados                     |        10 |
| Servicios materializados                |        10 |
| Identificadores de servicio únicos      |        10 |
| Servicios faltantes                     |         0 |
| Servicios duplicados                    |         0 |
| Clases canónicas de señal               |         7 |
| Métricas comunes definidas              |        20 |
| Clases canónicas de alerta              |        10 |
| Estados de alerta                       |         5 |
| Clases canónicas de auditoría           |        16 |
| Estados de salud de worker              |         8 |
| Servicios en `DEFINED_NOT_INSTRUMENTED` |        10 |
| Servicios instrumentados por esta tarea |         0 |
| Dashboards configurados por esta tarea  |         0 |
| Alertas activadas por esta tarea        |         0 |
| Cambios físicos de Supabase             |         0 |

##### 3.29. Handoff obligatorio

| Tarea posterior | Insumo recibido de `TSVC-CAT-007`                                                                                                                                                                          |
| --------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `TSVC-CAT-008`  | Señales de salud, dependencia, backlog, deadline, retry storm, resultado desconocido, worker stale y fallo de observabilidad que deberán activar contingencia o degradación controlada sin inventar éxito. |
| `TSVC-CAT-009`  | Clases de métricas, logs, trazas, auditoría, alertas y referencias empresariales que deberán recibir política de retención, archivo, hold, disposición y limpieza.                                         |
| `TSVC-CAT-010`  | Patrones actuales locales o específicos, estado `DEFINED_NOT_INSTRUMENTED`, catálogos objetivo y criterios de adopción que deberán migrarse y retirarse progresivamente.                                   |

---

#### 4. Artefactos y entregables

1. `TRANSVERSE-SERVICE-OBSERVABILITY-REGISTRY-001@1.0.0`.
2. Catálogo cerrado de siete clases de señal.
3. Sobre común de observabilidad con identidad, correlación, intento, retry, deduplicación, claim, lease, fencing, deadline y resultado.
4. Catálogo común de veinte métricas con tipo, unidad y semántica.
5. Convención de nombres y política de cardinalidad.
6. Contrato de logs estructurados y trazas distribuidas.
7. Catálogo cerrado de dieciséis clases de auditoría.
8. Catálogo cerrado de diez clases de alerta, cuatro severidades y cinco estados.
9. Matriz materializada para `TSVC-SVC-001..010`.
10. Perfil explícito de observabilidad para cada uno de los diez servicios.
11. Contrato de health y heartbeat para workers.
12. Política de fallo del propio pipeline de observabilidad.
13. Política de seguridad, privacidad, redacción y acceso.
14. Reconciliación de siete activos o patrones actuales sin afirmar cumplimiento objetivo.
15. Aplicación específica al carril `NEXO-REMISSIONS-001`.
16. Handoff cerrado a `TSVC-CAT-008..010`.

---

#### 5. Requisitos de prueba

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea materializa la dimensión de observabilidad, métricas, alertas y auditoría de los diez servicios ya gobernados. No crea un comportamiento empresarial nuevo ni modifica contratos funcionales, de integración, autorización, concurrencia o continuidad vigentes. Las invariantes están cubiertas por requisitos canónicos existentes sobre perfiles de auditoría, eventos no destructivos, correlación, trazabilidad, métricas, capacidad, backlog, reintentos, resultado desconocido, idempotencia, deduplicación, salud, privacidad y reconstrucción end-to-end, incluidos `TREQ-PROC-095` a `TREQ-PROC-110`, `TREQ-PROC-251` a `TREQ-PROC-269`, `TREQ-PROC-271` a `TREQ-PROC-294`, `TREQ-PROC-355` a `TREQ-PROC-368`, `TREQ-INTEGRATION-003`, `TREQ-INTEGRATION-019` y `TREQ-INTEGRATION-023`.

La tarea genera:

```text
CREADOS = 0
MODIFICADOS = 0
DIFERIDOS = 0
DESCARTADOS_U_OBSOLETOS = 0
```

Por tanto, no corresponde generar una nueva copia del registro `04A`.

---

#### 6. Criterios de aceptación

1. `TSVC-CAT-006` figura aprobada y conserva diez servicios, seis perfiles de reintento, ocho resultados de deduplicación y catorce clases de error.
2. Las diez identidades `TSVC-SVC-001..010` aparecen exactamente una vez en el registro principal.
3. Se materializan siete clases de señal sin mezclar resultado empresarial, métrica, log, traza, auditoría, alerta y health.
4. Toda señal puede correlacionarse con servicio, contrato, operación, intento, aplicación y resultado propietario.
5. El sobre incorpora idempotencia, retry, deduplicación, claim, lease, fencing, deadline y error sin exponer secretos.
6. Se definen veinte métricas comunes con tipo, unidad y semántica explícitos.
7. Reintentos no se cuentan como nuevas operaciones.
8. Finalización técnica no se presenta como resultado empresarial.
9. Se definen cardinalidad, dimensiones permitidas y prohibiciones de etiquetas libres.
10. Logs y trazas aplican estructura, correlación, redacción y minimización.
11. Se materializan dieciséis clases de auditoría no destructiva.
12. Intervenciones manuales, cambios de configuración y estados de alerta son auditables.
13. Se materializan diez clases de alerta, cuatro severidades y cinco estados.
14. No se inventan umbrales numéricos sin baseline, SLO y capacidad aprobados.
15. Cada alerta conserva owner, fuente, ambiente, ventana, severidad y condición de cierre.
16. El pipeline de observabilidad se trata como dependencia falible y observable.
17. Los ocho estados de salud distinguen startup, readiness, actividad, degradación, drenaje, stale, stop y desconocido.
18. `UNKNOWN` no se interpreta como salud ni detención confirmada.
19. La matriz cubre los diez servicios sin faltantes ni duplicados.
20. Los activos actuales se clasifican como locales, parciales, específicos o faltantes, no como cumplimiento objetivo.
21. El carril NEXO conserva separación entre señales técnicas, evidencia, impresión, remisión y resultado empresarial.
22. Datos personales, documentos, payloads, credenciales y secretos no se incorporan a telemetría abierta.
23. Se declaran cero cambios `TREQ-*` con justificación concreta.
24. No se modifican código, configuración, dashboards, alertas, Supabase, migraciones, funciones, workers, colas, datos ni despliegues.
25. La continuidad reserva exclusivamente `TSVC-CAT-008`.

---

#### 7. Dependencias y entradas

##### 7.1. Fuentes canónicas

- `docs/plan-canonico/modular/01_PROTOCOLO.md`;
- `docs/plan-canonico/modular/delivery-contract.json`;
- `docs/plan-canonico/modular/active-sequence.json`;
- `docs/plan-canonico/modular/execution-route.json`;
- `docs/plan-canonico/modular/priority-route-progress.json`;
- `docs/plan-canonico/modular/continuity-route.json`;
- `docs/plan-canonico/modular/priority-delivery-lanes.json`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/02_CATALOGO_DE_SERVICIOS_TRANSVERSALES.md`;
- versión canónica vigente de `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`;
- `package.json` y `scripts/docs/validate-task-delivery.mjs`.

##### 7.2. Tareas y decisiones heredadas

- `TSVC-CAT-001` — diez identidades y clasificación actual;
- `TSVC-CAT-002` — owner técnico y gobierno;
- `TSVC-CAT-003` — productoras, consumidoras y aplicabilidad;
- `TSVC-CAT-004` — contratos, versión y compatibilidad;
- `TSVC-CAT-005` — identidades técnicas y credenciales mínimas;
- `TSVC-CAT-006` — idempotencia, reintentos y deduplicación;
- `PROC-CAT-017` — eventos empresariales, correlación, causalidad y outbox;
- `PROC-CAT-018` — auditoría por proceso;
- `PROC-CAT-019` — KPI, drivers, guardrails y semántica de métricas;
- `NFR-REQ-002` — volumen, concurrencia, backlog y capacidad;
- `NFR-REQ-003` — tiempos, percentiles, deadlines y resultado desconocido;
- `NFR-REQ-004` — operación offline, reconexión e idempotencia;
- `NFR-REQ-006` — trazabilidad, auditoría, retención y reconstrucción;
- carril prioritario `NEXO-REMISSIONS-001`.

##### 7.3. Activos técnicos observados

- `supabase/functions/register-push-token/index.ts`;
- `supabase/functions/payments-webhook/index.ts`;
- adaptador de RevenueCat inventariado en `TSVC-CAT-001`;
- flujo documental de ANIMA inventariado en `TSVC-CAT-001`;
- cola local y activos de impresión NEXO inventariados en `TSVC-CAT-001`;
- patrones de identidad y credenciales reconciliados en `TSVC-CAT-005`;
- patrones de idempotencia y webhook reconciliados en `TSVC-CAT-006`.

Ninguna decisión aprobada por estas fuentes se modifica.

---

#### 8. Declaraciones expresamente no realizadas

Esta tarea no declara:

- SDK de observabilidad instalado;
- OpenTelemetry, Sentry, Prometheus u otro proveedor seleccionado;
- métricas exportadas;
- logs centralizados;
- trazas distribuidas activas;
- dashboard disponible;
- alerta configurada;
- canal de guardia activo;
- on-call operativo;
- heartbeat desplegado;
- worker monitoreado en producción;
- retención aplicada;
- auditoría física completa;
- migración ejecutada;
- política RLS aplicada;
- validación remota, operativa o de dispositivo.

Todas esas afirmaciones requieren implementación y evidencia de las tareas y paquetes propietarios.

---

#### 9. Continuidad canónica del bloque

```text
ÚLTIMA TAREA APROBADA
TSVC-CAT-006 — Definir idempotencia, reintentos y deduplicación
        ↓
TAREA ACTUAL APROBADA
TSVC-CAT-007 — Definir observabilidad, métricas, alertas y auditoría
        ↓
SIGUIENTE TAREA RESERVADA
TSVC-CAT-008 — Definir contingencia y degradación controlada
```


### [ ] TSVC-CAT-008 — Definir contingencia y degradación controlada
### [ ] TSVC-CAT-009 — Definir retención, archivado y limpieza
### [ ] TSVC-CAT-010 — Definir adopción progresiva y retiro de soluciones legacy
