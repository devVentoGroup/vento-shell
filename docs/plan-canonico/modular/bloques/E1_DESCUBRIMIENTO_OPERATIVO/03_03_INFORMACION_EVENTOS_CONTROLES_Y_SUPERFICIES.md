### MINI-BLOQUE — INFORMACION EVENTOS CONTROLES Y SUPERFICIES

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **informacion eventos controles y superficies** dentro de **E1 DESCUBRIMIENTO OPERATIVO**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `CAP-MAP-007` a `CAP-MAP-011` — 5 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `CAP-MAP-007`: Identificar información de entrada y resultado producido
- `CAP-MAP-008`: Identificar fuente de verdad actual y fuente de verdad objetivo
- `CAP-MAP-009`: Identificar eventos e integraciones requeridos
- `CAP-MAP-010`: Identificar permisos y controles de autorización requeridos
- `CAP-MAP-011`: Identificar pantallas, dispositivos, documentos y evidencia requeridos
<!-- PLAN-SECTION-META:END -->

### ✅ CAP-MAP-007 — Identificar información de entrada y resultado producido

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Tipo:** definición documental de información
**Dependencia anterior:** `CAP-MAP-006`
**Continuidad reservada:** `CAP-MAP-008`

---

#### 1. Resultado de esta tarea

Esta tarea define, para las **217 subcapacidades**:

- qué hecho o necesidad permite comenzar;
- qué información mínima debe conocerse;
- qué regla o referencia se consulta;
- qué resultado informativo debe quedar al terminar;
- qué estado debe mostrar ese resultado;
- qué debe quedar registrado cuando el trabajo no termina normalmente.

La cobertura se construye mediante:

```text
información base de la familia
+ excepción de la subcapacidad
= entrada y resultado de la subcapacidad
```

Esto evita repetir 217 veces la misma información sin dejar subcapacidades sin definición.

Esta tarea **no decide todavía**:

- dónde se guarda la información: `CAP-MAP-008`;
- cómo se comunica entre aplicaciones o áreas: `CAP-MAP-009`;
- quién puede verla, cambiarla o aprobarla: `CAP-MAP-010`;
- qué pantalla, aparato, formato o documento la presenta: `CAP-MAP-011`.

---

#### 2. Diferencias que deben conservarse

| Concepto               | Pregunta que responde                           | Ejemplo                                     |
| ---------------------- | ----------------------------------------------- | ------------------------------------------- |
| Hecho que inicia       | ¿Qué ocurrió para que el trabajo deba comenzar? | llegó mercancía                             |
| Información de entrada | ¿Qué se necesita saber para actuar?             | proveedor, productos y cantidades esperadas |
| Objeto físico          | ¿Qué cosa se recibe, mueve o transforma?        | cajas de producto                           |
| Regla o referencia     | ¿Contra qué se revisa o calcula?                | orden de compra aprobada                    |
| Resultado empresarial  | ¿Para qué le sirve esto al negocio?             | inventario confiable                        |
| Resultado informativo  | ¿Qué dato, registro o estado queda producido?   | recepción aceptada con cantidades recibidas |
| Evidencia              | ¿Qué permite comprobar que ocurrió?             | firma, foto, factura o marcación            |

El **resultado empresarial** ya definido en `CAP-MAP-002` no se reemplaza.
`CAP-MAP-007` identifica el resultado informativo concreto que permite observarlo, controlarlo o continuarlo.

---

#### 3. Reglas obligatorias

1. Una persona, producto, dinero, equipo o mercancía no se tratará como información.
2. Cuando exista un objeto físico, se describirá por separado su información identificadora.
3. Una entrada deberá ser necesaria para comenzar, decidir, ejecutar o comprobar.
4. Un resultado deberá poder ser entendido por la siguiente persona o capacidad que lo use.
5. “Proceso realizado” no será un resultado suficiente.
6. No se exigirá información que no sea necesaria para la operación o el control.
7. No se copiarán contraseñas, secretos, números completos de identificación, datos bancarios ni datos personales innecesarios.
8. Cuando la práctica actual no produzca un registro, se declarará `NO EXISTE`; no se inventará uno.
9. Cuando el resultado pueda quedar incompleto, rechazado, cancelado o corregido, esa condición deberá conservarse.
10. Una corrección no borrará la existencia del resultado anterior; deberá poder distinguirse el valor corregido.
11. La información base se hereda desde la familia, salvo excepción expresa.
12. La fuente actual y la fuente objetivo se definirán únicamente en `CAP-MAP-008`.

---

#### 4. Estados mínimos del resultado

| Estado      | Significado sencillo                                 |
| ----------- | ---------------------------------------------------- |
| `PENDIENTE` | todavía falta trabajo o una decisión                 |
| `COMPLETO`  | produjo el resultado esperado                        |
| `PARCIAL`   | produjo solo una parte y falta identificar cuál      |
| `RECHAZADO` | se decidió no aceptar o no continuar                 |
| `CANCELADO` | se detuvo después de haber comenzado                 |
| `CORREGIDO` | reemplaza un dato anterior conservando la corrección |
| `NO_APLICA` | se confirmó que el resultado no corresponde al caso  |

Cada subcapacidad usará solo los estados que realmente necesite.

---

#### 5. Registro mínimo por subcapacidad

| Campo                     | Contenido                                                              |
| ------------------------- | ---------------------------------------------------------------------- |
| Código                    | código de la subcapacidad                                              |
| Hecho que inicia          | situación observable que activa el trabajo                             |
| Entradas obligatorias     | información sin la cual no puede comenzar correctamente                |
| Entradas opcionales       | información útil que puede no existir                                  |
| Regla o referencia        | política, cálculo, pedido, programación o documento usado para decidir |
| Objeto físico relacionado | producto, dinero, equipo o documento físico, cuando aplique            |
| Resultado producido       | dato, registro, decisión, estado o aviso que queda                     |
| Estado del resultado      | estado normal y estados alternos aplicables                            |
| Resultado ante excepción  | qué queda si se rechaza, cancela, corrige o termina parcialmente       |
| Evidencia disponible      | comprobación observada, sin decidir aún su diseño futuro               |
| Duda pendiente            | código del registro vivo, si falta confirmación                        |

---

#### 6. Mapa base por familia

| Familia                           | Hecho o información principal de entrada                              | Resultado informativo base                                                                                         |
| --------------------------------- | --------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| `CAP-01` Dirección y gobierno     | situación actual, riesgo, obligación, propuesta o resultado anterior  | objetivo, decisión, política, riesgo aceptado, responsable o acción                                                |
| `CAP-02` Personas y trabajo       | necesidad de personal, trabajador, disponibilidad, turno o novedad    | candidato, vinculación, asignación, horario, asistencia, novedad, pago o retiro                                    |
| `CAP-03` Seguridad y salud        | obligación, peligro, incidente, inspección o condición insegura       | riesgo, control, incidente registrado, acción correctiva o comprobación                                            |
| `CAP-04` Productos y oferta       | necesidad del cliente, producto, componente, receta o presentación    | producto, clasificación, receta, rendimiento, menú, especificación o versión                                       |
| `CAP-05` Compras y proveedores    | necesidad, existencias, proveedor, oferta o solicitud aprobada        | solicitud, comparación, aprobación, orden, recepción, diferencia, devolución o evaluación                          |
| `CAP-06` Inventario y movimientos | producto, ubicación, cantidad, lote, necesidad o movimiento           | entrada, ubicación, reserva, consumo, traslado, remisión, conteo, ajuste, merma o condición                        |
| `CAP-07` Activos                  | activo, identificación, ubicación, custodia, estado o necesidad       | activo registrado, custodia, préstamo, conteo, condición, mantenimiento, reparación o baja                         |
| `CAP-08` Producción               | demanda, receta, disponibilidad, capacidad u orden                    | plan, orden, lote, cantidad producida, consumo, rendimiento, control, liberación o cierre                          |
| `CAP-09` Venta y servicio         | oferta, solicitud del cliente, disponibilidad, mesa, pedido o pago    | pedido, cambio, estado de preparación, venta, pago, factura, atención o cierre                                     |
| `CAP-10` Clientes                 | cliente, solicitud, autorización, pedido anterior o caso              | perfil, preferencia, caso, solución, devolución, satisfacción, reserva o aviso                                     |
| `CAP-11` Despacho y entrega       | origen, destino, carga, pedido, vehículo o necesidad                  | ruta, asignación, carga, custodia, novedad, entrega, retorno o cierre                                              |
| `CAP-12` Finanzas                 | hecho económico, soporte, periodo, cuenta o saldo anterior            | registro contable, caja, banco, cuenta por cobrar o pagar, conciliación, costo, presupuesto, impuesto o informe    |
| `CAP-13` Instalaciones            | espacio, activo, problema, solicitud, frecuencia o condición          | inventario, solicitud de trabajo, limpieza, control, inspección, calibración, acceso o cierre                      |
| `CAP-14` Mercadeo                 | objetivo, público, oferta, presupuesto, contenido o respuesta         | mensaje, publicación, campaña, cupón, contacto comercial, evento, resultado o reputación                           |
| `CAP-15` Tecnología               | usuario, dispositivo, aplicación, falla, solicitud o cambio           | cuenta, configuración, conexión, caso de soporte, incidente, cambio, prueba, licencia o constancia de capacitación |
| `CAP-16` Información y documentos | información, documento, política, solicitud o periodo de conservación | clasificación, documento, versión, acceso, registro de actividad, archivo, firma o investigación                   |
| `CAP-17` Datos y análisis         | definición, datos disponibles, periodo, comparación o problema        | indicador, datos validados, informe, análisis, causa, acción o resultado medido                                    |
| `CAP-18` Continuidad              | dependencia, incidente, estado actual, impacto o recurso disponible   | incidente, impacto, alternativa, operación mínima, recuperación, trabajo manual, conciliación, lección o aviso     |

---

#### 7. Excepciones específicas: personas, seguridad y productos

| Caso                      | Entrada adicional indispensable                               | Resultado específico                               |
| ------------------------- | ------------------------------------------------------------- | -------------------------------------------------- |
| Vinculación o retiro      | identidad mínima, relación, fecha y decisión autorizada       | estado de vinculación o retiro y fecha efectiva    |
| Horario y asignación      | trabajador, lugar, función, fecha y disponibilidad            | turno publicado o cambio identificado              |
| Asistencia                | trabajador, lugar, fecha y hora observada                     | entrada, salida, ausencia o novedad                |
| Pago laboral              | periodo, conceptos, novedades y base aprobada                 | valor calculado, descuentos, pago y estado         |
| Incidente de seguridad    | lugar, momento, personas afectadas y descripción observable   | incidente clasificado, atención y acción pendiente |
| Inspección de seguridad   | lugar, elemento revisado y criterio                           | hallazgo, cumplimiento y acción correctiva         |
| Receta o fórmula          | producto final, componentes, cantidades, unidad y rendimiento | versión de receta y rendimiento esperado           |
| Cambio de producto o menú | producto, motivo, vigencia y lugares afectados                | nueva versión, fecha de inicio y versión anterior  |

---

#### 8. Excepciones específicas: compras, inventario y activos

| Caso                       | Entrada adicional indispensable                            | Resultado específico                                     |
| -------------------------- | ---------------------------------------------------------- | -------------------------------------------------------- |
| Solicitud de compra        | producto o servicio, cantidad, necesidad y fecha requerida | solicitud con estado                                     |
| Comparación de proveedores | ofertas comparables, condiciones y criterio                | comparación y alternativa elegida o rechazada            |
| Recepción de proveedor     | orden esperada, proveedor y cantidades entregadas          | cantidades aceptadas, diferencias y rechazo              |
| Remisión entre lugares     | origen, destino, productos y cantidades                    | remisión enviada, recibida, parcial o rechazada          |
| Conteo de inventario       | lugar, momento, producto y cantidad contada                | diferencia frente al saldo esperado                      |
| Ajuste de inventario       | diferencia, causa conocida y autorización aplicable        | cantidad ajustada, motivo y referencia al valor anterior |
| Merma                      | producto, cantidad, motivo, lugar y momento                | merma registrada y afectación de existencias             |
| Custodia de activo         | activo, custodio, lugar, fecha y condición                 | custodia vigente y estado de entrega                     |
| Mantenimiento o baja       | activo, falla, diagnóstico o condición                     | trabajo realizado, condición final o baja                |

---

#### 9. Excepciones específicas: producción, venta, clientes y entrega

| Caso                                   | Entrada adicional indispensable                                         | Resultado específico                                           |
| -------------------------------------- | ----------------------------------------------------------------------- | -------------------------------------------------------------- |
| Plan de producción                     | demanda esperada, existencias, receta y capacidad                       | cantidades y fechas por producir                               |
| Ejecución de lote                      | orden, receta vigente, insumos y cantidades usadas                      | lote, cantidad producida, consumo y rendimiento                |
| Liberación de producto                 | lote, controles y resultado de calidad                                  | liberado, retenido o rechazado                                 |
| Pedido presencial                      | lugar, productos, cantidades, cambios y mesa o cliente cuando aplique   | pedido aceptado y estado de preparación                        |
| Pedido de Rappi, ManyChat u otro medio | solicitud recibida, productos, cantidades, cobro y lugar de preparación | pedido trasladado a operación con referencia al origen         |
| Venta y pago                           | pedido cerrado, valores, descuentos, propina y medios de pago           | venta, pagos aplicados, saldo y comprobante                    |
| Anulación                              | venta o pedido, motivo y autorización aplicable                         | anulación, valores afectados y referencia al registro anterior |
| Devolución o compensación              | pedido o venta, producto, motivo y solución acordada                    | devolución, reposición, descuento u otra solución              |
| Reserva                                | cliente, lugar, fecha, hora, cantidad de personas y condiciones         | reserva confirmada, modificada, rechazada o cancelada          |
| Despacho Vaila Vainilla                | pedido, cliente, destino, contenido y mensajería                        | paquete entregado a mensajería y estado del envío              |
| Entrega al cliente                     | pedido, destino, responsable y novedad                                  | entrega confirmada, fallida, parcial o devuelta                |

---

#### 10. Excepciones específicas: finanzas, instalaciones y mercadeo

| Caso                         | Entrada adicional indispensable                               | Resultado específico                                     |
| ---------------------------- | ------------------------------------------------------------- | -------------------------------------------------------- |
| Cierre de caja               | ventas, medios de pago, efectivo contado, novedades y periodo | diferencia, cierre y entrega de valores                  |
| Distribución de propinas     | propina recibida, periodo, reglas y personas aplicables       | valores distribuidos y saldo pendiente                   |
| Cuenta por cobrar o pagar    | tercero, concepto, valor, vencimiento y soporte               | saldo, vencimiento y estado de pago                      |
| Conciliación bancaria        | movimientos bancarios, registros internos y periodo           | coincidencias, diferencias y partidas pendientes         |
| Costo o rentabilidad         | cantidades, valores, periodo y regla de cálculo               | costo, margen o resultado con su periodo                 |
| Mantenimiento de instalación | lugar, problema, prioridad y recurso                          | trabajo cerrado, pendiente o rechazado y condición final |
| Campaña o publicación        | objetivo, público, mensaje, medio, fechas y presupuesto       | publicación o campaña y resultado observado              |
| Cupón o promoción            | regla, vigencia, productos, lugares y límites                 | promoción activa, usada, vencida o cancelada             |

---

#### 11. Excepciones específicas: tecnología, información, análisis y continuidad

| Caso                     | Entrada adicional indispensable                            | Resultado específico                                              |
| ------------------------ | ---------------------------------------------------------- | ----------------------------------------------------------------- |
| Cuenta o acceso          | persona, función, aplicación y vigencia                    | acceso creado, cambiado, suspendido o retirado                    |
| Falla tecnológica        | aplicación o equipo, momento, lugar, síntoma e impacto     | caso recibido, diagnóstico, solución o pendiente                  |
| Cambio de sistema        | necesidad, alcance, riesgo y comprobación esperada         | cambio probado, aprobado, rechazado o revertido                   |
| Documento controlado     | tipo, contenido, responsable, versión y vigencia           | documento vigente, reemplazado, archivado o eliminado según regla |
| Solicitud de información | solicitante, propósito, alcance y autorización aplicable   | información entregada, negada o entregada parcialmente            |
| Indicador                | definición, periodo, datos y regla de cálculo              | valor, comparación y advertencia de calidad                       |
| Análisis                 | pregunta, periodo, datos, supuestos y límites              | hallazgo, incertidumbre y acción propuesta                        |
| Caída de una dependencia | servicio afectado, momento, impacto y recursos disponibles | operación mínima, alternativa usada y pendientes por conciliar    |
| Recuperación             | incidente, respaldo o registro manual y punto de retorno   | servicio recuperado, datos conciliados y pérdida conocida         |

---

#### 12. Tratamiento de resultados incompletos o corregidos

Para cada subcapacidad deberá poder contestarse:

1. ¿Qué parte sí quedó terminada?
2. ¿Qué parte falta?
3. ¿Por qué se rechazó o canceló?
4. ¿Qué dato anterior fue corregido?
5. ¿Qué trabajo posterior queda pendiente?

No se aceptarán resultados ambiguos como:

```text
listo
hecho
resuelto
procesado
```

sin el dato, decisión o estado que realmente quedó producido.

---

#### 13. Evidencia AS-IS ya aprovechada

Esta tarea parte de hechos ya documentados y no vuelve a preguntarlos:

- Makos participa en pedidos, ventas, comandas y caja presencial.
- Los pedidos de Rappi y ManyChat se trasladan manualmente a la operación observada.
- Shopify participa en la operación comercial observada de Vaila Vainilla.
- Las remisiones usan actualmente combinaciones de Excel, capturas y WhatsApp.
- Producción usa capturas, tablas, llamadas, fotos y mensajes según el caso.
- Existen facturas y recibos físicos dentro de la operación observada.
- ANIMA registra marcaciones y VISO participa en horarios e informes de asistencia.
- El pago laboral usa el sistema contable y el medio bancario ya auditado.
- Las fallas tecnológicas suelen informarse por WhatsApp o verbalmente y no existe un historial consolidado confirmado.
- No existe un historial consolidado confirmado de mantenimiento.

Estos hechos describen el estado actual; no se convierten automáticamente en diseño objetivo.

---

#### 14. Dudas nuevas registradas aparte

Las preguntas completas se incorporaron al archivo independiente:

`docs/plan-canonico/REGISTRO_VIVO_DE_PREGUNTAS_PENDIENTES.md`

| Códigos             | Tema                                                              |
| ------------------- | ----------------------------------------------------------------- |
| `DAT-20` y `DAT-21` | documento de despacho y confirmación de entrega de Vaila Vainilla |
| `DAT-22`            | registro de distribución de propinas                              |
| `DAT-23` a `DAT-25` | registro de anulación, devolución y compensación                  |
| `DAT-26` y `DAT-27` | registro de ajuste de inventario y merma                          |

Estas dudas:

- no bloquean la aprobación documental de `CAP-MAP-007`;
- tienen una sola respuesta esperada;
- pueden ser respondidas por quien observa o realiza el trabajo;
- no se duplican dentro de esta tarea.

---

#### 15. Autocuestionario para cualquier trabajador

Para describir una actividad sin conocimientos técnicos:

1. ¿Qué tuvo que pasar para que empezaras?
2. ¿Qué datos miraste antes de actuar?
3. ¿Qué cosa física recibiste, moviste o cambiaste?
4. ¿Contra qué pedido, lista, regla o instrucción revisaste?
5. ¿Qué dato, decisión o estado dejaste al terminar?
6. Si no pudiste terminar, ¿qué quedó anotado?

Cada respuesta deberá referirse a **un caso real reciente** y no a cómo debería funcionar en el futuro.

---

#### 16. Puerta de deduplicación

Antes de crear una nueva pregunta se deberá revisar, en este orden:

1. respuestas previas del usuario;
2. auditorías y documentación existente;
3. código, configuración y datos autorizados;
4. registro vivo de preguntas;
5. observación del trabajador que realiza la actividad.

Solo se incorporará una pregunta nueva cuando la respuesta no pueda obtenerse de esas fuentes.
Cada duda nueva se añadirá al registro vivo y la tarea canónica conservará únicamente su código.

Toda pregunta dirigida a un trabajador deberá:

- poder copiarse y enviarse por WhatsApp sin explicación adicional;
- describir una situación concreta que la persona pueda reconocer;
- decir exactamente qué debe escribir como respuesta;
- usar palabras cotidianas como “quién”, “dónde”, “qué nombre” o “a quién pides permiso”;
- evitar expresiones de diseño como “función que autoriza”, “actor”, “fuente de verdad” o “resultado informativo”.

---

#### 17. Lo que queda decidido

1. Las 217 subcapacidades heredan entrada y resultado desde su familia.
2. Los casos particulares reciben las excepciones definidas en esta tarea.
3. Se separan hecho iniciador, información, objeto físico, regla, resultado y evidencia.
4. Cada resultado puede expresar su condición normal o excepcional.
5. Un resultado corregido conserva referencia al estado anterior.
6. Una ausencia de registro se declara; no se completa por intuición.
7. Se recopila únicamente información necesaria.
8. Las dudas operativas viven en el registro independiente.
9. `CAP-MAP-007` no crea formularios, bases de datos, integraciones, permisos ni pantallas.
10. La fuente actual y la fuente objetivo quedan reservadas para `CAP-MAP-008`.

---

#### 18. Criterios de aceptación

`CAP-MAP-007` podrá aprobarse cuando:

- las 18 familias tengan entrada y resultado base;
- las 217 subcapacidades queden cubiertas por herencia más excepción;
- los casos con objetos físicos separen el objeto de su información;
- los resultados incompletos, rechazados, cancelados y corregidos no se oculten;
- ninguna fuente de verdad futura se decida anticipadamente;
- no se soliciten datos personales o secretos innecesarios;
- toda duda nueva esté deduplicada y registrada aparte;
- cada pregunta pendiente pueda responderse con observación y una única respuesta;
- `CAP-MAP-008` permanezca como única continuidad inmediata.

---

#### 19. Resultado y continuidad

Al aprobarse esta tarea quedará definido:

```text
qué necesita conocer cada subcapacidad
        ↓
qué resultado informativo deja
        ↓
qué ocurre si queda parcial, rechazada, cancelada o corregida
```

La continuidad será exclusivamente:

```text
CAP-MAP-008
— Identificar fuente de verdad actual y fuente de verdad objetivo
```

`CAP-MAP-008` determinará dónde se origina, conserva y corrige hoy cada información y cuál deberá ser su fuente futura, sin confundir copias operativas con el registro principal.


### ✅ CAP-MAP-008 — Identificar fuente de verdad actual y fuente de verdad objetivo

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Tipo:** definición documental de propiedad de información
**Dependencia anterior:** `CAP-MAP-007`
**Continuidad reservada:** `CAP-MAP-009`

---

#### 1. Resultado de esta tarea

Esta tarea define, para las **217 subcapacidades**:

- dónde se origina actualmente la información;
- dónde se conserva hoy el registro que se usa para operar;
- dónde se corrige cuando contiene un error;
- qué copias, mensajes, archivos o informes existen;
- qué aplicación deberá gobernar el registro principal en el modelo objetivo;
- qué sistemas podrán consultarlo sin crear otra versión independiente.

La cobertura se construye mediante:

```text
fuente base de la familia
+ excepción de la subcapacidad
= fuente actual y fuente objetivo de la subcapacidad
```

Esta tarea define propiedad informativa. No crea tablas, migraciones, integraciones, permisos ni pantallas.

---

#### 2. Definiciones en lenguaje directo

| Concepto                  | Significado                                                                                   |
| ------------------------- | --------------------------------------------------------------------------------------------- |
| Lugar donde nace          | primer lugar donde se registra un hecho real                                                  |
| Registro principal actual | registro que hoy se consulta o corrige para continuar el trabajo                              |
| Copia operativa           | Excel, PDF, captura, papel, mensaje o informe usado sin gobernar el hecho original            |
| Fuente externa            | sistema de un tercero que origina o certifica información, como banco, Makos, Rappi o Shopify |
| Fuente objetivo           | aplicación VENTO que deberá aceptar, conservar, corregir y explicar el registro principal     |
| Consumidora               | aplicación que consulta o utiliza información gobernada por otra                              |
| Dato derivado             | cálculo, indicador o resumen que puede reconstruirse desde hechos de origen                   |

Una fuente de verdad no es simplemente “donde aparece el dato”. Debe poder responder:

1. ¿Dónde se registró primero?
2. ¿Dónde se corrige?
3. ¿Cuál versión se considera válida?
4. ¿Qué ocurrió con la versión anterior?
5. ¿Quién necesita consultarla sin volverla a crear?

---

#### 3. Estados de la fuente actual

| Estado          | Significado                                                           |
| --------------- | --------------------------------------------------------------------- |
| `CONFIRMADA`    | código, datos, documentos o auditoría permiten identificarla          |
| `DISTRIBUIDA`   | la operación depende de varios registros sin uno principal confirmado |
| `MANUAL`        | papel, Excel, captura, llamada o chat sostiene el registro            |
| `EXTERNA`       | el registro principal pertenece a un proveedor o autoridad            |
| `NO_EXISTE`     | no se confirmó que el resultado quede registrado                      |
| `POR_CONFIRMAR` | existe una pregunta sencilla pendiente en el registro vivo            |

`POR_CONFIRMAR` no bloquea esta propuesta cuando la fuente objetivo puede definirse sin inventar la práctica actual.

---

#### 4. Estados de la fuente objetivo

| Estado                  | Significado                                                              |
| ----------------------- | ------------------------------------------------------------------------ |
| `OBJETIVO_FUERTE`       | la aplicación coincide claramente con el resultado que debe gobernar     |
| `OBJETIVO_CON_FRONTERA` | la aplicación gobierna una parte y debe respetar la propiedad de otra    |
| `OBJETIVO_DIVIDIDO`     | la subcapacidad contiene resultados con fuentes principales diferentes   |
| `OBJETIVO_DIFERIDO`     | la dirección está definida, pero no habilita implementación en esta fase |
| `SIN_FUENTE_ADECUADA`   | ninguna aplicación actual puede gobernar limpiamente el resultado        |

La aplicación objetivo expresa responsabilidad empresarial. La tabla, esquema, API o almacenamiento físico se diseñará en los bloques técnicos posteriores.

---

#### 5. Reglas obligatorias

1. Cada hecho empresarial tendrá una sola fuente principal objetivo.
2. Una copia no podrá corregirse independientemente del registro principal.
3. Supabase será infraestructura, no propietario empresarial de la información.
4. `vento-shell` será repositorio técnico canónico para migraciones, no fuente empresarial universal.
5. SHELL coordinará acceso y navegación; no absorberá los datos de todas las aplicaciones.
6. Un informe no reemplazará los hechos utilizados para calcularlo.
7. NUMERA consolidará y analizará; no recreará ventas, compras, inventario o producción.
8. Un sistema externo podrá seguir siendo fuente del hecho externo, pero VENTO conservará su referencia y estado interno cuando deba operar con él.
9. WhatsApp, Excel, PDF, capturas y papel podrán conservarse como evidencia o contingencia, no como fuente objetivo duplicada.
10. Toda corrección conservará el valor anterior, motivo, momento y responsable cuando el riesgo lo justifique.
11. Si actualmente no existe registro, se declarará `NO_EXISTE`.
12. AURA seguirá como `OBJETIVO_DIFERIDO`; esta tarea no supone que ya exista.
13. No se almacenarán secretos, credenciales ni datos personales innecesarios para justificar la fuente.
14. Las preguntas dirigidas a trabajadores usarán “dónde lo escribes o corriges”, nunca “fuente de verdad”.

---

#### 6. Registro mínimo por subcapacidad

| Campo                      | Contenido                                                        |
| -------------------------- | ---------------------------------------------------------------- |
| Código                     | código de la subcapacidad                                        |
| Información producida      | resultado definido en `CAP-MAP-007`                              |
| Lugar donde nace hoy       | aplicación, proveedor, archivo, papel, chat o `NO EXISTE`        |
| Registro principal actual  | lugar que hoy se considera válido                                |
| Lugar de corrección actual | dónde se modifica o quién genera una nueva versión               |
| Copias conocidas           | archivos, mensajes, informes, capturas o documentos              |
| Estado AS-IS               | estado de la fuente actual                                       |
| Fuente objetivo            | aplicación que deberá gobernar el resultado                      |
| Estado objetivo            | fuerza, frontera, división o diferimiento                        |
| Consumidoras               | aplicaciones o áreas que necesitarán consultarlo                 |
| Regla de transición        | qué copia deja de ser principal cuando exista la fuente objetivo |
| Duda pendiente             | código del registro vivo, cuando aplique                         |

---

#### 7. Mapa AS-IS por familia

| Familia                           | Fuentes actuales confirmadas o utilizadas                                                               | Estado AS-IS  |
| --------------------------------- | ------------------------------------------------------------------------------------------------------- | ------------- |
| `CAP-01` Dirección y gobierno     | documentos, archivos, mensajes y registros administrativos parciales                                    | `DISTRIBUIDA` |
| `CAP-02` Personas y trabajo       | VISO, ANIMA, sistema contable, medio bancario, documentos y archivos laborales                          | `DISTRIBUIDA` |
| `CAP-03` Seguridad y salud        | documentos, formatos, mensajes y registros administrativos sin cobertura integral confirmada            | `MANUAL`      |
| `CAP-04` Productos y oferta       | NEXO, FOGO, PULSO, Makos y archivos operativos según el resultado                                       | `DISTRIBUIDA` |
| `CAP-05` Compras y proveedores    | ORIGO, tablas de compras, Excel, documentos, WhatsApp y registros de recepción                          | `DISTRIBUIDA` |
| `CAP-06` Inventario y movimientos | NEXO y tablas de inventario, complementadas por Excel, capturas, papel y WhatsApp                       | `DISTRIBUIDA` |
| `CAP-07` Activos                  | NEXO para parte del inventario de activos; archivos y comunicación manual para custodia y mantenimiento | `DISTRIBUIDA` |
| `CAP-08` Producción               | FOGO y tablas productivas, complementadas por tablas, capturas, llamadas, fotos y mensajes              | `DISTRIBUIDA` |
| `CAP-09` Venta y servicio         | Makos, PULSO, esquemas `pos` y `payments`, pedidos internos y plataformas externas                      | `DISTRIBUIDA` |
| `CAP-10` Clientes                 | PULSO, PASS, pedidos, conversaciones y plataformas o chats externos                                     | `DISTRIBUIDA` |
| `CAP-11` Despacho y entrega       | NEXO, PULSO, Shopify, mensajería, remisiones, capturas y WhatsApp                                       | `DISTRIBUIDA` |
| `CAP-12` Finanzas                 | Makos, PULSO, pagos, bancos, sistema contable, documentos y NUMERA                                      | `DISTRIBUIDA` |
| `CAP-13` Instalaciones            | activos parciales en NEXO, comunicación verbal y WhatsApp; no existe historial consolidado confirmado   | `DISTRIBUIDA` |
| `CAP-14` Mercadeo                 | redes, plataformas externas, archivos y WhatsApp; AURA no existe todavía                                | `DISTRIBUIDA` |
| `CAP-15` Tecnología               | VISO, configuración de cada aplicación y Supabase para accesos; soporte por WhatsApp o verbal           | `DISTRIBUIDA` |
| `CAP-16` Información y documentos | aplicaciones de origen, documentos físicos, archivos, chats y carpetas                                  | `DISTRIBUIDA` |
| `CAP-17` Datos y análisis         | consultas e informes por aplicación y análisis inicial en NUMERA                                        | `DISTRIBUIDA` |
| `CAP-18` Continuidad              | estado de cada aplicación, WhatsApp, llamadas y trabajo manual sin registro transversal confirmado      | `DISTRIBUIDA` |

Este mapa describe la evidencia disponible. No afirma que toda función visible en código sea utilizada correctamente por la operación real.

---

#### 8. Mapa objetivo por familia

| Familia                           | Fuente principal objetivo                                                                     | Estado                  | Frontera obligatoria                                                                            |
| --------------------------------- | --------------------------------------------------------------------------------------------- | ----------------------- | ----------------------------------------------------------------------------------------------- |
| `CAP-01` Dirección y gobierno     | VISO para estructura, políticas, riesgos, decisiones y seguimiento administrativo             | `OBJETIVO_CON_FRONTERA` | la decisión continúa siendo humana y los documentos legales conservan su validez propia         |
| `CAP-02` Personas y trabajo       | VISO para administración laboral; ANIMA para registros personales y asistencia                | `OBJETIVO_DIVIDIDO`     | nómina, banco y documentos externos no se convierten automáticamente en datos propios de NUMERA |
| `CAP-03` Seguridad y salud        | VISO                                                                                          | `OBJETIVO_CON_FRONTERA` | autoridades, aseguradoras y proveedores conservan sus documentos oficiales                      |
| `CAP-04` Productos y oferta       | NEXO para catálogo; FOGO para recetas; PULSO para oferta vendible                             | `OBJETIVO_DIVIDIDO`     | cada aplicación gobierna un resultado distinto y comparte referencias, no copias maestras       |
| `CAP-05` Compras y proveedores    | ORIGO                                                                                         | `OBJETIVO_FUERTE`       | NEXO recibe únicamente el efecto de inventario de la recepción aceptada                         |
| `CAP-06` Inventario y movimientos | NEXO                                                                                          | `OBJETIVO_FUERTE`       | compras, producción y ventas originan hechos; NEXO gobierna su efecto en existencias            |
| `CAP-07` Activos                  | NEXO                                                                                          | `OBJETIVO_CON_FRONTERA` | la ejecución técnica externa se relaciona con el activo sin reemplazar su registro              |
| `CAP-08` Producción               | FOGO                                                                                          | `OBJETIVO_FUERTE`       | NEXO conserva movimientos de insumo y producto aceptados, no la orden productiva                |
| `CAP-09` Venta y servicio         | PULSO                                                                                         | `OBJETIVO_FUERTE`       | Makos y plataformas externas serán orígenes externos mientras sigan vigentes                    |
| `CAP-10` Clientes                 | PULSO para relación operativa; PASS para identidad y acciones directas del cliente            | `OBJETIVO_DIVIDIDO`     | no se copiará información personal innecesaria entre ambas aplicaciones                         |
| `CAP-11` Despacho y entrega       | NEXO para traslado interno; PULSO para entrega asociada a un pedido                           | `OBJETIVO_DIVIDIDO`     | la mensajería externa aporta eventos sin gobernar el pedido interno                             |
| `CAP-12` Finanzas                 | PULSO para caja y pago de venta; NUMERA para hechos económicos, costos y análisis             | `OBJETIVO_DIVIDIDO`     | bancos, sistema contable y autoridades conservan los registros externos que les correspondan    |
| `CAP-13` Instalaciones            | NEXO para espacio, activo, novedad y estado                                                   | `OBJETIVO_CON_FRONTERA` | el proveedor técnico puede ejecutar el trabajo, pero no gobernar el estado interno              |
| `CAP-14` Mercadeo                 | AURA para comunicación y campaña; PULSO para promociones aplicadas a ventas                   | `OBJETIVO_DIFERIDO`     | AURA es solo una idea y no se implementa por esta definición                                    |
| `CAP-15` Tecnología               | VISO para identidad y acceso; NEXO para activo; cada aplicación para su configuración         | `OBJETIVO_DIVIDIDO`     | el soporte transversal continúa `SIN_FUENTE_ADECUADA` hasta definir su propietaria              |
| `CAP-16` Información y documentos | aplicación propietaria del hecho respaldado                                                   | `OBJETIVO_DIVIDIDO`     | el archivo documental conserva versiones y evidencia sin apropiarse del hecho                   |
| `CAP-17` Datos y análisis         | aplicación de origen para hechos; NUMERA para indicadores, comparaciones y análisis derivados | `OBJETIVO_CON_FRONTERA` | NUMERA no permitirá corregir hechos gobernados por otra aplicación                              |
| `CAP-18` Continuidad              | aplicación afectada para el incidente local; registro transversal todavía sin fuente adecuada | `OBJETIVO_DIVIDIDO`     | SHELL coordina acceso y navegación, no se vuelve propietaria de todos los incidentes            |

---

#### 9. Registros maestros compartidos

| Información maestra                                | Fuente objetivo | Regla para las demás aplicaciones                                   |
| -------------------------------------------------- | --------------- | ------------------------------------------------------------------- |
| personas trabajadoras, roles, sedes y áreas        | VISO            | consumir identificadores y atributos autorizados                    |
| asistencia individual                              | ANIMA           | VISO consulta y administra excepciones según permisos posteriores   |
| identidad del cliente                              | PASS            | PULSO conserva solo lo necesario para operar la venta y la relación |
| producto y presentación                            | NEXO            | FOGO, ORIGO, PULSO y NUMERA consumen la misma identidad             |
| receta y versión productiva                        | FOGO            | NEXO y NUMERA consultan efectos o costos sin editar la receta       |
| proveedor y ciclo de compra                        | ORIGO           | NEXO y NUMERA consumen recepción y efecto económico                 |
| existencia y movimiento                            | NEXO            | otras aplicaciones originan solicitudes o consumen saldos           |
| orden, lote y resultado de producción              | FOGO            | NEXO recibe movimientos aceptados; NUMERA analiza                   |
| pedido, venta, caja y pago aplicado                | PULSO           | NUMERA recibe hechos económicos sin recrear la venta                |
| centro de costo, presupuesto e indicador económico | NUMERA          | aplicaciones operativas aportan hechos y consultan resultados       |

Los tipos TypeScript repetidos encontrados en NEXO, FOGO, ORIGO, PULSO y NUMERA no crean fuentes maestras distintas. `TEC-18` confirma que deberán derivarse de contratos comunes o generados durante la remodelación técnica.

---

#### 10. Excepciones que no pueden simplificarse

##### 10.1. Pago laboral

- El sistema contable donde se calcula y conserva el pago actual sigue `POR_CONFIRMAR` mediante `DAT-14` y `DAT-15`.
- VISO gobernará personas, periodos y novedades laborales.
- ANIMA aportará asistencia y novedades personales autorizadas.
- El proveedor contable o bancario podrá conservar el cálculo o comprobante externo.
- NUMERA podrá analizar el efecto económico, pero no se declara sistema de nómina.

##### 10.2. Venta presencial y plataformas externas

- Makos continúa como fuente externa de la venta presencial mientras la operación dependa de él.
- Rappi, ManyChat y Shopify podrán originar solicitudes o pedidos externos.
- PULSO deberá conservar la referencia externa y gobernar el estado interno del pedido, la venta y el cobro.
- Copiar un pedido manualmente no convierte a la copia en integración ni elimina el origen.

##### 10.3. Bancos, impuestos y documentos oficiales

- El banco es fuente del movimiento bancario.
- El sistema contable puede ser fuente del asiento o cálculo fiscal.
- La autoridad es fuente del documento o estado oficial que emite.
- NUMERA conservará la referencia, conciliación, clasificación y análisis internos que le correspondan.

##### 10.4. Traslado interno y entrega al cliente

- NEXO gobernará origen, destino interno, carga, remisión y recepción entre lugares.
- PULSO gobernará el resultado de entrega cuando cierre o afecta un pedido del cliente.
- La guía o comprobación del transportador será evidencia externa vinculada, no una segunda venta.

##### 10.5. Documentos y análisis

- El documento controlado seguirá a la aplicación que gobierna el hecho respaldado.
- NUMERA podrá producir indicadores y reportes, pero la corrección del hecho se realizará en su aplicación de origen.
- Un PDF o Excel exportado será una fotografía de un momento, no un registro corregible independiente.

---

#### 11. Regla de corrección y trazabilidad

Cuando un dato esté equivocado:

```text
la corrección ocurre en la fuente principal
        ↓
se conserva referencia al valor anterior
        ↓
las consumidoras reciben o consultan la versión vigente
        ↓
las copias antiguas quedan identificadas como desactualizadas
```

No se aceptará como solución:

- cambiar únicamente un Excel exportado;
- editar una captura o PDF;
- corregir el dato en dos aplicaciones por separado;
- borrar el registro anterior sin rastro;
- crear un registro nuevo sin relacionarlo con el equivocado.

Las reglas exactas de autorización corresponden a `CAP-MAP-010`.

---

#### 12. Tratamiento de copias y operación manual

| Medio actual                 | Uso permitido en el objetivo                   | Condición                                                        |
| ---------------------------- | ---------------------------------------------- | ---------------------------------------------------------------- |
| WhatsApp                     | aviso, coordinación o evidencia complementaria | el estado principal debe quedar en la aplicación propietaria     |
| Excel                        | carga controlada, análisis o contingencia      | debe indicar origen, fecha y versión; no se corrige aisladamente |
| PDF                          | comprobante o versión cerrada                  | debe poder relacionarse con el registro que lo produjo           |
| captura o foto               | evidencia observable                           | no reemplaza cantidades, estados o aprobaciones estructuradas    |
| papel                        | contingencia o requisito físico                | debe existir regla posterior de registro y conciliación          |
| llamada o instrucción verbal | coordinación inmediata                         | las decisiones relevantes deberán quedar registradas             |

Esta tarea no elimina ningún medio actual. Define cuál dejará de considerarse principal cuando exista una fuente objetivo operativa y validada.

---

#### 13. Dudas pendientes reutilizadas

No se crean preguntas nuevas. Las incertidumbres actuales ya están cubiertas en:

`docs/plan-canonico/REGISTRO_VIVO_DE_PREGUNTAS_PENDIENTES.md`

| Códigos             | Información que permiten confirmar                              |
| ------------------- | --------------------------------------------------------------- |
| `DAT-01` a `DAT-03` | disponibilidad y detalle histórico de ventas en Makos           |
| `DAT-04` y `DAT-05` | lugar real donde se consultan existencias                       |
| `DAT-06` y `DAT-07` | historial real de compras y recepciones                         |
| `DAT-08` a `DAT-13` | remisiones, conteos, producción y hojas manuales                |
| `DAT-14` y `DAT-15` | cálculo y conservación del pago laboral                         |
| `DAT-16` y `DAT-17` | inspecciones y acciones de seguridad                            |
| `DAT-18` y `DAT-19` | instrucciones de Gerencia y correcciones                        |
| `DAT-20` a `DAT-27` | entregas, propinas, anulaciones, devoluciones, ajustes y mermas |

Sus respuestas completarán el detalle AS-IS sin reabrir la decisión objetivo de esta tarea.

---

#### 14. Autocuestionario sencillo

Para identificar el registro principal de una actividad, la persona que la realiza responderá sobre un caso reciente:

1. ¿Dónde escribiste por primera vez lo que ocurrió?
2. Si quedó equivocado, ¿en qué lugar lo corregiste?
3. ¿Qué lugar miraste después para saber cuál era el dato correcto?
4. ¿Enviaste una copia por WhatsApp, Excel, papel, foto o PDF?
5. Si las copias muestran datos diferentes, ¿cuál usas para continuar trabajando?

La respuesta deberá incluir un solo nombre concreto por pregunta: aplicación, archivo, papel, chat, proveedor o `NO EXISTE`.

---

#### 15. Evidencia técnica incorporada

Esta propuesta aprovecha y no vuelve a auditar:

- esquema y migraciones canónicas de Supabase en `vento-shell`;
- tablas y funciones remotas autorizadas de `vento-os-dev`;
- repositorios NEXO, FOGO, ORIGO, PULSO, NUMERA, VISO, ANIMA y PASS;
- auditoría de Makos, Shopify, Rappi y ManyChat;
- `TEC-05` a `TEC-09`, que ubican ventas, inventario, compras, producción y finanzas;
- `TEC-14` a `TEC-16`, que identifican correcciones disponibles o ausentes;
- `TEC-17`, que identifica exportaciones utilizables para auditoría;
- `TEC-18`, que confirma contratos duplicados y deriva entre aplicaciones;
- `TEC-19`, que documenta y cierra la función temporal retirada.

La incorporación de `vento-numera` confirma que NUMERA consulta información central para análisis y también repite contratos de sedes, empleados, sesión y navegación.

---

#### 16. Lo que queda decidido

1. Las 217 subcapacidades quedan cubiertas por fuente familiar más excepción.
2. Se separan origen, registro principal, lugar de corrección, copia y consumidora.
3. Las aplicaciones objetivo siguen la propiedad candidata de `CAP-MAP-004`.
4. Las consumidoras de `CAP-MAP-005` no adquieren derecho a recrear el dato.
5. Los resultados de `CAP-MAP-007` tendrán una única fuente principal objetivo.
6. VISO gobernará maestros organizacionales y laborales administrativos.
7. ANIMA gobernará asistencia y registros personales definidos.
8. NEXO gobernará catálogo, existencias, movimientos, activos y traslado interno.
9. ORIGO gobernará proveedores y compras.
10. FOGO gobernará recetas, órdenes, lotes y resultados productivos.
11. PULSO gobernará pedidos, ventas, caja, pagos aplicados y entrega al cliente.
12. PASS gobernará identidad y acciones directas del cliente.
13. NUMERA gobernará centros de costo, hechos económicos internos y análisis derivados, sin reemplazar hechos operativos.
14. AURA continúa como fuente objetivo diferida y sin existencia actual.
15. Los documentos siguen al hecho que respaldan.
16. Los sistemas externos conservan la propiedad del hecho externo y VENTO conserva su referencia operativa.
17. WhatsApp, Excel, PDF, capturas y papel no serán fuentes objetivo paralelas.
18. La duplicación técnica confirmada no se corrige en esta fase documental.

---

#### 17. Lo que esta tarea no autoriza

- crear o modificar tablas;
- ejecutar migraciones;
- cambiar Supabase;
- desarrollar AURA;
- retirar Makos, Shopify, Rappi, ManyChat, bancos o el sistema contable;
- eliminar archivos, chats, papeles o evidencias actuales;
- crear integraciones;
- definir permisos;
- reemplazar contratos TypeScript;
- iniciar remodelación de código.

---

#### 18. Criterios de aceptación

`CAP-MAP-008` podrá aprobarse cuando:

- las 18 familias tengan fuente actual y objetivo documentados;
- las 217 subcapacidades queden cubiertas mediante herencia y excepciones;
- cada resultado tenga una sola fuente principal objetivo o una división explícita;
- las fuentes externas se distingan de los registros internos;
- NUMERA no reemplace los hechos operativos que analiza;
- AURA permanezca diferida;
- las copias manuales no se confundan con registros principales;
- las correcciones ocurran en la fuente propietaria y conserven trazabilidad;
- las dudas AS-IS reutilicen el registro vivo sin duplicarse;
- no se anticipen tablas, integraciones, permisos ni pantallas;
- `CAP-MAP-009` permanezca como única continuidad inmediata.

---

#### 19. Resultado y continuidad

Al aprobarse esta tarea quedará definida la cadena:

```text
dónde nace hoy la información
        ↓
qué registro se considera válido
        ↓
dónde se corrige
        ↓
qué aplicación deberá gobernarla
        ↓
qué aplicaciones solo podrán consumirla
```

La continuidad será exclusivamente:

```text
CAP-MAP-009
— Identificar eventos e integraciones requeridos
```

`CAP-MAP-009` definirá qué hechos deben comunicarse entre fuentes propietarias, qué aplicación los emite, cuál los recibe y cómo evitar copias manuales o integraciones ambiguas.

### ✅ CAP-MAP-009 — Identificar eventos e integraciones requeridos

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Tipo:** definición documental de comunicaciones empresariales
**Dependencia anterior:** `CAP-MAP-008`
**Continuidad reservada:** `CAP-MAP-010`

---

#### 1. Resultado de esta tarea

Esta tarea define, para las **217 subcapacidades**:

- qué hecho debe conocer otra aplicación o área;
- cuál fuente propietaria confirma que el hecho ocurrió;
- quién necesita recibirlo o consultarlo;
- qué información mínima debe acompañarlo;
- qué comunicación existe actualmente;
- qué comunicación objetivo será necesaria;
- qué debe quedar registrado cuando la entrega falla, se repite o llega tarde.

La cobertura se construye mediante:

```text
comunicación base de la familia
+ excepción de la subcapacidad
= evento o integración requerida
```

Esta tarea define contratos funcionales. No selecciona todavía API, webhook, cola, función, tabla, proveedor ni lenguaje de programación.

---

#### 2. Definiciones en lenguaje directo

| Concepto         | Significado                                                                         |
| ---------------- | ----------------------------------------------------------------------------------- |
| Evento           | hecho que ya ocurrió y no es una orden, por ejemplo “recepción aceptada”            |
| Solicitud        | petición para que otra capacidad evalúe o realice un trabajo                        |
| Consulta         | lectura de información sin crear otra copia principal                               |
| Integración      | mecanismo controlado para trasladar una solicitud, evento o consulta                |
| Emisora          | fuente propietaria que confirma el hecho                                            |
| Receptora        | aplicación que necesita actuar o actualizar una vista derivada                      |
| Referencia común | identificador que permite reconocer el mismo pedido, producto, persona o movimiento |
| Entrega manual   | traslado por persona mediante chat, papel, captura, llamada o archivo               |
| Confirmación     | constancia de que la receptora aceptó, rechazó o dejó pendiente la comunicación     |

Un evento se redactará en pasado:

```text
pedido aceptado
recepción confirmada
lote terminado
pago aplicado
entrega fallida
```

No se usarán nombres ambiguos como `actualizarTodo`, `sincronizarDatos` o `procesar`.

---

#### 3. Tipos funcionales de comunicación

| Tipo           | Cuándo se usa                                         | Ejemplo                        |
| -------------- | ----------------------------------------------------- | ------------------------------ |
| `EVENTO`       | otra aplicación debe reaccionar a un hecho confirmado | lote liberado                  |
| `SOLICITUD`    | todavía falta que otra capacidad acepte o ejecute     | solicitud de abastecimiento    |
| `CONSULTA`     | solo se necesita leer el estado vigente               | disponibilidad de producto     |
| `IMPORTACIÓN`  | la fuente entrega un archivo estructurado             | Excel de ventas Makos          |
| `EXPORTACIÓN`  | se genera una copia para auditoría o tercero          | PDF de orden                   |
| `NOTIFICACIÓN` | se informa a una persona sin cambiar la fuente        | turno publicado                |
| `CONFIRMACIÓN` | se devuelve aceptación, rechazo o resultado           | remisión recibida parcialmente |

Una notificación no sustituye el evento ni demuestra por sí sola que la receptora procesó la información.

---

#### 4. Estados de una comunicación

| Estado                 | Significado                                           |
| ---------------------- | ----------------------------------------------------- |
| `CREADA`               | la fuente registró el hecho o solicitud               |
| `PENDIENTE_DE_ENTREGA` | todavía no ha llegado al destino                      |
| `ENTREGADA`            | el destino la recibió                                 |
| `ACEPTADA`             | el destino pudo aplicarla o continuar                 |
| `RECHAZADA`            | el destino no la aceptó y dejó motivo                 |
| `DUPLICADA`            | ya había sido recibida y no debe aplicarse otra vez   |
| `FALLIDA`              | ocurrió un error de comunicación o procesamiento      |
| `POR_CONCILIAR`        | existe diferencia entre origen y destino              |
| `CANCELADA`            | la solicitud se retiró antes de producir el resultado |

El estado técnico exacto se diseñará después, pero la operación deberá poder distinguir estas condiciones.

---

#### 5. Reglas obligatorias

1. Solo la fuente propietaria definida en `CAP-MAP-008` podrá emitir la versión oficial de un hecho.
2. La receptora no cambiará el hecho original; generará su propio resultado relacionado.
3. Cada comunicación tendrá una referencia estable al registro de origen.
4. Recibir dos veces la misma comunicación no deberá duplicar ventas, pagos, movimientos, lotes o gastos.
5. Un fallo en la receptora no borrará ni alterará silenciosamente el registro de origen.
6. Toda entrega manual crítica deberá poder conciliarse después.
7. La comunicación enviará únicamente la información necesaria.
8. Los secretos, tokens y credenciales nunca formarán parte del contenido empresarial.
9. Los datos personales se limitarán según finalidad y aplicación receptora.
10. NUMERA consumirá hechos confirmados; no corregirá ventas, compras, inventario o producción mediante una integración inversa.
11. SHELL podrá coordinar acceso o navegación, pero no retransmitirá todos los datos empresariales por defecto.
12. AURA no tendrá integraciones ejecutables mientras siga siendo una idea.
13. Una integración externa se validará separadamente por proveedor y contrato.
14. Que dos aplicaciones consulten la misma base de datos no elimina la necesidad de definir propiedad y responsabilidades.
15. Reintentos, idempotencia física, colas y tiempos técnicos permanecen reservados para diseño de integración.

---

#### 6. Registro mínimo por comunicación

| Campo                | Contenido                                                                          |
| -------------------- | ---------------------------------------------------------------------------------- |
| Código               | identificador documental de la comunicación                                        |
| Hecho o solicitud    | nombre concreto en pasado o petición clara                                         |
| Tipo                 | evento, solicitud, consulta, importación, exportación, notificación o confirmación |
| Emisora              | fuente propietaria                                                                 |
| Receptora            | aplicación, sistema externo o función humana                                       |
| Referencia de origen | identificador del registro principal                                               |
| Momento              | cuándo ocurrió el hecho                                                            |
| Contexto             | sede, área, pedido, periodo u otro alcance necesario                               |
| Contenido mínimo     | datos indispensables para actuar                                                   |
| Resultado esperado   | qué debe producir la receptora                                                     |
| Confirmación         | aceptación, rechazo, duplicado, fallo o conciliación                               |
| Situación actual     | automática, manual, inexistente o por confirmar                                    |
| Duda pendiente       | código del registro vivo, si aplica                                                |

---

#### 7. Comunicaciones AS-IS confirmadas

| Comunicación actual                    | Forma observada                                                                | Clasificación                    |
| -------------------------------------- | ------------------------------------------------------------------------------ | -------------------------------- |
| ventas de Makos hacia PULSO            | carga manual de Excel y mapeo de productos                                     | `IMPORTACIÓN_MANUAL`             |
| pedidos de Rappi hacia la operación    | traslado manual observado                                                      | `ENTREGA_MANUAL`                 |
| pedidos de ManyChat hacia la operación | traslado manual observado                                                      | `ENTREGA_MANUAL`                 |
| pedidos de Shopify para Vaila Vainilla | plataforma externa y operación posterior sin integración automática comprobada | `EXTERNA_MANUAL_O_NO_CONFIRMADA` |
| solicitudes y remisiones               | Excel, capturas, WhatsApp, papel y funciones parciales de NEXO                 | `DISTRIBUIDA`                    |
| instrucciones de producción            | tablas, capturas, llamadas, fotos y mensajes                                   | `DISTRIBUIDA`                    |
| pago digital                           | intención, webhook, eventos y conciliación en el dominio de pagos              | `AUTOMÁTICA_CONFIRMADA`          |
| horarios y asistencia                  | VISO y ANIMA comparten registros laborales y de asistencia                     | `INTERNA_CONFIRMADA`             |
| consultas empresariales                | varias aplicaciones leen directamente tablas centrales                         | `CONSULTA_COMPARTIDA`            |
| soporte tecnológico                    | WhatsApp o comunicación verbal                                                 | `ENTREGA_MANUAL`                 |

No se encontró integración automática con Shopify, Rappi o ManyChat. La referencia visual “tipo Rappi” no es una conexión con Rappi.

---

#### 8. Catálogo objetivo de eventos internos

| Código         | Evento o solicitud                                     | Emisora                           | Receptora principal                                   | Resultado esperado                                       |
| -------------- | ------------------------------------------------------ | --------------------------------- | ----------------------------------------------------- | -------------------------------------------------------- |
| `EVT-ORG-001`  | sede, área o estructura organizacional cambiada        | VISO                              | aplicaciones autorizadas                              | contexto organizacional vigente                          |
| `EVT-IAM-001`  | acceso laboral creado, cambiado, suspendido o retirado | VISO                              | SHELL y aplicación afectada                           | acceso alineado con la decisión                          |
| `EVT-WRK-001`  | turno publicado o corregido                            | VISO                              | ANIMA y trabajador                                    | turno visible con versión vigente                        |
| `EVT-ATT-001`  | marcación registrada                                   | ANIMA                             | VISO                                                  | asistencia disponible para revisión                      |
| `EVT-ATT-002`  | novedad de asistencia identificada                     | ANIMA o VISO según origen         | VISO y responsable autorizado                         | novedad revisada sin cambiar la marcación original       |
| `EVT-CAT-001`  | producto o presentación publicada                      | NEXO                              | ORIGO, FOGO, PULSO y NUMERA                           | misma identidad de producto disponible                   |
| `EVT-REC-001`  | receta o versión productiva publicada                  | FOGO                              | NEXO y NUMERA                                         | receta referenciable para consumo y costo                |
| `EVT-PUR-001`  | solicitud de compra aprobada                           | ORIGO                             | responsable de compra                                 | orden o rechazo relacionado                              |
| `EVT-PUR-002`  | orden de compra emitida o cambiada                     | ORIGO                             | recepción, NEXO y NUMERA                              | expectativa de recepción y obligación identificadas      |
| `EVT-PUR-003`  | recepción de proveedor aceptada, parcial o rechazada   | ORIGO                             | NEXO y NUMERA                                         | movimiento de inventario y efecto económico relacionados |
| `EVT-INV-001`  | existencia modificada por movimiento confirmado        | NEXO                              | FOGO, ORIGO, PULSO y NUMERA                           | disponibilidad y valoración derivada actualizadas        |
| `EVT-INV-002`  | conteo produjo una diferencia                          | NEXO                              | responsable autorizado y NUMERA cuando afecte costo   | diferencia revisable sin ajuste automático               |
| `EVT-TRF-001`  | traslado interno despachado                            | NEXO                              | lugar receptor                                        | carga pendiente de recepción                             |
| `EVT-TRF-002`  | traslado recibido, parcial o rechazado                 | NEXO                              | origen y NUMERA cuando aplique                        | remisión conciliada                                      |
| `EVT-PRD-001`  | necesidad de producción confirmada                     | aplicación que origina la demanda | FOGO                                                  | solicitud productiva trazable                            |
| `EVT-PRD-002`  | orden o lote productivo iniciado                       | FOGO                              | NEXO y responsables autorizados                       | insumos y ejecución relacionados                         |
| `EVT-PRD-003`  | lote terminado, retenido, liberado o rechazado         | FOGO                              | NEXO y NUMERA                                         | producto aceptado o excepción registrada                 |
| `EVT-SAL-001`  | pedido aceptado o modificado                           | PULSO                             | preparación, NEXO y tercero de entrega cuando aplique | pedido operativo vigente                                 |
| `EVT-SAL-002`  | venta cerrada, anulada o corregida                     | PULSO                             | NEXO y NUMERA                                         | efecto de existencias y económico relacionado            |
| `EVT-PAY-001`  | pago confirmado, rechazado o reversado                 | PULSO o dominio de pagos          | pedido, caja, PASS y NUMERA según finalidad           | estado financiero del pedido conciliado                  |
| `EVT-CASH-001` | cierre de caja realizado con diferencia                | PULSO                             | NUMERA y responsable autorizado                       | cierre económico disponible para conciliación            |
| `EVT-CUS-001`  | identidad o preferencia autorizada cambió              | PASS                              | PULSO                                                 | atención actualizada con datos mínimos                   |
| `EVT-DEL-001`  | pedido entregado a mensajería                          | PULSO                             | cliente, responsable y NUMERA cuando aplique          | custodia externa identificada                            |
| `EVT-DEL-002`  | entrega confirmada, fallida, parcial o devuelta        | PULSO                             | pedido, cliente, PASS y NUMERA según finalidad        | pedido cerrado o acción pendiente                        |
| `EVT-ECO-001`  | hecho económico operativo confirmado                   | aplicación propietaria del hecho  | NUMERA                                                | clasificación y análisis sin recrear el origen           |
| `EVT-ANA-001`  | indicador o análisis publicado                         | NUMERA                            | Gerencia y aplicaciones consumidoras                  | decisión informada sin alterar hechos                    |
| `EVT-DOC-001`  | documento vigente, reemplazado o archivado             | aplicación propietaria del hecho  | consumidoras autorizadas                              | versión documental correcta                              |
| `EVT-INC-001`  | incidente operativo o tecnológico declarado            | aplicación o área afectada        | responsable de continuidad o soporte                  | impacto, alternativa y seguimiento                       |
| `EVT-INC-002`  | servicio recuperado y conciliado                       | aplicación afectada               | responsables y consumidoras impactadas                | operación normal y pendientes conocidos                  |

Estos códigos identifican necesidades funcionales. No son nombres definitivos de tablas, topics, endpoints o funciones.

---

#### 9. Flujo objetivo de compras, inventario y producción

```text
necesidad de abastecimiento
        ↓
ORIGO aprueba y emite compra
        ↓
ORIGO confirma recepción real
        ↓
NEXO registra el efecto en existencias
        ↓
FOGO consulta disponibilidad y ejecuta producción
        ↓
FOGO confirma lote y resultado
        ↓
NEXO registra producto aceptado
        ↓
NUMERA consume efectos económicos confirmados
```

Reglas:

- una orden de compra no aumenta existencias;
- una recepción rechazada no crea entrada aceptada;
- una orden de producción no equivale a producto terminado;
- un lote retenido no queda disponible para venta;
- NUMERA no crea movimientos para cuadrar un informe.

---

#### 10. Flujo objetivo de pedido, venta, pago y entrega

```text
solicitud interna o externa
        ↓
PULSO acepta el pedido
        ↓
preparación y disponibilidad reciben la versión vigente
        ↓
pago se confirma o rechaza
        ↓
PULSO cierra la venta
        ↓
NEXO recibe el efecto de inventario
        ↓
entrega confirma resultado
        ↓
NUMERA consume el hecho económico
```

Reglas:

- una solicitud externa no es venta hasta ser aceptada internamente;
- un pago recibido dos veces no se aplica dos veces;
- una modificación del pedido conserva versión y referencia;
- la entrega fallida no se registra como entregada;
- anulación, devolución y compensación son resultados diferentes;
- el estado externo y el interno deberán poder conciliarse.

---

#### 11. Integraciones externas requeridas o candidatas

| Sistema externo    | Dirección funcional                | Situación actual                                | Necesidad objetivo                                                              |
| ------------------ | ---------------------------------- | ----------------------------------------------- | ------------------------------------------------------------------------------- |
| Makos              | Makos → PULSO/NUMERA               | Excel manual                                    | conservar transición controlada, detalle y conciliación mientras siga vigente   |
| Rappi              | Rappi ↔ PULSO                      | traslado manual; sin API comprobada             | recibir pedido con referencia externa y devolver solo estados permitidos        |
| ManyChat           | ManyChat ↔ PULSO                   | traslado manual; sin integración comprobada     | convertir solicitud autorizada en pedido trazable y comunicar resultado mínimo  |
| Shopify            | Shopify ↔ PULSO                    | operación externa sin automatización comprobada | recibir pedido de Vaila Vainilla y conciliar pago, despacho y estado            |
| mensajería         | PULSO ↔ proveedor de entrega       | mensajes o comprobantes según operación         | asignar custodia y recibir entrega, fallo o devolución                          |
| banco              | banco → NUMERA                     | medio externo actual                            | importar o consultar movimientos para conciliación sin alterar el banco         |
| sistema contable   | sistema contable ↔ NUMERA/VISO     | alcance exacto por confirmar                    | intercambiar efectos económicos o laborales aprobados sin duplicar contabilidad |
| proveedor de pagos | proveedor ↔ dominio de pagos/PULSO | integración confirmada                          | conservar intención, webhook, conciliación, reversión y trazabilidad            |

Cada integración externa requerirá posteriormente confirmar contrato, titularidad, alcance, costo, ambiente de pruebas, límites y tratamiento de datos.

---

#### 12. Contenido mínimo común

Toda comunicación estructurada deberá poder relacionar:

| Dato                          | Regla                                         |
| ----------------------------- | --------------------------------------------- |
| identificador de comunicación | único para reconocer duplicados               |
| tipo y versión                | permite interpretar el contenido correcto     |
| aplicación de origen          | fuente propietaria                            |
| registro de origen            | identificador estable del hecho               |
| momento del hecho             | diferente del momento de entrega              |
| contexto empresarial          | sede, área, periodo o pedido cuando aplique   |
| versión del registro          | identifica correcciones y cambios             |
| relación anterior             | evento, solicitud o versión que la originó    |
| contenido mínimo              | únicamente datos necesarios para la receptora |
| clasificación de sensibilidad | indica restricciones posteriores de acceso    |

El correo, teléfono, dirección, documento personal o información bancaria solo se incluirán cuando la receptora los necesite para la finalidad autorizada.

---

#### 13. Fallos, duplicados y conciliación

Cuando una comunicación no termine correctamente:

```text
el origen conserva el hecho confirmado
        ↓
la entrega queda pendiente, fallida o rechazada
        ↓
no se aplica otra vez si ya fue aceptada
        ↓
se reintenta o revisa según diseño posterior
        ↓
origen y destino se concilian
```

Debe poder distinguirse:

1. la fuente nunca creó el hecho;
2. el hecho existe, pero no se envió;
3. se envió, pero el destino no lo recibió;
4. el destino lo recibió y lo rechazó;
5. el destino lo aceptó, pero no confirmó;
6. llegó repetido;
7. origen y destino muestran resultados diferentes.

`DIF-06` conserva para diseño técnico la selección de reintentos e idempotencia. Esta tarea fija el comportamiento empresarial esperado, no su implementación.

---

#### 14. Operación manual y contingencia

Una entrega manual podrá permanecer temporalmente cuando:

- la integración automática no exista;
- el proveedor externo no ofrezca acceso adecuado;
- se esté ejecutando una transición controlada;
- exista una contingencia documentada.

Cada entrega manual crítica deberá indicar:

- quién la preparó;
- de qué registro salió;
- fecha y periodo;
- qué archivo, papel o mensaje se entregó;
- quién lo recibió;
- qué resultado produjo;
- cómo se detectan filas faltantes o repetidas.

WhatsApp, llamadas y capturas seguirán siendo medios de coordinación, pero el estado final deberá quedar en la fuente propietaria.

---

#### 15. Dudas y comprobaciones

No se crean preguntas nuevas para trabajadores ni para el usuario.

La evidencia suficiente ya está distribuida en:

- `TEC-10` a `TEC-13`: estado real de Makos, Shopify, Rappi y ManyChat;
- `DAT-01` a `DAT-03`: capacidad de exportación e historia disponible en Makos;
- `DAT-08` a `DAT-13`: remisiones, producción y registros manuales;
- `DAT-20` y `DAT-21`: despacho y entrega de Vaila Vainilla;
- `DAT-23` a `DAT-27`: anulaciones, devoluciones, compensaciones, ajustes y mermas;
- `DIF-06`: mecanismo técnico de reintentos e idempotencia;
- `DIF-11`: separación entre traslado interno y entrega al cliente;
- `DIF-13`: separación entre hechos operativos y análisis consolidado.

Las preguntas pendientes completarán el detalle AS-IS. No impiden definir qué comunicación será necesaria entre las fuentes objetivo.

---

#### 16. Lo que queda decidido

1. Las 217 subcapacidades quedan cubiertas por comunicación familiar más excepción.
2. Se separan eventos, solicitudes, consultas, archivos, notificaciones y confirmaciones.
3. La fuente propietaria es la única emisora oficial del hecho.
4. Las receptoras producen resultados relacionados sin modificar el origen.
5. Toda comunicación conserva referencia estable, momento, versión y contexto.
6. Los duplicados no pueden duplicar efectos empresariales.
7. Compras, recepción e inventario son hechos diferentes.
8. Orden, lote y producto liberado son hechos diferentes.
9. Solicitud externa, pedido interno, venta, pago y entrega son hechos diferentes.
10. Traslado interno pertenece a NEXO y entrega al cliente pertenece a PULSO.
11. Los hechos operativos permanecen en sus aplicaciones; NUMERA recibe eventos para análisis.
12. Makos continúa mediante importación controlada durante la transición.
13. Shopify, Rappi y ManyChat no se declaran integrados automáticamente en el AS-IS.
14. Las integraciones externas futuras conservarán la referencia del proveedor.
15. AURA no recibe integraciones mientras siga sin diseño e implementación.
16. La operación manual deberá ser conciliable.
17. Los fallos no se ocultarán ni corregirán alterando otra fuente.
18. El mecanismo técnico se diseñará después de aprobar contratos funcionales.

---

#### 17. Lo que esta tarea no autoriza

- crear APIs, webhooks, colas, Edge Functions o trabajos programados;
- modificar tablas, migraciones o Supabase;
- desplegar integraciones con proveedores;
- solicitar credenciales, tokens o secretos;
- retirar Makos o cambiar plataformas externas;
- desarrollar AURA;
- definir permisos;
- elegir tiempos de reintento;
- implementar sincronización;
- modificar contratos TypeScript.

---

#### 18. Criterios de aceptación

`CAP-MAP-009` podrá aprobarse cuando:

- las 18 familias y 217 subcapacidades queden cubiertas;
- cada comunicación tenga emisora, receptora y resultado esperado;
- se distingan evento, solicitud, consulta, archivo, notificación y confirmación;
- compras, inventario, producción, ventas, pagos y entregas no compartan hechos ambiguos;
- las integraciones externas reflejen su estado real actual;
- Makos, Shopify, Rappi y ManyChat no se presenten como automatizados sin evidencia;
- los duplicados no puedan producir efectos repetidos;
- los fallos queden visibles y conciliables;
- NUMERA no se convierta en fuente de hechos operativos;
- no se anticipen mecanismos técnicos ni permisos;
- no se creen preguntas duplicadas;
- `CAP-MAP-010` permanezca como única continuidad inmediata.

---

#### 19. Resultado y continuidad

Al aprobarse esta tarea quedará definida la cadena:

```text
hecho confirmado por su fuente
        ↓
evento o solicitud con referencia estable
        ↓
receptora produce su propio resultado
        ↓
aceptación, rechazo, duplicado o fallo visible
        ↓
conciliación entre origen y destino
```

La continuidad será exclusivamente:

```text
CAP-MAP-010
— Identificar permisos y controles de autorización requeridos
```

`CAP-MAP-010` definirá quién puede consultar, crear, cambiar, aprobar, rechazar o corregir cada resultado y cada comunicación, sin convertir cargos humanos en permisos técnicos ambiguos.


### ✅ CAP-MAP-010 — Identificar permisos y controles de autorización requeridos

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Tipo:** definición documental de controles empresariales
**Dependencia anterior:** `CAP-MAP-009`
**Continuidad reservada:** `CAP-MAP-011`

---

#### 1. Resultado de esta tarea

Esta tarea define, para las **217 subcapacidades**:

- qué acciones necesitan autorización diferente;
- qué alcance territorial, organizacional o personal limita cada acción;
- cuándo basta con ejecutar el trabajo asignado;
- cuándo otra persona debe aprobar, rechazar o revisar;
- qué acciones sensibles exigen trazabilidad reforzada;
- qué ocurre cuando el equipo disponible no permite separar funciones;
- cómo se relacionan las capacidades empresariales con el modelo de autorización ya aprobado.

La cobertura se construye mediante:

```text
control base de la familia
+ riesgo de la acción
+ excepción de la subcapacidad
= autorización requerida
```

Esta tarea no crea un segundo catálogo de permisos. Reutiliza el catálogo canónico, las matrices `AUTH-RBAC-001` a `AUTH-RBAC-028`, los contratos de recurso y el ADR de autorización ya aprobados.

---

#### 2. Diferencias que deben conservarse

| Concepto           | Pregunta que responde                                              |
| ------------------ | ------------------------------------------------------------------ |
| Función humana     | ¿Qué trabajo realiza la persona?                                   |
| Rol base           | ¿Qué responsabilidades administrativas tiene normalmente?          |
| Rol operativo      | ¿Qué función está desempeñando durante una operación concreta?     |
| Permiso            | ¿Qué acción exacta puede solicitar?                                |
| Alcance            | ¿Sobre qué sedes, áreas, personas o registros puede hacerlo?       |
| Contexto           | ¿Está trabajando en el turno, lugar y dispositivo adecuados?       |
| Aprobación         | ¿Otra persona debe aceptar antes de que el resultado tenga efecto? |
| Revisión posterior | ¿Otra persona debe comprobar después lo realizado?                 |
| Propiedad del dato | ¿Qué aplicación gobierna el resultado?                             |

No equivalen:

```text
ser gerente = poder hacer cualquier cosa
tener check-in = recibir todos los permisos
usar una caja = convertirse en cajero autorizado
crear un registro = poder aprobarlo
ver un dato = poder cambiarlo
ser custodio = poder dar de baja un activo
```

---

#### 3. Acciones empresariales separadas

Cada subcapacidad utilizará únicamente las acciones que necesite:

| Acción             | Significado sencillo                               |
| ------------------ | -------------------------------------------------- |
| `CONSULTAR`        | ver el estado permitido                            |
| `CREAR`            | registrar un elemento nuevo                        |
| `SOLICITAR`        | pedir que otra persona o capacidad actúe           |
| `EJECUTAR`         | realizar el trabajo autorizado                     |
| `CAMBIAR_BORRADOR` | modificar antes de publicar, aprobar o cerrar      |
| `PUBLICAR`         | convertir un borrador en versión operativa         |
| `APROBAR`          | aceptar que una solicitud produzca efecto          |
| `RECHAZAR`         | impedir el efecto dejando motivo                   |
| `CORREGIR`         | reemplazar un dato vigente conservando el anterior |
| `CANCELAR`         | detener un trabajo o solicitud todavía reversible  |
| `ANULAR`           | dejar sin efecto un resultado ya confirmado        |
| `RECIBIR`          | aceptar custodia, mercancía o responsabilidad      |
| `CONCILIAR`        | comparar fuentes y registrar diferencias           |
| `EXPORTAR`         | producir una copia controlada                      |
| `ADMINISTRAR`      | cambiar reglas, catálogos, accesos o configuración |

Si el catálogo canónico ya contiene el permiso exacto, se reutilizará. Si falta una acción empresarial necesaria, se registrará como brecha para `CAP-MAP-014` y una futura versión del catálogo; no se inventará un código aislado dentro de esta tarea.

---

#### 4. Decisión de autorización canónica

Una acción solo podrá autorizarse cuando se cumpla:

```text
persona activa
+ permiso canónico exacto
+ carril base u operativo compatible
+ alcance válido
+ recurso real resuelto
+ contexto requerido
+ dispositivo permitido cuando aplique
+ ausencia de denegación
= acción autorizable
```

La autorización será denegada por defecto cuando:

- falte el permiso;
- el recurso no pueda ubicarse en un alcance válido;
- la sede o área no corresponda;
- el rol operativo no esté vigente;
- el turno o check-in sean obligatorios y no existan;
- el dispositivo no esté habilitado;
- exista una denegación individual o estructural;
- la acción necesite aprobación y todavía no la tenga;
- el estado del registro ya no permita esa acción.

---

#### 5. Modalidades ya aprobadas

| Modalidad              | Uso en esta tarea                                                       |
| ---------------------- | ----------------------------------------------------------------------- |
| `BASE_ONLY`            | administración que no depende de estar operando un turno                |
| `OPERATIONAL_ONLY`     | ejecución dentro de función, lugar y contexto operativo válidos         |
| `BASE_OR_OPERATIONAL`  | cualquiera de los dos carriles puede autorizar según sus propias reglas |
| `BASE_AND_OPERATIONAL` | necesita simultáneamente componente administrativo y contexto operativo |

Reglas:

1. El carril base no otorga autoridad operativa automática.
2. El carril operativo no crea alcance global.
3. El check-in demuestra presencia o contexto; no concede permisos por sí mismo.
4. El dispositivo compartido limita acciones, pero nunca reemplaza a la persona.
5. APP-REVIEW, pruebas y territorios aislados permanecen excluidos salvo autorización específica.
6. Ninguna tarea de este mapa modifica las matrices ya aprobadas.

---

#### 6. Niveles de control

| Nivel                       | Control requerido                                                      |
| --------------------------- | ---------------------------------------------------------------------- |
| `EJECUCIÓN_DIRECTA`         | la persona autorizada realiza y queda identificada                     |
| `APROBACIÓN_PREVIA`         | otra autoridad acepta antes de producir efecto                         |
| `DOBLE_CONTROL`             | quien ejecuta no puede ser quien aprueba                               |
| `REVISIÓN_POSTERIOR`        | otra persona revisa después dentro de un plazo definido posteriormente |
| `REAUTENTICACIÓN`           | se vuelve a comprobar identidad para una acción sensible               |
| `JUSTIFICACIÓN_OBLIGATORIA` | debe registrarse motivo y soporte                                      |
| `BLOQUEO`                   | la acción no está disponible hasta resolver una condición              |

Una misma acción puede combinar controles.

---

#### 7. Regla para equipos pequeños

Vento no siempre tendrá dos personas disponibles con la misma competencia. La falta de personal no eliminará el control.

Cuando una separación normal no pueda cumplirse:

```text
misma persona ejecuta excepcionalmente
        ↓
declara motivo de la excepción
        ↓
se conserva evidencia antes y después
        ↓
otra autoridad realiza revisión posterior
        ↓
la excepción queda visible en auditoría
```

No se permitirá excepción silenciosa para:

- creación o ampliación de accesos propios;
- eliminación de evidencia de auditoría;
- modificación oculta de ventas, pagos o inventario;
- pago a sí mismo;
- aprobación de una baja de activo bajo custodia propia;
- cambio directo de datos bancarios sin comprobación;
- acceso indiscriminado a documentos sensibles.

---

#### 8. Mapa base de control por familia

| Familia                           | Ejecución ordinaria                                    | Acciones de control reforzado                                                     |
| --------------------------------- | ------------------------------------------------------ | --------------------------------------------------------------------------------- |
| `CAP-01` Dirección y gobierno     | consulta, creación de borradores y seguimiento         | publicar política, aprobar decisión, aceptar riesgo y cambiar estructura          |
| `CAP-02` Personas y trabajo       | administrar información asignada y registrar novedades | contratar, retirar, cambiar pago, publicar horario y corregir información laboral |
| `CAP-03` Seguridad y salud        | registrar inspección, incidente o acción               | cerrar hallazgo crítico, aceptar riesgo o declarar cumplimiento                   |
| `CAP-04` Productos y oferta       | consultar y preparar catálogo o receta                 | publicar producto, receta, precio, promoción o cambio de vigencia                 |
| `CAP-05` Compras y proveedores    | solicitar, cotizar, ordenar y recibir según función    | aprobar compra, cambiar proveedor, aceptar diferencia y devolver                  |
| `CAP-06` Inventario y movimientos | recibir, mover, contar y despachar según contexto      | ajustar saldo, corregir movimiento, aprobar remisión y registrar merma            |
| `CAP-07` Activos                  | registrar, custodiar, contar y mantener                | transferir custodia, cambiar condición, aprobar reparación o dar de baja          |
| `CAP-08` Producción               | planear y ejecutar orden o lote                        | publicar receta, liberar lote, aceptar desviación y corregir rendimiento          |
| `CAP-09` Venta y servicio         | crear pedido, preparar, cobrar y cerrar según función  | descuentos, anulaciones, devoluciones, compensaciones y corrección de pago        |
| `CAP-10` Clientes                 | atender solicitud y consultar datos mínimos            | cambiar identidad, consentimiento, saldo, beneficio o información sensible        |
| `CAP-11` Despacho y entrega       | preparar, custodiar, transportar y confirmar           | cambiar destino, aceptar pérdida, cerrar entrega fallida o devolución             |
| `CAP-12` Finanzas                 | registrar, clasificar, consultar y conciliar           | aprobar pago, cambiar cuenta, cerrar periodo y modificar información económica    |
| `CAP-13` Instalaciones            | reportar, inspeccionar y ejecutar mantenimiento        | aprobar gasto, cerrar riesgo o cambiar condición crítica                          |
| `CAP-14` Mercadeo                 | preparar contenido o propuesta                         | publicar, activar promoción, comprometer presupuesto o usar datos personales      |
| `CAP-15` Tecnología               | reportar, diagnosticar y ejecutar soporte asignado     | conceder acceso, cambiar configuración crítica, desplegar o borrar información    |
| `CAP-16` Información y documentos | crear, consultar y archivar según responsabilidad      | publicar versión, entregar información sensible o eliminar según retención        |
| `CAP-17` Datos y análisis         | consultar, calcular y documentar                       | cambiar definición, publicar indicador o certificar calidad                       |
| `CAP-18` Continuidad              | reportar incidente y ejecutar alternativa asignada     | activar contingencia, aceptar pérdida, restaurar y cerrar conciliación            |

---

#### 9. Separaciones obligatorias o preferidas

| Caso                                       | Quien inicia o ejecuta   | Quien controla                                     | Nivel                |
| ------------------------------------------ | ------------------------ | -------------------------------------------------- | -------------------- |
| alta o cambio de proveedor                 | Compras                  | responsable autorizado distinto                    | `DOBLE_CONTROL`      |
| solicitud y aprobación de compra           | solicitante              | aprobador según alcance                            | `DOBLE_CONTROL`      |
| recepción con diferencia                   | receptor                 | responsable de compra o sede                       | `APROBACIÓN_PREVIA`  |
| conteo y ajuste de inventario              | contador                 | aprobador del ajuste                               | `DOBLE_CONTROL`      |
| remisión despachada y recibida             | origen                   | receptor del destino                               | `DOBLE_CONTROL`      |
| ejecución y liberación de lote             | producción               | responsable de calidad o supervisor cuando aplique | `DOBLE_CONTROL`      |
| venta y anulación                          | cajero                   | responsable autorizado                             | `DOBLE_CONTROL`      |
| devolución o compensación                  | persona que atiende      | responsable autorizado                             | `APROBACIÓN_PREVIA`  |
| corrección de medio de pago                | caja                     | Contabilidad o responsable autorizado              | `DOBLE_CONTROL`      |
| preparación y aprobación de pago           | Contabilidad             | Gerencia o titular autorizado                      | `DOBLE_CONTROL`      |
| registro y conciliación bancaria           | registrador              | revisor autorizado                                 | `REVISIÓN_POSTERIOR` |
| cálculo y aprobación de pago laboral       | Contabilidad o proveedor | Gerencia autorizada                                | `DOBLE_CONTROL`      |
| solicitud y concesión de acceso            | solicitante o jefe       | administrador autorizado diferente                 | `DOBLE_CONTROL`      |
| cambio de permisos propios                 | persona afectada         | autoridad distinta                                 | `BLOQUEO`            |
| custodia y baja de activo                  | custodio                 | aprobador de baja distinto                         | `DOBLE_CONTROL`      |
| autoría y publicación de documento crítico | autor                    | aprobador documental                               | `DOBLE_CONTROL`      |
| cambio técnico y paso a producción         | ejecutor técnico         | aprobador del cambio                               | `DOBLE_CONTROL`      |

Cuando el control figure como preferido y no haya dos personas disponibles, aplicará la excepción documentada del apartado 7. Los bloqueos expresos no admiten autocontrol.

---

#### 10. Controles específicos: personas y seguridad

1. Cada trabajador podrá consultar únicamente su información propia cuando el contrato `OWN` lo permita.
2. Consultar documentos o información de otra persona requerirá permiso y finalidad laboral.
3. Crear, cambiar o retirar una relación laboral será una acción diferente.
4. Publicar o corregir un horario conservará versión y responsable.
5. La hora original de una marcación no se reemplazará silenciosamente.
6. Una corrección de asistencia, si se diseña, distinguirá marcación observada, explicación y decisión administrativa.
7. El cálculo, aprobación y pago laboral serán controles separados.
8. Los incidentes de seguridad y salud tendrán visibilidad limitada por sensibilidad.
9. Cerrar una acción correctiva requerirá evidencia, no solo cambiar su estado.
10. Declarar cumplimiento no será una acción operativa ordinaria.

`TEC-14` y `TEC-15` se conservan como evidencia: horarios pueden editarse en VISO y ANIMA; la hora de asistencia no tiene corrección comprobada.

---

#### 11. Controles específicos: compras, inventario, activos y producción

1. Solicitar, aprobar, ordenar, recibir y devolver una compra serán acciones separadas.
2. Quien recibe podrá rechazar o registrar diferencia dentro de su alcance, pero no ampliar la orden por su cuenta.
3. Un ajuste de inventario requerirá motivo, referencia al conteo o hecho y autorización independiente.
4. La merma conservará producto, cantidad, lugar, momento, causa y responsable.
5. Despachar una remisión no permitirá confirmarla como recibida desde el mismo lado.
6. Cambiar origen o destino exigirá volver a evaluar ambos alcances.
7. El custodio de un activo no podrá aprobar su propia baja.
8. La reparación externa no autorizará a cambiar el maestro del activo.
9. Crear un lote y liberarlo serán acciones distintas cuando exista control de calidad.
10. Una desviación de receta o rendimiento requerirá justificación y revisión.

Las respuestas `OPE-04` a `OPE-06` completarán quién realiza hoy estas autorizaciones sin alterar el control objetivo.

---

#### 12. Controles específicos: ventas, clientes y entregas

1. Crear, modificar, cobrar, cerrar y anular un pedido o venta serán acciones diferentes.
2. Un descuento fuera de la regla ordinaria requerirá autorización identificable.
3. Devolución, reposición, descuento y entrega de dinero conservarán motivo y relación con la venta.
4. La corrección del medio de pago no existirá como edición silenciosa; deberá ser una operación auditable.
5. El cajero no aprobará su propia anulación o compensación cuando exista otra autoridad disponible.
6. Los datos del cliente se limitarán a la finalidad de atención, entrega o beneficio.
7. Cambiar identidad o consentimiento requerirá comprobación reforzada.
8. El domiciliario o mensajero recibirá solo información necesaria para entregar.
9. Confirmar entrega no permitirá modificar el pago.
10. Una entrega fallida conservará causa, evidencia y siguiente acción.

`TEC-16` confirma que no existe corrección manual auditable de medio de pago en PULSO. `OPE-07`, `OPE-10` y `OPE-11` permanecen como comprobaciones AS-IS.

---

#### 13. Controles específicos: finanzas, tecnología y documentos

1. Registrar un hecho económico, aprobar un pago y ejecutar el pago serán acciones distintas.
2. Cambiar datos bancarios requerirá comprobación fuera del mismo cambio y trazabilidad reforzada.
3. Cerrar un periodo bloqueará cambios ordinarios; las correcciones posteriores serán ajustes identificados.
4. NUMERA podrá clasificar y analizar, pero no cambiar los hechos operativos de origen.
5. Crear, ampliar, suspender y retirar accesos serán permisos diferentes cuando el catálogo lo requiera.
6. Nadie podrá concederse a sí mismo una ampliación de autoridad.
7. Una cuenta técnica no actuará como persona ni recibirá funciones empresariales.
8. Los dispositivos compartidos permitirán únicamente paquetes explícitos y contexto válido.
9. Publicar un cambio técnico requerirá evidencia de prueba y aprobación separada.
10. Eliminar un documento dependerá de retención, sensibilidad y autoridad, no solo de poder verlo.
11. Las exportaciones sensibles deberán registrar quién, qué alcance y cuándo.
12. Los informes no podrán mostrar sedes, personas o importes fuera del alcance autorizado.

---

#### 14. Sensibilidad y comprobación reforzada

| Nivel       | Ejemplos                                                | Control mínimo                                     |
| ----------- | ------------------------------------------------------- | -------------------------------------------------- |
| `ORDINARIO` | catálogo público, estado operativo permitido            | permiso y alcance                                  |
| `INTERNO`   | pedidos, existencias, producción y compras              | permiso, alcance y auditoría                       |
| `SENSIBLE`  | documentos laborales, costos, clientes y conciliaciones | permiso explícito, finalidad y auditoría reforzada |
| `CRÍTICO`   | accesos, datos bancarios, pagos, cierres y eliminación  | separación, reautenticación y evidencia            |

La clasificación exacta de campos ya definida en el modelo de autorización prevalecerá sobre cualquier ejemplo general de esta tarea.

---

#### 15. Dudas pendientes reutilizadas

No se crean preguntas nuevas.

Las prácticas actuales que todavía necesitan confirmación ya están expresadas de forma sencilla en el registro independiente:

| Códigos  | Qué permiten confirmar                         |
| -------- | ---------------------------------------------- |
| `OPE-04` | quién autoriza cambiar una remisión enviada    |
| `OPE-05` | quién decide rechazar mercancía diferente      |
| `OPE-06` | quién autoriza un ajuste después del conteo    |
| `OPE-07` | quién autoriza corregir un medio de pago       |
| `OPE-08` | quién autoriza cambiar un horario publicado    |
| `OPE-09` | quién autoriza tratar una marcación equivocada |
| `OPE-10` | quién decide una devolución                    |
| `OPE-11` | quién aprueba una compensación                 |

Estas respuestas describirán el AS-IS. No crearán permisos técnicos por nombre de persona o cargo.

---

#### 16. Lo que queda decidido

1. Las 217 subcapacidades quedan cubiertas por control familiar más excepción.
2. Consultar, crear, ejecutar, aprobar, corregir, cancelar y anular son acciones diferentes.
3. Se reutilizan los 112 permisos y matrices ya aprobados.
4. El acceso a una aplicación no concede sus acciones internas.
5. La autorización requiere permiso, alcance, recurso, contexto y ausencia de denegación.
6. El check-in y el dispositivo no crean autoridad.
7. El propietario y la Gerencia no reciben operación universal por su cargo.
8. El creador de un registro no obtiene automáticamente derecho a aprobarlo.
9. Las acciones financieras, de acceso y de corrección crítica requieren doble control.
10. Los equipos pequeños usarán excepción documentada y revisión posterior, nunca bypass silencioso.
11. Las fuentes propietarias de `CAP-MAP-008` conservan el control de sus datos.
12. Las integraciones de `CAP-MAP-009` no amplían los permisos de la receptora.
13. NUMERA no corrige hechos de otras aplicaciones.
14. AURA no recibe permisos funcionales ejecutables mientras no exista.
15. Toda corrección sensible conserva valor anterior, motivo y responsable.
16. Las preguntas AS-IS permanecen en el registro independiente.

---

#### 17. Lo que esta tarea no autoriza

- cambiar los 112 permisos aprobados;
- modificar matrices RBAC;
- insertar concesiones o denegaciones;
- crear usuarios, roles o accesos;
- modificar Supabase, RLS, RPC o migraciones;
- implementar pantallas o guards;
- asignar permisos a personas concretas;
- crear bypasses por cargo;
- inventar umbrales monetarios;
- desarrollar AURA;
- iniciar remodelación de código.

---

#### 18. Criterios de aceptación

`CAP-MAP-010` podrá aprobarse cuando:

- las 18 familias y 217 subcapacidades queden cubiertas;
- las acciones empresariales estén separadas;
- se reutilice el modelo de autorización aprobado;
- ninguna persona, cargo, dispositivo o check-in equivalga a autoridad universal;
- las acciones sensibles tengan control reforzado;
- las separaciones críticas estén identificadas;
- exista tratamiento realista para equipos pequeños;
- los alcances territoriales y de recurso permanezcan obligatorios;
- las correcciones conserven trazabilidad;
- las integraciones no amplíen permisos;
- no se creen preguntas duplicadas;
- no se modifiquen permisos ni matrices en esta fase;
- `CAP-MAP-011` permanezca como única continuidad inmediata.

---

#### 19. Resultado y continuidad

Al aprobarse esta tarea quedará definida la cadena:

```text
acción empresarial exacta
        ↓
permiso canónico aplicable
        ↓
alcance, recurso y contexto
        ↓
aprobación o separación cuando corresponda
        ↓
autorización, denegación y trazabilidad
```

La continuidad será exclusivamente:

```text
CAP-MAP-011
— Identificar pantallas, dispositivos, documentos y evidencia requeridos
```

`CAP-MAP-011` definirá qué superficie permite realizar cada acción, qué dispositivo puede utilizarse y qué evidencia debe quedar, sin confundir una pantalla visible con autoridad suficiente.

### ✅ CAP-MAP-011 — Identificar pantallas, dispositivos, documentos y evidencia requeridos

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Tipo:** definición documental de superficies y evidencia
**Dependencia anterior:** `CAP-MAP-010`
**Continuidad reservada:** `CAP-MAP-012`

---

#### 1. Resultado de esta tarea

Esta tarea define, para las **217 subcapacidades**:

- qué tipo de pantalla o medio permite realizar el trabajo;
- qué dispositivo resulta adecuado para el lugar y la función;
- qué documento debe generarse, recibirse o conservarse;
- qué evidencia demuestra que ocurrió el resultado;
- qué información debe verse antes de decidir;
- qué debe quedar visible cuando existe un error, diferencia o pendiente;
- qué medios actuales son operación principal, evidencia, copia o contingencia.

La cobertura se construye mediante:

```text
superficie base de la familia
+ necesidad del lugar y actor
+ documento o evidencia crítica
= interfaz y evidencia requerida
```

Esta tarea define necesidades funcionales. No diseña todavía rutas definitivas, componentes visuales, hardware, formatos finales ni almacenamiento físico.

---

#### 2. Diferencias que deben conservarse

| Concepto     | Significado sencillo                                                |
| ------------ | ------------------------------------------------------------------- |
| Pantalla     | lugar visual donde una persona consulta o realiza una acción        |
| Dispositivo  | aparato desde el cual se usa una aplicación                         |
| Documento    | contenido con identidad, propósito, versión y conservación          |
| Comprobante  | documento que confirma un resultado concreto                        |
| Evidencia    | información que permite demostrar qué ocurrió                       |
| Adjunto      | foto, archivo, firma o soporte relacionado                          |
| Copia        | reproducción que no reemplaza el registro principal                 |
| Impresión    | copia física generada desde un registro                             |
| Contingencia | medio temporal usado cuando la superficie normal no está disponible |

No equivalen:

```text
ver un botón = tener permiso
tener una pantalla = proceso terminado
tomar una foto = registrar cantidades
imprimir un PDF = crear una segunda fuente de verdad
usar un dispositivo compartido = perder la identidad del trabajador
tener una firma = demostrar que todo el contenido es correcto
```

---

#### 3. Tipos de superficie requeridos

| Superficie         | Uso principal                                                             |
| ------------------ | ------------------------------------------------------------------------- |
| `BANDEJA`          | ver trabajo pendiente, prioridad, responsable y estado                    |
| `LISTA`            | buscar, filtrar y comparar varios registros                               |
| `DETALLE`          | consultar un registro completo, relaciones e historial                    |
| `FORMULARIO`       | crear o cambiar información permitida                                     |
| `ASISTENTE`        | guiar una actividad con pasos y validaciones                              |
| `APROBACIÓN`       | revisar diferencias, soportes y aceptar o rechazar                        |
| `OPERACIÓN_RÁPIDA` | registrar acciones frecuentes con pocos pasos                             |
| `CONTEO`           | capturar cantidades y diferencias sin revelar el saldo cuando corresponda |
| `RECEPCIÓN`        | comparar esperado, recibido, rechazado y pendiente                        |
| `DESPACHO`         | preparar, verificar, entregar custodia y confirmar salida                 |
| `SEGUIMIENTO`      | mostrar etapas, responsables, tiempos y novedades                         |
| `TABLERO`          | resumir indicadores sin permitir corregir hechos de origen                |
| `DOCUMENTO`        | visualizar, generar, firmar o descargar una versión                       |
| `AUDITORÍA`        | mostrar quién hizo qué, cuándo, antes y después                           |
| `CONTINGENCIA`     | capturar lo mínimo cuando la operación normal falla                       |

Una subcapacidad puede necesitar varias superficies, pero cada una deberá tener un propósito distinto.

---

#### 4. Principios de diseño funcional

1. La pantalla mostrará primero la decisión o trabajo principal.
2. Las acciones irreversibles o sensibles estarán separadas de la operación ordinaria.
3. Un cambio mostrará el valor actual y el valor propuesto.
4. Rechazos, diferencias y faltantes no se esconderán dentro de notas libres.
5. Los estados usarán palabras comprensibles para la persona que opera.
6. Las pantallas de dispositivo compartido evitarán información administrativa innecesaria.
7. Una persona no verá datos de otras sedes, áreas o personas fuera de su autorización.
8. La interfaz no confiará en ocultar botones como único control de seguridad.
9. Una acción exitosa dejará confirmación visible y referencia consultable.
10. Una acción fallida explicará qué quedó guardado y qué debe repetirse.
11. Los documentos generados indicarán origen, fecha, versión y estado.
12. Las copias exportadas advertirán que pueden quedar desactualizadas.
13. Las fotos y firmas se pedirán solo cuando aporten evidencia necesaria.
14. La operación deberá poder continuar sin conocimientos técnicos.

---

#### 5. Clases de dispositivo

| Clase                     | Uso                                                                                         |
| ------------------------- | ------------------------------------------------------------------------------------------- |
| `PERSONAL_ADMINISTRATIVO` | computador personal autenticado para Gerencia, Contabilidad, Compras, VISO y configuración  |
| `PERSONAL_MÓVIL`          | teléfono de trabajador o cliente para ANIMA, PASS, notificaciones y acciones propias        |
| `COMPARTIDO_OPERATIVO`    | terminal de caja, barra, cocina, producción, bodega o recepción                             |
| `MÓVIL_DE_CAMPO`          | entrega, inspección, mantenimiento, conteo o traslado                                       |
| `PANTALLA_DE_SEGUIMIENTO` | visualización operativa sin autoridad por sí misma                                          |
| `IMPRESORA_PERIFÉRICO`    | comanda, etiqueta, recibo o documento; nunca representa una persona                         |
| `EXTERNO`                 | dispositivo o portal de banco, Makos, Shopify, Rappi, ManyChat, mensajería u otro proveedor |

Se reutilizan las 14 plantillas objetivo y reglas de `AUTH-RBAC-023`. Esta tarea no crea nuevas concesiones por dispositivo.

---

#### 6. Reglas para dispositivos compartidos

1. Solo habrá un actor humano efectivo por sesión.
2. La plantilla y la instancia podrán restringir, nunca ampliar permisos.
3. La sede y área del dispositivo deberán coincidir con la operación.
4. Cambiar de persona exigirá terminar o transferir claramente la sesión anterior.
5. Un PIN o código rápido identificará a la persona únicamente dentro del mecanismo aprobado; no será permiso.
6. La pantalla se bloqueará al abandonar la operación o vencer el contexto.
7. Caja, barra, cocina, producción, bodega y recepción conservarán funciones distintas.
8. El dispositivo no almacenará credenciales personales visibles.
9. Las acciones sensibles usarán reautenticación cuando el modelo aprobado lo exija.
10. Una impresora, escáner o cámara será periférico del actor efectivo, no actor independiente.

---

#### 7. Jerarquía de evidencia

| Nivel | Evidencia                                                           | Fuerza                             |
| ----- | ------------------------------------------------------------------- | ---------------------------------- |
| `E1`  | registro estructurado en la fuente propietaria                      | principal                          |
| `E2`  | evento de auditoría con actor, momento, alcance y cambio            | principal de trazabilidad          |
| `E3`  | confirmación independiente de otra persona o sistema                | reforzada                          |
| `E4`  | documento generado y relacionado con el registro                    | comprobante                        |
| `E5`  | documento externo, factura, extracto, guía o respuesta de proveedor | soporte externo                    |
| `E6`  | foto, firma, archivo o nota adjunta                                 | complemento                        |
| `E7`  | chat, llamada, captura, papel o relato                              | evidencia manual o de contingencia |

Un nivel inferior podrá complementar, pero no reemplazar silenciosamente un registro principal cuando este deba existir.

---

#### 8. Registro mínimo de evidencia

| Campo            | Contenido                                                |
| ---------------- | -------------------------------------------------------- |
| hecho respaldado | resultado de `CAP-MAP-007`                               |
| fuente           | aplicación propietaria de `CAP-MAP-008`                  |
| actor            | persona o sistema identificado                           |
| momento          | fecha y hora del hecho                                   |
| lugar            | sede, área o ubicación aplicable                         |
| versión          | estado o versión antes y después                         |
| referencia       | pedido, compra, remisión, lote, pago, activo o documento |
| resultado        | completo, parcial, rechazado, cancelado o corregido      |
| motivo           | obligatorio en excepciones o cambios sensibles           |
| soporte          | documento, foto, firma o archivo cuando corresponda      |
| revisión         | aprobación o comprobación independiente cuando aplique   |
| conservación     | regla posterior de retención y acceso                    |

---

#### 9. Mapa de superficies, dispositivos y evidencia por familia

| Familia                           | Superficie principal                                      | Dispositivo habitual objetivo                  | Evidencia principal                                     |
| --------------------------------- | --------------------------------------------------------- | ---------------------------------------------- | ------------------------------------------------------- |
| `CAP-01` Dirección y gobierno     | bandeja, detalle, aprobación y documento                  | personal administrativo                        | decisión, versión, aprobación y seguimiento             |
| `CAP-02` Personas y trabajo       | administración VISO y experiencia personal ANIMA          | computador administrativo y móvil personal     | relación laboral, turno, marcación, novedad y documento |
| `CAP-03` Seguridad y salud        | inspección, incidente, acción y seguimiento               | computador o móvil de campo                    | hallazgo, foto necesaria, acción y cierre comprobado    |
| `CAP-04` Productos y oferta       | catálogo, receta, publicación y consulta operativa        | computador administrativo y terminal operativa | versión de producto, receta, precio y vigencia          |
| `CAP-05` Compras y proveedores    | solicitud, comparación, orden, recepción y aprobación     | computador y terminal de recepción             | oferta, orden, factura, cantidades y diferencias        |
| `CAP-06` Inventario y movimientos | operación rápida, conteo, remisión, recepción y auditoría | kiosco de bodega o móvil de campo              | movimiento, conteo, ajuste, custodia y confirmación     |
| `CAP-07` Activos                  | ficha, custodia, conteo, mantenimiento y baja             | computador o móvil de campo                    | identificación, ubicación, condición, foto y entrega    |
| `CAP-08` Producción               | plan, orden, lote, consumo, control y liberación          | terminal de producción                         | receta usada, cantidades, rendimiento, control y lote   |
| `CAP-09` Venta y servicio         | punto de venta, preparación, pago y cierre                | terminal de caja, barra, cocina o mostrador    | pedido, comanda, venta, pago y comprobante              |
| `CAP-10` Clientes                 | atención PULSO y experiencia PASS                         | terminal autorizado y móvil personal           | consentimiento, solicitud, solución y comunicación      |
| `CAP-11` Despacho y entrega       | despacho, seguimiento y confirmación                      | kiosco, móvil de campo o portal externo        | carga, custodia, guía, entrega, fallo o devolución      |
| `CAP-12` Finanzas                 | registro, conciliación, aprobación y tablero              | computador personal administrativo             | soporte, movimiento, conciliación, cierre e informe     |
| `CAP-13` Instalaciones            | solicitud, inspección, orden de trabajo y cierre          | computador o móvil de campo                    | condición inicial, trabajo, gasto y condición final     |
| `CAP-14` Mercadeo                 | borrador, aprobación, publicación y medición              | computador administrativo                      | versión aprobada, publicación, presupuesto y resultado  |
| `CAP-15` Tecnología               | caso, diagnóstico, cambio, prueba y recuperación          | computador administrativo o móvil técnico      | ticket, cambio, prueba, aprobación y cierre             |
| `CAP-16` Información y documentos | documento, versión, búsqueda, entrega y auditoría         | dispositivo autorizado según sensibilidad      | versión, acceso, firma, entrega y conservación          |
| `CAP-17` Datos y análisis         | definición, tablero, informe y calidad                    | computador administrativo                      | definición, periodo, fuentes, cálculo y publicación     |
| `CAP-18` Continuidad              | incidente, operación mínima, recuperación y conciliación  | dispositivo disponible autorizado              | impacto, alternativa, recuperación y pendientes         |

---

#### 10. Superficies críticas por flujo

##### 10.1. Compra y recepción

Se requieren superficies separadas para:

1. solicitar;
2. comparar ofertas;
3. aprobar;
4. emitir orden;
5. recibir;
6. registrar diferencias;
7. aceptar, rechazar o devolver;
8. consultar evidencia y auditoría.

La pantalla de recepción mostrará esperado, recibido, aceptado, rechazado y pendiente sin convertir automáticamente la orden en inventario.

##### 10.2. Inventario y traslado

Se requieren:

- consulta de disponibilidad;
- conteo sin sesgo cuando aplique;
- explicación de diferencia;
- aprobación de ajuste;
- preparación de remisión;
- confirmación de despacho;
- recepción independiente;
- conciliación entre ambos extremos.

##### 10.3. Producción

Se requieren:

- necesidad y plan;
- orden priorizada;
- receta publicada;
- captura de consumo y resultado;
- control de calidad;
- liberación, retención o rechazo;
- cierre con rendimiento y diferencias.

##### 10.4. Venta, pago y entrega

Se requieren:

- pedido vigente;
- preparación por área;
- cobro y estado de pago;
- cierre o anulación separada;
- despacho y custodia;
- entrega, fallo o devolución;
- comprobante para cliente;
- auditoría de descuentos, compensaciones y correcciones.

---

#### 11. Documentos mínimos por dominio

| Dominio       | Documentos o comprobantes necesarios                                   |
| ------------- | ---------------------------------------------------------------------- |
| gobierno      | decisión, política, acta, riesgo aceptado y seguimiento                |
| personas      | vinculación, turno publicado, novedad, pago laboral y retiro           |
| seguridad     | inspección, incidente, acción correctiva y evidencia de cierre         |
| catálogo      | ficha de producto, versión de receta, especificación y publicación     |
| compras       | solicitud, comparación, orden, factura, recepción y devolución         |
| inventario    | remisión, conteo, ajuste, merma y constancia de recepción              |
| activos       | ficha, custodia, préstamo, mantenimiento, reparación y baja            |
| producción    | orden, hoja o registro de lote, control y liberación                   |
| ventas        | pedido, comanda, factura o documento equivalente, recibo y anulación   |
| clientes      | consentimiento, reserva, caso, devolución y solución                   |
| entrega       | manifiesto o guía, custodia, entrega, fallo y devolución               |
| finanzas      | soporte, cierre de caja, cuenta, conciliación, presupuesto e informe   |
| instalaciones | orden de trabajo, inspección, gasto y cierre                           |
| mercadeo      | aprobación, pieza, publicación, promoción y resultado                  |
| tecnología    | solicitud, incidente, cambio, prueba, acceso y cierre                  |
| información   | documento controlado, versión, firma, entrega y eliminación autorizada |
| análisis      | definición, fuente, periodo, cálculo, informe y limitaciones           |
| continuidad   | incidente, operación mínima, recuperación y conciliación               |

No todo documento necesita ser PDF o papel. Puede ser un registro estructurado con una vista o exportación verificable.

---

#### 12. Regla de facturación y titular documental

Las respuestas incorporadas en `GOV-05` y `GOV-08` a `GOV-12` confirman que marca, titular documental y emisor de factura no siempre coinciden.

Por tanto:

1. ningún documento asumirá el emisor únicamente por la marca mostrada;
2. la operación deberá seleccionar o derivar el emisor permitido para el caso;
3. la factura conservará el titular realmente utilizado;
4. Vaila Vainilla admite actualmente más de una alternativa según el caso;
5. catering se tratará según el titular confirmado en el registro;
6. el historial conservará cambios de emisor y soporte aplicable;
7. ninguna pantalla inventará RUT, Cámara de Comercio o relación jurídica inexistente;
8. la validación tributaria y jurídica continuará con los responsables profesionales.

La respuesta `ADM-02` confirma que la dirección registral usada por Vento Group corresponde al Centro de Producción. Los documentos deberán tomar la dirección desde la fuente administrativa vigente, sin copiarla manualmente en cada aplicación.

##### 12.1. Venta a consumidor final y factura solicitada

PULSO deberá separar dos decisiones:

```text
registrar íntegramente la venta y sus impuestos
        ≠
identificar al comprador para expedir el documento a su nombre
```

Reglas funcionales:

1. Toda venta se registrará con productos, valores, impuestos, medio de pago, emisor y documento fiscal aplicable.
2. Si el comprador no solicita que la factura electrónica o el documento equivalente electrónico POS sea expedido a su nombre, PULSO no obligará a registrar un cliente.
3. En ese caso se utilizará la identificación reglamentaria de `CONSUMIDOR FINAL`.
4. Si el comprador solicita el documento a su nombre, se pedirán únicamente los datos permitidos y necesarios.
5. El correo no será obligatorio cuando el comprador elija una representación gráfica impresa y la norma vigente lo permita.
6. La elección entre consumidor final y comprador identificado no modificará por sí sola impuestos, ingresos ni valores de la venta.
7. El medio de pago no decidirá si la venta se registra o si causa impuestos.
8. El flujo rápido de caja no exigirá crear perfiles de clientes ficticios.
9. La factura electrónica de venta y el documento equivalente electrónico POS serán tipos documentales distintos, relacionados con la misma venta.
10. PULSO deberá permitir cambiar al flujo identificado antes de cerrar el documento, sin rehacer el pedido.
11. Notas crédito, anulaciones o sustituciones posteriores seguirán la norma vigente y conservarán la relación con el documento original.
12. Las reglas tributarias se validarán nuevamente con Contabilidad antes de implementar o desplegar el POS.

Base normativa revisada para esta decisión:

- Resolución DIAN 000202 de 2025: cuando el adquirente no solicita que el documento sea expedido a su nombre, no se le piden datos y se expide a consumidor final;
- Resolución DIAN 000165 de 2023 y su compilación vigente: regula factura electrónica y documento equivalente electrónico POS.

---

#### 13. Evidencia ante correcciones y excepciones

| Acción                      | Evidencia mínima                                        |
| --------------------------- | ------------------------------------------------------- |
| corregir horario            | versión anterior, nueva versión, motivo y responsable   |
| tratar marcación equivocada | hora observada intacta, explicación y decisión          |
| ajustar inventario          | conteo o hecho origen, diferencia, motivo y aprobación  |
| cambiar remisión            | versión anterior, cambio y autorización                 |
| anular venta                | venta original, motivo, valores afectados y aprobador   |
| corregir pago               | pago original, operación correctiva y conciliación      |
| devolver o compensar        | pedido, producto o valor, motivo, solución y aprobación |
| cambiar receta o producto   | versión anterior, nueva versión, vigencia y publicación |
| liberar lote                | controles, resultado y responsable                      |
| aprobar pago                | soporte, beneficiario, valor y doble control            |
| cambiar acceso              | solicitud, decisión, alcance anterior y nuevo           |
| eliminar documento          | regla de retención, motivo, autoridad y constancia      |
| cerrar incidente            | impacto, recuperación, comprobación y pendientes        |

No se exigirá fotografía cuando el registro estructurado y la confirmación independiente sean suficientes.

---

#### 14. Exportaciones y evidencia de auditoría

La evidencia AS-IS confirma:

- NEXO exporta CSV o Excel en algunos flujos;
- VISO y ANIMA exportan Excel;
- ORIGO y FOGO generan PDF;
- PULSO importa Excel Makos, pero no tiene exportación comprobada;
- NUMERA no tiene exportación encontrada.

El objetivo exige:

1. exportar únicamente dentro del alcance autorizado;
2. identificar fecha, filtros, periodo y persona que exporta;
3. evitar que una exportación se considere editable como fuente;
4. proteger información personal, financiera o sensible;
5. permitir auditoría de resultados críticos aunque no exista descarga;
6. registrar las brechas de exportación durante `CODE-AUD-002`, `CODE-AUD-010` y diseño posterior.

---

#### 15. Fallos, impresión y contingencia

Cuando una pantalla, red, impresora o dispositivo falle:

- el sistema indicará si la operación quedó guardada;
- repetir una acción no duplicará el resultado;
- la impresión podrá repetirse identificándola como copia;
- el papel de contingencia tendrá referencia, fecha, persona y posterior conciliación;
- una foto o captura no sustituirá indefinidamente el registro pendiente;
- el cierre de contingencia confirmará qué fue registrado y qué sigue faltando;
- los datos sensibles no quedarán expuestos en pantallas o papeles abandonados.

El funcionamiento exacto sin internet permanece en `DIF-05` y se diseñará con continuidad y piloto.

---

#### 16. Dudas y auditorías reutilizadas

No se crean preguntas nuevas.

Esta tarea reutiliza:

- las respuestas `ADM-02`, `GOV-05` y `GOV-08` a `GOV-12`;
- `DAT-08` a `DAT-13` para remisiones, producción y registros manuales;
- `DAT-16` a `DAT-27` para inspecciones, decisiones, entregas, propinas, anulaciones, devoluciones, ajustes y mermas;
- `TEC-17` para exportaciones existentes;
- `AUTH-RBAC-023` para dispositivos compartidos;
- `OPS-PLAN-003` para autocuestionarios operativos;
- `CODE-AUD-002` para inventario de rutas, pantallas, componentes y formularios;
- `CODE-AUD-010` para detectar interfaces sin lógica completa;
- `CAP-SCOPE-015` para dispositivos, redes, impresión y soporte;
- `CAP-SCOPE-016` para privacidad, conservación y auditoría.

Las respuestas pendientes describirán el AS-IS, pero no bloquean esta definición funcional.

---

#### 17. Lo que queda decidido

1. Las 217 subcapacidades quedan cubiertas por superficie familiar más excepción.
2. Pantalla, dispositivo, documento, evidencia, copia y contingencia son conceptos distintos.
3. Una pantalla visible no concede permiso.
4. Los dispositivos compartidos conservan actor humano, sede, área y plantilla.
5. Las 14 plantillas aprobadas se reutilizan y no amplían autoridad.
6. El registro estructurado y la auditoría son evidencia principal.
7. Fotos, firmas, chats y papeles son complementos o contingencia según el caso.
8. Compras, recepción, inventario, producción, ventas, pagos y entregas tendrán superficies separadas por resultado.
9. Las correcciones mostrarán antes, después, motivo y responsable.
10. Los documentos generados conservarán origen, versión y estado.
11. Las impresiones serán copias identificables.
12. Marca, titular y emisor de factura no se asumirán equivalentes.
13. Vaila Vainilla conservará la alternativa de facturación realmente utilizada en cada caso.
14. La dirección administrativa se tomará desde una fuente vigente, no se repetirá manualmente.
15. Las exportaciones respetarán alcance y sensibilidad.
16. No se crean preguntas nuevas ni se repiten las respondidas.

---

#### 18. Lo que esta tarea no autoriza

- diseñar UI de alta fidelidad;
- crear rutas, componentes o formularios;
- comprar o instalar dispositivos;
- cambiar plantillas de dispositivos;
- crear documentos productivos;
- modificar facturación;
- cambiar titulares o datos legales;
- crear exportaciones;
- modificar Supabase o migraciones;
- implementar modo sin conexión;
- desarrollar AURA;
- eliminar papeles, archivos o medios actuales.

---

#### 19. Criterios de aceptación

`CAP-MAP-011` podrá aprobarse cuando:

- las 18 familias y 217 subcapacidades queden cubiertas;
- cada resultado crítico tenga superficie y evidencia identificadas;
- pantalla, dispositivo, documento y evidencia no se confundan;
- los dispositivos compartidos no creen autoridad;
- las correcciones conserven antes, después, motivo y responsable;
- las diferencias y pendientes sean visibles;
- los documentos indiquen fuente, versión y estado;
- la facturación no asuma titular por marca;
- las exportaciones actuales y sus brechas estén reconocidas;
- las respuestas nuevas del registro se incorporen sin perder detalle;
- no se creen preguntas duplicadas;
- no se implemente interfaz, hardware o almacenamiento;
- `CAP-MAP-012` permanezca como única continuidad inmediata.

---

#### 20. Resultado y continuidad

Al aprobarse esta tarea quedará definida la cadena:

```text
acción autorizada
        ↓
superficie adecuada al trabajo
        ↓
dispositivo compatible con actor y lugar
        ↓
documento o registro producido
        ↓
evidencia y auditoría conservadas
```

La continuidad será exclusivamente:

```text
CAP-MAP-012
— Clasificar capacidad núcleo, soporte, transversal, futura o fuera de alcance
```

`CAP-MAP-012` clasificará cada capacidad según su importancia y relación con el alcance, sin confundir prioridad empresarial con existencia actual de una pantalla o aplicación.
