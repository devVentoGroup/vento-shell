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


### [ ] INT-SALES-002 — Definir emisión en PULSO del mismo contrato canónico utilizado durante la transición
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
