### MINI-BLOQUE — PRODUCCION E INVENTARIO

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **produccion e inventario** dentro de **X INTEGRACIONES**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `INT-PROD-001` a `INT-PROD-005` — 5 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `INT-PROD-001`: Definir contrato para que FOGO solicite o reserve insumos
- `INT-PROD-002`: Definir contrato para que NEXO registre el consumo
- `INT-PROD-003`: Definir contrato para que FOGO finalice el lote
- `INT-PROD-004`: Definir contrato para que NEXO registre el producto terminado
- `INT-PROD-005`: Definir tratamiento de producción insuficiente para remisiones
<!-- PLAN-SECTION-META:END -->

### [ ] INT-PROD-001 — Definir contrato para que FOGO solicite o reserve insumos
### [ ] INT-PROD-002 — Definir contrato para que NEXO registre el consumo
### [ ] INT-PROD-003 — Definir contrato para que FOGO finalice el lote
### [ ] INT-PROD-004 — Definir contrato para que NEXO registre el producto terminado
### ✅ INT-PROD-005 — Definir tratamiento de producción insuficiente para remisiones

**Estado:** APROBADA  
**Tarea anterior:** `NEXO-REMISSIONS-001::CONDITIONAL_DESIGN_ARTIFACTS — Resolver y aprobar CONDITIONAL_DESIGN_ARTIFACTS` — APROBADA  
**Tarea siguiente:** `PRINT-ARC-001 — Inventariar impresoras por empresa, sede, área y punto operativo` — RESERVADA  
**Tipo de tarea:** documental; definición contractual, funcional, cuantitativa, de estados, integración, excepciones, idempotencia, conciliación y handoff para vincular faltantes de remisiones NEXO con planificación y ejecución productiva FOGO  
**Repositorio propietario:** `vento-shell`  
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/05_PRODUCCION_E_INVENTARIO.md`  
**Aplicaciones involucradas:** `NEXO`, `FOGO`, `SHELL`; `ORIGO`, `VISO`, `NUMERA`, `PULSO` y `PASS` únicamente como fuentes o consumidoras cuando una dependencia aprobada lo exija  
**Artefactos producidos:** `NEXO-FOGO-REMISSION-PRODUCTION-SHORTAGE-CONTRACT-001`, `NEXO-FOGO-REMISSION-PRODUCTION-ELIGIBILITY-MATRIX-001`, `NEXO-FOGO-REMISSION-PRODUCTION-STATE-MACHINE-001`, `NEXO-FOGO-REMISSION-PRODUCTION-QUANTITY-CONTRACT-001`, `NEXO-FOGO-REMISSION-PRODUCTION-HANDOFF-CONTRACT-001`, `NEXO-FOGO-REMISSION-PRODUCTION-CANCELLATION-RECOVERY-CONTRACT-001`, `NEXO-FOGO-REMISSION-PRODUCTION-RECONCILIATION-MATRIX-001` y `NEXO-FOGO-REMISSION-PRODUCTION-IMPLEMENTATION-HANDOFF-001`  
**Decisiones consumidas:** `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-022`, `INT-APP-001` a `INT-APP-010`, `TREQ-FOGO-001`, `TREQ-FOGO-003`, `TREQ-INTEGRATION-006`, `TREQ-INTEGRATION-011`, `TREQ-INTEGRATION-013`, `TREQ-INTEGRATION-067`, `TREQ-INTEGRATION-102`, `TREQ-NEXO-006`, `TREQ-NEXO-010`, `TREQ-NEXO-011` y `TREQ-NEXO-269`  
**Cambios físicos autorizados:** ninguno; no modifica código, tablas, funciones, RPC, RLS, datos, migraciones, paquetes, tipos generados, configuración, remisiones, lotes productivos, stock, despliegues ni servicios remotos

---

#### 1. Propósito

Definir qué debe ocurrir cuando una remisión interna contiene un producto que:

- no dispone de cantidad suficiente en el origen;
- está configurado para abastecimiento mediante producción;
- debe fabricarse total o parcialmente para cumplir la cantidad solicitada; o
- requiere una decisión de FOGO antes de comprometer una fecha o cantidad.

La tarea elimina cuatro ambigüedades:

1. un faltante de NEXO no equivale por sí solo a una orden de producción;
2. una remisión no puede aprobar producción ni decidir receta, lote, secuencia o capacidad;
3. terminar producción no equivale a liberar calidad, ingresar inventario ni completar la remisión;
4. una cantidad producida no puede asignarse, despacharse o contabilizarse dos veces.

La regla raíz queda:

```text
REMISIÓN APROBADA O EN PREPARACIÓN
+
POLÍTICA DE CUMPLIMIENTO VIGENTE
+
FALTANTE O NECESIDAD BAJO PEDIDO
+
PRODUCTO Y UNIDAD RESOLUBLES
→
NECESIDAD PRODUCTIVA CORRELACIONADA
→
DECISIÓN AUTORITATIVA DE FOGO
→
EJECUCIÓN, CALIDAD Y LIBERACIÓN
→
ASIGNACIÓN AUTORITATIVA DE NEXO
→
DESPACHO, RECEPCIÓN Y CONCILIACIÓN
```

---

#### 2. Resultado material

Se aprueba un contrato completo para:

- clasificar cuándo una línea de remisión puede activar producción;
- conservar el faltante sin reducir silenciosamente la cantidad solicitada;
- crear una necesidad productiva correlacionada, pero no una producción aprobada;
- permitir que FOGO acepte, acepte parcialmente o rechace la necesidad;
- vincular plan, orden, lote, resultado, calidad y liberación sin transferir propiedad entre aplicaciones;
- soportar producción parcial y despacho parcial;
- tratar sustituciones, cancelaciones, vencimientos, respuestas desconocidas y resultados tardíos;
- impedir doble conteo entre producto producido, inventario disponible y cantidad asignada a la remisión;
- reconciliar la cadena completa antes de cerrar el abastecimiento interno.

La tarea conserva como hechos distintos:

```text
FALTANTE DETECTADO
≠ NECESIDAD PRODUCTIVA REGISTRADA
≠ NECESIDAD ACEPTADA
≠ PLAN LIBERADO
≠ ORDEN LISTA
≠ PRODUCCIÓN TERMINADA
≠ CALIDAD LIBERADA
≠ INVENTARIO INGRESADO
≠ CANTIDAD ASIGNADA
≠ CANTIDAD DESPACHADA
≠ CANTIDAD RECIBIDA
≠ REMISIÓN CONCILIADA
```

---

#### 3. Diagnóstico del estado actual

La implementación vigente demuestra capacidades parciales, pero no el contrato completo:

- NEXO puede detectar insuficiencia física o de stock y bloquear el despacho;
- NEXO conserva cantidades preparadas, enviadas, recibidas y faltantes;
- existe soporte operativo para observaciones de faltante en origen;
- FOGO puede crear lotes productivos y distinguir salidas para inventario, stock vendible o cumplimiento de una orden;
- FOGO posee recetas, ejecución productiva y resultados;
- no existe una relación canónica comprobada que vincule una línea de remisión con una necesidad productiva, una decisión FOGO, una cantidad liberada y una asignación NEXO;
- no se ha demostrado cierre idempotente, conciliación cruzada ni tratamiento de cancelaciones y resultados tardíos.

Por tanto, las capacidades actuales se clasifican como parciales y no equivalen a integración implementada o validada.

---

#### 4. Propiedad empresarial y límites

| Dominio          | Propiedad obligatoria                                                                                                                                | No puede decidir                                                                                   |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- |
| `NEXO`           | remisión, línea solicitada, faltante, cantidad preparada, asignación física, despacho, tránsito, recepción, movimientos y conciliación de inventario | receta, plan productivo, orden productiva, secuencia, rendimiento, merma o disposición de calidad  |
| `FOGO`           | señal productiva aceptada, plan, orden, receta y versión, lote, ejecución, consumos, rendimiento, merma, calidad, liberación y cierre productivo     | editar la remisión, reducir su cantidad original, confirmar despacho, recepción o cierre logístico |
| `SHELL`          | contratos compartidos, sobre de integración, tipos, compatibilidad, idempotencia, publicación y gobierno de cambios                                  | fabricar hechos empresariales de NEXO o FOGO                                                       |
| `ORIGO`          | disponibilidad y recepción de compras cuando falten materiales                                                                                       | aprobar producción o modificar cantidades de remisión                                              |
| `VISO`           | disponibilidad laboral y capacidad organizativa cuando sea consumida por planificación                                                               | crear una orden productiva o alterar el turno desde NEXO                                           |
| `NUMERA`         | efectos económicos aprobados y conciliación financiera                                                                                               | convertir costo esperado en producción, inventario o remisión completada                           |
| `PULSO` y `PASS` | hechos de demanda o pedido cuando correspondan                                                                                                       | completar producción, liberar inventario o cerrar remisiones                                       |

Regla obligatoria:

```text
NEXO SOLICITA O REGISTRA NECESIDAD
FOGO DECIDE Y EJECUTA PRODUCCIÓN
NEXO ASIGNA Y MUEVE EXISTENCIA LIBERADA
```

Una aplicación consumidora no escribirá directamente las tablas propietarias de otra aplicación ni fabricará estados ajenos.

---

#### 5. Política de cumplimiento productivo

Cada combinación aplicable de producto, sede de origen, operación y vigencia deberá resolver exactamente una política:

| Política                | Comportamiento                                                                                                                                       | Producción activable            |
| ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------- |
| `STOCK_ONLY`            | La línea se atiende únicamente desde existencia disponible. El faltante permanece explícito para sustitución, entrega parcial, espera o cancelación. | No                              |
| `STOCK_THEN_PRODUCTION` | NEXO prepara existencia disponible y genera necesidad productiva por el saldo faltante confirmado.                                                   | Sí, por el saldo faltante       |
| `MAKE_TO_ORDER`         | La línea puede solicitarse aun con stock cero y genera necesidad productiva por la cantidad definida por la política vigente.                        | Sí, por la cantidad bajo pedido |

La política deberá conservar:

- identidad y versión;
- producto y presentación aplicables;
- sede y área de origen autorizadas;
- unidad canónica y conversión aprobada;
- vigencia;
- modalidad de abastecimiento;
- tratamiento de existencia previa para `MAKE_TO_ORDER`;
- necesidad de receta o vínculo productivo activo;
- tiempo de entrega, corte o ventana cuando exista política aprobada;
- autoridad que la aprobó;
- estado activo, retirado o reemplazado.

No se permitirá:

- inferir la política desde el nombre, categoría o existencia momentánea;
- tratar todo faltante como producción;
- usar una receta retirada o una conversión ambigua;
- cambiar de política durante una revisión sin registrar versión y efecto;
- utilizar `MAKE_TO_ORDER` para ignorar calidad, inventario, custodia o autorización.

---

#### 6. Matriz de activación

| Escenario                                                             | Decisión                                 | Resultado                                                           |
| --------------------------------------------------------------------- | ---------------------------------------- | ------------------------------------------------------------------- |
| `STOCK_ONLY` con stock suficiente                                     | No requiere producción                   | Preparación ordinaria                                               |
| `STOCK_ONLY` con stock insuficiente                                   | No crea necesidad productiva             | Faltante explícito y decisión logística pendiente                   |
| `STOCK_THEN_PRODUCTION` con stock suficiente                          | No requiere producción                   | Preparación ordinaria                                               |
| `STOCK_THEN_PRODUCTION` con faltante parcial                          | Crea necesidad por el saldo confirmado   | Stock disponible preservado y saldo vinculado a FOGO                |
| `STOCK_THEN_PRODUCTION` con stock cero                                | Crea necesidad por la cantidad abierta   | Línea permanece pendiente de decisión FOGO                          |
| `MAKE_TO_ORDER` con vínculo productivo válido                         | Crea necesidad según la política vigente | No bloquea la solicitud por stock cero                              |
| Producto sin política vigente                                         | Bloquea activación productiva            | `PRODUCTION_POLICY_NOT_RESOLVED`                                    |
| Producto sin unidad compatible                                        | Bloquea activación productiva            | `PRODUCTION_UOM_NOT_RESOLVED`                                       |
| Producto sin receta o vínculo productivo activo cuando es obligatorio | Bloquea activación productiva            | `PRODUCTION_CONFIGURATION_INCOMPLETE`                               |
| Remisión cancelada o línea cerrada                                    | No crea nueva necesidad                  | Cualquier vínculo previo sigue reglas de cancelación y conciliación |
| Cantidad ya satisfecha o cancelada                                    | No crea necesidad adicional              | Reintento idempotente sin efecto nuevo                              |
| Lectura técnica no concluyente                                        | No presume faltante ni capacidad         | `PRODUCTION_LINK_UNAVAILABLE` y cero efectos                        |

Una observación libre de “faltante” no bastará para activar producción. La activación requiere cantidad, unidad, revisión, política y contexto resolubles.

---

#### 7. Identidad de la necesidad productiva

Cada necesidad deberá tener identidad estable y quedar vinculada a una única revisión de línea de remisión.

```text
production_requirement_id
+ remission_id
+ remission_line_id
+ remission_line_revision
+ requirement_revision
+ fulfillment_policy_id
+ fulfillment_policy_version
+ source_shortage_ref
+ correlation_id
+ causation_id
+ idempotency_key
```

Reglas:

1. una revisión de necesidad no se sobrescribe;
2. un aumento, reducción, cancelación o reapertura crea una revisión posterior;
3. dos reintentos con la misma clave y el mismo contenido retornan el mismo resultado;
4. la misma clave con contenido incompatible produce conflicto;
5. una necesidad no podrá vincularse simultáneamente a dos líneas de remisión;
6. una línea podrá tener varias revisiones o asignaciones productivas, pero su suma se conciliará contra la cantidad abierta;
7. plan, orden y lote FOGO se relacionan mediante referencias, no mediante cambio de propiedad del registro NEXO.

---

#### 8. Contrato mínimo de necesidad

| Campo                                         | Regla                                                                    |
| --------------------------------------------- | ------------------------------------------------------------------------ |
| `production_requirement_id`                   | Identidad estable de la necesidad.                                       |
| `remission_id`                                | Remisión propietaria en NEXO.                                            |
| `remission_line_id`                           | Línea exacta que originó la necesidad.                                   |
| `remission_line_revision`                     | Revisión usada para calcular la necesidad.                               |
| `origin_site_id` / `origin_area_id`           | Contexto desde el cual se abastece y produce.                            |
| `destination_site_id` / `destination_area_id` | Destino logístico; no define por sí solo lugar de producción.            |
| `product_id`                                  | Identidad maestra canónica.                                              |
| `presentation_id`                             | Presentación solicitada cuando aplique.                                  |
| `canonical_uom_id`                            | Unidad en la que se reconcilian todas las cantidades.                    |
| `requested_qty`                               | Cantidad original de la revisión de línea; no se reduce silenciosamente. |
| `stock_allocated_qty`                         | Cantidad asignada desde existencia previa.                               |
| `production_needed_qty`                       | Cantidad abierta propuesta para producción.                              |
| `needed_at`                                   | Momento requerido por la remisión. No equivale a compromiso FOGO.        |
| `remission_priority`                          | Prioridad de la remisión como señal; no impone secuencia productiva.     |
| `fulfillment_policy`                          | `STOCK_ONLY`, `STOCK_THEN_PRODUCTION` o `MAKE_TO_ORDER`.                 |
| `request_reason_code`                         | Causa estructurada de la necesidad.                                      |
| `expected_remission_version`                  | Control de concurrencia.                                                 |
| `correlation_id` / `causation_id`             | Relación entre procesos y hechos.                                        |
| `idempotency_key`                             | Prevención de duplicados.                                                |
| `status`                                      | Estado del vínculo productivo.                                           |
| `created_by` / `created_at`                   | Actor efectivo y tiempo autoritativo.                                    |

NEXO no enviará como autoridad:

- receta;
- rendimiento esperado definitivo;
- lote productivo;
- orden productiva;
- prioridad de secuenciación;
- cantidad aprobada por FOGO;
- fecha prometida por FOGO;
- disponibilidad de materiales o capacidad calculada por el cliente.

---

#### 9. Decisión autoritativa de FOGO

La remisión es una señal de necesidad y no crea producción aprobada.

FOGO deberá responder mediante una decisión versionada:

| Decisión              | Significado                                                   | Efecto en NEXO                                                   |
| --------------------- | ------------------------------------------------------------- | ---------------------------------------------------------------- |
| `ACCEPTED`            | FOGO acepta toda la cantidad propuesta.                       | La línea conserva saldo pendiente vinculado a producción.        |
| `PARTIALLY_ACCEPTED`  | FOGO acepta una parte y rechaza o difiere el resto.           | Se separan cantidad aceptada y cantidad no resuelta.             |
| `REJECTED`            | FOGO no acepta la necesidad.                                  | NEXO conserva faltante y habilita decisión logística autorizada. |
| `PENDING_INFORMATION` | Falta una entrada verificable para decidir.                   | No existe compromiso productivo.                                 |
| `CONFLICT`            | La revisión o contenido no coincide con la decisión esperada. | Se exige reconciliación antes de reintentar.                     |

La decisión deberá conservar:

```text
decision_id
+ production_requirement_id
+ requirement_revision
+ decision
+ accepted_qty
+ rejected_or_deferred_qty
+ canonical_uom_id
+ estimated_ready_at
+ production_plan_ref
+ production_order_ref
+ policy_or_rule_ref
+ reason_code
+ decided_by
+ decided_at
+ decision_version
```

FOGO podrá automatizar la decisión únicamente mediante una política productiva explícita, versionada y aprobada dentro de su dominio. La automatización deberá producir el mismo receipt de decisión y no convierte a NEXO en autoridad productiva.

---

#### 10. Estados del vínculo NEXO–FOGO

| Estado                    | Hecho demostrado                                                            | No demuestra                                             |
| ------------------------- | --------------------------------------------------------------------------- | -------------------------------------------------------- |
| `NOT_REQUIRED`            | La línea no requiere producción.                                            | Que esté despachada o recibida.                          |
| `PENDING_FOGO_DECISION`   | Existe una necesidad válida entregada a FOGO.                               | Aceptación, fecha o capacidad.                           |
| `ACCEPTED`                | FOGO aceptó toda la cantidad.                                               | Inicio, terminación o calidad.                           |
| `PARTIALLY_ACCEPTED`      | FOGO aceptó una parte.                                                      | Resolución del saldo restante.                           |
| `REJECTED`                | FOGO rechazó la necesidad.                                                  | Cancelación automática de la línea.                      |
| `SCHEDULED`               | Existe referencia a plan u orden liberada.                                  | Producción iniciada.                                     |
| `IN_PRODUCTION`           | La ejecución productiva está en curso.                                      | Resultado, calidad o inventario.                         |
| `OUTPUT_REPORTED`         | FOGO reportó resultado productivo.                                          | Liberación de calidad.                                   |
| `QUALITY_PENDING`         | El resultado espera disposición o verificación.                             | Disponibilidad para remisión.                            |
| `RELEASED_PARTIAL`        | Parte de la salida fue liberada y es elegible para asignación.              | Despacho o recepción.                                    |
| `RELEASED_COMPLETE`       | La cantidad aceptada liberable fue confirmada.                              | Que toda la remisión esté satisfecha.                    |
| `CANCEL_REQUESTED`        | NEXO solicitó cancelar el vínculo.                                          | Cancelación productiva.                                  |
| `CANCELLED`               | La cancelación fue confirmada por la propietaria correspondiente.           | Eliminación de historia o inexistencia de salida tardía. |
| `EXPIRED`                 | La necesidad perdió vigencia sin satisfacción suficiente.                   | Cancelación de una ejecución ya iniciada.                |
| `RECONCILIATION_REQUIRED` | Existe diferencia, timeout, evento fuera de orden o resultado incompatible. | Éxito o fallo definitivo.                                |

Todo cambio conservará estado anterior, nuevo estado, versión esperada, actor, momento, causa y referencias de evidencia.

---

#### 11. Cantidades e invariantes

Todas las cantidades se reconciliarán en una unidad canónica compatible.

```text
open_fulfillment_qty
=
requested_qty
- received_qty
- cancelled_qty
```

```text
requested_qty
=
stock_allocated_qty
+ production_allocated_qty
+ unresolved_qty
+ cancelled_qty
```

```text
production_allocated_qty <= released_production_qty
received_qty <= shipped_qty
shipped_qty <= stock_allocated_qty + production_allocated_qty
production_needed_qty <= open_fulfillment_qty
```

Reglas adicionales:

- ninguna cantidad puede ser negativa;
- ninguna conversión se realizará con factor ausente, ambiguo o retirado;
- `requested_qty` permanece como historia de la revisión y no se reemplaza por la cantidad disponible;
- una aceptación parcial no reduce el faltante no resuelto;
- una producción parcial puede habilitar preparación o despacho parcial sin cerrar la línea;
- una merma productiva no se convierte automáticamente en faltante logístico ni ajuste de inventario;
- una salida superior a la cantidad abierta no se asigna automáticamente a la remisión;
- el excedente se trata según disposición FOGO y movimiento NEXO autorizado;
- una cantidad producida solo podrá contarse como asignada después de liberación y receipt de asignación NEXO;
- una cantidad asignada a una línea no podrá quedar simultáneamente disponible para otra operación.

---

#### 12. Modos de entrega de la salida productiva

La salida liberada podrá seguir uno de dos modos aprobados:

| Modo                       | Secuencia                                                                                                 | Regla de inventario                                                                                  |
| -------------------------- | --------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| `INVENTORY_THEN_ALLOCATE`  | FOGO libera → NEXO ingresa existencia → NEXO asigna a la línea → NEXO prepara y despacha                  | El ingreso y la asignación son hechos separados e idempotentes.                                      |
| `DIRECT_ORDER_FULFILLMENT` | FOGO libera salida vinculada → NEXO la recibe en staging o custodia de remisión → NEXO prepara y despacha | No se presenta como stock libre, pero conserva movimiento, lote, ubicación, custodia y trazabilidad. |

`DIRECT_ORDER_FULFILLMENT` no permite:

- omitir disposición de calidad;
- despachar desde FOGO sin transferencia de custodia NEXO;
- usar resultado productivo no liberado;
- ocultar lote, presentación, cantidad o unidad;
- evitar movimiento o receipt físico;
- marcar la remisión como recibida desde producción.

---

#### 13. Handoff sobre eventos canónicos existentes

La integración no crea un catálogo paralelo. Utiliza las definiciones ya aprobadas y el sobre `EVENT-ENVELOPE-001`.

| Momento                           | Definición canónica consumida | Uso en este contrato                                                             |
| --------------------------------- | ----------------------------- | -------------------------------------------------------------------------------- |
| Solicitud interna creada          | `VPROC-0028.EVT-001`          | Origina la instancia de abastecimiento; no prueba necesidad productiva aceptada. |
| Validación de remisión            | `VPROC-0028.EVT-002`          | Permite resolver política, disponibilidad y necesidad propuesta.                 |
| Demanda en consolidación          | `VPROC-0033.EVT-002`          | FOGO incorpora la señal normalizada y deduplicada.                               |
| Plan productivo liberado          | `VPROC-0033.EVT-004`          | Demuestra planificación aprobada, no ejecución.                                  |
| Orden productiva lista            | `VPROC-0034.EVT-001`          | Vincula una orden ejecutable con la necesidad aceptada.                          |
| Producción en curso               | `VPROC-0034.EVT-003`          | Actualiza progreso sin liberar cantidad.                                         |
| Resultado reportado               | `VPROC-0034.EVT-004`          | Informa salida y rendimiento sin liberación de calidad.                          |
| Ejecución terminada               | `VPROC-0034.EVT-006`          | Confirma fin operativo; no habilita inventario.                                  |
| Disposición de calidad verificada | `VPROC-0035.EVT-006`          | Identifica la cantidad expresamente liberada.                                    |
| Efectos de inventario pendientes  | `VPROC-0037.EVT-004`          | Solicita el handoff físico hacia NEXO.                                           |
| Listo para despacho               | `VPROC-0028.EVT-004`          | Solo ocurre después de asignación y preparación verificadas.                     |
| Conciliación pendiente            | `VPROC-0028.EVT-005`          | Registra diferencias o efectos pendientes.                                       |
| Abastecimiento conciliado         | `VPROC-0028.EVT-006`          | Cierra sin ocultar faltantes, sustituciones, cancelaciones o devoluciones.       |

Cada emisión o comando derivado deberá conservar, como mínimo:

```text
event_id
+ event_definition_id
+ event_version
+ process_id
+ process_instance_id
+ producer_application
+ aggregate_id
+ aggregate_version
+ occurred_at
+ recorded_at
+ principal_id
+ effective_actor_id
+ site_id
+ area_id
+ correlation_id
+ causation_id
+ request_id
+ idempotency_key
+ result_reference
+ output_references[]
+ evidence_references[]
+ audit_reference
```

---

#### 14. Preparación y despacho parcial

Cuando existe cantidad disponible desde stock o producción liberada:

1. NEXO podrá asignar y preparar la cantidad disponible;
2. la línea conservará el saldo pendiente;
3. el despacho parcial requerirá autorización y cantidad exacta;
4. la documentación indicará solicitado, despachado y pendiente;
5. el destino recibirá únicamente la cantidad transferida;
6. el saldo podrá satisfacerse mediante otra producción, sustitución autorizada o cancelación parcial;
7. ninguna parcialidad marcará la línea completa como cumplida;
8. la remisión solo cerrará cuando cada línea esté recibida, cancelada o resuelta mediante una decisión explícita y conciliada.

El faltante no se representará únicamente mediante texto libre.

---

#### 15. Sustituciones

Una sustitución no será un efecto implícito de la producción insuficiente.

Reglas:

- requiere acción autorizada y causa estructurada;
- conserva la línea original, cantidad pendiente y producto solicitado;
- crea una relación explícita con la línea o producto sustituto;
- valida equivalencia de presentación, unidad, alérgenos, calidad, destino y aceptación cuando aplique;
- no cambia la receta ni producto de una orden productiva ya iniciada;
- una sustitución posterior a producción liberada no reasigna automáticamente la salida original;
- los efectos de inventario y costo se mantienen en sus identidades reales;
- el cierre conserva quién propuso, quién aprobó, qué cantidad se sustituyó y qué quedó pendiente.

---

#### 16. Cancelación y resultados tardíos

| Momento                                       | Tratamiento                                                                                                         |
| --------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| Antes de entrega a FOGO                       | NEXO cancela la necesidad sin crear efecto productivo.                                                              |
| Entregada, sin decisión                       | NEXO emite cancelación idempotente y espera receipt.                                                                |
| Aceptada, sin inicio                          | FOGO decide si puede cancelar y conserva la decisión.                                                               |
| En producción                                 | La cancelación de la remisión no cancela automáticamente la ejecución; FOGO decide detener, continuar o redestinar. |
| Resultado reportado o calidad pendiente       | La salida mantiene su ciclo productivo y de calidad.                                                                |
| Salida liberada, línea todavía abierta        | NEXO puede asignarla hasta la cantidad abierta autorizada.                                                          |
| Salida liberada, línea satisfecha o cancelada | La salida queda sin asignar a la remisión y sigue disposición de inventario aprobada.                               |
| Resultado recibido después de timeout         | Se reconcilia por identidad y versión antes de cualquier reintento.                                                 |

Ninguna cancelación elimina la relación histórica ni permite reutilizar la misma clave con otra línea.

---

#### 17. Prioridad, fechas y capacidad

La remisión podrá aportar:

- fecha requerida;
- prioridad logística aprobada;
- sede y destino;
- cantidad abierta;
- justificación;
- ventana de despacho.

Estas señales no imponen por sí solas:

- secuencia de producción;
- receta;
- lote;
- turno;
- equipo;
- fecha comprometida;
- aceptación de sobrecapacidad;
- consumo de materiales.

FOGO evaluará capacidad, materiales, personal, equipos, almacenamiento, calidad y compromisos existentes. Toda repriorización deberá conservar motivo, autoridad, impacto sobre otras necesidades y versión.

No se fija un tiempo numérico universal en esta tarea. Los tiempos se resolverán desde políticas operativas versionadas y serán verificables por sede, producto y modalidad.

---

#### 18. Fallos, reintentos e idempotencia

| Condición                                    | Resultado obligatorio                                                              |
| -------------------------------------------- | ---------------------------------------------------------------------------------- |
| Respuesta perdida                            | Estado `RECONCILIATION_REQUIRED`; consultar por identidad antes de reenviar.       |
| Mismo comando, mismo contenido               | Retornar receipt previo sin efecto nuevo.                                          |
| Misma clave, contenido distinto              | `IDEMPOTENCY_CONFLICT`.                                                            |
| Evento fuera de orden                        | Conservarlo o rechazarlo según versión; no retroceder estado silenciosamente.      |
| FOGO indisponible                            | Mantener faltante pendiente; no inventar rechazo ni aceptación.                    |
| NEXO indisponible al liberar salida          | FOGO conserva el hecho y el handoff pendiente; no duplica publicación.             |
| Cantidad liberada mayor que la abierta       | Asignar como máximo la cantidad abierta y enviar excedente a disposición aprobada. |
| Referencia a remisión inexistente o retirada | Bloquear asignación y abrir conciliación.                                          |
| Versión de línea obsoleta                    | Conflicto; recalcular con la versión vigente mediante nueva revisión.              |
| Error después de movimiento físico           | Preservar receipt y estado desconocido hasta conciliación; no repetir ciegamente.  |

El contrato es independiente del transporte y no activa por sí mismo una arquitectura de colas. La entrega técnica posterior deberá respetar el catálogo transversal y la clasificación condicional vigente.

---

#### 19. Autorización y segregación

Las acciones deberán evaluarse por separado:

- registrar o enviar necesidad productiva;
- aceptar, aceptar parcialmente o rechazar en FOGO;
- publicar plan u orden;
- iniciar, reportar o cerrar producción;
- decidir y verificar calidad;
- asignar salida a remisión;
- cancelar necesidad;
- autorizar sustitución;
- preparar o despachar cantidad liberada;
- conciliar diferencias y cerrar.

`NEXO-AUTH-007 — Proteger producción vinculada` deberá materializar el enforcement posterior para las acciones NEXO incluidas en este contrato. La existencia de una remisión, un lote o un rol visible no constituye autorización.

Se prohíbe que una misma acción:

- apruebe producción y se autoasigne salida;
- decida calidad y marque recepción logística;
- cambie cantidad solicitada para ocultar faltante;
- cierre una diferencia sin receipt o causa;
- use una identidad técnica como actor humano.

---

#### 20. Auditoría y evidencia

Cada vínculo deberá permitir reconstruir:

```text
REMISIÓN Y REVISIÓN
→ LÍNEA Y CANTIDAD SOLICITADA
→ POLÍTICA RESUELTA
→ STOCK ASIGNADO Y FALTANTE
→ NECESIDAD Y REVISIONES
→ DECISIÓN FOGO
→ PLAN, ORDEN Y LOTE
→ RESULTADO, MERMA Y CALIDAD
→ CANTIDAD LIBERADA
→ MOVIMIENTO Y ASIGNACIÓN NEXO
→ DESPACHO Y RECEPCIÓN
→ DIFERENCIAS, CANCELACIONES Y CONCILIACIÓN
```

La auditoría conservará:

- principal técnico y actor efectivo;
- aplicación emisora y componente publicador;
- timestamps del hecho y registro;
- versiones de contrato, política, línea y decisión;
- cantidades y unidades antes y después;
- referencias de plan, orden, lote, calidad, movimiento y receipt;
- causas estructuradas;
- reintentos, conflictos y resultados desconocidos;
- evidencia mínima autorizada;
- relación con correcciones o compensaciones.

No se copiarán recetas, fórmulas, credenciales ni información sensible innecesaria en logs o proyecciones NEXO.

---

#### 21. Matriz de conciliación

| Control                 | Diferencia detectada                                               | Salida                                                     |
| ----------------------- | ------------------------------------------------------------------ | ---------------------------------------------------------- |
| Necesidad vs. decisión  | Necesidad sin decisión, decisión sin necesidad o revisión distinta | `RECONCILIATION_REQUIRED`                                  |
| Aceptado vs. ordenado   | Cantidad aceptada sin orden o superior a la aceptada               | Bloqueo y revisión FOGO                                    |
| Ordenado vs. producido  | Producción parcial, exceso, merma o salida ausente                 | Estado explícito y saldo pendiente                         |
| Producido vs. liberado  | Resultado sin disposición o cantidad liberada incompatible         | Bloqueo de asignación                                      |
| Liberado vs. ingresado  | Salida liberada sin movimiento NEXO o movimiento duplicado         | Conciliación de inventario                                 |
| Ingresado vs. asignado  | Stock ingresado sin asignación o doble asignación                  | Liberar, reasignar o corregir mediante decisión autorizada |
| Asignado vs. despachado | Cantidad preparada o despachada superior a la asignada             | Bloqueo crítico                                            |
| Despachado vs. recibido | Diferencia de cantidad, condición o identidad                      | Caso de diferencia de remisión                             |
| Cancelado vs. producido | Producción posterior a cancelación                                 | Disposición separada; no cumplimiento automático           |
| Estado vs. evidencia    | Estado avanzado sin receipt o referencia                           | Revertir proyección o bloquear cierre sin borrar historia  |

La conciliación no reescribe saldos directamente. Toda corrección cuantitativa usa movimientos, receipts o compensaciones aprobadas.

---

#### 22. Handoff de implementación

La implementación posterior deberá:

1. materializar contratos compartidos y tipos desde `vento-shell`;
2. incluir `INT-PROD-005` en el paquete `NEXO-REMISSIONS-001`;
3. activar el grupo condicional `PRODUCTION_LINK_IMPLEMENTATION` y ejecutar `NEXO-AUTH-007`;
4. definir almacenamiento propietario sin escrituras cruzadas;
5. versionar desde `vento-shell` cualquier migración o configuración Supabase de VENTO;
6. adaptar NEXO para necesidad, proyección, asignación y conciliación;
7. adaptar FOGO para decisión, vínculo con plan, orden, lote, calidad y salida;
8. mapear los handoffs a las definiciones `VPROC` existentes y al sobre `EVENT-ENVELOPE-001`;
9. crear pruebas de contrato, autorización, idempotencia, concurrencia, parcialidad, cancelación, calidad, inventario y rollback;
10. ejecutar validación en CI y staging antes de operación controlada;
11. demostrar que no se duplica stock, producción, asignación, despacho ni recepción;
12. conservar compatibilidad o retiro explícito de notas y fallbacks legacy de faltante.

Esta tarea no autoriza esa implementación ni declara los repositorios físicamente conformes.

---

#### 23. Requisitos de prueba derivados

La tarea consume requisitos vigentes que ya incluyen explícitamente `INT-PROD-005` o protegen sus fronteras:

| Requisito              | Cobertura consumida                                                                           |
| ---------------------- | --------------------------------------------------------------------------------------------- |
| `TREQ-FOGO-001`        | ciclo productivo, parcialidad, cancelación, corrección y efectos auditables                   |
| `TREQ-FOGO-003`        | señal de remisión sin aprobación productiva automática; planificación y prioridad versionadas |
| `TREQ-INTEGRATION-006` | propiedad única de datos y ausencia de doble digitación o fuente competidora                  |
| `TREQ-INTEGRATION-011` | movimientos de inventario exactamente una vez, parcialidad y conciliación                     |
| `TREQ-INTEGRATION-013` | cadena demanda–producción–calidad–inventario correlacionada e idempotente                     |
| `TREQ-INTEGRATION-067` | FOGO como emisora de producción y NEXO como emisora de movimientos derivados                  |
| `TREQ-INTEGRATION-102` | separación entre producción terminada, calidad, inventario y pedido cumplido                  |
| `TREQ-NEXO-006`        | remisión operativa frente a publicación real de inventario sin doble contabilización          |
| `TREQ-NEXO-010`        | unidad, conversión, disponibilidad y política equivalentes entre consumidores                 |
| `TREQ-NEXO-011`        | ledger, reservas, movimientos, idempotencia, compensación y prevención de sobreasignación     |
| `TREQ-NEXO-269`        | faltantes, reemplazos, receipts, cantidades y obligaciones correlacionadas                    |

**Resultado sobre requisitos:** cero requisitos `TREQ-*` creados, modificados, diferidos, descartados u obsoletos. El Registro 04A ya asigna las reglas aplicables a `INT-PROD-005`; esta tarea las consume y las materializa sin alterar su texto, identidad, estado ni relaciones.

---

#### 24. Criterios de aceptación

La tarea se considera documentalmente completa cuando:

1. distingue faltante, necesidad, decisión, plan, orden, ejecución, calidad, inventario, asignación, despacho, recepción y conciliación;
2. congela las tres políticas `STOCK_ONLY`, `STOCK_THEN_PRODUCTION` y `MAKE_TO_ORDER`;
3. impide que una remisión cree por sí sola producción aprobada;
4. asigna propiedad inequívoca entre NEXO, FOGO y SHELL;
5. define identidad, revisiones, idempotencia y conflicto de la necesidad;
6. materializa campos mínimos y decisiones de FOGO;
7. define estados completos del vínculo;
8. conserva cantidades originales y soporta parcialidad sin reducción silenciosa;
9. separa salida productiva, liberación de calidad, ingreso y asignación NEXO;
10. utiliza las definiciones `VPROC` vigentes sin crear un catálogo paralelo;
11. regula sustituciones, cancelaciones y resultados tardíos;
12. define fallos, timeouts, eventos fuera de orden y conciliación antes de reintento;
13. define controles de autorización y segregación;
14. preserva auditoría suficiente sin replicar información sensible;
15. vincula cada diferencia a una salida de conciliación;
16. entrega un handoff de implementación concreto sin ejecutar cambios físicos;
17. consume los requisitos vigentes sin alterar 04A;
18. reserva `PRINT-ARC-001` sin desarrollarla.

---

#### 25. Continuidad canónica

```text
ÚLTIMA TAREA APROBADA
NEXO-REMISSIONS-001::CONDITIONAL_DESIGN_ARTIFACTS — Resolver y aprobar CONDITIONAL_DESIGN_ARTIFACTS
        ↓
TAREA ACTUAL APROBADA
INT-PROD-005 — Definir tratamiento de producción insuficiente para remisiones
        ↓
SIGUIENTE TAREA RESERVADA
PRINT-ARC-001 — Inventariar impresoras por empresa, sede, área y punto operativo
```


POS EXTERNO → CONTRATO CANÓNICO DE VENTAS → NEXO / NUMERA / PASS

Principio de transición

Mientras PULSO no sea la fuente operativa y fiscal definitiva de ventas,
el POS vigente podrá actuar como fuente temporal de ventas confirmadas.

El POS externo será fuente temporal de:

- hecho de venta;
- líneas vendidas;
- documento fiscal emitido externamente;
- descuentos;
- impuestos;
- propinas;
- medios de pago;
- anulaciones y devoluciones.

El POS externo no será propietario de:

- inventario;
- recetas;
- costos;
- contabilidad interna;
- catálogo canónico de productos;
- fidelización;
- autorización laboral.
