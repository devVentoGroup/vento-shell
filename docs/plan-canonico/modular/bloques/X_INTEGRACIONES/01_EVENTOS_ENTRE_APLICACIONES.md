### MINI-BLOQUE — EVENTOS ENTRE APLICACIONES

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **eventos entre aplicaciones** dentro de **X INTEGRACIONES**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `INT-APP-001` a `INT-APP-010` — 10 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Crear catálogo de eventos empresariales” y concluye con “Evitar escrituras cruzadas sin contrato”.
<!-- PLAN-SECTION-META:END -->

### ✅ INT-APP-001 — Crear catálogo de eventos empresariales

**Estado:** APROBADA  
**Fecha de aprobación documental:** 2026-07-29  
**Bloque propietario:** BLOQUE X — Integraciones empresariales internas y externas  
**Marcador exacto que reemplaza:** `### [ ] INT-APP-001 — Crear catálogo de eventos empresariales`  
**Cierre anterior:** `AUTH-UI-029 — Identificar vistas técnicas que no deben ser permisos` — APROBADA; BLOQUE I cerrado  
**Siguiente tarea:** `INT-APP-002 — Definir aplicación emisora de cada evento`  
**Línea base remota obligatoria:** `devVentoGroup/vento-shell@915ee847b5d75feb37e91a17010edd6b488c8594`  
**Tipo de tarea:** adopción, normalización y gobierno documental del catálogo transversal de hechos empresariales; sin implementación, transporte, credenciales, Supabase, efectos operativos, piloto ni despliegue

#### 1. Confirmación del orden canónico

El orden de implementación aprobado ubica, después de `AUTH-UI-001` a `AUTH-UI-029`, el BLOQUE X como siguiente bloque documental. Dentro de BLOQUE X, el mini-bloque de eventos inicia exactamente con `INT-APP-001`.

```text
AUTH-UI-001 a AUTH-UI-029
        ↓
BLOQUE X — INTEGRACIONES
        ↓
INT-APP-001 — CATÁLOGO DE EVENTOS EMPRESARIALES
        ↓
INT-APP-002 — APLICACIÓN EMISORA
        ↓
INT-APP-003 — APLICACIONES CONSUMIDORAS
```

#### 2. Objetivo

Crear una única identidad transversal y versionada para el catálogo de eventos empresariales de Vento OS, adoptando sin reinterpretación las **395 definiciones materiales** aprobadas por `PROC-CAT-017` para `VPROC-0001` a `VPROC-0069`.

```text
PROCESO PROPIETARIO CONFIRMA UN HECHO DURABLE
        ↓
DEFINICIÓN CANÓNICA VPROC-####.EVT-###
        ↓
ENTERPRISE-EVENT-CATALOG-001
        ↓
EMISORAS, CONSUMIDORAS Y CONTRATOS SE COMPLETAN EN INT-APP-002 A INT-APP-010
```

Esta tarea no crea una segunda tabla manual de 395 filas. El catálogo transversal **adopta por referencia inmutable** el registro completo de `PROC-CAT-017`, fijando su blob, conteo, vocabularios, reglas y huellas. De este modo, cada definición conserva una sola fuente normativa y BLOQUE X puede enriquecerla sin producir dos catálogos divergentes.

#### 3. Fuentes de verdad congeladas

| Fuente                                                                           | Revisión o blob                            | Responsabilidad                                                                         |
| -------------------------------------------------------------------------------- | ------------------------------------------ | --------------------------------------------------------------------------------------- |
| `vento-shell`                                                                    | `915ee847b5d75feb37e91a17010edd6b488c8594` | línea base remota y cierre de BLOQUE I                                                  |
| `X_INTEGRACIONES/00_INTRO_Y_PRINCIPIOS.md`                                       | `57144764e52d43b4129cd6a7d1f24e9e3935cffc` | frontera documental de BLOQUE X                                                         |
| `X_INTEGRACIONES/01_EVENTOS_ENTRE_APLICACIONES.md`                               | `b4f81b3b9424e2d1a2b3d86bfc6f3dd644e80f6b` | marcador y secuencia `INT-APP-001` a `010`                                              |
| `90_ORDEN_DE_IMPLEMENTACION.md`                                                  | `5adb3cb19b2625cccc87c3eca347925143c4d121` | orden obligatorio posterior a `AUTH-UI-029`                                             |
| `PROC-CAT-017` en `01_04_INFORMACION_EVENTOS_AUDITORIA_METRICAS_Y_DUPLICADOS.md` | `683c2540d88a7c665c8fd05cd6beb0fd74645b4d` | 395 definiciones, identidad, sobre, materialidad, sensibilidad y familias condicionales |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`                               | `490285ad8b5e2a28ef2ac6430d988844d4e283bf` | línea base remota de 4.014 requisitos                                                   |

#### 4. Dependencias consumidas y preservadas

- `CAP-MAP-009` como descubrimiento funcional inicial de comunicaciones;
- `PROC-CAT-005` y `PROC-CAT-006` como contratos de propietaria y consumidoras;
- `PROC-CAT-009` a `PROC-CAT-014` como estados, transiciones, excepciones y acciones de cancelación, anulación, reversión, compensación y corrección;
- `PROC-CAT-015` y `PROC-CAT-016` como entradas y salidas de proceso;
- `PROC-CAT-017` como fuente normativa de las 395 definiciones;
- `PROC-CAT-018` y `PROC-CAT-019` como contratos de auditoría y métricas;
- `PROC-CAT-020` como cierre de duplicidades de proceso;
- `TREQ-PROC-087` a `TREQ-PROC-094` como requisitos ya vigentes del contrato de eventos.

Ninguna decisión aprobada en esas tareas se modifica.

#### 5. Artefacto canónico producido

```text
ENTERPRISE-EVENT-CATALOG-001@1.0.0
```

| Propiedad                  | Valor                                      | Regla                                                                                    |
| -------------------------- | ------------------------------------------ | ---------------------------------------------------------------------------------------- |
| artifact_id                | `ENTERPRISE-EVENT-CATALOG-001`             | Identidad estable del catálogo transversal.                                              |
| catalog_version            | `1.0.0`                                    | Primera adopción del catálogo aprobado por procesos.                                     |
| catalog_status             | `DEFINED`                                  | Contrato documental definido; no significa implementado ni desplegado.                   |
| normal_event_definitions   | **395**                                    | Hitos materiales normales adoptados sin modificación.                                    |
| covered_processes          | **69 — `VPROC-0001` a `VPROC-0069`**       | Todos los procesos canónicos.                                                            |
| definitions_per_process    | **4 a 6**                                  | Nacimiento válido, hitos materiales y final normal.                                      |
| conditional_event_families | **8**                                      | Familias parametrizadas de excepción, cancelación, reversión, compensación y corrección. |
| canonical_source           | `PROC-CAT-017`                             | Fuente normativa de cada definición individual.                                          |
| source_blob                | `683c2540d88a7c665c8fd05cd6beb0fd74645b4d` | Snapshot inmutable consumido por esta tarea.                                             |
| governing_task             | `INT-APP-001`                              | Gobierna el manifiesto transversal y su continuidad en BLOQUE X.                         |

#### 6. Regla de adopción normativa

El conjunto canónico es exactamente:

```text
TODAS LAS FILAS DE PROC-CAT-017
CON event_definition_id = VPROC-####.EVT-###
Y CONTABILIZADAS COMO DEFINICIONES NORMALES = 395
```

Reglas:

1. cada fila individual conserva su texto, tipo, clase, estado o hecho fuente, hecho confirmado y sensibilidad;
2. el detalle fila por fila continúa residiendo en `PROC-CAT-017`, que es la única fuente normativa de contenido;
3. `ENTERPRISE-EVENT-CATALOG-001` fija el conjunto adoptado, su snapshot y el contrato transversal;
4. BLOQUE X agregará metadatos de integración mediante registros relacionados, no reescribiendo las definiciones;
5. una modificación funcional deberá actualizar primero la tarea propietaria y después versionar el manifiesto;
6. una diferencia entre el blob adoptado y la fuente vigente deberá fallar validación hasta reconciliarse explícitamente.

#### 7. Contrato mínimo del catálogo

| Campo                 | Valor o dominio                             | Responsabilidad                                              |
| --------------------- | ------------------------------------------- | ------------------------------------------------------------ |
| event_definition_id   | `VPROC-####.EVT-###`                        | Identidad estable de la definición.                          |
| event_type            | `vento.process.vproc-####.<hecho>.v<major>` | Tipo semántico versionado.                                   |
| event_major_version   | entero positivo                             | Versión incompatible del contrato.                           |
| process_id            | `VPROC-*`                                   | Proceso propietario del hecho.                               |
| source_state_or_fact  | estado o hecho aprobado                     | Condición durable que vuelve emitible el evento.             |
| event_class           | vocabulario cerrado                         | Naturaleza material del hito.                                |
| confirmed_fact        | declaración inequívoca                      | Qué quedó demostrado y qué no demuestra.                     |
| sensitivity_class     | vocabulario cerrado                         | Restricción mínima del contenido.                            |
| producer_contract_ref | `PROC-CAT-005`                              | Referencia de propiedad; se materializa en `INT-APP-002`.    |
| consumer_contract_ref | `PROC-CAT-006`                              | Referencia de consumidoras; se materializa en `INT-APP-003`. |
| envelope_contract_ref | `EVENT-ENVELOPE-001`                        | Sobre común obligatorio aprobado.                            |
| origin_task           | `PROC-CAT-017`                              | Origen funcional de la definición.                           |
| catalog_task          | `INT-APP-001`                               | Adopción y gobierno transversal.                             |
| lifecycle_status      | `DEFINED`                                   | No equivale a publicado, activo o implementado.              |

#### 8. Identidad y versionado

```text
DEFINITION ID
VPROC-####.EVT-###

EVENT TYPE
vento.process.vproc-####.<hecho-en-pasado-o-verdad-durable>.v<major>
```

- `event_definition_id` no cambia por renombre, traslado de aplicación o tecnología;
- `event_id` identifica una emisión concreta y nunca se reutiliza;
- un cambio incompatible crea otra versión mayor;
- un campo opcional aditivo no puede modificar el significado ni la obligatoriedad histórica;
- nombres de aplicación, sede, actor, proveedor, tabla, topic o broker no forman parte de la identidad semántica;
- aliases legacy solo se aceptan con equivalencia demostrada y ventana de retiro versionada.

#### 9. Vocabulario cerrado de clases

| Clase               | Interpretación                                          |
| ------------------- | ------------------------------------------------------- |
| PROCESS_STARTED     | Nacimiento válido de una instancia o ciclo.             |
| VALIDATION_FACT     | Validación material ejecutada o en curso.               |
| ANALYSIS_FACT       | Análisis material que conserva incertidumbre explícita. |
| REVIEW_FACT         | Revisión formal de propuesta, resultado o evidencia.    |
| DECISION_FACT       | Punto de decisión o espera de autoridad.                |
| READINESS_FACT      | Condición material de preparación o disponibilidad.     |
| ACTIVATION_FACT     | Activación o publicación que habilita uso controlado.   |
| EXECUTION_FACT      | Ejecución material en curso.                            |
| HANDOFF_FACT        | Transferencia de trabajo, custodia o responsabilidad.   |
| VERIFICATION_FACT   | Comprobación requerida antes de cierre o liberación.    |
| RECONCILIATION_FACT | Conciliación entre hechos, efectos o fuentes.           |
| PROCESS_COMPLETED   | Final normal comprobado de la instancia.                |

#### 10. Vocabulario cerrado de sensibilidad

| Sensibilidad           | Regla mínima                                                                                          |
| ---------------------- | ----------------------------------------------------------------------------------------------------- |
| `INTERNAL_OPERATIONAL` | Referencias operativas mínimas; sin credenciales ni datos personales innecesarios.                    |
| `RESTRICTED_PERSONAL`  | Proyección por finalidad y referencias protegidas para información laboral, SST, cliente o identidad. |
| `RESTRICTED_FINANCIAL` | Importes, cuentas, documentos y contrapartes limitados a necesidad y autorización.                    |
| `RESTRICTED_TECHNICAL` | Protección de fórmulas, especificaciones, métodos, secretos industriales y detalle técnico.           |

#### 11. Sobre común `EVENT-ENVELOPE-001`

Toda materialización posterior deberá soportar, cuando aplique:

```text
event_id
+ event_definition_id
+ event_type
+ event_version
+ process_id
+ process_instance_id
+ producer_application
+ aggregate_type
+ aggregate_id
+ aggregate_version
+ occurred_at
+ recorded_at
+ timezone
+ principal_id
+ effective_actor_id
+ actor_type
+ site_id
+ area_id
+ shift_id
+ device_id
+ previous_state
+ current_state
+ correlation_id
+ causation_id
+ request_id
+ idempotency_key
+ source_command_id
+ result_reference
+ output_references[]
+ evidence_references[]
+ audit_reference
+ reason_code
+ sensitivity_class
+ access_scope
+ retention_class
+ schema_version
+ trace_context
```

El sobre no obliga a exponer todos los campos a todas las consumidoras. Cada proyección deberá aplicar finalidad, minimización y autorización.

#### 12. Materialidad y exclusiones

Un evento normal se conserva cuando representa:

- nacimiento válido;
- validación o decisión material;
- readiness, activación o publicación;
- inicio o resultado material de ejecución;
- handoff, aceptación o transferencia de custodia;
- verificación o conciliación relevante;
- final normal comprobado.

No se incorpora como evento empresarial por sí solo:

- render, navegación o click;
- loading, cache hit o actualización visual;
- heartbeat, health check o log;
- intento no aceptado de comando;
- fila técnica interna sin hecho durable;
- ACK de cola, webhook, impresión o proveedor;
- notificación enviada;
- métrica agregada;
- cambio sin consumidor empresarial ni necesidad de reconstrucción.

#### 13. Fronteras obligatorias

| Elemento              | Responsabilidad                                       | No equivale a                                  |
| --------------------- | ----------------------------------------------------- | ---------------------------------------------- |
| Comando               | Solicita una acción y puede ser aceptado o rechazado. | Evento empresarial.                            |
| Evento empresarial    | Describe un hecho durable ya persistido.              | Orden, permiso o fuente de verdad completa.    |
| Evento de integración | Adapta un evento a un contrato externo.               | Definición empresarial original.               |
| Notificación          | Informa a una persona o canal.                        | Prueba de procesamiento ni cambio empresarial. |
| Auditoría             | Explica quién intentó, decidió o ejecutó qué.         | Registro empresarial ni payload del evento.    |
| Log técnico           | Diagnostica infraestructura o ejecución.              | Hecho empresarial.                             |
| Métrica               | Agrega hechos para medir comportamiento.              | Historia de una instancia.                     |

#### 14. Familias condicionales

Las siguientes familias se mantienen parametrizadas por proceso y **no forman parte del conteo de 395**:

| Familia                 | Condición de emisión                                                   | Restricción                                                       |
| ----------------------- | ---------------------------------------------------------------------- | ----------------------------------------------------------------- |
| `exception-applied`     | Se aplica una acción `EX-*`.                                           | Incluye acción, autoridad, vigencia y efecto; no finge reversión. |
| `exception-resolved`    | Se levanta o encamina la condición excepcional.                        | No cambia estado principal si el contrato no lo ordena.           |
| `cancellation-recorded` | Se cancela trabajo futuro válido.                                      | Conserva efectos ejecutados y obligaciones residuales.            |
| `void-recorded`         | Se demuestra que un registro no produjo efecto válido o era duplicado. | No se usa como borrado genérico.                                  |
| `reversal-applied`      | Se crea un efecto inverso legítimo.                                    | Referencia y conserva el efecto original.                         |
| `compensation-posted`   | Un hecho irreversible requiere efecto compensatorio.                   | No declara deshecho el original.                                  |
| `correction-applied`    | Se rectifica información.                                              | Conserva antes, después, motivo, autoridad y versión.             |
| `linked-review-opened`  | El cierre requiere una revisión posterior.                             | La instancia original permanece inmutable.                        |

#### 15. Relación con códigos de descubrimiento de E1

Los siguientes 29 códigos de `CAP-MAP-009` permanecen como **referencias de descubrimiento funcional**, no como identidades del catálogo:

```text
EVT-ORG-001, EVT-IAM-001, EVT-WRK-001, EVT-ATT-001, EVT-ATT-002, EVT-CAT-001, EVT-REC-001, EVT-PUR-001, EVT-PUR-002, EVT-PUR-003, EVT-INV-001, EVT-INV-002, EVT-TRF-001, EVT-TRF-002, EVT-PRD-001, EVT-PRD-002, EVT-PRD-003, EVT-SAL-001, EVT-SAL-002, EVT-PAY-001, EVT-CASH-001, EVT-CUS-001, EVT-DEL-001, EVT-DEL-002, EVT-ECO-001, EVT-ANA-001, EVT-DOC-001, EVT-INC-001, EVT-INC-002
```

No se crea un alias automático uno a uno. Cualquier mapping deberá demostrar equivalencia de hecho, proceso, momento, agregado, versión, sensibilidad y efecto.

#### 16. Reglas transversales preservadas

1. solo el propietario del proceso confirma el hecho oficial;
2. una consumidora no modifica el hecho original;
3. toda emisión conserva referencia estable, versión y correlación;
4. un evento no concede autorización ni acceso al agregado;
5. la escritura empresarial y su registro publicable deberán ser atómicos;
6. la entrega podrá repetirse, pero el efecto no;
7. el orden es por agregado, no global;
8. el fallo de una consumidora no revierte el hecho propietario;
9. un evento tardío no sobrescribe una versión posterior;
10. backfill y replay no activan efectos sensibles sin control explícito;
11. datos externos se conservan como afirmación hasta validación interna;
12. secretos y credenciales quedan prohibidos en el catálogo y payload;
13. un ACK técnico no demuestra resultado empresarial;
14. no se habilita a AURA ni a otra aplicación por aparecer en documentación;
15. NUMERA consume hechos confirmados y no corrige procesos operativos mediante escritura inversa.

#### 17. Decisiones reservadas

| Decisión                                                      | Tarea propietaria |
| ------------------------------------------------------------- | ----------------- |
| Aplicación emisora exacta por definición                      | `INT-APP-002`     |
| Aplicaciones consumidoras, finalidad y proyección             | `INT-APP-003`     |
| Clave, alcance y almacenamiento de idempotencia               | `INT-APP-004`     |
| Política de reintentos, backoff y límites                     | `INT-APP-005`     |
| Compensaciones y coordinación de efectos irreversibles        | `INT-APP-006`     |
| Auditoría transversal de publicación y consumo                | `INT-APP-007`     |
| Estados pendientes de sincronización                          | `INT-APP-008`     |
| Errores parciales, dead-letter y conciliación                 | `INT-APP-009`     |
| Contratos de escritura cruzada y prohibiciones                | `INT-APP-010`     |
| Tablas, outbox, RLS, triggers, esquemas y migraciones         | BLOQUES E3 y R    |
| Topics, colas, adaptadores, observabilidad y retención física | BLOQUE E4         |
| Tipos y contratos compartidos materializados                  | BLOQUE H          |
| Implementación, cutover, piloto, rollback e hypercare         | BLOQUE E5         |

No queda decisión técnica o contractual sin tarea propietaria.

#### 18. Cambios no autorizados

`INT-APP-001` no autoriza:

- crear tablas, schemas, outbox, triggers, funciones, RPC, RLS o migraciones;
- crear topics, colas, subscriptions, jobs, webhooks o endpoints;
- asignar productoras o consumidoras por fuera de sus tareas exactas;
- solicitar o almacenar credenciales;
- enviar eventos reales o replays;
- sincronizar datos;
- modificar estados empresariales;
- ejecutar integraciones externas;
- iniciar piloto, cutover, rollback o producción;
- cambiar contratos TypeScript o publicar paquetes.

#### 19. Requisitos de prueba derivados

```text
TREQ-INTEGRATION-024 a TREQ-INTEGRATION-053
```

El detalle completo reside exclusivamente en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA_INT-APP-001.md`.

#### 20. Huellas de integridad

```text
ENTERPRISE_EVENT_CATALOG_MANIFEST_SHA256 = 4058fdcc5742b636695aa03a342b74250f86c583ee9c217b8a5046dd9abac278
EVENT_CLASS_VOCABULARY_SHA256 = 8ea2e137fe5236083b9d60a8da6ebd25c4ce1f324e3b00d83654c4321bfc153b
EVENT_SENSITIVITY_VOCABULARY_SHA256 = ad0da8b302d036006e877e533d033d627e11e1be69775802d00ab8a357cc97fa
CONDITIONAL_EVENT_FAMILIES_SHA256 = 06ab3476e241862ca66000dd12699193da2c96257f7042b2aac26e83589dadac
PROC_CAT_017_SOURCE_BLOB_SHA1 = 683c2540d88a7c665c8fd05cd6beb0fd74645b4d
```

#### 21. Criterios de aceptación

- [x] Se confirmó el orden posterior a `AUTH-UI-029` en el remoto.
- [x] `INT-APP-001` es la primera tarea de BLOQUE X.
- [x] Se congelaron commit y blobs consumidos.
- [x] Se adoptaron exactamente 395 definiciones normales de 69 procesos.
- [x] No se duplicó la fuente normativa fila por fila.
- [x] Se conservaron identidad, tipo, clase, hecho fuente, hecho confirmado y sensibilidad.
- [x] Se separaron eventos, comandos, notificaciones, auditoría y logs.
- [x] Se definió el sobre común obligatorio.
- [x] Se preservaron ocho familias condicionales fuera del conteo normal.
- [x] Se cerró la relación con los 29 códigos de descubrimiento sin crear aliases inseguros.
- [x] Cada decisión posterior quedó asignada a `INT-APP-002` a `INT-APP-010`, E3, E4, H o E5.
- [x] No se autorizó implementación ni efecto operativo.
- [x] Se generaron 30 requisitos completos.

#### 22. Validaciones documentales realizadas

| Control                                      | Resultado                                            |
| -------------------------------------------- | ---------------------------------------------------- |
| Commit remoto leído                          | `915ee847b5d75feb37e91a17010edd6b488c8594`           |
| Blob propietario                             | `b4f81b3b9424e2d1a2b3d86bfc6f3dd644e80f6b`           |
| Blob de principios de BLOQUE X               | `57144764e52d43b4129cd6a7d1f24e9e3935cffc`           |
| Blob del orden de implementación             | `5adb3cb19b2625cccc87c3eca347925143c4d121`           |
| Blob fuente PROC-CAT-017                     | `683c2540d88a7c665c8fd05cd6beb0fd74645b4d`           |
| Blob 04A base                                | `490285ad8b5e2a28ef2ac6430d988844d4e283bf`           |
| Procesos cubiertos                           | **69**                                               |
| Definiciones normales adoptadas              | **395**                                              |
| Eventos normales por proceso                 | **4 a 6**                                            |
| Familias condicionales                       | **8**                                                |
| Códigos de descubrimiento preservados        | **29**                                               |
| Requisitos base                              | **4.014**                                            |
| Requisitos nuevos                            | **30**                                               |
| Total regenerado                             | **4.044**                                            |
| Dominio INTEGRATION                          | **53 — TREQ-INTEGRATION-001 a TREQ-INTEGRATION-053** |
| Filas con catorce columnas                   | **4.044 de 4.044**                                   |
| Identificadores TREQ duplicados              | **0**                                                |
| Relaciones TREQ no resolubles                | **0**                                                |
| Filas históricas modificadas                 | **0**                                                |
| Código, Supabase o integraciones modificados | **no**                                               |

#### 23. Instrucción de reemplazo

1. Reemplazar exactamente `### [ ] INT-APP-001 — Crear catálogo de eventos empresariales` por este documento completo.
2. Reemplazar completamente `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` por el archivo regenerado entregado con esta tarea.
3. No copiar, fusionar ni insertar filas `TREQ-*` manualmente.

#### 24. Continuidad aprobada

```text
ÚLTIMA TAREA APROBADA
INT-APP-001 — Crear catálogo de eventos empresariales
        ↓
TAREA ACTUAL
INT-APP-002 — Definir aplicación emisora de cada evento
        ↓
SIGUIENTE TAREA RESERVADA
INT-APP-003 — Definir aplicaciones consumidoras
```

APROBADA


### ✅ INT-APP-002 — Definir aplicación emisora de cada evento

**Estado:** APROBADA  
**Fecha de aprobación documental:** 2026-07-29  
**Bloque propietario:** BLOQUE X — Integraciones empresariales internas y externas  
**Marcador exacto que reemplaza:** `### [ ] INT-APP-002 — Definir aplicación emisora de cada evento`  
**Tarea anterior:** `INT-APP-001 — Crear catálogo de eventos empresariales` — APROBADA  
**Siguiente tarea:** `INT-APP-003 — Definir aplicaciones consumidoras`  
**Línea base remota obligatoria:** `devVentoGroup/vento-shell@9f0b1ac928a946c1148432acc5885ea0dd766719`  
**Tipo de tarea:** definición documental de autoridad emisora por evento; sin implementación, transporte, credenciales, Supabase, publicación real, replay, piloto ni despliegue

#### 1. Objetivo

Asignar una única aplicación emisora empresarial a cada una de las **395 definiciones normales** de `ENTERPRISE-EVENT-CATALOG-001`, preservando la propiedad funcional de los **69 procesos** aprobada en `PROC-CAT-005`.

```text
EVENTO VPROC-####.EVT-###
        ↓
PROCESS_ID VPROC-####
        ↓
OWNER_APP_CODE APROBADO EN PROC-CAT-005
        ↓
PRODUCER_APPLICATION ÚNICO
```

La regla no se decide por la pantalla que inicia el trabajo, la aplicación que recibe primero una solicitud, el repositorio que contiene código compartido, la tabla donde se persiste, el adaptador que recibe un webhook ni el componente que publica físicamente el mensaje.

#### 2. Fuentes de verdad congeladas

| Fuente                                                     | Revisión o blob                            | Responsabilidad                                         |
| ---------------------------------------------------------- | ------------------------------------------ | ------------------------------------------------------- |
| `vento-shell`                                              | `9f0b1ac928a946c1148432acc5885ea0dd766719` | revisión remota con `INT-APP-001` y 04A integrados      |
| `X_INTEGRACIONES/01_EVENTOS_ENTRE_APLICACIONES.md`         | `09b28fca5c0d8f667abd18db0636f03f5bf1ef98` | secuencia y contrato de `INT-APP-001` a `INT-APP-010`   |
| `PROC-CAT-005` / `PROC-APPLICATION-OWNERSHIP-REGISTRY-001` | `f716207c571ab33e1d22584c249d874c65a50501` | propietaria única de cada `VPROC-*`                     |
| `PROC-CAT-017`                                             | `683c2540d88a7c665c8fd05cd6beb0fd74645b4d` | 395 definiciones normales y ocho familias condicionales |
| `ENTERPRISE-EVENT-CATALOG-001@1.0.0`                       | `INT-APP-001` integrado                    | conjunto transversal adoptado                           |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`         | `d80caae04a4e7284b355dc47c8a8d270010f43fb` | línea base remota de 4.044 requisitos                   |

#### 3. Artefacto producido

```text
ENTERPRISE-EVENT-PRODUCER-REGISTRY-001@1.0.0
```

| Propiedad                     | Valor                                    | Regla                                            |
| ----------------------------- | ---------------------------------------- | ------------------------------------------------ |
| `registry_id`                 | `ENTERPRISE-EVENT-PRODUCER-REGISTRY-001` | identidad estable del registro de emisoras       |
| `registry_version`            | `1.0.0`                                  | primera asignación transversal                   |
| `registry_status`             | `DEFINED`                                | definición documental; no prueba implementación  |
| `normal_event_definitions`    | **395**                                  | todas las definiciones de `INT-APP-001`          |
| `covered_processes`           | **69**                                   | `VPROC-0001` a `VPROC-0069`                      |
| `business_producer_apps`      | **9**                                    | aplicaciones con al menos un proceso asignado    |
| `deferred_producer_apps`      | **1**                                    | `aura`, definida sin publicador activo           |
| `shell_events`                | **0**                                    | SHELL no es propietaria de estos procesos        |
| `external_business_producers` | **0**                                    | terceros y proveedores no emiten hechos internos |
| `ownership_source`            | `PROC-CAT-005`                           | única fuente de asignación                       |
| `event_source`                | `PROC-CAT-017` / `INT-APP-001`           | identidad y materialidad del evento              |

#### 4. Regla normativa de asignación

Para toda definición normal:

```text
producer_application(event_definition_id)
=
owner_app_code(process_id(event_definition_id))
```

Para toda familia condicional:

```text
producer_application(VPROC-####.<familia-condicional>)
=
owner_app_code(VPROC-####)
```

Consecuencias obligatorias:

1. cada definición tiene exactamente una emisora empresarial;
2. todas las definiciones de un mismo `VPROC-*` heredan la misma emisora;
3. una consumidora no puede publicar la definición de la propietaria;
4. la indisponibilidad de la propietaria no crea una productora de respaldo;
5. un cambio técnico de publicador no cambia `producer_application`;
6. un cambio de propietaria exige actualizar primero `PROC-CAT-005` y ejecutar transición controlada;
7. la asignación no concede permisos, acceso ni escritura cruzada.

#### 5. Separación de responsabilidades

| Concepto               | Responsabilidad                              | Regla                                                        |
| ---------------------- | -------------------------------------------- | ------------------------------------------------------------ |
| `business_producer`    | aplicación propietaria que confirma el hecho | coincide con `producer_application`                          |
| `technical_publisher`  | componente que serializa o entrega el evento | se registra aparte; no adquiere propiedad                    |
| `external_adapter`     | valida y transforma una afirmación externa   | no emite el hecho interno hasta aceptación de la propietaria |
| `consumer_application` | reacciona dentro de su dominio               | no reemite ni corrige el evento fuente                       |
| `database_or_platform` | persiste o ejecuta infraestructura           | Supabase no es una aplicación emisora empresarial            |
| `shared_package`       | aporta contrato, SDK o helper                | no se convierte en productora                                |
| `human_actor`          | decide o ejecuta con autoridad               | queda en actor y auditoría, no en `producer_application`     |

El sobre podrá incorporar posteriormente `publisher_component`, `adapter_id`, `deployment_id` o equivalente para observabilidad, manteniendo `producer_application` como autoridad empresarial.

#### 6. Contrato mínimo del registro de emisoras

| Campo                        | Regla                                                       |
| ---------------------------- | ----------------------------------------------------------- |
| `event_definition_id`        | definición `VPROC-####.EVT-###` adoptada en `INT-APP-001`   |
| `process_id`                 | `VPROC-*` del evento                                        |
| `producer_application`       | `owner_app_code` exacto de `PROC-CAT-005`                   |
| `producer_assignment_status` | `DEFINED` o `DEFINED_DEFERRED`                              |
| `ownership_registry_ref`     | `PROC-APPLICATION-OWNERSHIP-REGISTRY-001`                   |
| `event_catalog_ref`          | `ENTERPRISE-EVENT-CATALOG-001@1.0.0`                        |
| `ownership_decision_ref`     | decisión posterior cuando cambie la propietaria             |
| `technical_publisher_ref`    | reservado para E3/E4; no sustituye la emisora               |
| `legacy_producer_mapping`    | equivalencia demostrada y ventana de retiro, cuando aplique |
| `origin_task`                | `INT-APP-002`                                               |

#### 7. Registro explícito por proceso y rango de eventos

Cada fila representa todas las definiciones incluidas en el rango; por tanto, las **395 definiciones** quedan asignadas sin repetir 395 veces la misma decisión de propiedad.

| Proceso      | Definiciones cubiertas                      | Eventos | Emisora  | Estado de asignación | Fuente         |
| ------------ | ------------------------------------------- | ------: | -------- | -------------------- | -------------- |
| `VPROC-0001` | `VPROC-0001.EVT-001` a `VPROC-0001.EVT-005` |   **5** | `viso`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0002` | `VPROC-0002.EVT-001` a `VPROC-0002.EVT-006` |   **6** | `viso`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0003` | `VPROC-0003.EVT-001` a `VPROC-0003.EVT-004` |   **4** | `viso`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0004` | `VPROC-0004.EVT-001` a `VPROC-0004.EVT-006` |   **6** | `viso`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0005` | `VPROC-0005.EVT-001` a `VPROC-0005.EVT-006` |   **6** | `viso`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0006` | `VPROC-0006.EVT-001` a `VPROC-0006.EVT-006` |   **6** | `viso`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0007` | `VPROC-0007.EVT-001` a `VPROC-0007.EVT-006` |   **6** | `viso`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0008` | `VPROC-0008.EVT-001` a `VPROC-0008.EVT-005` |   **5** | `anima`  | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0009` | `VPROC-0009.EVT-001` a `VPROC-0009.EVT-006` |   **6** | `viso`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0010` | `VPROC-0010.EVT-001` a `VPROC-0010.EVT-006` |   **6** | `numera` | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0011` | `VPROC-0011.EVT-001` a `VPROC-0011.EVT-006` |   **6** | `viso`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0012` | `VPROC-0012.EVT-001` a `VPROC-0012.EVT-006` |   **6** | `viso`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0013` | `VPROC-0013.EVT-001` a `VPROC-0013.EVT-006` |   **6** | `viso`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0014` | `VPROC-0014.EVT-001` a `VPROC-0014.EVT-006` |   **6** | `viso`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0015` | `VPROC-0015.EVT-001` a `VPROC-0015.EVT-004` |   **4** | `nexo`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0016` | `VPROC-0016.EVT-001` a `VPROC-0016.EVT-005` |   **5** | `fogo`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0017` | `VPROC-0017.EVT-001` a `VPROC-0017.EVT-004` |   **4** | `pulso`  | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0018` | `VPROC-0018.EVT-001` a `VPROC-0018.EVT-005` |   **5** | `nexo`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0019` | `VPROC-0019.EVT-001` a `VPROC-0019.EVT-005` |   **5** | `origo`  | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0020` | `VPROC-0020.EVT-001` a `VPROC-0020.EVT-005` |   **5** | `origo`  | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0021` | `VPROC-0021.EVT-001` a `VPROC-0021.EVT-006` |   **6** | `origo`  | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0022` | `VPROC-0022.EVT-001` a `VPROC-0022.EVT-006` |   **6** | `origo`  | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0023` | `VPROC-0023.EVT-001` a `VPROC-0023.EVT-006` |   **6** | `nexo`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0024` | `VPROC-0024.EVT-001` a `VPROC-0024.EVT-006` |   **6** | `nexo`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0025` | `VPROC-0025.EVT-001` a `VPROC-0025.EVT-006` |   **6** | `nexo`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0026` | `VPROC-0026.EVT-001` a `VPROC-0026.EVT-006` |   **6** | `nexo`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0027` | `VPROC-0027.EVT-001` a `VPROC-0027.EVT-006` |   **6** | `nexo`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0028` | `VPROC-0028.EVT-001` a `VPROC-0028.EVT-006` |   **6** | `nexo`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0029` | `VPROC-0029.EVT-001` a `VPROC-0029.EVT-006` |   **6** | `nexo`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0030` | `VPROC-0030.EVT-001` a `VPROC-0030.EVT-006` |   **6** | `nexo`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0031` | `VPROC-0031.EVT-001` a `VPROC-0031.EVT-006` |   **6** | `nexo`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0032` | `VPROC-0032.EVT-001` a `VPROC-0032.EVT-006` |   **6** | `nexo`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0033` | `VPROC-0033.EVT-001` a `VPROC-0033.EVT-004` |   **4** | `fogo`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0034` | `VPROC-0034.EVT-001` a `VPROC-0034.EVT-006` |   **6** | `fogo`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0035` | `VPROC-0035.EVT-001` a `VPROC-0035.EVT-006` |   **6** | `fogo`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0036` | `VPROC-0036.EVT-001` a `VPROC-0036.EVT-006` |   **6** | `fogo`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0037` | `VPROC-0037.EVT-001` a `VPROC-0037.EVT-006` |   **6** | `fogo`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0038` | `VPROC-0038.EVT-001` a `VPROC-0038.EVT-005` |   **5** | `pulso`  | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0039` | `VPROC-0039.EVT-001` a `VPROC-0039.EVT-005` |   **5** | `pulso`  | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0040` | `VPROC-0040.EVT-001` a `VPROC-0040.EVT-006` |   **6** | `pulso`  | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0041` | `VPROC-0041.EVT-001` a `VPROC-0041.EVT-006` |   **6** | `pulso`  | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0042` | `VPROC-0042.EVT-001` a `VPROC-0042.EVT-006` |   **6** | `pulso`  | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0043` | `VPROC-0043.EVT-001` a `VPROC-0043.EVT-006` |   **6** | `pulso`  | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0044` | `VPROC-0044.EVT-001` a `VPROC-0044.EVT-006` |   **6** | `pulso`  | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0045` | `VPROC-0045.EVT-001` a `VPROC-0045.EVT-006` |   **6** | `pass`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0046` | `VPROC-0046.EVT-001` a `VPROC-0046.EVT-006` |   **6** | `pulso`  | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0047` | `VPROC-0047.EVT-001` a `VPROC-0047.EVT-006` |   **6** | `pulso`  | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0048` | `VPROC-0048.EVT-001` a `VPROC-0048.EVT-005` |   **5** | `nexo`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0049` | `VPROC-0049.EVT-001` a `VPROC-0049.EVT-006` |   **6** | `nexo`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0050` | `VPROC-0050.EVT-001` a `VPROC-0050.EVT-006` |   **6** | `pulso`  | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0051` | `VPROC-0051.EVT-001` a `VPROC-0051.EVT-006` |   **6** | `numera` | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0052` | `VPROC-0052.EVT-001` a `VPROC-0052.EVT-006` |   **6** | `numera` | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0053` | `VPROC-0053.EVT-001` a `VPROC-0053.EVT-006` |   **6** | `numera` | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0054` | `VPROC-0054.EVT-001` a `VPROC-0054.EVT-006` |   **6** | `numera` | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0055` | `VPROC-0055.EVT-001` a `VPROC-0055.EVT-006` |   **6** | `nexo`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0056` | `VPROC-0056.EVT-001` a `VPROC-0056.EVT-005` |   **5** | `aura`   | `DEFINED_DEFERRED`   | `PROC-CAT-005` |
| `VPROC-0057` | `VPROC-0057.EVT-001` a `VPROC-0057.EVT-006` |   **6** | `aura`   | `DEFINED_DEFERRED`   | `PROC-CAT-005` |
| `VPROC-0058` | `VPROC-0058.EVT-001` a `VPROC-0058.EVT-006` |   **6** | `viso`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0059` | `VPROC-0059.EVT-001` a `VPROC-0059.EVT-006` |   **6** | `viso`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0060` | `VPROC-0060.EVT-001` a `VPROC-0060.EVT-005` |   **5** | `viso`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0061` | `VPROC-0061.EVT-001` a `VPROC-0061.EVT-006` |   **6** | `numera` | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0062` | `VPROC-0062.EVT-001` a `VPROC-0062.EVT-006` |   **6** | `viso`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0063` | `VPROC-0063.EVT-001` a `VPROC-0063.EVT-006` |   **6** | `viso`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0064` | `VPROC-0064.EVT-001` a `VPROC-0064.EVT-006` |   **6** | `viso`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0065` | `VPROC-0065.EVT-001` a `VPROC-0065.EVT-006` |   **6** | `viso`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0066` | `VPROC-0066.EVT-001` a `VPROC-0066.EVT-006` |   **6** | `viso`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0067` | `VPROC-0067.EVT-001` a `VPROC-0067.EVT-006` |   **6** | `nexo`   | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0068` | `VPROC-0068.EVT-001` a `VPROC-0068.EVT-006` |   **6** | `pulso`  | `DEFINED`            | `PROC-CAT-005` |
| `VPROC-0069` | `VPROC-0069.EVT-001` a `VPROC-0069.EVT-006` |   **6** | `numera` | `DEFINED`            | `PROC-CAT-005` |

#### 8. Distribución reconciliada por emisora

| Emisora  | Procesos | Eventos normales | Estado             | Procesos asignados                                                                                                                                                                                                                                                                     |
| -------- | -------: | ---------------: | ------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `viso`   |       20 |              116 | `DEFINED`          | `VPROC-0001`, `VPROC-0002`, `VPROC-0003`, `VPROC-0004`, `VPROC-0005`, `VPROC-0006`, `VPROC-0007`, `VPROC-0009`, `VPROC-0011`, `VPROC-0012`, `VPROC-0013`, `VPROC-0014`, `VPROC-0058`, `VPROC-0059`, `VPROC-0060`, `VPROC-0062`, `VPROC-0063`, `VPROC-0064`, `VPROC-0065`, `VPROC-0066` |
| `nexo`   |       16 |               92 | `DEFINED`          | `VPROC-0015`, `VPROC-0018`, `VPROC-0023`, `VPROC-0024`, `VPROC-0025`, `VPROC-0026`, `VPROC-0027`, `VPROC-0028`, `VPROC-0029`, `VPROC-0030`, `VPROC-0031`, `VPROC-0032`, `VPROC-0048`, `VPROC-0049`, `VPROC-0055`, `VPROC-0067`                                                         |
| `pulso`  |       12 |               68 | `DEFINED`          | `VPROC-0017`, `VPROC-0038`, `VPROC-0039`, `VPROC-0040`, `VPROC-0041`, `VPROC-0042`, `VPROC-0043`, `VPROC-0044`, `VPROC-0046`, `VPROC-0047`, `VPROC-0050`, `VPROC-0068`                                                                                                                 |
| `numera` |        7 |               42 | `DEFINED`          | `VPROC-0010`, `VPROC-0051`, `VPROC-0052`, `VPROC-0053`, `VPROC-0054`, `VPROC-0061`, `VPROC-0069`                                                                                                                                                                                       |
| `fogo`   |        6 |               33 | `DEFINED`          | `VPROC-0016`, `VPROC-0033`, `VPROC-0034`, `VPROC-0035`, `VPROC-0036`, `VPROC-0037`                                                                                                                                                                                                     |
| `origo`  |        4 |               22 | `DEFINED`          | `VPROC-0019`, `VPROC-0020`, `VPROC-0021`, `VPROC-0022`                                                                                                                                                                                                                                 |
| `aura`   |        2 |               11 | `DEFINED_DEFERRED` | `VPROC-0056`, `VPROC-0057`                                                                                                                                                                                                                                                             |
| `anima`  |        1 |                5 | `DEFINED`          | `VPROC-0008`                                                                                                                                                                                                                                                                           |
| `pass`   |        1 |                6 | `DEFINED`          | `VPROC-0045`                                                                                                                                                                                                                                                                           |
| `shell`  |        0 |                0 | `NOT_APPLICABLE`   | —                                                                                                                                                                                                                                                                                      |

```text
PROCESOS MAPEADOS                     69
EVENTOS NORMALES MAPEADOS            395
EVENTOS SIN EMISORA                    0
EVENTOS CON EMISORA MÚLTIPLE           0
EMISORAS EMPRESARIALES EXTERNAS        0
EVENTOS EMPRESARIALES DE SHELL          0
EVENTOS ASIGNADOS A AURA DIFERIDA      11
```

#### 9. Fronteras críticas entre aplicaciones

##### 9.1. ORIGO y NEXO

- `VPROC-0019` a `VPROC-0022` son emitidos por `origo`;
- `VPROC-0023` a `VPROC-0032` son emitidos por `nexo`;
- una recepción comercial aceptada no es todavía un ingreso físico conciliado;
- ORIGO no emite movimientos de inventario y NEXO no reemite la aceptación comercial.

##### 9.2. FOGO y NEXO

- `fogo` emite receta, plan, producción, calidad, empaque y cierre productivo;
- `nexo` emite reserva, consumo, entrada, traslado, condición y demás hechos físicos de existencias;
- una producción completada no equivale a producto liberado ni a movimiento de inventario confirmado.

##### 9.3. PULSO, NUMERA y PASS

- `pulso` emite oferta, pedido, servicio, venta, pago asociado, caja, reclamo, reserva y entrega al cliente;
- `numera` emite obligaciones, registros y conciliaciones económicas de sus propios procesos;
- `pass` emite identidad y fidelización del cliente;
- el consumo de una venta no permite a NUMERA recrearla y la ejecución de puntos en caja no convierte a PULSO en propietaria del saldo.

##### 9.4. VISO y ANIMA

- `viso` emite programación, novedades, vínculo, retiro y demás resultados laborales asignados;
- `anima` emite únicamente los hechos del proceso `VPROC-0008` de asistencia;
- mostrar turnos o iniciar una solicitud personal no transfiere propiedad.

##### 9.5. AURA diferida

`aura` conserva propiedad objetivo sobre `VPROC-0056` y `VPROC-0057`, equivalentes a **11 definiciones**. La asignación queda `DEFINED_DEFERRED`: no declara repositorio listo, publicador activo, integración, navegación, credenciales ni operación.

#### 10. Entradas externas y adaptadores

```text
SISTEMA EXTERNO PRODUCE UNA AFIRMACIÓN
        ↓
ADAPTADOR CONSERVA PAYLOAD, FIRMA, ID Y MOMENTO
        ↓
APLICACIÓN PROPIETARIA VALIDA Y ACEPTA
        ↓
HECHO INTERNO PERSISTIDO
        ↓
EVENTO CANÓNICO EMITIDO POR LA PROPIETARIA
```

Aplicaciones o sistemas externos nunca se registran como `producer_application` interno. Esto aplica a Rappi, Shopify, ManyChat, proveedores de pago, bancos, mensajería, autoridades, asesores y cualquier tercero futuro.

#### 11. Familias condicionales

Las ocho familias aprobadas en `INT-APP-001` heredan la emisora del proceso:

- `exception-applied`;
- `exception-resolved`;
- `cancellation-recorded`;
- `void-recorded`;
- `reversal-applied`;
- `compensation-posted`;
- `correction-applied`;
- `linked-review-opened`.

Una consumidora podrá solicitar una acción o emitir un evento de su propio proceso derivado, pero no publicará la familia condicional del proceso ajeno.

#### 12. Emisión, replay y cambio de propietaria

1. un comando no autorizado, rechazado o fallido no produce un evento canónico de éxito;
2. el hecho y su registro publicable deberán persistirse atómicamente dentro del límite propietario;
3. replay y backfill conservan la productora histórica y marcan su condición;
4. un componente que ejecuta replay no se convierte en productora;
5. un alias legacy exige equivalencia de hecho, proceso, productora, momento, agregado y efecto;
6. un cambio de propietaria conserva `VPROC-*` y `event_definition_id`, pero versiona este registro;
7. la transición deberá inventariar consumidoras, compatibilidad, dual publishing temporal, reconciliación, rollback y retiro;
8. no se permite dual ownership indefinido.

#### 13. Decisiones reservadas

| Decisión                                              | Tarea propietaria |
| ----------------------------------------------------- | ----------------- |
| consumidoras, finalidad y proyección por evento       | `INT-APP-003`     |
| clave y alcance de idempotencia                       | `INT-APP-004`     |
| política de reintentos                                | `INT-APP-005`     |
| compensaciones                                        | `INT-APP-006`     |
| auditoría de publicación y consumo                    | `INT-APP-007`     |
| estados pendientes de sincronización                  | `INT-APP-008`     |
| errores parciales y dead-letter                       | `INT-APP-009`     |
| prohibiciones y comandos de escritura cruzada         | `INT-APP-010`     |
| tablas, outbox, funciones, RLS y migraciones          | BLOQUES E3 y R    |
| topics, colas, workers, adaptadores y observabilidad  | BLOQUE E4         |
| contratos y SDK compartidos                           | BLOQUE H          |
| implementación, piloto, cutover, rollback e hypercare | BLOQUE E5         |

#### 14. Cambios no autorizados

`INT-APP-002` no autoriza:

- crear tablas, schemas, outbox, triggers, funciones, RPC, RLS o migraciones;
- crear topics, colas, subscriptions, workers, webhooks o endpoints;
- publicar eventos reales;
- asignar consumidoras;
- definir reintentos, idempotencia física, compensaciones o dead-letter;
- activar AURA;
- solicitar credenciales;
- modificar permisos o autorización;
- ejecutar replay, backfill, piloto, cutover o producción;
- cambiar la propiedad aprobada en `PROC-CAT-005`.

#### 15. Requisitos de prueba derivados

```text
TREQ-INTEGRATION-054 a TREQ-INTEGRATION-079
```

El detalle completo reside exclusivamente en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA_INT-APP-002.md`.

#### 16. Huellas de integridad

```text
EVENT_PRODUCER_MAPPING_SHA256 = ada488755edde0690821ef610cdfe17d2cf5a4394a1ac65809112bcf437fdd5c
EVENT_PRODUCER_DISTRIBUTION_SHA256 = 3fc8ca05ddc5169d413bce4138a1279f8781b05da3079c80a9b204c4f3e45871
CONDITIONAL_PRODUCER_RULE_SHA256 = 30211dc5c304292ffed10dd9b60ffee22a0237aa542f99eee672a06652444deb
OWNERSHIP_SOURCE_BLOB_SHA1 = f716207c571ab33e1d22584c249d874c65a50501
EVENT_CATALOG_SOURCE_BLOB_SHA1 = 683c2540d88a7c665c8fd05cd6beb0fd74645b4d
REMOTE_04A_SOURCE_BLOB_SHA1 = d80caae04a4e7284b355dc47c8a8d270010f43fb
```

#### 17. Criterios de aceptación

- [x] `INT-APP-001` figura aprobada en el remoto.
- [x] Se congelaron commit y blobs consumidos.
- [x] Los 69 procesos conservan exactamente una propietaria.
- [x] Las 395 definiciones normales tienen exactamente una emisora.
- [x] La emisora se deriva de `PROC-CAT-005` sin reinterpretación.
- [x] La distribución 116/92/68/42/33/22/11/5/6 quedó reconciliada.
- [x] SHELL conserva cero eventos empresariales.
- [x] Ningún tercero figura como emisora interna.
- [x] Se separaron productora empresarial, publicador técnico, adaptador y consumidora.
- [x] Las ocho familias condicionales heredan la productora del proceso.
- [x] AURA permanece diferida y sin publicador activo.
- [x] No se autorizó implementación ni efecto operativo.
- [x] Se generaron 26 requisitos completos.

#### 18. Validaciones documentales realizadas

| Control                                      | Resultado                                             |
| -------------------------------------------- | ----------------------------------------------------- |
| Commit remoto leído                          | `9f0b1ac928a946c1148432acc5885ea0dd766719`            |
| Blob del mini-bloque X                       | `09b28fca5c0d8f667abd18db0636f03f5bf1ef98`            |
| Blob de propiedad de procesos                | `f716207c571ab33e1d22584c249d874c65a50501`            |
| Blob de eventos de procesos                  | `683c2540d88a7c665c8fd05cd6beb0fd74645b4d`            |
| Blob 04A remoto base                         | `d80caae04a4e7284b355dc47c8a8d270010f43fb`            |
| Procesos cubiertos                           | **69**                                                |
| Eventos normales cubiertos                   | **395**                                               |
| Aplicaciones con eventos                     | **9**                                                 |
| Aplicaciones diferidas con eventos           | **1 — AURA**                                          |
| Eventos de SHELL                             | **0**                                                 |
| Emisoras externas                            | **0**                                                 |
| Requisitos base                              | **4.044**                                             |
| Requisitos nuevos                            | **26**                                                |
| Total regenerado                             | **4.070**                                             |
| Dominio INTEGRATION                          | **79 — TREQ-INTEGRATION-001 a TREQ-INTEGRATION-079**  |
| Filas con catorce columnas                   | **4.070 de 4.070**                                    |
| Identificadores duplicados                   | **0**                                                 |
| Relaciones TREQ no resolubles                | **0**                                                 |
| Identificadores históricos preservados       | **4.044**                                             |
| Valores históricos modificados               | **0**                                                 |
| Alineación Markdown normalizada              | **sí, en la tabla creciente del dominio INTEGRATION** |
| Código, Supabase o integraciones modificados | **no**                                                |

#### 19. Instrucción de reemplazo

1. Reemplazar exactamente `### [ ] INT-APP-002 — Definir aplicación emisora de cada evento` por este documento completo.
2. Reemplazar completamente `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` por el archivo regenerado entregado con esta tarea.
3. No copiar, fusionar ni insertar filas `TREQ-*` manualmente.

#### 20. Continuidad aprobada

```text
ÚLTIMA TAREA APROBADA
INT-APP-002 — Definir aplicación emisora de cada evento
        ↓
TAREA ACTUAL
INT-APP-003 — Definir aplicaciones consumidoras
        ↓
SIGUIENTE TAREA RESERVADA
INT-APP-004 — Definir idempotencia
```

APROBADA


### ✅ INT-APP-003 — Definir aplicaciones consumidoras

**Estado:** APROBADA
**Fecha de aprobación documental:** 2026-07-29
**Bloque propietario:** BLOQUE X — Integraciones empresariales internas y externas
**Marcador exacto que reemplaza:** `### [ ] INT-APP-003 — Definir aplicaciones consumidoras`
**Tarea anterior:** `INT-APP-002 — Definir aplicación emisora de cada evento` — APROBADA
**Siguiente tarea:** `INT-APP-004 — Definir idempotencia`
**Línea base remota obligatoria:** `devVentoGroup/vento-shell@26038ab9a60f95ac4c299473086d151c6f6e069f`
**Tipo de tarea:** definición documental de audiencia, finalidad y proyección mínima de eventos; sin implementación, transporte, credenciales, Supabase, suscripciones reales, replay, piloto ni despliegue

#### 1. Objetivo

Definir las aplicaciones consumidoras de las **395 definiciones normales** de `ENTERPRISE-EVENT-CATALOG-001`, preservando la emisora única de `INT-APP-002` y las relaciones directas y condicionales aprobadas en `PROC-CAT-006`.

```text
EVENT_DEFINITION_ID
        +
PROCESS_ID
        ↓
PROC-APPLICATION-CONSUMER-REGISTRY-001
        ↓
CONSUMIDORAS DIRECTAS + CONSUMIDORAS CONDICIONALES
        ↓
FINALIDAD + PERFIL DE PROYECCIÓN + FILTRO DE SENSIBILIDAD
```

Esta tarea convierte el registro de consumo por proceso en un registro transversal por evento mediante **herencia explícita por rango**. No crea una audiencia abierta ni presupone que una relación documental ya esté implementada.

#### 2. Fuentes de verdad congeladas

| Fuente                                                    | Revisión o blob                                         | Responsabilidad                                        |
| --------------------------------------------------------- | ------------------------------------------------------- | ------------------------------------------------------ |
| `vento-shell`                                             | `26038ab9a60f95ac4c299473086d151c6f6e069f`              | revisión remota con `INT-APP-002` y 04A integrados     |
| `X_INTEGRACIONES/01_EVENTOS_ENTRE_APLICACIONES.md`        | `999db2d534128cab6e784d35db4df9b857411f25`              | secuencia y contratos de `INT-APP-001` a `INT-APP-010` |
| `PROC-CAT-006` / `PROC-APPLICATION-CONSUMER-REGISTRY-001` | `f716207c571ab33e1d22584c249d874c65a50501`              | 278 relaciones directas y 77 condicionales por proceso |
| `PROC-CAT-017` / `ENTERPRISE-EVENT-CATALOG-001`           | `683c2540d88a7c665c8fd05cd6beb0fd74645b4d`              | 395 definiciones materiales y sensibilidad             |
| `INT-APP-002` / `ENTERPRISE-EVENT-PRODUCER-REGISTRY-001`  | integrado en `999db2d534128cab6e784d35db4df9b857411f25` | emisora única por definición                           |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`        | `7fd69ad3356b4cd999891fa9e2c3436c363103b7`              | línea base remota de 4.070 requisitos                  |

#### 3. Artefacto producido

```text
ENTERPRISE-EVENT-CONSUMER-REGISTRY-001@1.0.0
```

| Propiedad                       | Valor                                    | Regla                                                     |
| ------------------------------- | ---------------------------------------- | --------------------------------------------------------- |
| `registry_id`                   | `ENTERPRISE-EVENT-CONSUMER-REGISTRY-001` | identidad estable del registro                            |
| `registry_version`              | `1.0.0`                                  | primera asignación transversal                            |
| `registry_status`               | `DEFINED`                                | contrato documental; no prueba implementación             |
| `covered_processes`             | **69**                                   | `VPROC-0001` a `VPROC-0069`                               |
| `normal_event_definitions`      | **395**                                  | todas las definiciones de `INT-APP-001`                   |
| `process_direct_relations`      | **278**                                  | relaciones directas de `PROC-CAT-006`                     |
| `process_conditional_relations` | **77**                                   | relaciones condicionales de `PROC-CAT-006`                |
| `event_direct_relations`        | **1.576**                                | relaciones normalizadas evento-consumidora directa        |
| `event_conditional_relations`   | **444**                                  | relaciones normalizadas evento-consumidora condicional    |
| `event_consumer_relations`      | **2.020**                                | total de asignaciones, no entregas de runtime             |
| `events_without_consumer`       | **0**                                    | todas las definiciones tienen audiencia potencial cerrada |
| `deferred_relations`            | **197**                                  | 153 por AURA consumidora y 44 por AURA productora         |

#### 4. Regla normativa de herencia

Para cada definición normal:

```text
direct_consumers(event_definition_id)
=
direct_consumers(process_id)

conditional_consumers(event_definition_id)
=
conditional_consumers(process_id)
```

La relación directa se aplica a toda ejecución del proceso que resulte pertinente para esa aplicación. La relación condicional solo se activa cuando una variante, canal, sede, tipo de recurso, efecto o decisión explícita involucra a la consumidora.

Reglas:

1. la emisora de `INT-APP-002` queda excluida de ambas listas;
2. una aplicación no declarada en `PROC-CAT-006` no puede convertirse en consumidora desde BLOQUE X;
3. las listas directas y condicionales son disjuntas y sin duplicados;
4. una condición ausente, desconocida o ambigua falla cerrada;
5. el registro define audiencia máxima y proyección mínima, no permisos ni suscripciones desplegadas;
6. una consumidora no puede republicar el mismo evento cambiando la emisora;
7. cualquier efecto derivado pertenece al dominio de la consumidora y conserva correlación.

#### 5. Semántica de relación

| Tipo                | Regla de entrega                                                                                   | Estado documental        |
| ------------------- | -------------------------------------------------------------------------------------------------- | ------------------------ |
| `DIRECT`            | recibe el contrato mínimo de cada evento material cuando la ejecución del proceso sea aplicable    | `DEFINED`                |
| `CONDITIONAL`       | recibe únicamente si la condición empresarial declarada se cumple                                  | `DEFINED_WITH_CONDITION` |
| `DEFERRED_CONSUMER` | relación cuya consumidora es `aura`; no existe suscripción activa                                  | `DEFINED_DEFERRED`       |
| `DEFERRED_PRODUCER` | evento emitido por `aura`; ninguna relación está activa mientras la productora permanezca diferida | `DEFINED_DEFERRED`       |

La cantidad de relaciones no representa volumen, frecuencia, prioridad, ancho de banda ni cantidad de instancias. Una emisión real puede producir cero o más entregas según condiciones, autorización, finalidad y disponibilidad contractual.

#### 6. Finalidades canónicas por aplicación

| Aplicación | Finalidad canónica de consumo                |
| ---------- | -------------------------------------------- |
| `shell`    | `ECOSYSTEM_CONTEXT_ACCESS_CONTINUITY`        |
| `anima`    | `WORKER_SELF_SERVICE_CONFIRMATION`           |
| `viso`     | `ADMINISTRATION_PEOPLE_RISK_COMPLIANCE`      |
| `nexo`     | `INVENTORY_CUSTODY_ASSETS_LOGISTICS`         |
| `fogo`     | `RECIPE_PRODUCTION_QUALITY`                  |
| `origo`    | `PROCUREMENT_SUPPLIER_RECEIPT`               |
| `pulso`    | `OFFER_ORDER_SERVICE_PAYMENT_DELIVERY`       |
| `numera`   | `FINANCIAL_RECONCILIATION_COST_ANALYSIS`     |
| `aura`     | `MARKETING_CAMPAIGN_OPPORTUNITY_ATTRIBUTION` |
| `pass`     | `CUSTOMER_IDENTITY_LOYALTY_SELF_SERVICE`     |

La finalidad de una relación es la intersección entre esta responsabilidad, la modalidad del proceso y el hecho confirmado por el evento. El nombre de una pantalla, reporte, job o equipo no constituye finalidad.

#### 7. Perfiles mínimos de proyección

| Modalidad de `PROC-CAT-006`        | Perfil de evento                 | Contenido máximo funcional                                                            |
| ---------------------------------- | -------------------------------- | ------------------------------------------------------------------------------------- |
| `REFERENCIA_CANONICA`              | `REFERENCE_PROJECTION`           | identidad, versión, vigencia, estado de publicación o retiro y referencia propietaria |
| `REFERENCIA_Y_EVENTO`              | `VERSIONED_REFERENCE_PROJECTION` | referencia versionada, cambio material y resultado aplicable                          |
| `PROYECCION_Y_EVENTO`              | `LIFECYCLE_PROJECTION`           | hito, estado o hecho confirmado, referencia del resultado y alcance mínimo            |
| `SOLICITUD_HANDOFF_Y_EVENTO`       | `HANDOFF_PROJECTION`             | solicitud o traspaso correlacionado, responsabilidad, estado y resultado              |
| `HECHO_Y_PROYECCION`               | `IMMUTABLE_FACT_PROJECTION`      | hecho inmutable, actor o contexto mínimo, versión y corrección vinculada              |
| `SOLICITUD_EFECTO_Y_EVENTO`        | `EFFECT_CONFIRMATION_PROJECTION` | solicitud correlacionada, efecto confirmado, cantidad o resultado mínimo y pendientes |
| `SEÑAL_EFECTO_Y_EVENTO`            | `EXECUTION_SIGNAL_PROJECTION`    | señal aceptada, ejecución material, handoff y resultado correlacionado                |
| `EVENTO_CONCILIACION_Y_PROYECCION` | `RECONCILIATION_PROJECTION`      | referencia origen, clasificación, conciliación, diferencia y resultado económico      |
| `PROYECCION_EVENTO_Y_ANALISIS`     | `MARKETING_ANALYTICS_PROJECTION` | publicación o interacción, atribución permitida, agregado y limitaciones              |
| `PROYECCION_Y_ANALISIS`            | `ANALYTICS_PROJECTION`           | resultado consolidado, periodo, definición, calidad y limitaciones                    |

Todo perfil incluye solo los campos necesarios del `EVENT-ENVELOPE-001`. Documentos, fórmulas, datos personales completos, valores financieros detallados y secretos permanecen referenciados y protegidos.

#### 8. Contrato mínimo de relación evento-consumidora

| Campo                       | Regla                                                               |
| --------------------------- | ------------------------------------------------------------------- |
| `event_definition_id`       | definición `VPROC-####.EVT-###`                                     |
| `process_id`                | proceso propietario del evento                                      |
| `producer_application`      | emisora única de `INT-APP-002`                                      |
| `consumer_application`      | aplicación del catálogo permitido                                   |
| `consumer_relation`         | `DIRECT` o `CONDITIONAL`                                            |
| `condition_ref`             | obligatoria para relación condicional; regla empresarial versionada |
| `consumer_purpose_code`     | finalidad compatible con la aplicación, modalidad y evento          |
| `projection_profile`        | uno de los diez perfiles cerrados                                   |
| `sensitivity_class`         | clasificación heredada de `PROC-CAT-017`                            |
| `field_allowlist_ref`       | contrato versionado de campos mínimos                               |
| `authorization_requirement` | lectura o efecto deberá reautorizarse en la consumidora             |
| `delivery_status`           | `DEFINED`, `DEFINED_WITH_CONDITION` o `DEFINED_DEFERRED`            |
| `consumer_result_ref`       | efecto propio, ACK empresarial o estado pendiente correlacionado    |
| `origin_task`               | `INT-APP-003`                                                       |

#### 9. Registro explícito por proceso y rango de eventos

Cada fila aplica a todas las definiciones del rango. Así se materializan las **2.020 relaciones normalizadas** sin duplicar 395 veces las mismas listas aprobadas por proceso.

| Proceso      | Definiciones cubiertas                      | Eventos | Emisora  | Consumidoras directas                                                        | Consumidoras condicionales                                          | Modalidad                          | Perfil                           | Estado                      |
| ------------ | ------------------------------------------- | ------: | -------- | ---------------------------------------------------------------------------- | ------------------------------------------------------------------- | ---------------------------------- | -------------------------------- | --------------------------- |
| `VPROC-0001` | `VPROC-0001.EVT-001` a `VPROC-0001.EVT-005` |   **5** | `viso`   | —                                                                            | `anima`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `aura`, `pass` | `PROYECCION_Y_EVENTO`              | `LIFECYCLE_PROJECTION`           | `DEFINED_WITH_CONDITIONS`   |
| `VPROC-0002` | `VPROC-0002.EVT-001` a `VPROC-0002.EVT-006` |   **6** | `viso`   | `shell`, `anima`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `aura`, `pass` | —                                                                   | `REFERENCIA_CANONICA`              | `REFERENCE_PROJECTION`           | `DEFINED`                   |
| `VPROC-0003` | `VPROC-0003.EVT-001` a `VPROC-0003.EVT-004` |   **4** | `viso`   | `shell`, `anima`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `aura`, `pass` | —                                                                   | `REFERENCIA_CANONICA`              | `REFERENCE_PROJECTION`           | `DEFINED`                   |
| `VPROC-0004` | `VPROC-0004.EVT-001` a `VPROC-0004.EVT-006` |   **6** | `viso`   | —                                                                            | `anima`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `aura`, `pass` | `PROYECCION_Y_EVENTO`              | `LIFECYCLE_PROJECTION`           | `DEFINED_WITH_CONDITIONS`   |
| `VPROC-0005` | `VPROC-0005.EVT-001` a `VPROC-0005.EVT-006` |   **6** | `viso`   | —                                                                            | `anima`, `numera`                                                   | `SOLICITUD_HANDOFF_Y_EVENTO`       | `HANDOFF_PROJECTION`             | `DEFINED_WITH_CONDITIONS`   |
| `VPROC-0006` | `VPROC-0006.EVT-001` a `VPROC-0006.EVT-006` |   **6** | `viso`   | `anima`, `shell`                                                             | `nexo`, `fogo`, `origo`, `pulso`, `numera`, `aura`                  | `SOLICITUD_HANDOFF_Y_EVENTO`       | `HANDOFF_PROJECTION`             | `DEFINED_WITH_CONDITIONS`   |
| `VPROC-0007` | `VPROC-0007.EVT-001` a `VPROC-0007.EVT-006` |   **6** | `viso`   | `anima`, `shell`                                                             | `nexo`, `fogo`, `origo`, `pulso`, `numera`                          | `SOLICITUD_HANDOFF_Y_EVENTO`       | `HANDOFF_PROJECTION`             | `DEFINED_WITH_CONDITIONS`   |
| `VPROC-0008` | `VPROC-0008.EVT-001` a `VPROC-0008.EVT-005` |   **5** | `anima`  | `viso`, `numera`, `shell`                                                    | `nexo`, `fogo`, `origo`, `pulso`                                    | `HECHO_Y_PROYECCION`               | `IMMUTABLE_FACT_PROJECTION`      | `DEFINED_WITH_CONDITIONS`   |
| `VPROC-0009` | `VPROC-0009.EVT-001` a `VPROC-0009.EVT-006` |   **6** | `viso`   | `anima`, `shell`                                                             | `nexo`, `fogo`, `origo`, `pulso`, `numera`                          | `SOLICITUD_HANDOFF_Y_EVENTO`       | `HANDOFF_PROJECTION`             | `DEFINED_WITH_CONDITIONS`   |
| `VPROC-0010` | `VPROC-0010.EVT-001` a `VPROC-0010.EVT-006` |   **6** | `numera` | `viso`, `anima`                                                              | —                                                                   | `HECHO_Y_PROYECCION`               | `IMMUTABLE_FACT_PROJECTION`      | `DEFINED`                   |
| `VPROC-0011` | `VPROC-0011.EVT-001` a `VPROC-0011.EVT-006` |   **6** | `viso`   | `shell`, `anima`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `aura`         | —                                                                   | `SOLICITUD_HANDOFF_Y_EVENTO`       | `HANDOFF_PROJECTION`             | `DEFINED`                   |
| `VPROC-0012` | `VPROC-0012.EVT-001` a `VPROC-0012.EVT-006` |   **6** | `viso`   | `anima`, `nexo`, `fogo`, `origo`, `pulso`                                    | `numera`                                                            | `PROYECCION_Y_EVENTO`              | `LIFECYCLE_PROJECTION`           | `DEFINED_WITH_CONDITIONS`   |
| `VPROC-0013` | `VPROC-0013.EVT-001` a `VPROC-0013.EVT-006` |   **6** | `viso`   | `anima`, `nexo`, `fogo`, `origo`, `pulso`                                    | `numera`                                                            | `PROYECCION_Y_EVENTO`              | `LIFECYCLE_PROJECTION`           | `DEFINED_WITH_CONDITIONS`   |
| `VPROC-0014` | `VPROC-0014.EVT-001` a `VPROC-0014.EVT-006` |   **6** | `viso`   | `nexo`, `fogo`, `origo`, `pulso`, `anima`                                    | —                                                                   | `PROYECCION_Y_EVENTO`              | `LIFECYCLE_PROJECTION`           | `DEFINED`                   |
| `VPROC-0015` | `VPROC-0015.EVT-001` a `VPROC-0015.EVT-004` |   **4** | `nexo`   | `fogo`, `origo`, `pulso`, `numera`, `pass`, `aura`, `viso`                   | —                                                                   | `REFERENCIA_CANONICA`              | `REFERENCE_PROJECTION`           | `DEFINED`                   |
| `VPROC-0016` | `VPROC-0016.EVT-001` a `VPROC-0016.EVT-005` |   **5** | `fogo`   | `nexo`, `pulso`, `numera`                                                    | `origo`                                                             | `REFERENCIA_Y_EVENTO`              | `VERSIONED_REFERENCE_PROJECTION` | `DEFINED_WITH_CONDITIONS`   |
| `VPROC-0017` | `VPROC-0017.EVT-001` a `VPROC-0017.EVT-004` |   **4** | `pulso`  | `pass`, `aura`, `nexo`, `fogo`, `numera`                                     | —                                                                   | `REFERENCIA_Y_EVENTO`              | `VERSIONED_REFERENCE_PROJECTION` | `DEFINED`                   |
| `VPROC-0018` | `VPROC-0018.EVT-001` a `VPROC-0018.EVT-005` |   **5** | `nexo`   | `fogo`, `origo`, `pulso`, `pass`, `aura`, `viso`                             | —                                                                   | `REFERENCIA_CANONICA`              | `REFERENCE_PROJECTION`           | `DEFINED`                   |
| `VPROC-0019` | `VPROC-0019.EVT-001` a `VPROC-0019.EVT-005` |   **5** | `origo`  | `numera`                                                                     | `nexo`, `fogo`, `pulso`                                             | `SOLICITUD_EFECTO_Y_EVENTO`        | `EFFECT_CONFIRMATION_PROJECTION` | `DEFINED_WITH_CONDITIONS`   |
| `VPROC-0020` | `VPROC-0020.EVT-001` a `VPROC-0020.EVT-005` |   **5** | `origo`  | `numera`, `viso`                                                             | `nexo`, `fogo`                                                      | `SOLICITUD_EFECTO_Y_EVENTO`        | `EFFECT_CONFIRMATION_PROJECTION` | `DEFINED_WITH_CONDITIONS`   |
| `VPROC-0021` | `VPROC-0021.EVT-001` a `VPROC-0021.EVT-006` |   **6** | `origo`  | `nexo`, `numera`                                                             | `fogo`                                                              | `SOLICITUD_EFECTO_Y_EVENTO`        | `EFFECT_CONFIRMATION_PROJECTION` | `DEFINED_WITH_CONDITIONS`   |
| `VPROC-0022` | `VPROC-0022.EVT-001` a `VPROC-0022.EVT-006` |   **6** | `origo`  | `nexo`, `numera`                                                             | `fogo`, `pulso`                                                     | `SOLICITUD_EFECTO_Y_EVENTO`        | `EFFECT_CONFIRMATION_PROJECTION` | `DEFINED_WITH_CONDITIONS`   |
| `VPROC-0023` | `VPROC-0023.EVT-001` a `VPROC-0023.EVT-006` |   **6** | `nexo`   | `fogo`, `origo`, `pulso`, `viso`                                             | —                                                                   | `REFERENCIA_CANONICA`              | `REFERENCE_PROJECTION`           | `DEFINED`                   |
| `VPROC-0024` | `VPROC-0024.EVT-001` a `VPROC-0024.EVT-006` |   **6** | `nexo`   | `origo`, `fogo`, `pulso`, `numera`                                           | —                                                                   | `SOLICITUD_EFECTO_Y_EVENTO`        | `EFFECT_CONFIRMATION_PROJECTION` | `DEFINED`                   |
| `VPROC-0025` | `VPROC-0025.EVT-001` a `VPROC-0025.EVT-006` |   **6** | `nexo`   | `fogo`, `pulso`, `origo`, `numera`                                           | —                                                                   | `SOLICITUD_EFECTO_Y_EVENTO`        | `EFFECT_CONFIRMATION_PROJECTION` | `DEFINED`                   |
| `VPROC-0026` | `VPROC-0026.EVT-001` a `VPROC-0026.EVT-006` |   **6** | `nexo`   | `numera`, `viso`                                                             | `fogo`, `pulso`, `origo`                                            | `SOLICITUD_EFECTO_Y_EVENTO`        | `EFFECT_CONFIRMATION_PROJECTION` | `DEFINED_WITH_CONDITIONS`   |
| `VPROC-0027` | `VPROC-0027.EVT-001` a `VPROC-0027.EVT-006` |   **6** | `nexo`   | `fogo`, `pulso`, `origo`, `viso`, `numera`                                   | —                                                                   | `SOLICITUD_EFECTO_Y_EVENTO`        | `EFFECT_CONFIRMATION_PROJECTION` | `DEFINED`                   |
| `VPROC-0028` | `VPROC-0028.EVT-001` a `VPROC-0028.EVT-006` |   **6** | `nexo`   | `fogo`, `origo`, `pulso`, `numera`                                           | —                                                                   | `SOLICITUD_EFECTO_Y_EVENTO`        | `EFFECT_CONFIRMATION_PROJECTION` | `DEFINED`                   |
| `VPROC-0029` | `VPROC-0029.EVT-001` a `VPROC-0029.EVT-006` |   **6** | `nexo`   | `viso`, `numera`, `anima`, `origo`                                           | —                                                                   | `SOLICITUD_EFECTO_Y_EVENTO`        | `EFFECT_CONFIRMATION_PROJECTION` | `DEFINED`                   |
| `VPROC-0030` | `VPROC-0030.EVT-001` a `VPROC-0030.EVT-006` |   **6** | `nexo`   | `origo`, `numera`, `viso`                                                    | `anima`                                                             | `SOLICITUD_EFECTO_Y_EVENTO`        | `EFFECT_CONFIRMATION_PROJECTION` | `DEFINED_WITH_CONDITIONS`   |
| `VPROC-0031` | `VPROC-0031.EVT-001` a `VPROC-0031.EVT-006` |   **6** | `nexo`   | `viso`, `numera`, `anima`, `origo`                                           | —                                                                   | `SOLICITUD_EFECTO_Y_EVENTO`        | `EFFECT_CONFIRMATION_PROJECTION` | `DEFINED`                   |
| `VPROC-0032` | `VPROC-0032.EVT-001` a `VPROC-0032.EVT-006` |   **6** | `nexo`   | `fogo`, `pulso`, `numera`                                                    | —                                                                   | `SOLICITUD_EFECTO_Y_EVENTO`        | `EFFECT_CONFIRMATION_PROJECTION` | `DEFINED`                   |
| `VPROC-0033` | `VPROC-0033.EVT-001` a `VPROC-0033.EVT-004` |   **4** | `fogo`   | `nexo`, `origo`, `pulso`, `numera`, `viso`                                   | —                                                                   | `SEÑAL_EFECTO_Y_EVENTO`            | `EXECUTION_SIGNAL_PROJECTION`    | `DEFINED`                   |
| `VPROC-0034` | `VPROC-0034.EVT-001` a `VPROC-0034.EVT-006` |   **6** | `fogo`   | `nexo`, `numera`, `pulso`                                                    | —                                                                   | `SEÑAL_EFECTO_Y_EVENTO`            | `EXECUTION_SIGNAL_PROJECTION`    | `DEFINED`                   |
| `VPROC-0035` | `VPROC-0035.EVT-001` a `VPROC-0035.EVT-006` |   **6** | `fogo`   | `nexo`, `pulso`, `viso`                                                      | `numera`                                                            | `SEÑAL_EFECTO_Y_EVENTO`            | `EXECUTION_SIGNAL_PROJECTION`    | `DEFINED_WITH_CONDITIONS`   |
| `VPROC-0036` | `VPROC-0036.EVT-001` a `VPROC-0036.EVT-006` |   **6** | `fogo`   | `nexo`, `pulso`, `numera`                                                    | —                                                                   | `SEÑAL_EFECTO_Y_EVENTO`            | `EXECUTION_SIGNAL_PROJECTION`    | `DEFINED`                   |
| `VPROC-0037` | `VPROC-0037.EVT-001` a `VPROC-0037.EVT-006` |   **6** | `fogo`   | `nexo`, `numera`, `viso`                                                     | —                                                                   | `SEÑAL_EFECTO_Y_EVENTO`            | `EXECUTION_SIGNAL_PROJECTION`    | `DEFINED`                   |
| `VPROC-0038` | `VPROC-0038.EVT-001` a `VPROC-0038.EVT-005` |   **5** | `pulso`  | `fogo`, `nexo`, `numera`, `pass`                                             | —                                                                   | `SOLICITUD_EFECTO_Y_EVENTO`        | `EFFECT_CONFIRMATION_PROJECTION` | `DEFINED`                   |
| `VPROC-0039` | `VPROC-0039.EVT-001` a `VPROC-0039.EVT-005` |   **5** | `pulso`  | `fogo`, `nexo`, `numera`, `pass`                                             | —                                                                   | `SOLICITUD_EFECTO_Y_EVENTO`        | `EFFECT_CONFIRMATION_PROJECTION` | `DEFINED`                   |
| `VPROC-0040` | `VPROC-0040.EVT-001` a `VPROC-0040.EVT-006` |   **6** | `pulso`  | `fogo`, `nexo`, `numera`                                                     | `pass`, `aura`                                                      | `SOLICITUD_EFECTO_Y_EVENTO`        | `EFFECT_CONFIRMATION_PROJECTION` | `DEFINED_WITH_CONDITIONS`   |
| `VPROC-0041` | `VPROC-0041.EVT-001` a `VPROC-0041.EVT-006` |   **6** | `pulso`  | `aura`, `fogo`, `nexo`, `origo`, `numera`                                    | —                                                                   | `SOLICITUD_EFECTO_Y_EVENTO`        | `EFFECT_CONFIRMATION_PROJECTION` | `DEFINED`                   |
| `VPROC-0042` | `VPROC-0042.EVT-001` a `VPROC-0042.EVT-006` |   **6** | `pulso`  | `fogo`, `nexo`, `numera`, `pass`                                             | —                                                                   | `SOLICITUD_EFECTO_Y_EVENTO`        | `EFFECT_CONFIRMATION_PROJECTION` | `DEFINED`                   |
| `VPROC-0043` | `VPROC-0043.EVT-001` a `VPROC-0043.EVT-006` |   **6** | `pulso`  | `numera`, `pass`                                                             | —                                                                   | `SOLICITUD_EFECTO_Y_EVENTO`        | `EFFECT_CONFIRMATION_PROJECTION` | `DEFINED`                   |
| `VPROC-0044` | `VPROC-0044.EVT-001` a `VPROC-0044.EVT-006` |   **6** | `pulso`  | `numera`, `viso`                                                             | —                                                                   | `SOLICITUD_EFECTO_Y_EVENTO`        | `EFFECT_CONFIRMATION_PROJECTION` | `DEFINED`                   |
| `VPROC-0045` | `VPROC-0045.EVT-001` a `VPROC-0045.EVT-006` |   **6** | `pass`   | `pulso`, `aura`, `viso`, `numera`                                            | —                                                                   | `SOLICITUD_EFECTO_Y_EVENTO`        | `EFFECT_CONFIRMATION_PROJECTION` | `DEFINED`                   |
| `VPROC-0046` | `VPROC-0046.EVT-001` a `VPROC-0046.EVT-006` |   **6** | `pulso`  | `pass`, `numera`, `viso`, `aura`                                             | —                                                                   | `SOLICITUD_EFECTO_Y_EVENTO`        | `EFFECT_CONFIRMATION_PROJECTION` | `DEFINED`                   |
| `VPROC-0047` | `VPROC-0047.EVT-001` a `VPROC-0047.EVT-006` |   **6** | `pulso`  | `pass`, `aura`                                                               | `fogo`, `nexo`                                                      | `SOLICITUD_EFECTO_Y_EVENTO`        | `EFFECT_CONFIRMATION_PROJECTION` | `DEFINED_WITH_CONDITIONS`   |
| `VPROC-0048` | `VPROC-0048.EVT-001` a `VPROC-0048.EVT-005` |   **5** | `nexo`   | `pulso`, `fogo`, `origo`, `viso`, `numera`                                   | —                                                                   | `SOLICITUD_EFECTO_Y_EVENTO`        | `EFFECT_CONFIRMATION_PROJECTION` | `DEFINED`                   |
| `VPROC-0049` | `VPROC-0049.EVT-001` a `VPROC-0049.EVT-006` |   **6** | `nexo`   | `pulso`, `fogo`, `origo`, `numera`, `viso`                                   | —                                                                   | `SOLICITUD_EFECTO_Y_EVENTO`        | `EFFECT_CONFIRMATION_PROJECTION` | `DEFINED`                   |
| `VPROC-0050` | `VPROC-0050.EVT-001` a `VPROC-0050.EVT-006` |   **6** | `pulso`  | `pass`, `numera`, `nexo`                                                     | `aura`                                                              | `SOLICITUD_EFECTO_Y_EVENTO`        | `EFFECT_CONFIRMATION_PROJECTION` | `DEFINED_WITH_CONDITIONS`   |
| `VPROC-0051` | `VPROC-0051.EVT-001` a `VPROC-0051.EVT-006` |   **6** | `numera` | `viso`, `nexo`, `fogo`, `origo`, `pulso`                                     | `anima`, `aura`, `pass`                                             | `EVENTO_CONCILIACION_Y_PROYECCION` | `RECONCILIATION_PROJECTION`      | `DEFINED_WITH_CONDITIONS`   |
| `VPROC-0052` | `VPROC-0052.EVT-001` a `VPROC-0052.EVT-006` |   **6** | `numera` | `origo`                                                                      | `viso`                                                              | `EVENTO_CONCILIACION_Y_PROYECCION` | `RECONCILIATION_PROJECTION`      | `DEFINED_WITH_CONDITIONS`   |
| `VPROC-0053` | `VPROC-0053.EVT-001` a `VPROC-0053.EVT-006` |   **6** | `numera` | `pulso`                                                                      | `viso`, `aura`                                                      | `EVENTO_CONCILIACION_Y_PROYECCION` | `RECONCILIATION_PROJECTION`      | `DEFINED_WITH_CONDITIONS`   |
| `VPROC-0054` | `VPROC-0054.EVT-001` a `VPROC-0054.EVT-006` |   **6** | `numera` | `viso`, `nexo`, `fogo`, `origo`, `pulso`, `aura`                             | —                                                                   | `EVENTO_CONCILIACION_Y_PROYECCION` | `RECONCILIATION_PROJECTION`      | `DEFINED`                   |
| `VPROC-0055` | `VPROC-0055.EVT-001` a `VPROC-0055.EVT-006` |   **6** | `nexo`   | `viso`, `anima`, `fogo`, `origo`, `pulso`, `numera`                          | —                                                                   | `SOLICITUD_EFECTO_Y_EVENTO`        | `EFFECT_CONFIRMATION_PROJECTION` | `DEFINED`                   |
| `VPROC-0056` | `VPROC-0056.EVT-001` a `VPROC-0056.EVT-005` |   **5** | `aura`   | `pulso`, `pass`, `viso`, `numera`                                            | —                                                                   | `PROYECCION_EVENTO_Y_ANALISIS`     | `MARKETING_ANALYTICS_PROJECTION` | `DEFINED_DEFERRED_PRODUCER` |
| `VPROC-0057` | `VPROC-0057.EVT-001` a `VPROC-0057.EVT-006` |   **6** | `aura`   | `pulso`, `pass`, `viso`, `numera`                                            | —                                                                   | `PROYECCION_EVENTO_Y_ANALISIS`     | `MARKETING_ANALYTICS_PROJECTION` | `DEFINED_DEFERRED_PRODUCER` |
| `VPROC-0058` | `VPROC-0058.EVT-001` a `VPROC-0058.EVT-006` |   **6** | `viso`   | `anima`, `shell`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `aura`, `pass` | —                                                                   | `PROYECCION_Y_EVENTO`              | `LIFECYCLE_PROJECTION`           | `DEFINED`                   |
| `VPROC-0059` | `VPROC-0059.EVT-001` a `VPROC-0059.EVT-006` |   **6** | `viso`   | `shell`, `anima`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `aura`, `pass` | —                                                                   | `SOLICITUD_HANDOFF_Y_EVENTO`       | `HANDOFF_PROJECTION`             | `DEFINED`                   |
| `VPROC-0060` | `VPROC-0060.EVT-001` a `VPROC-0060.EVT-005` |   **5** | `viso`   | `anima`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `aura`, `pass`          | —                                                                   | `PROYECCION_Y_EVENTO`              | `LIFECYCLE_PROJECTION`           | `DEFINED`                   |
| `VPROC-0061` | `VPROC-0061.EVT-001` a `VPROC-0061.EVT-006` |   **6** | `numera` | `viso`, `nexo`, `fogo`, `origo`, `pulso`, `aura`, `pass`, `anima`            | —                                                                   | `PROYECCION_Y_ANALISIS`            | `ANALYTICS_PROJECTION`           | `DEFINED`                   |
| `VPROC-0062` | `VPROC-0062.EVT-001` a `VPROC-0062.EVT-006` |   **6** | `viso`   | `shell`, `anima`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `aura`, `pass` | —                                                                   | `PROYECCION_Y_EVENTO`              | `LIFECYCLE_PROJECTION`           | `DEFINED`                   |
| `VPROC-0063` | `VPROC-0063.EVT-001` a `VPROC-0063.EVT-006` |   **6** | `viso`   | `numera`, `nexo`, `fogo`, `origo`, `pulso`, `aura`, `pass`, `anima`          | —                                                                   | `PROYECCION_Y_EVENTO`              | `LIFECYCLE_PROJECTION`           | `DEFINED`                   |
| `VPROC-0064` | `VPROC-0064.EVT-001` a `VPROC-0064.EVT-006` |   **6** | `viso`   | —                                                                            | `numera`, `nexo`, `fogo`, `origo`, `pulso`, `aura`, `pass`, `anima` | `PROYECCION_Y_EVENTO`              | `LIFECYCLE_PROJECTION`           | `DEFINED_WITH_CONDITIONS`   |
| `VPROC-0065` | `VPROC-0065.EVT-001` a `VPROC-0065.EVT-006` |   **6** | `viso`   | `anima`, `numera`                                                            | —                                                                   | `SOLICITUD_HANDOFF_Y_EVENTO`       | `HANDOFF_PROJECTION`             | `DEFINED`                   |
| `VPROC-0066` | `VPROC-0066.EVT-001` a `VPROC-0066.EVT-006` |   **6** | `viso`   | `anima`, `nexo`                                                              | `fogo`, `origo`, `pulso`, `shell`                                   | `SOLICITUD_HANDOFF_Y_EVENTO`       | `HANDOFF_PROJECTION`             | `DEFINED_WITH_CONDITIONS`   |
| `VPROC-0067` | `VPROC-0067.EVT-001` a `VPROC-0067.EVT-006` |   **6** | `nexo`   | `fogo`, `pulso`, `origo`, `numera`, `viso`                                   | —                                                                   | `SOLICITUD_EFECTO_Y_EVENTO`        | `EFFECT_CONFIRMATION_PROJECTION` | `DEFINED`                   |
| `VPROC-0068` | `VPROC-0068.EVT-001` a `VPROC-0068.EVT-006` |   **6** | `pulso`  | `pass`, `aura`, `viso`, `numera`                                             | —                                                                   | `PROYECCION_EVENTO_Y_ANALISIS`     | `MARKETING_ANALYTICS_PROJECTION` | `DEFINED`                   |
| `VPROC-0069` | `VPROC-0069.EVT-001` a `VPROC-0069.EVT-006` |   **6** | `numera` | `viso`, `nexo`, `fogo`, `origo`, `pulso`, `aura`                             | —                                                                   | `PROYECCION_Y_ANALISIS`            | `ANALYTICS_PROJECTION`           | `DEFINED`                   |

#### 10. Distribución reconciliada por aplicación consumidora

| Consumidora | Procesos directos | Procesos condicionales | Relaciones de evento directas | Relaciones de evento condicionales |   Total | Finalidad                                    | Estado                      |
| ----------- | ----------------: | ---------------------: | ----------------------------: | ---------------------------------: | ------: | -------------------------------------------- | --------------------------- |
| `shell`     |                10 |                      1 |                            57 |                                  6 |  **63** | `ECOSYSTEM_CONTEXT_ACCESS_CONTINUITY`        | `DEFINED`                   |
| `anima`     |                21 |                      6 |                           123 |                                 35 | **158** | `WORKER_SELF_SERVICE_CONFIRMATION`           | `DEFINED`                   |
| `viso`      |                28 |                      2 |                           159 |                                 12 | **171** | `ADMINISTRATION_PEOPLE_RISK_COMPLIANCE`      | `DEFINED`                   |
| `nexo`      |                31 |                     10 |                           176 |                                 56 | **232** | `INVENTORY_CUSTODY_ASSETS_LOGISTICS`         | `DEFINED`                   |
| `fogo`      |                33 |                     14 |                           187 |                                 80 | **267** | `RECIPE_PRODUCTION_QUALITY`                  | `DEFINED`                   |
| `origo`     |                32 |                     10 |                           183 |                                 57 | **240** | `PROCUREMENT_SUPPLIER_RECEIPT`               | `DEFINED`                   |
| `pulso`     |                36 |                     11 |                           205 |                                 63 | **268** | `OFFER_ORDER_SERVICE_PAYMENT_DELIVERY`       | `DEFINED`                   |
| `numera`    |                47 |                     10 |                           265 |                                 59 | **324** | `FINANCIAL_RECONCILIATION_COST_ANALYSIS`     | `DEFINED`                   |
| `aura`      |                19 |                      8 |                           106 |                                 47 | **153** | `MARKETING_CAMPAIGN_OPPORTUNITY_ATTRIBUTION` | `DEFINED_DEFERRED_CONSUMER` |
| `pass`      |                21 |                      5 |                           115 |                                 29 | **144** | `CUSTOMER_IDENTITY_LOYALTY_SELF_SERVICE`     | `DEFINED`                   |

```text
PROCESOS CUBIERTOS                         69
DEFINICIONES CUBIERTAS                    395
RELACIONES DE PROCESO DIRECTAS            278
RELACIONES DE PROCESO CONDICIONALES        77
RELACIONES DE EVENTO DIRECTAS           1.576
RELACIONES DE EVENTO CONDICIONALES        444
RELACIONES DE EVENTO TOTALES            2.020
EVENTOS SIN AUDIENCIA POTENCIAL             0
RELACIONES AURA DIFERIDAS                  197
```

#### 11. Fronteras críticas

##### 11.1. ORIGO, NEXO y NUMERA

La aceptación comercial, el ingreso físico y la obligación económica permanecen hechos distintos. Consumir uno no permite inferir ni registrar los otros.

##### 11.2. FOGO, NEXO y PULSO

Producción terminada, disposición de calidad, movimiento de inventario y cumplimiento de pedido se correlacionan, pero no son estados equivalentes ni escrituras compartidas.

##### 11.3. PULSO, PASS, AURA y NUMERA

Venta, fidelización, mercadeo y efecto económico conservan finalidades, ledgers y proyecciones separadas. PULSO no mantiene saldo de PASS; AURA no gobierna pedidos; NUMERA no reconstruye ventas.

##### 11.4. VISO, ANIMA y SHELL

VISO gobierna los procesos laborales asignados, ANIMA consume la experiencia personal y emite asistencia, y SHELL solo consume estructura, acceso, contexto, soporte o continuidad donde figure declarado.

#### 12. Sistemas externos, servicios técnicos y notificaciones

No son `consumer_application` interna:

- Rappi, Shopify, ManyChat, bancos, proveedores de pago, mensajería, autoridades o asesores;
- Supabase, tablas, triggers, outbox, topics, colas, workers o paquetes compartidos;
- servicios de impresión, notificación, auditoría, documentos u observabilidad;
- sedes, áreas, roles, actores o dispositivos.

Los terceros consumen adaptaciones externas mediante contratos `INT-EXT-*`. Una notificación humana se deriva del evento y no se contabiliza como consumidora empresarial.

#### 13. Familias condicionales, replay y evolución

1. Las ocho familias condicionales heredan el conjunto máximo de consumidoras del proceso.
2. Su entrega exige que la aplicación necesite el efecto excepcional exacto.
3. Replay y backfill conservan la audiencia histórica o una migración explícita.
4. Una consumidora añadida posteriormente no recibe historia automáticamente.
5. Cambiar o retirar una consumidora exige versión, inventario de dependencias, compatibilidad, reconciliación, pruebas y rollback.
6. Un mapping legacy exige equivalencia de proceso, evento, finalidad, sensibilidad, condición, proyección y efecto.

#### 14. Decisiones reservadas

| Decisión                                               | Tarea propietaria |
| ------------------------------------------------------ | ----------------- |
| claves y alcance de idempotencia por entrega           | `INT-APP-004`     |
| reintentos y backoff por consumidora                   | `INT-APP-005`     |
| compensaciones por efecto irreversible                 | `INT-APP-006`     |
| auditoría de publicación, filtrado y consumo           | `INT-APP-007`     |
| estados pendientes de sincronización                   | `INT-APP-008`     |
| error parcial, rechazo y dead-letter                   | `INT-APP-009`     |
| comandos y prohibiciones de escritura cruzada          | `INT-APP-010`     |
| allowlists, esquemas, outbox, RLS y migraciones        | BLOQUES H, E3 y R |
| topics, colas, subscriptions, workers y observabilidad | BLOQUE E4         |
| implementación, piloto, cutover y rollback             | BLOQUE E5         |

#### 15. Cambios no autorizados

`INT-APP-003` no autoriza:

- crear tablas, schemas, outbox, triggers, funciones, RPC, RLS o migraciones;
- crear topics, colas, subscriptions, workers, webhooks o endpoints;
- publicar o consumir eventos reales;
- habilitar AURA;
- conceder permisos o acceso a datos;
- definir reintentos, dead-letter, compensaciones o idempotencia física;
- ejecutar replay, backfill, piloto, cutover o producción;
- modificar propiedad, emisoras o las listas aprobadas en `PROC-CAT-006`.

#### 16. Requisitos de prueba derivados

```text
TREQ-INTEGRATION-080 a TREQ-INTEGRATION-107
```

El detalle completo reside exclusivamente en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA_INT-APP-003.md`.

#### 17. Huellas de integridad

```text
EVENT_CONSUMER_PROCESS_MAPPING_SHA256 = 1cc14cdd007fe5f51c853222305d905d6bbc0cbd7ca50294940e926a5ebee887
EVENT_CONSUMER_DISTRIBUTION_SHA256 = dd2e5b86ee22b8fd791e42c8aa4d9a92197e579533469f6dc56196ae170a8831
EVENT_PROJECTION_PROFILE_VOCABULARY_SHA256 = 01a00e7bb299b48fc593dfd8ccd5939b956d43c25a3fc3f07af45884e3dcebfe
EVENT_CONSUMER_PURPOSE_VOCABULARY_SHA256 = 29fc68ee23e6b61c8ccb75eb7ff330fda415b75fb5b3e9e4ee452a05a0578abf
PROCESS_CONSUMER_SOURCE_BLOB_SHA1 = f716207c571ab33e1d22584c249d874c65a50501
EVENT_CATALOG_SOURCE_BLOB_SHA1 = 683c2540d88a7c665c8fd05cd6beb0fd74645b4d
REMOTE_04A_SOURCE_BLOB_SHA1 = 7fd69ad3356b4cd999891fa9e2c3436c363103b7
```

#### 18. Criterios de aceptación

- [x] `INT-APP-002` figura aprobada en el remoto.
- [x] Se congelaron commit y blobs consumidos.
- [x] Se cubrieron exactamente 69 procesos y 395 definiciones.
- [x] Se preservaron 278 relaciones directas y 77 condicionales de `PROC-CAT-006`.
- [x] Se materializaron 1.576 relaciones directas y 444 condicionales por evento.
- [x] La emisora quedó excluida de todas las listas.
- [x] No existen consumidoras duplicadas ni simultáneamente directas y condicionales.
- [x] Se definieron finalidad, condición, sensibilidad y perfil mínimo de proyección.
- [x] SHELL quedó limitado a 63 relaciones de evento.
- [x] Las 197 relaciones vinculadas a AURA quedaron diferidas.
- [x] Ningún tercero, plataforma o servicio técnico figura como consumidora interna.
- [x] No se autorizó implementación ni efecto operativo.
- [x] Se generaron 28 requisitos completos.

#### 19. Validaciones documentales realizadas

| Control                                      | Resultado                                             |
| -------------------------------------------- | ----------------------------------------------------- |
| Commit remoto leído                          | `26038ab9a60f95ac4c299473086d151c6f6e069f`            |
| Blob del mini-bloque X                       | `999db2d534128cab6e784d35db4df9b857411f25`            |
| Blob de propiedad y consumidoras             | `f716207c571ab33e1d22584c249d874c65a50501`            |
| Blob del catálogo de eventos                 | `683c2540d88a7c665c8fd05cd6beb0fd74645b4d`            |
| Blob 04A remoto base                         | `7fd69ad3356b4cd999891fa9e2c3436c363103b7`            |
| Procesos cubiertos                           | **69**                                                |
| Definiciones normales                        | **395**                                               |
| Relaciones directas por proceso              | **278**                                               |
| Relaciones condicionales por proceso         | **77**                                                |
| Relaciones directas por evento               | **1.576**                                             |
| Relaciones condicionales por evento          | **444**                                               |
| Total de relaciones por evento               | **2.020**                                             |
| Requisitos base                              | **4.070**                                             |
| Requisitos nuevos                            | **28**                                                |
| Total regenerado                             | **4.098**                                             |
| Dominio INTEGRATION                          | **107 — TREQ-INTEGRATION-001 a TREQ-INTEGRATION-107** |
| Filas con catorce columnas                   | **4.098 de 4.098**                                    |
| Identificadores duplicados                   | **0**                                                 |
| Relaciones TREQ no resolubles                | **0**                                                 |
| Identificadores históricos preservados       | **4.070**                                             |
| Valores históricos modificados               | **0**                                                 |
| Código, Supabase o integraciones modificados | **no**                                                |

#### 20. Instrucción de reemplazo

1. Reemplazar exactamente `### [ ] INT-APP-003 — Definir aplicaciones consumidoras` por este documento completo.
2. Reemplazar completamente `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` por el archivo regenerado entregado con esta tarea.
3. No copiar, fusionar ni insertar filas `TREQ-*` manualmente.

#### 21. Continuidad aprobada

```text
ÚLTIMA TAREA APROBADA
INT-APP-003 — Definir aplicaciones consumidoras
        ↓
TAREA ACTUAL
INT-APP-004 — Definir idempotencia
        ↓
SIGUIENTE TAREA RESERVADA
INT-APP-005 — Definir reintentos
```

APROBADA


### ✅ INT-APP-004 — Definir idempotencia

**Estado:** APROBADA
**Fecha de aprobación documental:** 2026-07-29
**Bloque propietario:** BLOQUE X — Integraciones empresariales internas y externas
**Marcador exacto que reemplaza:** `### [ ] INT-APP-004 — Definir idempotencia`
**Tarea anterior:** `INT-APP-003 — Definir aplicaciones consumidoras` — APROBADA
**Siguiente tarea:** `INT-APP-005 — Definir reintentos`
**Línea base remota obligatoria:** `devVentoGroup/vento-shell@a0cc6a083d9fbf1536a502103631f153aea91914`
**Tipo de tarea:** definición documental transversal de identidades, alcances, conflictos y recuperación idempotente; sin implementación, tablas, índices, colas, retries, Supabase, piloto ni despliegue

#### 1. Objetivo

Definir un contrato único de idempotencia para las **395 definiciones normales**, las **2.020 relaciones evento-consumidora** y las **ocho familias condicionales** aprobadas, de modo que una solicitud, comando, evento, entrega o efecto repetido no produzca resultados empresariales duplicados y pueda recuperar de forma determinista el resultado previamente confirmado.

```text
MISMA OPERACIÓN LÓGICA + MISMA CLAVE + MISMA HUELLA
        ↓
UN SOLO EFECTO EMPRESARIAL
        ↓
RESULTADO DURABLE Y RECUPERABLE

MISMA CLAVE + HUELLA DIFERENTE
        ↓
CONFLICTO EXPLÍCITO — CERO EFECTOS NUEVOS
```

Idempotencia no significa que el transporte entregue una sola vez. La entrega continúa siendo **al menos una vez**; la garantía funcional es **como máximo un efecto por alcance idempotente**, con devolución del resultado original ante duplicados.

#### 2. Fuentes de verdad congeladas

| Fuente                                                   | Revisión o blob                                         | Responsabilidad                                             |
| -------------------------------------------------------- | ------------------------------------------------------- | ----------------------------------------------------------- |
| `vento-shell`                                            | `a0cc6a083d9fbf1536a502103631f153aea91914`              | revisión remota con `INT-APP-003` y 04A integrados          |
| `X_INTEGRACIONES/01_EVENTOS_ENTRE_APLICACIONES.md`       | `8e577120d7be6090b6c06fb21f52b41901a881f7`              | secuencia y contratos `INT-APP-001` a `INT-APP-010`         |
| `PROC-CAT-015`                                           | `683c2540d88a7c665c8fd05cd6beb0fd74645b4d`              | request_id, client_event_id, versión y conflicto de entrada |
| `PROC-CAT-017` / `ENTERPRISE-EVENT-CATALOG-001`          | `683c2540d88a7c665c8fd05cd6beb0fd74645b4d`              | event_id, aggregate_version, entrega y replay               |
| `INT-APP-002` / `ENTERPRISE-EVENT-PRODUCER-REGISTRY-001` | integrado en el mini-bloque remoto                      | emisora única y límite transaccional propietario            |
| `INT-APP-003` / `ENTERPRISE-EVENT-CONSUMER-REGISTRY-001` | integrado en `8e577120d7be6090b6c06fb21f52b41901a881f7` | 2.020 relaciones y diez perfiles de proyección              |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`       | `b4f5e215afbe88ce433e8cd3dc52a480819c8a04`              | línea base remota de 4.098 requisitos                       |

#### 3. Artefacto producido

```text
ENTERPRISE-EVENT-IDEMPOTENCY-REGISTRY-001@1.0.0
```

| Propiedad                    | Valor                                       | Regla                                         |
| ---------------------------- | ------------------------------------------- | --------------------------------------------- |
| `registry_id`                | `ENTERPRISE-EVENT-IDEMPOTENCY-REGISTRY-001` | identidad estable del contrato                |
| `registry_version`           | `1.0.0`                                     | primera definición transversal                |
| `registry_status`            | `DEFINED`                                   | contrato documental; no prueba implementación |
| `covered_processes`          | **69**                                      | `VPROC-0001` a `VPROC-0069`                   |
| `normal_event_definitions`   | **395**                                     | catálogo completo de `INT-APP-001`            |
| `event_consumer_relations`   | **2.020**                                   | relaciones de `INT-APP-003`                   |
| `conditional_event_families` | **8**                                       | excepciones y acciones CCR parametrizadas     |
| `idempotency_scopes`         | **7**                                       | alcances separados y no intercambiables       |
| `idempotency_outcomes`       | **8**                                       | resultados lógicos cerrados                   |
| `projection_profiles`        | **10**                                      | perfiles heredados de `INT-APP-003`           |
| `transport_guarantee`        | `AT_LEAST_ONCE`                             | puede existir redelivery                      |
| `business_effect_guarantee`  | `AT_MOST_ONCE_PER_SCOPE_WITH_RESULT_REPLAY` | no se repite el efecto dentro del alcance     |
| `global_order`               | `FORBIDDEN`                                 | solo se ordena por agregado y versión         |
| `aura_runtime_status`        | `DEFINED_DEFERRED`                          | contrato definido sin ejecución activa        |

#### 4. Separación conceptual obligatoria

| Concepto            | Identidad                            | Función                                                          | No equivale a                          |
| ------------------- | ------------------------------------ | ---------------------------------------------------------------- | -------------------------------------- |
| solicitud           | `request_id` o `client_event_id`     | estabiliza una intención reintentable antes del primer envío     | comando confirmado ni evento           |
| comando propietario | `source_command_id`                  | vincula autorización, mutación propietaria y eventos resultantes | intento técnico                        |
| evento              | `event_id`                           | identifica una emisión empresarial concreta e inmutable          | tipo de evento ni instancia de proceso |
| entrega             | `delivery_id` o equivalente          | identifica un intento de transporte hacia una consumidora        | nueva operación ni nueva emisión       |
| efecto consumidor   | clave de efecto                      | identifica una mutación propia derivada de un evento             | escritura sobre el dominio emisor      |
| correlación         | `correlation_id` y `causation_id`    | une una cadena de hechos y efectos                               | clave de deduplicación                 |
| orden               | `aggregate_id` y `aggregate_version` | impide regresión y detecta eventos tardíos                       | identidad del evento                   |

`event_definition_id`, `process_instance_id`, `aggregate_id`, `correlation_id`, nombres de ruta, payload hash y timestamps no son claves idempotentes suficientes por sí solos.

#### 5. Alcances canónicos de idempotencia

| Alcance              | Clave lógica mínima                             | Responsable                        | Equivalencia protegida                                       |
| -------------------- | ----------------------------------------------- | ---------------------------------- | ------------------------------------------------------------ |
| `REQUEST_ACCEPTANCE` | `request_id o client_event_id`                  | aplicación productora              | misma solicitud lógica y huella                              |
| `OWNER_COMMAND`      | `source_command_id`                             | aplicación productora              | mismo comando autorizado y mutación propietaria              |
| `EVENT_EMISSION`     | `event_id`                                      | aplicación productora              | mismo evento empresarial persistido                          |
| `CONSUMER_INBOX`     | `consumer_application + event_id`               | aplicación consumidora             | misma entrega de un evento a una consumidora                 |
| `CONSUMER_EFFECT`    | `consumer_application + event_id + effect_code` | aplicación consumidora             | mismo efecto de dominio derivado de un evento                |
| `EXTERNAL_RECEIPT`   | `source_system + external_event_id`             | adaptador y aplicación propietaria | misma afirmación externa autenticada                         |
| `REPLAY_BATCH`       | `replay_request_id`                             | controlador de replay autorizado   | misma instrucción de replay conservando el event_id original |

Reglas:

1. una clave solo es comparable dentro de su alcance y propietario;
2. la clave deberá existir antes del primer efecto reintentable;
3. la misma clave no podrá reutilizarse para otra huella lógica;
4. el resultado durable pertenece al mismo alcance y se recupera sin ejecutar otra vez;
5. cada consumidora mantiene su inbox independiente;
6. un mismo evento puede producir varios efectos distintos en una consumidora, identificados mediante `effect_code`;
7. un intento técnico nuevo conserva la clave empresarial original.

#### 6. Contrato de huella lógica

La clave identifica la operación; la huella demuestra que su contenido lógico no cambió.

La canonicalización versionada deberá incluir, según el alcance:

- tipo de operación o `effect_code`;
- proceso, recurso, agregado y versión objetivo;
- campos empresariales materiales normalizados;
- cantidad, unidad, moneda, lote, sede, área o destinatario cuando cambien el efecto;
- identidad externa y versión contractual;
- referencias de evidencia que sean parte del resultado pretendido.

Deberá excluir:

- `delivery_id`, `attempt_id`, retry count y backoff;
- `trace_id`, span, heartbeat y timestamps creados por cada intento;
- orden de propiedades sin significado;
- firmas o tokens rotatorios usados solo para transporte;
- secretos, contraseñas, credenciales y payload sensible completo.

```text
MISMA CLAVE + MISMA HUELLA VERSIONADA
→ DUPLICATE_RESULT_RETURNED

MISMA CLAVE + HUELLA DISTINTA
→ CONFLICTING_REUSE
```

El hash es una guardia de equivalencia y conflicto. Nunca sustituye `request_id`, `event_id`, `external_event_id` ni la identidad empresarial del recurso.

#### 7. Resultados lógicos cerrados

| Resultado                   | Significado                                                                     |
| --------------------------- | ------------------------------------------------------------------------------- |
| `APPLIED`                   | el alcance se materializó por primera vez y existe resultado durable            |
| `DUPLICATE_RESULT_RETURNED` | la misma operación ya existía y se devuelve su resultado sin repetirla          |
| `CONFLICTING_REUSE`         | la clave existe con una huella lógica incompatible                              |
| `IN_PROGRESS_RECOVERABLE`   | otra ejecución conserva el claim y el resultado deberá recuperarse              |
| `STALE_VERSION`             | la operación parte de una versión anterior y no puede aplicarse silenciosamente |
| `OUT_OF_ORDER_DEFERRED`     | el evento requiere una versión previa o conciliación antes de aplicarse         |
| `RECONCILIATION_REQUIRED`   | el resultado no puede determinarse con seguridad mediante retry automático      |
| `REJECTED`                  | el contrato, autorización, condición o contenido no permite la operación        |

`INT-APP-004` no define tiempos, número de intentos, backoff, jitter ni dead-letter. Esas decisiones pertenecen a `INT-APP-005` y `INT-APP-009`.

#### 8. Solicitudes, comandos y emisión propietaria

1. La interfaz o adaptador crea una clave estable antes del primer envío o persistencia offline.
2. La propietaria revalida identidad, permiso, contexto, contrato y `resource_version`; una clave conocida no concede autoridad.
3. `source_command_id` vincula exactamente una acción autorizada con su mutación y sus eventos.
4. El registro de clave, huella, resultado, mutación y outbox deberán quedar ligados atómicamente o por mecanismo equivalente.
5. Un comando rechazado conserva resultado idempotente seguro cuando corresponda, pero no genera evento de éxito.
6. Una respuesta perdida después del commit se recupera con la misma clave; no se repite la acción.
7. Dos solicitudes concurrentes con la misma clave y huella producen un solo ganador empresarial.
8. Una reutilización incompatible falla antes de cualquier efecto parcial.

No se admite una comprobación `buscar y después insertar` mantenida únicamente en memoria del cliente o sin protección de concurrencia.

#### 9. Emisión, inbox y efectos consumidores

```text
HECHO PROPIETARIO + OUTBOX
        ↓ event_id estable
ENTREGA AL MENOS UNA VEZ
        ↓
INBOX POR consumer_application + event_id
        ↓
CERO, UNO O VARIOS effect_code DISTINTOS
        ↓
RESULTADO PROPIO RECUPERABLE POR CLAVE DE EFECTO
```

- una redelivery conserva `event_id`;
- cada consumidora deduplica de forma independiente;
- procesar el evento en `nexo` no acredita su procesamiento en `numera`;
- una consumidora de solo proyección aplica no-op o upsert monotónico ante duplicado;
- una consumidora mutante exige clave de efecto;
- un evento podrá originar dos efectos legítimos en la misma aplicación solo si tienen `effect_code` distintos;
- el fallo de una consumidora no revierte el hecho confirmado por la productora;
- la consumidora no reemite el evento fuente cambiando `producer_application`.

#### 10. Comportamiento por perfil de proyección

| Perfil de `INT-APP-003`          | Patrón idempotente                                                       | Límite                                   |
| -------------------------------- | ------------------------------------------------------------------------ | ---------------------------------------- |
| `REFERENCE_PROJECTION`           | consumer inbox deduplication plus monotonic aggregate version            | no mutation                              |
| `VERSIONED_REFERENCE_PROJECTION` | consumer inbox deduplication plus versioned replacement                  | no mutation                              |
| `LIFECYCLE_PROJECTION`           | consumer inbox deduplication plus monotonic lifecycle projection         | no owner-state mutation                  |
| `HANDOFF_PROJECTION`             | consumer inbox plus consumer effect key for acceptance or handoff        | one result per effect scope              |
| `IMMUTABLE_FACT_PROJECTION`      | append once by consumer and event                                        | corrections remain separate events       |
| `EFFECT_CONFIRMATION_PROJECTION` | consumer effect key mandatory                                            | one domain effect and recoverable result |
| `EXECUTION_SIGNAL_PROJECTION`    | consumer effect key mandatory for physical or operational execution      | no duplicate physical effect             |
| `RECONCILIATION_PROJECTION`      | ingest once and persist reconciliation result                            | no reconstruction of source fact         |
| `MARKETING_ANALYTICS_PROJECTION` | ingest once; publication or contact needs separate authorized effect key | no automatic outreach                    |
| `ANALYTICS_PROJECTION`           | deterministic ingestion and versioned snapshot                           | no operational mutation                  |

El perfil determina cómo la consumidora materializa su propio resultado. No modifica identidad, audiencia, sensibilidad, permiso ni propiedad del evento.

#### 11. Orden, versiones y concurrencia

1. No existe orden global entre procesos o aplicaciones.
2. El orden aplicable utiliza `aggregate_id` y `aggregate_version`.
3. Un duplicado exacto de `event_id` devuelve el resultado previo.
4. Un evento distinto que reclame la misma versión produce conflicto o conciliación.
5. Una versión inferior tardía se marca `STALE_VERSION` o `OUT_OF_ORDER_DEFERRED`; no sobrescribe la actual.
6. Una versión superior que dependa de una anterior ausente queda diferida o en conciliación.
7. El claim concurrente deberá ser atómico y recuperable después de timeout o caída.
8. El estado `IN_PROGRESS_RECOVERABLE` no autoriza a otra ejecución a aplicar el efecto en paralelo.

#### 12. Entradas externas y webhooks

| Situación                        | Identidad                            | Regla                                                                                |
| -------------------------------- | ------------------------------------ | ------------------------------------------------------------------------------------ |
| proveedor entrega ID estable     | `source_system + external_event_id`  | deduplicar antes de transformar; conservar autenticidad y payload original protegido |
| proveedor no entrega ID          | `receipt_id` asignado por adaptador  | persistir antes del primer procesamiento y conservar en todos los intentos           |
| payload repetido con ID distinto | identidades distintas                | no deduplicar solo por hash; evaluar contrato, equivalencia y posible conflicto      |
| mismo ID con payload distinto    | misma identidad, huella incompatible | `CONFLICTING_REUSE`, cuarentena o conciliación                                       |
| callback técnico                 | correlación técnica                  | no convertir en hecho empresarial hasta validación de la propietaria                 |

Un banco, POS, Rappi, Shopify, ManyChat, mensajería o proveedor futuro no obtiene autoridad interna por entregar un identificador.

#### 13. Offline, interrupciones y reanudación

Una operación offline deberá:

1. crear clave y huella antes de mostrarse como encolada;
2. persistir contenido lógico, propietario, recurso, versión y estado durable;
3. conservar la misma clave tras reinicio de aplicación, pérdida de red o refresh de sesión;
4. crear una clave nueva cuando el usuario cambie materialmente la operación;
5. revalidar identidad, permiso, contexto, turno, sede, área y versión al sincronizar;
6. recuperar el resultado original cuando la operación ya fue aplicada;
7. distinguir `PENDING`, `APPLIED`, `CONFLICTING_REUSE`, `STALE_VERSION` y `RECONCILIATION_REQUIRED`;
8. impedir que una cola antigua reactive autoridad o contexto vencidos.

#### 14. Familias condicionales

Las ocho familias heredarán el mismo contrato de idempotencia, pero cada emisión deberá incorporar:

- proceso y evento o hecho original;
- referencia exacta `EX-*` o `CCR-*`;
- identidad estable de la acción aprobada;
- tipo de excepción, cancelación, anulación, reversión, compensación, corrección o revisión;
- motivo, autoridad, alcance y efecto producido;
- clave de efecto por aplicación consumidora.

Dos compensaciones legítimas diferentes o dos correcciones sucesivas no son duplicados por compartir proceso y familia. Cada acción aprobada tendrá identidad propia y se relacionará con el hecho anterior sin sobrescribirlo.

#### 15. Replay y backfill

##### 15.1. Replay del mismo evento

- conserva `event_id`, `occurred_at`, productora, versión y audiencia histórica;
- crea nuevos intentos de entrega, no nuevas emisiones empresariales;
- cada consumidora devuelve el resultado previo o reprocesa solo proyecciones expresamente reconstruibles;
- no incorpora automáticamente consumidoras añadidas después.

##### 15.2. Backfill o migración sintetizada

- utiliza fuente, lote e identidad deterministas;
- marca `is_backfill` o equivalente;
- conserva `correlation_id`, procedencia y ventana temporal;
- no dispara pagos, inventario, puntos, documentos, mensajes, impresión o acciones físicas sin autorización explícita;
- registra conciliación entre fuente histórica y evento canónico producido.

`replay_request_id` identifica la instrucción de replay; nunca reemplaza el `event_id` de cada elemento.

#### 16. Recuperación, autorización y sensibilidad

La devolución del resultado idempotente deberá:

- comprobar que quien consulta puede conocer el resultado actual;
- limitar la respuesta a la finalidad y proyección autorizadas;
- no reutilizar una autorización histórica como permiso vigente;
- no exponer datos personales, financieros o técnicos mediante logs o conflictos;
- devolver una referencia segura cuando el detalle completo ya no sea visible;
- conservar que el efecto no se vuelve a ejecutar aunque la respuesta se minimice.

Los mensajes de conflicto no incluirán la huella, payload previo, secretos ni atributos sensibles suficientes para inferir otra operación.

#### 17. Retención y auditabilidad

El registro deberá conservar, como mínimo conceptual:

```text
idempotency_scope
+ idempotency_key_reference
+ fingerprint_version
+ fingerprint_reference
+ owner_application
+ operation_or_effect_code
+ resource_or_aggregate_reference
+ first_seen_at
+ current_outcome
+ result_reference
+ event_id when applicable
+ authorization_and_audit_reference
+ retention_class
```

La retención física no podrá ser menor que la máxima ventana aplicable de retry, operación offline, replay, disputa, corrección, compensación y auditoría. Un efecto irreversible no podrá volver a habilitarse únicamente porque venció un registro técnico.

El detalle de intentos, actor, resultado, errores y trazas se completará en `INT-APP-007`. Los logs registrarán referencias y outcome, no payload sensible.

#### 18. Fronteras críticas

##### 18.1. ORIGO → NEXO → NUMERA

Una recepción, ingreso físico y obligación económica usan claves y eventos distintos. Repetir la entrega comercial no vuelve a sumar inventario ni recrea la obligación.

##### 18.2. FOGO → NEXO → PULSO

Producción, liberación de calidad, entrada de terminado, disponibilidad y cumplimiento de pedido son efectos separados. El mismo lote o pedido no funciona como clave universal.

##### 18.3. PULSO → PASS → NUMERA

Venta, pago, movimiento de puntos y hecho económico utilizan alcances propios y correlacionados. Repetir un pago o una venta no duplica puntos, stock, costo ni obligación.

##### 18.4. VISO → ANIMA → SHELL

Turno, asistencia, novedad laboral y contexto de acceso conservan identidades distintas. Una marcación offline repetida no crea otra asistencia y una respuesta idempotente no revive permisos vencidos.

##### 18.5. AURA

Las reglas quedan definidas para las 197 relaciones diferidas vinculadas con AURA, sin crear procesamiento, publicación, inbox, efecto ni replay activo antes de readiness.

#### 19. Decisiones reservadas

| Decisión                                                           | Tarea propietaria |
| ------------------------------------------------------------------ | ----------------- |
| tiempos, backoff, jitter, máximo de intentos y Retry-After         | `INT-APP-005`     |
| compensaciones empresariales                                       | `INT-APP-006`     |
| auditoría completa de comando, emisión, entrega y efecto           | `INT-APP-007`     |
| estados pendientes, offline y sincronización                       | `INT-APP-008`     |
| error parcial, cuarentena y dead-letter                            | `INT-APP-009`     |
| prohibiciones de escritura cruzada y comandos inversos             | `INT-APP-010`     |
| tablas, constraints, outbox, inbox, funciones, RLS y migraciones   | BLOQUES E3 y R    |
| broker, topics, colas, workers, jobs y observabilidad física       | BLOQUE E4         |
| schemas, SDK y canonicalización compartida                         | BLOQUE H          |
| implementación, pruebas E2E, piloto, cutover, rollback e hypercare | BLOQUE E5         |

#### 20. Cambios no autorizados

`INT-APP-004` no autoriza:

- crear tablas, índices únicos, schemas, triggers, funciones, RPC, RLS o migraciones;
- escoger Redis, broker, cola, topic, webhook, cron, worker o proveedor;
- definir tiempos o número de reintentos;
- publicar, reenviar, replayar o backfillear eventos reales;
- activar AURA;
- modificar los 395 eventos, emisoras, consumidoras o 2.020 relaciones;
- conceder permisos o acceso mediante una clave;
- afirmar exactly-once de transporte;
- ejecutar compensaciones, escrituras cruzadas, piloto o producción.

#### 21. Requisitos de prueba derivados

```text
TREQ-INTEGRATION-108 a TREQ-INTEGRATION-137
```

El detalle completo reside exclusivamente en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA_INT-APP-004.md`.

#### 22. Huellas de integridad

```text
IDEMPOTENCY_SCOPE_REGISTRY_SHA256 = cd2dada3adcfdfa5f505827a4e5d898cc1f78e1205814c449a951686e817e615
IDEMPOTENCY_OUTCOME_VOCABULARY_SHA256 = 0c5422fc6fe18976e71dc28f0589fa0745531ce8a6044e8ed47442026d206dcf
IDEMPOTENCY_PROFILE_MATRIX_SHA256 = ec8d5fcf5a87fd970150085726c66faa47be548ac06bbc0b1a4a0f5267255887
IDEMPOTENCY_POLICY_SHA256 = 4c6bece2e1c226a60eaebb7304673e9a9dc78af5ee162c5f2978cee02ce64527
REMOTE_X_BLOCK_BLOB_SHA1 = 8e577120d7be6090b6c06fb21f52b41901a881f7
REMOTE_04A_SOURCE_BLOB_SHA1 = b4f5e215afbe88ce433e8cd3dc52a480819c8a04
EVENT_CATALOG_SOURCE_BLOB_SHA1 = 683c2540d88a7c665c8fd05cd6beb0fd74645b4d
```

#### 23. Criterios de aceptación

- [x] `INT-APP-001` a `INT-APP-003` figuran aprobadas en el remoto.
- [x] Se congelaron commit y blobs consumidos.
- [x] El contrato cubre 69 procesos, 395 eventos, 2.020 relaciones y ocho familias condicionales.
- [x] Se separaron solicitud, comando, evento, entrega, efecto, correlación y orden.
- [x] Se definieron siete alcances idempotentes y ocho resultados lógicos.
- [x] Se estableció misma clave y misma huella igual a resultado original.
- [x] Se estableció misma clave y huella distinta igual a conflicto sin efecto.
- [x] Se definió inbox por consumidora y efecto mediante `effect_code`.
- [x] Se preservó orden por agregado sin orden global.
- [x] Se cubrieron concurrencia, respuesta perdida, offline, externos, replay y backfill.
- [x] Se protegieron autorización, sensibilidad y retención.
- [x] AURA permanece diferida.
- [x] No se autorizó implementación ni efecto operativo.
- [x] Se generaron 30 requisitos completos.

#### 24. Validaciones documentales realizadas

| Control                                      | Resultado                                             |
| -------------------------------------------- | ----------------------------------------------------- |
| Commit remoto leído                          | `a0cc6a083d9fbf1536a502103631f153aea91914`            |
| Blob del mini-bloque X                       | `8e577120d7be6090b6c06fb21f52b41901a881f7`            |
| Blob 04A remoto base                         | `b4f5e215afbe88ce433e8cd3dc52a480819c8a04`            |
| Procesos cubiertos                           | **69**                                                |
| Eventos normales cubiertos                   | **395**                                               |
| Relaciones evento-consumidora cubiertas      | **2.020**                                             |
| Familias condicionales                       | **8**                                                 |
| Alcances idempotentes                        | **7**                                                 |
| Outcomes cerrados                            | **8**                                                 |
| Perfiles de proyección                       | **10**                                                |
| Requisitos base                              | **4.098**                                             |
| Requisitos nuevos                            | **30**                                                |
| Total regenerado                             | **4.128**                                             |
| Dominio INTEGRATION                          | **137 — TREQ-INTEGRATION-001 a TREQ-INTEGRATION-137** |
| Filas con catorce columnas                   | **4.128 de 4.128**                                    |
| Identificadores duplicados                   | **0**                                                 |
| Relaciones TREQ no resolubles                | **0**                                                 |
| Identificadores históricos preservados       | **4.098**                                             |
| Valores históricos modificados               | **0**                                                 |
| Código, Supabase o integraciones modificados | **no**                                                |

#### 25. Instrucción de reemplazo

1. Reemplazar exactamente `### [ ] INT-APP-004 — Definir idempotencia` por este documento completo.
2. Reemplazar completamente `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` por el archivo regenerado entregado con esta tarea.
3. No copiar, fusionar ni insertar filas `TREQ-*` manualmente.

#### 26. Continuidad aprobada

```text
ÚLTIMA TAREA APROBADA
INT-APP-004 — Definir idempotencia
        ↓
TAREA ACTUAL
INT-APP-005 — Definir reintentos
        ↓
SIGUIENTE TAREA RESERVADA
INT-APP-006 — Definir compensaciones
```

APROBADA


### ✅ INT-APP-005 — Definir reintentos

**Estado:** APROBADA  
**Fecha de aprobación documental:** 2026-07-29  
**Bloque propietario:** BLOQUE X — Integraciones empresariales internas y externas  
**Marcador exacto que reemplaza:** `### [ ] INT-APP-005 — Definir reintentos`  
**Tarea anterior:** `INT-APP-004 — Definir idempotencia` — APROBADA  
**Siguiente tarea:** `INT-APP-006 — Definir compensaciones`  
**Línea base remota obligatoria:** `devVentoGroup/vento-shell@09f65964d5d2a5fcc4acb250ea7dd0820636d53b`  
**Tipo de tarea:** definición documental transversal de elegibilidad, clasificación, programación, límites y agotamiento de reintentos; sin implementación, colas, workers, tablas, Supabase, compensaciones, piloto ni despliegue

#### 1. Objetivo

Definir un contrato único y cerrado de reintentos para solicitudes, comandos propietarios, emisión y entrega de eventos, consumo, efectos derivados, integraciones externas, operación offline y replay controlado, preservando las identidades y resultados idempotentes aprobados en `INT-APP-004`.

```text
FALLO O RESPUESTA INCIERTA
        ↓
CLASIFICAR CAUSA Y RESULTADO CONOCIDO
        ↓
¿EL MISMO INTENTO ES SEGURO, NECESARIO Y TODAVÍA VIGENTE?
        ├── NO → RECHAZAR, CONCILIAR O ESCALAR
        └── SÍ → MISMA IDENTIDAD EMPRESARIAL + NUEVO INTENTO TÉCNICO
                         ↓
              BACKOFF + JITTER + LÍMITES
```

Un reintento no crea una operación nueva, no cambia el payload lógico, no sustituye autorización y no garantiza éxito. Solo vuelve a intentar la misma operación cuando el error es elegible y el presupuesto contractual sigue vigente.

#### 2. Fuentes de verdad congeladas

| Fuente                                                      | Revisión o blob                                         | Responsabilidad                                                           |
| ----------------------------------------------------------- | ------------------------------------------------------- | ------------------------------------------------------------------------- |
| `vento-shell`                                               | `09f65964d5d2a5fcc4acb250ea7dd0820636d53b`              | revisión remota con `INT-APP-004` y 04A integrados                        |
| `X_INTEGRACIONES/01_EVENTOS_ENTRE_APLICACIONES.md`          | integrado en `09f65964d5d2a5fcc4acb250ea7dd0820636d53b` | formato vigente y secuencia `INT-APP-001` a `INT-APP-010`                 |
| `INT-APP-004` / `ENTERPRISE-EVENT-IDEMPOTENCY-REGISTRY-001` | integrado en `09f65964d5d2a5fcc4acb250ea7dd0820636d53b` | claves, huellas, outcomes, orden, replay y recuperación                   |
| `PROC-CAT-017` / `ENTERPRISE-EVENT-CATALOG-001`             | `683c2540d88a7c665c8fd05cd6beb0fd74645b4d`              | entrega al menos una vez, deduplicación y orden por agregado              |
| `TREQ-INTEGRATION-003` y `TREQ-INTEGRATION-004`             | 04A remoto vigente                                      | backoff, jitter, Retry-After, límites, timeout desconocido y trazabilidad |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`          | `a133fcba2703b06c65c798f9fb2e2ab1da8f8097`              | línea base remota integrada de 4.128 requisitos                           |

#### 3. Artefacto producido

```text
ENTERPRISE-EVENT-RETRY-POLICY-001@1.0.0
```

| Propiedad                  | Valor                               | Regla                                         |
| -------------------------- | ----------------------------------- | --------------------------------------------- |
| `policy_id`                | `ENTERPRISE-EVENT-RETRY-POLICY-001` | identidad estable del contrato                |
| `policy_version`           | `1.0.0`                             | primera definición transversal                |
| `policy_status`            | `DEFINED`                           | contrato documental; no prueba implementación |
| `covered_processes`        | **69**                              | `VPROC-0001` a `VPROC-0069`                   |
| `normal_event_definitions` | **395**                             | catálogo completo de `INT-APP-001`            |
| `event_consumer_relations` | **2.020**                           | relaciones de `INT-APP-003`                   |
| `idempotency_scopes`       | **7**                               | alcances aprobados en `INT-APP-004`           |
| `retry_profiles`           | **8**                               | perfiles cerrados y versionados               |
| `error_classes`            | **12**                              | clasificación cerrada de disposición          |
| `attempt_outcomes`         | **10**                              | estados lógicos del intento                   |
| `backoff_algorithm`        | `EXPONENTIAL_FULL_JITTER`           | evita sincronización y tormentas              |
| `transport_guarantee`      | `AT_LEAST_ONCE`                     | puede existir redelivery                      |
| `default_unknown_error`    | `NO_AUTOMATIC_RETRY`                | falla cerrada hasta clasificación explícita   |
| `aura_runtime_status`      | `DEFINED_DEFERRED`                  | contrato definido sin ejecución activa        |

#### 4. Principios normativos

1. El primer envío cuenta como intento uno.
2. Cada reintento conserva la misma clave idempotente, huella, `event_id`, operación, audiencia y finalidad.
3. `attempt_id`, `delivery_id`, timestamp, conexión, worker o trace pueden cambiar sin crear otra operación.
4. Un error no clasificado no es reintentable por defecto.
5. Los errores permanentes, rechazos empresariales, denegaciones y reutilizaciones conflictivas no se curan repitiendo.
6. La autorización, el contexto y la vigencia se reevalúan antes de cada efecto.
7. El presupuesto termina por el primer límite alcanzado: intentos, edad, cancelación, expiración o error permanente.
8. Agotar reintentos no ejecuta automáticamente compensación, reversión, cancelación ni escritura cruzada.
9. El hecho confirmado por la propietaria no se revierte porque una consumidora falle.
10. Ningún perfil autoriza un ciclo infinito ni una espera silenciosa.

#### 5. Vocabulario cerrado de errores y disposición

| Clase                    | Disposición canónica         |
| ------------------------ | ---------------------------- |
| `TRANSIENT_CONNECTIVITY` | `AUTOMATIC_RETRY`            |
| `TRANSIENT_DEPENDENCY`   | `AUTOMATIC_RETRY`            |
| `RATE_LIMITED`           | `RETRY_AFTER`                |
| `CONCURRENCY_RETRYABLE`  | `AUTOMATIC_RETRY`            |
| `OUT_OF_ORDER_WAIT`      | `WAIT_FOR_DEPENDENCY`        |
| `AUTH_REFRESH_REQUIRED`  | `REFRESH_THEN_REEVALUATE`    |
| `UNKNOWN_OUTCOME`        | `INQUIRE_OR_RECONCILE_FIRST` |
| `PERMANENT_CONTRACT`     | `NO_RETRY`                   |
| `PERMANENT_BUSINESS`     | `NO_RETRY`                   |
| `SECURITY_DENIED`        | `NO_RETRY`                   |
| `CONFLICTING_REUSE`      | `NO_RETRY`                   |
| `CANCELLED_OR_EXPIRED`   | `NO_RETRY`                   |

Interpretación mínima:

- `TRANSIENT_CONNECTIVITY`: DNS, conexión, red, reset o indisponibilidad temporal sin rechazo semántico;
- `TRANSIENT_DEPENDENCY`: servicio o proveedor temporalmente no disponible;
- `RATE_LIMITED`: cuota o capacidad con instante permitido de reanudación;
- `CONCURRENCY_RETRYABLE`: deadlock, serialización, lock o claim recuperable;
- `OUT_OF_ORDER_WAIT`: falta una versión o dependencia previa;
- `AUTH_REFRESH_REQUIRED`: solo admite refrescar y reevaluar; nunca repetir con autoridad vencida;
- `UNKNOWN_OUTCOME`: existe posibilidad de commit y exige consulta o conciliación antes de reejecutar;
- las cinco clases permanentes restantes no admiten retry automático.

Códigos HTTP, excepciones de SDK o mensajes de proveedor deberán traducirse a esta taxonomía mediante un contrato versionado. Un `500`, `409` o timeout no será reintentable por el número aislado si el contrato indica resultado permanente o desconocido.

#### 6. Perfiles canónicos

| Perfil                        | Intentos totales |   Base | Tope por demora | Edad máxima | Uso y límite                                                                                   |
| ----------------------------- | ---------------: | -----: | --------------: | ----------: | ---------------------------------------------------------------------------------------------- |
| `RETRY_NONE`                  |            **1** |      0 |               0 |           0 | sin reintento automático; rechazo, conflicto, cancelación o intervención explícita             |
| `RETRY_INTERACTIVE_SAFE`      |            **3** | 500 ms |             5 s |        30 s | interacción corta y plenamente idempotente; la interfaz conserva el mismo identificador        |
| `RETRY_OWNER_COMMAND`         |            **6** |    2 s |           2 min |      30 min | comando propietario recuperable; resultado desconocido exige consulta antes de reejecutar      |
| `RETRY_EVENT_STANDARD`        |           **12** |    5 s |          15 min |        24 h | entrega y consumo asincrónicos ordinarios con inbox idempotente                                |
| `RETRY_EVENT_CRITICAL`        |           **20** |    2 s |          10 min |        72 h | custodia, inventario, pago, fidelización, seguridad o continuidad con conciliación obligatoria |
| `RETRY_PROVIDER_RATE_LIMITED` |           **12** |   30 s |             6 h |         7 d | proveedor externo o cuota; Retry-After define el instante mínimo cuando sea válido             |
| `RETRY_OFFLINE_SYNC`          |           **20** |   10 s |          30 min |         7 d | sincronización durable; ausencia de conectividad no consume intento de transmisión             |
| `RETRY_OUT_OF_ORDER`          |           **20** |   30 s |             1 h |        72 h | espera por versión o dependencia; despertar por señal es preferible a sondeo                   |

Los valores son máximos contractuales, no una obligación de consumir todos los intentos. Un resultado recuperado, una denegación, una cancelación o una condición permanente detienen inmediatamente la secuencia.

#### 7. Selección obligatoria de perfil

| Alcance de `INT-APP-004` | Perfil ordinario              | Perfil alterno permitido                                            |
| ------------------------ | ----------------------------- | ------------------------------------------------------------------- |
| `REQUEST_ACCEPTANCE`     | `RETRY_INTERACTIVE_SAFE`      | `RETRY_OFFLINE_SYNC` cuando existe cola durable                     |
| `OWNER_COMMAND`          | `RETRY_OWNER_COMMAND`         | `RETRY_NONE` para operación no repetible o rechazo permanente       |
| `EVENT_EMISSION`         | `RETRY_EVENT_CRITICAL`        | `RETRY_EVENT_STANDARD` cuando no existe efecto sensible ni custodia |
| `CONSUMER_INBOX`         | `RETRY_EVENT_STANDARD`        | `RETRY_EVENT_CRITICAL` por criticidad material                      |
| `CONSUMER_EFFECT`        | `RETRY_EVENT_CRITICAL`        | `RETRY_NONE` si requiere decisión humana o conciliación previa      |
| `EXTERNAL_RECEIPT`       | `RETRY_PROVIDER_RATE_LIMITED` | `RETRY_EVENT_STANDARD` si el proveedor no usa cuotas                |
| `REPLAY_BATCH`           | `RETRY_NONE`                  | perfil subyacente por elemento después de autorización explícita    |

Cada operación o relación deberá resolver exactamente un perfil vigente. La criticidad no podrá decidirse desde un componente de interfaz ni mediante un fallback local no versionado.

#### 8. Backoff exponencial con full jitter

Para el reintento número `n`, posterior al primer intento:

```text
exponential_ceiling = min(delay_cap, base_delay × 2^(n - 2))
next_delay = random_uniform(0, exponential_ceiling)
```

Reglas:

1. el jitter será por intento y operación, no una constante compartida;
2. no se usará demora fija para todas las instancias;
3. el scheduler no reducirá una espera ya impuesta por `Retry-After`;
4. el reloj utilizado deberá ser monotónico para intervalos y conservar timestamps UTC para auditoría;
5. un reinicio recuperará `next_attempt_at` durable y no reiniciará el presupuesto;
6. el cliente no podrá acelerar reintentos manipulando el reloj local.

#### 9. `Retry-After`, cuotas y ventanas del proveedor

Cuando exista `Retry-After` o equivalente autenticado:

```text
next_attempt_at = max(calculated_backoff_at, provider_retry_after_at)
```

- el valor válido define el instante mínimo permitido;
- un valor inválido o ausente usa el perfil local y registra la anomalía;
- una espera que exceda la edad máxima termina en conciliación o intervención, no en envío tardío silencioso;
- cuotas por aplicación, sede, credencial, endpoint o proveedor deberán mantenerse separadas;
- cambiar credencial o worker para evadir una cuota queda prohibido;
- una respuesta exitosa no borra límites empresariales pendientes ni confirma un efecto externo sin validación.

#### 10. Presupuesto de intentos y edad

El presupuesto se calcula desde `first_attempt_at`, no desde el último reinicio del cliente o worker.

```text
STOP WHEN
attempt_number >= total_attempts
OR now >= first_attempt_at + max_age
OR operation_cancelled
OR operation_expired
OR permanent_error_detected
OR authorization_or_contract_no_longer_valid
```

- el tiempo sin conectividad no consume intento de transmisión en `RETRY_OFFLINE_SYNC`, pero sí consume edad;
- una ejecución que alcanzó al proveedor o servidor consume intento aunque la respuesta se pierda;
- una consulta de estado para resolver `UNKNOWN_OUTCOME` se audita por separado y no fabrica otro comando;
- extender edad o intentos exige una decisión versionada y no puede hacerse manualmente desde base de datos.

#### 11. Identidad y estado de cada intento

Cada intento conceptual deberá conservar:

```text
retry_operation_ref
+ idempotency_scope
+ idempotency_key_reference
+ fingerprint_reference
+ attempt_id
+ attempt_number
+ retry_profile
+ error_class
+ scheduled_at
+ started_at
+ completed_at
+ next_attempt_at
+ outcome
+ producer_application
+ consumer_application when applicable
+ event_id or source_command_id when applicable
+ authorization_and_audit_reference
```

Estados cerrados:

| Outcome                     |
| --------------------------- |
| `SCHEDULED`                 |
| `IN_FLIGHT`                 |
| `SUCCEEDED`                 |
| `DUPLICATE_RESULT_RETURNED` |
| `WAITING_RETRY_AFTER`       |
| `WAITING_DEPENDENCY`        |
| `RECONCILIATION_REQUIRED`   |
| `EXHAUSTED`                 |
| `REJECTED_PERMANENT`        |
| `CANCELLED`                 |

Un intento técnico podrá finalizar en `DUPLICATE_RESULT_RETURNED` y cerrar correctamente la operación sin volver a aplicar el efecto.

#### 12. Interacciones y comandos propietarios

1. `RETRY_INTERACTIVE_SAFE` solo opera sobre solicitudes idempotentes y dentro de una ventana visible para el usuario.
2. El frontend conserva la misma clave; no genera otra por cada click, timeout o refresh.
3. Deshabilitar un botón no constituye protección contra doble envío.
4. `RETRY_OWNER_COMMAND` revalida permiso, actor, sede, área, turno, recurso y versión.
5. Ante respuesta perdida después de posible commit, se consulta el resultado por la misma clave antes de reejecutar.
6. Una validación fallida, denegación, conflicto de huella o rechazo empresarial termina en `REJECTED_PERMANENT`.
7. Un usuario podrá cancelar la espera futura cuando el proceso lo permita, pero no borrar un efecto ya confirmado.

#### 13. Emisión, entrega y consumo de eventos

```text
OUTBOX PENDIENTE
        ↓ perfil de emisión
EVENTO CON event_id ESTABLE
        ↓ perfil de entrega por consumidora
INBOX consumer_application + event_id
        ↓ perfil de efecto cuando aplique
RESULTADO PROPIO O ESTADO PENDIENTE
```

- cada consumidora mantiene presupuesto y resultado independientes;
- una entrega exitosa a `nexo` no consume ni completa el presupuesto de `numera`;
- el redelivery conserva evento, versión, productora, audiencia y sensibilidad;
- un fallo de consumidor no recrea el evento ni modifica `producer_application`;
- las proyecciones monotónicas pueden devolver no-op idempotente;
- los efectos físicos, financieros, de puntos, documentos, mensajes o impresión usan clave de efecto y perfil crítico;
- una consumidora retirada o no autorizada no recibe reintentos históricos por conveniencia.

#### 14. Resultado desconocido

`UNKNOWN_OUTCOME` se usa cuando el cliente, adaptador o worker no puede demostrar si el receptor confirmó el efecto.

Secuencia obligatoria:

```text
TIMEOUT O CONEXIÓN CERRADA DESPUÉS DEL ENVÍO
        ↓
CONSULTAR POR CLAVE, EVENT_ID, ID EXTERNO O RECIBO
        ├── CONFIRMADO → RECUPERAR RESULTADO
        ├── NO APLICADO DEMOSTRADO → REINTENTAR MISMA OPERACIÓN
        └── INDETERMINADO → RECONCILIATION_REQUIRED
```

Queda prohibido tratar un timeout como fracaso seguro y volver a ejecutar pagos, inventario, puntos, custodia, publicación, impresión o notificación sin indagación cuando el receptor pudo haber confirmado.

#### 15. Eventos fuera de orden y dependencias pendientes

`RETRY_OUT_OF_ORDER` no sobrescribe versiones ni ejecuta sondeo agresivo.

- `aggregate_id + aggregate_version` determina la dependencia;
- la llegada de la versión faltante deberá despertar preferentemente los elementos esperando;
- una versión inferior tardía se clasifica como stale o no-op, no como retry infinito;
- una versión superior sin predecesora queda `WAITING_DEPENDENCY`;
- al vencer el presupuesto pasa a conciliación o intervención;
- ninguna consumidora podrá inventar el estado faltante para desbloquearse.

#### 16. Integraciones externas

1. El adaptador traduce códigos externos a la taxonomía cerrada.
2. `source_system + external_event_id` permanece estable en todos los intentos.
3. Webhooks repetidos se deduplican antes de cualquier efecto interno.
4. Un proveedor sin identificador estable recibe `receipt_id` durable antes del procesamiento.
5. `401` o credencial expirada exige renovar y reautorizar; no bucle con la misma credencial.
6. `403`, contrato revocado, firma inválida o payload incompatible no admiten reintento automático.
7. Un `429` respeta `Retry-After`; un `5xx` solo se reintenta dentro del contrato y presupuesto.
8. El adaptador no cambia payload, canal, destinatario o importe para conseguir éxito.

#### 17. Operación offline

`RETRY_OFFLINE_SYNC` deberá:

- persistir clave, huella, contenido lógico, contexto y edad antes de mostrar estado pendiente;
- pausar envíos mientras la conectividad sea inexistente o no apta;
- conservar el mismo identificador tras reinicio, actualización o cambio de red;
- revalidar sesión, actor, turno, sede, área, permiso, dispositivo y versión al sincronizar;
- distinguir pendiente local, enviado, resultado recuperado, conflicto, expirado y conciliación;
- no transferir operaciones de un actor a otro en dispositivo compartido;
- no consumir un intento por una comprobación local que detecta ausencia de red;
- impedir que la cola antigua reviva contexto o autoridad vencidos.

#### 18. Replay y backfill

- replay conserva `event_id`, audiencia histórica y resultado previo de cada consumidora;
- un batch autorizado no reintenta indiscriminadamente todos sus elementos;
- cada elemento usa su propia identidad, clasificación y presupuesto;
- `replay_request_id` identifica la instrucción, no reemplaza el `event_id`;
- backfill mantiene fuente, lote, ventana, `is_backfill` y controles de efectos sensibles;
- consumidoras añadidas después no reciben historia sin migración explícita;
- agotamiento de un elemento no cancela ni confirma los demás;
- pagos, stock, puntos, documentos, comunicaciones o acciones físicas requieren autorización expresa para replay.

#### 19. Concurrencia, circuit breaker y tormentas

1. Un claim o lease atómico evita dos intentos concurrentes del mismo alcance.
2. El lease tendrá propietario, expiración y recuperación segura; expirar no prueba que el efecto no ocurrió.
3. Un circuit breaker podrá detener temporalmente nuevos intentos ante dependencia degradada sin consumir presupuesto de envío mientras esté abierto.
4. El estado half-open utilizará pruebas limitadas, no liberación masiva.
5. Bulkheads separarán proveedores, aplicaciones, consumidoras y clases críticas para evitar cascadas.
6. Los reintentos deberán tener límites de concurrencia y tasa por destino.
7. Un restablecimiento no podrá liberar simultáneamente todo el backlog; aplicará jitter y drenaje controlado.
8. La prioridad crítica no autoriza starvation indefinido ni bypass de idempotencia.

#### 20. Agotamiento y salida del retry

Al finalizar el presupuesto, la operación deberá quedar explícitamente en uno de estos destinos:

| Destino                        | Regla                                                                  | Tarea posterior               |
| ------------------------------ | ---------------------------------------------------------------------- | ----------------------------- |
| `RECONCILIATION_REQUIRED`      | resultado posible o dependencia no resoluble automáticamente           | `INT-APP-008` y `INT-APP-009` |
| `MANUAL_INTERVENTION_REQUIRED` | decisión humana, dato corregible o proveedor sin resolución automática | `INT-APP-009`                 |
| `DEAD_LETTER_CANDIDATE`        | elemento aislado con evidencia y posibilidad de reproceso controlado   | `INT-APP-009`                 |
| `PERMANENTLY_REJECTED`         | contrato, autorización o negocio impiden la operación                  | tarea funcional propietaria   |
| `CANCELLED_OR_EXPIRED`         | la intención dejó de ser válida                                        | proceso propietario           |

Agotar intentos no equivale a compensar. `INT-APP-006` decidirá si existe efecto confirmado que requiera compensación empresarial. Tampoco equivale a borrar, marcar completado o crear un hecho de éxito.

#### 21. Autorización, sensibilidad y auditabilidad

- cada intento revalida autorización y contexto cuando puede producir o revelar un efecto;
- recuperar un resultado anterior no concede acceso actual al detalle;
- logs y métricas usarán referencias, códigos y latencia, no payload sensible, tokens, firmas o huellas completas;
- `INT-APP-007` completará actor, principal técnico, causa, intento, resultado y trazas;
- el historial conservará cambios de perfil y clasificación;
- reintentos manuales exigirán motivo, actor autorizado, alcance y evidencia;
- una operación restringida no podrá moverse a una cola menos protegida para ser reintentada.

#### 22. Fronteras críticas

##### 22.1. ORIGO → NEXO → NUMERA

Reintentar aceptación comercial, ingreso físico y obligación económica utiliza operaciones y presupuestos separados. Una recepción repetida no vuelve a sumar inventario ni recrea la obligación.

##### 22.2. FOGO → NEXO → PULSO

Plan, producción, calidad, entrada de terminado, disponibilidad y pedido conservan identidades distintas. Un lote retenido no se libera por agotar reintentos.

##### 22.3. PULSO → PASS → NUMERA

Pedido, pago, puntos y efecto financiero no comparten una clave universal. Un timeout de pago se consulta antes de cobrar otra vez y un retry de puntos no recrea la venta.

##### 22.4. VISO → ANIMA → SHELL

Programación, asistencia y contexto de acceso se reintentan dentro de sus dominios. Una marcación offline conserva identidad y no revive turno, sesión o permisos vencidos.

##### 22.5. AURA

Los perfiles quedan definidos para las relaciones diferidas, pero no se crean workers, colas, entregas, publicaciones ni reintentos activos antes de readiness.

#### 23. Decisiones reservadas

| Decisión                                                            | Tarea propietaria |
| ------------------------------------------------------------------- | ----------------- |
| compensaciones y efectos inversos                                   | `INT-APP-006`     |
| auditoría completa de cada intento                                  | `INT-APP-007`     |
| sincronización pendiente y estados offline                          | `INT-APP-008`     |
| error parcial, cuarentena, dead-letter e intervención               | `INT-APP-009`     |
| escrituras cruzadas y comandos inversos                             | `INT-APP-010`     |
| tablas, constraints, outbox, inbox, leases y migraciones            | BLOQUES E3 y R    |
| broker, topics, colas, workers, scheduler y circuit breaker físicos | BLOQUE E4         |
| schemas, SDK, taxonomía y canonicalización compartida               | BLOQUE H          |
| implementación, pruebas E2E, piloto, cutover, rollback e hypercare  | BLOQUE E5         |

#### 24. Cambios no autorizados

`INT-APP-005` no autoriza:

- crear tablas, índices, funciones, triggers, RPC, RLS o migraciones;
- escoger broker, cola, scheduler, cron, worker, proveedor o librería;
- ejecutar reintentos reales, replay, backfill o drenaje de backlog;
- alterar claves, huellas, eventos, emisoras, consumidoras o audiencias;
- convertir errores permanentes en retry por conveniencia;
- extender presupuestos manualmente desde base de datos;
- compensar, revertir, cancelar o corregir efectos;
- activar AURA;
- conceder permisos o eludir contexto;
- afirmar entrega exactly-once;
- iniciar piloto o producción.

#### 25. Requisitos de prueba derivados

```text
TREQ-INTEGRATION-138 a TREQ-INTEGRATION-167
```

El detalle completo reside exclusivamente en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA_INT-APP-005.md`.

#### 26. Huellas de integridad

```text
RETRY_PROFILE_REGISTRY_SHA256 = d5818cb1b2eee835370795e7ebfef8b5027eca880fa7a6c5a0d2027e91a0660b
RETRY_ERROR_TAXONOMY_SHA256 = 03f65e06c3d6dec2edf07a425b46df4458b34d71b25172bf58ba8f902de6249e
RETRY_OUTCOME_VOCABULARY_SHA256 = 1d41a26b2cf8ea9c6469cc1d7f47867b2d04ae398b4f37070c4ce729fbb2d762
RETRY_POLICY_SHA256 = 0765ab16f1d06da221db8126ee33d347bff113e3981f66ce168b8f4f9325c371
REMOTE_COMMIT_SHA = 09f65964d5d2a5fcc4acb250ea7dd0820636d53b
REMOTE_04A_BASE_BLOB_SHA1 = a133fcba2703b06c65c798f9fb2e2ab1da8f8097
EVENT_CATALOG_SOURCE_BLOB_SHA1 = 683c2540d88a7c665c8fd05cd6beb0fd74645b4d
```

#### 27. Criterios de aceptación

- [x] `INT-APP-001` a `INT-APP-004` figuran aprobadas en el remoto.
- [x] Se congeló el commit remoto vigente antes de elaborar.
- [x] Se preservó la estructura documental exacta usada por `INT-APP-004`.
- [x] Se definieron ocho perfiles, doce clases de error y diez outcomes.
- [x] Se estableció backoff exponencial con full jitter.
- [x] Se definieron `Retry-After`, intentos totales y edad máxima.
- [x] Se separó error transitorio, resultado desconocido, espera por dependencia y rechazo permanente.
- [x] Se preservan clave, huella, evento, audiencia, finalidad y autorización.
- [x] Se cubrieron interacción, comando, evento, consumidor, proveedor, offline, replay y backfill.
- [x] Se definieron claims, circuit breaker, bulkheads y prevención de tormentas sin seleccionar tecnología.
- [x] Se separó agotamiento de compensación, dead-letter y escritura cruzada.
- [x] AURA permanece diferida.
- [x] No se autorizó implementación ni efecto operativo.
- [x] Se generaron 30 requisitos completos.

#### 28. Validaciones documentales realizadas

| Control                                      | Resultado                                             |
| -------------------------------------------- | ----------------------------------------------------- |
| Commit remoto leído                          | `09f65964d5d2a5fcc4acb250ea7dd0820636d53b`            |
| Base 04A integrada                           | `a133fcba2703b06c65c798f9fb2e2ab1da8f8097`            |
| Procesos cubiertos                           | **69**                                                |
| Eventos normales cubiertos                   | **395**                                               |
| Relaciones evento-consumidora cubiertas      | **2.020**                                             |
| Alcances idempotentes                        | **7**                                                 |
| Perfiles de retry                            | **8**                                                 |
| Clases de error                              | **12**                                                |
| Outcomes de intento                          | **10**                                                |
| Requisitos base                              | **4.128**                                             |
| Requisitos nuevos                            | **30**                                                |
| Total regenerado                             | **4.158**                                             |
| Dominio INTEGRATION                          | **167 — TREQ-INTEGRATION-001 a TREQ-INTEGRATION-167** |
| Filas con catorce columnas                   | **4.158 de 4.158**                                    |
| Identificadores duplicados                   | **0**                                                 |
| Relaciones TREQ no resolubles                | **0**                                                 |
| Identificadores históricos preservados       | **4.128**                                             |
| Valores históricos modificados               | **0**                                                 |
| Código, Supabase o integraciones modificados | **no**                                                |

#### 29. Instrucción de reemplazo

1. Reemplazar exactamente `### [ ] INT-APP-005 — Definir reintentos` por este documento completo.
2. Reemplazar completamente `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` por el archivo regenerado entregado con esta tarea.
3. No copiar, fusionar ni insertar filas `TREQ-*` manualmente.

#### 30. Continuidad aprobada

```text
ÚLTIMA TAREA APROBADA
INT-APP-005 — Definir reintentos
        ↓
TAREA ACTUAL
INT-APP-006 — Definir compensaciones
        ↓
SIGUIENTE TAREA RESERVADA
INT-APP-007 — Definir auditoría transversal
```

APROBADA


### ✅ INT-APP-006 — Definir compensaciones

**Estado:** APROBADA
**Fecha de preparación documental:** 2026-07-29
**Bloque propietario:** BLOQUE X — Integraciones empresariales internas y externas
**Marcador exacto que reemplaza:** `### [ ] INT-APP-006 — Definir compensaciones`
**Tarea anterior:** `INT-APP-005 — Definir reintentos` — APROBADA
**Siguiente tarea:** `INT-APP-007 — Definir auditoría transversal`
**Línea base remota obligatoria:** `devVentoGroup/vento-shell@9a51cccf27f415b606212f73c2bc5bdda1947bbc`
**Tipo de tarea:** definición documental transversal de elegibilidad, clasificación, planificación, ejecución, verificación y conciliación de compensaciones; sin implementación, tablas, Supabase, colas, workers, APIs, piloto ni despliegue

#### 1. Objetivo

Definir un contrato único y cerrado para tratar efectos empresariales ya confirmados que deban detenerse, neutralizarse, sustituirse, revertirse, devolverse, reembolsarse, revocarse, ajustarse, corregirse, reexpresarse o compensarse, preservando las identidades, fronteras de propiedad, idempotencia y reglas de reintento aprobadas.

```text
FALLO, CAMBIO O DECISIÓN POSTERIOR
        ↓
DEMOSTRAR QUÉ EFECTO OCURRIÓ REALMENTE
        ↓
CLASIFICAR REVERSIBILIDAD Y ACCIÓN CCR
        ↓
AUTORIZAR Y VERSIONAR PLAN
        ↓
EJECUTAR PASOS EN CADA APLICACIÓN PROPIETARIA
        ↓
VERIFICAR + CONCILIAR + CERRAR RESIDUALES
```

Una compensación no es un rollback técnico global. Es un conjunto de acciones empresariales nuevas, vinculadas, autorizadas, idempotentes y verificables que conserva intacto el hecho original.

#### 2. Fuentes de verdad congeladas

| Fuente                                                                        | Revisión o blob                            | Responsabilidad                                                         |
| ----------------------------------------------------------------------------- | ------------------------------------------ | ----------------------------------------------------------------------- |
| `vento-shell`                                                                 | `9a51cccf27f415b606212f73c2bc5bdda1947bbc` | revisión remota con `INT-APP-005` y 04A integrados                      |
| `X_INTEGRACIONES/01_EVENTOS_ENTRE_APLICACIONES.md`                            | `977c072fec220b4d15ef1991ef3b2f3821a6e747` | contratos `INT-APP-001` a `INT-APP-005` y marcador de esta tarea        |
| `PROC-CAT-014` / `PROC-PROCESS-CANCELLATION-REVERSAL-CORRECTION-REGISTRY-001` | `55913e1380a83c12f50cfe368c1787c83222473e` | 69 procesos, 276 acciones CCR, doce clases y reglas de reversibilidad   |
| `INT-APP-004`                                                                 | integrado en el remoto                     | identidad, huella, scopes, inbox y resultados idempotentes              |
| `INT-APP-005`                                                                 | integrado en el remoto                     | retry, resultado desconocido, agotamiento y frontera retry–compensación |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`                            | `8215544ea9a669e212ade2bb7ea4212ba96ca194` | línea base de 4.158 requisitos hasta `TREQ-INTEGRATION-167`             |

#### 3. Artefacto producido

```text
ENTERPRISE-EVENT-COMPENSATION-POLICY-001@1.0.0
```

| Propiedad                  | Valor                                      | Regla                                                                 |
| -------------------------- | ------------------------------------------ | --------------------------------------------------------------------- |
| `policy_id`                | `ENTERPRISE-EVENT-COMPENSATION-POLICY-001` | identidad estable del contrato                                        |
| `policy_version`           | `1.0.0`                                    | primera definición transversal                                        |
| `policy_status`            | `DEFINED`                                  | contrato documental; no prueba implementación                         |
| `covered_processes`        | **69**                                     | `VPROC-0001` a `VPROC-0069`                                           |
| `covered_ccr_actions`      | **276**                                    | cuatro acciones por proceso aprobadas en `PROC-CAT-014`               |
| `resolution_treatments`    | **12**                                     | mapeo cerrado por clase CCR                                           |
| `reversibility_classes`    | **5**                                      | clasificación obligatoria previa                                      |
| `plan_stages`              | **8**                                      | secuencia contractual de resolución                                   |
| `plan_outcomes`            | **11**                                     | vocabulario cerrado de resultado                                      |
| `normal_event_definitions` | **395**                                    | catálogo de eventos de `INT-APP-001`                                  |
| `event_consumer_relations` | **2.020**                                  | relaciones de `INT-APP-003`                                           |
| `transport_guarantee`      | `AT_LEAST_ONCE`                            | la redelivery puede ocurrir; la idempotencia sigue siendo obligatoria |
| `aura_runtime_status`      | `DEFINED_DEFERRED`                         | contrato definido sin ejecución activa                                |

#### 4. Principios normativos

1. No existe compensación sin un efecto confirmado, identificable y atribuible.
2. Agotar reintentos, recibir un timeout o perder una respuesta no prueba que el efecto haya ocurrido ni autoriza compensarlo.
3. El efecto original permanece inmutable y consultable.
4. Cada efecto inverso o mitigador pertenece a la aplicación y proceso que gobiernan esa fuente de verdad.
5. Una orquestadora coordina; no escribe fuentes privadas ajenas.
6. Cada paso tiene identidad, huella, autorización, resultado y evidencia propios.
7. La misma compensación repetida devuelve el resultado previo; no reaplica el efecto.
8. Un plan parcial no se presenta como completo y no genera una cadena inversa recursiva por inferencia.
9. Los efectos irreversibles se mitigan, corrigen o compensan; nunca se presentan como si no hubieran ocurrido.
10. Cancelar, anular, sustituir y corregir permanecen semánticamente separados de revertir o compensar.
11. La ejecución no empieza hasta disponer de clasificación, autoridad, dependencias y criterio de cierre.
12. Esta tarea no selecciona saga engine, broker, cola, scheduler, worker, librería ni modelo físico.

#### 5. Puerta de elegibilidad

```text
¿EXISTE EFECTO CONFIRMADO?
├── NO → `NOT_REQUIRED` O `ELIGIBILITY_REJECTED`
└── SÍ
    ↓
¿LA ACCIÓN CCR Y LA AUTORIDAD SON VÁLIDAS?
├── NO → `ELIGIBILITY_REJECTED`
└── SÍ
    ↓
CLASIFICAR REVERSIBILIDAD
    ↓
PLANIFICAR PASOS PROPIETARIOS Y RESIDUALES
```

Un efecto se considera confirmado únicamente mediante una fuente aprobada: resultado idempotente recuperado, evento persistido, movimiento, ledger, recibo externo validado, documento, decisión o evidencia equivalente gobernada por la propietaria.

Queda prohibido inferir confirmación desde:

- texto de error;
- timeout;
- estado visual del botón;
- ausencia de respuesta;
- log aislado;
- importe o cantidad coincidente;
- proximidad temporal;
- nombre de estado legacy;
- intento agotado.

#### 6. Tratamientos canónicos por clase CCR

| Clase CCR    | Tratamiento transversal         | Límite                                                                       |
| ------------ | ------------------------------- | ---------------------------------------------------------------------------- |
| `CANCEL`     | `FUTURE_STOP_WITH_RESIDUALS`    | Detiene trabajo futuro; no deshace efectos confirmados.                      |
| `VOID`       | `INVALID_RECORD_NEUTRALIZATION` | Solo neutraliza un registro sin efecto válido; conserva evidencia.           |
| `SUPERSEDE`  | `PROSPECTIVE_REPLACEMENT`       | Crea versión sucesora; no reescribe vigencia histórica.                      |
| `COMPENSATE` | `LINKED_COMPENSATION`           | Crea restitución o mitigación medible cuando no existe reverso literal.      |
| `REVERSE`    | `LINKED_REVERSAL`               | Ejecuta operación inversa autorizada e idempotente.                          |
| `RETURN`     | `PHYSICAL_RETURN`               | Crea flujo físico inverso con custodia, cantidades, condición y aceptación.  |
| `REFUND`     | `FINANCIAL_REFUND`              | Crea transacción financiera inversa y conciliable.                           |
| `REVOKE`     | `AUTHORITY_REVOCATION`          | Retira autoridad futura e invalida sesiones, tokens, dispositivos y cachés.  |
| `ADJUST`     | `LINKED_ADJUSTMENT`             | Registra diferencia y ajuste separado sin modificar el hecho original.       |
| `CORRECT`    | `VERSIONED_CORRECTION`          | Crea enmienda con antes/después, causa, autoridad e impacto.                 |
| `RESTATE`    | `LINKED_RESTATEMENT`            | Reexpresa clasificación o resultado sin alterar el hecho fuente.             |
| `DEACTIVATE` | `CONTROLLED_DEACTIVATION`       | Retira un modo alternativo y reconcilia pendientes antes del retorno normal. |

Cada una de las 276 acciones aprobadas deberá conservar su identificador `VPROC-####.CCR-###`, clase y propietaria. Esta política no renombra, fusiona ni reemplaza esas acciones.

#### 7. Clasificación obligatoria de reversibilidad

| Clase                        | Tratamiento mínimo                                                           |
| ---------------------------- | ---------------------------------------------------------------------------- |
| `REVERSIBLE_DIRECTO`         | Existe operación inversa definida y segura.                                  |
| `REVERSIBLE_CON_CONDICIONES` | Exige ventana, aprobación, disponibilidad, proveedor, estado o conciliación. |
| `SOLO_COMPENSABLE`           | No puede deshacerse literalmente; exige restitución, mitigación o ajuste.    |
| `IRREVERSIBLE`               | Solo admite corrección de representación, mitigación y evidencia.            |
| `PENDIENTE_DE_DETERMINAR`    | Bloquea ejecución hasta que el contrato propietario defina el tratamiento.   |

Reglas:

1. `PENDIENTE_DE_DETERMINAR` falla de forma cerrada.
2. `IRREVERSIBLE` bloquea reversión literal.
3. La clasificación se realiza por efecto, no por proceso completo.
4. Un plan puede contener pasos de clases distintas.
5. Cambiar clasificación exige nueva versión contractual y revisión de impacto.

#### 8. Etapas del plan

| Orden | Etapa                    |
| ----: | ------------------------ |
|     1 | `DETECT_AND_CORRELATE`   |
|     2 | `INQUIRE_OR_RECONCILE`   |
|     3 | `CLASSIFY_REVERSIBILITY` |
|     4 | `AUTHORIZE`              |
|     5 | `PLAN_DEPENDENCIES`      |
|     6 | `EXECUTE_OWNER_STEPS`    |
|     7 | `VERIFY_EFFECTS`         |
|     8 | `RECONCILE_AND_CLOSE`    |

No se podrá saltar de detección a ejecución. `INQUIRE_OR_RECONCILE` es obligatoria cuando el resultado sea incierto o dependa de un proveedor.

#### 9. Vocabulario cerrado de outcomes

| Outcome                         |
| ------------------------------- |
| `NOT_REQUIRED`                  |
| `ELIGIBILITY_REJECTED`          |
| `PLANNED`                       |
| `IN_PROGRESS`                   |
| `PARTIALLY_APPLIED`             |
| `COMPLETED`                     |
| `RECONCILIATION_REQUIRED`       |
| `FAILED_INTERVENTION_REQUIRED`  |
| `CANCELLED_BEFORE_FIRST_EFFECT` |
| `SUPERSEDED_BY_NEW_PLAN`        |
| `BLOCKED_IRREVERSIBLE`          |

Interpretación:

- `NOT_REQUIRED`: se demostró que no existe efecto que tratar;
- `ELIGIBILITY_REJECTED`: la acción, autoridad, ventana o clasificación no permiten el plan;
- `PLANNED`: plan versionado y autorizado, todavía sin pasos confirmados;
- `IN_PROGRESS`: al menos un paso inició y no existe cierre;
- `PARTIALLY_APPLIED`: existen efectos compensatorios confirmados y pasos obligatorios pendientes o fallidos;
- `COMPLETED`: todos los pasos obligatorios y verificaciones terminaron, y los residuales aceptados tienen propietario y autoridad;
- `RECONCILIATION_REQUIRED`: el resultado no puede determinarse automáticamente;
- `FAILED_INTERVENTION_REQUIRED`: el plan no puede continuar sin decisión humana;
- `CANCELLED_BEFORE_FIRST_EFFECT`: se detuvo antes de confirmar cualquier paso;
- `SUPERSEDED_BY_NEW_PLAN`: otra versión asumió el trabajo conservando la anterior;
- `BLOCKED_IRREVERSIBLE`: se intentó un tratamiento no permitido para el efecto.

#### 10. Identidad del plan

Todo plan deberá conservar como mínimo:

```text
compensation_plan_id
+ compensation_plan_version
+ process_id
+ ccr_action_id
+ original_effect_ref
+ original_event_id or source_command_id when applicable
+ correlation_id
+ causation_id
+ owner_application
+ reversibility_class
+ trigger_source
+ reason_code
+ requested_by
+ authorized_by
+ scope_and_territory
+ plan_fingerprint
+ outcome
+ residual_obligations
+ evidence_references
+ created_at + authorized_at + closed_at
```

La huella incluirá acción, efecto original, alcance, importes, cantidades, destinatarios, recursos, orden de dependencias y versión contractual. La misma identidad con una huella distinta produce conflicto.

#### 11. Contrato de cada paso

```text
compensation_step_id
+ compensation_plan_id
+ owner_application
+ owner_process_id
+ effect_code
+ original_effect_ref
+ idempotency_scope
+ idempotency_key
+ fingerprint
+ prerequisites
+ expected_effect
+ verification_source
+ authorization_reference
+ attempt_reference
+ outcome
+ residual_if_failed
```

Un paso no podrá:

- escribir un estado o saldo ajeno;
- inventar un efecto original;
- cambiar de propietaria durante reintentos;
- reutilizar la clave para otro importe, cantidad, recurso o destinatario;
- declararse completo por aceptar técnicamente un mensaje;
- ocultar un fallo detrás de un no-op no autorizado.

#### 12. Fuentes permitidas de activación

| Fuente                      | Condición                                                                              |
| --------------------------- | -------------------------------------------------------------------------------------- |
| `PROCESS_CCR_ACTION`        | Acción VPROC-####.CCR-### aprobada por el proceso propietario.                         |
| `RECONCILIATION_DECISION`   | Conciliación demuestra un efecto confirmado que requiere tratamiento.                  |
| `AUTHORIZED_MANUAL_REQUEST` | Actor autorizado solicita tratamiento con causa y evidencia estructuradas.             |
| `EXTERNAL_REVERSAL_RECEIPT` | Proveedor confirma reverso, devolución o contracargo que debe reflejarse internamente. |

`RETRY_EXHAUSTED`, `TIMEOUT`, `CONSUMER_FAILED` y `DEAD_LETTER_CANDIDATE` no son fuentes autónomas de compensación. Solo pueden conducir a indagación, conciliación o decisión autorizada.

#### 13. Dependencias, orden y concurrencia

1. El plan declara un grafo dirigido de pasos.
2. Cada dependencia expresa qué invariante debe quedar verificada antes de continuar.
3. No existe rollback global en orden inverso por defecto.
4. Dos pasos pueden ejecutarse en paralelo únicamente cuando no comparten agregado, saldo, custodia, documento, autorización ni dependencia.
5. Los pasos sobre el mismo agregado usan versión, claim o control equivalente.
6. Un conflicto de concurrencia no se resuelve sobrescribiendo el resultado previo.
7. Un reinicio recupera plan, versión, pasos y resultados durables.
8. Una nueva versión del plan no reutiliza identificadores de pasos con significado distinto.

#### 14. Parcialidad, residuales y cierre

Cuando un plan sea parcial deberá registrar:

- pasos confirmados;
- pasos pendientes;
- pasos fallidos;
- pasos imposibles o irreversibles;
- importes, cantidades o recursos todavía expuestos;
- propietario y fecha de cada residual;
- riesgo y control compensatorio;
- condición de conciliación;
- autoridad que acepta un residual.

`COMPLETED` queda prohibido mientras exista un paso obligatorio sin verificación o un residual sin dueño. Un residual aceptado no equivale a desaparecerlo.

#### 15. Cancelación y sustitución del plan

- antes del primer efecto, el plan puede terminar `CANCELLED_BEFORE_FIRST_EFFECT`;
- después del primer efecto, no puede abandonarse ni borrarse;
- un cambio material crea una versión sucesora;
- la versión sucesora referencia todos los pasos y resultados heredados;
- la versión previa termina `SUPERSEDED_BY_NEW_PLAN` únicamente cuando la nueva asume explícitamente sus pendientes;
- ninguna sustitución reaplica pasos ya confirmados.

#### 16. Autorización y segregación

Cada paso deberá revalidar:

```text
principal técnico
+ actor humano efectivo
+ permiso exacto
+ sede y área
+ turno o check-in cuando aplique
+ recurso y territorio
+ estado y versión
+ sensibilidad
+ segregación requerida
+ vigencia de la decisión
```

Solicitar, aprobar, ejecutar, verificar y cerrar podrán requerir capacidades distintas. La autoridad que aprobó el plan no concede acceso indefinido a todos los datos o efectos involucrados.

#### 17. Frontera entre aplicaciones

| Efecto                                         | Propietaria de ejecución       | Regla                                                                                     |
| ---------------------------------------------- | ------------------------------ | ----------------------------------------------------------------------------------------- |
| cancelación o modificación comercial           | PULSO y `VPROC-0042`           | coordina el caso; no modifica directamente inventario, pago, puntos, producción o entrega |
| retorno, ajuste, custodia o disposición física | NEXO                           | crea movimientos o decisiones nuevas con cantidades y aceptación                          |
| producción, reproceso o calidad                | FOGO con NEXO                  | FOGO decide ejecución y calidad; NEXO registra efectos físicos autorizados                |
| reembolso, caja o efecto financiero            | PULSO y NUMERA según la fuente | crea transacción inversa y conciliación; no edita el pago original                        |
| fidelización                                   | PASS                           | crea movimiento de ledger inverso o compensatorio                                         |
| acceso y sesiones                              | VISO y SHELL                   | revoca autoridad y verifica propagación en consumidores                                   |
| compra, recepción y obligación                 | ORIGO, NEXO y NUMERA           | cada etapa conserva efecto, documento y conciliación propios                              |
| documento, firma, retención o evidencia        | VISO o servicio documental     | crea versión, retractación o mitigación; no borra el original                             |
| asiento, costo, presupuesto o reporte          | NUMERA                         | ajusta o reexpresa sin reescribir el hecho fuente                                         |

#### 18. Fronteras críticas

##### 18.1. ORIGO → NEXO → NUMERA

Cancelar una orden no elimina una recepción ni un pago ya confirmados. Retorno físico, nota comercial, reverso financiero y corrección documental son pasos separados con propietarias distintas.

##### 18.2. FOGO → NEXO → PULSO

Retener o retornar producto no anula receta, ejecución, venta o pago. La calidad puede bloquear disponibilidad; NEXO controla movimiento y PULSO trata el compromiso comercial.

##### 18.3. PULSO → PASS → NUMERA

Reembolso, reverso de puntos y ajuste contable usan identidades y ledgers separados. Ninguno recrea la venta ni comparte una clave universal.

##### 18.4. VISO → ANIMA → SHELL

Corregir asistencia no restaura permisos ni sesiones. Revocar acceso no borra programación, vínculo, marcaciones ni evidencia histórica.

#### 19. Proveedores externos y resultado desconocido

1. Un timeout exige consulta o conciliación antes de compensar.
2. Un recibo de reverso externo se valida y deduplica.
3. Un reembolso interno no se considera completo hasta conciliar proveedor, caja, venta, impuestos y cliente.
4. El adaptador conserva identificadores externos y no cambia importe, destinatario o canal para obtener éxito.
5. Un proveedor que no soporte reverso directo se clasifica `SOLO_COMPENSABLE` o `IRREVERSIBLE` según contrato.
6. Una devolución técnica del proveedor no autoriza escribir directamente en otra aplicación.

#### 20. Operación offline

Una cola offline:

- no crea compensaciones por expiración o conflicto;
- conserva plan, versión, actor, dispositivo, huella y efecto original;
- revalida autoridad y estado al sincronizar;
- no transfiere trabajo a otro actor en dispositivo compartido;
- envía resultados inciertos a conciliación;
- no revive permisos, turnos, sesiones o versiones vencidos;
- no aplica pasos ya confirmados en otro canal.

Los estados detallados de sincronización permanecen reservados para `INT-APP-008`.

#### 21. Efectos no reversibles por defecto

Se tratarán como irreversibles hasta que exista contrato más específico:

- consumo físico ya ocurrido;
- mensaje o notificación entregados;
- documento, firma o evidencia histórica;
- asistencia realmente registrada;
- declaración fiscal o legal presentada;
- decisión sanitaria o de calidad utilizada;
- dato ya consultado o acceso ya ejercido;
- lesión, incidente o hecho económico real.

La respuesta permitida será corrección de representación, comunicación posterior, mitigación, reexpresión o compensación; nunca eliminación ni afirmación de inexistencia.

#### 22. AURA diferida

Las relaciones con AURA mantienen clases, tratamientos y requisitos definidos, pero:

- no crean planes ejecutables;
- no disparan efectos inversos;
- no habilitan colas, workers ni conciliaciones automáticas;
- no publican capacidad operativa;
- no superan `DEFINED_DEFERRED` antes de cobertura, autorización, readiness y paquete E5 aprobados.

#### 23. Decisiones reservadas

| Decisión                                                           | Tarea propietaria                 |
| ------------------------------------------------------------------ | --------------------------------- |
| campos completos de auditoría y trazas                             | `INT-APP-007`                     |
| estados de sincronización y recuperación offline                   | `INT-APP-008`                     |
| error parcial, cuarentena, dead-letter e intervención              | `INT-APP-009`                     |
| comandos inversos y prohibición física de escrituras cruzadas      | `INT-APP-010`                     |
| tablas, constraints, outbox, inbox, plan, steps y migraciones      | BLOQUES E3 y R                    |
| colas, scheduler, workers, circuit breaker y observabilidad física | BLOQUE E4                         |
| SDK, schemas, tipos y canonicalización compartida                  | BLOQUE H                          |
| paquetes, implementación, pruebas, piloto, rollback e hypercare    | BLOQUE E5 y ejecución por paquete |

#### 24. Cambios no autorizados

`INT-APP-006` no autoriza:

- crear tablas, índices, funciones, triggers, RPC, RLS o migraciones;
- implementar saga engine, workflow engine, broker, cola, cron o worker;
- ejecutar devoluciones, reembolsos, revocaciones, ajustes o compensaciones reales;
- modificar las 276 acciones CCR aprobadas;
- cambiar propietarias, eventos, consumidoras, audiencias o permisos;
- tratar retry agotado como compensación;
- borrar o sobrescribir hechos, eventos, movimientos, ledgers, pagos, documentos o auditoría;
- activar AURA;
- iniciar piloto, cutover, producción o hypercare;
- escribir en GitHub.

#### 25. Requisitos de prueba derivados

```text
TREQ-INTEGRATION-168 a TREQ-INTEGRATION-197
```

El detalle completo reside exclusivamente en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` regenerado con esta tarea.

#### 26. Huellas de integridad

```text
COMPENSATION_TREATMENT_REGISTRY_SHA256 = 29f9addfc119a17d5de16cc563b9a1cbc242422e4ca836a9d643b571ef6898fa
COMPENSATION_REVERSIBILITY_MATRIX_SHA256 = 51e11dd3fe9335b12643e9673d0e5afbc54b92f375e037688c753b413df12ef2
COMPENSATION_OUTCOME_VOCABULARY_SHA256 = ae27632687e76c74bc6eebb6058834a594803c445cff1bfdba84799a893a0468
COMPENSATION_POLICY_SHA256 = 631dbac025e700eff30394d63ab4c7d3c5a09059bbc9314c829d5942234f6506
REMOTE_COMMIT_SHA = 9a51cccf27f415b606212f73c2bc5bdda1947bbc
REMOTE_X_BLOCK_BLOB_SHA1 = 977c072fec220b4d15ef1991ef3b2f3821a6e747
REMOTE_04A_BASE_BLOB_SHA1 = 8215544ea9a669e212ade2bb7ea4212ba96ca194
PROC_CCR_SOURCE_BLOB_SHA1 = 55913e1380a83c12f50cfe368c1787c83222473e
```

#### 27. Criterios de aceptación

- [x] `INT-APP-001` a `INT-APP-005` figuran aprobadas en el remoto.
- [x] Se congelaron commit y blobs consumidos.
- [x] Se preservaron los 69 procesos y las 276 acciones CCR.
- [x] Se definieron doce tratamientos, cinco clases de reversibilidad, ocho etapas y once outcomes.
- [x] Se separó retry agotado de compensación.
- [x] Se definieron elegibilidad, identidad, huella, pasos, dependencias, concurrencia y cierre.
- [x] Se preservó propiedad por aplicación y se prohibieron escrituras cruzadas.
- [x] Se cubrieron retorno físico, reembolso, puntos, acceso, producción, documentos, externos y offline.
- [x] Se definieron parcialidad, residuales y sustitución de planes.
- [x] AURA permanece diferida.
- [x] No se autorizó implementación ni efecto operativo.
- [x] Se generaron 30 requisitos completos.

#### 28. Validaciones documentales realizadas

| Control                                      | Resultado                                             |
| -------------------------------------------- | ----------------------------------------------------- |
| Commit remoto leído                          | `9a51cccf27f415b606212f73c2bc5bdda1947bbc`            |
| Blob del mini-bloque X                       | `977c072fec220b4d15ef1991ef3b2f3821a6e747`            |
| Blob 04A remoto base                         | `8215544ea9a669e212ade2bb7ea4212ba96ca194`            |
| Procesos cubiertos                           | **69**                                                |
| Acciones CCR cubiertas                       | **276**                                               |
| Tratamientos cerrados                        | **12**                                                |
| Clases de reversibilidad                     | **5**                                                 |
| Etapas del plan                              | **8**                                                 |
| Outcomes cerrados                            | **11**                                                |
| Requisitos base                              | **4.158**                                             |
| Requisitos nuevos                            | **30**                                                |
| Total regenerado                             | **4.188**                                             |
| Dominio INTEGRATION                          | **197 — TREQ-INTEGRATION-001 a TREQ-INTEGRATION-197** |
| Filas con catorce columnas                   | **4.188 de 4.188**                                    |
| Identificadores duplicados                   | **0**                                                 |
| Relaciones TREQ no resolubles                | **0**                                                 |
| Identificadores históricos preservados       | **4.158**                                             |
| Valores históricos modificados               | **0**                                                 |
| Código, Supabase o integraciones modificados | **no**                                                |

#### 29. Validación real del repositorio

```text
VALIDACIÓN REAL DEL REPOSITORIO PENDIENTE DE EJECUCIÓN LOCAL
```

Comandos requeridos desde la raíz de `vento-shell` después del reemplazo:

```bash
npm run docs:plan:build
npm run docs:plan:check
npm run docs:plan:test
npm run docs:treq:check
npm run docs:treq:test
git diff --check
```

#### 30. Instrucción de reemplazo

1. Reemplazar exactamente `### [ ] INT-APP-006 — Definir compensaciones` por este documento completo.
2. Reemplazar completamente `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` por el archivo regenerado entregado con esta tarea.
3. No copiar, fusionar ni insertar filas `TREQ-*` manualmente.
4. No modificar derivados bajo `.generated/` para forzar continuidad.

#### 31. Continuidad preparada

```text
ÚLTIMA TAREA APROBADA
INT-APP-005 — Definir reintentos
        ↓
TAREA ACTUAL EN REVISIÓN
INT-APP-006 — Definir compensaciones
        ↓
SIGUIENTE TAREA RESERVADA
INT-APP-007 — Definir auditoría transversal
```

APROBADA


### ✅ INT-APP-007 — Definir auditoría transversal

**Estado:** APROBADA
**Fecha de preparación documental:** 2026-07-29
**Bloque propietario:** BLOQUE X — Integraciones empresariales internas y externas
**Marcador exacto que reemplaza:** `### [ ] INT-APP-007 — Definir auditoría transversal`
**Tarea anterior:** `INT-APP-006 — Definir compensaciones` — APROBADA
**Siguiente tarea:** `INT-APP-008 — Definir estados pendientes de sincronización`
**Línea base remota obligatoria:** `devVentoGroup/vento-shell@10cc49d7c1afce61f5d24049b9a1142bdad36e55`
**Tipo de tarea:** definición documental transversal de identidad, cobertura, causalidad, integridad, acceso y fallo de auditoría para comandos, eventos, entregas, efectos, reintentos, conciliaciones y compensaciones; sin implementación, tablas, Supabase, colas, observabilidad física, piloto ni despliegue

#### 1. Objetivo

Definir un contrato único y cerrado de auditoría transversal que permita reconstruir, de extremo a extremo, quién o qué intentó una operación, con qué autoridad y contexto, qué aplicación confirmó el hecho, qué evento se produjo, cómo se emitió y entregó, qué consumidora lo procesó, qué efecto aplicó, qué reintentos, conciliaciones o compensaciones ocurrieron y cuál fue el resultado verificable.

```text
SOLICITUD O MENSAJE
        ↓
AUTORIZACIÓN + COMANDO + COMMIT PROPIETARIO
        ↓
EVENTO + EMISIÓN + ENTREGA POR CONSUMIDORA
        ↓
CLAIM + DEDUPLICACIÓN + EFECTO PROPIO
        ↓
RETRY / CONCILIACIÓN / COMPENSACIÓN
        ↓
LÍNEA TEMPORAL CORRELACIONADA, INMUTABLE Y MINIMIZADA
```

La auditoría no es la fuente de verdad del proceso, no sustituye el evento, no copia el payload completo y no convierte un acuse técnico en resultado empresarial.

#### 2. Fuentes de verdad congeladas

| Fuente                                             | Revisión o blob                            | Responsabilidad                                                                 |
| -------------------------------------------------- | ------------------------------------------ | ------------------------------------------------------------------------------- |
| `vento-shell`                                      | `10cc49d7c1afce61f5d24049b9a1142bdad36e55` | remoto vigente con `INT-APP-006` y 04A integrados; continuidad en `INT-APP-007` |
| `X_INTEGRACIONES/01_EVENTOS_ENTRE_APLICACIONES.md` | `e93402164f0f90ea54794f3ceddaae9ca4c1f559` | contratos `INT-APP-001` a `INT-APP-006` y marcador de esta tarea                |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` | `4d08e1126f729932c843bd0eb1ca33254b59e503` | línea base de 4.188 requisitos hasta `TREQ-INTEGRATION-197`                     |
| `PROC-CAT-018` / `PROC-PROCESS-AUDIT-REGISTRY-001` | `683c2540d88a7c665c8fd05cd6beb0fd74645b4d` | 69 perfiles `VPROC-####.AUDIT`, sobre mínimo, accesos sensibles e integridad    |
| `INT-APP-001` a `INT-APP-003`                      | integrados en el remoto                    | catálogo, productoras, consumidoras y 2.020 relaciones                          |
| `INT-APP-004`                                      | integrado en el remoto                     | scopes, claves, deduplicación, resultados y orden por agregado                  |
| `INT-APP-005`                                      | integrado en el remoto                     | intentos, perfiles, errores, backoff, agotamiento y replay                      |
| `INT-APP-006`                                      | integrado en el remoto                     | planes, pasos, acciones CCR, efectos inversos, residuales y cierre              |

#### 3. Artefacto producido

```text
ENTERPRISE-INTEGRATION-AUDIT-POLICY-001@1.0.0
```

| Propiedad                  | Valor                                     | Regla                                                       |
| -------------------------- | ----------------------------------------- | ----------------------------------------------------------- |
| `policy_id`                | `ENTERPRISE-INTEGRATION-AUDIT-POLICY-001` | identidad estable del contrato transversal                  |
| `policy_version`           | `1.0.0`                                   | primera definición transversal                              |
| `policy_status`            | `DEFINED`                                 | contrato documental; no prueba implementación ni despliegue |
| `covered_processes`        | **69**                                    | `VPROC-0001` a `VPROC-0069`                                 |
| `process_audit_profiles`   | **69**                                    | perfiles heredados de `PROC-CAT-018`                        |
| `normal_event_definitions` | **395**                                   | catálogo de `INT-APP-001`                                   |
| `event_consumer_relations` | **2.020**                                 | relaciones de `INT-APP-003`                                 |
| `audit_planes`             | **14**                                    | cobertura cerrada de extremo a extremo                      |
| `integration_action_types` | **22**                                    | taxonomía cerrada de entradas auditables                    |
| `audit_outcomes`           | **17**                                    | vocabulario cerrado de resultado auditado                   |
| `audit_commit_classes`     | **3**                                     | política proporcional ante fallo de auditoría               |
| `transport_guarantee`      | `AT_LEAST_ONCE`                           | exige deduplicación y auditoría por intento                 |
| `aura_runtime_status`      | `DEFINED_DEFERRED`                        | contrato definido sin actividad operativa                   |

#### 4. Principios normativos

1. La auditoría obligatoria se produce en la frontera confiable, no por decisión de la interfaz.
2. Cada entrada tiene identidad propia y no reutiliza `event_id`, `command_id`, `delivery_id` ni `attempt_id` como clave universal.
3. Principal autenticado, actor efectivo y principal técnico se conservan separadamente.
4. Toda acción sensible o denegación conserva autorización, razones, recurso, contexto y versión.
5. La propietaria audita su hecho; cada consumidora audita únicamente su entrega y efecto.
6. No existe un orden global entre aplicaciones; la causalidad se resuelve por referencias, versiones y vínculos.
7. Un retry crea otro intento auditado, no otra operación empresarial.
8. Un duplicado válido devuelve el resultado anterior y queda distinguido de un efecto nuevo.
9. La auditoría es append-only y una corrección crea otra entrada enlazada.
10. Payloads, secretos y datos sensibles se minimizan mediante referencias, hashes y diferencias.
11. Un `200`, ACK, span, log o publicación no demuestra por sí solo efecto o cierre empresarial.
12. Una falla de auditoría crítica impide presentar éxito y exige contención o conciliación.
13. La auditoría puede verificar métricas, pero no se convierte en una fuente analítica competidora.
14. Esta tarea no selecciona tablas, índices, hash chain, broker, proveedor de observabilidad ni retención física exacta.

#### 5. Planos de auditoría

| Plano                       | Cobertura                                                                                    |
| --------------------------- | -------------------------------------------------------------------------------------------- |
| `COMMAND_AND_AUTHORIZATION` | Recepción, resolución de autorización, aceptación o denegación del comando.                  |
| `OWNER_COMMIT`              | Persistencia del hecho propietario, salida y ancla auditada del resultado.                   |
| `EVENT_RECORDING`           | Creación durable del evento empresarial y vínculo con el hecho fuente.                       |
| `EMISSION`                  | Intentos y confirmación de publicación sin convertir el acuse técnico en cierre empresarial. |
| `DELIVERY`                  | Entrega por consumidora, intento, respuesta y estado independiente.                          |
| `CONSUMER_INBOX`            | Claim, deduplicación, conflicto, stale y recuperación del resultado previo.                  |
| `CONSUMER_EFFECT`           | Inicio, no-op, efecto confirmado, fallo y referencia del resultado propietario.              |
| `RETRY_AND_RECOVERY`        | Clasificación, perfil, presupuesto, programación, resultado desconocido y agotamiento.       |
| `RECONCILIATION`            | Indagación, comparación de fuentes, decisión y residual.                                     |
| `COMPENSATION`              | Plan, versión, acción CCR, pasos, efectos, verificación y cierre.                            |
| `EXTERNAL_ADAPTER`          | Recepción o envío externo, autenticidad, transformación, recibo y respuesta.                 |
| `OFFLINE_SYNC`              | Captura local, actor, dispositivo, reloj, reautorización y sincronización.                   |
| `REPLAY_AND_BACKFILL`       | Solicitud autorizada, lote, procedencia, ventana, elementos y resultados.                    |
| `AUDIT_GOVERNANCE`          | Consulta, exportación, corrección, legal hold, retención e integridad de auditoría.          |

Cada ocurrencia deberá resolver exactamente un plano principal y podrá relacionarse con otros mediante referencias; no se duplicará la misma decisión en varias aplicaciones como si fueran decisiones independientes.

#### 6. Taxonomía cerrada de tipos de acción

| Tipo                                  | Significado mínimo                                                           |
| ------------------------------------- | ---------------------------------------------------------------------------- |
| `REQUEST_RECEIVED`                    | La frontera confiable recibió una solicitud o mensaje identificable.         |
| `AUTHORIZATION_EVALUATED`             | Se resolvieron permiso, contexto, alcance, recurso, versión y razones.       |
| `COMMAND_REJECTED`                    | La operación fue denegada o rechazada antes del efecto.                      |
| `COMMAND_ACCEPTED`                    | La operación fue aceptada para ejecución, sin afirmar todavía commit.        |
| `OWNER_TRANSACTION_COMMITTED`         | La propietaria confirmó el hecho y su resultado durable.                     |
| `EVENT_RECORDED`                      | Se creó la emisión empresarial durable vinculada al hecho.                   |
| `EMISSION_ATTEMPTED`                  | Se intentó publicar el evento.                                               |
| `EMISSION_CONFIRMED`                  | El transporte aceptó la publicación; no prueba consumo ni efecto.            |
| `DELIVERY_ATTEMPTED`                  | Se intentó entregar a una consumidora concreta.                              |
| `DELIVERY_ACKNOWLEDGED`               | La frontera de la consumidora acusó recibo contractual.                      |
| `CONSUMER_CLAIMED`                    | La consumidora obtuvo claim o lease para procesar.                           |
| `DUPLICATE_RESULT_RETURNED`           | Se detectó duplicado y se devolvió el resultado previo o no-op aprobado.     |
| `EFFECT_STARTED`                      | Comenzó un efecto propietario después de deduplicar y autorizar.             |
| `EFFECT_CONFIRMED`                    | La consumidora confirmó su propio efecto y referencia de resultado.          |
| `EFFECT_FAILED`                       | El efecto no quedó confirmado y conserva clasificación y resultado conocido. |
| `RETRY_SCHEDULED`                     | Se programó otro intento dentro del perfil y presupuesto vigente.            |
| `RETRY_EXHAUSTED`                     | Terminó el presupuesto sin fabricar éxito ni compensación.                   |
| `RECONCILIATION_DECIDED`              | Una indagación produjo decisión, residual o intervención.                    |
| `COMPENSATION_STEP_RECORDED`          | Se planificó, ejecutó, verificó o cerró un paso compensatorio.               |
| `EXTERNAL_EXCHANGE_RECORDED`          | Se validó, transformó, envió o recibió un intercambio externo.               |
| `REPLAY_BACKFILL_RECORDED`            | Se registró una instrucción o elemento de replay/backfill autorizado.        |
| `AUDIT_ACCESS_OR_CORRECTION_RECORDED` | Se consultó, exportó o corrigió auditoría mediante una entrada enlazada.     |

Los tipos específicos heredan las clases generales aprobadas por `PROC-CAT-018`, especialmente `COMMAND_ATTEMPTED`, `COMMAND_DENIED`, `BUSINESS_EVENT_RECORDED`, `INTEGRATION_RECEIVED_OR_SENT`, `CCR_APPLIED`, `SENSITIVE_ACCESS` y `AUDIT_CORRECTION`.

#### 7. Vocabulario cerrado de outcomes

| Outcome                     |
| --------------------------- |
| `RECEIVED`                  |
| `AUTHORIZED`                |
| `DENIED`                    |
| `ACCEPTED`                  |
| `COMMITTED`                 |
| `PUBLISHED`                 |
| `DELIVERED`                 |
| `CLAIMED`                   |
| `DUPLICATE_RESULT_RETURNED` |
| `APPLIED`                   |
| `NO_OP`                     |
| `RETRY_SCHEDULED`           |
| `EXHAUSTED`                 |
| `RECONCILIATION_REQUIRED`   |
| `FAILED`                    |
| `DEFERRED`                  |
| `CANCELLED`                 |

Reglas:

- `AUTHORIZED` no equivale a `COMMITTED`;
- `PUBLISHED` no equivale a `DELIVERED`;
- `DELIVERED` no equivale a `APPLIED`;
- `DUPLICATE_RESULT_RETURNED` puede cerrar correctamente un intento sin crear otro efecto;
- `FAILED` debe indicar resultado conocido y clasificación;
- `RECONCILIATION_REQUIRED` conserva incertidumbre explícita;
- `DEFERRED` no puede mostrarse como éxito ni descartarse silenciosamente.

#### 8. Clases de compromiso de auditoría

| Clase                          | Uso                                                                                                                             | Regla ante fallo                                                                                                                  |
| ------------------------------ | ------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| `AUDIT_ATOMIC_REQUIRED`        | decisiones de autorización, commit propietario, efecto financiero, físico, de puntos, acceso, documento, calidad o compensación | el resultado y el ancla auditada deben quedar atómicos o bajo mecanismo reconciliable equivalente; no se presenta éxito sin ancla |
| `AUDIT_DURABLE_BEFORE_ACK`     | entrega, intercambio externo, acceso sensible, exportación y cierre de efecto                                                   | no se confirma al emisor o usuario hasta persistir una entrada durable o una referencia de contención                             |
| `AUDIT_DURABLE_BUFFER_ALLOWED` | enriquecimiento técnico de intentos y trazas no decisorias                                                                      | exige ancla previa, identidad fija, buffer durable y recuperación; una pérdida crea brecha explícita                              |

Ninguna clase permite omitir auditoría. La diferencia es el punto de compromiso y la respuesta segura ante indisponibilidad.

#### 9. Sobre mínimo transversal

```text
audit_entry_id
audit_schema_version
audit_action_type
audit_outcome
process_id
process_instance_id
owner_application
producer_application
consumer_application
source_application
resource_type
resource_id
resource_version
principal_id
effective_actor_id
technical_principal_id
actor_type
actor_capacity
session_id
device_id
simulation_id
site_id
area_id
shift_id
checkin_id
permission_key
authorization_decision
authorization_reason_codes
authorization_policy_version
command_id
request_id
source_command_id
event_definition_id
event_id
delivery_id
attempt_id
effect_id
compensation_plan_id
compensation_step_id
replay_request_id
external_system
external_event_id
idempotency_scope
idempotency_key_reference
fingerprint_reference
correlation_id
causation_id
trace_id
span_id
aggregate_type
aggregate_id
aggregate_version
previous_state
requested_state
resulting_state
result_code
error_class
retry_profile
attempt_number
next_attempt_at
result_reference
output_references
evidence_references
before_reference_or_hash
after_reference_or_hash
changed_fields
payload_hash_reference
occurred_at
recorded_at
completed_at
timezone
source_clock_quality
sensitivity_class
access_scope
retention_class
legal_hold_reference
integrity_reference
```

No todos los campos se materializan en todas las entradas. Los campos no aplicables se omiten mediante contrato; los campos obligatorios por tipo no pueden degradarse a opcionales desde una implementación local.

#### 10. Identidad, causalidad y orden

```text
UNA OPERACIÓN EMPRESARIAL
request_id / source_command_id / idempotency scope
        ↓
UN HECHO PROPIETARIO Y CERO O MÁS EVENTOS
process_instance_id / aggregate_version / event_id
        ↓
CERO O MÁS ENTREGAS INDEPENDIENTES
consumer_application / delivery_id / attempt_id
        ↓
CERO O MÁS EFECTOS PROPIOS
consumer_application / effect_code / effect_id
        ↓
RETRY, CONCILIACIÓN O COMPENSACIÓN VINCULADOS
replay_request_id / compensation_plan_id / compensation_step_id
```

- `audit_entry_id` identifica una ocurrencia de auditoría y nunca se reutiliza;
- `correlation_id` agrupa el caso, pero no autoriza mezclar procesos no relacionados;
- `causation_id` identifica la causa inmediata;
- `aggregate_version` y dependencias resuelven orden aplicable;
- `occurred_at` no reemplaza causalidad ni versión;
- cada aplicación conserva sus entradas y comparte referencias mínimas, no payloads privados.

#### 11. Comando, autorización y commit propietario

1. La solicitud se audita al entrar en la frontera confiable cuando sea sensible o mutante.
2. La autorización registra permiso, recurso, territorio, contexto, versión y razones.
3. La denegación se conserva aunque no exista mutación.
4. `COMMAND_ACCEPTED` solo afirma aceptación para ejecutar.
5. `OWNER_TRANSACTION_COMMITTED` afirma el hecho durable y referencia salida, evento y evidencia.
6. Un resultado perdido se recupera por identidad; no crea otro commit ni otra decisión.
7. La UI no puede fabricar timestamps, actor, decisión de autorización ni resultado final.

#### 12. Evento, emisión y entrega

- `EVENT_RECORDED` enlaza definición, productora, proceso, agregado, versión y hecho fuente;
- cada `EMISSION_ATTEMPTED` usa `attempt_id` propio y conserva el mismo `event_id`;
- `EMISSION_CONFIRMED` acredita aceptación del transporte, no consumo;
- cada consumidora utiliza `delivery_id`, presupuesto y resultado independientes;
- la audiencia histórica no se amplía durante replay sin decisión explícita;
- un error de transporte no modifica el hecho de la productora;
- la auditoría de entrega no copia el contenido protegido del evento.

#### 13. Inbox, deduplicación y efecto consumidor

1. Claim, lease, timeout y recuperación quedan auditados sin afirmar efecto.
2. La misma consumidora y `event_id` devuelven el resultado anterior o no-op aprobado.
3. Una huella incompatible produce conflicto y no aplica efecto.
4. `EFFECT_STARTED` exige autorización vigente, deduplicación y versión aplicable.
5. `EFFECT_CONFIRMED` referencia el resultado de la propietaria.
6. `EFFECT_FAILED` conserva si el efecto no ocurrió, ocurrió parcialmente o permanece incierto.
7. El procesamiento de una consumidora no acredita el de otra.

#### 14. Reintentos, agotamiento y conciliación

Cada intento deberá conservar:

```text
attempt_id
+ attempt_number
+ retry_profile
+ error_class
+ scheduled_at
+ started_at
+ completed_at
+ next_attempt_at
+ outcome
+ budget_reference
+ result_reference
```

- el primer envío es intento uno;
- el retry conserva identidad y huella empresarial;
- `UNKNOWN_OUTCOME` exige indagación antes de reejecución;
- `RETRY_EXHAUSTED` no genera compensación automática;
- una conciliación registra fuentes comparadas, diferencias, decisión, autoridad y residual;
- ninguna entrada retrospectiva se inventa para rellenar una brecha.

#### 15. Compensaciones

La auditoría de `INT-APP-006` deberá enlazar:

```text
compensation_plan_id
+ compensation_plan_version
+ ccr_action_id
+ original_effect_ref
+ reversibility_class
+ compensation_step_id
+ owner_application
+ authorization_reference
+ idempotency_reference
+ attempt_references[]
+ verification_reference
+ residual_obligations[]
+ plan_outcome
```

Un plan `PARTIALLY_APPLIED` conserva los efectos confirmados y pendientes. Una versión sucesora no reinterpreta pasos anteriores. `COMPLETED` requiere verificación y residuales con dueño y autoridad.

#### 16. Integraciones externas

1. El adaptador conserva autenticidad, firma o credencial mediante referencia protegida.
2. El payload original se guarda protegido y la auditoría conserva su hash o referencia.
3. Transformación y mapeo identifican versión, campos descartados y resultado.
4. `external_event_id` o `receipt_id` permanecen estables.
5. Un timeout externo conserva resultado incierto y activa consulta o conciliación.
6. Una respuesta técnica no confirma efecto interno ni cierre financiero.
7. Reversos, reembolsos y contracargos se auditan como operaciones nuevas.

#### 17. Offline, replay y backfill

- offline conserva actor, dispositivo, sesión, momento del hecho, recepción y calidad del reloj;
- al sincronizar se auditan reautorización, versión, conflicto, expiración y resultado;
- una cola no transfiere una operación entre trabajadores de un dispositivo compartido;
- replay conserva `event_id`, audiencia histórica y resultados previos;
- backfill conserva fuente, lote, ventana e `is_backfill`;
- cada elemento registra su resultado, no solo el resumen del lote;
- los efectos sensibles requieren autorización explícita para replay o backfill.

#### 18. Integridad, corrección y brechas

1. La interfaz y los servicios ordinarios no actualizan ni eliminan entradas.
2. La corrección crea `AUDIT_ACCESS_OR_CORRECTION_RECORDED` enlazada a la original.
3. Deben poder detectarse inserciones, modificaciones o eliminaciones no autorizadas; la técnica exacta queda para E3.
4. Una restauración o migración valida conteos, relaciones, orden causal e integridad.
5. Una brecha usa outcome `RECONCILIATION_REQUIRED` y `result_code = AUDIT_GAP_RECONCILIATION_REQUIRED`, con periodo, alcance, causa, riesgo y plan.
6. No se crean entradas falsas para simular cobertura histórica.
7. Un rollback de código no borra la auditoría de efectos ya ocurridos.

#### 19. Minimización y acceso

- secretos, tokens, firmas completas, credenciales, datos bancarios completos, diagnósticos y expedientes no se copian;
- `before` y `after` usan referencias, hashes o diferencias mínimas;
- la consulta de auditoría requiere finalidad, proceso, sensibilidad, territorio y acción;
- soporte técnico ve metadatos mínimos salvo autorización adicional;
- búsquedas, vistas previas sensibles, descargas, impresiones, exportaciones y comparticiones se auditan;
- las exportaciones conservan destinatario, alcance, filtros, finalidad y hash del artefacto;
- crear auditoría no concede permiso para leerla.

#### 20. Tiempo y retención

1. `occurred_at`, `recorded_at` y `completed_at` se conservan separadamente.
2. Intervalos usan reloj monotónico; trazabilidad conserva UTC, zona IANA y calidad del reloj.
3. Una captura tardía no cambia el momento del hecho.
4. Retención y legal hold utilizan clases explícitas sin romper vínculos.
5. Los periodos físicos exactos, particionamiento y disposición quedan reservados para E3, AA y EVID.
6. Vencer un registro técnico no vuelve a habilitar un efecto irreversible ni un retry.

#### 21. Fronteras críticas

##### 21.1. ORIGO → NEXO → NUMERA

Orden, recepción, ingreso físico, obligación y pago conservan auditorías propietarias y handoffs correlacionados. Un acuse comercial no acredita movimiento ni hecho financiero.

##### 21.2. FOGO → NEXO → PULSO

Plan, lote, consumos, calidad, entrada de terminado, disponibilidad, pedido y entrega se auditan como efectos distintos. Retener producto no reescribe producción ni venta.

##### 21.3. PULSO → PASS → NUMERA

Venta, pago, documento, puntos y hecho económico conservan identidades, ledgers y auditorías separadas. Reembolso y reverso de puntos no recrean la venta.

##### 21.4. VISO → ANIMA → SHELL

Programación, asistencia, novedad, autorización, dispositivo, sesión y revocación conservan actor, contexto y causalidad. Corregir asistencia no restaura autoridad.

#### 22. AURA diferida

Las relaciones donde AURA sea productora o consumidora mantienen perfiles y requisitos definidos, pero:

- no crean entradas operativas;
- no habilitan workers ni entregas;
- no conceden consulta de auditoría;
- no ejecutan replay, compensaciones ni conciliaciones automáticas;
- permanecen `DEFINED_DEFERRED` hasta cobertura, autorización, readiness y paquete E5 aprobados.

#### 23. Decisiones reservadas

| Decisión                                                               | Tarea propietaria |
| ---------------------------------------------------------------------- | ----------------- |
| estados de sincronización, pending y recuperación offline              | `INT-APP-008`     |
| error parcial, cuarentena, dead-letter, brechas e intervención         | `INT-APP-009`     |
| prohibición física de escrituras cruzadas y comandos inversos          | `INT-APP-010`     |
| tablas, índices, constraints, particiones, RLS, funciones e integridad | BLOQUES E3 y R    |
| broker, colas, workers, tracing, logging y observabilidad física       | BLOQUE E4         |
| schemas, SDK, tipos, canonicalización y redacción de datos             | BLOQUE H          |
| retención, legal hold, disposición y privacidad                        | BLOQUES AA y EVID |
| implementación, pruebas E2E, piloto, cutover, rollback e hypercare     | BLOQUE E5         |

#### 24. Cambios no autorizados

`INT-APP-007` no autoriza:

- crear tablas, índices, funciones, triggers, RPC, RLS o migraciones;
- seleccionar proveedor de logging, tracing, SIEM, broker o almacenamiento;
- registrar eventos, entregas, efectos o auditorías reales;
- modificar los 69 perfiles de `PROC-CAT-018`;
- cambiar productoras, consumidoras, audiencias, permisos, retries o compensaciones;
- copiar payloads sensibles dentro de auditoría;
- usar auditoría como fuente de estado o motor de integración;
- activar AURA;
- iniciar piloto, cutover, producción o hypercare;
- escribir en GitHub.

#### 25. Requisitos de prueba derivados

```text
TREQ-INTEGRATION-198 a TREQ-INTEGRATION-227
```

El detalle completo reside exclusivamente en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` regenerado con esta tarea.

#### 26. Huellas de integridad

```text
AUDIT_PLANE_REGISTRY_SHA256 = 302a67a62141e5a9ec84c60d55efb7121d0a2a2180c8ddebda76f0431173c4df
AUDIT_ACTION_TYPE_REGISTRY_SHA256 = 4666c89ea1145cdb4d9ae5038c2b01c7c2112137f08e14d82aa59068c6de8e11
AUDIT_OUTCOME_VOCABULARY_SHA256 = d738b4ba20aba1df5fc3554d5c4e3cd9ab485be488a2221de6159769283b17e8
AUDIT_POLICY_SHA256 = 63a076f6886beb19cb6255c769a4ad97543d4b39eddd668205178f05d3ce820a
REMOTE_COMMIT_SHA = 10cc49d7c1afce61f5d24049b9a1142bdad36e55
REMOTE_X_BLOCK_BLOB_SHA1 = e93402164f0f90ea54794f3ceddaae9ca4c1f559
REMOTE_04A_BASE_BLOB_SHA1 = 4d08e1126f729932c843bd0eb1ca33254b59e503
PROC_AUDIT_SOURCE_BLOB_SHA1 = 683c2540d88a7c665c8fd05cd6beb0fd74645b4d
```

#### 27. Criterios de aceptación

- [x] `INT-APP-001` a `INT-APP-006` figuran aprobadas en el remoto.
- [x] Se congelaron commit y blobs consumidos.
- [x] Se preservaron los 69 perfiles de auditoría de proceso.
- [x] Se definieron catorce planos, veintidós tipos, diecisiete outcomes y tres clases de compromiso.
- [x] Se cubrieron comando, autorización, commit, evento, emisión, entrega, inbox y efecto.
- [x] Se cubrieron retry, conciliación, compensación, externos, offline, replay y backfill.
- [x] Se separaron auditoría, evento, evidencia, log, métrica, trace y registro empresarial.
- [x] Se definieron integridad, corrección, minimización, acceso, retención y brechas.
- [x] AURA permanece diferida.
- [x] No se autorizó implementación ni efecto operativo.
- [x] Se generaron 30 requisitos completos.

#### 28. Validaciones documentales realizadas

| Control                                      | Resultado                                             |
| -------------------------------------------- | ----------------------------------------------------- |
| Commit remoto leído                          | `10cc49d7c1afce61f5d24049b9a1142bdad36e55`            |
| Blob del mini-bloque X                       | `e93402164f0f90ea54794f3ceddaae9ca4c1f559`            |
| Blob 04A remoto base                         | `4d08e1126f729932c843bd0eb1ca33254b59e503`            |
| Procesos cubiertos                           | **69**                                                |
| Perfiles de proceso heredados                | **69**                                                |
| Eventos normales cubiertos                   | **395**                                               |
| Relaciones evento-consumidora                | **2.020**                                             |
| Planos de auditoría                          | **14**                                                |
| Tipos de acción                              | **22**                                                |
| Outcomes                                     | **17**                                                |
| Clases de compromiso                         | **3**                                                 |
| Requisitos base                              | **4.188**                                             |
| Requisitos nuevos                            | **30**                                                |
| Total regenerado                             | **4.218**                                             |
| Dominio INTEGRATION                          | **227 — TREQ-INTEGRATION-001 a TREQ-INTEGRATION-227** |
| Filas con catorce columnas                   | **4.218 de 4.218**                                    |
| Identificadores duplicados                   | **0**                                                 |
| Relaciones TREQ no resolubles                | **0**                                                 |
| Identificadores históricos preservados       | **4.188**                                             |
| Valores históricos modificados               | **0**                                                 |
| Código, Supabase o integraciones modificados | **no**                                                |

#### 29. Validación real del repositorio

```text
VALIDACIÓN REAL DEL REPOSITORIO PENDIENTE DE EJECUCIÓN LOCAL
```

Comandos requeridos desde la raíz de `vento-shell` después del reemplazo:

```bash
npm run docs:plan:build
npm run docs:plan:check
npm run docs:plan:test
npm run docs:treq:check
npm run docs:treq:test
git diff --check
```

#### 30. Instrucción de reemplazo

1. Reemplazar exactamente `### [ ] INT-APP-007 — Definir auditoría transversal` por este documento completo.
2. Reemplazar completamente `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` por el archivo regenerado entregado con esta tarea.
3. No copiar, fusionar ni insertar filas `TREQ-*` manualmente.
4. No modificar derivados bajo `.generated/` para forzar continuidad.

#### 31. Continuidad preparada

```text
ÚLTIMA TAREA APROBADA
INT-APP-006 — Definir compensaciones
        ↓
TAREA ACTUAL
INT-APP-007 — Definir auditoría transversal
        ↓
SIGUIENTE TAREA RESERVADA
INT-APP-008 — Definir estados pendientes de sincronización
```

APROBADA


### ✅ INT-APP-008 — Definir estados pendientes de sincronización

**Estado:** APROBADA
**Fecha de preparación documental:** 2026-07-29
**Bloque propietario:** BLOQUE X — Integraciones empresariales internas y externas
**Marcador exacto que reemplaza:** `### [ ] INT-APP-008 — Definir estados pendientes de sincronización`
**Tarea anterior:** `INT-APP-007 — Definir auditoría transversal` — APROBADA
**Siguiente tarea:** `INT-APP-009 — Definir manejo de errores parciales`
**Línea base remota obligatoria:** `devVentoGroup/vento-shell@6bcd35a1584169401aebd533f6bc9281d5b1c38c`
**Tipo de tarea:** definición documental transversal de estados, transiciones, guardas, reautorización, conflicto, incertidumbre, reconciliación y presentación de operaciones locales o remotas pendientes; sin implementación, tablas, outbox, colas, workers, Service Workers, Supabase, piloto ni despliegue

#### 1. Objetivo

Definir una máquina de estados única para toda intención, captura, comando o evidencia que todavía no posea un resultado empresarial autoritativo, de forma que Vento OS pueda conservar el trabajo, sincronizarlo con seguridad, evitar duplicados, explicar su situación al trabajador y detenerse ante conflicto, autoridad vencida o resultado desconocido.

```text
CAPTURA LOCAL
        ↓
ELEGIBILIDAD + DEPENDENCIAS + REAUTORIZACIÓN
        ↓
INTENTO DURABLE
        ↓
RECEIPT TÉCNICO O RESULTADO AUTORITATIVO
        ↓
CONFIRMACIÓN / RETRY SEGURO / CONFLICTO / CONCILIACIÓN
```

Regla central:

```text
GUARDADO EN EL DISPOSITIVO
≠
ENVIADO
≠
RECIBIDO TÉCNICAMENTE
≠
EFECTO EMPRESARIAL CONFIRMADO
```

#### 2. Fuentes de verdad congeladas

| Fuente                                                     | Revisión o blob                            | Responsabilidad                                                                                                  |
| ---------------------------------------------------------- | ------------------------------------------ | ---------------------------------------------------------------------------------------------------------------- |
| `vento-shell`                                              | `6bcd35a1584169401aebd533f6bc9281d5b1c38c` | remoto vigente con `INT-APP-007` y 04A integrados; continuidad en `INT-APP-008`                                  |
| `X_INTEGRACIONES/01_EVENTOS_ENTRE_APLICACIONES.md`         | `aeb432864c630bfde66c95190f8c09444cb891a6` | contratos `INT-APP-001` a `INT-APP-007` y marcador de esta tarea                                                 |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`         | `6c9647d6854d50588cb139c0fd7be9101dcff5ec` | línea base de 4.218 requisitos hasta `TREQ-INTEGRATION-227`                                                      |
| `UX-BASE-013` / `UX-CONNECTIVITY-DEGRADATION-CONTRACT-001` | `24a0118bc968af300d8e3541d0665557b76f1d40` | siete estados de conectividad, siete modos de capacidad, doce estados locales, envelope, conflictos y reconexión |
| `CODE-AUD-018`                                             | `2234bc064cc91e766e4e550fc8c3801d669ec894` | criterios de operación offline durable, revalidación, idempotencia, concurrencia y resultado visible             |
| `UX-STATION-008` a `UX-STATION-012`                        | `72a215e06dc54d64e6818cdc19aaa1490a08f266` | feedback local, pendientes, bandeja, resultado desconocido y componentes offline                                 |
| `INT-APP-004`                                              | integrado en el remoto                     | identidad idempotente, huella, conflicto y replay del resultado previo                                           |
| `INT-APP-005`                                              | integrado en el remoto                     | intentos, perfiles, errores, backoff, agotamiento y resultado desconocido                                        |
| `INT-APP-006`                                              | integrado en el remoto                     | compensaciones, residuales y prohibición de borrar efectos ya ocurridos                                          |
| `INT-APP-007`                                              | integrado en el remoto                     | auditoría de captura, intento, reautorización, conflicto, receipt y resultado                                    |

#### 3. Artefacto producido

```text
ENTERPRISE-SYNC-PENDING-STATE-MACHINE-001@1.0.0
```

| Propiedad                     | Valor                                       | Regla                                         |
| ----------------------------- | ------------------------------------------- | --------------------------------------------- |
| `state_machine_id`            | `ENTERPRISE-SYNC-PENDING-STATE-MACHINE-001` | identidad estable del contrato transversal    |
| `state_machine_version`       | `1.0.0`                                     | primera definición cerrada                    |
| `state_machine_status`        | `DEFINED`                                   | contrato documental; no prueba implementación |
| `covered_processes`           | **69**                                      | `VPROC-0001` a `VPROC-0069`                   |
| `normal_event_definitions`    | **395**                                     | catálogo de `INT-APP-001`                     |
| `event_consumer_relations`    | **2.020**                                   | relaciones de `INT-APP-003`                   |
| `connectivity_states`         | **7**                                       | vector heredado de `UX-BASE-013`              |
| `capability_modes`            | **7**                                       | política por capacidad heredada               |
| `sync_states`                 | **14**                                      | estados cerrados de esta máquina              |
| `allowed_transitions`         | **46**                                      | transiciones dirigidas permitidas             |
| `conflict_classes`            | **10**                                      | vocabulario cerrado heredado                  |
| `conflict_resolution_actions` | **7**                                       | respuestas controladas heredadas              |
| `evidence_states`             | **7**                                       | ciclo independiente de archivos y evidencia   |
| `reconnection_phases`         | **11**                                      | secuencia ordenada de recuperación            |
| `transport_guarantee`         | `AT_LEAST_ONCE`                             | se asume redelivery y pérdida de respuesta    |
| `aura_runtime_status`         | `DEFINED_DEFERRED`                          | contrato definido sin actividad operativa     |

#### 4. Principios normativos

1. Una operación pendiente conserva una sola identidad lógica durante todos sus intentos.
2. Un cambio material crea una sucesora enlazada; no reutiliza identidad ni idempotency key.
3. El estado de sincronización no sustituye conectividad, frescura, estado empresarial, auditoría ni evidencia.
4. Una captura local nunca se presenta como resultado empresarial confirmado.
5. Un receipt técnico nunca se presenta como efecto autoritativo.
6. Todo retry reutiliza operación, huella, actor e idempotency key.
7. `RESULT_UNKNOWN` exige consulta antes de repetir.
8. Un conflicto empresarial no se resuelve mediante `last write wins`.
9. Las dependencias y el orden causal prevalecen sobre prioridad y antigüedad.
10. Una cola de dispositivo compartido no transfiere atribución al siguiente trabajador.
11. Los estados terminales son inmutables; una corrección crea otro hecho enlazado.
12. Un elemento no desaparece de la cola por timeout, cierre de aplicación o cambio de pantalla.
13. La máquina se aplica por elemento; un lote no oculta resultados parciales.
14. `INT-APP-008` define semántica y transiciones, no almacenamiento, scheduler, broker ni worker.

#### 5. Dimensiones ortogonales obligatorias

| Dimensión           | Pregunta que responde                                                  | Fuente                          |
| ------------------- | ---------------------------------------------------------------------- | ------------------------------- |
| conectividad        | ¿La red y el servicio requerido están disponibles?                     | siete estados de `UX-BASE-013`  |
| modo de capacidad   | ¿Esta consulta o mutación puede operar en la condición actual?         | siete modos de `UX-BASE-013`    |
| frescura            | ¿El dato conserva vigencia suficiente para esta decisión?              | seis clases de frescura         |
| sincronización      | ¿Dónde está la intención entre captura local y resultado autoritativo? | catorce estados de esta tarea   |
| proceso empresarial | ¿En qué estado real está el proceso propietario?                       | `PROC-CAT-009` a `PROC-CAT-014` |
| intento y entrega   | ¿Qué ocurrió en este intento técnico concreto?                         | `INT-APP-005` y `INT-APP-007`   |
| evidencia           | ¿El archivo está local, subido y vinculado de forma válida?            | siete estados de evidencia      |
| auditoría           | ¿Qué entrada inmutable demuestra cada transición?                      | `INT-APP-007`                   |

Prohibiciones:

- `ONLINE_HEALTHY` no implica `ACKNOWLEDGED`;
- `OFFLINE_CONFIRMED` no implica `LOCAL_DRAFT` si no existe captura;
- `SYNCING` no implica que el proceso cambió de estado;
- `UPLOADED_UNLINKED` no implica evidencia aceptada;
- `ACKNOWLEDGED` no implica que todos los efectos de un flujo distribuido terminaron;
- `REJECTED_TERMINAL` no podrá ocultar parcialidad o resultado desconocido.

#### 6. Vector de conectividad y modos preservados

Estados de conectividad preservados sin renombre:

```text
ONLINE_HEALTHY
ONLINE_DEGRADED
INTERMITTENT
OFFLINE_CONFIRMED
CONNECTIVITY_UNKNOWN
RECOVERING
SYNC_BLOCKED
```

Modos de capacidad preservados sin renombre:

```text
ONLINE_REQUIRED
ONLINE_PREFERRED
STALE_READ_ONLY
OFFLINE_CAPTURE_ALLOWED
OFFLINE_QUEUE_ALLOWED
MANUAL_CONTINGENCY
NOT_AVAILABLE_OFFLINE
```

La aplicación no tendrá un modo offline global. Cada capacidad declara su modo y cada operación pendiente conserva el modo bajo el cual fue capturada, sin convertirlo en autorización perpetua.

#### 7. Registro cerrado de estados de sincronización

| Estado                    | Categoría                | Entrada semántica                                                                                      | Salida permitida                                                                            | Texto operativo mínimo                                   | Terminal |
| ------------------------- | ------------------------ | ------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------- | -------------------------------------------------------- | -------- |
| `LOCAL_DRAFT`             | `LOCAL_EDITABLE`         | Captura editable y durable solo en el dispositivo; no está elegible para envío.                        | El actor puede completar, descartar o reemplazar el borrador.                               | Guardado en este equipo.                                 | **no**   |
| `READY_TO_SYNC`           | `QUEUED_ELIGIBLE`        | La operación está completa localmente, tiene contrato compatible y puede evaluarse para envío.         | Pasa a dependencia, reautorización, intento, cancelación local o sucesión.                  | Pendiente de sincronizar.                                | **no**   |
| `WAITING_FOR_DEPENDENCY`  | `BLOCKED_AUTOMATIC`      | Existe prerequisito local o remoto aún no confirmado.                                                  | Solo sale por resolución verificable, rechazo terminal, descarte o sucesión.                | Esperando una condición necesaria.                       | **no**   |
| `REAUTH_REQUIRED`         | `BLOCKED_AUTHORITY`      | La autoridad, sesión, turno, check-in, dispositivo o contexto debe resolverse nuevamente.              | La revalidación permite volver a READY_TO_SYNC o produce rechazo, descarte o sucesión.      | Necesita volver a validar acceso.                        | **no**   |
| `SYNCING`                 | `IN_FLIGHT`              | Existe un intento activo con identidad y número de intento durables.                                   | Debe terminar en confirmación, pendiente, rechazo, conflicto, incertidumbre o conciliación. | Enviando.                                                | **no**   |
| `PENDING_CONFIRMATION`    | `IN_FLIGHT_CONFIRMATION` | La frontera técnica recibió o aceptó la operación, pero falta el resultado empresarial autoritativo.   | Consulta receipt o resultado hasta confirmar o clasificar el desenlace.                     | Enviado; esperando confirmación.                         | **no**   |
| `REJECTED_RETRYABLE`      | `RECOVERABLE`            | El intento falló de forma temporal y existe evidencia de que repetir con la misma identidad es seguro. | Vuelve a elegibilidad, espera, reautorización, rechazo terminal o incertidumbre.            | No se pudo enviar todavía; se intentará de forma segura. | **no**   |
| `CONFLICT`                | `INTERVENTION`           | La fuente vigente contradice versión, contexto, autorización, cantidad, custodia u otra precondición.  | Requiere rechazo, sucesora o conciliación; nunca last write wins.                           | Hay cambios que deben revisarse.                         | **no**   |
| `RESULT_UNKNOWN`          | `INTERVENTION`           | No puede afirmarse si el efecto ocurrió, no ocurrió o quedó parcial.                                   | Solo evidencia autoritativa permite confirmar, reintentar, rechazar o conciliar.            | Todavía no podemos confirmar el resultado.               | **no**   |
| `RECONCILIATION_REQUIRED` | `INTERVENTION`           | Deben compararse fuentes digitales, físicas o externas y decidir el resultado.                         | Una decisión autorizada confirma, habilita retry seguro, rechaza o crea sucesora.           | Necesita conciliación.                                   | **no**   |
| `ACKNOWLEDGED`            | `TERMINAL_SUCCESS`       | La propietaria confirmó un resultado empresarial durable o devolvió el resultado previo del duplicado. | No tiene transiciones ordinarias; una corrección crea otro hecho enlazado.                  | Confirmado.                                              | **sí**   |
| `REJECTED_TERMINAL`       | `TERMINAL_NO_EFFECT`     | La operación no es ejecutable y no existe efecto empresarial confirmado.                               | No se reabre; una corrección material crea una operación nueva.                             | No se aplicó.                                            | **sí**   |
| `CANCELLED_LOCAL`         | `TERMINAL_LOCAL`         | El actor descartó la intención antes de transmitirla.                                                  | No se reabre ni se publica.                                                                 | Descartado antes de enviar.                              | **sí**   |
| `SUPERSEDED`              | `TERMINAL_REPLACED`      | Una sucesora explícita reemplazó la intención anterior antes de efecto confirmado.                     | No se ejecuta; conserva referencia a la sucesora.                                           | Reemplazado por una versión posterior.                   | **sí**   |

Los doce estados ya definidos por `UX-BASE-013` se conservan exactamente. `PENDING_CONFIRMATION` y `RESULT_UNKNOWN`, ya aprobados en la gramática de experiencia, se integran para cerrar la separación entre receipt técnico, resultado autoritativo e incertidumbre.

#### 8. Categorías, terminalidad y responsabilidad

| Categoría            | Estados                                                 | Responsable de resolver                              |
| -------------------- | ------------------------------------------------------- | ---------------------------------------------------- |
| `LOCAL_EDITABLE`     | `LOCAL_DRAFT`                                           | actor original dentro de la política local           |
| `QUEUED_ELIGIBLE`    | `READY_TO_SYNC`                                         | planificador local después de validar precondiciones |
| `BLOCKED_AUTOMATIC`  | `WAITING_FOR_DEPENDENCY`                                | hecho de dependencia o rechazo del prerequisito      |
| `BLOCKED_AUTHORITY`  | `REAUTH_REQUIRED`                                       | servidor de autorización y actor atribuible          |
| `IN_FLIGHT`          | `SYNCING`, `PENDING_CONFIRMATION`                       | frontera técnica y aplicación propietaria            |
| `RECOVERABLE`        | `REJECTED_RETRYABLE`                                    | política de retry de `INT-APP-005`                   |
| `INTERVENTION`       | `CONFLICT`, `RESULT_UNKNOWN`, `RECONCILIATION_REQUIRED` | propietaria, conciliador o actor autorizado          |
| `TERMINAL_SUCCESS`   | `ACKNOWLEDGED`                                          | propietaria del resultado empresarial                |
| `TERMINAL_NO_EFFECT` | `REJECTED_TERMINAL`                                     | propietaria o frontera autorizadora                  |
| `TERMINAL_LOCAL`     | `CANCELLED_LOCAL`                                       | actor original antes del primer intento              |
| `TERMINAL_REPLACED`  | `SUPERSEDED`                                            | regla de sucesión y operación sucesora               |

Un estado técnico no cambia por acción visual. Refrescar, cerrar un modal, ocultar una tarjeta o reiniciar el dispositivo no constituye transición.

#### 9. Matriz cerrada de transiciones

| Estado origen             | Destinos permitidos                                                                                                                        | Guarda principal                                                                                        |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------- |
| `LOCAL_DRAFT`             | `READY_TO_SYNC`, `CANCELLED_LOCAL`, `SUPERSEDED`                                                                                           | Validación local, descarte previo al envío o sustitución explícita.                                     |
| `READY_TO_SYNC`           | `WAITING_FOR_DEPENDENCY`, `REAUTH_REQUIRED`, `SYNCING`, `CANCELLED_LOCAL`, `SUPERSEDED`                                                    | Elegibilidad, dependencias y autoridad se recalculan antes del primer intento.                          |
| `WAITING_FOR_DEPENDENCY`  | `READY_TO_SYNC`, `REAUTH_REQUIRED`, `REJECTED_TERMINAL`, `CANCELLED_LOCAL`, `SUPERSEDED`                                                   | Solo un hecho verificable libera la dependencia; un prerequisito terminal bloquea el efecto.            |
| `REAUTH_REQUIRED`         | `READY_TO_SYNC`, `REJECTED_TERMINAL`, `CANCELLED_LOCAL`, `SUPERSEDED`                                                                      | La reautorización no cambia la atribución original ni permite adopción silenciosa por otro actor.       |
| `SYNCING`                 | `PENDING_CONFIRMATION`, `ACKNOWLEDGED`, `REJECTED_RETRYABLE`, `REJECTED_TERMINAL`, `CONFLICT`, `RESULT_UNKNOWN`, `RECONCILIATION_REQUIRED` | Todo intento termina en un estado conocido, incierto o de intervención; nunca desaparece.               |
| `PENDING_CONFIRMATION`    | `ACKNOWLEDGED`, `REJECTED_RETRYABLE`, `REJECTED_TERMINAL`, `CONFLICT`, `RESULT_UNKNOWN`, `RECONCILIATION_REQUIRED`                         | Receipt técnico conocido, pero resultado empresarial todavía no autoritativo.                           |
| `REJECTED_RETRYABLE`      | `READY_TO_SYNC`, `WAITING_FOR_DEPENDENCY`, `REAUTH_REQUIRED`, `REJECTED_TERMINAL`, `RESULT_UNKNOWN`                                        | Reutiliza operación, huella e idempotency key; no crea una intención nueva.                             |
| `CONFLICT`                | `RECONCILIATION_REQUIRED`, `REJECTED_TERMINAL`, `SUPERSEDED`                                                                               | No existe retorno directo a READY_TO_SYNC porque cambiar contenido exige sucesora o corrección.         |
| `RESULT_UNKNOWN`          | `ACKNOWLEDGED`, `READY_TO_SYNC`, `REJECTED_TERMINAL`, `RECONCILIATION_REQUIRED`                                                            | READY_TO_SYNC solo si una consulta autoritativa demuestra que el efecto no ocurrió y repetir es seguro. |
| `RECONCILIATION_REQUIRED` | `ACKNOWLEDGED`, `READY_TO_SYNC`, `REJECTED_TERMINAL`, `SUPERSEDED`                                                                         | La decisión conserva fuentes comparadas, autoridad, residuales y vínculo con la operación.              |
| `ACKNOWLEDGED`            | —                                                                                                                                          | Terminal: resultado autoritativo durable, incluido replay del resultado previo.                         |
| `REJECTED_TERMINAL`       | —                                                                                                                                          | Terminal: rechazo definitivo sin efecto empresarial confirmado.                                         |
| `CANCELLED_LOCAL`         | —                                                                                                                                          | Terminal: descarte anterior a cualquier transmisión o receipt.                                          |
| `SUPERSEDED`              | —                                                                                                                                          | Terminal: existe sucesora explícita; la anterior nunca se ejecuta después.                              |

Cualquier par no enumerado queda prohibido. La implementación posterior deberá fallar cerrada ante un estado desconocido, una transición no versionada o una fila legacy sin mapping explícito.

#### 10. Captura local y descarte previo al envío

`LOCAL_DRAFT` requiere:

```text
local_operation_id
+ actor original
+ dispositivo
+ contexto y área
+ esquema y versión de aplicación
+ payload minimizado
+ momento de captura
+ política de expiración
```

Reglas:

1. El borrador puede modificarse mientras siga local y no haya intento.
2. Pasar a `READY_TO_SYNC` congela la huella lógica enviada a idempotencia.
3. `CANCELLED_LOCAL` exige `attempt_count = 0`, ausencia de receipt y ausencia de efecto.
4. Después del primer intento no existe cancelación local; se usa consulta, comando inverso, corrección o compensación según corresponda.
5. `SUPERSEDED` exige `successor_operation_id` y no elimina la anterior.
6. Un vencimiento local no borra silenciosamente el borrador; aplica retención, aviso y disposición autorizada.

#### 11. Elegibilidad, dependencias y orden causal

Antes de `SYNCING`, `READY_TO_SYNC` deberá comprobar:

```text
payload completo y compatible
+ identidad e idempotency key
+ dependencias conocidas
+ evidencia mínima disponible
+ dispositivo y aplicación compatibles
+ ventana temporal no vencida
+ conectividad y servicio suficientes
+ necesidad de reautorización resuelta
```

Reglas de orden:

- una dependencia pendiente lleva a `WAITING_FOR_DEPENDENCY`;
- un prerequisito terminalmente rechazado no autoriza a ejecutar su dependiente;
- una operación independiente puede avanzar;
- prioridad no rompe causalidad;
- operaciones de actores, dispositivos, contextos o áreas distintos no se fusionan;
- un lote conserva estado y resultado por elemento;
- un elemento `SUPERSEDED` nunca se envía posteriormente.

#### 12. Envío, receipt y confirmación autoritativa

```text
READY_TO_SYNC
        ↓
SYNCING
        ↓
PENDING_CONFIRMATION O RESULTADO CLASIFICADO
        ↓
ACKNOWLEDGED SOLO CON RESULTADO EMPRESARIAL DURABLE
```

`SYNCING` registra `attempt_id`, `attempt_number`, inicio, timeout, perfil y resultado. `PENDING_CONFIRMATION` se utiliza cuando existe recepción o aceptación técnica conocida, pero la propietaria todavía no ha producido un resultado estable.

`ACKNOWLEDGED` exige:

- referencia empresarial estable;
- propietaria del resultado;
- outcome y versión aplicables;
- correlación con operación e intento;
- evidencia de commit o resultado durable;
- indicación de `NEW_EFFECT` o `PRIOR_RESULT_REPLAY`;
- auditoría de la transición.

HTTP `2xx`, publicación en broker, ACK de transporte, upload o respuesta de un adaptador no bastan por sí solos.

#### 13. Retry y rechazo

`REJECTED_RETRYABLE` exige simultáneamente:

1. error clasificado como temporal;
2. perfil vigente de `INT-APP-005`;
3. presupuesto disponible;
4. mismo contenido lógico;
5. misma operación e idempotency key;
6. certeza de que repetir no crea un segundo efecto;
7. próxima ejecución gobernada por dependencia, backoff y reautorización.

`REJECTED_TERMINAL` solo aplica cuando no existe efecto confirmado ni resultado incierto. Un cambio material posterior crea otra operación; no reabre la terminal.

Queda prohibido:

- generar una clave nueva para “reintentar” la misma intención;
- convertir un timeout en rechazo terminal sin consulta;
- usar retry agotado como compensación;
- ocultar error parcial dentro de `REJECTED_TERMINAL`;
- presentar `REJECTED_RETRYABLE` como trabajo perdido.

#### 14. Conflicto, resultado desconocido y conciliación

Clases cerradas de conflicto:

| Clase                       |
| --------------------------- |
| `RESOURCE_VERSION_CONFLICT` |
| `CONTEXT_CHANGED`           |
| `AUTHORIZATION_CHANGED`     |
| `DUPLICATE_OPERATION`       |
| `DEPENDENCY_REJECTED`       |
| `SCHEMA_INCOMPATIBLE`       |
| `BUSINESS_STATE_CHANGED`    |
| `QUANTITY_CONFLICT`         |
| `CUSTODY_CONFLICT`          |
| `TIME_WINDOW_EXPIRED`       |

Acciones de resolución permitidas:

| Acción                   |
| ------------------------ |
| `ACCEPT_SERVER_STATE`    |
| `REAPPLY_ALLOWED_FIELDS` |
| `CREATE_CORRECTION`      |
| `SPLIT_OPERATION`        |
| `ESCALATE`               |
| `DISCARD_LOCAL_DRAFT`    |
| `MANUAL_RECONCILIATION`  |

Reglas:

- `CONFLICT` nunca retorna directamente a `READY_TO_SYNC` con payload modificado;
- `REAPPLY_ALLOWED_FIELDS`, `CREATE_CORRECTION` o `SPLIT_OPERATION` crean una sucesora cuando cambie la intención;
- `RESULT_UNKNOWN` bloquea repetición hasta consultar receipt, propietaria o fuente externa;
- `RESULT_UNKNOWN → READY_TO_SYNC` exige evidencia de que el efecto no ocurrió y retry seguro;
- `RECONCILIATION_REQUIRED` conserva fuentes comparadas, diferencias, autoridad, decisión y residual;
- un hecho físico ya ocurrido no se elimina porque su registro digital haya sido rechazado;
- la taxonomía detallada de parcialidad, cuarentena, dead-letter e intervención pertenece a `INT-APP-009`.

#### 15. Cancelación y sucesión

| Caso                                          | Estado permitido           | Regla                                                                    |
| --------------------------------------------- | -------------------------- | ------------------------------------------------------------------------ |
| borrador nunca enviado que el actor descarta  | `CANCELLED_LOCAL`          | cero intentos, receipts y efectos                                        |
| intención corregida antes de efecto           | `SUPERSEDED`               | sucesora explícita con identidad y huella nuevas cuando cambie contenido |
| operación enviada cuyo resultado no se conoce | `RESULT_UNKNOWN`           | consultar antes de cancelar o repetir                                    |
| efecto confirmado que debe deshacerse         | fuera de cancelación local | comando inverso, corrección o `INT-APP-006`                              |
| operación con efecto parcial                  | fuera de rechazo terminal  | `RECONCILIATION_REQUIRED` y tratamiento de `INT-APP-009`                 |

Una sucesora no hereda automáticamente autorización, receipt, intentos ni resultado de la operación anterior. Solo hereda referencias necesarias y contexto permitido.

#### 16. Envelope conceptual de operación pendiente

Toda operación conservará, cuando aplique:

```text
local_operation_id
idempotency_key
operation_type
process_id
process_instance_id
task_id
resource_type
resource_id
resource_version_observed
actor_id
principal_id
device_id
site_id
area_id
shift_id
checkin_id
permission_code_requested
context_id_observed
context_resolved_at
captured_at_device
captured_at_server_estimate
payload_schema_version
application_version
payload_minimized
evidence_refs
dependency_ids
retry_policy
sync_status
sync_state_version
state_entered_at
attempt_count
last_attempt_at
server_receipt_id
business_result_ref
conflict_ref
reconciliation_ref
successor_operation_id
```

El envelope es conceptual. Esta tarea no autoriza tabla, outbox, inbox, almacenamiento local, índice, constraint, cifrado, formato binario ni tecnología concreta.

#### 17. Identidad, idempotencia e intentos

```text
MISMA INTENCIÓN LÓGICA
+ MISMA HUELLA
=
MISMA OPERACIÓN + MISMA IDEMPOTENCY KEY
```

```text
CAMBIO MATERIAL
=
OPERACIÓN SUCESORA + NUEVA KEY + VÍNCULO EXPLÍCITO
```

Reglas:

1. `attempt_id` cambia por intento; `local_operation_id` e `idempotency_key` permanecen.
2. Un duplicado válido retorna el resultado previo y puede terminar `ACKNOWLEDGED` con `PRIOR_RESULT_REPLAY`.
3. Misma clave con huella diferente termina `CONFLICT` y cero efectos nuevos.
4. Un intento perdido conserva número y estado; no se recrea retroactivamente.
5. La cola no usa timestamp, posición o texto visible como identidad empresarial.
6. Una operación no cambia de propietaria durante reintentos.
7. El historial de intentos se conserva aunque el estado actual sea terminal.

#### 18. Reautorización y dispositivos compartidos

Antes de ejecutar, el servidor revalida:

```text
actor y vínculo
+ sesión o envelope offline
+ turno y check-in
+ dispositivo
+ sede y área
+ permiso y denegaciones
+ recurso y versión
+ ventana y límites
+ versión de política y esquema
```

En dispositivo compartido:

- las colas se aíslan por dispositivo, actor, contexto y área;
- cambiar trabajador detiene nuevas mutaciones del anterior;
- los pendientes conservan actor original;
- el nuevo actor no recibe borradores ni autoridad del anterior;
- takeover exige contrato y auditoría explícitos; no se infiere por iniciar sesión;
- sin identidad offline aprobada, la estación queda en consulta o contingencia;
- una revocación puede conservar la captura como evidencia, pero no obliga a ejecutar el efecto.

#### 19. Reconexión y ciclo de vida

Secuencia obligatoria:

```text
1. STABILIZE_CONNECTIVITY
2. VERIFY_TIME_AND_SERVICES
3. REVALIDATE_SESSION_AND_DEVICE
4. RESOLVE_ACCESS_CONTEXT
5. DOWNLOAD_REVOCATIONS_AND_VERSIONS
6. CLASSIFY_PENDING_OPERATIONS
7. SYNC_BY_DEPENDENCIES
8. QUERY_RECEIPTS
9. STOP_AND_EXPLAIN_CONFLICTS
10. REFRESH_PROJECTIONS
11. CONFIRM_TO_WORKER
```

La cola deberá sobrevivir, según política, recarga, cierre accidental, suspensión, reinicio, cambio de orientación y pérdida breve de energía. No podrá ejecutar en segundo plano sin comprobar actor atribuible, autoridad vigente, dispositivo autorizado, esquema compatible, dependencias satisfechas y operación no cancelada ni sustituida.

Recuperar red no envía toda la cola inmediatamente. La disponibilidad parcial de un servicio no habilita operaciones dependientes de otro servicio todavía indisponible.

#### 20. Tiempo, frescura y evidencia

Se conservan separadamente:

```text
occurred_at
captured_at_device
queued_at
attempt_started_at
receipt_received_at
authoritative_result_at
synchronized_at
```

Cada momento incluye UTC, zona IANA cuando aplique y calidad del reloj. La hora de sincronización no sustituye la hora del hecho observado.

Clases de frescura preservadas:

```text
REAL_TIME_REQUIRED
SHORT_LIVED
SHIFT_SCOPED
DAY_SCOPED
VERSION_SCOPED
REFERENCE_LONG_LIVED
```

Estados de evidencia preservados:

```text
LOCAL_ONLY
QUEUED
UPLOADING
UPLOADED_UNLINKED
LINKED_AND_CONFIRMED
FAILED_RETRYABLE
FAILED_TERMINAL
```

Un archivo puede estar `LINKED_AND_CONFIRMED` mientras la operación siga `PENDING_CONFIRMATION`, o la operación puede quedar `ACKNOWLEDGED` solo si la evidencia obligatoria exigida por el proceso también alcanzó su condición válida.

#### 21. Presentación operativa y fronteras de dominio

La interfaz mostrará, como mínimo:

- significado humano del estado;
- cantidad y antigüedad de pendientes;
- última sincronización y frescura;
- actor y área originales cuando sea seguro mostrarlos;
- qué se conservó;
- qué no se confirmó;
- siguiente acción segura;
- responsable y referencia de escalamiento cuando aplique.

Mapeo mínimo:

| Estado técnico            | Mensaje operativo sugerido                               |
| ------------------------- | -------------------------------------------------------- |
| `LOCAL_DRAFT`             | Guardado en este equipo.                                 |
| `READY_TO_SYNC`           | Pendiente de sincronizar.                                |
| `WAITING_FOR_DEPENDENCY`  | Esperando una condición necesaria.                       |
| `REAUTH_REQUIRED`         | Necesita volver a validar acceso.                        |
| `SYNCING`                 | Enviando.                                                |
| `PENDING_CONFIRMATION`    | Enviado; esperando confirmación.                         |
| `REJECTED_RETRYABLE`      | No se pudo enviar todavía; se intentará de forma segura. |
| `CONFLICT`                | Hay cambios que deben revisarse.                         |
| `RESULT_UNKNOWN`          | Todavía no podemos confirmar el resultado.               |
| `RECONCILIATION_REQUIRED` | Necesita conciliación.                                   |
| `ACKNOWLEDGED`            | Confirmado.                                              |
| `REJECTED_TERMINAL`       | No se aplicó.                                            |
| `CANCELLED_LOCAL`         | Descartado antes de enviar.                              |
| `SUPERSEDED`              | Reemplazado por una versión posterior.                   |

Aplicación por dominio:

- NEXO puede capturar conteos u observaciones locales, pero movimiento y custodia requieren resultado propietario;
- FOGO puede capturar tiempos, temperaturas y cantidades, pero cierre de lote y movimientos exigen sincronización autorizada;
- ORIGO puede capturar recepción física, pero ingreso, diferencias, documento y obligación deben quedar correlacionados;
- PULSO nunca infiere pago por conectividad o receipt de datáfono;
- ANIMA no convierte marcación local en check-in operativo confirmado;
- PASS no confirma canje, consentimiento o efecto financiero desde una cola local;
- VISO y NUMERA permanecen online por defecto para aprobación, ajuste, conciliación, exportación y configuración sensible.

#### 22. AURA diferida

Las relaciones donde AURA sea productora o consumidora conservan estados, transiciones y requisitos definidos, pero:

- no crean colas operativas;
- no ejecutan sincronización, retry ni reconciliación automática;
- no habilitan captura offline ni efectos;
- no generan receipts productivos;
- permanecen `DEFINED_DEFERRED` hasta cobertura, autorización, readiness y paquete E5 aprobados.

#### 23. Decisiones reservadas

| Decisión                                                              | Tarea propietaria               |
| --------------------------------------------------------------------- | ------------------------------- |
| error parcial, cuarentena, dead-letter, brechas e intervención        | `INT-APP-009`                   |
| prohibición física de escrituras cruzadas y comandos inversos         | `INT-APP-010`                   |
| tablas, outbox, inbox, constraints, RLS, funciones y migraciones      | BLOQUES E3 y R                  |
| broker, scheduler, colas, workers, leases y observabilidad física     | BLOQUE E4                       |
| schemas, SDK, tipos, canonicalización y compatibilidad                | BLOQUE H                        |
| cifrado, retención local, legal hold, disposición y privacidad física | BLOQUES AA y EVID               |
| comportamiento final por pantalla y aplicación                        | roadmaps funcionales y BLOQUE I |
| implementación, pruebas E2E, piloto, cutover, rollback e hypercare    | BLOQUE E5                       |

#### 24. Cambios no autorizados

`INT-APP-008` no autoriza:

- crear tablas, índices, constraints, funciones, triggers, RPC, RLS o migraciones;
- implementar outbox, inbox, cola local, Service Worker, scheduler, worker, broker o cron;
- sincronizar datos reales ni ejecutar replays;
- modificar productoras, consumidoras, eventos, permisos, retries o compensaciones;
- activar last write wins;
- transferir pendientes entre actores;
- tratar receipt técnico como resultado empresarial;
- borrar operaciones, intentos, conflictos, evidencia o auditoría;
- activar AURA;
- iniciar piloto, cutover, producción o hypercare;
- escribir en GitHub.

#### 25. Requisitos de prueba derivados

```text
TREQ-INTEGRATION-228 a TREQ-INTEGRATION-257
```

El detalle completo reside exclusivamente en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` regenerado con esta tarea.

#### 26. Huellas de integridad

```text
SYNC_CONNECTIVITY_STATE_REGISTRY_SHA256 = cb8567053cde825a4829c59b3d5c72fdc2cefba388e51481ca259d255f5bc540
SYNC_STATUS_REGISTRY_SHA256 = 272535b1675388cfb17850d40399dc14c6b0c96ec3152f7131caec1ab3ec58c3
SYNC_TRANSITION_MATRIX_SHA256 = a77b8dfbb96c1505fee099600d6a2de7b9d4f2c23d87575849554b7bb448feea
SYNC_POLICY_SHA256 = 9e134a5e1291aebab1d292d775add757eb6ffdb2b1223c0d44022aed9df75bd7
REMOTE_COMMIT_SHA = 6bcd35a1584169401aebd533f6bc9281d5b1c38c
REMOTE_X_BLOCK_BLOB_SHA1 = aeb432864c630bfde66c95190f8c09444cb891a6
REMOTE_04A_BASE_BLOB_SHA1 = 6c9647d6854d50588cb139c0fd7be9101dcff5ec
UX_CONNECTIVITY_SOURCE_BLOB_SHA1 = 24a0118bc968af300d8e3541d0665557b76f1d40
CODE_OFFLINE_AUDIT_SOURCE_BLOB_SHA1 = 2234bc064cc91e766e4e550fc8c3801d669ec894
UX_STATION_SOURCE_BLOB_SHA1 = 72a215e06dc54d64e6818cdc19aaa1490a08f266
```

#### 27. Criterios de aceptación

- [x] `INT-APP-001` a `INT-APP-007` figuran aprobadas en el remoto.
- [x] Se congelaron commit y blobs consumidos.
- [x] Se preservaron sin renombre siete estados de conectividad y siete modos de capacidad.
- [x] Se preservaron los doce estados de `UX-BASE-013` y se integraron `PENDING_CONFIRMATION` y `RESULT_UNKNOWN`.
- [x] Se definieron catorce estados y cuarenta y seis transiciones cerradas.
- [x] Se separaron conectividad, frescura, sincronización, proceso, intento, evidencia y auditoría.
- [x] Se definieron terminalidad, cancelación local, sucesión, retry, conflicto, incertidumbre y conciliación.
- [x] Se preservaron diez conflictos, siete resoluciones, siete estados de evidencia y once fases de reconexión.
- [x] Se definieron reautorización, aislamiento de dispositivos compartidos, causalidad y lotes.
- [x] Se cubrieron NEXO, FOGO, ORIGO, PULSO, ANIMA, PASS, VISO y NUMERA.
- [x] AURA permanece diferida.
- [x] No se autorizó implementación ni efecto operativo.
- [x] Se generaron 30 requisitos completos.

#### 28. Validaciones documentales realizadas

| Control                                      | Resultado                                             |
| -------------------------------------------- | ----------------------------------------------------- |
| Commit remoto leído                          | `6bcd35a1584169401aebd533f6bc9281d5b1c38c`            |
| Blob del mini-bloque X                       | `aeb432864c630bfde66c95190f8c09444cb891a6`            |
| Blob 04A remoto base                         | `6c9647d6854d50588cb139c0fd7be9101dcff5ec`            |
| Procesos cubiertos                           | **69**                                                |
| Eventos normales cubiertos                   | **395**                                               |
| Relaciones evento-consumidora                | **2.020**                                             |
| Estados de conectividad                      | **7**                                                 |
| Modos de capacidad                           | **7**                                                 |
| Estados de sincronización                    | **14**                                                |
| Transiciones permitidas                      | **46**                                                |
| Clases de conflicto                          | **10**                                                |
| Acciones de resolución                       | **7**                                                 |
| Estados de evidencia                         | **7**                                                 |
| Fases de reconexión                          | **11**                                                |
| Requisitos base                              | **4.218**                                             |
| Requisitos nuevos                            | **30**                                                |
| Total regenerado                             | **4.248**                                             |
| Dominio INTEGRATION                          | **257 — TREQ-INTEGRATION-001 a TREQ-INTEGRATION-257** |
| Filas con catorce columnas                   | **4.248 de 4.248**                                    |
| Identificadores duplicados                   | **0**                                                 |
| Relaciones TREQ no resolubles                | **0**                                                 |
| Identificadores históricos preservados       | **4.218**                                             |
| Valores históricos modificados               | **0**                                                 |
| Código, Supabase o integraciones modificados | **no**                                                |

#### 29. Validación real del repositorio

```text
VALIDACIÓN REAL DEL REPOSITORIO PENDIENTE DE EJECUCIÓN LOCAL
```

Comandos requeridos desde la raíz de `vento-shell` después del reemplazo:

```bash
npm run docs:plan:build
npm run docs:plan:check
npm run docs:plan:test
npm run docs:treq:check
npm run docs:treq:test
git diff --check
```

#### 30. Instrucción de reemplazo

1. Reemplazar exactamente `### [ ] INT-APP-008 — Definir estados pendientes de sincronización` por este documento completo.
2. Reemplazar completamente `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` por el archivo regenerado entregado con esta tarea.
3. No copiar, fusionar ni insertar filas `TREQ-*` manualmente.
4. No modificar derivados bajo `.generated/` para forzar continuidad.

#### 31. Continuidad preparada

```text
ÚLTIMA TAREA APROBADA
INT-APP-007 — Definir auditoría transversal
        ↓
TAREA ACTUAL
INT-APP-008 — Definir estados pendientes de sincronización
        ↓
SIGUIENTE TAREA RESERVADA
INT-APP-009 — Definir manejo de errores parciales
```

APROBADA


### ✅ INT-APP-009 — Definir manejo de errores parciales

**Estado:** APROBADA
**Fecha de preparación documental:** 2026-07-29
**Bloque propietario:** BLOQUE X — Integraciones empresariales internas y externas
**Marcador exacto que reemplaza:** `### [ ] INT-APP-009 — Definir manejo de errores parciales`
**Tarea anterior:** `INT-APP-008 — Definir estados pendientes de sincronización` — APROBADA
**Siguiente tarea:** `INT-APP-010 — Evitar escrituras cruzadas sin contrato`
**Línea base remota obligatoria:** `devVentoGroup/vento-shell@8ecac3a8b38e4f6ed73a995d8254158d80acb482`
**Tipo de tarea:** definición documental transversal de detección, clasificación, aislamiento, cuarentena, dead-letter, intervención, conciliación y cierre de errores parciales; sin implementación, tablas, colas, workers, Supabase, reprocesos, piloto ni despliegue

#### 1. Objetivo

Definir un contrato único y cerrado para tratar operaciones, entregas, consumidores, lotes, integraciones externas, sincronizaciones o evidencias que no terminan de manera completamente uniforme, de modo que cada efecto confirmado, rechazado, bloqueado, conflictivo o desconocido permanezca visible, atribuible y resoluble sin declarar éxito global falso, repetir efectos ya ocurridos ni borrar la evidencia del fallo.

```text
OPERACIÓN DISTRIBUIDA O LOTE
        ↓
IDENTIFICAR UNIDADES Y EFECTOS ESPERADOS
        ↓
CLASIFICAR CADA RESULTADO REAL
        ↓
SEPARAR CONFIRMADO / RECHAZADO / BLOQUEADO / DESCONOCIDO
        ↓
RETRY SEGURO / ESPERA / CUARENTENA / DEAD-LETTER / INTERVENCIÓN
        ↓
CONCILIACIÓN + CORRECCIÓN O COMPENSACIÓN + CIERRE TRAZABLE
```

Regla central:

```text
ALGUNOS PASOS EXITOSOS
≠
OPERACIÓN COMPLETAMENTE EXITOSA

FALLO TÉCNICO
≠
AUSENCIA DEMOSTRADA DE EFECTO

DEAD-LETTER
≠
RESULTADO EMPRESARIAL TERMINAL
```

#### 2. Fuentes de verdad congeladas

| Fuente                                                      | Revisión o blob                            | Responsabilidad                                                                  |
| ----------------------------------------------------------- | ------------------------------------------ | -------------------------------------------------------------------------------- |
| `vento-shell`                                               | `8ecac3a8b38e4f6ed73a995d8254158d80acb482` | remoto vigente con `INT-APP-008` y 04A integrados; continuidad en `INT-APP-009`  |
| `X_INTEGRACIONES/01_EVENTOS_ENTRE_APLICACIONES.md`          | `1dbbd74b08d511a9ba94dc6384188399274a20fc` | contratos `INT-APP-001` a `INT-APP-008` y marcador de esta tarea                 |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`          | `6d276b2a62d70263da69200b9e19b8c00f0be1f8` | línea base de 4.248 requisitos hasta `TREQ-INTEGRATION-257`                      |
| `INT-APP-005` / `ENTERPRISE-EVENT-RETRY-POLICY-001`         | integrado en el remoto                     | doce clases de error, agotamiento, intervención y candidato a dead-letter        |
| `INT-APP-006` / `ENTERPRISE-EVENT-COMPENSATION-POLICY-001`  | integrado en el remoto                     | efectos confirmados, parcialidad, residuales y compensación por propietaria      |
| `INT-APP-007` / `ENTERPRISE-INTEGRATION-AUDIT-POLICY-001`   | integrado en el remoto                     | evidencia inmutable de clasificación, intento, decisión, corrección y brecha     |
| `INT-APP-008` / `ENTERPRISE-SYNC-PENDING-STATE-MACHINE-001` | integrado en el remoto                     | catorce estados, resultado desconocido, conflicto, conciliación y terminalidad   |
| `UX-BASE-013` / `UX-CONNECTIVITY-DEGRADATION-CONTRACT-001`  | `24a0118bc968af300d8e3541d0665557b76f1d40` | operación degradada, colas, conflictos, evidencia, reconexión y mensajes humanos |
| `CODE-AUD-018`                                              | `2234bc064cc91e766e4e550fc8c3801d669ec894` | brechas reales de offline, reintentos, concurrencia, atomicidad e idempotencia   |

#### 3. Artefacto producido

```text
ENTERPRISE-PARTIAL-ERROR-HANDLING-POLICY-001@1.0.0
```

| Propiedad                       | Valor                                          | Regla                                             |
| ------------------------------- | ---------------------------------------------- | ------------------------------------------------- |
| `policy_id`                     | `ENTERPRISE-PARTIAL-ERROR-HANDLING-POLICY-001` | identidad estable del contrato transversal        |
| `policy_version`                | `1.0.0`                                        | primera definición cerrada                        |
| `policy_status`                 | `DEFINED`                                      | contrato documental; no prueba implementación     |
| `covered_processes`             | **69**                                         | `VPROC-0001` a `VPROC-0069`                       |
| `normal_event_definitions`      | **395**                                        | catálogo de `INT-APP-001`                         |
| `event_consumer_relations`      | **2.020**                                      | relaciones de `INT-APP-003`                       |
| `inherited_sync_states`         | **14**                                         | máquina de `INT-APP-008` sin renombre             |
| `inherited_sync_transitions`    | **46**                                         | matriz de `INT-APP-008` sin alteración            |
| `inherited_retry_profiles`      | **8**                                          | perfiles de `INT-APP-005` sin alteración          |
| `inherited_retry_error_classes` | **12**                                         | taxonomía de `INT-APP-005` sin renombre           |
| `failure_scopes`                | **8**                                          | fronteras donde se clasifica el fallo             |
| `partiality_classes`            | **9**                                          | formas cerradas de parcialidad o incertidumbre    |
| `dispositions`                  | **12**                                         | tratamientos permitidos                           |
| `quarantine_reasons`            | **8**                                          | causas cerradas de aislamiento                    |
| `dead_letter_gates`             | **7**                                          | condiciones acumulativas de elegibilidad          |
| `manual_actions`                | **10**                                         | acciones humanas permitidas y auditables          |
| `closure_outcomes`              | **8**                                          | cierres explícitos; no existe cierre desconocido  |
| `transport_guarantee`           | `AT_LEAST_ONCE`                                | redelivery y pérdida de respuesta siguen posibles |
| `aura_runtime_status`           | `DEFINED_DEFERRED`                             | contrato definido sin operación activa            |

#### 4. Principios normativos

1. El resultado se clasifica por unidad, efecto, consumidora o elemento; nunca solo por el resumen global.
2. Un fallo técnico no demuestra que el efecto empresarial no ocurrió.
3. Un efecto confirmado no se deshace, repite ni oculta porque otro efecto haya fallado.
4. `REJECTED_TERMINAL` solo representa ausencia demostrada de efecto para esa unidad exacta.
5. `RESULT_UNKNOWN` y `RECONCILIATION_REQUIRED` no pueden cerrarse como fracaso seguro.
6. Retry, cuarentena, dead-letter, intervención, conciliación y compensación son conceptos distintos.
7. Cuarentena y dead-letter son disposiciones operativas; no sustituyen el estado empresarial.
8. Un lote conserva resultados individuales y puede continuar únicamente con unidades independientes.
9. Ninguna corrección manual se realiza editando silenciosamente una fuente de verdad.
10. Todo pendiente tiene propietaria, responsable, siguiente acción, vencimiento o condición de reactivación.
11. Una operación no puede cerrarse mientras exista efecto desconocido o residual sin dueño.
12. La interfaz no reduce una parcialidad a `Error`, `Falló` o `Listo` sin explicar qué ocurrió.
13. El aislamiento no autoriza exposición de payload sensible ni traslado a una cola menos protegida.
14. Esta tarea define semántica y gobierno; no selecciona broker, cola, almacenamiento ni herramienta.

#### 5. Dimensiones ortogonales obligatorias

| Dimensión        | Pregunta que responde                                         | Fuente o regla                       |
| ---------------- | ------------------------------------------------------------- | ------------------------------------ |
| alcance de fallo | ¿En qué frontera ocurrió el problema?                         | ocho alcances de esta tarea          |
| parcialidad      | ¿Qué proporción y certeza tienen los efectos?                 | nueve clases cerradas                |
| sincronización   | ¿Dónde está la intención respecto del resultado autoritativo? | catorce estados de `INT-APP-008`     |
| retry            | ¿Es seguro repetir la misma operación?                        | `INT-APP-005`                        |
| reversibilidad   | ¿Qué efecto confirmado admite corrección o compensación?      | `INT-APP-006`                        |
| confianza        | ¿El contenido puede seguir siendo procesado?                  | cuarentena y controles de integridad |
| intervención     | ¿Qué decisión humana exacta falta?                            | diez acciones permitidas             |
| cierre           | ¿Qué resultado verificable terminó el caso?                   | ocho outcomes cerrados               |

Prohibiciones:

- `EXHAUSTED` no implica `DEAD_LETTER_CANDIDATE` sin cumplir sus puertas;
- `QUARANTINE` no implica que el efecto no ocurrió;
- `ACKNOWLEDGED` de una unidad no confirma las demás;
- `REJECTED_TERMINAL` de una consumidora no revierte el evento propietario;
- `RESOLVED_WITH_ACCEPTED_RESIDUAL` no elimina el residual ni su dueño;
- `RESOLVED` nunca se infiere por antigüedad, ocultamiento o eliminación de la fila.

#### 6. Alcances cerrados de fallo

| Alcance               |
| --------------------- |
| `REQUEST_OR_COMMAND`  |
| `OWNER_TRANSACTION`   |
| `EVENT_EMISSION`      |
| `DELIVERY`            |
| `CONSUMER_EFFECT`     |
| `BATCH_OR_BULK_ITEM`  |
| `EXTERNAL_EXCHANGE`   |
| `OFFLINE_OR_EVIDENCE` |

| Alcance               | Unidad mínima de clasificación                             |
| --------------------- | ---------------------------------------------------------- |
| `REQUEST_OR_COMMAND`  | una intención idempotente y su aceptación propietaria      |
| `OWNER_TRANSACTION`   | cada efecto indivisible dentro de la frontera propietaria  |
| `EVENT_EMISSION`      | registro del evento y publicación de la emisión concreta   |
| `DELIVERY`            | una relación evento-consumidora y su entrega independiente |
| `CONSUMER_EFFECT`     | un efecto propio de una consumidora después del claim      |
| `BATCH_OR_BULK_ITEM`  | cada elemento y dependencia del lote o acción masiva       |
| `EXTERNAL_EXCHANGE`   | solicitud, receipt y efecto confirmado por el tercero      |
| `OFFLINE_OR_EVIDENCE` | operación local, archivo, periférico o soporte asociado    |

Una ocurrencia puede involucrar varios alcances, pero cada registro de parcialidad deberá identificar uno como origen y enlazar los demás sin fusionar identidades.

#### 7. Clases cerradas de parcialidad

| Clase                             | Significado mínimo                                                                |
| --------------------------------- | --------------------------------------------------------------------------------- |
| `NO_EFFECT_CONFIRMED`             | ninguna unidad posee efecto empresarial confirmado y el no-efecto está demostrado |
| `SOME_EFFECTS_CONFIRMED`          | al menos un efecto ocurrió y al menos otro quedó rechazado, bloqueado o pendiente |
| `SOME_EFFECTS_UNKNOWN`            | existen efectos conocidos y al menos uno cuyo resultado no puede determinarse     |
| `ALL_EFFECTS_UNKNOWN`             | no puede confirmarse ni descartarse ningún efecto esperado                        |
| `DEPENDENCY_INCOMPLETE`           | una unidad no puede avanzar porque falta un prerequisito real                     |
| `CONFLICTING_RESULTS`             | fuentes autoritativas o efectos reportan resultados incompatibles                 |
| `UNTRUSTED_OR_TAMPERED_INPUT`     | autenticidad, integridad o procedencia no son confiables                          |
| `CONTRACT_OR_SCHEMA_INCOMPATIBLE` | versión, contrato o esquema impiden interpretar con seguridad                     |
| `EXTERNAL_STATE_DIVERGENCE`       | el tercero y la fuente interna conservan estados materialmente distintos          |

`SOME_EFFECTS_CONFIRMED`, `SOME_EFFECTS_UNKNOWN` y `ALL_EFFECTS_UNKNOWN` no podrán convertirse en `NO_EFFECT_CONFIRMED` por timeout, agotamiento o ausencia de logs.

#### 8. Manifiesto obligatorio por unidad y efecto

Toda operación distribuida o lote deberá poder resolver, cuando aplique:

```text
partial_error_id
+ operation_id
+ process_id
+ process_instance_id
+ owner_application
+ failure_scope
+ event_id / delivery_id / consumer_application
+ batch_id / item_id
+ effect_manifest_version
+ expected_effects[]
+ confirmed_effects[]
+ rejected_effects[]
+ blocked_effects[]
+ unknown_effects[]
+ conflicting_effects[]
+ partiality_class
+ sync_state
+ retry_error_class
+ disposition
+ quarantine_reason
+ dead_letter_gate_results[]
+ responsible_owner
+ next_action
+ due_at_or_reactivation_condition
+ authorization_reference
+ audit_reference
+ reconciliation_reference
+ compensation_reference
+ residual_obligations[]
+ closure_outcome
```

El manifiesto describe resultados; no duplica las fuentes propietarias. Cada efecto utiliza referencia estable, estado, certeza, momento y evidencia mínima.

#### 9. Secuencia obligatoria de clasificación

```text
1. AISLAR LA UNIDAD EXACTA
2. CONGELAR IDENTIDAD, HUELLA Y EVIDENCIA DISPONIBLE
3. CONSULTAR PROPIETARIA, RECEIPTS Y RESULTADOS PREVIOS
4. ENUMERAR EFECTOS ESPERADOS
5. CLASIFICAR CADA EFECTO COMO CONFIRMADO, RECHAZADO, BLOQUEADO, CONFLICTIVO O DESCONOCIDO
6. DETERMINAR DEPENDENCIAS Y UNIDADES INDEPENDIENTES
7. EVALUAR RETRY, AUTORIDAD, CONTRATO Y REVERSIBILIDAD
8. ELEGIR UNA DISPOSICIÓN PERMITIDA
9. ASIGNAR PROPIETARIA, RESPONSABLE Y SIGUIENTE ACCIÓN
10. AUDITAR LA DECISIÓN Y SU CIERRE
```

La clasificación falla cerrada cuando falta una unidad, efecto esperado, propietaria, identidad, evidencia o contrato necesario.

#### 10. Disposiciones permitidas

| Disposición                      | Condición principal                                                                    |
| -------------------------------- | -------------------------------------------------------------------------------------- |
| `RETRY_SAME_OPERATION`           | está demostrado que repetir con la misma identidad es seguro                           |
| `WAIT_FOR_DEPENDENCY`            | existe prerequisito real no terminal y una condición de reactivación                   |
| `QUERY_AUTHORITATIVE_RESULT`     | el resultado puede recuperarse por clave, receipt o propietaria                        |
| `RECONCILE`                      | deben compararse fuentes, efectos físicos, externos o financieros                      |
| `QUARANTINE`                     | el elemento no puede permanecer en procesamiento normal por confianza o compatibilidad |
| `DEAD_LETTER_CANDIDATE`          | la automatización terminó y se cumplen las siete puertas acumulativas                  |
| `MANUAL_INTERVENTION_REQUIRED`   | falta una decisión humana concreta y autorizada                                        |
| `PERMANENTLY_REJECT`             | no existe efecto confirmado y el contrato impide continuar                             |
| `COMPENSATE_CONFIRMED_EFFECTS`   | hay efectos confirmados elegibles bajo `INT-APP-006`                                   |
| `CREATE_CORRECTION_OR_SUCCESSOR` | el contenido debe cambiar sin reescribir la intención histórica                        |
| `CONTINUE_INDEPENDENT_UNITS`     | otras unidades no dependen del fallo y conservan autorización                          |
| `BLOCK_DEPENDENT_UNITS`          | continuar violaría causalidad, integridad, custodia o cierre                           |

Una clasificación puede producir varias disposiciones complementarias por unidad, pero no dos acciones incompatibles sobre el mismo efecto.

#### 11. Retry, agotamiento y rechazo

- `RETRY_SAME_OPERATION` conserva operación, clave, huella, propietaria y contenido lógico;
- un cambio material exige `CREATE_CORRECTION_OR_SUCCESSOR`;
- `UNKNOWN_OUTCOME` exige `QUERY_AUTHORITATIVE_RESULT` o `RECONCILE` antes del retry;
- agotar intentos permite evaluar intervención o dead-letter, pero no demuestra fracaso empresarial;
- un error permanente solo termina `PERMANENTLY_REJECT` cuando no existe efecto confirmado ni incertidumbre;
- una unidad fallida no reinicia presupuestos de unidades ya confirmadas;
- el reproceso desde cuarentena o dead-letter no crea una clave nueva para la misma intención;
- un retry manual requiere autorización, razón, alcance, evidencia y auditoría.

#### 12. Resultado desconocido y parcialidad incierta

```text
TIMEOUT, PÉRDIDA DE RESPUESTA O INTERRUPCIÓN
        ↓
¿EXISTE POSIBILIDAD DE EFECTO?
        ├── NO DEMOSTRADO → NO CLASIFICAR COMO RECHAZO
        └── SÍ O INCIERTO → QUERY_AUTHORITATIVE_RESULT
                                  ↓
                 CONFIRMADO / NO APLICADO / TODAVÍA INDETERMINADO
```

- `SOME_EFFECTS_UNKNOWN` y `ALL_EFFECTS_UNKNOWN` bloquean acciones incompatibles;
- no se repiten pagos, inventario, puntos, custodia, entrega, impresión, documento o notificación sin indagación;
- si el no-efecto queda demostrado, la unidad puede volver a retry seguro;
- si el efecto queda confirmado, se recupera el resultado y se evalúan efectos faltantes;
- si continúa indeterminado, pasa a `RECONCILE` o intervención;
- ningún caso puede cerrar con outcome `UNKNOWN`.

#### 13. Dependencias, orden causal y continuidad segura

1. Una unidad confirmada conserva su resultado aunque una dependiente falle.
2. Una unidad independiente puede continuar mediante `CONTINUE_INDEPENDENT_UNITS`.
3. Una unidad dependiente usa `BLOCK_DEPENDENT_UNITS` hasta que exista condición verificable.
4. Un prerequisito permanentemente rechazado no se inventa ni se salta.
5. Prioridad, urgencia o presión operativa no rompen causalidad.
6. Un evento fuera de orden espera su versión o termina en conciliación; nunca sobrescribe.
7. Un cambio de propietaria, área, actor o consumidor no se usa para eludir el bloqueo.
8. Un cierre global requiere que cada unidad sea terminal o conserve una excepción abierta con dueño.

#### 14. Lotes, acciones masivas y múltiples consumidoras

- cada elemento de lote conserva identidad, estado, intentos, efecto y evidencia propios;
- el resumen deriva de los elementos y no reemplaza sus resultados;
- se muestran cantidades confirmadas, rechazadas, bloqueadas, desconocidas, en cuarentena y pendientes de intervención;
- una consumidora exitosa no confirma ni cancela el presupuesto de otra;
- una entrega fallida no recrea el evento propietario;
- la atomicidad global solo existe cuando un contrato explícito la garantiza;
- un lote parcialmente aplicado no se presenta como `completado con advertencias` sin residual, dueño y acción;
- replay y backfill se autorizan y clasifican por elemento, no por el botón de lote.

#### 15. Cuarentena

Causas permitidas:

| Razón de cuarentena                   |
| ------------------------------------- |
| `UNTRUSTED_SIGNATURE_OR_AUTHENTICITY` |
| `SCHEMA_OR_VERSION_UNSUPPORTED`       |
| `PAYLOAD_INTEGRITY_FAILED`            |
| `IDENTITY_OR_ROUTING_AMBIGUOUS`       |
| `SENSITIVITY_OR_POLICY_VIOLATION`     |
| `REPEATED_POISON_MESSAGE`             |
| `EVIDENCE_LINKAGE_INVALID`            |
| `MANUAL_HOLD_FOR_INVESTIGATION`       |

Reglas:

1. Cuarentena retira el elemento del procesamiento ordinario sin cambiar su resultado empresarial.
2. Conserva identidad, contenido original o referencia protegida, hash, procedencia, sensibilidad, intentos y evidencia.
3. No se usa para red temporal, rate limit, espera normal de dependencia ni rechazo empresarial ordinario.
4. Un elemento en cuarentena no se reprocesa automáticamente.
5. Liberar exige resolver la causa, autorizar la acción y conservar versión o mapping aplicable.
6. Si el contenido cambia materialmente, se crea una sucesora y la original permanece aislada.
7. Acceso, exportación y revisión de cuarentena respetan finalidad, territorio y sensibilidad.
8. Eliminar la fila para reducir un contador queda prohibido.

#### 16. Candidato a dead-letter

Puertas acumulativas:

| Puerta                                               |
| ---------------------------------------------------- |
| `AUTOMATION_BUDGET_CLOSED`                           |
| `ITEM_ISOLATED`                                      |
| `IDENTITY_AND_CONTENT_PRESERVED`                     |
| `BUSINESS_OUTCOME_CLASSIFIED_OR_RECONCILIATION_OPEN` |
| `OWNER_AND_NEXT_ACTION_ASSIGNED`                     |
| `REPROCESSING_REQUIRES_AUTHORIZATION`                |
| `RETENTION_AND_AUDIT_DEFINED`                        |

Diferencia normativa:

```text
CUARENTENA
→ CONFIANZA, INTEGRIDAD O COMPATIBILIDAD IMPIDEN PROCESAR

DEAD_LETTER_CANDIDATE
→ LA AUTOMATIZACIÓN YA NO PUEDE CONTINUAR Y REQUIERE DISPOSICIÓN CONTROLADA
```

Reglas:

- `DEAD_LETTER_CANDIDATE` no es un estado empresarial ni outcome de éxito o fracaso;
- no puede utilizarse para ocultar `RESULT_UNKNOWN` sin conciliación abierta;
- no autoriza reescribir payload, route, destinatario, importe, cantidad o efecto;
- el reproceso reutiliza identidad si la intención no cambió;
- una corrección material crea una sucesora;
- cada candidato tiene propietaria, responsable, edad, prioridad, siguiente acción y política de retención;
- borrar o archivar el elemento no cierra el caso ni sus residuales.

#### 17. Intervención manual

Acciones permitidas:

| Acción manual                |
| ---------------------------- |
| `RETRY_AUTHORIZED`           |
| `QUERY_RECEIPT`              |
| `CORRECT_METADATA`           |
| `CREATE_SUCCESSOR`           |
| `RELINK_EVIDENCE`            |
| `REPROCESS_FROM_QUARANTINE`  |
| `REPROCESS_FROM_DEAD_LETTER` |
| `PERMANENT_REJECT`           |
| `START_RECONCILIATION`       |
| `START_COMPENSATION`         |

Toda intervención deberá registrar:

```text
actor autorizado
+ permiso y step-up cuando aplique
+ finalidad y motivo estructurado
+ unidad y efectos exactos
+ evidencia consultada
+ acción seleccionada
+ parámetros permitidos
+ resultado anterior y posterior
+ segregación requerida
+ audit_reference
+ residual y siguiente responsable
```

No se permite `editar la base`, `marcar como resuelto`, `forzar éxito` o `eliminar de la cola` como acciones genéricas. La interfaz solo ofrecerá acciones compatibles con la clasificación y la propietaria.

#### 18. Conciliación y cierre

La conciliación deberá comparar, según aplique:

- fuente propietaria;
- event, outbox, delivery e inbox;
- idempotency result y receipts;
- estado del proveedor externo;
- movimientos físicos, financieros, de puntos o custodia;
- evidencia y documentos;
- observación local y contingencia manual;
- auditoría y versiones.

Outcomes de cierre permitidos:

| Outcome de cierre                 |
| --------------------------------- |
| `RESOLVED_CONFIRMED`              |
| `RESOLVED_NO_EFFECT`              |
| `RESOLVED_DUPLICATE_PRIOR_RESULT` |
| `RESOLVED_CORRECTED`              |
| `RESOLVED_COMPENSATED`            |
| `RESOLVED_WITH_ACCEPTED_RESIDUAL` |
| `PERMANENTLY_REJECTED`            |
| `SUPERSEDED_BY_SUCCESSOR`         |

`RESOLVED_WITH_ACCEPTED_RESIDUAL` exige residual explícito, propietaria, responsable, riesgo, control compensatorio, autoridad y fecha. No existe `CLOSED_UNKNOWN`, `AUTO_RESOLVED_BY_AGE` ni `DISMISSED_WITHOUT_EVIDENCE`.

#### 19. Corrección, sucesión y compensación

| Situación                                                        | Tratamiento permitido                               |
| ---------------------------------------------------------------- | --------------------------------------------------- |
| no ocurrió ningún efecto y el contenido era inválido             | `PERMANENTLY_REJECT` o sucesora corregida           |
| efecto confirmado correcto pero faltan efectos dependientes      | continuar, conciliar o intervenir por unidad        |
| efecto confirmado incorrecto pero reversible                     | plan de `INT-APP-006`                               |
| efecto confirmado irreversible                                   | corrección de representación, mitigación o residual |
| metadata o evidencia relinkable sin cambiar intención            | acción manual autorizada y auditada                 |
| cambio de cantidad, importe, recurso, destinatario o significado | nueva operación sucesora                            |

Solo se compensan efectos confirmados. Nunca se compensa una mera posibilidad sin primero resolver la certeza, y nunca se corrige sobrescribiendo el hecho original.

#### 20. Externos, offline, archivos y dispositivos compartidos

- un receipt técnico externo no confirma el efecto económico, físico o comercial;
- divergencia entre proveedor y fuente interna usa `EXTERNAL_STATE_DIVERGENCE`;
- webhooks repetidos se deduplican antes de clasificar parcialidad;
- una operación offline conserva actor, dispositivo, contexto, área, versión, identidad y evidencia originales;
- cambiar de trabajador no transfiere pendientes, cuarentena ni decisiones;
- una captura local revocada puede conservarse como evidencia, pero no obliga a ejecutar el efecto;
- uploads y archivos se clasifican por elemento; `UPLOADED_UNLINKED` no satisface evidencia obligatoria;
- un periférico puede fallar después del efecto empresarial y requiere receipt o conciliación independiente;
- contingencias físicas se digitalizan y concilian sin inventar hora, actor ni resultado.

#### 21. Presentación operativa, observabilidad y guardrails

La interfaz deberá responder:

```text
QUÉ UNIDADES SE CONFIRMARON
QUÉ UNIDADES NO SE APLICARON
QUÉ RESULTADOS SIGUEN DESCONOCIDOS
QUÉ SE CONSERVÓ
QUÉ ESTÁ AISLADO
QUIÉN DEBE ACTUAR
QUÉ ACCIÓN ES SEGURA AHORA
REFERENCIA DEL CASO
```

Mensajes como `Error parcial`, `Algo salió mal`, `Procesado con advertencias` o `Falló el lote` son insuficientes sin detalle progresivo.

Métricas mínimas:

- cantidad y edad por parciality class y disposición;
- tiempo hasta clasificación, intervención y cierre;
- unidades confirmadas, bloqueadas, desconocidas y rechazadas;
- elementos en cuarentena y candidatos a dead-letter;
- reintentos manuales y reprocesos;
- duplicados evitados;
- residuales abiertos y vencidos;
- recurrencia por contrato, aplicación, proveedor y versión.

Guardrails:

```text
EFECTO CONFIRMADO REPETIDO DURANTE RECUPERACIÓN = 0
RESULTADO DESCONOCIDO CERRADO COMO RECHAZO = 0
LOTE PARCIAL PRESENTADO COMO ÉXITO TOTAL = 0
ELEMENTO BORRADO PARA CERRAR DEAD-LETTER = 0
INTERVENCIÓN SIN ACTOR, MOTIVO Y AUDITORÍA = 0
```

Las métricas no se usarán para responsabilizar a trabajadores por red, latencia, fallas de proveedor o defectos del sistema.

#### 22. Fronteras críticas

##### 22.1. ORIGO → NEXO → NUMERA

Orden, recepción física, ingreso de inventario, diferencia, obligación y pago son unidades separadas. Una recepción física confirmada con obligación fallida queda parcial; no se repite el ingreso ni se elimina la recepción.

##### 22.2. FOGO → NEXO → PULSO

Lote, consumos, calidad, entrada de terminado, disponibilidad, pedido y entrega conservan resultados propios. Un lote terminado con movimiento desconocido exige consulta o conciliación; no se vuelve a producir.

##### 22.3. PULSO → PASS → NUMERA

Venta, cobro, documento, puntos y hecho financiero no comparten outcome. Un cobro confirmado con puntos fallidos no repite el pago; un reembolso parcial conserva todas las obligaciones abiertas.

##### 22.4. VISO → ANIMA → SHELL

Programación, asistencia, vínculo, autorización, sesión y dispositivo se clasifican por propietaria. Corregir una marcación no restaura permisos ni oculta una revocación fallida.

#### 23. AURA diferida y decisiones reservadas

Las relaciones donde AURA sea productora o consumidora conservan clases, disposiciones y requisitos definidos, pero:

- no crean cuarentenas, dead-letter, intervenciones ni reprocesos productivos;
- no ejecutan conciliación o compensación automática;
- no generan métricas operativas de backlog;
- permanecen `DEFINED_DEFERRED` hasta cobertura, autorización, readiness y paquete E5 aprobados.

| Decisión                                                                                   | Tarea propietaria                   |
| ------------------------------------------------------------------------------------------ | ----------------------------------- |
| prohibición física de escrituras cruzadas y comandos inversos                              | `INT-APP-010`                       |
| tablas, outbox, inbox, quarantine store, dead-letter store, constraints, RLS y migraciones | BLOQUES E3 y R                      |
| broker, topics, colas, workers, leases, scheduler, circuit breaker y observabilidad física | BLOQUE E4                           |
| schemas, SDK, tipos, canonicalización, compatibilidad y redacción                          | BLOQUE H                            |
| permisos finales de intervención y rutas administrativas                                   | BLOQUES D, I y roadmaps funcionales |
| retención, legal hold, disposición y privacidad física                                     | BLOQUES AA y EVID                   |
| implementación, inyección de fallos, pruebas E2E, piloto, cutover y hypercare              | BLOQUE E5                           |

#### 24. Cambios no autorizados

`INT-APP-009` no autoriza:

- crear tablas, índices, constraints, funciones, triggers, RPC, RLS o migraciones;
- implementar quarantine store, dead-letter queue, broker, topic, worker, scheduler, cron o panel operativo;
- mover, reprocesar, rechazar, compensar o corregir operaciones reales;
- editar payloads, estados, saldos, inventario, pagos, puntos, documentos o auditoría;
- convertir una intervención en acceso directo a base de datos;
- cambiar productoras, consumidoras, eventos, permisos, idempotencia, retries o compensaciones;
- borrar elementos para reducir backlog, métricas o alertas;
- tratar dead-letter como resultado empresarial;
- activar AURA;
- iniciar piloto, cutover, producción o hypercare;
- escribir en GitHub.

#### 25. Requisitos de prueba derivados

```text
TREQ-INTEGRATION-258 a TREQ-INTEGRATION-287
```

El detalle completo reside exclusivamente en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` regenerado con esta tarea.

#### 26. Huellas de integridad

```text
PARTIAL_ERROR_SCOPE_REGISTRY_SHA256 = 2cf5b605bc6a2b5a839d91de1fe99d1cae39d0611819df9f3330a3a2b78da45d
PARTIALITY_CLASS_REGISTRY_SHA256 = f23c9b7b5699b5f8cce81c46cd6e3f3059562caeaee9b2efa91c086d73b006c3
ERROR_DISPOSITION_REGISTRY_SHA256 = af81fb3b802e1342a78b081e57e947d4c7c2b0552edcb609091b76b819161f84
PARTIAL_ERROR_POLICY_SHA256 = 2a8f7b26a0e28c241ce383779c1d607ee4af59cb004efed8e1322d1fe408ceee
REMOTE_COMMIT_SHA = 8ecac3a8b38e4f6ed73a995d8254158d80acb482
REMOTE_X_BLOCK_BLOB_SHA1 = 1dbbd74b08d511a9ba94dc6384188399274a20fc
REMOTE_04A_BASE_BLOB_SHA1 = 6d276b2a62d70263da69200b9e19b8c00f0be1f8
UX_CONNECTIVITY_SOURCE_BLOB_SHA1 = 24a0118bc968af300d8e3541d0665557b76f1d40
CODE_OFFLINE_AUDIT_SOURCE_BLOB_SHA1 = 2234bc064cc91e766e4e550fc8c3801d669ec894
```

#### 27. Criterios de aceptación

- [x] `INT-APP-001` a `INT-APP-008` figuran aprobadas en el remoto.
- [x] Se congelaron commit y blobs consumidos.
- [x] Se preservaron los catorce estados, cuarenta y seis transiciones, ocho perfiles de retry y doce clases de error heredadas.
- [x] Se definieron ocho alcances, nueve clases de parcialidad y doce disposiciones.
- [x] Se definieron ocho razones de cuarentena y siete puertas acumulativas de dead-letter.
- [x] Se definieron diez acciones manuales y ocho outcomes de cierre.
- [x] Se exige clasificación por efecto, elemento, consumidora y unidad de lote.
- [x] Se separaron retry, rechazo, resultado desconocido, cuarentena, dead-letter, intervención, conciliación y compensación.
- [x] Se prohibió cerrar parcialidad o incertidumbre como éxito o fracaso global falso.
- [x] Se definieron causalidad, unidades independientes, residuales y propiedad de resolución.
- [x] Se cubrieron externos, offline, evidencias, periféricos y dispositivos compartidos.
- [x] Se cubrieron las cuatro fronteras críticas.
- [x] AURA permanece diferida.
- [x] No se autorizó implementación ni efecto operativo.
- [x] Se generaron 30 requisitos completos.

#### 28. Validaciones documentales realizadas

| Control                                      | Resultado                                             |
| -------------------------------------------- | ----------------------------------------------------- |
| Commit remoto leído                          | `8ecac3a8b38e4f6ed73a995d8254158d80acb482`            |
| Blob del mini-bloque X                       | `1dbbd74b08d511a9ba94dc6384188399274a20fc`            |
| Blob 04A remoto base                         | `6d276b2a62d70263da69200b9e19b8c00f0be1f8`            |
| Procesos cubiertos                           | **69**                                                |
| Eventos normales cubiertos                   | **395**                                               |
| Relaciones evento-consumidora                | **2.020**                                             |
| Estados de sincronización heredados          | **14**                                                |
| Transiciones de sincronización heredadas     | **46**                                                |
| Perfiles de retry heredados                  | **8**                                                 |
| Clases de error heredadas                    | **12**                                                |
| Alcances de fallo                            | **8**                                                 |
| Clases de parcialidad                        | **9**                                                 |
| Disposiciones                                | **12**                                                |
| Razones de cuarentena                        | **8**                                                 |
| Puertas de dead-letter                       | **7**                                                 |
| Acciones manuales                            | **10**                                                |
| Outcomes de cierre                           | **8**                                                 |
| Requisitos base                              | **4.248**                                             |
| Requisitos nuevos                            | **30**                                                |
| Total regenerado                             | **4.278**                                             |
| Dominio INTEGRATION                          | **287 — TREQ-INTEGRATION-001 a TREQ-INTEGRATION-287** |
| Filas con catorce columnas                   | **4.278 de 4.278**                                    |
| Identificadores duplicados                   | **0**                                                 |
| Relaciones TREQ no resolubles                | **0**                                                 |
| Identificadores históricos preservados       | **4.248**                                             |
| Valores históricos modificados               | **0**                                                 |
| Código, Supabase o integraciones modificados | **no**                                                |

#### 29. Validación real del repositorio

```text
VALIDACIÓN REAL DEL REPOSITORIO PENDIENTE DE EJECUCIÓN LOCAL
```

Comandos requeridos desde la raíz de `vento-shell` después del reemplazo:

```bash
npm run docs:plan:build
npm run docs:plan:check
npm run docs:plan:test
npm run docs:treq:check
npm run docs:treq:test
git diff --check
```

#### 30. Instrucción de reemplazo

1. Reemplazar exactamente `### [ ] INT-APP-009 — Definir manejo de errores parciales` por este documento completo.
2. Reemplazar completamente `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` por el archivo regenerado entregado con esta tarea.
3. No copiar, fusionar ni insertar filas `TREQ-*` manualmente.
4. No modificar derivados bajo `.generated/` para forzar continuidad.

#### 31. Continuidad preparada

```text
ÚLTIMA TAREA APROBADA
INT-APP-008 — Definir estados pendientes de sincronización
        ↓
TAREA ACTUAL
INT-APP-009 — Definir manejo de errores parciales
        ↓
SIGUIENTE TAREA RESERVADA
INT-APP-010 — Evitar escrituras cruzadas sin contrato
```

APROBADA


### [ ] INT-APP-010 — Evitar escrituras cruzadas sin contrato
