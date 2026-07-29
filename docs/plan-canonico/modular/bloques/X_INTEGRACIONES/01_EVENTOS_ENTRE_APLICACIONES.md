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


### [ ] INT-APP-003 — Definir aplicaciones consumidoras
### [ ] INT-APP-004 — Definir idempotencia
### [ ] INT-APP-005 — Definir reintentos
### [ ] INT-APP-006 — Definir compensaciones
### [ ] INT-APP-007 — Definir auditoría transversal
### [ ] INT-APP-008 — Definir estados pendientes de sincronización
### [ ] INT-APP-009 — Definir manejo de errores parciales
### [ ] INT-APP-010 — Evitar escrituras cruzadas sin contrato
