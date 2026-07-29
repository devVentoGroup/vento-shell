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


### [ ] INT-APP-002 — Definir aplicación emisora de cada evento
### [ ] INT-APP-003 — Definir aplicaciones consumidoras
### [ ] INT-APP-004 — Definir idempotencia
### [ ] INT-APP-005 — Definir reintentos
### [ ] INT-APP-006 — Definir compensaciones
### [ ] INT-APP-007 — Definir auditoría transversal
### [ ] INT-APP-008 — Definir estados pendientes de sincronización
### [ ] INT-APP-009 — Definir manejo de errores parciales
### [ ] INT-APP-010 — Evitar escrituras cruzadas sin contrato
