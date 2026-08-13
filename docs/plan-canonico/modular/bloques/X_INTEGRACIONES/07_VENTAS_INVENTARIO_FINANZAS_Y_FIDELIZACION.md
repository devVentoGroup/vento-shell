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


### [ ] INT-SALES-006 — Definir procesamiento de redención en PASS
### [ ] INT-SALES-007 — Definir control contra efectos duplicados por reintento
### [ ] INT-SALES-008 — Definir conciliación de convivencia entre POS externo y PULSO
### [ ] INT-SALES-009 — Definir corte por sede, terminal y fecha efectiva
### [ ] INT-SALES-010 — Definir control que impida que ambas fuentes emitan la misma venta
### [ ] INT-SALES-011 — Definir retiro del adaptador externo sin modificar consumidores internos

AURA ↔ PASS / PULSO
