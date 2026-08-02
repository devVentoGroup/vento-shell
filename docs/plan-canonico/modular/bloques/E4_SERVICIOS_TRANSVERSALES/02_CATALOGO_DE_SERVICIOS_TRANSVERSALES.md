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


### ✅ TSVC-CAT-008 — Definir contingencia y degradación controlada

**Estado:** APROBADA

**Tarea anterior:** `TSVC-CAT-007 — Definir observabilidad, métricas, alertas y auditoría`

**Tarea siguiente:** `TSVC-CAT-009 — Definir retención, archivado y limpieza`

**Tipo de tarea:** definición documental canónica y materialización matricial de contingencia, degradación segura, fallback, recuperación y conciliación para servicios transversales

**Fase:** definición documental vinculante; implementación física, activación operativa, configuración y despliegue no autorizados

**Repositorio propietario:** `devVentoGroup/vento-shell`

**Fecha de corte:** `2026-08-02`

**Cambios en código, configuración, migraciones, funciones, workers, colas, proveedores, dispositivos, despliegues, datos o Supabase:** no autorizados ni realizados

---

#### 1. Resultado material

Esta tarea materializa el registro canónico:

```text
TRANSVERSE-SERVICE-CONTINGENCY-REGISTRY-001@1.0.0
```

El registro define, para cada una de las diez identidades `TSVC-SVC-001..010`:

1. los dominios de fallo que pueden afectar la capacidad;
2. las clases de activación de contingencia;
3. el estado de disponibilidad y el modo operativo seguro aplicable;
4. los controles de contención, backpressure, circuit breaker, aislamiento y suspensión;
5. los fallbacks técnicos y manuales permitidos y prohibidos;
6. el resultado mínimo que puede preservarse durante degradación;
7. la conducta obligatoria ante `BLOCKED`, `RESULT_UNKNOWN`, `DEAD_LETTER`, deadline vencido, dependencia degradada o visibilidad insuficiente;
8. las condiciones de recuperación, drenaje y conciliación antes de restaurar operación normal;
9. las autoridades técnicas, empresariales, locales y de seguridad que participan sin transferirse propiedad;
10. el handoff obligatorio hacia retención, archivado, limpieza, adopción progresiva y retiro legacy.

La regla central es:

```text
DEGRADAR SOLO LO NECESARIO
+
PRESERVAR AUTORIDAD, INTEGRIDAD E IDEMPOTENCIA
+
NO FABRICAR ÉXITO
+
RECONCILIAR ANTES DE CERRAR
```

Una contingencia mantiene o reduce una capacidad técnica dentro de límites previamente aprobados. No convierte un acuse, una cola, una captura local, un canal alterno ni una intervención manual en resultado empresarial confirmado.

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
- las diez aplicaciones y las cien decisiones aplicación–servicio de `TSVC-CAT-003`;
- los diez contratos `TSVC-SVC-001.CONTRACT` a `TSVC-SVC-010.CONTRACT`, todos en versión inicial `1.0.0`;
- las identidades técnicas y credenciales mínimas de `TSVC-CAT-005`;
- el modelo `AT_LEAST_ONCE_WITH_IDEMPOTENT_EFFECTS` de `TSVC-CAT-006`;
- los seis perfiles de reintento, ocho resultados de deduplicación, catorce clases de error y estados de operación aprobados;
- las siete clases de señal, veinte métricas, diez alertas, dieciséis clases de auditoría y ocho estados de salud de `TSVC-CAT-007`;
- la autoridad de la aplicación propietaria sobre el resultado empresarial;
- la obligación de que toda modificación futura de Supabase perteneciente a VENTO se cree, versione, documente y ejecute desde `vento-shell` durante una fase autorizada.

Quedan fuera del alcance:

- implementar circuit breakers, colas, buffers, réplicas, proveedores alternos, almacenamiento local o controles de backpressure;
- crear tablas, índices, funciones, triggers, jobs, cron, workers, endpoints, buckets, roles, secretos o credenciales;
- ejecutar DDL, DML, migraciones, backfills, despliegues, failover, reconciliaciones productivas o simulacros;
- seleccionar proveedores, productos o tecnologías físicas;
- fijar umbrales numéricos universales sin SLO, baseline, capacidad, criticidad y ambiente aprobados;
- ampliar deadlines, permisos, territorio, vigencia, segregación o alcance de credenciales;
- definir periodos de retención, archivo o limpieza, responsabilidad de `TSVC-CAT-009`;
- definir adopción progresiva, coexistencia o retiro de soluciones legacy, responsabilidad de `TSVC-CAT-010`;
- reemplazar los planes empresariales de continuidad y recuperación de los dominios propietarios;
- declarar una contingencia implementada, ejercitada, operativa o validada sin evidencia física.

---

#### 3. Decisiones aprobadas

##### 3.1. Identidad del registro

| Campo                         | Valor                                         |
| ----------------------------- | --------------------------------------------- |
| `registry_id`                 | `TRANSVERSE-SERVICE-CONTINGENCY-REGISTRY-001` |
| `registry_version`            | `1.0.0`                                       |
| `registry_status`             | `DEFINED`                                     |
| `covered_services`            | `10`                                          |
| `availability_state_model`    | `SIX_STATE_SAFE_AVAILABILITY`                 |
| `operating_mode_model`        | `TEN_CONTROLLED_OPERATING_MODES`              |
| `contingency_lifecycle_model` | `NINE_STATE_CONTINGENCY_LIFECYCLE`            |
| `technical_owner`             | Tecnología de Vento Group                     |
| `canonical_repository`        | `vento-shell`                                 |
| `governing_task`              | `TSVC-CAT-008`                                |

`DEFINED` significa que las decisiones documentales están cerradas para las diez identidades. No significa que exista infraestructura redundante, almacenamiento local, proveedor alterno, procedimiento manual operativo, configuración de alertas, runbook ejecutable ni evidencia de recuperación.

##### 3.2. Separación de estados y responsabilidades

Toda materialización futura deberá distinguir cuatro capas:

| Capa                       | Pregunta que responde                                                                   | Fuente propietaria                     |
| -------------------------- | --------------------------------------------------------------------------------------- | -------------------------------------- |
| `ESTADO_DE_OPERACION`      | ¿Qué ocurrió con una intención concreta?                                                | `TSVC-CAT-006`                         |
| `ESTADO_DE_DISPONIBILIDAD` | ¿Puede el servicio producir ahora un resultado mínimo seguro?                           | `TSVC-CAT-008`                         |
| `MODO_OPERATIVO`           | ¿Mediante qué capacidad limitada o alternativa está operando el servicio?               | `TSVC-CAT-008`                         |
| `CICLO_DE_CONTINGENCIA`    | ¿En qué etapa de detección, contención, recuperación o conciliación está la afectación? | `TSVC-CAT-008` y gestión de incidentes |

Reglas:

1. un servicio puede estar `DEGRADED_SAFE` mientras algunas operaciones están `BLOCKED` o `QUEUED`;
2. una operación `SUCCEEDED` no demuestra que el servicio completo esté sano;
3. un servicio `AVAILABLE` no confirma el resultado empresarial de cada operación;
4. `RESULT_UNKNOWN` pertenece a la operación y obliga a conciliación aunque la dependencia vuelva a estar disponible;
5. la restauración técnica no equivale a recuperación empresarial ni a cierre de conciliación;
6. el servicio transversal conserva ejecución técnica; la aplicación propietaria conserva la decisión empresarial;
7. el custodio local atiende dispositivo, energía, papel, conectividad o soporte físico sin adquirir autoridad sobre el contrato;
8. la autoridad de seguridad puede suspender identidad, credencial o capacidad insegura sin declarar resultado empresarial;
9. una contingencia no cambia el owner del dato, documento, evidencia, evento, proceso o recurso;
10. ninguna capa puede inferirse únicamente desde una alerta, un código HTTP, una conexión activa o un heartbeat.

##### 3.3. Estados canónicos de disponibilidad

| Estado                    | Significado                                                                                                                                    |
| ------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| `AVAILABLE`               | El servicio puede producir el resultado técnico ordinario dentro del contrato y controles aprobados.                                           |
| `DEGRADED_SAFE`           | El servicio conserva un resultado mínimo explícito bajo capacidad, canal, alcance o modalidad reducidos sin omitir controles obligatorios.     |
| `UNAVAILABLE`             | No existe una forma segura de aceptar o completar la capacidad solicitada.                                                                     |
| `UNKNOWN`                 | La evidencia disponible no permite determinar salud, resultado o capacidad; no se asume disponibilidad.                                        |
| `RECOVERING`              | La dependencia o servicio se está restaurando de forma controlada y todavía no ha cumplido todos los criterios de salida.                      |
| `RECONCILIATION_REQUIRED` | La ejecución técnica fue restaurada, pero existen operaciones, efectos, colas, evidencias o resultados que deben conciliarse antes del cierre. |

Reglas:

1. `DEGRADED_SAFE` exige un resultado mínimo definido, límites, owner, señales y criterio de retorno;
2. un estado desconocido no se redondea a disponible ni a detenido;
3. `RECOVERING` no habilita automáticamente la capacidad completa;
4. `RECONCILIATION_REQUIRED` permanece hasta resolver o asignar cada residual con dueño y condición de salida;
5. la interfaz y los consumidores deberán distinguir los seis estados y no reducirlos a online u offline;
6. la métrica de disponibilidad conservará tiempo, volumen y alcance por estado;
7. una dependencia externa puede estar indisponible mientras el servicio permanece degradado de forma segura;
8. una pérdida de integridad, autoridad o auditoría obligatoria puede exigir `UNAVAILABLE` aunque otros componentes estén activos.

##### 3.4. Modos operativos controlados

| Modo                            | Uso permitido                                                                                                         | Condición mínima                                                                                      |
| ------------------------------- | --------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `NORMAL`                        | Operación ordinaria bajo contrato, capacidad y dependencias aprobadas.                                                | Todos los gates obligatorios vigentes.                                                                |
| `DEGRADED_CAPACITY_LIMITED`     | Reducir concurrencia, throughput, consumidores, prioridades o alcance para proteger integridad y trabajo crítico.     | Límites versionados, backpressure y señal visible.                                                    |
| `DEGRADED_QUEUE_ONLY`           | Aceptar únicamente trabajo que pueda reservarse duraderamente y devolver receipt consultable sin prometer efecto.     | Persistencia, idempotencia, capacidad y deadline válidos.                                             |
| `DEGRADED_READ_ONLY`            | Permitir consulta de datos confirmados o caché con frescura explícita, sin mutaciones que exijan estado actual.       | Fuente, versión, antigüedad, finalidad y comportamiento obsoleto declarados.                          |
| `DEGRADED_LOCAL_BUFFER`         | Capturar temporalmente una intención o evidencia en almacenamiento local protegido para sincronización posterior.     | Política por operación, dispositivo enrolado, cifrado, límites, identidad, expiración y conciliación. |
| `DEGRADED_ALTERNATE_DEPENDENCY` | Usar proveedor, worker pool, canal, dispositivo o endpoint alterno compatible.                                        | Contrato, versión, credencial, idempotencia, autoridad y resultado equivalentes o más restrictivos.   |
| `DEGRADED_MANUAL_HANDOFF`       | Ejecutar un procedimiento manual controlado que preserve folio, datos mínimos, autoridad, custodia y reconciliación.  | Procedimiento aprobado, responsable, formato versionado, límites y retorno definidos.                 |
| `SUSPENDED_UNSAFE`              | Bloquear intake o ejecución cuando continuar pueda producir pérdida, doble efecto, acceso indebido o evidencia falsa. | Causa explícita, alcance, comunicación, owner y condición de reactivación.                            |
| `RECOVERING`                    | Reintroducir capacidad mediante probes, canarios, límites y drenaje gradual.                                          | Dependencias verificadas, observabilidad suficiente y rollback disponible.                            |
| `RECONCILIATION_REQUIRED`       | Mantener operación limitada mientras se resuelven efectos ambiguos, huérfanos, conflictos o backlog residual.         | Inventario de residuales, owner, prioridad, evidencia y criterio de cierre.                           |

Una misma contingencia puede usar más de un modo por operación, sede, dispositivo, consumidor o dependencia, pero cada combinación debe estar declarada. No se aprueba un modo global indiscriminado para toda una aplicación.

##### 3.5. Jerarquía de degradación segura

La selección deberá recorrer, en orden, la alternativa menos riesgosa que preserve el resultado mínimo:

1. mantener consulta de estado y resultados ya confirmados;
2. limitar capacidad, concurrencia, prioridad o alcance;
3. detener llamadas a la dependencia afectada mediante circuit breaker;
4. aceptar en cola durable únicamente cuando la reserva sea segura;
5. capturar localmente solo las operaciones expresamente habilitadas;
6. usar una dependencia alterna compatible y previamente gobernada;
7. aplicar procedimiento manual controlado cuando el dominio lo permita;
8. suspender la capacidad cuando ninguna alternativa conserve autoridad, integridad, evidencia y conciliación.

Reglas:

- no se elige un fallback más permisivo para evitar un bloqueo correcto;
- no se usa una copia obsoleta para una mutación que exige estado actual;
- no se cambia de proveedor, dispositivo o canal después de un efecto ambiguo sin conciliar primero;
- no se amplían permisos, deadlines o capacidad por estar en contingencia;
- no se acepta trabajo ilimitado en una cola o buffer;
- no se elimina silenciosamente trabajo para recuperar capacidad;
- no se convierte una operación manual en fuente de verdad permanente;
- no se restaura operación completa por la sola desaparición de una alerta.

##### 3.6. Clases canónicas de activación

| ID             | Clase                                    | Condición semántica                                                                                   |
| -------------- | ---------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `TSVC-TRG-001` | `DEPENDENCY_UNAVAILABLE`                 | Una dependencia requerida no responde o rechaza sistemáticamente dentro del contrato.                 |
| `TSVC-TRG-002` | `DEPENDENCY_DEGRADED`                    | La dependencia responde con latencia, error, capacidad o precisión insuficientes.                     |
| `TSVC-TRG-003` | `WORKER_STALE_OR_UNREADY`                | Heartbeat, readiness, lease o capacidad del worker pierden frescura o validez.                        |
| `TSVC-TRG-004` | `BACKLOG_OR_CAPACITY_SATURATION`         | Profundidad, edad o drenaje esperado exceden la envolvente aprobada.                                  |
| `TSVC-TRG-005` | `RETRY_STORM_OR_AMPLIFICATION`           | Reintentos crecen sin recuperación proporcional o amplifican la falla.                                |
| `TSVC-TRG-006` | `DEADLINE_OR_EXPIRATION_RISK`            | Una operación se aproxima o supera deadline, vigencia o ventana empresarial.                          |
| `TSVC-TRG-007` | `RESULT_UNKNOWN_PERSISTENT`              | Un efecto posible permanece sin confirmación suficiente.                                              |
| `TSVC-TRG-008` | `DEAD_LETTER_OR_QUARANTINE_GROWTH`       | Aumentan unidades aisladas sin resolución automática segura.                                          |
| `TSVC-TRG-009` | `CREDENTIAL_OR_IDENTITY_COMPROMISE`      | Una credencial, principal, dispositivo o firma está comprometida, revocada o no verificable.          |
| `TSVC-TRG-010` | `INTEGRITY_OR_STORAGE_FAILURE`           | Hash, original, evidencia, metadato, transacción o persistencia no pueden conservarse con integridad. |
| `TSVC-TRG-011` | `NETWORK_DEVICE_OR_SITE_DISRUPTION`      | Red, energía, dispositivo, periférico o sede pierden capacidad requerida.                             |
| `TSVC-TRG-012` | `OBSERVABILITY_OR_AUDIT_VISIBILITY_LOSS` | La propia captura de señales o auditoría pierde frescura, completitud o disponibilidad.               |

La activación real requiere una condición versionada derivada de SLO, baseline, criticidad, capacidad, ambiente y ventana. Esta tarea no asigna umbrales universales.

##### 3.7. Clases canónicas de acción

| ID             | Acción                          | Finalidad                                                                                 |
| -------------- | ------------------------------- | ----------------------------------------------------------------------------------------- |
| `TSVC-ACT-001` | `CIRCUIT_OPEN`                  | Detener llamadas que agravan una dependencia fallida.                                     |
| `TSVC-ACT-002` | `BACKPRESSURE`                  | Reducir o rechazar intake de forma visible antes de perder trabajo.                       |
| `TSVC-ACT-003` | `RATE_OR_CONCURRENCY_LIMIT`     | Proteger capacidad crítica y evitar saturación.                                           |
| `TSVC-ACT-004` | `BULKHEAD_ISOLATION`            | Aislar servicio, consumidor, proveedor, dispositivo, sede o clase de trabajo afectada.    |
| `TSVC-ACT-005` | `DURABLE_QUEUE_ACCEPTANCE`      | Reservar una intención con receipt sin afirmar ejecución.                                 |
| `TSVC-ACT-006` | `PROTECTED_LOCAL_BUFFER`        | Conservar temporalmente una captura autorizada y reconciliable.                           |
| `TSVC-ACT-007` | `READ_ONLY_PROJECTION`          | Mantener consulta de información confirmada o con frescura visible.                       |
| `TSVC-ACT-008` | `ALTERNATE_DEPENDENCY`          | Reencaminar hacia una dependencia compatible ya aprobada.                                 |
| `TSVC-ACT-009` | `MANUAL_CONTROLLED_HANDOFF`     | Continuar mediante procedimiento manual trazable y temporal.                              |
| `TSVC-ACT-010` | `SUSPEND_INTAKE_OR_EXECUTION`   | Evitar efectos inseguros cuando no existe alternativa válida.                             |
| `TSVC-ACT-011` | `CONTROLLED_DRAIN_AND_PROBE`    | Restaurar gradualmente, validar salud y drenar backlog sin tormenta.                      |
| `TSVC-ACT-012` | `RECONCILE_AND_CLOSE_RESIDUALS` | Resolver resultados ambiguos, huérfanos, conflictos y efectos parciales antes del cierre. |

##### 3.8. Circuit breaker, bulkhead y backpressure

El circuit breaker utiliza estados conceptuales cerrados:

| Estado      | Regla                                                                                |
| ----------- | ------------------------------------------------------------------------------------ |
| `CLOSED`    | Las llamadas se permiten dentro del contrato y capacidad aprobados.                  |
| `OPEN`      | Las llamadas ordinarias se bloquean y se aplica el modo degradado definido.          |
| `HALF_OPEN` | Solo probes o canarios limitados verifican recuperación sin liberar todo el tráfico. |

Reglas:

1. abrir el circuito no marca operaciones pendientes como fallidas ni exitosas;
2. cerrar el circuito exige evidencia suficiente y no solo ausencia de errores recientes;
3. `HALF_OPEN` limita volumen, operación, ambiente y dependencia;
4. una respuesta ambigua anterior se concilia antes de reenviar mediante la dependencia restaurada;
5. el breaker se particiona por dominio de fallo cuando sea posible para no detener capacidades independientes;
6. un proveedor, dispositivo o consumidor afectado no arrastra automáticamente a todos los demás;
7. el bulkhead conserva colas, workers, credenciales, capacidad y métricas separables por partición aprobada;
8. el backpressure se activa antes del límite de pérdida y devuelve estado, causa, receipt o rechazo controlado según contrato;
9. el trabajo ya aceptado no se descarta para liberar espacio;
10. los límites concretos se derivan de capacidad, almacenamiento, SLO, criticidad y carga observada;
11. prioridad nunca rompe causalidad, autorización, orden, deadline ni segregación;
12. el drenaje protege operaciones foreground críticas y evita que el backlog histórico monopolice recursos.

##### 3.9. Ciclo de vida de la contingencia

Toda contingencia conserva un ciclo de vida independiente del estado de la operación y del resultado empresarial:

| Estado de contingencia | Significado                                                                                                                      |
| ---------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `DETECTED`             | Una señal o hecho verificable indica posible pérdida de capacidad, integridad, seguridad o visibilidad.                          |
| `ASSESSED`             | Se determinan servicio, dependencia, alcance, criticidad, operaciones afectadas y nivel de certeza.                              |
| `CONTAINED`            | Se detiene la propagación mediante aislamiento, breaker, límites, suspensión o protección equivalente.                           |
| `DEGRADED_ACTIVE`      | Opera un modo degradado aprobado, con alcance, owner, vigencia, límites y comunicación explícitos.                               |
| `RECOVERY_READY`       | La dependencia o capacidad candidata cumple precondiciones para una recuperación controlada.                                     |
| `RECOVERING`           | Se ejecutan probes, reapertura gradual, drenaje, revalidación y restauración por etapas.                                         |
| `RECONCILING`          | Se resuelven resultados desconocidos, duplicados, huérfanos, conflictos, efectos parciales y soportes manuales.                  |
| `RESTORED`             | La capacidad normal fue restablecida y los criterios técnicos y empresariales de salida quedaron demostrados.                    |
| `BLOCKED`              | No existe una salida segura o falta una autoridad, dependencia, evidencia o decisión concreta; la operación permanece contenida. |

Reglas:

1. `DETECTED` no activa automáticamente una alternativa; primero se evalúan alcance y seguridad;
2. `CONTAINED` puede implicar indisponibilidad deliberada cuando continuar sería más riesgoso;
3. `DEGRADED_ACTIVE` exige un modo de operación específico, no la frase genérica “funcionamiento parcial”;
4. `RECOVERY_READY` exige evidencia de dependencia, credencial, versión, integridad, capacidad y observabilidad suficientes;
5. `RECOVERING` no equivale a disponibilidad plena;
6. `RECONCILING` puede continuar después de recuperar técnicamente el servicio;
7. `RESTORED` exige resolver o asignar todos los residuales con owner y condición de cierre;
8. `BLOCKED` identifica la causa, la tarea o autoridad responsable y la condición de salida;
9. toda transición registra actor o principal, momento, causa, evidencia y versión de política;
10. una contingencia cerrada no borra el incidente, las operaciones afectadas ni las decisiones adoptadas.

##### 3.10. Registro mínimo de contingencia

Toda materialización futura deberá conservar, cuando aplique:

```text
contingency_id
contingency_policy_id
contingency_policy_version
service_id
contract_id
contract_version
environment
trigger_class
trigger_signal_reference
detected_at
assessed_at
activated_at
expires_at
current_state
availability_state
operating_mode
scope_type
scope_reference
business_owner_application
technical_owner
incident_reference
affected_operation_types
affected_operation_count
blocked_capabilities
preserved_capabilities
fallback_action_ids
alternate_dependency_reference
manual_procedure_reference
activation_authority
activation_principal
communication_reference
recovery_owner
recovery_started_at
reconciliation_required
reconciliation_reference
restored_at
closure_authority
residual_risk_reference
```

Reglas:

1. `contingency_id` identifica un episodio y no se reutiliza;
2. toda activación referencia una política versionada;
3. el alcance puede limitarse por servicio, operación, contrato, consumidor, proveedor, dispositivo, sede, área o ambiente;
4. capacidades bloqueadas y preservadas se declaran por separado;
5. la dependencia alterna no se registra como propietaria del proceso;
6. el procedimiento manual se referencia por identidad y versión, no se improvisa dentro del incidente;
7. una activación sin vencimiento requiere revisión periódica explícita y no puede convertirse en estado permanente por omisión;
8. la recuperación técnica y la conciliación empresarial conservan owners distintos cuando corresponda;
9. el registro no almacena secretos, payloads completos ni datos personales innecesarios;
10. toda excepción de seguridad o autoridad permanece prohibida salvo que exista un mecanismo de emergencia aprobado por `TSVC-CAT-005`.

##### 3.11. Autoridad de activación, cambio y cierre

| Decisión                                              | Autoridad mínima                                                                                                      |
| ----------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| Limitar capacidad o abrir circuit breaker técnico     | Propietario técnico, conforme a política versionada y criticidad.                                                     |
| Suspender una capacidad insegura                      | Propietario técnico; aplicación propietaria informada cuando exista impacto empresarial.                              |
| Activar captura local o cola durable                  | Política aprobada, owner técnico y aplicación propietaria del resultado.                                              |
| Cambiar a dependencia, proveedor, dispositivo o canal | Propietario técnico y owner empresarial cuando cambie alcance, resultado, destinatario, costo, evidencia o condición. |
| Activar procedimiento manual controlado               | Responsable operativo autorizado y aplicación propietaria, bajo procedimiento vigente.                                |
| Ejecutar intervención de emergencia                   | Autoridad de emergencia definida, identidad temporal y auditoría completa.                                            |
| Reanudar intake o ejecución                           | Owner técnico después de probes, capacidad, integridad, identidad y observabilidad suficientes.                       |
| Declarar recuperación empresarial                     | Aplicación propietaria después de conciliación, residuales y evidencia.                                               |
| Cerrar contingencia                                   | Owner técnico y owner empresarial cuando ambos hayan tenido responsabilidades materiales.                             |

Reglas:

1. ningún worker, scheduler, proveedor, dispositivo o alerta activa por sí mismo una decisión empresarial;
2. una política automática puede ejecutar acciones técnicas preaprobadas dentro de límites cerrados;
3. una política automática no puede ampliar permisos, aprobar gastos, sustituir productos, aceptar entregas, cerrar pagos ni compensar resultados;
4. un operador local puede atender energía, papel, conectividad o sustitución física autorizada sin alterar contratos, contenido o estados propietarios;
5. una intervención manual identifica actor humano real y no se atribuye únicamente al principal técnico;
6. la ausencia del responsable nominal no elimina la responsabilidad institucional ni autoriza bypass;
7. toda activación material genera auditoría correlacionada con el incidente y las operaciones afectadas;
8. el cierre no se delega a una alerta que dejó de cumplirse.

##### 3.12. Identidad, credenciales y autorización durante contingencia

1. La degradación no amplía rol, permiso, territorio, sede, área, recurso, finalidad, dispositivo, proveedor ni vigencia.
2. Un principal revocado, comprometido, expirado o no verificable no se reutiliza por continuidad.
3. La identidad de emergencia permanece separada de la ordinaria, tiene alcance y duración mínimos y se retira al finalizar.
4. `SUPABASE_SERVICE_ROLE_KEY` no se adopta como fallback general ni como identidad compartida entre servicios.
5. Un procedimiento manual no autoriza credenciales compartidas, firmas genéricas, PIN reutilizado, actor ficticio ni acceso anónimo a una acción sensible.
6. Una operación capturada offline conserva actor, aplicación, dispositivo, contexto, recurso, versión observada, autoridad y momento del hecho.
7. Al reconectar se revalida autorización, versión, estado, cancelación, revocación, deadline y dependencias antes del efecto.
8. Si la autoridad expiró, la operación queda `BLOCKED`, `REJECTED` o `RECONCILIATION_REQUIRED` según contrato; no se ejecuta retroactivamente bajo el permiso anterior.
9. Una dependencia alterna usa credencial, audience, ambiente y scope propios; no hereda secretos de la dependencia primaria.
10. El observador de salud conserva solo lectura durante contingencia y no puede mutar trabajos, reintentar, conciliar o compensar.
11. Toda exportación de diagnóstico o acceso extraordinario permanece auditada y minimizada.
12. La recuperación de una credencial no cambia la intención, la clave idempotente ni la aplicación propietaria del resultado.

##### 3.13. Relación con deadlines, reintentos y resultado desconocido

1. El modo degradado no reinicia `attempt_no`, presupuesto de reintento, deadline ni vigencia empresarial.
2. Abrir un circuit breaker evita nuevos intentos hacia la dependencia, pero conserva la operación y su próxima condición de evaluación.
3. El tiempo de espera sin llamada real no consume intento, aunque sí consume deadline cuando el contrato así lo define.
4. `RESULT_UNKNOWN` prevalece sobre una repetición automática cuando el efecto pudo ocurrir.
5. Un cambio de proveedor, dispositivo o canal después de un efecto ambiguo requiere primero conciliación o una decisión empresarial explícita que tolere el posible doble efecto.
6. `DEAD_LETTER` y `QUARANTINED` no se drenan automáticamente al restaurar el servicio.
7. Una operación vencida no se reactiva por recuperar conectividad; se clasifica y concilia según la política propietaria.
8. Un retry storm activa contención, backpressure y circuit breaker antes de ampliar capacidad o intentos.
9. La política de contingencia puede reducir el presupuesto de reintentos; ampliarlo exige decisión versionada, seguridad y evidencia.
10. La recuperación conserva la misma `idempotency_key` para la misma intención y crea nuevos `attempt_id` solo cuando existe ejecución real.
11. Los resultados tardíos se comparan con cancelación, fencing, versión y estado autoritativo antes de aplicarse.
12. Una nueva intención empresarial posterior a la contingencia usa otra clave y referencia la operación anterior cuando corresponda.

##### 3.14. Captura local y operación offline

La captura local solo es admisible cuando la operación tiene una clase offline aprobada y el dispositivo satisface los controles correspondientes.

Reglas:

1. `DEGRADED_LOCAL_BUFFER` no significa ejecución empresarial local salvo que exista una política `OF4_LEASED_EXECUTION` específica y vigente;
2. toda intención se identifica antes de persistir y conserva clave idempotente estable;
3. el buffer local es durable, cifrado o protegido según sensibilidad y separado por actor, aplicación, área y dispositivo;
4. cada elemento conserva esquema, versión, dependencias, prioridad, deadline, tamaño, sensibilidad y estado humano;
5. el usuario distingue `LOCAL_CAPTURED`, `QUEUED`, `SYNCING`, `SERVER_RECEIVED`, `CONFIRMED`, `RESULT_UNKNOWN`, `CONFLICT`, `REJECTED` y `RECONCILIATION_REQUIRED`;
6. ninguna captura local se presenta como resultado confirmado;
7. los límites de operaciones, bytes, archivos, antigüedad y backlog se aplican antes de llenar almacenamiento;
8. al acercarse al límite se activa backpressure, priorización, rechazo controlado o procedimiento manual; nunca eliminación silenciosa;
9. cierre, reinicio, actualización o cambio de actor no descartan ni transfieren pendientes sin política compatible;
10. una actualización incompatible pone la cola en cuarentena o migración segura; no prueba payloads antiguos por ensayo y error;
11. la reconexión estabiliza red, reloj, sesión, dispositivo, contexto, versiones y revocaciones antes de drenar;
12. el drenaje respeta causalidad y protege acciones foreground críticas;
13. conflictos de versión, cantidad, custodia, estado o autoridad no se resuelven mediante `last write wins`;
14. archivos, fotografías, firmas y mediciones mantienen estados locales y remotos independientes;
15. la certificación futura deberá probar pérdida antes, durante y después del envío, reconexión inestable, almacenamiento lleno, reloj incorrecto, reinicio, concurrencia y evidencia parcial.

##### 3.15. Contingencia manual controlada

Un procedimiento manual solo puede sostener operación mínima cuando declare:

```text
manual_procedure_id
manual_procedure_version
service_id
business_process_reference
activation_condition
activation_authority
responsible_role
substitute_role
allowed_operations
forbidden_operations
folio_or_numbering_rule
minimum_fields
identity_and_signature_rule
custody_rule
duplicate_control
time_rule
capacity_limit
communication_rule
digitization_rule
reconciliation_rule
closure_rule
```

Reglas:

1. papel, chat, memoria, hoja libre o mensaje no se convierten por sí mismos en procedimiento aprobado;
2. el soporte manual conserva folio, actor, momento, origen, recurso, cantidad, estado, evidencia y destino cuando apliquen;
3. no se capturan secretos ni datos excesivos;
4. la numeración o identidad permite detectar repetición y relacionar la digitalización posterior;
5. la contingencia manual no modifica la fuente de verdad ni habilita operaciones prohibidas;
6. no se permite cierre empresarial cuando falta evidencia obligatoria, autoridad, custodia o aceptación requerida;
7. la digitalización no copia ciegamente; valida duplicados, versión, contexto, estado, autoridad y efectos ya ocurridos;
8. las diferencias se registran y concilian sin sobrescribir el soporte original;
9. el procedimiento tiene capacidad máxima, vigencia, responsable y condición de suspensión;
10. al restaurar el servicio se detiene la creación de nuevos soportes antes de iniciar el cierre y conciliación;
11. los soportes manuales quedan vinculados a la operación digital resultante o a una disposición documentada;
12. la permanencia prolongada exige revisión y no convierte el procedimiento en operación ordinaria.

##### 3.16. Dependencia alterna y failover

Una dependencia alterna solo puede activarse cuando exista compatibilidad aprobada y evidencia suficiente.

Reglas:

1. la dependencia alterna tiene identidad, contrato, versión, credencial, capacidad, costo, territorio y limitaciones propios;
2. el failover no cambia semántica empresarial, unidad, destinatario, plantilla, clasificación, integridad ni autorización;
3. una traducción usa adaptador versionado y no inventa campos autoritativos;
4. se verifica si la dependencia primaria pudo producir efecto antes de enviar a la alterna;
5. el mismo `idempotency_key` identifica la intención, pero cada entrega técnica conserva identidad propia;
6. una alterna con menor garantía solo puede usarse si el contrato lo admite y el usuario o responsable recibe el estado correcto;
7. un proveedor alterno no obtiene acceso directo a fuentes internas ni credenciales del proveedor primario;
8. el retorno a la dependencia primaria es controlado y evita oscilación mediante estabilidad, probes y ventana de observación;
9. no se distribuye tráfico simultáneo entre primario y alterno cuando exista riesgo de doble efecto no deduplicable;
10. una alterna no probada permanece `BLOQUEADA` y no se activa por urgencia;
11. si ninguna dependencia cumple, la capacidad pasa a `SUSPENDED_UNSAFE` o procedimiento manual aprobado;
12. toda activación y retorno quedan auditados y correlacionados.

##### 3.17. Recuperación, drenaje y retorno a operación normal

La recuperación aplica la siguiente secuencia mínima:

```text
CONTENER
→ VERIFICAR DEPENDENCIA, IDENTIDAD, INTEGRIDAD Y RELOJ
→ ACTIVAR PROBES LIMITADOS
→ HABILITAR CAPACIDAD MÍNIMA
→ DRENAR TRABAJO ELEGIBLE POR CAUSALIDAD Y PRIORIDAD
→ CONCILIAR RESULTADOS DESCONOCIDOS Y SOPORTES MANUALES
→ RESTAURAR CAPACIDAD ORDINARIA
→ CERRAR RESIDUALES Y REVISAR
```

Reglas:

1. la dependencia recuperada no recibe todo el backlog inmediatamente;
2. los probes no ejecutan efectos empresariales irreversibles salvo que sean operaciones sintéticas aisladas y aprobadas;
3. el drenaje aplica límites de concurrencia, rate, consumidor, proveedor, dispositivo y sede;
4. las operaciones vencidas, canceladas, revocadas, incompatibles, en dead-letter o cuarentena se clasifican antes de ejecutar;
5. los resultados desconocidos se consultan antes de reenviar;
6. el trabajo manual se digitaliza y concilia antes de cerrar su procedimiento;
7. las operaciones nuevas críticas conservan capacidad durante el drenaje histórico;
8. la reapertura por etapas permite volver a contención sin perder trazabilidad;
9. `AVAILABLE` exige salud técnica, observabilidad suficiente, capacidad y contrato, pero el cierre empresarial sigue en la aplicación propietaria;
10. la recuperación técnica se registra separada de la recuperación empresarial;
11. los gaps de telemetría, auditoría o evidencia se preservan como gaps y no se completan con datos inventados;
12. la revisión posterior identifica causa, barreras fallidas, duración, alcance, decisiones, residuales, acción preventiva y evidencia de eficacia.

##### 3.18. Pérdida del pipeline de observabilidad o auditoría

La pérdida de visibilidad se trata como degradación propia y no como evidencia de salud.

Reglas:

1. una falla de métricas o trazas no detiene automáticamente operaciones que conservan contrato, integridad, autoridad y auditoría suficiente;
2. una acción sensible cuya auditoría obligatoria no pueda persistirse debe fallar de forma cerrada o usar un buffer local duradero expresamente aprobado;
3. los logs de consola o memoria no sustituyen auditoría durable;
4. el servicio expone `UNKNOWN` o `DEGRADED` cuando no puede demostrar estado, frescura o cobertura;
5. no se fabrican heartbeats, timestamps, spans, eventos o métricas retrospectivas para rellenar el vacío;
6. la señal local preserva el momento del hecho y el momento de exportación posterior;
7. el buffer de observabilidad tiene límites, backpressure, cifrado, prioridad y disposición definidos;
8. las señales de seguridad, integridad, intervención manual y resultado desconocido no se descartan por muestreo ordinario;
9. la recuperación del pipeline verifica agentes, collectors, exportación, recepción, reglas, dashboards y canal extremo a extremo;
10. un canal de alerta alterno no modifica la condición ni el estado empresarial;
11. los periodos sin visibilidad permanecen explícitos en reportes y SLI;
12. si la pérdida impide controlar una operación crítica, esa capacidad pasa a `SUSPENDED_UNSAFE` hasta recuperar controles suficientes.

##### 3.19. Matriz canónica de contingencia por servicio

| Servicio       | Fallo o degradación dominante                                                       | Modo mínimo preservable                                                                                    | Acción de contención principal                                                                                      | Criterio que obliga a suspender                                                                                              | Recuperación y conciliación obligatorias                                                                                   | Estado material |
| -------------- | ----------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- | --------------- |
| `TSVC-SVC-001` | workers no disponibles, backlog, leases vencidos, saturación o dependencia caída    | `DEGRADED_QUEUE_ONLY` o `DEGRADED_CAPACITY_LIMITED` si la reserva durable y el deadline permanecen seguros | breaker por dependencia, backpressure, bulkhead, límites de intake y aceptación con receipt                         | no existe reserva durable, se agotó capacidad, expiró autoridad o no puede garantizarse idempotencia                         | probes, reclaims con fencing, drenaje causal, clasificación de vencidos, dead-letter y resultados desconocidos             | `ESPECIFICADO`  |
| `TSVC-SVC-002` | entrega a consumidor caída, outbox atrasado, contrato incompatible o replay         | `DEGRADED_QUEUE_ONLY` con evento persistido atómicamente y consumo diferido                                | pausar consumidor, aislar partición y preservar `event_id`, orden y versión                                         | no puede persistirse el evento requerido con la transacción o existe riesgo de marcar entrega inexistente                    | reanudar por consumidor, replay idempotente, conservar orden, resolver ACK ambiguo y verificar cero eventos huérfanos      | `ESPECIFICADO`  |
| `TSVC-SVC-003` | impresora, adaptador, red, papel, layout o receipt físico incierto                  | cola durable; dispositivo alterno compatible; procedimiento manual aprobado                                | detener reintento físico ciego, aislar dispositivo y mantener estado `RESULT_UNKNOWN` cuando aplique                | no existe dispositivo compatible, falta evidencia obligatoria, layout no válido o no puede distinguirse una copia previa     | verificar dispositivo, consultar spool o inspección, reimprimir solo con nueva intención autorizada y conciliar copias     | `ESPECIFICADO`  |
| `TSVC-SVC-004` | proveedor, canal, destino, rate limit o renderizado degradado                       | cola diferida o canal alterno aprobado con misma finalidad, contenido y vigencia                           | circuit breaker por canal o proveedor, rate limit, supresión temporal gobernada y backpressure                      | mensaje vencido, destinatario no autorizado, ausencia de canal compatible o comunicación obligatoria no entregable           | consultar proveedor, reanudar por canal, evitar duplicados, expirar mensajes inválidos y conciliar entregas ambiguas       | `ESPECIFICADO`  |
| `TSVC-SVC-005` | renderer, plantilla, fuente, Storage o capacidad de generación no disponibles       | cola durable; consulta de documentos confirmados; renderer alterno compatible                              | detener generación nueva, proteger snapshot y plantilla, aislar outputs parciales                                   | fuente o plantilla no pueden congelarse, integridad no verificable o resultado obligatorio no puede producirse               | regenerar idempotentemente, comparar hash y versión, cuarentenar parciales y vincular supersesión o resultado recuperado   | `ESPECIFICADO`  |
| `TSVC-SVC-006` | Storage, metadata, hash, clasificación, upload o acceso degradados                  | `DEGRADED_READ_ONLY` o `DEGRADED_LOCAL_BUFFER` protegido para ingestiones autorizadas                      | suspender confirmación, aislar objeto o metadata, bloquear exposición y aplicar límites de buffer                   | no puede protegerse contenido sensible, falta capacidad durable, integridad no verificable o vínculo propietario desconocido | reconciliar objeto y metadata, verificar hash, resolver huérfanos, confirmar custodia o cuarentenar sin perder el original | `ESPECIFICADO`  |
| `TSVC-SVC-007` | evidencia obligatoria, hash, firma, lineage, dispositivo o almacenamiento fallan    | captura local protegida cuando esté aprobada; consulta de evidencia confirmada                             | impedir cierre empresarial dependiente, conservar original y aislar evidencia incompleta o conflictiva              | no puede identificarse actor, hecho, momento, integridad o custodia; la evidencia es requisito duro del proceso              | subir y verificar, reconciliar con el hecho, conservar correcciones vinculadas y no sustituir el original                  | `ESPECIFICADO`  |
| `TSVC-SVC-008` | proveedor externo, firma, mapping, red, timeout, rate limit o ACK ambiguo           | recepción durable con ACK controlado; cola saliente; proveedor alterno compatible                          | breaker por proveedor y operación, no emitir éxito falso, aislar mapping incompatible y preservar payload protegido | no puede verificarse origen, persistirse recepción, garantizarse mapping o evitar doble efecto externo                       | consultar proveedor, deduplicar replay, reenviar solo cuando sea seguro, conciliar estado externo e interno                | `ESPECIFICADO`  |
| `TSVC-SVC-009` | scheduler, reloj, regla, misfire, solapamiento, worker o dependencia no disponibles | pausa controlada, ocurrencia pendiente o coalescing según política                                         | detener nuevos triggers inseguros, conservar ocurrencia lógica y evitar catch-up storm                              | regla, versión, autoridad, reloj o deadline no son válidos; la ocurrencia no admite ejecución tardía                         | clasificar misfires, ejecutar solo ocurrencias elegibles, vincular ejecución manual y conciliar solapamientos              | `ESPECIFICADO`  |
| `TSVC-SVC-010` | heartbeat, collector, reloj, canal, almacenamiento o visibilidad degradados         | health local mínimo o estado `UNKNOWN`; observación de solo lectura                                        | declarar visibilidad degradada, impedir conclusiones de salud y suspender automatismos basados en señal incierta    | una operación crítica requiere health o auditoría que no puede demostrarse                                                   | recuperar pipeline extremo a extremo, preservar gaps, revalidar workers y no reconstruir señales inexistentes              | `ESPECIFICADO`  |

##### 3.20. Perfil específico de `TSVC-SVC-001`

La orquestación genérica aplica estas decisiones:

1. puede aceptar una intención durante degradación únicamente si la reserva es durable, atómica, idempotente y cabe dentro de límites;
2. el receipt confirma reserva, no inicio ni resultado;
3. si no existe persistencia durable, el intake se rechaza de forma controlada y no se mantiene solo en memoria;
4. el backlog se particiona por criticidad, contrato, productor o dependencia cuando sea necesario para evitar propagación;
5. el circuit breaker detiene llamadas a la dependencia fallida sin perder el trabajo aceptado;
6. un worker stale pierde capacidad de claim y no puede cerrar con fencing vencido;
7. la capacidad limitada prioriza trabajo independiente y vigente sin romper causalidad;
8. `DEAD_LETTER`, `QUARANTINED`, `RESULT_UNKNOWN`, cancelados y vencidos no se mezclan con el drenaje ordinario;
9. la recuperación usa probes, claims limitados, observación de error y throughput antes de ampliar concurrencia;
10. el servicio no inventa compensaciones ni cambia el estado empresarial para reducir backlog.

##### 3.21. Perfil específico de `TSVC-SVC-002`

La entrega transaccional aplica estas decisiones:

1. cuando el evento es obligatorio, la transacción no puede declararse completa si no existe registro outbox durable en la misma frontera atómica;
2. la caída de una consumidora no elimina, recrea ni cambia `event_id`;
3. la entrega puede pausarse por consumidora, partición, versión o dependencia sin detener productoras independientes cuando la capacidad lo permita;
4. el replay conserva evento, versión, correlación, causalidad y productor originales;
5. un ACK ambiguo se concilia antes de crear otra entrega lógica;
6. el consumidor deduplica por `event_id` y conserva su propio estado de consumo;
7. el orden por agregado y versión se mantiene durante backlog y recuperación;
8. un evento incompatible se aísla y no se transforma silenciosamente;
9. restaurar el consumidor inicia drenaje limitado y no una tormenta de replay;
10. el servicio no marca entregado un evento por haberlo enviado al transporte.

##### 3.22. Perfil específico de `TSVC-SVC-003`

La impresión centralizada aplica estas decisiones:

1. el trabajo puede permanecer en cola durable cuando la impresora o adaptador están indisponibles;
2. un dispositivo alterno solo se usa si está enrolado, es compatible con layout, medio, resolución, área, seguridad y finalidad;
3. receipt del adaptador, escritura de socket o envío de bytes no demuestran impresión física;
4. si el dispositivo pudo aceptar el trabajo y se perdió la respuesta, el estado es `RESULT_UNKNOWN`;
5. no se reimprime automáticamente una operación desconocida;
6. la inspección física, spool, contador, receipt o confirmación autorizada determinan la conciliación posible;
7. una reimpresión deliberada crea otra identidad de copia, motivo, actor y autoridad, vinculada al original;
8. el procedimiento manual exige formato, numeración, contenido, custodia y conciliación aprobados;
9. falta de papel, tapa abierta, atasco, corte, contenido en blanco, desconexión o buffer divergente conservan estados distinguibles;
10. una aplicación propietaria no cierra un proceso que exige documento físico hasta recibir la evidencia contractual correspondiente.

##### 3.23. Perfil específico de `TSVC-SVC-004`

Las notificaciones y alertas aplican estas decisiones:

1. el mensaje puede diferirse en cola mientras destinatario, finalidad, contenido, preferencia y vigencia permanezcan válidos;
2. el fallback de canal conserva la misma intención comunicativa y usa una entrega técnica distinta por canal;
3. cambiar de canal exige que el destinatario, consentimiento, sensibilidad, plantilla, costo y expectativa permitan la alternativa;
4. un mensaje vencido o materialmente obsoleto no se envía al recuperar el proveedor;
5. rate limit y throttling activan backoff, circuit breaker y priorización sin ampliar intentos indefinidamente;
6. una entrega ambigua se consulta o concilia antes de usar otro canal cuando exista riesgo de comunicación duplicada o contradictoria;
7. una notificación enviada no equivale a lectura, aceptación, autorización, evidencia ni cierre empresarial;
8. supresión y silencio requieren razón, alcance, vigencia y auditoría;
9. las comunicaciones críticas sin canal válido escalan a la aplicación propietaria y pueden activar procedimiento manual aprobado;
10. la recuperación drena por vigencia, prioridad y capacidad, no únicamente por antigüedad.

##### 3.24. Perfil específico de `TSVC-SVC-005`

La generación de documentos aplica estas decisiones:

1. la solicitud se conserva con snapshot, plantilla, versión, formato, finalidad e idempotencia;
2. durante degradación puede mantenerse consulta de documentos confirmados sin habilitar generación nueva;
3. un renderer alterno requiere compatibilidad demostrada y no puede alterar contenido, paginación material, firma, códigos o semántica;
4. un output parcial o sin hash verificado se aísla y no se publica como documento final;
5. si el artefacto pudo crearse, se consulta por operación, referencia y hash antes de regenerar;
6. cambiar fuente, plantilla, versión o finalidad crea una intención nueva;
7. el servicio no usa datos cacheados vencidos cuando el documento exige estado actual;
8. la recuperación compara resultado existente, hash, formato y versión antes de reutilizar o superseder;
9. documento generado no significa aprobado, firmado, emitido legalmente, custodiado ni entregado;
10. la falta de Storage o custodia impide declarar completo el flujo cuando el contrato exige persistencia posterior.

##### 3.25. Perfil específico de `TSVC-SVC-006`

La custodia de archivos y documentos originales aplica estas decisiones:

1. `DEGRADED_READ_ONLY` puede permitir consulta de objetos confirmados dentro de autorización y frescura aplicables;
2. una ingestión local solo se admite en dispositivo y almacenamiento aprobados, con protección, hash, metadata mínima, límite y expiración;
3. el servicio no confirma custodia hasta verificar objeto, metadata, vínculo, clasificación, hash y acceso;
4. un objeto sin metadata o una metadata sin objeto se clasifican como residuales y se concilian;
5. no se usan rutas, nombres o URLs como única identidad del original;
6. una URL firmada o capacidad temporal no se registra en canales abiertos ni se prolonga por contingencia;
7. una falla de integridad, clasificación o autorización bloquea acceso y puede activar cuarentena;
8. el mismo hash no deduplica globalmente originales válidos pertenecientes a recursos distintos;
9. la recuperación reanuda uploads elegibles, verifica partes, evita duplicados y conserva el momento y actor de origen;
10. no se eliminan objetos huérfanos durante el incidente sin una decisión de disposición gobernada por `TSVC-CAT-009`.

##### 3.26. Perfil específico de `TSVC-SVC-007`

La evidencia transaccional aplica estas decisiones:

1. cuando la evidencia es obligatoria, su indisponibilidad impide el cierre empresarial dependiente;
2. una captura local autorizada conserva hecho, actor, aplicación, dispositivo, momento, tipo, secuencia, hash y referencia del recurso;
3. el momento del hecho no se sustituye por la hora de sincronización;
4. una firma, fotografía, medición o comprobante parcial no se presenta como evidencia confirmada;
5. no se sustituye ni sobrescribe evidencia previa para resolver un error;
6. una corrección crea otra evidencia vinculada y conserva el original;
7. la pérdida de dispositivo o Storage activa protección, bloqueo o procedimiento manual aprobado según sensibilidad;
8. la recuperación verifica integridad, lineage, autoridad y relación causal antes de incorporar;
9. la evidencia no autoriza retroactivamente una acción ni transforma una operación inválida en válida;
10. una ausencia de evidencia permanece visible y no se completa con inferencia o reconstrucción no demostrada.

##### 3.27. Perfil específico de `TSVC-SVC-008`

Las integraciones externas y webhooks aplican estas decisiones:

1. un webhook entrante recibe ACK exitoso solo después de validar origen suficiente y persistir durablemente la recepción o el resultado exigido por contrato;
2. si no puede persistirse de forma segura, se devuelve una respuesta reintentable y no un éxito falso;
3. los replays conservan identificador externo, payload protegido, mapping y resultado previo;
4. una firma inválida, proveedor desconocido o mapping incompatible se bloquean antes del efecto interno;
5. las salidas usan circuit breaker, cola durable, rate limit y deadline por proveedor y operación;
6. un timeout después del envío produce `RESULT_UNKNOWN` y exige consulta o conciliación;
7. un proveedor alterno solo se usa con contrato y mapping compatibles y después de evaluar el posible efecto del primario;
8. el proveedor nunca escribe directamente en fuentes internas ni decide estados empresariales;
9. la recuperación separa recepción, transformación, comando interno, ACK técnico y resultado empresarial;
10. un `2xx`, ACK o estado del proveedor no cierra por sí solo el proceso propietario.

##### 3.28. Perfil específico de `TSVC-SVC-009`

La programación y automatizaciones recurrentes aplican estas decisiones:

1. la definición de schedule y cada ocurrencia lógica permanecen separadas;
2. una caída conserva `logical_fire_at_utc`, versión, vigencia, owner y clave idempotente de la ocurrencia;
3. la política declara por operación si el misfire se omite, ejecuta una vez, reprograma, coalesce o requiere decisión;
4. no se ejecutan automáticamente todas las ocurrencias perdidas al recuperar;
5. la prioridad no crea una catch-up storm ni desplaza indefinidamente trabajo foreground crítico;
6. solapamientos se bloquean, permiten o serializan según contrato y no por comportamiento accidental del scheduler;
7. una ocurrencia vencida, revocada o sin autoridad no se ejecuta tardíamente;
8. una ejecución manual usa otra intención vinculada y no falsifica el `logical_fire_at_utc` original;
9. el reloj, zona horaria y versión se verifican antes de reanudar;
10. el scheduler dispara trabajo; no aprueba la acción empresarial ni confirma su resultado.

##### 3.29. Perfil específico de `TSVC-SVC-010`

El monitoreo y heartbeat de workers aplica estas decisiones:

1. cuando la señal pierde frescura, el estado pasa a `STALE` o `UNKNOWN`, nunca a `READY` por defecto;
2. la ausencia de heartbeat no prueba que el worker esté detenido ni que una operación no haya producido efecto;
3. no se crean heartbeats retrospectivos ni se cambia el momento real del evento al recuperar el pipeline;
4. una señal más reciente puede sustituir la necesidad de reenviar una antigua, pero el gap permanece observable;
5. liveness, readiness, capacidad, trabajo activo, leases y backlog se evalúan por separado;
6. automatismos que dependan de health incierto se suspenden o limitan según criticidad;
7. las acciones críticas con auditoría obligatoria usan un mecanismo durable alterno o fallan cerradas;
8. el observer conserva solo lectura y no usa credenciales de los servicios observados;
9. la recuperación verifica captura, exportación, recepción, reglas, dashboards y canal de alerta extremo a extremo;
10. salud del worker no demuestra éxito del proceso, disponibilidad de todas sus dependencias ni ausencia de trabajo residual.

##### 3.30. Reconciliación con activos técnicos actuales

| Activo o patrón observado                                                 | Servicio relacionado   | Clasificación de contingencia                          | Decisión canónica                                                                                                                                         |
| ------------------------------------------------------------------------- | ---------------------- | ------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Cola de impresión local de NEXO basada en almacenamiento del navegador    | `TSVC-SVC-003`         | `LOCAL_BUFFER_WITHOUT_TRANSVERSE_RECOVERY_PROOF`       | Conservar como evidencia funcional; no acredita durabilidad suficiente, límites, cifrado, actor, reconciliación, failover ni recuperación controlada.     |
| API y persistencia de layouts de impresión                                | `TSVC-SVC-003`         | `PARTIAL_CONFIGURATION_ASSET`                          | Puede aportar plantillas y configuración; no constituye contingencia de cola, dispositivo, receipt, resultado físico o reimpresión.                       |
| Registro de tokens push de empleados                                      | `TSVC-SVC-004`         | `ADDRESSING_ASSET_WITHOUT_DELIVERY_FALLBACK`           | Conservar direccionamiento compatible; no habilita canal alterno, cola durable, entrega, expiración, conciliación ni comunicación manual.                 |
| Carga documental de ANIMA hacia Storage y metadata                        | `TSVC-SVC-006`         | `APPLICATION_SCOPED_INGEST_WITHOUT_COMMON_CONTINGENCY` | Conservar flujo compatible; la solución objetivo deberá gobernar buffer, hash, límites, objeto huérfano, recuperación y confirmación transversal.         |
| Webhook de pagos identificado como temporal o fallback                    | `TSVC-SVC-008`         | `PROVIDER_SPECIFIC_FALLBACK_NOT_CANONICAL_CONTINGENCY` | Conservar solo mientras su contrato propietario lo autorice; “fallback” nominal no demuestra persistencia, idempotencia, conciliación ni seguridad común. |
| Webhook de RevenueCat específico de proveedor                             | `TSVC-SVC-008`         | `PROVIDER_SPECIFIC_ADAPTER_WITHOUT_SHARED_FAILOVER`    | Mantener como adaptador; no se generaliza como dependencia alterna ni como capacidad transversal de contingencia.                                         |
| Logs locales o de runtime y ausencia de heartbeat transversal verificable | `TSVC-SVC-010` y otros | `LOCAL_DIAGNOSTICS_WITH_VISIBILITY_GAPS`               | No se infiere salud por ausencia de errores; la pérdida de visibilidad deberá producir estado degradado o desconocido y recuperación extremo a extremo.   |

La reconciliación registra el estado técnico conocido sin afirmar migración, hardening, operación productiva, ejecución de simulacros, failover probado ni suficiencia de los activos actuales.

##### 3.31. Aplicación al carril `NEXO-REMISSIONS-001`

| Servicio       | Decisión de contingencia para remisiones NEXO                                                                                                          | Límite obligatorio                                                                                       |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------- |
| `TSVC-SVC-001` | Aceptar trabajo diferido solo con reserva durable, receipt, límites, deadline, idempotencia y capacidad de drenaje.                                    | Una cola local o memoria sin garantía no permite afirmar que la remisión seguirá procesándose.           |
| `TSVC-SVC-002` | Persistir eventos de remisión con la transacción propietaria y pausar consumidores afectados sin perder `event_id`, versión ni orden.                  | Un evento no entregado no se recrea ni se marca como consumido para liberar backlog.                     |
| `TSVC-SVC-003` | Mantener trabajos de etiquetas, comprobantes o remisiones en cola; usar impresora alterna solo si está enrolada y es compatible.                       | Receipt técnico no confirma impresión; resultado ambiguo bloquea reimpresión ciega y exige conciliación. |
| `TSVC-SVC-004` | Diferir alertas y comunicaciones; usar canal alterno únicamente si mantiene destinatario, finalidad, autorización, vigencia y contenido.               | La notificación no cambia estado de solicitud, producción, despacho, tránsito, recepción o cierre.       |
| `TSVC-SVC-005` | Conservar snapshot y versión del documento de remisión; regenerar solo de forma idempotente y verificable.                                             | Un output parcial o no custodiado no se presenta como documento final.                                   |
| `TSVC-SVC-006` | Permitir captura local protegida de soportes únicamente cuando el perfil offline lo autorice; confirmar custodia después de objeto y metadata válidos. | No se pierde el original ni se confirma por existir una ruta, nombre o preview local.                    |
| `TSVC-SVC-007` | Capturar evidencia de carga, despacho, transporte, recepción y diferencias con actor, dispositivo, momento, hash y vínculo.                            | Una remisión no se cierra cuando falta evidencia obligatoria o permanece local sin confirmación.         |
| `TSVC-SVC-008` | Poner en cola o suspender integraciones externas; conciliar timeouts y ACK ambiguos antes de reenviar.                                                 | El estado de un tercero no sustituye cantidades, custodia, aceptación ni resultado propietario de NEXO.  |
| `TSVC-SVC-009` | Clasificar expiraciones, conciliaciones y tareas recurrentes por ocurrencia lógica; evitar ejecución masiva después de una caída.                      | Una ocurrencia vencida o no autorizada no se ejecuta por recuperar el scheduler.                         |
| `TSVC-SVC-010` | Mostrar worker, dispositivo y pipeline como `DEGRADED`, `STALE` o `UNKNOWN` cuando falte evidencia suficiente.                                         | Salud técnica no marca remisión preparada, cargada, despachada, recibida ni completada.                  |

Reglas adicionales del carril:

1. NEXO conserva la fuente de verdad de remisión, líneas, cantidades, estados, custodias, diferencias y cierres.
2. La contingencia mantiene separadas cantidad solicitada, aceptada, producida, preparada, cargada, despachada, recibida, faltante, sobrante, dañada, rechazada y retornada.
3. Un receipt, mensaje, impresión, upload o heartbeat nunca sustituye la transición empresarial correspondiente.
4. Red intermitente no habilita autoaceptación, actor genérico, firma reutilizada ni cierre por conductor o despachador en nombre del receptor.
5. La captura offline conserva sede, área, origen, destino, LPN, LOC, lote, unidad, cantidad, condición, temperatura, actor y momento cuando apliquen.
6. La reconexión revalida versión, estado, autorización, custodia, reservas y dependencias antes de aplicar pendientes.
7. La conciliación detecta duplicados, líneas fuera de orden, entregas ya registradas, soportes manuales, retornos y resultados desconocidos.
8. Los bloqueos permanecen visibles y no se resuelven sobrescribiendo cantidades o estados.
9. La degradación puede limitar una capacidad sin inutilizar otras independientes, siempre que se mantengan controles y comunicación correctos.
10. Ninguna decisión documental de esta tarea habilita físicamente remisiones, workers, impresión, almacenamiento, notificaciones, integraciones o schedules.

##### 3.32. Reconciliación cuantitativa

| Control                                                 | Resultado |
| ------------------------------------------------------- | --------: |
| Servicios esperados                                     |        10 |
| Servicios materializados                                |        10 |
| Identificadores de servicio únicos                      |        10 |
| Servicios faltantes                                     |         0 |
| Servicios duplicados                                    |         0 |
| Estados canónicos de disponibilidad                     |         6 |
| Modos canónicos de operación                            |        10 |
| Clases canónicas de activación                          |        12 |
| Clases canónicas de acción                              |        12 |
| Estados del ciclo de contingencia                       |         9 |
| Estados de circuit breaker                              |         3 |
| Servicios con decisión explícita de suspensión segura   |        10 |
| Servicios con recuperación y conciliación explícitas    |        10 |
| Decisiones del carril NEXO                              |        10 |
| Activos o patrones actuales reconciliados               |         7 |
| Implementaciones físicas creadas                        |         0 |
| Cambios de Supabase                                     |         0 |
| Proveedores, dispositivos o canales alternos activados  |         0 |
| Simulacros o pruebas operativas ejecutados por la tarea |         0 |

##### 3.33. Handoff obligatorio

| Tarea posterior | Insumo recibido de `TSVC-CAT-008`                                                                                                                                                               |
| --------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `TSVC-CAT-009`  | Estados, registros, buffers, operaciones, soportes manuales, resultados desconocidos, dead-letter, cuarentena, auditoría y gaps que requieren retención, archivo, hold, disposición y limpieza. |
| `TSVC-CAT-010`  | Activos parciales, modos degradados objetivo, dependencias alternas, procedimientos manuales y criterios de recuperación que deberán adoptarse y retirar soluciones legacy sin corte inseguro.  |

`TSVC-CAT-009` deberá preservar la identidad histórica necesaria para idempotencia, conciliación, auditoría y evidencia sin conservar indefinidamente payloads, buffers o datos sensibles.

`TSVC-CAT-010` deberá definir coexistencia, piloto, feature gates, migración, rollback, drenaje y retiro sin tratar un activo parcial como fallback canónico por su sola existencia.

---

#### 4. Artefactos y entregables

1. `TRANSVERSE-SERVICE-CONTINGENCY-REGISTRY-001@1.0.0`.
2. Separación normativa entre estado de operación, disponibilidad, modo operativo y ciclo de contingencia.
3. Catálogo cerrado de seis estados de disponibilidad.
4. Catálogo cerrado de diez modos de operación normal, degradada, suspendida, recuperación y conciliación.
5. Jerarquía obligatoria de degradación segura.
6. Catálogo de doce clases de activación y doce acciones de contingencia.
7. Contrato de circuit breaker, bulkhead, backpressure y drenaje controlado.
8. Ciclo de nueve estados de contingencia y registro mínimo versionado.
9. Matriz de autoridad para activación, cambio, recuperación y cierre.
10. Reglas de identidad, credenciales y autorización durante contingencia.
11. Reglas para deadlines, reintentos, resultado desconocido, dead-letter y cuarentena.
12. Contrato de captura local, operación offline y reconexión.
13. Contrato de contingencia manual controlada.
14. Reglas para dependencia alterna y failover compatible.
15. Secuencia de recuperación, drenaje, conciliación y retorno a operación normal.
16. Tratamiento del fallo del propio pipeline de observabilidad y auditoría.
17. Matriz materializada de diez servicios con modo, contención, suspensión, recuperación y estado.
18. Perfil específico de contingencia para cada una de las diez identidades.
19. Reconciliación de siete activos o patrones técnicos actuales sin afirmar cumplimiento objetivo.
20. Aplicación específica a las diez identidades del carril `NEXO-REMISSIONS-001`.
21. Handoff cerrado hacia `TSVC-CAT-009` y `TSVC-CAT-010`.

---

#### 5. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea materializa para las diez identidades transversales las invariantes de contingencia, degradación segura, operación offline, backpressure, suspensión, recuperación, failover, conciliación, procedimientos manuales y visibilidad degradada que ya están protegidas por requisitos canónicos vigentes. No crea una capacidad empresarial nueva ni modifica el alcance, estado, responsable, modalidad o relación de esos requisitos.

La cobertura vigente incluye, entre otros:

- `TREQ-PROC-061`;
- `TREQ-PROC-230` a `TREQ-PROC-246`;
- `TREQ-PROC-295` a `TREQ-PROC-324`;
- `TREQ-PROC-431`, `TREQ-PROC-439` y `TREQ-PROC-444` a `TREQ-PROC-460`;
- `TREQ-PROC-488` a `TREQ-PROC-493`;
- `TREQ-PROC-549`;
- `TREQ-CONT-003` a `TREQ-CONT-006`;
- `TREQ-INTEGRATION-003`, `TREQ-INTEGRATION-004` y `TREQ-INTEGRATION-023`.

La tarea genera:

```text
CREADOS = 0
MODIFICADOS = 0
DIFERIDOS = 0
DESCARTADOS_U_OBSOLETOS = 0
```

El registro canónico `04A` permanece sin cambios y no corresponde generar una copia adicional.

---

#### 6. Criterios de aceptación

1. `TSVC-CAT-007` figura aprobada y `TSVC-CAT-008` corresponde a la continuidad vigente.
2. Las diez identidades `TSVC-SVC-001..010` aparecen exactamente una vez en la matriz principal.
3. Cada servicio conserva nombre, contrato `1.0.0`, owner técnico, aplicación propietaria y relaciones ya aprobadas.
4. Estado de operación, disponibilidad, modo operativo y contingencia permanecen separados.
5. Se definen exactamente seis estados de disponibilidad sin reducirlos a online u offline.
6. Se definen exactamente diez modos de operación con controles y límites explícitos.
7. `DEGRADED_SAFE` nunca se presenta como disponibilidad plena ni resultado empresarial confirmado.
8. `UNKNOWN` obliga a declarar falta de evidencia y no se interpreta como salud.
9. La jerarquía de degradación prioriza consulta segura, límites, breaker, cola durable, captura autorizada, dependencia compatible, procedimiento manual y suspensión.
10. Se materializan doce clases de activación y doce acciones de contingencia.
11. Los umbrales concretos permanecen vinculados a baseline, SLO, capacidad, criticidad, ambiente y política versionada.
12. Circuit breaker distingue `CLOSED`, `OPEN` y `HALF_OPEN` y no marca resultados por sí mismo.
13. Bulkhead y backpressure aíslan fallos y evitan pérdida silenciosa o aceptación ilimitada.
14. El ciclo de contingencia contiene nueve estados y conserva transición, autoridad, evidencia y residuales.
15. Toda activación mantiene alcance, owner, vigencia, capacidad preservada, capacidad bloqueada y condición de salida.
16. La contingencia no amplía permisos, territorio, dispositivo, credencial, deadline ni autoridad empresarial.
17. La identidad de emergencia permanece excepcional, temporal y auditable.
18. La operación offline conserva clave idempotente, actor, dispositivo, contexto, esquema, dependencias, deadline, sensibilidad y estado humano.
19. Una captura local nunca se presenta como resultado autoritativo antes de confirmación.
20. Los límites de almacenamiento y backlog aplican backpressure antes de pérdida.
21. La contingencia manual exige procedimiento, numeración, datos mínimos, custodia, control de duplicados, digitalización, conciliación y cierre.
22. Papel, chat, memoria o soporte libre no constituyen procedimiento aprobado por sí mismos.
23. El failover exige contrato, versión, identidad, credencial, capacidad y compatibilidad demostrados.
24. Un efecto ambiguo se concilia antes de enviar a otra dependencia o repetir físicamente.
25. La recuperación usa probes, reapertura gradual, drenaje limitado, revalidación y conciliación.
26. Vencidos, cancelados, revocados, incompatibles, dead-letter y cuarentena no se ejecutan automáticamente al recuperar.
27. El fallo del pipeline de observabilidad produce visibilidad degradada y no salud aparente.
28. No se reconstruyen retrospectivamente señales, auditoría o timestamps inexistentes.
29. Cada uno de los diez servicios declara fallo dominante, modo preservable, contención, criterio de suspensión y recuperación.
30. Los siete activos actuales se clasifican como parciales o específicos y no como contingencia transversal completa.
31. El carril NEXO conserva estados, cantidades, custodia, evidencia y autoridad propietarias durante degradación.
32. Receipts, eventos, impresiones, uploads, alertas y heartbeats no sustituyen transiciones de remisión.
33. Se declaran cero cambios `TREQ-*` con justificación y cobertura vigente concreta.
34. No se crean código, migraciones, funciones, workers, colas, configuración, dashboards, canales, credenciales, datos ni cambios de Supabase.
35. No se afirma implementación, despliegue, simulacro, failover, validación remota, operación productiva ni prueba física.
36. La continuidad reserva exclusivamente `TSVC-CAT-009`.

---

#### 7. Dependencias y entradas

##### 7.1. Fuentes canónicas

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
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/07_SALIDA_OBLIGATORIA.md`;
- `docs/plan-canonico/modular/bloques/E2_PROCESOS_Y_EXPERIENCIA/07_01_DISPONIBILIDAD_ESCALA_RENDIMIENTO_Y_OFFLINE.md`;
- versión canónica vigente de `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`;
- `package.json` y `scripts/docs/validate-task-delivery.mjs`.

##### 7.2. Tareas y decisiones heredadas

- `TSVC-CAT-001` — diez identidades, estados y activos actuales;
- `TSVC-CAT-002` — propietario técnico y gobierno;
- `TSVC-CAT-003` — aplicaciones productoras, consumidoras y carril NEXO;
- `TSVC-CAT-004` — contratos, versión y compatibilidad;
- `TSVC-CAT-005` — identidades técnicas, credenciales y mínimo privilegio;
- `TSVC-CAT-006` — idempotencia, reintentos, deduplicación, deadlines y resultado desconocido;
- `TSVC-CAT-007` — observabilidad, métricas, alertas, auditoría y health;
- `NFR-REQ-001` — criticidad, disponibilidad y modos mínimos;
- `NFR-REQ-004` — operación offline, reconexión y contingencia manual;
- `NFR-REQ-008` — hardware, red, energía, periféricos y sustitución;
- `NFR-REQ-009` — observabilidad, soporte, alertas y recuperación;
- carril prioritario `NEXO-REMISSIONS-001`.

Ninguna decisión aprobada por estas fuentes se modifica.

##### 7.3. Restricción de evidencia

Este registro documental no demuestra:

- circuit breaker implementado;
- bulkhead o backpressure configurados;
- buffer local cifrado;
- cola durable desplegada;
- proveedor, canal, dispositivo o dependencia alternos disponibles;
- procedimiento manual publicado y entrenado;
- identidad de emergencia aprovisionada;
- failover ejecutado;
- worker o scheduler recuperado;
- drenaje de backlog probado;
- conciliación productiva;
- simulacro realizado;
- validación remota, operativa o física.

Todas esas afirmaciones requieren implementación y evidencia de las tareas y paquetes propietarios.

---

#### 8. Declaraciones expresamente no realizadas

Esta tarea no declara:

- disponibilidad productiva de los servicios;
- cumplimiento de RTO, RPO, MTPD, MBCO o SLO;
- tolerancia efectiva a caída de red, energía, Storage, Auth, base de datos, proveedor o dispositivo;
- capacidad offline uniforme por aplicación;
- persistencia local segura ya existente;
- impresora, canal o proveedor alternos homologados;
- procedimientos manuales vigentes en sedes;
- operación con credenciales amplias autorizada;
- recuperación sin pérdida o sin duplicados demostrada;
- cero downtime;
- exactly-once;
- cierre de incidentes o problemas actuales;
- cambios de código, datos, Supabase, configuración, infraestructura o despliegue.

---

#### 9. Continuidad canónica del bloque

```text
ÚLTIMA TAREA APROBADA
TSVC-CAT-007 — Definir observabilidad, métricas, alertas y auditoría
        ↓
TAREA ACTUAL APROBADA
TSVC-CAT-008 — Definir contingencia y degradación controlada
        ↓
SIGUIENTE TAREA RESERVADA
TSVC-CAT-009 — Definir retención, archivado y limpieza
```


### ✅ TSVC-CAT-009 — Definir retención, archivado y limpieza

**Estado:** APROBADA

**Tarea anterior:** `TSVC-CAT-008 — Definir contingencia y degradación controlada`

**Tarea siguiente:** `TSVC-CAT-010 — Definir adopción progresiva y retiro de soluciones legacy`

**Tipo de tarea:** definición documental canónica de retención, archivado, hold, disposición y limpieza para servicios transversales

**Fase:** definición documental vinculante; implementación física, configuración, migración, ejecución de disposición y despliegue no autorizados

**Repositorio propietario:** `devVentoGroup/vento-shell`

**Fecha de corte:** `2026-08-02`

**Cambios en código, datos, Storage, migraciones, funciones, workers, colas, políticas físicas, proveedores, dispositivos, despliegues o Supabase:** no autorizados ni realizados

---

#### 1. Resultado material

Esta tarea materializa el registro canónico:

```text
TRANSVERSE-SERVICE-RETENTION-REGISTRY-001@1.0.0
```

El registro define, para cada una de las diez identidades `TSVC-SVC-001..010`:

1. las clases de retención aplicables;
2. los materiales técnicos, empresariales y probatorios que deben gobernarse;
3. los eventos que inician, suspenden, recalculan o cierran el ciclo de conservación;
4. las condiciones de archivo, anonimización, eliminación, supersesión y hold;
5. la información mínima que debe sobrevivir a la disposición para impedir replay, duplicidad, pérdida de lineage o reutilización semántica;
6. los bloqueos que impiden limpiar una unidad con resultado desconocido, conciliación pendiente, incidente, investigación, diferencia, obligación o dependencia abierta;
7. la relación entre fuente de verdad, archivo, backup, telemetría, buffer local, dead-letter, payload de proveedor y evidencia;
8. el tratamiento de objetos temporales, datos locales, señales operativas y réplicas residuales;
9. la decisión materializada de retención, archivo y limpieza para los diez servicios;
10. el handoff hacia adopción progresiva y retiro de soluciones legacy.

La regla base es:

```text
CONSERVAR LO NECESARIO
+
MINIMIZAR LO NO NECESARIO
+
BLOQUEAR DISPOSICIÓN INSEGURA
+
DEMOSTRAR LA DISPOSICIÓN EJECUTADA
+
PRESERVAR IDENTIDAD HISTÓRICA SIN RECONSTRUIR CONTENIDO RETIRADO
```

La tarea no fija plazos universales. Cada periodo futuro deberá derivarse de finalidad, sensibilidad, obligación legal o contractual, riesgo, estado empresarial, ventana de replay, necesidad de conciliación, baseline operativo, propietario y evidencia aprobada.

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

- las diez identidades y su clasificación material de `TSVC-CAT-001`;
- el propietario técnico institucional y el repositorio canónico definidos en `TSVC-CAT-002`;
- las cien decisiones aplicación–servicio de `TSVC-CAT-003`;
- los diez contratos `1.0.0` de `TSVC-CAT-004`;
- las identidades técnicas, referencias de credencial y mínimo privilegio de `TSVC-CAT-005`;
- la semántica de idempotencia, deduplicación, intentos, receipts, dead-letter y resultado desconocido de `TSVC-CAT-006`;
- las siete clases de señal, veinte métricas, dieciséis eventos de auditoría y diez clases de alerta de `TSVC-CAT-007`;
- los seis estados de disponibilidad, diez modos operativos y reglas de reconciliación de `TSVC-CAT-008`;
- la autoridad de la aplicación propietaria sobre el resultado empresarial;
- la separación entre fuente de verdad, servicio técnico, observabilidad, evidencia, backup y archivo;
- la obligación de materializar futuras modificaciones de Supabase desde `vento-shell` durante una fase autorizada.

Quedan fuera del alcance:

- inventar plazos legales, fiscales, laborales, contractuales, probatorios u operativos sin fuente aprobada;
- crear políticas físicas, jobs de limpieza, lifecycle rules, buckets, tablas, índices, funciones, triggers, particiones, archivos fríos o mecanismos de hold;
- ejecutar eliminación, anonimización, destrucción de claves, compactación, exportación, migración de formato o purga;
- cambiar datos actuales, payloads, documentos, evidencias, auditorías, telemetría, dead-letter o backups;
- seleccionar proveedor, tier de almacenamiento, tecnología de archivo o motor de lifecycle;
- resolver adopción, coexistencia y retiro de activos legacy, responsabilidad de `TSVC-CAT-010`;
- declarar retención aplicada, archivo operativo, hold activo, disposición ejecutada o evidencia productiva sin implementación verificable.

---

#### 3. Decisiones aprobadas

##### 3.1. Identidad del registro

| Campo                      | Valor                                       |
| -------------------------- | ------------------------------------------- |
| `registry_id`              | `TRANSVERSE-SERVICE-RETENTION-REGISTRY-001` |
| `registry_version`         | `1.0.0`                                     |
| `registry_status`          | `DEFINED`                                   |
| `covered_services`         | `10`                                        |
| `retention_class_count`    | `9`                                         |
| `lifecycle_state_count`    | `8`                                         |
| `material_group_count`     | `17`                                        |
| `disposition_action_count` | `12`                                        |
| `technical_owner`          | Tecnología de Vento Group                   |
| `canonical_repository`     | `vento-shell`                               |
| `governing_task`           | `TSVC-CAT-009`                              |

`DEFINED` significa que el gobierno documental de conservación y disposición está cerrado para las diez identidades. No significa que existan periodos configurados, archivos físicos, jobs, reglas de Storage, holds, borrado verificable, anonimización ni evidencia de ejecución.

##### 3.2. Separación obligatoria de conceptos

| Concepto                        | Definición canónica                                                                                                 | No representa                                                                   |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| `RETENTION_POLICY`              | Regla versionada que define finalidad, alcance, evento inicial, condición de conservación, disposición y evidencia. | Un número aislado de días.                                                      |
| `ACTIVE_RECORD`                 | Registro vigente en la fuente o servicio propietario para operación autorizada.                                     | Archivo histórico ni backup.                                                    |
| `ARCHIVE`                       | Conservación separada de operación ordinaria, protegida, consultable bajo finalidad y acceso específicos.           | Fuente mutable competidora ni backup.                                           |
| `BACKUP`                        | Medio de recuperación técnica sujeto a ciclo propio, cifrado y restauración controlada.                             | Archivo histórico, consulta ordinaria o mecanismo para revivir datos retirados. |
| `LEGAL_HOLD`                    | Suspensión gobernada de disposición por obligación, investigación, litigio, seguridad o causa aprobada.             | Permiso adicional de acceso ni retención ordinaria indefinida.                  |
| `ANONYMIZATION`                 | Transformación irreversible que impide volver a identificar al titular con medios razonables.                       | Ocultamiento visual, cifrado reversible o alias temporal.                       |
| `IRREVERSIBLE_PSEUDONYMIZATION` | Separación irreversible o destrucción del vínculo que impide reconstruir identidad desde el conjunto conservado.    | Seudónimo reversible con tabla de enlace vigente.                               |
| `PHYSICAL_DELETION`             | Retiro verificable del contenido de sistemas activos y medios gobernados, sujeto a residuos técnicos declarados.    | Marcar una fila como inactiva.                                                  |
| `TOMBSTONE`                     | Registro mínimo de disposición que demuestra identidad histórica sin permitir reconstruir el contenido retirado.    | Réplica reducida del contenido original.                                        |
| `SUPERSESSION`                  | Sustitución lógica mediante una nueva versión vinculada, conservando la anterior según política.                    | Sobrescritura destructiva.                                                      |
| `CLEANUP`                       | Ejecución controlada de compactación, retiro temporal, anonimización o eliminación conforme a política y gates.     | Purga masiva por edad sin contexto.                                             |
| `EXPIRY`                        | Momento en que una unidad se vuelve elegible para evaluación de disposición.                                        | Autorización automática para eliminar.                                          |

Reglas:

1. vencimiento, archivo, anonimización, eliminación y destrucción de clave son acciones distintas;
2. archivar no retira automáticamente la versión activa;
3. un backup no satisface obligaciones de archivo ni de auditoría consultable;
4. la existencia de un backup no bloquea por sí sola toda disposición, pero obliga a gobernar restauración y envejecimiento;
5. una marca lógica no demuestra retiro físico;
6. el hold prevalece sobre una disposición ordinaria mientras esté vigente;
7. liberar un hold no reinicia artificialmente el tiempo ya transcurrido;
8. la política del proveedor no sustituye la política VENTO;
9. el archivo no adquiere propiedad empresarial ni se convierte en fuente de verdad mutable;
10. una operación de limpieza debe ser auditable y reversible solo cuando la acción elegida lo permita.

##### 3.3. Principios canónicos de retención

1. Toda unidad conservada debe tener finalidad actual y propietario.
2. Ningún servicio retendrá contenido indefinidamente por defecto.
3. Los plazos se determinan por clase, evento inicial, finalidad, sensibilidad, obligación, estado y hold; no por aplicación completa.
4. La retención se asigna al nivel útil: operación, evento, intento, receipt, documento, original, evidencia, señal, alerta, payload, buffer o agregado.
5. Un registro puede contener componentes con políticas distintas; el componente más sensible no obliga a conservar indefinidamente todo el payload.
6. Los identificadores históricos mínimos pueden sobrevivir más que el contenido para impedir replay, duplicidad o reutilización semántica.
7. Una referencia conservada no debe permitir reconstruir contenido retirado salvo que la política autorice conservarlo.
8. Ninguna unidad con resultado `RESULT_UNKNOWN` puede eliminarse antes de resolver la conciliación.
9. Ninguna unidad con estado `RECONCILIATION_REQUIRED`, `DEAD_LETTER`, `QUARANTINED`, disputa, incidente, investigación, diferencia o hold abierto puede pasar a disposición terminal sin decisión explícita.
10. Los efectos parciales y dependencias hijas se cierran antes de retirar la evidencia necesaria para explicarlos.
11. La corrección, compensación o supersesión crea una nueva unidad vinculada y no reescribe silenciosamente la anterior.
12. Los datos sensibles se minimizan antes de persistir y no se justifican por una futura necesidad hipotética.
13. Las acciones de disposición conservan actor o principal, política, versión, causa, alcance, momento y evidencia.
14. Un cambio de política no altera retroactivamente la historia sin una transición aprobada.
15. La restauración desde backup no puede reactivar en producción contenido cuya disposición ya fue confirmada.
16. Los sistemas externos, locales y temporales forman parte del alcance de disposición cuando hayan recibido el contenido.
17. El servicio transversal conserva responsabilidad técnica; el owner empresarial aprueba finalidad, periodo y efecto sobre el recurso.
18. La retención no amplía permisos, audiencia, territorio ni finalidad.
19. La consulta de archivo, la aplicación de hold y la ejecución de disposición son acciones sensibles y auditables.
20. La ausencia de evidencia de eliminación se clasifica como disposición no demostrada, no como éxito.

##### 3.4. Clases canónicas de retención

Se adopta sin modificación la taxonomía aprobada por `NFR-REQ-006`:

| Clase                             | Finalidad principal                                                                                      | Condición de salida conceptual                                                                                      |
| --------------------------------- | -------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| `RET-01_TRANSIENT`                | Buffers, locks, archivos temporales, material de render y datos necesarios solo durante una ejecución.   | Resultado conocido, ventana técnica cerrada, ausencia de dependencia y evidencia mínima preservada.                 |
| `RET-02_SHORT_OPERATIONAL`        | Diagnóstico operativo, detalle de intentos, receipts técnicos, colas recientes y soporte de corto plazo. | Resultado terminal, conciliación cerrada, ventana de replay cumplida y ausencia de incidente o hold.                |
| `RET-03_SECURITY_AUDIT`           | Acceso, identidad, cambios sensibles, eventos de seguridad y trazabilidad técnica.                       | Periodo aprobado cumplido, investigación cerrada, hold liberado y evidencia mínima de disposición.                  |
| `RET-04_BUSINESS_EVIDENCE`        | Evidencia que demuestra una acción, aceptación, entrega, custodia, decisión o resultado empresarial.     | Obligación y controversia cerradas, periodo aprobado cumplido y autoridad de disposición confirmada.                |
| `RET-05_REGULATED_OR_CONTRACTUAL` | Registros sujetos a obligación legal, fiscal, laboral, contractual o sectorial.                          | Regla aplicable cumplida, ausencia de hold y disposición autorizada por la autoridad correspondiente.               |
| `RET-06_ANALYTICAL_AGGREGATE`     | Agregados minimizados o anonimizados para capacidad, calidad, tendencia y mejora.                        | Finalidad agotada, agregado innecesario o política de anonimización y disposición ejecutada.                        |
| `RET-07_BACKUP_RECOVERY`          | Recuperación técnica ante pérdida, corrupción o desastre.                                                | Ciclo de backup cerrado, manifiesto de exclusiones aplicado y restauración capaz de respetar disposiciones previas. |
| `RET-08_LEGAL_HOLD`               | Suspensión temporal de disposición por causa aprobada.                                                   | Liberación formal, reevaluación desde el periodo original y decisión de conservación o disposición.                 |
| `RET-09_LOCAL_PENDING`            | Borradores, outbox, evidencia y operaciones pendientes en dispositivo o estación.                        | Receipt remoto, resultado autoritativo, dependencias cerradas, conciliación y limpieza del contexto local.          |

Reglas:

1. una unidad puede cambiar de clase por evento aprobado, pero el cambio queda versionado y auditado;
2. `RET-08_LEGAL_HOLD` se superpone a la clase ordinaria y no la elimina;
3. `RET-09_LOCAL_PENDING` no autoriza permanencia después de confirmación y cierre;
4. `RET-06_ANALYTICAL_AGGREGATE` exige minimización o anonimización suficiente;
5. `RET-07_BACKUP_RECOVERY` nunca se usa para consulta ordinaria;
6. `RET-01_TRANSIENT` no puede contener el único ejemplar de evidencia obligatoria;
7. `RET-02_SHORT_OPERATIONAL` no conserva payloads completos cuando basten referencias, códigos y contexto mínimo;
8. la asignación de clase se hace por material, no por servicio completo.

##### 3.5. Estados del ciclo de retención

| Estado             | Significado                                                                                     |
| ------------------ | ----------------------------------------------------------------------------------------------- |
| `ACTIVE`           | Material vigente y conservado para su finalidad autorizada.                                     |
| `PENDING_REVIEW`   | La condición de salida se aproxima o se cumple y requiere evaluación de gates.                  |
| `ARCHIVED`         | Material trasladado a conservación protegida fuera de operación ordinaria.                      |
| `LEGAL_HOLD`       | Disposición suspendida por una causa aprobada.                                                  |
| `DELETION_PENDING` | Gates aprobados y acción terminal programada, aún sin evidencia de finalización.                |
| `DELETED`          | Contenido retirado conforme a política y evidencia; puede permanecer tombstone mínimo.          |
| `ANONYMIZED`       | Contenido transformado irreversiblemente para retirar identidad o sensibilidad aplicable.       |
| `OBSOLETE`         | Material sustituido por una versión posterior, conservado o dispuesto según su propia política. |

Transiciones permitidas:

```text
ACTIVE
  ├→ PENDING_REVIEW
  ├→ ARCHIVED
  ├→ LEGAL_HOLD
  └→ OBSOLETE

PENDING_REVIEW
  ├→ ACTIVE
  ├→ ARCHIVED
  ├→ LEGAL_HOLD
  ├→ DELETION_PENDING
  └→ ANONYMIZED

ARCHIVED
  ├→ LEGAL_HOLD
  ├→ PENDING_REVIEW
  ├→ DELETION_PENDING
  ├→ ANONYMIZED
  └→ OBSOLETE

LEGAL_HOLD
  └→ PENDING_REVIEW

DELETION_PENDING
  ├→ DELETED
  ├→ PENDING_REVIEW
  └→ LEGAL_HOLD
```

Reglas:

1. no existe transición directa automática de `ACTIVE` a `DELETED`;
2. `DELETION_PENDING` no equivale a eliminación ejecutada;
3. una falla durante disposición devuelve la unidad a revisión o hold, no la marca como `DELETED`;
4. `ANONYMIZED` requiere prueba de irreversibilidad proporcional;
5. `OBSOLETE` no implica eliminación y conserva vínculo con la versión sucesora;
6. `LEGAL_HOLD` exige causa, autoridad, alcance, revisión y condición de liberación;
7. `DELETED` conserva únicamente el tombstone permitido;
8. los estados se registran por unidad gobernada y no mediante una bandera global del servicio.

##### 3.6. Grupos de material gobernado

| ID                 | Grupo                                  | Ejemplos                                                                      | Regla principal                                                                                   |
| ------------------ | -------------------------------------- | ----------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| `TSVC-RET-MAT-001` | Sobre de operación                     | servicio, contrato, operación, propietaria, correlación, causa y estado.      | Preservar identidad histórica suficiente para trazabilidad y resultado.                           |
| `TSVC-RET-MAT-002` | Anclas de idempotencia y deduplicación | clave idempotente, clave de deduplicación, huella y versión de normalización. | Conservar lo necesario para impedir replay y conflicto semántico, sin payload innecesario.        |
| `TSVC-RET-MAT-003` | Intentos, claims, leases y fencing     | intento, worker, lease, fencing, inicio, cierre y causa.                      | Compactar detalle cuando cierre operación, preservando secuencia material y anomalías.            |
| `TSVC-RET-MAT-004` | Receipts y referencias de resultado    | receipt, ACK, resultado técnico, referencia empresarial y timestamps.         | Conservar hasta resultado y conciliación; después aplicar clase de evidencia o detalle operativo. |
| `TSVC-RET-MAT-005` | Dead-letter y cuarentena               | elemento aislado, causa, owner, acción siguiente y evidencia.                 | No eliminar mientras exista resolución pendiente, hijo abierto, incidente o investigación.        |
| `TSVC-RET-MAT-006` | Auditoría técnica                      | aceptación, rechazo, override, configuración, conciliación y disposición.     | No destructiva; política propia y acceso restringido.                                             |
| `TSVC-RET-MAT-007` | Logs estructurados                     | diagnóstico, error normalizado, ambiente y referencias.                       | Minimizar, muestrear con reglas y retirar payloads o secretos.                                    |
| `TSVC-RET-MAT-008` | Trazas                                 | spans, enlaces entre intentos, latencias y dependencias.                      | Conservar según utilidad diagnóstica y seguridad; no como evidencia empresarial única.            |
| `TSVC-RET-MAT-009` | Métricas                               | contadores, gauges, histogramas y series.                                     | Conservar agregados suficientes; reducir resolución conforme a política sin alterar semántica.    |
| `TSVC-RET-MAT-010` | Alertas, incidentes y problemas        | condición, severidad, estados, comunicación y revisión.                       | Conservar hasta cierre técnico, empresarial y acciones posteriores aplicables.                    |
| `TSVC-RET-MAT-011` | Folios y buffers de contingencia       | folio manual, buffer local, journal duradero y registros de reconciliación.   | No limpiar antes de reincorporación, conciliación y cierre demostrado.                            |
| `TSVC-RET-MAT-012` | Originales documentales                | archivo aportado, hash, clasificación, procedencia y vínculo.                 | Política del dominio, legal o contractual; no hay eliminación técnica autónoma.                   |
| `TSVC-RET-MAT-013` | Documentos generados                   | plantilla, versión, fuente, output, integridad y supersesión.                 | Conservar por finalidad empresarial; material temporal de render se separa del documento final.   |
| `TSVC-RET-MAT-014` | Evidencia transaccional                | firma, fotografía, lectura, comprobante, hash, lineage y relación causal.     | Protección reforzada, supersesión no destructiva y hold cuando corresponda.                       |
| `TSVC-RET-MAT-015` | Payloads y respuestas de proveedor     | mensaje entrante, respuesta saliente, firma, ID externo y mapping.            | Minimizar contenido; conservar identificadores, integridad, mapping y resultado necesarios.       |
| `TSVC-RET-MAT-016` | Referencias de credencial              | principal, referencia, versión, estado, rotación y revocación.                | Nunca conservar valores secretos dentro del registro ordinario.                                   |
| `TSVC-RET-MAT-017` | Heartbeat y salud de workers           | señal sin procesar, transición de estado, incidente, capacidad y frescura.    | Compactar señales sin procesar; conservar transiciones e intervalos materiales para diagnóstico.  |

Los diecisiete grupos pueden coexistir en una misma operación, pero cada uno mantiene finalidad, clase, sensibilidad, evento inicial y disposición independientes.

##### 3.7. Sobre mínimo de política de retención

Toda política materializada deberá poder expresar, cuando aplique:

```text
retention_policy_id
retention_policy_version
service_id
contract_id
contract_version
material_group_id
record_type
business_owner_application
technical_owner
source_system
source_reference
sensitivity_class
retention_class
purpose
legal_or_contractual_basis
start_event
start_at
review_event
review_at
retention_condition
minimum_period_ref
maximum_period_ref
disposition_action
hold_status
hold_reference
open_dependency_count
reconciliation_status
incident_reference
provider_reference
local_replica_status
backup_scope
archive_location_ref
tombstone_required
approval_authority
policy_status
created_at
updated_at
```

Reglas:

1. `minimum_period_ref` y `maximum_period_ref` referencian una fuente aprobada; no contienen cifras inventadas por el servicio;
2. `start_event` identifica el hecho que inicia el periodo, como resultado terminal, cierre contractual, supersesión, revocación o liberación de hold;
3. `retention_condition` puede impedir disposición aunque el tiempo se haya cumplido;
4. `open_dependency_count` no sustituye la comprobación material de dependencias;
5. `local_replica_status` cubre dispositivo, estación, caché, buffer y material temporal;
6. `provider_reference` permite verificar disposición fuera de VENTO;
7. `archive_location_ref` es una referencia protegida, no una dirección abierta;
8. `tombstone_required` se activa cuando identidad histórica, replay, lineage o evidencia de disposición deban sobrevivir;
9. el owner técnico ejecuta la política y el owner empresarial conserva autoridad sobre finalidad y resultado;
10. toda modificación crea una nueva versión y conserva la versión anterior.

##### 3.8. Eventos que gobiernan el ciclo

| ID                 | Evento                       | Efecto permitido                                                                                |
| ------------------ | ---------------------------- | ----------------------------------------------------------------------------------------------- |
| `TSVC-RET-EVT-001` | `OPERATION_TERMINAL`         | Iniciar evaluación del detalle operacional cuando no exista resultado desconocido.              |
| `TSVC-RET-EVT-002` | `RECONCILIATION_CLOSED`      | Habilitar revisión de receipts, intentos, buffers y payloads asociados.                         |
| `TSVC-RET-EVT-003` | `BUSINESS_OBLIGATION_CLOSED` | Iniciar el periodo de evidencia o documento cuando la fuente canónica así lo determine.         |
| `TSVC-RET-EVT-004` | `SUPERSEDED`                 | Marcar versión anterior como obsoleta sin sobrescribirla.                                       |
| `TSVC-RET-EVT-005` | `CREDENTIAL_REVOKED`         | Retirar valor operativo y conservar referencia, estado y auditoría permitidos.                  |
| `TSVC-RET-EVT-006` | `PROVIDER_RESULT_FINAL`      | Evaluar reducción de payload externo y conservación de ID, mapping, resultado e integridad.     |
| `TSVC-RET-EVT-007` | `INCIDENT_CLOSED`            | Habilitar revisión del material diagnóstico cuando acciones posteriores estén resueltas.        |
| `TSVC-RET-EVT-008` | `HOLD_APPLIED`               | Suspender disposición dentro del alcance indicado.                                              |
| `TSVC-RET-EVT-009` | `HOLD_RELEASED`              | Recalcular elegibilidad usando el periodo original y el tiempo ya transcurrido.                 |
| `TSVC-RET-EVT-010` | `LOCAL_SYNC_CONFIRMED`       | Evaluar limpieza local si receipt, autoridad, hash, dependencias y conciliación están cerrados. |
| `TSVC-RET-EVT-011` | `WORKER_RETIRED`             | Compactar señales ordinarias y conservar transición, incidente y evidencia de retiro.           |
| `TSVC-RET-EVT-012` | `POLICY_VERSION_CHANGED`     | Aplicar transición gobernada sin alterar silenciosamente unidades históricas.                   |

Ningún evento ejecuta por sí solo una disposición terminal. Siempre conduce a evaluación de gates, autoridad y evidencia.

##### 3.9. Acciones canónicas de disposición

| ID                 | Acción                        | Uso permitido                                                                                |
| ------------------ | ----------------------------- | -------------------------------------------------------------------------------------------- |
| `TSVC-RET-ACT-001` | `KEEP_ACTIVE`                 | Mantener material vigente por finalidad y condición abierta.                                 |
| `TSVC-RET-ACT-002` | `MOVE_TO_PROTECTED_ARCHIVE`   | Mover material a archivo protegido con consulta restringida.                                 |
| `TSVC-RET-ACT-003` | `COMPACT_OPERATIONAL_DETAIL`  | Reducir granularidad conservando contadores, secuencia material, errores y referencias.      |
| `TSVC-RET-ACT-004` | `ANONYMIZE`                   | Retirar identidad de forma irreversible conservando utilidad permitida.                      |
| `TSVC-RET-ACT-005` | `IRREVERSIBLY_PSEUDONYMIZE`   | Destruir el vínculo que permitiría reidentificación.                                         |
| `TSVC-RET-ACT-006` | `DESTROY_ENCRYPTION_KEY`      | Volver irrecuperable contenido cifrado cuando la arquitectura y la política lo permitan.     |
| `TSVC-RET-ACT-007` | `PHYSICALLY_DELETE`           | Retirar contenido de sistemas y medios gobernados con evidencia.                             |
| `TSVC-RET-ACT-008` | `APPLY_HOLD`                  | Suspender disposición para un alcance y causa aprobados.                                     |
| `TSVC-RET-ACT-009` | `RELEASE_HOLD`                | Liberar hold y devolver las unidades a revisión.                                             |
| `TSVC-RET-ACT-010` | `SECURE_EXPORT`               | Producir una exportación controlada con finalidad, owner, alcance, protección y vencimiento. |
| `TSVC-RET-ACT-011` | `MIGRATE_FORMAT`              | Convertir a un formato gobernado preservando integridad, lineage y verificabilidad.          |
| `TSVC-RET-ACT-012` | `SUPERSEDE_WITHOUT_OVERWRITE` | Vincular versión sucesora y conservar o disponer la anterior conforme a su política.         |

Reglas:

1. una acción no puede ejecutarse fuera de su clase y finalidad;
2. `COMPACT_OPERATIONAL_DETAIL` no elimina auditoría obligatoria ni evidencia empresarial;
3. anonimización y seudonimización irreversible requieren prueba de irreversibilidad proporcional;
4. destrucción de clave solo se admite cuando no elimina material que deba permanecer recuperable;
5. exportar crea una nueva unidad gobernada con política propia;
6. migrar formato conserva integridad, versión de origen, versión destino y resultado de verificación;
7. supersesión no altera el original;
8. toda acción produce un evento de auditoría y, cuando corresponda, un tombstone.

##### 3.10. Gate obligatorio de disposición

Antes de una acción terminal se comprobará conceptualmente:

```text
¿LA UNIDAD ES ELEGIBLE SEGÚN POLÍTICA VERSIONADA?
        ↓
¿NO EXISTE HOLD LEGAL, CONTRACTUAL, DE SEGURIDAD O INVESTIGACIÓN?
        ↓
¿NO EXISTE RESULT_UNKNOWN, RECONCILIACIÓN, DEAD-LETTER, CUARENTENA O INCIDENTE ABIERTO?
        ↓
¿NO EXISTE OBLIGACIÓN, DIFERENCIA, DISPUTA, HIJO O DEPENDENCIA PENDIENTE?
        ↓
¿SE IDENTIFICARON SISTEMAS ACTIVOS, ARCHIVO, BACKUP, PROVEEDOR Y MATERIAL LOCAL?
        ↓
¿LA AUTORIDAD Y SEGREGACIÓN SON VÁLIDAS?
        ↓
¿LA ACCIÓN CONSERVA TOMBSTONE Y EVIDENCIA MÍNIMA CUANDO CORRESPONDE?
        ↓
EJECUTAR Y VERIFICAR
```

Si cualquier comprobación falla:

- la unidad permanece `ACTIVE`, `PENDING_REVIEW` o `LEGAL_HOLD`;
- se registra la causa concreta;
- se identifica owner y condición de salida;
- no se marca como dispuesta;
- no se reduce evidencia para ocultar el bloqueo.

##### 3.11. Hold legal, contractual, de seguridad o investigación

Todo hold deberá conservar:

```text
hold_id
hold_type
reason
source
business_authority
technical_owner
scope
record_selectors
start_at
release_condition
review_at
status
exceptions
access_policy
audit_reference
```

Reglas:

1. el hold se aplica al alcance mínimo suficiente;
2. la causa no se sustituye por texto libre sin referencia o autoridad;
3. el hold prevalece sobre eliminación, anonimización y compactación incompatible;
4. el hold no concede acceso adicional;
5. la revisión periódica no implica liberación automática;
6. una liberación identifica autoridad, momento, alcance y evidencia;
7. después de liberar, la elegibilidad se calcula desde el evento original aplicable;
8. un hold no se usa para conservar indefinidamente material por comodidad operativa;
9. la existencia del hold y sus cambios son auditables;
10. los proveedores y medios externos dentro del alcance deben recibir una instrucción compatible y verificable.

##### 3.12. Tombstone mínimo de disposición

Cuando la política lo exija, el tombstone conservará únicamente:

```text
tombstone_id
record_type
record_identity_ref
service_id
business_owner_application
contract_id
contract_version
original_created_at
final_state
disposition_policy_id
disposition_policy_version
disposition_action
disposition_reason
disposed_at
disposed_by
hold_or_exception_ref
minimal_integrity_attestation
related_resource_state
evidence_reference
```

Reglas:

1. el tombstone no contiene payload, documento, fotografía, secreto, token, contenido sensible ni dato suficiente para reconstruir el material;
2. `minimal_integrity_attestation` puede conservar una atestación o huella protegida cuando sea necesaria para lineage, disputa o replay;
3. la huella no se usa para deduplicar globalmente recursos distintos;
4. el tombstone no revive una operación ni concede acceso al material retirado;
5. el tombstone permanece sujeto a una política propia;
6. la disposición del tombstone requiere comprobar que ya no sea necesario para identidad histórica, obligación o defensa contra replay;
7. una consulta de tombstone se autoriza y audita según finalidad;
8. no se crea tombstone cuando aumente el riesgo sin aportar finalidad legítima.

##### 3.13. Idempotencia, deduplicación y reutilización semántica

1. Vencer una clave idempotente no autoriza reutilizarla con otra intención.
2. La política conservará suficiente identidad para reconocer una intención ya ejecutada dentro de la ventana de riesgo aplicable.
3. Cuando el contenido se retire, el tombstone podrá conservar `service_id`, ámbito, referencia protegida de clave, huella, versión y resultado terminal mínimo.
4. El servicio no conservará indefinidamente payloads completos para demostrar idempotencia si bastan referencias y atestaciones.
5. Un `IDEMPOTENCY_CONFLICT` abierto bloquea disposición del material necesario para investigarlo.
6. Un replay externo mantiene identificación de proveedor y evento durante la ventana necesaria para impedir segundo efecto.
7. La compactación de intentos preserva intento ganador, anomalías, resultado, conflictos, total y secuencia material.
8. Una operación nueva usa otra identidad y se vincula a la anterior cuando sea corrección, reemisión, supersesión o acción posterior.
9. El borrado de un receipt no puede dejar una operación sin resultado consultable mientras exista riesgo de repetición.
10. La política de retención no modifica las garantías contractuales de `TSVC-CAT-006`.

##### 3.14. Dead-letter, cuarentena y resultados desconocidos

1. `DEAD_LETTER` no equivale a resultado empresarial terminal y no habilita eliminación automática.
2. Toda unidad dead-letter conserva owner, causa, política agotada, intento final, acción siguiente, revisión y evidencia.
3. `QUARANTINED` conserva el material mínimo para seguridad, integridad, contrato o análisis de contenido bajo acceso restringido.
4. `RESULT_UNKNOWN` mantiene receipts, referencias externas, intentos, timestamps, hashes y contexto necesarios para consultar y conciliar.
5. `RECONCILIATION_REQUIRED` bloquea la limpieza de buffers, payloads, evidencia y referencias causales.
6. Resolver una unidad puede producir `SUCCEEDED`, `FAILED_TERMINAL`, `CANCELLED`, `SUPERSEDED` o una acción empresarial nueva; la historia anterior permanece vinculada.
7. La intervención manual es auditable y no sobrescribe intentos previos.
8. Una unidad venenosa no se reintenta para agotar tiempo de retención.
9. El contenido sensible en dead-letter se minimiza o protege; dead-letter no es archivo ordinario.
10. La salida de dead-letter exige confirmar dependencias, resultado y ausencia de efecto duplicado.

##### 3.15. Observabilidad, logs, trazas, métricas y alertas

1. Las métricas conservan agregados y resolución suficientes para SLO, capacidad y tendencia, con reducción progresiva cuando la política lo permita.
2. Los logs se conservan por finalidad diagnóstica, seguridad y auditoría; no contienen payloads ni secretos innecesarios.
3. Las trazas se retienen según necesidad diagnóstica y muestreo gobernado; errores críticos e integridad no se eliminan por un muestreo que impida investigación.
4. Los eventos `AUDIT_EVENT` tienen política separada de `LOG_EVENT`.
5. Las alertas se conservan hasta cierre, revisión y acciones posteriores aplicables.
6. Resolver una alerta no elimina el incidente ni la conciliación relacionada.
7. La compactación de heartbeat conserva transiciones de estado, intervalos de degradación, incidentes y evidencia de retiro del worker.
8. La ausencia de señal no se convierte en salud cuando el pipeline de observabilidad estuvo degradado.
9. El material sintético de pruebas se identifica y no contamina series productivas.
10. La retención del proveedor de observabilidad no sustituye la política VENTO ni la evidencia requerida.
11. Consultas, exportaciones, cambios de política y eliminación de telemetría sensible son auditables.
12. La reducción de resolución no cambia unidad, significado, dimensiones ni versión de una métrica.

##### 3.16. Auditoría y evidencia

1. La auditoría técnica es no destructiva dentro de su periodo y conserva actor o principal, causa, antes, después, recurso, versión y resultado.
2. La evidencia empresarial conserva vínculo con proceso, evento, identidad, dispositivo, tiempo e integridad según su owner.
3. La corrección crea un evento o elemento vinculado; no altera el original.
4. La supersesión identifica sucesor y razón.
5. Una evidencia en disputa, hold, investigación o proceso abierto no se dispone.
6. La retención de evidencia no implica acceso general; cada consulta conserva finalidad y autoridad.
7. El archivo de auditoría y evidencia debe ser protegido contra modificación no autorizada.
8. La indisponibilidad del pipeline ordinario no justifica perder auditoría obligatoria; se usa mecanismo duradero aprobado o se falla de forma cerrada cuando corresponda.
9. La disposición de evidencia genera evidencia de disposición, sin reconstruir el contenido retirado.
10. Un archivo existente no se presume evidencia suficiente si faltan integridad, causalidad, propietario o contexto.

##### 3.17. Backups y recuperación

1. Los backups heredan sensibilidad y acceso del material protegido.
2. Permanecen cifrados y se usan solo para recuperación autorizada.
3. Un backup no es un archivo consultable de negocio.
4. Cada conjunto tiene ciclo, owner, ambiente, alcance, versión, prueba de restauración y disposición.
5. La restauración aplica manifiestos de unidades retiradas, anonimización y holds antes de reactivar servicios.
6. El contenido dispuesto no se reincorpora a producción por restauración ordinaria.
7. Los snapshots temporales, material de certificación y exportaciones de recuperación también tienen política.
8. La eliminación de una unidad activa puede completarse a través del ciclo de backup definido, siempre que no exista acceso ordinario y la restauración respete el manifiesto.
9. Un hold aplicable se propaga a los backups dentro del alcance.
10. La destrucción de clave se coordina con recuperabilidad, hold y evidencia.
11. La prueba de restauración no utiliza datos sensibles fuera del ambiente y finalidad autorizados.
12. La política declara residuos técnicos conocidos y condición de salida, sin afirmar eliminación instantánea donde la plataforma no la garantice.

##### 3.18. Proveedores externos y sistemas fuera de VENTO

Todo intercambio externo deberá conservar, cuando aplique:

- proveedor e identidad técnica;
- finalidad y base aplicable;
- campos o material enviados;
- ambiente y destino;
- contrato y mapping;
- periodo del proveedor;
- método de disposición;
- evidencia o atestación de disposición;
- incidentes, hold y residuos conocidos;
- IDs externos, firma o integridad necesarias para replay y conciliación.

Reglas:

1. el periodo predeterminado del proveedor no se adopta por silencio;
2. retirar el material dentro de VENTO no completa la disposición si el proveedor conserva una réplica fuera de política;
3. el payload se minimiza, tokeniza o seudonimiza cuando el contrato lo permita;
4. la solicitud de disposición externa conserva estado y evidencia;
5. una integración con resultado desconocido mantiene material suficiente para consulta y conciliación;
6. las credenciales del proveedor no se incluyen en archivos, telemetría o evidencia ordinaria;
7. un proveedor retirado conserva el historial mínimo de mapping, resultado, incidentes y disposición;
8. la obligación contractual puede exigir archivo o hold más fuerte que el detalle operativo ordinario.

##### 3.19. Operación local, offline y dispositivos compartidos

1. Todo dispositivo inventaría almacenamiento persistente, caché, outbox, borradores, archivos temporales, miniaturas, diagnósticos, service workers y evidencia pendiente.
2. El material local se separa por actor, aplicación, área, sede, recurso y versión cuando corresponda.
3. Cambio de actor, contexto, revocación, pérdida de dispositivo, retiro o instrucción remota activan limpieza o cuarentena conforme a política.
4. Una operación pendiente no se elimina por cerrar sesión, aplicación o dispositivo.
5. La limpieza local exige receipt remoto, resultado autoritativo, hash o integridad, dependencias cerradas y conciliación.
6. Un borrador puede retirarse por decisión explícita y auditable sin fingir que fue enviado.
7. El cambio de actor en dispositivo compartido retira sesión, caché, material visible y preferencias sin perder pendientes autorizados.
8. El almacenamiento lleno aplica backpressure, prioridad o contingencia; no elimina silenciosamente material pendiente.
9. Una actualización incompatible preserva o exporta de forma segura el material pendiente antes de retirar su esquema.
10. El material local confirmado se elimina conforme a política y no se conserva como fuente competidora.
11. La hora local no modifica el periodo canónico sin referencia temporal verificable.
12. El dispositivo retirado conserva evidencia de limpieza o estado de pérdida y revocación.

##### 3.20. Registro canónico por servicio

| Servicio       | Clases principales                                                                                          | Material que debe preservarse                                                                                                        | Material elegible para reducción o retiro                                                                          | Bloqueos principales                                                                                                  | Estado material           |
| -------------- | ----------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------- | ------------------------- |
| `TSVC-SVC-001` | `RET-02_SHORT_OPERATIONAL`, `RET-03_SECURITY_AUDIT`, `RET-09_LOCAL_PENDING`                                 | operación, clave protegida, resultado, receipt, intento ganador, conflictos, dead-letter, conciliación y auditoría                   | leases vencidos, locks, detalle ordinario de intentos, buffers y diagnósticos después de cierre seguro             | trabajo activo, resultado desconocido, dead-letter, hijo pendiente, incidente, hold o replay posible                  | `DEFINED_NOT_IMPLEMENTED` |
| `TSVC-SVC-002` | `RET-02_SHORT_OPERATIONAL`, `RET-03_SECURITY_AUDIT`, `RET-04_BUSINESS_EVIDENCE`                             | `event_id`, versión, productor, consumidor, ACK, estado de entrega, agregado, correlación y tombstone anti-replay                    | payload completo, intentos repetidos y detalle de transporte después de consumidores terminales y ventana aprobada | consumidor pendiente, orden causal abierto, replay, incompatibilidad, dead-letter, conciliación o hold                | `DEFINED_NOT_IMPLEMENTED` |
| `TSVC-SVC-003` | `RET-01_TRANSIENT`, `RET-02_SHORT_OPERATIONAL`, `RET-04_BUSINESS_EVIDENCE`, `RET-09_LOCAL_PENDING`          | intención, identidad de ejemplar autorizado, layout, routing, dispositivo, receipt, resultado físico, reemisión y conciliación       | spool, render temporal, buffer local y diagnóstico después de conocer resultado físico y preservar evidencia       | resultado físico desconocido, dispositivo aislado, disputa, reemisión pendiente, incidente o hold                     | `DEFINED_NOT_IMPLEMENTED` |
| `TSVC-SVC-004` | `RET-01_TRANSIENT`, `RET-02_SHORT_OPERATIONAL`, `RET-03_SECURITY_AUDIT`                                     | solicitud, plantilla y versión, referencia de destinatario, canal, proveedor, receipt, estado, supresión y auditoría                 | contenido renderizado, respuesta cruda de proveedor, tokens inválidos y detalle de intentos tras cierre            | resultado externo incierto, preferencia o disputa abierta, incidente, investigación o hold                            | `DEFINED_NOT_IMPLEMENTED` |
| `TSVC-SVC-005` | `RET-01_TRANSIENT`, `RET-04_BUSINESS_EVIDENCE`, `RET-05_REGULATED_OR_CONTRACTUAL`                           | fuente, snapshot, plantilla, versión, output, integridad, supersesión y autoridad del documento                                      | material temporal de render, caché y diagnósticos después de custodia e integridad confirmadas                     | documento vigente, obligación abierta, firma o aprobación pendiente, disputa, hold o salida sin custodia              | `DEFINED_NOT_IMPLEMENTED` |
| `TSVC-SVC-006` | `RET-04_BUSINESS_EVIDENCE`, `RET-05_REGULATED_OR_CONTRACTUAL`, `RET-08_LEGAL_HOLD`, `RET-09_LOCAL_PENDING`  | original, procedencia, hash, clasificación, vínculo, lineage, acceso, sustitución, hold y tombstone                                  | derivados temporales, previews, caché y material local después de ingestión y conciliación                         | política de dominio, obligación, expediente abierto, investigación, hold, réplica externa o disposición no demostrada | `DEFINED_NOT_IMPLEMENTED` |
| `TSVC-SVC-007` | `RET-03_SECURITY_AUDIT`, `RET-04_BUSINESS_EVIDENCE`, `RET-05_REGULATED_OR_CONTRACTUAL`, `RET-08_LEGAL_HOLD` | evidencia, hash, actor, dispositivo, momento, hecho, lineage, corrección, supersesión, acceso y disposición                          | derivados temporales y diagnósticos que no sean parte de la fuerza probatoria                                      | proceso o disputa abierta, integridad no verificada, investigación, hold, obligación o relación causal incompleta     | `DEFINED_NOT_IMPLEMENTED` |
| `TSVC-SVC-008` | `RET-02_SHORT_OPERATIONAL`, `RET-03_SECURITY_AUDIT`, `RET-04_BUSINESS_EVIDENCE`                             | ID externo, firma o atestación, mapping, contrato, ACK, resultado, replay, conciliación, proveedor y auditoría                       | payload crudo, encabezados innecesarios, respuestas transitorias y detalle de intentos tras resultado final        | resultado desconocido, provider dispute, replay, incidente, investigación, conciliación o hold                        | `DEFINED_NOT_IMPLEMENTED` |
| `TSVC-SVC-009` | `RET-02_SHORT_OPERATIONAL`, `RET-03_SECURITY_AUDIT`, `RET-04_BUSINESS_EVIDENCE`                             | schedule, versión, zona, ocurrencia lógica, trigger, misfire, resultado, cambios, suspensión, supersesión y tombstone anti-duplicado | locks, heartbeats del scheduler y detalle ordinario tras cerrar ocurrencia y preservar resultado                   | ocurrencia activa, overlap, resultado desconocido, acción hija pendiente, incidente o hold                            | `DEFINED_NOT_IMPLEMENTED` |
| `TSVC-SVC-010` | `RET-01_TRANSIENT`, `RET-02_SHORT_OPERATIONAL`, `RET-03_SECURITY_AUDIT`, `RET-06_ANALYTICAL_AGGREGATE`      | identidad del worker, boot, transiciones de salud, periodos degradados, incidentes, reemplazo, retiro y agregados                    | heartbeats brutos, muestras redundantes y detalle de alta frecuencia después de compactación verificada            | incidente, investigación, pipeline degradado, intervalo no reconstruible, hold o worker no reconciliado               | `DEFINED_NOT_IMPLEMENTED` |

La matriz asigna clases principales, no plazos físicos. Cada material se vinculará a una política versionada y a una fuente aprobada antes de implementación.

##### 3.21. Perfil de `TSVC-SVC-001`

La orquestación conservará:

- identidad de operación e intención;
- aplicación productora y propietaria;
- contrato y versión;
- receipt, estado y resultado;
- clave idempotente protegida y huella mínima;
- intento ganador y anomalías materiales;
- claims o fencing relevantes para conflicto;
- dead-letter, cuarentena y conciliación;
- cancelación, expiración y overrides;
- auditoría de disposición.

La limpieza podrá compactar intentos ordinarios, leases, locks y diagnósticos después de demostrar estado terminal, ausencia de hijos, ausencia de efecto ambiguo y cierre de incidentes. No podrá eliminar una unidad para ocultar backlog, presupuesto agotado o resultado desconocido.

##### 3.22. Perfil de `TSVC-SVC-002`

El outbox conservará un registro suficiente para reconstruir:

```text
HECHO CONFIRMADO
→ EVENTO VERSIONADO
→ CONSUMIDORES NOMBRADOS
→ INTENTOS DE ENTREGA
→ ACK, ERROR O DEAD-LETTER
→ RESULTADO DE CADA CONSUMIDOR
```

Reglas específicas:

1. `event_id` nunca se reutiliza después de disposición;
2. el payload completo puede reducirse cuando todos los consumidores estén terminales y no exista obligación de evidencia;
3. la versión, productor, agregado, correlación, causalidad, consumidores y tombstone permanecen según política;
4. un consumidor pendiente bloquea la disposición de la información necesaria para reentrega;
5. los estados por consumidor no se fusionan en un único éxito global;
6. un evento supersedido no se reescribe;
7. un replay detectado conserva evidencia suficiente para demostrar supresión segura.

##### 3.23. Perfil de `TSVC-SVC-003`

La impresión separará:

- solicitud;
- ejemplar autorizado;
- layout y versión;
- routing;
- spool o render temporal;
- receipt del adaptador;
- aceptación del dispositivo;
- resultado físico;
- reemisión autorizada;
- conciliación.

El spool y el render son `RET-01_TRANSIENT`. Solo podrán retirarse cuando el resultado físico sea conocido o la operación haya sido conciliada, la evidencia exigida permanezca y no exista reemisión pendiente. Un timeout no habilita retiro si impide determinar si el dispositivo produjo el efecto.

##### 3.24. Perfil de `TSVC-SVC-004`

Las notificaciones conservarán identidad de solicitud, owner, plantilla, versión, referencia de destinatario, canal, proveedor, receipt, estado, supresión y resultado. El contenido renderizado y la respuesta cruda del proveedor se minimizarán antes que el registro de entrega cuando no sean necesarios.

Los tokens de destino inválidos, revocados o retirados no se conservarán como valores operativos. Permanecerán únicamente la referencia mínima, causa, estado, momento y auditoría necesaria. Una entrega al proveedor no prueba lectura ni aceptación del destinatario.

##### 3.25. Perfil de `TSVC-SVC-005`

La generación documental distinguirá:

- fuente y snapshot;
- plantilla y versión;
- parámetros;
- ejecución temporal;
- output final;
- hash o atestación de integridad;
- custodia;
- supersesión;
- firma o aprobación propietaria cuando aplique.

El material de render, caché y diagnóstico se retira después de confirmar output, integridad, custodia y ausencia de resultado desconocido. El documento final usa la política de su owner empresarial; el servicio generador no decide su periodo legal o contractual.

##### 3.26. Perfil de `TSVC-SVC-006`

La custodia de originales aplicará la política más específica del dominio, expediente, obligación, sensibilidad y hold. Ningún original se elimina por una regla técnica global.

La disposición deberá verificar:

- objeto activo;
- versiones;
- derivados;
- índices;
- metadatos;
- material local;
- archivo;
- backups;
- proveedor externo;
- réplicas residuales conocidas.

El tombstone conservará identidad, procedencia, integridad mínima, política y evidencia sin mantener contenido. La sustitución de un original crea lineage y no oculta el elemento anterior.

##### 3.27. Perfil de `TSVC-SVC-007`

La evidencia transaccional usa conservación reforzada. Debe permitir demostrar qué acción, recurso, actor, dispositivo, momento, versión y resultado estaban relacionados.

Reglas específicas:

1. correcciones y supersesiones son aditivas;
2. acceso extraordinario y exportación son auditables;
3. integridad o lineage roto bloquean disposición;
4. una evidencia en disputa o hold permanece protegida;
5. un archivo huérfano no se conserva indefinidamente como evidencia aparente: se clasifica, vincula, cuarentena o dispone mediante decisión;
6. el servicio no declara por sí mismo valor legal o empresarial;
7. la disposición conserva atestación mínima y autoridad.

##### 3.28. Perfil de `TSVC-SVC-008`

Las integraciones externas conservarán el mínimo suficiente para verificar origen, mapping, replay, ACK, resultado y conciliación.

El payload crudo se separa de:

- identificador externo;
- firma o atestación;
- contrato y versión;
- mapping;
- campos normalizados permitidos;
- resultado técnico;
- referencia empresarial;
- evidencia de disposición del proveedor.

Un webhook con `200 OK` no habilita disposición si el procesamiento interno sigue incierto. Un envío con timeout mantiene material para consulta y evita repetición ciega. La política del proveedor se registra y se reconcilia con VENTO.

##### 3.29. Perfil de `TSVC-SVC-009`

La programación conservará:

- schedule y versión;
- owner y mandato;
- zona horaria y vigencia;
- ocurrencia lógica;
- trigger real;
- misfire, overlap u omisión;
- operación hija;
- resultado;
- suspensión, supersesión y retiro.

Los locks y heartbeats del scheduler son transitorios. La ocurrencia lógica conserva tombstone o identidad suficiente para impedir doble ejecución. Retirar una definición no elimina la historia de ocurrencias ni cancela implícitamente trabajo ya iniciado.

##### 3.30. Perfil de `TSVC-SVC-010`

El monitoreo de workers compactará heartbeats brutos una vez preservadas:

- identidad del worker y servicio;
- boot y versión;
- transiciones de estado;
- intervalos `DEGRADED`, `STALE`, `DRAINING`, `STOPPED` o `UNKNOWN`;
- capacidad e inflight relevantes;
- incidentes y alertas;
- reemplazo y retiro;
- estado del pipeline de observabilidad.

La compactación no puede fabricar continuidad cuando faltaron señales. Un intervalo con pipeline degradado permanece distinguido de un worker saludable. Los agregados analíticos no sustituyen la auditoría de cambios o incidentes.

##### 3.31. Reconciliación con activos técnicos actuales

| Activo o patrón observado                                           | Servicio relacionado | Clasificación de retención actual                      | Decisión canónica                                                                                                                       |
| ------------------------------------------------------------------- | -------------------- | ------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------- |
| Cola local de impresión NEXO basada en almacenamiento del navegador | `TSVC-SVC-003`       | `LOCAL_PENDING_WITHOUT_CANONICAL_LIFECYCLE`            | Inventariar pendientes, resultado, actor y dispositivo; no retirar material hasta conciliación y migración controlada.                  |
| API de layouts de impresión                                         | `TSVC-SVC-003`       | `VERSIONED_CONFIGURATION_REQUIRES_GOVERNANCE`          | Conservar versiones activas y usadas por trabajos; superseder sin sobrescritura y retirar solo después de ausencia de consumidores.     |
| Persistencia de layouts de impresión NEXO                           | `TSVC-SVC-003`       | `PARTIAL_CONFIGURATION_HISTORY`                        | Preservar identidad, versión, vigencia y referencias de uso; definir disposición física durante adopción.                               |
| Registro de tokens push de empleados                                | `TSVC-SVC-004`       | `SENSITIVE_ADDRESSING_WITH_PARTIAL_LIFECYCLE`          | Revocar y retirar valores inválidos o fuera de finalidad; conservar referencia mínima, estado y auditoría, no el token indefinidamente. |
| Flujo documental de ANIMA                                           | `TSVC-SVC-006`       | `APPLICATION_SCOPED_CUSTODY_WITHOUT_TRANSVERSE_POLICY` | Aplicar política de expediente y dominio; reconciliar objetos, metadatos, versiones, material local, backups y disposición.             |
| Webhook de pagos                                                    | `TSVC-SVC-008`       | `PROVIDER_PAYLOAD_WITH_DOMAIN_SPECIFIC_RETENTION`      | Minimizar payload; conservar ID, firma, mapping, resultado, conciliación y evidencia exigida por el proceso propietario.                |
| Webhook de RevenueCat                                               | `TSVC-SVC-008`       | `PROVIDER_PAYLOAD_WITH_DOMAIN_SPECIFIC_RETENTION`      | Conservar replay, mapping, estado y resultado necesarios; no adoptar la política del proveedor como regla VENTO.                        |

La reconciliación no afirma que estos activos hayan sido migrados, limpiados, archivados o sometidos a una política física. Su transición corresponde a `TSVC-CAT-010` y a los paquetes de implementación autorizados.

##### 3.32. Aplicación al carril `NEXO-REMISSIONS-001`

| Servicio       | Aplicabilidad NEXO | Decisión de retención para remisiones                                                                                               | Condición previa a disposición                                                                             |
| -------------- | ------------------ | ----------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `TSVC-SVC-001` | `OBLIGATORIA`      | Conservar operación, remisión, línea, idempotencia, resultado, intentos materiales, dead-letter y conciliación.                     | Remisión y trabajo terminales, sin hijo, resultado desconocido, incidente, diferencia ni hold.             |
| `TSVC-SVC-002` | `OBLIGATORIA`      | Conservar eventos, versiones, consumidoras, ACK, causalidad y tombstone anti-replay.                                                | Todas las consumidoras terminales y orden causal conciliado.                                               |
| `TSVC-SVC-003` | `CONDICIONAL`      | Conservar intención, ejemplar autorizado, layout, dispositivo, receipt, resultado físico y reemisión.                               | Resultado físico conocido o conciliado y evidencia necesaria preservada.                                   |
| `TSVC-SVC-004` | `OBLIGATORIA`      | Conservar solicitud, destinataria por referencia, plantilla, canal, resultado y supresión; minimizar contenido y token.             | Entrega técnica terminal, efecto empresarial no dependiente y ausencia de incidente o hold.                |
| `TSVC-SVC-005` | `OBLIGATORIA`      | Conservar fuente, versión, plantilla, documento, integridad, custodia y supersesión.                                                | Documento custodiado, obligación cerrada y política propietaria satisfecha.                                |
| `TSVC-SVC-006` | `OBLIGATORIA`      | Conservar originales, fotografías, firmas, soportes, hash, lineage y acceso conforme al proceso de remisión.                        | Remisión, disputa, devolución, custodia, investigación y hold cerrados; todas las ubicaciones verificadas. |
| `TSVC-SVC-007` | `OBLIGATORIA`      | Conservar evidencia por transición, actor, dispositivo, cantidades, condición, temperatura, recepción y diferencia.                 | Resultado empresarial y diferencias conciliados, sin investigación, obligación o hold.                     |
| `TSVC-SVC-008` | `CONDICIONAL`      | Conservar IDs externos, mapping, ACK, resultado y conciliación si interviene proveedor o frontera externa; minimizar payload crudo. | Resultado externo final, conciliación y disposición del proveedor verificadas.                             |
| `TSVC-SVC-009` | `CONDICIONAL`      | Conservar schedule, ocurrencia lógica, conciliación o vencimiento recurrente, operación hija y resultado.                           | Ocurrencia y trabajos hijos terminales, sin overlap, misfire abierto ni resultado desconocido.             |
| `TSVC-SVC-010` | `OBLIGATORIA`      | Compactar heartbeats y conservar transiciones, periodos degradados, incidentes y retiro de workers del paquete.                     | Intervalos reconstruibles, incidentes cerrados y pipeline de observabilidad verificado.                    |

Reglas específicas del carril:

1. el número y versión de remisión, sus líneas y cantidades por etapa no se eliminan mientras exista obligación, custodia, diferencia, devolución, reclamo o conciliación;
2. preparación, carga, despacho, recepción, aceptación, faltante, sobrante, daño y retorno conservan actores, momentos, cantidades y evidencia aplicables;
3. la corrección crea un evento o versión vinculada;
4. un buffer offline se retira solo después de receipt remoto, integridad, estado autoritativo, dependencias y conciliación;
5. el spool de impresión se trata como transitorio, pero no se retira con resultado físico desconocido;
6. una firma o fotografía conserva la política de evidencia, no la política breve de logs;
7. una métrica de remisiones no se convierte en fuente de verdad ni sustituye líneas y eventos;
8. un resultado técnico exitoso no habilita disposición del registro empresarial;
9. no se fijan plazos numéricos sin fuente aprobada;
10. ninguna capacidad se declara implementada por quedar definida en este registro.

Reconciliación NEXO:

| Clasificación | Cantidad |
| ------------- | -------: |
| Obligatorias  |        7 |
| Condicionales |        3 |
| Total         |       10 |

##### 3.33. Reconciliación cuantitativa

| Control                                                | Resultado |
| ------------------------------------------------------ | --------: |
| Servicios esperados                                    |        10 |
| Servicios materializados                               |        10 |
| Identificadores de servicio únicos                     |        10 |
| Servicios faltantes                                    |         0 |
| Servicios duplicados                                   |         0 |
| Clases canónicas de retención                          |         9 |
| Estados del ciclo de retención                         |         8 |
| Grupos de material gobernado                           |        17 |
| Eventos de ciclo definidos                             |        12 |
| Acciones canónicas de disposición                      |        12 |
| Servicios con decisión explícita de conservación       |        10 |
| Servicios con decisión explícita de reducción o retiro |        10 |
| Servicios con bloqueos explícitos                      |        10 |
| Servicios en `DEFINED_NOT_IMPLEMENTED`                 |        10 |
| Activos técnicos actuales reconciliados                |         7 |
| Decisiones NEXO materializadas                         |        10 |
| Plazos numéricos inventados                            |         0 |
| Políticas físicas creadas                              |         0 |
| Acciones de disposición ejecutadas                     |         0 |
| Cambios físicos de Supabase                            |         0 |

##### 3.34. Handoff obligatorio

| Tarea posterior | Insumo recibido de `TSVC-CAT-009`                                                                                                                                                                     |
| --------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `TSVC-CAT-010`  | Las nueve clases, ocho estados, diecisiete grupos, doce acciones, diez decisiones de servicio, siete activos actuales y gates que deberán gobernar adopción, coexistencia, migración y retiro legacy. |

`TSVC-CAT-010` deberá preservar las políticas aquí definidas durante cualquier transición. No podrá retirar un activo legacy antes de reconciliar pendientes, consumidores, archivos, evidencia, material local, proveedor, backup y tombstones aplicables.

---

#### 4. Artefactos y entregables

1. `TRANSVERSE-SERVICE-RETENTION-REGISTRY-001@1.0.0`.
2. Separación contractual entre política, registro activo, archivo, backup, hold, anonimización, eliminación, tombstone, supersesión y limpieza.
3. Catálogo de nueve clases canónicas de retención.
4. Catálogo de ocho estados del ciclo de retención.
5. Catálogo de diecisiete grupos de material gobernado.
6. Sobre mínimo de política de retención.
7. Catálogo de doce eventos que gobiernan el ciclo.
8. Catálogo de doce acciones de disposición.
9. Gate obligatorio de disposición y contrato de hold.
10. Contrato mínimo de tombstone.
11. Reglas de idempotencia, dead-letter, cuarentena y resultado desconocido.
12. Reglas para observabilidad, auditoría, evidencia, backups, proveedores y operación local.
13. Matriz materializada para `TSVC-SVC-001..010`.
14. Perfil específico de cada uno de los diez servicios.
15. Reconciliación de siete activos actuales.
16. Aplicación completa al carril `NEXO-REMISSIONS-001`.
17. Reconciliación cuantitativa sin faltantes ni duplicados.
18. Handoff cerrado hacia `TSVC-CAT-010`.

---

#### 5. Requisitos de prueba

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea materializa para los diez servicios transversales la política documental de retención, archivo, hold, tombstone, disposición y limpieza ya exigida por requisitos canónicos vigentes. No introduce un comportamiento empresarial adicional ni modifica alcance, estado, responsable, modalidad o relación de requisitos existentes.

La cobertura vigente incluye, entre otros:

- `TREQ-PROC-355` a `TREQ-PROC-389`, para trazabilidad, auditoría, retención, hold, eventos no destructivos, eliminación, backups, proveedores, material local y evidencia;
- `TREQ-PROC-497`, para volumen, cardinalidad, muestreo, almacenamiento, transferencia, retención y costo de telemetría;
- `TREQ-CONT-003` a `TREQ-CONT-006`, para contingencia, reconciliación, recuperación y evidencia;
- `TREQ-INTEGRATION-003`, `TREQ-INTEGRATION-004`, `TREQ-INTEGRATION-019` y `TREQ-INTEGRATION-023`, para idempotencia, trazabilidad, estados, resultado recuperable, operación asincrónica y dependencias.

La tarea genera:

```text
CREADOS = 0
MODIFICADOS = 0
DIFERIDOS = 0
DESCARTADOS_U_OBSOLETOS = 0
```

El registro canónico `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` permanece sin cambios.

---

#### 6. Criterios de aceptación

1. `TSVC-CAT-008` figura aprobada y `TSVC-CAT-009` corresponde a la continuidad vigente.
2. El registro cubre exactamente `TSVC-SVC-001..010`.
3. No existen servicios faltantes ni duplicados.
4. Se conservan los diez contratos, owners, productoras, consumidoras, identidades, perfiles de confiabilidad, señales y modos de contingencia heredados.
5. Se materializan nueve clases de retención sin inventar una taxonomía competidora.
6. Se materializan ocho estados del ciclo y no existe eliminación directa automática desde `ACTIVE`.
7. Se materializan diecisiete grupos de material con finalidad y regla principal.
8. Se definen doce eventos y doce acciones de disposición.
9. Archivo, backup, hold, anonimización, eliminación, supersesión y tombstone permanecen diferenciados.
10. Vencimiento no equivale a autorización de eliminación.
11. No se inventan plazos numéricos sin fuente legal, contractual, empresarial u operativa aprobada.
12. `RESULT_UNKNOWN`, `RECONCILIATION_REQUIRED`, dead-letter, cuarentena, incidente, investigación, disputa, obligación, dependencia y hold bloquean disposición incompatible.
13. La caducidad de una clave no autoriza reutilización semántica.
14. El tombstone mínimo no permite reconstruir contenido retirado.
15. El detalle operacional puede compactarse sin eliminar auditoría, resultado, anomalías o evidencia necesaria.
16. Logs, trazas, métricas, alertas y auditoría mantienen políticas separadas.
17. Los valores secretos no se retienen dentro del registro ordinario.
18. El backup no se presenta como archivo ni fuente de verdad.
19. La restauración respeta unidades previamente dispuestas.
20. La política del proveedor no sustituye la política VENTO.
21. La disposición externa permanece abierta hasta obtener estado y evidencia suficientes.
22. El material local no se retira antes de receipt, estado autoritativo y conciliación.
23. Las diez filas de servicio declaran clases, material preservado, material reducible, bloqueos y estado.
24. Los diez servicios permanecen `DEFINED_NOT_IMPLEMENTED`.
25. Los siete activos actuales se clasifican sin afirmar migración ni cumplimiento.
26. NEXO conserva siete capacidades obligatorias y tres condicionales.
27. El carril NEXO no pierde cantidades, custodia, firmas, evidencia, diferencias, retornos ni historia por limpieza técnica.
28. Se declaran cero cambios `TREQ-*` con justificación concreta.
29. No se crea una nueva versión del registro `04A`.
30. No se modifican código, datos, Storage, Supabase, migraciones, workers, colas, proveedores, dispositivos, configuración ni despliegues.
31. `TSVC-CAT-010` permanece exclusivamente reservada.

---

#### 7. Dependencias y entradas

##### 7.1. Fuentes canónicas

- `docs/plan-canonico/modular/01_PROTOCOLO.md`;
- `docs/plan-canonico/modular/delivery-contract.json`;
- `docs/plan-canonico/modular/active-sequence.json`;
- `docs/plan-canonico/modular/execution-route.json`;
- `docs/plan-canonico/modular/continuity-route.json`;
- `docs/plan-canonico/modular/priority-route-progress.json`;
- `docs/plan-canonico/modular/priority-delivery-lanes.json`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/00_INTRO.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/01_PRINCIPIO_DE_PROPIEDAD.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/02_CATALOGO_DE_SERVICIOS_TRANSVERSALES.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/03_INFRAESTRUCTURA_CANONICA_DE_COLAS.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/05_NOTIFICACIONES_Y_ALERTAS.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/06_ARCHIVOS_DOCUMENTOS_Y_EVIDENCIA.md`;
- `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/07_SALIDA_OBLIGATORIA.md`;
- `docs/plan-canonico/modular/bloques/E2_PROCESOS_Y_EXPERIENCIA/07_02_PRIVACIDAD_TRAZABILIDAD_Y_ACCESIBILIDAD.md`;
- versión canónica vigente de `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`;
- `package.json` y `scripts/docs/validate-task-delivery.mjs`.

##### 7.2. Tareas y decisiones heredadas

- `TSVC-CAT-001` — diez identidades, cuatro servicios parciales, seis faltantes y siete activos actuales;
- `TSVC-CAT-002` — owner técnico, repositorio y gobierno;
- `TSVC-CAT-003` — productoras, consumidoras y aplicabilidad NEXO;
- `TSVC-CAT-004` — contrato, versión y compatibilidad;
- `TSVC-CAT-005` — identidad técnica, referencia de credencial y mínimo privilegio;
- `TSVC-CAT-006` — idempotencia, replay, intentos, receipts, dead-letter y resultado desconocido;
- `TSVC-CAT-007` — métricas, logs, trazas, auditoría, alertas y health;
- `TSVC-CAT-008` — contingencia, degradación, buffers, folios, recuperación y conciliación;
- `NFR-REQ-006` — privacidad, trazabilidad, auditoría, retención y reconstrucción;
- carril prioritario `NEXO-REMISSIONS-001`.

##### 7.3. Restricción de evidencia

Esta definición no demuestra:

- política física creada;
- periodo legal o contractual validado;
- lifecycle configurado;
- archivo protegido disponible;
- backup alineado con manifiestos de disposición;
- hold aplicado;
- job de limpieza desplegado;
- anonimización irreversible ejecutada;
- eliminación física verificada;
- evidencia obtenida de proveedor;
- material local retirado;
- activo legacy migrado;
- validación remota, operativa, legal o de dispositivo.

Todas esas afirmaciones requieren implementación, autoridad y evidencia de las tareas y paquetes propietarios.

---

#### 8. Declaraciones expresamente no realizadas

Esta tarea no declara:

- plazos universales de conservación;
- interpretación legal, fiscal, laboral o contractual definitiva;
- selección de proveedor o tier de archivo;
- tablas de retención implementadas;
- Storage lifecycle activo;
- particiones o índices creados;
- cron o scheduler de limpieza disponible;
- eliminación productiva ejecutada;
- anonimización ejecutada;
- destrucción de claves ejecutada;
- archivos históricos migrados;
- backups depurados;
- holds reales creados o liberados;
- proveedores externos notificados;
- evidencia de disposición remota;
- activos actuales retirados;
- cumplimiento operativo o productivo.

---

#### 9. Continuidad canónica del bloque

```text
ÚLTIMA TAREA APROBADA
TSVC-CAT-008 — Definir contingencia y degradación controlada
        ↓
TAREA ACTUAL APROBADA
TSVC-CAT-009 — Definir retención, archivado y limpieza
        ↓
SIGUIENTE TAREA RESERVADA
TSVC-CAT-010 — Definir adopción progresiva y retiro de soluciones legacy
```


### [ ] TSVC-CAT-010 — Definir adopción progresiva y retiro de soluciones legacy
