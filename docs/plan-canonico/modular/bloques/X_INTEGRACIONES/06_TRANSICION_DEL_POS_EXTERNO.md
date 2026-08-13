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


### ✅ INT-POS-003 — Definir al POS vigente como fuente temporal del hecho de venta

**Estado:** APROBADA  
**Tarea anterior:** `INT-POS-002 — Confirmar información disponible mediante API`  
**Tarea siguiente:** `INT-POS-004 — Definir requisitos y procedimiento de una credencial independiente, revocable e inicialmente de solo lectura`  
**Tipo de tarea:** documental; definición contractual de la autoridad temporal de Makos como sistema de origen de ventas durante la transición hacia PULSO, con frontera explícita frente a inventario, fidelización, finanzas, documento fiscal, transporte de integración y corte de fuente, sin implementar credenciales, adaptadores, endpoints, webhooks, migraciones ni efectos internos  
**Línea base documental:** `vento-shell@ab8fa7424ecd2740084e6655b4ab75218c2ecdfd`  
**Repositorio propietario:** `vento-shell`  
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/06_TRANSICION_DEL_POS_EXTERNO.md`  
**POS externo vigente:** `Makos`  
**POS integral objetivo:** `PULSO`  
**Cambios físicos autorizados:** ninguno

---

#### 1. Propósito

Definir con precisión qué significa que Makos sea la fuente temporal del hecho de venta mientras Vento completa la transición hacia PULSO, sin convertir al POS externo en propietario de inventario, fidelización, contabilidad interna, catálogo canónico, autorización ni arquitectura objetivo.

La tarea materializa para Makos la decisión ya aprobada en `CAP-SCOPE-009`:

```text
POS EXTERNO VIGENTE
→ FUENTE TEMPORAL DEL HECHO DE VENTA
→ ADAPTADOR Y STAGING
→ CONTRATO CANÓNICO DE VENTA
→ CONSUMIDORES INTERNOS

PULSO
→ FUENTE OBJETIVO DESPUÉS DEL CORTE
→ MISMO CONTRATO CANÓNICO DE VENTA
→ MISMOS CONSUMIDORES INTERNOS
```

La transición deberá conservar una sola fuente de origen para cada venta y evitar que el mecanismo de integración se convierta en una segunda fuente empresarial.

---

#### 2. Decisión principal

Mientras una sede y terminal permanezcan dentro del alcance operativo del POS externo, **Makos será la fuente temporal del hecho de venta originado en ese alcance**.

Cuando el corte aprobado traslade una sede y terminal a PULSO, **PULSO será la fuente de las nuevas ventas originadas desde la fecha efectiva del corte**.

La autoridad temporal se define por origen y vigencia, no por tecnología de transporte.

Por tanto:

```text
MAKOS POR EXCEL
=
MAKOS POR API
=
MAKOS POR OTRO MECANISMO AUTORIZADO

respecto al sistema de origen del hecho
```

pero:

```text
TRANSPORTE
≠
FUENTE DE VERDAD EMPRESARIAL
```

El archivo, endpoint, webhook, polling, adaptador o staging que transporte el dato nunca sustituirá a Makos como sistema de origen ni se convertirá en propietario del hecho de venta.

---

#### 3. Significado de “fuente temporal del hecho de venta”

La definición se limita al hecho comercial originado en Makos durante la transición.

Implica que:

1. la existencia del hecho externo y su procedencia deberán conservar a Makos como sistema de origen;
2. una representación recibida desde Makos deberá conservar trazabilidad suficiente para demostrar de qué fuente provino;
3. la normalización interna no podrá alterar el sistema de origen ni crear una segunda venta equivalente;
4. una corrección, anulación, devolución o revisión asociada a una venta originada en Makos deberá conservar correlación con el hecho original y no crear una venta PULSO independiente para sustituirla;
5. los consumidores internos recibirán el contrato canónico validado y no deberán depender del formato particular con el que Makos haya entregado la información;
6. la autoridad temporal de Makos terminará únicamente mediante el corte controlado definido por sede, terminal y fecha efectiva.

Esta tarea no define todavía los campos físicos, identificadores externos, payloads ni endpoints con los que se demostrará esa procedencia. Esa materialización pertenece a las tareas posteriores del mini-bloque.

---

#### 4. Frontera de autoridad

La autoridad temporal de Makos no se extiende a otros dominios empresariales de Vento.

| Hecho o responsabilidad                            | Autoridad durante la transición                 | Regla                                                                         |
| -------------------------------------------------- | ----------------------------------------------- | ----------------------------------------------------------------------------- |
| Venta originada en el POS externo                  | Makos como sistema de origen temporal           | se adapta y valida antes de producir efectos internos                         |
| Venta originada después del corte en PULSO         | PULSO                                           | no se recrea en Makos como segunda fuente interna                             |
| Contrato canónico consumido dentro de Vento        | Vento mediante el flujo de integración aprobado | el formato externo no gobierna a los consumidores                             |
| Inventario y movimientos físicos                   | NEXO                                            | Makos no descuenta ni corrige inventario interno directamente                 |
| Fidelización                                       | PASS                                            | Makos no modifica saldo, ledger o redenciones de PASS directamente            |
| Hecho económico interno                            | NUMERA                                          | Makos no contabiliza ni modifica el hecho económico interno                   |
| Documento fiscal durante la transición             | POS o proveedor fiscal autorizado               | Vento conserva referencia y estado sin asumir emisión no autorizada           |
| Catálogo, producto, presentación y receta de Vento | dominio canónico interno correspondiente        | los identificadores Makos requieren mapeo; no sustituyen identidades internas |
| Autorización empresarial                           | modelo de autorización Vento                    | una credencial Makos no concede permisos empresariales internos               |

La integración no transferirá propiedad empresarial desde las aplicaciones propietarias hacia Makos.

---

#### 5. Regla de fuente única

Para una misma venta no podrán coexistir Makos y PULSO como fuentes activas.

La transición deberá resolver la fuente mediante:

- sede;
- terminal;
- fecha efectiva de corte.

Dentro de un alcance todavía no cortado:

```text
ORIGEN DE NUEVA VENTA = MAKOS
```

Dentro de un alcance ya cortado:

```text
ORIGEN DE NUEVA VENTA = PULSO
```

Queda prohibido:

- crear en PULSO una segunda venta para representar una venta que ya tiene origen Makos;
- tratar una importación repetida de Makos como una nueva venta;
- permitir que un consumidor interno decida por su cuenta cuál de dos fuentes competidoras es la válida;
- activar simultáneamente ambos orígenes para la misma sede, terminal y periodo efectivo;
- modificar retrospectivamente el sistema de origen de una venta para simplificar conciliaciones.

---

#### 6. Corte y temporalidad

El corte no será una sustitución global instantánea de Makos por PULSO.

La unidad mínima aprobada para gobernar la transición será:

```text
SEDE
+
TERMINAL
+
FECHA EFECTIVA
```

Esto permite que durante una transición controlada existan alcances distintos con fuentes diferentes, sin que una misma venta tenga doble origen.

Una venta cuyo hecho corresponda al periodo anterior al corte conservará origen Makos aunque su recepción, conciliación o recuperación ocurra después. Una venta nueva dentro del alcance posterior al corte deberá originarse en PULSO.

La lógica exacta para conciliación diaria, recuperación y tratamiento de diferencias pertenece a `INT-POS-020`, y el procedimiento de transición hacia PULSO pertenece a `INT-POS-023`.

---

#### 7. Transporte independiente de la autoridad

La decisión de fuente no depende de que la información llegue por Excel, API, webhook o polling.

La implementación actualmente demostrada utiliza `makos_excel`. `INT-POS-002` confirmó además que Makos dispone de una vía de API habilitable bajo solicitud al desarrollador, aunque Vento todavía no tenga especificación ni credenciales provisionadas.

En cualquier caso deberá preservarse:

```text
MAKOS
→ ADAPTADOR DEL PROVEEDOR
→ STAGING Y PAYLOAD ORIGINAL
→ VALIDACIÓN E IDEMPOTENCIA
→ MAPEO DE SEDES Y PRODUCTOS
→ CONTRATO CANÓNICO DE VENTA
→ NEXO / NUMERA / PASS CUANDO CORRESPONDA
```

Cambiar el transporte no cambiará el sistema de origen de la venta.

---

#### 8. Condición para producir efectos internos

Que Makos sea la fuente temporal del hecho externo no autoriza a aplicar automáticamente sus datos en los dominios internos.

Antes de cualquier efecto deberán cumplirse las etapas documentadas por el mini-bloque:

1. recepción mediante el adaptador autorizado;
2. conservación de evidencia de origen;
3. validación del payload o representación recibida;
4. aplicación de idempotencia;
5. resolución de sede, terminal y fuente efectiva;
6. resolución de producto y demás mapeos requeridos;
7. cuarentena de líneas no resolubles;
8. construcción del contrato canónico de venta;
9. emisión del evento interno validado;
10. aplicación exactamente una vez por cada dominio consumidor.

Por tanto:

```text
HECHO EXTERNO RECIBIDO DE MAKOS
≠
EFECTO INTERNO YA AUTORIZADO
```

---

#### 9. Tratamiento del Excel actual

La importación `makos_excel` permanece como el mecanismo físicamente demostrado en Vento, pero su existencia no altera la definición de autoridad.

El Excel demuestra que Makos es la procedencia de información comercial importada, pero la línea base auditada no demuestra todavía el contrato individual completo de venta y línea requerido para automatizar todos los efectos internos.

Por eso:

- el Excel no se promueve por esta tarea a contrato canónico definitivo;
- la ausencia de identidad individual suficiente no se resuelve inventando claves;
- `INT-POS-005` definirá el contrato canónico de venta y línea;
- `INT-POS-006` definirá encabezados, líneas, estados y timestamps;
- `INT-POS-009` definirá payload original, versión, hash y recepción;
- `INT-POS-013` definirá idempotencia por sistema, venta y línea externa.

La fuente de origen puede quedar definida antes de que el mecanismo técnico final de integración esté implementado.

---

#### 10. Tratamiento de la API Makos

La disponibilidad de una API habilitable confirmada en `INT-POS-002` no cambia esta autoridad temporal.

Cuando la API sea provisionada, si el plan vigente decide utilizarla, deberá ser otro transporte de la misma fuente Makos y deberá respetar exactamente las mismas fronteras:

- ninguna escritura directa en tablas internas;
- ningún acceso de Makos a Supabase;
- ningún permiso empresarial derivado de una credencial técnica;
- ningún efecto directo sobre NEXO, PASS o NUMERA;
- ninguna pérdida de payload, procedencia o correlación;
- ninguna doble venta por coexistencia con el mecanismo anterior.

Los requisitos y procedimiento de la credencial se definirán exclusivamente en `INT-POS-004`.

---

#### 11. Relaciones con las tareas posteriores

| Decisión pendiente                                                   | Tarea propietaria |
| -------------------------------------------------------------------- | ----------------- |
| Credencial independiente, revocable y de solo lectura                | `INT-POS-004`     |
| Identidad y semántica del contrato de venta y línea                  | `INT-POS-005`     |
| Encabezados, líneas, estados, timestamps e identificadores recibidos | `INT-POS-006`     |
| Descuentos, impuestos, propinas y medios de pago                     | `INT-POS-007`     |
| Anulaciones, devoluciones y reembolsos                               | `INT-POS-008`     |
| Payload original, versión, hash y fecha de recepción                 | `INT-POS-009`     |
| Empresa, sede, terminal y caja externas                              | `INT-POS-010`     |
| Producto, presentación y receta                                      | `INT-POS-011`     |
| Líneas sin mapeo                                                     | `INT-POS-012`     |
| Idempotencia por sistema, venta y línea externa                      | `INT-POS-013`     |
| Webhook, polling, límites y conciliación de transporte               | `INT-POS-014`     |
| Evento canónico de venta validada                                    | `INT-POS-015`     |
| Efecto exactamente una vez en NEXO                                   | `INT-POS-016`     |
| Efecto económico exactamente una vez en NUMERA                       | `INT-POS-017`     |
| Fidelización en PASS                                                 | `INT-POS-018`     |
| Compensaciones de anulaciones y devoluciones                         | `INT-POS-019`     |
| Conciliación diaria                                                  | `INT-POS-020`     |
| Piloto sin efectos                                                   | `INT-POS-021`     |
| Piloto controlado con efectos                                        | `INT-POS-022`     |
| Corte futuro desde Makos hacia PULSO                                 | `INT-POS-023`     |
| Revocación o reducción de credenciales Makos                         | `INT-POS-024`     |

No queda un pendiente sustantivo de esta definición sin tarea propietaria dentro del mini-bloque.

---

#### 12. Decisiones congeladas

1. Makos es la fuente temporal del hecho de venta originado en el POS externo mientras el alcance correspondiente no haya sido transferido a PULSO.
2. PULSO es la fuente objetivo para las ventas nuevas después del corte efectivo del alcance correspondiente.
3. Una venta tendrá una sola fuente de origen.
4. La fuente se resuelve por sede, terminal y fecha efectiva de corte.
5. El mecanismo de transporte no cambia la fuente de origen.
6. El adaptador, staging o contrato canónico no se convierten en fuentes empresariales competidoras.
7. Makos no adquiere autoridad sobre inventario, fidelización, contabilidad interna, catálogo canónico ni autorización Vento.
8. Un hecho recibido de Makos deberá pasar por validación, mapeo e idempotencia antes de producir efectos internos.
9. Una línea sin mapeo no producirá efecto de inventario.
10. La transición no permitirá doble emisión Makos/PULSO para la misma venta.
11. El documento fiscal seguirá bajo responsabilidad del POS o proveedor fiscal autorizado durante la transición.
12. La integración con Makos es temporal y no sustituye la construcción posterior del POS integral PULSO.
13. Esta tarea no solicita credenciales, no inicia la API y no implementa cambios físicos.

---

#### 13. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea materializa para Makos una decisión contractual ya protegida por la cobertura canónica existente de transición entre el POS externo y PULSO. No amplía el comportamiento protegido ni modifica identidad, estado, texto, relaciones, propietarios o momento de implementación de requisitos vigentes; por tanto, no requiere crear o modificar requisitos de prueba ni actualizar el registro 04A.

#### 14. Cobertura de prueba existente preservada

Se preserva sin modificación:

- `TREQ-INTEGRATION-014` como cobertura primaria de la transición POS externo ↔ PULSO, fuente única, adaptador, staging, idempotencia y corte controlado;
- `TREQ-PULSO-005` para la separación del ciclo comercial y los estados asociados;
- `TREQ-PULSO-006` para venta, pago, caja, documento fiscal, anulación, devolución, reembolso y conciliación como hechos separados y auditables.

Ningún requisito vigente cambia por `INT-POS-003`.

---

#### 15. Criterios de aceptación

La tarea queda documentalmente completa porque:

1. identifica a Makos como fuente temporal del hecho de venta del POS externo;
2. preserva a PULSO como fuente objetivo después del corte;
3. define una sola fuente de origen para cada venta;
4. fija sede, terminal y fecha efectiva como frontera de corte ya aprobada;
5. separa fuente empresarial de mecanismo de transporte;
6. impide que adaptador, staging o consumidores se conviertan en fuentes competidoras;
7. mantiene a NEXO, PASS y NUMERA como propietarios de sus respectivos efectos;
8. mantiene el documento fiscal bajo el POS o proveedor autorizado durante la transición;
9. exige validación, mapeo e idempotencia antes de producir efectos internos;
10. preserva la cuarentena de líneas sin mapeo;
11. mantiene `makos_excel` como mecanismo actual demostrado sin convertirlo en contrato definitivo;
12. incorpora la futura API únicamente como posible transporte de Makos, sin inventar especificación técnica;
13. distribuye todos los detalles pendientes entre `INT-POS-004` a `INT-POS-024` mediante propietarios exactos;
14. no implementa código, Supabase, credenciales, endpoints, webhooks, polling, efectos ni cutover;
15. genera cero cambios `TREQ-*` porque `TREQ-INTEGRATION-014` ya protege el comportamiento contractual definido;
16. mantiene reservada exclusivamente `INT-POS-004` como continuidad inmediata.

---

#### 16. Continuidad

**ÚLTIMA TAREA APROBADA**  
`INT-POS-002 — Confirmar información disponible mediante API`

**TAREA ACTUAL APROBADA**  
`INT-POS-003 — Definir al POS vigente como fuente temporal del hecho de venta`

**SIGUIENTE TAREA RESERVADA**  
`INT-POS-004 — Definir requisitos y procedimiento de una credencial independiente, revocable e inicialmente de solo lectura`


### ✅ INT-POS-004 — Definir requisitos y procedimiento de una credencial independiente, revocable e inicialmente de solo lectura

**Estado:** APROBADA  
**Tarea anterior:** `INT-POS-003 — Definir al POS vigente como fuente temporal del hecho de venta`  
**Tarea siguiente:** `INT-POS-005 — Definir contrato canónico de venta y línea de venta`  
**Tipo de tarea:** documental; definición normativa de requisitos, límites, evidencia y procedimiento de provisionamiento, custodia, uso y revocación de la credencial técnica destinada a la integración temporal con Makos, sin solicitar ni crear credenciales, seleccionar por inferencia un mecanismo de autenticación, contactar al proveedor, implementar el adaptador, modificar Supabase, ejecutar pilotos ni producir efectos internos  
**Fase:** exclusivamente documental  
**Repositorio propietario:** `vento-shell`  
**Sistema externo:** `Makos`, preservando la identidad externa `EXT-SYS-013`  
**Cambios físicos autorizados:** ninguno

---

#### 1. Propósito

Definir el contrato que deberá cumplir cualquier credencial técnica utilizada para consultar Makos durante la transición hacia PULSO.

La credencial deberá ser simultáneamente:

- independiente de personas, cuentas operativas y otras integraciones;
- revocable sin depender de eliminar una copia local;
- limitada inicialmente a lectura efectiva;
- aislada por ambiente;
- custodiada fuera de clientes, repositorios, tablas empresariales, logs y documentación;
- incapaz de conceder por sí sola autoridad empresarial o acceso a Supabase;
- trazable mediante referencias no sensibles y lifecycle verificable.

La tarea no determina todavía si Makos utilizará API key, bearer token, OAuth, certificado, secreto compartido u otro mecanismo. Esa clasificación solo podrá realizarse cuando exista evidencia técnica del binding provisionado para Vento.

Regla raíz:

```text
MAKOS
+
CREDENCIAL TÉCNICA DEDICADA
+
PRINCIPAL TÉCNICO INDEPENDIENTE
+
AMBIENTE VENTO
+
ALCANCE EFECTIVO DE SOLO LECTURA
+
CUSTODIA SEGURA
+
REVOCACIÓN VERIFICABLE
        ↓
ADAPTADOR VENTO
        ↓
DATOS EXTERNOS RECIBIDOS
        ↓
VALIDACIÓN POSTERIOR SEGÚN EL CONTRATO INT-POS
```

La credencial autentica o identifica una relación técnica. No constituye permiso empresarial, actor humano, fuente interna de verdad ni autorización para mutar dominios Vento.

---

#### 2. Base canónica preservada

Esta tarea consume y conserva las decisiones ya aprobadas de `INT-POS-001`, `INT-POS-002` e `INT-POS-003`:

1. Makos es el POS externo vigente identificado para esta transición.
2. Makos confirmó a Vento una vía de API habilitable bajo solicitud al desarrollador del proveedor.
3. Vento no dispone actualmente de una credencial provisionada ni de una especificación técnica entregada para esa API.
4. El mecanismo real de autenticación, los scopes físicos, la separación de ambientes, la expiración y el procedimiento nativo de revocación permanecen sin evidencia técnica del proveedor.
5. Makos es fuente temporal del hecho de venta mientras corresponda, pero no adquiere autoridad sobre NEXO, PASS, NUMERA, PULSO, SHELL ni Supabase.
6. La existencia de una API habilitable no autoriza iniciar su integración durante esta fase documental.

También se preservan los contratos transversales aprobados en `INT-EXT-002` a `INT-EXT-008`:

- principal técnico independiente;
- procedencia de credencial separada de actor y permiso;
- mecanismo real determinado por evidencia;
- mínimo privilegio;
- separación `DEVELOPMENT` / `STAGING` / `PRODUCTION`;
- custodia segura;
- rotación, expiración, revocación y retiro.

`EXT-SYS-013` conserva su identidad. La identificación posterior de Makos y de una API habilitable refina la evidencia del binding específico sin renombrar la identidad externa ni inventar una familia de credencial.

---

#### 3. Definición de independencia

La credencial de Makos será independiente cuando cumpla simultáneamente:

1. esté destinada exclusivamente a la integración Makos ↔ Vento;
2. esté vinculada a un principal técnico no humano propio de esa integración;
3. no sea la contraseña, sesión, token o cuenta personal del titular de Vento, de un cajero, administrador, trabajador, desarrollador de Makos o desarrollador de Vento;
4. no se reutilice para otra identidad `EXT-SYS-*`, otro proveedor o otra finalidad;
5. no se comparta entre `DEVELOPMENT`, `STAGING` y `PRODUCTION`;
6. pueda sustituirse o revocarse sin invalidar credenciales ajenas a la integración;
7. no se convierta en una `PermissionKey` ni en una identidad empresarial de Vento;
8. no permita que Makos, su desarrollador o un tercero accedan directamente a Supabase.

Una cuenta comercial de Vento en Makos puede ser propietaria administrativa del binding si el proveedor lo exige, pero la credencial técnica consumida por el adaptador deberá permanecer separada de la sesión humana usada para administrar esa cuenta.

---

#### 4. Definición de revocabilidad

La credencial será revocable únicamente si existe un procedimiento real para invalidarla en la autoridad que la acepta.

Por tanto:

```text
BORRAR VARIABLE LOCAL
≠ REVOCAR
```

```text
DESHABILITAR ADAPTADOR
≠ REVOCAR
```

```text
CREAR CREDENCIAL NUEVA
≠ COMPLETAR ROTACIÓN
```

La evidencia que Makos deberá entregar antes de una activación incluirá, cuando aplique:

- quién emite o administra la credencial;
- dónde o mediante quién se solicita la invalidación;
- si la revocación es inmediata o tiene propagación conocida;
- si pueden coexistir credencial predecesora y sucesora;
- si existe expiración nativa;
- si el proveedor permite consultar estado, última utilización o evidencia equivalente;
- qué elemento debe conservar Vento como referencia no sensible para identificar la credencial revocada.

No se inventa una cadencia universal de rotación ni una fecha de expiración. Se conservarán únicamente las reglas y fechas acreditadas por el proveedor o por una política posterior aprobada.

---

#### 5. Definición de solo lectura inicial

El `scope_ceiling` inicial de la integración Makos será de **lectura efectiva**.

Esto implica:

1. la credencial no podrá utilizarse para crear, editar, anular, borrar o corregir ventas en Makos;
2. no podrá modificar productos, precios, impuestos, descuentos, clientes, usuarios, sedes, terminales, cajas, documentos fiscales ni configuración del POS;
3. no podrá administrar cuentas, roles, permisos, otras credenciales o configuración de integración del proveedor mediante el runtime del adaptador;
4. no podrá iniciar cobros, devoluciones, reembolsos, cierres u otras operaciones mutantes;
5. no podrá escribir en Supabase ni en dominios Vento;
6. una lectura válida solo habilitará al adaptador a recibir y validar información; no aplicará automáticamente efectos internos.

Cuando Makos permita expresar el alcance mediante scopes, roles, permisos, APIs habilitadas o restricciones equivalentes, se solicitará la variante mínima compatible con lectura.

Cuando Makos no pueda expresar físicamente el mínimo privilegio, el adaptador Vento deberá imponer una allowlist cerrada de operaciones consultivas. La amplitud física de la credencial no ampliará el contrato documental.

Cualquier futura necesidad de escribir en Makos requeriría una decisión canónica distinta. No podrá habilitarse silenciosamente reutilizando esta credencial.

---

#### 6. Matriz de requisitos de la credencial Makos

| Dimensión                   | Decisión obligatoria                                                                       | Estado actual            | Condición antes de activación                                |
| --------------------------- | ------------------------------------------------------------------------------------------ | ------------------------ | ------------------------------------------------------------ |
| Sistema externo             | Makos bajo `EXT-SYS-013`                                                                   | `CONFIRMADO`             | conservar la misma identidad de integración                  |
| Finalidad                   | consulta temporal de información necesaria para la transición del hecho de venta           | `ESPECIFICADO`           | no ampliar finalidad por conveniencia                        |
| Principal técnico           | principal no humano exclusivo del adaptador Makos                                          | `ESPECIFICADO`           | disponer de referencia técnica independiente                 |
| Credencial física           | una credencial dedicada a la integración                                                   | `NO_PROVISIONADO`        | evidencia de emisión o provisionamiento por Makos            |
| Mecanismo de autenticación  | el mecanismo real que Makos entregue; no se selecciona por inferencia                      | `PENDIENTE_DE_EVIDENCIA` | documentación o evidencia técnica del binding                |
| Procedencia                 | material emitido o provisionado mediante el mecanismo autorizado por Makos para Vento      | `PENDIENTE_DE_EVIDENCIA` | identificar emisor y autoridad de revocación                 |
| Alcance                     | lectura efectiva y mínimo privilegio                                                       | `ESPECIFICADO`           | scopes o enforcement Vento acreditan ausencia de mutación    |
| Escritura en Makos          | prohibida bajo esta credencial                                                             | `ESPECIFICADO`           | prueba o evidencia de enforcement antes del uso operativo    |
| Escritura en Vento          | prohibida como facultad de la credencial externa                                           | `ESPECIFICADO`           | todo efecto posterior usa contratos propietarios Vento       |
| Supabase                    | sin acceso directo; sin `service_role`; sin credenciales Vento entregadas al proveedor     | `ESPECIFICADO`           | ninguna excepción                                            |
| Ambientes                   | material independiente por ambiente; producción nunca actúa como fallback de no producción | `ESPECIFICADO`           | evidencia ambiental antes de habilitar cada ambiente         |
| Custodia                    | si el material es secreto, resolución exclusiva server-side desde custodia aprobada        | `ESPECIFICADO`           | referencia no sensible + secret store del ambiente           |
| Cliente / frontend          | valor secreto prohibido en navegador, aplicación cliente o variable publicable             | `ESPECIFICADO`           | ausencia demostrable del material en superficies cliente     |
| Repositorio y documentación | solo referencias y metadata no sensibles                                                   | `ESPECIFICADO`           | ningún valor funcional versionado                            |
| Logs y auditoría            | registrar referencia, actor técnico, ambiente, operación y resultado sin copiar el secreto | `ESPECIFICADO`           | trazabilidad no sensible                                     |
| Expiración                  | se conserva la del proveedor cuando exista; no se inventa                                  | `PENDIENTE_DE_EVIDENCIA` | metadato real o declaración de ausencia de expiración nativa |
| Rotación                    | sucesor independiente, migración, validación, revocación y rechazo del predecesor          | `ESPECIFICADO`           | mecanismo soportado por el emisor acreditado                 |
| Revocación                  | invalidación en la autoridad que acepta la credencial                                      | `ESPECIFICADO`           | procedimiento real y propietario identificados               |
| Retiro final                | revocación o expiración acreditadas y consumidores eliminados                              | `ESPECIFICADO`           | cierre específico bajo `INT-POS-024`                         |

---

#### 7. Información mínima que deberá obtenerse de Makos

Antes de que una fase de implementación solicite o acepte una credencial, Vento deberá obtener del desarrollador de Makos evidencia suficiente para responder:

1. qué mecanismo técnico autentica la integración;
2. qué clase de credencial o material entrega el proveedor;
3. si la credencial pertenece a una empresa, tenant, aplicación, integración o cuenta concreta;
4. si pueden emitirse credenciales independientes para una misma empresa;
5. qué scopes, roles, permisos o restricciones admite;
6. cómo se limita la credencial a lectura;
7. cómo separa el proveedor ambientes o instancias cuando corresponda;
8. cómo se emite o entrega el material sin convertir documentación del proyecto en custodia del secreto;
9. si existe expiración y cómo se conoce;
10. cómo se rota una credencial;
11. cómo se revoca;
12. cómo se demuestra que una credencial anterior dejó de ser aceptada;
13. si el proveedor permite solapamiento controlado durante una rotación;
14. qué referencia no sensible permite identificar la credencial sin exponer su valor;
15. qué evidencia de uso, estado o auditoría ofrece el proveedor para la integración.

Esta lista no supone que Makos implemente una tecnología concreta.

---

#### 8. Procedimiento documental de provisionamiento y activación

##### 8.1. Preparar la solicitud

Antes del provisionamiento se deberán haber materializado las necesidades de datos y contratos que determinan el alcance real de consulta:

- `INT-POS-005` para venta y línea;
- `INT-POS-006` para encabezados, líneas, estados y timestamps;
- `INT-POS-007` para descuentos, impuestos, propinas y medios de pago;
- `INT-POS-008` para anulaciones, devoluciones y reembolsos;
- `INT-POS-010` para empresa, sede, terminal y caja externa;
- `INT-POS-011` para producto externo, producto Vento, presentación y receta;
- `INT-POS-014` para la modalidad de recepción, webhook cuando exista y polling de conciliación.

Estas tareas definen qué información necesita Vento. No podrán ampliar la credencial hacia mutaciones en Makos.

##### 8.2. Solicitar una credencial dedicada

La solicitud al desarrollador de Makos deberá exigir expresamente:

- identidad exclusiva para la integración Vento;
- alcance de lectura mínimo;
- separación de ambientes cuando el proveedor la soporte;
- mecanismo y procedimiento de revocación;
- metadata de expiración o ausencia acreditada de expiración;
- procedimiento de rotación;
- documentación técnica necesaria para configurar el binding sin compartir secretos internos de Vento.

No se solicitará acceso administrativo general si la consulta de datos puede resolverse con una credencial de alcance menor.

##### 8.3. Recibir y clasificar

Al recibir el material se deberá:

1. confirmar sistema, tenant o cuenta a la que pertenece;
2. confirmar ambiente;
3. confirmar mecanismo real;
4. clasificar si el valor es secreto, credencial publicable restringida u otra clase prevista por `INT-EXT-007`;
5. confirmar el `minimum_scope` y el `scope_ceiling`;
6. registrar emisor o autoridad de revocación;
7. registrar expiración únicamente cuando exista evidencia;
8. crear o resolver una referencia no sensible sin copiar el valor al registro empresarial.

##### 8.4. Custodiar

Si el material debe permanecer confidencial:

- se cargará únicamente en la custodia server-side aprobada para el ambiente;
- el runtime autorizado resolverá el valor en ejecución;
- ningún proveedor recibirá credenciales internas de Vento como contraparte;
- ninguna copia funcional quedará en repositorio, documentación, tabla empresarial, log, respuesta o cliente.

##### 8.5. Verificar independencia

Antes de habilitar consumo se comprobará que:

- no depende de una cuenta personal para ejecutar cada llamada;
- no comparte valor con otra integración;
- no comparte material entre ambientes;
- puede revocarse sin revocar otra integración;
- el principal técnico queda distinguible del actor humano que administró la configuración.

##### 8.6. Verificar lectura efectiva

Antes de cualquier piloto se deberá demostrar uno de estos dos controles:

```text
RESTRICCIÓN DE SOLO LECTURA IMPUESTA POR MAKOS
```

o, cuando el proveedor no pueda expresarla físicamente:

```text
CREDENCIAL TÉCNICAMENTE MÁS AMPLIA
+
ALLOWLIST VENTO DE OPERACIONES CONSULTIVAS
+
AUSENCIA DE RUTA MUTANTE EN EL ADAPTADOR
```

En ambos casos, cualquier operación fuera del alcance deberá fallar cerrada.

La verificación operativa sin efectos internos solo podrá ejecutarse bajo el diseño aprobado en `INT-POS-021`. La habilitación posterior de efectos internos bajo `INT-POS-022` no ampliará la credencial de Makos: los efectos ocurrirán dentro de los dominios propietarios de Vento después de validar el hecho externo.

##### 8.7. Activar

La integración solo podrá considerarse habilitable cuando estén acreditados simultáneamente:

```text
CREDENCIAL REAL
+
PRINCIPAL TÉCNICO INDEPENDIENTE
+
AMBIENTE CORRECTO
+
CUSTODIA CORRECTA
+
MECANISMO REAL
+
LECTURA EFECTIVA
+
REVOCACIÓN DISPONIBLE
+
CONTRATO DE DATOS VIGENTE
+
VALIDACIÓN DEL PILOTO APLICABLE
```

La definición documental de esta tarea no ejecuta esa activación.

---

#### 9. Procedimiento de rotación y revocación

La rotación planificada deberá seguir:

```text
PREDECESOR ACTIVO
→ SUCESOR EMITIDO Y ACREDITADO
→ SUCESOR EN CUSTODIA CORRECTA
→ CONSUMIDOR MIGRADO
→ SUCESOR VERIFICADO
→ PREDECESOR REVOCADO
→ RECHAZO DEL PREDECESOR ACREDITADO
→ RETIRO DE COPIAS Y REFERENCIAS OBSOLETAS
```

La revocación deberá iniciarse cuando ocurra cualquiera de estas condiciones aplicables:

- exposición confirmada o sospecha razonable de compromiso;
- material copiado fuera de la custodia aprobada;
- acceso no autorizado;
- principal técnico, ambiente, binding o consumidor retirado;
- cambio de alcance que requiera reemisión;
- credencial sin propietario o consumidor válido;
- incidente que rompa la confianza en el material;
- instrucción del proveedor de retirar la credencial;
- retiro de Makos como fuente conforme al cutover definido por `INT-POS-024`.

Una credencial comprometida no permanecerá activa para preservar continuidad. Una credencial de otro ambiente tampoco se utilizará como sustituto temporal.

---

#### 10. Bloqueos de activación

La integración API de Makos permanecerá bloqueada para activación cuando exista cualquiera de estas condiciones:

| Bloqueo                                                                                      | Resultado obligatorio                | Propietario de resolución                                           |
| -------------------------------------------------------------------------------------------- | ------------------------------------ | ------------------------------------------------------------------- |
| Makos no ha provisionado una credencial real                                                 | no activar API                       | puerta de evidencia de `INT-POS-021` antes del piloto sin efectos   |
| mecanismo de autenticación no acreditado                                                     | no inferir; no activar               | `INT-POS-021`, consumiendo la evidencia obtenida bajo este contrato |
| no existe identidad técnica independiente                                                    | no usar cuenta personal o compartida | `INT-POS-021`                                                       |
| no puede acreditarse lectura efectiva                                                        | no activar la integración            | `INT-POS-021`                                                       |
| una credencial productiva sería usada en desarrollo o staging                                | bloquear ese ambiente                | `INT-POS-021`                                                       |
| el secreto solo puede almacenarse en cliente, repositorio, documentación o tabla empresarial | no aceptar esa custodia              | `INT-POS-021`                                                       |
| la integración exige entregar `service_role` o acceso directo a Supabase a Makos             | rechazar esa arquitectura            | `INT-POS-021`                                                       |
| no existe procedimiento real de revocación                                                   | no activar credencial persistente    | `INT-POS-021`                                                       |
| el alcance solicitado excede las necesidades documentadas                                    | reducir alcance antes de activar     | tarea `INT-POS-005` a `INT-POS-014` que origine la necesidad        |
| PULSO asume la fuente para el alcance correspondiente                                        | iniciar reducción o revocación       | `INT-POS-024`                                                       |

`INT-POS-021` no cambia los contratos de esta tarea: utiliza estas puertas para diseñar el piloto sin efectos y exigir evidencia antes de cualquier ejecución posterior autorizada.

---

#### 11. Fronteras con las tareas posteriores

- `INT-POS-005` definirá la semántica de venta y línea; no redefine la credencial.
- `INT-POS-006`, `INT-POS-007` e `INT-POS-008` determinarán información importable; no conceden escritura en Makos.
- `INT-POS-009` gobernará conservación del payload recibido; no almacena la credencial dentro del payload.
- `INT-POS-010` e `INT-POS-011` gobernarán mappings; no convierten identificadores externos en credenciales.
- `INT-POS-012` gobernará cuarentena; una línea en cuarentena no amplía el scope de lectura.
- `INT-POS-013` gobernará idempotencia; una clave idempotente no es una credencial de Makos.
- `INT-POS-014` gobernará webhook y polling; cada dirección conservará autenticación independiente cuando corresponda.
- `INT-POS-015` a `INT-POS-020` gobernarán efectos y conciliación internos; la credencial Makos no adquiere capacidad de mutarlos.
- `INT-POS-021` diseñará el piloto sin efectos y deberá incluir las puertas de credencial aquí definidas.
- `INT-POS-022` diseñará el piloto con efectos internos habilitados sin ampliar el alcance externo de Makos.
- `INT-POS-023` gobernará la transición hacia PULSO sin reutilizar la credencial Makos como credencial de PULSO.
- `INT-POS-024` gobernará la reducción o revocación cuando PULSO asuma la fuente.

---

#### 12. Decisiones congeladas

1. La integración temporal con Makos utilizará una credencial técnica dedicada cuando la API sea provisionada.
2. Esa credencial no será una cuenta personal, una sesión humana ni una credencial compartida con otra integración.
3. El mecanismo exacto no se inventa y permanece sujeto a evidencia técnica de Makos.
4. El alcance inicial será de lectura efectiva y mínimo privilegio.
5. Una capacidad física adicional de la credencial no autoriza utilizarla.
6. Si Makos no puede imponer el límite de lectura, Vento deberá imponer una allowlist cerrada en el adaptador antes de activar.
7. Ninguna credencial Makos concede acceso a Supabase, `service_role`, NEXO, PASS, NUMERA, PULSO o SHELL.
8. Producción no compartirá material con desarrollo o staging.
9. Todo material secreto se resolverá únicamente server-side desde custodia aprobada.
10. El registro documental conservará referencias no sensibles, nunca el valor secreto.
11. Revocar significa invalidar el material en la autoridad que lo acepta; eliminar una copia local no basta.
12. La expiración se registra únicamente si existe evidencia real.
13. La rotación conserva ambiente, principal y scope; no autoriza ampliaciones.
14. La integración no se activa durante esta tarea.
15. El retiro final de la credencial Makos queda vinculado a `INT-POS-024`.

---

#### 13. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** `INT-POS-004` instancia para Makos controles de credenciales ya materializados y protegidos por los contratos transversales `INT-EXT-002` a `INT-EXT-008` y por requisitos canónicos vigentes de integración y seguridad. No crea una nueva clase de autenticación, una nueva autoridad, una nueva capacidad ejecutable ni una excepción a los controles existentes. El mecanismo físico de Makos todavía no está provisionado y generar un requisito nuevo sobre una tecnología no acreditada duplicaría cobertura o fabricaría especificación.

#### 14. Cobertura de prueba existente preservada

Se conserva sin modificación la cobertura vigente aplicable a:

- separación del POS externo y PULSO durante la transición;
- autenticidad y procedencia de intercambios externos;
- prohibición de exposición de secretos;
- auditoría de adaptadores externos sin copiar credenciales;
- prohibición de escrituras directas y autoridad cruzada entre dominios;
- obligación de que el adaptador externo solicite los efectos a las aplicaciones propietarias.

Ningún requisito existente cambia de identidad, texto, estado, relación, propietario, evidencia ni secuencia por esta tarea.

---

#### 15. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. Makos permanece identificado como sistema externo de la transición bajo `EXT-SYS-013`.
2. La API continúa clasificada como habilitable pero no provisionada.
3. No se inventa el mecanismo de autenticación.
4. Se define una credencial exclusiva de la integración y separada de actores humanos.
5. Se prohíbe compartir la credencial con otras integraciones.
6. Se define lectura efectiva como techo inicial de alcance.
7. Se prohíben mutaciones en Makos bajo esta credencial.
8. Se prohíbe acceso directo de Makos a Supabase.
9. Se prohíbe entregar `service_role` o secretos internos de Vento.
10. Se define separación de ambientes sin asumir que Makos ya la soporta.
11. Se define custodia server-side para material confidencial.
12. Se prohíben secretos en repositorio, documentación, tablas empresariales, logs y superficies cliente.
13. Se define registro mediante referencia no sensible.
14. Se define evidencia mínima que debe obtenerse del desarrollador de Makos.
15. Se define procedimiento de solicitud, clasificación, custodia y verificación.
16. Se define revocación como invalidación en la autoridad aceptante.
17. Se define rotación completa sin validez dual indefinida.
18. Se prohíben fechas de expiración inventadas.
19. Se definen bloqueos de activación con propietario y condición de salida.
20. `INT-POS-021` recibe las puertas para el piloto sin efectos.
21. `INT-POS-024` recibe el retiro final al asumir PULSO la fuente.
22. Se generan cero cambios `TREQ-*`.
23. No se crea, solicita, rota, revoca ni almacena físicamente ninguna credencial.
24. No se modifica código, Supabase, configuración remota ni datos.
25. `INT-POS-005` permanece exclusivamente reservada.

---

#### 16. Continuidad

ÚLTIMA TAREA APROBADA

`INT-POS-003 — Definir al POS vigente como fuente temporal del hecho de venta`

TAREA ACTUAL APROBADA

`INT-POS-004 — Definir requisitos y procedimiento de una credencial independiente, revocable e inicialmente de solo lectura`

SIGUIENTE TAREA RESERVADA

`INT-POS-005 — Definir contrato canónico de venta y línea de venta`


### ✅ INT-POS-005 — Definir contrato canónico de venta y línea de venta

**Estado:** APROBADA  
**Tarea anterior:** `INT-POS-004 — Definir requisitos y procedimiento de una credencial independiente, revocable e inicialmente de solo lectura`  
**Tarea siguiente:** `INT-POS-006 — Definir importación de encabezados, líneas, estados y timestamps`  
**Tipo de tarea:** documental; definición semántica y normativa del contrato canónico de venta y línea de venta que deberá ser producido por el adaptador del POS externo durante la transición y por PULSO después del corte, preservando identidad, procedencia, versionado, separación de hechos, mapeo y elegibilidad para efectos posteriores, sin definir endpoints, payloads físicos, tablas, tipos de código, idempotencia completa, mappings físicos, migraciones, Supabase ni efectos internos  
**Fase:** exclusivamente documental  
**Repositorio propietario:** `vento-shell`  
**POS externo vigente:** `Makos`  
**POS integral objetivo:** `PULSO`  
**Cambios físicos autorizados:** ninguno

---

#### 1. Propósito

Definir una representación canónica única de **venta** y **línea de venta** que desacople a los consumidores internos del formato particular de Makos y permanezca vigente cuando PULSO sustituya al POS externo como fuente de nuevas ventas.

La tarea materializa la decisión aprobada en `CAP-SCOPE-009`: el POS externo temporal y PULSO deberán converger en el mismo contrato canónico, sin doble emisión ni reinterpretación por consumidor.

Regla raíz:

```text
MAKOS DURANTE LA TRANSICIÓN
        ↓
ADAPTADOR + VALIDACIÓN + MAPEO
        ↓
CONTRATO CANÓNICO DE VENTA Y LÍNEA
        ↓
CONSUMIDORES INTERNOS

PULSO DESPUÉS DEL CORTE
        ↓
MISMO CONTRATO CANÓNICO DE VENTA Y LÍNEA
        ↓
MISMOS CONSUMIDORES INTERNOS
```

El contrato normaliza el hecho comercial. No convierte el transporte, el staging, el documento fiscal, el pago, el pedido, el inventario, la fidelización ni el hecho económico en sinónimos de venta.

---

#### 2. Decisión principal

Quedan definidos dos objetos semánticos inseparables pero distintos:

1. **Venta canónica:** representa el hecho comercial de una venta originada en una única fuente y conserva su identidad, procedencia, alcance de origen, estado comercial propio, temporalidad, referencias y colección de líneas.
2. **Línea de venta canónica:** representa una unidad comercial identificable dentro de una venta, con identidad estable, cantidad, referencia de producto de origen, resultado de mapeo y componentes comerciales propios.

Una venta canónica deberá contener o referenciar al menos una línea válida para ser elegible como venta individual con efectos posteriores. Un agregado diario, subtotal por producto, archivo consolidado o métrica de ventas no se eleva por sí solo a venta canónica individual.

La representación física, tipos compartidos y contratos consumibles posteriores deberán materializar esta semántica mediante `SHELL-CON-020` y `SHELL-CON-021` sin cambiarla silenciosamente.

---

#### 3. Separaciones semánticas obligatorias

El contrato preserva las siguientes desigualdades:

```text
VENTA ≠ PEDIDO
VENTA ≠ PAGO
VENTA ≠ SESIÓN DE CAJA
VENTA ≠ DOCUMENTO FISCAL
VENTA ≠ MOVIMIENTO DE INVENTARIO
VENTA ≠ MOVIMIENTO DE FIDELIZACIÓN
VENTA ≠ HECHO ECONÓMICO
VENTA ≠ ENTREGA
```

```text
LÍNEA DE VENTA ≠ PRODUCTO CANÓNICO
LÍNEA DE VENTA ≠ MOVIMIENTO DE INVENTARIO
LÍNEA DE VENTA ≠ RECETA
LÍNEA DE VENTA ≠ LÍNEA DE PEDIDO POR INFERENCIA
```

Una referencia puede relacionar estos hechos, pero ninguna relación permite fusionarlos ni asumir que compartir identificador, importe, timestamp o estado los vuelve equivalentes.

---

#### 4. Contrato semántico de venta

La venta canónica deberá poder representar como mínimo las siguientes dimensiones lógicas. Los nombres físicos finales de campos, tipos y estructuras pertenecen a la materialización técnica posterior; las semánticas aquí definidas son obligatorias.

| Dimensión lógica                | Obligación canónica                                                                              | Regla                                                                                                                                       |
| ------------------------------- | ------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------- |
| Identidad canónica de venta     | requerida                                                                                        | identidad Vento estable y opaca para referenciar la misma venta a través de revisiones, reintentos y consumidores                           |
| Sistema de origen               | requerido                                                                                        | identifica inequívocamente a Makos durante su alcance temporal o a PULSO después del corte                                                  |
| Instancia o contexto de origen  | requerido cuando el sistema pueda reutilizar identificadores entre tenants, empresas o ambientes | evita colisión de identidades de fuente                                                                                                     |
| Identidad de venta en la fuente | requerida para una venta individual                                                              | se conserva sin reinterpretar ni reemplazar por un ID interno                                                                               |
| Revisión o versión de fuente    | condicional                                                                                      | se conserva cuando la fuente la entregue; su ausencia no autoriza inventar una versión del proveedor                                        |
| Versión del contrato canónico   | requerida                                                                                        | permite evolucionar el contrato sin reinterpretar historia                                                                                  |
| Alcance de origen               | requerido antes de producir efectos                                                              | referencia empresa, sede, terminal y demás contexto que corresponda después del mapeo de `INT-POS-010`                                      |
| Momento del hecho comercial     | requerido antes de producir efectos                                                              | conserva el timestamp canónico cuya fuente y semántica se resolverán en `INT-POS-006`                                                       |
| Estado comercial de la venta    | requerido                                                                                        | pertenece únicamente a la venta; el vocabulario y mapeo se materializan en `INT-POS-006`                                                    |
| Cliente                         | opcional                                                                                         | una venta a consumidor final puede existir sin crear cliente artificial; cuando exista identificación se conserva una referencia autorizada |
| Referencia a pedido             | opcional                                                                                         | vincula un pedido cuando exista, sin convertir pedido y venta en el mismo objeto                                                            |
| Referencia fiscal               | condicional                                                                                      | vincula el documento fiscal o soporte cuando exista, sin trasladar a Vento la autoridad del proveedor fiscal                                |
| Componentes monetarios          | requeridos según aplicabilidad                                                                   | la estructura deberá admitir precio, subtotal, descuentos, impuestos, propina y total conforme a `INT-POS-007` sin mezclar pagos con venta  |
| Referencias de pago             | condicionales                                                                                    | relacionan pagos confirmados o intentos cuando correspondan; los pagos permanecen hechos independientes                                     |
| Líneas de venta                 | requeridas para una venta individual elegible                                                    | cada línea se vincula exactamente a esta venta y conserva identidad propia                                                                  |
| Procedencia del payload         | requerida como referencia                                                                        | enlaza el material original conservado por `INT-POS-009` sin copiarlo dentro del contrato normalizado                                       |
| Correlación de integración      | requerida para trazabilidad                                                                      | permite seguir recepción, validación, mapeo, evento y efectos sin sustituir la identidad de venta                                           |

La ausencia de un campo que dependa de una capacidad todavía no acreditada de Makos deberá producir un estado explícito de no disponibilidad, cuarentena o bloqueo en la tarea propietaria correspondiente; no se completará con valores inventados.

---

#### 5. Contrato semántico de línea de venta

Toda línea canónica deberá poder representar como mínimo:

| Dimensión lógica                | Obligación canónica                                    | Regla                                                                                                                                                  |
| ------------------------------- | ------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Identidad canónica de línea     | requerida                                              | estable dentro del ciclo de vida de la venta y distinta de la identidad del producto                                                                   |
| Identidad canónica de venta     | requerida                                              | toda línea pertenece a exactamente una venta canónica                                                                                                  |
| Identidad de línea en la fuente | requerida cuando la fuente la provea                   | se conserva sin reinterpretación; si la fuente no la entrega, `INT-POS-013` deberá resolver identidad estable sin inventar una capacidad del proveedor |
| Secuencia de origen             | condicional                                            | puede conservar orden o posición, pero no sustituye una identidad estable cuando el proveedor dispone de una                                           |
| Revisión o versión de línea     | condicional                                            | conserva revisión de fuente cuando exista y no reescribe historia                                                                                      |
| Producto de origen              | requerido                                              | referencia el identificador o descripción con que la fuente expresó el ítem vendido                                                                    |
| Producto Vento                  | requerido antes de efectos dependientes de producto    | se resuelve mediante `INT-POS-011`; la identidad externa nunca sustituye al producto canónico                                                          |
| Presentación                    | condicional según mapeo                                | se resuelve mediante `INT-POS-011` y conserva la presentación realmente vendida                                                                        |
| Receta                          | condicional según producto y efecto                    | puede quedar referenciada cuando corresponda; la línea no se convierte en receta                                                                       |
| Cantidad                        | requerida                                              | expresa la cantidad comercial de la línea con unidad o convención inequívoca                                                                           |
| Unidad                          | requerida cuando la cantidad no sea autosuficiente     | evita interpretar cantidades con unidades incompatibles                                                                                                |
| Snapshot comercial de precio    | requerido según aplicabilidad                          | conserva el valor aplicado a la línea; las reglas monetarias detalladas se materializan en `INT-POS-007`                                               |
| Descuento e impuesto de línea   | condicionales                                          | permanecen componentes diferenciados, materializados en `INT-POS-007`                                                                                  |
| Estado de línea                 | condicional cuando la fuente o el proceso lo requieran | su vocabulario y mapeo pertenecen a `INT-POS-006`                                                                                                      |
| Resultado de mapeo              | requerido antes de efectos dependientes de producto    | distingue línea resuelta de línea pendiente o no resoluble; `INT-POS-012` gobierna la cuarentena                                                       |
| Procedencia de payload          | requerida como referencia                              | permite reconstruir qué fragmento o evidencia externa originó la línea sin duplicar el payload original                                                |

Una línea sin mapeo de producto/presentación requerido podrá existir como evidencia externa recibida, pero **no será elegible para producir descuento de inventario, costo o fidelización** hasta resolver la condición aplicable.

---

#### 6. Identidad y estabilidad

La identidad canónica deberá cumplir estas invariantes:

1. una venta originada en Makos conserva Makos como sistema de origen aun cuando sea recibida, corregida o conciliada después del corte;
2. una venta originada en PULSO después del corte no se recrea como venta Makos;
3. la identidad canónica de una venta no se deriva de totales, nombre de producto, fecha redondeada, posición de archivo ni otro atributo empresarial mutable;
4. la identidad canónica de una línea no se deriva únicamente de su importe, producto o posición cuando exista una identidad de fuente más fuerte;
5. cambiar un mapping de producto no cambia la identidad de la línea de venta;
6. cambiar un estado, timestamp recibido tardíamente o componente monetario no crea una venta nueva;
7. un reintento o segunda recepción de la misma venta no crea otra identidad canónica;
8. una revisión posterior se vincula a la misma venta y conserva la historia de versiones;
9. la regla técnica exacta para detectar duplicados y resolver claves de fuente pertenece a `INT-POS-013`;
10. el contrato no permite que un consumidor genere una identidad alternativa para aplicar su propio efecto.

---

#### 7. Procedencia y fuente única

Toda venta canónica deberá conservar una procedencia suficiente para demostrar:

```text
QUIÉN ORIGINÓ LA VENTA
+
EN QUÉ INSTANCIA O ALCANCE
+
QUÉ IDENTIDAD TUVO EN LA FUENTE
+
QUÉ REVISIÓN O EVIDENCIA SE RECIBIÓ
+
QUÉ CONTRATO CANÓNICO RESULTÓ
```

Durante la transición:

- Makos es el sistema de origen de las ventas correspondientes a sedes, terminales y periodos todavía no cortados;
- PULSO es el sistema de origen de las nuevas ventas posteriores al corte aprobado;
- el adaptador, staging, archivo, API, webhook, polling o proceso de importación son mecanismos de transporte y procesamiento, no sistemas de origen empresarial;
- una misma venta no puede declarar simultáneamente Makos y PULSO como fuentes activas.

La frontera temporal exacta continúa gobernada por `INT-POS-003` y el procedimiento de corte por `INT-POS-023`.

---

#### 8. Versionado y correcciones

El contrato será versionable y no permitirá corrección destructiva.

Reglas:

1. la versión del contrato canónico y la versión/revisión del dato de origen son conceptos distintos;
2. una revisión del proveedor no cambia retroactivamente el payload original ya conservado;
3. una revisión válida de la venta conserva la misma identidad canónica y crea una nueva representación o estado auditable según el diseño físico posterior;
4. una corrección no borra la versión anterior;
5. una anulación, devolución o reembolso no se representa sobrescribiendo la venta original como si nunca hubiera existido;
6. cantidades o importes negativos no se utilizarán como sustituto silencioso de la semántica de devolución o compensación cuando el hecho pueda clasificarse explícitamente;
7. `INT-POS-008` definirá cómo se importan anulaciones, devoluciones y reembolsos;
8. `INT-POS-019` definirá sus compensaciones internas sin borrar historia.

---

#### 9. Regla de granularidad y tratamiento del Excel actual

La integración actual demostrada mediante `makos_excel` trabaja con lotes y filas agregadas por producto y no demuestra por sí sola identidad individual completa de venta y línea.

Por tanto:

```text
FILA AGREGADA DE EXCEL MAKOS
≠
VENTA CANÓNICA INDIVIDUAL
```

```text
HASH DEL ARCHIVO
≠
IDENTIDAD DE VENTA
```

```text
POSICIÓN DE FILA
≠
IDENTIDAD DE LÍNEA POR DEFECTO
```

El flujo Excel puede mantenerse como evidencia, contingencia o fuente auxiliar bajo las tareas que correspondan, pero no podrá producir una venta canónica individual ficticia ni efectos automáticos basados en una granularidad que la fuente no demuestre.

Si una futura exportación o API aporta identidad y granularidad suficientes, el adaptador deberá mapearlas al mismo contrato definido aquí.

---

#### 10. Integridad estructural

Una instancia de venta canónica será estructuralmente válida únicamente cuando:

1. tenga identidad canónica resuelta;
2. tenga sistema de origen inequívoco;
3. tenga identidad de venta en la fuente o una regla de identidad formalmente materializada por `INT-POS-013`;
4. tenga versión de contrato;
5. tenga el contexto mínimo requerido para resolver su alcance de origen;
6. tenga un momento comercial canónico resoluble;
7. tenga estado comercial resoluble;
8. contenga o referencie líneas con identidad canónica propia;
9. cada línea pertenezca a una sola venta;
10. las cantidades y unidades requeridas sean interpretables;
11. la procedencia del payload sea recuperable por referencia;
12. no mezcle como estado de venta los estados de pago, fiscalidad, inventario, fidelización o economía.

La validez estructural no implica todavía elegibilidad para efectos internos.

---

#### 11. Elegibilidad para efectos posteriores

Una venta canónica solo podrá avanzar hacia `INT-POS-015` y los efectos posteriores cuando, además de ser estructuralmente válida:

- la fuente corresponda al alcance temporal autorizado;
- la recepción haya pasado las validaciones aplicables;
- la identidad e idempotencia hayan sido resueltas;
- empresa, sede, terminal y caja requeridas estén mapeadas;
- cada línea que produzca un efecto dependiente de producto tenga el mapping exigido;
- estados y timestamps necesarios estén normalizados;
- los componentes comerciales necesarios para el efecto estén disponibles;
- no exista una cuarentena o inconsistencia que bloquee el efecto;
- la venta no sea una segunda emisión de una venta ya reconocida;
- la versión recibida no intente retroceder silenciosamente una versión posterior.

Que una venta sea canónica no autoriza por sí solo un movimiento de inventario, un asiento, un movimiento de puntos, un reembolso ni un documento fiscal.

---

#### 12. Separación de estados

El contrato deberá transportar referencias o estados suficientes para mantener ortogonales, cuando apliquen:

- estado comercial de venta;
- estado de pago;
- estado fiscal;
- estado de inventario;
- estado de fidelización;
- estado económico.

`INT-POS-005` solo define la obligación de separación. Los vocabularios, mappings y reglas de importación de estados y timestamps pertenecen a `INT-POS-006`, `INT-POS-007`, `INT-POS-008` y a las tareas propietarias de cada efecto.

Un cambio en uno de estos ejes no podrá cambiar implícitamente los demás.

---

#### 13. Reconciliación monetaria sin corrección silenciosa

El contrato deberá admitir los componentes necesarios para que `INT-POS-007` y `INT-POS-020` puedan demostrar la relación entre encabezado, líneas, descuentos, impuestos, propinas y total.

Reglas:

1. los valores de origen se conservan con su procedencia;
2. una normalización no podrá alterar importes para forzar una igualdad;
3. una diferencia entre total de encabezado y componentes de línea se conserva como diferencia a investigar;
4. pago y total de venta no se asumen equivalentes;
5. el documento fiscal no se usa como copia maestra para sobrescribir la venta;
6. la fórmula y precisión física aplicables se definirán con los contratos monetarios y de importación correspondientes, sin inventar una precisión del proveedor en esta tarea.

---

#### 14. Relación con cliente y venta a consumidor final

Se conserva `DEC-POS-001`: una venta a consumidor final puede existir sin registrar cliente.

Por tanto:

- la identidad de cliente no es requisito universal para crear una venta canónica;
- no se creará un cliente ficticio para satisfacer el contrato;
- cuando exista cliente identificado, la venta conservará una referencia autorizada y no una copia innecesaria de datos personales;
- PASS no adquiere propiedad de la venta por existir una relación de cliente o fidelización;
- ausencia de cliente no elimina requisitos de trazabilidad comercial, fiscal o económica aplicables.

---

#### 15. Fronteras con mapeo de productos

La línea conserva separadas:

```text
IDENTIDAD DEL ÍTEM EN LA FUENTE
≠
PRODUCTO VENTO
≠
PRESENTACIÓN VENTO
≠
RECETA
```

`INT-POS-011` resolverá los mappings aplicables y `INT-POS-012` gobernará las líneas no resueltas.

Cambiar el mapping no reescribe la identidad ni el payload histórico de la línea. La nueva decisión de mapping deberá ser auditable y aplicarse conforme a las reglas de reproceso que posteriormente se definan.

---

#### 16. Frontera con pagos y documento fiscal

El contrato de venta puede referenciar pagos y documento fiscal, pero no los absorbe.

- `INT-POS-007` definirá importación de medios de pago y componentes monetarios;
- el documento fiscal continúa bajo responsabilidad del POS o proveedor fiscal autorizado;
- una factura emitida no demuestra por sí sola que el pago esté conciliado;
- un pago aprobado no demuestra por sí solo que la venta esté fiscalmente emitida;
- una venta válida no autoriza recrear una factura desde Vento cuando esa autoridad permanezca en el proveedor externo.

---

#### 17. Fronteras con efectos internos

El contrato canónico es la entrada empresarial normalizada de los efectos posteriores, no el ejecutor de esos efectos.

| Consumidor o efecto            | Autoridad preservada                 | Condición                                                                       |
| ------------------------------ | ------------------------------------ | ------------------------------------------------------------------------------- |
| NEXO                           | movimiento físico e inventario       | `INT-POS-016` aplica exactamente una vez sobre líneas elegibles                 |
| NUMERA                         | hecho económico y conciliación       | `INT-POS-017` consume el hecho de venta sin reinterpretar su origen             |
| PASS                           | fidelización                         | `INT-POS-018` aplica únicamente cuando corresponda y sin apropiarse de la venta |
| PULSO                          | operación comercial interna objetivo | produce el mismo contrato después del corte, sin duplicar ventas Makos          |
| Proveedor fiscal / POS vigente | documento fiscal                     | conserva autoridad externa mientras corresponda                                 |

Ningún consumidor podrá modificar el contrato recibido para convertir su efecto local en una nueva versión de la venta fuente.

---

#### 18. Handoffs obligatorios

| Tarea                         | Resultado que recibe de `INT-POS-005`                        | Límite                                                                     |
| ----------------------------- | ------------------------------------------------------------ | -------------------------------------------------------------------------- |
| `INT-POS-006`                 | slots semánticos de encabezado, línea, estado y temporalidad | define mappings y vocabularios sin cambiar identidad ni propiedad          |
| `INT-POS-007`                 | slots monetarios y referencias de pago                       | define descuentos, impuestos, propinas y pagos sin fusionarlos con venta   |
| `INT-POS-008`                 | identidad estable de venta/línea e historia versionada       | define reversos externos sin borrar el hecho original                      |
| `INT-POS-009`                 | referencia obligatoria de procedencia                        | conserva payload, versión, hash y recepción fuera del contrato normalizado |
| `INT-POS-010`                 | alcance de origen requerido                                  | materializa mappings de empresa, sede, terminal y caja                     |
| `INT-POS-011`                 | producto de origen y referencias canónicas separadas         | materializa mapping de producto, presentación y receta                     |
| `INT-POS-012`                 | línea canónica que puede permanecer sin mapping              | define cuarentena y bloqueo de efectos                                     |
| `INT-POS-013`                 | identidades y estabilidad exigidas                           | define idempotencia por sistema, venta y línea de fuente                   |
| `INT-POS-014`                 | contrato agnóstico al transporte                             | define webhook/polling sin alterar la semántica de venta                   |
| `INT-POS-015`                 | venta canónica elegible                                      | define el evento interno de venta validada                                 |
| `INT-POS-016` a `INT-POS-018` | venta/líneas validadas y referencias estables                | cada propietaria aplica únicamente su efecto                               |
| `INT-POS-019`                 | historia y referencias al hecho original                     | define compensación sin borrar historia                                    |
| `INT-POS-020`                 | componentes y procedencia reconciliables                     | define conciliación diaria y diferencias                                   |
| `INT-POS-023`                 | contrato independiente de Makos                              | cambia la fuente hacia PULSO sin cambiar consumidores                      |
| `SHELL-CON-020`               | semántica completa de venta                                  | materializa el contrato técnico compartido de venta                        |
| `SHELL-CON-021`               | semántica completa de línea                                  | materializa el contrato técnico compartido de línea                        |

Ningún handoff autoriza adelantar la tarea receptora.

---

#### 19. Decisiones congeladas

1. Makos y PULSO deberán producir el mismo contrato canónico de venta y línea durante sus respectivos periodos de autoridad.
2. Una venta tiene una sola fuente empresarial de origen.
3. Venta, pedido, pago, caja, documento fiscal, inventario, fidelización y hecho económico permanecen separados.
4. Una línea pertenece exactamente a una venta canónica.
5. La identidad de venta y línea es estable y no depende de valores empresariales mutables.
6. La identidad de fuente se conserva junto a la identidad canónica; una no sustituye a la otra.
7. Una revisión no crea otra venta ni borra versiones anteriores.
8. El contrato conserva procedencia mediante referencia al payload original.
9. El Excel agregado actual no se considera contrato individual completo de venta y línea.
10. Una línea sin mapping requerido puede conservarse como evidencia, pero no produce efectos dependientes de producto.
11. Cliente identificado es opcional cuando la operación lo permita.
12. Componentes monetarios y pagos se relacionan con la venta sin fusionarse con ella.
13. Una diferencia monetaria no se corrige silenciosamente.
14. Los estados de venta, pago, fiscalidad, inventario, fidelización y economía son ortogonales.
15. La validez estructural del contrato no equivale a autorización para efectos internos.
16. El contrato es independiente de Excel, API, webhook, polling o cualquier otro transporte autorizado.
17. La materialización física compartida corresponde posteriormente a `SHELL-CON-020` y `SHELL-CON-021`.
18. Esta tarea no modifica código, Supabase, datos, endpoints, credenciales, payloads físicos ni consumidores.
19. `INT-POS-006` permanece exclusivamente reservada.

---

#### 20. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Justificación: `INT-POS-005` materializa para la transición Makos → PULSO el comportamiento ya protegido de forma explícita por la cobertura canónica vigente: convergencia en contratos canónicos de pedido, venta y línea sin doble emisión; fuente única durante el corte; adaptación, staging, mapeo, cuarentena e idempotencia; efectos exactamente una vez en dominios propietarios; separación de venta, pago, documento fiscal e inventario; y preservación de historia frente a anulaciones o correcciones. La tarea no añade una capacidad ejecutable ni una excepción nueva fuera de esas reglas protegidas y, por tanto, no modifica el registro 04A.

#### 21. Cobertura de prueba existente preservada

Se preservan sin modificación:

- `TREQ-INTEGRATION-014`, cobertura primaria de contratos canónicos de pedido, venta y línea entre POS externo y PULSO, doble emisión, corte, mapeo, cuarentena, idempotencia y efectos posteriores;
- `TREQ-PULSO-005`, cobertura de separación del ciclo comercial, identidad estable, líneas, snapshots y estados independientes;
- `TREQ-PULSO-006`, cobertura de venta, pago, caja, documento fiscal, descuento, propina, anulación, devolución, reembolso y conciliación como hechos separados y auditables;
- `TREQ-INTEGRATION-006`, cobertura de fuente empresarial única y propagación mediante contratos aprobados;
- `TREQ-INTEGRATION-011`, cobertura de efectos de inventario correlacionados y exactamente una vez.

Ningún requisito existente cambia de identidad, texto, estado, relación, propietario, evidencia ni secuencia por esta tarea.

---

#### 22. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. define una venta canónica y una línea de venta canónica como objetos semánticos distintos;
2. conserva el mismo contrato para Makos durante la transición y PULSO después del corte;
3. separa venta de pedido, pago, caja, documento fiscal, inventario, fidelización, economía y entrega;
4. exige identidad canónica estable para venta y línea;
5. conserva identidad y procedencia de la fuente sin sustituirlas por IDs internos;
6. admite revisión/versionado sin corrección destructiva;
7. define que una línea pertenece exactamente a una venta;
8. conserva producto de origen separado de producto, presentación y receta Vento;
9. impide efectos dependientes de producto cuando el mapping requerido no está resuelto;
10. conserva cliente como referencia opcional cuando la operación permite consumidor final no identificado;
11. define slots semánticos suficientes para estados, timestamps, componentes monetarios, pagos y fiscalidad sin adelantar sus mappings físicos;
12. preserva payload original mediante referencia y no lo duplica como contrato normalizado;
13. prohíbe elevar agregados diarios o filas consolidadas a ventas individuales ficticias;
14. establece que el hash de archivo no sustituye identidad de venta ni línea;
15. establece validez estructural diferenciada de elegibilidad para efectos;
16. exige fuente autorizada, mappings e idempotencia antes de efectos posteriores;
17. prohíbe corrección monetaria silenciosa;
18. mantiene estados de venta, pago, fiscalidad, inventario, fidelización y economía separados;
19. conserva a NEXO, NUMERA, PASS y proveedor fiscal como propietarios de sus propios efectos;
20. deja handoffs exactos a `INT-POS-006` a `INT-POS-020`, `INT-POS-023`, `SHELL-CON-020` y `SHELL-CON-021` sin iniciarlos;
21. genera cero cambios `TREQ-*` por existir cobertura canónica exacta;
22. no crea ni modifica una copia del registro 04A;
23. no modifica código, Supabase, migraciones, credenciales, endpoints, webhooks, datos ni configuración remota;
24. no declara operacional una integración Makos ni PULSO por aprobar este contrato;
25. mantiene reservada exclusivamente `INT-POS-006` como continuidad inmediata.

---

#### 23. Continuidad

ÚLTIMA TAREA APROBADA

`INT-POS-004 — Definir requisitos y procedimiento de una credencial independiente, revocable e inicialmente de solo lectura`

TAREA ACTUAL APROBADA

`INT-POS-005 — Definir contrato canónico de venta y línea de venta`

SIGUIENTE TAREA RESERVADA

`INT-POS-006 — Definir importación de encabezados, líneas, estados y timestamps`


### ✅ INT-POS-006 — Definir importación de encabezados, líneas, estados y timestamps

**Estado:** APROBADA  
**Tarea anterior:** `INT-POS-005 — Definir contrato canónico de venta y línea de venta`  
**Tarea siguiente:** `INT-POS-007 — Definir importación de descuentos, impuestos, propinas y medios de pago`  
**Tipo de tarea:** documental; definición normativa de la importación semántica de encabezados y líneas de venta, del vocabulario canónico mínimo de estado comercial y estado de línea, y de la clasificación, normalización y precedencia de timestamps necesarios para producir el contrato canónico definido en `INT-POS-005`, sin inventar campos de Makos, definir endpoints, incorporar componentes monetarios detallados, modelar anulaciones o reembolsos, conservar físicamente payloads, resolver mappings de sede o producto, implementar idempotencia, modificar código, crear migraciones, modificar Supabase ni producir efectos internos  
**Fase:** exclusivamente documental  
**Repositorio propietario:** `vento-shell`  
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/06_TRANSICION_DEL_POS_EXTERNO.md`  
**POS externo vigente:** `Makos`  
**POS integral objetivo:** `PULSO`  
**Línea base documental:** `vento-shell@c0ed9cac938ce54bdb87f59d29899f64a41fd4f3`  
**Línea base PULSO observada:** `vento-pulso@71e0184486b5fe11e0a42435baf4024807a80efd`  
**Cambios físicos autorizados:** ninguno

---

#### 1. Propósito

Definir cómo deberá transformarse una representación de venta proveniente del POS externo, y posteriormente una venta originada en PULSO cuando corresponda, en los slots semánticos de encabezado, líneas, estados y tiempo exigidos por el contrato canónico aprobado en `INT-POS-005`.

La tarea fija la semántica que deberá cumplir la importación sin afirmar que Makos ya exponga esos campos mediante su API y sin elevar la importación agregada actual por Excel a una granularidad transaccional que no demuestra.

Regla raíz:

```text
AFIRMACIÓN REAL DE LA FUENTE
        ↓
VALOR ORIGINAL + SEMÁNTICA ACREDITADA
        ↓
NORMALIZACIÓN DE ENCABEZADO / LÍNEA / ESTADO / TIEMPO
        ↓
CONTRATO CANÓNICO DE VENTA Y LÍNEA
        ↓
ELEGIBILIDAD POSTERIOR SEGÚN LAS DEMÁS TAREAS INT-POS
```

Queda prohibido completar un campo obligatorio mediante inferencia débil cuando la fuente no entregue información suficiente.

---

#### 2. Base canónica preservada

`INT-POS-006` consume sin reabrir las siguientes decisiones aprobadas:

1. Makos es la fuente temporal de las ventas originadas dentro de su alcance mientras no ocurra el corte correspondiente.
2. PULSO será la fuente de las nuevas ventas posteriores al corte aprobado.
3. Makos y PULSO deberán converger en el mismo contrato canónico de venta y línea.
4. Una venta tiene una sola fuente empresarial de origen.
5. Venta, pedido, pago, caja, documento fiscal, inventario, fidelización y hecho económico permanecen separados.
6. Una línea pertenece exactamente a una venta canónica.
7. Las identidades de venta y línea deben ser estables y no dependen de importes, fechas redondeadas, nombres de producto, hash de archivo o posición física de fila.
8. Una revisión posterior no crea otra venta ni borra historia.
9. El Excel agregado actual de Makos no constituye por sí solo una venta individual completa.
10. Una línea sin mapping requerido puede conservarse como evidencia recibida, pero no producir efectos dependientes de producto.
11. La validez estructural del contrato no autoriza efectos en NEXO, NUMERA o PASS.
12. La materialización técnica compartida del contrato permanece reservada para `SHELL-CON-020` y `SHELL-CON-021`.

Esta tarea define únicamente cómo poblar los slots semánticos que `INT-POS-005` reservó para encabezado, línea, estado y temporalidad.

---

#### 3. Capas obligatorias de la importación

La integración deberá distinguir tres capas conceptuales y no fusionarlas:

| Capa                                      | Contenido                                                                                        | Autoridad         | Regla                                                                                    |
| ----------------------------------------- | ------------------------------------------------------------------------------------------------ | ----------------- | ---------------------------------------------------------------------------------------- |
| Representación de fuente                  | campos y valores tal como fueron entregados por Makos o por la fuente autorizada                 | sistema de origen | no se corrige ni renombra retrospectivamente para hacer coincidir el contrato Vento      |
| Representación normalizada de importación | identidades, estados, timestamps y demás slots interpretados con una regla de mapping acreditada | adaptador Vento   | conserva referencia a la afirmación original y registra si la semántica pudo resolverse  |
| Contrato canónico de venta y línea        | estructura empresarial definida en `INT-POS-005`                                                 | Vento             | desacopla consumidores del formato particular de la fuente sin alterar el hecho original |

Por tanto:

```text
VALOR EXTERNO
≠
VALOR CANÓNICO POR SIMPLE SEMEJANZA DE NOMBRE
```

```text
CAMPO AUSENTE
≠
VALOR POR DEFECTO INVENTADO
```

```text
TIMESTAMP TÉCNICO DE RECEPCIÓN
≠
MOMENTO COMERCIAL DE LA VENTA
```

---

#### 4. Definición de encabezado de venta importable

Para una venta individual, la importación deberá poder resolver las siguientes dimensiones lógicas del encabezado.

| Dimensión                                          | Obligatoriedad para venta individual                                                                           | Regla de importación                                                                                                                   | Propietario de detalle posterior         |
| -------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------- |
| Sistema de origen                                  | requerida                                                                                                      | conserva `Makos` durante su alcance temporal o `PULSO` después del corte; nunca se deriva del transporte                               | `INT-POS-003`; `INT-POS-023`             |
| Instancia o contexto de origen                     | requerida cuando la fuente pueda reutilizar identificadores entre empresas, tenants o ambientes                | se conserva el contexto real; no se inventa un tenant                                                                                  | binding del proveedor y `INT-POS-010`    |
| Identidad externa de venta                         | requerida para una venta individual, salvo resolución formal posterior cuando la fuente realmente no la provea | debe proceder de la fuente o del mecanismo estable definido por `INT-POS-013`; no se sustituye por hash, fecha, total o número de fila | `INT-POS-013`                            |
| Revisión o versión de fuente                       | condicional                                                                                                    | se importa cuando la fuente la entregue; ausencia explícita no autoriza inventar versión del proveedor                                 | `INT-POS-013`                            |
| Estado de venta en la fuente                       | requerido cuando la fuente lo entregue                                                                         | se conserva el valor original y se intenta mapear al vocabulario canónico de esta tarea                                                | esta tarea                               |
| Estado comercial canónico                          | requerido antes de que una venta pueda considerarse elegible para efectos                                      | solo se materializa con equivalencia semántica acreditada                                                                              | esta tarea                               |
| Resultado del mapping de estado                    | requerido                                                                                                      | distingue mapping resuelto, ausencia real de estado y semántica no resoluble                                                           | esta tarea                               |
| Momento comercial de la venta                      | requerido antes de efectos                                                                                     | debe representar el instante del hecho según semántica acreditada; no se sustituye por hora de recepción o persistencia                | esta tarea                               |
| Fecha comercial o de negocio                       | condicional                                                                                                    | puede conservarse cuando la fuente la defina; no reemplaza el instante del hecho                                                       | esta tarea                               |
| Timestamp de creación en la fuente                 | condicional                                                                                                    | solo se importa como creación del registro si esa semántica está documentada                                                           | esta tarea                               |
| Timestamp de última modificación en la fuente      | condicional                                                                                                    | describe modificación de la representación de fuente y no cambia por sí solo el momento comercial                                      | esta tarea                               |
| Timestamp de cierre en la fuente                   | condicional                                                                                                    | solo significa cierre cuando el proveedor lo defina así; no implica pago, factura, inventario ni conciliación                          | esta tarea                               |
| Zona horaria, offset o contexto temporal de fuente | requerido cuando sea necesario para convertir un tiempo local en un instante inequívoco                        | se conserva la evidencia temporal usada para normalizar                                                                                | esta tarea                               |
| Empresa, sede, terminal y caja de origen           | requeridas según disponibilidad y necesidad del contrato                                                       | se importan como referencias de origen sin convertirlas todavía en identidades internas                                                | `INT-POS-010`                            |
| Cliente                                            | opcional                                                                                                       | no se crea cliente artificial cuando la venta sea a consumidor final no identificado                                                   | contrato aprobado en `INT-POS-005`       |
| Referencia a pedido                                | opcional                                                                                                       | se conserva cuando exista equivalencia demostrable; venta y pedido siguen siendo hechos distintos                                      | contratos comerciales posteriores        |
| Referencia fiscal                                  | condicional                                                                                                    | puede conservar referencia, nunca autoridad fiscal interna por inferencia                                                              | `INT-POS-007` y frontera fiscal aprobada |
| Colección o referencias de líneas                  | requerida para una venta individual elegible                                                                   | cada línea pertenece a una sola venta                                                                                                  | esta tarea e `INT-POS-005`               |
| Referencia de procedencia                          | requerida                                                                                                      | enlaza la representación original sin duplicarla dentro del contrato normalizado                                                       | `INT-POS-009`                            |

Una entrada que no permita resolver identidad individual, estado comercial necesario o momento comercial requerido no podrá presentarse como venta individual plenamente normalizada.

---

#### 5. Definición de línea de venta importable

Cada línea individual deberá conservar los siguientes slots cuando correspondan:

| Dimensión                                     | Obligatoriedad                                      | Regla de importación                                                                                                    | Propietario de detalle posterior             |
| --------------------------------------------- | --------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- | -------------------------------------------- |
| Venta padre                                   | requerida                                           | la línea se relaciona con exactamente una venta canónica                                                                | `INT-POS-005`                                |
| Identidad externa de línea                    | requerida cuando la fuente la entregue              | se conserva sin reinterpretación; si la fuente no ofrece una identidad estable, la resolución pertenece a `INT-POS-013` | `INT-POS-013`                                |
| Secuencia o posición externa                  | condicional                                         | puede conservar orden de origen, pero no sustituye por sí sola una identidad estable                                    | `INT-POS-013`                                |
| Revisión de línea                             | condicional                                         | se conserva cuando la fuente la entregue; no se inventa                                                                 | `INT-POS-013`                                |
| Producto o ítem de origen                     | requerida                                           | conserva identificador, descripción u otra referencia real del ítem externo                                             | `INT-POS-011`                                |
| Cantidad                                      | requerida                                           | conserva la cantidad comercial informada por la fuente sin cambiar signo o magnitud para forzar otra semántica          | `INT-POS-007` y `INT-POS-008` cuando aplique |
| Unidad                                        | requerida cuando la cantidad no sea autosuficiente  | debe permitir interpretar la cantidad de forma inequívoca                                                               | `INT-POS-011`                                |
| Estado de línea en la fuente                  | condicional                                         | se conserva cuando exista                                                                                               | esta tarea                                   |
| Estado canónico de línea                      | condicional                                         | solo se materializa cuando exista equivalencia semántica acreditada                                                     | esta tarea                                   |
| Resultado del mapping de estado de línea      | requerido cuando se intente mapear estado           | distingue equivalencia, ausencia y semántica no resoluble                                                               | esta tarea                                   |
| Momento propio de línea                       | condicional                                         | solo se usa si la fuente distingue un hecho temporal de línea con semántica verificable                                 | esta tarea                                   |
| Timestamp de creación o modificación de línea | condicional                                         | no sustituye el momento comercial de la venta ni el de la línea                                                         | esta tarea                                   |
| Resultado de mapping de producto              | requerido antes de efectos dependientes de producto | no convierte el ítem externo en producto Vento por coincidencia débil                                                   | `INT-POS-011`; `INT-POS-012`                 |
| Referencia de procedencia                     | requerida                                           | enlaza el fragmento o evidencia que originó la línea                                                                    | `INT-POS-009`                                |

La posición física de una fila de archivo podrá preservarse como evidencia de origen, pero no será identidad empresarial de línea por defecto.

---

#### 6. Vocabulario canónico mínimo de estado comercial de venta

El estado comercial importado de una venta utilizará únicamente el siguiente vocabulario mínimo en esta frontera:

| Estado canónico | Significado exacto                                                                                                               | No implica                                                                                                                           |
| --------------- | -------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| `OPEN`          | la fuente acredita que la venta existe y permanece abierta, editable o todavía no finalizada dentro de su propio ciclo comercial | pago pendiente o aprobado, preparación, entrega, documento fiscal, inventario, fidelización o hecho económico                        |
| `FINALIZED`     | la fuente acredita que el hecho de venta fue finalizado o cerrado comercialmente dentro de su contrato                           | pago conciliado, documento fiscal emitido, inventario aplicado, puntos aplicados, entrega completada, caja cerrada o contabilización |
| `CANCELLED`     | la fuente acredita que la venta fue cancelada como hecho comercial                                                               | que exista ya una anulación fiscal, devolución, reembolso, compensación de inventario o compensación económica                       |

Este vocabulario representa únicamente el eje **comercial de la venta**.

No se utilizarán como estado comercial de venta:

- estado de pedido;
- estado de preparación;
- estado de cumplimiento o entrega;
- estado de pago;
- estado fiscal;
- estado de inventario;
- estado de fidelización;
- estado económico;
- estado del lote de importación;
- estado técnico de una fila importada;
- resultado del mapping de producto.

`CANCELLED` no define todavía la naturaleza de una anulación, devolución o reembolso ni autoriza una compensación. Esos hechos permanecen reservados para `INT-POS-008` y `INT-POS-019`.

---

#### 7. Vocabulario canónico mínimo de estado de línea

Cuando la fuente tenga un lifecycle verificable de línea, el mapping podrá utilizar:

| Estado canónico de línea | Significado                                                                              | Límite                                                             |
| ------------------------ | ---------------------------------------------------------------------------------------- | ------------------------------------------------------------------ |
| `ACTIVE`                 | la fuente acredita que la línea forma parte vigente de la venta en la revisión observada | no prueba preparación, entrega, inventario ni pago                 |
| `CANCELLED`              | la fuente acredita que la línea fue cancelada dentro de la venta                         | no ejecuta devolución, reembolso, anulación fiscal ni compensación |

Si la fuente no expone estado de línea, el contrato no fabricará `ACTIVE` por ausencia de información.

Una cantidad igual a cero, una cantidad negativa, una devolución, una diferencia monetaria, la ausencia de una línea en otra exportación o un `row_status` técnico no podrán utilizarse por sí solos para inferir `CANCELLED`.

---

#### 8. Resultado del mapping de estados

Toda interpretación de estado deberá quedar clasificada mediante uno de estos resultados:

| Resultado      | Significado                                                                                                       | Tratamiento                                                                                                   |
| -------------- | ----------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| `MAPPED`       | existe evidencia suficiente para afirmar equivalencia entre el valor o garantía de la fuente y el estado canónico | puede poblar el estado canónico correspondiente                                                               |
| `NOT_PROVIDED` | la fuente acreditada no entrega ese estado o no lo entrega para ese objeto                                        | se conserva la ausencia; si el estado es obligatorio para elegibilidad, el flujo queda bloqueado para efectos |
| `UNRESOLVED`   | existe un valor o señal, pero su semántica no permite una equivalencia segura                                     | conservar valor original y bloquear cualquier decisión que dependa de ese estado                              |

La ausencia de un estado no se convierte automáticamente en `OPEN`, `FINALIZED`, `ACTIVE` o `CANCELLED`.

---

#### 9. Reglas obligatorias de mapping de estados

1. El valor original de la fuente deberá conservarse por referencia junto con la regla o versión de mapping aplicada.
2. Un mapping solo será válido cuando exista equivalencia semántica demostrable; igualdad de etiqueta o semejanza lingüística no basta.
3. Si el proveedor documenta que un recurso o endpoint devuelve exclusivamente ventas finalizadas, esa garantía contractual podrá servir como evidencia de `FINALIZED` aunque no exista un campo de estado separado.
4. Una garantía implícita observada en la interfaz no bastará para mapear estado.
5. Un estado de pago no se convertirá en estado de venta.
6. Un estado fiscal no se convertirá en estado de venta.
7. Un estado de pedido, preparación o entrega no se convertirá en estado de venta.
8. Un estado técnico del adaptador o del lote de importación no se convertirá en estado de venta o línea.
9. Un cambio de mapping deberá versionarse; las interpretaciones históricas no se reescribirán silenciosamente.
10. Un valor externo nuevo o desconocido quedará `UNRESOLVED` hasta disponer de una equivalencia aprobada.
11. Una versión tardía no podrá degradar silenciosamente una revisión de venta ya reconocida como posterior.
12. La relación exacta entre cancelación, anulación, devolución y reembolso se resolverá en `INT-POS-008`; esta tarea no los fusiona.

---

#### 10. Taxonomía temporal obligatoria

La importación distinguirá como conceptos separados:

| Concepto temporal                     | Semántica                                                                        | Obligatoriedad                                                                   | Regla                                                                     |
| ------------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| `sale_occurred_at`                    | instante del hecho comercial de venta según la semántica acreditada de la fuente | requerido antes de efectos para una venta individual                             | no se sustituye por recepción, importación, persistencia o fecha agregada |
| `business_date`                       | fecha comercial, jornada o agrupación de negocio definida por la fuente          | condicional                                                                      | puede diferir del día UTC del instante y no sustituye `sale_occurred_at`  |
| `source_created_at`                   | instante en que la fuente creó su registro                                       | condicional                                                                      | no se asume igual al hecho comercial salvo contrato explícito             |
| `source_updated_at`                   | instante de última modificación reportada por la fuente                          | condicional                                                                      | no reescribe el momento original del hecho                                |
| `source_closed_at`                    | instante en que la fuente declara cierre comercial de la venta                   | condicional                                                                      | no implica cierre de pago, caja, fiscalidad o conciliación                |
| `line_occurred_at`                    | instante propio de un hecho de línea cuando la fuente lo distingue               | condicional                                                                      | no se inventa a partir del encabezado                                     |
| `line_created_at` / `line_updated_at` | creación o modificación de la representación de línea en la fuente               | condicional                                                                      | permanecen separadas del momento comercial                                |
| `received_at`                         | instante en que Vento recibe la representación externa                           | requerido por la capa de procedencia, pero físicamente definido en `INT-POS-009` | no sustituye ningún timestamp de negocio                                  |
| `imported_at`                         | instante técnico en que una importación local fue persistida                     | técnico                                                                          | no se eleva a timestamp de venta                                          |

El contrato técnico futuro podrá utilizar otros nombres físicos, pero deberá preservar estas separaciones semánticas.

---

#### 11. Normalización de timestamps

La normalización temporal deberá cumplir simultáneamente:

1. conservar el valor original o su referencia de procedencia;
2. identificar el significado del campo antes de convertirlo;
3. conservar offset o zona horaria cuando la fuente los entregue;
4. cuando la fuente entregue hora local sin offset, utilizar únicamente una zona horaria acreditada para ese binding;
5. cuando una hora local sea ambigua y no exista evidencia suficiente para resolver el instante, clasificarla como no resoluble en vez de escoger una interpretación;
6. representar el instante normalizado de forma inequívoca para los consumidores, sin perder la evidencia temporal de fuente;
7. conservar la precisión realmente entregada por la fuente;
8. no fabricar segundos, milisegundos, offset o zona horaria no recibidos ni acreditados;
9. no convertir una fecha sin hora en medianoche para simular un instante transaccional;
10. no usar el timezone de visualización de una interfaz como prueba de la zona temporal del proveedor;
11. una recepción tardía conservará el `sale_occurred_at` original;
12. una actualización posterior conservará el momento original del hecho y su timestamp de actualización como dimensiones distintas;
13. el orden entre revisiones se apoyará en la revisión o causalidad acreditada cuando exista; un timestamp por sí solo no autoriza sobrescribir una revisión posterior;
14. un backfill o replay conservará el momento histórico del hecho y no convertirá el tiempo del reproceso en momento comercial.

---

#### 12. Precedencia temporal para el contrato de venta

Cuando existan varios tiempos en la fuente, la selección de `sale_occurred_at` seguirá esta regla:

1. se utiliza el campo que la documentación o evidencia técnica del binding defina explícitamente como instante de la venta o hecho comercial equivalente;
2. si no existe un campo con esa semántica, se podrá utilizar otro campo únicamente cuando exista equivalencia contractual demostrable para ese recurso;
3. `source_created_at`, `source_updated_at` y `source_closed_at` no sustituyen automáticamente al instante comercial;
4. `business_date` no sustituye un instante;
5. `received_at`, `imported_at`, `created_at` de persistencia interna y timestamps de procesamiento jamás se utilizarán como fallback silencioso;
6. si no puede resolverse un instante comercial inequívoco, la venta podrá conservarse como evidencia recibida pero no será elegible para los efectos que exijan temporalidad transaccional.

---

#### 13. Tratamiento del flujo `makos_excel` existente

La implementación física vigente conserva utilidad para análisis agregado y contingencia, pero no cumple la granularidad individual definida por `INT-POS-005` y esta tarea.

La evidencia actual se clasifica así:

| Elemento actual                                                           | Evidencia disponible                           | Clasificación para `INT-POS-006`  | Consecuencia                                                |
| ------------------------------------------------------------------------- | ---------------------------------------------- | --------------------------------- | ----------------------------------------------------------- |
| `sales_date` del lote                                                     | fecha seleccionada para la importación diaria  | `DISPONIBLE_COMO_FECHA_AGREGADA`  | puede conservar contexto diario; no es `sale_occurred_at`   |
| `imported_at` del lote                                                    | timestamp generado al persistir la importación | `TIEMPO_TECNICO_LOCAL`            | no es momento de venta                                      |
| `created_at` / `updated_at` de lote o fila                                | timestamps de persistencia local               | `TIEMPO_TECNICO_LOCAL`            | no son timestamps de Makos                                  |
| `status` del lote con valores `draft`, `validated`, `posted`, `cancelled` | estado del workflow local de importación       | `NO_APLICA_COMO_ESTADO_DE_VENTA`  | no se mapea a `OPEN`, `FINALIZED` o `CANCELLED`             |
| `row_status` con valores `draft`, `validated`, `posted`, `cancelled`      | estado técnico de la fila importada            | `NO_APLICA_COMO_ESTADO_DE_LINEA`  | no se mapea a `ACTIVE` o `CANCELLED`                        |
| `match_status`                                                            | resultado local de matching de producto        | `NO_APLICA_COMO_ESTADO_COMERCIAL` | pertenece al mapping, no al lifecycle de la venta           |
| `source_row_number`                                                       | posición física dentro del archivo             | `LOCALIZADOR_TECNICO`             | no es identidad externa de línea                            |
| `external_item_id` / nombre / categoría                                   | referencia agregada de ítem                    | `DISPONIBLE_A_NIVEL_AGREGADO`     | no demuestra una línea perteneciente a una venta individual |
| identidad externa de venta                                                | no observada en el flujo actual                | `NO_DISPONIBLE_EN_FLUJO_ACTUAL`   | no permite construir venta individual por inferencia        |
| identidad externa de línea                                                | no observada en el flujo actual                | `NO_DISPONIBLE_EN_FLUJO_ACTUAL`   | no permite construir línea individual por inferencia        |
| estado de venta en Makos                                                  | no observado en el flujo actual                | `NO_DISPONIBLE_EN_FLUJO_ACTUAL`   | no existe mapping comercial acreditado                      |
| estado de línea en Makos                                                  | no observado en el flujo actual                | `NO_DISPONIBLE_EN_FLUJO_ACTUAL`   | no existe mapping de línea acreditado                       |
| timestamp transaccional de venta                                          | no observado en el flujo actual                | `NO_DISPONIBLE_EN_FLUJO_ACTUAL`   | no puede fabricarse desde `sales_date`                      |
| timestamps de creación, actualización o cierre de Makos                   | no observados en el flujo actual               | `NO_DISPONIBLE_EN_FLUJO_ACTUAL`   | permanecen sujetos a evidencia del binding futuro           |

Por tanto:

```text
SALES_DATE DEL ARCHIVO
≠
SALE_OCCURRED_AT
```

```text
IMPORTED_AT
≠
SALE_OCCURRED_AT
```

```text
DRAFT / VALIDATED / POSTED / CANCELLED DEL LOTE
≠
ESTADO COMERCIAL DE LA VENTA
```

```text
SOURCE_ROW_NUMBER
≠
IDENTIDAD DE LÍNEA
```

El flujo Excel no se elimina ni se redefine por esta tarea. Permanece como integración agregada existente hasta que una tarea autorizada decida su evolución física.

---

#### 14. Binding futuro de Makos

La API de Makos está confirmada como habilitable bajo solicitud, pero Vento todavía no dispone en esta línea base de la especificación técnica del binding ni de una credencial provisionada.

Antes de permitir que una integración transaccional Makos produzca ventas individuales, la evidencia técnica deberá permitir completar una matriz equivalente a la siguiente:

| Slot requerido                                 | Evidencia que debe existir                                   | Resultado permitido                              |
| ---------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------ |
| identidad externa de venta                     | campo o garantía estable documentada                         | mapping directo o regla estable de `INT-POS-013` |
| identidad externa de línea                     | campo estable o evidencia formal de ausencia                 | mapping directo o resolución de `INT-POS-013`    |
| estado de venta                                | campo, recurso o garantía contractual con semántica conocida | `MAPPED`, `NOT_PROVIDED` o `UNRESOLVED`          |
| estado de línea                                | campo o declaración verificable de no disponibilidad         | `MAPPED`, `NOT_PROVIDED` o `UNRESOLVED`          |
| timestamp de venta                             | campo y semántica temporal acreditados                       | `sale_occurred_at` resoluble                     |
| zona horaria u offset                          | valor por registro o regla verificable del binding           | instante inequívoco                              |
| timestamps de creación, actualización y cierre | documentación de cada campo cuando exista                    | slots diferenciados sin inferencia               |
| empresa, sede, terminal y caja                 | referencias reales disponibles en la fuente                  | handoff a `INT-POS-010`                          |
| producto o ítem de línea                       | referencia externa suficiente                                | handoff a `INT-POS-011`                          |

No se registran aquí nombres de endpoints, propiedades JSON, scopes, formatos ni valores específicos de Makos porque esa evidencia técnica aún no forma parte de la línea base disponible.

---

#### 15. Puertas de elegibilidad derivadas de esta tarea

Una venta individual importada no podrá avanzar hacia la emisión de venta validada de `INT-POS-015` cuando ocurra cualquiera de estas condiciones:

| Condición                                                            | Tratamiento                                                                         | Tarea propietaria de salida                                 |
| -------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ----------------------------------------------------------- |
| no existe identidad externa de venta ni regla estable autorizada     | conservar sin producir una identidad alternativa por intento                        | `INT-POS-013`                                               |
| la venta no tiene líneas individualizables                           | conservar como agregado o evidencia, sin presentarla como venta individual completa | `INT-POS-013`; reevaluación en `INT-POS-021`                |
| el estado comercial requerido está `NOT_PROVIDED` o `UNRESOLVED`     | bloquear efectos que dependan de estado                                             | `INT-POS-021` deberá demostrar suficiencia antes del piloto |
| `sale_occurred_at` no puede resolverse                               | bloquear efectos que exijan temporalidad transaccional                              | `INT-POS-021`                                               |
| la zona horaria de un timestamp local no puede demostrarse           | no escoger zona por defecto                                                         | `INT-POS-021`                                               |
| llega una revisión aparentemente anterior a una ya reconocida        | no sobrescribir la versión posterior                                                | `INT-POS-013`; conciliación en `INT-POS-020`                |
| empresa, sede, terminal o caja requeridas no se pueden mapear        | no habilitar efectos dependientes de alcance                                        | `INT-POS-010`                                               |
| una línea no puede mapearse al producto requerido                    | conservar línea sin efecto de inventario                                            | `INT-POS-011`; `INT-POS-012`                                |
| se requiere información monetaria o de pago todavía no materializada | no inferirla desde estado o total                                                   | `INT-POS-007`                                               |
| la fuente comunica anulación, devolución o reembolso                 | no reducirlo a un simple cambio de estado con efectos implícitos                    | `INT-POS-008`                                               |
| falta procedencia completa, versión, hash o recepción                | no presentar la transformación como reproducible                                    | `INT-POS-009`                                               |
| el transporte o recuperación incremental todavía no está definido    | no asumir webhook, polling o frecuencia                                             | `INT-POS-014`                                               |

`INT-POS-021` deberá diseñar el piloto sin efectos de manera que compruebe estas puertas con evidencia del binding real. `INT-POS-022` no podrá diseñar un piloto con efectos habilitados sobre una semántica que permanezca no resuelta.

---

#### 16. Reglas de revisión y eventos fuera de orden

1. Una actualización de una venta conserva la misma identidad canónica cuando corresponde al mismo hecho de origen.
2. La revisión de fuente, cuando exista, se conserva separada de los timestamps.
3. Un `source_updated_at` posterior no prueba por sí solo que la versión de negocio sea superior cuando el proveedor disponga de un mecanismo explícito de versión o secuencia.
4. Una representación tardía no podrá sobrescribir silenciosamente una revisión reconocida como posterior.
5. Un valor de estado desconocido no se fuerza al estado canónico más cercano.
6. Una transición aparentemente regresiva se envía a conciliación o queda bloqueada hasta demostrar la semántica del proveedor.
7. Un replay conserva el instante histórico del hecho; solo el intento técnico de procesamiento ocurre después.
8. Una corrección autorizada conserva antes, después, motivo o correlación mediante los contratos transversales aplicables; no reescribe el hecho original.
9. `INT-POS-013` materializará la idempotencia por sistema, venta y línea externa.
10. `INT-POS-020` materializará la conciliación diaria y el tratamiento de diferencias persistentes.

---

#### 17. Separación entre estados externos, estados canónicos y estados de proceso

Los estados definidos por esta tarea no sustituyen los estados de los procesos empresariales `VPROC-*`.

Por ejemplo, un proceso PULSO puede encontrarse en un estado de preparación, pago, entrega o conciliación mientras el estado comercial de la venta tenga otra semántica.

Por tanto:

```text
ESTADO EXTERNO DE MAKOS
→ se interpreta mediante mapping acreditado

ESTADO COMERCIAL CANÓNICO DE VENTA
→ describe únicamente lifecycle comercial de la venta

ESTADO VPROC DE PULSO
→ describe el avance del proceso empresarial propietario
```

Ninguno se deriva automáticamente de otro.

La misma separación aplica a estados de pago, fiscalidad, inventario, fidelización y economía.

---

#### 18. Fronteras con tareas posteriores

- `INT-POS-007` incorporará descuentos, impuestos, propinas y medios de pago sin redefinir identidad, estado comercial ni `sale_occurred_at`.
- `INT-POS-008` definirá anulaciones, devoluciones y reembolsos como hechos diferenciados; `CANCELLED` no ejecuta esos efectos por sí solo.
- `INT-POS-009` conservará físicamente payload original, versión, hash y fecha de recepción; `received_at` no sustituirá el momento comercial.
- `INT-POS-010` materializará el mapping de empresa, sede, terminal y caja externa.
- `INT-POS-011` materializará mapping de producto, presentación y receta.
- `INT-POS-012` gobernará cuarentena de líneas sin mapping.
- `INT-POS-013` definirá identidad e idempotencia por sistema, venta y línea, incluida la ausencia real de identificadores externos fuertes.
- `INT-POS-014` definirá webhook y polling sin cambiar la semántica temporal o de estados.
- `INT-POS-015` emitirá el evento canónico únicamente cuando la venta satisfaga las puertas aplicables.
- `INT-POS-020` conciliará diferencias de estado, temporalidad y efectos sin reescribir historia.
- `INT-POS-021` deberá probar el binding real sin efectos sobre inventario ni finanzas.
- `INT-POS-022` solo podrá habilitar efectos después de demostrar que las puertas críticas quedaron resueltas.
- `SHELL-CON-020` y `SHELL-CON-021` materializarán posteriormente tipos y estructuras físicas compartidas sin alterar estas semánticas.

Ningún handoff inicia ni aprueba la tarea receptora.

---

#### 19. Decisiones congeladas

1. La importación distingue representación de fuente, representación normalizada y contrato canónico.
2. Una venta individual requiere identidad de fuente o resolución formal posterior, líneas individualizables, estado comercial resoluble cuando sea necesario y un momento comercial inequívoco antes de efectos.
3. El encabezado y las líneas conservan valores de origen sin completarlos con defaults inventados.
4. El vocabulario comercial mínimo de venta es `OPEN`, `FINALIZED` y `CANCELLED`.
5. `FINALIZED` no significa pagado, facturado, entregado, conciliado, descontado de inventario, acumulado en fidelización ni contabilizado.
6. `CANCELLED` no ejecuta anulación, devolución, reembolso o compensación.
7. El vocabulario de línea, cuando la fuente tenga lifecycle verificable, es `ACTIVE` y `CANCELLED`.
8. El resultado de mapping de estado distingue `MAPPED`, `NOT_PROVIDED` y `UNRESOLVED`.
9. Ningún estado técnico del importador es estado comercial de venta o línea.
10. `sale_occurred_at`, `business_date`, creación, actualización, cierre, recepción e importación son conceptos temporales distintos.
11. Un timestamp de fuente solo se normaliza cuando su semántica y contexto temporal son verificables.
12. No se fabrica medianoche para convertir una fecha en instante.
13. No se inventa zona horaria, offset ni precisión.
14. Un evento tardío conserva su momento histórico y no retrocede silenciosamente una revisión posterior.
15. El `sales_date` del flujo Excel vigente no es `sale_occurred_at`.
16. `imported_at`, `created_at` y `updated_at` locales no son timestamps de venta Makos.
17. Los estados `draft`, `validated`, `posted` y `cancelled` del lote o fila vigente pertenecen al workflow local de importación y no al lifecycle comercial de Makos.
18. `source_row_number` no es identidad de línea.
19. La integración Excel vigente continúa siendo agregada y no puede generar ventas individuales ficticias.
20. Los nombres físicos y valores reales del futuro binding Makos solo se incorporarán con evidencia técnica del proveedor.
21. Esta tarea no modifica código, migraciones, Supabase, datos, credenciales, endpoints, webhooks, polling ni efectos internos.
22. `INT-POS-007` permanece exclusivamente reservada.

---

#### 20. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** `INT-POS-006` instancia para la transición Makos → PULSO reglas ya protegidas por la cobertura canónica vigente: convergencia de POS externo y PULSO en contratos de venta y línea, separación de estados comerciales respecto de pago, fiscalidad e inventario, rechazo de estados incompatibles, preservación de versiones frente a eventos fuera de orden, conservación del momento histórico del hecho en replay o backfill, exigencia de equivalencia semántica para mappings legacy y separación entre momento del hecho, registro técnico y cierre. No introduce una capacidad ejecutable nueva ni una excepción fuera de esas reglas ya protegidas. Por tanto, el registro 04A permanece sin cambios.

#### 21. Cobertura de prueba existente preservada

Se preservan sin modificación:

- `TREQ-INTEGRATION-014`, como cobertura primaria de convergencia en contratos canónicos de venta y línea, estados incompatibles, parcialidad, eventos fuera de orden y conciliación durante la transición POS externo ↔ PULSO;
- `TREQ-INTEGRATION-043`, que impide que una versión tardía sobrescriba una revisión posterior;
- `TREQ-INTEGRATION-044`, que exige tratamiento explícito de eventos fuera de orden, desconocidos o incompatibles;
- `TREQ-INTEGRATION-045`, que conserva el `occurred_at` histórico en replay o backfill;
- `TREQ-INTEGRATION-046`, que exige equivalencia demostrable de hecho, momento, agregado, versión y efectos antes de mapear una representación legacy;
- `TREQ-INTEGRATION-049`, que protege procedencia, identificador externo, recepción y correlación de hechos externos;
- `TREQ-INTEGRATION-222`, que separa `occurred_at`, `recorded_at` y `completed_at`, conserva contexto temporal y prohíbe reescribir el momento del hecho por una captura tardía;
- `TREQ-PULSO-005`, que protege la separación de los estados del ciclo comercial;
- `TREQ-PULSO-006`, que protege la separación entre venta, pago, caja, fiscalidad, devolución y conciliación.

Ningún requisito existente cambia de identidad, texto, estado, relación, propietario, evidencia ni secuencia por esta tarea.

---

#### 22. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. conserva `INT-POS-005` como contrato semántico base sin cambiar identidad ni propiedad de venta y línea;
2. distingue representación de fuente, normalización y contrato canónico;
3. define el contenido semántico mínimo del encabezado de venta individual;
4. define el contenido semántico mínimo de la línea de venta individual;
5. mantiene una línea vinculada a exactamente una venta;
6. define un vocabulario comercial mínimo de venta sin mezclar pago, fiscalidad, inventario, fidelización, economía, preparación o entrega;
7. define el vocabulario condicional de estado de línea sin inferir lifecycle cuando la fuente no lo exponga;
8. define resultados explícitos de mapping `MAPPED`, `NOT_PROVIDED` y `UNRESOLVED`;
9. prohíbe mappings por semejanza de nombre sin equivalencia semántica;
10. permite garantías contractuales de recurso como evidencia únicamente cuando estén documentadas por la fuente;
11. impide tratar estados técnicos del importador como estados de negocio;
12. distingue `sale_occurred_at`, fecha comercial, creación, actualización, cierre, recepción e importación;
13. prohíbe sustituir el momento comercial por un timestamp técnico;
14. prohíbe fabricar hora, offset, zona o precisión;
15. define tratamiento de timestamps locales ambiguos o sin contexto temporal suficiente;
16. conserva el momento histórico frente a recepción tardía, replay o backfill;
17. impide que una revisión tardía degrade silenciosamente una posterior;
18. clasifica uno por uno los campos temporales y de estado de la importación `makos_excel` existente;
19. documenta que el Excel actual no contiene identidad individual de venta, identidad individual de línea, estado comercial Makos ni timestamp transaccional de venta;
20. impide convertir `sales_date` en `sale_occurred_at`;
21. impide convertir `source_row_number` en identidad de línea por defecto;
22. define la evidencia mínima que deberá aportar el binding futuro de Makos antes de un piloto transaccional;
23. asigna cada bloqueo o dato faltante a una tarea `INT-POS` exacta con condición de salida;
24. mantiene `INT-POS-007` como única siguiente tarea reservada;
25. genera cero cambios `TREQ-*` por existir cobertura canónica específica;
26. no crea una copia del registro 04A;
27. no implementa código, DDL, DML, migraciones, Supabase, credenciales, endpoints, webhooks, polling, importaciones remotas ni efectos empresariales;
28. no presenta como disponible ningún campo o estado de Makos que no esté respaldado por evidencia actual.

---

#### 23. Continuidad

ÚLTIMA TAREA APROBADA

`INT-POS-005 — Definir contrato canónico de venta y línea de venta`

TAREA ACTUAL APROBADA

`INT-POS-006 — Definir importación de encabezados, líneas, estados y timestamps`

SIGUIENTE TAREA RESERVADA

`INT-POS-007 — Definir importación de descuentos, impuestos, propinas y medios de pago`


### ✅ INT-POS-007 — Definir importación de descuentos, impuestos, propinas y medios de pago

**Estado:** APROBADA
**Tarea anterior:** `INT-POS-006 — Definir importación de encabezados, líneas, estados y timestamps`
**Tarea siguiente:** `INT-POS-008 — Definir importación de anulaciones, devoluciones y reembolsos`
**Tipo de tarea:** documental; definición normativa de la importación de componentes monetarios de venta y línea, propinas y hechos de pago asociados a una venta canónica, preservando valor de fuente, alcance, moneda, precisión, estado y referencias sin fusionar venta, pago, caja, documento fiscal, devolución ni hecho económico, sin inventar campos de Makos, ejecutar cobros, definir reversos, implementar código, crear migraciones, modificar Supabase ni producir efectos internos
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/06_TRANSICION_DEL_POS_EXTERNO.md`
**POS externo vigente:** `Makos`
**POS integral objetivo:** `PULSO`
**Línea base documental:** `vento-shell@32db942792eeeb16bd9c338f975740a49f1e023b`
**Línea base PULSO observada:** `vento-pulso@71e0184486b5fe11e0a42435baf4024807a80efd`
**Cambios físicos autorizados:** ninguno

---

#### 1. Propósito

Definir cómo deberán importarse y normalizarse los componentes monetarios y los hechos de pago asociados a una venta canónica durante la transición desde Makos y, posteriormente, cuando PULSO produzca el mismo contrato.

La tarea cubre cuatro familias de información:

1. descuentos;
2. impuestos;
3. propinas;
4. medios y hechos de pago.

La importación deberá conservar la afirmación real de la fuente y distinguirla de cualquier representación normalizada de Vento.

Regla raíz:

```text
VALOR MONETARIO O HECHO DE PAGO DE LA FUENTE
        ↓
PROCEDENCIA + ALCANCE + MONEDA + SEMÁNTICA ACREDITADA
        ↓
NORMALIZACIÓN SIN INVENTAR NI CORREGIR SILENCIOSAMENTE
        ↓
VENTA / LÍNEA + COMPONENTES MONETARIOS
        +
HECHOS DE PAGO RELACIONADOS, PERO INDEPENDIENTES
        ↓
CONCILIACIÓN Y EFECTOS POSTERIORES EN SUS TAREAS PROPIETARIAS
```

---

#### 2. Base canónica preservada

`INT-POS-007` consume sin reabrir las siguientes decisiones aprobadas:

1. Makos es la fuente temporal de las ventas originadas dentro de su alcance mientras no ocurra el corte correspondiente.
2. PULSO será la fuente de las nuevas ventas posteriores al corte aprobado.
3. Makos y PULSO deberán converger en el mismo contrato canónico de venta y línea.
4. Venta, pedido, pago, sesión de caja, documento fiscal, inventario, fidelización y hecho económico son hechos distintos.
5. El contrato canónico conserva componentes monetarios y referencias de pago sin convertirlos en identidad de venta.
6. Una línea pertenece exactamente a una venta y conserva su snapshot comercial.
7. Una diferencia monetaria no se corrige para forzar coincidencia.
8. El documento fiscal permanece bajo autoridad del POS o proveedor fiscal autorizado mientras corresponda.
9. Los estados comerciales de venta definidos en `INT-POS-006` no se derivan de estados de pago.
10. Una anulación, devolución o reembolso no se representa mediante un importe negativo ambiguo y pertenece a `INT-POS-008`.
11. Los efectos económicos corresponden a NUMERA mediante `INT-POS-017`, no a la importación externa.
12. La conciliación de diferencias corresponde a `INT-POS-020`.
13. La API de Makos está confirmada como habilitable bajo solicitud, pero la especificación técnica, credenciales y campos reales del tenant Vento permanecen no provisionados.

Esta tarea no presupone nombres de propiedades, códigos de medio de pago, tasas tributarias, fórmulas, escalas decimales ni catálogos específicos de Makos.

---

#### 3. Separaciones semánticas obligatorias

La importación conservará como desigualdades:

```text
VENTA ≠ PAGO
PAGO ≠ MEDIO DE PAGO
PAGO ≠ SESIÓN DE CAJA
PAGO ≠ DOCUMENTO FISCAL
PAGO ≠ HECHO ECONÓMICO
DESCUENTO ≠ DEVOLUCIÓN
DESCUENTO ≠ REEMBOLSO
IMPUESTO ≠ DOCUMENTO FISCAL
PROPINA ≠ INGRESO DE PRODUCTO
PROPINA ≠ PAGO
TOTAL DE VENTA ≠ TOTAL PAGADO POR DEFINICIÓN
```

Una relación o coincidencia de importe no fusiona los objetos.

---

#### 4. Capas de información monetaria

Toda importación monetaria distinguirá tres capas:

| Capa                       | Contenido                                                                                                | Regla                                             |
| -------------------------- | -------------------------------------------------------------------------------------------------------- | ------------------------------------------------- |
| representación de fuente   | valor, código, etiqueta, moneda, tasa, base, alcance, referencia y estado tal como la fuente los exprese | se conserva sin alterar para aparentar coherencia |
| representación normalizada | interpretación de alcance, componente, importe, moneda, estado y relación con venta o línea              | solo se materializa con semántica acreditada      |
| contrato canónico          | componentes comerciales de venta/línea y referencias a hechos de pago                                    | desacopla consumidores del formato del proveedor  |

Por tanto:

```text
CAMPO AUSENTE
≠
CERO CONFIRMADO
```

```text
VALOR CERO POR DEFAULT TÉCNICO
≠
AFIRMACIÓN CERO DE LA FUENTE
```

```text
ETIQUETA PARECIDA
≠
EQUIVALENCIA SEMÁNTICA
```

---

#### 5. Contrato monetario mínimo

Todo componente monetario importado deberá poder conservar, cuando aplique:

| Dimensión                        | Obligación                                                                                              | Regla                                                                                                       |
| -------------------------------- | ------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| tipo de componente               | requerida                                                                                               | identifica precio, subtotal, descuento, impuesto, propina, total u otro componente explícitamente soportado |
| alcance                          | requerido cuando sea necesario para interpretar el valor                                                | distingue encabezado de venta, línea o hecho de pago sin repartir valores por inferencia                    |
| importe                          | requerido cuando la fuente entregue el componente                                                       | conserva signo y magnitud de origen; no se modifica para cuadrar                                            |
| moneda                           | requerida antes de conciliación o efecto económico cuando el binding no garantice una moneda inequívoca | no se asume desde la interfaz ni desde defaults de otra integración                                         |
| precisión o escala de fuente     | condicional                                                                                             | se conserva cuando pueda demostrarse; no se fabrican decimales                                              |
| código o identidad de fuente     | condicional                                                                                             | se conserva cuando exista                                                                                   |
| etiqueta o descripción de fuente | condicional                                                                                             | sirve como evidencia, no como mapping suficiente                                                            |
| base de cálculo                  | condicional                                                                                             | solo se importa si la fuente la entrega o documenta inequívocamente                                         |
| tasa o porcentaje                | condicional                                                                                             | no se deduce como verdad oficial a partir de importe/base                                                   |
| semántica de inclusión           | condicional                                                                                             | distingue, cuando esté documentado, valor incluido o adicional; ausencia queda no resuelta                  |
| referencia de línea              | condicional                                                                                             | obligatoria cuando el componente pertenece específicamente a una línea                                      |
| referencia de procedencia        | requerida                                                                                               | enlaza la afirmación original gobernada posteriormente por `INT-POS-009`                                    |

La ausencia de una dimensión condicional se conserva como ausencia y no se completa con un valor artificial.

---

#### 6. Moneda, signo, precisión y cero

Reglas obligatorias:

1. cada importe conservará la moneda declarada por la fuente cuando exista;
2. si el binding documenta una única moneda invariable para el recurso, esa garantía podrá utilizarse como evidencia;
3. el default `COP` de una integración interna existente no demuestra la moneda de Makos;
4. no se realizará conversión de moneda sin un contrato explícito de tipo de cambio y una tarea autorizada;
5. importes de monedas distintas no se sumarán como si fueran homogéneos;
6. el signo de origen se conserva;
7. un signo inesperado no se convierte automáticamente a valor absoluto;
8. una cantidad o importe negativo que pueda representar devolución, reverso o reembolso se deriva a `INT-POS-008` antes de producir efectos;
9. un campo ausente no se transforma en cero por conveniencia;
10. un cero explícito de fuente puede conservarse como cero;
11. un cero producido por parser, default de base de datos o inicialización local no demuestra que la fuente haya informado cero;
12. no se redondearán componentes para forzar igualdad;
13. la representación física futura deberá permitir cálculos monetarios deterministas sin depender de aritmética binaria imprecisa; los tipos concretos deberán materializarse en `SHELL-CON-020` y `SHELL-CON-021` sin cambiar esta semántica.

---

#### 7. Importación de descuentos

Un descuento importado representa una reducción comercial declarada por la fuente y deberá conservarse separado de devolución, reembolso, compensación o cambio de cantidad.

Por cada descuento se conservará, cuando exista:

- importe;
- moneda;
- alcance de venta o línea;
- referencia a la línea cuando corresponda;
- código, identificador o etiqueta del descuento en la fuente;
- base y tasa cuando la fuente las entregue;
- referencia de promoción, cupón o autorización únicamente cuando la fuente la provea;
- referencia de procedencia.

Reglas:

1. un descuento de encabezado no se reparte entre líneas por prorrateo inventado;
2. un descuento de línea no se eleva a descuento global sin conservar su línea;
3. varios descuentos se conservan separados cuando la fuente los individualice;
4. un agregado único permanece agregado cuando la fuente no entregue desglose;
5. una etiqueta no crea por sí sola identidad de promoción o cupón;
6. descuento cero solo significa cero cuando la fuente lo afirme o su contrato lo garantice;
7. un descuento no modifica cantidad de producto;
8. un descuento no implica devolución ni reembolso;
9. una revisión posterior conserva historia y no reescribe destructivamente el valor anterior;
10. cualquier discrepancia frente al total se conserva para `INT-POS-020`.

---

#### 8. Importación de impuestos

El impuesto importado conserva la afirmación tributaria del POS o proveedor autorizado sin convertir a Vento en autoridad fiscal.

Por cada componente tributario se conservará, cuando exista:

- importe;
- moneda;
- alcance de venta o línea;
- referencia a línea;
- código, nombre o categoría tributaria de fuente;
- base gravable informada;
- tasa informada;
- indicación de inclusión o adición al precio cuando esté documentada;
- referencia fiscal relacionada cuando la fuente la entregue;
- referencia de procedencia.

Reglas:

1. un importe tributario no se recalcula para sustituir el valor de fuente;
2. una tasa no se infiere como verdad oficial únicamente dividiendo impuesto entre base;
3. impuesto cero no demuestra exención, exclusión ni tarifa cero por sí solo;
4. un impuesto agregado no se distribuye a líneas sin evidencia de asignación;
5. una suma de impuestos de línea no sobrescribe el impuesto de encabezado cuando exista diferencia;
6. una diferencia queda conciliable, no corregida;
7. el documento fiscal no se convierte en copia maestra de la venta;
8. la importación no emite, modifica ni anula documentos fiscales;
9. la autoridad fiscal externa se preserva durante la transición;
10. `INT-POS-017` recibirá posteriormente el hecho económico normalizado sin convertir la importación en contabilidad.

---

#### 9. Importación de propinas

La propina se tratará como componente monetario separado.

Cuando la fuente la exponga, se conservará:

- importe;
- moneda;
- alcance o asociación con la venta;
- asociación con un pago cuando la fuente la entregue explícitamente;
- código o etiqueta de fuente cuando exista;
- referencia de procedencia.

Reglas:

1. una propina no se incorpora al precio de producto por inferencia;
2. una propina no se trata como impuesto;
3. una propina no se trata como descuento;
4. una propina no se asume incluida en el total de venta o en el importe pagado salvo que la fuente documente esa semántica;
5. una propina no ejecuta distribución, liquidación laboral ni movimiento de caja por el solo hecho de importarse;
6. una propina agregada no se reparte entre líneas, productos, trabajadores o pagos sin evidencia;
7. ausencia de campo de propina no se transforma en cero confirmado;
8. la conciliación de propina con venta, pagos y cierre corresponde a `INT-POS-020`;
9. su efecto económico posterior corresponde a `INT-POS-017` cuando resulte aplicable.

---

#### 10. Hecho de pago importado

Un pago importado será un hecho relacionado con una venta, no una propiedad que absorba la venta.

La representación deberá admitir cero, uno o varios hechos de pago asociados a una misma venta.

Cada hecho de pago deberá poder conservar:

| Dimensión                             | Obligatoriedad                                                                   | Regla                                                  |
| ------------------------------------- | -------------------------------------------------------------------------------- | ------------------------------------------------------ |
| venta relacionada                     | requerida                                                                        | el pago se vincula a una venta sin convertirse en ella |
| identidad externa de pago             | requerida cuando la fuente la entregue                                           | se conserva sin sustituirla por identidad de venta     |
| proveedor, adquirente o procesador    | condicional                                                                      | se conserva cuando la fuente lo identifique            |
| código de medio de pago de fuente     | condicional                                                                      | no se renombra por similitud                           |
| etiqueta de medio de pago de fuente   | condicional                                                                      | se conserva como evidencia                             |
| importe                               | requerido para un pago cuantificable                                             | no se deriva del total de venta por defecto            |
| moneda                                | requerida antes de conciliación cuando no exista garantía inequívoca del binding | se conserva por pago                                   |
| estado de pago de fuente              | requerido cuando la fuente lo entregue                                           | se conserva sin fusionarlo con estado de venta         |
| estado de pago normalizado            | condicional                                                                      | solo se materializa con equivalencia demostrable       |
| referencia o comprobante de proveedor | condicional                                                                      | se conserva cuando exista                              |
| timestamp del pago o confirmación     | condicional                                                                      | solo se usa con semántica acreditada                   |
| referencia de procedencia             | requerida                                                                        | enlaza la afirmación original                          |

La existencia de un pago relacionado no cambia por sí sola el estado comercial `OPEN`, `FINALIZED` o `CANCELLED` de la venta.

---

#### 11. Tratamiento de medios de pago

`INT-POS-007` no inventa un catálogo cerrado de marcas, adquirentes o medios de Makos.

La importación deberá preservar:

```text
CÓDIGO / IDENTIDAD DE MEDIO EN LA FUENTE
+
ETIQUETA DE FUENTE, CUANDO EXISTA
+
PROVEEDOR O PROCESADOR, CUANDO EXISTA
+
RESULTADO DE INTERPRETACIÓN
```

El resultado de interpretación utilizará:

| Resultado      | Significado                                                                                  | Tratamiento                                                                            |
| -------------- | -------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| `MAPPED`       | existe equivalencia aprobada con una referencia de medio aceptada por el contrato consumidor | se conserva fuente y referencia normalizada                                            |
| `NOT_PROVIDED` | la fuente acreditada no entrega el medio o no lo entrega para ese hecho                      | se conserva ausencia                                                                   |
| `UNRESOLVED`   | existe código, etiqueta o señal, pero no hay equivalencia segura                             | se conserva valor original y se bloquean decisiones que requieran el medio normalizado |

Reglas:

1. no se infiere `efectivo`, `tarjeta`, `transferencia`, billetera u otra categoría por nombre parcial sin regla acreditada;
2. marca de tarjeta, procesador, adquirente, banco y medio de pago no se consideran sinónimos;
3. el método informado por una integración interna de Wompi no define el catálogo de Makos;
4. un cambio futuro de mapping no reescribe la afirmación histórica de fuente;
5. un medio no resuelto puede conservarse para conciliación, pero no autoriza una clasificación financiera inventada.

---

#### 12. Vocabulario mínimo de estado de pago normalizado

Cuando exista evidencia suficiente, la frontera de importación podrá normalizar el estado del hecho de pago a:

| Estado       | Significado                                                                                             | No implica                                                              |
| ------------ | ------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| `PENDING`    | el pago o intento existe pero la fuente no acredita todavía confirmación definitiva                     | fallo, venta cancelada o deuda vencida                                  |
| `AUTHORIZED` | la fuente acredita autorización del medio, sin afirmar necesariamente captura, recepción o conciliación | dinero conciliado, documento fiscal o venta finalizada                  |
| `CONFIRMED`  | la fuente acredita recepción, captura o confirmación del pago según el contrato del proveedor           | conciliación bancaria, caja cerrada, factura emitida o venta finalizada |
| `FAILED`     | la fuente acredita rechazo o fallo definitivo del intento                                               | cancelación de la venta                                                 |
| `CANCELLED`  | la fuente acredita cancelación del intento de pago antes de su confirmación final                       | devolución, reembolso o compensación                                    |
| `UNRESOLVED` | existe una señal o estado cuya semántica no permite mapping seguro                                      | ningún resultado financiero                                             |

Reglas:

1. un timeout o resultado desconocido no se convierte en `FAILED`;
2. un estado de venta no se convierte en estado de pago;
3. un estado fiscal no se convierte en estado de pago;
4. un estado técnico del adaptador no se convierte en estado de pago;
5. señales de `refund`, devolución, reversión u otra compensación quedan preservadas y se derivan a `INT-POS-008` para su semántica completa;
6. `CONFIRMED` no equivale a conciliación bancaria o de caja;
7. `CANCELLED` no equivale a reembolso;
8. un valor externo nuevo o ambiguo queda `UNRESOLVED`.

---

#### 13. Pagos parciales y medios combinados

La estructura deberá admitir:

```text
UNA VENTA
        ↓
0..N HECHOS DE PAGO
        ↓
CADA PAGO CONSERVA
IMPORTE + MONEDA + MEDIO + PROVEEDOR + REFERENCIA + ESTADO
```

Reglas:

1. una venta puede permanecer sin pagos mientras su ciclo lo permita;
2. un pago parcial no se eleva artificialmente al total de la venta;
3. varios pagos de una misma venta no se consolidan en un único pago ficticio;
4. medios combinados conservan un hecho separado por componente cuando la fuente los individualice;
5. si la fuente entrega únicamente un total pagado agregado, se conserva como agregado y no se inventan pagos individuales;
6. un exceso o faltante entre pagos confirmados y total exigible se registra como diferencia;
7. importes de monedas distintas no se suman sin conversión autorizada;
8. propina incluida en un pago solo se separa cuando la fuente permita demostrarlo;
9. pago confirmado no demuestra entrega, documento fiscal, inventario, puntos ni hecho económico aplicado;
10. `INT-POS-020` conciliará diferencias persistentes y `INT-POS-017` recibirá los hechos económicos correspondientes.

---

#### 14. Reconciliación monetaria sin corrección silenciosa

La importación conservará simultáneamente:

- subtotal de encabezado cuando la fuente lo entregue;
- componentes monetarios de línea;
- descuentos de venta y línea;
- impuestos de venta y línea;
- propinas;
- total de venta cuando la fuente lo entregue;
- pagos relacionados;
- valores agregados del flujo histórico cuando solo exista esa granularidad.

Una fórmula de recomposición solo podrá evaluarse cuando la semántica del binding permita determinar qué componentes están incluidos o excluidos.

Quedan prohibidas estas correcciones:

```text
DIFERENCIA
→ REDONDEAR HASTA QUE CUADRE
```

```text
DESCUENTO AGREGADO
→ REPARTIR ENTRE LÍNEAS SIN EVIDENCIA
```

```text
IMPUESTO DE ENCABEZADO
→ SOBRESCRIBIR CON SUMA DE LÍNEAS
```

```text
TOTAL DE VENTA
→ CREAR UN PAGO FICTICIO POR EL MISMO IMPORTE
```

```text
TOTAL PAGADO
→ MODIFICAR LA VENTA PARA FORZAR COINCIDENCIA
```

Toda diferencia conservará origen, valores comparados y condición pendiente para `INT-POS-020`.

---

#### 15. Tratamiento del flujo `makos_excel` existente

La implementación vigente demuestra únicamente información agregada por ítem y día.

| Elemento actual                | Evidencia física                    | Clasificación para `INT-POS-007`       | Consecuencia                                                     |
| ------------------------------ | ----------------------------------- | -------------------------------------- | ---------------------------------------------------------------- |
| `subtotal_amount`              | disponible por fila agregada y lote | `AGREGADO_DISPONIBLE`                  | no demuestra subtotal de una venta individual                    |
| `tax_amount`                   | disponible por fila agregada y lote | `AGREGADO_DISPONIBLE`                  | no demuestra código, tasa, base ni inclusión tributaria          |
| `discount_amount`              | disponible por fila agregada y lote | `AGREGADO_DISPONIBLE`                  | no demuestra identidad, alcance ni causa de descuento individual |
| `return_amount`                | disponible por fila agregada y lote | `FUERA_DE_ALCANCE_MONETARIO_ORDINARIO` | su semántica completa pertenece a `INT-POS-008`                  |
| `net_sales_amount`             | calculado localmente                | `DERIVADO_LEGACY_AGREGADO`             | no se eleva a total canónico de venta individual                 |
| `gross_sales_amount`           | calculado localmente por fila       | `DERIVADO_LEGACY_AGREGADO`             | no define semántica tributaria del proveedor                     |
| propina                        | no observada                        | `NO_DISPONIBLE_EN_FLUJO_ACTUAL`        | no se inventa cero                                               |
| identidad individual de pago   | no observada                        | `NO_DISPONIBLE_EN_FLUJO_ACTUAL`        | no permite hechos de pago individuales                           |
| medio de pago                  | no observado                        | `NO_DISPONIBLE_EN_FLUJO_ACTUAL`        | no se infiere desde total o archivo                              |
| estado de pago                 | no observado                        | `NO_DISPONIBLE_EN_FLUJO_ACTUAL`        | no se infiere desde estado del lote                              |
| proveedor o referencia de pago | no observado                        | `NO_DISPONIBLE_EN_FLUJO_ACTUAL`        | permanece sujeto al binding futuro                               |

El parser vigente convierte campos tributarios o de descuento ausentes en `0` para su cálculo local. Ese comportamiento técnico no constituye evidencia de que Makos haya afirmado un valor cero.

Las fórmulas actuales:

```text
net_sales_amount = subtotal - discounts - returns
gross_sales_amount = subtotal + tax
```

se clasifican como cálculos de la importación agregada existente. No definen por sí solos la fórmula canónica de una venta individual ni prueban si el impuesto está incluido, excluido o calculado con otra semántica en Makos.

---

#### 16. Tratamiento de la fundación de pagos Wompi existente

La línea base técnica contiene `payments.transactions` para checkout de pedidos con datos como proveedor, referencia, importe en unidad menor, moneda, estado y `payment_method`.

Esa estructura demuestra que Vento ya distingue un pago como objeto técnico separado del pedido, pero no se eleva por sí sola al contrato definitivo de importación del POS externo.

Reglas:

1. `provider = wompi` es específico de esa integración y no se aplica a Makos;
2. el default `COP` de esa tabla no demuestra la moneda de una venta Makos;
3. los estados físicos `pending`, `requires_action`, `approved`, `rejected`, `cancelled`, `refunded` y `error` no se convierten en vocabulario Makos por existencia;
4. el modelo actual no demuestra soporte integral de pagos parciales o medios combinados provenientes del POS externo;
5. `refunded` continúa sujeto a la semántica de `INT-POS-008`;
6. esta tarea no modifica esa estructura física.

---

#### 17. Evidencia requerida del binding futuro de Makos

Antes de que un piloto transaccional use información monetaria o de pagos de Makos, deberá existir evidencia suficiente para completar esta matriz:

| Área                       | Evidencia requerida                                                                | Resultado permitido                                      |
| -------------------------- | ---------------------------------------------------------------------------------- | -------------------------------------------------------- |
| subtotal y total           | campos y semántica exacta                                                          | importación sin recomposición inventada                  |
| descuentos                 | alcance, importe, moneda y desglose disponible                                     | venta/línea/agregado según evidencia                     |
| impuestos                  | importe, alcance, código o etiqueta, base/tasa cuando existan, inclusión/exclusión | componente tributario reproducible                       |
| propina                    | disponibilidad, importe, moneda y relación con total/pago                          | componente separado cuando exista                        |
| pagos por venta            | existencia y cardinalidad                                                          | cero, uno, varios o agregado según evidencia             |
| identidad de pago          | campo estable cuando exista                                                        | referencia externa conservada                            |
| medio de pago              | código/etiqueta y semántica                                                        | mapping o clasificación explícita de no resolución       |
| importe de pago            | valor y moneda                                                                     | hecho cuantificable                                      |
| estado de pago             | catálogo y significado del proveedor                                               | mapping al vocabulario mínimo cuando exista equivalencia |
| proveedor/referencia       | campos disponibles                                                                 | trazabilidad del hecho                                   |
| timestamps de pago         | semántica de cada campo                                                            | tiempos importables sin inferencia                       |
| pagos parciales/combinados | garantía del recurso o desglose por pago                                           | preservación de cada componente                          |
| moneda                     | valor por registro o garantía contractual                                          | conciliación homogénea                                   |
| precisión                  | formato y escala efectiva                                                          | conservación sin redondeo inventado                      |

No se registran nombres de endpoints, propiedades JSON, códigos, tasas ni catálogos específicos porque la especificación técnica del tenant Vento no está provisionada.

---

#### 18. Puertas de elegibilidad derivadas

Una venta importada no podrá avanzar con efectos que dependan de información monetaria o de pago cuando ocurra alguna de estas condiciones:

| Condición                                            | Tratamiento                                                         | Tarea propietaria de salida                                                                |
| ---------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| moneda no resoluble                                  | conservar importes sin sumarlos ni convertirlos                     | `INT-POS-021` deberá demostrar suficiencia antes del piloto; conciliación en `INT-POS-020` |
| descuento con alcance ambiguo                        | conservar componente sin reparto artificial                         | `INT-POS-021`; conciliación en `INT-POS-020`                                               |
| impuesto sin semántica suficiente para recomposición | conservar valor de fuente y evitar cálculo fiscal inventado         | `INT-POS-021`; conciliación en `INT-POS-020`                                               |
| propina sin relación demostrable con total o pago    | conservar componente separado                                       | `INT-POS-021`; conciliación en `INT-POS-020`                                               |
| medio de pago desconocido                            | conservar valor de fuente como `UNRESOLVED`                         | `INT-POS-021` deberá demostrar tratamiento seguro                                          |
| estado de pago desconocido                           | no inferir confirmación o fallo                                     | `INT-POS-021`                                                                              |
| timeout o resultado incierto                         | mantener condición no resuelta                                      | `INT-POS-021`; conciliación en `INT-POS-020`                                               |
| pagos parciales sin identidad o desglose suficiente  | no sintetizar componentes individuales                              | `INT-POS-021`; conciliación en `INT-POS-020`                                               |
| señal de devolución, reversión o reembolso           | preservar y no aplicarla como descuento ordinario                   | `INT-POS-008`                                                                              |
| falta de procedencia, payload, hash o recepción      | no presentar la transformación como reproducible                    | `INT-POS-009`                                                                              |
| diferencia monetaria persistente                     | no corregir la venta ni el pago                                     | `INT-POS-020`                                                                              |
| efecto económico requerido                           | no escribir contabilidad desde el adaptador                         | `INT-POS-017`                                                                              |
| binding todavía no demostrado                        | operar únicamente en el alcance permitido por el piloto sin efectos | `INT-POS-021`                                                                              |

`INT-POS-022` no podrá habilitar efectos sobre componentes críticos que continúen no resueltos.

---

#### 19. Fronteras con tareas posteriores

- `INT-POS-008` define anulaciones, devoluciones y reembolsos; un importe negativo, estado `refunded` o señal equivalente no se ejecuta desde esta tarea.
- `INT-POS-009` conserva físicamente payload original, versión, hash y recepción.
- `INT-POS-010` resuelve empresa, sede, terminal y caja externas cuando sean necesarias para contextualizar venta o pago.
- `INT-POS-011` resuelve producto, presentación y receta sin alterar snapshots monetarios de fuente.
- `INT-POS-012` gobierna líneas no mapeadas sin permitir efectos automáticos de inventario.
- `INT-POS-013` define idempotencia por sistema, venta y línea externa y no autoriza duplicar pagos por reintento.
- `INT-POS-014` define transporte mediante webhook o polling sin cambiar componentes monetarios.
- `INT-POS-015` emite el evento canónico de venta validada solo cuando las puertas aplicables estén satisfechas.
- `INT-POS-017` define el evento económico para NUMERA exactamente una vez.
- `INT-POS-018` define fidelización sin utilizar descuento o propina como sustituto de reglas de puntos.
- `INT-POS-019` define compensaciones internas asociadas a anulaciones y devoluciones.
- `INT-POS-020` reconcilia ventas, componentes monetarios, pagos y efectos sin reescribir historia.
- `INT-POS-021` prueba el binding real sin efectos sobre inventario ni finanzas.
- `INT-POS-022` solo habilita efectos después de demostrar suficiencia.
- `INT-POS-023` cambia la fuente futura hacia PULSO sin cambiar el significado de los componentes ya normalizados.
- `SHELL-CON-020` y `SHELL-CON-021` materializarán posteriormente los tipos y estructuras físicas compartidas de venta y línea.
- `SHELL-CON-023` materializará el contrato técnico transversal de idempotencia y conciliación aplicable a reintentos y hechos correlacionados, sin convertir el intento técnico en un pago nuevo.

Ningún handoff inicia ni aprueba la tarea receptora.

---

#### 20. Decisiones congeladas

1. descuentos, impuestos y propinas permanecen componentes diferenciados;
2. venta y pago permanecen hechos distintos;
3. una venta admite cero, uno o varios hechos de pago;
4. pagos parciales y medios combinados se conservan sin consolidación ficticia;
5. un pago conserva importe, moneda, medio, proveedor, referencia y estado cuando la fuente los entregue;
6. el medio de pago conserva su código o etiqueta de fuente y solo se normaliza con equivalencia acreditada;
7. el vocabulario mínimo de pago es `PENDING`, `AUTHORIZED`, `CONFIRMED`, `FAILED`, `CANCELLED` y `UNRESOLVED`;
8. un timeout o resultado desconocido no se considera fallo;
9. pago confirmado no equivale a venta finalizada, conciliación bancaria, caja cerrada ni documento fiscal;
10. cancelación de intento de pago no equivale a devolución o reembolso;
11. señales de devolución, reversión o reembolso pertenecen a `INT-POS-008`;
12. una propina no se fusiona con precio, impuesto, descuento o pago;
13. ausencia de campo no equivale a cero confirmado;
14. un default técnico cero no se eleva a afirmación de la fuente;
15. moneda no se asume desde Wompi, interfaz, sede o configuración no acreditada del binding;
16. no se suman monedas distintas ni se aplica conversión inventada;
17. signo y precisión de fuente se conservan;
18. no se redondean importes para forzar igualdad;
19. un descuento agregado no se reparte entre líneas sin evidencia;
20. un impuesto agregado no se reparte entre líneas sin evidencia;
21. impuesto cero no demuestra exención o tarifa cero;
22. el documento fiscal mantiene autoridad externa mientras corresponda;
23. el flujo `makos_excel` vigente es agregado y no demuestra propinas ni pagos individuales;
24. los ceros generados por el parser actual para campos ausentes no son evidencia de cero informado por Makos;
25. las fórmulas actuales de neto y bruto son cálculos legacy agregados, no fórmula canónica de venta individual;
26. la fundación Wompi existente no define el contrato del POS externo;
27. la especificación técnica de Makos sigue no provisionada y no se inventan sus campos;
28. esta tarea no modifica código, migraciones, Supabase, datos, credenciales, endpoints, webhooks, pagos reales ni efectos financieros;
29. `INT-POS-008` permanece exclusivamente reservada.

---

#### 21. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** `INT-POS-007` materializa para la transición Makos → PULSO comportamientos ya protegidos por la cobertura canónica vigente: separación de venta, pago, caja y documento fiscal; pagos parciales y medios combinados con importe, moneda, proveedor, referencia y estado; conservación de propinas y descuentos; prohibición de asumir timeout como fallo; convergencia del POS externo y PULSO en el mismo contrato; conciliación de pagos incongruentes y montos o monedas divergentes; preservación de fuente y diferencias sin sobrescribir historia. No incorpora una capacidad ejecutable nueva ni una excepción fuera de esas reglas ya protegidas, por lo que el registro 04A permanece sin cambios.

#### 22. Cobertura de prueba existente preservada

Se preservan sin modificación:

- `TREQ-PULSO-005`, cobertura de snapshots de precio, impuestos, descuentos y separación de estados del ciclo comercial;
- `TREQ-PULSO-006`, cobertura primaria de venta, pago, caja, documento fiscal, propina, descuento, pagos parciales y medios combinados, importe, moneda, proveedor, referencia, estado, timeout y conciliación;
- `TREQ-INTEGRATION-006`, cobertura de fuente empresarial única y conservación de diferencias sin sobrescribir historia;
- `TREQ-INTEGRATION-014`, cobertura de convergencia POS externo/PULSO, parcialidad, pagos incongruentes, idempotencia y conciliación;
- `TREQ-INTEGRATION-017`, cobertura de venta y pago hacia NUMERA mediante contratos correlacionados, montos y monedas divergentes, pagos sin aplicación y reversos;
- `TREQ-NUMERA-001`, cobertura de reconciliación financiera contra hechos y documentos fuente;
- `TREQ-NUMERA-002`, cobertura de monto, moneda, impuesto, fuente, correlación y correcciones compensatorias;
- `TREQ-NUMERA-003`, cobertura de pagos parciales, aplicación de pagos, saldos y conciliación.

Ningún requisito existente cambia de identidad, texto, estado, relación, propietario, evidencia ni secuencia por esta tarea.

---

#### 23. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. conserva el contrato de venta y línea de `INT-POS-005` sin fusionar venta y pago;
2. conserva los estados y timestamps de `INT-POS-006` sin derivarlos de valores monetarios;
3. define slots mínimos comunes para componentes monetarios;
4. distingue valor ausente de cero explícito;
5. conserva moneda, signo y precisión sin defaults no acreditados;
6. define importación de descuentos de encabezado y línea sin reparto artificial;
7. diferencia descuento de devolución, reembolso y compensación;
8. define importación de impuestos sin asumir tasa, base, exención o inclusión cuando no exista evidencia;
9. conserva autoridad fiscal externa;
10. define propina como componente separado;
11. impide usar propina como ingreso de producto, impuesto, descuento o pago;
12. define un hecho de pago separado de la venta;
13. admite cero, uno o varios pagos por venta;
14. admite pagos parciales y medios combinados;
15. conserva identidad, medio, proveedor, importe, moneda, estado y referencias de pago cuando existan;
16. define `MAPPED`, `NOT_PROVIDED` y `UNRESOLVED` para interpretación de medios;
17. define vocabulario mínimo de estado de pago sin importar los estados físicos de Wompi ni inventar los de Makos;
18. impide tratar timeout o resultado desconocido como fallo;
19. impide tratar `CANCELLED` como reembolso;
20. conserva señales de reversión para `INT-POS-008`;
21. prohíbe sumar monedas distintas sin conversión autorizada;
22. prohíbe redondear o reasignar componentes para cuadrar;
23. define diferencias monetarias como conciliables en `INT-POS-020`;
24. clasifica uno por uno los componentes monetarios disponibles y ausentes del flujo `makos_excel`;
25. documenta que el parser actual puede producir ceros técnicos para campos ausentes sin elevarlos a verdad de fuente;
26. clasifica la fundación Wompi como implementación existente que no define el binding Makos;
27. define evidencia mínima requerida del futuro binding de Makos;
28. asigna cada bloqueo a una tarea exacta con condición de salida;
29. genera cero cambios `TREQ-*` por existir cobertura canónica suficiente;
30. no crea una copia del registro 04A;
31. no modifica código, DDL, DML, migraciones, Supabase, datos, credenciales, pagos, endpoints o configuración remota;
32. mantiene `INT-POS-008` como única siguiente tarea reservada.

---

#### 24. Continuidad

ÚLTIMA TAREA APROBADA

`INT-POS-006 — Definir importación de encabezados, líneas, estados y timestamps`

TAREA ACTUAL APROBADA

`INT-POS-007 — Definir importación de descuentos, impuestos, propinas y medios de pago`

SIGUIENTE TAREA RESERVADA

`INT-POS-008 — Definir importación de anulaciones, devoluciones y reembolsos`


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
