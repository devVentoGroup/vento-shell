### MINI-BLOQUE — VENTAS INVENTARIO FINANZAS Y FIDELIZACION

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **ventas inventario finanzas y fidelizacion** dentro de **X INTEGRACIONES**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `INT-SALES-001` a `INT-SALES-011` — 11 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Definir contrato para que PULSO registre la venta” y concluye con “Definir retiro del adaptador externo sin modificar consumidores internos”.
<!-- PLAN-SECTION-META:END -->

### ✅ INT-SALES-001 — Definir contrato para que PULSO registre la venta

**Estado:** APROBADA  
**Tarea anterior:** `INT-POS-024 — Definir revocación o reducción de credenciales cuando PULSO asuma la fuente`  
**Tarea siguiente:** `INT-SALES-002 — Definir emisión en PULSO del mismo contrato canónico utilizado durante la transición`  
**Tipo de tarea:** documental; definición normativa y materializada del contrato con el que PULSO registra de forma durable una venta y sus líneas, preservando identidad, procedencia, autoridad de fuente, revisión, estados comerciales, componentes monetarios, referencias relacionadas y trazabilidad, sin emitir el evento de venta, aplicar efectos en NEXO, NUMERA o PASS, implementar el esquema físico, modificar código, crear migraciones ni modificar Supabase  
**Fase:** exclusivamente documental  
**Repositorio propietario:** `vento-shell`  
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/07_VENTAS_INVENTARIO_FINANZAS_Y_FIDELIZACION.md`  
**Aplicación propietaria del registro objetivo:** `PULSO`  
**Línea base documental:** `vento-shell@a87949375d233472394499dab51eda7c2af1f7e3`  
**Línea base técnica PULSO observada:** `vento-pulso@71e0184486b5fe11e0a42435baf4024807a80efd`  
**Cambios físicos autorizados:** ninguno  
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el contrato permanente mediante el cual PULSO representa y registra una **venta canónica** y sus **líneas de venta** como hechos comerciales durables, separados de pedido, pago, caja, documento fiscal, inventario, hecho económico y fidelización.

El objetivo es cerrar la frontera entre:

```text
HECHO COMERCIAL DE VENTA
→ REGISTRO DURABLE EN PULSO
```

y:

```text
REGISTRO DURABLE EN PULSO
≠ EMISIÓN DEL EVENTO DE VENTA
≠ MOVIMIENTO NEXO
≠ HECHO NUMERA
≠ MOVIMIENTO PASS
≠ PAGO
≠ MOVIMIENTO DE CAJA
≠ DOCUMENTO FISCAL
```

La tarea reutiliza el contrato canónico definido durante `INT-POS-005..020` y lo convierte en la regla de registro de PULSO sin crear una segunda semántica de venta.

---

#### 2. Resultado sustantivo

Queda definido el **contrato canónico de registro de venta PULSO** con las siguientes decisiones obligatorias:

1. PULSO conserva una identidad estable para cada venta y para cada línea.
2. La venta registrada conserva siempre su fuente empresarial real.
3. Una venta originada históricamente en Makos puede quedar representada en PULSO sin convertirse en venta nativa PULSO.
4. Una venta originada por PULSO bajo un alcance donde PULSO tenga autoridad conserva PULSO como fuente.
5. El registro de venta no depende de que NEXO, NUMERA o PASS hayan aplicado ya sus efectos.
6. El registro de venta no acredita por sí solo pago, movimiento de caja, documento fiscal, inventario, costo ni fidelización.
7. Una venta individual requiere identidad individual y al menos una línea individual válida; un agregado diario o por producto no se eleva a venta individual.
8. Pedido y venta permanecen hechos distintos aunque exista una relación entre ellos.
9. Cada revisión de una venta conserva la identidad de la venta y la historia anterior.
10. Reintentar el mismo registro no crea una segunda venta.
11. Una reutilización incompatible de identidad no sobrescribe el hecho previo.
12. La emisión del evento posterior pertenece exclusivamente a `INT-SALES-002`.
13. Los efectos físicos, económicos y de fidelización pertenecen exclusivamente a sus tareas posteriores y aplicaciones propietarias.
14. El contrato no habilita por sí solo el corte de fuente ni elimina el control contra doble fuente.
15. El contrato no materializa todavía tablas, RPC, actions, tipos compartidos, outbox ni eventos físicos.
16. La implementación actual de importación agregada `makos_excel` no satisface por sí sola este contrato de venta individual.
17. Se crean cero requisitos nuevos de prueba y se modifican cero requisitos existentes.

---

#### 3. Dependencias canónicas consumidas

La tarea consume y conserva sin reabrir las decisiones aprobadas de:

- `INT-POS-003`, para autoridad temporal de fuente y separación entre fuente y transporte;
- `INT-POS-005`, para identidad y semántica de venta y línea;
- `INT-POS-006`, para encabezados, líneas, estados, revisiones y timestamps;
- `INT-POS-007`, para descuentos, impuestos, propinas y medios de pago;
- `INT-POS-008`, para cancelación, anulación, devolución y reembolso como hechos separados;
- `INT-POS-009`, para procedencia, payload original, versión, hash y recepción cuando exista fuente externa;
- `INT-POS-010`, para empresa, sede, terminal y caja;
- `INT-POS-011`, para producto, presentación y receta cuando correspondan;
- `INT-POS-012`, para bloqueo de líneas sin resolución suficiente;
- `INT-POS-013`, para identidad e idempotencia por venta y línea;
- `INT-POS-014`, para independencia respecto del mecanismo de adquisición;
- `INT-POS-015`, para el contrato del evento canónico posterior;
- `INT-POS-016`, para la frontera propietaria de NEXO;
- `INT-POS-017`, para la frontera propietaria de NUMERA;
- `INT-POS-018`, para la frontera propietaria de PASS;
- `INT-POS-019`, para compensaciones no destructivas;
- `INT-POS-020`, para conciliación de venta y efectos;
- `INT-POS-021` y `INT-POS-022`, para separar especificación documental de evidencia operativa;
- `INT-POS-023`, para autoridad de fuente por sede, terminal y fecha efectiva;
- `INT-POS-024`, para que el lifecycle de acceso al POS externo no altere la historia de ventas.

También preserva la cobertura de `TREQ-PULSO-001`, `TREQ-PULSO-005`, `TREQ-PULSO-006` y `TREQ-INTEGRATION-014`.

---

#### 4. Frontera exacta de esta tarea frente a `INT-SALES-002..011`

| Materia                                                 | Propietaria     | Decisión en `INT-SALES-001` |
| ------------------------------------------------------- | --------------- | --------------------------- |
| registro durable de venta y líneas en PULSO             | `INT-SALES-001` | **DEFINIDA**                |
| emisión desde PULSO del contrato canónico de venta      | `INT-SALES-002` | `RESERVADA`                 |
| salida de inventario                                    | `INT-SALES-003` | `RESERVADA`                 |
| recepción económica en NUMERA                           | `INT-SALES-004` | `RESERVADA`                 |
| acumulación de puntos                                   | `INT-SALES-005` | `RESERVADA`                 |
| redención de puntos                                     | `INT-SALES-006` | `RESERVADA`                 |
| control permanente contra efectos duplicados por retry  | `INT-SALES-007` | `RESERVADA`                 |
| conciliación permanente de convivencia                  | `INT-SALES-008` | `RESERVADA`                 |
| contrato permanente de corte por sede, terminal y fecha | `INT-SALES-009` | `RESERVADA`                 |
| control permanente contra doble fuente                  | `INT-SALES-010` | `RESERVADA`                 |
| retiro permanente del adaptador externo                 | `INT-SALES-011` | `RESERVADA`                 |

Esta tarea define el hecho que las tareas posteriores consumirán; no adelanta su implementación ni sus efectos.

---

#### 5. Separaciones semánticas obligatorias

Permanecen vigentes las desigualdades del contrato de transición:

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

Y para cada línea:

```text
LÍNEA DE VENTA ≠ PRODUCTO
LÍNEA DE VENTA ≠ RECETA
LÍNEA DE VENTA ≠ MOVIMIENTO DE INVENTARIO
LÍNEA DE VENTA ≠ LÍNEA DE PEDIDO POR INFERENCIA
```

Una relación explícita puede vincular hechos distintos. La relación no los fusiona ni autoriza a compartir estado, identidad o autoridad.

---

#### 6. Unidad lógica de registro

La unidad mínima para registrar una venta individual está compuesta por:

```text
IDENTIDAD DE VENTA
+
FUENTE EMPRESARIAL
+
CONTEXTO DE ORIGEN
+
REVISIÓN APLICABLE
+
MOMENTO DEL HECHO
+
ESTADO COMERCIAL
+
COMPONENTES COMERCIALES
+
AL MENOS UNA LÍNEA INDIVIDUAL VÁLIDA
+
PROCEDENCIA Y CORRELACIÓN
=
VENTA CANÓNICA REGISTRABLE
```

Reglas:

1. un total diario no es venta individual;
2. una fila agregada por producto no es venta individual;
3. un lote de importación no es venta individual;
4. un archivo no es venta individual;
5. un pedido no se convierte en venta por cambiar una etiqueta de estado;
6. una referencia de pago no sustituye la identidad de venta;
7. una referencia fiscal no sustituye la identidad de venta;
8. una venta sin línea individual no se presenta como venta canónica completa;
9. cada línea pertenece a una venta identificada y conserva identidad propia;
10. la colección de líneas de una revisión debe ser coherente con la revisión registrada.

---

#### 7. Autoridad de fuente antes del registro

PULSO solo registra una venta bajo una clasificación de fuente que pueda sostenerse con la autoridad temporal vigente.

Reglas:

1. una venta Makos anterior a un corte conserva `Makos` como fuente aunque se reciba o procese después;
2. una venta PULSO originada en un alcance transferido conserva `PULSO` como fuente aunque sincronice tarde;
3. la hora de recepción o sincronización no reemplaza el momento del hecho para decidir procedencia;
4. una venta histórica Makos representada dentro de PULSO no se reclasifica como nativa PULSO;
5. una venta Makos observada en un alcance donde PULSO ya tenga autoridad de nuevas ventas se trata como conflicto de fuente y no como segunda venta silenciosa;
6. una venta PULSO observada antes de que PULSO tenga autoridad para ese alcance no se normaliza silenciosamente como válida;
7. cuando sede, terminal, tiempo o fuente no permitan resolver la autoridad de forma inequívoca, el registro con efectos posteriores queda bloqueado hasta conciliación;
8. esta tarea no define ni ejecuta el corte permanente; `INT-SALES-009` y `INT-SALES-010` conservan esa responsabilidad.

---

#### 8. Dimensiones lógicas de la venta registrada

La representación durable deberá poder conservar, como mínimo, las siguientes dimensiones semánticas. Esta tarea no fija nombres físicos de columnas ni tipos de base de datos.

| Dimensión                       | Obligación                                                  | Regla                                                                                   |
| ------------------------------- | ----------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| identidad canónica de venta     | requerida                                                   | estable, opaca y no derivada de atributos empresariales mutables                        |
| sistema de origen               | requerida                                                   | conserva Makos o PULSO según la autoridad real del hecho                                |
| contexto o instancia de origen  | requerida cuando sea necesaria para desambiguar             | evita colisiones entre empresas, ambientes o instancias                                 |
| identidad de venta en la fuente | requerida para una venta individual                         | estable dentro de la fuente; no se sustituye por total, fecha redondeada o posición     |
| revisión o versión de fuente    | condicional                                                 | se conserva cuando exista; no se inventa una revisión externa                           |
| versión del contrato canónico   | requerida                                                   | permite interpretar el registro sin reinterpretar historia                              |
| sede                            | requerida antes de operación efectiva                       | referencia la sede canónica autorizada                                                  |
| terminal                        | requerida cuando forme parte de la autoridad o trazabilidad | no se infiere desde una sede si la evidencia no la determina                            |
| caja o sesión relacionada       | condicional                                                 | permanece relación independiente de la venta                                            |
| momento del hecho comercial     | requerido                                                   | representa cuándo ocurrió la venta según la semántica aprobada                          |
| estado comercial                | requerido                                                   | pertenece a la venta y no se deriva de pago, caja o fiscalidad                          |
| cliente                         | opcional                                                    | no se crea cliente artificial para una venta anónima                                    |
| pedido relacionado              | opcional                                                    | conserva vínculo explícito sin fusionar pedido y venta                                  |
| referencia fiscal               | condicional                                                 | conserva proveedor, referencia o estado cuando exista contrato aplicable                |
| componentes monetarios          | requeridos según aplicabilidad                              | conserva snapshots realmente aplicados y sus componentes separados                      |
| referencias de pago             | condicionales                                               | vinculan hechos de pago independientes cuando existan                                   |
| líneas de venta                 | requeridas                                                  | una venta individual registrable contiene al menos una línea individual válida          |
| procedencia                     | requerida                                                   | permite reconstruir fuente, evidencia y transformación cuando correspondan              |
| correlación                     | requerida                                                   | vincula registro, revisiones, evento posterior y efectos sin reutilizar sus identidades |
| actor o principal de registro   | requerido según contrato de auditoría                       | permite atribuir la acción técnica o humana aplicable                                   |
| timestamps de registro          | requeridos según contrato de auditoría                      | no sustituyen el tiempo del hecho comercial                                             |

---

#### 9. Dimensiones lógicas de la línea de venta

Cada línea registrada deberá poder conservar:

| Dimensión                       | Obligación                                          | Regla                                                                     |
| ------------------------------- | --------------------------------------------------- | ------------------------------------------------------------------------- |
| identidad canónica de línea     | requerida                                           | estable y distinta de venta, producto y pedido                            |
| identidad de venta              | requerida                                           | toda línea pertenece a exactamente una venta registrada                   |
| identidad de línea en la fuente | requerida cuando la fuente la provea                | no se reemplaza por posición si existe identidad más fuerte               |
| secuencia de origen             | condicional                                         | conserva orden cuando sea material sin convertirlo en identidad universal |
| revisión de línea               | condicional                                         | preserva cambios sin destruir revisiones anteriores                       |
| referencia comercial vendida    | requerida                                           | conserva el ítem realmente vendido                                        |
| producto canónico               | requerido antes de efectos dependientes de producto | no se inventa cuando no exista resolución suficiente                      |
| presentación                    | condicional                                         | conserva la presentación realmente vendida cuando aplique                 |
| receta                          | condicional                                         | es referencia para efectos posteriores, no identidad de la línea          |
| cantidad                        | requerida                                           | conserva cantidad comercial con semántica inequívoca                      |
| unidad                          | requerida cuando la cantidad no sea autosuficiente  | impide interpretar magnitudes incompatibles                               |
| precio aplicado                 | requerido según aplicabilidad                       | conserva snapshot comercial del momento de venta                          |
| descuento                       | condicional                                         | permanece componente diferenciado                                         |
| impuesto                        | condicional                                         | permanece componente diferenciado                                         |
| propina atribuible              | condicional                                         | no se fusiona con precio o impuesto                                       |
| estado de línea                 | condicional                                         | no reemplaza el estado de la venta                                        |
| procedencia                     | requerida                                           | permite explicar qué entrada o acción originó la línea                    |

Una línea sin la referencia canónica necesaria para un efecto dependiente de producto no habilita ese efecto por inferencia.

---

#### 10. Identidad y estabilidad

La identidad del registro deberá satisfacer simultáneamente:

1. una venta tiene una identidad canónica estable durante todo su ciclo de vida;
2. cambiar estado no crea otra venta;
3. cambiar mapping no crea otra venta ni otra línea;
4. recibir una revisión posterior no crea otra venta;
5. sincronizar después de un periodo offline no crea otra venta;
6. un retry no crea otra venta;
7. una relectura de una venta Makos no crea una venta nativa PULSO;
8. una venta PULSO no se reidentifica con el ID de pedido, pago, factura o movimiento de inventario;
9. la identidad no se deriva únicamente de total, fecha, hora redondeada, cliente, terminal, cajero o combinación de atributos mutables;
10. una línea no se reidentifica únicamente por producto, precio, importe o posición cuando exista una identidad más fuerte;
11. una misma identidad reutilizada con contenido lógicamente incompatible produce conflicto y no reemplaza el registro previo;
12. los detalles físicos de clave, claim, huella y concurrencia se materializarán bajo los contratos de idempotencia y `INT-SALES-007` sin cambiar estas invariantes.

---

#### 11. Registro inicial y revisiones

La primera representación aceptada de una venta crea su identidad durable.

Las revisiones posteriores deberán:

- conservar la misma identidad de venta;
- conservar la misma identidad de cada línea que continúe representando la misma línea;
- registrar la nueva revisión o versión aplicable;
- conservar el estado y contenido previos como historia reconstruible;
- identificar la causa o acción que explica el cambio cuando exista;
- impedir que una revisión más antigua sobrescriba una posterior;
- impedir que un replay de una revisión ya conocida genere otra venta;
- mantener separadas corrección, anulación, devolución, reembolso y compensación.

Una proyección de “estado actual” puede existir en la implementación futura, pero nunca será la única evidencia si para producirla se destruye la historia anterior.

---

#### 12. Relación con pedido

El contrato conserva:

```text
PEDIDO
→ PUEDE ESTAR RELACIONADO CON UNA VENTA
```

pero prohíbe:

```text
PEDIDO = VENTA
```

Reglas:

1. confirmar un pedido no registra automáticamente una venta si no se han cumplido las condiciones del hecho comercial;
2. modificar un pedido no reescribe automáticamente una venta ya registrada;
3. cancelar un pedido no borra una venta ya ocurrida;
4. una venta puede conservar una referencia explícita al pedido que la originó o contextualizó;
5. el snapshot de precio y oferta de la venta conserva lo realmente aplicado al hecho comercial y no se recalcula silenciosamente desde el catálogo actual;
6. comandas, preparación, entrega y cumplimiento permanecen hechos separados.

---

#### 13. Componentes monetarios

La venta registrada preserva los componentes monetarios definidos por `INT-POS-007` y `TREQ-PULSO-006`.

Reglas:

1. subtotal, descuentos, impuestos, propinas y total no se colapsan en un único valor cuando el contrato aplicable los distingue;
2. los valores pertenecen al snapshot de la venta o línea y no se recalculan desde precios actuales para reescribir historia;
3. la moneda y unidad monetaria aplicables deberán ser inequívocas cuando sean materiales;
4. descuentos conservan su valor realmente aplicado y la referencia de regla cuando corresponda;
5. impuestos conservan el valor realmente aplicado y la referencia necesaria cuando exista;
6. propina permanece separada de precio, descuento e impuesto;
7. redondeos o ajustes solo pueden representarse cuando el contrato propietario los defina; no se inventa una fórmula local;
8. una diferencia posterior se trata mediante revisión, conciliación o compensación autorizada, no mediante edición silenciosa del registro histórico.

---

#### 14. Pago, caja y documento fiscal

El registro de venta conserva relaciones, no equivalencias.

##### 14.1. Pago

- un pago mantiene identidad, monto, moneda, proveedor, referencia y estado propios;
- una respuesta técnica de un proveedor de pago no cambia por sí sola el estado comercial de la venta;
- un timeout de pago no se registra como fracaso cierto;
- pagos parciales o combinados no se condensan en una bandera de “pagado” que destruya su detalle;
- el registro de la venta no demuestra que todos los pagos estén conciliados.

##### 14.2. Caja

- sesión de caja y movimientos de caja tienen identidad y lifecycle propios;
- asociar una venta a una sesión no convierte la venta en movimiento de caja;
- cierre de caja no borra ventas ni pendientes.

##### 14.3. Documento fiscal

- documento fiscal y venta permanecen hechos distintos;
- PULSO conserva la referencia y estado fiscal cuando aplique;
- la autoridad fiscal permanece en el proveedor o contrato autorizado correspondiente;
- registrar la venta no afirma que el documento fiscal ya haya sido aceptado o emitido.

---

#### 15. Cliente e identidad de fidelización

Una venta puede existir sin cliente identificado.

Reglas:

1. no se fabrica una identidad de cliente para completar el registro;
2. cuando exista cliente identificado, se conserva una referencia autorizada y mínima;
3. la identidad de cliente no se usa como identidad de venta;
4. una cuenta PASS no se crea ni se vincula por inferencia;
5. la existencia de cliente no acredita elegibilidad para acumular puntos;
6. `INT-SALES-005` conserva la evaluación de acumulación y su ledger;
7. `INT-SALES-006` conserva la redención y su identidad independiente.

---

#### 16. Condición de consistencia antes de considerar registrada una venta canónica

El contrato exige que la revisión que se declare registrada sea internamente coherente.

Debe poder demostrarse:

1. identidad de venta resuelta;
2. fuente resuelta;
3. autoridad de fuente compatible con el alcance conocido;
4. contexto de sede suficiente;
5. terminal o contexto adicional cuando sea necesario para autoridad o trazabilidad;
6. momento del hecho comercial suficiente;
7. estado comercial válido según el contrato;
8. al menos una línea individual válida;
9. identidad de línea estable;
10. cantidad válida y semánticamente interpretable;
11. componentes comerciales presentes según aplicabilidad;
12. relación de producto suficiente antes de cualquier efecto dependiente de producto;
13. versión/revisión que no regrese silenciosamente el estado conocido;
14. procedencia y correlación suficientes;
15. autorización de la acción de registro;
16. ausencia de conflicto incompatible de identidad y contenido.

Si una condición obligatoria no se satisface, el dato puede conservarse como evidencia, candidato o estado técnico según la implementación propietaria, pero no se presenta como venta canónica completa apta para la cadena posterior.

---

#### 17. Outcomes lógicos del contrato de registro

La implementación futura deberá poder distinguir conceptualmente, sin que esta tarea fije un enum físico, los siguientes resultados:

| Resultado lógico            | Semántica                                                                                               |
| --------------------------- | ------------------------------------------------------------------------------------------------------- |
| `REGISTRADA`                | una revisión válida quedó durablemente asociada a una identidad de venta y sus líneas                   |
| `REPETICION_CONVERGENTE`    | la misma identidad y mismo contenido lógico ya estaban registrados y se recupera el resultado previo    |
| `REVISION_APLICADA`         | una revisión posterior válida quedó vinculada a la misma venta preservando historia                     |
| `CONFLICTO_DE_IDENTIDAD`    | la misma identidad intenta representar contenido incompatible o una fuente distinta sin contrato válido |
| `BLOQUEADA_POR_FUENTE`      | la autoridad de origen no puede resolverse o contradice el intervalo autorizado                         |
| `BLOQUEADA_POR_CONTRATO`    | faltan dimensiones obligatorias o existe una incompatibilidad semántica                                 |
| `BLOQUEADA_POR_LINEA`       | una venta individual no dispone de línea individual válida suficiente para declararse completa          |
| `PENDIENTE_DE_CONCILIACION` | existe evidencia relevante pero no puede decidirse de forma segura el resultado final del registro      |

Estos resultados son semánticos. Los nombres físicos, estados de persistencia y códigos de error corresponden a la materialización posterior.

---

#### 18. Atomicidad lógica y visibilidad hacia consumidores

El registro y la emisión posterior se separan por una frontera durable.

Regla:

```text
VENTA Y REVISIÓN DURABLES
→ ELEGIBLE PARA EMISIÓN POSTERIOR
```

No:

```text
EMITIR PRIMERO
→ INTENTAR COMPLETAR LA VENTA DESPUÉS
```

Invariantes:

1. un consumidor no debe observar un evento que describa una revisión de venta que todavía no sea durable;
2. una línea no se publica como parte de una venta si la revisión durable no la contiene;
3. una caída después del registro pero antes de la emisión no debe obligar a crear otra venta;
4. una caída durante la emisión no cambia el registro comercial;
5. la estrategia física de outbox, transacción o mecanismo equivalente pertenece a la materialización técnica y a `INT-SALES-002`/contratos transversales;
6. el éxito de la emisión no cambia la identidad de la venta.

---

#### 19. Idempotencia del registro y frontera con `INT-SALES-007`

`INT-SALES-001` conserva la idempotencia de identidad necesaria para impedir dos registros de la misma venta, pero no adelanta el control permanente de efectos de `INT-SALES-007`.

Reglas:

1. el mismo hecho comercial conserva la misma identidad a través de retry y replay;
2. misma identidad y mismo contenido lógico recuperan el resultado ya registrado;
3. misma identidad y contenido incompatible producen conflicto;
4. un timeout del cliente no autoriza crear una venta nueva;
5. un worker reiniciado no crea otra identidad;
6. una venta offline PULSO conserva su identidad al sincronizar;
7. un registro duplicado no debe convertirse en un segundo evento ni segundo efecto;
8. `INT-SALES-007` materializará el control permanente de deduplicación de efectos y reintentos entre consumidoras.

---

#### 20. Fallo parcial después del registro

Una venta comercial válida no se deshace porque una integración posterior falle.

Ejemplo normativo:

```text
VENTA REGISTRADA
+
EVENTO PENDIENTE O CONSUMIDOR FALLIDO
=
VENTA EXISTENTE
+
EFECTO PENDIENTE / CONCILIACIÓN
```

No:

```text
FALLO NEXO / NUMERA / PASS
→ BORRAR VENTA
```

Reglas:

1. fallo de NEXO no elimina la venta;
2. fallo de NUMERA no elimina la venta;
3. fallo de PASS no elimina la venta;
4. un consumidor no puede modificar la venta para aparentar que su efecto ocurrió;
5. conciliación conserva venta, evento, efecto esperado, resultado observado y residual;
6. una compensación posterior conserva vínculo con el hecho original;
7. un efecto inexistente no se fabrica para cerrar la venta.

---

#### 21. Offline, sincronización tardía, replay y backfill

Permanecen las reglas aprobadas en la transición:

1. una venta PULSO creada mediante un mecanismo offline autorizado conserva origen PULSO;
2. sincronizarla más tarde no cambia su identidad;
3. un replay conserva identidad, procedencia y revisión;
4. un backfill de una venta Makos conserva Makos como fuente;
5. un batch no se usa como identidad empresarial de cada venta;
6. la fecha del replay no sustituye el tiempo original del hecho;
7. una revisión tardía más antigua no sobrescribe la última revisión válida;
8. la audiencia de un evento histórico no se amplía por el mero hecho de reejecutar el procesamiento;
9. los controles permanentes de convivencia y corte permanecen en `INT-SALES-008..010`.

---

#### 22. Diagnóstico de la implementación física observada

La implementación PULSO observada contiene un flujo `makos_excel` que:

- carga un archivo XLSX;
- identifica filas agregadas por artículo;
- calcula SHA-256 del archivo;
- crea lotes por sede y fecha;
- conserva cantidades, subtotal, impuestos, descuentos y devoluciones por fila agregada;
- resuelve mapping por MID y, en la implementación actual, también intenta coincidencia por código o nombre;
- persiste filas en `pulso_daily_sales_import_rows`;
- permite ejecutar posteriormente `pulso_post_daily_sales_import`.

El esquema físico observado de esas filas no exige por fila:

- identidad externa individual de venta;
- identidad individual de línea dentro de una venta;
- terminal individual de origen;
- cliente individual;
- pago individual;
- evento individual de venta.

Además, `pulso_post_daily_sales_import` aplica un flujo legacy de inventario desde filas agregadas.

Por tanto:

```text
PULSO_DAILY_SALES_IMPORT
≠
REGISTRO CANÓNICO DE VENTA INDIVIDUAL
```

Y:

```text
POSTING LEGACY DE INVENTARIO
≠
PRUEBA DEL CONTRATO DE REGISTRO DE VENTA
```

Esta tarea no modifica ni elimina esos objetos físicos.

---

#### 23. Autorización y auditoría

Toda implementación futura del registro deberá respetar los contratos vigentes de autorización y auditoría.

Reglas:

1. la interfaz no es fuente de autorización final;
2. la acción de registro valida servidor-side la capacidad aplicable, actor o principal, sede y contexto requerido;
3. una autorización para operar pedidos no concede por inferencia capacidad para alterar pagos, caja, fiscalidad, inventario, fidelización o hechos económicos;
4. un principal técnico conserva finalidad y alcance propios;
5. el registro conserva actor o principal responsable, decisión, razones cuando correspondan y timestamps;
6. correcciones y revisiones conservan quién, qué cambió y por qué cuando el contrato lo requiera;
7. logs y auditoría no copian secretos, credenciales ni payloads personales completos cuando basta una referencia protegida;
8. la materialización física de permisos permanece bajo las tareas y paquetes de autorización PULSO correspondientes.

---

#### 24. Handoffs obligatorios

| Pendiente material                              | Tarea o propietario                                                                 | Condición de salida                                                                        |
| ----------------------------------------------- | ----------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| emisión desde PULSO del mismo contrato canónico | `INT-SALES-002`                                                                     | una venta durable produce el contrato/evento aprobado sin cambiar su identidad             |
| efecto físico de venta                          | `INT-SALES-003`                                                                     | NEXO recibe la venta y registra su movimiento bajo su frontera propietaria                 |
| hecho económico de venta                        | `INT-SALES-004`                                                                     | NUMERA recibe el hecho correlacionado sin escritura cruzada                                |
| acumulación de puntos                           | `INT-SALES-005`                                                                     | PASS evalúa elegibilidad y registra su ledger exactamente una vez                          |
| redención de puntos                             | `INT-SALES-006`                                                                     | PASS procesa redención bajo identidad y autoridad propias                                  |
| efectos duplicados por retry                    | `INT-SALES-007`                                                                     | la cadena permanente recupera resultados sin duplicar efectos                              |
| convivencia POS externo/PULSO                   | `INT-SALES-008`                                                                     | conciliación detecta diferencias mientras coexistan fuentes                                |
| corte permanente                                | `INT-SALES-009`                                                                     | sede, terminal y fecha efectiva gobiernan autoridad de nuevas ventas                       |
| doble fuente                                    | `INT-SALES-010`                                                                     | una misma venta no puede ser emitida como nueva por dos fuentes                            |
| retiro del adaptador                            | `INT-SALES-011`                                                                     | consumidoras internas ya no dependen del adaptador externo y la historia permanece intacta |
| implementación física del registro PULSO        | paquete E5 PULSO cubierto por `TREQ-PULSO-001`, `TREQ-PULSO-005` y `TREQ-PULSO-006` | esquema, acciones, seguridad, idempotencia, pruebas y evidencia materializan este contrato |

Ningún pendiente material queda sin destino documental o condición de salida.

---

#### 25. Prohibiciones

Queda prohibido:

1. usar un pedido como venta por equivalencia implícita;
2. usar un pago como venta;
3. usar una factura como venta;
4. usar una sesión o movimiento de caja como venta;
5. usar un movimiento NEXO como venta;
6. usar un hecho NUMERA como venta;
7. usar un movimiento PASS como venta;
8. usar un batch o archivo como identidad empresarial de venta;
9. elevar un agregado por producto o día a venta individual;
10. generar una identidad nueva en cada retry;
11. derivar identidad de venta únicamente desde total, timestamp redondeado, cliente, producto o posición;
12. reclasificar una venta Makos histórica como PULSO por haber sido recibida después del corte;
13. registrar silenciosamente una segunda venta ante conflicto de fuente;
14. inventar terminal, caja, cliente, pago, referencia fiscal, línea o producto faltantes;
15. inventar una revisión externa que la fuente no provea;
16. sobrescribir destructivamente una revisión anterior;
17. borrar la venta por fallo de un consumidor posterior;
18. marcar un efecto como aplicado para poder cerrar la venta;
19. emitir el evento antes de disponer de una revisión durable coherente;
20. aplicar inventario dentro del contrato de registro definido por esta tarea;
21. aplicar un hecho económico dentro del contrato de registro definido por esta tarea;
22. aplicar acumulación o redención PASS dentro del contrato de registro definido por esta tarea;
23. ejecutar un corte de fuente dentro de esta tarea;
24. retirar el adaptador externo dentro de esta tarea;
25. considerar el flujo `makos_excel` o `pulso_post_daily_sales_import` como materialización canónica suficiente de este contrato;
26. modificar código, SQL, migraciones, RLS, RPC, Supabase, datos, tipos, contratos físicos, endpoints o configuración remota durante esta tarea documental;
27. iniciar o desarrollar `INT-SALES-002`.

---

#### 26. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el registro canónico vigente ya protege expresamente el ciclo PULSO de creación de venta y líneas, la separación entre pedido, venta, pago, caja, fiscalidad y reversos, la convergencia entre POS externo y PULSO sobre el mismo contrato canónico, la fuente única, la idempotencia, la prevención de doble emisión, los efectos exactamente una vez y la conciliación. Esta tarea materializa la frontera documental de registro durable en PULSO sin introducir una nueva operación verificable independiente de esa cobertura.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

---

#### 27. Cobertura de prueba existente preservada

Se preserva sin modificación, en especial:

- `TREQ-PULSO-001`, para demostrar de extremo a extremo creación de venta, líneas, pago, inventario, fidelización, hecho económico y reversión antes de declarar operativo PULSO;
- `TREQ-PULSO-005`, para mantener separados pedido, venta, preparación, cumplimiento, pago, fiscalidad, inventario y fidelización y conservar snapshots e historia;
- `TREQ-PULSO-006`, para separar venta, cobro, pago, caja, documento fiscal, propina, descuento y reversos mediante acciones autorizadas y auditables;
- `TREQ-INTEGRATION-003`, para identidad estable, resultado recuperable, conflicto e idempotencia de operaciones reintentables;
- `TREQ-INTEGRATION-006`, para fuente empresarial única y resolución de fuentes competidoras sin sobrescribir historia;
- `TREQ-INTEGRATION-011`, para efectos físicos de venta exactamente una vez bajo NEXO;
- `TREQ-INTEGRATION-014`, para `INT-POS-001..024` y `INT-SALES-001..011`, contrato canónico de venta y línea, corte de fuente, prevención de doble emisión, efectos exactamente una vez y conciliación;
- `TREQ-INTEGRATION-015`, para compensaciones y fidelización correlacionadas;
- `TREQ-INTEGRATION-017`, para hechos económicos correlacionados e idempotentes hacia NUMERA;
- `TREQ-INTEGRATION-151`, para retry crítico con conciliación al agotarse;
- `TREQ-INTEGRATION-154`, para tratamiento de eventos fuera de orden;
- `TREQ-INTEGRATION-155`, para replay y backfill preservando identidad, procedencia y audiencia.

Ningún requisito cambia de identidad, texto, estado, relación, secuencia, propietaria ni evidencia por esta tarea.

---

#### 28. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. mantiene `INT-POS-024` como única tarea anterior;
2. mantiene `INT-SALES-002` como única tarea siguiente;
3. reutiliza el contrato canónico de venta y línea definido por `INT-POS-005`;
4. define registro durable de venta como frontera distinta de emisión y efectos;
5. conserva una identidad estable de venta;
6. conserva una identidad estable por línea;
7. exige al menos una línea individual válida para una venta individual completa;
8. impide usar agregados diarios, filas por producto, batches o archivos como ventas individuales;
9. conserva la fuente empresarial real;
10. impide reclasificar ventas Makos históricas como ventas PULSO;
11. admite PULSO como fuente únicamente dentro del alcance donde tenga autoridad;
12. bloquea conflictos de fuente en lugar de crear una segunda venta;
13. conserva sede y terminal cuando sean necesarias para autoridad y trazabilidad;
14. conserva el momento del hecho separado del momento de recepción o sincronización;
15. conserva estado comercial separado de estados de pago, caja y fiscalidad;
16. conserva cliente opcional sin identidad artificial;
17. conserva relación con pedido sin fusionar pedido y venta;
18. conserva snapshots monetarios sin recalcular historia desde catálogo actual;
19. conserva descuentos, impuestos y propina como componentes diferenciados;
20. conserva pagos como hechos independientes;
21. conserva caja como hecho independiente;
22. conserva documento fiscal como hecho independiente;
23. conserva revisiones sin sobrescritura destructiva;
24. impide que una revisión antigua sobrescriba una posterior;
25. impide que retry, replay u offline creen otra venta;
26. define conflicto ante reutilización incompatible de identidad;
27. exige procedencia y correlación suficientes;
28. define outcomes lógicos de registro sin fijar enums físicos;
29. exige que la revisión durable exista antes de la emisión posterior;
30. impide borrar la venta por fallo de NEXO, NUMERA o PASS;
31. preserva el tratamiento de offline, replay y backfill;
32. diagnostica el flujo `makos_excel` actual como agregado e insuficiente para el contrato individual;
33. diagnostica `pulso_post_daily_sales_import` como posting legacy que no materializa esta frontera;
34. preserva autorización y auditoría server-side;
35. entrega cada responsabilidad posterior a `INT-SALES-002..011` sin adelantarla;
36. asigna la materialización física al paquete E5 PULSO ya cubierto por los requisitos vigentes;
37. genera cero requisitos nuevos de prueba;
38. modifica cero requisitos de prueba;
39. no genera una copia del registro canónico de requisitos;
40. no modifica código, SQL, migraciones, RLS, RPC, Supabase, datos, tipos ni configuración remota;
41. no publica eventos ni aplica efectos empresariales;
42. no ejecuta cutover ni retiro de adaptador;
43. mantiene `INT-SALES-002` exclusivamente reservada.

---

#### 29. Resultado de la tarea

`INT-SALES-001` queda definida documentalmente como la frontera propietaria del **registro durable de venta y líneas en PULSO**.

Resultado consolidado:

```text
FUENTE AUTORIZADA
+
IDENTIDAD ESTABLE
+
VENTA Y LÍNEAS INDIVIDUALES
+
REVISIÓN COHERENTE
+
PROCEDENCIA
+
COMPONENTES COMERCIALES
+
AUDITORÍA
→ REGISTRO DURABLE PULSO
→ ELEGIBLE PARA INT-SALES-002
```

Sin convertir el registro en pago, caja, fiscalidad, inventario, hecho económico o fidelización y sin afirmar que la implementación física ya materializa este contrato.

---

#### 30. Continuidad

ÚLTIMA TAREA APROBADA

`INT-POS-024 — Definir revocación o reducción de credenciales cuando PULSO asuma la fuente`

TAREA ACTUAL APROBADA

`INT-SALES-001 — Definir contrato para que PULSO registre la venta`

SIGUIENTE TAREA RESERVADA

`INT-SALES-002 — Definir emisión en PULSO del mismo contrato canónico utilizado durante la transición`


### ✅ INT-SALES-002 — Definir emisión en PULSO del mismo contrato canónico utilizado durante la transición

**Estado:** APROBADA
**Tarea anterior:** `INT-SALES-001 — Definir contrato para que PULSO registre la venta` — APROBADA
**Tarea siguiente:** `INT-SALES-003 — Definir registro de salida de inventario en NEXO` — RESERVADA
**Tipo de tarea:** documental; definición normativa de la emisión permanente desde PULSO de los mismos hechos, definiciones de evento, sobre, proyecciones, identidades, reglas de audiencia, idempotencia, retry, auditoría y fronteras de propiedad utilizados durante la transición desde el POS externo, partiendo exclusivamente de una venta durable registrada conforme a `INT-SALES-001`, sin crear un evento genérico de venta, sin modificar el catálogo transversal, sin añadir consumidoras, sin implementar outbox, colas, workers, tablas, funciones, migraciones, Supabase ni efectos en NEXO, NUMERA o PASS
**Bloque:** X — Integraciones
**Mini-bloque:** Ventas inventario finanzas y fidelización
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/07_VENTAS_INVENTARIO_FINANZAS_Y_FIDELIZACION.md`
**Aplicación propietaria de la venta:** `PULSO`
**Aplicación emisora empresarial:** `PULSO`
**Línea base documental:** `vento-shell@f994b69cb4750ca5793101a849097a257f7a4b44`
**Línea base PULSO observada:** `vento-pulso@71e0184486b5fe11e0a42435baf4024807a80efd`
**Contratos transversales consumidos:** `ENTERPRISE-EVENT-CATALOG-001@1.0.0`, `ENTERPRISE-EVENT-PRODUCER-REGISTRY-001@1.0.0`, `ENTERPRISE-EVENT-CONSUMER-REGISTRY-001@1.0.0`, `EVENT-ENVELOPE-001`, `ENTERPRISE-EVENT-IDEMPOTENCY-REGISTRY-001@1.0.0` y `ENTERPRISE-EVENT-RETRY-POLICY-001@1.0.0`
**Implementación física autorizada:** ninguna
**Cambios de código, DDL, DML, migraciones, Supabase, RLS, RPC, Edge Functions, secretos, credenciales, endpoints, colas, workers, datos o configuración remota:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma permanente cómo PULSO emite los hechos empresariales derivados de una venta que ya existe durablemente bajo el contrato aprobado en `INT-SALES-001`, reutilizando sin bifurcación el mismo modelo canónico que permitió durante `INT-POS-015` convertir una venta proveniente del POS externo en un evento empresarial interno.

La tarea elimina una posible ambigüedad de la transición:

```text
DURANTE LA TRANSICIÓN
MAKOS COMO SOURCE_SYSTEM
        ↓
PULSO RECONOCE / REGISTRA EL HECHO
        ↓
PULSO EMITE EVENTO CANÓNICO
```

```text
DESPUÉS DEL CORTE DEL ALCANCE
PULSO COMO SOURCE_SYSTEM
        ↓
PULSO REGISTRA SU PROPIO HECHO
        ↓
PULSO EMITE EL MISMO CONTRATO CANÓNICO
```

La sustitución de la fuente externa no crea un segundo lenguaje de eventos, no cambia la productora empresarial y no obliga a NEXO, NUMERA, PASS ni a otra consumidora a conocer el mecanismo técnico por el cual la venta llegó a PULSO.

Regla cardinal:

```text
CAMBIA LA PROCEDENCIA DEL HECHO CUANDO CAMBIA LA FUENTE

NO CAMBIA

LA SEMÁNTICA DE VENTA
+ LA DEFINICIÓN DE EVENTO
+ EL SOBRE
+ LA IDENTIDAD DE EMISIÓN
+ LA AUDIENCIA
+ LA FRONTERA DE EFECTOS
```

---

#### 2. Resultado sustantivo

`INT-SALES-002` deja materializada la definición documental completa de la emisión permanente de ventas desde PULSO mediante las siguientes decisiones:

1. PULSO continúa siendo la única emisora empresarial de las definiciones correspondientes a los procesos que le pertenecen.
2. Una venta durable de `INT-SALES-001` no genera por su mera persistencia un evento genérico nuevo.
3. Toda emisión utiliza una definición normal ya existente de `ENTERPRISE-EVENT-CATALOG-001` o una familia condicional ya aprobada cuando la semántica realmente corresponda.
4. No se crea `SALE_VALIDATED`, `SALE_REGISTERED`, `PULSO_SALE_EMITTED` ni otra definición paralela por conveniencia técnica.
5. La definición se resuelve por `process_id` y por el hecho durable realmente confirmado.
6. Una venta puede participar en varios hitos legítimos de proceso; por tanto, `sale_id` no es una clave universal de evento.
7. La misma venta, la misma revisión empresarial aplicable, el mismo hecho durable y la misma definición producen una sola emisión empresarial recuperable.
8. `event_id` permanece estable en retry, redelivery y replay de la misma emisión.
9. `EVENT_EMISSION`, `CONSUMER_INBOX` y `CONSUMER_EFFECT` permanecen alcances diferentes.
10. La audiencia se deriva exclusivamente de `ENTERPRISE-EVENT-CONSUMER-REGISTRY-001`.
11. No se añade ni elimina ninguna consumidora desde esta tarea.
12. La proyección de venta reutiliza el contrato de venta y línea de `INT-SALES-001`; no se crea un segundo DTO empresarial incompatible.
13. El sobre de integración reutiliza `EVENT-ENVELOPE-001`.
14. Una venta histórica originada en Makos conserva su procedencia Makos aunque PULSO sea la emisora interna.
15. Una venta nueva originada en PULSO después del corte aplicable conserva procedencia PULSO.
16. La procedencia no modifica la identidad semántica de la definición de evento.
17. El adaptador externo no es requisito para emitir una venta nativa de PULSO.
18. El retiro posterior del adaptador no modifica eventos históricos ni contratos de consumidoras.
19. Publicación, entrega, claim y efecto permanecen separados.
20. NEXO, NUMERA y PASS confirman sus propios efectos en tareas posteriores.
21. Un fallo downstream no borra ni recrea la venta ni su emisión.
22. Una línea en cuarentena no desaparece de la venta y no adquiere efecto físico por estar presente en una emisión.
23. Una corrección de mapping no constituye por sí sola un nuevo hecho empresarial.
24. Anulaciones, devoluciones, reembolsos y correcciones conservan hechos y emisiones separados del evento normal original.
25. Replay y backfill preservan identidad y procedencia y no habilitan automáticamente efectos sensibles.
26. La arquitectura física posterior deberá enlazar de forma atómica o equivalentemente durable el hecho propietario con su registro de emisión recuperable.
27. No se selecciona en esta tarea una tecnología de outbox, broker, cola, worker, trigger, RPC o scheduler.
28. Se crean cero definiciones normales de evento.
29. Se modifican cero definiciones normales de evento.
30. Se crean cero relaciones productora-consumidora.
31. Se modifican cero relaciones productora-consumidora.
32. Se crean cero requisitos de prueba.
33. Se modifican cero requisitos de prueba.
34. Se crean cero objetos físicos.
35. Se modifican cero objetos físicos.

---

#### 3. Entradas canónicas preservadas

La tarea consume sin reabrir:

- `INT-SALES-001`, que define la venta durable y sus líneas como hecho propietario de PULSO;
- `INT-POS-015`, que define la emisión empresarial durante la transición y establece que una venta validada no crea una definición de evento nueva;
- `INT-POS-023`, que separa la fuente por sede, terminal y fecha efectiva de corte;
- `INT-POS-024`, que separa el lifecycle de credencial externa del lifecycle del hecho empresarial y del adaptador;
- `INT-APP-001`, como catálogo único de definiciones normales y sobre común;
- `INT-APP-002`, como registro único de emisoras empresariales;
- `INT-APP-003`, como registro único de consumidoras, finalidad y perfil de proyección;
- `INT-APP-004`, como contrato de idempotencia entre solicitud, comando, emisión, inbox, efecto y replay;
- `INT-APP-005`, como política de retry y tratamiento de resultado desconocido;
- `INT-APP-006`, para compensaciones y reversibilidad;
- `INT-APP-007`, para auditoría transversal;
- `INT-APP-008`, para estados pendientes y sincronización;
- `INT-APP-009`, para error parcial, aislamiento e intervención;
- `INT-APP-010`, para propiedad y prohibición de escrituras cruzadas sin contrato;
- la cobertura vigente del registro canónico de requisitos de prueba para PULSO e integraciones.

La tarea no redefine identidad de proceso, identidad de venta, definición de evento, productora, consumidora, sensibilidad, finalidad, perfil de proyección, vocabulario idempotente ni política de retry.

---

#### 4. Significado exacto de “el mismo contrato canónico”

La expresión del título se cierra mediante la siguiente equivalencia:

| Dimensión               | Durante transición POS externo → PULSO          | Emisión permanente PULSO                  | Regla                                    |
| ----------------------- | ----------------------------------------------- | ----------------------------------------- | ---------------------------------------- |
| venta y líneas          | contrato canónico reconocido por PULSO          | contrato durable de `INT-SALES-001`       | misma semántica empresarial              |
| fuente                  | POS externo cuando sea la autoridad del alcance | PULSO cuando sea la autoridad del alcance | cambia solo cuando cambia la fuente real |
| productora interna      | PULSO                                           | PULSO                                     | no cambia                                |
| catálogo                | `ENTERPRISE-EVENT-CATALOG-001`                  | `ENTERPRISE-EVENT-CATALOG-001`            | no se bifurca                            |
| definición              | `VPROC-*.EVT-*` real del hecho                  | la misma familia normal aplicable         | no se crea alias por origen              |
| sobre                   | `EVENT-ENVELOPE-001`                            | `EVENT-ENVELOPE-001`                      | misma estructura transversal             |
| idempotencia de emisión | `EVENT_EMISSION`                                | `EVENT_EMISSION`                          | misma semántica                          |
| identidad               | `event_id` estable                              | `event_id` estable                        | retry no regenera identidad              |
| consumidoras            | registro transversal                            | registro transversal                      | no existe lista local                    |
| proyección              | perfil definido por consumidora                 | mismo perfil                              | finalidad gobierna campos                |
| retry                   | política transversal                            | misma política                            | no existe perfil local PULSO             |
| auditoría               | plano transversal                               | mismo plano                               | procedencia cambia, trazabilidad no      |
| efectos                 | fronteras propietarias                          | fronteras propietarias                    | no se fusionan con emisión               |

Por tanto, “mismo contrato” no significa copiar la evidencia Makos a una venta nativa de PULSO. Significa preservar identidad semántica, envelope, gobierno de emisión, audience, idempotencia y fronteras mientras la procedencia refleja la fuente verdadera.

---

#### 5. Frontera previa obligatoria: venta durable

La emisión permanente solo puede partir de una venta que ya cumpla `INT-SALES-001`.

Secuencia obligatoria:

```text
INTENCIÓN / PROCESO COMERCIAL PULSO
        ↓
ACCIONES PROPIETARIAS AUTORIZADAS
        ↓
HECHO DE VENTA Y LÍNEAS DURABLES
        ↓
IDENTIDAD + REVISIÓN + PROCEDENCIA + CONTRATO
        ↓
RESOLUCIÓN DE PROCESO E HITO
        ↓
EMISIÓN CANÓNICA
```

Queda prohibida la secuencia:

```text
EVENTO PRIMERO
        ↓
CREAR DESPUÉS UNA VENTA PARA JUSTIFICARLO
```

También queda prohibido usar como sustituto de la venta durable:

- una fila agregada de venta diaria;
- un batch validado;
- un estado visual de interfaz;
- un payment attempt;
- un documento fiscal;
- un movimiento de inventario;
- una entrada de puntos;
- un hash de archivo;
- un ACK técnico;
- un mensaje recibido desde un tercero.

---

#### 6. La persistencia de una venta no inventa un evento genérico

La venta durable es una fuente propietaria; el evento describe un hecho durable definido por el proceso.

Por tanto:

```text
SALE ROW INSERTED
≠
NUEVO EVENT_TYPE GLOBAL
```

La emisión existe únicamente cuando el hecho confirmado corresponde a una definición ya aprobada.

Si una persistencia representa un estado intermedio que no corresponde a una definición normal del catálogo, esa persistencia no obtiene un evento nuevo solo para facilitar integraciones.

Cuando una venta confirma un hito ya aprobado, PULSO utiliza exactamente esa definición.

---

#### 7. Cobertura de productora PULSO preservada

El registro transversal vigente asigna a PULSO **12 procesos** y **68 definiciones normales**.

La cobertura preservada es:

| Proceso      | Definiciones                                | Cantidad | Productora |
| ------------ | ------------------------------------------- | -------: | ---------- |
| `VPROC-0017` | `VPROC-0017.EVT-001` a `VPROC-0017.EVT-004` |        4 | `pulso`    |
| `VPROC-0038` | `VPROC-0038.EVT-001` a `VPROC-0038.EVT-005` |        5 | `pulso`    |
| `VPROC-0039` | `VPROC-0039.EVT-001` a `VPROC-0039.EVT-005` |        5 | `pulso`    |
| `VPROC-0040` | `VPROC-0040.EVT-001` a `VPROC-0040.EVT-006` |        6 | `pulso`    |
| `VPROC-0041` | `VPROC-0041.EVT-001` a `VPROC-0041.EVT-006` |        6 | `pulso`    |
| `VPROC-0042` | `VPROC-0042.EVT-001` a `VPROC-0042.EVT-006` |        6 | `pulso`    |
| `VPROC-0043` | `VPROC-0043.EVT-001` a `VPROC-0043.EVT-006` |        6 | `pulso`    |
| `VPROC-0044` | `VPROC-0044.EVT-001` a `VPROC-0044.EVT-006` |        6 | `pulso`    |
| `VPROC-0046` | `VPROC-0046.EVT-001` a `VPROC-0046.EVT-006` |        6 | `pulso`    |
| `VPROC-0047` | `VPROC-0047.EVT-001` a `VPROC-0047.EVT-006` |        6 | `pulso`    |
| `VPROC-0050` | `VPROC-0050.EVT-001` a `VPROC-0050.EVT-006` |        6 | `pulso`    |
| `VPROC-0068` | `VPROC-0068.EVT-001` a `VPROC-0068.EVT-006` |        6 | `pulso`    |

Reconciliación:

```text
4 + 5 + 5 + (9 × 6) = 68
```

Esta tabla demuestra la cobertura de propiedad, no afirma que las 68 definiciones sean eventos de venta ni que cada venta deba producirlas todas.

La regla de aplicabilidad permanece:

```text
VENTA / HECHO ACTUAL
        ↓
PROCESO REAL
        ↓
HITO REAL
        ↓
UNA DEFINICIÓN EXISTENTE COMPATIBLE
```

---

#### 8. Resolución obligatoria de proceso

PULSO no podrá seleccionar un proceso por conveniencia técnica, por ruta de interfaz ni por fuente de origen.

Para cada emisión deberá existir evidencia suficiente para demostrar el `process_id` real.

Reglas:

1. una venta de mesa no se clasifica como mostrador por ausencia de un campo;
2. una venta de mostrador no se clasifica como pedido externo porque tenga una referencia digital;
3. una venta originada históricamente en Makos no se clasifica automáticamente en el proceso de canal externo;
4. una venta nativa de PULSO tampoco obtiene un proceso genérico por ser creada dentro de PULSO;
5. el proceso deriva de la realidad empresarial y del contrato funcional vigente;
6. no poder resolver el proceso bloquea la emisión que dependa de esa clasificación;
7. una decisión de proceso incompatible se trata como conflicto o conciliación, no como fallback.

---

#### 9. Resolución obligatoria de hito y definición

Resuelto el proceso, debe demostrarse qué hecho durable ocurrió.

La secuencia es:

```text
process_id
+
HECHO DURABLE CONFIRMADO
+
ESTADO / RESULTADO APLICABLE
        ↓
event_definition_id EXISTENTE
        ↓
event_type VERSIONADO EXISTENTE
```

Reglas:

1. no se emite un hito de cierre si la venta solo acredita una etapa previa;
2. un pago asociado no convierte por sí solo la venta en cierre de caja;
3. un documento fiscal no sustituye el hecho comercial;
4. un movimiento de inventario no sustituye la definición de venta;
5. una entrega al cliente no se infiere desde venta registrada;
6. una revisión técnica sin nuevo hecho durable no produce una definición adicional;
7. un cambio de mapping no produce un hito empresarial nuevo;
8. una reconciliación puede detectar la ausencia de emisión, pero no inventar el hecho necesario para emitirla.

---

#### 10. Puerta mínima de emisión permanente

Antes de persistir una emisión deberán cumplirse simultáneamente las puertas aplicables:

| Puerta       | Condición                                                                         |
| ------------ | --------------------------------------------------------------------------------- |
| venta        | existe venta durable bajo `INT-SALES-001`                                         |
| línea        | las líneas canónicas pertenecen a la venta y conservan identidad estable          |
| fuente       | la procedencia corresponde a la fuente autorizada del alcance                     |
| corte        | el origen no contradice la frontera de sede, terminal y fecha efectiva ya vigente |
| revisión     | la revisión empresarial aplicable está resuelta y no es stale                     |
| contrato     | versión de venta y línea compatible e identificable                               |
| proceso      | `process_id` real resuelto                                                        |
| hito         | hecho durable realmente confirmado                                                |
| definición   | `event_definition_id` existente y compatible                                      |
| productora   | la propietaria de la definición es `pulso`                                        |
| idempotencia | no existe conflicto de reutilización ni outcome incierto sin resolver             |
| agregado     | identidad y versión propietarias coherentes                                       |
| contexto     | sede y dimensiones obligatorias para el hecho están resueltas                     |
| procedencia  | origen, correlación y evidencia son reconstruibles                                |
| sensibilidad | proyección y acceso no rebajan la clase aprobada                                  |
| audiencia    | consumidoras derivadas del registro transversal                                   |

Una puerta falsa impide declarar la emisión como aplicada.

---

#### 11. Separación entre fuente y productora

Se preservan dos conceptos independientes:

| Dimensión                                 | Regla                                                                        |
| ----------------------------------------- | ---------------------------------------------------------------------------- |
| `source_system` o procedencia equivalente | describe dónde se originó realmente el hecho de venta                        |
| `producer_application`                    | identifica a la aplicación propietaria que confirma y emite el hecho interno |

Durante convivencia controlada pueden coexistir:

```text
source_system = MAKOS
producer_application = PULSO
```

Para ventas nuevas nativas de PULSO dentro de un alcance ya transferido:

```text
source_system = PULSO
producer_application = PULSO
```

El cambio del primer valor no cambia el segundo.

El source externo no se oculta para hacer parecer nativa una venta histórica y la existencia de PULSO como productora no autoriza reoriginar un hecho pre-corte.

---

#### 12. Sobre canónico permanente

Toda emisión reutiliza `EVENT-ENVELOPE-001`.

Cuando aplique, deberá conservar:

- `event_id`;
- `event_definition_id`;
- `event_type`;
- `event_version`;
- `process_id`;
- `process_instance_id`;
- `producer_application`;
- `aggregate_type`;
- `aggregate_id`;
- `aggregate_version`;
- `occurred_at`;
- `recorded_at`;
- `timezone`;
- `principal_id`;
- `effective_actor_id`;
- `actor_type`;
- `site_id`;
- `area_id` cuando aplique;
- `shift_id` cuando aplique;
- `device_id` cuando aplique;
- `previous_state` cuando aplique;
- `current_state` cuando aplique;
- `correlation_id`;
- `causation_id` cuando aplique;
- `request_id` cuando exista una solicitud real;
- `idempotency_key`;
- `source_command_id` cuando exista un comando propietario real;
- `result_reference`;
- `output_references[]`;
- `evidence_references[]`;
- `audit_reference`;
- `reason_code` cuando aplique;
- `sensitivity_class`;
- `access_scope`;
- `retention_class`;
- `schema_version`;
- `trace_context`.

Los campos condicionales no se rellenan con identificadores sintéticos solo para completar una forma.

---

#### 13. Proyección empresarial de venta y líneas

El evento no transporta una segunda versión de la venta.

La proyección se deriva del contrato de `INT-SALES-001` y se minimiza según finalidad.

Puede requerir, según definición y consumidora:

- identidad canónica de venta;
- fuente real y referencias de origen;
- revisión de la venta;
- estado comercial aplicable;
- momento empresarial;
- sede;
- terminal o caja cuando sean materialmente pertinentes;
- cliente cuando la finalidad lo permita y sea necesario;
- referencias de pedido cuando exista relación real;
- moneda y componentes monetarios necesarios;
- referencias de pago cuando sean necesarias y estén autorizadas;
- referencias fiscales cuando sean necesarias y estén autorizadas;
- identidades canónicas de línea;
- referencias externas de línea cuando exista origen externo;
- producto y presentación resueltos cuando correspondan;
- cantidad y unidad;
- componentes comerciales de línea;
- resultado de mapping cuando sea relevante;
- estado de cuarentena cuando sea relevante;
- correlación;
- referencias de procedencia y evidencia.

No se copia el payload bruto completo como parte ordinaria de cada proyección.

---

#### 14. Perfil de proyección y minimización

El contenido recibido por cada consumidora se determina mediante:

```text
event_definition_id
+
consumer_application
+
consumer_relation
+
consumer_purpose_code
+
projection_profile
+
sensitivity_class
+
field_allowlist_ref
```

Consecuencias:

1. la emisión no contiene una superproyección universal para todas las aplicaciones;
2. NEXO no recibe información financiera o personal que no necesite para su finalidad;
3. NUMERA no obtiene propiedad sobre la venta por recibir una proyección económica;
4. PASS no recibe datos ajenos a identidad, fidelización y finalidad autorizada;
5. una relación condicional sin condición demostrada falla cerrada;
6. una aplicación no declarada no se convierte en consumidora porque exista técnicamente un topic o tabla accesible;
7. sensibilidad y autorización se revalidan en la frontera consumidora.

---

#### 15. Identidad de emisión

El alcance idempotente permanece:

```text
EVENT_EMISSION
```

La identidad permanece:

```text
event_id
```

Reglas:

1. `event_id` identifica una emisión empresarial concreta;
2. no se reutiliza para otro hecho;
3. se conserva en redelivery;
4. se conserva en retry;
5. se conserva en replay del mismo evento;
6. una respuesta perdida no crea otro `event_id`;
7. cambiar de publicador técnico no crea otro `event_id`;
8. retirar el adaptador externo no crea otro `event_id`;
9. cambiar la procedencia en ventas futuras no modifica eventos históricos;
10. `sale_id` no reemplaza `event_id`;
11. `process_instance_id` no reemplaza `event_id`;
12. `correlation_id` no reemplaza `event_id`;
13. `aggregate_id` no reemplaza `event_id`;
14. `event_definition_id` no reemplaza `event_id`.

---

#### 16. Equivalencia de una emisión

La equivalencia lógica se fija así:

```text
MISMA VENTA CANÓNICA
+
MISMA REVISIÓN EMPRESARIAL APLICABLE
+
MISMO HECHO DURABLE
+
MISMA DEFINICIÓN CANÓNICA
        ↓
UNA SOLA EMISIÓN EMPRESARIAL
        ↓
UN EVENT_ID RECUPERABLE
```

Si dos ejecuciones concurrentes intentan materializar esa misma emisión, solo una puede ser el primer ganador empresarial.

La otra deberá recuperar el resultado previo o quedar en un estado recuperable sin crear otra emisión.

---

#### 17. Huella lógica de emisión

La clave de emisión y la huella cumplen funciones distintas.

La huella versionada debe representar los elementos materiales del hecho emitido, incluyendo según corresponda:

- definición y versión contractual;
- proceso;
- agregado y versión;
- venta y revisión;
- estado o resultado empresarial material;
- contexto que cambie el significado del hecho;
- referencias empresariales que cambien el resultado pretendido.

Debe excluir datos volátiles de transporte como:

- attempt ID;
- contador de retry;
- backoff;
- trace técnico;
- heartbeat;
- timestamp creado por cada intento;
- delivery ID;
- token o firma rotatoria;
- orden irrelevante de propiedades.

Misma identidad y huella compatible recuperan el resultado previo.

Misma identidad y huella incompatible producen conflicto sin efecto nuevo.

---

#### 18. Atomicidad entre venta, hecho y emisión

La implementación posterior deberá garantizar una frontera durable en la que queden relacionados:

- venta propietaria;
- revisión aplicable;
- hecho durable;
- definición resuelta;
- idempotency key;
- huella lógica;
- `event_id`;
- resultado recuperable;
- registro de publicación pendiente o mecanismo equivalente.

Invariantes:

```text
EVENTO EMPRESARIAL
SIN HECHO PROPIETARIO CONFIRMADO
=
PROHIBIDO
```

```text
HECHO QUE EXIGE EMISIÓN
SIN REGISTRO RECUPERABLE DE ESA EMISIÓN
=
ESTADO INACEPTABLE A RESOLVER POR LA FRONTERA PROPIETARIA
```

Esta tarea no selecciona la técnica física para lograrlo.

---

#### 19. Publicación, entrega y efecto son resultados diferentes

Se conserva estrictamente:

```text
HECHO PERSISTIDO
≠
EVENTO PERSISTIDO
≠
PUBLICACIÓN CONFIRMADA
≠
ENTREGA A CONSUMIDORA
≠
CLAIM DE CONSUMIDORA
≠
EFECTO DE CONSUMIDORA
```

Por tanto:

- PULSO puede tener una venta durable y una publicación temporalmente pendiente;
- una publicación confirmada no demuestra efecto NEXO;
- una entrega a NUMERA no demuestra efecto económico aplicado;
- una entrega a PASS no demuestra puntos aplicados;
- el éxito de NEXO no confirma NUMERA;
- el éxito de NUMERA no confirma PASS;
- el fallo de una consumidora no invalida el hecho de venta;
- una consumidora no recrea el evento fuente para corregir su propio fallo.

---

#### 20. Audiencia permanente

La audiencia se obtiene exclusivamente de `ENTERPRISE-EVENT-CONSUMER-REGISTRY-001`.

La selección considera:

- `event_definition_id`;
- `process_id`;
- relación directa o condicional;
- condición empresarial;
- finalidad;
- perfil de proyección;
- sensibilidad;
- versión;
- estado documental de la relación.

No existe una lista de suscriptores propia de `INT-SALES-002`.

La mención de NEXO, NUMERA y PASS en este mini-bloque describe efectos que serán definidos en `INT-SALES-003` a `INT-SALES-006`; no autoriza a hardcodearlos como audiencia de todas las definiciones PULSO.

---

#### 21. Consumidoras directas y condicionales

Toda relación consumidora conserva su semántica transversal:

| Relación           | Regla                                                                                  |
| ------------------ | -------------------------------------------------------------------------------------- |
| `DIRECT`           | entrega el contrato mínimo cuando la ejecución del proceso y el evento sean aplicables |
| `CONDITIONAL`      | solo se activa cuando la condición empresarial aprobada se cumple                      |
| `DEFINED_DEFERRED` | no se convierte en entrega activa por esta tarea                                       |

Una condición desconocida o ambigua no se presume verdadera.

La emisora no puede ampliar audiencia para resolver una falla downstream.

---

#### 22. Idempotencia de inbox y efecto

Después de la emisión, cada consumidora opera de manera independiente.

```text
CONSUMER_INBOX
=
consumer_application + event_id
```

Cuando exista mutación propia:

```text
CONSUMER_EFFECT
=
consumer_application + event_id + effect_code
```

Reglas:

1. redelivery no crea un segundo claim efectivo del mismo evento para la misma consumidora;
2. una consumidora puede tener más de un efecto legítimo únicamente con `effect_code` distintos y semánticamente aprobados;
3. la productora no utiliza la clave de efecto de la consumidora;
4. las consumidoras no comparten una clave universal;
5. un duplicate reconocido devuelve el resultado previo o el no-op autorizado;
6. el retry de una consumidora no recrea el evento de PULSO.

---

#### 23. Retry permanente de emisión

`EVENT_EMISSION` conserva la política transversal.

La selección ordinaria se rige por `ENTERPRISE-EVENT-RETRY-POLICY-001` y no por una configuración local ad hoc.

Reglas:

1. el retry conserva `event_id` e idempotency key;
2. el presupuesto no se reinicia por restart;
3. un timeout posterior a posible persistencia exige recuperar el resultado antes de otro intento de materialización;
4. un resultado recuperado termina el retry sin crear otro evento;
5. una incompatibilidad contractual no se trata como error transitorio;
6. una pérdida de autorización no se resuelve repitiendo el evento con otra identidad;
7. agotamiento no implica venta fallida ni efecto downstream fallido;
8. agotamiento conduce al destino transversal aplicable con evidencia y propietario.

---

#### 24. Resultado desconocido

Ante una respuesta perdida o caída después de una posible persistencia:

```text
RESULTADO TÉCNICO DESCONOCIDO
        ↓
CONSULTAR IDENTIDAD DE EMISIÓN / RESULTADO DURABLE
        ├── EVENTO EXISTE → RECUPERAR MISMO EVENT_ID
        ├── NO EXISTE DEMOSTRADO → MATERIALIZAR PRIMERA EMISIÓN
        └── NO PUEDE DETERMINARSE → RECONCILIATION_REQUIRED
```

Queda prohibido interpretar timeout como evidencia de ausencia de evento.

---

#### 25. Orden, revisiones y eventos tardíos

El orden de llegada no gobierna la historia empresarial.

Reglas:

1. `recorded_at` no sustituye `occurred_at`;
2. una versión tardía no sobrescribe una revisión superior;
3. `received_at` de una integración histórica no es versión de venta;
4. `aggregate_version` conserva la semántica propietaria aplicable;
5. una versión inferior puede terminar stale o no-op según el contrato;
6. una versión superior con dependencia ausente permanece diferida o conciliable;
7. no existe orden global entre todos los eventos VENTO;
8. el orden aplicable se mantiene por agregado y versión.

---

#### 26. Revisiones de venta

Una venta puede tener múltiples revisiones sin tener múltiples identidades de venta.

Una revisión solo produce una nueva emisión cuando demuestra un hecho durable distinto que corresponde a una definición aprobada.

No producen por sí solas una nueva emisión:

- refresh de pantalla;
- nuevo intento de entrega;
- cambio de mapping;
- corrección de metadata técnica;
- recomputación de una proyección sin nuevo hecho;
- cambio de transportista técnico;
- retiro del adaptador Makos;
- actualización del hash de una representación técnica sin cambio empresarial.

---

#### 27. Convivencia de Makos y PULSO

Mientras exista convivencia autorizada, la emisión debe preservar la regla de fuente única por venta.

Una venta pre-corte originada en Makos:

- conserva su fuente Makos;
- puede ser reconocida, registrada y emitida internamente por PULSO;
- conserva su identidad histórica;
- no se clona como venta PULSO para permitir emisión permanente.

Una venta post-corte originada en PULSO:

- conserva su fuente PULSO;
- no debe recibir una identidad Makos ficticia;
- no depende del adaptador externo para emitirse;
- utiliza el mismo catálogo, sobre y gobierno de audiencia.

La frontera concreta de convivencia y corte continúa bajo las decisiones aprobadas de `INT-POS-023` y se especializa después en `INT-SALES-008` a `INT-SALES-010`.

---

#### 28. Independencia del adaptador externo

La emisión permanente de una venta nativa de PULSO no depende de:

- API Makos;
- archivo Makos;
- webhook Makos;
- polling Makos;
- credencial Makos;
- mapping de identificadores Makos cuando la venta no tiene ese origen;
- staging de recepción externa;
- lifecycle de la credencial externa.

Sí conserva la misma frontera conceptual:

```text
HECHO FUENTE
        ↓
PULSO CONFIRMA SU VERDAD EMPRESARIAL
        ↓
PULSO EMITE
        ↓
CONSUMIDORAS ACTÚAN EN SUS PROPIOS DOMINIOS
```

El retiro futuro del adaptador externo puede eliminar una ruta de adquisición sin modificar el contrato de eventos.

---

#### 29. Mapping y cuarentena

Para ventas históricas provenientes de una fuente externa se conserva el resultado de mapping y cuarentena ya asociado a la venta o línea.

Para ventas nativas de PULSO:

- no se inventa un mapping externo inexistente;
- la identidad de producto canónica proviene del proceso propietario aplicable;
- cualquier restricción real de línea permanece explícita;
- una ausencia de producto suficiente para un efecto físico no se convierte en `no_inventory` por default.

La emisión conserva la existencia de líneas problemáticas cuando forman parte de la venta.

Una línea bloqueada no adquiere inventario, puntos ni otro efecto únicamente porque la venta haya sido emitida.

---

#### 30. Anulaciones, devoluciones, reembolsos y correcciones

El evento normal original permanece inmutable.

Reglas:

1. una anulación no modifica retroactivamente el payload del evento normal;
2. una devolución conserva relación con la venta y línea originales;
3. un reembolso conserva relación con pago o referencia financiera aplicable;
4. una corrección conserva antes, después, causa y autoridad cuando el contrato lo exija;
5. las familias condicionales aplicables mantienen la productora del proceso;
6. las compensaciones downstream pertenecen a sus propietarias;
7. repetir el mismo reverso no produce dos efectos;
8. dos reversos legítimos diferentes no se colapsan por compartir venta;
9. la emisión normal no se vuelve a publicar con otro contenido para representar el reverso.

---

#### 31. Replay

El replay del mismo evento:

- conserva `event_id`;
- conserva productora histórica;
- conserva `occurred_at`;
- conserva definición y versión;
- conserva audiencia histórica salvo migración explícita aprobada;
- crea intentos de entrega, no una nueva emisión empresarial;
- recupera resultados idempotentes de consumidoras cuando corresponda;
- no activa consumidoras nuevas automáticamente.

El retiro de Makos no cambia la productora histórica ni vuelve nativos los eventos que provinieron de ventas Makos.

---

#### 32. Backfill

Un backfill autorizado debe diferenciarse de replay.

Debe conservar:

- fuente histórica;
- ventana;
- lote o referencia determinista;
- correlación;
- condición de backfill;
- identidad individual del hecho cuando exista;
- reglas de no duplicación;
- reconciliación contra lo ya materializado.

No puede disparar por defecto:

- movimiento de inventario;
- obligación económica;
- puntos;
- reembolso;
- documento;
- impresión;
- mensaje;
- otra acción sensible.

Cada efecto requiere su propia autorización y frontera idempotente.

---

#### 33. Auditoría mínima de emisión permanente

Cada emisión deberá poder reconstruir lógicamente:

- venta canónica;
- líneas relevantes;
- fuente real de la venta;
- revisión;
- proceso;
- hecho durable;
- definición resuelta;
- fundamento de la resolución;
- productora;
- `event_id`;
- agregado y versión;
- momento empresarial;
- momento de registro;
- idempotency key;
- huella lógica o referencia segura;
- resultado de emisión;
- correlación;
- causalidad cuando exista;
- actor o principal aplicable;
- evidencia referenciada;
- sensibilidad;
- audiencia calculada;
- intentos de publicación;
- resultados de consumidoras mediante referencias independientes;
- conflicto, retry, stale, parcialidad o conciliación cuando aplique.

La auditoría no copia secretos ni convierte logs en fuente empresarial.

---

#### 34. Autorización y sensibilidad

La existencia de una venta y un evento no concede por sí sola acceso a su detalle.

Reglas:

1. la productora confirma el hecho bajo autoridad vigente;
2. la consumidora reautoriza su lectura o efecto;
3. la proyección aplica finalidad y minimización;
4. un retry no reutiliza una autorización vencida para ejecutar una mutación nueva;
5. recuperar un resultado previo no obliga a exponer detalles que ya no son visibles para el actor actual;
6. datos financieros, personales o técnicos se limitan al perfil autorizado;
7. secretos y credenciales no forman parte del contrato empresarial.

---

#### 35. Diagnóstico de la implementación observada

La línea base `vento-pulso@71e0184486b5fe11e0a42435baf4024807a80efd` conserva un flujo de importación diaria Makos que:

- interpreta un XLSX agregado por artículo;
- calcula un hash del archivo;
- materializa batches y filas agregadas;
- realiza matching por MID, código o nombre;
- usa estados técnicos de importación;
- puede invocar `pulso_post_daily_sales_import` para el posting legacy asociado.

Ese flujo no constituye por sí solo la implementación objetivo de `INT-SALES-002`.

En particular:

```text
BATCH VALIDATED
≠
VENTA INDIVIDUAL DURABLE
≠
EVENT_EMISSION CANÓNICO
```

La revisión del árbol remoto y del flujo de importación no acredita una implementación canónica ya materializada de `EVENT-ENVELOPE-001` y `event_id` para esta ruta de ventas.

Por tanto, el estado material de esta tarea es:

```text
CONTRATO DOCUMENTAL = ESPECIFICADO
IMPLEMENTACIÓN FÍSICA PERMANENTE = PENDIENTE DE SU PAQUETE AUTORIZADO
```

Esto no impide cerrar la definición documental.

---

#### 36. Matriz de invariantes de transición a operación permanente

| Invariante                     | POS externo aún fuente                   | PULSO ya fuente          | Resultado exigido               |
| ------------------------------ | ---------------------------------------- | ------------------------ | ------------------------------- |
| una sola fuente por venta      | sí                                       | sí                       | sin doble origen                |
| PULSO productora interna       | sí                                       | sí                       | propiedad estable               |
| definición existente           | sí                                       | sí                       | catálogo único                  |
| envelope transversal           | sí                                       | sí                       | contrato único                  |
| event_id estable               | sí                                       | sí                       | retry/replay convergentes       |
| sale_id estable                | sí                                       | sí                       | venta no duplicada              |
| línea estable                  | sí                                       | sí                       | líneas no duplicadas            |
| audiencia por registry         | sí                                       | sí                       | sin suscriptores paralelos      |
| inbox por consumidora          | sí                                       | sí                       | redelivery segura               |
| efecto por consumidora         | sí                                       | sí                       | exactly-once lógico por alcance |
| procedencia real               | Makos                                    | PULSO                    | historia preservada             |
| dependencia de adaptador Makos | sí para adquisición externa              | no                       | consumidoras no cambian         |
| credencial Makos               | solo para binding externo cuando aplique | no aplica a venta nativa | no se filtra al contrato        |
| raw external payload           | referencia protegida cuando exista       | no se fabrica            | evidencia acorde a origen       |

---

#### 37. Frontera con `INT-SALES-003` a `INT-SALES-006`

La tarea termina en la emisión empresarial.

| Efecto posterior      | Tarea propietaria | Condición de salida                                                     |
| --------------------- | ----------------- | ----------------------------------------------------------------------- |
| salida de inventario  | `INT-SALES-003`   | NEXO confirma su efecto físico mediante su propia identidad y resultado |
| recepción económica   | `INT-SALES-004`   | NUMERA confirma su hecho mediante frontera económica propia             |
| acumulación de puntos | `INT-SALES-005`   | PASS confirma acumulación únicamente para venta y cliente elegibles     |
| redención de puntos   | `INT-SALES-006`   | PASS confirma redención con identidad, autoridad y resultado propios    |

La emisión de PULSO no preconfirma ninguno de esos resultados.

---

#### 38. Frontera con `INT-SALES-007`

`INT-SALES-002` adopta la idempotencia transversal y fija la identidad de emisión.

`INT-SALES-007` permanece propietaria de especializar el control permanente contra efectos duplicados por reintento para la cadena de ventas.

Condición de salida posterior:

- cada frontera de efecto conserva identidad propia;
- retry de venta o evento no duplica efectos;
- respuesta perdida recupera resultados;
- conflicto de huella bloquea efecto nuevo;
- todas las consumidoras permanecen independientes.

Esta tarea no adelanta esa especialización.

---

#### 39. Frontera con convivencia y corte

| Materia                          | Tarea propietaria | Condición de salida                                                   |
| -------------------------------- | ----------------- | --------------------------------------------------------------------- |
| conciliación de convivencia      | `INT-SALES-008`   | diferencias entre las dos fuentes quedan detectadas y clasificadas    |
| corte por sede, terminal y fecha | `INT-SALES-009`   | el alcance temporal de cada fuente queda materializado sin ambigüedad |
| impedimento de doble emisión     | `INT-SALES-010`   | una misma venta no puede emitirse desde ambas fuentes                 |
| retiro del adaptador             | `INT-SALES-011`   | la ruta externa se retira sin cambiar contratos internos ni historia  |

`INT-SALES-002` preserva esas fronteras y no ejecuta cutover ni retiro.

---

#### 40. Infraestructura física reservada

La definición no escoge implementación física.

Las responsabilidades transversales ya reservadas incluyen:

- tablas, constraints, outbox, inbox, funciones, RLS y migraciones en las tareas de arquitectura y base de datos aplicables;
- broker, topics, colas, workers, jobs y observabilidad en la arquitectura de colas y servicios transversales;
- schemas, tipos, SDK y canonicalización compartida en la fundación compartida;
- implementación, pruebas E2E, piloto, cutover, rollback e hypercare en el paquete autorizado correspondiente.

Ninguna de esas responsabilidades se materializa durante esta tarea documental.

---

#### 41. Bloqueos y pendientes con propietario

| Brecha o pendiente                           | Estado                        | Propietario                       | Condición de salida                                                                                   |
| -------------------------------------------- | ----------------------------- | --------------------------------- | ----------------------------------------------------------------------------------------------------- |
| salida física desde evento de venta          | `FUERA_DE_ALCANCE`            | `INT-SALES-003`                   | receipt NEXO correlacionado y recuperable                                                             |
| recepción económica                          | `FUERA_DE_ALCANCE`            | `INT-SALES-004`                   | resultado NUMERA correlacionado y recuperable                                                         |
| acumulación de puntos                        | `FUERA_DE_ALCANCE`            | `INT-SALES-005`                   | resultado PASS correlacionado y recuperable                                                           |
| redención de puntos                          | `FUERA_DE_ALCANCE`            | `INT-SALES-006`                   | resultado PASS de redención correlacionado y recuperable                                              |
| especialización de no duplicación de efectos | `FUERA_DE_ALCANCE`            | `INT-SALES-007`                   | retries de cada frontera convergen sin efectos dobles                                                 |
| convivencia Makos/PULSO                      | `FUERA_DE_ALCANCE`            | `INT-SALES-008`                   | matriz de conciliación de fuentes completa                                                            |
| corte material por sede, terminal y fecha    | `FUERA_DE_ALCANCE`            | `INT-SALES-009`                   | autoridad de fuente resoluble para todo alcance activo                                                |
| guardia contra doble emisión                 | `FUERA_DE_ALCANCE`            | `INT-SALES-010`                   | una venta no puede adquirir dos emisiones equivalentes por dos fuentes                                |
| retiro técnico del adaptador externo         | `FUERA_DE_ALCANCE`            | `INT-SALES-011`                   | consumidores internos continúan sin dependencia del adaptador                                         |
| materialización física de colas y entrega    | `PENDIENTE_DE_IMPLEMENTACION` | `QUEUE-ARC-001` a `QUEUE-ARC-010` | infraestructura autorizada implementa scheduling, delivery, retry y recuperación conforme a contratos |

No queda un pendiente sustantivo de esta definición sin propietario y condición de salida.

---

#### 42. Prohibiciones explícitas

Queda prohibido:

1. crear una definición normal `SALE_VALIDATED` por comodidad;
2. crear una definición normal `SALE_REGISTERED` solo porque exista una fila durable;
3. crear un event type específico de Makos;
4. crear un event type distinto para venta nativa PULSO si el hecho ya está cubierto por una definición existente;
5. usar `sale_id` como única identidad de todas las emisiones de una venta;
6. regenerar `event_id` por retry;
7. regenerar `event_id` por redelivery;
8. regenerar `event_id` por replay;
9. cambiar `producer_application` por cambiar el publicador técnico;
10. cambiar `producer_application` por retirar Makos;
11. ocultar la procedencia Makos de una venta histórica;
12. fabricar una referencia externa para una venta nativa PULSO;
13. inventar proceso o hito para poder emitir;
14. usar el proceso de canal externo como fallback para cualquier venta;
15. emitir cierre cuando solo existe un estado intermedio;
16. presentar una fila agregada como venta individual;
17. presentar `validated` de un batch como evento empresarial;
18. hardcodear NEXO, NUMERA o PASS como consumidoras universales;
19. fan-out hacia una aplicación no declarada en el registro transversal;
20. enviar una superproyección con todos los campos a todas las consumidoras;
21. incluir secretos o credenciales en la emisión;
22. usar el éxito de publicación como prueba de efecto downstream;
23. usar el éxito de una consumidora como prueba de otra;
24. reemitir el evento normal con contenido distinto para representar un reverso;
25. tratar timeout como ausencia demostrada de evento;
26. tratar agotamiento de retry como venta fallida;
27. borrar la venta porque una emisión o consumidora falle;
28. permitir que una línea bloqueada produzca efecto dependiente de producto;
29. crear otra venta por liberar una cuarentena;
30. disparar efectos sensibles mediante backfill sin autorización explícita;
31. usar logs o auditoría como fuente propietaria del estado de venta;
32. modificar tablas privadas de NEXO, NUMERA o PASS desde PULSO;
33. modificar código durante esta tarea;
34. modificar DDL o DML durante esta tarea;
35. crear o alterar migraciones durante esta tarea;
36. modificar Supabase durante esta tarea;
37. crear endpoints, topics, colas, workers, cron o jobs durante esta tarea;
38. iniciar `INT-SALES-003`.

---

#### 43. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea convierte en regla permanente de PULSO la misma semántica de emisión que ya se encuentra protegida por la cobertura canónica vigente de transición POS externo/PULSO, catálogo y productora única de eventos, audiencia y proyecciones registradas, identidad estable de emisión, inbox y efecto por consumidora, retry con resultado recuperable, auditoría, prohibición de escrituras cruzadas y separación entre venta, publicación y efectos. No crea una definición normal, relación de consumo, capacidad ejecutable, excepción, permiso ni comportamiento verificable adicional fuera de esas obligaciones ya registradas.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

El registro canónico de requisitos permanece sin cambios.

---

#### 44. Cobertura de prueba existente preservada

Se preserva sin modificación, en especial:

- `TREQ-INTEGRATION-003`, para identidad, retry, resultado recuperable y fronteras durables;
- `TREQ-INTEGRATION-006`, para fuente propietaria única y eliminación de fuentes competidoras;
- `TREQ-INTEGRATION-014`, para convergencia de POS externo y PULSO sobre pedido, venta y línea sin doble emisión y con efectos exactamente una vez;
- `TREQ-INTEGRATION-049`, para procedencia y afirmación externa antes del hecho interno cuando exista fuente externa;
- `TREQ-INTEGRATION-054` a `TREQ-INTEGRATION-068`, para catálogo de emisoras y PULSO como emisora de sus procesos;
- `TREQ-INTEGRATION-080` a `TREQ-INTEGRATION-107`, para consumidoras, finalidad, audiencia, sensibilidad y proyecciones;
- `TREQ-INTEGRATION-108` a `TREQ-INTEGRATION-122`, para `EVENT_EMISSION`, `event_id`, inbox, efecto, concurrencia, respuesta perdida y atomicidad;
- `TREQ-INTEGRATION-139` a `TREQ-INTEGRATION-163`, para retry, perfiles, resultado desconocido, claims y observabilidad;
- `TREQ-INTEGRATION-298`, para que un evento describa un hecho confirmado y no una orden para editar otra fuente;
- `TREQ-INTEGRATION-306`, para mantener la frontera del adaptador y las escrituras propietarias;
- `TREQ-PULSO-001`, para el ciclo POS de extremo a extremo;
- `TREQ-PULSO-005`, para separación del ciclo comercial, estados y hechos;
- `TREQ-PULSO-006`, para separación de venta, pago, caja, fiscalidad, anulaciones, devoluciones y cierre.

Ninguna fila cambia de identidad, texto, estado, relación, propietaria, evidencia ni secuencia por `INT-SALES-002`.

---

#### 45. Criterios de aceptación

La tarea queda documentalmente completa cuando se cumplen simultáneamente:

1. conserva `INT-SALES-001` como tarea anterior aprobada;
2. conserva `INT-SALES-003` como única siguiente tarea reservada;
3. exige una venta durable de `INT-SALES-001` antes de cualquier emisión normal aplicable;
4. preserva el catálogo único de eventos;
5. crea cero definiciones normales nuevas;
6. modifica cero definiciones normales;
7. conserva las 12 familias de procesos PULSO y 68 definiciones normales ya asignadas a `pulso`;
8. no presenta las 68 definiciones como eventos de venta por defecto;
9. resuelve `process_id` desde el proceso real;
10. resuelve el hito desde el hecho durable real;
11. prohíbe proceso o evento genérico de fallback;
12. mantiene `pulso` como productora empresarial;
13. separa fuente y productora;
14. conserva procedencia Makos para ventas históricas de ese origen;
15. conserva procedencia PULSO para ventas nativas dentro del alcance autorizado;
16. evita dependencia del adaptador externo para una venta nativa PULSO;
17. reutiliza `EVENT-ENVELOPE-001`;
18. reutiliza la venta y líneas de `INT-SALES-001` como proyección empresarial;
19. aplica finalidad, sensibilidad y minimización por consumidora;
20. deriva audiencia exclusivamente del registro transversal;
21. crea cero relaciones nuevas de consumo;
22. modifica cero relaciones de consumo;
23. mantiene `EVENT_EMISSION` como alcance de emisión;
24. mantiene `event_id` estable en retry, redelivery y replay;
25. separa `event_id` de `sale_id`, proceso, agregado y correlación;
26. define equivalencia de emisión por venta, revisión, hecho y definición;
27. exige huella lógica compatible;
28. exige resultado recuperable ante respuesta perdida;
29. exige atomicidad o durabilidad equivalente entre hecho propietario y registro de emisión;
30. separa evento persistido, publicación, entrega, claim y efecto;
31. mantiene inbox independiente por consumidora;
32. mantiene efecto independiente por consumidora y `effect_code`;
33. no usa éxito downstream para reescribir venta o evento;
34. conserva revisiones sin multiplicar ventas;
35. emite una nueva definición solo cuando existe un nuevo hecho durable real;
36. conserva coexistencia Makos/PULSO sin reinterpretar la fuente;
37. preserva las fronteras de `INT-SALES-008` a `INT-SALES-011`;
38. conserva mapping y cuarentena sin ocultar líneas problemáticas;
39. separa reversos del evento normal;
40. conserva replay y backfill con identidad y procedencia;
41. no habilita efectos sensibles por backfill implícito;
42. conserva auditoría reconstruible y mínima;
43. conserva autorización y sensibilidad en productora y consumidoras;
44. documenta el flujo legacy observado sin elevarlo a implementación canónica;
45. asigna todos los pendientes materiales a propietario y condición de salida;
46. genera cero requisitos nuevos de prueba;
47. modifica cero requisitos de prueba;
48. no genera una copia del registro canónico de requisitos;
49. no modifica código, SQL, migraciones, Supabase, datos, credenciales, endpoints, colas ni configuración remota;
50. no inicia ni desarrolla `INT-SALES-003`.

---

#### 46. Resultado de la tarea

`INT-SALES-002` deja **ESPECIFICADO** el contrato permanente de emisión de ventas desde PULSO.

Resultado consolidado:

- aplicación propietaria de la venta: `PULSO`;
- productora empresarial: `PULSO`;
- procesos PULSO preservados: **12**;
- definiciones normales PULSO preservadas: **68**;
- definiciones normales creadas: **0**;
- definiciones normales modificadas: **0**;
- registros paralelos de consumidoras creados: **0**;
- relaciones productora-consumidora creadas: **0**;
- relaciones productora-consumidora modificadas: **0**;
- alcance idempotente de emisión: `EVENT_EMISSION`;
- identidad de emisión: `event_id`;
- sobre transversal: `EVENT-ENVELOPE-001`;
- contrato empresarial: venta y líneas de `INT-SALES-001`;
- cambios de requisitos de prueba: **0**;
- cambios físicos: **0**.

Invariante final:

```text
VENTA DURABLE PULSO
+
PROCESO REAL
+
HECHO DURABLE REAL
+
DEFINICIÓN CANÓNICA EXISTENTE
+
PULSO COMO PRODUCTORA
+
EVENT_ID ESTABLE
+
ENVELOPE Y PROYECCIÓN AUTORIZADOS
+
AUDIENCIA REGISTRADA
+
RESULTADO RECUPERABLE
=
UNA EMISIÓN EMPRESARIAL CANÓNICA
SIN BIFURCAR EL CONTRATO POR ORIGEN
Y SIN CONFUNDIR EMISIÓN CON EFECTO DOWNSTREAM
```

---

ÚLTIMA TAREA APROBADA

`INT-SALES-001 — Definir contrato para que PULSO registre la venta`

TAREA ACTUAL APROBADA

`INT-SALES-002 — Definir emisión en PULSO del mismo contrato canónico utilizado durante la transición`

SIGUIENTE TAREA RESERVADA

`INT-SALES-003 — Definir registro de salida de inventario en NEXO`


### [ ] INT-SALES-003 — Definir registro de salida de inventario en NEXO
### [ ] INT-SALES-004 — Definir recepción del evento de venta en NUMERA
### [ ] INT-SALES-005 — Definir acumulación de puntos en PASS
### [ ] INT-SALES-006 — Definir procesamiento de redención en PASS
### [ ] INT-SALES-007 — Definir control contra efectos duplicados por reintento
### [ ] INT-SALES-008 — Definir conciliación de convivencia entre POS externo y PULSO
### [ ] INT-SALES-009 — Definir corte por sede, terminal y fecha efectiva
### [ ] INT-SALES-010 — Definir control que impida que ambas fuentes emitan la misma venta
### [ ] INT-SALES-011 — Definir retiro del adaptador externo sin modificar consumidores internos

AURA ↔ PASS / PULSO
