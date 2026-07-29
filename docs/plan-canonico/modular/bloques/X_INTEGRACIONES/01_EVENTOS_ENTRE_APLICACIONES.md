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


### [ ] INT-APP-005 — Definir reintentos
### [ ] INT-APP-006 — Definir compensaciones
### [ ] INT-APP-007 — Definir auditoría transversal
### [ ] INT-APP-008 — Definir estados pendientes de sincronización
### [ ] INT-APP-009 — Definir manejo de errores parciales
### [ ] INT-APP-010 — Evitar escrituras cruzadas sin contrato
