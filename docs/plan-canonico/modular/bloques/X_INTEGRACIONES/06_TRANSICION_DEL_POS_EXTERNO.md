### MINI-BLOQUE — TRANSICIÓN DEL POS EXTERNO

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **transición del pos externo** dentro de **X INTEGRACIONES**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `INT-POS-001` a `INT-POS-024` — 24 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Auditar documentación, endpoints, webhooks y límites del POS vigente” y concluye con “Definir revocación o reducción de credenciales cuando PULSO asuma la fuente”.
<!-- PLAN-SECTION-META:END -->

### ✅ INT-POS-001 — Auditar documentación, endpoints, webhooks y límites del POS vigente

**Estado:** APROBADA  
**Tarea anterior:** `INT-PROD-005 — Definir tratamiento de producción insuficiente para remisiones`  
**Tarea siguiente:** `INT-POS-002 — Confirmar información disponible mediante API`  
**Tipo de tarea:** documental; auditoría AS-IS del POS externo vigente, de la evidencia técnica disponible, del mecanismo actual de importación hacia PULSO y de las capacidades de integración públicamente demostrables, sin implementar adaptadores, credenciales, endpoints, webhooks, polling, efectos internos, migraciones ni cambios remotos  
**Línea base documental:** `vento-shell@df1f08e51c7ce9a12e77f74cf2c49b2a3c899fef`  
**Línea base de implementación PULSO observada:** `vento-pulso@71e0184486b5fe11e0a42435baf4024807a80efd`  
**Repositorio propietario:** `vento-shell`  
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/06_TRANSICION_DEL_POS_EXTERNO.md`  
**Sistemas involucrados:** `Makos`, `PULSO`, `SHELL`; `NEXO`, `NUMERA` y `PASS` únicamente como consumidores futuros del contrato de venta validada  
**Cambios físicos autorizados:** ninguno

---

#### 1. Propósito

Auditar el POS externo vigente antes de diseñar su transición hacia el contrato canónico de ventas de Vento, separando rigurosamente:

- lo que está confirmado por la línea base canónica;
- lo que ya existe físicamente en Vento;
- lo que el proveedor publica de forma oficial;
- lo que todavía no está demostrado mediante documentación técnica o acceso del tenant;
- lo que corresponde resolver en las tareas posteriores `INT-POS`.

La tarea evita convertir una suposición sobre el proveedor en un contrato de integración.

Regla raíz:

```text
EVIDENCIA CANÓNICA DEL POS VIGENTE
+
EVIDENCIA DE IMPLEMENTACIÓN EXISTENTE
+
DOCUMENTACIÓN OFICIAL DEL PROVEEDOR
        ↓
CAPACIDAD CONFIRMADA / NO DEMOSTRADA / PENDIENTE DE CONFIRMACIÓN
        ↓
TAREA PROPIETARIA EXACTA PARA CADA BRECHA
        ↓
CERO ENDPOINTS, WEBHOOKS, LÍMITES O CREDENCIALES INVENTADOS
```

---

#### 2. Resultado de la auditoría

El POS externo vigente identificado por la evidencia operacional canónica es **Makos**.

La evidencia disponible permite afirmar simultáneamente:

1. Makos es el sistema registrado como `Makos / POS vigente` en la línea base AS-IS de Vento.
2. El acceso técnico del proveedor fue registrado como `POR_CONFIRMAR_ACCESO`; por tanto, la existencia y el alcance de una API utilizable por el tenant Vento no se dan por hechos.
3. La implementación actual demostrada en Vento no consume una API ni un webhook de Makos: utiliza una importación de archivo Excel identificada como `makos_excel`.
4. La implementación actual conserva lotes de importación por sede y fecha, hash del archivo, filas externas, cantidades y valores, y resuelve mapeos hacia productos de Vento.
5. La documentación pública oficial localizada de Makos demuestra capacidades generales de facturación, inventario, tesorería, informes, múltiples ubicaciones y consulta o exportación de información.
6. En la documentación pública oficial auditada no se encontró un catálogo técnico que permita congelar endpoints, autenticación, scopes, webhooks, paginación, rate limits, ventanas históricas, firmas, reintentos o garantías de entrega.
7. La ausencia de documentación pública localizada **no demuestra que Makos carezca de API o webhooks**. Esas capacidades quedan en estado `PENDIENTE_CONFIRMACION_PROVEEDOR_TENANT` y corresponden a las tareas posteriores.

---

#### 3. Clasificación de evidencia

| Estado de evidencia                       | Significado en este mini-bloque                                                                    |
| ----------------------------------------- | -------------------------------------------------------------------------------------------------- |
| `CONFIRMADO_CANONICO`                     | Existe una fuente documental aprobada de Vento que identifica el hecho o sistema.                  |
| `CONFIRMADO_IMPLEMENTACION`               | Existe código, migración o contrato físico vigente que demuestra el comportamiento.                |
| `CONFIRMADO_PUBLICO_PROVEEDOR`            | Existe documentación pública oficial del proveedor que demuestra la capacidad general.             |
| `NO_DEMOSTRADO_PUBLICAMENTE`              | No se localizó documentación pública oficial suficiente para congelar el detalle técnico.          |
| `PENDIENTE_CONFIRMACION_PROVEEDOR_TENANT` | Requiere evidencia del proveedor o del tenant de Vento antes de diseñar o implementar el contrato. |
| `NO_APLICA_A_ESTA_TAREA`                  | La decisión corresponde explícitamente a una tarea posterior y no se adelanta aquí.                |

`NO_DEMOSTRADO_PUBLICAMENTE` no equivale a `NO_EXISTE` ni a `NO_SOPORTADO`.

---

#### 4. Identidad y frontera del POS vigente

| Elemento                                           | Resultado                                              | Evidencia                                                                                    |
| -------------------------------------------------- | ------------------------------------------------------ | -------------------------------------------------------------------------------------------- |
| POS externo vigente                                | `Makos`                                                | `CONFIRMADO_CANONICO`                                                                        |
| Rol durante la transición                          | fuente externa temporal candidata para hechos de venta | definido por el mini-bloque `INT-POS`; la propiedad definitiva se congela en `INT-POS-003`   |
| Documento fiscal durante la transición             | permanece bajo responsabilidad del POS vigente         | regla ya congelada en el mini-bloque                                                         |
| Acceso técnico del tenant                          | `POR_CONFIRMAR_ACCESO`                                 | `CONFIRMADO_CANONICO` como estado de descubrimiento; capacidad técnica todavía no demostrada |
| Acceso directo del proveedor a Supabase            | prohibido                                              | regla del mini-bloque `INT-POS`                                                              |
| Escritura directa del proveedor en tablas internas | prohibida                                              | regla del mini-bloque `INT-POS`                                                              |
| Integración API productiva actual                  | no demostrada                                          | no se encontró cliente Makos/API en la implementación auditada                               |
| Integración webhook productiva actual              | no demostrada                                          | no se encontró receptor o contrato webhook Makos en la implementación auditada               |
| Mecanismo actual demostrado                        | importación Excel hacia PULSO                          | `CONFIRMADO_IMPLEMENTACION`                                                                  |

---

#### 5. Implementación física actual demostrada

La implementación vigente observada en Vento utiliza una ruta de importación diaria de ventas con fuente `makos_excel`.

La persistencia actual registra lotes de importación con, entre otros:

- `site_id`;
- `sales_date`;
- `source`;
- `source_file_name`;
- `source_file_hash`;
- estado del lote;
- conteos de filas y coincidencias;
- cantidad total;
- subtotal;
- impuestos;
- descuentos;
- devoluciones;
- venta neta;
- actor y momento de importación.

Las filas importadas conservan, entre otros:

- número de fila de origen;
- identificador externo de producto cuando existe;
- nombre externo de producto;
- categoría externa;
- cantidad;
- subtotal;
- impuestos;
- descuentos;
- devoluciones;
- venta neta y venta bruta;
- referencias internas de catálogo y producto cuando se resuelven;
- estado del mapeo y causa.

La aplicación PULSO observada procesa libros Excel y reconoce encabezados como:

- `ID`;
- `PRODUCTO`;
- `CATEGORÍA`;
- `CANTIDAD`;
- `SUBTOTAL`;
- `IMPUESTOS`;
- `DESCUENTOS`;
- `DEVOLUCIONES`.

La identidad del archivo se protege mediante hash y la base impide repetir el mismo hash para la misma combinación de sede, fecha y fuente.

Este control evita repetir exactamente un archivo ya registrado, pero **no equivale todavía a idempotencia canónica por venta y línea externa**, que pertenece a `INT-POS-013`.

---

#### 6. Límite del Excel actual frente al contrato objetivo

El flujo actual demuestra capacidad útil de conciliación agregada por producto, pero no demuestra por sí mismo un hecho canónico de venta individual.

En el contrato físico auditado no se observaron como campos obligatorios de cada fila importada:

- identificador externo de venta;
- identificador externo de línea de venta;
- timestamp autoritativo de la venta;
- estado transaccional de la venta;
- terminal o caja externa;
- cajero o actor externo;
- cliente cuando aplique;
- documento fiscal y su estado;
- propina;
- uno o varios medios de pago;
- referencias de pago;
- identidad individual de una anulación o reembolso;
- versión o secuencia de actualización de una venta.

Por tanto:

```text
IMPORTACIÓN DIARIA MAKOS_EXCEL
≠
CONTRATO CANÓNICO DE VENTA INDIVIDUAL
```

El flujo Excel vigente se conserva como evidencia y contingencia existente; no se promoverá silenciosamente a integración transaccional completa.

---

#### 7. Auditoría de documentación oficial pública de Makos

La documentación pública oficial localizada confirma capacidades generales del producto Makos relacionadas con:

- facturación;
- inventario;
- tesorería;
- informes;
- operación con múltiples ubicaciones;
- consulta y exportación de información;
- actualización de cumplimiento normativo del producto.

La auditoría pública no encontró evidencia técnica oficial suficiente para congelar los siguientes elementos:

| Elemento técnico                                   | Estado                       |
| -------------------------------------------------- | ---------------------------- |
| URL base de API                                    | `NO_DEMOSTRADO_PUBLICAMENTE` |
| versión de API                                     | `NO_DEMOSTRADO_PUBLICAMENTE` |
| mecanismo de autenticación                         | `NO_DEMOSTRADO_PUBLICAMENTE` |
| scopes o permisos                                  | `NO_DEMOSTRADO_PUBLICAMENTE` |
| endpoint de ventas                                 | `NO_DEMOSTRADO_PUBLICAMENTE` |
| endpoint de líneas                                 | `NO_DEMOSTRADO_PUBLICAMENTE` |
| endpoint de productos                              | `NO_DEMOSTRADO_PUBLICAMENTE` |
| endpoint de sedes, cajas o terminales              | `NO_DEMOSTRADO_PUBLICAMENTE` |
| endpoint de pagos                                  | `NO_DEMOSTRADO_PUBLICAMENTE` |
| endpoint de documentos fiscales                    | `NO_DEMOSTRADO_PUBLICAMENTE` |
| endpoint de anulaciones, devoluciones o reembolsos | `NO_DEMOSTRADO_PUBLICAMENTE` |
| filtros incrementales o cursores                   | `NO_DEMOSTRADO_PUBLICAMENTE` |
| paginación                                         | `NO_DEMOSTRADO_PUBLICAMENTE` |
| rate limits                                        | `NO_DEMOSTRADO_PUBLICAMENTE` |
| ventana o retención histórica                      | `NO_DEMOSTRADO_PUBLICAMENTE` |
| webhooks disponibles                               | `NO_DEMOSTRADO_PUBLICAMENTE` |
| catálogo de eventos webhook                        | `NO_DEMOSTRADO_PUBLICAMENTE` |
| firma o autenticación de webhook                   | `NO_DEMOSTRADO_PUBLICAMENTE` |
| política de reintento webhook                      | `NO_DEMOSTRADO_PUBLICAMENTE` |
| orden o garantía de entrega                        | `NO_DEMOSTRADO_PUBLICAMENTE` |
| mecanismo de replay o recuperación                 | `NO_DEMOSTRADO_PUBLICAMENTE` |

Todos estos elementos pasan a `PENDIENTE_CONFIRMACION_PROVEEDOR_TENANT` cuando sean necesarios para la transición.

---

#### 8. Información que debe confirmar `INT-POS-002`

`INT-POS-002 — Confirmar información disponible mediante API` deberá resolver con evidencia del proveedor o del tenant, sin inferir desde la interfaz de usuario:

1. si Vento dispone de una API habilitable o habilitada;
2. modalidad de acceso y ambiente;
3. versión y estabilidad contractual;
4. objetos consultables;
5. campos reales de venta y línea;
6. identificadores estables de venta, línea, producto, sede, terminal y documento;
7. timestamps disponibles y su semántica;
8. estados y revisiones de ventas;
9. descuentos, impuestos y propinas;
10. medios y estados de pago;
11. anulaciones, devoluciones y reembolsos;
12. documentos fiscales y referencias consultables;
13. filtros, cursores, paginación y ordenamiento;
14. límites de consulta;
15. ventanas históricas o retención;
16. consistencia entre consulta inicial y consulta posterior;
17. cualquier restricción por plan, país, empresa o tenant.

Si la evidencia del proveedor sigue siendo insuficiente, `INT-POS-002` deberá conservar explícitamente el resultado no concluyente y no crear un contrato imaginario.

---

#### 9. Distribución exacta de brechas hacia tareas posteriores

| Brecha o decisión pendiente                                                                                 | Tarea propietaria                                                                                                            |
| ----------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| Confirmar existencia, objetos, campos, endpoints y límites reales de API                                    | `INT-POS-002 — Confirmar información disponible mediante API`                                                                |
| Congelar a Makos como fuente temporal del hecho de venta y sus límites de autoridad                         | `INT-POS-003 — Definir al POS vigente como fuente temporal del hecho de venta`                                               |
| Diseñar credencial independiente, revocable y de solo lectura                                               | `INT-POS-004 — Definir requisitos y procedimiento de una credencial independiente, revocable e inicialmente de solo lectura` |
| Definir identidad y semántica de venta y línea canónicas                                                    | `INT-POS-005 — Definir contrato canónico de venta y línea de venta`                                                          |
| Encabezados, líneas, estados y timestamps                                                                   | `INT-POS-006 — Definir importación de encabezados, líneas, estados y timestamps`                                             |
| Descuentos, impuestos, propinas y medios de pago                                                            | `INT-POS-007 — Definir importación de descuentos, impuestos, propinas y medios de pago`                                      |
| Anulaciones, devoluciones y reembolsos                                                                      | `INT-POS-008 — Definir importación de anulaciones, devoluciones y reembolsos`                                                |
| Payload original, versión, hash y recepción                                                                 | `INT-POS-009 — Definir conservación de payload original, versión, hash y fecha de recepción`                                 |
| Empresa, sede, terminal y caja externas                                                                     | `INT-POS-010 — Definir mapeo de empresa, sede, terminal y caja externa`                                                      |
| Producto, presentación y receta                                                                             | `INT-POS-011 — Definir mapeo de producto externo, producto Vento, presentación y receta`                                     |
| Filas sin mapeo                                                                                             | `INT-POS-012 — Definir cuarentena de líneas sin mapeo y sin descuento de inventario`                                         |
| Idempotencia de venta y línea externa                                                                       | `INT-POS-013 — Definir idempotencia por sistema, venta y línea externa`                                                      |
| Disponibilidad de webhook, catálogo de eventos, seguridad, reintentos, polling y frecuencia de conciliación | `INT-POS-014 — Definir webhook cuando exista y polling de conciliación como respaldo`                                        |
| Evento interno de venta validada                                                                            | `INT-POS-015 — Definir emisión del evento canónico de venta validada`                                                        |
| Movimiento NEXO                                                                                             | `INT-POS-016 — Definir salida de inventario en NEXO exactamente una vez`                                                     |
| Efecto económico NUMERA                                                                                     | `INT-POS-017 — Definir evento económico para NUMERA exactamente una vez`                                                     |
| Fidelización PASS                                                                                           | `INT-POS-018 — Definir evento de fidelización para PASS cuando corresponda`                                                  |
| Compensación de anulaciones y devoluciones                                                                  | `INT-POS-019 — Definir compensación de anulaciones y devoluciones sin borrar historia`                                       |
| Conciliación entre fuente externa y efectos Vento                                                           | `INT-POS-020 — Definir conciliación diaria entre POS y efectos internos`                                                     |
| Prueba sin efectos internos                                                                                 | `INT-POS-021 — Diseñar piloto sin efectos sobre inventario ni finanzas`                                                      |
| Prueba con efectos habilitados                                                                              | `INT-POS-022 — Diseñar piloto controlado con efectos habilitados`                                                            |
| Reemplazo futuro de la fuente externa                                                                       | `INT-POS-023 — Definir transición futura desde POS externo hacia PULSO`                                                      |
| Retiro o reducción de credenciales externas                                                                 | `INT-POS-024 — Definir revocación o reducción de credenciales cuando PULSO asuma la fuente`                                  |

No queda una brecha técnica de esta auditoría sin tarea propietaria dentro del mini-bloque.

---

#### 10. Reglas de decisión congeladas por la auditoría

1. No se documentará una API Makos como disponible para Vento hasta disponer de evidencia verificable del proveedor o tenant.
2. No se inventarán endpoints, parámetros, scopes, límites, eventos webhook ni garantías de entrega.
3. Una capacidad visible en la aplicación Makos no prueba que exista mediante API.
4. Una capacidad exportable no prueba que sea consultable transaccionalmente ni en tiempo real.
5. El Excel actual es evidencia de una integración por archivo, no de una integración API.
6. El hash actual del archivo protege la repetición del mismo lote importado, pero no sustituye la identidad externa de venta y línea.
7. La importación actual no habilita por sí sola efectos automáticos sobre NEXO, NUMERA o PASS.
8. Una futura integración con Makos deberá atravesar el adaptador y staging definidos por el mini-bloque; Makos no escribirá directamente en tablas de Vento ni recibirá acceso directo a Supabase.
9. Una línea sin mapeo permanecerá sin efecto de inventario.
10. La responsabilidad fiscal externa durante la transición no convierte a Makos en propietaria de inventario, costos, contabilidad interna, catálogo canónico o fidelización de Vento.
11. Webhook y polling no se elegirán por preferencia arquitectónica antes de confirmar qué ofrece realmente el proveedor.
12. El flujo Excel podrá mantenerse como contingencia o fuente auxiliar únicamente si las tareas posteriores definen explícitamente su semántica y conciliación.

---

#### 11. Riesgos identificados

| Riesgo                                                 | Control documental                                                                  |
| ------------------------------------------------------ | ----------------------------------------------------------------------------------- |
| Diseñar contra endpoints inexistentes o no habilitados | bloquear detalle técnico hasta `INT-POS-002`                                        |
| Confundir exportación agregada con venta individual    | separar expresamente Excel actual del contrato de venta de `INT-POS-005`            |
| Duplicar efectos al volver a importar                  | conservar hash de lote actual y definir idempotencia transaccional en `INT-POS-013` |
| Descontar inventario con producto externo no resuelto  | aplicar cuarentena de `INT-POS-012` antes de `INT-POS-016`                          |
| Perder reversos                                        | materializar semántica en `INT-POS-008` y compensación en `INT-POS-019`             |
| Perder ventas por depender solo de push                | resolver webhook y polling de respaldo en `INT-POS-014`                             |
| Exponer credenciales con alcance excesivo              | aplicar `INT-POS-004`                                                               |
| Considerar la transición como PULSO terminado          | preservar `INT-POS-023` y la regla de transición temporal                           |

---

#### 12. Criterios de aceptación

La auditoría se considera documentalmente completa porque:

1. identifica inequívocamente a Makos como POS vigente observado;
2. preserva `POR_CONFIRMAR_ACCESO` como límite del descubrimiento técnico;
3. diferencia capacidad pública general de capacidad técnica de integración;
4. registra que la implementación física actual demostrada usa `makos_excel`;
5. documenta los campos efectivamente presentes en el importador existente;
6. evidencia que el Excel actual no contiene el contrato individual completo de venta y línea;
7. no afirma la existencia ni ausencia definitiva de API o webhooks sin evidencia del proveedor;
8. no inventa URL base, versión, endpoints, scopes, límites ni eventos;
9. remite la confirmación API a `INT-POS-002`;
10. remite credenciales a `INT-POS-004`;
11. remite webhook y polling a `INT-POS-014`;
12. asigna cada brecha funcional restante a una tarea `INT-POS` exacta;
13. mantiene la frontera obligatoria adaptador → staging → validación → mapeo → contrato canónico;
14. no habilita efectos físicos, económicos o de fidelización;
15. no altera el Registro 04A ni redefine requisitos históricos.

---

#### 13. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

La tarea es una auditoría documental de capacidades y evidencia. No introduce comportamiento objetivo nuevo, no cambia una regla empresarial, no modifica una frontera de autorización y no reemplaza requisitos vigentes. Las decisiones ejecutables quedan reservadas a `INT-POS-002` a `INT-POS-024`.

#### 14. Cobertura de prueba existente preservada

Se conserva sin modificación la cobertura ya vigente, incluyendo:

- `TREQ-PULSO-005`, que protege la separación del ciclo comercial, estados y hechos relacionados;
- `TREQ-PULSO-006`, que protege venta, pago, documento fiscal, descuento, propina, anulación, devolución, reembolso, compensación y conciliación como hechos autorizados y auditables;
- `TREQ-INTEGRATION-014`, ya relacionado canónicamente con la integración y continuidad de los flujos comerciales externos.

Ningún requisito existente cambia de identidad, texto, estado, relación, propietario, evidencia ni secuencia por esta tarea.

---

#### 15. Continuidad

**ÚLTIMA TAREA APROBADA**  
`INT-PROD-005 — Definir tratamiento de producción insuficiente para remisiones`

**TAREA ACTUAL APROBADA**  
`INT-POS-001 — Auditar documentación, endpoints, webhooks y límites del POS vigente`

**SIGUIENTE TAREA RESERVADA**  
`INT-POS-002 — Confirmar información disponible mediante API`


### ✅ INT-POS-002 — Confirmar información disponible mediante API

**Estado:** APROBADA  
**Tarea anterior:** `INT-POS-001 — Auditar documentación, endpoints, webhooks y límites del POS vigente`  
**Tarea siguiente:** `INT-POS-003 — Definir al POS vigente como fuente temporal del hecho de venta`  
**Tipo de tarea:** documental; confirmación de disponibilidad técnica de la API del POS externo vigente y clasificación de la evidencia realmente disponible, sin solicitar credenciales, iniciar integración, definir endpoints por inferencia, implementar adaptadores, ejecutar webhooks, modificar Supabase ni producir efectos internos  
**Línea base documental:** `vento-shell@ca823d550fa28f9246f2f296683aa70f63f1d6c0`  
**Repositorio propietario:** `vento-shell`  
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/06_TRANSICION_DEL_POS_EXTERNO.md`  
**Sistema externo confirmado:** `Makos`  
**Aplicación objetivo futura:** `PULSO`  
**Cambios físicos autorizados:** ninguno

---

#### 1. Propósito

Confirmar qué puede afirmarse de la integración API de Makos después de incorporar la evidencia directa comunicada por el titular de Vento, sin convertir esa confirmación comercial u operativa en una especificación técnica inexistente.

La tarea resuelve la incertidumbre dejada por `INT-POS-001` sobre la existencia de una API habilitable para Vento y conserva como no demostrados todos los detalles técnicos que todavía no han sido entregados por el proveedor.

Regla raíz:

```text
CONFIRMACIÓN DIRECTA DEL PROVEEDOR TRANSMITIDA AL TITULAR DE VENTO
        ↓
API HABILITABLE BAJO SOLICITUD
        ↓
PROVISIONAMIENTO Y ACOMPAÑAMIENTO DEL DESARROLLADOR DE MAKOS
        ↓
SIN ESPECIFICACIÓN, CREDENCIALES NI CONTRATO TÉCNICO ENTREGADOS TODAVÍA
        ↓
CERO ENDPOINTS, CAMPOS, LÍMITES O WEBHOOKS INVENTADOS
```

---

#### 2. Evidencia incorporada

El titular de Vento confirma que Makos le informó directamente lo siguiente:

1. la API para la integración no se encuentra publicada como un recurso autogestionado del cliente;
2. la habilitación o generación de la API debe solicitarse al desarrollador de Makos;
3. Makos indicó que su desarrollador se comunicaría directamente con Vento para realizar o acompañar la integración;
4. Vento no inició ese proceso y no recibió una especificación técnica, credenciales ni contrato de integración;
5. por tanto, la ausencia actual de credenciales o documentación técnica no significa que la API no exista, sino que todavía no fue provisionada para Vento.

Esta evidencia cambia la clasificación de la capacidad desde `PENDIENTE_CONFIRMACION_PROVEEDOR_TENANT` sobre la existencia de la API a una confirmación de **API habilitable bajo solicitud**, pero no confirma todavía su contrato técnico.

---

#### 3. Clasificación de evidencia utilizada

| Estado                                  | Significado                                                                                                                         |
| --------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| `CONFIRMADO_PROVEEDOR_VIA_TITULAR`      | El titular de Vento recibió directamente del proveedor la confirmación indicada y la incorpora como evidencia operativa del tenant. |
| `CONFIRMADO_HABILITABLE`                | La capacidad existe para Vento bajo un proceso de solicitud o provisionamiento del proveedor.                                       |
| `NO_PROVISIONADO`                       | Vento no dispone todavía de credencial, especificación o acceso técnico emitido para esa integración.                               |
| `PENDIENTE_EVIDENCIA_TECNICA_PROVEEDOR` | El detalle solo podrá congelarse cuando Makos entregue evidencia técnica verificable para el tenant.                                |
| `NO_APLICA_A_ESTA_TAREA`                | La definición pertenece a otra tarea del mini-bloque y no se adelanta aquí.                                                         |

`CONFIRMADO_HABILITABLE` no equivale a `HABILITADO_EN_PRODUCCION`, y `PENDIENTE_EVIDENCIA_TECNICA_PROVEEDOR` no equivale a `NO_SOPORTADO`.

---

#### 4. Resultado material de la confirmación

La situación de Makos queda congelada documentalmente así:

| Elemento                                             | Resultado                                                                                       |
| ---------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| Existencia de una API habilitable para Vento         | `CONFIRMADO_HABILITABLE`                                                                        |
| Forma de obtención                                   | solicitud al desarrollador de Makos                                                             |
| Participación del proveedor                          | el desarrollador de Makos ofreció comunicación directa para realizar o acompañar la integración |
| API actualmente provisionada a Vento                 | `NO_PROVISIONADO`                                                                               |
| Credenciales actualmente recibidas                   | `NO_PROVISIONADO`                                                                               |
| Especificación técnica actualmente recibida          | `NO_PROVISIONADO`                                                                               |
| Integración API Makos → Vento actualmente iniciada   | no                                                                                              |
| Integración API Makos → Vento actualmente productiva | no demostrada                                                                                   |
| Cliente API Makos implementado en Vento              | no demostrado                                                                                   |
| Webhook Makos implementado en Vento                  | no demostrado                                                                                   |
| Mecanismo de integración actualmente demostrado      | importación `makos_excel` documentada en `INT-POS-001`                                          |

Conclusión:

```text
MAKOS TIENE UNA VÍA DE INTEGRACIÓN API HABILITABLE PARA VENTO

pero

VENTO TODAVÍA NO TIENE EL CONTRATO TÉCNICO DE ESA API
```

---

#### 5. Confirmación de los diecisiete puntos heredados de INT-POS-001

|   Nº | Información requerida                                                          | Resultado de INT-POS-002                                                       | Tarea propietaria del detalle aún no demostrado            |
| ---: | ------------------------------------------------------------------------------ | ------------------------------------------------------------------------------ | ---------------------------------------------------------- |
|    1 | API habilitable o habilitada                                                   | `CONFIRMADO_HABILITABLE`; no se demuestra que esté actualmente habilitada      | `INT-POS-004` para provisionamiento y credencial           |
|    2 | modalidad de acceso y ambiente                                                 | se confirma provisionamiento asistido por desarrollador; ambiente no entregado | `INT-POS-004`                                              |
|    3 | versión y estabilidad contractual                                              | `PENDIENTE_EVIDENCIA_TECNICA_PROVEEDOR`                                        | `INT-POS-006`                                              |
|    4 | objetos consultables                                                           | `PENDIENTE_EVIDENCIA_TECNICA_PROVEEDOR`                                        | `INT-POS-006`, `INT-POS-007` e `INT-POS-008` según dominio |
|    5 | campos reales de venta y línea                                                 | `PENDIENTE_EVIDENCIA_TECNICA_PROVEEDOR`                                        | `INT-POS-006`                                              |
|    6 | identificadores estables de venta, línea, producto, sede, terminal y documento | `PENDIENTE_EVIDENCIA_TECNICA_PROVEEDOR`                                        | `INT-POS-006`, `INT-POS-010` e `INT-POS-011`               |
|    7 | timestamps y semántica temporal                                                | `PENDIENTE_EVIDENCIA_TECNICA_PROVEEDOR`                                        | `INT-POS-006`                                              |
|    8 | estados y revisiones de ventas                                                 | `PENDIENTE_EVIDENCIA_TECNICA_PROVEEDOR`                                        | `INT-POS-006`                                              |
|    9 | descuentos, impuestos y propinas                                               | `PENDIENTE_EVIDENCIA_TECNICA_PROVEEDOR`                                        | `INT-POS-007`                                              |
|   10 | medios y estados de pago                                                       | `PENDIENTE_EVIDENCIA_TECNICA_PROVEEDOR`                                        | `INT-POS-007`                                              |
|   11 | anulaciones, devoluciones y reembolsos                                         | `PENDIENTE_EVIDENCIA_TECNICA_PROVEEDOR`                                        | `INT-POS-008`                                              |
|   12 | documentos fiscales y referencias consultables                                 | `PENDIENTE_EVIDENCIA_TECNICA_PROVEEDOR`                                        | `INT-POS-006` y `INT-POS-007`                              |
|   13 | filtros, cursores, paginación y ordenamiento                                   | `PENDIENTE_EVIDENCIA_TECNICA_PROVEEDOR`                                        | `INT-POS-014`                                              |
|   14 | límites de consulta                                                            | `PENDIENTE_EVIDENCIA_TECNICA_PROVEEDOR`                                        | `INT-POS-014`                                              |
|   15 | ventanas históricas o retención                                                | `PENDIENTE_EVIDENCIA_TECNICA_PROVEEDOR`                                        | `INT-POS-014`                                              |
|   16 | consistencia entre consulta inicial y posterior                                | `PENDIENTE_EVIDENCIA_TECNICA_PROVEEDOR`                                        | `INT-POS-014`                                              |
|   17 | restricciones por plan, país, empresa o tenant                                 | `PENDIENTE_EVIDENCIA_TECNICA_PROVEEDOR`                                        | `INT-POS-004`                                              |

Los puntos pendientes no se transforman en supuestos. Cada uno queda ligado a la tarea que necesita ese dato para definir el contrato correspondiente.

---

#### 6. Frontera entre confirmación y especificación técnica

Esta tarea confirma la **disponibilidad condicionada** de la API, no su diseño.

Por tanto, permanecen prohibidas por inferencia en esta etapa:

- URL base;
- versión;
- protocolo de autenticación;
- nombre o formato de credenciales;
- scopes;
- endpoints;
- métodos HTTP;
- parámetros;
- payloads;
- campos;
- códigos de error;
- rate limits;
- paginación;
- retención;
- webhooks;
- firmas;
- reintentos;
- SLA;
- garantías de consistencia.

Esos elementos solo podrán incorporarse cuando exista evidencia técnica verificable entregada por Makos para el tenant de Vento.

---

#### 7. Relación con la estrategia del POS propio

La disponibilidad de una API de Makos no cambia la arquitectura objetivo de Vento.

El mini-bloque `INT-POS-001` a `INT-POS-024` continúa siendo un bloque de **transición del POS externo**. Makos puede servir como fuente temporal y como puente de integración mientras exista, pero no se convierte por esta confirmación en el POS objetivo de Vento.

La construcción del POS propio permanece en `BLOQUE N — PULSO`, donde:

- `PULSO-AUTH-001` a `PULSO-AUTH-016` gobiernan autorización de venta y caja;
- `PULSO-UX-001` a `PULSO-UX-021` gobiernan experiencia POS y operación comercial;
- `PULSO-UX-021` diseña la arquitectura funcional y técnica del POS integral objetivo.

Dentro del mini-bloque actual, `INT-POS-023` preserva la transición futura desde el POS externo hacia PULSO y `INT-POS-024` preserva la revocación o reducción de credenciales cuando PULSO asuma la fuente.

Por tanto:

```text
INTEGRAR MAKOS, SI RESULTA NECESARIO COMO TRANSICIÓN
≠
CONSTRUIR EL POS DEFINITIVO SOBRE MAKOS
```

---

#### 8. Regla de contacto técnico con Makos

Cuando una tarea posterior requiera activar la integración, el contacto con el desarrollador de Makos se tratará como una interacción técnica entre proveedores y Vento, no como una obligación del titular de Vento de implementar personalmente el código.

La información mínima que deberá obtenerse antes de cualquier implementación será la especificación efectiva del tenant necesaria para la tarea propietaria correspondiente. Ninguna credencial se documentará en texto plano dentro del plan canónico ni se entregará acceso directo a Supabase.

Esta tarea no solicita todavía la activación de la API ni inicia una integración remota.

---

#### 9. Decisiones congeladas

1. Makos dispone para Vento de una vía de API habilitable bajo solicitud al desarrollador del proveedor.
2. La API no se considera actualmente provisionada, habilitada en producción ni técnicamente especificada para Vento.
3. La oferta de acompañamiento directo del desarrollador de Makos confirma un modelo de integración asistida por el proveedor.
4. No se inferirá ningún detalle técnico a partir de la interfaz, el Excel actual o una descripción comercial.
5. La ausencia de especificación técnica actual no bloquea el diseño documental general del mini-bloque, pero sí impide congelar detalles dependientes del contrato real del proveedor.
6. Cada detalle no demostrado queda vinculado a una tarea posterior exacta antes de que sea necesario para diseño o implementación.
7. Makos permanece como sistema externo de transición; PULSO permanece como POS integral objetivo de Vento.
8. Esta confirmación no autoriza solicitar credenciales, compartir secretos, crear endpoints, desplegar adaptadores ni modificar Supabase.

---

#### 10. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea cambia el estado documental de la evidencia sobre disponibilidad de una API externa, pero no introduce ni modifica comportamiento ejecutable de Vento, reglas de negocio, autorización, transformaciones, transiciones, integridad o contratos técnicos verificables. Crear una prueba sobre endpoints, límites o payloads todavía no entregados por Makos fabricaría una especificación inexistente. Los comportamientos de venta, pago, reversión e integración continúan cubiertos por los requisitos canónicos vigentes y los detalles técnicos producirán requisitos únicamente cuando una tarea posterior materialice un contrato verificable.

#### 11. Cobertura de prueba existente preservada

Se conserva sin modificación la cobertura vigente, incluyendo `TREQ-PULSO-005` y `TREQ-PULSO-006` para el ciclo comercial, venta, pago, fiscalidad y reversos. Ningún requisito existente cambia de identidad, texto, estado, relación, propietario, evidencia ni secuencia por esta tarea.

---

#### 12. Criterios de aceptación

La tarea queda documentalmente completa porque:

1. resuelve la incertidumbre sobre si Makos dispone de una API habilitable para Vento;
2. documenta que el acceso depende de solicitud y provisionamiento por el desarrollador de Makos;
3. registra que el proveedor ofreció acompañamiento directo para la integración;
4. distingue API habilitable de API ya provisionada o productiva;
5. declara que Vento todavía no recibió especificación técnica ni credenciales;
6. materializa los diecisiete puntos heredados de `INT-POS-001` con estado explícito;
7. asigna cada detalle técnico todavía no demostrado a una tarea propietaria exacta;
8. no inventa endpoints, campos, scopes, límites, webhooks ni garantías;
9. no solicita ni expone credenciales;
10. no implementa código, adaptadores, webhooks, migraciones ni efectos internos;
11. confirma que este mini-bloque gobierna la transición desde Makos y no la construcción definitiva del POS propio;
12. preserva a PULSO como POS integral objetivo dentro de `BLOQUE N`;
13. genera cero cambios `TREQ-*`;
14. mantiene reservada exclusivamente `INT-POS-003` como continuidad inmediata.

---

#### 13. Continuidad

**ÚLTIMA TAREA APROBADA**  
`INT-POS-001 — Auditar documentación, endpoints, webhooks y límites del POS vigente`

**TAREA ACTUAL APROBADA**  
`INT-POS-002 — Confirmar información disponible mediante API`

**SIGUIENTE TAREA RESERVADA**  
`INT-POS-003 — Definir al POS vigente como fuente temporal del hecho de venta`


### [ ] INT-POS-003 — Definir al POS vigente como fuente temporal del hecho de venta
### [ ] INT-POS-004 — Definir requisitos y procedimiento de una credencial independiente, revocable e inicialmente de solo lectura
### [ ] INT-POS-005 — Definir contrato canónico de venta y línea de venta
### [ ] INT-POS-006 — Definir importación de encabezados, líneas, estados y timestamps
### [ ] INT-POS-007 — Definir importación de descuentos, impuestos, propinas y medios de pago
### [ ] INT-POS-008 — Definir importación de anulaciones, devoluciones y reembolsos
### [ ] INT-POS-009 — Definir conservación de payload original, versión, hash y fecha de recepción
### [ ] INT-POS-010 — Definir mapeo de empresa, sede, terminal y caja externa
### [ ] INT-POS-011 — Definir mapeo de producto externo, producto Vento, presentación y receta
### [ ] INT-POS-012 — Definir cuarentena de líneas sin mapeo y sin descuento de inventario
### [ ] INT-POS-013 — Definir idempotencia por sistema, venta y línea externa
### [ ] INT-POS-014 — Definir webhook cuando exista y polling de conciliación como respaldo
### [ ] INT-POS-015 — Definir emisión del evento canónico de venta validada
### [ ] INT-POS-016 — Definir salida de inventario en NEXO exactamente una vez
### [ ] INT-POS-017 — Definir evento económico para NUMERA exactamente una vez
### [ ] INT-POS-018 — Definir evento de fidelización para PASS cuando corresponda
### [ ] INT-POS-019 — Definir compensación de anulaciones y devoluciones sin borrar historia
### [ ] INT-POS-020 — Definir conciliación diaria entre POS y efectos internos
### [ ] INT-POS-021 — Diseñar piloto sin efectos sobre inventario ni finanzas
### [ ] INT-POS-022 — Diseñar piloto controlado con efectos habilitados
### [ ] INT-POS-023 — Definir transición futura desde POS externo hacia PULSO
### [ ] INT-POS-024 — Definir revocación o reducción de credenciales cuando PULSO asuma la fuente

Flujo obligatorio:

```text
POS EXTERNO
        ↓
ADAPTADOR DEL PROVEEDOR
        ↓
STAGING Y PAYLOAD ORIGINAL
        ↓
VALIDACIÓN E IDEMPOTENCIA
        ↓
MAPEO DE SEDES Y PRODUCTOS
        ↓
CONTRATO CANÓNICO DE VENTA
        ├── NEXO
        ├── NUMERA
        └── PASS, cuando corresponda
```

Reglas:

- el proveedor no escribirá directamente en tablas internas;
- el proveedor no recibirá acceso a Supabase;
- una línea sin mapeo no descontará inventario;
- una venta duplicada no producirá efectos adicionales;
- una devolución generará una compensación auditable;
- el documento fiscal seguirá siendo responsabilidad del POS vigente;
- la integración temporal no se considerará implementación completa de PULSO.
