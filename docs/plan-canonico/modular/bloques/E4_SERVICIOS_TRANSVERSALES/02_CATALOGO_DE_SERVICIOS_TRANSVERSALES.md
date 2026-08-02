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


### [ ] TSVC-CAT-004 — Definir contrato, versión y compatibilidad
### [ ] TSVC-CAT-005 — Definir identidad técnica y credenciales mínimas
### [ ] TSVC-CAT-006 — Definir idempotencia, reintentos y deduplicación
### [ ] TSVC-CAT-007 — Definir observabilidad, métricas, alertas y auditoría
### [ ] TSVC-CAT-008 — Definir contingencia y degradación controlada
### [ ] TSVC-CAT-009 — Definir retención, archivado y limpieza
### [ ] TSVC-CAT-010 — Definir adopción progresiva y retiro de soluciones legacy
