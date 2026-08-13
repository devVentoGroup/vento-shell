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


### ✅ INT-SALES-003 — Definir registro de salida de inventario en NEXO

**Estado:** APROBADA
**Tarea anterior:** `INT-SALES-002 — Definir emisión en PULSO del mismo contrato canónico utilizado durante la transición`
**Tarea siguiente:** `INT-SALES-004 — Definir recepción del evento de venta en NUMERA`
**Tipo de tarea:** documental; definición normativa permanente del efecto físico de inventario que NEXO debe registrar a partir de una venta canónica emitida por PULSO, conservando propiedad de dominio, aplicabilidad por evento y línea, identidad del efecto, progresión `VPROC-0025`, producto, presentación, receta, cantidad, UOM, origen físico, group, legs, partialidad, receipt, idempotencia, resultado desconocido, compensación, replay y conciliación, sin implementar tablas, RPC, funciones, triggers, colas, migraciones, Supabase ni cambios de código
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/07_VENTAS_INVENTARIO_FINANZAS_Y_FIDELIZACION.md`
**Aplicación propietaria de la venta:** `PULSO`
**Aplicación propietaria del inventario:** `NEXO`
**Proceso NEXO reutilizado:** `VPROC-0025 — Retirar, consumir o trasladar existencias conservando unidad, conversión, origen y destino`
**Línea base documental:** `vento-shell@be85d5fb77ab609bbcea51e411e06e2845ae5bc9`
**Línea base PULSO observada:** `vento-pulso@71e0184486b5fe11e0a42435baf4024807a80efd`
**Línea base NEXO observada:** `vento-nexo@142c4d696221e3ce3fda4ed3b62f3d1fe5b58799`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el contrato permanente mediante el cual una venta ya registrada y emitida por PULSO puede producir en NEXO el efecto físico de salida, consumo o traslado que realmente corresponda, sin trasladar a PULSO autoridad sobre stock, ubicaciones, lotes, condición, custodia, movimientos o receipts.

Regla raíz:

```text
VENTA DURABLE PULSO
        ↓
EVENTO EMPRESARIAL PULSO + EVENT_ID ESTABLE
        ↓
AUDIENCIA CANÓNICA CONFIRMA QUE NEXO APLICA
        ↓
INBOX NEXO
        ↓
ELEGIBILIDAD POR LÍNEA
        ↓
IDENTIDAD DE EFECTO NEXO
        ↓
NEXO REVALIDA PRODUCTO + UOM + EXISTENCIA + ORIGEN FÍSICO
        ↓
VPROC-0025
        ↓
GROUP / LEGS / POSTING / RECEIPT
        ↓
RESULTADO DURABLE Y RECUPERABLE
        ↓
CONCILIACIÓN SIN DOBLE STOCK
```

La venta demuestra el hecho comercial. Solo NEXO puede demostrar el hecho físico.

---

#### 2. Resultado sustantivo

`INT-SALES-003` deja definido el contrato permanente de salida de inventario por venta con las siguientes decisiones:

1. NEXO es la única propietaria de stock, movimiento, ubicación, posición, lote, condición, custodia, posting, group, legs y receipt de inventario.
2. PULSO registra la venta y emite el evento empresarial; no escribe la verdad física de NEXO.
3. La existencia de un evento PULSO no implica automáticamente que NEXO sea consumidora; la aplicabilidad se resuelve con el registro canónico de consumidoras.
4. Cuando NEXO sea consumidora aplicable, primero deduplica su inbox por `consumer_application + event_id`.
5. La unidad primaria de elegibilidad física es una línea canónica de venta.
6. Cada línea elegible produce como máximo un efecto físico lógico NEXO para el mismo `event_id`, finalidad y código de efecto.
7. El alcance transversal del efecto es `CONSUMER_EFFECT`.
8. La identidad del efecto utiliza `consumer_application + event_id + effect_code`.
9. El `effect_code` debe distinguir de forma estable la finalidad física y la línea o componente empresarial que corresponda, sin sustituir `sale_id`, `sale_line_id`, `product_id`, movimiento, group, leg ni receipt.
10. Una línea puede generar cero efecto físico únicamente por una disposición empresarial explícita y auditable, nunca por falta de información.
11. NEXO revalida autoritativamente producto físico, cantidad, UOM, conversión, origen, LOC, posición, lote, condición, disponibilidad y custodia.
12. PULSO puede transportar contexto y referencias canónicas, pero no imponer saldo disponible, lote, posición ni fuente física como verdad NEXO.
13. Una línea puede requerir uno o varios componentes físicos y uno o varios legs sin multiplicar la identidad lógica del efecto.
14. Los splits entre varias existencias físicas permanecen subordinados al mismo efecto.
15. Partialidad, bloqueo y remanente se conservan explícitos.
16. Un fragmento ya confirmado no se repite por retry, redelivery, replay o recuperación.
17. Un timeout o respuesta perdida no se interpreta como ausencia del efecto.
18. Una reutilización incompatible de identidad produce conflicto antes de una nueva mutación.
19. Un efecto confirmado se corrige mediante RETURN, ADJUST u otra acción propietaria autorizada; no se edita ni borra el hecho físico original.
20. La procedencia histórica Makos o nativa PULSO no modifica el contrato consumidor de NEXO.
21. El retiro futuro del adaptador externo no modifica la identidad ni el significado de los efectos NEXO ya confirmados.
22. Se crean cero definiciones normales de evento.
23. Se modifican cero definiciones normales de evento.
24. Se crean cero requisitos `TREQ-*`.
25. Se modifican cero requisitos `TREQ-*`.
26. Se crean cero objetos físicos.
27. Se modifican cero objetos físicos.

---

#### 3. Base canónica preservada

Esta tarea consume sin reabrir las decisiones aprobadas en:

- `INT-SALES-001`, para el registro durable de venta y líneas en PULSO;
- `INT-SALES-002`, para la emisión permanente desde PULSO usando el catálogo canónico vigente;
- `INT-POS-016`, para la frontera NEXO demostrada durante la transición y su continuidad posterior;
- `INT-POS-019`, para compensaciones no destructivas;
- `INT-POS-020`, para conciliación entre venta, evento y efectos;
- `INT-POS-023` y `INT-POS-024`, para cambio de fuente sin cambiar consumidoras ni conservar credenciales innecesarias;
- `INT-APP-001` a `INT-APP-010`, para catálogo, productoras, consumidoras, idempotencia, retry, compensación, auditoría, pendientes, error parcial y prohibición de escrituras cruzadas;
- `VPROC-0025`, como proceso propietario de retiro, consumo o traslado de existencias;
- los contratos NEXO ya aprobados para movimientos, groups, legs, receipts, proyecciones, UOM, lotes, posiciones, condition y compensaciones.

Ninguna de estas decisiones cambia de identidad ni de propietaria por esta tarea.

---

#### 4. Propiedad empresarial permanente

| Elemento                                  | Propietaria          | Regla                                                                                         |
| ----------------------------------------- | -------------------- | --------------------------------------------------------------------------------------------- |
| venta y línea canónica                    | `PULSO`              | registra el hecho comercial y su revisión                                                     |
| evento comercial                          | `PULSO`              | describe un hecho durable ya confirmado por PULSO                                             |
| audiencia de la emisión                   | registro transversal | decide si NEXO es consumidora directa o condicional para la definición concreta               |
| inbox de NEXO                             | `NEXO`               | reconoce una sola vez cada `event_id` aplicable a NEXO                                        |
| producto maestro físico                   | `NEXO`               | conserva identidad física y atributos gobernados por inventario                               |
| receta                                    | `FOGO`               | conserva definición y versión; NEXO consume referencias aprobadas sin apropiarse de la receta |
| stock                                     | `NEXO`               | única verdad física de cantidad                                                               |
| LOC, posición, lote, condición y custodia | `NEXO`               | se resuelven en la frontera NEXO                                                              |
| movimiento, group, legs y posting         | `NEXO`               | solo NEXO los confirma                                                                        |
| receipt del efecto físico                 | `NEXO`               | prueba durable del resultado físico                                                           |
| efecto económico                          | `NUMERA`             | permanece separado y se reserva a `INT-SALES-004`                                             |
| fidelización                              | `PASS`               | permanece separada y se reserva a `INT-SALES-005` y `INT-SALES-006`                           |

Regla cardinal:

```text
PULSO AFIRMA LA VENTA
NEXO AFIRMA EL MOVIMIENTO
NUMERA AFIRMA EL HECHO ECONÓMICO
PASS AFIRMA EL LEDGER DE FIDELIZACIÓN
```

Compartir infraestructura no fusiona estas autoridades.

---

#### 5. Aplicabilidad de NEXO como consumidora

`INT-SALES-003` no convierte a NEXO en consumidora universal de todos los eventos PULSO.

Para cada emisión se resolverá:

```text
event_definition_id
+
process_id
+
consumer_application = nexo
+
consumer_relation
+
condition_ref cuando aplique
+
projection_profile
+
finalidad
```

Solo una relación vigente y aplicable habilita el ingreso al inbox NEXO.

Consecuencias:

1. una venta puede existir sin que un evento concreto requiera efecto NEXO;
2. una relación `CONDITIONAL` falla cerrada cuando su condición no puede demostrarse;
3. la ausencia de NEXO en la audiencia de una emisión no se compensa con una escritura directa;
4. la presencia de NEXO en la audiencia tampoco prueba que exista una línea físicamente elegible;
5. PULSO no incluye una lista local de consumidoras para forzar la salida de stock.

---

#### 6. Frontera entre emisión, inbox y efecto

La cadena permanente conserva:

```text
EVENT_EMISSION PULSO
        ↓
DELIVERY
        ↓
CONSUMER_INBOX NEXO
        ↓
DECISIÓN DE ELEGIBILIDAD
        ↓
CONSUMER_EFFECT NEXO
        ↓
TRANSACCIÓN PROPIETARIA NEXO
        ↓
RESULTADO NEXO
```

Por tanto:

- publicación no equivale a movimiento;
- entrega no equivale a movimiento;
- claim no equivale a movimiento;
- recepción en inbox no equivale a movimiento;
- `DUPLICATE_RESULT_RETURNED` puede cerrar correctamente una redelivery sin crear un segundo movimiento;
- solo un resultado propietario NEXO demuestra el efecto físico;
- el éxito o fallo de NUMERA o PASS no cambia el resultado NEXO.

---

#### 7. Unidad de elegibilidad: línea canónica de venta

La decisión física se realiza por línea canónica de venta.

Una línea es candidata únicamente cuando:

1. la venta existe bajo `INT-SALES-001`;
2. `sale_id` está resuelto;
3. `sale_line_id` está resuelto;
4. la revisión aplicable de la venta está determinada;
5. el evento PULSO es válido y conserva `event_id`;
6. NEXO pertenece a la audiencia aplicable de esa emisión;
7. la línea pertenece inequívocamente a la venta indicada;
8. el contexto de sede requerido está resuelto;
9. el producto canónico requerido para el efecto está resuelto;
10. presentación y receta están resueltas o acreditadas como no aplicables;
11. la cantidad comercial y la UOM pueden interpretarse sin ambigüedad;
12. no existe un bloqueo que impida efectos dependientes del producto;
13. no existe evidencia de un efecto físico incompatible ya confirmado;
14. la línea no representa un hecho que deba tratarse como devolución, anulación, compensación o ajuste;
15. la finalidad física aplicable está identificada.

Una venta puede contener simultáneamente líneas elegibles, líneas con no-op físico autorizado y líneas pendientes o bloqueadas. Ninguna se elimina para aparentar completitud.

---

#### 8. Venta nativa PULSO frente a venta de procedencia externa

El contrato permanente distingue procedencia sin crear dos modelos físicos.

##### 8.1. Venta nativa PULSO

Para una venta cuyo `source_system` empresarial sea PULSO:

- no se exige mapping externo por el solo hecho de existir una salida NEXO;
- PULSO entrega las identidades canónicas de producto, presentación o referencia aprobada que realmente formen parte del contrato de la línea;
- NEXO revalida esas referencias contra sus fuentes maestras y condiciones físicas;
- una identidad canónica inexistente, retirada, incompatible o insuficiente bloquea el efecto en vez de activar una heurística.

##### 8.2. Venta histórica o transicional de origen externo

Cuando la venta conserve procedencia externa:

- se preservan `source_system`, identidad externa, versión de mapping y estado de cuarentena aplicables;
- una línea todavía bloqueada por mapping o cuarentena continúa bloqueada para el efecto dependiente de producto;
- liberar una línea no crea otra venta, línea ni emisión empresarial equivalente;
- la misma identidad pendiente se usa para intentar el efecto todavía faltante.

En ambos casos, la transacción física final pertenece a NEXO.

---

#### 9. Bloqueos de producto y cuarentena

Una línea con producto físico no resuelto o con un estado bloqueante aplicable produce:

```text
CERO MUTACIÓN FÍSICA
+
ESTADO PENDIENTE O BLOQUEADO EXPLÍCITO
+
CONCILIACIÓN CUANDO CORRESPONDA
```

Queda prohibido convertir falta de mapping, referencia inválida, receta incierta, UOM incompatible o cuarentena en:

- producto genérico;
- producto parecido;
- primera coincidencia por nombre;
- inventario cero;
- salida sin producto;
- no-op automático;
- ajuste posterior supuesto.

La resolución posterior conserva las identidades originales y no otorga derecho a repetir un fragmento ya confirmado.

---

#### 10. Disposición explícita sin efecto de inventario

Una línea puede producir cero movimiento únicamente cuando una regla empresarial vigente demuestre que la línea no consume, retira ni traslada existencia física.

La disposición deberá conservar como mínimo:

- `sale_id`;
- `sale_line_id`;
- `event_id`;
- finalidad física evaluada;
- fundamento de no aplicación;
- versión de la regla o configuración que sustenta la decisión;
- resultado durable recuperable;
- referencia de auditoría.

Resultado:

```text
NO_APLICA FÍSICAMENTE
→ CERO GROUP CUANTITATIVO
→ CERO LEGS DE INVENTARIO
→ CERO CAMBIO DE STOCK
```

`NO_APLICA` no se utiliza para ocultar un dato faltante ni para cerrar una diferencia de conciliación.

---

#### 11. Inbox NEXO

El primer control consumidor es:

```text
CONSUMER_INBOX
=
nexo + event_id
```

Reglas:

1. la primera recepción aplicable puede crear el reconocimiento durable del inbox;
2. una redelivery exacta recupera ese reconocimiento;
3. una nueva entrega técnica no crea un segundo `event_id`;
4. el inbox no es el efecto físico;
5. el inbox puede conservar resultado pendiente, bloqueado, aplicado, duplicado, conflictivo o reconciliable;
6. una misma emisión puede requerir varios efectos legítimos en NEXO únicamente mediante `effect_code` distintos;
7. el resultado de otro consumidor no completa el inbox NEXO.

---

#### 12. Identidad permanente del efecto NEXO

El alcance es:

```text
CONSUMER_EFFECT
```

La identidad transversal es:

```text
consumer_application + event_id + effect_code
```

Para esta tarea:

```text
consumer_application = nexo
```

El `effect_code` deberá ser estable y suficientemente específico para distinguir el efecto físico aplicable de una línea o componente empresarial dentro del mismo evento.

No se utilizarán como única clave:

- `sale_id`;
- `sale_line_id`;
- `product_id`;
- `site_id`;
- fecha;
- importe;
- cantidad;
- `movement_id`;
- `group_id`;
- `leg_id`;
- `receipt_id`;
- hash del payload;
- correlación;
- nombre del producto.

Estas referencias participan en huella, trazabilidad o resultado, pero no sustituyen la identidad transversal del efecto.

---

#### 13. Huella lógica del efecto

La identidad se acompaña de una huella versionada que representa el contenido empresarial material.

La huella deberá incorporar, cuando aplique:

- identidad de venta y línea;
- revisión de venta;
- definición y versión del evento;
- finalidad física;
- producto canónico;
- presentación;
- receta y versión cuando sea causal del consumo;
- cantidad comercial;
- UOM comercial;
- factor de conversión aplicable;
- cantidad base pretendida;
- sede;
- disposición física esperada;
- referencias de procedencia material;
- versión de contrato.

Deberá excluir metadatos volátiles de transporte como intento, delivery, trace, momento de retry o worker.

```text
MISMA IDENTIDAD + MISMA HUELLA COMPATIBLE
→ RECUPERAR RESULTADO PREVIO

MISMA IDENTIDAD + HUELLA INCOMPATIBLE
→ CONFLICTING_REUSE
→ CERO EFECTO NUEVO
```

---

#### 14. Handoff mínimo de PULSO hacia NEXO

La proyección que habilita la evaluación NEXO deberá permitir correlacionar, según aplicabilidad:

```text
event_id
+ event_definition_id
+ event_version
+ process_id
+ producer_application = pulso
+ aggregate_id / aggregate_version
+ sale_id
+ sale_revision
+ sale_line_id
+ site_id
+ source_system
+ source_sale_reference cuando exista
+ product_id o referencia canónica aplicable
+ presentation_id cuando corresponda
+ recipe_id + recipe_version cuando corresponda
+ commercial_quantity
+ commercial_uom
+ conversion_reference cuando corresponda
+ physical_disposition_reference
+ correlation_id
+ causation_id
+ evidence_references[]
+ schema_version
```

El handoff no contiene:

- saldo disponible como verdad impuesta por PULSO;
- LOC final decidido por PULSO;
- posición final decidida por PULSO;
- lote final decidido por PULSO;
- condición física final decidida por PULSO;
- movement id NEXO creado anticipadamente;
- receipt NEXO ficticio;
- afirmación de que el stock ya fue afectado.

---

#### 15. Apertura o recuperación de la operación NEXO

Tras validar inbox, elegibilidad e identidad del efecto, NEXO deberá:

1. recuperar una operación ya existente cuando la identidad del efecto la tenga;
2. crear la primera operación lógica únicamente cuando pueda demostrar que no existe un efecto equivalente previo;
3. vincularla con `VPROC-0025`;
4. conservar `event_id`, venta, línea, finalidad y causalidad;
5. conservar la clave y huella del efecto antes de la primera mutación;
6. revalidar autorización, producto, UOM, contexto y versión;
7. resolver fuentes físicas usando la verdad NEXO;
8. producir un resultado durable aun cuando el resultado sea bloqueo o no aplicación autorizada.

Un retry no abre otra operación lógica.

---

#### 16. Progresión canónica `VPROC-0025`

Se reutiliza sin alteración la progresión aprobada:

```text
STOCK_OPERATION_REQUESTED
        ↓
VALIDATION_IN_PROGRESS
        ↓
RESERVED
        ↓
READY_FOR_EXECUTION
        ↓
IN_EXECUTION
        ↓
DESTINATION_CONFIRMATION_PENDING
        ↓
POSTING_PENDING
        ↓
STOCK_OPERATION_RECONCILED
```

Reglas:

1. `STOCK_OPERATION_REQUESTED` no descuenta inventario por sí solo;
2. validación no equivale a reserva;
3. reserva no equivale a movimiento confirmado;
4. ejecución no equivale a posting completo;
5. `POSTING_PENDING` conserva cualquier trabajo todavía no confirmado;
6. `STOCK_OPERATION_RECONCILED` exige cantidad, unidad, origen, destino o consumo, custodia y movimientos conciliados sin doble efecto;
7. no se salta la progresión para acomodar un evento de venta;
8. los estados de venta PULSO no reemplazan estados NEXO.

---

#### 17. Eventos NEXO preservados

No se crea una definición normal de evento llamada “salida por venta”.

`VPROC-0025` conserva sus seis definiciones normales:

- `VPROC-0025.EVT-001` — operación de stock solicitada;
- `VPROC-0025.EVT-002` — validación en curso;
- `VPROC-0025.EVT-003` — cantidad reservada;
- `VPROC-0025.EVT-004` — confirmación de destino o consumidor pendiente;
- `VPROC-0025.EVT-005` — posting pendiente;
- `VPROC-0025.EVT-006` — operación de existencias reconciliada.

Los eventos NEXO describen hitos de su propio proceso. El evento comercial PULSO conserva su identidad y no se republica como si fuera un evento NEXO.

---

#### 18. Resolución autoritativa de la existencia física

PULSO puede indicar la sede y el producto comercial, pero NEXO decide qué existencia física puede cumplir el efecto.

NEXO deberá resolver, cuando corresponda:

- `source_stock_ref`;
- LOC de origen;
- posición;
- LPN;
- lote;
- condición;
- custodia;
- cantidad física disponible;
- cantidad reservada;
- cantidad bloqueada;
- restricciones por vencimiento, cuarentena o calidad;
- políticas de selección vigentes;
- destino o referencia de consumo.

No basta con leer una proyección agregada `current_qty` y restarla sin conservar causalidad física.

Queda prohibido seleccionar una fuente inexistente para poder completar la venta.

---

#### 19. Cantidad, UOM y conversión

La cantidad se conserva en dos planos cuando exista conversión:

```text
commercial_quantity + commercial_uom
        ↓ conversión versionada
base_quantity + stock_uom
```

El efecto deberá conservar:

- cantidad solicitada;
- UOM de la línea;
- presentación aplicable;
- factor de conversión;
- versión o referencia de la conversión;
- cantidad base calculada;
- cantidad realmente confirmada;
- diferencia o remanente.

Reglas:

1. no se inventa un factor por conveniencia;
2. no se usa el factor vigente actual para reescribir un efecto histórico;
3. no se redondea para forzar coincidencia;
4. una conversión incompatible bloquea el efecto;
5. el receipt registra las cantidades realmente confirmadas.

---

#### 20. Producto, presentación y receta

La línea comercial puede corresponder a:

1. un producto físico directo;
2. una presentación física;
3. un producto compuesto cuya venta desencadena consumo de componentes según una receta versionada;
4. una línea autorizadamente sin efecto físico.

Cuando exista receta:

```text
SALE_LINE
→ RECIPE_ID + RECIPE_VERSION
→ COMPONENTES VERSIONADOS
→ NEXO RESUELVE EXISTENCIAS FÍSICAS
→ LEGS
```

NEXO no modifica la receta ni decide qué ingredientes deberían existir. FOGO conserva la autoridad de la receta y NEXO aplica la referencia versionada recibida por contrato.

Una actualización posterior de receta no cambia retroactivamente un efecto ya confirmado.

---

#### 21. Group, componentes y legs

Una sola línea puede requerir varios movimientos físicos.

La estructura lógica es:

```text
UN CONSUMER_EFFECT
        ↓
UN GROUP CAUSAL CUANDO APLIQUE
        ↓
UNO O VARIOS COMPONENTES
        ↓
UNO O VARIOS LEGS FÍSICOS
        ↓
UN RESULTADO RECUPERABLE DEL EFECTO
```

Cada leg deberá poder conservar, cuando aplique:

- producto;
- cantidad;
- UOM;
- source stock;
- LOC y posición;
- lote o LPN;
- condición;
- destino o consumo;
- secuencia;
- estado;
- referencia al group;
- referencia al efecto;
- receipt o referencia de confirmación.

Crear varios legs legítimos no crea varias ventas ni varios efectos equivalentes.

---

#### 22. Splits entre fuentes físicas

Cuando una misma cantidad deba satisfacerse desde varias existencias:

```text
EFECTO LÓGICO ÚNICO
→ LEG A DESDE FUENTE 1
→ LEG B DESDE FUENTE 2
→ ...
```

Reglas:

1. cada fuente se identifica de forma autoritativa;
2. la suma confirmada de legs se concilia contra la cantidad del efecto;
3. un retry de un leg confirmado recupera su resultado;
4. no se vuelve a consumir el leg confirmado porque otro leg haya fallado;
5. sustituir una fuente exige decisión NEXO válida y trazable;
6. un split no autoriza a ocultar faltante o condición incompatible.

---

#### 23. Partialidad y remanente

La contabilidad lógica mínima será:

```text
SOLICITADO
=
CONFIRMADO
+
CANCELADO
+
BLOQUEADO
+
REMANENTE
```

Todo efecto parcial deberá conservar:

- cantidad solicitada;
- cantidad confirmada;
- cantidad bloqueada;
- cantidad cancelada;
- remanente;
- legs confirmados;
- legs pendientes;
- motivo de cada bloqueo;
- responsable de resolución;
- condición de salida.

Queda prohibido declarar el efecto completo mientras exista un remanente obligatorio no resuelto.

La excepción `VPROC-0025.EX-004` permite cumplimiento parcial únicamente bajo la autoridad y reglas aprobadas; no transforma partialidad en cierre completo.

---

#### 24. Posting y atomicidad lógica

La implementación posterior deberá impedir que un mismo efecto quede materialmente fragmentado sin capacidad de recuperación.

El límite propietario deberá vincular de forma atómica o con durabilidad equivalente:

- identidad del efecto;
- huella;
- versiones esperadas;
- operación `VPROC-0025`;
- selección de source stocks;
- group;
- legs;
- secuencia aplicable;
- mutaciones de ledger;
- receipt;
- resultado recuperable;
- registro de eventos NEXO publicables cuando corresponda.

No se selecciona en esta tarea una tabla, constraint, RPC, función, trigger, outbox, broker, cola o mecanismo físico concreto.

---

#### 25. Receipt propietario

Un efecto físico confirmado deberá producir una referencia durable que permita demostrar qué hizo NEXO.

El receipt deberá permitir reconstruir, según aplicabilidad:

- identidad del efecto;
- `event_id` causante;
- venta y línea;
- operación NEXO;
- group;
- legs;
- productos y cantidades confirmadas;
- UOM y conversiones;
- fuentes físicas;
- lotes, posiciones o LPN relevantes;
- estado final;
- partialidad o remanente;
- momento de confirmación;
- actor o principal técnico;
- resultado idempotente;
- referencias de auditoría.

Un ACK de entrega no es receipt. Una actualización visual de stock no es receipt.

---

#### 26. Resultados idempotentes

El efecto reutiliza el vocabulario transversal aplicable:

- `APPLIED`;
- `DUPLICATE_RESULT_RETURNED`;
- `CONFLICTING_REUSE`;
- `IN_PROGRESS_RECOVERABLE`;
- `STALE_VERSION`;
- `OUT_OF_ORDER_DEFERRED`;
- `RECONCILIATION_REQUIRED`;
- `REJECTED`.

Interpretación para NEXO:

1. `APPLIED` exige resultado físico durable;
2. `DUPLICATE_RESULT_RETURNED` devuelve el resultado previo sin repetir movimiento;
3. `CONFLICTING_REUSE` produce cero mutación nueva;
4. `IN_PROGRESS_RECOVERABLE` conserva el claim original;
5. `STALE_VERSION` no hace retroceder la verdad física;
6. `OUT_OF_ORDER_DEFERRED` no inventa la dependencia ausente;
7. `RECONCILIATION_REQUIRED` prohíbe un retry ciego;
8. `REJECTED` no se transforma en no-op de éxito.

---

#### 27. Retry y respuesta perdida

Ante timeout o desconexión después de una posible confirmación:

```text
RESULTADO DESCONOCIDO
        ↓
CONSULTAR IDENTIDAD DEL EFECTO / OPERACIÓN / RECEIPT
        ├── CONFIRMADO → RECUPERAR RESULTADO
        ├── NO APLICADO DEMOSTRADO → REINTENTAR MISMA IDENTIDAD
        └── INDETERMINADO → RECONCILIATION_REQUIRED
```

Reglas:

1. un retry conserva `event_id`, `effect_code`, identidad y huella;
2. no crea otra venta;
3. no crea otra operación lógica equivalente;
4. no crea otro movement solo porque la respuesta anterior se perdió;
5. no vuelve a ejecutar legs ya confirmados;
6. el agotamiento del retry no genera compensación automática;
7. `INT-SALES-007` especializará el control transversal de duplicados para la cadena permanente sin cambiar estas invariantes.

---

#### 28. Orden, versiones y eventos tardíos

NEXO no usa el orden de entrega como sustituto de la versión empresarial.

Reglas:

1. `aggregate_id + aggregate_version` gobiernan el orden aplicable cuando corresponda;
2. una versión inferior tardía no sobrescribe un efecto más nuevo;
3. una versión superior que dependa de un antecedente ausente queda diferida o conciliable;
4. una revisión PULSO no produce automáticamente otro movimiento;
5. un cambio de descripción, mapping, catálogo o presentación no constituye por sí solo un nuevo hecho físico;
6. una corrección material que requiera efecto adicional utiliza la semántica de compensación o ajuste correspondiente;
7. una redelivery del mismo evento conserva `event_id`.

---

#### 29. Faltante de stock y restricción física

Cuando NEXO no pueda satisfacer la cantidad:

- no crea stock ficticio;
- no fuerza el saldo a cero para ocultar la diferencia;
- no consume desde una ubicación inventada;
- no toma una existencia bloqueada como disponible;
- no cambia silenciosamente presentación o UOM;
- no marca la venta PULSO como inválida por el solo faltante NEXO;
- conserva el efecto como parcial, bloqueado, rechazado o conciliable según la situación real.

Las excepciones de `VPROC-0025` aplicables son:

- `EX-001` HOLD;
- `EX-002` SUBSTITUTE;
- `EX-003` ESCALATE;
- `EX-004` PARTIAL.

Cada excepción conserva su autoridad, alcance y evidencia aprobados.

---

#### 30. Compensación, retorno y ajuste

Un movimiento confirmado no se modifica destructivamente para representar un reverso.

Las acciones propietarias de `VPROC-0025` preservadas son:

- `CCR-001` CANCEL — detiene la ejecución restante y conserva efectos ya confirmados;
- `CCR-002` VOID — anula una instrucción inválida o duplicada que no produjo un efecto válido;
- `CCR-003` RETURN — crea un retorno o movimiento compensatorio vinculado al efecto físico original;
- `CCR-004` ADJUST — registra una diferencia y ajuste separado conservando el hecho original.

Toda compensación deberá:

1. identificar el efecto original;
2. conservar la causalidad;
3. usar identidad propia;
4. revalidar autorización y fuente física;
5. conservar cantidades, UOM, condición y custodia;
6. producir su propio resultado durable;
7. no borrar movement, group, legs ni receipt originales.

---

#### 31. Conciliación permanente PULSO–NEXO

La conciliación deberá poder detectar, como mínimo:

- evento PULSO aplicable a NEXO sin inbox;
- inbox sin decisión de efecto;
- efecto esperado sin resultado;
- efecto aplicado sin evento fuente;
- efecto aplicado a una línea equivocada;
- duplicado de efecto;
- misma identidad con huella incompatible;
- línea bloqueada con movimiento confirmado;
- línea liberada cuyo efecto continúa pendiente;
- no-op físico sin fundamento suficiente;
- producto o versión equivocados;
- diferencia de cantidad;
- diferencia de UOM o conversión;
- split cuyos legs no suman lo confirmado;
- partialidad oculta;
- group sin legs o legs sin group cuando el modelo aplicable lo exija;
- receipt ausente o incompatible;
- ledger y proyección divergentes;
- saldo agregado que no se explica por movimientos causales;
- resultado desconocido no resuelto;
- compensación pendiente o duplicada.

La conciliación no crea el hecho faltante por inferencia. Clasifica la diferencia y conserva la acción pendiente.

`INT-SALES-008` especializará la conciliación durante la convivencia de POS externo y PULSO; esta tarea fija la conciliación física permanente dentro de la frontera NEXO.

---

#### 32. Independencia respecto de la fuente original de la venta

El efecto NEXO no cambia de contrato cuando cambia `source_system`.

Durante historia transicional:

```text
source_system = MAKOS
producer_application = PULSO
consumer_application = NEXO
```

Para ventas nativas posteriores:

```text
source_system = PULSO
producer_application = PULSO
consumer_application = NEXO
```

En ambos casos, cuando la relación de consumo sea aplicable:

```text
MISMO EVENT ENVELOPE
+
MISMO INBOX NEXO
+
MISMO ALCANCE CONSUMER_EFFECT
+
MISMO VPROC-0025
+
MISMAS REGLAS DE LEDGER Y RECEIPT
```

La procedencia se conserva como evidencia; no crea dos sistemas de inventario.

---

#### 33. Corte de fuente y retiro del adaptador

Las tareas posteriores de corte y retiro no modifican el contrato NEXO definido aquí.

- `INT-SALES-009` define el corte por sede, terminal y fecha efectiva;
- `INT-SALES-010` impide que dos fuentes emitan la misma venta como nueva;
- `INT-SALES-011` retira el adaptador externo sin cambiar consumidoras internas.

Cuando el adaptador desaparezca:

- NEXO no cambia su clave de inbox;
- NEXO no cambia su clave de efecto;
- los events históricos mantienen productora y procedencia;
- los receipts históricos mantienen causalidad;
- no se ejecuta backfill físico por el simple retiro del adaptador.

---

#### 34. Offline, replay y backfill

##### 34.1. Offline

Una intención pendiente deberá conservar identidad, huella, contexto y edad. Al reanudarse, NEXO revalida autorización, versión, producto, UOM, sede y fuente física.

Una cola antigua no puede volver a aplicar un efecto ya confirmado.

##### 34.2. Replay

Replay del mismo evento:

- conserva `event_id`;
- conserva audiencia histórica salvo migración explícita;
- pasa por el mismo inbox;
- recupera un efecto confirmado;
- no vuelve a ejecutar stock sensible por defecto.

##### 34.3. Backfill

Un backfill autorizado:

- conserva procedencia, lote y ventana;
- identifica que es backfill;
- usa identidades deterministas;
- no ejecuta inventario físico automáticamente;
- requiere autorización específica para efectos sensibles;
- concilia contra movimientos y receipts ya existentes antes de cualquier efecto.

---

#### 35. Autorización y auditoría

Toda mutación física deberá poder reconstruir:

- principal técnico;
- actor efectivo cuando aplique;
- permiso o capacidad;
- sede y territorio;
- dispositivo o sesión cuando sea material;
- venta y línea causantes;
- evento PULSO;
- inbox;
- identidad y huella del efecto;
- operación NEXO;
- producto, UOM y conversión;
- fuente física;
- group y legs;
- intentos;
- receipt;
- outcome;
- compensación o residual cuando exista.

La auditoría no concede autoridad para ejecutar el movimiento y no sustituye el ledger NEXO.

---

#### 36. Diagnóstico de la línea base técnica observada

La línea base actual de NEXO contiene superficies reales de retiro y stock. En la operación de retiro por quiosco observada se ejecutan, entre otras acciones:

1. lectura de `inventory_stock_by_location`;
2. validación de stock de presentaciones;
3. consumo o eliminación de filas de `inventory_stock_by_uom_profile`;
4. ejecución de `consume_inventory_stock_from_positions`;
5. actualización de `inventory_stock_by_location`;
6. inserción de `inventory_movements`;
7. actualización del destino cuando existe traslado;
8. actualización agregada de `inventory_stock_by_site` cuando no existe destino.

Esta implementación demuestra capacidad operativa parcial de retiro, pero no se eleva por sí sola al contrato permanente de venta definido aquí.

En particular, la superficie observada no constituye evidencia suficiente de una única frontera transaccional que enlace, para una venta PULSO:

```text
event_id
+
CONSUMER_INBOX
+
CONSUMER_EFFECT
+
VPROC-0025
+
GROUP / LEGS
+
RECEIPT
+
RESULTADO RECUPERABLE
```

Tampoco se adopta como regla canónica el comportamiento observado que calcula un saldo agregado de sede mediante un límite inferior de cero. Un faltante físico deberá permanecer explícito y reconciliable.

La tarea no modifica esta implementación.

---

#### 37. Diferencia entre retiro operativo existente y efecto de venta canónico

```text
RETIRO OPERATIVO EXISTENTE
≠
EFECTO NEXO POR VENTA CANÓNICA
```

El segundo exige además:

- causalidad con una venta y línea canónicas;
- evento PULSO estable;
- audiencia canónica;
- inbox NEXO;
- identidad `CONSUMER_EFFECT`;
- huella compatible;
- recuperación ante respuesta perdida;
- atomicidad o durabilidad equivalente;
- receipt propietario;
- conciliación contra el evento fuente;
- compensación enlazada.

Una implementación futura puede reutilizar piezas existentes únicamente después de demostrar que satisfacen estas invariantes sin introducir doble efecto.

---

#### 38. Handoffs posteriores obligatorios

| Pendiente material                       | Tarea o propietario                                    | Condición de salida                                                                                                           |
| ---------------------------------------- | ------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------- |
| recepción del hecho económico de venta   | `INT-SALES-004`                                        | NUMERA consume el evento aplicable bajo identidad y frontera propias                                                          |
| acumulación de puntos                    | `INT-SALES-005`                                        | PASS evalúa elegibilidad y registra acumulación exactamente una vez                                                           |
| redención de puntos                      | `INT-SALES-006`                                        | PASS procesa la redención con autoridad, identidad y ledger propios                                                           |
| control permanente contra duplicados     | `INT-SALES-007`                                        | retry, redelivery y resultado desconocido recuperan el efecto original sin duplicarlo                                         |
| conciliación de convivencia de fuentes   | `INT-SALES-008`                                        | diferencias durante convivencia quedan detectables y accionables                                                              |
| corte permanente de fuente               | `INT-SALES-009`                                        | sede, terminal y fecha efectiva gobiernan nuevas ventas                                                                       |
| prohibición de doble fuente              | `INT-SALES-010`                                        | una misma venta no puede aparecer como nueva desde dos fuentes                                                                |
| retiro del adaptador externo             | `INT-SALES-011`                                        | consumidoras internas continúan sin dependencia del adaptador                                                                 |
| materialización física del contrato NEXO | paquete E5 NEXO y arquitectura/implementación asignada | inbox, efecto, transacción propietaria, ledger, receipt, seguridad, idempotencia y pruebas quedan implementados y demostrados |

Ningún pendiente material queda sin dueño y condición de salida.

---

#### 39. Prohibiciones

Queda prohibido:

1. descontar stock desde PULSO;
2. escribir directamente una fuente privada NEXO desde PULSO;
3. asumir que publicar el evento ya descontó inventario;
4. asumir que recibir el evento ya descontó inventario;
5. tratar el ACK de transporte como receipt físico;
6. usar `sale_id` como clave universal de todos los efectos NEXO;
7. usar `product_id`, cantidad, fecha o sede como clave idempotente suficiente;
8. generar una identidad nueva por retry;
9. crear otra operación lógica equivalente ante timeout sin indagación;
10. repetir un leg ya confirmado porque otro leg falle;
11. usar una proyección agregada de stock como única prueba de origen físico;
12. forzar el saldo a cero para ocultar faltante;
13. producir stock negativo no autorizado;
14. seleccionar un lote, posición o LOC inventados;
15. usar producto parecido por nombre cuando la identidad no esté resuelta;
16. convertir ausencia de mapping en no-op físico;
17. convertir cuarentena en no-op físico;
18. omitir una línea problemática de la venta;
19. cambiar una receta histórica por la versión vigente actual;
20. cambiar UOM o factor para hacer cuadrar la cantidad;
21. tratar partialidad como éxito completo;
22. crear varios efectos equivalentes porque existan varios legs;
23. borrar o editar destructivamente un movimiento confirmado;
24. representar una devolución reenviando el evento normal original con otro contenido;
25. compensar automáticamente por agotamiento de retry;
26. usar éxito NUMERA o PASS como evidencia de éxito NEXO;
27. usar éxito NEXO como evidencia de éxito NUMERA o PASS;
28. backfillear efectos físicos sensibles sin autorización explícita;
29. cambiar el contrato NEXO por el retiro del adaptador externo;
30. crear una definición normal de evento específica llamada salida por venta;
31. modificar código, SQL, migraciones, RLS, RPC, Supabase, datos, tipos, contratos físicos, endpoints o configuración remota desde esta tarea documental;
32. iniciar o desarrollar `INT-SALES-004`.

---

#### 40. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la cobertura canónica vigente ya protege expresamente que las ventas y sus líneas produzcan el efecto físico aplicable en NEXO exactamente una vez, conservando fuente, evento, línea, versión, cantidad, unidad, ubicación, actor, estado de aplicación, idempotencia, partialidad, compensación y conciliación. También protege la convergencia del POS externo y PULSO sobre el mismo contrato, la prevención de doble emisión y las garantías NEXO sobre movimientos, proyecciones, reservas, consumo, salida, traslado, concurrencia y compensación. `INT-SALES-003` materializa la frontera permanente PULSO → NEXO dentro de ese comportamiento ya protegido y no introduce una capacidad verificable nueva fuera del registro vigente.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

---

#### 41. Cobertura de prueba existente preservada

Se preserva sin modificación, en especial:

- `TREQ-NEXO-011`, para movimientos y proyecciones físicas reconciliables, operaciones idempotentes o compensables, separación de estados físicos y ausencia de doble movimiento;
- `TREQ-INTEGRATION-003`, para identidad estable, huella, resultado recuperable, retry y conflicto;
- `TREQ-INTEGRATION-004`, para trazabilidad de trigger, intento, resultado y efecto final;
- `TREQ-INTEGRATION-006`, para fuente empresarial única y diferencias trazables;
- `TREQ-INTEGRATION-011`, para que toda venta, anulación o devolución produzca el movimiento físico aplicable en NEXO exactamente una vez;
- `TREQ-INTEGRATION-014`, para convergencia de POS externo y PULSO, prevención de doble emisión y efectos exactamente una vez;
- `TREQ-INTEGRATION-108` a `TREQ-INTEGRATION-122`, para scopes idempotentes, `event_id`, inbox, consumer effect, concurrencia, respuesta perdida y atomicidad;
- `TREQ-INTEGRATION-139` a `TREQ-INTEGRATION-163`, para retry, resultado desconocido, claims, orden y observabilidad;
- `TREQ-INTEGRATION-298`, para impedir que un evento sea una instrucción de edición cruzada;
- `TREQ-INTEGRATION-306`, para mantener las mutaciones dentro de la frontera propietaria.

Ningún requisito cambia de identidad, texto, estado, relación, secuencia, propietaria ni evidencia por esta tarea.

---

#### 42. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. conserva `INT-SALES-002` como única tarea anterior;
2. mantiene `INT-SALES-004` como única tarea siguiente;
3. mantiene PULSO como propietaria de venta y emisión;
4. mantiene NEXO como única propietaria del efecto físico;
5. deriva aplicabilidad desde el registro canónico de consumidoras;
6. impide convertir a NEXO en consumidora universal por conveniencia local;
7. separa emisión, delivery, inbox, efecto y transacción propietaria;
8. define la línea canónica como unidad primaria de elegibilidad;
9. permite coexistencia de líneas aplicables, no aplicables y bloqueadas dentro de una venta;
10. diferencia venta nativa PULSO de procedencia externa sin crear dos contratos NEXO;
11. impide exigir mapping externo a una venta nativa PULSO sin causa;
12. preserva mapping y cuarentena cuando la procedencia externa los requiera;
13. define no-op físico únicamente por disposición explícita y auditable;
14. define `CONSUMER_INBOX = nexo + event_id`;
15. define `CONSUMER_EFFECT = nexo + event_id + effect_code`;
16. exige `effect_code` estable por finalidad física aplicable;
17. separa identidad de efecto de venta, línea, producto, movement, group, leg y receipt;
18. exige huella lógica versionada;
19. trata reutilización incompatible como conflicto sin nueva mutación;
20. define el handoff mínimo PULSO → NEXO sin imponer verdad física;
21. exige recuperación de la operación NEXO antes de crear otra equivalente;
22. reutiliza `VPROC-0025`;
23. conserva su progresión completa de ocho estados;
24. conserva las seis definiciones normales `VPROC-0025.EVT-001` a `VPROC-0025.EVT-006`;
25. crea cero nuevas definiciones normales de evento;
26. exige que NEXO resuelva autoritativamente origen, LOC, posición, lote, LPN, condición y disponibilidad;
27. impide usar `current_qty` agregado como autoridad física suficiente;
28. prohíbe limitar silenciosamente un saldo a cero para ocultar faltante;
29. conserva cantidad comercial, UOM, factor y cantidad base;
30. conserva versión de conversión;
31. conserva producto, presentación y receta versionada;
32. permite múltiples componentes y legs bajo un único efecto lógico;
33. permite splits sin repetir fragmentos confirmados;
34. registra partialidad mediante solicitado, confirmado, cancelado, bloqueado y remanente;
35. impide cierre completo con remanente obligatorio;
36. exige atomicidad o durabilidad equivalente entre identidad, operación, ledger, legs, receipt y resultado;
37. define receipt propietario de NEXO;
38. reutiliza los outcomes idempotentes transversales;
39. exige indagación ante resultado desconocido;
40. impide retry ciego después de posible commit;
41. preserva orden por agregado y versión sin usar llegada como verdad;
42. trata faltante de stock como estado explícito y no como ficción de inventario;
43. preserva HOLD, SUBSTITUTE, ESCALATE y PARTIAL de `VPROC-0025`;
44. preserva CANCEL, VOID, RETURN y ADJUST de `VPROC-0025`;
45. impide modificación destructiva del efecto original;
46. define conciliación permanente PULSO–NEXO;
47. conserva el mismo contrato NEXO antes y después del corte de fuente;
48. preserva offline, replay y backfill sin efectos sensibles automáticos;
49. exige autorización y auditoría del efecto físico;
50. diagnostica la implementación NEXO observada como capacidad parcial y no como materialización suficiente del contrato permanente;
51. identifica el comportamiento observado de límite inferior de cero como no canónico para ocultar faltantes;
52. asigna la materialización física a la fase y paquete de implementación correspondientes;
53. asigna cada responsabilidad posterior a `INT-SALES-004` a `INT-SALES-011` sin adelantarla;
54. genera cero requisitos de prueba nuevos;
55. modifica cero requisitos de prueba;
56. no genera una copia del registro canónico de requisitos;
57. no modifica código, SQL, migraciones, RLS, RPC, Supabase, datos, tipos ni configuración remota;
58. no aplica un movimiento real ni una compensación real;
59. no inicia `INT-SALES-004`.

---

#### 43. Resultado de la tarea

`INT-SALES-003` queda definida como la frontera permanente que convierte una emisión PULSO aplicable a NEXO en un efecto físico NEXO dueño de su propia identidad, operación, ledger, group, legs, receipt y resultado.

Resultado consolidado:

```text
VENTA PULSO DURABLE
+
EVENTO PULSO APLICABLE A NEXO
+
LÍNEA FÍSICAMENTE ELEGIBLE
+
CONSUMER_INBOX
+
CONSUMER_EFFECT
+
REVALIDACIÓN NEXO
+
VPROC-0025
+
POSTING + RECEIPT
→ EFECTO FÍSICO RECUPERABLE
→ CERO DOBLE STOCK
```

Sin convertir PULSO en propietaria del inventario, sin crear un evento paralelo y sin afirmar que la implementación física actual ya cumple todas estas garantías.

---

#### 44. Continuidad

ÚLTIMA TAREA APROBADA

`INT-SALES-002 — Definir emisión en PULSO del mismo contrato canónico utilizado durante la transición`

TAREA ACTUAL APROBADA

`INT-SALES-003 — Definir registro de salida de inventario en NEXO`

SIGUIENTE TAREA RESERVADA

`INT-SALES-004 — Definir recepción del evento de venta en NUMERA`


### ✅ INT-SALES-004 — Definir recepción del evento de venta en NUMERA

**Estado:** APROBADA
**Tarea anterior:** `INT-SALES-003 — Definir registro de salida de inventario en NEXO`
**Tarea siguiente:** `INT-SALES-005 — Definir acumulación de puntos en PASS`
**Tipo de tarea:** documental; definición normativa permanente de la recepción en NUMERA de eventos empresariales de venta emitidos por PULSO y de la materialización exactamente una vez del hecho económico aplicable, conservando separación entre evento, venta, pago, caja, documento fiscal, cartera, costo, rentabilidad y contabilidad, con audiencia canónica, inbox, puerta de materialidad, identidad idempotente, huella económica, dimensiones obligatorias, resultado recuperable, tratamiento de eventos tardíos, reversos y conciliación, sin implementar tablas, RPC, funciones, triggers, colas, migraciones, Supabase ni cambios de código
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/07_VENTAS_INVENTARIO_FINANZAS_Y_FIDELIZACION.md`
**Aplicación propietaria de la venta y del evento comercial:** `PULSO`
**Aplicación propietaria del hecho económico derivado:** `NUMERA`
**Efecto económico reutilizado:** `SALE_ECONOMIC_FACT`
**Línea base documental:** `vento-shell@c6d08c35df486f5ebe32c9c80b297339f4f15bf9`
**Línea base PULSO observada:** `vento-pulso@71e0184486b5fe11e0a42435baf4024807a80efd`
**Línea base NUMERA observada:** `vento-numera@1b48a5da425d92e19ed89cf175b1dccc4cd960e1`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma permanente cómo NUMERA recibe un evento empresarial de venta emitido por PULSO, decide si ese evento demuestra materialidad económica suficiente y, cuando corresponda, materializa exactamente una vez su propio hecho económico de venta sin reconstruir la venta, sin depender del adaptador del POS externo y sin apropiarse de pagos, caja, inventario, fidelización, fiscalidad o contabilidad formal.

Regla raíz:

```text
VENTA DURABLE PULSO
        ↓
EVENTO EMPRESARIAL PULSO + EVENT_ID ESTABLE
        ↓
AUDIENCIA CANÓNICA
        ↓
ENTREGA A NUMERA
        ↓
CONSUMER_INBOX NUMERA
        ↓
PUERTA DE MATERIALIDAD ECONÓMICA
        ↓
CONSUMER_EFFECT NUMERA
        ↓
SALE_ECONOMIC_FACT DURABLE
        ↓
RESULTADO RECUPERABLE
        ↓
CONCILIACIÓN CON VENTA, PAGOS, CAJA, FISCALIDAD, INVENTARIO Y COSTO
```

No:

```text
EVENTO RECIBIDO
=
INGRESO APLICADO
```

No:

```text
VENTA
=
PAGO
=
CAJA
=
DEPÓSITO
=
ASIENTO CONTABLE
```

---

#### 2. Resultado sustantivo

`INT-SALES-004` deja definido el contrato permanente PULSO → NUMERA mediante las siguientes decisiones:

1. PULSO es propietaria de la venta, sus líneas, su estado comercial y el evento empresarial que describe el hecho durable.
2. NUMERA es propietaria del hecho económico derivado y de su resultado.
3. NUMERA no reconstruye ni edita la venta PULSO.
4. PULSO no escribe el hecho económico NUMERA, sus periodos, conciliaciones, cartera ni libros por autoridad cruzada.
5. La recepción de un evento no equivale a materialización económica.
6. NUMERA solo recibe como consumidora cuando la relación vigente del registro transversal la incluye para la definición concreta.
7. La relación de consumo y su condición, cuando exista, se resuelven antes de tratar el evento como entrada aplicable.
8. El primer alcance durable de NUMERA es `CONSUMER_INBOX`.
9. La identidad del inbox es `numera + event_id`.
10. El inbox deduplica la recepción de NUMERA con independencia de NEXO y PASS.
11. El reconocimiento económico reutiliza `effect_code = SALE_ECONOMIC_FACT`.
12. El alcance de la mutación económica es `CONSUMER_EFFECT`.
13. La identidad transversal del efecto es `numera + event_id + SALE_ECONOMIC_FACT`.
14. Una misma identidad y una misma huella económica recuperan el resultado previo.
15. La misma identidad con contenido material incompatible produce conflicto antes de crear otro hecho.
16. Dos ejecuciones concurrentes producen un único ganador empresarial.
17. Una respuesta perdida se resuelve consultando la identidad original antes de cualquier nuevo intento.
18. La granularidad primaria de `SALE_ECONOMIC_FACT` es una venta canónica económicamente reconocible.
19. Las líneas comerciales permanecen correlacionadas para reconstrucción, distribución y conciliación sin convertirse automáticamente en hechos económicos separados.
20. Un evento de apertura, preparación, handoff o espera no crea ingreso realizado por el solo hecho de ser válido.
21. El evento debe superar una puerta explícita de materialidad económica.
22. Entidad legal, marca o unidad, sede, centro de costo, tercero, moneda, fechas, documento, importes, impuestos, estado y evidencia permanecen dimensiones separadas.
23. Ninguna dimensión obligatoria se completa mediante una inferencia no autorizada.
24. Una venta a consumidor final puede ser económicamente válida sin crear un cliente artificial.
25. Cliente, tercero económico, deudor y cuenta PASS no son identidades equivalentes.
26. Moneda no se deduce de la interfaz, del formato visual ni de un valor técnico por defecto.
27. Subtotal, descuentos, impuestos, propinas, devoluciones y pagos conservan la semántica demostrada por sus fuentes.
28. `SALE_ECONOMIC_FACT` no es una factura, pago, aplicación de pago, movimiento de caja, cuenta por cobrar, depósito, movimiento bancario ni asiento.
29. Un hecho económico válido puede existir con costo todavía pendiente; en ese caso la rentabilidad permanece incompleta.
30. Una línea con mapping de producto pendiente no autoriza a inventar producto, presentación, receta, costo o clasificación económica.
31. El bloqueo de producto no elimina la línea del expediente económico.
32. El bloqueo de producto no impide automáticamente el hecho económico global si todas sus dimensiones obligatorias pueden demostrarse sin usar ese mapping.
33. Liberar posteriormente una línea no vuelve a reconocer el ingreso ya aplicado.
34. NEXO, NUMERA y PASS aplican efectos independientes de la misma venta.
35. El éxito de NEXO no acredita NUMERA y el éxito de NUMERA no acredita NEXO ni PASS.
36. `occurred_at`, `received_at`, `recorded_at` y `recognized_at` conservan semánticas distintas.
37. Un evento tardío contra un periodo cerrado no se descarta, backdatea ni mueve de periodo de forma implícita.
38. Una anulación, devolución, reembolso o corrección material no modifica destructivamente el hecho económico original.
39. Los reversos o ajustes económicos utilizan identidad causal propia y conservan referencia al original.
40. El origen histórico Makos o nativo PULSO no cambia la frontera consumidora de NUMERA.
41. NUMERA no necesita conocer credenciales, polling, staging ni lógica del adaptador para consumir el contrato permanente.
42. El retiro futuro del adaptador no cambia las claves del inbox o del efecto.
43. La implementación física se reserva a la fase y paquete correspondientes.
44. Se crean cero definiciones normales de evento.
45. Se modifican cero definiciones normales de evento.
46. Se crean cero requisitos `TREQ-*`.
47. Se modifican cero requisitos `TREQ-*`.
48. Se crean cero objetos físicos.
49. Se modifican cero objetos físicos.

---

#### 3. Base canónica preservada

Esta tarea consume sin reabrir las decisiones ya aprobadas en:

- `INT-SALES-001`, para la venta y las líneas durables en PULSO;
- `INT-SALES-002`, para la emisión permanente desde PULSO con el contrato canónico vigente;
- `INT-SALES-003`, para la independencia del efecto físico NEXO;
- `INT-POS-017`, para la frontera económica demostrada durante la transición;
- `INT-POS-019`, para compensaciones no destructivas;
- `INT-POS-020`, para conciliación entre venta, evento y efectos;
- `INT-POS-023` y `INT-POS-024`, para cambio de fuente y reducción de credenciales sin cambiar consumidoras;
- `INT-APP-001` a `INT-APP-010`, para catálogo, productoras, consumidoras, envelope, idempotencia, retry, auditoría, error parcial y prohibición de escrituras cruzadas;
- `ENTERPRISE-EVENT-CATALOG-001`;
- `ENTERPRISE-EVENT-PRODUCER-REGISTRY-001`;
- `ENTERPRISE-EVENT-CONSUMER-REGISTRY-001`;
- `EVENT-ENVELOPE-001`;
- `ENTERPRISE-EVENT-IDEMPOTENCY-REGISTRY-001@1.0.0`;
- `ENTERPRISE-EVENT-RETRY-POLICY-001@1.0.0`;
- el registro canónico vigente de requisitos de prueba;
- la fundación económica NUMERA existente únicamente como línea base técnica, no como definición del contrato objetivo.

Ninguna de estas decisiones cambia de identidad ni de propietaria por esta tarea.

---

#### 4. Propiedad empresarial permanente

| Elemento                      | Propietaria o autoridad                                 | Regla                                                      |
| ----------------------------- | ------------------------------------------------------- | ---------------------------------------------------------- |
| venta y línea canónica        | `PULSO`                                                 | conserva el hecho comercial y su revisión                  |
| evento empresarial de venta   | `PULSO`                                                 | describe un hecho durable ya confirmado                    |
| audiencia                     | registro transversal                                    | determina consumidoras y condiciones vigentes              |
| inbox NUMERA                  | `NUMERA`                                                | reconoce una sola vez cada `event_id` aplicable            |
| decisión de materialidad      | `NUMERA`                                                | determina si corresponde un efecto económico               |
| hecho económico de venta      | `NUMERA`                                                | conserva identidad, dimensiones, monto, estado y evidencia |
| pago y operación de caja      | `PULSO` según su proceso                                | no se fusionan con el hecho económico                      |
| inventario físico             | `NEXO`                                                  | no se reconstruye desde NUMERA                             |
| fidelización                  | `PASS`                                                  | efecto separado                                            |
| receta y ejecución productiva | `FOGO`                                                  | no se reinterpretan para fabricar costo                    |
| documento fiscal oficial      | proveedor o sistema autorizado                          | NUMERA conserva referencias sin asumir autoridad fiscal    |
| contabilidad oficial          | sistema autorizado mientras no exista decisión distinta | el hecho económico no equivale a libro oficial             |
| cartera y tesorería           | `NUMERA` según contratos de su dominio                  | permanecen objetos distintos del hecho de venta            |
| conciliación                  | tareas y procesos propietarios aprobados                | compara hechos y efectos sin reescribir fuentes            |

Invariante:

```text
PULSO AFIRMA LA VENTA
NUMERA AFIRMA EL HECHO ECONÓMICO
NEXO AFIRMA EL MOVIMIENTO FÍSICO
PASS AFIRMA LA FIDELIZACIÓN
LA AUTORIDAD FISCAL O SU PROVEEDOR AUTORIZADO AFIRMA EL DOCUMENTO OFICIAL
```

Compartir infraestructura no fusiona estas autoridades.

---

#### 5. Aplicabilidad de NUMERA como consumidora

NUMERA no se convierte en consumidora universal de todo evento PULSO.

Para cada emisión deben resolverse, según el contrato transversal vigente:

```text
event_definition_id
+
process_id
+
producer_application = pulso
+
consumer_application = numera
+
consumer_relation
+
condition_ref cuando aplique
+
projection_profile
+
finalidad
```

Reglas:

1. solo una relación vigente y aplicable habilita la recepción empresarial en NUMERA;
2. una relación condicional falla cerrada cuando su condición no puede demostrarse;
3. PULSO no mantiene una lista local de consumidoras que contradiga el registro transversal;
4. un evento que no incluya a NUMERA en su audiencia no se compensa con una escritura directa;
5. que NUMERA figure en la audiencia no significa que el evento ya haya superado materialidad económica;
6. el registro de consumidoras gobierna la entrega; NUMERA gobierna su propio efecto.

---

#### 6. Frontera entre emisión, entrega, inbox y efecto

La secuencia permanente es:

```text
EVENT_EMISSION PULSO
        ↓
DELIVERY A NUMERA
        ↓
CONSUMER_INBOX NUMERA
        ↓
DECISIÓN DE MATERIALIDAD
        ↓
CONSUMER_EFFECT NUMERA
        ↓
SALE_ECONOMIC_FACT
        ↓
RESULTADO NUMERA
```

Por tanto:

- `PUBLISHED` no equivale a hecho económico;
- `DELIVERED` no equivale a hecho económico;
- `CLAIMED` no equivale a hecho económico;
- recepción en inbox no equivale a hecho económico;
- una entrega repetida puede recuperar el inbox sin crear otro hecho;
- solo un resultado durable de NUMERA demuestra el efecto;
- el estado de NEXO o PASS no completa el efecto NUMERA.

---

#### 7. Puerta de materialidad económica

NUMERA solo materializa `SALE_ECONOMIC_FACT` cuando el evento fuente demuestra una venta económicamente reconocible.

La puerta exige, como mínimo:

1. definición de evento vigente;
2. PULSO como productora empresarial;
3. NUMERA como consumidora aplicable;
4. `event_id` estable;
5. venta canónica correlacionable;
6. revisión comercial aplicable;
7. hecho comercial durable;
8. estado o hito suficiente para reconocimiento económico;
9. entidad legal resoluble sin inferencia prohibida;
10. sede aplicable;
11. centro de costo resoluble conforme a regla vigente;
12. tercero económico o disposición válida para consumidor final;
13. moneda demostrable;
14. importe económico demostrable;
15. componentes monetarios necesarios con semántica suficiente;
16. fecha empresarial;
17. política de reconocimiento resoluble o estado explícito de bloqueo;
18. documento o estado fiscal tratado conforme a su autoridad;
19. ausencia de una reutilización conflictiva;
20. ausencia de un resultado desconocido que obligue a conciliación antes de repetir.

Un evento empresarial válido puede generar cero `SALE_ECONOMIC_FACT` cuando no demuestra todavía materialidad económica suficiente.

---

#### 8. Hitos PULSO relevantes

Se preservan las decisiones ya congeladas para los procesos comerciales:

| Definición           | Hecho                           | Tratamiento                                                        |
| -------------------- | ------------------------------- | ------------------------------------------------------------------ |
| `VPROC-0038.EVT-001` | servicio de mesa abierto        | no demuestra venta económicamente cerrada                          |
| `VPROC-0038.EVT-004` | cierre de mesa pendiente        | no demuestra todavía cierre económico                              |
| `VPROC-0038.EVT-005` | servicio de mesa cerrado        | puede superar la puerta si el contrato obligatorio está completo   |
| `VPROC-0039.EVT-001` | venta de mostrador abierta      | no demuestra venta económicamente cerrada                          |
| `VPROC-0039.EVT-004` | conciliación de venta pendiente | no demuestra todavía el hecho económico final                      |
| `VPROC-0039.EVT-005` | venta de mostrador cerrada      | puede superar la puerta si el contrato obligatorio está completo   |
| `VPROC-0040.EVT-006` | pedido externo conciliado       | no se usa como fallback para inventar una venta económica distinta |

Otra definición solo podrá activar el efecto si su `confirmed_fact` aprobado demuestra materialidad equivalente y la relación consumidora vigente autoriza a NUMERA.

Esta tarea no crea un catálogo paralelo de eventos económicamente válidos.

---

#### 9. Inbox permanente de NUMERA

La identidad de recepción es:

```text
CONSUMER_INBOX
=
numera + event_id
```

Reglas:

1. la primera entrega aplicable obtiene o crea un reconocimiento durable;
2. una redelivery exacta recupera ese reconocimiento;
3. una entrega técnica nueva no crea un `event_id` empresarial nuevo;
4. el inbox conserva la correlación con definición, versión, productora y agregado;
5. el inbox puede quedar pendiente, en proceso, conflictivo, rechazado o sujeto a conciliación;
6. el inbox no acredita `SALE_ECONOMIC_FACT`;
7. el resultado de NEXO o PASS no completa el inbox NUMERA;
8. `delivery_id`, `attempt_id`, `trace_id`, batch, archivo o worker no sustituyen `event_id`.

---

#### 10. Identidad permanente del efecto

El efecto reutilizado es:

```text
effect_code = SALE_ECONOMIC_FACT
```

Su identidad transversal es:

```text
CONSUMER_EFFECT
=
numera + event_id + SALE_ECONOMIC_FACT
```

Reglas:

1. la identidad se fija antes de intentar una mutación económica;
2. `sale_id` por sí solo no sustituye la clave transversal;
3. el documento fiscal no sustituye la clave;
4. el identificador de pago no sustituye la clave;
5. el periodo no sustituye la clave;
6. un hash es guardia de equivalencia o conflicto, no identidad empresarial;
7. un segundo efecto legítimo de NUMERA derivado del mismo evento deberá usar un código distinto;
8. retry, replay o redelivery conservan la identidad original;
9. una corrección material no reutiliza la identidad original con contenido incompatible.

---

#### 11. Huella lógica económica

La huella de `SALE_ECONOMIC_FACT` debe incluir las dimensiones materiales suficientes para distinguir repetición de conflicto.

Debe considerar, cuando corresponda:

- definición y versión del evento;
- venta y revisión;
- sistema de origen;
- entidad legal;
- marca o unidad;
- sede;
- centro de costo;
- tercero económico;
- moneda;
- fecha de ocurrencia;
- fecha de reconocimiento;
- documento o referencia fiscal;
- monto;
- subtotal o base cuando exista;
- descuentos;
- impuestos;
- propinas;
- devoluciones relacionadas;
- líneas económicas necesarias;
- estado económico pretendido;
- versión de reglas o resoluciones aplicables;
- referencias de evidencia.

No cambia únicamente por:

- número de retry;
- intento técnico;
- `delivery_id`;
- `trace_id`;
- worker;
- hora de reenvío;
- replay técnico;
- nombre de archivo;
- procedencia de webhook frente a polling;
- cambio de adaptador sin cambio del hecho empresarial.

Una diferencia material no se resuelve sobrescribiendo el efecto anterior.

---

#### 12. Contrato mínimo de entrada hacia NUMERA

El handoff deberá permitir a NUMERA conservar o resolver, como mínimo:

| Grupo               | Información                                                         |
| ------------------- | ------------------------------------------------------------------- |
| evento              | `event_id`, definición, versión, proceso, productora, `occurred_at` |
| venta               | `sale_id`, revisión, estado comercial y referencias de líneas       |
| origen              | `source_system`, identidad externa cuando exista y procedencia      |
| organización        | entidad o referencias para resolverla, marca o unidad, sede         |
| dimensión económica | centro de costo o referencias autoritativas para resolverlo         |
| tercero             | referencia económica cuando exista o disposición aplicable          |
| moneda              | código de moneda o referencia autoritativa versionada               |
| montos              | importe y componentes monetarios con precisión y signo              |
| fiscalidad          | documento, estado o referencias disponibles bajo autoridad externa  |
| tiempo              | ocurrencia y referencias necesarias para reconocimiento             |
| correlación         | `correlation_id`, `causation_id` y referencias causales aplicables  |
| evidencia           | referencias protegidas a venta, evento, documentos y fuente         |
| efecto              | `effect_code`, identidad, huella y versión contractual              |

PULSO no transporta como autoridad NUMERA:

- `recognized_at` definitivo cuando la política NUMERA deba resolverlo;
- centro de costo inventado;
- entidad legal inferida;
- asiento contable;
- cuenta por cobrar;
- aplicación de pago;
- depósito;
- saldo bancario;
- costo calculado desde precio;
- margen definitivo;
- estado final de conciliación NUMERA.

---

#### 13. Venta nativa PULSO y venta con procedencia histórica externa

El contrato permanente tiene una sola frontera consumidora.

##### 13.1. Venta nativa PULSO

```text
source_system = PULSO
producer_application = PULSO
consumer_application = NUMERA
```

NUMERA recibe el evento canónico directamente desde la productora empresarial y no requiere información del adaptador externo para decidir su efecto.

##### 13.2. Venta con procedencia histórica externa

```text
source_system = MAKOS
producer_application = PULSO
consumer_application = NUMERA
```

La procedencia externa se conserva como evidencia histórica y de auditoría. NUMERA no consume directamente el proveedor como fuente de su ledger.

En ambos casos:

```text
MISMO EVENT ENVELOPE
+
MISMO CONSUMER_INBOX
+
MISMO CONSUMER_EFFECT
+
MISMO SALE_ECONOMIC_FACT
+
MISMAS REGLAS DE RESULTADO Y CONCILIACIÓN
```

---

#### 14. Entidad legal, marca, sede y centro de costo

Se preserva:

```text
ENTIDAD LEGAL
≠
MARCA
≠
SEDE
≠
CENTRO DE COSTO
≠
EMISOR FISCAL
```

Reglas:

1. una sede no define por sí sola la entidad legal;
2. una marca no define por sí sola la entidad legal;
3. terminal y caja no definen por sí solas centro de costo;
4. producto no define automáticamente centro de costo;
5. toda resolución organizacional material requiere fuente, versión y vigencia;
6. si una dimensión obligatoria no puede resolverse sin inferencia, el efecto no se marca `APPLIED`;
7. una dimensión pendiente se conserva como bloqueo o conciliación, no como valor predeterminado;
8. el modelo detallado de estas resoluciones permanece asignado a `NUMERA-DOM-002`.

---

#### 15. Tercero económico y consumidor final

Se preserva la posibilidad de venta a consumidor final sin cliente identificado.

Reglas:

1. NUMERA no crea un cliente artificial para registrar una venta válida;
2. cliente identificado no equivale automáticamente a deudor;
3. tercero económico no equivale a cuenta PASS;
4. ausencia de cliente no autoriza a crear un UUID ficticio;
5. la representación detallada del tercero pertenece al modelo NUMERA;
6. una cuenta por cobrar surge solo cuando el contrato de cartera aplicable lo determine;
7. el efecto de venta no crea automáticamente cartera.

---

#### 16. Moneda

La moneda es una dimensión obligatoria del hecho económico.

No:

```text
MONEDA AUSENTE
→
COP POR DEFAULT VISUAL
```

Una moneda puede resolverse mediante una fuente autoritativa versionada aunque no viaje como campo literal del evento, siempre que la resolución sea inequívoca y auditable.

Si la moneda no puede demostrarse, el efecto requiere conciliación en lugar de un importe aplicado con moneda supuesta.

El formato visual `es-CO` o `COP` de una pantalla existente no constituye por sí solo autoridad económica.

---

#### 17. Componentes monetarios

Los componentes se conservan separados cuando estén presentes o sean aplicables:

- subtotal o base comercial;
- descuentos;
- impuestos;
- propinas;
- venta bruta;
- venta neta;
- devoluciones;
- reembolsos;
- importes pagados;
- medios de pago;
- comisiones o cargos de canal.

Reglas:

1. un componente desconocido no se transforma automáticamente en cero;
2. impuesto observado no equivale a impuesto oficialmente declarado;
3. descuento no equivale automáticamente a gasto;
4. propina no equivale automáticamente a ingreso de Vento;
5. devolución no modifica destructivamente el original;
6. reembolso no equivale a devolución;
7. medio de pago no altera por sí solo el monto de la venta;
8. pago no demuestra depósito ni conciliación bancaria;
9. cada valor conserva moneda, precisión, signo, fuente y alcance cuando aplique;
10. fórmulas legacy de importación no se convierten en reglas financieras permanentes por coincidencia numérica.

---

#### 18. Granularidad económica

La unidad del efecto es una venta canónica económicamente reconocible:

```text
UNA VENTA ECONÓMICA
→
UN SALE_ECONOMIC_FACT POR EVENT_ID + EFFECT_CODE
→
CERO O MÁS LÍNEAS O COMPONENTES ECONÓMICOS
```

Queda prohibido crear una venta económica independiente por:

- fila agregada de archivo;
- línea comercial por defecto;
- producto;
- impuesto;
- medio de pago;
- delivery;
- retry;
- cambio de worker;
- fragmento técnico.

Las líneas se conservan como evidencia y detalle causal cuando el contrato las requiere.

---

#### 19. Mapping de producto, cuarentena y atribución económica

La puerta económica es independiente de la puerta física, pero no ignora datos bloqueados.

Para una línea con mapping o cuarentena pendiente:

1. la línea permanece visible;
2. no se inventa producto;
3. no se inventa presentación;
4. no se inventa receta;
5. no se inventa costo;
6. no se inventa categoría económica dependiente del producto;
7. no se inventa centro de costo dependiente de una regla ausente;
8. el importe global puede reconocerse únicamente si sus dimensiones obligatorias son demostrables sin ese dato pendiente;
9. cualquier atribución dependiente del producto permanece pendiente;
10. cualquier cálculo de costo o margen dependiente del producto permanece pendiente;
11. liberar la línea no genera un segundo ingreso;
12. un enriquecimiento posterior conserva el hecho original y usa un contrato NUMERA específico.

---

#### 20. Independencia de NEXO y PASS

Una misma emisión PULSO puede originar efectos independientes:

```text
PULSO EVENT
        ├── NEXO CONSUMER_EFFECT
        ├── NUMERA CONSUMER_EFFECT
        └── PASS CONSUMER_EFFECT
```

Reglas:

1. NUMERA no espera universalmente un resultado NEXO para reconocer ingreso;
2. NEXO no espera universalmente NUMERA para aplicar inventario;
3. PASS no prueba el hecho económico;
4. un fallo NEXO no borra un ingreso demostrable;
5. un fallo NUMERA no revierte la venta PULSO;
6. un fallo PASS no modifica NUMERA;
7. las diferencias permanecen abiertas a conciliación;
8. costo pendiente puede impedir rentabilidad completa sin invalidar el ingreso realizado.

---

#### 21. Venta, pago, caja, cartera y bancos

Se preserva:

```text
VENTA
≠
PAGO
≠
APLICACIÓN DE PAGO
≠
MOVIMIENTO DE CAJA
≠
CUENTA POR COBRAR
≠
DEPÓSITO
≠
MOVIMIENTO BANCARIO
≠
LIQUIDACIÓN DE PROVEEDOR
```

`SALE_ECONOMIC_FACT` puede conservar referencias a estos hechos, pero no los crea por inferencia.

Un pago conocido:

- no prueba aplicación a cartera;
- no prueba cierre de caja;
- no prueba depósito;
- no prueba conciliación bancaria.

Una venta sin un pago visible:

- no crea automáticamente una cuenta por cobrar;
- no se considera impagada por inferencia;
- conserva la relación con los objetos de pago que correspondan al proceso PULSO.

---

#### 22. Ingreso realizado, costo y rentabilidad

El efecto económico de venta puede establecer ingreso realizado cuando el contrato aplicable lo demuestre.

No determina automáticamente:

- costo de adquisición;
- landed cost;
- costo estándar;
- costo promedio;
- costo último;
- costo real;
- costo de producción;
- costo logístico;
- merma;
- costo interno;
- margen definitivo.

Por tanto:

```text
INGRESO REALIZADO DEMOSTRADO
+
COSTO TODAVÍA PENDIENTE
=
HECHO ECONÓMICO VÁLIDO
+
RENTABILIDAD INCOMPLETA
```

El costo se obtiene de sus fuentes propietarias y métodos versionados.

---

#### 23. Tiempos y reconocimiento

Se distinguen:

```text
occurred_at
≠
received_at
≠
recorded_at
≠
recognized_at
```

- `occurred_at`: momento empresarial del hecho descrito por PULSO;
- `received_at`: recepción técnica;
- `recorded_at`: persistencia técnica;
- `recognized_at`: fecha económica conforme a política NUMERA.

Reglas:

1. la redelivery no cambia `occurred_at`;
2. la redelivery no cambia por sí sola `recognized_at`;
3. `received_at` no decide el periodo económico;
4. un archivo tardío no cambia la fecha real de la venta;
5. una corrección no reescribe silenciosamente fechas originales;
6. política y periodos detallados permanecen asignados a `NUMERA-DOM-011`.

---

#### 24. Periodos cerrados y eventos tardíos

Cuando un evento válido llegue para un periodo cerrado o bloqueado:

- se conserva el evento original;
- se conserva su fecha empresarial;
- se conserva la fecha de recepción;
- se conserva el estado del periodo;
- no se cambia `occurred_at`;
- no se reabre el periodo por una acción técnica implícita;
- no se mueve el hecho a otro periodo solo para evitar el bloqueo;
- se registra la decisión económica que corresponda cuando la política exista;
- se conserva autoridad, correlación y evidencia.

La política detallada de cierre y reapertura pertenece a `NUMERA-DOM-011`.

---

#### 25. Atomicidad lógica del efecto

La implementación posterior deberá vincular atómicamente o con durabilidad equivalente:

- inbox;
- claim del efecto;
- identidad idempotente;
- huella;
- versiones esperadas;
- materialidad evaluada;
- creación o recuperación del hecho económico;
- resultado durable;
- referencias de auditoría;
- outbox o mecanismo equivalente cuando NUMERA emita un hecho posterior.

No es válido:

```text
HECHO ECONÓMICO CREADO
SIN RESULTADO RECUPERABLE
```

No es válido:

```text
APPLIED
SIN HECHO ECONÓMICO CORRELACIONADO
```

No es válido:

```text
RESPUESTA PERDIDA
→
SEGUNDO HECHO ECONÓMICO
```

Esta tarea no selecciona tablas, constraints, funciones, RPC, triggers, colas, workers o mecanismos físicos.

---

#### 26. Resultados idempotentes

Se reutiliza el vocabulario transversal:

- `APPLIED`;
- `DUPLICATE_RESULT_RETURNED`;
- `CONFLICTING_REUSE`;
- `IN_PROGRESS_RECOVERABLE`;
- `STALE_VERSION`;
- `OUT_OF_ORDER_DEFERRED`;
- `RECONCILIATION_REQUIRED`;
- `REJECTED`.

Interpretación:

1. `APPLIED` requiere un hecho económico durable;
2. `DUPLICATE_RESULT_RETURNED` recupera el resultado anterior sin repetir el hecho;
3. `CONFLICTING_REUSE` produce cero mutación nueva;
4. `IN_PROGRESS_RECOVERABLE` conserva la ejecución original;
5. `STALE_VERSION` impide degradar una versión posterior;
6. `OUT_OF_ORDER_DEFERRED` conserva la dependencia faltante;
7. `RECONCILIATION_REQUIRED` bloquea retry ciego;
8. `REJECTED` no se transforma en éxito económico.

---

#### 27. Retry y resultado desconocido

Ante timeout o desconexión después de una posible confirmación:

```text
RESULTADO DESCONOCIDO
        ↓
CONSULTAR INBOX + IDENTIDAD DEL EFECTO + HECHO ECONÓMICO
        ├── CONFIRMADO → RECUPERAR RESULTADO
        ├── NO APLICADO DEMOSTRADO → REINTENTAR MISMA IDENTIDAD
        └── INDETERMINADO → RECONCILIATION_REQUIRED
```

Reglas:

1. retry conserva `event_id`;
2. retry conserva `effect_code`;
3. retry conserva identidad y huella;
4. redelivery conserva `event_id`;
5. replay conserva `event_id`;
6. el intento técnico puede cambiar sin cambiar el hecho empresarial;
7. un lease vencido no demuestra ausencia de commit;
8. reiniciar cliente o worker no reinicia la identidad;
9. al agotar presupuesto se conserva la conciliación requerida;
10. un backfill no activa efectos financieros sensibles sin autorización específica.

---

#### 28. Versiones y orden

NUMERA no utiliza orden de entrega como sustituto de versión empresarial.

Reglas:

1. `aggregate_id + aggregate_version` gobiernan orden cuando corresponda;
2. una versión antigua tardía no sobrescribe un hecho posterior;
3. una versión futura con dependencia faltante puede quedar diferida;
4. `received_at` no se usa como last-write-wins;
5. una corrección de mapping no reescribe un monto reconocido;
6. una corrección material usa semántica causal propia;
7. una redelivery del mismo evento conserva la misma identidad.

---

#### 29. Anulaciones, devoluciones y reembolsos

El hecho original es inmutable como evidencia del reconocimiento ocurrido.

Queda prohibido representar un reverso mediante edición o eliminación silenciosa del original.

Cuando corresponda compensación económica:

1. se identifica venta original;
2. se identifica evento original;
3. se identifica `SALE_ECONOMIC_FACT` original;
4. se conserva motivo y evidencia;
5. se crea una acción inversa o correctiva propietaria;
6. la acción tiene identidad propia;
7. conserva monto, moneda, impuestos y referencias aplicables;
8. se aplica exactamente una vez;
9. no presume que NEXO o PASS ya fueron compensados;
10. conserva conciliación con el original.

La coordinación transversal de compensaciones permanece bajo el contrato ya aprobado y las tareas propietarias posteriores.

---

#### 30. Conciliación permanente PULSO–NUMERA

La conciliación deberá poder detectar, como mínimo:

- evento PULSO aplicable a NUMERA sin inbox;
- inbox sin decisión de materialidad;
- evento económicamente elegible sin `SALE_ECONOMIC_FACT`;
- hecho económico sin evento PULSO correlacionado;
- identidad repetida con huella incompatible;
- dos hechos económicos equivalentes;
- monto divergente;
- moneda divergente;
- entidad legal divergente;
- sede o centro de costo divergentes;
- tercero incompatible;
- impuesto divergente;
- documento ausente o incompatible cuando sea obligatorio;
- línea bloqueada omitida del expediente;
- producto o costo inventado desde una línea pendiente;
- ingreso duplicado después de liberar una línea;
- pago sin aplicación cuando corresponda;
- aplicación sin pago;
- caja o depósito sin correlación;
- ingreso realizado sin costo trazable cuando se pretenda rentabilidad;
- evento tardío contra periodo cerrado;
- reverso sin original;
- original que requiere compensación sin acción correlacionada;
- resultado desconocido agotado;
- evento fuera de orden;
- hecho NUMERA cuya procedencia o versión no pueda reconstruirse.

La conciliación no crea automáticamente el hecho faltante por inferencia ni modifica la venta PULSO.

---

#### 31. Replay, backfill y recuperación

##### 31.1. Replay

Un replay del mismo evento:

- conserva `event_id`;
- atraviesa el mismo inbox;
- conserva la identidad del efecto;
- recupera un resultado ya aplicado;
- no crea un segundo ingreso.

##### 31.2. Backfill

Un backfill autorizado:

- conserva procedencia;
- identifica lote o ventana;
- usa identidades deterministas;
- concilia contra inbox y hechos ya existentes;
- no ejecuta efectos financieros sensibles por defecto;
- requiere la autorización prevista para cualquier mutación económica.

##### 31.3. Recuperación

Una recuperación después de fallo:

- parte de la identidad original;
- consulta hechos y resultados previos;
- no convierte ausencia de respuesta en ausencia de commit;
- no utiliza un identificador técnico nuevo para crear otro efecto.

---

#### 32. Autorización, sensibilidad y auditoría

El contrato económico maneja información de sensibilidad financiera.

Toda materialización posterior deberá poder reconstruir, cuando aplique:

- principal técnico;
- actor efectivo;
- permiso o capacidad;
- evento y definición;
- venta y revisión;
- procedencia;
- inbox;
- identidad y huella del efecto;
- entidad legal;
- sede;
- centro de costo;
- tercero;
- moneda;
- importes;
- documento;
- fechas;
- intentos;
- resultado;
- periodo;
- conciliación;
- acción compensatoria;
- referencias de evidencia.

El evento transporta únicamente la proyección necesaria para la finalidad de NUMERA. Credenciales, secretos y datos no requeridos no forman parte del contrato económico.

---

#### 33. Diagnóstico de la línea base técnica observada

La línea base actual de NUMERA materializa una fundación económico-operativa útil, pero no demuestra todavía la recepción permanente definida en esta tarea.

La fundación observada incluye principalmente:

- periodos NUMERA;
- categorías de gasto;
- gastos;
- presupuestos por centro de costo;
- ingreso esperado;
- margen objetivo;
- vista mensual por centro;
- punto de equilibrio;
- resumen del periodo.

La superficie actual de rentabilidad consume:

```text
expected_revenue
actual_expenses
budget_amount
budget_variance
```

y se presenta como una lectura inicial de ingreso esperado, gasto real y variación por centro de costo.

La fundación declara expresamente que no es contabilidad formal.

La línea base observada no se eleva por sí sola a evidencia de:

```text
EVENT_EMISSION PULSO
+
CONSUMER_INBOX NUMERA
+
CONSUMER_EFFECT
+
SALE_ECONOMIC_FACT
+
RESULTADO RECUPERABLE
```

Esta tarea no modifica la fundación actual.

---

#### 34. Diferencia entre fundación económica existente y recepción canónica

```text
PRESUPUESTO / INGRESO ESPERADO / GASTO AGREGADO
≠
HECHO ECONÓMICO DE VENTA RECIBIDO DESDE PULSO
```

El contrato permanente exige adicionalmente:

- causalidad con venta PULSO;
- `event_id` estable;
- audiencia canónica;
- inbox NUMERA;
- puerta de materialidad;
- identidad `CONSUMER_EFFECT`;
- huella económica;
- dimensiones obligatorias;
- resultado durable;
- recuperación frente a respuesta perdida;
- control de versiones;
- periodo económico;
- compensación no destructiva;
- conciliación contra la fuente.

Una implementación posterior podrá reutilizar piezas de la fundación únicamente si demuestra estas invariantes.

---

#### 35. Frontera de implementación posterior

La materialización física deberá ocurrir dentro del paquete aprobado correspondiente y preservar como mínimo:

1. recepción versionada del evento;
2. inbox NUMERA durable;
3. claim atómico o mecanismo equivalente;
4. identidad del efecto;
5. huella económica;
6. materialidad;
7. resolución autoritativa de dimensiones;
8. hecho económico durable;
9. resultado recuperable;
10. tratamiento de concurrencia;
11. tratamiento de resultado desconocido;
12. eventos tardíos y periodos;
13. compensaciones;
14. conciliación;
15. autorización;
16. auditoría;
17. protección de datos financieros.

Esta tarea no decide esquema físico, nombres de tabla, índices, RLS, RPC, worker, broker, outbox o estrategia de despliegue.

Toda modificación futura de Supabase que materialice estas decisiones deberá pertenecer a `vento-shell`.

---

#### 36. Handoffs posteriores obligatorios

| Pendiente material                              | Tarea o propietario | Condición de salida                                                         |
| ----------------------------------------------- | ------------------- | --------------------------------------------------------------------------- |
| acumulación de fidelización por venta           | `INT-SALES-005`     | PASS aplica acumulación solo cuando exista identidad, regla y base elegible |
| procesamiento de redención                      | `INT-SALES-006`     | PASS separa redención de acumulación y de descuentos comerciales            |
| control transversal contra duplicados por retry | `INT-SALES-007`     | la cadena permanente demuestra recuperación sin duplicar efectos            |
| conciliación durante convivencia de fuentes     | `INT-SALES-008`     | ventas y efectos se reconcilian mientras convivan POS externo y PULSO       |
| corte de fuente                                 | `INT-SALES-009`     | sede, terminal y fecha efectiva determinan fuente única                     |
| prevención de doble emisión                     | `INT-SALES-010`     | dos fuentes no pueden emitir la misma venta como nueva                      |
| retiro del adaptador externo                    | `INT-SALES-011`     | consumidoras internas permanecen iguales sin dependencia del adaptador      |
| modelo detallado de hechos económicos de venta  | `NUMERA-DOM-002`    | tipos, campos, resoluciones y contratos internos de ventas quedan definidos |
| cierres y reapertura                            | `NUMERA-DOM-011`    | eventos tardíos tienen tratamiento financiero versionado                    |
| conciliación financiera detallada               | `NUMERA-DOM-014`    | diferencias económicas tienen expediente, decisión y resolución             |
| extensión hacia contabilidad formal             | `NUMERA-DOM-017`    | hechos económicos pueden mapearse a contabilidad sin escrituras cruzadas    |

Ningún pendiente material de esta tarea queda sin propietario y condición de salida.

---

#### 37. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea convierte en contrato permanente PULSO → NUMERA la misma frontera económica ya definida y protegida durante la transición: recepción por audiencia canónica, inbox independiente, materialidad económica, efecto idempotente exactamente una vez, dimensiones económicas obligatorias, separación de venta, pago, caja, fiscalidad, inventario, fidelización, costo y contabilidad, recuperación tras respuesta perdida, tratamiento de eventos tardíos, compensación no destructiva y conciliación. No introduce una obligación material nueva, un estado nuevo, un tipo de efecto nuevo, una consumidora nueva ni una excepción ejecutable nueva.

---

#### 38. Cobertura de prueba existente preservada

Se preserva sin modificación, en especial:

- `TREQ-NUMERA-001`, sobre conciliación de resultados financieros con hechos económicos y documentos fuente sin doble registro manual;
- `TREQ-NUMERA-002`, sobre identidad y dimensiones obligatorias de todo hecho económico, periodos separados y correcciones no destructivas;
- `TREQ-NUMERA-003`, sobre separación de cuenta, saldo, pago recibido y aplicación, además de cartera, caja, bancos y tesorería;
- `TREQ-NUMERA-004`, sobre ingreso realizado, costo trazable, métodos y rentabilidad;
- `TREQ-INTEGRATION-003`, sobre identidad estable, huella, resultado recuperable, concurrencia, retry y resultado desconocido;
- `TREQ-INTEGRATION-006`, sobre captura única en la propietaria y propagación por contratos sin doble digitación;
- `TREQ-INTEGRATION-014`, sobre venta, anulación o devolución con efectos aplicables exactamente una vez en NEXO, PASS y NUMERA durante la transición y continuidad posterior;
- `TREQ-INTEGRATION-017`, sobre llegada a NUMERA de hechos mediante contratos versionados, correlacionados e idempotentes, sin escritura cruzada ni doble registro.

Ninguna fila cambia de identidad, texto, estado, relación, propietario, evidencia ni secuencia por esta tarea.

---

#### 39. Decisiones congeladas

1. NUMERA consume eventos empresariales PULSO, no filas técnicas de importación.
2. PULSO continúa como productora empresarial para sus procesos comerciales.
3. NUMERA solo recibe cuando el registro transversal la declara consumidora aplicable.
4. `CONSUMER_INBOX = numera + event_id`.
5. Inbox y efecto permanecen separados.
6. `effect_code = SALE_ECONOMIC_FACT`.
7. `CONSUMER_EFFECT = numera + event_id + SALE_ECONOMIC_FACT`.
8. No se crea una definición normal de evento económico paralela.
9. Un evento recibido no implica ingreso aplicado.
10. La puerta de materialidad es obligatoria.
11. Eventos de apertura o preparación no producen ingreso realizado por defecto.
12. `VPROC-0038.EVT-005` y `VPROC-0039.EVT-005` pueden habilitar el efecto cuando el contrato esté completo.
13. `VPROC-0040.EVT-006` no se usa como fallback.
14. Legal entity, marca, sede y centro de costo son dimensiones distintas.
15. Cliente, tercero, deudor y cuenta PASS son identidades distintas.
16. Moneda debe demostrarse.
17. El formato COP de una interfaz no prueba moneda contractual.
18. Componentes monetarios no se fusionan.
19. Venta y pago permanecen separados.
20. Pago y aplicación permanecen separados.
21. Caja, depósito y banco permanecen separados.
22. Hecho económico y asiento permanecen separados.
23. Ingreso realizado y costo permanecen separados.
24. Costo pendiente puede dejar rentabilidad incompleta sin invalidar el ingreso.
25. Una línea bloqueada permanece visible.
26. Mapping pendiente no autoriza atribuciones económicas inventadas.
27. Liberar mapping no vuelve a reconocer ingreso.
28. NEXO, NUMERA y PASS son efectos independientes.
29. Retry conserva identidad y huella.
30. Respuesta perdida exige recuperación antes de repetir.
31. Reutilización incompatible produce conflicto.
32. Orden de entrega no sustituye versión.
33. `received_at` no define el periodo económico.
34. Periodo cerrado no autoriza descarte o backdating.
35. Reversos conservan el original.
36. Procedencia Makos y venta nativa PULSO usan la misma frontera NUMERA.
37. NUMERA no necesita el adaptador para consumir el contrato permanente.
38. La fundación técnica actual no se presenta como implementación de esta frontera.
39. La materialización física queda reservada a paquetes posteriores.
40. Se crean cero cambios `TREQ-*`.
41. No se genera una copia del registro canónico de requisitos.
42. No se modifica código, SQL, migraciones, RLS, RPC, datos, Supabase, credenciales ni configuración remota.

---

#### 40. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. mantiene `INT-SALES-003` como tarea anterior aprobada;
2. mantiene `INT-SALES-005` como única tarea siguiente reservada;
3. confirma PULSO como propietaria de venta y evento;
4. confirma NUMERA como propietaria del hecho económico;
5. preserva el registro transversal como autoridad de audiencia;
6. impide consumo universal por nombre de aplicación;
7. define el inbox NUMERA por `event_id`;
8. separa inbox de efecto;
9. conserva `SALE_ECONOMIC_FACT`;
10. adopta la identidad `numera + event_id + SALE_ECONOMIC_FACT`;
11. exige huella lógica económica;
12. garantiza deduplicación antes de la mutación;
13. garantiza un único ganador concurrente;
14. recupera resultado frente a respuesta perdida;
15. trata contenido incompatible como conflicto;
16. exige puerta de materialidad;
17. impide ingreso desde apertura, preparación o handoff por defecto;
18. conserva los hitos PULSO ya aprobados sin crear otro catálogo;
19. prohíbe usar pedido externo conciliado como fallback;
20. conserva entidad legal separada de marca;
21. conserva sede separada de centro de costo;
22. exige centro de costo resuelto por regla vigente;
23. preserva consumidor final sin cliente artificial;
24. separa tercero, deudor y cuenta PASS;
25. exige moneda demostrable;
26. prohíbe defaults silenciosos de moneda;
27. conserva subtotal, descuentos, impuestos y propinas según semántica fuente;
28. separa venta de pago;
29. separa pago de aplicación;
30. separa pago de caja y banco;
31. separa hecho económico de asiento;
32. separa ingreso realizado de costo;
33. mantiene la línea bloqueada dentro del expediente;
34. prohíbe atribución de producto o costo inventada;
35. evita segundo ingreso después de liberar mapping;
36. mantiene independencia de NEXO y PASS;
37. distingue `occurred_at`, `received_at`, `recorded_at` y `recognized_at`;
38. conserva eventos tardíos sin reescribir fechas;
39. trata periodos cerrados mediante política propietaria;
40. preserva el original ante anulaciones y devoluciones;
41. exige identidad propia para compensaciones;
42. permite reconstruir conciliación permanente PULSO–NUMERA;
43. conserva el mismo contrato para procedencia Makos y PULSO nativa;
44. impide dependencia del adaptador dentro de NUMERA;
45. diagnostica la fundación NUMERA actual sin declararla implementación suficiente;
46. asigna el modelo detallado a `NUMERA-DOM-002`;
47. asigna periodos y reapertura a `NUMERA-DOM-011`;
48. asigna conciliación detallada a `NUMERA-DOM-014`;
49. asigna contabilidad formal extensible a `NUMERA-DOM-017`;
50. mantiene `INT-SALES-005` como siguiente responsabilidad y no la desarrolla;
51. genera cero requisitos de prueba nuevos;
52. modifica cero requisitos de prueba;
53. no requiere una nueva copia del registro canónico de requisitos;
54. crea cero objetos físicos;
55. modifica cero objetos físicos;
56. no modifica código, SQL, migraciones, datos, Supabase, credenciales ni configuración remota.

---

#### 41. Resultado de la tarea

`INT-SALES-004` queda definida como la frontera permanente mediante la cual NUMERA recibe una emisión PULSO aplicable, deduplica su propio inbox, evalúa materialidad económica y materializa exactamente una vez el hecho económico de venta cuando el contrato obligatorio está completo.

Resultado consolidado:

```text
VENTA PULSO DURABLE
+
EVENTO PULSO APLICABLE A NUMERA
+
CONSUMER_INBOX
+
MATERIALIDAD ECONÓMICA
+
CONSUMER_EFFECT
+
SALE_ECONOMIC_FACT
+
RESULTADO RECUPERABLE
→
HECHO ECONÓMICO NUMERA EXACTAMENTE UNA VEZ
```

Sin reconstruir la venta, sin depender del adaptador externo, sin duplicar ingreso y sin convertir el hecho económico en pago, caja, documento fiscal, inventario, fidelización, costo o asiento contable.

---

#### 42. Continuidad

ÚLTIMA TAREA APROBADA

`INT-SALES-003 — Definir registro de salida de inventario en NEXO`

TAREA ACTUAL APROBADA

`INT-SALES-004 — Definir recepción del evento de venta en NUMERA`

SIGUIENTE TAREA RESERVADA

`INT-SALES-005 — Definir acumulación de puntos en PASS`


### ✅ INT-SALES-005 — Definir acumulación de puntos en PASS

**Estado:** APROBADA
**Tarea anterior:** `INT-SALES-004 — Definir recepción del evento de venta en NUMERA`
**Tarea siguiente:** `INT-SALES-006 — Definir procesamiento de redención en PASS`
**Tipo de tarea:** documental; definición normativa permanente de la acumulación de puntos que PASS puede aplicar a una venta canónica emitida por PULSO, preservando identidad de cliente y cuenta de fidelización, regla versionada, elegibilidad, base calculable, cuarentena, inbox, efecto idempotente, guarda de dominio cuenta+venta, ledger inmutable, saldo derivado, resultado recuperable, retry, eventos tardíos, compensación y conciliación, sin implementar tablas, RPC, funciones, triggers, colas, migraciones, Supabase ni cambios de código
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/07_VENTAS_INVENTARIO_FINANZAS_Y_FIDELIZACION.md`
**Aplicación propietaria de la venta y del evento comercial:** `PULSO`
**Aplicación propietaria de fidelización:** `PASS`
**Proceso PASS reutilizado:** `VPROC-0045 — Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados`
**Efecto de acumulación reutilizado:** `LOYALTY_POINTS_ACCRUAL`
**Línea base documental:** `vento-shell@114eb87abdc9e5494af2c503a657bf19add9f457`
**Línea base PULSO observada:** `vento-pulso@71e0184486b5fe11e0a42435baf4024807a80efd`
**Línea base PASS observada:** `vento-pass@b5a4aec908ef12226f798078577ab089a29ccda2`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma permanente cuándo una venta canónica ya registrada y emitida por PULSO puede producir una acumulación de puntos en PASS y cómo esa acumulación queda aplicada exactamente una vez, sin convertir toda venta en puntos por defecto, sin permitir que PULSO fije saldo de fidelización y sin depender del adaptador del POS externo.

Regla raíz:

```text
VENTA DURABLE PULSO
        ↓
EVENTO EMPRESARIAL PULSO + EVENT_ID ESTABLE
        ↓
AUDIENCIA CANÓNICA CONFIRMA QUE PASS APLICA
        ↓
CONSUMER_INBOX PASS
        ↓
RESOLUCIÓN DE CLIENTE Y CUENTA PASS
        ↓
REGLA PASS VERSIONADA APLICABLE
        ↓
BASE ELEGIBLE DEMOSTRABLE
        ↓
DECISIÓN PASS
        ├── NO_APLICA
        ├── BLOQUEADO / CONCILIACIÓN
        └── ACUMULACIÓN ELEGIBLE
                    ↓
            CONSUMER_EFFECT
                    ↓
            LOYALTY_POINTS_ACCRUAL
                    ↓
            LEDGER PASS INMUTABLE
                    ↓
            SALDO DERIVADO
                    ↓
            RESULTADO DURABLE Y RECUPERABLE
```

No:

```text
VENTA = PUNTOS
```

No:

```text
PULSO → UPDATE DEL SALDO PASS
```

No:

```text
DESCUENTO / PROPINA / PAGO = REDENCIÓN
```

---

#### 2. Resultado sustantivo

`INT-SALES-005` deja definido el contrato permanente PULSO → PASS para acumulación mediante las siguientes decisiones:

1. PULSO conserva la venta, sus líneas, sus revisiones y el evento empresarial.
2. PASS conserva identidad de fidelización, cuenta, reglas, ledger, saldo, recompensas, acumulaciones, ajustes, reversos y redenciones.
3. La recepción de un evento PULSO no concede puntos automáticamente.
4. PASS solo recibe como consumidora cuando la relación vigente del registro transversal la incluye para la definición concreta.
5. PASS evalúa elegibilidad dentro de su propia frontera.
6. Una venta válida sin cuenta PASS inequívoca continúa siendo una venta válida y produce cero acumulación automática.
7. `customer_id` comercial y `loyalty_account_id` permanecen separados.
8. Correo, teléfono, nombre, documento parcial, coincidencia aproximada o contacto aislado no autorizan fusión ni selección automática de cuenta.
9. Una cuenta PASS debe resolverse de forma inequívoca antes de aplicar el movimiento.
10. La política de fidelización es versionada y reproducible.
11. La regla aplicable se resuelve por el momento empresarial y el contexto del hecho, no por la regla activa al momento de un retry tardío.
12. La regla define base, exclusiones, fórmula, redondeo, prioridad, stacking, mínimos, máximos, caps y tratamiento de reversos.
13. No existe una fórmula universal `puntos = total de venta`.
14. No se usa `net_sales_amount` legacy como base universal.
15. No se usa el monto pagado como base universal.
16. Una regla dependiente de producto no usa una línea en cuarentena como si estuviera resuelta.
17. Una regla independiente del producto puede evaluarse cuando toda su base requerida sea demostrable sin omitir líneas ni importes.
18. La acumulación utiliza `CONSUMER_INBOX = pass + event_id`.
19. La acumulación utiliza `CONSUMER_EFFECT = pass + event_id + LOYALTY_POINTS_ACCRUAL`.
20. PASS conserva además una guarda de dominio `loyalty_account_id + canonical_sale_id + ACCUMULATION`.
21. La guarda de dominio impide que dos eventos legítimos del mismo ciclo comercial acrediten dos veces la misma compra.
22. La versión de regla participa en la huella lógica, no en la identidad de la acumulación.
23. Cambiar de regla después de aplicar no habilita una segunda acumulación silenciosa.
24. El ledger PASS es la fuente de verdad del movimiento.
25. El saldo es una proyección derivada y reconciliable del ledger.
26. Un delta de acumulación ordinaria debe ser positivo y distinto de cero.
27. Cero puntos calculados no crean un movimiento ficticio.
28. Retry, redelivery y replay recuperan el resultado previo cuando el mismo efecto ya fue aplicado.
29. Una respuesta perdida obliga a consultar la identidad original antes de repetir.
30. La reutilización de la misma identidad con contenido material incompatible produce conflicto.
31. Una revisión comercial posterior no reescribe un movimiento ya aplicado.
32. Anulaciones, devoluciones y correcciones conservan el movimiento original y usan ajuste, reversión o compensación append-only cuando corresponda.
33. Una venta que nunca acumuló no genera un reverso ficticio.
34. La redención es una operación distinta y permanece reservada a `INT-SALES-006`.
35. Un descuento, propina, medio de pago, importe negativo o texto comercial no se convierte en redención PASS.
36. El éxito de NEXO o NUMERA no prueba el éxito de PASS.
37. El éxito de PASS no prueba inventario ni hecho económico.
38. El contrato PASS permanece igual para una venta histórica de procedencia Makos y una venta nativa PULSO.
39. PASS no necesita conocer credenciales, polling, staging, archivos ni lifecycle del adaptador para acumular puntos sobre una venta nativa PULSO.
40. El retiro posterior del adaptador no modifica identidades ni movimientos PASS históricos.
41. `VPROC-0045` continúa como proceso propietario de la interacción de fidelización.
42. No se crea una definición normal de evento nueva.
43. Se preservan las seis definiciones normales `VPROC-0045.EVT-001` a `VPROC-0045.EVT-006`.
44. La materialización física del contrato queda asignada a las tareas y paquetes posteriores ya existentes.
45. Se crean cero requisitos `TREQ-*`.
46. Se modifican cero requisitos `TREQ-*`.
47. Se crean cero objetos físicos.
48. Se modifican cero objetos físicos.

---

#### 3. Base canónica preservada

Esta tarea consume sin reabrir:

- `INT-SALES-001`, para venta y líneas durables en PULSO;
- `INT-SALES-002`, para la emisión permanente desde PULSO;
- `INT-SALES-003`, para la independencia del efecto físico NEXO;
- `INT-SALES-004`, para la independencia del efecto económico NUMERA;
- `INT-POS-018`, para la puerta de fidelización, identidad de cuenta, regla versionada, base, efecto, ledger y saldo definidos durante la transición;
- `INT-POS-019`, para compensación no destructiva;
- `INT-POS-020`, para conciliación entre venta y efectos;
- `INT-POS-023` y `INT-POS-024`, para cambio de fuente y retiro de dependencia de credenciales externas;
- `INT-APP-001` a `INT-APP-010`, para catálogo, productoras, consumidoras, sobre, idempotencia, retry, auditoría, compensación, error parcial y prohibición de escrituras cruzadas;
- `ENTERPRISE-EVENT-CATALOG-001`;
- `ENTERPRISE-EVENT-PRODUCER-REGISTRY-001`;
- `ENTERPRISE-EVENT-CONSUMER-REGISTRY-001`;
- `EVENT-ENVELOPE-001`;
- `ENTERPRISE-EVENT-IDEMPOTENCY-REGISTRY-001@1.0.0`;
- `ENTERPRISE-EVENT-RETRY-POLICY-001@1.0.0`;
- `VPROC-0045`;
- el registro canónico vigente de requisitos de prueba.

La corrección documental vigente de `INT-POS-018` se adopta expresamente:

- correlación evento–cuenta–movimiento de acumulación → `PASS-INT-001`;
- idempotencia detallada de acumulación → `PASS-INT-001`;
- reversión o compensación de acumulación → `PASS-INT-001`;
- conciliación de acumulación → `PASS-INT-001`;
- verificación integral del flujo de acumulación → `PASS-QA-001`;
- redención → `PASS-INT-002`;
- el mini-bloque PASS vigente conserva exactamente `PASS-INT-001` a `PASS-INT-005`, y `PASS-INT-003`, `PASS-INT-004` y `PASS-INT-005` mantienen sus significados documentados sin absorber estas responsabilidades.

---

#### 4. Propiedad empresarial permanente

| Elemento                  | Propietaria o autoridad          | Regla                                           |
| ------------------------- | -------------------------------- | ----------------------------------------------- |
| venta y líneas            | `PULSO`                          | conserva el hecho comercial                     |
| evento comercial          | `PULSO`                          | describe un hecho durable ya confirmado         |
| audiencia                 | registro transversal             | decide si PASS recibe la definición concreta    |
| inbox PASS                | `PASS`                           | reconoce una sola vez cada `event_id` aplicable |
| identidad de fidelización | `PASS`                           | resuelve persona, cuenta y vínculos autorizados |
| regla de puntos           | `PASS`                           | versionada, vigente y reproducible              |
| base elegible             | `PASS`                           | se calcula desde la venta conforme a la regla   |
| acumulación               | `PASS`                           | efecto propio e idempotente                     |
| ledger de puntos          | `PASS`                           | fuente de verdad de movimientos                 |
| saldo                     | `PASS`                           | proyección derivada                             |
| redención                 | `PASS`                           | operación distinta reservada a `INT-SALES-006`  |
| inventario                | `NEXO`                           | efecto físico independiente                     |
| hecho económico           | `NUMERA`                         | efecto económico independiente                  |
| venta histórica externa   | Makos como procedencia histórica | no tiene autoridad sobre el ledger PASS         |

Invariante:

```text
PULSO AFIRMA LA VENTA
PASS DECIDE LA FIDELIZACIÓN
PASS REGISTRA EL MOVIMIENTO
PASS DERIVA EL SALDO
```

---

#### 5. Aplicabilidad de PASS como consumidora

PASS no es consumidora universal de todos los eventos PULSO.

Para cada emisión se resuelve:

```text
event_definition_id
+
process_id
+
producer_application = pulso
+
consumer_application = pass
+
consumer_relation
+
condition_ref cuando aplique
+
projection_profile
+
finalidad
```

Reglas:

1. solo una relación vigente y aplicable habilita la recepción;
2. una relación `CONDITIONAL` falla cerrada cuando su condición no puede demostrarse;
3. PULSO no mantiene una lista paralela que fuerce a PASS como consumidora;
4. la ausencia de PASS en la audiencia no se compensa con una escritura directa;
5. presencia en la audiencia autoriza recepción y evaluación, no acumulación automática;
6. cada definición conserva su hecho confirmado, versión, finalidad y sensibilidad.

---

#### 6. Hitos comerciales candidatos para evaluación

Para ventas ordinarias, los hitos de cierre ya aprobados continúan como candidatos primarios:

| Definición           | Hecho confirmado           | Tratamiento                                          |
| -------------------- | -------------------------- | ---------------------------------------------------- |
| `VPROC-0038.EVT-005` | servicio de mesa cerrado   | puede iniciar evaluación PASS si la regla lo permite |
| `VPROC-0039.EVT-005` | venta de mostrador cerrada | puede iniciar evaluación PASS si la regla lo permite |

Reglas:

1. `VPROC-0038.EVT-001` a `EVT-004` no acreditan puntos por defecto;
2. `VPROC-0039.EVT-001` a `EVT-004` no acreditan puntos por defecto;
3. un evento de pago puede aportar evidencia sin crear otra acumulación;
4. un evento de cambio comercial puede exigir reevaluación o conciliación sin volver a acreditar la compra;
5. un pedido externo no acredita puntos solo por provenir de un canal externo;
6. otra definición solo habilita acumulación cuando su hecho confirmado y la regla PASS lo permitan expresamente;
7. una misma venta no acumula nuevamente porque otro proceso relacionado emita un evento posterior.

---

#### 7. Matriz de decisión de acumulación

| Condición                                                               | Decisión PASS                         | Efecto                                      |
| ----------------------------------------------------------------------- | ------------------------------------- | ------------------------------------------- |
| venta válida + cuenta PASS inequívoca + regla aplicable + base completa | elegible                              | puede materializar `LOYALTY_POINTS_ACCRUAL` |
| venta válida sin cuenta PASS aplicable                                  | `NO_APLICA`                           | cero movimiento                             |
| cliente declarado con vínculo ambiguo                                   | `BLOQUEADO`                           | cero movimiento hasta resolver identidad    |
| cuenta no elegible o inactiva                                           | `NO_APLICA` o `BLOQUEADO` según causa | cero movimiento                             |
| no existe regla aplicable                                               | `NO_APLICA`                           | cero movimiento                             |
| falta un dato obligatorio de una regla aplicable                        | `BLOQUEADO`                           | cero movimiento y conciliación              |
| regla depende de producto y una línea requerida está en cuarentena      | `BLOQUEADO` para el alcance afectado  | cero puntos derivados del dato desconocido  |
| regla independiente del producto con base demostrable                   | elegible                              | la cuarentena física no bloquea por sí sola |
| acumulación ya aplicada para cuenta + venta                             | resultado previo                      | cero movimiento adicional                   |
| misma identidad con huella incompatible                                 | conflicto                             | cero movimiento adicional                   |
| venta anulada o devuelta después de acumular                            | compensación pendiente                | original inmutable                          |
| descuento, propina o pago sin regla aplicable                           | `NO_APLICA`                           | no se convierten en puntos                  |
| redención PASS explícita ya autorizada                                  | correlación                           | no se vuelve a ejecutar desde acumulación   |

---

#### 8. Identidad comercial, persona y cuenta PASS

Se preserva:

```text
CUSTOMER_ID COMERCIAL
≠
PERSONA
≠
CUENTA AUTENTICADA
≠
LOYALTY_ACCOUNT_ID
≠
CONTACTO
≠
CONSENTIMIENTO
```

Reglas:

1. una venta a consumidor final puede existir sin cuenta PASS;
2. una venta sin cuenta PASS no crea un cliente artificial;
3. correo, teléfono o nombre coincidentes no fusionan identidades;
4. un documento parcial no autoriza vinculación automática;
5. un QR solo identifica cuenta cuando el contrato PASS lo valida;
6. PASS resuelve atributos protegidos desde su propia fuente;
7. una relación ambigua bloquea acumulación;
8. el saldo nunca se acepta como autoridad desde PULSO;
9. la acumulación no concede consentimiento publicitario;
10. identidad cliente y trabajador permanecen separadas.

---

#### 9. Vinculación posterior de una venta anónima

Se conserva:

```text
VINCULAR HISTORIA
≠
ACREDITAR PUNTOS RETROACTIVOS
```

Reglas:

1. la venta conserva su identidad original;
2. un vínculo posterior no duplica la venta;
3. crear o vincular una cuenta después no produce acumulación automática;
4. cualquier acumulación retroactiva requiere política PASS versionada que la autorice;
5. la operación, evidencia y límites de esa capacidad deberán quedar definidos en `PASS-INT-001` antes de su implementación;
6. un ajuste manual no sustituye una política retroactiva.

---

#### 10. Regla de fidelización versionada

La regla aplicada debe poder reconstruirse históricamente.

Como mínimo conserva:

- `rule_id`;
- versión;
- vigencia;
- tipo de cálculo;
- valor o fórmula;
- elegibilidad;
- alcance;
- sedes;
- canales;
- productos, categorías o segmentos cuando correspondan;
- ventanas temporales;
- prioridad;
- stacking;
- exclusiones;
- mínimo;
- máximo;
- caps;
- redondeo;
- tratamiento de devoluciones y reversos;
- política offline cuando corresponda.

Invariante:

```text
MISMAS ENTRADAS
+
MISMA VERSIÓN DE REGLA
=
MISMO RESULTADO
```

La versión de regla utilizada por un hecho histórico no se sustituye por la versión vigente hoy.

---

#### 11. Momento de selección de regla

Se distinguen:

```text
occurred_at
≠
received_at
≠
recorded_at
≠
evaluated_at
```

La vigencia de la regla se resuelve contra el momento empresarial y la política PASS aplicable.

No:

```text
RETRY TARDÍO
→
REGLA ACTIVA HOY
```

Un evento tardío conserva el hecho original y su contexto histórico.

---

#### 12. Base elegible

La base de puntos proviene de la regla PASS y del contrato comercial.

La regla puede distinguir, según su versión:

- subtotal;
- descuentos;
- impuestos;
- propinas;
- devoluciones;
- líneas excluidas;
- categorías;
- productos;
- sede;
- canal;
- segmento;
- beneficios utilizados.

Queda prohibido asumir universalmente:

```text
PUNTOS = TOTAL DE VENTA
```

```text
PUNTOS = NET_SALES_AMOUNT LEGACY
```

```text
PUNTOS = MONTO PAGADO
```

Si un componente necesario es desconocido, no se inventa cero ni se sustituye por otro importe.

---

#### 13. Descuento, propina, pago y redención

Se preserva:

```text
DESCUENTO ≠ PUNTOS
PROPINA ≠ PUNTOS
PAGO ≠ PUNTOS
ACUMULACIÓN ≠ REDENCIÓN
```

Reglas:

1. descuento comercial no prueba uso de puntos;
2. propina no prueba puntos acumulables;
3. medio de pago no prueba fidelización;
4. importe negativo no prueba redención;
5. línea promocional no prueba regla PASS;
6. una redención requiere identidad PASS propia;
7. una referencia explícita de redención puede correlacionarse con la venta;
8. la acumulación no vuelve a ejecutar una redención ya autorizada.

---

#### 14. Cuarentena y reglas dependientes de producto

Una línea con mapping pendiente permanece visible.

Cuando la regla depende de producto, presentación, categoría, receta, familia u otra dimensión pendiente:

- no se inventa producto;
- no se aproxima por nombre;
- no se reclasifica por conveniencia;
- no se elimina la línea;
- no se transforma el bloqueo en exclusión.

Reglas:

1. una línea bloqueada no desaparece de la base;
2. una regla por línea no puede completar el cálculo con una dimensión requerida desconocida;
3. partialidad solo procede cuando la regla la define de forma reproducible;
4. una regla independiente del producto puede continuar si la base completa requerida está demostrada;
5. liberar una línea no crea automáticamente puntos;
6. si la acumulación ya fue aplicada legítimamente sin depender de ese producto, la liberación no crea otra;
7. si el efecto estaba bloqueado, se reevalúa conservando la misma identidad de venta.

---

#### 15. Partialidad de base

Una acumulación parcial solo procede cuando la regla permite separar de forma determinista:

```text
BASE TOTAL CONSIDERADA
=
BASE ELEGIBLE
+
BASE EXCLUIDA
+
BASE BLOQUEADA
```

Reglas:

1. la base bloqueada no desaparece;
2. un componente ya acreditado no se acredita otra vez al resolver el residual;
3. cada componente conserva venta y regla causales;
4. el resultado conserva residual pendiente;
5. no se declara conciliación completa si el residual puede cambiar materialmente el derecho total;
6. un complemento posterior utiliza el contrato incremental o compensatorio definido por PASS;
7. `PASS-INT-001` cierra la cardinalidad física de movimientos y componentes.

---

#### 16. Inbox permanente de PASS

La identidad de recepción es:

```text
CONSUMER_INBOX
=
pass + event_id
```

Reglas:

1. la primera entrega aplicable crea o recupera el reconocimiento durable;
2. redelivery exacta recupera el mismo inbox;
3. `delivery_id`, `attempt_id`, worker, batch o archivo no sustituyen `event_id`;
4. el inbox no acredita puntos;
5. el inbox puede terminar en evaluación, bloqueo, no aplicación, conflicto o conciliación;
6. el resultado de NEXO o NUMERA no completa el inbox PASS.

---

#### 17. Identidad transversal del efecto

El efecto es:

```text
effect_code = LOYALTY_POINTS_ACCRUAL
```

La identidad transversal es:

```text
CONSUMER_EFFECT
=
pass + event_id + LOYALTY_POINTS_ACCRUAL
```

Reglas:

1. se fija antes de cualquier mutación del ledger;
2. retry conserva `event_id`;
3. redelivery conserva `event_id`;
4. replay conserva `event_id`;
5. la misma identidad y huella compatible recuperan el resultado;
6. la misma identidad con huella incompatible produce conflicto;
7. dos ejecuciones concurrentes tienen un solo ganador;
8. una respuesta perdida no crea otro efecto;
9. `sale_id` no sustituye esta identidad;
10. el movimiento de ledger resultante tampoco sustituye la identidad del efecto.

---

#### 18. Guarda de dominio cuenta + venta

La clave transversal protege el mismo evento, pero una venta puede producir varios eventos legítimos.

PASS conserva además:

```text
loyalty_account_id
+
canonical_sale_id
+
ACCUMULATION
```

Dentro del alcance actual representa una sola acumulación ordinaria por cuenta y venta.

Consecuencias:

1. un evento de cierre puede originar la primera acumulación;
2. un evento posterior de pago no origina otra;
3. un evento posterior de conciliación no origina otra;
4. un cambio comercial no origina otra por simple reevaluación;
5. webhook, polling, replay o redelivery no crean otra compra;
6. otra cuenta intentando reclamar una venta ya acreditada produce conflicto o conciliación;
7. la versión de regla no forma parte de la identidad;
8. modificar la regla después no habilita otra acumulación;
9. cualquier futuro soporte de programas de puntos independientes deberá versionar esta identidad en `PASS-INT-001` antes de implementación.

---

#### 19. Huella lógica de acumulación

La huella debe incluir, cuando corresponda:

- venta y revisión;
- evento causal;
- definición y versión;
- cliente;
- cuenta PASS;
- regla y versión;
- sede;
- canal;
- momento empresarial;
- moneda cuando la regla la requiera;
- base total considerada;
- base elegible;
- base excluida;
- base bloqueada;
- productos o categorías cuando la regla dependa de ellos;
- fórmula;
- redondeo;
- caps;
- puntos calculados;
- referencias de evidencia.

No cambia únicamente por:

- retry count;
- redelivery;
- worker;
- `attempt_id`;
- `delivery_id`;
- `trace_id`;
- hora técnica;
- webhook frente a polling;
- archivo o número de fila;
- retiro del adaptador externo.

---

#### 20. Resultado propietario y ledger PASS

Cuando la acumulación se aplica, PASS produce un resultado durable que permite reconstruir:

- `loyalty_account_id`;
- `canonical_sale_id`;
- `event_id` causal;
- identidad del efecto;
- operación de acumulación;
- movimiento o movimientos del ledger;
- regla y versión;
- delta de puntos;
- saldo anterior;
- saldo posterior;
- sede;
- canal;
- momento;
- principal técnico o actor aplicable;
- correlación;
- estado de conciliación;
- referencias de evidencia.

Invariante:

```text
MOVIMIENTO DE LEDGER
→
FUENTE DE VERDAD

SALDO
→
PROYECCIÓN DERIVADA
```

Queda prohibido tratar una actualización aislada de saldo como sustituto del movimiento causal.

---

#### 21. Delta y saldo

Para acumulación ordinaria:

1. delta aplicado > 0;
2. delta cero no genera un movimiento ficticio;
3. saldo anterior se obtiene desde PASS dentro de la frontera propietaria;
4. saldo posterior se deriva de la mutación confirmada;
5. PULSO no envía ambos saldos como autoridad;
6. un ajuste posterior conserva el movimiento original;
7. saldo no se usa como fuente primaria para reconstruir un retry.

Ajustes negativos, reversos, expiraciones y redenciones conservan semánticas propias.

---

#### 22. Atomicidad lógica

La implementación posterior deberá vincular atómicamente o con durabilidad equivalente:

- inbox;
- identidad del efecto;
- guarda cuenta + venta;
- huella;
- revisión comercial;
- cuenta PASS;
- regla y versión;
- evaluación de base;
- resultado de elegibilidad;
- movimiento o movimientos del ledger;
- actualización derivada del saldo;
- resultado recuperable;
- referencias de auditoría;
- evento PASS posterior cuando corresponda.

No es válido:

```text
PUNTOS APLICADOS
SIN MOVIMIENTO RECUPERABLE
```

No es válido:

```text
MOVIMIENTO CREADO
SIN GUARDA DE DOMINIO
```

No es válido:

```text
RESPUESTA PERDIDA
→
SEGUNDA ACUMULACIÓN
```

Esta tarea no selecciona tablas, constraints, RPC, funciones, triggers, workers o mecanismos físicos.

---

#### 23. Proceso propietario `VPROC-0045`

PASS conserva:

- `VPROC-0045.EVT-001` — interacción de fidelización abierta;
- `VPROC-0045.EVT-002` — identidad en validación;
- `VPROC-0045.EVT-003` — autorización de acción pendiente;
- `VPROC-0045.EVT-004` — actualización de consentimiento pendiente;
- `VPROC-0045.EVT-005` — conciliación pendiente;
- `VPROC-0045.EVT-006` — interacción de fidelización conciliada.

Reglas:

1. la recepción de la venta no implica emitir todas las definiciones;
2. `EVT-001` no modifica saldo;
3. `EVT-002` no acredita una cuenta elegible;
4. `EVT-003` no equivale al efecto final;
5. `EVT-004` solo aplica a un cambio real de consentimiento;
6. `EVT-005` conserva divergencias pendientes;
7. `EVT-006` solo puede afirmar conciliación cuando el resultado propietario quedó aplicado una vez o cerrado de forma válida;
8. los eventos PASS son producidos por PASS;
9. el evento PULSO causal no se reutiliza como un evento PASS nuevo.

---

#### 24. No aplicación y bloqueo

`NO_APLICA` y `BLOQUEADO` son decisiones diferentes.

Ejemplos de `NO_APLICA`:

- consumidor final sin cuenta PASS;
- cuenta no elegible;
- regla inexistente para el contexto;
- fórmula legítimamente produce cero;
- canal fuera de alcance.

Ejemplos de `BLOQUEADO`:

- cliente ambiguo;
- dos cuentas candidatas;
- versión de regla no resoluble;
- base monetaria ambigua;
- componente obligatorio desconocido;
- línea en cuarentena requerida por la regla;
- revisión de venta incompatible;
- resultado anterior incierto;
- misma venta ya asociada a otra cuenta con un efecto aplicado.

Un bloqueo no se convierte en no aplicación para ocultar evidencia faltante.

---

#### 25. Resultados idempotentes

Se reutiliza el vocabulario transversal:

- `APPLIED`;
- `DUPLICATE_RESULT_RETURNED`;
- `CONFLICTING_REUSE`;
- `IN_PROGRESS_RECOVERABLE`;
- `STALE_VERSION`;
- `OUT_OF_ORDER_DEFERRED`;
- `RECONCILIATION_REQUIRED`;
- `REJECTED`.

Interpretación:

1. `APPLIED` exige movimiento PASS durable;
2. `DUPLICATE_RESULT_RETURNED` devuelve el resultado anterior sin otra acumulación;
3. `CONFLICTING_REUSE` crea cero movimiento;
4. `IN_PROGRESS_RECOVERABLE` conserva el claim original;
5. `STALE_VERSION` no desplaza una revisión posterior;
6. `OUT_OF_ORDER_DEFERRED` conserva la dependencia ausente;
7. `RECONCILIATION_REQUIRED` bloquea retry ciego;
8. `REJECTED` no se convierte en puntos concedidos.

---

#### 26. Retry, concurrencia y resultado desconocido

Ante timeout o desconexión después de una posible confirmación:

```text
RESULTADO DESCONOCIDO
        ↓
CONSULTAR INBOX + EFECTO + GUARDA CUENTA/VENTA + LEDGER
        ├── CONFIRMADO → RECUPERAR RESULTADO
        ├── NO APLICADO DEMOSTRADO → REINTENTAR MISMA IDENTIDAD
        └── INDETERMINADO → RECONCILIATION_REQUIRED
```

Reglas:

1. retry conserva identidades y huella;
2. claim vencido no demuestra ausencia de commit;
3. restart no reinicia la identidad;
4. redelivery no duplica puntos;
5. replay histórico no duplica puntos;
6. otro evento de la misma venta consulta primero la guarda de dominio;
7. incompatibilidad produce conflicto;
8. agotamiento de presupuesto abre conciliación;
9. no se acreditan puntos por inferencia ante incertidumbre.

`INT-SALES-007` especializará el control transversal contra efectos duplicados por reintento sin modificar estas invariantes.

---

#### 27. Orden y revisiones

Antes de la primera acumulación:

- PASS utiliza la revisión comercial válida que satisface la puerta;
- una revisión antigua no desplaza una revisión posterior;
- eventos fuera de orden pueden diferirse.

Después de una acumulación:

- cambio de importe, líneas, cliente o regla material no reescribe el ledger;
- un cambio que altera el derecho de puntos requiere acción incremental, correctiva o compensatoria;
- el original permanece;
- la identidad ya aplicada no se reutiliza con contenido incompatible.

---

#### 28. Anulaciones, devoluciones y compensación

Una anulación o devolución no elimina la acumulación original.

Cuando el efecto original existió:

```text
MOVIMIENTO ORIGINAL
        ↓
HECHO INVERSO O CORRECTIVO
        ↓
MOVIMIENTO COMPENSATORIO PASS
        ↓
SALDO DERIVADO ACTUALIZADO
```

Reglas:

1. el compensatorio referencia el movimiento original;
2. conserva venta, evento, motivo y autoridad;
3. tiene identidad idempotente propia;
4. no se ejecuta dos veces;
5. no presume que NEXO o NUMERA ya compensaron;
6. devolución parcial afecta únicamente la porción demostrable conforme a la política histórica aplicable;
7. una venta sin acumulación original no genera reverso ficticio;
8. `PASS-INT-001` cierra el contrato detallado de ajuste, corrección, reversión y compensación de acumulación;
9. el movimiento original permanece append-only.

---

#### 29. Redención queda fuera del alcance

La redención permanece separada:

```text
LOYALTY_POINTS_ACCRUAL
≠
LOYALTY_POINTS_REDEMPTION
```

Esta tarea no:

- reserva puntos para canje;
- valida recompensa;
- consume saldo;
- autoriza una redención;
- confirma una redención;
- interpreta un descuento como redención;
- implementa atomicidad de canje.

El procesamiento permanente de redención corresponde exclusivamente a `INT-SALES-006`, con integración detallada en `PASS-INT-002`.

---

#### 30. Independencia de NEXO y NUMERA

Una misma venta puede originar efectos independientes:

```text
PULSO EVENT
        ├── NEXO CONSUMER_EFFECT
        ├── NUMERA CONSUMER_EFFECT
        └── PASS CONSUMER_EFFECT
```

Reglas:

1. PASS no requiere éxito universal NEXO para acumular;
2. PASS no requiere éxito universal NUMERA para acumular;
3. NEXO no usa puntos como prueba física;
4. NUMERA no usa puntos como prueba económica;
5. un fallo PASS no revierte la venta PULSO;
6. diferencias permanecen conciliables.

La regla PASS puede depender de hechos concretos expresamente definidos, pero nunca del mero éxito técnico de otra consumidora.

---

#### 31. Venta nativa PULSO y procedencia histórica Makos

Durante historia transicional:

```text
source_system = MAKOS
producer_application = PULSO
consumer_application = PASS
```

Para venta nativa:

```text
source_system = PULSO
producer_application = PULSO
consumer_application = PASS
```

En ambos casos:

```text
MISMA AUDIENCIA CANÓNICA
+
MISMO INBOX PASS
+
MISMA PUERTA DE IDENTIDAD
+
MISMA REGLA PASS
+
MISMO CONSUMER_EFFECT
+
MISMA GUARDA CUENTA + VENTA
+
MISMO LEDGER
+
MISMO RESULTADO
```

La procedencia se conserva para auditoría, pero no cambia la semántica de acumulación.

---

#### 32. Independencia del adaptador externo

Una venta nativa PULSO no requiere para fidelización:

- API Makos;
- archivo Makos;
- webhook Makos;
- polling Makos;
- credencial Makos;
- staging externo;
- hash de archivo externo;
- mapping externo inexistente para una venta nativa.

PASS consume el evento PULSO y sus referencias canónicas autorizadas.

El retiro del adaptador:

- no cambia el inbox;
- no cambia el effect code;
- no cambia la guarda cuenta + venta;
- no cambia movimientos históricos;
- no convierte procedencia histórica en procedencia PULSO.

---

#### 33. Privacidad, consentimiento y sensibilidad

La proyección hacia PASS se minimiza a lo necesario para:

- resolver cuenta;
- evaluar la regla;
- calcular la base;
- aplicar el movimiento;
- auditar;
- conciliar.

Reglas:

1. credenciales y secretos no viajan en el evento;
2. PII no necesaria se conserva por referencia protegida;
3. acumular puntos no concede consentimiento de marketing;
4. retirar consentimiento comercial no borra movimientos legítimos del ledger;
5. identidad de fidelización no concede permisos laborales;
6. `VPROC-0045` conserva sensibilidad `RESTRICTED_PERSONAL`;
7. toda mutación posterior se reautoriza en la frontera PASS.

---

#### 34. Auditoría mínima

Cada acumulación deberá poder reconstruir lógicamente:

- venta;
- revisión;
- evento PULSO;
- definición y versión;
- fuente real;
- cuenta PASS;
- fundamento de identidad;
- regla y versión;
- base;
- componentes elegibles, excluidos y bloqueados;
- fórmula;
- redondeo;
- caps;
- puntos calculados;
- inbox;
- identidad del efecto;
- guarda cuenta + venta;
- huella;
- movimiento de ledger;
- saldo anterior y posterior;
- actor o principal;
- correlación;
- intentos;
- resultado;
- compensación cuando exista;
- estado de conciliación;
- referencias de evidencia.

La auditoría no sustituye el ledger ni concede autoridad para mutarlo.

---

#### 35. Conciliación permanente PULSO–PASS

La conciliación deberá detectar como mínimo:

- evento PULSO aplicable a PASS sin inbox;
- inbox sin decisión de fidelización;
- venta elegible sin acumulación;
- puntos sin venta;
- misma venta acreditada dos veces;
- mismo evento aplicado dos veces;
- cuenta incorrecta;
- cliente ambiguo resuelto incorrectamente;
- regla o versión incorrecta;
- base elegible divergente;
- puntos calculados divergentes;
- línea bloqueada usada por una regla dependiente de producto;
- línea liberada con efecto pendiente;
- no aplicación usada para ocultar un bloqueo;
- saldo divergente del ledger;
- movimiento sin proyección de saldo correcta;
- saldo sin movimientos suficientes;
- acumulación sin guarda cuenta + venta;
- respuesta desconocida;
- evento tardío que intentó otra acumulación;
- reverso sin original;
- original que requiere compensación y no la tiene;
- redención inferida desde descuento;
- divergencia entre procedencia histórica y venta canónica;
- dependencia residual del adaptador externo en una venta nativa PULSO.

La conciliación no corrige puntos editando el saldo.

---

#### 36. Replay, backfill y recuperación

##### 36.1. Replay

Un replay del mismo evento:

- conserva `event_id`;
- atraviesa el mismo inbox;
- consulta la misma guarda cuenta + venta;
- recupera el efecto previo;
- no crea otra acumulación.

##### 36.2. Backfill

Un backfill autorizado:

- conserva procedencia;
- identifica lote o ventana;
- utiliza identidades deterministas;
- concilia contra ventas, inbox, guardas y ledger existentes;
- no acredita puntos sensibles por defecto;
- requiere la autorización prevista por PASS para cualquier mutación.

##### 36.3. Recuperación

Una recuperación después de fallo:

- parte de la identidad original;
- consulta movimientos y resultados previos;
- no interpreta ausencia de respuesta como ausencia de commit;
- no usa un identificador técnico nuevo para conceder puntos otra vez.

---

#### 37. Diagnóstico de la línea base técnica observada

La línea base `vento-pass@b5a4aec908ef12226f798078577ab089a29ccda2` demuestra superficies reales de fidelización, pero no acredita todavía la implementación permanente definida en esta tarea.

Se observan, entre otras piezas:

- lectura del historial desde `loyalty_transactions`;
- representación de movimientos con `kind`, `points_delta`, descripción, metadata y timestamp;
- una utilidad de recompensa por Google Reviews que consulta `loyalty_transactions`;
- esa utilidad realiza actualmente un insert directo en `loyalty_transactions` desde código cliente y después actualiza datos del usuario.

Estas piezas demuestran existencia de ledger y funcionalidades de fidelización, pero no constituyen por sí solas evidencia de:

```text
EVENTO DE VENTA PULSO
+
CONSUMER_INBOX PASS
+
LOYALTY_POINTS_ACCRUAL
+
GUARDA ACCOUNT + SALE
+
REGLA HISTÓRICA DE VENTA
+
ATOMICIDAD LEDGER + SALDO
+
RESULTADO RECUPERABLE
```

La mutación cliente observada tampoco se adopta como patrón para acumulación de ventas. La cobertura canónica vigente exige contratos de servidor autorizados, atómicos e idempotentes para mutaciones de puntos.

Esta tarea no modifica la implementación existente.

---

#### 38. Diferencia entre fidelización existente y acumulación canónica de venta

```text
LEDGER O RECOMPENSA EXISTENTE
≠
ACUMULACIÓN PERMANENTE DESDE VENTA PULSO
```

La acumulación permanente exige además:

- venta canónica;
- `event_id` estable;
- audiencia;
- inbox;
- cuenta inequívoca;
- regla histórica;
- base reproducible;
- identity effect;
- guarda cuenta + venta;
- huella;
- atomicidad;
- resultado durable;
- recuperación ante respuesta perdida;
- compensación;
- conciliación.

Una implementación posterior puede reutilizar piezas actuales únicamente si demuestra todas estas invariantes.

---

#### 39. Frontera de implementación posterior

La materialización física debe conservar como mínimo:

1. recepción versionada del evento;
2. inbox PASS;
3. resolución autorizada de cuenta;
4. regla y versión;
5. base elegible;
6. identidad de efecto;
7. guarda cuenta + venta;
8. huella;
9. claim atómico o mecanismo equivalente;
10. ledger inmutable;
11. saldo derivado;
12. resultado recuperable;
13. concurrencia;
14. resultado desconocido;
15. compensación;
16. conciliación;
17. auditoría;
18. privacidad y autorización.

`PASS-INT-001` cerrará la integración detallada PULSO → PASS para acumulación, incluyendo operación propietaria, cardinalidad de movimientos, correlación, idempotencia, compensación y conciliación.

`PASS-QA-001` verificará integralmente el flujo de acumulación.

Toda modificación futura de Supabase que materialice estas decisiones pertenece a `vento-shell`.

---

#### 40. Handoffs posteriores obligatorios

| Pendiente material                                  | Tarea o propietario | Condición de salida                                                                                    |
| --------------------------------------------------- | ------------------- | ------------------------------------------------------------------------------------------------------ |
| procesamiento permanente de redención               | `INT-SALES-006`     | redención explícita usa identidad PASS, saldo y resultado propios                                      |
| especialización contra efectos duplicados por retry | `INT-SALES-007`     | retries de venta y consumidoras convergen sin doble efecto                                             |
| conciliación durante convivencia de fuentes         | `INT-SALES-008`     | diferencias Makos/PULSO y efectos PASS quedan detectables                                              |
| corte por sede, terminal y fecha                    | `INT-SALES-009`     | nuevas ventas tienen fuente única resoluble                                                            |
| guardia contra doble fuente                         | `INT-SALES-010`     | una venta no se emite como nueva desde ambas fuentes                                                   |
| retiro del adaptador externo                        | `INT-SALES-011`     | PASS continúa consumiendo sin dependencia del adaptador                                                |
| integración detallada de acumulación                | `PASS-INT-001`      | contrato servidor, movimiento, correlación, idempotencia, compensación y conciliación quedan definidos |
| integración detallada de redención                  | `PASS-INT-002`      | redención queda atómica, autorizada e idempotente                                                      |
| administración laboral de productos de fidelización | `PASS-INT-003`      | conserva su significado vigente sin absorber acumulación                                               |
| administración laboral de clientes                  | `PASS-INT-004`      | conserva su significado vigente sin absorber idempotencia de acumulación                               |
| separación cliente/trabajador                       | `PASS-INT-005`      | identidad laboral y de cliente no se mezclan                                                           |
| prueba integral de acumulación                      | `PASS-QA-001`       | acumulación completa, retry, no aplicación, bloqueo, compensación y conciliación quedan verificadas    |
| prueba integral de redención                        | `PASS-QA-002`       | canje completo queda verificado después de su contrato                                                 |
| protección de acumulación                           | `PULSO-AUTH-009`    | la capacidad visible o ejecutable usa únicamente el contrato autorizado                                |

Ningún pendiente material queda sin propietario y condición de salida.

---

#### 41. Prohibiciones

Queda prohibido:

1. acreditar puntos por toda venta de forma automática;
2. permitir que PULSO escriba directamente el saldo PASS;
3. permitir que PULSO inserte movimientos privados PASS;
4. tratar recepción como acumulación;
5. tratar entrega técnica como movimiento;
6. usar `sale_id` como única clave transversal del efecto;
7. eliminar la guarda cuenta + venta;
8. generar una identidad nueva por retry;
9. generar una identidad nueva por redelivery;
10. generar una acumulación nueva por replay;
11. usar la regla vigente actual para recalcular silenciosamente una venta histórica;
12. asumir una base universal de total, neto legacy o monto pagado;
13. inventar un componente monetario requerido;
14. omitir una línea bloqueada;
15. clasificar una línea bloqueada como excluida por conveniencia;
16. fusionar cuentas por coincidencia aproximada de contacto;
17. inventar una cuenta para consumidor final;
18. aceptar un saldo enviado por PULSO como verdad PASS;
19. crear movimientos de acumulación con delta cero;
20. editar destructivamente un movimiento aplicado;
21. restar puntos directamente para representar una devolución;
22. inferir una redención desde un descuento;
23. inferir una redención desde una propina;
24. inferir una redención desde un medio de pago;
25. usar éxito NEXO como prueba de PASS;
26. usar éxito NUMERA como prueba de PASS;
27. usar éxito PASS como prueba NEXO o NUMERA;
28. volver a acreditar una venta al liberar un mapping cuando ya se aplicó legítimamente;
29. asumir que timeout significa que no hubo movimiento;
30. usar saldo como sustituto del ledger durante recuperación;
31. backfillear puntos sensibles sin autorización;
32. exigir API, archivo o credencial Makos para una venta nativa PULSO;
33. cambiar movimientos históricos por retiro del adaptador;
34. crear una definición normal de evento llamada acumulación de venta por conveniencia;
35. asignar correlación de acumulación a `PASS-INT-003`;
36. asignar idempotencia de acumulación a `PASS-INT-004`;
37. ampliar el mini-bloque PASS con identificadores o responsabilidades no definidos por su fuente propietaria vigente;
38. modificar código, SQL, migraciones, RLS, RPC, datos, Supabase, credenciales o configuración remota desde esta tarea documental;
39. iniciar o desarrollar `INT-SALES-006`.

---

#### 42. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el registro vigente ya protege expresamente que acumulación, gasto, ajuste, reversión y redención de puntos se ejecuten mediante contratos de servidor autorizados, atómicos e idempotentes; que la fidelización use ledger inmutable con evento origen, regla y versión; que el saldo sea derivado; que los reintentos no dupliquen puntos; que ventas, anulaciones y devoluciones produzcan exactamente una vez los efectos aplicables en PASS durante y después de la transición; y que la conciliación detecte puntos sin venta, efectos duplicados y compensaciones incompletas. `INT-SALES-005` convierte en contrato permanente de ventas PULSO la frontera de acumulación ya protegida, sin introducir una obligación material nueva.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

---

#### 43. Cobertura de prueba existente preservada

Se preserva sin modificación, en especial:

- `TREQ-PASS-008`, para acumulación, gasto, ajuste, reversión y redención mediante contratos de servidor autorizados, atómicos e idempotentes, sin insert del ledger ni fijación de saldo por el cliente;
- `TREQ-PASS-010`, para identidad cliente, cuenta, consentimientos, ledger inmutable, evento origen, regla, versión, saldo derivado y ausencia de duplicación por retry;
- `TREQ-PASS-011`, para separar devolución, reembolso, compensación, cortesía, cupón y puntos;
- `TREQ-INTEGRATION-003`, para identidad estable, huella, resultado recuperable, concurrencia, retry y resultado desconocido;
- `TREQ-INTEGRATION-014`, para convergencia POS externo/PULSO, efecto PASS exactamente una vez y no duplicación de puntos;
- `TREQ-INTEGRATION-015`, para contratos canónicos de cliente, compensación y fidelización, no duplicación y conciliación.

Ninguna fila cambia de identidad, texto, estado, relación, propietaria, evidencia ni secuencia por esta tarea.

---

#### 44. Decisiones congeladas

1. PASS es la única propietaria del ledger y saldo de fidelización.
2. PULSO conserva venta y evento.
3. Audiencia no significa puntos automáticos.
4. Cuenta PASS debe ser inequívoca.
5. Consumidor final sin cuenta válida produce cero acumulación automática.
6. Contacto no equivale a cuenta.
7. Regla PASS es versionada.
8. Regla histórica no se sustituye por regla vigente actual.
9. Base de puntos pertenece a la regla.
10. No existe fórmula universal basada en total de venta.
11. Descuento, propina y pago no son puntos.
12. Acumulación y redención permanecen separadas.
13. Cuarentena permanece visible.
14. Regla dependiente de producto bloquea el alcance que necesite un mapping ausente.
15. `CONSUMER_INBOX = pass + event_id`.
16. `effect_code = LOYALTY_POINTS_ACCRUAL`.
17. `CONSUMER_EFFECT = pass + event_id + LOYALTY_POINTS_ACCRUAL`.
18. PASS conserva `loyalty_account_id + canonical_sale_id + ACCUMULATION`.
19. Versión de regla pertenece a la huella, no a la identidad.
20. Ledger es fuente de verdad.
21. Saldo es proyección.
22. Delta cero no crea acumulación.
23. Retry recupera resultado.
24. Respuesta perdida exige indagación.
25. Reutilización incompatible produce conflicto.
26. Revisión posterior no reescribe ledger.
27. Reversión y compensación son append-only.
28. Venta sin acumulación original no produce reverso ficticio.
29. NEXO, NUMERA y PASS conservan efectos independientes.
30. Procedencia Makos y venta nativa PULSO usan la misma puerta PASS.
31. Venta nativa no depende del adaptador Makos.
32. `VPROC-0045` conserva sus seis definiciones normales.
33. No se crea una definición normal nueva.
34. `PASS-INT-001` conserva correlación, idempotencia, reversión/compensación y conciliación de acumulación.
35. `PASS-QA-001` verifica integralmente la acumulación.
36. `PASS-INT-002` conserva la redención.
37. `PASS-INT-003/004/005` conservan sus significados vigentes.
38. El mini-bloque PASS se mantiene limitado a `PASS-INT-001` a `PASS-INT-005` conforme a su fuente propietaria vigente.
39. La implementación física actual no se presenta como cumplimiento del contrato permanente.
40. Se crean cero cambios `TREQ-*`.
41. No se genera una copia del registro canónico de requisitos.
42. Se crean cero objetos físicos.
43. Se modifican cero objetos físicos.
44. No se modifica código, SQL, migraciones, datos, Supabase, credenciales ni configuración remota.

---

#### 45. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. conserva `INT-SALES-004` como tarea anterior;
2. conserva `INT-SALES-006` como única siguiente tarea reservada;
3. mantiene PULSO como propietaria de venta y evento;
4. mantiene PASS como propietaria de fidelización;
5. deriva aplicabilidad desde el registro transversal;
6. impide puntos automáticos por mera recepción;
7. exige cuenta PASS inequívoca;
8. permite venta sin cuenta y sin cliente artificial;
9. separa contacto, persona, cuenta y consentimiento;
10. exige regla PASS versionada;
11. exige selección histórica correcta de regla;
12. impide recalcular con la regla vigente por retry tardío;
13. delega fórmula y base a la regla;
14. prohíbe base universal por total, neto legacy o monto pagado;
15. separa descuento, propina, pago, acumulación y redención;
16. conserva cuarentena;
17. bloquea el alcance dependiente de producto no resuelto;
18. permite reglas independientes del producto solo con base completa demostrable;
19. define partialidad de forma reproducible;
20. define `CONSUMER_INBOX = pass + event_id`;
21. define `LOYALTY_POINTS_ACCRUAL`;
22. define `CONSUMER_EFFECT = pass + event_id + LOYALTY_POINTS_ACCRUAL`;
23. añade guarda `loyalty_account_id + canonical_sale_id + ACCUMULATION`;
24. mantiene versión de regla en la huella;
25. impide doble acumulación por eventos diferentes de una misma venta;
26. exige ledger inmutable;
27. mantiene saldo derivado;
28. impide movimiento con delta cero;
29. exige atomicidad o durabilidad equivalente;
30. reutiliza `VPROC-0045`;
31. conserva sus seis definiciones normales;
32. separa no aplicación de bloqueo;
33. reutiliza resultados idempotentes transversales;
34. recupera resultados frente a respuesta perdida;
35. impide retry ciego tras posible commit;
36. conserva orden y revisiones;
37. mantiene el original ante devolución;
38. exige compensación append-only;
39. mantiene redención fuera del alcance;
40. mantiene independencia de NEXO y NUMERA;
41. conserva el mismo contrato para procedencia Makos y PULSO nativa;
42. elimina dependencia del adaptador para venta nativa;
43. conserva privacidad y consentimiento separados de fidelización;
44. define auditoría reconstruible;
45. define conciliación permanente PULSO–PASS;
46. conserva replay y backfill sin doble acumulación;
47. diagnostica la implementación actual sin declararla suficiente;
48. no adopta el insert cliente observado como patrón de acumulación de ventas;
49. asigna integración detallada de acumulación a `PASS-INT-001`;
50. asigna prueba integral a `PASS-QA-001`;
51. conserva redención en `PASS-INT-002`;
52. conserva `PASS-INT-003/004/005` con sus significados vigentes;
53. conserva el mini-bloque PASS vigente sin crear identificadores adicionales;
54. asigna retry permanente a `INT-SALES-007`;
55. asigna convivencia y corte a `INT-SALES-008` a `INT-SALES-011`;
56. genera cero requisitos de prueba nuevos;
57. modifica cero requisitos de prueba;
58. no genera una copia del registro canónico de requisitos;
59. crea cero objetos físicos;
60. modifica cero objetos físicos;
61. no modifica código, SQL, migraciones, Supabase, datos, credenciales ni configuración remota;
62. no inicia ni desarrolla `INT-SALES-006`.

---

#### 46. Resultado de la tarea

`INT-SALES-005` queda definida como la frontera permanente que convierte una emisión PULSO aplicable a PASS en una evaluación de fidelización y, cuando venta, cuenta, regla y base son elegibles, en una única acumulación durable y recuperable dentro del ledger PASS.

Resultado consolidado:

```text
VENTA PULSO DURABLE
+
EVENTO PULSO APLICABLE A PASS
+
CUENTA PASS INEQUÍVOCA
+
REGLA VERSIONADA
+
BASE ELEGIBLE DEMOSTRABLE
+
CONSUMER_INBOX
+
CONSUMER_EFFECT
+
GUARDA CUENTA + VENTA
+
LEDGER INMUTABLE
+
SALDO DERIVADO
+
RESULTADO RECUPERABLE
→
ACUMULACIÓN PASS EXACTAMENTE UNA VEZ
```

Sin depender del POS externo para ventas nativas, sin mutación cruzada desde PULSO, sin duplicación por retry y sin confundir acumulación con redención.

---

#### 47. Continuidad

ÚLTIMA TAREA APROBADA

`INT-SALES-004 — Definir recepción del evento de venta en NUMERA`

TAREA ACTUAL APROBADA

`INT-SALES-005 — Definir acumulación de puntos en PASS`

SIGUIENTE TAREA RESERVADA

`INT-SALES-006 — Definir procesamiento de redención en PASS`


### ✅ INT-SALES-006 — Definir procesamiento de redención en PASS

**Estado:** APROBADA
**Tarea anterior:** `INT-SALES-005 — Definir acumulación de puntos en PASS`
**Tarea siguiente:** `INT-SALES-007 — Definir control contra efectos duplicados por reintento`
**Tipo de tarea:** documental; definición normativa permanente del procesamiento de redención en PASS y de la frontera PULSO → PASS que solicita y confirma su consumo, preservando identidad propietaria de redención, cuenta de fidelización, recompensa y costo versionado, saldo disponible, autoridad por sede y actor, comando propietario idempotente, protección contra doble gasto, ledger inmutable, resultado recuperable, cancelación, compensación, conciliación y separación estricta frente a acumulación, descuento, pago y venta, sin implementar tablas, RPC, funciones, triggers, colas, migraciones, Supabase ni cambios de código
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/07_VENTAS_INVENTARIO_FINANZAS_Y_FIDELIZACION.md`
**Aplicación propietaria de la venta y operación POS:** `PULSO`
**Aplicación propietaria de la redención y del ledger de fidelización:** `PASS`
**Proceso PASS reutilizado:** `VPROC-0045 — Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados`
**Familia de interacción transversal reutilizada:** `OWNER_COMMAND`
**Alcance de idempotencia transversal reutilizado:** `OWNER_COMMAND`
**Identidad propietaria de dominio reutilizada:** `redemption_id`
**Línea base documental:** `vento-shell@0727d0e163c7aa6ac20d5addd883a872203e0db3`
**Línea base PULSO observada:** `vento-pulso@71e0184486b5fe11e0a42435baf4024807a80efd`
**Línea base PASS observada:** `vento-pass@b5a4aec908ef12226f798078577ab089a29ccda2`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma permanente cómo una redención de fidelización perteneciente a PASS puede ser solicitada, autorizada, presentada en PULSO, confirmada y conciliada exactamente una vez, sin convertir una venta, un descuento, un pago, un QR o un cambio de estado técnico en autoridad para gastar puntos.

Regla raíz:

```text
CUENTA PASS
        ↓
RECOMPENSA / BENEFICIO PASS APLICABLE
        ↓
SOLICITUD DE REDENCIÓN
        ↓
PASS VALIDA CUENTA + REGLA + COSTO + SALDO + VIGENCIA + SEDE
        ↓
REDENCIÓN PASS CON IDENTIDAD ESTABLE
        ↓
PUNTOS QUEDAN PROTEGIDOS CONTRA DOBLE GASTO
        ↓
REFERENCIA O TOKEN PRESENTABLE EN PULSO
        ↓
PULSO REVALIDA ACTOR + SEDE + CONTEXTO
        ↓
OWNER_COMMAND PULSO → PASS
        ↓
PASS RECUPERA O CONFIRMA LA MISMA REDENCIÓN
        ↓
CONSUMO EXACTAMENTE UNA VEZ
        ↓
LEDGER / RESULTADO PASS DURABLE
        ↓
CORRELACIÓN CON PEDIDO O VENTA CUANDO APLIQUE
        ↓
CONCILIACIÓN
```

Nunca:

```text
QR = REDENCIÓN
```

Nunca:

```text
DESCUENTO = REDENCIÓN PASS
```

Nunca:

```text
VENTA = GASTO DE PUNTOS
```

Nunca:

```text
PULSO → UPDATE DIRECTO DE TABLAS PASS
```

---

#### 2. Resultado sustantivo

`INT-SALES-006` deja definido el contrato permanente de redención mediante las siguientes decisiones:

1. PASS es la única propietaria de la redención, la cuenta de fidelización, las recompensas, las reglas, el ledger y el saldo derivado.
2. PULSO puede presentar, solicitar o confirmar el uso de una redención, pero no crea por autoridad propia el gasto de puntos.
3. Una redención debe existir como operación PASS real antes de poder consumirse como beneficio de fidelización.
4. La identidad empresarial de la redención es estable y no se sustituye por QR, código visible, pedido, venta, intento técnico, timestamp o worker.
5. `redemption_id` es la referencia propietaria que debe conservarse de extremo a extremo.
6. El QR, token o código de presentación es un instrumento de localización o autorización limitada y no la identidad de negocio.
7. PULSO solicita a PASS una mutación mediante la familia transversal `OWNER_COMMAND`.
8. El comando conserva `source_command_id` estable durante retry, timeout, refresh o reenvío.
9. PASS revalida la mutación dentro de su propia frontera antes de confirmar cualquier consumo.
10. Una misma redención solo puede producir un consumo confirmado.
11. Dos comandos diferentes que intenten consumir la misma redención no producen dos gastos; solo uno puede ganar cuando la operación sea válida.
12. La creación o autorización de una redención debe impedir que los mismos puntos respalden simultáneamente otra redención incompatible.
13. La representación física de esa protección puede cerrarse después, pero nunca puede existir una ventana válida de doble gasto.
14. Si la protección se materializa mediante un gasto ya confirmado en ledger, la validación posterior en PULSO no vuelve a gastar los puntos.
15. Si la protección se materializa mediante una reserva autoritativa, la confirmación convierte esa reserva en un único gasto sin duplicarla.
16. La elección física entre reserva y gasto anticipado corresponde al contrato detallado de PASS, pero el resultado empresarial debe ser equivalente respecto de no doble gasto, trazabilidad y recuperación.
17. Una cancelación previa al consumo libera o compensa únicamente lo que haya sido realmente protegido o debitado.
18. Una redención ya consumida no se revierte mediante edición destructiva del movimiento original.
19. Una compensación posterior usa un hecho separado, identidad propia y relación explícita con la redención original.
20. La recompensa o beneficio se revalida por identidad, vigencia, sede, estado y regla aplicable.
21. El costo en puntos utilizado por la redención queda históricamente trazable y no se recalcula silenciosamente con el valor vigente al momento de un retry.
22. El saldo disponible se resuelve en PASS; PULSO no envía el saldo como autoridad.
23. La cuenta PASS se resuelve en PASS y no se infiere desde nombre, teléfono, correo, pedido o QR no validado.
24. Una redención no puede quedar aplicada a una cuenta distinta de la que la autorizó sin una operación de corrección explícita.
25. La validación en PULSO exige autoridad de actor, sede, estado y contexto operativo.
26. La validación exitosa de un token no sustituye la confirmación propietaria de PASS.
27. Un descuento comercial no demuestra redención.
28. Una propina no demuestra redención.
29. Un medio de pago no demuestra redención.
30. Un importe negativo no demuestra redención.
31. Un código promocional no demuestra redención PASS salvo que el contrato PASS aplicable lo declare expresamente.
32. Una venta puede referenciar una redención ya confirmada, pero esa referencia no vuelve a ejecutar el gasto.
33. Acumulación y redención conservan identidades, reglas y resultados independientes.
34. Una misma venta puede acumular puntos y usar una redención únicamente si cada operación satisface su propio contrato; ninguna implica la otra.
35. El resultado de NEXO o NUMERA no confirma la redención.
36. El resultado PASS no confirma inventario, pago ni hecho económico.
37. Retry y respuesta perdida se resuelven consultando primero la operación original.
38. El resultado desconocido no autoriza crear una segunda redención ni volver a gastar puntos.
39. Replay técnico conserva la identidad original y no vuelve a consumir la redención.
40. Backfill no ejecuta gastos de puntos por defecto.
41. Procedencia histórica Makos o venta nativa PULSO no cambia la propiedad de la redención.
42. PASS no necesita el adaptador Makos para validar o consumir una redención en el contrato permanente.
43. El retiro futuro del adaptador no modifica redenciones ni movimientos históricos.
44. `VPROC-0045` continúa como proceso propietario de la interacción de fidelización.
45. No se crea una definición normal de evento adicional por esta tarea.
46. Se crean cero requisitos `TREQ-*`.
47. Se modifican cero requisitos `TREQ-*`.
48. Se crean cero objetos físicos.
49. Se modifican cero objetos físicos.

---

#### 3. Base canónica preservada

Esta tarea consume sin reabrir:

- `INT-SALES-001`, para venta y líneas durables en PULSO;
- `INT-SALES-002`, para emisión permanente de hechos comerciales PULSO;
- `INT-SALES-003`, para independencia del efecto físico NEXO;
- `INT-SALES-004`, para independencia del hecho económico NUMERA;
- `INT-SALES-005`, para propiedad PASS, cuenta, regla, ledger, saldo, acumulación y separación estricta de redención;
- `INT-POS-018`, para la decisión aprobada de que una redención debe resolver una identidad PASS real, revalidar saldo no expirado, recompensa, vigencia, sede, regla y límites y operar de forma atómica e idempotente;
- `INT-POS-019`, para compensaciones no destructivas de efectos confirmados durante la transición;
- `INT-POS-020`, para conciliación de venta y efectos;
- `INT-APP-004`, para los alcances `REQUEST_ACCEPTANCE`, `OWNER_COMMAND`, `CONSUMER_INBOX`, `CONSUMER_EFFECT` y sus reglas de identidad;
- `INT-APP-005`, para retry y resultado desconocido;
- `INT-APP-006`, para compensación;
- `INT-APP-007`, para auditoría;
- `INT-APP-008`, para estados de sincronización y recuperación;
- `INT-APP-009`, para parcialidad;
- `INT-APP-010`, para prohibición de escrituras cruzadas sin contrato;
- `PASS-INT-002`, como responsabilidad posterior de integración detallada PULSO → PASS para redención;
- `PASS-QA-002`, como responsabilidad posterior de prueba integral de redención;
- `PULSO-AUTH-010`, como responsabilidad posterior de protección de redenciones en PULSO;
- el registro canónico vigente de requisitos de prueba.

No se redefine la acumulación aprobada en `INT-SALES-005`.

---

#### 4. Propiedad empresarial permanente

| Elemento                         | Propietaria o autoridad                    | Regla                                               |
| -------------------------------- | ------------------------------------------ | --------------------------------------------------- |
| venta y pedido                   | `PULSO`                                    | conserva el hecho comercial y el contexto POS       |
| cuenta de fidelización           | `PASS`                                     | resuelve titularidad y elegibilidad                 |
| recompensa o beneficio           | `PASS`                                     | define identidad, vigencia, costo y alcance         |
| redención                        | `PASS`                                     | conserva identidad, estado, resultado y correlación |
| ledger de puntos                 | `PASS`                                     | fuente de verdad de gastos y compensaciones         |
| saldo de puntos                  | `PASS`                                     | proyección derivada del ledger                      |
| solicitud de consumo en terminal | `PULSO`                                    | usa un contrato hacia la propietaria PASS           |
| autorización de actor POS        | `PULSO` y contrato de autorización vigente | revalida actor, sede y capacidad                    |
| aceptación del consumo           | `PASS`                                     | única confirmación empresarial del gasto            |
| correlación con pedido o venta   | ambas mediante contrato                    | no transfiere propiedad                             |
| inventario                       | `NEXO`                                     | efecto físico separado                              |
| hecho económico                  | `NUMERA`                                   | efecto económico separado                           |

Invariante:

```text
PULSO SOLICITA
PASS DECIDE
PASS MUTA SU LEDGER
PASS CONFIRMA EL RESULTADO
PULSO CONSERVA LA CORRELACIÓN COMERCIAL
```

---

#### 5. Frontera correcta: comando hacia la propietaria

La confirmación de redención no se modela como una escritura directa desde PULSO sobre datos PASS.

Se reutiliza:

```text
interaction_family = OWNER_COMMAND
```

y el alcance transversal:

```text
OWNER_COMMAND
→ source_command_id
→ misma intención autorizada
→ misma mutación propietaria
→ resultado recuperable
```

Reglas:

1. PULSO genera o conserva un `source_command_id` antes del primer intento;
2. el mismo intento lógico reutiliza esa identidad;
3. PASS recibe el comando y revalida autoridad y estado;
4. PASS es la única aplicación que confirma la mutación de su ledger;
5. PULSO recibe un resultado o receipt propietario;
6. timeout después de un posible commit exige consulta antes de reejecutar;
7. un nuevo click, escaneo o refresh no genera otra intención empresarial cuando el objetivo sigue siendo consumir la misma redención;
8. cambiar materialmente la intención requiere una operación sucesora, no reutilizar la identidad con otra huella.

---

#### 6. Redención real antes de consumo

Una venta o terminal PULSO no puede fabricar una redención desde datos comerciales.

Antes del consumo debe existir una referencia que PASS pueda resolver inequívocamente a una redención propia.

Como mínimo debe poder demostrarse:

- `redemption_id`;
- cuenta PASS propietaria;
- recompensa o beneficio aplicable;
- costo histórico en puntos;
- regla o contrato aplicable;
- sede o alcance autorizado;
- estado empresarial que permita continuar;
- evidencia de que la operación no fue consumida ya;
- evidencia suficiente para proteger contra doble gasto;
- correlación con el instrumento de presentación cuando exista.

No basta con:

- texto “descuento”;
- nombre de recompensa;
- puntos escritos por el cliente;
- importe negativo;
- QR no resoluble;
- referencia externa sin identidad PASS;
- fila Makos;
- descuento en una venta;
- metadata no validada.

---

#### 7. Identidad de dominio

La identidad de la redención es:

```text
redemption_id
```

Reglas:

1. es emitida o gobernada por PASS;
2. persiste durante presentación, validación, retry, uso, cancelación y conciliación;
3. no cambia por un nuevo intento técnico;
4. no cambia por un nuevo QR de presentación cuando el contrato permita rotarlo;
5. no cambia por asociarla posteriormente a un pedido o venta;
6. no se deriva del costo en puntos;
7. no se deriva del usuario;
8. no se deriva de la recompensa;
9. no se deriva del timestamp;
10. no se deriva de un token aleatorio.

Una redención diferente obtiene otra identidad empresarial aunque use la misma recompensa.

---

#### 8. Identidad del comando y guarda contra doble consumo

La idempotencia transversal del comando usa:

```text
source_command_id
```

La protección de dominio adicional exige:

```text
UNA redemption_id
→ COMO MÁXIMO UN CONSUMO CONFIRMADO
```

Por tanto:

1. dos retries del mismo comando recuperan el mismo resultado;
2. dos comandos distintos contra la misma redención compiten bajo la guarda de dominio;
3. si uno ya confirmó el consumo, el otro recupera el resultado compatible o recibe conflicto/rechazo;
4. un pedido diferente no habilita otra vez la misma redención;
5. una terminal diferente no habilita otra vez la misma redención;
6. un token re-presentado no habilita otra vez la misma redención;
7. una pérdida de respuesta no libera la redención para ser consumida nuevamente;
8. una redención cancelada o vencida no se reactiva mediante retry ordinario.

---

#### 9. Huella lógica del comando

La huella del comando debe representar la intención empresarial y no los detalles volátiles del transporte.

Debe considerar, cuando aplique:

- `redemption_id`;
- cuenta PASS esperada;
- recompensa o beneficio esperado;
- costo histórico en puntos;
- sede;
- pedido o venta correlacionados cuando existan;
- actor efectivo o referencia de autorización;
- terminal o contexto cuando sea material para la política;
- acción solicitada;
- versión contractual;
- evidencia de presentación;
- referencias causales.

No cambia únicamente por:

- número de retry;
- `attempt_id`;
- `delivery_id`;
- `trace_id`;
- worker;
- refresh;
- segundo escaneo del mismo instrumento;
- hora técnica de reenvío;
- canal de transporte;
- retiro del adaptador Makos.

La misma identidad de comando con huella material incompatible produce conflicto.

---

#### 10. Cuenta PASS

PASS revalida la cuenta antes de autorizar o confirmar el uso.

Se preserva:

```text
PERSONA
≠
CUENTA AUTENTICADA
≠
CUSTOMER_ID COMERCIAL
≠
LOYALTY_ACCOUNT
≠
CONTACTO
```

Reglas:

1. la redención pertenece a una cuenta resoluble;
2. una venta sin cliente no puede adoptar una redención ajena;
3. correo, teléfono, nombre o documento coincidentes no reasignan la redención;
4. el token no sustituye la relación de cuenta;
5. una cuenta bloqueada o no elegible impide nuevas mutaciones conforme a la política aplicable;
6. una corrección de identidad posterior conserva historia y no reescribe movimientos confirmados.

---

#### 11. Recompensa o beneficio

PASS revalida la recompensa o beneficio que fundamenta la redención.

Debe conservarse como mínimo:

- identidad de la recompensa o beneficio;
- vigencia aplicable;
- alcance por sede cuando corresponda;
- estado de disponibilidad para redención;
- costo en puntos utilizado;
- versión o referencia contractual suficiente;
- restricciones de uso;
- límites aplicables;
- evidencia o snapshot histórico suficiente para explicar qué se autorizó.

Un cambio posterior del catálogo no reescribe la redención histórica.

---

#### 12. Costo histórico en puntos

El costo usado por la redención debe quedar históricamente reconstruible.

No es válido:

```text
RETRY TARDÍO
→ RELEER COSTO ACTUAL
→ CAMBIAR LA MISMA REDENCIÓN
```

Reglas:

1. el costo se fija conforme al contrato vigente al autorizar la redención;
2. un cambio posterior de recompensa no recostea silenciosamente una operación ya autorizada;
3. una incompatibilidad material exige cancelación, sucesión o conciliación según la política aplicable;
4. PULSO no decide el costo;
5. el cliente no decide el costo;
6. el monto de una venta no sustituye el costo en puntos.

---

#### 13. Saldo disponible y puntos no expirados

La decisión de gasto pertenece a PASS.

Antes de que la redención quede utilizable, PASS debe poder demostrar:

- saldo derivado del ledger;
- puntos válidos conforme a expiración y reglas aplicables;
- ausencia de una reserva o gasto incompatible que ya consuma la misma capacidad;
- suficiencia para el costo requerido;
- estado de cuenta compatible;
- resultado durable de la decisión.

PULSO nunca recibe autoridad para establecer:

- saldo anterior;
- saldo posterior;
- puntos disponibles;
- fecha de expiración;
- elegibilidad de la cuenta.

Esos valores pueden proyectarse para experiencia cuando corresponda, pero la mutación revalida la fuente PASS.

---

#### 14. Protección contra doble gasto

La redención no puede quedar presentable para consumo mientras los mismos puntos permanezcan simultáneamente disponibles para otra redención incompatible.

Invariante:

```text
PUNTOS COMPROMETIDOS PARA REDENCIÓN A
+
REDENCIÓN B CON LOS MISMOS PUNTOS
→ NO PUEDEN AMBAS CONFIRMARSE
```

La implementación posterior deberá elegir una representación propietaria que garantice esta exclusión.

Dos estrategias físicas pueden satisfacer el contrato si quedan aprobadas en `PASS-INT-002`:

1. gasto confirmado al autorizar la redención, con compensación si después se cancela sin consumo;
2. reserva autoritativa de puntos y conversión atómica a gasto al confirmar el consumo.

Esta tarea no selecciona tablas ni mecanismo físico, pero congela estas obligaciones:

- ninguna ventana de doble gasto;
- una sola verdad PASS;
- ledger o reserva trazable;
- resultado recuperable;
- cancelación segura;
- conciliación.

---

#### 15. Atomicidad del resultado

El procesamiento deberá vincular atómicamente o con durabilidad equivalente:

- identidad de redención;
- identidad del comando cuando exista;
- cuenta;
- recompensa;
- costo histórico;
- protección de puntos;
- autorización aplicable;
- estado de la redención;
- movimiento de ledger cuando corresponda;
- saldo derivado;
- pedido o venta correlacionados cuando aplique;
- actor y sede;
- resultado propietario;
- referencias de auditoría.

No es válido:

```text
REDENCIÓN CONFIRMADA
SIN PROTECCIÓN DEL GASTO
```

No es válido:

```text
PUNTOS GASTADOS
SIN REDENCIÓN RECUPERABLE
```

No es válido:

```text
ESTADO CAMBIADO
SIN RESULTADO IDEMPOTENTE
```

---

#### 16. Ledger y saldo

El ledger PASS permanece como fuente de verdad de puntos.

```text
MOVIMIENTO CONFIRMADO
→ FUENTE DE VERDAD

SALDO
→ PROYECCIÓN DERIVADA
```

Reglas:

1. la redención no fija manualmente el saldo como dato independiente;
2. un gasto confirmado conserva relación con `redemption_id`;
3. un retry no crea otro movimiento;
4. la confirmación en PULSO no crea un segundo movimiento si el gasto ya ocurrió;
5. una compensación crea otro movimiento relacionado;
6. no se elimina un movimiento confirmado para “restaurar” el saldo;
7. una proyección divergente se reconcilia contra el ledger.

---

#### 17. Creación, autorización y consumo son hechos distintos

La redención debe distinguir al menos estas decisiones semánticas:

1. existe una intención o solicitud;
2. PASS la evalúa;
3. PASS autoriza o rechaza;
4. los puntos quedan protegidos contra doble gasto cuando la autorización lo exige;
5. existe una referencia presentable cuando corresponda;
6. PULSO solicita el consumo en un contexto autorizado;
7. PASS confirma o rechaza el consumo;
8. el beneficio queda correlacionado con el pedido o venta cuando corresponda;
9. cualquier cancelación o compensación posterior conserva el original.

Estos pasos no obligan a nueve estados físicos distintos. `PASS-INT-002` cierra el modelo de almacenamiento y estados sin perder ninguna de estas decisiones.

---

#### 18. Instrumento de presentación

Un QR, código o token puede permitir localizar y presentar la redención, pero no sustituye la validación empresarial.

El instrumento deberá ser:

- opaco respecto de secretos;
- mínimo en datos personales;
- resoluble a una redención propietaria;
- limitado por estado;
- limitado por vigencia cuando corresponda;
- revocable cuando el contrato lo permita;
- resistente a reutilización;
- compatible con validación por sede y actor;
- trazable sin convertirse en la identidad de negocio.

No se considera prueba suficiente de seguridad o idempotencia que el token incluya un timestamp o aleatoriedad.

---

#### 19. Validación en PULSO

PULSO realiza una validación operativa antes de solicitar el consumo.

Debe comprobar, según aplicabilidad:

- acceso a PULSO;
- capacidad de redención;
- sede del contexto;
- actor atribuible;
- dispositivo o terminal cuando corresponda;
- formato válido de la referencia;
- correlación con pedido o venta cuando exista.

Después solicita a PASS la decisión propietaria.

PULSO no determina por sí solo:

- que la recompensa siga vigente;
- que la cuenta siga habilitada;
- que los puntos continúen disponibles;
- que el costo siga siendo el autorizado;
- que la redención no haya sido consumida en otra terminal;
- que el ledger deba mutar.

---

#### 20. Validación propietaria en PASS

Al recibir el comando, PASS vuelve a verificar como mínimo:

1. identidad de redención;
2. estado empresarial compatible;
3. cuenta propietaria;
4. recompensa o beneficio;
5. costo histórico;
6. vigencia;
7. sede o alcance;
8. restricciones y límites;
9. protección de puntos;
10. consumo previo;
11. comando previo equivalente;
12. huella compatible;
13. autoridad o contexto requerido;
14. pedido o venta correlacionados cuando la política lo exija;
15. resultado previo recuperable;
16. cualquier bloqueo o conciliación existente.

El cliente o PULSO no pueden omitir esta revalidación enviando un booleano de “válido”.

---

#### 21. Pedido y venta

La redención y la venta son objetos distintos.

```text
REDENCIÓN PASS
≠
PEDIDO PULSO
≠
VENTA PULSO
```

Reglas:

1. una redención puede correlacionarse con pedido o venta cuando se usa;
2. el pedido no se convierte en fuente del saldo;
3. la venta no vuelve a ejecutar el gasto;
4. cerrar una venta no crea una redención ausente;
5. un descuento de venta no sustituye `redemption_id`;
6. el mismo `redemption_id` no puede consumirse en dos pedidos o ventas distintos;
7. una venta que posteriormente emita eventos conserva la referencia a la redención como evidencia, no como orden de volver a gastarla.

---

#### 22. Descuento, precio y fiscalidad

El beneficio comercial que una redención produzca debe conservar semántica separada del movimiento de puntos.

```text
GASTO DE PUNTOS
≠
DESCUENTO
≠
PRECIO
≠
PAGO
≠
DOCUMENTO FISCAL
```

Reglas:

1. PASS confirma fidelización;
2. PULSO aplica el tratamiento comercial autorizado por su propio contrato;
3. la aplicación de un descuento no prueba que PASS haya confirmado la redención;
4. PASS no modifica precios PULSO por escritura cruzada;
5. PULSO no fabrica el gasto PASS porque haya aplicado un descuento;
6. cualquier efecto fiscal sigue la autoridad fiscal aplicable;
7. conciliación debe poder detectar beneficio aplicado sin redención confirmada o redención confirmada sin beneficio comercial cuando corresponda.

---

#### 23. Acumulación y redención

Se preserva:

```text
ACUMULACIÓN
≠
REDENCIÓN
```

Consecuencias:

1. una acumulación no autoriza una redención;
2. una redención no prueba acumulación previa de esa misma venta;
3. las reglas pueden ser distintas;
4. las identidades son distintas;
5. las huellas son distintas;
6. los movimientos de ledger son distintos;
7. los retries son distintos;
8. una misma venta puede contener ambas relaciones sin fusionarlas;
9. la guarda de acumulación de `INT-SALES-005` no se usa como identidad de redención;
10. la redención nunca reutiliza un `event_id` de acumulación como identidad propia.

---

#### 24. Concurrencia

Dos terminales, dispositivos o solicitudes pueden intentar usar la misma redención casi simultáneamente.

El contrato exige:

```text
MISMA redemption_id
+
DOS INTENTOS CONCURRENTES
→ UN SOLO CONSUMO POSIBLE
```

El segundo intento deberá:

- recuperar el resultado compatible previo;
- o recibir un rechazo o conflicto;
- nunca gastar otra vez;
- nunca asociar la misma redención a otra venta como consumo nuevo.

Deshabilitar el botón o esconder el QR después del primer click no satisface esta garantía.

---

#### 25. Retry y resultado desconocido

Se reutiliza `RETRY_OWNER_COMMAND` para el comando propietario cuando resulte aplicable.

Ante timeout después de posible commit:

```text
RESULTADO DESCONOCIDO
        ↓
CONSULTAR source_command_id + redemption_id + RESULTADO PASS
        ├── CONFIRMADO → RECUPERAR RESULTADO
        ├── NO APLICADO DEMOSTRADO → REINTENTAR MISMA IDENTIDAD
        └── INDETERMINADO → CONCILIACIÓN
```

Reglas:

1. retry conserva `source_command_id`;
2. retry conserva `redemption_id`;
3. retry conserva huella;
4. cambiar de terminal no crea una redención nueva;
5. reiniciar PULSO no crea una redención nueva;
6. volver a escanear no crea una redención nueva;
7. un lease o claim vencido no demuestra ausencia de commit;
8. agotamiento del presupuesto no presume éxito ni fracaso;
9. `INT-SALES-007` especializará el control transversal contra duplicados sin alterar estas invariantes.

---

#### 26. Resultado durable

PASS debe devolver o permitir recuperar un resultado suficiente para reconstruir:

- `redemption_id`;
- `source_command_id` cuando exista;
- cuenta;
- recompensa o beneficio;
- costo histórico;
- resultado de autorización;
- resultado de consumo;
- movimiento de ledger o referencia propietaria cuando corresponda;
- saldo derivado relevante;
- sede;
- actor o principal;
- pedido o venta correlacionados;
- tiempo empresarial;
- huella;
- resultado de idempotencia;
- estado de conciliación;
- referencias de auditoría.

Un ACK de transporte no equivale a este resultado.

---

#### 27. Cancelación antes del consumo

Una redención autorizada pero no consumida puede requerir cancelación conforme a la política PASS.

La cancelación:

1. identifica la redención;
2. comprueba que no haya consumo confirmado;
3. conserva motivo;
4. conserva actor o principal;
5. conserva evidencia;
6. revoca el instrumento de presentación cuando corresponda;
7. libera una reserva autoritativa si esa fue la estrategia física;
8. compensa mediante ledger si ya existía un gasto confirmado que deba devolverse;
9. no borra historia para simular que la redención nunca existió;
10. devuelve un resultado idempotente.

---

#### 28. Cancelación o corrección después del consumo

Una redención consumida no se “desconsume” mediante edición destructiva.

Si un hecho posterior justifica compensación:

```text
REDENCIÓN ORIGINAL
        ↓
CONSUMO ORIGINAL
        ↓
DECISIÓN DE CORRECCIÓN / COMPENSACIÓN
        ↓
MOVIMIENTO COMPENSATORIO PASS CUANDO CORRESPONDA
        ↓
SALDO DERIVADO ACTUALIZADO
```

Reglas:

1. el original permanece;
2. la compensación tiene identidad propia;
3. referencia explícitamente la redención y movimiento originales;
4. no presume que PULSO, NEXO o NUMERA ya compensaron sus efectos;
5. no vuelve a habilitar el token original salvo una decisión contractual explícita;
6. una segunda compensación equivalente no duplica la devolución de puntos;
7. `PASS-INT-002` cierra el detalle físico de esta operación.

---

#### 29. Expiración y vigencia

Si una redención o instrumento tiene vigencia limitada:

- la vigencia pertenece al contrato PASS;
- PULSO no amplía la vigencia;
- un token vencido no se reactiva por reescaneo;
- un retry iniciado antes del vencimiento no convierte automáticamente una operación incierta en rechazo si pudo haber confirmado antes;
- PASS consulta el resultado original para distinguir consumo confirmado, no aplicado o desconocido;
- si existían puntos protegidos, la liberación o compensación se realiza según el resultado real.

La expiración de una redención no equivale a expiración de los puntos de la cuenta.

---

#### 30. Recompensa no disponible al momento de uso

Si la recompensa deja de estar disponible después de autorizar la redención, PASS debe aplicar la política histórica aprobada para esa operación.

No se permite:

- sustituir recompensa silenciosamente;
- cambiar costo;
- reasignar beneficio;
- consumir puntos por una recompensa distinta;
- marcar éxito solo porque PULSO ya escaneó el token.

La situación debe terminar en resultado válido, cancelación, sucesión o conciliación según el contrato PASS detallado.

---

#### 31. Partialidad

Una redención no se divide por inferencia.

Solo puede existir partialidad cuando el contrato de la recompensa o beneficio la permita expresamente y conserve:

- unidad autorizada;
- cantidad total;
- cantidad consumida;
- cantidad restante;
- costo correspondiente;
- identidad estable;
- movimientos de ledger sin doble gasto;
- resultados recuperables.

Mientras esa capacidad no esté definida por el contrato propietario, una redención ordinaria se trata como una unidad empresarial única de consumo.

`PASS-INT-002` deberá declarar expresamente si la materialización física admite o no partialidad para cada modalidad soportada.

---

#### 32. Offline

La redención afecta un saldo sensible y requiere impedir doble gasto.

Por defecto, una terminal sin capacidad de consultar o recuperar el resultado autoritativo no debe inventar una confirmación.

Cualquier operación offline futura deberá:

- tener política específica;
- conservar identidad durable;
- limitar riesgo de doble gasto;
- revalidar autoridad;
- resolver resultado desconocido;
- reconciliar al volver conectividad.

La mera posesión de un QR no concede capacidad offline para gastar puntos.

---

#### 33. Replay y backfill

##### 33.1. Replay

Un replay técnico:

- conserva la identidad del comando original;
- conserva `redemption_id`;
- consulta el resultado previo;
- no vuelve a gastar;
- no vuelve a asociar la operación como consumo nuevo.

##### 33.2. Backfill

Un backfill:

- no fabrica redenciones históricas desde descuentos;
- no fabrica redenciones desde filas Makos agregadas;
- no ejecuta gasto de puntos automáticamente;
- conserva procedencia y evidencia;
- exige autorización explícita para cualquier mutación sensible;
- concilia primero contra redenciones y ledger existentes.

---

#### 34. Venta nativa PULSO y procedencia histórica externa

El contrato de redención no cambia por la procedencia de la venta.

Venta histórica con procedencia externa:

```text
source_system = MAKOS
producer_application = PULSO
redemption_owner = PASS
```

Venta nativa:

```text
source_system = PULSO
producer_application = PULSO
redemption_owner = PASS
```

En ambos casos:

```text
MISMA IDENTIDAD PASS
+
MISMA REVALIDACIÓN
+
MISMO OWNER_COMMAND
+
MISMA GUARDA DE CONSUMO
+
MISMO LEDGER
+
MISMO RESULTADO RECUPERABLE
```

Makos no se convierte en autoridad de puntos.

---

#### 35. Independencia del adaptador externo

Una redención permanente no requiere:

- API Makos;
- archivo Makos;
- webhook Makos;
- polling Makos;
- credencial Makos;
- staging de ventas Makos;
- hash de archivo Makos.

El adaptador puede conservar evidencia histórica de procedencia de la venta, pero no participa en la autoridad de redención.

El retiro del adaptador no cambia:

- `redemption_id`;
- movimientos PASS históricos;
- saldo derivado;
- recompensas;
- comandos PULSO → PASS;
- resultados recuperables.

---

#### 36. Proceso propietario `VPROC-0045`

Se conserva `VPROC-0045 — Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados`.

Sus definiciones normales existentes permanecen sin crear una variante específica solo para redención:

- `VPROC-0045.EVT-001` — interacción de fidelización abierta;
- `VPROC-0045.EVT-002` — identidad en validación;
- `VPROC-0045.EVT-003` — autorización de acción pendiente;
- `VPROC-0045.EVT-004` — actualización de consentimiento pendiente;
- `VPROC-0045.EVT-005` — conciliación pendiente;
- `VPROC-0045.EVT-006` — interacción de fidelización conciliada.

Reglas:

1. abrir la interacción no gasta puntos;
2. validar identidad no gasta puntos;
3. autorización pendiente no equivale a consumo confirmado;
4. consentimiento permanece separado de redención;
5. divergencias permanecen en conciliación;
6. cierre normal requiere que la operación haya quedado aplicada una sola vez o cerrada sin efecto de forma válida;
7. cualquier evento PASS es producido por PASS;
8. un comando PULSO no se disfraza como evento empresarial PASS.

---

#### 37. Privacidad y seguridad

La redención manipula identidad y saldo de fidelización.

El contrato exige:

- mínima PII en token y comando;
- cero secretos embebidos en QR;
- actor atribuible;
- sede revalidada;
- permiso revalidado;
- estado revalidado;
- rate limit o controles de abuso cuando corresponda;
- trazabilidad de intentos;
- protección contra enumeración de redenciones;
- no exponer saldo completo cuando la finalidad no lo requiera;
- no convertir una cuenta PASS en cuenta laboral;
- no inferir consentimiento de marketing por usar puntos.

---

#### 38. Auditoría mínima

Debe poder reconstruirse:

- cuenta PASS;
- `redemption_id`;
- recompensa o beneficio;
- costo histórico;
- regla o contrato aplicable;
- solicitud inicial;
- instrumento presentado cuando exista;
- `source_command_id`;
- PULSO solicitante;
- sede;
- actor efectivo;
- pedido o venta correlacionados;
- protección de puntos;
- movimiento de ledger;
- saldo derivado;
- intentos;
- resultados;
- timeout o incertidumbre;
- cancelación;
- compensación;
- conciliación;
- evidencia.

La auditoría no sustituye la operación propietaria.

---

#### 39. Conciliación permanente PULSO–PASS

La conciliación deberá detectar como mínimo:

- redención PASS sin resultado recuperable;
- gasto de puntos sin redención;
- redención consumida sin movimiento o protección coherente;
- mismo `redemption_id` consumido dos veces;
- misma redención asociada como consumo a dos pedidos o ventas;
- mismo comando aplicado dos veces;
- comando con huella incompatible;
- token presentado para una redención inexistente;
- token reutilizado después del consumo;
- token válido en sede incompatible;
- actor sin autoridad;
- costo histórico divergente;
- recompensa divergente;
- cuenta divergente;
- saldo derivado divergente del ledger;
- doble gasto concurrente;
- redención cancelada pero consumida posteriormente;
- redención expirada usada como nueva;
- beneficio comercial PULSO aplicado sin confirmación PASS;
- confirmación PASS sin correlación comercial cuando el contrato la requiera;
- descuento inferido como redención;
- pago inferido como redención;
- gasto duplicado por retry;
- resultado desconocido sin resolución;
- compensación duplicada;
- dependencia residual de Makos para una redención nativa.

La conciliación no corrige el saldo mediante edición directa.

---

#### 40. Diagnóstico de la línea base técnica observada

La línea base actual demuestra funcionalidades reales de redención, pero no acredita todavía el contrato permanente de esta tarea.

En PASS se observa un flujo que:

1. consulta una recompensa;
2. comprueba `loyalty_points`;
3. genera un QR con tiempo y aleatoriedad;
4. crea una fila de redención;
5. crea después, en otra operación, un movimiento `spend` en `loyalty_transactions`;
6. elimina la fila de redención como rollback si falla el movimiento;
7. confía en que el saldo se derive posteriormente del ledger.

En PULSO se observa un flujo que:

1. consulta una redención por QR;
2. exige estado disponible;
3. revalida acceso a PULSO;
4. solicita firma de actor en dispositivo compartido;
5. cambia directamente el estado de la redención PASS a validado;
6. adjunta después la referencia de firma cuando aplica.

Estas superficies prueban que existe una capacidad funcional parcial, pero no demuestran por sí solas:

- una operación propietaria PASS única;
- atomicidad entre redención, protección de puntos y ledger;
- una identidad de comando estable para retry;
- resultado recuperable frente a respuesta perdida;
- exclusión de doble gasto entre solicitudes concurrentes;
- ausencia de escritura cruzada PULSO → datos PASS;
- atomicidad entre autorización, consumo y evidencia del actor;
- compensación append-only completa;
- conciliación permanente.

La tarea no modifica esta implementación.

---

#### 41. Diferencia entre implementación observada y contrato objetivo

```text
INSERT REDENCIÓN
+
INSERT SPEND
+
DELETE COMPENSATORIO
+
UPDATE POSTERIOR DESDE PULSO
≠
OPERACIÓN PASS ATÓMICA E IDEMPOTENTE
```

El contrato objetivo exige:

```text
IDENTIDAD ESTABLE
+
AUTORIDAD PASS
+
PROTECCIÓN CONTRA DOBLE GASTO
+
OWNER_COMMAND
+
REVALIDACIÓN
+
RESULTADO DURABLE
+
LEDGER COHERENTE
+
RECUPERACIÓN
+
COMPENSACIÓN
+
CONCILIACIÓN
```

Una implementación posterior puede reutilizar superficies actuales únicamente si demuestra estas invariantes.

---

#### 42. Frontera de implementación posterior

La materialización física deberá cerrar, como mínimo:

1. identidad propietaria de redención;
2. contrato de creación o autorización;
3. protección de puntos;
4. recompensa y snapshot histórico;
5. token o referencia de presentación;
6. `OWNER_COMMAND` PULSO → PASS;
7. `source_command_id`;
8. huella lógica;
9. autorización por actor y sede;
10. guarda contra doble consumo;
11. ledger;
12. saldo derivado;
13. resultado recuperable;
14. concurrencia;
15. timeout y resultado desconocido;
16. cancelación;
17. expiración;
18. compensación;
19. correlación con pedido o venta;
20. conciliación;
21. auditoría;
22. privacidad;
23. pruebas.

`PASS-INT-002` cierra el diseño detallado de esta materialización.

Toda futura modificación Supabase que materialice estas decisiones pertenece a `vento-shell`.

---

#### 43. Handoffs posteriores obligatorios

| Pendiente material                                      | Tarea o propietario | Condición de salida                                                                                                  |
| ------------------------------------------------------- | ------------------- | -------------------------------------------------------------------------------------------------------------------- |
| especialización transversal contra duplicados por retry | `INT-SALES-007`     | retry de ventas, comandos y efectos no produce una segunda operación                                                 |
| conciliación durante convivencia POS externo / PULSO    | `INT-SALES-008`     | ventas y efectos PASS pueden reconciliarse durante coexistencia                                                      |
| corte por sede, terminal y fecha                        | `INT-SALES-009`     | una sola fuente origina nuevas ventas en cada ámbito                                                                 |
| guardia contra doble emisión de venta                   | `INT-SALES-010`     | ambas fuentes no pueden originar la misma venta como nueva                                                           |
| retiro del adaptador externo                            | `INT-SALES-011`     | redención y consumidoras internas continúan sin dependencia Makos                                                    |
| integración detallada PULSO → PASS para redención       | `PASS-INT-002`      | contrato servidor, identidad, protección de puntos, atomicidad, lifecycle, resultado y compensación quedan definidos |
| prueba integral de redención                            | `PASS-QA-002`       | concurrencia, doble gasto, retry, QR, sede, actor, cancelación, compensación y conciliación quedan verificadas       |
| protección de redenciones en PULSO                      | `PULSO-AUTH-010`    | toda validación usa capacidad autorizada y el contrato propietario PASS                                              |
| operación de acumulación independiente                  | `PASS-INT-001`      | acumulación conserva su propia operación y no se fusiona con redención                                               |

Ningún pendiente material queda sin propietario y condición de salida.

---

#### 44. Prohibiciones

Queda prohibido:

1. tratar QR o token como identidad empresarial;
2. gastar puntos porque el QR tenga formato válido;
3. permitir que PULSO decida el saldo PASS;
4. permitir que PULSO inserte movimientos PASS;
5. permitir que PULSO actualice directamente la redención como contrato objetivo;
6. inferir redención desde descuento;
7. inferir redención desde propina;
8. inferir redención desde medio de pago;
9. inferir redención desde importe negativo;
10. inferir redención desde una fila Makos;
11. inferir redención desde una venta sin `redemption_id` resoluble;
12. recalcular costo histórico con el valor vigente;
13. consumir una recompensa distinta a la autorizada;
14. reasignar la redención a otra cuenta por coincidencia aproximada;
15. permitir dos consumos de la misma `redemption_id`;
16. crear otra identidad por retry;
17. crear otra identidad por refresh;
18. crear otra identidad por reescaneo;
19. repetir gasto ante respuesta perdida;
20. usar un nuevo pedido para volver a consumir la misma redención;
21. depender solo de ocultar el botón para prevenir concurrencia;
22. actualizar saldo directamente para corregir divergencias;
23. borrar un movimiento confirmado;
24. borrar una redención consumida para representar cancelación;
25. reactivar un token vencido por retry ordinario;
26. convertir cancelación en reversión ciega;
27. crear compensación sin efecto original;
28. compensar dos veces el mismo efecto;
29. fusionar acumulación y redención;
30. usar la guarda de acumulación como identidad de redención;
31. presentar ACK técnico como resultado empresarial;
32. backfillear gastos de puntos sin autorización;
33. permitir uso offline solo por poseer el QR;
34. depender de Makos para validar una redención nativa;
35. crear una definición normal de evento por conveniencia;
36. ampliar el mini-bloque PASS con identidades no definidas por su fuente propietaria;
37. modificar código, SQL, migraciones, RLS, RPC, datos, Supabase, credenciales o configuración remota desde esta tarea documental;
38. iniciar o desarrollar `INT-SALES-007`.

---

#### 45. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el registro vigente ya exige que las redenciones y demás mutaciones de puntos utilicen contratos de servidor autorizados, atómicos e idempotentes; que el cliente no inserte el ledger ni fije saldo; que la validación del canje limite permiso, sede, estado y actor; que el ledger sea inmutable y el saldo derivado; que retry, concurrencia y resultado desconocido no dupliquen efectos; que acumulación, redención, reversión y compensación conserven evento, regla, versión y trazabilidad; y que la integración de ventas produzca los efectos PASS aplicables exactamente una vez. Esta tarea especializa esas obligaciones al contrato permanente de redención PULSO → PASS sin introducir una obligación verificable nueva.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

---

#### 46. Cobertura de prueba existente preservada

Se preserva sin modificación, en especial:

- `TREQ-PASS-008`, para acumulación, gasto, ajuste, reversión y redención mediante contratos de servidor autorizados, atómicos e idempotentes, sin inserción de ledger ni fijación de saldo desde cliente, y con validación por permiso, sede, estado y actor;
- `TREQ-PASS-010`, para identidad, ledger inmutable, evento origen, regla, versión, saldo derivado y ausencia de duplicación por retry;
- `TREQ-PASS-011`, para mantener separados devolución, reembolso, compensación, descuento, cortesía, cupón y puntos;
- `TREQ-PULSO-001`, para demostrar fidelización dentro del flujo POS extremo a extremo;
- `TREQ-PULSO-004`, para impedir mutaciones de fidelización fuera de acciones autorizadas;
- `TREQ-PULSO-005`, para mantener estados de pedido, pago, inventario y fidelización independientes;
- `TREQ-PULSO-006`, para mantener venta, pago, caja, descuento, devolución y compensación con semánticas separadas;
- `TREQ-INTEGRATION-003`, para identidad estable, huella, resultado durable, retry, concurrencia y resultado desconocido;
- `TREQ-INTEGRATION-014`, para efectos PASS exactamente una vez en la cadena de ventas sin duplicación por retry;
- `TREQ-INTEGRATION-015`, para fidelización y compensaciones correlacionadas, idempotentes y conciliables.

Ninguna fila cambia de identidad, texto, estado, relación, propietaria, evidencia ni secuencia por esta tarea.

---

#### 47. Decisiones congeladas

1. PASS es propietaria de redención, cuenta, recompensa, ledger y saldo.
2. PULSO solicita el consumo pero no muta por autoridad propia el dominio PASS.
3. La familia transversal correcta para solicitar la mutación es `OWNER_COMMAND`.
4. `source_command_id` es la identidad idempotente del comando.
5. `redemption_id` es la identidad propietaria de la redención.
6. QR o token no son identidad empresarial.
7. Una redención solo puede tener un consumo confirmado.
8. Múltiples comandos contra la misma redención no producen doble gasto.
9. Una redención presentable debe proteger previamente contra doble gasto.
10. La representación física de reserva frente a gasto anticipado se cierra en `PASS-INT-002`, pero ambas deben cumplir las mismas invariantes.
11. El costo histórico no se recalcula silenciosamente.
12. PASS revalida cuenta, recompensa, costo, vigencia, sede, límites y estado.
13. PULSO revalida actor y contexto POS.
14. El saldo se resuelve en PASS.
15. Ledger es fuente de verdad.
16. Saldo es proyección.
17. Venta no equivale a redención.
18. Descuento no equivale a redención.
19. Pago no equivale a redención.
20. Acumulación no equivale a redención.
21. Una venta puede referenciar una redención sin volver a gastar puntos.
22. Retry conserva comando y redención.
23. Respuesta perdida exige consulta.
24. Resultado desconocido no autoriza segundo consumo.
25. Concurrencia tiene un único ganador.
26. Cancelación conserva historia.
27. Compensación es append-only cuando ya existió un gasto confirmado.
28. Expiración no reactiva tokens por retry.
29. Offline no se habilita por mera posesión del token.
30. Replay no vuelve a gastar.
31. Backfill no crea redenciones desde datos ambiguos.
32. Procedencia Makos y venta nativa PULSO usan la misma autoridad PASS.
33. El adaptador externo no participa en el contrato permanente de redención.
34. `VPROC-0045` se reutiliza.
35. Sus seis definiciones normales se conservan.
36. No se crea una definición normal de evento nueva.
37. `PASS-INT-002` conserva la integración detallada de redención.
38. `PASS-QA-002` conserva la prueba integral.
39. `PULSO-AUTH-010` conserva la protección de redenciones.
40. `INT-SALES-007` permanece como siguiente especialización de retry y duplicados.
41. La implementación actual se reconoce como parcial y no se declara equivalente al contrato objetivo.
42. Se crean cero cambios `TREQ-*`.
43. No se genera una copia del registro canónico de requisitos.
44. Se crean cero objetos físicos.
45. Se modifican cero objetos físicos.
46. No se modifica código, SQL, migraciones, datos, Supabase, credenciales ni configuración remota.

---

#### 48. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. mantiene `INT-SALES-005` como tarea anterior aprobada;
2. mantiene `INT-SALES-007` como única tarea siguiente reservada;
3. confirma PASS como propietaria de la redención;
4. confirma PULSO como solicitante del consumo en el POS;
5. separa venta, descuento, pago, acumulación y redención;
6. exige una redención PASS real antes del consumo;
7. conserva `redemption_id`;
8. impide usar QR como identidad;
9. adopta `OWNER_COMMAND`;
10. adopta `source_command_id` para idempotencia del comando;
11. garantiza máximo un consumo confirmado por redención;
12. protege contra dos comandos distintos sobre la misma redención;
13. protege los puntos contra doble gasto antes de que la redención sea utilizable;
14. permite cerrar la estrategia física de protección en `PASS-INT-002` sin relajar la invariante;
15. exige cuenta PASS resoluble;
16. exige recompensa o beneficio resoluble;
17. exige costo histórico reconstruible;
18. impide recosteo silencioso;
19. exige saldo y puntos válidos desde PASS;
20. impide que PULSO fije saldo;
21. exige atomicidad o durabilidad equivalente;
22. mantiene ledger como fuente;
23. mantiene saldo como proyección;
24. separa creación, autorización y consumo;
25. limita el token por estado, vigencia y autoridad cuando aplique;
26. exige revalidación operativa PULSO;
27. exige revalidación propietaria PASS;
28. impide que validación local sustituya confirmación PASS;
29. conserva correlación con pedido o venta;
30. impide reutilizar la misma redención en dos pedidos o ventas;
31. separa fidelización de precio y fiscalidad;
32. preserva acumulación independiente;
33. garantiza un solo ganador concurrente;
34. recupera resultado frente a respuesta perdida;
35. conserva resultado durable;
36. define cancelación previa al consumo sin borrar historia;
37. define compensación posterior no destructiva;
38. trata expiración sin reactivar automáticamente;
39. trata recompensa no disponible sin sustitución silenciosa;
40. prohíbe partialidad por inferencia;
41. restringe operación offline no demostrada;
42. preserva replay sin doble gasto;
43. preserva backfill sin gasto automático;
44. conserva contrato idéntico para procedencia Makos y PULSO nativa;
45. elimina dependencia del adaptador externo;
46. reutiliza `VPROC-0045`;
47. preserva las seis definiciones normales existentes;
48. exige privacidad, actor, sede y permiso;
49. hace reconstruible la auditoría;
50. define conciliación permanente PULSO–PASS;
51. diagnostica la implementación existente sin canonizar sus escrituras separadas;
52. asigna integración detallada a `PASS-INT-002`;
53. asigna prueba integral a `PASS-QA-002`;
54. asigna protección PULSO a `PULSO-AUTH-010`;
55. asigna control transversal de duplicados a `INT-SALES-007`;
56. mantiene `INT-SALES-008` a `INT-SALES-011` como handoffs de coexistencia y retiro;
57. genera cero requisitos de prueba nuevos;
58. modifica cero requisitos de prueba;
59. no genera una copia del registro canónico de requisitos;
60. crea cero objetos físicos;
61. modifica cero objetos físicos;
62. no modifica código, SQL, migraciones, Supabase, datos, credenciales ni configuración remota;
63. no inicia ni desarrolla `INT-SALES-007`.

---

#### 49. Resultado de la tarea

`INT-SALES-006` queda definida como la frontera permanente mediante la cual una redención propietaria de PASS puede ser presentada en PULSO y consumida exactamente una vez mediante un comando idempotente hacia PASS, protegiendo los puntos contra doble gasto y conservando ledger, saldo, recompensa, cuenta, actor, sede, resultado y correlación.

Resultado consolidado:

```text
REDENCIÓN PASS REAL
+
IDENTIDAD ESTABLE
+
CUENTA Y RECOMPENSA VÁLIDAS
+
COSTO HISTÓRICO
+
PUNTOS PROTEGIDOS
+
PRESENTACIÓN EN PULSO
+
ACTOR Y SEDE AUTORIZADOS
+
OWNER_COMMAND IDEMPOTENTE
+
REVALIDACIÓN PASS
+
UN SOLO CONSUMO
+
LEDGER COHERENTE
+
RESULTADO RECUPERABLE
→
REDENCIÓN PROCESADA EXACTAMENTE UNA VEZ
```

Sin escritura cruzada desde PULSO, sin doble gasto, sin convertir un descuento en redención y sin depender del adaptador externo.

---

#### 50. Continuidad

ÚLTIMA TAREA APROBADA

`INT-SALES-005 — Definir acumulación de puntos en PASS`

TAREA ACTUAL APROBADA

`INT-SALES-006 — Definir procesamiento de redención en PASS`

SIGUIENTE TAREA RESERVADA

`INT-SALES-007 — Definir control contra efectos duplicados por reintento`


### ✅ INT-SALES-007 — Definir control contra efectos duplicados por reintento

**Estado:** APROBADA
**Tarea anterior:** `INT-SALES-006 — Definir procesamiento de redención en PASS`
**Tarea siguiente:** `INT-SALES-008 — Definir conciliación de convivencia entre POS externo y PULSO`
**Tipo de tarea:** documental; especialización normativa permanente del control contra efectos duplicados cuando una venta, emisión, entrega, consumo o comando asociado a ventas se reintenta, preservando las identidades idempotentes ya aprobadas por alcance, las guardas de dominio de NEXO, NUMERA y PASS, los resultados recuperables, la concurrencia de un solo ganador, el tratamiento de resultado desconocido, replay, backfill, compensación y recuperación selectiva, sin crear una clave global, una transacción distribuida, una nueva política de retry, tablas, RPC, funciones, triggers, colas, migraciones, Supabase ni cambios de código
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/07_VENTAS_INVENTARIO_FINANZAS_Y_FIDELIZACION.md`
**Aplicación propietaria de la venta y de su emisión empresarial:** `PULSO`
**Aplicación propietaria del efecto físico:** `NEXO`
**Aplicación propietaria del hecho económico:** `NUMERA`
**Aplicación propietaria de fidelización:** `PASS`
**Registro transversal de idempotencia reutilizado:** `ENTERPRISE-EVENT-IDEMPOTENCY-REGISTRY-001`
**Política transversal de retry reutilizada:** `ENTERPRISE-EVENT-RETRY-POLICY-001`
**Máquina transversal de pendientes reutilizada:** `ENTERPRISE-SYNC-PENDING-STATE-MACHINE-001`
**Política transversal de compensación reutilizada:** `ENTERPRISE-EVENT-COMPENSATION-POLICY-001`
**Línea base documental:** `vento-shell@f1dc871fa990c5d7f4c15d07bca3807a6b58a948`
**Línea base PULSO observada:** `vento-pulso@71e0184486b5fe11e0a42435baf4024807a80efd`
**Línea base NEXO observada:** `vento-nexo@142c4d696221e3ce3fda4ed3b62f3d1fe5b58799`
**Línea base NUMERA observada:** `vento-numera@1b48a5da425d92e19ed89cf175b1dccc4cd960e1`
**Línea base PASS observada:** `vento-pass@b5a4aec908ef12226f798078577ab089a29ccda2`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el control permanente que impide que un reintento, redelivery, replay, recuperación después de timeout, reinicio de worker, reescaneo, reenvío manual o repetición de una entrega produzca por segunda vez un efecto empresarial ya confirmado dentro de la cadena de ventas.

La regla raíz es:

```text
MISMA INTENCIÓN O HECHO EMPRESARIAL
+
MISMA IDENTIDAD DEL ALCANCE
+
MISMA HUELLA LÓGICA
+
RESULTADO DURABLE
        ↓
RETRY / REDELIVERY / REPLAY / RECUPERACIÓN
        ↓
CONSULTAR O RECLAMAR EL MISMO ALCANCE
        ├── YA CONFIRMADO → RECUPERAR RESULTADO
        ├── EN CURSO → CONSERVAR OPERACIÓN
        ├── NO APLICADO DEMOSTRADO → REINTENTAR MISMA IDENTIDAD
        ├── CONTENIDO INCOMPATIBLE → CONFLICTO
        └── RESULTADO INCIERTO → CONCILIACIÓN
```

Nunca:

```text
RETRY
→ IDENTIDAD NUEVA
→ EFECTO NUEVO
```

Nunca:

```text
FALLÓ UNA CONSUMIDORA
→ VOLVER A APLICAR TODAS LAS CONSUMIDORAS
```

Nunca:

```text
UNA CLAVE GLOBAL DE VENTA
→ DEDUPLICA TODOS LOS DOMINIOS
```

---

#### 2. Resultado sustantivo

`INT-SALES-007` congela las siguientes decisiones permanentes:

1. La cadena de venta opera con **transporte al menos una vez** y **efecto lógico como máximo una vez por alcance idempotente**.
2. No se declara transporte exactamente una vez.
3. No se crea una idempotency key global para toda la venta.
4. Solicitud, comando, emisión, inbox y efecto consumidor conservan identidades separadas.
5. Un retry conserva la identidad del alcance que realmente está reintentando.
6. `attempt_id`, `delivery_id`, worker, batch, retry count, timestamp técnico y traza no crean una nueva operación empresarial.
7. Una misma venta no se vuelve a registrar porque falle una publicación posterior.
8. Un evento de venta ya emitido no obtiene otro `event_id` por fallo de entrega o pérdida de respuesta.
9. Cada consumidora deduplica su propio inbox con independencia de las demás.
10. Cada efecto consumidor deduplica su propia mutación con independencia del inbox.
11. Deduplicar un inbox no equivale a confirmar todos sus efectos.
12. Deduplicar un evento completo no puede suprimir varios efectos legítimos dentro de una misma consumidora.
13. NEXO conserva su identidad de efecto físico y sus receipts propietarios.
14. NUMERA conserva la identidad de `SALE_ECONOMIC_FACT` y su resultado económico.
15. PASS acumulación conserva su identidad de efecto y la guarda adicional cuenta + venta.
16. PASS redención conserva `redemption_id` y el `source_command_id` del comando propietario.
17. Dos comandos distintos dirigidos a la misma redención no habilitan dos consumos.
18. Una respuesta perdida nunca se interpreta por sí sola como ausencia de commit.
19. Antes de reejecutar un resultado incierto se consulta la identidad original.
20. Dos ejecuciones concurrentes del mismo alcance producen un único ganador empresarial.
21. Una misma clave con huella compatible recupera el resultado previo.
22. Una misma clave con huella material incompatible produce conflicto.
23. Un claim o lease vencido no demuestra que el efecto anterior no ocurrió.
24. Reiniciar aplicación, dispositivo, servicio, worker o scheduler no reinicia identidades ni presupuestos.
25. El agotamiento del presupuesto de retry no autoriza otro identificador.
26. Una operación agotada pasa a la política de conciliación o intervención aplicable.
27. Los efectos ya confirmados no se vuelven a ejecutar para “acompañar” a un efecto faltante.
28. La recuperación es selectiva por alcance pendiente o incierto.
29. El éxito NEXO no acredita éxito NUMERA o PASS.
30. El éxito NUMERA no acredita éxito NEXO o PASS.
31. El éxito PASS no acredita éxito NEXO o NUMERA.
32. Un fallo de una consumidora no revierte automáticamente las demás.
33. No existe una transacción distribuida global entre PULSO, NEXO, NUMERA y PASS.
34. La consistencia entre propietarias se obtiene mediante idempotencia local, resultados durables, compensación cuando proceda y conciliación.
35. Replay conserva las identidades empresariales originales.
36. Backfill no activa efectos sensibles por inferencia.
37. Una compensación no es un retry del efecto original.
38. Una corrección o compensación confirmada usa su propia identidad estable y referencia el original.
39. `INT-SALES-008` conserva la conciliación específica durante convivencia de POS externo y PULSO.
40. `INT-SALES-009` conserva el corte por sede, terminal y fecha efectiva.
41. `INT-SALES-010` conserva el control contra doble fuente de venta.
42. `INT-SALES-011` conserva el retiro del adaptador externo.
43. No se crea una nueva definición normal de evento.
44. No se crea un nuevo perfil de retry.
45. Se crean cero requisitos de prueba.
46. Se modifican cero requisitos de prueba.
47. Se crean cero objetos físicos.
48. Se modifican cero objetos físicos.

---

#### 3. Base canónica consumida y preservada

La tarea consume sin reabrir:

- `INT-APP-004`, para identidades, alcances, huella, replay de resultado, conflicto, concurrencia y atomicidad idempotente;
- `INT-APP-005`, para clasificación de fallos, elegibilidad, perfiles, presupuestos, backoff y resultado desconocido;
- `INT-APP-006`, para compensaciones idempotentes y no destructivas;
- `INT-APP-007`, para auditoría de captura, intento, resultado, receipt y efecto;
- `INT-APP-008`, para estados pendientes, `RESULT_UNKNOWN`, `RECONCILIATION_REQUIRED` y recuperación;
- `INT-APP-009`, para partialidad y residuales;
- `INT-APP-010`, para propiedad de dominio, `OWNER_COMMAND` y prohibición de escrituras cruzadas;
- `INT-SALES-001`, para identidad y registro durable de venta y línea;
- `INT-SALES-002`, para emisión empresarial PULSO y conservación del `event_id`;
- `INT-SALES-003`, para inbox y efecto físico NEXO;
- `INT-SALES-004`, para inbox y efecto económico NUMERA;
- `INT-SALES-005`, para acumulación PASS y guarda cuenta + venta;
- `INT-SALES-006`, para redención PASS y comando propietario;
- `INT-POS-013`, para idempotencia de venta y línea durante la transición;
- `INT-POS-015`, para emisión canónica durante la transición;
- `INT-POS-016`, `INT-POS-017` e `INT-POS-018`, para efectos NEXO, NUMERA y PASS exactamente una vez;
- `INT-POS-019`, para compensaciones;
- `INT-POS-020`, para conciliación;
- el registro canónico vigente de requisitos de prueba.

Esta tarea no cambia ninguna identidad aprobada previamente.

---

#### 4. Principio de capas idempotentes

La cadena usa varias identidades porque protege equivalencias diferentes:

```text
SOLICITUD
≠
COMANDO PROPIETARIO
≠
EMISIÓN DE EVENTO
≠
RECEPCIÓN DE CONSUMIDORA
≠
EFECTO DE CONSUMIDORA
≠
GUARDA DE DOMINIO
≠
INTENTO TÉCNICO
```

Una sola clave no puede reemplazar estas capas sin producir una de dos fallas:

1. una clave demasiado amplia suprime efectos legítimos;
2. una clave demasiado estrecha permite duplicar el efecto empresarial.

---

#### 5. Alcances transversales reutilizados

Se conservan los alcances ya aprobados:

| Alcance              | Identidad mínima reutilizada                    | Qué protege                                   |
| -------------------- | ----------------------------------------------- | --------------------------------------------- |
| `REQUEST_ACCEPTANCE` | `request_id` o `client_event_id`                | la misma solicitud lógica                     |
| `OWNER_COMMAND`      | `source_command_id`                             | la misma mutación solicitada a la propietaria |
| `EVENT_EMISSION`     | `event_id`                                      | la misma emisión empresarial                  |
| `CONSUMER_INBOX`     | `consumer_application + event_id`               | la misma recepción por consumidora            |
| `CONSUMER_EFFECT`    | `consumer_application + event_id + effect_code` | el mismo efecto derivado                      |
| `EXTERNAL_RECEIPT`   | `source_system + external_event_id`             | la misma afirmación externa autenticada       |
| `REPLAY_BATCH`       | `replay_request_id`                             | la misma instrucción controlada de replay     |

Reglas:

1. ninguna identidad sustituye otra;
2. el alcance de un retry debe conocerse antes de ejecutarlo;
3. la clave se fija antes del primer intento de ese alcance;
4. el retry conserva la clave;
5. el contenido material conserva la huella compatible;
6. cambiar materialmente la intención crea otra operación, no otro intento.

---

#### 6. Modelo end-to-end

La garantía permanente es:

```text
TRANSPORTE
=
AT_LEAST_ONCE

EFECTO EMPRESARIAL POR ALCANCE
=
AT_MOST_ONCE

RECUPERACIÓN DE DUPLICADO
=
RESULTADO ORIGINAL O ESTADO RECUPERABLE
```

Por tanto, un mensaje puede entregarse más de una vez sin autorizar más de un efecto.

---

#### 7. No existe una clave global de venta

Queda prohibido utilizar una forma equivalente a:

```text
canonical_sale_id
→ CLAVE UNIVERSAL DE TODO
```

porque una misma venta puede producir legítimamente:

- más de un evento empresarial;
- efectos separados en NEXO, NUMERA y PASS;
- más de un efecto dentro de una consumidora;
- comandos posteriores como redención;
- compensaciones;
- revisiones;
- hechos posteriores válidos.

`canonical_sale_id` conserva correlación y guardas de dominio cuando hayan sido aprobadas, pero no reemplaza las identidades idempotentes de cada alcance.

---

#### 8. Registro de venta PULSO

Cuando se reintenta el registro de la misma venta:

1. se conserva la identidad canónica de venta;
2. se conserva la identidad de las líneas;
3. se conserva la revisión aplicable;
4. se conserva la fuente empresarial real;
5. la misma intención no crea otra venta;
6. una huella incompatible produce conflicto;
7. no se crea otra venta porque haya fallado la emisión del evento;
8. una corrección material crea la revisión, sucesión o acción correspondiente y no se presenta como retry.

La venta durable es prerequisito del evento; el fallo del evento no invalida ni duplica la venta.

---

#### 9. Emisión PULSO

Para una emisión ya creada:

```text
event_id ORIGINAL
        ↓
PUBLICACIÓN / ENTREGA
        ↓
TIMEOUT / PÉRDIDA DE ACK / REDelivery
        ↓
MISMO event_id
```

Reglas:

1. `event_id` no cambia por retry;
2. `event_id` no cambia por otro worker;
3. `event_id` no cambia por otro canal de entrega;
4. `event_id` no cambia por replay;
5. un `delivery_id` nuevo no significa un evento nuevo;
6. si no puede demostrarse si la emisión durable existió, se consulta la identidad o resultado propietario antes de fabricar otra emisión;
7. una emisión durable recuperada se vuelve a entregar conservando el mismo evento.

---

#### 10. Audiencia y redelivery

Una redelivery conserva:

- `event_id`;
- `event_definition_id`;
- versión;
- productora;
- audiencia canónica;
- finalidad;
- sensibilidad;
- correlación;
- causación;
- agregado y versión aplicables.

Retry no puede añadir silenciosamente otra consumidora ni cambiar la finalidad para intentar obtener éxito.

---

#### 11. Inbox por consumidora

Cada consumidora deduplica de manera independiente:

```text
NEXO:
nexo + event_id

NUMERA:
numera + event_id

PASS:
pass + event_id
```

Reglas:

1. NEXO procesado no marca NUMERA como procesado;
2. NUMERA procesado no marca PASS como procesado;
3. PASS procesado no marca NEXO como procesado;
4. un fallo de una consumidora no borra el inbox de otra;
5. una entrega duplicada recupera el mismo inbox;
6. el inbox no sustituye la identidad del efecto;
7. un inbox confirmado puede contener un efecto todavía pendiente o no aplicable conforme a su contrato;
8. no se usa una fila global “evento procesado” para bloquear a todas las consumidoras.

---

#### 12. Efecto por consumidora

El efecto derivado usa:

```text
consumer_application
+
event_id
+
effect_code
```

La identidad se fija antes de la mutación.

Reglas:

1. varios efectos legítimos del mismo evento requieren `effect_code` distintos;
2. deduplicar solo por `event_id` no puede ocultar un segundo efecto legítimo;
3. reintentar el mismo efecto conserva su `effect_code`;
4. cambiar la finalidad física, económica o de fidelización no se presenta como retry del efecto anterior;
5. el resultado del efecto pertenece a la aplicación consumidora.

---

#### 13. NEXO

Para NEXO se preserva el contrato de `INT-SALES-003`.

El control exige:

1. mismo inbox para la misma entrega;
2. misma identidad de efecto para el mismo propósito físico;
3. máximo un efecto físico lógico por unidad elegible conforme al contrato aprobado;
4. grupo, componentes, legs, movimientos y receipt no se recrean por retry;
5. un fragmento confirmado dentro de una operación parcial no se vuelve a mover;
6. respuesta perdida exige consultar la identidad, grupo, legs, ledger o receipt propietario aplicable;
7. un stock agregado o una pantalla actualizada no prueban por sí solos que el efecto original no ocurrió;
8. una corrección física confirmada se realiza por la acción propietaria de corrección o compensación, no repitiendo el evento original.

---

#### 14. NUMERA

Para NUMERA se preserva:

```text
effect_code = SALE_ECONOMIC_FACT

CONSUMER_EFFECT
=
numera + event_id + SALE_ECONOMIC_FACT
```

El control exige:

1. mismo evento y misma huella económica recuperan el resultado previo;
2. la misma identidad con contenido económico incompatible produce conflicto;
3. dos ejecuciones concurrentes tienen un único ganador;
4. una respuesta perdida consulta la identidad original;
5. liberar posteriormente un mapping no vuelve a reconocer un ingreso ya aplicado;
6. un evento que no supera la puerta de materialidad no crea un hecho por simple retry;
7. el retry no transforma un pago, caja o documento fiscal en otro `SALE_ECONOMIC_FACT`;
8. un resultado económico confirmado no se repite porque NEXO o PASS estén pendientes.

---

#### 15. PASS — acumulación

Se preserva:

```text
CONSUMER_EFFECT
=
pass + event_id + LOYALTY_POINTS_ACCRUAL
```

y la guarda de dominio:

```text
loyalty_account_id
+
canonical_sale_id
+
ACCUMULATION
```

Las dos protecciones resuelven riesgos diferentes:

1. la identidad de efecto detiene duplicados del mismo evento;
2. la guarda cuenta + venta detiene una segunda acumulación causada por otro evento legítimo del mismo ciclo comercial;
3. retry conserva evento, cuenta, venta, regla, huella y resultado;
4. redelivery no crea otra acumulación;
5. replay no crea otra acumulación;
6. un evento posterior de pago o conciliación consulta primero la guarda;
7. cambiar la versión de la regla no habilita otra acumulación;
8. una venta ya acreditada a otra cuenta produce conflicto o conciliación, no otra acreditación.

---

#### 16. PASS — redención

La redención no se trata como un `CONSUMER_EFFECT` de acumulación.

Se preservan:

```text
redemption_id
```

y:

```text
OWNER_COMMAND
→ source_command_id
```

Reglas:

1. retry del mismo comando conserva `source_command_id`;
2. retry conserva `redemption_id`;
3. otro escaneo no crea una redención;
4. otro pedido no vuelve a consumir la misma redención;
5. dos comandos distintos contra la misma `redemption_id` compiten bajo la guarda de dominio de consumo;
6. solo un consumo puede confirmarse;
7. una respuesta perdida se consulta antes de otro envío;
8. un gasto de puntos ya confirmado no se repite al validar otra vez el instrumento de presentación.

---

#### 17. Matriz de identidad permanente

| Operación                    | Identidad que permanece                    | Duplicado debe producir        |
| ---------------------------- | ------------------------------------------ | ------------------------------ |
| misma solicitud de usuario   | `request_id` o `client_event_id`           | resultado de aceptación previo |
| mismo comando propietario    | `source_command_id`                        | resultado propietario previo   |
| misma emisión                | `event_id`                                 | misma emisión                  |
| misma recepción NEXO         | `nexo + event_id`                          | inbox previo                   |
| mismo efecto NEXO            | `nexo + event_id + effect_code`            | resultado físico previo        |
| misma recepción NUMERA       | `numera + event_id`                        | inbox previo                   |
| mismo hecho económico        | `numera + event_id + SALE_ECONOMIC_FACT`   | resultado económico previo     |
| misma recepción PASS         | `pass + event_id`                          | inbox previo                   |
| misma acumulación por evento | `pass + event_id + LOYALTY_POINTS_ACCRUAL` | movimiento/resultados previos  |
| misma acumulación por compra | cuenta + venta + `ACCUMULATION`            | acumulación previa o conflicto |
| mismo consumo de redención   | `redemption_id`                            | consumo previo o conflicto     |
| mismo comando de redención   | `source_command_id`                        | resultado previo               |
| mismo paso compensatorio     | identidad idempotente del paso aprobado    | resultado compensatorio previo |

---

#### 18. Huella lógica

La huella distingue repetición de reutilización incompatible.

Debe construirse con los campos materiales del alcance correspondiente y excluir metadatos volátiles.

No deben participar como causa suficiente de una nueva huella empresarial:

- `attempt_id`;
- `delivery_id`;
- retry count;
- worker;
- scheduler;
- batch técnico;
- timestamp de reenvío;
- trace;
- hostname;
- conexión;
- canal de transporte;
- número de polling;
- nombre de archivo;
- posición de fila;
- reinicio del proceso.

La misma identidad con huella diferente no se “corrige” adoptando el último payload.

---

#### 19. Resultado compatible

Cuando la identidad y la huella coinciden:

```text
DUPLICADO
→ RECUPERAR RESULTADO
→ CERO NUEVA MUTACIÓN
```

El resultado recuperado puede requerir revalidación actual de autorización y sensibilidad antes de mostrarse completo, pero esa revalidación nunca vuelve a ejecutar el efecto.

---

#### 20. Reutilización incompatible

Cuando la identidad coincide y la huella cambia materialmente:

```text
MISMA CLAVE
+
CONTENIDO DISTINTO
→ CONFLICTO
```

Queda prohibido:

- sobrescribir el primer contenido;
- tratar el segundo como retry;
- ejecutar parcialmente el segundo;
- usar `last write wins`;
- generar otra clave automáticamente para evitar el conflicto.

Un cambio legítimo se representa como nueva operación, revisión, corrección o compensación según el dominio.

---

#### 21. Concurrencia

Dos ejecuciones simultáneas de la misma identidad deben producir:

```text
UN SOLO GANADOR EMPRESARIAL
```

Las demás:

- recuperan el resultado confirmado;
- reciben un estado en curso recuperable;
- o reciben conflicto/rechazo cuando el contenido no coincide.

No satisfacen esta regla:

- comprobar y después insertar sin protección atómica;
- deshabilitar un botón;
- ocultar una fila;
- asumir que un único worker elimina las carreras;
- confiar en que las solicitudes “normalmente” no coinciden.

La primitiva física se definirá en los paquetes de implementación correspondientes.

---

#### 22. Claim y lease

Un claim o lease puede coordinar trabajo, pero:

1. no sustituye la identidad idempotente;
2. su expiración no prueba ausencia de commit;
3. adquirir un nuevo lease no permite reaplicar un efecto incierto;
4. después de una expiración se consulta el resultado durable;
5. únicamente la evidencia propietaria permite decidir retry seguro;
6. un claim abandonado con resultado incierto conduce a recuperación o conciliación.

---

#### 23. Perfiles de retry reutilizados

Esta tarea no crea perfiles.

Para la cadena de venta se reutilizan los perfiles aprobados:

##### 23.1. Comandos propietarios

`RETRY_OWNER_COMMAND`

- intentos totales: **6**;
- base: **2 s**;
- tope de demora: **2 min**;
- edad máxima: **30 min**;
- resultado posiblemente confirmado: consulta antes de reejecución.

##### 23.2. Eventos y efectos críticos

`RETRY_EVENT_CRITICAL`

- intentos totales: **20**;
- base: **2 s**;
- tope de demora: **10 min**;
- edad máxima: **72 h**;
- agotamiento: conciliación obligatoria.

La venta y sus efectos de inventario, economía y fidelización se consideran materiales y no pueden rebajar localmente estas protecciones mediante un perfil inventado.

##### 23.3. Inbox

El inbox utiliza el perfil transversal asignado por criticidad; en la cadena de ventas la implementación deberá mantener la criticidad de los efectos que habilita y nunca degradarla para eludir recuperación o conciliación.

---

#### 24. Presupuesto no reiniciable

El presupuesto pertenece a la operación, no al proceso técnico.

Por tanto no se reinicia por:

- reinicio de navegador;
- reinicio de aplicación;
- reinicio del dispositivo;
- restart de worker;
- redeploy;
- cambio de pod;
- cambio de función;
- cambio de terminal;
- reencolado;
- mover a otra cola;
- cambio de transportista;
- nuevo `attempt_id`.

Agotar el presupuesto no habilita “empezar de cero”.

---

#### 25. Clasificación antes de retry

El sistema no reintenta por intuición.

Se conserva la taxonomía transversal.

Los fallos elegibles para retry automático directo mantienen la política vigente.

Los casos que exigen tratamiento previo, como resultado desconocido, falta de autorización vigente, orden pendiente o conflicto, no se convierten en transitorios mediante fallback local.

---

#### 26. Resultado desconocido

Ante timeout, desconexión o caída después de un posible commit:

```text
UNKNOWN OUTCOME
        ↓
CONSULTAR IDENTIDAD DEL ALCANCE
        ├── RESULTADO CONFIRMADO
        │      → RECUPERAR
        ├── AUSENCIA DE EFECTO DEMOSTRADA
        │      → RETRY MISMA IDENTIDAD
        └── NO DETERMINABLE
               → RECONCILIATION_REQUIRED
```

La ausencia de respuesta no demuestra ausencia de efecto.

---

#### 27. Recuperación selectiva

La recuperación end-to-end trabaja sobre el vector de alcances, no sobre un botón de “reprocesar venta completa”.

Ejemplo conceptual:

```text
VENTA PULSO        → CONFIRMADA
EVENTO PULSO       → CONFIRMADO
NEXO               → CONFIRMADO
NUMERA             → RESULTADO DESCONOCIDO
PASS ACUMULACIÓN   → CONFIRMADA
PASS REDENCIÓN     → NO APLICA
```

La acción correcta es investigar o recuperar **NUMERA**.

No:

```text
REPETIR VENTA
+
REEMITIR EVENTO NUEVO
+
VOLVER A EJECUTAR NEXO
+
VOLVER A ACREDITAR PASS
```

---

#### 28. Vector de resultados sin máquina global nueva

La cadena podrá exponer una vista de conciliación compuesta por los resultados nativos de cada alcance.

Esta vista:

- no crea un estado empresarial global nuevo;
- no sustituye los outcomes propietarios;
- no transfiere autoridad;
- no convierte éxito parcial en éxito total;
- no obliga a reabrir resultados confirmados.

Cada componente conserva su propio outcome y referencia durable.

---

#### 29. Independencia de consumidoras

Se preserva:

```text
PULSO EVENT
        ├── NEXO
        ├── NUMERA
        └── PASS
```

Reglas:

1. cada rama posee inbox;
2. cada rama posee efecto;
3. cada rama posee resultado;
4. cada rama puede fallar de forma independiente;
5. cada rama puede recuperarse de forma independiente;
6. la latencia de una rama no reabre otra;
7. la compensación de una rama no se presume aplicada en otra;
8. el cierre de una rama no prueba el cierre de la venta completa.

---

#### 30. No existe commit distribuido global

Queda expresamente fuera del contrato:

```text
PULSO + NEXO + NUMERA + PASS
→ UNA ÚNICA TRANSACCIÓN ACID GLOBAL
```

La cadena mantiene fronteras propietarias.

La consistencia se obtiene mediante:

1. commit durable en cada propietaria;
2. identidad idempotente;
3. resultado recuperable;
4. retry seguro;
5. compensación no destructiva;
6. conciliación.

Un fallo intermedio puede dejar resultados mixtos pero siempre explícitos y recuperables.

---

#### 31. Redelivery completo frente a recuperación dirigida

Cuando el transporte solo permita redelivery del evento a toda la audiencia:

- las consumidoras ya confirmadas recuperan su resultado sin reaplicar;
- la consumidora pendiente continúa su procesamiento seguro;
- la consumidora conflictiva no se fuerza;
- el redelivery no cambia `event_id`.

Cuando exista capacidad de recuperación dirigida:

- se prefiere actuar solo sobre el alcance pendiente o incierto;
- no se crea otra emisión empresarial;
- se conserva la misma identidad causal.

---

#### 32. Efecto confirmado y proyección fallida

Puede ocurrir:

```text
EFECTO AUTORITATIVO CONFIRMADO
+
PROYECCIÓN / CACHE / RESPUESTA DERIVADA FALLÓ
```

La recuperación:

1. no repite el efecto autoritativo;
2. reconstruye o sincroniza la proyección desde la fuente propietaria;
3. conserva la referencia al resultado original;
4. no utiliza la proyección faltante como prueba de que el efecto no ocurrió.

---

#### 33. Evento confirmado y publicación incierta

Puede ocurrir:

```text
EVENTO DURABLE
+
PUBLICACIÓN INCIERTA
```

La recuperación:

1. localiza el evento durable;
2. conserva `event_id`;
3. vuelve a intentar la entrega permitida;
4. no fabrica otro evento;
5. permite que cada inbox deduplique la redelivery.

---

#### 34. Inbox confirmado y efecto incierto

Puede ocurrir:

```text
INBOX CONFIRMADO
+
EFECTO RESULT_UNKNOWN
```

La recuperación:

1. no crea otro inbox;
2. consulta la identidad del efecto;
3. consulta receipt, ledger, grupo, movimiento o hecho propietario que corresponda;
4. solo reintenta si la ausencia de efecto queda demostrada;
5. conserva la misma identidad de efecto.

---

#### 35. Diferentes eventos de la misma venta

No todo evento distinto es duplicado.

Por tanto:

1. `event_id` diferente puede representar un hecho empresarial legítimamente distinto;
2. no se deduplica por `canonical_sale_id` de forma transversal;
3. la consumidora evalúa si el nuevo evento habilita un efecto distinto;
4. cuando el dominio requiere una sola aplicación por venta, utiliza la guarda de dominio previamente aprobada;
5. PASS acumulación usa la guarda cuenta + venta;
6. PASS redención usa `redemption_id` y su guarda de consumo;
7. NUMERA conserva su puerta de materialidad y la identidad del hecho económico;
8. NEXO conserva la semántica física por línea, propósito y efecto.

---

#### 36. Retry no es revisión

Un cambio de:

- venta;
- línea;
- cantidad;
- importe;
- cuenta;
- recompensa;
- regla;
- producto;
- fuente;
- versión;
- propósito;
- acción;

puede ser una revisión o nueva operación material.

No se convierte automáticamente en retry.

Un retry conserva el significado empresarial del intento original.

---

#### 37. Retry no es compensación

Cuando un efecto confirmado fue válido técnicamente pero debe ser revertido o corregido:

```text
EFECTO ORIGINAL
        ↓
NUEVO HECHO CORRECTIVO
        ↓
COMPENSACIÓN PROPIETARIA
```

No:

```text
EFECTO ORIGINAL
        ↓
RETRY CON CANTIDAD NEGATIVA
```

La compensación:

- tiene identidad propia;
- referencia el original;
- usa su propia huella;
- es idempotente;
- conserva ambos hechos.

---

#### 38. Retry no es conciliación

La conciliación determina qué ocurrió realmente y qué falta resolver.

No se usa como alias de:

- “intentar otra vez”;
- “resetear estado”;
- “volver a correr toda la venta”;
- “marcar aplicado manualmente”.

`INT-SALES-008` especializará la conciliación durante coexistencia de fuentes sin cambiar la idempotencia aquí definida.

---

#### 39. Replay

Un replay del mismo evento:

1. conserva `event_id`;
2. conserva occurred_at;
3. conserva productora histórica;
4. conserva audiencia histórica;
5. crea intentos técnicos nuevos únicamente donde sea necesario;
6. cada consumidora deduplica contra el evento original;
7. los efectos confirmados se recuperan;
8. los efectos pendientes se recuperan o continúan;
9. no vuelve a acreditar puntos;
10. no vuelve a mover stock;
11. no vuelve a reconocer ingreso;
12. no vuelve a consumir una redención.

---

#### 40. Backfill

Un backfill autorizado:

- utiliza identidad determinista;
- conserva procedencia;
- conserva lote o ventana;
- concilia contra identidades existentes antes de producir hechos;
- no genera un `event_id` distinto para representar un evento histórico ya existente;
- no activa pagos, stock, puntos, redenciones, documentos o acciones físicas sensibles por defecto;
- exige autorización explícita para efectos sensibles;
- no utiliza la ausencia de una proyección como prueba de ausencia del efecto propietario.

---

#### 41. Batches

Un `replay_request_id`, lote o batch:

1. identifica la instrucción de procesamiento;
2. no sustituye las identidades de los elementos;
3. no convierte todos los elementos en una operación única;
4. conserva outcome por elemento;
5. conserva presupuesto por elemento;
6. no oculta partialidad;
7. no permite declarar éxito del lote si existen elementos inciertos sin tratamiento.

---

#### 42. Orden y versiones

Retry no puede retroceder una versión válida.

Se preserva:

- orden por agregado cuando aplique;
- versión del agregado;
- `STALE_VERSION`;
- `OUT_OF_ORDER_DEFERRED`;
- conflicto de versiones incompatibles.

Un evento tardío:

- no se trata como duplicado solo por llegar tarde;
- no sobrescribe una versión posterior;
- puede diferirse o conciliarse;
- conserva su identidad histórica.

---

#### 43. Estados y outcomes reutilizados

Esta tarea no crea un vocabulario global nuevo.

Para efectos consumidores se preservan, según el contrato propietario:

- `APPLIED`;
- `DUPLICATE_RESULT_RETURNED`;
- `CONFLICTING_REUSE`;
- `IN_PROGRESS_RECOVERABLE`;
- `STALE_VERSION`;
- `OUT_OF_ORDER_DEFERRED`;
- `RECONCILIATION_REQUIRED`;
- `REJECTED`.

Para comandos propietarios se preservan los outcomes transversales vigentes, entre ellos:

- `EFFECT_CONFIRMED`;
- `PRIOR_RESULT_REPLAYED`;
- `CONFLICT`;
- `RESULT_UNKNOWN`;
- `PARTIALLY_APPLIED`;
- `RECONCILIATION_REQUIRED`.

Para sincronización se preservan los estados vigentes, entre ellos:

- `SYNCING`;
- `PENDING_CONFIRMATION`;
- `ACKNOWLEDGED`;
- `REJECTED_RETRYABLE`;
- `CONFLICT`;
- `RESULT_UNKNOWN`;
- `RECONCILIATION_REQUIRED`.

Ninguna de estas listas se redefine por esta tarea.

---

#### 44. Semántica de resultado duplicado

`DUPLICATE_RESULT_RETURNED` o `PRIOR_RESULT_REPLAYED`, según el alcance, significa:

```text
MISMA OPERACIÓN YA CONFIRMADA
+
CERO NUEVA MUTACIÓN
+
RESULTADO ORIGINAL RECUPERADO
```

No significa:

- segunda ejecución que casualmente produjo el mismo valor;
- comparación posterior de saldos;
- coincidencia visual;
- reinsert y rollback;
- recreación de receipt.

---

#### 45. Partialidad

Cuando un efecto admite componentes:

```text
TOTAL SOLICITADO
=
CONFIRMADO
+
CANCELADO
+
BLOQUEADO
+
RESIDUAL
```

Un retry:

1. no repite componentes confirmados;
2. actúa sobre el residual permitido;
3. conserva identidad causal;
4. conserva referencias de componentes;
5. no declara el total confirmado hasta resolver o aceptar explícitamente los residuales;
6. no usa una segunda operación equivalente para ocultar partialidad.

---

#### 46. Venta con resultados mixtos

Una venta puede quedar, de forma legítimamente transitoria, con:

- venta confirmada;
- evento confirmado;
- NEXO confirmado;
- NUMERA pendiente;
- PASS confirmado;
- otra relación no aplicable.

Esta condición:

- no duplica la venta;
- no obliga a rollback global;
- no autoriza nueva emisión;
- conserva los resultados confirmados;
- asigna el pendiente a su propietaria;
- queda disponible para conciliación.

---

#### 47. Reintento manual

Una persona autorizada puede iniciar una recuperación controlada cuando la política lo permita.

El reintento manual:

1. no inventa una nueva clave;
2. no ignora el presupuesto previo;
3. no altera la huella;
4. no cambia de propietaria;
5. no cambia el contrato;
6. no convierte un rechazo permanente en transitorio;
7. no evita una conciliación requerida;
8. deja auditoría del actor y motivo.

---

#### 48. Cambio de tecnología

Cambiar:

- webhook por polling;
- cola;
- worker;
- RPC;
- función;
- scheduler;
- proveedor de transporte;
- proceso batch;

no cambia la identidad empresarial.

Una migración técnica debe preservar el registro idempotente y los resultados suficientemente para no reactivar efectos históricos.

---

#### 49. Retención de idempotencia

La información necesaria para deduplicar y recuperar resultados no puede expirar antes de la ventana relevante de:

- retry;
- offline;
- replay;
- disputa;
- compensación;
- auditoría.

Expirar una clave no puede volver ejecutable un efecto irreversible ya confirmado.

La política física de retención se cerrará en la arquitectura e implementación correspondientes.

---

#### 50. Procedencia Makos y venta nativa PULSO

Durante historia de transición:

```text
source_system = MAKOS
producer_application = PULSO
```

Después del corte:

```text
source_system = PULSO
producer_application = PULSO
```

En ambos casos, una vez existe el contrato canónico:

- `event_id` conserva su identidad;
- los inbox conservan su identidad;
- los efectos conservan su identidad;
- los comandos PASS conservan su identidad;
- retry conserva el resultado previo;
- la procedencia se mantiene para auditoría.

Esta tarea no decide cuándo una fuente puede originar una venta nueva. Esa guardia permanece en `INT-SALES-009` y `INT-SALES-010`.

---

#### 51. Doble fuente queda separada

Un duplicado causado porque Makos y PULSO originaron independientemente la misma venta no es necesariamente un retry técnico.

La detección y prohibición de esa doble fuente corresponde a `INT-SALES-010`.

`INT-SALES-007` impide que **una operación ya identificada** cree efectos repetidos durante retry, redelivery o recuperación.

No se usa idempotencia técnica para ocultar una violación de autoridad de fuente.

---

#### 52. Conciliación de convivencia queda separada

`INT-SALES-008` conservará:

- comparación de fuentes durante coexistencia;
- venta sin efecto;
- efecto sin venta;
- divergencias Makos/PULSO;
- resultados pendientes;
- acciones de conciliación.

Esta tarea solo fija las reglas que debe respetar cualquier recuperación nacida de esa conciliación:

- misma identidad si es el mismo efecto;
- consulta antes de retry incierto;
- cero reaplicación de efectos confirmados;
- nueva identidad solo para una operación empresarial materialmente nueva.

---

#### 53. Corte queda separado

`INT-SALES-009` decidirá el contrato permanente de corte por:

- sede;
- terminal;
- fecha efectiva.

Retry no puede modificar la autoridad temporal de la venta.

Una venta histórica conserva la fuente que tenía en su hecho original.

---

#### 54. Retiro del adaptador queda separado

`INT-SALES-011` cerrará el retiro del adaptador externo.

El retiro no puede:

- borrar registros idempotentes todavía necesarios;
- regenerar `event_id`;
- cambiar procedencia histórica;
- obligar a reejecutar efectos;
- hacer que NEXO, NUMERA o PASS dependan de Makos para recuperar resultados.

---

#### 55. Auditoría mínima

Cada intento deberá permitir reconstruir, según el alcance:

- venta y revisión;
- línea cuando aplique;
- request o client event;
- `source_command_id`;
- `event_id`;
- definición y versión;
- consumidora;
- inbox;
- `effect_code`;
- identidad de efecto;
- guarda de dominio;
- huella y versión;
- intento;
- `attempt_id`;
- `delivery_id` cuando exista;
- actor o principal;
- sede;
- contexto;
- inicio y fin;
- error clasificado;
- perfil de retry;
- presupuesto consumido;
- receipt;
- resultado propietario;
- duplicate replay;
- conflicto;
- resultado desconocido;
- conciliación;
- compensación relacionada cuando exista.

La auditoría registra intentos nuevos sin fabricar operaciones nuevas.

---

#### 56. Observabilidad

La observabilidad deberá distinguir al menos:

```text
OPERACIONES LÓGICAS
≠
INTENTOS
≠
ENTREGAS
≠
DUPLICADOS
≠
CONFLICTOS
≠
RESULTADOS DESCONOCIDOS
≠
EFECTOS CONFIRMADOS
```

Una métrica alta de delivery count no implica múltiples efectos.

Una métrica de éxito técnico tampoco prueba por sí sola un resultado empresarial.

---

#### 57. Diagnóstico técnico permitido

Las líneas base de PULSO, NEXO, NUMERA y PASS se conservan como evidencia de estado técnico de referencia.

Esta tarea no declara que los repositorios actuales materialicen íntegramente el contrato transversal aquí definido.

La aprobación documental significa:

- identidades y reglas fijadas;
- fronteras entre propietarias fijadas;
- controles de retry definidos;
- handoffs asignados.

No significa:

- constraints implementados;
- inbox físicos implementados;
- effect registry desplegado;
- claims transaccionales desplegados;
- reconciliación operativa habilitada;
- pruebas E2E ejecutadas.

---

#### 58. Frontera de implementación posterior

Cada paquete propietario deberá demostrar físicamente, según le corresponda:

1. persistencia de identidad;
2. huella;
3. claim o mecanismo concurrente equivalente;
4. resultado durable;
5. replay del resultado;
6. conflicto de reutilización;
7. recuperación ante respuesta perdida;
8. presupuesto de retry;
9. orden y versión;
10. inbox;
11. efecto;
12. guardas de dominio;
13. ledger o receipt propietario;
14. partialidad;
15. compensación;
16. auditoría;
17. conciliación.

Esta tarea no elige nombres de tablas, índices, constraints, RPC, funciones, workers ni topics.

Toda futura modificación Supabase que materialice estas reglas pertenece a `vento-shell`.

---

#### 59. Handoffs posteriores obligatorios

| Pendiente material                          | Tarea o propietario            | Condición de salida                                                                         |
| ------------------------------------------- | ------------------------------ | ------------------------------------------------------------------------------------------- |
| conciliación durante convivencia de fuentes | `INT-SALES-008`                | venta, fuente y efectos pendientes pueden compararse y resolverse sin reaplicar confirmados |
| corte por sede, terminal y fecha            | `INT-SALES-009`                | toda venta nueva tiene autoridad de fuente temporal inequívoca                              |
| prohibición permanente de doble fuente      | `INT-SALES-010`                | Makos y PULSO no pueden originar la misma venta como dos ventas nuevas                      |
| retiro del adaptador externo                | `INT-SALES-011`                | consumidores internos continúan sin depender del adaptador y sin reactivar historia         |
| materialización de venta y emisión          | paquete PULSO correspondiente  | registro, outbox, evento y resultado demuestran idempotencia                                |
| materialización de efecto físico            | paquete NEXO correspondiente   | inbox, efecto, movimiento, receipt y recovery impiden doble stock                           |
| materialización de efecto económico         | paquete NUMERA correspondiente | inbox, efecto y hecho económico impiden doble reconocimiento                                |
| materialización de acumulación              | `PASS-INT-001`                 | inbox, efecto, guarda cuenta + venta y ledger impiden doble acreditación                    |
| materialización de redención                | `PASS-INT-002`                 | comando, `redemption_id`, ledger y guarda de consumo impiden doble gasto                    |
| pruebas de acumulación                      | `PASS-QA-001`                  | retry, replay y concurrencia no duplican puntos                                             |
| pruebas de redención                        | `PASS-QA-002`                  | retry, concurrencia y respuesta perdida no duplican consumo                                 |

Ningún pendiente material queda sin propietario y condición de salida.

---

#### 60. Prohibiciones

Queda prohibido:

1. crear una idempotency key global de venta para todos los dominios;
2. reutilizar `canonical_sale_id` como clave universal;
3. reutilizar `event_id` como identidad de comando propietario;
4. reutilizar `source_command_id` como identidad de evento;
5. reutilizar `delivery_id` como identidad empresarial;
6. reutilizar `attempt_id` como identidad empresarial;
7. generar otra clave por retry;
8. generar otro `event_id` por redelivery;
9. generar otra venta porque falle la publicación;
10. reejecutar todos los efectos porque una consumidora falló;
11. considerar éxito NEXO como éxito NUMERA;
12. considerar éxito NUMERA como éxito PASS;
13. considerar éxito PASS como éxito NEXO;
14. considerar inbox aplicado como efecto aplicado;
15. deduplicar únicamente por evento cuando existen varios efectos legítimos;
16. deduplicar globalmente una consumidora y bloquear otra;
17. tratar claim vencido como prueba de no commit;
18. tratar timeout como fallo confirmado;
19. reintentar ciegamente `RESULT_UNKNOWN`;
20. reiniciar presupuesto al reiniciar worker;
21. cambiar de RPC, tabla o aplicación para conseguir éxito con otra identidad;
22. usar `last write wins` ante huella incompatible;
23. modificar la huella con metadatos técnicos volátiles;
24. reabrir un efecto confirmado para completar otro dominio;
25. repetir un fragmento ya confirmado de una operación parcial;
26. corregir un efecto confirmado mediante retry con payload distinto;
27. usar compensación como retry del original;
28. usar retry como compensación;
29. usar conciliación como botón de reproceso total;
30. usar replay para crear audiencias nuevas;
31. usar backfill para activar efectos sensibles sin autorización;
32. considerar batch exitoso ocultando elementos inciertos;
33. expirar dedup de forma que reactive efectos irreversibles;
34. convertir una violación de doble fuente en “duplicado técnico” para ocultarla;
35. crear una transacción distribuida global por esta tarea;
36. crear un nuevo perfil de retry;
37. crear un nuevo catálogo de outcomes;
38. crear una nueva definición normal de evento;
39. modificar código, SQL, migraciones, RLS, RPC, datos, Supabase, credenciales o configuración remota;
40. iniciar o desarrollar `INT-SALES-008`.

---

#### 61. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea especializa para la cadena permanente de ventas obligaciones ya protegidas por el registro vigente: identidad estable antes del primer intento; separación entre solicitud, comando, evento, inbox y efecto; transporte al menos una vez con efecto como máximo una vez; recuperación del resultado original; conflicto ante reutilización incompatible; un solo ganador concurrente; conservación de identidad y huella entre retries; consulta obligatoria ante resultado desconocido; presupuestos cerrados de retry; replay con identidad original; compensación idempotente; efectos de venta aplicables exactamente una vez en inventario, finanzas y fidelización; y ausencia de duplicación de puntos, stock o hechos económicos. No aparece una obligación verificable material nueva fuera de ese conjunto.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

---

#### 62. Cobertura de prueba existente preservada

Se preserva sin modificación, en especial:

- `TREQ-INTEGRATION-003`, para identidad estable, huella, resultado durable, retry, resultado desconocido, claim y conciliación;
- `TREQ-INTEGRATION-004`, para reconstrucción de intentos, resultados y efectos sin duplicación;
- `TREQ-INTEGRATION-011`, para efecto físico NEXO exactamente una vez;
- `TREQ-INTEGRATION-014`, para venta y efectos aplicables exactamente una vez en NEXO, PASS y NUMERA sin duplicación por retries, respuestas perdidas o fallos intermedios;
- `TREQ-INTEGRATION-017`, para hechos NUMERA correlacionados e idempotentes sin doble efecto;
- `TREQ-INTEGRATION-108`, para cobertura transversal del registro de idempotencia;
- `TREQ-INTEGRATION-109`, para transporte al menos una vez y efecto como máximo una vez;
- `TREQ-INTEGRATION-110`, para separación de identidades entre solicitud, comando, evento y efecto;
- `TREQ-INTEGRATION-112`, para replay del resultado original sin repetir mutación;
- `TREQ-INTEGRATION-113`, para conflicto ante huella incompatible;
- `TREQ-INTEGRATION-115`, para comando propietario sin segundo hecho ni emisión;
- `TREQ-INTEGRATION-116`, para conservación de `event_id` en redelivery, retry y replay;
- `TREQ-INTEGRATION-118`, para inbox independiente por consumidora;
- `TREQ-INTEGRATION-119`, para identidad por `effect_code`;
- `TREQ-INTEGRATION-120`, para único ganador concurrente;
- `TREQ-INTEGRATION-121`, para recuperación tras respuesta perdida;
- `TREQ-INTEGRATION-122`, para atomicidad entre mutación, identidad, resultado y outbox;
- `TREQ-INTEGRATION-123` y `TREQ-INTEGRATION-124`, para orden, versión, stale y conflicto;
- `TREQ-INTEGRATION-131` y `TREQ-INTEGRATION-132`, para replay y backfill;
- `TREQ-INTEGRATION-134`, para retención de deduplicación;
- `TREQ-INTEGRATION-138` a `TREQ-INTEGRATION-156`, para política, identidad, clasificación, resultado desconocido, presupuestos, perfiles y claims de retry;
- `TREQ-INTEGRATION-177` y `TREQ-INTEGRATION-178`, para idempotencia de compensaciones;
- `TREQ-INTEGRATION-235` a `TREQ-INTEGRATION-244`, para intento durable, confirmación, duplicado, resultado desconocido, conflicto y sucesión;
- `TREQ-INTEGRATION-295` a `TREQ-INTEGRATION-305`, para comando propietario, retry, resultado incierto, corrección, replay y propiedad de dominio;
- `TREQ-PASS-008`, para mutaciones de puntos autorizadas, atómicas e idempotentes;
- `TREQ-PASS-010`, para ledger, saldo derivado y retries sin duplicar puntos o beneficios;
- `TREQ-PULSO-001`, para flujo de venta completo con efectos integrados;
- `TREQ-PULSO-005`, para independencia de estados comerciales, inventario y fidelización;
- `TREQ-PULSO-006`, para acciones autorizadas, timeout no asumido fallido y conciliación;
- la cobertura NUMERA y NEXO ya vinculada por los requisitos transversales de integración.

Ninguna fila cambia de identidad, texto, estado, relación, propietaria, evidencia ni secuencia por esta tarea.

---

#### 63. Decisiones congeladas

1. Transporte de eventos permanece `AT_LEAST_ONCE`.
2. Efecto lógico permanece `AT_MOST_ONCE` por alcance idempotente.
3. No existe una clave global de la venta.
4. Solicitud, comando, emisión, inbox y efecto conservan identidades separadas.
5. Retry conserva la identidad del alcance.
6. Metadatos técnicos pueden cambiar sin crear otra operación.
7. PULSO no crea otra venta porque falle la emisión.
8. PULSO no crea otro `event_id` porque falle la entrega.
9. Cada consumidora deduplica su inbox por separado.
10. Cada efecto deduplica su mutación por separado.
11. `effect_code` distingue efectos legítimos de la misma consumidora.
12. NEXO conserva su efecto y receipt físico.
13. NUMERA conserva `SALE_ECONOMIC_FACT`.
14. PASS acumulación conserva efecto + guarda cuenta/venta.
15. PASS redención conserva `redemption_id` + `source_command_id`.
16. Diferentes eventos de una venta no son duplicados por defecto.
17. Las guardas de dominio detienen duplicados semánticos cuando corresponda.
18. Misma identidad + misma huella recupera resultado.
19. Misma identidad + huella incompatible produce conflicto.
20. Concurrencia tiene un único ganador.
21. Claim vencido no demuestra ausencia de commit.
22. Timeout no demuestra fallo.
23. `RESULT_UNKNOWN` exige consulta.
24. Retry seguro solo ocurre cuando la ausencia de efecto queda demostrada o la política lo permite.
25. Presupuesto no se reinicia por restart.
26. `RETRY_OWNER_COMMAND` se conserva para comandos.
27. `RETRY_EVENT_CRITICAL` se conserva para efectos críticos de la cadena.
28. No se crea un perfil local.
29. Recuperación es selectiva por alcance.
30. Un efecto confirmado no se repite para acompañar un pendiente.
31. No existe commit distribuido global.
32. Los resultados mixtos son explícitos y conciliables.
33. Redelivery a toda la audiencia depende de la deduplicación local.
34. Recuperación dirigida no crea nuevo evento.
35. Efecto confirmado + proyección fallida recupera proyección, no efecto.
36. Evento confirmado + publicación incierta conserva `event_id`.
37. Inbox confirmado + efecto incierto consulta el efecto original.
38. Retry no equivale a revisión.
39. Retry no equivale a compensación.
40. Retry no equivale a conciliación.
41. Replay conserva identidades empresariales.
42. Backfill no activa efectos sensibles por defecto.
43. Batch no sustituye identidades por elemento.
44. Eventos tardíos no retroceden versión.
45. Se reutilizan outcomes y estados existentes.
46. Resultado duplicado significa cero nueva mutación.
47. Partialidad no repite componentes confirmados.
48. Retry manual conserva clave, huella y presupuesto.
49. Migración tecnológica no reinicia identidad.
50. Retención no puede permitir reactivar un efecto irreversible.
51. Procedencia Makos/PULSO no cambia las reglas de retry.
52. Doble fuente queda en `INT-SALES-010`.
53. Conciliación de convivencia queda en `INT-SALES-008`.
54. Corte queda en `INT-SALES-009`.
55. Retiro del adaptador queda en `INT-SALES-011`.
56. No se crea una nueva definición de evento.
57. No se crea una nueva máquina global.
58. Se crean cero cambios `TREQ-*`.
59. No se genera una copia del registro canónico de requisitos.
60. Se crean cero objetos físicos.
61. Se modifican cero objetos físicos.
62. No se modifica código, SQL, migraciones, datos, Supabase, credenciales ni configuración remota.

---

#### 64. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. mantiene `INT-SALES-006` como tarea anterior aprobada;
2. mantiene `INT-SALES-008` como única tarea siguiente reservada;
3. reutiliza `ENTERPRISE-EVENT-IDEMPOTENCY-REGISTRY-001`;
4. reutiliza `ENTERPRISE-EVENT-RETRY-POLICY-001`;
5. reutiliza `ENTERPRISE-SYNC-PENDING-STATE-MACHINE-001`;
6. reutiliza la política de compensación vigente;
7. declara transporte al menos una vez;
8. declara efecto como máximo una vez por alcance;
9. prohíbe una clave global de venta;
10. separa `REQUEST_ACCEPTANCE`, `OWNER_COMMAND`, `EVENT_EMISSION`, `CONSUMER_INBOX` y `CONSUMER_EFFECT`;
11. conserva `request_id` o `client_event_id` donde aplique;
12. conserva `source_command_id`;
13. conserva `event_id`;
14. conserva inbox por consumidora;
15. conserva efecto por `effect_code`;
16. impide nueva venta por fallo de publicación;
17. impide nuevo evento por redelivery;
18. mantiene audiencia en retry;
19. mantiene finalidad y sensibilidad;
20. mantiene dedupe NEXO independiente;
21. mantiene dedupe NUMERA independiente;
22. mantiene dedupe PASS independiente;
23. conserva la guarda de acumulación cuenta + venta;
24. conserva `redemption_id`;
25. impide segundo consumo de redención;
26. exige huella lógica;
27. excluye metadata volátil de la huella empresarial;
28. recupera resultado con misma identidad y huella;
29. produce conflicto con huella incompatible;
30. garantiza un solo ganador concurrente;
31. impide check-then-act inseguro como garantía suficiente;
32. impide usar lease vencido como prueba de no commit;
33. conserva perfiles transversales;
34. conserva presupuestos;
35. impide reinicio de presupuesto por restart;
36. exige clasificación de fallo;
37. bloquea retry ciego de resultado desconocido;
38. define recuperación selectiva;
39. mantiene resultados nativos por alcance;
40. impide transacción distribuida global;
41. permite redelivery completa sin reaplicar confirmados;
42. permite recuperación dirigida sin nueva emisión;
43. recupera proyección sin repetir efecto;
44. conserva evento durable cuando publicación queda incierta;
45. conserva inbox cuando efecto queda incierto;
46. distingue eventos legítimos distintos de duplicados;
47. distingue retry de revisión;
48. distingue retry de compensación;
49. distingue retry de conciliación;
50. conserva replay con identidades originales;
51. restringe backfill sensible;
52. conserva identidad por elemento en batches;
53. preserva orden y versiones;
54. reutiliza outcomes vigentes;
55. define semántica inequívoca de resultado duplicado;
56. evita repetir componentes confirmados en partialidad;
57. admite resultados mixtos sin cierre global falso;
58. gobierna reintento manual;
59. conserva identidad ante cambio tecnológico;
60. conserva retención suficiente;
61. conserva procedencia histórica;
62. no absorbe el control contra doble fuente;
63. no absorbe la conciliación de convivencia;
64. no absorbe el contrato de corte;
65. no absorbe el retiro del adaptador;
66. hace reconstruible la auditoría;
67. separa intentos de operaciones en observabilidad;
68. asigna materialización a paquetes propietarios;
69. mantiene toda modificación futura de Supabase dentro de `vento-shell`;
70. genera cero requisitos de prueba nuevos;
71. modifica cero requisitos de prueba;
72. no genera una copia del registro canónico de requisitos;
73. crea cero objetos físicos;
74. modifica cero objetos físicos;
75. no modifica código, SQL, migraciones, datos, Supabase, credenciales ni configuración remota;
76. no inicia ni desarrolla `INT-SALES-008`.

---

#### 65. Resultado de la tarea

`INT-SALES-007` queda definida como la especialización permanente que impide que retries, redeliveries, replay, concurrencia o respuestas perdidas conviertan una misma intención o hecho de venta en un segundo efecto físico, económico o de fidelización.

Resultado consolidado:

```text
VENTA PULSO DURABLE
+
EVENTO PULSO DURABLE
+
IDENTIDADES SEPARADAS POR ALCANCE
+
HUELLA LÓGICA
+
INBOX POR CONSUMIDORA
+
EFECTO POR CONSUMIDORA
+
GUARDAS DE DOMINIO
+
UN SOLO GANADOR CONCURRENTE
+
RESULTADO DURABLE
+
CONSULTA ANTES DE RETRY INCIERTO
+
RECUPERACIÓN SELECTIVA
→
CERO EFECTOS DUPLICADOS POR REINTENTO
```

Sin clave universal, sin nueva emisión por retry, sin reabrir efectos confirmados y sin transacción distribuida global entre propietarias.

---

#### 66. Continuidad

ÚLTIMA TAREA APROBADA

`INT-SALES-006 — Definir procesamiento de redención en PASS`

TAREA ACTUAL APROBADA

`INT-SALES-007 — Definir control contra efectos duplicados por reintento`

SIGUIENTE TAREA RESERVADA

`INT-SALES-008 — Definir conciliación de convivencia entre POS externo y PULSO`


### ✅ INT-SALES-008 — Definir conciliación de convivencia entre POS externo y PULSO

**Estado:** APROBADA
**Tarea anterior:** `INT-SALES-007 — Definir control contra efectos duplicados por reintento`
**Tarea siguiente:** `INT-SALES-009 — Definir corte por sede, terminal y fecha efectiva`
**Tipo de tarea:** documental; definición normativa permanente de la conciliación durante la convivencia entre el POS externo y PULSO, materializando qué fuentes, ventas, líneas, eventos, entregas, efectos, recibos, diferencias, partialidades, compensaciones y evidencias deben compararse; cómo se clasifican y asignan las divergencias; qué acciones son seguras; y cómo se conserva procedencia sin decidir todavía el corte, la prohibición de doble fuente ni el retiro del adaptador, sin implementar tablas, RPC, funciones, triggers, colas, migraciones, Supabase ni cambios de código
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/07_VENTAS_INVENTARIO_FINANZAS_Y_FIDELIZACION.md`
**Aplicación propietaria de la venta canónica interna:** `PULSO`
**Fuente externa transitoria observada:** `Makos`
**Aplicación propietaria del efecto físico:** `NEXO`
**Aplicación propietaria del hecho económico:** `NUMERA`
**Aplicación propietaria de fidelización:** `PASS`
**Política transversal de errores parciales reutilizada:** `ENTERPRISE-PARTIAL-ERROR-HANDLING-POLICY-001`
**Máquina transversal de pendientes reutilizada:** `ENTERPRISE-SYNC-PENDING-STATE-MACHINE-001`
**Registro transversal de idempotencia reutilizado:** `ENTERPRISE-EVENT-IDEMPOTENCY-REGISTRY-001`
**Política transversal de retry reutilizada:** `ENTERPRISE-EVENT-RETRY-POLICY-001`
**Política transversal de compensación reutilizada:** `ENTERPRISE-EVENT-COMPENSATION-POLICY-001`
**Política transversal de auditoría reutilizada:** `ENTERPRISE-INTEGRATION-AUDIT-POLICY-001`
**Política transversal de escrituras entre aplicaciones reutilizada:** `ENTERPRISE-CROSS-APPLICATION-WRITE-POLICY-001`
**Línea base documental:** `vento-shell@b3459ab0247855ff9cae80715bf939c87c4069c1`
**Línea base PULSO observada:** `vento-pulso@71e0184486b5fe11e0a42435baf4024807a80efd`
**Línea base NEXO observada:** `vento-nexo@142c4d696221e3ce3fda4ed3b62f3d1fe5b58799`
**Línea base NUMERA observada:** `vento-numera@1b48a5da425d92e19ed89cf175b1dccc4cd960e1`
**Línea base PASS observada:** `vento-pass@b5a4aec908ef12226f798078577ab089a29ccda2`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir la conciliación permanente que debe operar mientras el POS externo y PULSO puedan aportar evidencia relacionada con ventas dentro de una misma etapa de convivencia.

La conciliación debe responder, para cada alcance verificable:

```text
¿QUÉ FUENTE AFIRMA EL HECHO?
+
¿QUÉ VENTA CANÓNICA LO REPRESENTA?
+
¿QUÉ LÍNEAS LO EXPLICAN?
+
¿QUÉ EVENTO SE EMITIÓ?
+
¿QUÉ CONSUMIDORAS DEBÍAN RECIBIRLO?
+
¿QUÉ EFECTOS ERAN APLICABLES?
+
¿CUÁLES QUEDARON CONFIRMADOS?
+
¿CUÁLES NO APLICABAN?
+
¿CUÁLES ESTÁN PENDIENTES, BLOQUEADOS, EN CONFLICTO O DESCONOCIDOS?
+
¿QUÉ COMPENSACIONES EXISTEN?
+
¿QUÉ EVIDENCIA SUSTENTA LA DECISIÓN?
```

El objetivo no es forzar igualdad entre sistemas, sino demostrar convergencia explicable o mantener una diferencia explícita con propietaria, disposición y condición de salida.

---

#### 2. Resultado sustantivo

Quedan fijadas las siguientes decisiones:

1. La conciliación de convivencia reutiliza el contrato de conciliación definido durante la transición y lo convierte en regla permanente mientras existan dos regímenes de fuente potencialmente observables.
2. PULSO coordina la vista comercial de la conciliación, pero no obtiene autoridad para modificar NEXO, NUMERA, PASS ni el sistema externo.
3. Makos conserva su procedencia histórica cuando haya sido la fuente real del hecho.
4. PULSO conserva su procedencia cuando haya originado una venta nativa válida.
5. La hora de recepción, importación o sincronización no cambia la fuente histórica.
6. La conciliación no decide todavía el contrato de corte.
7. La conciliación no decide todavía qué fuente queda habilitada para una sede, terminal y fecha concreta.
8. La conciliación no sustituye el control que impedirá que ambas fuentes originen la misma venta.
9. La conciliación sí debe detectar y mantener visible cualquier candidato de doble fuente.
10. La conciliación no convierte similitud de monto, fecha, producto o terminal en identidad de venta.
11. Una venta individual requiere identidad individual demostrable para conciliación individual.
12. Cuando la fuente externa solo aporte agregados, el control queda limitado a cobertura agregada y no puede declarar paridad uno a uno.
13. Los agregados sirven para detectar huecos o anomalías; no prueban identidad individual.
14. La unidad primaria de reconciliación es la venta canónica cuando existe identidad suficiente.
15. Las líneas se concilian individualmente cuando tienen identidad o correlación suficiente.
16. Los eventos se concilian por su identidad empresarial, no por timestamps aproximados.
17. Las entregas se concilian por consumidora.
18. Los efectos se concilian por propietaria y `effect_code` aplicable.
19. El éxito de publicación no prueba consumo.
20. El éxito de consumo no prueba efecto empresarial.
21. El éxito de una consumidora no confirma otra.
22. Cada efecto esperado se clasifica explícitamente.
23. Un efecto puede quedar `NO_APLICA` si su propia regla lo determina.
24. Un efecto bloqueado no se convierte en `NO_APLICA` para cerrar el caso.
25. Un resultado desconocido no se cierra por inferencia.
26. Una diferencia confirmada no se “arregla” editando historia.
27. Una corrección material crea un hecho sucesor o compensatorio según la propietaria.
28. Un retry seguro conserva identidad e idempotencia.
29. Un resultado confirmado no se reaplica durante conciliación.
30. La conciliación puede solicitar recuperación selectiva de una unidad pendiente.
31. La conciliación puede iniciar una compensación únicamente cuando exista efecto confirmado elegible.
32. No existe rollback global PULSO–NEXO–NUMERA–PASS.
33. No existe una clave universal de conciliación que sustituya identidades de negocio.
34. La clasificación de partialidad reutiliza el vocabulario transversal.
35. Las acciones manuales reutilizan la allowlist transversal.
36. Cada diferencia tiene propietaria y siguiente acción.
37. Cada caso abierto tiene condición de reactivación o resolución.
38. Una revisión de conciliación conserva la evidencia usada.
39. Evidencia posterior crea una nueva revisión o actualización append-only del caso; no reescribe la anterior.
40. Una revisión de cobertura puede finalizar con casos abiertos explícitos.
41. Un caso individual no puede cerrarse manteniendo resultado desconocido.
42. La conciliación separa venta, pago, caja, fiscalidad, inventario, economía y fidelización.
43. Las compensaciones se concilian contra el efecto original y su residual.
44. Replay y backfill no fabrican efectos históricos.
45. La conciliación permanece válida durante corte gradual.
46. `INT-SALES-009` conserva el contrato de corte.
47. `INT-SALES-010` conserva el enforcement contra doble fuente.
48. `INT-SALES-011` conserva el retiro del adaptador.
49. Se crean cero requisitos de prueba.
50. Se modifican cero requisitos de prueba.
51. Se crean cero objetos físicos.
52. Se modifican cero objetos físicos.

---

#### 3. Dependencias canónicas consumidas

La tarea consume y conserva:

- `INT-POS-003`, para autoridad temporal de fuente;
- `INT-POS-005` a `INT-POS-015`, para venta, línea, procedencia, mapping, cuarentena, idempotencia y evento;
- `INT-POS-016`, para la frontera NEXO;
- `INT-POS-017`, para la frontera NUMERA;
- `INT-POS-018`, para la frontera PASS;
- `INT-POS-019`, para compensaciones;
- `INT-POS-020`, para conciliación de venta y efectos durante la transición;
- `INT-POS-021` y `INT-POS-022`, para separar contrato documental de evidencia operativa;
- `INT-POS-023`, para corte transitorio por sede, terminal y fecha;
- `INT-SALES-001`, para venta canónica PULSO;
- `INT-SALES-002`, para emisión canónica;
- `INT-SALES-003`, para efecto físico NEXO;
- `INT-SALES-004`, para efecto económico NUMERA;
- `INT-SALES-005`, para acumulación PASS;
- `INT-SALES-006`, para redención PASS;
- `INT-SALES-007`, para retry, redelivery y recuperación selectiva;
- `INT-APP-004` a `INT-APP-010`, para idempotencia, retry, compensación, auditoría, pendientes, partialidad y ownership.

No se reabre ninguna de esas decisiones.

---

#### 4. Frontera frente a las tareas siguientes

| Materia                                                        | Propietaria     | Estado en esta tarea |
| -------------------------------------------------------------- | --------------- | -------------------- |
| comparar coexistencia de fuentes                               | `INT-SALES-008` | **DEFINIDA**         |
| detectar candidatos de doble fuente                            | `INT-SALES-008` | **DEFINIDA**         |
| decidir corte por sede, terminal y fecha                       | `INT-SALES-009` | `RESERVADA`          |
| impedir técnicamente que ambas fuentes originen la misma venta | `INT-SALES-010` | `RESERVADA`          |
| retirar el adaptador externo                                   | `INT-SALES-011` | `RESERVADA`          |

Detectar una divergencia no concede a esta tarea autoridad para decidir las reglas que pertenecen a las tres siguientes.

---

#### 5. Qué significa convivencia

Existe convivencia cuando, dentro de un periodo operativo, pueden observarse simultáneamente:

- ventas o agregados provenientes del POS externo;
- ventas nativas registradas por PULSO;
- eventos emitidos por PULSO;
- efectos internos derivados;
- información tardía o reprocesada de la fuente externa;
- información nativa posterior a un corte parcial todavía no consolidado para todos los alcances.

La coexistencia de evidencia no significa que ambas fuentes tengan autoridad simultánea para originar la misma venta.

---

#### 6. Unidad de conciliación

La conciliación trabaja de mayor a menor precisión:

1. identidad de fuente;
2. venta individual;
3. revisión de venta;
4. línea;
5. evento;
6. entrega por consumidora;
7. inbox;
8. efecto consumidor;
9. receipt o resultado propietario;
10. compensación;
11. agregado de cobertura.

La unidad individual solo puede declararse reconciliada cuando existe identidad suficiente.

---

#### 7. Regla de identidad

No se consideran prueba de identidad individual por sí solos:

- fecha;
- minuto;
- total;
- subtotal;
- impuesto;
- descuento;
- producto;
- cantidad;
- terminal;
- cajero;
- número de fila;
- posición en archivo;
- hash del archivo completo.

La equivalencia individual requiere identificadores o correlación determinista sustentada por el contrato de fuente.

---

#### 8. Fuente externa con evidencia agregada

Cuando la fuente externa entregue únicamente filas agregadas por producto, categoría o fecha:

```text
AGREGADO EXTERNO
≠
VENTA INDIVIDUAL
```

Por tanto:

1. puede comprobarse cobertura;
2. puede compararse cantidad total;
3. puede compararse dinero total cuando la semántica sea equivalente;
4. puede comprobarse mapping;
5. pueden detectarse desviaciones;
6. no se asignan ventas individuales por prorrateo;
7. no se crean `event_id` individuales por inferencia;
8. no se atribuyen efectos individuales a una fila agregada sin evidencia adicional;
9. igualdad de agregados no cierra diferencias individuales conocidas.

---

#### 9. Revisión por fecha empresarial

Mientras exista convivencia, debe poder existir una revisión de cobertura por fecha empresarial y alcance aplicable.

La tarea no fija una hora de reloj.

La revisión puede complementarse con conciliación dirigida por evento o caso.

El tiempo empresarial se atribuye por el momento real del hecho y no por:

- importación;
- recepción;
- reintento;
- replay;
- backfill;
- cierre del archivo.

---

#### 10. Revisión y nueva evidencia

Una revisión conserva:

- alcance;
- empresa o unidad cuando aplique;
- sede;
- terminal si es resoluble;
- fecha empresarial;
- fuentes consultadas;
- ventanas consultadas;
- evidencia disponible;
- diferencias detectadas;
- casos abiertos;
- decisiones;
- actor o principal;
- momento de revisión.

Nueva evidencia no reemplaza la revisión anterior.

---

#### 11. Niveles de comparación

Se definen cinco niveles:

1. **fuente**;
2. **venta y línea**;
3. **evento y entrega**;
4. **efecto propietario**;
5. **agregado de control**.

Un nivel agregado no puede cerrar silenciosamente una diferencia de un nivel más específico.

---

#### 12. Cadena de conciliación

Cuando exista identidad individual suficiente:

```text
FUENTE REAL
        ↓
VENTA PULSO
        ↓
LÍNEAS
        ↓
EVENTO PULSO
        ├── NEXO
        ├── NUMERA
        └── PASS
                ↓
COMPENSACIONES CUANDO APLIQUEN
```

Cada salto conserva identidad, causalidad y resultado independiente.

---

#### 13. Venta y efectos esperados

Para cada venta, la conciliación debe distinguir:

- efecto esperado;
- efecto no aplicable;
- efecto pendiente;
- efecto bloqueado;
- efecto confirmado;
- efecto conflictivo;
- efecto desconocido;
- efecto compensado;
- residual.

No se exige que todas las ventas produzcan todos los efectos.

---

#### 14. Aplicabilidad de NEXO

NEXO solo es efecto esperado cuando la disposición física aprobada exige movimiento.

Ejemplos de no aplicación legítima pueden incluir un producto o servicio expresamente clasificado sin efecto de inventario.

Falta de mapping o falta de regla no equivalen automáticamente a no aplicación.

---

#### 15. Aplicabilidad de NUMERA

NUMERA solo es efecto esperado cuando la venta supera la puerta de materialidad económica definida por su contrato.

Un evento válido puede no producir todavía un hecho económico si faltan dimensiones obligatorias.

La conciliación no fabrica entidad legal, moneda, centro de costo, tercero ni reconocimiento para “hacer cuadrar”.

---

#### 16. Aplicabilidad de PASS

PASS acumulación solo es esperada cuando:

- existe cuenta resoluble;
- la regla aplicable existe;
- la venta es elegible;
- la base es demostrable;
- no existe bloqueo material.

Una venta a consumidor final sin cuenta PASS puede ser legítimamente `NO_APLICA`.

---

#### 17. Redención PASS

La conciliación de una venta puede conservar referencia a una redención si realmente existió.

No se infiere redención desde:

- descuento;
- propina;
- pago;
- importe negativo;
- fila Makos;
- beneficio visual.

Una redención confirmada se concilia mediante `redemption_id` y resultado PASS.

---

#### 18. Fuente propietaria de cada hecho

| Hecho                                              | Fuente propietaria                             |
| -------------------------------------------------- | ---------------------------------------------- |
| venta y revisión comercial interna                 | `PULSO`                                        |
| afirmación o archivo externo                       | adaptador / fuente externa                     |
| movimiento y ledger físicos                        | `NEXO`                                         |
| hecho económico                                    | `NUMERA`                                       |
| cuenta, puntos, redención y ledger de fidelización | `PASS`                                         |
| pago comercial interno                             | `PULSO` y proveedor según frontera             |
| documento fiscal externo                           | proveedor fiscal autorizado                    |
| auditoría técnica                                  | política transversal, sin apropiarse del hecho |

La conciliación consulta las propietarias; no las sustituye.

---

#### 19. Diferencias de fuente

Deben detectarse como mínimo:

1. fuente externa con evidencia sin representación PULSO;
2. venta PULSO atribuida a fuente externa sin evidencia suficiente;
3. venta nativa PULSO en un alcance todavía ambiguo;
4. dos fuentes candidatas para el mismo hecho;
5. fuente declarada distinta de la procedencia demostrada;
6. sede divergente;
7. terminal divergente;
8. fecha empresarial divergente;
9. revisión o versión divergente;
10. evidencia externa tardía;
11. archivo duplicado o hash repetido;
12. recepción externa no autenticable o incompleta;
13. mapping de fuente contradictorio.

---

#### 20. Diferencias de venta

Deben detectarse como mínimo:

- venta fuente sin venta canónica;
- venta canónica sin soporte de fuente cuando sea requerido;
- identidad duplicada;
- identidad reutilizada con contenido incompatible;
- estado comercial divergente;
- revisión omitida;
- revisión obsoleta aplicada;
- líneas faltantes;
- líneas sobrantes;
- cantidades divergentes;
- importes divergentes;
- moneda divergente;
- descuentos divergentes;
- impuestos divergentes;
- devoluciones divergentes;
- terminal o sede incompatibles;
- cliente atribuido sin evidencia;
- correlación con pedido incorrecta.

---

#### 21. Candidato de doble fuente

Cuando Makos y PULSO aporten registros que podrían representar el mismo hecho:

```text
SIMILITUD
→ CANDIDATO DE DOBLE FUENTE
→ CASO ABIERTO
```

No:

```text
SIMILITUD
→ FUSIÓN AUTOMÁTICA
```

No:

```text
SIMILITUD
→ ELEGIR PULSO
```

No:

```text
SIMILITUD
→ ELEGIR MAKOS
```

El caso queda abierto hasta que el contrato de autoridad y la evidencia permitan resolverlo.

---

#### 22. Relación con el corte

`INT-SALES-009` será la propietaria de la regla que determine la fuente autorizada por:

- sede;
- terminal;
- fecha efectiva.

`INT-SALES-008` puede observar esos atributos y reportar una incompatibilidad, pero no fija sus valores ni adelanta la decisión.

---

#### 23. Relación con el control de doble fuente

`INT-SALES-010` será la propietaria del mecanismo que impida que ambas fuentes emitan la misma venta.

Esta tarea define qué debe detectar la conciliación si esa invariante se viola o aún no está materializada.

---

#### 24. Evento de venta

Deben detectarse:

- venta elegible sin evento;
- evento sin venta;
- evento con venta incorrecta;
- definición incorrecta;
- versión incompatible;
- emisión duplicada incompatible;
- mismo `event_id` con contenido incompatible;
- `event_id` diferente usado para redelivery de la misma emisión;
- evento tardío que intenta retroceder versión;
- audiencia incorrecta;
- consumidora omitida;
- consumidora añadida indebidamente en replay.

---

#### 25. Publicación, entrega y efecto

Permanecen separados:

```text
EVENTO REGISTRADO
≠
PUBLICADO
≠
ENTREGADO
≠
INBOX RECLAMADO
≠
EFECTO CONFIRMADO
```

Un ACK técnico no cierra la conciliación del efecto.

---

#### 26. NEXO — conciliación física

Debe compararse, según aplicabilidad:

- evento causal;
- inbox NEXO;
- identidad de efecto;
- intención de posting;
- movement group;
- legs;
- cantidades;
- unidad;
- producto;
- presentación;
- lote o condición;
- origen físico;
- receipt;
- proyección;
- compensación.

Deben detectarse:

1. evento elegible sin efecto;
2. efecto sin evento;
3. efecto duplicado;
4. movimiento sin receipt suficiente;
5. receipt sin movimiento esperado;
6. cantidad divergente;
7. UOM divergente;
8. producto divergente;
9. disposición incorrecta;
10. parcialidad no representada;
11. proyección divergente del ledger;
12. mapping bloqueado usado para mover;
13. mapping liberado con efecto pendiente;
14. resultado desconocido;
15. compensación sin original;
16. original que exige compensación y permanece pendiente.

---

#### 27. NEXO — reparación

Si el movimiento autoritativo ya existe y falla una proyección:

- no se crea otro movimiento;
- se reconstruye o reejecuta la proyección;
- se conserva receipt y causalidad.

Si el movimiento confirmado es incorrecto:

- se abre corrección o compensación propietaria;
- el original permanece.

---

#### 28. NUMERA — conciliación económica

Debe compararse, según aplicabilidad:

- evento causal;
- inbox NUMERA;
- identidad de efecto;
- `SALE_ECONOMIC_FACT`;
- entidad legal;
- unidad o marca;
- sede;
- centro de costo;
- tercero;
- moneda;
- ocurrencia;
- reconocimiento;
- documento;
- importe;
- impuestos;
- estado;
- evidencia;
- reversión o compensación.

Deben detectarse:

1. venta material sin hecho económico;
2. hecho económico sin venta;
3. hecho duplicado;
4. monto divergente;
5. moneda divergente;
6. entidad legal divergente;
7. sede divergente;
8. centro de costo divergente;
9. impuesto divergente;
10. documento divergente;
11. reconocimiento temporal incompatible;
12. atribución económica fabricada desde una línea bloqueada;
13. ingreso reconocido dos veces al liberar mapping;
14. reverso sin original;
15. original no compensado cuando corresponde;
16. resultado desconocido.

---

#### 29. NUMERA — pago y caja

La conciliación no fusiona:

```text
VENTA
≠
PAGO
≠
APLICACIÓN DE PAGO
≠
MOVIMIENTO DE CAJA
≠
DEPÓSITO
≠
MOVIMIENTO BANCARIO
```

Una coincidencia de importe no establece identidad entre estos hechos.

---

#### 30. PASS — acumulación

Debe compararse:

- venta;
- cuenta;
- regla y versión;
- base;
- evento;
- inbox PASS;
- efecto `LOYALTY_POINTS_ACCRUAL`;
- guarda cuenta + venta;
- movimiento de ledger;
- saldo derivado;
- compensación.

Deben detectarse:

1. venta elegible sin acumulación;
2. puntos sin venta;
3. acumulación duplicada;
4. misma venta acreditada a dos cuentas;
5. cuenta incorrecta;
6. regla incorrecta;
7. versión incorrecta;
8. base divergente;
9. puntos divergentes;
10. línea bloqueada usada indebidamente;
11. no aplicación usada para ocultar bloqueo;
12. ledger y saldo divergentes;
13. reverso sin original;
14. respuesta desconocida;
15. evento tardío que intenta acreditar otra vez.

---

#### 31. PASS — redención

Cuando la venta tenga redención relacionada, deben detectarse:

- beneficio comercial sin redención confirmada;
- redención confirmada sin correlación comercial esperada;
- misma redención consumida dos veces;
- redención asociada a dos ventas incompatibles;
- descuento usado como sustituto de `redemption_id`;
- ledger de gasto divergente;
- compensación de puntos sin original.

La conciliación no crea una redención faltante.

---

#### 32. Compensaciones

Toda compensación se compara con:

- efecto original;
- identidad del original;
- identidad de compensación;
- causa;
- propietaria;
- cantidad o importe compensable;
- cantidad o importe compensado;
- residual;
- resultado;
- evidencia.

No se considera cerrada por coincidencia de saldo final si falta causalidad.

---

#### 33. Compensación cruzada prohibida

NEXO no corrige NUMERA.

NUMERA no corrige PASS.

PASS no corrige PULSO.

PULSO no corrige NEXO.

La conciliación solicita la acción a cada propietaria mediante el contrato aprobado.

---

#### 34. Partialidad

Toda operación distribuida conserva unidades independientes.

La clasificación transversal reutilizada es:

- `NO_EFFECT_CONFIRMED`;
- `SOME_EFFECTS_CONFIRMED`;
- `SOME_EFFECTS_UNKNOWN`;
- `ALL_EFFECTS_UNKNOWN`;
- `DEPENDENCY_INCOMPLETE`;
- `CONFLICTING_RESULTS`;
- `UNTRUSTED_OR_TAMPERED_INPUT`;
- `CONTRACT_OR_SCHEMA_INCOMPATIBLE`;
- `EXTERNAL_STATE_DIVERGENCE`.

No se crea una taxonomía local.

---

#### 35. Alcance del fallo

Se reutilizan:

- `REQUEST_OR_COMMAND`;
- `OWNER_TRANSACTION`;
- `EVENT_EMISSION`;
- `DELIVERY`;
- `CONSUMER_EFFECT`;
- `BATCH_OR_BULK_ITEM`;
- `EXTERNAL_EXCHANGE`;
- `OFFLINE_OR_EVIDENCE`.

La conciliación debe señalar el alcance real en vez de etiquetar toda la venta como “fallida”.

---

#### 36. Vector de efectos

Para cada venta reconciliable se conserva un vector conceptual:

```text
VENTA          → estado propietario
EVENTO         → estado propietario
NEXO           → estado propio
NUMERA         → estado propio
PASS ACUMULAR  → estado propio
PASS REDIMIR   → estado propio cuando aplique
COMPENSACIONES → estado por propietaria
```

El resumen se deriva de esas unidades.

---

#### 37. Resultados mixtos

Es válido observar temporalmente:

```text
VENTA          = CONFIRMADA
EVENTO         = CONFIRMADO
NEXO           = CONFIRMADO
NUMERA         = PENDIENTE
PASS           = NO_APLICA
```

La respuesta correcta es gobernar el pendiente NUMERA.

No se repite la cadena completa.

---

#### 38. Resultado desconocido

Ante incertidumbre:

```text
RESULT_UNKNOWN
        ↓
CONSULTAR FUENTE AUTORITATIVA / RECEIPT / IDENTIDAD
        ├── CONFIRMADO → RECUPERAR RESULTADO
        ├── AUSENCIA DEMOSTRADA → RETRY SEGURO
        └── INDETERMINADO → RECONCILIATION_REQUIRED
```

Un caso no puede cerrarse todavía como éxito o fracaso.

---

#### 39. Retry

La conciliación puede autorizar retry únicamente cuando:

- corresponde al mismo alcance;
- conserva identidad;
- conserva huella;
- conserva propietaria;
- la política lo permite;
- no existe efecto confirmado incompatible;
- un resultado desconocido ha sido resuelto suficientemente.

Los efectos confirmados permanecen intactos.

---

#### 40. Agotamiento de retry

Agotar el presupuesto:

- no prueba fracaso;
- no prueba éxito;
- no inicia compensación automáticamente;
- no cambia de propietaria;
- no genera otra identidad;
- abre la disposición transversal aplicable.

---

#### 41. Acciones manuales permitidas

La conciliación reutiliza únicamente las acciones transversales aplicables:

- `RETRY_AUTHORIZED`;
- `QUERY_RECEIPT`;
- `CORRECT_METADATA`;
- `CREATE_SUCCESSOR`;
- `RELINK_EVIDENCE`;
- `REPROCESS_FROM_QUARANTINE`;
- `REPROCESS_FROM_DEAD_LETTER`;
- `PERMANENT_REJECT`;
- `START_RECONCILIATION`;
- `START_COMPENSATION`.

No se crea una acción local “forzar conciliado”.

---

#### 42. Corrección de metadata

`CORRECT_METADATA` solo puede corregir metadata permitida.

No puede cambiar:

- venta propietaria;
- fuente real;
- importe empresarial;
- producto empresarial;
- ledger;
- saldo;
- efecto confirmado;
- historial.

Un cambio material requiere la operación propietaria correspondiente.

---

#### 43. Mapping

La conciliación distingue:

- sin mapping;
- mapping candidato;
- mapping aprobado;
- mapping bloqueado;
- mapping liberado;
- mapping conflictivo.

Una coincidencia agregada no aprueba mapping individual.

---

#### 44. Cuarentena

Una línea en cuarentena:

- conserva evidencia original;
- no desaparece de la conciliación;
- no produce efectos prohibidos;
- no se marca reconciliada porque los totales diarios coincidan;
- puede liberar efectos pendientes después de resolución;
- nunca duplica efectos ya confirmados al liberarse.

---

#### 45. Mapping liberado

Cuando se resuelve un mapping:

1. se conserva el bloqueo histórico;
2. se reevalúan únicamente efectos que dependían de ese mapping;
3. se consultan resultados previos;
4. no se vuelve a reconocer ingreso ya confirmado;
5. no se vuelve a acreditar puntos ya confirmados;
6. no se vuelve a mover stock ya confirmado.

---

#### 46. Eventos tardíos

Un evento tardío:

- conserva occurred_at real;
- conserva procedencia;
- no se mueve de fecha empresarial para facilitar cierre;
- no reemplaza una revisión posterior;
- no se trata como duplicado solo por llegar tarde;
- puede reabrir o actualizar un caso mediante nueva evidencia.

---

#### 47. Fuera de orden

Un evento fuera de orden:

- puede diferirse;
- puede resultar stale;
- puede abrir conflicto;
- no sobrescribe una versión posterior;
- no se fuerza para igualar estados entre fuentes.

---

#### 48. Replay

Un replay:

- conserva `event_id`;
- conserva procedencia;
- conserva audiencia histórica;
- conserva el hecho original;
- permite recuperar resultados;
- no crea otra venta;
- no crea otro stock;
- no crea otro ingreso;
- no crea otros puntos;
- no consume otra vez una redención.

---

#### 49. Backfill

Un backfill:

- conserva procedencia;
- usa identidad determinista;
- identifica lote o ventana;
- compara contra historia existente;
- no activa efectos sensibles por defecto;
- no se usa para rellenar identidad individual inexistente;
- no convierte un agregado histórico en ventas individuales inventadas.

---

#### 50. Agregados de cobertura

Pueden utilizarse como controles:

- conteo de registros cuando la fuente lo soporte;
- cantidad;
- subtotal;
- impuesto;
- descuento;
- devolución;
- venta neta;
- agrupación por sede;
- fecha;
- producto;
- categoría.

Deben compararse únicamente cuando las definiciones de ambos lados sean semánticamente equivalentes.

---

#### 51. Igualdad agregada

```text
TOTAL A = TOTAL B
```

no implica:

```text
CADA VENTA A = CADA VENTA B
```

La igualdad agregada solo puede cerrar el control agregado específico.

---

#### 52. Diferencia agregada

Una diferencia agregada:

1. abre investigación;
2. identifica las dimensiones disponibles;
3. no se reparte arbitrariamente entre ventas;
4. no genera ajustes automáticos;
5. no genera movimientos de inventario;
6. no genera puntos;
7. no genera hechos económicos.

---

#### 53. Caso de conciliación

Cuando la política transversal requiera un caso, debe conservar como mínimo:

- operación o venta relacionada;
- proceso;
- propietaria;
- alcance;
- fuente;
- evento;
- consumidora;
- efecto;
- evidencia;
- clase de partialidad;
- diferencia;
- disposición;
- responsable;
- siguiente acción;
- condición de reactivación;
- cierre.

No se crea en esta tarea un identificador local alternativo a los contratos transversales.

---

#### 54. Propietaria del caso

La propietaria se determina por el hecho a resolver:

| Diferencia                                     | Propietaria                                  |
| ---------------------------------------------- | -------------------------------------------- |
| identidad o estado de venta                    | `PULSO`                                      |
| afirmación, archivo, mapping o receipt externo | adaptador / frontera externa correspondiente |
| movimiento físico                              | `NEXO`                                       |
| hecho económico                                | `NUMERA`                                     |
| puntos o redención                             | `PASS`                                       |
| pago                                           | `PULSO` o proveedor según contrato           |
| fiscal                                         | proveedor fiscal según contrato              |
| compensación                                   | propietaria del efecto original              |

---

#### 55. Cierre de una revisión

Una revisión de cobertura puede finalizar cuando:

1. el alcance está declarado;
2. las fuentes consultadas están declaradas;
3. las limitaciones están declaradas;
4. los controles agregados están calculados cuando son aplicables;
5. cada diferencia identificada tiene caso o disposición;
6. cada caso tiene propietaria;
7. cada caso tiene siguiente acción;
8. cada caso tiene condición de reactivación o resolución;
9. ningún resultado desconocido se transforma en confirmado;
10. ningún residual desaparece.

Finalizar la revisión no significa que todos los casos estén cerrados.

---

#### 56. Cierre de un caso individual

Un caso puede cerrarse cuando:

- la evidencia permite determinar el resultado;
- la propietaria confirmó su efecto o ausencia;
- la diferencia fue corregida mediante contrato autorizado;
- la compensación necesaria quedó verificada;
- un rechazo permanente quedó demostrado;
- un residual permitido fue aceptado por autoridad competente y permanece documentado;
- no queda outcome desconocido.

Un timeout o antigüedad no cierran el caso.

---

#### 57. Reapertura o revisión sucesora

Nueva evidencia puede exigir:

- nueva revisión;
- sucesión del caso;
- cambio de disposición permitido;
- corrección;
- compensación;
- recuperación.

El historial anterior permanece.

---

#### 58. Diferencias aceptadas

Aceptar un residual requiere:

- autoridad;
- razón;
- evidencia;
- alcance;
- impacto;
- responsable;
- condición de cierre o seguimiento.

“Aceptado” no significa “inexistente”.

---

#### 59. Sin escritura cruzada

La conciliación:

- lee;
- compara;
- clasifica;
- correlaciona;
- solicita acciones propietarias;
- registra evidencia y decisión.

No escribe directamente ledgers, saldos, ventas o estados privados de otra aplicación.

---

#### 60. Auditoría

Cada revisión y caso debe permitir reconstruir:

- fuentes consultadas;
- versiones;
- parámetros;
- venta;
- líneas;
- evento;
- entregas;
- inbox;
- efectos;
- receipts;
- retries;
- mapping;
- cuarentena;
- compensaciones;
- diferencias;
- decisión;
- autoridad;
- actor;
- tiempo;
- residual;
- cierre.

---

#### 61. Causalidad

Los timestamps no establecen causalidad por sí solos.

La conciliación usa:

- identidades;
- correlación;
- causación;
- versiones;
- source refs;
- receipts;
- evidencia.

---

#### 62. Privacidad

La conciliación usa la información mínima necesaria.

No copia por defecto:

- payloads personales completos;
- secretos;
- tokens;
- firmas completas;
- credenciales;
- datos financieros sensibles innecesarios.

La evidencia sensible permanece protegida por referencia.

---

#### 63. Visibilidad operativa

Una interfaz posterior deberá distinguir:

- confirmado;
- no aplicado;
- bloqueado;
- conflicto;
- desconocido;
- pendiente;
- aislado;
- compensado;
- residual;
- responsable.

No se reduce todo a “OK” o “Error”.

---

#### 64. Controles durante convivencia

Mientras la coexistencia esté activa, la conciliación debe poder detectar:

1. cobertura externa faltante;
2. cobertura PULSO faltante;
3. candidato de doble fuente;
4. venta sin evento;
5. evento sin venta;
6. entrega faltante;
7. efecto físico faltante;
8. efecto económico faltante;
9. fidelización faltante;
10. efecto huérfano;
11. duplicado;
12. conflicto de versión;
13. mapping pendiente;
14. cuarentena;
15. resultado desconocido;
16. compensación pendiente;
17. residual sin responsable.

---

#### 65. Estado técnico observado — importación externa

La línea base documental de `vento-shell` conserva una migración de importación diaria con:

- `pulso_daily_sales_import_batches`;
- `pulso_daily_sales_import_rows`;
- `source = 'makos_excel'` por defecto;
- `site_id`;
- `sales_date`;
- nombre y hash del archivo;
- conteos de filas;
- cantidades;
- subtotal;
- impuestos;
- descuentos;
- devoluciones;
- venta neta;
- mapping a catálogo o producto;
- estados de matching.

Esta estructura es útil como evidencia de cobertura y procedencia externa.

---

#### 66. Límite de la importación observada

Las filas observadas representan agregados de ítem por archivo y no contienen, en esa estructura, una identidad de venta individual.

Por tanto, esa estructura no demuestra por sí sola:

- paridad venta a venta;
- identidad individual de ticket;
- evento individual de venta;
- efecto individual NEXO;
- hecho individual NUMERA;
- movimiento individual PASS.

La conciliación permanente no puede inventar esas identidades.

---

#### 67. Estado técnico observado — posting de inventario

La línea base conserva además:

- `sale_out`;
- reglas de consumo;
- `pulso_sales_inventory_postings`;
- función de publicación del lote;
- movimientos de inventario;
- actualizaciones de stock por sede;
- actualizaciones de stock por ubicación;
- guardas para evitar repetir el mismo posting de fila/producto/ubicación/modalidad.

Estas piezas demuestran una integración física legacy asociada a la importación agregada.

---

#### 68. Límite del posting observado

La arquitectura observada no se eleva a contrato objetivo por existir.

La conciliación objetivo se apoya en:

- ledger propietario NEXO;
- receipts;
- idempotencia;
- causalidad;
- efecto consumidor;
- resultados recuperables.

Una escritura legacy existente puede ser evidencia a comparar, pero no autoridad para reescribir el contrato canónico.

---

#### 69. Estado técnico observado — consumidoras

Las líneas base vigentes de PULSO, NEXO, NUMERA y PASS permanecen distintas y no acreditan por sí solas una conciliación end-to-end desplegada.

Esta tarea no declara implementados:

- reconciler;
- case store;
- worker;
- dashboard;
- cola;
- scheduler;
- nuevas RPC;
- nuevas migraciones.

---

#### 70. No equivalencia entre documento y operación

La aprobación de esta tarea significa:

- contrato definido;
- diferencias definidas;
- propietarias definidas;
- acciones seguras definidas;
- fronteras definidas;
- handoffs definidos.

No significa:

- conciliación ejecutándose;
- datos reales reconciliados;
- cutover realizado;
- doble fuente bloqueada físicamente;
- adaptador retirado.

---

#### 71. Frontera de implementación posterior

La implementación deberá materializar, según paquete aprobado:

1. fuentes consultables;
2. correlación;
3. comparación por identidad;
4. comparación agregada;
5. clasificación de partialidad;
6. casos;
7. receipts;
8. acciones permitidas;
9. auditoría;
10. reintento selectivo;
11. compensación;
12. visibilidad;
13. ownership;
14. seguridad;
15. pruebas.

Esta tarea no escoge tablas, índices, jobs, cron, colas ni endpoints.

---

#### 72. Supabase

Toda futura materialización Supabase de:

- casos;
- vistas;
- índices;
- RPC;
- funciones;
- triggers;
- jobs;
- tablas;
- políticas;
- grants;
- tipos;

deberá originarse, versionarse y ejecutarse desde `vento-shell`.

No se autoriza ninguna modificación física en esta tarea.

---

#### 73. Handoffs posteriores obligatorios

| Pendiente material                          | Tarea o propietario                       | Condición de salida                                                                            |
| ------------------------------------------- | ----------------------------------------- | ---------------------------------------------------------------------------------------------- |
| contrato de corte                           | `INT-SALES-009`                           | toda combinación aplicable de sede, terminal y fecha efectiva puede resolver fuente autorizada |
| enforcement contra doble fuente             | `INT-SALES-010`                           | dos fuentes no pueden originar como nuevas dos representaciones de la misma venta              |
| retiro del adaptador                        | `INT-SALES-011`                           | consumidores internos continúan sin dependencia del POS externo                                |
| integración física NEXO                     | paquete propietario NEXO                  | venta aplicable produce movimiento y receipt exactamente una vez                               |
| integración económica NUMERA                | paquete propietario NUMERA                | venta material produce hecho económico exactamente una vez                                     |
| acumulación PASS                            | `PASS-INT-001`                            | acumulación y compensación son idempotentes y reconciliables                                   |
| redención PASS                              | `PASS-INT-002`                            | consumo y compensación son idempotentes y reconciliables                                       |
| infraestructura transversal de conciliación | paquete E3/E4 correspondiente             | casos, receipts, partialidad, auditoría y acciones seguras quedan materializados               |
| validación operativa de coexistencia        | paquete de piloto/cutover correspondiente | datos controlados demuestran detección, clasificación y resolución sin duplicar efectos        |

Ningún pendiente material queda sin propietaria y condición de salida.

---

#### 74. Prohibiciones

Queda prohibido:

1. declarar paridad individual desde agregados;
2. inventar identidad de venta;
3. prorratear un agregado para fabricar ventas;
4. elegir fuente por cercanía temporal;
5. elegir fuente por monto coincidente;
6. elegir fuente por producto coincidente;
7. elegir fuente por nombre de archivo;
8. reasignar procedencia por fecha de recepción;
9. fusionar automáticamente Makos y PULSO;
10. ocultar un candidato de doble fuente como duplicado técnico;
11. decidir el corte desde esta tarea;
12. materializar el control de doble fuente desde esta tarea;
13. retirar el adaptador desde esta tarea;
14. tratar publicación como entrega;
15. tratar entrega como efecto;
16. tratar inbox como efecto;
17. tratar éxito de una consumidora como éxito de otra;
18. tratar bloqueo como no aplicación;
19. cerrar resultado desconocido;
20. reintentar ciegamente un resultado desconocido;
21. repetir efectos confirmados;
22. repetir la venta completa por un consumidor pendiente;
23. crear otra identidad durante retry;
24. compensar un efecto no confirmado;
25. editar un ledger para “hacer cuadrar”;
26. editar saldo para “hacer cuadrar”;
27. editar venta histórica para “hacer cuadrar”;
28. crear movimiento NEXO desde conciliación;
29. crear hecho NUMERA desde conciliación;
30. crear puntos PASS desde conciliación;
31. crear redención PASS desde conciliación;
32. inferir cliente para cerrar fidelización;
33. inferir moneda para cerrar finanzas;
34. inferir producto para cerrar inventario;
35. considerar igualdad agregada como evidencia individual;
36. ocultar partialidad en un total;
37. cerrar un caso por antigüedad;
38. usar una acción manual fuera de la allowlist transversal;
39. forzar éxito;
40. borrar cola o evidencia como mecanismo de resolución;
41. usar replay para crear efectos nuevos;
42. usar backfill para fabricar historia;
43. reactivar efectos sensibles sin autorización;
44. crear una nueva taxonomía local de partialidad;
45. crear una nueva clave universal de conciliación;
46. crear una nueva definición normal de evento;
47. crear una transacción distribuida global;
48. modificar código, SQL, migraciones, RLS, RPC, datos, Supabase, credenciales o configuración remota;
49. iniciar o desarrollar `INT-SALES-009`.

---

#### 75. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el registro vigente ya protege la convergencia del POS externo y PULSO hacia contratos canónicos de venta y línea, la detección de ventas sin efectos y efectos sin venta, las fuentes competidoras, la conciliación con propietaria y evidencia, la partialidad por unidad, los resultados desconocidos, la independencia entre consumidoras, la idempotencia, el retry selectivo, la compensación, la auditoría, el mapping, la cuarentena, los hechos físicos, económicos y de fidelización, y la prohibición de reactivar efectos mediante replay o backfill. Esta tarea especializa esas obligaciones a la convivencia permanente de fuentes sin introducir una obligación verificable material nueva.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

---

#### 76. Cobertura de prueba existente preservada

Se preserva sin modificación, en especial:

- `TREQ-INTEGRATION-003`, para idempotencia, resultado recuperable y conciliación;
- `TREQ-INTEGRATION-006`, para fuentes competidoras y resolución con historia;
- `TREQ-INTEGRATION-011`, para conciliación de efectos físicos;
- `TREQ-INTEGRATION-014`, para coexistencia POS/PULSO, efectos exactamente una vez y diferencias de conciliación;
- `TREQ-INTEGRATION-015`, para fidelización y compensaciones;
- `TREQ-INTEGRATION-017`, para hechos económicos y conciliación NUMERA;
- `TREQ-INTEGRATION-151`, para retry crítico y conciliación al agotarse;
- `TREQ-INTEGRATION-155`, para replay y backfill;
- `TREQ-INTEGRATION-159`, para independencia de consumidoras;
- `TREQ-INTEGRATION-160` y `TREQ-INTEGRATION-161`, para cierre de retry sin compensación inferida;
- `TREQ-INTEGRATION-211`, para auditoría de conciliación;
- `TREQ-INTEGRATION-242`, para estado de conciliación y residuales;
- `TREQ-INTEGRATION-258` a `TREQ-INTEGRATION-287`, para partialidad, casos, scopes, resultados por unidad, unknown, intervención, conciliación, compensación, auditoría y ownership;
- `TREQ-INTEGRATION-288` a `TREQ-INTEGRATION-306`, para fronteras propietarias y prohibición de escrituras cruzadas;
- `TREQ-PULSO-001`, para flujo extremo a extremo de venta;
- `TREQ-PULSO-005`, para separación de estados comerciales;
- `TREQ-PULSO-006`, para conciliación de venta, pago, caja, reversos y pendientes;
- `TREQ-NEXO-011`, para ledger físico reconciliable;
- `TREQ-NEXO-183` a `TREQ-NEXO-186`, para receipts, proyecciones, reconciliación y compensación;
- `TREQ-NUMERA-001` a `TREQ-NUMERA-004`, para hechos económicos, trazabilidad, pagos, costos y conciliación;
- `TREQ-PASS-008` a `TREQ-PASS-011`, para ledger de fidelización, idempotencia, pagos, conciliación y compensaciones.

Ninguna fila cambia de identidad, texto, estado, relación, propietaria, evidencia ni secuencia por esta tarea.

---

#### 77. Decisiones congeladas

1. La convivencia se reconcilia sin elegir fuente por inferencia.
2. PULSO es propietaria de la venta interna.
3. Makos conserva procedencia externa histórica cuando aplique.
4. La recepción tardía no cambia fuente.
5. La conciliación no define el corte.
6. La conciliación no implementa el bloqueo de doble fuente.
7. La conciliación detecta candidatos de doble fuente.
8. Similitud no equivale a identidad.
9. Agregado no equivale a venta.
10. Igualdad agregada no equivale a paridad individual.
11. Venta, línea, evento, entrega y efecto se concilian por separado.
12. NEXO, NUMERA y PASS conservan propietarias distintas.
13. Efecto esperado se evalúa por aplicabilidad.
14. `NO_APLICA` y bloqueo son distintos.
15. Resultado desconocido permanece abierto.
16. Publicación no prueba entrega.
17. Entrega no prueba efecto.
18. ACK no prueba efecto.
19. Cada consumidora conserva resultado independiente.
20. Se reutiliza la política transversal de partialidad.
21. Se reutilizan sus nueve clases.
22. Se reutilizan sus ocho alcances.
23. Se reutiliza la allowlist de intervención.
24. No existe acción local de forzar éxito.
25. Retry es selectivo.
26. Retry conserva identidad.
27. Efectos confirmados no se repiten.
28. Agotamiento no implica compensación.
29. Compensación exige original confirmado.
30. Compensación conserva original y residual.
31. Mapping pendiente permanece visible.
32. Cuarentena no se cierra por totales.
33. Mapping liberado no duplica efectos.
34. Eventos tardíos conservan fecha real.
35. Eventos fuera de orden no retroceden estado.
36. Replay conserva identidades.
37. Backfill no fabrica ventas.
38. Una revisión puede finalizar con casos abiertos gobernados.
39. Un caso individual no cierra desconocido.
40. Nueva evidencia conserva historia.
41. Residual aceptado requiere autoridad.
42. La conciliación no hace escrituras cruzadas.
43. La auditoría conserva fuentes, criterio, decisión y residual.
44. La información sensible se minimiza.
45. La importación `makos_excel` observada sirve como evidencia agregada.
46. La estructura observada no demuestra venta individual.
47. El posting legacy observado sirve como evidencia, no como arquitectura canónica objetivo.
48. `INT-SALES-009` conserva corte.
49. `INT-SALES-010` conserva doble fuente.
50. `INT-SALES-011` conserva retiro.
51. Se crean cero cambios `TREQ-*`.
52. No se genera una copia del registro canónico de requisitos.
53. Se crean cero objetos físicos.
54. Se modifican cero objetos físicos.
55. No se modifica código, SQL, migraciones, datos, Supabase, credenciales ni configuración remota.

---

#### 78. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. mantiene `INT-SALES-007` como tarea anterior aprobada;
2. mantiene `INT-SALES-009` como única tarea siguiente reservada;
3. define convivencia sin asumir doble autoridad;
4. conserva PULSO como propietaria de venta interna;
5. conserva Makos como procedencia histórica cuando corresponda;
6. impide reclasificar por recepción tardía;
7. define unidad de conciliación;
8. define niveles de comparación;
9. exige identidad individual para paridad individual;
10. limita agregados a control agregado;
11. prohíbe prorrateo de agregados;
12. define revisión por fecha empresarial;
13. no inventa hora de cierre;
14. conserva revisión y nueva evidencia;
15. define cadena fuente–venta–evento–efectos;
16. define aplicabilidad NEXO;
17. define aplicabilidad NUMERA;
18. define aplicabilidad PASS;
19. mantiene redención separada;
20. define fuentes propietarias;
21. define diferencias de fuente;
22. define diferencias de venta;
23. define candidato de doble fuente;
24. no resuelve ese candidato por similitud;
25. reserva el corte a `INT-SALES-009`;
26. reserva enforcement a `INT-SALES-010`;
27. define diferencias de evento;
28. separa publicación, entrega e impacto;
29. define conciliación NEXO;
30. prohíbe segundo movimiento para reparar proyección;
31. define conciliación NUMERA;
32. separa venta, pago y caja;
33. define conciliación PASS acumulación;
34. define conciliación PASS redención;
35. define conciliación de compensaciones;
36. prohíbe compensación cruzada;
37. reutiliza las clases de partialidad;
38. reutiliza los scopes de fallo;
39. conserva vector de efectos;
40. admite resultados mixtos explícitos;
41. define resultado desconocido;
42. define retry seguro;
43. define agotamiento de retry;
44. reutiliza acciones manuales;
45. limita corrección de metadata;
46. define estados de mapping;
47. define cuarentena;
48. define liberación sin duplicados;
49. define eventos tardíos;
50. define fuera de orden;
51. define replay;
52. define backfill;
53. define agregados;
54. prohíbe igualdad agregada como prueba individual;
55. define tratamiento de diferencia agregada;
56. define caso de conciliación;
57. define propietaria del caso;
58. diferencia cierre de revisión y cierre de caso;
59. prohíbe cerrar unknown;
60. define revisión sucesora;
61. gobierna residual aceptado;
62. prohíbe escritura cruzada;
63. hace reconstruible auditoría;
64. conserva causalidad por IDs y versiones;
65. minimiza datos;
66. define estados visibles;
67. enumera controles de convivencia;
68. diagnostica importación externa observada;
69. declara su límite individual;
70. diagnostica posting legacy observado;
71. evita canonizarlo por existencia;
72. diferencia aprobación documental de operación;
73. asigna implementación posterior;
74. mantiene Supabase en `vento-shell`;
75. asigna cada pendiente a propietaria y condición de salida;
76. genera cero requisitos de prueba nuevos;
77. modifica cero requisitos de prueba;
78. no genera una copia del registro canónico de requisitos;
79. crea cero objetos físicos;
80. modifica cero objetos físicos;
81. no modifica código, SQL, migraciones, datos, Supabase, credenciales ni configuración remota;
82. no inicia ni desarrolla `INT-SALES-009`.

---

#### 79. Resultado de la tarea

`INT-SALES-008` queda definida como la conciliación permanente que permite operar una coexistencia controlada entre evidencia del POS externo y ventas PULSO sin fabricar identidad, sin ocultar partialidad y sin duplicar efectos.

Resultado consolidado:

```text
FUENTES IDENTIFICADAS
+
PROCEDENCIA PRESERVADA
+
VENTAS Y LÍNEAS CORRELACIONABLES
+
EVENTOS TRAZABLES
+
ENTREGAS POR CONSUMIDORA
+
EFECTOS POR PROPIETARIA
+
RECEIPTS Y RESULTADOS
+
PARTIALIDAD EXPLÍCITA
+
CASOS CON RESPONSABLE
+
RETRY SELECTIVO
+
COMPENSACIÓN PROPIETARIA
+
EVIDENCIA Y AUDITORÍA
→
CONVIVENCIA RECONCILIABLE SIN FALSA PARIDAD
```

Sin decidir todavía el corte, sin elegir automáticamente entre Makos y PULSO y sin materializar el bloqueo permanente de doble fuente.

---

#### 80. Continuidad

ÚLTIMA TAREA APROBADA

`INT-SALES-007 — Definir control contra efectos duplicados por reintento`

TAREA ACTUAL APROBADA

`INT-SALES-008 — Definir conciliación de convivencia entre POS externo y PULSO`

SIGUIENTE TAREA RESERVADA

`INT-SALES-009 — Definir corte por sede, terminal y fecha efectiva`


### ✅ INT-SALES-009 — Definir corte por sede, terminal y fecha efectiva

**Estado:** APROBADA
**Tarea anterior:** `INT-SALES-008 — Definir conciliación de convivencia entre POS externo y PULSO`
**Tarea siguiente:** `INT-SALES-010 — Definir control que impida que ambas fuentes emitan la misma venta`
**Tipo de tarea:** documental; definición normativa permanente del corte de autoridad de origen de nuevas ventas entre el POS externo y PULSO por sede, terminal y fecha efectiva, materializando la regla temporal de resolución, exclusividad de intervalos, tratamiento de ventas tardías, offline, revisiones, devoluciones, replay, backfill, ambigüedad, reasignación posterior y evidencia requerida, sin ejecutar el cutover, sin implementar todavía la guardia física contra doble fuente y sin modificar código, SQL, migraciones, Supabase, datos, credenciales o configuración remota
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/07_VENTAS_INVENTARIO_FINANZAS_Y_FIDELIZACION.md`
**Contrato transitorio heredado:** `INT-POS-023 — Definir transición futura desde POS externo hacia PULSO`
**Aplicación propietaria de la venta canónica interna y de su emisión empresarial:** `PULSO`
**Fuente externa anterior vigente en la transición:** `Makos`
**Fuente objetivo de nuevas ventas después del corte:** `PULSO`
**Aplicación propietaria del efecto físico:** `NEXO`
**Aplicación propietaria del hecho económico:** `NUMERA`
**Aplicación propietaria de fidelización:** `PASS`
**Línea base documental:** `vento-shell@91ecb643361d4855cb332908184ba3401d46dfb2`
**Línea base técnica PULSO observada:** `vento-pulso@71e0184486b5fe11e0a42435baf4024807a80efd`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma permanente cómo se resuelve cuál fuente está autorizada para originar una **nueva venta** durante y después de la transición Makos → PULSO.

La decisión se toma por:

```text
SEDE
+
TERMINAL
+
LÍMITE EFECTIVO
+
PRECISIÓN TEMPORAL ACREDITADA
+
TIEMPO EMPRESARIAL DEL HECHO
```

y nunca por:

```text
HORA DE RECEPCIÓN
O
HORA DE IMPORTACIÓN
O
HORA DE SINCRONIZACIÓN
O
HORA DE RETRY
O
SIMILITUD DE TOTALES
```

El objetivo es que para toda venta nueva permitida exista una única autoridad de origen resoluble, preservando la historia anterior y sin cambiar los contratos consumidores de NEXO, NUMERA o PASS.

---

#### 2. Resultado sustantivo

`INT-SALES-009` congela las siguientes decisiones permanentes:

1. El corte es un cambio de **autoridad de fuente para nuevas ventas**.
2. El corte no es una migración destructiva de historia.
3. El corte se resuelve por sede, terminal y límite efectivo.
4. No existe un cutover global implícito para toda Vento.
5. Cortar una terminal no corta automáticamente las demás terminales de la sede.
6. Makos conserva autoridad histórica sobre ventas cuyo hecho empresarial pertenece al intervalo anterior.
7. PULSO adquiere autoridad para nuevas ventas del alcance desde el límite efectivo incluido.
8. La regla temporal es anterior/posterior al límite, no anterior/posterior a la recepción técnica.
9. Una venta Makos pre-corte recibida tarde continúa siendo Makos.
10. Una venta PULSO post-corte creada offline continúa siendo PULSO aunque sincronice tarde.
11. Una venta Makos post-corte de una terminal ya transferida es un conflicto de autoridad.
12. Una venta PULSO pre-corte en un alcance todavía autorizado a Makos es un conflicto de autoridad salvo que exista otra decisión temporal aprobada que demuestre lo contrario.
13. Terminal no resoluble implica bloqueo.
14. Tiempo empresarial insuficiente para ubicar la venta respecto del límite implica bloqueo.
15. Identidad de venta insuficiente implica cuarentena o conciliación; no se fabrica una venta.
16. No se inventan segundos, minutos, horas ni terminales para hacer coincidir una venta con un lado del corte.
17. La fuente histórica no cambia por replay.
18. La fuente histórica no cambia por backfill.
19. La fuente histórica no cambia por retry.
20. La fuente histórica no cambia por retirada futura del adaptador.
21. La identidad canónica de venta y línea se conserva.
22. `source_system` conserva la procedencia real.
23. `producer_application` continúa siendo PULSO para el evento canónico interno cuando corresponda.
24. El evento consumidor no cambia de esquema por el corte.
25. La audiencia canónica no cambia por el corte.
26. NEXO conserva su frontera propietaria.
27. NUMERA conserva su frontera propietaria.
28. PASS conserva su frontera propietaria.
29. Venta, pago, caja, fiscalidad y contabilidad permanecen hechos y autoridades separados.
30. El corte no transfiere proveedor de pago por inferencia.
31. El corte no transfiere autoridad fiscal por inferencia.
32. El corte no ejecuta compensaciones.
33. Una acción posterior sobre una venta histórica referencia la venta original y su fuente original.
34. Una devolución post-corte de una venta Makos pre-corte no se transforma en una nueva venta PULSO negativa.
35. El acceso Makos puede conservarse residual para historia y conciliación sin conservar autoridad sobre nuevas ventas.
36. La reducción o retiro físico de ese acceso queda fuera de esta tarea.
37. Una caída de PULSO post-corte no devuelve automáticamente autoridad a Makos.
38. Reasignar autoridad después de un corte efectivo requiere otra decisión temporal explícita.
39. Una reasignación futura no puede solapar intervalos ni reescribir los anteriores.
40. La conciliación de `INT-SALES-008` permanece activa alrededor del corte.
41. La guardia física contra doble fuente permanece en `INT-SALES-010`.
42. El retiro del adaptador permanece en `INT-SALES-011`.
43. Se crean cero requisitos `TREQ-*`.
44. Se modifican cero requisitos `TREQ-*`.
45. Se crean cero objetos físicos.
46. Se modifican cero objetos físicos.

---

#### 3. Dependencias canónicas consumidas

Esta tarea consume sin reabrir:

- `INT-POS-023`, para el contrato transitorio ya aprobado de cambio de autoridad Makos → PULSO;
- `INT-SALES-001`, para identidad y registro durable de venta y línea;
- `INT-SALES-002`, para emisión empresarial PULSO y separación entre `source_system` y `producer_application`;
- `INT-SALES-003`, para efecto físico NEXO;
- `INT-SALES-004`, para efecto económico NUMERA;
- `INT-SALES-005`, para acumulación PASS;
- `INT-SALES-006`, para redención PASS;
- `INT-SALES-007`, para retry, redelivery, replay y recuperación sin nueva identidad;
- `INT-SALES-008`, para conciliación de convivencia, candidatos de doble fuente y tratamiento de diferencias.

La tarea no redefine esas fronteras.

---

#### 4. Frontera frente a las tareas siguientes

| Materia                                                                      | Propietaria     | Estado en esta tarea |
| ---------------------------------------------------------------------------- | --------------- | -------------------- |
| resolver autoridad temporal de origen                                        | `INT-SALES-009` | **DEFINIDA**         |
| clasificar venta de fuente no autorizada como conflicto                      | `INT-SALES-009` | **DEFINIDA**         |
| implementar la guardia que impide una segunda venta desde fuente competidora | `INT-SALES-010` | `RESERVADA`          |
| retirar el adaptador externo sin cambiar consumidores                        | `INT-SALES-011` | `RESERVADA`          |

Esta tarea define qué fuente **debe** ser autorizada; no implementa todavía el mecanismo físico que impedirá una violación.

---

#### 5. Unidad mínima de decisión

La unidad mínima del corte es:

```text
SEDE
+
TERMINAL
+
LÍMITE EFECTIVO
+
PRECISIÓN TEMPORAL ACREDITADA
```

Cada decisión debe poder resolver además:

- fuente anterior;
- fuente posterior;
- semántica temporal aplicable;
- versión contractual;
- autoridad que aprobó el cambio cuando corresponda;
- evidencia suficiente del alcance;
- estado de conciliación previo;
- residuales conocidos.

No se crea en esta tarea una tabla, un identificador físico ni un enum.

---

#### 6. No existe cutover global implícito

Una sede puede tener varias terminales con límites distintos.

Ejemplo conceptual:

```text
SEDE A
├── TERMINAL 1 → PULSO DESDE LÍMITE T1
├── TERMINAL 2 → MAKOS HASTA LÍMITE T2
└── TERMINAL 3 → BLOQUEADA SI NO PUEDE RESOLVERSE SU AUTORIDAD
```

Por tanto:

1. transferir una terminal no transfiere las demás;
2. una venta sin terminal resoluble no puede heredar por defecto la fuente de otra terminal;
3. un total agregado por sede no demuestra el origen individual de las ventas de terminales con límites distintos;
4. una terminal fuera del alcance explícito no adopta autoridad PULSO por inferencia.

---

#### 7. Regla temporal exacta

Para una sede y terminal cuyo límite efectivo sea `T`:

```text
tiempo_empresarial_del_hecho < T
→ FUENTE AUTORIZADA = MAKOS

tiempo_empresarial_del_hecho >= T
→ FUENTE AUTORIZADA = PULSO
```

La igualdad con el límite pertenece al intervalo posterior.

Esta regla solo puede aplicarse cuando la precisión temporal acreditada permite realizar la comparación sin inventar información.

---

#### 8. Fecha efectiva y precisión

La fecha efectiva es obligatoria.

Si el contrato fuente dispone de mayor precisión temporal, esa precisión se conserva.

Reglas:

1. no se reduce artificialmente un timestamp acreditado a una fecha si eso introduce ambigüedad;
2. no se inventa una hora cuando la fuente solo acredita precisión diaria;
3. si la operación requiere un corte intradía pero la evidencia no permite distinguir hechos dentro del día, el alcance permanece bloqueado;
4. el límite debe ser representable con la precisión realmente acreditada;
5. la precisión utilizada forma parte de la evidencia del corte;
6. el cliente o importador no puede “aproximar” el lado del corte.

---

#### 9. Tiempo empresarial frente a tiempos técnicos

Permanecen separados:

```text
TIEMPO DEL HECHO COMERCIAL
≠
TIEMPO DE RECEPCIÓN
≠
TIEMPO DE IMPORTACIÓN
≠
TIEMPO DE SINCRONIZACIÓN
≠
TIEMPO DE RETRY
≠
TIEMPO DE REPLAY
```

La autoridad se determina con el tiempo empresarial aprobado del hecho.

Los tiempos técnicos sirven para auditoría, latencia y diagnóstico, no para reasignar procedencia.

---

#### 10. Intervalos exclusivos

Para una misma sede y terminal:

```text
INTERVALO MAKOS
        ↓
LÍMITE EFECTIVO
        ↓
INTERVALO PULSO
```

Invariantes:

1. no existe solapamiento de autoridad;
2. no existe un intervalo implícito con ambas fuentes autorizadas;
3. no existe un intervalo sin autoridad para ventas que la operación permita crear;
4. el intervalo anterior no se reescribe;
5. una decisión posterior agrega otro límite; no altera retrospectivamente los anteriores;
6. el orden de llegada de datos no altera los intervalos.

---

#### 11. Resolver de autoridad

Antes de aceptar una nueva venta como perteneciente a una fuente, el contrato debe poder resolver lógicamente:

1. sede;
2. terminal;
3. tiempo empresarial;
4. precisión suficiente;
5. intervalo de autoridad aplicable;
6. fuente observada;
7. identidad de venta;
8. revisión aplicable;
9. huella lógica;
10. resultado previo cuando exista.

Resultado:

```text
UN ÚNICO INTERVALO
+
FUENTE OBSERVADA = FUENTE AUTORIZADA
→ CONTINUAR CONTRATO CANÓNICO
```

```text
CERO INTERVALOS RESOLUBLES
→ BLOQUEADO
```

```text
MÁS DE UN INTERVALO APLICABLE
→ CONFLICTO DE AUTORIDAD
```

```text
FUENTE OBSERVADA ≠ FUENTE AUTORIZADA
→ CONFLICTO DE AUTORIDAD
```

---

#### 12. Venta Makos pre-corte recibida antes

Una venta cuyo hecho empresarial ocurre antes de `T` y llega antes del corte:

- conserva Makos como fuente;
- ingresa por el contrato de transición;
- conserva procedencia;
- utiliza la misma venta canónica y evento PULSO cuando corresponda;
- no se convierte en venta nativa PULSO.

---

#### 13. Venta Makos pre-corte recibida tarde

Una venta cuyo hecho empresarial ocurre antes de `T` y llega después:

```text
OCURRIÓ ANTES
+
LLEGÓ DESPUÉS
→ SIGUE SIENDO MAKOS
```

Debe conservar:

- identidad original;
- procedencia;
- tiempo original;
- recepción tardía;
- revisión;
- evidencia;
- correlación;
- resultados previos.

No se reasigna a PULSO por haber llegado después del límite.

---

#### 14. Venta PULSO post-corte

Una venta nueva originada en PULSO dentro del alcance después de `T`:

- tiene PULSO como fuente;
- utiliza identidad canónica de venta y línea;
- usa el mismo contrato empresarial;
- produce el mismo tipo de evento canónico aplicable;
- utiliza la misma audiencia;
- se procesa por las mismas fronteras NEXO, NUMERA y PASS.

No existe un “evento post-corte” diferente.

---

#### 15. Venta PULSO offline post-corte

Si una modalidad offline autorizada permite crear la venta después de `T`:

- la venta conserva origen PULSO;
- conserva su tiempo empresarial original;
- conserva su identidad durante sincronización;
- una sincronización posterior no cambia la fuente;
- retry no crea otra venta;
- Makos no se usa como fallback para reemitirla.

Esta tarea no crea ni habilita una modalidad offline nueva.

---

#### 16. Venta Makos post-corte

Si una venta atribuida a Makos aparece con tiempo empresarial igual o posterior a `T` para una terminal transferida:

```text
FUENTE OBSERVADA = MAKOS
+
FUENTE AUTORIZADA = PULSO
→ CONFLICTO DE AUTORIDAD
```

Tratamiento contractual:

1. conservar evidencia;
2. no reclasificar silenciosamente;
3. no inventar una venta PULSO equivalente;
4. consultar identidad y resultado previo;
5. abrir o continuar conciliación;
6. impedir conceptualmente una segunda emisión empresarial.

La materialización física de la última guarda corresponde a `INT-SALES-010`.

---

#### 17. Venta PULSO antes del corte

Si PULSO origina una nueva venta antes del límite en un alcance cuya autoridad continúa en Makos:

```text
FUENTE OBSERVADA = PULSO
+
FUENTE AUTORIZADA = MAKOS
→ CONFLICTO DE AUTORIDAD
```

No se convierte automáticamente en excepción permitida.

Solo otra decisión temporal válida y no solapada podría demostrar que PULSO tenía autoridad para ese hecho.

---

#### 18. Misma venta observada en ambas fuentes

Si existe evidencia Makos y PULSO que podría representar la misma venta:

1. no se fusiona por similitud;
2. no se elige por timestamp de recepción;
3. no se elige por importe;
4. no se elige por producto;
5. no se elige por archivo;
6. se resuelve primero el intervalo de autoridad;
7. se consulta identidad y resultados previos;
8. permanece conflicto o candidato de duplicado cuando la identidad no pueda demostrarse.

`INT-SALES-010` implementará la guardia permanente contra la segunda originación.

---

#### 19. Terminal no resoluble

Si la terminal no puede resolverse inequívocamente:

```text
TERMINAL = INDETERMINADA
→ CORTE NO RESOLUBLE
→ BLOQUEADO
```

Queda prohibido:

- usar la primera terminal de la sede;
- usar la terminal del usuario actual;
- usar la terminal que “parece” corresponder;
- copiar la terminal de otra venta;
- convertir un agregado de sede en evidencia de terminal.

---

#### 20. Tiempo no resoluble

Si el tiempo empresarial no tiene precisión suficiente para ubicar el hecho respecto de `T`:

```text
TIEMPO INSUFICIENTE
→ BLOQUEADO
```

Se conserva la evidencia y se concilia.

No se usa:

- `received_at`;
- fecha de importación;
- posición de fila;
- hora de carga;
- hora del worker;

como sustituto del tiempo empresarial.

---

#### 21. Identidad insuficiente

Si la fuente no permite demostrar una venta individual:

- no se fabrica `canonical_sale_id`;
- no se fabrican líneas;
- no se fabrica `event_id`;
- no se asigna una venta agregada a una terminal por prorrateo;
- no se declara paridad individual;
- el dato puede conservarse como evidencia agregada de cobertura.

---

#### 22. Importación `makos_excel` observada

La línea técnica actual conserva un importador con:

- `site_id`;
- `sales_date`;
- `source = 'makos_excel'`;
- archivo y hash;
- filas por artículo;
- cantidad;
- subtotal;
- impuestos;
- descuentos;
- devoluciones;
- venta neta;
- mapping a catálogo o producto.

La estructura observada no contiene en su contrato de staging:

- identidad de venta individual;
- identidad de terminal individual;
- identidad de línea dentro de una venta individual.

Consecuencia:

```text
MAKOS_EXCEL AGREGADO ACTUAL
≠
EVIDENCIA SUFICIENTE PARA MATERIALIZAR
UN CORTE INDIVIDUAL POR TERMINAL
```

Esta tarea no modifica el importador.

---

#### 23. Parser PULSO observado

La superficie vigente de importación PULSO interpreta el XLSX por filas de producto y cantidad y conserva campos agregados de ventas.

Esa implementación sirve como evidencia del estado técnico actual, pero no acredita:

- venta individual;
- terminal individual;
- hora empresarial individual;
- ticket;
- cliente;
- pago individual;
- evento empresarial individual.

El contrato permanente del corte no se reduce a la granularidad del parser existente.

---

#### 24. Identidad histórica

A través del corte se preservan:

- identidad canónica de venta;
- identidad de línea;
- identidad externa cuando exista;
- fuente;
- instancia externa cuando aplique;
- revisión;
- tiempo empresarial;
- tiempo de recepción;
- payload original o referencia;
- hash;
- mapping y versión;
- sede;
- terminal;
- correlación con evento;
- efectos;
- receipts;
- compensaciones.

El corte nunca renumera ni recrea historia para uniformar reportes.

---

#### 25. `source_system` y `producer_application`

Se preserva:

Antes del corte:

```text
source_system = MAKOS
producer_application = PULSO
```

Después del corte:

```text
source_system = PULSO
producer_application = PULSO
```

El cambio de `source_system` para nuevas ventas no cambia la productora empresarial del evento PULSO ni la audiencia de consumidoras.

---

#### 26. Evento canónico

Una venta pre-corte Makos y una post-corte PULSO convergen hacia el mismo contrato canónico de venta cuando son válidas.

El corte no modifica:

- catálogo de eventos;
- definición;
- versión por conveniencia;
- `event_id` de eventos ya existentes;
- reglas de audiencia;
- finalidad;
- sensibilidad;
- correlación;
- causación.

Replay y redelivery conservan el evento original.

---

#### 27. NEXO

El corte no cambia el contrato físico.

NEXO conserva:

- inbox;
- identidad de efecto;
- movement group;
- legs;
- UOM;
- cantidades;
- origen físico;
- receipt;
- proyecciones;
- correcciones;
- compensaciones.

Una venta duplicada por fuente competidora no debe producir un segundo movimiento.

La guardia física contra esa segunda originación se materializará conforme a `INT-SALES-010` y los paquetes propietarios.

---

#### 28. NUMERA

El corte no cambia el contrato económico.

NUMERA conserva:

- inbox;
- `SALE_ECONOMIC_FACT`;
- entidad;
- sede;
- centro;
- moneda;
- ocurrencia;
- reconocimiento;
- documento;
- importe;
- impuestos;
- resultado;
- reverso;
- compensación.

Una venta histórica Makos no se vuelve un hecho económico PULSO nuevo por el corte.

---

#### 29. PASS

El corte no cambia:

- cuenta;
- regla;
- versión;
- base;
- elegibilidad;
- ledger;
- saldo;
- acumulación;
- redención;
- compensación.

Una venta Makos histórica y una venta PULSO nativa utilizan la misma frontera PASS aplicable.

El cambio de fuente de ventas futuras no vuelve a acreditar una venta histórica.

---

#### 30. Pagos, caja y fiscalidad

Se preserva:

```text
FUENTE DE VENTA
≠
PAGO
≠
CAJA
≠
PROVEEDOR DE PAGO
≠
DOCUMENTO FISCAL
≠
CONTABILIDAD OFICIAL
```

El corte no autoriza por sí solo:

- cambiar proveedor de pagos;
- cerrar caja;
- emitir documento fiscal;
- cambiar proveedor fiscal;
- convertir NUMERA en contabilidad oficial.

Cada frontera conserva su propia tarea y autoridad.

---

#### 31. Revisiones post-corte de ventas pre-corte

Una revisión válida de una venta Makos pre-corte:

- conserva la misma venta;
- conserva Makos como procedencia del original;
- conserva el vínculo con la revisión anterior;
- no crea una venta PULSO nueva;
- solo altera los efectos que el cambio material realmente requiera;
- conserva los resultados que no cambian.

---

#### 32. Anulación post-corte

Una anulación posterior al corte:

- referencia la venta original;
- conserva la fuente original;
- no borra la venta;
- no crea una nueva venta negativa;
- utiliza los contratos de corrección o compensación aplicables;
- no devuelve autoridad a Makos para nuevas ventas.

---

#### 33. Devolución y reembolso post-corte

Una devolución o reembolso de una venta pre-corte:

```text
VENTA HISTÓRICA
→ HECHO POSTERIOR CORRELACIONADO
→ EFECTOS PROPIETARIOS
→ COMPENSACIONES CUANDO CORRESPONDA
```

Nunca:

```text
HECHO POSTERIOR
→ REESCRIBIR FUENTE DE LA VENTA ORIGINAL
```

---

#### 34. Resultado desconocido cruzando el corte

Si un efecto o venta queda con resultado desconocido alrededor de `T`:

1. el corte no resuelve el resultado por sí solo;
2. se consulta la identidad original;
3. se consulta receipt o resultado propietario;
4. retry conserva identidad;
5. si el hecho ocurrió antes del límite, conserva la autoridad histórica correspondiente;
6. si no puede determinarse, queda en conciliación;
7. no se genera otra venta en el otro lado del límite para “asegurar” el registro.

---

#### 35. Retry cruzando el corte

Un retry iniciado después de `T` puede pertenecer a una venta ocurrida antes de `T`.

Por tanto:

```text
FECHA DEL RETRY
≠
FUENTE DE LA VENTA
```

Retry conserva:

- venta;
- líneas;
- fuente;
- huella;
- evento;
- audiencia;
- consumidoras;
- resultados previos.

---

#### 36. Replay cruzando el corte

Replay:

- conserva `event_id`;
- conserva `occurred_at`;
- conserva fuente;
- conserva audiencia histórica;
- no crea otra venta;
- no transforma Makos en PULSO;
- no vuelve a aplicar efectos confirmados.

El momento del replay no decide autoridad de origen.

---

#### 37. Backfill cruzando el corte

Backfill:

- conserva procedencia;
- conserva lote o ventana;
- utiliza identidades deterministas;
- concilia contra historia;
- no convierte agregados en ventas individuales inventadas;
- no crea eventos sensibles por defecto;
- no cambia Makos a PULSO para simplificar datos históricos.

---

#### 38. Falla de PULSO después del corte

Para una terminal ya transferida, una degradación de PULSO:

- no reactiva Makos automáticamente;
- no amplía el acceso Makos;
- no cambia intervalos históricos;
- no autoriza reemitir ventas PULSO en Makos;
- debe utilizar la contingencia aprobada por su proceso y paquete correspondiente.

Si fuera necesario devolver autoridad a Makos, debe existir una nueva decisión explícita de fuente.

---

#### 39. Reasignación futura de autoridad

Después de un intervalo PULSO válido, una reasignación futura exige otro límite explícito.

Ejemplo conceptual:

```text
MAKOS
[---------)

        T1

PULSO
          [----------------)

                           T2

FUENTE FUTURA AUTORIZADA
                             [---------)
```

Reglas:

1. no se extiende retrospectivamente Makos;
2. no se borra PULSO;
3. no se reescriben ventas;
4. no se solapan intervalos;
5. cada nuevo límite conserva razón y autoridad;
6. las consumidoras no reejecutan efectos por el cambio;
7. la conciliación verifica diferencias alrededor del nuevo límite.

---

#### 40. Reprogramación antes del límite

Antes de que un límite entre en vigor, una decisión autorizada puede:

- bloquear;
- cancelar;
- reprogramar;

el cutover si una precondición deja de cumplirse.

La reprogramación:

- conserva evidencia de la decisión anterior;
- no altera historia de ventas;
- no produce compensaciones por sí sola;
- no convierte PULSO en fuente antes del nuevo límite;
- exige reevaluar las precondiciones aplicables.

---

#### 41. Corte ya efectivo

Después de que el límite entró en vigor y PULSO originó ventas válidas:

- no se edita el límite para fingir que PULSO nunca tuvo autoridad;
- no se borra el intervalo;
- no se reclasifican las ventas PULSO;
- cualquier cambio futuro utiliza una nueva decisión temporal.

---

#### 42. Acceso Makos residual

Después del corte, el adaptador puede necesitar lectura residual para:

- ventas realmente pre-corte recibidas tarde;
- evidencia histórica;
- revisiones históricas;
- anulaciones;
- devoluciones;
- reembolsos;
- resultados desconocidos;
- compensaciones;
- conciliación.

Ese acceso residual:

```text
LECTURA / EVIDENCIA HISTÓRICA
≠
AUTORIDAD PARA NUEVAS VENTAS
```

---

#### 43. Límite con `INT-SALES-010`

`INT-SALES-009` define:

```text
QUÉ FUENTE ESTÁ AUTORIZADA
```

`INT-SALES-010` definirá:

```text
CÓMO IMPEDIR QUE UNA FUENTE NO AUTORIZADA
PRODUZCA UNA SEGUNDA VENTA
```

Por tanto, esta tarea puede clasificar `CONFLICTO DE AUTORIDAD`, pero no selecciona todavía:

- constraint;
- tabla de guardia;
- RPC;
- claim;
- lock;
- índice;
- servicio;
- middleware;
- worker;
- trigger.

---

#### 44. Límite con `INT-SALES-011`

`INT-SALES-011` cerrará el retiro del adaptador externo.

Esta tarea no decide:

- fecha de apagado del adaptador;
- eliminación de código;
- eliminación de credenciales;
- revocación física;
- borrado de staging;
- retención física final.

Sí deja congelado que retirar el adaptador no puede cambiar la procedencia histórica ni los contratos de consumidoras.

---

#### 45. Conciliación alrededor del corte

`INT-SALES-008` debe poder comparar:

```text
INTERVALO DE AUTORIDAD
↔
FUENTE OBSERVADA
↔
VENTA
↔
LÍNEAS
↔
EVENTO
↔
NEXO
↔
NUMERA
↔
PASS
↔
COMPENSACIONES
```

Alrededor del límite deben detectarse como mínimo:

- Makos pre-corte faltante;
- Makos post-corte;
- PULSO pre-corte no autorizado;
- misma venta en ambas fuentes;
- terminal no resoluble;
- tiempo no resoluble;
- venta sin evento;
- evento sin venta;
- efecto sin venta;
- efecto faltante;
- duplicado;
- revisión tardía;
- compensación pendiente;
- residual;
- resultado desconocido.

---

#### 46. Igualdad agregada no prueba corte correcto

```text
TOTAL MAKOS = TOTAL PULSO
```

no demuestra:

- terminal correcta;
- identidad correcta;
- intervalo correcto;
- fuente correcta;
- ausencia de doble venta.

Los agregados pueden apoyar cobertura, nunca sustituir la decisión individual cuando el alcance exige identidad individual.

---

#### 47. Evidencia mínima de una futura materialización

Una implementación o ejecución futura deberá poder conservar:

- sede;
- terminal;
- límite efectivo;
- precisión temporal;
- fuente anterior;
- fuente posterior;
- versión contractual;
- autoridad de la decisión;
- evidencia de readiness;
- estado de conciliación;
- última venta válida del intervalo anterior cuando sea determinable;
- primera venta válida del intervalo posterior cuando sea determinable;
- ventas tardías;
- conflictos de autoridad;
- candidatos de doble fuente;
- eventos;
- resultados consumidores;
- resultados desconocidos;
- compensaciones;
- residuales.

Esta tarea no afirma que esa evidencia exista hoy para un alcance real.

---

#### 48. Readiness de un alcance

Antes de una futura activación física, el alcance debe demostrar como mínimo:

1. sede resoluble;
2. terminal resoluble;
3. semántica temporal suficiente;
4. identidad de venta estable;
5. identidad de línea estable;
6. fuente externa acreditada para historia previa;
7. PULSO capaz de originar la venta canónica posterior;
8. evento PULSO estable;
9. mapping o cuarentena controlados;
10. idempotencia;
11. resultado recuperable;
12. NEXO reconciliable;
13. NUMERA reconciliable;
14. PASS reconciliable;
15. resultado desconocido investigable;
16. compensación correlacionable;
17. conciliación sin bloqueo crítico incompatible con el cutover;
18. contingencia post-corte sin fallback silencioso a doble fuente.

La implementación y evidencia pertenecen a los paquetes posteriores autorizados.

---

#### 49. Estado técnico actual observado

El contrato permanente queda `ESPECIFICADO`.

La materialización física no se declara implementada por esta tarea.

La evidencia técnica vigente mantiene:

- importación Makos agregada por artículo;
- `site_id`;
- `sales_date`;
- hash de archivo;
- mapping de catálogo;
- ausencia de una identidad individual de terminal en el staging observado;
- ausencia de una identidad individual de venta en ese staging.

Por tanto, el mecanismo observado no acredita por sí solo un cutover individual por terminal.

---

#### 50. Sin escritura cruzada

El resolver de autoridad no concede permiso para:

- escribir NEXO;
- escribir NUMERA;
- escribir PASS;
- editar ledgers;
- editar saldos;
- modificar hechos históricos;
- cambiar fiscalidad;
- cambiar pagos.

Autoridad de origen de venta no equivale a autoridad sobre dominios consumidores.

---

#### 51. Auditoría

Debe poder reconstruirse lógicamente:

- decisión de corte;
- sede;
- terminal;
- límite;
- precisión;
- fuente autorizada por intervalo;
- fuente observada;
- venta;
- revisión;
- tiempo empresarial;
- tiempos técnicos;
- procedencia;
- huella;
- evento;
- resultados previos;
- conflicto;
- conciliación;
- actor o autoridad;
- evidencia.

La auditoría no sustituye la decisión propietaria ni la venta.

---

#### 52. Prohibiciones

Queda prohibido:

1. hacer un cutover global implícito;
2. cortar una sede sin resolver el alcance de sus terminales;
3. asumir que una terminal hereda el corte de otra;
4. decidir fuente por `received_at`;
5. decidir fuente por fecha de importación;
6. decidir fuente por sincronización;
7. decidir fuente por retry;
8. decidir fuente por replay;
9. decidir fuente por total;
10. decidir fuente por producto coincidente;
11. decidir fuente por nombre de archivo;
12. inventar una terminal;
13. inventar una hora;
14. inventar una identidad de venta;
15. prorratear agregados para fabricar ventas individuales;
16. reclasificar venta Makos histórica como PULSO;
17. reclasificar venta PULSO nativa como Makos por retraso;
18. cambiar `source_system` histórico para uniformar datos;
19. generar otro `event_id` por el corte;
20. crear un segundo esquema de evento;
21. cambiar audiencia por el corte;
22. reemitir efectos históricos;
23. repetir NEXO;
24. repetir NUMERA;
25. repetir PASS;
26. convertir devolución post-corte en venta negativa nueva;
27. usar Makos como fallback automático post-corte;
28. ampliar credenciales Makos para resolver indisponibilidad;
29. editar un intervalo efectivo ya ejecutado;
30. extender Makos retroactivamente;
31. borrar un intervalo PULSO;
32. solapar dos autoridades;
33. dejar una venta permitida sin autoridad resoluble;
34. usar deduplicación consumidora como sustituto del control de fuente;
35. ocultar una violación de autoridad como retry técnico;
36. declarar cutover efectivo por igualdad de totales;
37. tratar el importador agregado actual como prueba suficiente de terminal individual;
38. transferir pagos por inferencia;
39. transferir fiscalidad por inferencia;
40. transferir contabilidad por inferencia;
41. retirar el adaptador desde esta tarea;
42. implementar la guardia física de doble fuente desde esta tarea;
43. crear tablas, índices, constraints, RPC, funciones, triggers, jobs, colas o workers;
44. modificar código, SQL, migraciones, RLS, datos, Supabase, credenciales o configuración remota;
45. iniciar o desarrollar `INT-SALES-010`.

---

#### 53. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el registro canónico vigente ya protege expresamente que la transición POS externo → PULSO converja en contratos canónicos sin doble emisión; que el corte se defina por sede, terminal y fecha efectiva; que ambas fuentes no emitan la misma venta; que ventas, anulaciones y devoluciones produzcan una sola vez sus efectos aplicables; que fuentes competidoras se identifiquen y resuelvan conservando historia; y que retry, replay, eventos tardíos, compensaciones y conciliación no dupliquen efectos. `INT-SALES-009` convierte el corte transitorio ya definido en `INT-POS-023` en contrato permanente de ventas sin introducir una obligación verificable material nueva.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

---

#### 54. Cobertura de prueba existente preservada

Se preserva sin modificación, en especial:

- `TREQ-INTEGRATION-003`, para identidad estable, resultado recuperable, retry, conflicto y conciliación;
- `TREQ-INTEGRATION-006`, para fuente única, fuentes competidoras, resolución y conservación de historia;
- `TREQ-INTEGRATION-011`, para efectos físicos correlacionados e idempotentes;
- `TREQ-INTEGRATION-014`, para transición POS externo/PULSO, corte por sede, terminal y fecha efectiva, prohibición de doble emisión y efectos exactamente una vez;
- `TREQ-INTEGRATION-015`, para fidelización y compensaciones;
- `TREQ-INTEGRATION-017`, para hechos económicos correlacionados e idempotentes;
- `TREQ-INTEGRATION-151`, para retry crítico con conciliación;
- `TREQ-INTEGRATION-154`, para fuera de orden;
- `TREQ-INTEGRATION-155`, para replay y backfill preservando identidad y audiencia;
- `TREQ-INTEGRATION-159`, para independencia de consumidoras;
- `TREQ-INTEGRATION-160` y `TREQ-INTEGRATION-161`, para agotamiento de retry sin resultado ni compensación inventados;
- `TREQ-PULSO-001`, `TREQ-PULSO-005` y `TREQ-PULSO-006`, para el ciclo comercial end-to-end, separación de estados y tratamiento de venta, pago, caja y reversos;
- la cobertura NEXO, NUMERA y PASS ya relacionada por los requisitos transversales anteriores.

Ninguna fila cambia de identidad, texto, estado, relación, propietaria, evidencia ni secuencia por esta tarea.

---

#### 55. Decisiones congeladas

1. El corte gobierna autoridad de nuevas ventas.
2. PULSO sigue siendo propietaria de la venta canónica interna.
3. Makos conserva procedencia histórica.
4. La unidad del corte es sede + terminal + límite efectivo.
5. La fecha efectiva es obligatoria.
6. La precisión temporal debe ser suficiente.
7. Antes del límite corresponde Makos.
8. Desde el límite incluido corresponde PULSO.
9. No existe cutover global implícito.
10. Una terminal no hereda el corte de otra.
11. No existen intervalos solapados.
12. No existen gaps implícitos para ventas permitidas.
13. Tiempo empresarial y recepción son distintos.
14. Importación no decide fuente.
15. Sincronización no decide fuente.
16. Retry no decide fuente.
17. Replay no decide fuente.
18. Makos pre-corte tardío conserva Makos.
19. PULSO post-corte offline conserva PULSO.
20. Makos post-corte es conflicto de autoridad.
21. PULSO pre-corte no autorizado es conflicto de autoridad.
22. Terminal indeterminada bloquea.
23. Tiempo insuficiente bloquea.
24. Identidad insuficiente bloquea o cuarentena.
25. No se inventan valores.
26. No se reclasifica historia.
27. Identidad de venta y línea se conserva.
28. `source_system` conserva procedencia.
29. `producer_application` permanece PULSO para el evento canónico.
30. El catálogo de eventos no cambia.
31. La audiencia no cambia.
32. NEXO no cambia.
33. NUMERA no cambia.
34. PASS no cambia.
35. Pago no se transfiere por inferencia.
36. Fiscalidad no se transfiere por inferencia.
37. Devoluciones conservan original.
38. Compensaciones conservan original.
39. Retry conserva identidad.
40. Replay conserva identidad.
41. Backfill conserva procedencia.
42. Fallo PULSO no reactiva Makos.
43. Reasignación futura requiere otro límite.
44. Intervalos ejecutados no se reescriben.
45. Acceso residual Makos no equivale a autoridad.
46. `INT-SALES-008` conserva conciliación.
47. `INT-SALES-010` conserva enforcement de doble fuente.
48. `INT-SALES-011` conserva retiro del adaptador.
49. `makos_excel` agregado no acredita terminal individual.
50. Se crean cero cambios `TREQ-*`.
51. No se genera una copia del registro canónico de requisitos.
52. Se crean cero objetos físicos.
53. Se modifican cero objetos físicos.
54. No se modifica código, SQL, migraciones, datos, Supabase, credenciales ni configuración remota.

---

#### 56. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. mantiene `INT-SALES-008` como tarea anterior aprobada;
2. mantiene `INT-SALES-010` como única tarea siguiente reservada;
3. define el corte como autoridad de nuevas ventas;
4. conserva PULSO como propietaria interna de venta y evento;
5. conserva Makos como fuente histórica cuando corresponda;
6. define sede como dimensión obligatoria;
7. define terminal como dimensión obligatoria;
8. define límite efectivo como dimensión obligatoria;
9. exige precisión temporal acreditada;
10. establece Makos antes del límite;
11. establece PULSO desde el límite incluido;
12. impide cutover global implícito;
13. impide herencia de corte entre terminales;
14. prohíbe intervalos solapados;
15. prohíbe gaps implícitos para ventas permitidas;
16. separa tiempo empresarial de recepción;
17. separa tiempo empresarial de importación;
18. separa tiempo empresarial de sincronización;
19. separa tiempo empresarial de retry;
20. separa tiempo empresarial de replay;
21. conserva venta Makos tardía como Makos;
22. conserva PULSO offline post-corte como PULSO;
23. clasifica Makos post-corte como conflicto;
24. clasifica PULSO pre-corte no autorizado como conflicto;
25. bloquea terminal indeterminada;
26. bloquea tiempo insuficiente;
27. evita fabricar identidad;
28. evita usar agregados como identidad individual;
29. preserva venta y líneas históricas;
30. preserva procedencia;
31. preserva `source_system`;
32. mantiene productora PULSO;
33. mantiene un único contrato de evento;
34. mantiene audiencia;
35. mantiene NEXO;
36. mantiene NUMERA;
37. mantiene PASS;
38. mantiene pago separado;
39. mantiene caja separada;
40. mantiene fiscalidad separada;
41. mantiene contabilidad separada;
42. preserva revisiones post-corte del original;
43. preserva anulaciones post-corte del original;
44. preserva devoluciones y reembolsos del original;
45. conserva resultado desconocido sin segunda venta;
46. conserva retry sin cambio de fuente;
47. conserva replay sin cambio de fuente;
48. conserva backfill sin cambio de fuente;
49. prohíbe fallback automático a Makos;
50. exige nueva decisión para reasignación;
51. preserva intervalos ya ejecutados;
52. permite reprogramación previa sin reescribir historia;
53. mantiene acceso Makos residual separado de autoridad;
54. reserva enforcement físico a `INT-SALES-010`;
55. reserva retiro a `INT-SALES-011`;
56. reutiliza conciliación de `INT-SALES-008`;
57. impide considerar igualdad agregada como prueba del corte;
58. define evidencia mínima para materialización futura;
59. define readiness mínimo;
60. diagnostica el staging `makos_excel` actual sin declararlo suficiente;
61. diagnostica el parser PULSO actual sin canonizar su granularidad;
62. no declara materialización física implementada;
63. prohíbe escritura cruzada;
64. hace auditable la decisión de autoridad;
65. genera cero requisitos de prueba nuevos;
66. modifica cero requisitos de prueba;
67. no genera una copia del registro canónico de requisitos;
68. crea cero objetos físicos;
69. modifica cero objetos físicos;
70. no modifica código, SQL, migraciones, datos, Supabase, credenciales ni configuración remota;
71. no inicia ni desarrolla `INT-SALES-010`.

---

#### 57. Resultado de la tarea

`INT-SALES-009` queda definida como el contrato permanente que resuelve de manera determinista y auditable la autoridad de origen de toda nueva venta durante la transición Makos → PULSO usando sede, terminal y límite efectivo, preservando historia, identidad y contratos consumidores.

Resultado consolidado:

```text
SEDE RESOLUBLE
+
TERMINAL RESOLUBLE
+
LÍMITE EFECTIVO
+
PRECISIÓN TEMPORAL SUFICIENTE
+
TIEMPO EMPRESARIAL DEL HECHO
+
INTERVALO ÚNICO DE AUTORIDAD
+
FUENTE OBSERVADA COHERENTE
→
FUENTE AUTORIZADA INEQUÍVOCA PARA LA NUEVA VENTA
```

Con:

```text
ANTES DEL LÍMITE → MAKOS
DESDE EL LÍMITE → PULSO
```

y, ante cualquier ambigüedad o fuente competidora:

```text
BLOQUEO / CONFLICTO
→
CONCILIACIÓN
```

sin reclasificar historia, sin fallback automático, sin cambiar NEXO/NUMERA/PASS y sin implementar todavía la guardia física contra doble fuente.

---

#### 58. Continuidad

ÚLTIMA TAREA APROBADA

`INT-SALES-008 — Definir conciliación de convivencia entre POS externo y PULSO`

TAREA ACTUAL APROBADA

`INT-SALES-009 — Definir corte por sede, terminal y fecha efectiva`

SIGUIENTE TAREA RESERVADA

`INT-SALES-010 — Definir control que impida que ambas fuentes emitan la misma venta`


### ✅ INT-SALES-010 — Definir control que impida que ambas fuentes emitan la misma venta

**Estado:** APROBADA
**Tarea anterior:** `INT-SALES-009 — Definir corte por sede, terminal y fecha efectiva`
**Tarea siguiente:** `INT-SALES-011 — Definir retiro del adaptador externo sin modificar consumidores internos`
**Tipo de tarea:** documental; definición normativa permanente del control previo a la creación y emisión de una venta que impide que Makos y PULSO originen como nuevas dos representaciones del mismo hecho comercial, consumiendo la autoridad temporal definida en `INT-SALES-009`, la identidad e idempotencia de fuente externa definida en `INT-POS-013`, la identidad canónica de venta PULSO y los contratos transversales de idempotencia, concurrencia, resultado recuperable y conciliación, sin seleccionar todavía tablas, constraints, RPC, funciones, claims, locks, índices, workers, migraciones, Supabase ni cambios de código
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/07_VENTAS_INVENTARIO_FINANZAS_Y_FIDELIZACION.md`
**Aplicación propietaria de la venta canónica interna y de su emisión empresarial:** `PULSO`
**Fuente externa anterior de ventas durante la transición:** `Makos`
**Regla de autoridad de fuente consumida:** `INT-SALES-009 — Definir corte por sede, terminal y fecha efectiva`
**Contrato de identidad externa consumido:** `INT-POS-013 — Definir idempotencia por sistema, venta y línea externa`
**Registro transversal de idempotencia reutilizado:** `ENTERPRISE-EVENT-IDEMPOTENCY-REGISTRY-001`
**Política transversal de retry reutilizada:** `ENTERPRISE-EVENT-RETRY-POLICY-001`
**Política transversal de conciliación y partialidad reutilizada:** `ENTERPRISE-PARTIAL-ERROR-HANDLING-POLICY-001`
**Línea base documental:** `vento-shell@b0d0853162a6e31e3e924e9789ff8a5efc38234b`
**Línea base técnica PULSO observada:** `vento-pulso@71e0184486b5fe11e0a42435baf4024807a80efd`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el control permanente que impide que una misma venta empresarial termine registrada y emitida como dos ventas nuevas porque Makos y PULSO la hayan afirmado, importado, sincronizado o presentado por caminos distintos.

La regla raíz es:

```text
AFIRMACIÓN DE VENTA
        ↓
RESOLVER AUTORIDAD DE FUENTE
        ↓
RESOLVER IDENTIDAD DE VENTA
        ↓
CONSULTAR ORIGEN Y RESULTADO DURABLE PREVIOS
        ├── MISMA VENTA + MISMO ORIGEN AUTORIZADO + HUELLA COMPATIBLE
        │       → RECUPERAR RESULTADO EXISTENTE
        │       → CERO SEGUNDA VENTA
        │       → CERO SEGUNDO EVENTO
        │
        ├── MISMA VENTA + FUENTE COMPETIDORA
        │       → CONFLICTO DE AUTORIDAD
        │       → CERO SEGUNDA VENTA
        │       → CERO SEGUNDO EVENTO
        │
        ├── MISMA IDENTIDAD + HUELLA INCOMPATIBLE
        │       → CONFLICTO / REVISIÓN SEGÚN CONTRATO
        │       → CERO SOBRESCRITURA SILENCIOSA
        │
        └── IDENTIDAD INSUFICIENTE
                → BLOQUEO / CONCILIACIÓN
                → CERO IDENTIDAD INVENTADA
```

Nunca:

```text
MISMA VENTA
→ MAKOS CREA UNA
→ PULSO CREA OTRA
→ CONSUMIDORAS INTENTAN DEDUPLICAR DESPUÉS
```

La barrera principal ocurre antes de permitir una segunda representación canónica de venta y antes de permitir una segunda emisión empresarial.

---

#### 2. Resultado sustantivo

`INT-SALES-010` congela las siguientes decisiones permanentes:

1. una venta empresarial tiene un solo origen autorizado;
2. PULSO es la única propietaria de la representación canónica interna de venta;
3. Makos puede aportar una afirmación externa únicamente dentro del intervalo en que `INT-SALES-009` le reconoce autoridad;
4. PULSO puede originar una venta nativa únicamente dentro del intervalo en que `INT-SALES-009` le reconoce autoridad;
5. la autoridad de fuente se evalúa antes de aceptar una nueva venta;
6. la autoridad válida no basta por sí sola: también debe comprobarse que la venta no exista ya;
7. una venta ya representada conserva su origen histórico;
8. otra fuente no puede reclamarla como venta nueva;
9. la identidad de fuente externa y la identidad canónica interna permanecen separadas pero correlacionables;
10. un identificador externo fuerte solo puede usarse cuando la fuente lo haya demostrado como estable e individual;
11. el flujo agregado `makos_excel` no demuestra identidad individual de venta;
12. un hash de archivo no identifica una venta;
13. una fila agregada por producto no identifica una venta;
14. similitud de fecha no identifica una venta;
15. similitud de importe no identifica una venta;
16. similitud de producto no identifica una venta;
17. similitud de terminal no identifica una venta;
18. varias similitudes juntas pueden generar un candidato de doble fuente, pero no una fusión automática;
19. una equivalencia cruzada Makos↔PULSO solo puede afirmarse mediante identidad o correlación determinista acreditada;
20. si no puede demostrarse equivalencia individual, no se inventa;
21. si tampoco puede demostrarse que dos afirmaciones son distintas cuando existe un conflicto material de autoridad, el caso permanece bloqueado para una segunda emisión;
22. una fuente no autorizada para el intervalo produce conflicto de autoridad, aunque su payload sea técnicamente válido;
23. una fuente autorizada que reenvía la misma venta recupera el resultado previo;
24. una fuente autorizada que reutiliza la misma identidad con contenido incompatible produce conflicto o revisión conforme al contrato;
25. dos ejecuciones concurrentes de la misma aceptación tienen un solo ganador empresarial;
26. dos fuentes concurrentes no pueden producir dos ganadores;
27. el primer resultado durable compatible se recupera en retries;
28. una respuesta perdida no habilita crear la venta desde la otra fuente;
29. una caída de PULSO no habilita Makos como fallback;
30. replay conserva fuente, identidad y resultado;
31. backfill conserva fuente, identidad y resultado;
32. una revisión conserva la venta original;
33. una anulación conserva la venta original;
34. una devolución conserva la venta original;
35. un reembolso conserva la venta original;
36. una compensación no crea otra venta;
37. `event_id` se asigna o recupera únicamente después de que la venta haya superado la barrera de origen;
38. una fuente competidora no obtiene un segundo `event_id` para el mismo hecho;
39. la deduplicación de inbox de NEXO, NUMERA o PASS no sustituye la barrera de origen;
40. una infracción histórica que haya atravesado la barrera se reconcilia sin borrar historia;
41. NEXO corrige únicamente su efecto físico mediante su contrato;
42. NUMERA corrige únicamente su efecto económico mediante su contrato;
43. PASS corrige únicamente su efecto de fidelización mediante su contrato;
44. la conciliación de `INT-SALES-008` conserva la detección y resolución de casos;
45. `INT-SALES-011` conserva el retiro posterior del adaptador;
46. la implementación física del control queda para los paquetes propietarios posteriores;
47. esta tarea no selecciona primitiva de base de datos o infraestructura;
48. se crean cero requisitos `TREQ-*`;
49. se modifican cero requisitos `TREQ-*`;
50. se crean cero objetos físicos;
51. se modifican cero objetos físicos.

---

#### 3. Dependencias canónicas consumidas

Esta tarea consume sin reabrir:

- `INT-POS-005`, para identidad canónica de venta y línea;
- `INT-POS-009`, para procedencia, payload original, recepción y evidencia;
- `INT-POS-010`, para sede y terminal externas cuando estén acreditadas;
- `INT-POS-013`, para `EXTERNAL_SALE_KEY`, identidad externa fuerte, huella, duplicado, conflicto y concurrencia;
- `INT-POS-023`, para la barrera de doble fuente previa a consumidoras durante la transición;
- `INT-SALES-001`, para registro durable de la venta canónica PULSO;
- `INT-SALES-002`, para emisión canónica y conservación de `source_system` frente a `producer_application`;
- `INT-SALES-003`, para efecto NEXO independiente;
- `INT-SALES-004`, para efecto NUMERA independiente;
- `INT-SALES-005`, para acumulación PASS independiente;
- `INT-SALES-006`, para redención PASS independiente;
- `INT-SALES-007`, para distinguir doble fuente de retry técnico;
- `INT-SALES-008`, para conciliación de convivencia y candidatos de doble fuente;
- `INT-SALES-009`, para autoridad por sede, terminal y límite efectivo;
- los contratos transversales vigentes de idempotencia, retry, auditoría, partialidad y propiedad.

No se redefine ninguna identidad, propietaria o resultado aprobado por esas tareas.

---

#### 4. Frontera exacta de esta tarea

`INT-SALES-010` responde una sola pregunta:

```text
¿PUEDE ESTA AFIRMACIÓN CREAR
UNA NUEVA VENTA CANÓNICA
Y UNA NUEVA EMISIÓN?
```

La respuesta depende de dos puertas acumulativas:

```text
PUERTA 1
FUENTE AUTORIZADA SEGÚN INT-SALES-009

+

PUERTA 2
AUSENCIA DEMOSTRADA DE UNA REPRESENTACIÓN PREVIA
DE LA MISMA VENTA BAJO OTRA FUENTE
```

Solo si ambas se satisfacen puede continuar la creación de una nueva venta.

---

#### 5. Qué no es este control

El control de doble fuente no es:

- deduplicación de un `event_id`;
- deduplicación de inbox consumidor;
- deduplicación de efecto NEXO;
- deduplicación de hecho NUMERA;
- guarda de acumulación PASS;
- hash de archivo;
- hash de payload;
- comparación de totales;
- búsqueda aproximada de tickets;
- algoritmo de similitud;
- conciliación posterior usada como sustituto de prevención;
- transacción distribuida entre todas las aplicaciones.

Es una guardia de **origen de la venta** dentro de la frontera propietaria PULSO.

---

#### 6. Propiedad del control

PULSO conserva:

- la venta canónica;
- la decisión de aceptar una nueva venta en su dominio;
- la correlación entre afirmación externa y venta interna;
- la emisión empresarial posterior.

El adaptador Makos:

- conserva afirmación y evidencia externa;
- aplica sus contratos de ingestión;
- no adquiere propiedad de la venta interna;
- no puede forzar una segunda venta.

NEXO, NUMERA y PASS:

- no deciden qué fuente originó la venta;
- no corrigen la fuente;
- no actúan como barrera principal de doble origen.

---

#### 7. Orden obligatorio de evaluación

La secuencia lógica permanente es:

```text
1. RECIBIR O CAPTURAR LA AFIRMACIÓN
2. PRESERVAR PROCEDENCIA Y EVIDENCIA
3. RESOLVER SEDE Y TERMINAL CUANDO APLIQUEN
4. RESOLVER TIEMPO EMPRESARIAL
5. RESOLVER AUTORIDAD DE FUENTE
6. RESOLVER IDENTIDAD INDIVIDUAL DE VENTA
7. CONSULTAR REPRESENTACIÓN CANÓNICA Y ORIGEN PREVIOS
8. COMPARAR HUELLA / REVISIÓN / RESULTADO
9. RECLAMAR O RECUPERAR UN ÚNICO RESULTADO EMPRESARIAL
10. SOLO ENTONCES PERMITIR CREACIÓN O EMISIÓN NUEVA
```

No puede invertirse colocando la emisión antes del control de fuente.

---

#### 8. Vínculo lógico durable de origen

Toda venta individual aceptada deberá quedar lógicamente vinculada de forma durable a evidencia suficiente para reconstruir su origen.

Como mínimo, cuando sean aplicables y acreditados:

- identidad canónica de venta;
- `source_system`;
- `source_instance_ref`;
- identidad externa individual de venta;
- sede;
- terminal;
- tiempo empresarial;
- precisión temporal utilizada;
- intervalo de autoridad aplicable;
- revisión o versión;
- versión de huella;
- huella lógica;
- evidencia de origen;
- resultado de aceptación;
- evento empresarial emitido cuando exista;
- estado de conciliación cuando corresponda.

Esta tarea define la obligación semántica y no crea un nombre de tabla, columna, constraint o entidad física.

---

#### 9. Dos guardas complementarias

La protección requiere dos dimensiones distintas.

##### 9.1. Unicidad de identidad dentro de una fuente

Cuando exista identidad externa individual demostrada:

```text
source_system
+
source_instance_ref cuando aplique
+
external_sale_id
→ COMO MÁXIMO UNA VENTA CANÓNICA
```

##### 9.2. Unicidad de origen de una venta canónica

```text
UNA canonical_sale_id
→ UN SOLO ORIGEN EMPRESARIAL HISTÓRICO
```

Una segunda fuente no puede reasignar el origen de una venta ya existente.

Las dos guardas protegen riesgos diferentes y ninguna sustituye a la otra.

---

#### 10. `EXTERNAL_SALE_KEY`

Se reutiliza la identidad conceptual aprobada:

```text
EXTERNAL_SALE_KEY
=
source_system
+
source_instance_ref cuando aplique
+
external_sale_id
```

Solo procede cuando `external_sale_id` representa una venta individual estable conforme a evidencia de la fuente.

Queda prohibido fabricar esa clave a partir de:

- fecha;
- sede interna;
- terminal inferida;
- total;
- subtotal;
- impuesto;
- descuento;
- productos;
- cantidades;
- hash de archivo;
- hash de payload;
- número de fila;
- nombre de archivo;
- timestamp de recepción.

---

#### 11. Identidad PULSO nativa

Una venta nativa PULSO utiliza la identidad empresarial estable definida por el contrato de venta PULSO.

Retry, sincronización offline, refresh, cambio de dispositivo, cambio de worker o reintento de publicación no crean otra venta.

La identidad nativa PULSO no se convierte en una `EXTERNAL_SALE_KEY` ficticia para aparentar simetría con Makos.

---

#### 12. Correlación entre identidades distintas

Makos y PULSO pueden utilizar identificadores diferentes.

Una relación cruzada solo puede declararse cuando exista:

- identificador compartido acreditado;
- referencia causal común acreditada;
- binding contractual determinista;
- crosswalk aprobado;
- evidencia equivalente que demuestre individualmente que se trata del mismo hecho.

No basta con que dos registros “se parezcan”.

---

#### 13. Similitud no equivale a identidad

Pueden existir dos ventas legítimas con:

- mismo total;
- misma sede;
- misma terminal;
- mismo minuto;
- mismos productos;
- mismas cantidades;
- mismo cajero;
- mismo medio de pago.

Por tanto:

```text
SIMILITUD
≠
IDENTIDAD
```

La similitud puede elevar un candidato de doble fuente a conciliación según `INT-SALES-008`, pero no autoriza:

- fusionar;
- borrar;
- escoger Makos;
- escoger PULSO;
- reasignar procedencia.

---

#### 14. Autoridad primero

Antes de intentar correlación cruzada se evalúa la autoridad de `INT-SALES-009`.

Si:

```text
FUENTE OBSERVADA
≠
FUENTE AUTORIZADA PARA SEDE + TERMINAL + TIEMPO
```

el resultado es:

```text
CONFLICTO DE AUTORIDAD
+
CERO NUEVA VENTA
+
CERO NUEVO EVENTO
```

No es necesario “encontrar un duplicado” para rechazar una fuente que carece de autoridad para originar ventas nuevas en ese intervalo.

---

#### 15. Fuente autorizada no significa venta nueva

Que una fuente sea autorizada para el intervalo no demuestra que la afirmación sea nueva.

Después de validar autoridad todavía debe consultarse:

- identidad;
- huella;
- revisión;
- venta canónica previa;
- vínculo de origen;
- resultado previo;
- evento emitido cuando exista.

Una redelivery de la fuente correcta no obtiene una segunda venta.

---

#### 16. Misma fuente, misma identidad, misma huella

Caso:

```text
MISMA FUENTE AUTORIZADA
+
MISMA IDENTIDAD
+
MISMA HUELLA
```

Resultado:

```text
RECUPERAR VENTA Y RESULTADO PREVIOS
+
CERO NUEVA VENTA
+
CERO NUEVO EVENTO
```

Cuando el evento ya exista, se recupera la emisión existente conforme al alcance idempotente correspondiente.

---

#### 17. Misma fuente, misma identidad, huella incompatible

Caso:

```text
MISMA FUENTE
+
MISMA IDENTIDAD
+
CONTENIDO MATERIAL INCOMPATIBLE
```

No se crea otra venta para evitar el conflicto.

El resultado corresponde a:

- revisión válida, si la semántica de versión acreditada lo demuestra;
- conflicto, si reutiliza identidad de forma incompatible;
- conciliación, si no puede determinarse con seguridad.

Nunca se aplica `last write wins`.

---

#### 18. Fuente competidora sobre venta ya representada

Caso:

```text
VENTA CANÓNICA EXISTENTE
+
ORIGEN HISTÓRICO = MAKOS
+
AFIRMACIÓN PULSO COMO VENTA NUEVA
```

o:

```text
VENTA CANÓNICA EXISTENTE
+
ORIGEN HISTÓRICO = PULSO
+
AFIRMACIÓN MAKOS COMO VENTA NUEVA
```

Resultado:

```text
CONFLICTO DE DOBLE FUENTE
+
CERO SEGUNDA VENTA
+
CERO SEGUNDA EMISIÓN
```

La evidencia competidora se conserva para conciliación.

---

#### 19. Makos antes del corte

Cuando Makos es la fuente autorizada:

1. la afirmación debe superar identidad e idempotencia externas;
2. si la misma venta Makos ya existe, recupera resultado;
3. si PULSO intenta originarla como nativa dentro del intervalo Makos, se bloquea por autoridad;
4. la representación canónica resultante conserva `source_system = MAKOS`;
5. PULSO sigue siendo la propietaria interna y productora del evento canónico.

---

#### 20. PULSO después del corte

Cuando PULSO es la fuente autorizada:

1. una venta nativa nueva puede continuar si no existe representación previa;
2. Makos no puede originar una nueva venta post-corte;
3. una llegada Makos post-corte se conserva como evidencia conflictiva;
4. el acceso residual Makos no concede autoridad;
5. el hecho PULSO conserva `source_system = PULSO`.

---

#### 21. Makos pre-corte recibido tarde

Una venta Makos realmente ocurrida antes del límite puede llegar después.

El control:

1. evalúa el tiempo empresarial, no la recepción;
2. reconoce Makos como fuente autorizada histórica;
3. consulta si la venta ya fue representada;
4. si ya existe con el mismo origen y huella compatible, recupera resultado;
5. si ya existe bajo fuente competidora, abre conflicto;
6. no crea una segunda venta solo porque el dato llegó tarde.

---

#### 22. PULSO offline post-corte

Una venta PULSO creada bajo una modalidad offline autorizada después del límite:

- conserva identidad PULSO;
- conserva tiempo empresarial;
- conserva fuente PULSO;
- sincroniza con la misma identidad;
- consulta resultado previo;
- no se reenvía a Makos;
- no se recrea por reconexión.

---

#### 23. Makos post-corte

Una afirmación Makos cuyo hecho empresarial corresponde al intervalo PULSO:

```text
MAKOS
+
INTERVALO AUTORIZADO = PULSO
→ CONFLICTO DE AUTORIDAD
```

Aunque:

- el archivo sea válido;
- el hash sea nuevo;
- el payload sea legible;
- el mapping de producto esté resuelto;
- la venta no haya sido encontrada por similitud.

La fuente incorrecta no puede crear una nueva venta.

---

#### 24. PULSO pre-corte no autorizado

Una venta nativa PULSO cuyo hecho empresarial corresponde al intervalo Makos:

```text
PULSO
+
INTERVALO AUTORIZADO = MAKOS
→ CONFLICTO DE AUTORIDAD
```

No se acepta como excepción por provenir de la futura plataforma objetivo.

---

#### 25. Intervalos superpuestos o contradictorios

`INT-SALES-009` prohíbe intervalos solapados.

Si una materialización futura presenta dos decisiones que autorizan simultáneamente Makos y PULSO para la misma sede, terminal y tiempo:

```text
AUTORIDAD AMBIGUA
→ BLOQUEAR NUEVA VENTA
→ CONCILIAR CONFIGURACIÓN
```

No se aplica prioridad implícita por:

- fuente preferida;
- orden de configuración;
- timestamp técnico;
- último valor escrito.

---

#### 26. Venta distinta legítima

El control no debe suprimir ventas legítimamente distintas.

Dos ventas pueden coexistir cuando:

- cada una tiene identidad individual demostrable;
- cada una pertenece a una fuente autorizada para su hecho;
- sus identidades no colisionan;
- no existe correlación determinista que las declare la misma venta;
- no reutilizan indebidamente una identidad previa.

Un valor comercial parecido no es motivo suficiente para deduplicar.

---

#### 27. Candidato de doble fuente sin identidad suficiente

Cuando existe similitud suficiente para investigación pero no identidad determinista:

```text
CANDIDATO DE DOBLE FUENTE
→ CASO DE CONCILIACIÓN
```

La conciliación conserva:

- ambas evidencias;
- fuente observada;
- autoridad esperada;
- señales de similitud;
- limitaciones de identidad;
- decisión;
- responsable;
- condición de salida.

No se inventa una relación uno-a-uno.

---

#### 28. Evidencia agregada Makos

El flujo `makos_excel` vigente conserva evidencia agregada por archivo y producto.

Por tanto:

```text
ARCHIVO MAKOS
+
FILA DE PRODUCTO
≠
VENTA INDIVIDUAL
```

Ese flujo puede:

- demostrar cobertura agregada;
- revelar diferencias;
- apoyar conciliación;
- conservar procedencia de lote.

No puede por sí solo:

- reclamar una venta individual;
- producir un crosswalk individual;
- demostrar que una venta PULSO es duplicada;
- emitir una venta individual canónica;
- satisfacer la guardia individual de doble fuente.

---

#### 29. Hash de archivo

La unicidad técnica vigente por:

```text
site_id
+
sales_date
+
source
+
source_file_hash
```

protege la repetición exacta de un archivo dentro de ese alcance.

No protege por sí sola:

- la misma venta en dos archivos distintos;
- la misma venta Makos y PULSO;
- una venta individual;
- una línea individual.

El hash permanece evidencia de ingestión, no identidad de venta.

---

#### 30. `source_row_number`

`source_row_number` localiza una fila en el archivo.

No se utiliza como:

- identidad de venta;
- identidad de línea empresarial;
- crosswalk entre fuentes;
- guarda de doble fuente.

Reordenar el archivo no puede convertir el mismo hecho empresarial en otro hecho.

---

#### 31. Mapping de producto

Coincidencia de producto, MID, código o nombre no identifica la venta.

Un mapping de producto:

- puede resolver qué producto representa una línea;
- no demuestra qué ticket la originó;
- no demuestra que una venta PULSO y una evidencia Makos sean la misma;
- no puede liberar la barrera de doble fuente.

---

#### 32. Creación de venta y claim lógico

La aceptación de una nueva venta debe producir un único ganador empresarial aun bajo concurrencia.

Contrato:

```text
MISMA IDENTIDAD LÓGICA
+
MISMA HUELLA COMPATIBLE
+
DOS EJECUCIONES CONCURRENTES
→ UN SOLO GANADOR
```

Las demás ejecuciones:

- recuperan el resultado previo;
- permanecen en curso recuperable;
- o reciben conflicto cuando el contenido o fuente no coinciden.

No satisface esta garantía una secuencia insegura de “buscar y después insertar” sin una exclusión equivalente.

---

#### 33. Concurrencia entre Makos y PULSO

Si dos procesos intentan aceptar simultáneamente afirmaciones que una correlación determinista demuestra como la misma venta, pero desde fuentes distintas:

```text
DOS FUENTES
+
UNA VENTA
+
CONCURRENCIA
→ COMO MÁXIMO UN ORIGEN ACEPTADO
```

La decisión válida se determina por la autoridad temporal y el resultado previo.

La otra afirmación:

- no crea venta;
- no crea evento;
- conserva evidencia;
- queda conflictiva o conciliable.

---

#### 34. Atomicidad lógica

La implementación posterior deberá vincular atómicamente o con durabilidad equivalente, dentro de la frontera propietaria:

- decisión de autoridad;
- identidad de venta;
- origen;
- huella;
- revisión;
- claim o exclusión concurrente;
- creación o recuperación de venta;
- resultado durable;
- intención de emisión cuando corresponda;
- evidencia de auditoría.

No es válido:

```text
VENTA CREADA
+
ORIGEN NO FIJADO
```

No es válido:

```text
EVENTO EMITIDO
+
GUARDIA DE ORIGEN NO RESUELTA
```

Esta tarea no selecciona la primitiva física.

---

#### 35. Emisión empresarial

El evento PULSO se produce únicamente después de que el hecho de venta sea durable y la guardia de origen haya concluido.

Reglas:

1. un duplicado verdadero recupera el evento existente cuando corresponda;
2. una fuente competidora produce cero nueva emisión;
3. un conflicto de huella produce cero emisión incompatible;
4. una revisión legítima sigue el contrato de revisión y eventos aprobado;
5. un evento posterior legítimo de la misma venta no se suprime por usar el mismo `canonical_sale_id`;
6. no se utiliza `canonical_sale_id` como clave universal de todos los eventos.

---

#### 36. `event_id` no sustituye la guardia de origen

Dos fuentes podrían producir identificadores de evento distintos si la segunda venta se creara indebidamente.

Por tanto:

```text
DEDUPE POR event_id
≠
CONTROL DE DOBLE FUENTE
```

La barrera de origen debe ocurrir antes de permitir el segundo hecho y segundo evento.

---

#### 37. Consumer inbox no sustituye la guardia

NEXO, NUMERA y PASS deduplican sus recepciones por sus contratos propios.

Pero:

```text
nexo + event_id
numera + event_id
pass + event_id
```

no pueden saber que dos `event_id` distintos proceden indebidamente de una misma venta si PULSO ya creó dos hechos.

El control primario permanece en la frontera de venta.

---

#### 38. Efectos consumidores

Después de una venta válida, cada dominio mantiene su protección:

- NEXO: inbox, efecto físico, movimientos y receipt;
- NUMERA: inbox, `SALE_ECONOMIC_FACT` y resultado económico;
- PASS acumulación: inbox, `LOYALTY_POINTS_ACCRUAL` y guarda cuenta + venta;
- PASS redención: `redemption_id` y comando propietario.

El control de doble fuente no reemplaza ninguna de estas identidades.

---

#### 39. Duplicado histórico que ya produjo efectos

Si una violación antigua de doble fuente ya generó dos ventas o efectos:

1. no se borra historia;
2. no se fusionan ledgers destructivamente;
3. `INT-SALES-008` identifica las dos fuentes y resultados;
4. PULSO determina la relación entre las representaciones comerciales;
5. cada consumidora confirma qué efecto ocurrió;
6. únicamente efectos confirmados elegibles pueden corregirse o compensarse;
7. NEXO corrige NEXO;
8. NUMERA corrige NUMERA;
9. PASS corrige PASS;
10. el original y la corrección permanecen trazables.

Esta tarea no ejecuta la reparación.

---

#### 40. Retry de la misma fuente

Retry de la misma venta:

- conserva fuente;
- conserva identidad;
- conserva huella;
- conserva revisión;
- conserva presupuesto;
- consulta resultado;
- no crea otra venta;
- no crea otro evento.

La pérdida de respuesta no modifica esta regla.

---

#### 41. Resultado desconocido

Ante timeout o desconexión después de una posible aceptación:

```text
RESULTADO DESCONOCIDO
        ↓
CONSULTAR IDENTIDAD + ORIGEN + VENTA + RESULTADO
        ├── CONFIRMADO → RECUPERAR
        ├── AUSENCIA DEMOSTRADA → RETRY MISMA IDENTIDAD
        └── INDETERMINADO → RECONCILIACIÓN
```

Nunca:

```text
RESULTADO DESCONOCIDO EN MAKOS
→ INTENTAR CREAR EN PULSO
```

ni:

```text
RESULTADO DESCONOCIDO EN PULSO
→ INTENTAR CREAR EN MAKOS
```

---

#### 42. Cambio de tecnología

Cambiar:

- archivo por API;
- polling por webhook;
- RPC;
- worker;
- cola;
- scheduler;
- función;
- base técnica;

no cambia:

- fuente histórica;
- identidad empresarial;
- autoridad temporal;
- vínculo de origen;
- resultado previo.

Una migración técnica debe conservar la guardia suficiente para no reactivar ventas históricas.

---

#### 43. Replay

Un replay:

- conserva identidad;
- conserva `source_system`;
- conserva `occurred_at`;
- conserva revisión;
- consulta la venta previa;
- consulta el origen previo;
- conserva `event_id` cuando el evento ya existía;
- no produce otra venta;
- no cambia Makos por PULSO;
- no cambia PULSO por Makos.

---

#### 44. Backfill

Un backfill:

- conserva procedencia;
- identifica lote o ventana;
- utiliza identidades deterministas cuando existan;
- compara historia antes de crear;
- no fabrica identidad individual desde agregados;
- no crea ventas sensibles por inferencia;
- no usa el corte como pretexto para reclasificar historia;
- no crea otra venta para completar una métrica.

---

#### 45. Revisiones

Una revisión legítima:

- conserva la identidad de la venta;
- conserva el origen histórico;
- conserva la revisión anterior;
- produce la revisión sucesora conforme al contrato;
- no crea otra venta porque cambien importe, líneas o estado;
- no transfiere la venta a la fuente actualmente autorizada si el original pertenece a otra fuente.

---

#### 46. Anulación, devolución y reembolso

Una anulación, devolución o reembolso posterior:

- referencia la venta original;
- conserva el origen de la venta original;
- utiliza identidad propia del hecho posterior cuando corresponda;
- no se registra como otra venta para evitar el control de doble fuente;
- no permite que Makos y PULSO representen el mismo hecho correctivo como dos operaciones equivalentes;
- conserva compensaciones separadas por propietaria.

---

#### 47. Fallo de PULSO después del corte

Una indisponibilidad de PULSO después del corte no modifica la autoridad de fuente.

Queda prohibido:

```text
PULSO NO DISPONIBLE
→ CREAR LA VENTA EN MAKOS
→ IMPORTARLA DESPUÉS COMO NUEVA
```

Cualquier contingencia válida debe provenir del proceso autorizado y conservar una sola identidad y autoridad.

---

#### 48. Reasignación futura de autoridad

Si una decisión posterior vuelve a asignar autoridad a otra fuente:

1. utiliza otro límite efectivo;
2. no solapa intervalos;
3. no reescribe ventas anteriores;
4. no modifica el origen de ventas PULSO ya válidas;
5. no modifica el origen de ventas Makos ya válidas;
6. la guardia consulta el intervalo correspondiente al tiempo empresarial de cada venta.

Una fuente futura autorizada no adquiere propiedad retroactiva sobre la historia.

---

#### 49. Conciliación

`INT-SALES-008` permanece como contrato de conciliación para:

- candidatos de doble fuente;
- fuente observada distinta de autoridad esperada;
- identidad cruzada incierta;
- dos ventas posiblemente equivalentes;
- duplicados que escaparon a la barrera;
- eventos duplicados;
- efectos duplicados;
- resultado desconocido;
- residuales.

La conciliación no se convierte en botón de creación, fusión o borrado de ventas.

---

#### 50. Decisiones de conciliación permitidas

Una resolución puede determinar, según evidencia:

- misma venta y mismo origen: recuperar representación previa;
- misma venta y fuente competidora: conservar conflicto y aplicar corrección propietaria cuando corresponda;
- ventas distintas: conservar ambas;
- revisión del mismo hecho: vincular revisión sin segunda venta;
- evidencia insuficiente: mantener caso abierto;
- entrada externa agregada: conservar control agregado sin fabricar venta individual.

La decisión conserva autoridad, evidencia y razón.

---

#### 51. Estado técnico actual observado

La línea técnica vigente demuestra:

- lotes `pulso_daily_sales_import_batches`;
- filas `pulso_daily_sales_import_rows`;
- `site_id`;
- `sales_date`;
- `source = 'makos_excel'`;
- nombre y hash de archivo;
- unicidad por sede, fecha, fuente y hash;
- `source_row_number`;
- producto externo;
- cantidades e importes;
- mapping a catálogo o producto.

No demuestra en ese staging:

- `external_sale_id` individual;
- identidad individual de terminal;
- crosswalk individual Makos↔PULSO;
- claim individual de origen de venta;
- guardia concurrente cruzada de fuente;
- resultado durable individual de una venta externa.

Consecuencia:

```text
GUARDIA DE ARCHIVO ACTUAL
≠
CONTROL PERMANENTE DE DOBLE FUENTE POR VENTA
```

Esta tarea no modifica la implementación.

---

#### 52. Parser PULSO observado

El parser PULSO vigente interpreta el XLSX mediante:

- ID de ítem;
- producto;
- categoría;
- cantidad;
- subtotal;
- impuestos;
- descuentos;
- devoluciones.

No acredita en esa modalidad:

- ticket individual;
- venta individual;
- terminal individual;
- tiempo empresarial individual;
- línea individual subordinada a ticket;
- identidad cruzada frente a una venta PULSO nativa.

La ausencia de esos datos no se corrige inventándolos.

---

#### 53. Frontera de implementación posterior

La materialización física deberá demostrar, como mínimo:

1. resolución de autoridad de `INT-SALES-009`;
2. identidad de venta PULSO;
3. identidad externa fuerte cuando exista;
4. correlación determinista cuando exista;
5. vínculo durable de origen;
6. huella versionada;
7. revisión;
8. claim o exclusión concurrente equivalente;
9. un único ganador;
10. recuperación de resultado;
11. conflicto por fuente competidora;
12. conflicto por huella incompatible;
13. creación de venta dentro de la misma frontera propietaria;
14. intención de emisión ligada al resultado;
15. auditoría;
16. conciliación;
17. replay;
18. backfill;
19. migración sin reactivar historia;
20. pruebas concurrentes y de doble fuente.

La implementación deberá elegir la primitiva física en sus tareas y paquetes autorizados.

---

#### 54. Handoffs obligatorios

| Pendiente material                             | Propietaria exacta                                                | Condición de salida                                                                                                                                         |
| ---------------------------------------------- | ----------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| materialización física de la guardia de origen | paquete PULSO correspondiente que materialice `INT-SALES-010`     | autoridad, identidad, origen, huella, concurrencia, resultado y emisión quedan ligados de forma que una fuente competidora no pueda crear una segunda venta |
| conciliación de violaciones y candidatos       | `INT-SALES-008`                                                   | cada caso conserva fuentes, evidencia, decisión, responsable, resultado y residual sin borrar historia                                                      |
| resolución temporal de autoridad               | `INT-SALES-009`                                                   | toda venta evaluable resuelve una única fuente autorizada por sede, terminal y tiempo empresarial                                                           |
| idempotencia externa individual                | contrato de `INT-POS-013` materializado en el adaptador aplicable | una identidad externa demostrada converge en una sola venta y un resultado recuperable                                                                      |
| efectos físicos posteriores                    | paquete NEXO correspondiente                                      | una venta válida produce como máximo una vez el efecto físico aplicable                                                                                     |
| efectos económicos posteriores                 | paquete NUMERA correspondiente                                    | una venta válida produce como máximo una vez el hecho económico aplicable                                                                                   |
| fidelización posterior                         | `PASS-INT-001` y `PASS-INT-002` según operación                   | acumulación y redención conservan sus guardas propias y no duplican puntos                                                                                  |
| retiro del adaptador externo                   | `INT-SALES-011`                                                   | consumidoras internas continúan sin depender del adaptador y la historia sigue recuperable                                                                  |

Ningún pendiente material queda sin propietaria y condición de salida.

---

#### 55. Auditoría mínima

Cada decisión de aceptación, recuperación o conflicto deberá permitir reconstruir lógicamente, según aplicabilidad:

- venta canónica;
- identidad externa;
- fuente observada;
- fuente autorizada;
- sede;
- terminal;
- tiempo empresarial;
- precisión temporal;
- intervalo de autoridad;
- revisión;
- huella y versión;
- evidencia de origen;
- representación previa encontrada;
- resultado previo;
- resultado del claim;
- fuente ganadora;
- fuente competidora;
- motivo de conflicto;
- `event_id` cuando exista;
- actor o principal;
- intento;
- correlación;
- conciliación;
- acción sucesora o compensatoria cuando exista.

Los timestamps por sí solos no establecen identidad ni causalidad.

---

#### 56. Observabilidad

La observabilidad deberá distinguir:

```text
AFIRMACIONES RECIBIDAS
≠
VENTAS NUEVAS ACEPTADAS
≠
DUPLICADOS RECUPERADOS
≠
CONFLICTOS DE AUTORIDAD
≠
CONFLICTOS DE HUELLA
≠
CANDIDATOS DE DOBLE FUENTE
≠
EVENTOS EMITIDOS
≠
CASOS DE CONCILIACIÓN
```

Un alto número de archivos, entregas o intentos no implica un alto número de ventas.

---

#### 57. Privacidad y seguridad

El control utiliza la información mínima necesaria para:

- resolver fuente;
- resolver identidad;
- resolver autoridad;
- comparar huella;
- recuperar resultado;
- auditar y conciliar.

No necesita copiar por defecto:

- datos personales completos;
- credenciales;
- tokens;
- datos bancarios completos;
- firmas;
- secretos del proveedor.

Una interfaz o actor administrativo no puede cambiar silenciosamente el origen de una venta para cerrar un conflicto.

---

#### 58. Sin escritura cruzada

La guardia de origen:

- no escribe inventario NEXO;
- no escribe hechos NUMERA;
- no escribe ledger PASS;
- no escribe saldos PASS;
- no modifica pagos;
- no modifica documentos fiscales;
- no corrige directamente dominios consumidores.

La resolución de una venta duplicada no concede autoridad transversal.

---

#### 59. Prohibiciones

Queda prohibido:

1. permitir dos fuentes de origen para una misma venta;
2. crear una segunda venta para resolver un conflicto de fuente;
3. crear un segundo `event_id` porque cambió la fuente;
4. usar deduplicación de consumidoras como barrera primaria;
5. usar `event_id` como única guardia de doble fuente;
6. usar hash de archivo como identidad de venta;
7. usar hash de payload como identidad única;
8. usar `source_row_number` como identidad de venta;
9. usar producto como identidad de venta;
10. usar total como identidad de venta;
11. usar fecha como identidad de venta;
12. usar terminal como identidad de venta por sí sola;
13. usar similitud como equivalencia determinista;
14. fusionar automáticamente Makos y PULSO;
15. elegir Makos por conveniencia;
16. elegir PULSO por conveniencia;
17. elevar un agregado Makos a venta individual;
18. inventar `external_sale_id`;
19. inventar crosswalk;
20. inventar terminal;
21. inventar tiempo empresarial;
22. aceptar una fuente no autorizada;
23. ocultar una fuente no autorizada como retry;
24. ocultar doble fuente como duplicado técnico;
25. tratar una revisión como venta nueva para evitar conflicto;
26. tratar una devolución como venta negativa nueva;
27. usar `last write wins`;
28. sobrescribir origen histórico;
29. cambiar `source_system` histórico;
30. reactivar Makos por fallo de PULSO;
31. cambiar de canal para obtener otra identidad;
32. cambiar de RPC o writer para eludir la guardia;
33. reiniciar la identidad por replay;
34. reiniciar la identidad por backfill;
35. reiniciar la identidad por restart;
36. borrar una venta confirmada para insertar la otra fuente;
37. borrar eventos o efectos para ocultar doble fuente;
38. corregir ledgers desde PULSO;
39. ejecutar rollback distribuido global;
40. considerar igualdad agregada como paridad individual;
41. declarar implementada la guardia por existir la unicidad de archivo actual;
42. declarar implementada la guardia por existir deduplicación downstream;
43. crear tabla, constraint, índice, RPC, función, trigger, claim, lock, worker o cola desde esta tarea;
44. modificar código, SQL, migraciones, RLS, datos, Supabase, credenciales o configuración remota;
45. iniciar o desarrollar `INT-SALES-011`.

---

#### 60. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el registro canónico vigente ya exige que toda fuente empresarial competidora sea identificada, comparada y resuelta conservando origen, responsable, resolución y evidencia; que el POS externo y PULSO converjan en contratos canónicos de venta y línea sin doble emisión; que el corte por sede, terminal y fecha efectiva impida que ambas fuentes emitan la misma venta; que identidad, huella, concurrencia y resultado recuperable impidan una segunda mutación; y que retry, replay, respuestas perdidas y conciliación no dupliquen ventas ni efectos. `INT-SALES-010` especializa esas obligaciones en la barrera permanente previa a una segunda venta o emisión sin introducir una obligación verificable material nueva.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

---

#### 61. Cobertura de prueba existente preservada

Se preserva sin modificación, en especial:

- `TREQ-INTEGRATION-003`, para identidad estable, huella, resultado recuperable, conflicto, concurrencia y resultado desconocido;
- `TREQ-INTEGRATION-006`, para fuente empresarial única, fuentes competidoras y resolución sin sobrescribir historia;
- `TREQ-INTEGRATION-011`, para efectos físicos correlacionados e idempotentes;
- `TREQ-INTEGRATION-014`, para transición POS externo/PULSO sin doble emisión y corte que impide que ambas fuentes emitan la misma venta;
- `TREQ-INTEGRATION-109`, para entrega al menos una vez y efecto como máximo una vez por alcance;
- `TREQ-INTEGRATION-112`, para recuperación del resultado con identidad y huella compatibles;
- `TREQ-INTEGRATION-113`, para conflicto ante reutilización incompatible;
- `TREQ-INTEGRATION-120`, para un solo ganador empresarial bajo concurrencia;
- `TREQ-INTEGRATION-121`, para recuperación después de respuesta perdida;
- `TREQ-INTEGRATION-122`, para atomicidad entre mutación, identidad, resultado y emisión;
- `TREQ-INTEGRATION-125` a `TREQ-INTEGRATION-127`, para identidad externa, receipt y límite del hash;
- `TREQ-INTEGRATION-131` y `TREQ-INTEGRATION-132`, para replay y backfill;
- `TREQ-INTEGRATION-142`, para resultado desconocido antes de reejecución;
- `TREQ-INTEGRATION-155`, para replay y backfill sin reactivar efectos;
- `TREQ-INTEGRATION-211`, para conciliación con fuentes, criterio, decisión, autoridad y residual;
- la cobertura de ownership y prohibición de escrituras cruzadas ya vigente para PULSO, NEXO, NUMERA y PASS.

Ninguna fila cambia de identidad, texto, estado, relación, propietaria, evidencia ni secuencia por esta tarea.

---

#### 62. Decisiones congeladas

1. Una venta tiene un solo origen autorizado.
2. PULSO conserva la venta canónica interna.
3. Makos permanece como afirmación externa dentro de su intervalo histórico.
4. Autoridad se resuelve antes de crear.
5. Existencia previa se consulta antes de crear.
6. Fuente autorizada no implica venta nueva.
7. La venta conserva origen histórico.
8. Otra fuente no puede reasignar origen.
9. `EXTERNAL_SALE_KEY` se reutiliza cuando está demostrada.
10. No se inventa identidad externa.
11. La identidad PULSO nativa permanece propia.
12. Cross-source exige correlación determinista.
13. Similitud no equivale a identidad.
14. Agregado no equivale a venta.
15. Hash no equivale a venta.
16. Fila no equivale a venta.
17. Mapping de producto no equivale a venta.
18. Fuente no autorizada produce conflicto.
19. Misma fuente + misma identidad + misma huella recupera resultado.
20. Misma identidad + huella incompatible produce conflicto o revisión.
21. Fuente competidora produce cero segunda venta.
22. Fuente competidora produce cero segundo evento.
23. Concurrencia tiene un único ganador.
24. Retry conserva fuente e identidad.
25. Resultado desconocido exige consulta.
26. No existe fallback automático entre fuentes.
27. Replay conserva origen.
28. Backfill conserva origen.
29. Revisión conserva venta.
30. Anulación conserva venta.
31. Devolución conserva venta.
32. Reembolso conserva venta.
33. Compensación no crea venta.
34. El evento se emite después de la guardia.
35. `event_id` no sustituye la guardia.
36. Inbox consumidor no sustituye la guardia.
37. NEXO conserva idempotencia propia.
38. NUMERA conserva idempotencia propia.
39. PASS conserva idempotencia propia.
40. Duplicados históricos se corrigen sin borrar historia.
41. `INT-SALES-008` conserva conciliación.
42. `INT-SALES-009` conserva autoridad temporal.
43. `INT-SALES-011` conserva retiro del adaptador.
44. La implementación física queda diferida al paquete PULSO correspondiente.
45. `makos_excel` actual no demuestra guardia individual.
46. No se selecciona primitiva física.
47. Se crean cero cambios `TREQ-*`.
48. No se genera una copia del registro canónico de requisitos.
49. Se crean cero objetos físicos.
50. Se modifican cero objetos físicos.
51. No se modifica código, SQL, migraciones, datos, Supabase, credenciales ni configuración remota.

---

#### 63. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. mantiene `INT-SALES-009` como tarea anterior aprobada;
2. mantiene `INT-SALES-011` como única tarea siguiente reservada;
3. define una sola fuente de origen por venta;
4. conserva PULSO como propietaria de la venta canónica interna;
5. conserva Makos como procedencia externa cuando corresponda;
6. consume la autoridad temporal de `INT-SALES-009`;
7. evalúa autoridad antes de crear;
8. evalúa existencia previa antes de crear;
9. define el vínculo lógico durable de origen;
10. conserva identidad canónica y externa separadas;
11. reutiliza `EXTERNAL_SALE_KEY` cuando existe evidencia suficiente;
12. impide fabricar `external_sale_id`;
13. define la identidad PULSO nativa sin convertirla en identidad externa ficticia;
14. exige correlación determinista para equivalencia cross-source;
15. impide equivalencia por similitud;
16. impide equivalencia por total;
17. impide equivalencia por fecha;
18. impide equivalencia por producto;
19. impide equivalencia por terminal aislada;
20. impide equivalencia por hash;
21. impide equivalencia por fila;
22. define autoridad como primera puerta;
23. define existencia previa como segunda puerta;
24. recupera resultado ante mismo origen e identidad compatible;
25. produce conflicto ante huella incompatible;
26. produce conflicto ante fuente competidora;
27. produce cero segunda venta por fuente competidora;
28. produce cero segundo evento por fuente competidora;
29. trata Makos pre-corte conforme a su autoridad;
30. trata PULSO post-corte conforme a su autoridad;
31. trata Makos pre-corte tardío sin reclasificarlo;
32. trata PULSO offline post-corte sin reclasificarlo;
33. trata Makos post-corte como conflicto;
34. trata PULSO pre-corte no autorizado como conflicto;
35. bloquea autoridad solapada;
36. permite ventas legítimamente distintas;
37. conserva candidatos inciertos para conciliación sin fusión;
38. limita agregados a evidencia agregada;
39. clasifica el hash actual como guardia de archivo y no de venta;
40. excluye `source_row_number` como identidad;
41. excluye mapping de producto como identidad de venta;
42. exige un único ganador concurrente;
43. trata concurrencia Makos/PULSO sin dos ganadores;
44. exige atomicidad o durabilidad equivalente;
45. coloca emisión después de la guardia;
46. impide usar `event_id` como barrera principal;
47. impide usar inbox consumidor como barrera principal;
48. preserva guardas de NEXO;
49. preserva guardas de NUMERA;
50. preserva guardas de PASS;
51. define reparación de duplicado histórico sin borrar historia;
52. conserva retry con misma fuente;
53. resuelve resultado desconocido antes de repetir;
54. conserva identidad ante cambio tecnológico;
55. conserva replay;
56. conserva backfill;
57. conserva revisiones;
58. conserva anulaciones, devoluciones y reembolsos;
59. impide fallback Makos por caída de PULSO;
60. exige nuevo límite para reasignación futura;
61. reutiliza `INT-SALES-008` para conciliación;
62. hace explícitas las resoluciones de conciliación;
63. diagnostica la línea técnica actual sin declararla suficiente;
64. diagnostica el parser actual sin inventar granularidad;
65. define la frontera de implementación posterior;
66. asigna cada pendiente a propietaria y condición de salida;
67. hace reconstruible la auditoría;
68. separa métricas de afirmación, aceptación, duplicado y conflicto;
69. minimiza datos;
70. prohíbe escritura cruzada;
71. genera cero requisitos de prueba nuevos;
72. modifica cero requisitos de prueba;
73. no genera una copia del registro canónico de requisitos;
74. crea cero objetos físicos;
75. modifica cero objetos físicos;
76. no modifica código, SQL, migraciones, datos, Supabase, credenciales ni configuración remota;
77. no inicia ni desarrolla `INT-SALES-011`.

---

#### 64. Resultado de la tarea

`INT-SALES-010` queda definida como la barrera permanente que impide que Makos y PULSO conviertan una misma venta empresarial en dos ventas canónicas o dos emisiones nuevas.

Resultado consolidado:

```text
AFIRMACIÓN DE VENTA
+
FUENTE AUTORIZADA
+
IDENTIDAD INDIVIDUAL DEMOSTRABLE
+
ORIGEN HISTÓRICO DURABLE
+
HUELLA VERSIONADA
+
RESULTADO PREVIO CONSULTABLE
+
EXCLUSIÓN CONCURRENTE
        ↓
UNA SOLA REPRESENTACIÓN CANÓNICA
+
UNA SOLA FUENTE DE ORIGEN
+
CERO SEGUNDA EMISIÓN POR FUENTE COMPETIDORA
```

Con la distinción obligatoria:

```text
DUPLICADO VERDADERO
→ RECUPERAR RESULTADO
```

```text
FUENTE COMPETIDORA
→ CONFLICTO DE AUTORIDAD
→ CERO SEGUNDA VENTA
```

```text
SIMILITUD SIN IDENTIDAD
→ CONCILIACIÓN
→ CERO FUSIÓN AUTOMÁTICA
```

sin depender de deduplicación downstream, sin inventar identidad desde agregados y sin modificar físicamente la implementación en esta tarea.

---

#### 65. Continuidad

ÚLTIMA TAREA APROBADA

`INT-SALES-009 — Definir corte por sede, terminal y fecha efectiva`

TAREA ACTUAL APROBADA

`INT-SALES-010 — Definir control que impida que ambas fuentes emitan la misma venta`

SIGUIENTE TAREA RESERVADA

`INT-SALES-011 — Definir retiro del adaptador externo sin modificar consumidores internos`


### ✅ INT-SALES-011 — Definir retiro del adaptador externo sin modificar consumidores internos

**Estado:** APROBADA
**Tarea anterior:** `INT-SALES-010 — Definir control que impida que ambas fuentes emitan la misma venta`
**Tarea siguiente:** `INT-MKT-001 — Definir campañas solo después de aprobar AURA`
**Tipo de tarea:** documental; definición normativa y materializada del retiro permanente del adaptador de ventas del POS externo una vez que PULSO sea la única fuente autorizada para nuevas ventas del alcance correspondiente, preservando identidad, procedencia, historia, conciliación y contratos internos hacia NEXO, NUMERA y PASS, sin retirar físicamente código, rutas, bindings, credenciales, tablas, funciones, migraciones, datos ni configuración durante esta tarea
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/07_VENTAS_INVENTARIO_FINANZAS_Y_FIDELIZACION.md`
**POS externo de transición:** `Makos`
**Aplicación propietaria del hecho comercial interno:** `PULSO`
**Contrato transversal de retiro consumido:** `INT-EXT-019 — Definir retiro de integración y revocación de credenciales`
**Contrato de credenciales consumido:** `INT-POS-024 — Definir revocación o reducción de credenciales cuando PULSO asuma la fuente`
**Línea base documental:** `vento-shell@ee281fca8d346df08f87092baa7fb0cefcf79681`
**Línea base técnica PULSO observada:** `vento-pulso@71e0184486b5fe11e0a42435baf4024807a80efd`
**Cambios físicos autorizados:** ninguno
**Estado documental del contrato de retiro:** `ESPECIFICADO`
**Estado operativo del retiro físico:** `BLOQUEADO`
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el cierre permanente de la ruta de entrada Makos → PULSO cuando el POS externo ya no sea necesario para originar nuevas ventas ni para resolver residuales históricos, de forma que el retiro del adaptador no cambie el contrato canónico que reciben las aplicaciones internas.

Regla raíz:

```text
ANTES DEL RETIRO
MAKOS
→ ADAPTADOR EXTERNO
→ PULSO: VENTA CANÓNICA
→ EVENTO CANÓNICO PULSO
→ NEXO / NUMERA / PASS SEGÚN CORRESPONDA

DESPUÉS DEL RETIRO
PULSO: VENTA NATIVA
→ MISMA VENTA CANÓNICA
→ MISMO EVENTO CANÓNICO PULSO
→ NEXO / NUMERA / PASS SEGÚN CORRESPONDA
```

El objeto que desaparece es el **camino técnico de incorporación desde la fuente externa**. No desaparecen ni se reinterpretan la venta canónica, el evento PULSO, los efectos de las consumidoras, la historia Makos ni la evidencia requerida para reconstruir lo ocurrido.

---

#### 2. Resultado sustantivo

`INT-SALES-011` deja congeladas las siguientes decisiones:

1. el adaptador Makos no es parte del contrato que NEXO, NUMERA o PASS deben consumir;
2. el adaptador termina su función únicamente después de que PULSO sea la fuente autorizada de nuevas ventas para todo alcance que dependía de esa ruta y no exista tráfico nuevo legítimo que deba ingresar por Makos;
3. retirar el adaptador no cambia la identidad, versión, esquema, audiencia ni semántica del evento canónico de venta de PULSO;
4. ninguna consumidora interna deberá cambiar de endpoint, esquema, `effect_code`, clave idempotente, regla de negocio o fuente de verdad como consecuencia del retiro;
5. una venta Makos histórica conserva `source_system = Makos` o la procedencia equivalente aprobada;
6. una venta PULSO posterior al corte conserva origen PULSO y no adquiere una identidad Makos para mantener compatibilidad;
7. el retiro no recrea ventas históricas ni vuelve a emitir eventos ya existentes;
8. replay y backfill históricos conservan identidad, procedencia, audiencia y resultados previos;
9. una revisión, anulación, devolución o reembolso de una venta Makos histórica conserva vínculo con el original aunque el adaptador ya no esté activo;
10. un residual que todavía necesite consultar o recibir información Makos impide el retiro terminal del adaptador mientras no tenga una ruta autorizada que elimine esa dependencia;
11. la conciliación debe resolver o asignar explícitamente resultados desconocidos y trabajo pendiente antes del cierre terminal;
12. retirar credenciales y retirar el adaptador son controles coordinados pero distintos;
13. una credencial revocada no demuestra por sí sola que el adaptador esté retirado;
14. eliminar una pantalla, variable o función local no demuestra por sí solo retiro terminal;
15. el retiro terminal exige que no existan consumidoras internas dependientes del adaptador ni residuales que requieran su runtime;
16. historia, receipts, mappings, auditoría, evidencias, correlaciones y resultados empresariales se preservan conforme a sus políticas vigentes;
17. el retiro no elimina la cuenta del proveedor, su historial remoto ni superficies ajenas al flujo de ventas por inferencia;
18. pagos, caja, documento fiscal y contabilidad oficial no cambian de proveedor ni de autoridad por retirar el adaptador de ventas;
19. una contingencia posterior de PULSO no reactiva Makos como fuente por fallback silencioso;
20. cualquier futura reactivación de una fuente externa para nuevas ventas exige una nueva decisión explícita de autoridad y un nuevo intervalo no solapado;
21. la fase documental actual crea cero objetos físicos, elimina cero objetos físicos y ejecuta cero revocaciones;
22. el estado físico actual del retiro permanece bloqueado hasta demostrar las puertas definidas en esta tarea.

---

#### 3. Dependencias consumidas y preservadas

La tarea consume sin reabrir:

- `INT-SALES-001`, para propiedad de PULSO sobre la venta canónica;
- `INT-SALES-002`, para emisión del evento canónico de venta;
- `INT-SALES-003`, para el efecto físico propietario de NEXO;
- `INT-SALES-004`, para el efecto económico propietario de NUMERA;
- `INT-SALES-005`, para acumulación propietaria de PASS cuando corresponda;
- `INT-SALES-006`, para redención PASS como operación separada;
- `INT-SALES-007`, para idempotencia y recuperación de efectos frente a retry;
- `INT-SALES-008`, para conciliación permanente de convivencia y residuales;
- `INT-SALES-009`, para autoridad temporal por sede, terminal y fecha efectiva;
- `INT-SALES-010`, para impedir doble origen de una misma venta antes de una segunda emisión;
- `INT-POS-009`, para procedencia y evidencia original externa;
- `INT-POS-013`, para identidad e idempotencia del hecho externo;
- `INT-POS-019`, para compensaciones no destructivas;
- `INT-POS-020`, para conciliación de ventas y efectos;
- `INT-POS-023`, para el corte Makos → PULSO y la clasificación de eventos tardíos y residuales;
- `INT-POS-024`, para reducción, revocación y retiro de referencias de credenciales;
- `INT-EXT-019`, para las puertas transversales de retiro de una integración;
- `INT-EXT-020`, para impedir una revocación ciega cuando una credencial esté compartida o su exclusividad no pueda acreditarse;
- `INT-APP-004` a `INT-APP-010`, para idempotencia, retry, auditoría, partialidad, resultados desconocidos y prohibición de escrituras cruzadas.

Ninguna dependencia cambia de identidad, significado, propietaria ni estado por esta tarea.

---

#### 4. Frontera exacta del adaptador de ventas

Para esta tarea, el adaptador externo es la frontera técnica que incorpora afirmaciones de venta de Makos hacia el dominio comercial interno y puede comprender, según el binding realmente materializado:

- canal de entrada o captura autorizado;
- autenticación o contexto del proveedor;
- recepción y preservación de evidencia original;
- parsing o transformación del formato externo;
- staging;
- mapping de contexto y producto;
- cuarentena;
- normalización hacia el contrato canónico;
- idempotencia de la afirmación externa;
- correlación con la venta canónica;
- rutas operativas usadas exclusivamente para ese ingreso.

No forman parte del adaptador que esta tarea pretende retirar:

- la venta canónica de PULSO;
- la línea canónica de venta;
- el catálogo empresarial de eventos;
- el contrato de entrega a consumidoras;
- el inbox de NEXO, NUMERA o PASS;
- los ledgers o efectos de NEXO, NUMERA o PASS;
- la auditoría histórica;
- la evidencia protegida ya preservada;
- un documento fiscal histórico;
- un pago histórico;
- una compensación ya registrada.

---

#### 5. Separación obligatoria de lifecycles

Se mantiene:

```text
LIFECYCLE DEL POS EXTERNO
≠
LIFECYCLE DEL ADAPTADOR
≠
LIFECYCLE DE LA CREDENCIAL
≠
LIFECYCLE DE LA VENTA
≠
LIFECYCLE DEL EVENTO PULSO
≠
LIFECYCLE DEL EFECTO CONSUMIDOR
≠
RETENCIÓN DE HISTORIA Y EVIDENCIA
```

Consecuencias:

1. revocar una credencial no borra el adaptador ni la historia;
2. retirar el adaptador no borra ventas ni eventos;
3. cerrar el POS como fuente de nuevas ventas no invalida hechos anteriores;
4. un efecto ya aplicado en NEXO, NUMERA o PASS conserva su identidad después del retiro;
5. un residual histórico puede mantener abierto el retiro aunque no exista nueva autoridad de venta en Makos;
6. la retención de evidencia puede continuar después del retiro terminal sin mantener activo el binding.

---

#### 6. Topología antes y después del retiro

| Momento                               | Entrada de nuevas ventas                                                            | Contrato interno                | Consumidoras                       | Regla                                                                            |
| ------------------------------------- | ----------------------------------------------------------------------------------- | ------------------------------- | ---------------------------------- | -------------------------------------------------------------------------------- |
| antes del corte del alcance           | Makos mediante adaptador                                                            | venta/evento canónicos de PULSO | NEXO, NUMERA y PASS cuando aplique | Makos conserva la autoridad temporal definida                                    |
| después del corte pero con residuales | PULSO para nuevas ventas; Makos solo puede sostener historia/residuales autorizados | mismo contrato canónico         | mismas consumidoras                | el adaptador no puede originar nuevas ventas post-corte                          |
| después del retiro terminal           | PULSO                                                                               | mismo contrato canónico         | mismas consumidoras                | no existe runtime Makos autorizado para nuevas ventas ni residuales dependientes |

La transición no introduce una cuarta topología en la que las consumidoras internas deban conocer si la venta fue recibida mediante Makos o creada nativamente en PULSO para decidir cómo consumirla.

---

#### 7. Invariante de consumidoras internas

La condición central de esta tarea es:

```text
CONTRATO CONSUMIDO ANTES DEL RETIRO
=
CONTRATO CONSUMIDO DESPUÉS DEL RETIRO
```

El origen de la venta puede continuar disponible como dato de procedencia cuando sea necesario, pero no cambia la interfaz contractual de la consumidora.

| Consumidora | Antes del retiro                                                       | Después del retiro                                        | Cambio permitido por esta tarea                               |
| ----------- | ---------------------------------------------------------------------- | --------------------------------------------------------- | ------------------------------------------------------------- |
| NEXO        | recibe el evento/contrato aprobado y decide su efecto físico           | recibe el mismo contrato y decide el mismo tipo de efecto | ninguno                                                       |
| NUMERA      | recibe el hecho comercial autorizado y materializa su efecto económico | recibe el mismo hecho contractual                         | ninguno                                                       |
| PASS        | evalúa cuenta, regla y elegibilidad sobre el evento autorizado         | ejecuta la misma evaluación                               | ninguno                                                       |
| PULSO       | conserva venta canónica y evento empresarial                           | conserva venta canónica y evento empresarial              | deja de necesitar la ruta de ingreso Makos para nuevas ventas |

NEXO, NUMERA y PASS no deberán leer directamente archivos Makos, tablas de staging Makos, hashes de archivo, filas del importador, credenciales Makos ni endpoints del proveedor para cumplir su responsabilidad canónica.

---

#### 8. Condición de independencia real de consumidoras

El retiro terminal solo puede declararse cuando la implementación pueda demostrar que:

1. ninguna consumidora interna autorizada recibe tráfico directamente desde Makos;
2. ninguna consumidora necesita una tabla, vista, función, cola o endpoint exclusivo del adaptador para aplicar su efecto ordinario;
3. la información necesaria para cada efecto está presente en el contrato canónico o en referencias gobernadas independientes del adaptador;
4. el retiro del runtime externo no obliga a cambiar el registro de audiencia;
5. el retiro no obliga a crear un nuevo `event_definition_id` ni un segundo evento semánticamente equivalente;
6. la eliminación futura de referencias activas del adaptador no deja jobs, caches, funciones o procesos internos huérfanos;
7. las pruebas de compatibilidad contractual demuestran el mismo comportamiento consumidor para una venta canónica elegible independientemente de que su procedencia histórica haya sido Makos o PULSO.

La aprobación documental de esta tarea especifica la condición; no constituye evidencia física de que esas siete comprobaciones ya hayan sido ejecutadas.

---

#### 9. Unidad de retiro

La desactivación puede ocurrir progresivamente por alcance durante la transición, pero el **retiro terminal del adaptador de ventas** solo es válido para un binding o superficie cuando:

- no conserva autoridad de nuevas ventas en ninguna sede o terminal incluida en ese binding;
- no existe un alcance legítimo no transferido que todavía necesite esa ruta;
- no existen residuales históricos que exijan mantener el runtime;
- cualquier credencial aplicable está tratada conforme a `INT-POS-024` e `INT-EXT-019`;
- las consumidoras internas ya operan únicamente sobre el contrato PULSO;
- la historia necesaria está preservada fuera de la necesidad de runtime activo.

Si una misma implementación del adaptador todavía sirve a una sede o terminal no transferida, no puede declararse retirada globalmente por haber cerrado otros alcances.

---

#### 10. Puertas acumulativas del retiro terminal

El retiro terminal requiere todas las puertas aplicables:

| Puerta                                          | Condición especializada para ventas                                                                                 |
| ----------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| `AUTORIDAD_DE_RETIRO_ACREDITADA`                | existe decisión válida y alcance exacto para cerrar el adaptador de ventas                                          |
| `AUTORIDAD_DE_FUENTE_TRANSFERIDA`               | PULSO es autoridad de nuevas ventas en todo alcance que dejará de usar el adaptador                                 |
| `CERO_NUEVAS_INTENCIONES_MAKOS`                 | ninguna venta nueva autorizada puede originarse por el binding retirado                                             |
| `DOBLE_FUENTE_BLOQUEADA`                        | el control de `INT-SALES-010` impide una segunda venta/emisión desde la fuente anterior                             |
| `CONSUMIDORAS_INDEPENDIENTES`                   | NEXO, NUMERA y PASS dependen del contrato PULSO, no del adaptador                                                   |
| `TRABAJO_EN_CURSO_CLASIFICADO`                  | toda recepción, lote, revisión, retry, cuarentena o caso abierto tiene estado y propietario                         |
| `RESULTADOS_DESCONOCIDOS_RESUELTOS_O_ASIGNADOS` | ningún outcome incierto queda oculto ni habilita repetición ciega                                                   |
| `RESIDUALES_CERRADOS_O_DESACOPLADOS`            | ningún residual legítimo requiere mantener el runtime Makos                                                         |
| `BINDING_DESACTIVADO_O_NO_APLICA`               | la ruta técnica ya no admite nuevo uso o se acredita que nunca existió un binding runtime distinto del flujo legacy |
| `CREDENCIALES_RESUELTAS`                        | material aplicable está reducido, revocado, retirado o clasificado como no aplicable según contrato                 |
| `REFERENCIAS_ACTIVAS_RESUELTAS`                 | ningún consumidor autorizado apunta a una referencia retirada                                                       |
| `HISTORIA_PRESERVADA`                           | venta, evento, payload/evidencia, mappings, receipts, auditoría y resultados siguen reconstruibles                  |
| `CONCILIACION_CERRADA`                          | no quedan diferencias críticas incompatibles con el cierre terminal                                                 |
| `COMPATIBILIDAD_INTERNA_DEMOSTRADA`             | el retiro no cambia contrato ni resultado esperado de NEXO, NUMERA o PASS                                           |

Una sola puerta falsa impide declarar el adaptador `RETIRADO` en sentido operativo.

---

#### 11. Corte de nuevas intenciones

Cuando un alcance ya ha sido transferido a PULSO:

```text
NUEVA VENTA POST-CORTE
→ SOLO PULSO
```

Queda prohibido que el adaptador:

- acepte una nueva venta Makos como venta válida del intervalo PULSO;
- use acceso residual para recrear una venta post-corte;
- acepte una fila, archivo, webhook, polling o replay nuevo como medio para restaurar doble autoridad;
- genere otra identidad porque el canal externo entregue el dato después;
- envíe una nueva emisión a consumidoras para una venta ya reconocida;
- convierta un residual histórico en autorización para tráfico ordinario.

Una entrega nueva que contradiga la autoridad vigente se conserva como evidencia y se lleva a conflicto o conciliación; no prolonga automáticamente la vida del adaptador.

---

#### 12. Trabajo en curso al iniciar retiro

Antes del cierre terminal se clasifican, como mínimo, las unidades conocidas:

| Situación                                    | Tratamiento                                                                                            |
| -------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| venta/evento confirmado                      | preservar resultado; no repetir                                                                        |
| recepción pre-corte pendiente de transformar | completar solo si sigue siendo legítima y mantiene identidad histórica, o asignar resolución explícita |
| recepción enviada con receipt                | recuperar resultado antes de cerrar                                                                    |
| resultado desconocido                        | consultar o conciliar antes de repetir o descartar                                                     |
| retry abierto                                | conservar identidad, presupuesto y autoridad; no generar nueva operación                               |
| revisión histórica pendiente                 | conservar relación con la venta original                                                               |
| cuarentena                                   | conservar causa y evidencia; el retiro no la resuelve                                                  |
| conflicto de doble fuente                    | conservar ambas evidencias y resolver autoridad; no elegir por conveniencia                            |
| compensación pendiente                       | conservar el original y la propietaria de cada efecto                                                  |
| residual aceptado                            | conservar responsable y condición objetiva de cierre                                                   |

El retiro no convierte masivamente las unidades existentes en canceladas, exitosas, fallidas o eliminadas.

---

#### 13. Llegadas tardías después del corte

Una llegada Makos posterior al corte puede seguir siendo legítima únicamente si demuestra que corresponde a un hecho anterior al límite efectivo o a una revisión/acción histórica admitida por el contrato.

Mientras exista una ventana real en la que esas llegadas necesiten el runtime del adaptador, el retiro terminal permanece abierto.

El cierre puede ocurrir cuando cada clase aplicable esté en una de estas condiciones:

- la ventana contractual terminó y no quedan pendientes;
- la evidencia necesaria ya fue preservada y el procesamiento histórico puede realizarse sin binding activo;
- existe una ruta alternativa autorizada, idempotente y auditable que no reactiva la fuente para nuevas ventas;
- el residual queda resuelto y conciliado.

No se inventa una fecha de cierre de eventos tardíos si el proveedor o el contrato no la acreditan.

---

#### 14. Replay y backfill después del retiro

Un replay o backfill de historia Makos podrá ejecutarse desde evidencia preservada únicamente conforme a los contratos vigentes y sin reactivar el adaptador como fuente nueva.

Debe conservar:

- identidad histórica;
- `source_system` histórico;
- `event_id` cuando el evento ya existía;
- versión y tiempo del hecho;
- audiencia histórica;
- mapping/versiones necesarias;
- resultados idempotentes previos;
- correlación con efectos y compensaciones.

Queda prohibido cambiar la fuente histórica a PULSO para simplificar un backfill o crear otro evento porque el runtime original ya fue retirado.

---

#### 15. Preservación de mappings y procedencia

El retiro del adaptador no autoriza borrar la relación histórica entre una afirmación externa y la representación canónica que produjo.

Cuando corresponda a la política de retención vigente deberán conservarse, por referencia o evidencia protegida:

- sistema y contexto de origen;
- identificador externo disponible;
- identidad de recepción;
- payload o evidencia original;
- hash y versión de canonicalización cuando existan;
- mapping de sede, terminal y producto utilizado;
- versión del mapping;
- decisión de cuarentena/liberación;
- identidad canónica de venta y línea;
- evento PULSO correlacionado;
- receipts y efectos consumidores;
- decisiones de conciliación y compensación.

La conservación histórica no exige mantener una pantalla de importación, una credencial activa ni un endpoint habilitado.

---

#### 16. Invariante NEXO

El retiro no modifica la frontera física.

NEXO continúa siendo propietario de:

- movimiento físico;
- cantidad y unidad física;
- lote y ubicación cuando apliquen;
- posting/receipt canónico;
- idempotencia de su efecto;
- compensación física;
- conciliación de su ledger.

Una venta Makos histórica y una venta PULSO nativa que satisfagan el mismo contrato de efecto físico no requieren dos interfaces NEXO distintas.

El flujo legacy que haya escrito inventario directamente desde un importador no se convierte en el contrato permanente por existir antes del retiro.

---

#### 17. Invariante NUMERA

El retiro no modifica la frontera económica.

NUMERA continúa recibiendo el hecho económico aplicable desde la fuente interna autorizada y conserva:

- identidad de efecto;
- monto y moneda;
- entidad, sede, centro y periodo aplicables;
- materialidad;
- idempotencia;
- reversos o compensaciones;
- conciliación y evidencia.

Retirar el adaptador Makos no crea otro hecho económico, no recalcula historia y no convierte una importación legacy en fuente contable.

---

#### 18. Invariante PASS

El retiro no modifica la frontera de fidelización.

PASS continúa resolviendo:

- identidad y cuenta elegible;
- regla y versión;
- base de cálculo;
- acumulación;
- redención como operación distinta;
- ledger inmutable;
- balance derivado;
- compensaciones.

Una venta histórica no acumula puntos de nuevo porque el adaptador se retire. Una venta PULSO posterior usa la misma evaluación PASS cuando corresponda.

---

#### 19. Pagos, caja, fiscalidad y otras superficies

Se conserva:

```text
ADAPTADOR DE VENTAS MAKOS
≠
PROVEEDOR DE PAGO
≠
CAJA
≠
DOCUMENTO FISCAL
≠
CUENTA ADMINISTRATIVA DEL PROVEEDOR
≠
CONTABILIDAD OFICIAL
```

Por tanto, esta tarea no autoriza:

- revocar credenciales de pago por inferencia;
- retirar un proveedor fiscal;
- eliminar facturas o documentos históricos;
- cerrar una cuenta administrativa Makos que conserve otra finalidad autorizada;
- borrar reportes sujetos a retención;
- transferir autoridad contable a NUMERA;
- eliminar otras integraciones que compartan proveedor pero no binding.

Cada superficie conserva su propio contrato y lifecycle.

---

#### 20. Coordinación con credenciales y bindings

El retiro terminal consume la decisión de `INT-POS-024` sin sustituirla.

Se conserva:

```text
DEJAR DE USAR EL ADAPTADOR
≠
DESACTIVAR EL BINDING
≠
REVOCAR LA CREDENCIAL
≠
RETIRAR REFERENCIAS LOCALES
```

Para cerrar el adaptador:

1. el binding que permita tráfico nuevo debe estar desactivado o acreditarse como no aplicable;
2. las credenciales aplicables deben tener tratamiento compatible con el cierre;
3. una credencial compartida no se revoca a ciegas;
4. una credencial comprometida se rige por la prioridad de seguridad definida transversalmente;
5. el valor secreto nunca se conserva como evidencia de retiro;
6. la ausencia de una credencial Makos acreditada impide fingir una revocación física, pero no impide definir este contrato documental.

---

#### 21. Estado técnico actual observado

La línea base técnica vigente permite observar un flujo legacy de importación diaria desde archivo XLSX:

- `vento-pulso` contiene la superficie `/sales-imports`;
- la superficie parsea un reporte Makos por artículo;
- conserva sede, fecha, hash de archivo y filas del reporte;
- mantiene mappings `source = makos` para productos;
- crea lotes y filas de importación;
- invoca `pulso_post_daily_sales_import` para el posting legacy;
- `vento-shell` contiene las estructuras y funciones Supabase que soportan ese flujo;
- el RPC legacy puede materializar movimientos de inventario a partir de las filas agregadas.

Ese estado demuestra una dependencia técnica legacy que deberá inventariarse cuando exista una fase autorizada de retiro físico.

No demuestra por sí solo:

- una venta individual canónica por cada transacción Makos;
- una línea individual canónica por cada transacción;
- un binding API/webhook Makos operativo;
- una credencial Makos instanciable;
- un inbox canónico independiente en cada consumidora;
- que NEXO, NUMERA o PASS dependan contractualmente de ese importador;
- que el adaptador ya pueda retirarse físicamente.

---

#### 22. Tratamiento del flujo legacy al implementar el retiro

Cuando una fase posterior autorice cambios físicos, el inventario de retiro deberá identificar exhaustivamente antes de modificar:

- superficie de importación en PULSO;
- parsing y transformación Makos;
- mappings externos activos;
- tablas, vistas, RPC, funciones, triggers y políticas dedicados al flujo;
- navegación y permisos que expongan la función;
- jobs o procesos que lean sus estructuras;
- referencias de auditoría y evidencia;
- datos históricos que deban conservarse;
- consumidores técnicos reales;
- cualquier dependencia compartida que no pueda retirarse con seguridad.

Las modificaciones Supabase que resulten necesarias deberán originarse, versionarse y ejecutarse desde `vento-shell` conforme a las reglas vigentes.

Esta tarea no decide todavía qué objeto físico se elimina, conserva, migra, deshabilita o reemplaza porque la fase documental no autoriza materializar esa mutación y el binding objetivo todavía no está acreditado como operativo.

---

#### 23. Historia física frente a runtime activo

El retiro deberá distinguir entre:

| Elemento                            | Puede dejar de estar activo                   | Puede conservarse históricamente                                                                          |
| ----------------------------------- | --------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| pantalla/ruta de ingreso Makos      | sí, cuando se implemente el retiro            | no es necesaria para explicar historia                                                                    |
| parser o worker de nuevas ventas    | sí                                            | puede conservarse solo si una política técnica lo exige para reproducibilidad sin habilitar tráfico nuevo |
| credencial/binding de nuevas ventas | sí; debe quedar resuelto para cierre terminal | solo referencia no sensible de lifecycle                                                                  |
| ventas y líneas históricas          | no                                            | sí                                                                                                        |
| payload/evidencia histórica         | no por el solo retiro                         | sí según retención y sensibilidad                                                                         |
| mappings históricos                 | no por el solo retiro                         | sí cuando sean necesarios para reproducibilidad                                                           |
| auditoría y conciliación            | no por el solo retiro                         | sí                                                                                                        |
| receipts y resultados idempotentes  | no por el solo retiro                         | sí                                                                                                        |
| contrato PULSO → consumidoras       | no                                            | sí y continúa operativo                                                                                   |

Retirar runtime no equivale a destruir reproducibilidad.

---

#### 24. Conciliación previa al retiro

`INT-SALES-008` permanece como propietaria de la conciliación de convivencia y deberá permitir demostrar, para el alcance que se pretenda retirar:

- cero ventas nuevas legítimas pendientes de Makos;
- cero ventas post-corte aceptadas indebidamente desde Makos;
- cero dobles emisiones sin resolución;
- cero ventas obligatorias sin evento sin propietario;
- cero efectos huérfanos críticos sin dueño;
- cero resultados desconocidos ocultos;
- cero revisiones históricas pendientes que requieran runtime sin una ruta definida;
- cero compensaciones históricas que dependan de acceso no resuelto;
- cero residuales críticos sin propietario y condición de salida.

Una igualdad de totales diarios no satisface estas condiciones si no existe la granularidad necesaria para explicar los hechos individuales del alcance.

---

#### 25. Residuales permitidos

Un residual puede permanecer abierto sin impedir la aprobación documental, pero impide el retiro terminal si necesita runtime Makos.

Cada residual deberá conservar como mínimo:

- identidad o referencia del caso;
- venta, evento o periodo afectado;
- sede y terminal cuando apliquen;
- fuente histórica;
- evidencia disponible;
- resultado conocido o incertidumbre;
- motivo por el cual el adaptador todavía sería necesario;
- responsable;
- siguiente acción;
- condición objetiva de salida.

No son residuales válidos:

- “por si acaso”;
- posibilidad genérica de volver a Makos;
- mantener una segunda fuente por comodidad;
- conservar acceso para evitar definir una ruta de evidencia;
- dejar un retry sin presupuesto ni propietario;
- conservar una credencial amplia porque aún existe código legacy.

---

#### 26. Resultado desconocido durante el retiro

Un timeout, receipt parcial, fallo de red o cierre del proveedor no demuestra que un hecho no ocurrió.

Antes de retirar una ruta necesaria para resolver un `RESULT_UNKNOWN` se deberá:

1. consultar el resultado por la identidad disponible cuando sea posible;
2. recuperar el resultado durable si ya existe;
3. comparar fuente interna, receipt y evidencia externa aplicable;
4. clasificar cualquier efecto confirmado;
5. abrir conciliación cuando no exista certeza suficiente;
6. asignar propietario y siguiente acción;
7. impedir una segunda venta o segundo efecto mientras la incertidumbre continúe.

El retiro no se utiliza para convertir incertidumbre en rechazo terminal.

---

#### 27. Cuarentena y conflictos

La existencia de una línea o recepción en cuarentena no se resuelve borrando el adaptador.

Antes del retiro terminal:

- toda cuarentena necesaria para historia debe conservar identidad y causa;
- un conflicto de mapping se conserva como conflicto;
- un conflicto de doble fuente conserva ambas evidencias;
- una revisión incompatible no se sobrescribe;
- un elemento aislado puede cerrarse, transferirse a una ruta histórica autorizada o conservarse como residual, pero no desaparecer sin decisión;
- retirar el runtime no cambia el outcome empresarial de una unidad existente.

---

#### 28. Compensaciones después del retiro

Las compensaciones pertenecen a los dominios propietarios y no al adaptador.

Una compensación posterior puede seguir ocurriendo respecto de una venta Makos histórica siempre que conserve:

- venta original;
- evento original cuando exista;
- efecto original confirmado;
- propietaria del efecto;
- acción compensatoria autorizada;
- identidad idempotente propia;
- evidencia suficiente;
- residual cuando el cierre sea parcial.

Si la compensación todavía requiere consultar Makos y esa consulta no puede reemplazarse por evidencia preservada, el adaptador no alcanza retiro terminal hasta resolver esa dependencia.

---

#### 29. Contingencia posterior al retiro

Después del retiro terminal:

```text
FALLO DE PULSO
≠
AUTORIDAD AUTOMÁTICA DE MAKOS
```

No se permite:

- restaurar la pantalla legacy como fallback ordinario;
- reutilizar una credencial revocada;
- reconstruir ventas PULSO en Makos para volver a importarlas;
- abrir un nuevo intervalo Makos sin decisión explícita;
- alterar fechas para clasificar una venta como anterior al retiro;
- usar replay histórico como canal de nuevas ventas.

Si alguna contingencia futura exige una fuente externa para nuevas ventas, deberá existir una nueva decisión de autoridad, alcance temporal, binding, credenciales, pruebas y reconciliación. No se considera rollback simple de este retiro.

---

#### 30. Reversibilidad del cambio técnico

El contrato de retiro es terminal respecto del binding retirado, pero una implementación defectuosa puede requerir rollback técnico antes de que el cierre sea declarado definitivo.

Ese rollback técnico:

- no puede reactivar autoridad Makos para nuevas ventas si el intervalo ya pertenece a PULSO;
- no puede reactivar material revocado;
- puede restaurar únicamente componentes necesarios para corregir una falla técnica dentro del mismo contrato y bajo autorización;
- debe conservar historia y auditoría del intento de retiro;
- debe volver a demostrar las puertas antes de declarar cierre.

Una nueva habilitación empresarial de Makos es una decisión distinta y no un rollback técnico.

---

#### 31. Evidencia mínima de retiro terminal

Sin exponer secretos, una futura ejecución deberá poder relacionar:

- alcance y autoridad del retiro;
- sede, terminal e intervalo de fuente aplicables;
- referencia del binding o superficie retirada;
- lista de rutas y consumidores técnicos afectados;
- prueba de que PULSO es la fuente posterior;
- prueba de que nuevas intenciones Makos están bloqueadas;
- resultado del control de doble fuente;
- clasificación del trabajo en curso;
- resultados desconocidos y su resolución;
- residuales y su cierre;
- estado de credenciales y referencias no sensibles;
- estado del binding;
- comprobación de independencia de consumidoras;
- comprobación de contrato interno sin cambios;
- evidencia de que historia, mappings, receipts y auditoría siguen disponibles según política;
- resultado de conciliación;
- momento efectivo del cierre;
- actor o principal autorizado que ejecutó la futura operación;
- cualquier rollback técnico ocurrido;
- estado final y obligaciones residuales.

Un `404`, una pantalla inexistente, una variable borrada o un deploy exitoso no constituyen por sí solos evidencia suficiente de retiro terminal.

---

#### 32. Matriz de estado actual

| Materia                                                              | Estado actual verificable                          | Propietaria                                              | Condición de salida                                                              |
| -------------------------------------------------------------------- | -------------------------------------------------- | -------------------------------------------------------- | -------------------------------------------------------------------------------- |
| contrato documental de retiro                                        | `ESPECIFICADO`                                     | `INT-SALES-011`                                          | contenido aprobado y posteriormente materializado por el paquete autorizado      |
| corte físico Makos → PULSO                                           | `BLOQUEADO`                                        | `INT-SALES-009` + materialización de `INT-POS-023`       | gates reales de binding/piloto/corte superados para el alcance                   |
| control físico de doble fuente                                       | `PENDIENTE_DE_EVIDENCIA`                           | `INT-SALES-010`                                          | implementación y prueba demuestran cero segunda venta/emisión                    |
| binding API/webhook Makos                                            | `BLOQUEADO_POR_EVIDENCIA`                          | integración Makos/PULSO bajo `INT-POS-*`                 | proveedor/tenant acredita binding, identidad, capacidades y autoridad aplicables |
| credencial Makos instanciable                                        | `BLOQUEADO_POR_EVIDENCIA`                          | `INT-POS-024`                                            | material o ausencia de material quedan acreditados y su lifecycle es resoluble   |
| flujo legacy `makos_excel`                                           | `IMPLEMENTADO` como importación agregada observada | PULSO + objetos Supabase versionados desde `vento-shell` | implementación futura decide su retiro físico sin destruir historia              |
| independencia contractual de NEXO/NUMERA/PASS respecto del adaptador | `ESPECIFICADO`                                     | `INT-SALES-002` a `INT-SALES-006` + `INT-SALES-011`      | pruebas de integración demuestran que el retiro no cambia interfaces ni efectos  |
| conciliación de residuales                                           | `ESPECIFICADO`; ejecución real pendiente           | `INT-SALES-008`                                          | cero residual crítico dependiente del runtime o ruta alternativa autorizada      |
| retiro físico del adaptador                                          | `BLOQUEADO`                                        | `INT-SALES-011`                                          | todas las puertas acumulativas del apartado 10 quedan demostradas                |

No se declara retirado ningún objeto físico por aprobación de esta definición.

---

#### 33. Handoffs y fronteras exactas

| Materia                          | Propietaria                       | Resultado exigido antes del cierre                                                                   |
| -------------------------------- | --------------------------------- | ---------------------------------------------------------------------------------------------------- |
| autoridad temporal de fuente     | `INT-SALES-009`                   | todo alcance retirado pertenece inequívocamente al intervalo PULSO para nuevas ventas                |
| doble fuente                     | `INT-SALES-010`                   | ninguna nueva afirmación Makos puede crear segunda venta o segunda emisión                           |
| conciliación y residuales        | `INT-SALES-008`                   | diferencias críticas y residuales quedan cerrados o desacoplados del runtime                         |
| credencial/binding               | `INT-POS-024`                     | acceso aplicable resuelto sin fingir revocación inexistente                                          |
| lifecycle transversal del retiro | `INT-EXT-019`                     | puertas de binding, trabajo en curso, credenciales, referencias e historia satisfechas               |
| credencial compartida            | `INT-EXT-020`                     | no existe revocación ciega de material usado por otro binding legítimo                               |
| NEXO                             | `INT-SALES-003`                   | efecto físico conserva el mismo contrato interno                                                     |
| NUMERA                           | `INT-SALES-004`                   | efecto económico conserva el mismo contrato interno                                                  |
| PASS                             | `INT-SALES-005` y `INT-SALES-006` | fidelización conserva acumulación/redención bajo sus contratos propios                               |
| retiro físico posterior          | `INT-SALES-011`                   | implementación autorizada materializa este contrato y demuestra sus puertas sin cambiar consumidoras |

Ninguna frontera anterior autoriza adelantar una mutación física desde esta fase documental.

---

#### 34. Prohibiciones explícitas

Queda prohibido:

1. retirar el adaptador mientras Makos conserve autoridad legítima para nuevas ventas del alcance;
2. retirar el adaptador mientras exista un residual crítico que requiera su runtime sin ruta alternativa autorizada;
3. considerar revocación de credencial como sinónimo de retiro de adaptador;
4. considerar eliminación de una variable o pantalla como retiro completo;
5. borrar ventas Makos históricas;
6. reclasificar ventas Makos como PULSO nativas;
7. cambiar `event_id` histórico por haber retirado el runtime;
8. crear un nuevo tipo de evento para ventas PULSO posteriores;
9. modificar la audiencia de consumidoras por el retiro;
10. exigir a NEXO, NUMERA o PASS leer directamente artefactos Makos;
11. cambiar las claves idempotentes de efectos consumidores por el retiro;
12. reemitir ventas históricas para “migrarlas”;
13. reaplicar inventario, puntos o efectos económicos ya confirmados;
14. borrar mappings o evidencia necesarios para explicar historia;
15. resolver cuarentenas borrando su fuente técnica;
16. resolver un resultado desconocido asumiendo que no ocurrió;
17. cerrar una conciliación por igualdad agregada sin identidad suficiente;
18. usar Makos como fallback silencioso después del retiro;
19. reutilizar una credencial revocada;
20. inventar endpoints, API, webhook, scopes o credenciales Makos no acreditados;
21. retirar pagos, fiscalidad, contabilidad u otras superficies por inferencia;
22. borrar migraciones históricas para ocultar el flujo legacy;
23. modificar directamente datos de NEXO, NUMERA o PASS para facilitar el retiro;
24. modificar código, SQL, migraciones, Supabase, datos, credenciales, endpoints, cuentas o configuración remota durante esta tarea;
25. declarar una validación operativa o física que no haya sido ejecutada;
26. iniciar o desarrollar `INT-MKT-001` desde esta tarea.

---

#### 35. Decisiones congeladas

1. PULSO permanece como propietaria del hecho comercial interno.
2. Makos permanece como procedencia histórica de sus ventas pre-corte.
3. El adaptador es una frontera externa, no una consumidora interna.
4. NEXO, NUMERA y PASS continúan consumiendo contratos internos, no el transporte Makos.
5. El retiro no cambia esquemas o tipos de evento por conveniencia técnica.
6. La eliminación del runtime externo solo es válida después de cerrar sus dependencias reales.
7. El corte de nuevas ventas precede al retiro terminal.
8. El control de doble fuente permanece necesario mientras exista cualquier camino que pueda volver a presentar una afirmación Makos.
9. La conciliación precede al cierre de residuales críticos.
10. Un resultado desconocido nunca se transforma en “no ocurrió” por retirar el proveedor.
11. Historial, auditoría y evidencia sobreviven al retiro.
12. Replay/backfill preservan fuente, identidad y audiencia históricas.
13. Compensaciones posteriores continúan en las propietarias de los efectos.
14. El retiro no transfiere pagos, caja, fiscalidad o contabilidad.
15. El retiro del adaptador y el retiro de credenciales son lifecycles coordinados pero no equivalentes.
16. El flujo `makos_excel` observado es legacy y no define el contrato permanente de consumidoras.
17. La existencia del RPC legacy de inventario no redefine la autoridad canónica de NEXO.
18. La implementación física futura deberá inventariar dependencias reales antes de eliminar o deshabilitar objetos.
19. Toda modificación Supabase futura de este retiro se origina y versiona desde `vento-shell`.
20. La aprobación documental no ejecuta el retiro físico.
21. La siguiente tarea canónica permanece `INT-MKT-001` y no forma parte de este entregable.

---

#### 36. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el retiro seguro del POS externo, la convergencia de Makos y PULSO en el mismo contrato canónico, la fuente empresarial única, la prohibición de doble emisión, la preservación de historia y auditoría, la idempotencia de efectos, el replay/backfill histórico, la conciliación de pendientes y el lifecycle de integraciones externas ya están protegidos por el registro canónico vigente. Esta tarea especializa esas obligaciones para el cierre permanente del adaptador de ventas sin introducir una conducta ejecutable nueva, una excepción, un permiso, un endpoint, un esquema, una credencial o un efecto empresarial adicional.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

---

#### 37. Cobertura de prueba existente preservada

Se preservan sin modificación, en especial:

- `TREQ-INTEGRATION-003`, para identidad estable, resultado recuperable, retry, incertidumbre y conciliación;
- `TREQ-INTEGRATION-006`, para fuente empresarial única, fuentes competidoras y preservación de historia;
- `TREQ-INTEGRATION-011`, para efecto físico correlacionado e idempotente hacia NEXO;
- `TREQ-INTEGRATION-014`, que cubre expresamente `INT-SALES-001` a `INT-SALES-011`, la transición POS externo → PULSO, el corte, la doble emisión, los efectos internos y el riesgo de retiro inseguro del POS externo;
- `TREQ-INTEGRATION-015`, para fidelización y compensaciones correlacionadas;
- `TREQ-INTEGRATION-017`, para recepción económica versionada, correlacionada e idempotente en NUMERA;
- `TREQ-INTEGRATION-098`, para audiencia histórica en replay;
- `TREQ-INTEGRATION-103`, para separación entre venta, fidelización, mercadeo y economía;
- `TREQ-INTEGRATION-155`, para replay y backfill sin fan-out ni reactivación indebida de efectos sensibles;
- `TREQ-INTEGRATION-191`, para resolver resultados externos desconocidos antes de compensar;
- `TREQ-INTEGRATION-213`, para trazabilidad de adaptadores externos;
- `TREQ-INTEGRATION-215`, para auditoría de replay y backfill;
- `TREQ-INTEGRATION-217`, para historia append-only durante rollback, retiro o migración;
- la cobertura vigente de PULSO, NEXO, NUMERA y PASS asociada a venta, efecto físico, hecho económico, fidelización, idempotencia y compensación.

Ninguna fila cambia de identidad, texto, estado, relación, secuencia, propietaria ni evidencia por esta tarea. El registro canónico permanece sin cambios.

---

#### 38. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. mantiene `INT-SALES-010` como tarea anterior;
2. mantiene `INT-MKT-001` como única tarea siguiente;
3. define el retiro como eliminación controlada del camino técnico externo y no como borrado de historia;
4. separa lifecycle del POS, adaptador, credencial, venta, evento, efecto y evidencia;
5. preserva PULSO como propietaria de la venta canónica;
6. preserva Makos como procedencia histórica de sus ventas;
7. mantiene un único contrato interno de venta/evento antes y después del retiro;
8. mantiene NEXO, NUMERA y PASS sin cambios de interfaz por el retiro;
9. prohíbe dependencias directas de consumidoras sobre archivos, staging o credenciales Makos;
10. define la independencia real que debe demostrarse antes del cierre terminal;
11. define cuándo un retiro puede ser parcial y cuándo puede ser terminal;
12. exige cero autoridad Makos para nuevas ventas del alcance retirado;
13. exige el control de doble fuente antes del cierre;
14. define puertas acumulativas de retiro terminal;
15. clasifica trabajo en curso antes del cierre;
16. preserva resultados confirmados sin repetirlos;
17. impide cerrar resultados desconocidos por inferencia;
18. preserva cuarentenas y conflictos hasta resolución;
19. define tratamiento de llegadas tardías;
20. impide inventar ventanas de eventos tardíos;
21. preserva replay y backfill históricos sin reactivar fuente;
22. preserva mappings y procedencia necesarios para reproducibilidad;
23. preserva el contrato físico NEXO;
24. preserva el contrato económico NUMERA;
25. preserva el contrato de fidelización PASS;
26. separa pagos, caja, fiscalidad y otras superficies;
27. coordina binding y credenciales con `INT-POS-024`;
28. impide revocación ciega de material compartido;
29. materializa el diagnóstico del flujo legacy `makos_excel` sin elevarlo a contrato canónico;
30. identifica las familias de objetos que una implementación futura deberá inventariar antes de retirar físicamente;
31. separa runtime activo de historia preservada;
32. exige conciliación previa al retiro terminal;
33. define residuales válidos y no válidos;
34. asigna todo residual a responsable y condición objetiva de salida;
35. define tratamiento de `RESULT_UNKNOWN`;
36. mantiene compensaciones en sus dominios propietarios;
37. prohíbe fallback automático a Makos después del retiro;
38. distingue rollback técnico de nueva habilitación empresarial;
39. define evidencia mínima de retiro terminal;
40. materializa el estado actual por materia y sus condiciones de salida;
41. asigna handoffs exactos a `INT-SALES-008`, `INT-SALES-009`, `INT-SALES-010`, `INT-POS-024`, `INT-EXT-019`, `INT-EXT-020`, `INT-SALES-003`, `INT-SALES-004`, `INT-SALES-005` y `INT-SALES-006`;
42. genera cero requisitos nuevos de prueba;
43. modifica cero requisitos de prueba;
44. no genera una copia del registro canónico de requisitos;
45. no modifica código, SQL, migraciones, Supabase, datos, credenciales, endpoints, cuentas ni configuración remota;
46. no declara retirado el adaptador en el estado físico actual;
47. no cambia `active-sequence.json`;
48. no inicia ni desarrolla `INT-MKT-001`.

---

#### 39. Estado de cierre de la tarea documental

Resultado documental:

```text
CONTRATO DE RETIRO PERMANENTE DEL ADAPTADOR = ESPECIFICADO
CAMBIOS EN CONSUMIDORAS INTERNAS = 0
CAMBIOS TREQ = 0
CAMBIOS FÍSICOS = 0
RETIRO OPERATIVO REAL = BLOQUEADO
```

Bloqueos operativos concretos:

1. el corte real Makos → PULSO no está acreditado como ejecutado para un alcance operativo completo por esta fase;
2. el binding API/webhook Makos y una credencial técnica instanciable siguen sin evidencia suficiente;
3. el flujo legacy `makos_excel` continúa observable en el código y esquema vigentes;
4. la independencia física end-to-end de consumidoras y la conciliación terminal deben demostrarse durante la implementación autorizada;
5. ninguna de esas brechas autoriza a debilitar el contrato de retiro ni a fingir una eliminación ya ejecutada.

Condición de salida operativa del retiro:

```text
AUTORIDAD PULSO EFECTIVA
+
DOBLE FUENTE BLOQUEADA
+
CONSUMIDORAS INDEPENDIENTES
+
CERO TRABAJO CRÍTICO SIN CLASIFICAR
+
CERO RESULTADO DESCONOCIDO SIN PROPIETARIO
+
CERO RESIDUAL DEPENDIENTE DEL RUNTIME
+
BINDING Y CREDENCIALES RESUELTOS
+
HISTORIA PRESERVADA
+
CONCILIACIÓN CERRADA
+
COMPATIBILIDAD INTERNA DEMOSTRADA
=
ADAPTADOR ELEGIBLE PARA RETIRO TERMINAL
```

---

#### 40. Continuidad

ÚLTIMA TAREA APROBADA

`INT-SALES-010 — Definir control que impida que ambas fuentes emitan la misma venta`

TAREA ACTUAL APROBADA

`INT-SALES-011 — Definir retiro del adaptador externo sin modificar consumidores internos`

SIGUIENTE TAREA RESERVADA

`INT-MKT-001 — Definir campañas solo después de aprobar AURA`


AURA ↔ PASS / PULSO
