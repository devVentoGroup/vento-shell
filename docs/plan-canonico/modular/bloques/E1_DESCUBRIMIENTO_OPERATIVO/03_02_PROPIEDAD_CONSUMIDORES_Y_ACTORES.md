### MINI-BLOQUE — PROPIEDAD CONSUMIDORES Y ACTORES

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **propiedad consumidores y actores** dentro de **E1 DESCUBRIMIENTO OPERATIVO**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `CAP-MAP-004` a `CAP-MAP-006` — 3 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `CAP-MAP-004`: Definir dominio y aplicación propietaria candidata
- `CAP-MAP-005`: Definir aplicaciones y sistemas consumidores
- `CAP-MAP-006`: Identificar actor iniciador, ejecutor, supervisor y aprobador
<!-- PLAN-SECTION-META:END -->

### ✅ CAP-MAP-004 — Definir dominio y aplicación propietaria candidata

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Dependencias cumplidas:** `CAP-MAP-001`, `CAP-MAP-002` y `CAP-MAP-003`
**Propósito:** proponer qué grupo de trabajo empresarial y qué aplicación deberían gobernar el resultado principal de cada capacidad
**No define todavía:** aplicaciones consumidoras, responsables humanos, permisos, tablas, integraciones, fuente de verdad definitiva ni implementación

---

#### 1. Resultado de esta tarea

Cada una de las 217 subcapacidades quedará asociada con:

1. un grupo estable de trabajo empresarial;
2. una aplicación propietaria candidata;
3. la razón empresarial de la candidatura;
4. el estado de certeza de la propuesta;
5. la frontera que la aplicación no deberá cruzar;
6. una pregunta específica cuando falte evidencia.

La palabra **candidata** significa que la asignación orienta el análisis y la remodelación, pero aún debe contrastarse con procesos, información e implementación en `CAP-MAP-005` a `CAP-MAP-015`.

---

#### 2. Definiciones en lenguaje directo

##### 2.1. Grupo de trabajo empresarial

Conjunto de capacidades que persiguen un mismo tipo de resultado.

Ejemplos:

- comprar y recibir de proveedores;
- controlar existencias;
- producir;
- vender y cobrar;
- gestionar personas;
- controlar costos.

En el plan podrá conservarse la palabra **dominio**, pero significará siempre este grupo de trabajo.

##### 2.2. Aplicación propietaria candidata

Aplicación propuesta para:

- crear o aceptar el registro principal;
- aplicar sus reglas;
- permitir su corrección autorizada;
- conservar su estado;
- explicar qué ocurrió con ese resultado.

No significa que toda la tarea humana ocurra dentro de esa aplicación.

##### 2.3. Aplicación consumidora

Aplicación que consulta, presenta o utiliza un resultado gobernado por otra.

Las consumidoras se identificarán en `CAP-MAP-005`; esta tarea solo evita confundirlas con la propietaria.

##### 2.4. Repositorio técnico

Lugar donde se conserva código, documentación, migraciones o paquetes.

`vento-shell` es un repositorio técnico. No es automáticamente la aplicación propietaria de todas las capacidades ni equivale a la aplicación SHELL.

---

#### 3. Prueba obligatoria para elegir una candidata

Una aplicación podrá proponerse como propietaria únicamente si obtiene respuestas favorables en estas preguntas:

1. ¿Su propósito canónico coincide con el resultado empresarial?
2. ¿Debe controlar el registro principal y no solo mostrarlo?
3. ¿Puede definir las reglas sin apropiarse de trabajo de otro grupo?
4. ¿Es el lugar lógico para corregir el resultado?
5. ¿Puede explicar su estado completo, parcial, cancelado o fallido?
6. ¿Evita que dos aplicaciones creen versiones independientes del mismo hecho?

Si las respuestas no son suficientes, la capacidad quedará pendiente o deberá dividirse por resultado.

---

#### 4. Estados de la candidatura

| Estado                       | Significado                                                                     |
| ---------------------------- | ------------------------------------------------------------------------------- |
| `CANDIDATA_FUERTE`           | el propósito canónico de la aplicación coincide claramente                      |
| `CANDIDATA_CON_FRONTERA`     | la aplicación es adecuada si se respeta un límite explícito                     |
| `CANDIDATA_DIFERIDA`         | existe una aplicación adecuada, pero su roadmap está diferido                   |
| `REQUIERE_DIVIDIR_RESULTADO` | una sola subcapacidad mezcla resultados que pertenecen a aplicaciones distintas |
| `PENDIENTE_DE_EVIDENCIA`     | falta observar dónde se crea, corrige o controla el resultado                   |
| `SIN_CANDIDATA_ADECUADA`     | ninguna aplicación actual cubre limpiamente el resultado                        |

`SIN_CANDIDATA_ADECUADA` no autoriza a crear una aplicación nueva. Solo registra una brecha.

---

#### 5. Catálogo de aplicaciones permitido

| Código   | Aplicación | Propósito canónico relevante                                                                             |
| -------- | ---------- | -------------------------------------------------------------------------------------------------------- |
| `shell`  | Vento OS   | entrada al ecosistema, navegación, selección y coordinación entre aplicaciones                           |
| `anima`  | ANIMA      | turnos, asistencia, entrada y salida, documentos e información personal del trabajador                   |
| `viso`   | VISO       | administración de trabajadores, roles, permisos, turnos, perfiles, sedes, áreas y auditoría de seguridad |
| `nexo`   | NEXO       | inventario, logística, remisiones, ubicaciones, conteos, activos, despacho y recepción                   |
| `fogo`   | FOGO       | producción, órdenes, lotes, recetas y ejecución productiva                                               |
| `origo`  | ORIGO      | compras, proveedores, órdenes de compra, recepción y abastecimiento                                      |
| `pulso`  | PULSO      | punto de venta, pedidos, ventas, pagos, salón, entregas, puntos y caja                                   |
| `numera` | NUMERA     | gastos, costos, rentabilidad, información financiera, reportes y centros de costo                        |
| `aura`   | AURA       | trabajo administrativo de comunicación y mercadeo; aplicación conservada pero diferida                   |
| `pass`   | Vento Pass | experiencia e identidad del cliente                                                                      |

No se crea ningún código adicional en esta tarea.

---

#### 6. Reglas que impiden propietarios falsos

1. SHELL no será propietaria por el solo hecho de enlazar a otras aplicaciones.
2. `vento-shell` no será tratado como aplicación.
3. Supabase no será tratado como aplicación propietaria empresarial.
4. Una pantalla que muestra información no se vuelve propietaria de esa información.
5. La aplicación donde una persona copia un dato no necesariamente gobierna el hecho original.
6. Una aplicación externa como Rappi o Shopify no se convierte automáticamente en propietaria de la capacidad empresarial.
7. Una capacidad no se duplicará por sede, dispositivo o forma de recibir pedidos.
8. Si dos aplicaciones necesitan el mismo resultado, una lo gobernará y la otra lo consumirá.
9. Si una subcapacidad produce dos resultados independientes, se marcará `REQUIERE_DIVIDIR_RESULTADO`.
10. La propiedad candidata no concede permisos ni acceso.

---

#### 7. Regla de cobertura para las 217 subcapacidades

Cada subcapacidad heredará la candidatura de su familia, salvo que aparezca en el apartado 9.

```text
CANDIDATURA DE LA SUBCAPACIDAD
=
CANDIDATURA BASE DE SU FAMILIA
+
EXCEPCIÓN ESPECÍFICA, SI EXISTE
```

Esta regla cubre las 217 subcapacidades sin repetir filas idénticas y permite consultar la candidatura de cualquiera de ellas.

---

#### 8. Mapa base por familia

| Familia                                          | Grupo de trabajo empresarial         | Aplicación candidata base         | Estado                       | Frontera principal                                                                            |
| ------------------------------------------------ | ------------------------------------ | --------------------------------- | ---------------------------- | --------------------------------------------------------------------------------------------- |
| `CAP-01` Dirigir y gobernar                      | gobierno organizacional              | `viso`                            | `CANDIDATA_CON_FRONTERA`     | VISO administra estructura y controles; no reemplaza decisiones de Gerencia                   |
| `CAP-02` Gestionar personas y trabajo            | personas y contexto laboral          | `viso`                            | `CANDIDATA_CON_FRONTERA`     | ANIMA gobierna registros personales y operativos indicados en las excepciones                 |
| `CAP-03` Salud, seguridad y cumplimiento         | seguridad y cumplimiento laboral     | `viso`                            | `CANDIDATA_CON_FRONTERA`     | no convierte a VISO en sistema fiscal, sanitario o de autoridades externas                    |
| `CAP-04` Productos, preparaciones y conocimiento | catálogo y conocimiento de producto  | `nexo`                            | `CANDIDATA_CON_FRONTERA`     | recetas y ejecución productiva pertenecen a FOGO                                              |
| `CAP-05` Abastecer la operación                  | compras y proveedores                | `origo`                           | `CANDIDATA_FUERTE`           | NEXO gobierna existencias después de la recepción aceptada                                    |
| `CAP-06` Inventario y almacenamiento             | existencias y logística interna      | `nexo`                            | `CANDIDATA_FUERTE`           | no gobierna compras, producción ni contabilidad                                               |
| `CAP-07` Activos y reutilizables                 | activos, custodia y equipos          | `nexo`                            | `CANDIDATA_CON_FRONTERA`     | mantenimiento detallado y soporte tecnológico requieren excepciones                           |
| `CAP-08` Producción                              | planificación y ejecución productiva | `fogo`                            | `CANDIDATA_FUERTE`           | NEXO conserva existencias; FOGO gobierna orden, lote y resultado producido                    |
| `CAP-09` Pedidos, ventas y cobro                 | venta y atención operativa           | `pulso`                           | `CANDIDATA_FUERTE`           | las plataformas externas son medios de entrada, no propietarias internas                      |
| `CAP-10` Clientes y relaciones                   | servicio y relación con clientes     | `pulso`                           | `CANDIDATA_CON_FRONTERA`     | PASS gobierna acciones realizadas directamente por el cliente                                 |
| `CAP-11` Transporte, despacho y entrega          | logística y entrega                  | `nexo`                            | `REQUIERE_DIVIDIR_RESULTADO` | traslado interno pertenece a NEXO; entrega al cliente pertenece a PULSO                       |
| `CAP-12` Dinero, costos y obligaciones           | finanzas y control económico         | `numera`                          | `CANDIDATA_CON_FRONTERA`     | PULSO gobierna la operación de caja y el pago de la venta                                     |
| `CAP-13` Instalaciones y condiciones             | instalaciones y mantenimiento        | `nexo`                            | `CANDIDATA_CON_FRONTERA`     | NEXO gobernaría el activo y la novedad, no necesariamente toda ejecución técnica              |
| `CAP-14` Comunicación y promoción                | comunicación y mercadeo              | `aura`                            | `CANDIDATA_DIFERIDA`         | PULSO gobierna aplicación de promociones dentro de la venta                                   |
| `CAP-15` Tecnología y soporte                    | tecnología empresarial               | sin candidata única               | `REQUIERE_DIVIDIR_RESULTADO` | accesos, activos, aplicaciones y soporte tienen propietarios diferentes                       |
| `CAP-16` Información, documentos y evidencia     | gobierno de información              | aplicación del resultado original | `REQUIERE_DIVIDIR_RESULTADO` | cada documento permanece con la aplicación que gobierna el hecho respaldado                   |
| `CAP-17` Medición, análisis y mejora             | análisis empresarial                 | `numera`                          | `CANDIDATA_CON_FRONTERA`     | cada aplicación de origen conserva sus hechos; NUMERA no debe recrearlos                      |
| `CAP-18` Continuidad e incidentes                | continuidad empresarial              | aplicación afectada               | `REQUIERE_DIVIDIR_RESULTADO` | SHELL coordina acceso y navegación, pero no se apropia de los datos de todas las aplicaciones |

---

#### 9. Excepciones específicas

##### 9.1. Gobierno y personas

| Subcapacidad              | Aplicación candidata   | Estado                   | Razón o frontera                                                                                     |
| ------------------------- | ---------------------- | ------------------------ | ---------------------------------------------------------------------------------------------------- |
| `CAP-01.01` y `CAP-01.02` | `viso`                 | `CANDIDATA_CON_FRONTERA` | conserva objetivos y decisiones; la decisión sigue siendo humana                                     |
| `CAP-01.03` y `CAP-01.04` | `viso`                 | `CANDIDATA_FUERTE`       | VISO ya gobierna sedes, áreas y estructura laboral                                                   |
| `CAP-01.09`               | sin candidata adecuada | `PENDIENTE_DE_EVIDENCIA` | las relaciones con autoridades y asesores no tienen aplicación canónica confirmada                   |
| `CAP-02.01` a `CAP-02.06` | `viso`                 | `CANDIDATA_FUERTE`       | administración de personal, asignaciones y programación                                              |
| `CAP-02.07`               | `anima`                | `CANDIDATA_FUERTE`       | ANIMA gobierna entrada, salida y registro de asistencia                                              |
| `CAP-02.08` a `CAP-02.10` | `viso`                 | `CANDIDATA_CON_FRONTERA` | VISO administra la novedad y seguimiento; ANIMA puede ser superficie personal                        |
| `CAP-02.11`               | `anima`                | `CANDIDATA_CON_FRONTERA` | documentos personales del trabajador; los documentos administrativos se consultarán en `CAP-MAP-005` |
| `CAP-02.12`               | `numera`               | `PENDIENTE_DE_EVIDENCIA` | pagos y beneficios laborales requieren confirmar alcance real de NUMERA                              |
| `CAP-02.13`               | `viso`                 | `CANDIDATA_CON_FRONTERA` | VISO gobierna cierre laboral y permisos; cada aplicación ejecuta el cierre de sus accesos            |

##### 9.2. Cumplimiento, productos y compras

| Subcapacidad              | Aplicación candidata | Estado                       | Razón o frontera                                                                  |
| ------------------------- | -------------------- | ---------------------------- | --------------------------------------------------------------------------------- |
| `CAP-03.01` a `CAP-03.10` | `viso`               | `CANDIDATA_CON_FRONTERA`     | registro administrativo de riesgos, inspecciones y acciones                       |
| `CAP-04.01` a `CAP-04.04` | `nexo`               | `CANDIDATA_FUERTE`           | catálogo, presentación, clasificación, ingredientes y componentes                 |
| `CAP-04.05` y `CAP-04.06` | `fogo`               | `CANDIDATA_FUERTE`           | receta, método, rendimiento y porción productiva                                  |
| `CAP-04.07`               | `pulso`              | `CANDIDATA_CON_FRONTERA`     | PULSO gobierna oferta vendible y disponibilidad mostrada durante la venta         |
| `CAP-04.08` y `CAP-04.09` | `nexo`               | `CANDIDATA_CON_FRONTERA`     | especificación maestra; FOGO aplica controles durante producción                  |
| `CAP-04.10`               | `nexo`               | `REQUIERE_DIVIDIR_RESULTADO` | catálogo en NEXO y recetas en FOGO requieren vigencias coordinadas, no duplicadas |
| `CAP-05.01` a `CAP-05.12` | `origo`              | `CANDIDATA_FUERTE`           | ciclo completo de abastecimiento y proveedor                                      |

##### 9.3. Inventario, activos y producción

| Subcapacidad              | Aplicación candidata | Estado                   | Razón o frontera                                                            |
| ------------------------- | -------------------- | ------------------------ | --------------------------------------------------------------------------- |
| `CAP-06.01` a `CAP-06.15` | `nexo`               | `CANDIDATA_FUERTE`       | lugares, existencias, movimientos, remisiones, conteos y diferencias        |
| `CAP-07.01` a `CAP-07.06` | `nexo`               | `CANDIDATA_FUERTE`       | identificación, ubicación, custodia, transferencia y conteo                 |
| `CAP-07.07` a `CAP-07.10` | `nexo`               | `CANDIDATA_CON_FRONTERA` | NEXO gobierna activo, necesidad y estado; la reparación puede ser externa   |
| `CAP-07.11` a `CAP-07.13` | `nexo`               | `CANDIDATA_FUERTE`       | kits, vehículos, combustible, kilometraje y disponibilidad                  |
| `CAP-08.01` a `CAP-08.14` | `fogo`               | `CANDIDATA_FUERTE`       | necesidad, orden, lote, ejecución, rendimiento, calidad y cierre productivo |

##### 9.4. Ventas, clientes y entregas

| Subcapacidad              | Aplicación candidata           | Estado                       | Razón o frontera                                                                   |
| ------------------------- | ------------------------------ | ---------------------------- | ---------------------------------------------------------------------------------- |
| `CAP-09.01` a `CAP-09.15` | `pulso`                        | `CANDIDATA_FUERTE`           | oferta de venta, pedido, preparación comercial, cobro y cierre                     |
| `CAP-10.01` a `CAP-10.07` | `pulso`                        | `CANDIDATA_CON_FRONTERA`     | relación operacional con el cliente y beneficios asociados a ventas                |
| `CAP-10.08` y `CAP-10.09` | `pulso`                        | `CANDIDATA_FUERTE`           | reservas, eventos y comunicación que afecta pedidos vigentes                       |
| `CAP-10.10`               | `pass`                         | `REQUIERE_DIVIDIR_RESULTADO` | PASS protege identidad del cliente; PULSO protege datos usados en la venta         |
| `CAP-11.01` a `CAP-11.06` | `nexo`                         | `CANDIDATA_CON_FRONTERA`     | planificación, carga y custodia logística antes de entrega                         |
| `CAP-11.07` a `CAP-11.11` | `nexo` o `pulso` según destino | `REQUIERE_DIVIDIR_RESULTADO` | NEXO para recorrido entre lugares; PULSO para entrega asociada a pedido de cliente |
| `CAP-11.12`               | `pulso`                        | `CANDIDATA_CON_FRONTERA`     | PULSO conserva el pedido y resultado de entrega aunque intervenga un tercero       |

##### 9.5. Finanzas, instalaciones y mercadeo

| Subcapacidad              | Aplicación candidata | Estado                   | Razón o frontera                                                              |
| ------------------------- | -------------------- | ------------------------ | ----------------------------------------------------------------------------- |
| `CAP-12.01`               | `numera`             | `CANDIDATA_FUERTE`       | registro y clasificación del hecho económico                                  |
| `CAP-12.02`               | `pulso`              | `CANDIDATA_FUERTE`       | apertura, operación, arqueo y cierre de caja                                  |
| `CAP-12.03` a `CAP-12.15` | `numera`             | `CANDIDATA_CON_FRONTERA` | finanzas, obligaciones, conciliaciones, costos, cierres y rentabilidad        |
| `CAP-13.01` a `CAP-13.11` | `nexo`               | `CANDIDATA_CON_FRONTERA` | inventario de espacios, solicitudes, estado y cierre de novedades             |
| `CAP-14.01` a `CAP-14.05` | `aura`               | `CANDIDATA_DIFERIDA`     | identidad, contenido, medios y campañas; no habilita implementación inmediata |
| `CAP-14.06`               | `pulso`              | `CANDIDATA_CON_FRONTERA` | PULSO aplica cupón o promoción a la venta; AURA conserva intención de campaña |
| `CAP-14.07` a `CAP-14.11` | `aura`               | `CANDIDATA_DIFERIDA`     | oportunidades, ventas empresariales, eventos, medición y reputación           |

##### 9.6. Tecnología, información, análisis y continuidad

| Subcapacidad              | Aplicación candidata            | Estado                       | Razón o frontera                                                                                              |
| ------------------------- | ------------------------------- | ---------------------------- | ------------------------------------------------------------------------------------------------------------- |
| `CAP-15.01`               | `viso`                          | `CANDIDATA_FUERTE`           | VISO gobierna roles, permisos y accesos laborales                                                             |
| `CAP-15.02` a `CAP-15.04` | `nexo`                          | `CANDIDATA_CON_FRONTERA`     | inventario y ubicación de equipos; soporte y configuración no pertenecen automáticamente a NEXO               |
| `CAP-15.05`               | `shell`                         | `CANDIDATA_CON_FRONTERA`     | SHELL gobierna catálogo y navegación, no contratos ni funcionamiento interno de cada aplicación               |
| `CAP-15.06` a `CAP-15.09` | sin candidata adecuada          | `SIN_CANDIDATA_ADECUADA`     | solicitudes, incidentes, cambios y pruebas tecnológicas necesitan decisión posterior                          |
| `CAP-15.10`               | `numera`                        | `REQUIERE_DIVIDIR_RESULTADO` | NUMERA gobierna costo; contratos y licencias requieren soporte documental adicional                           |
| `CAP-15.11`               | `viso`                          | `PENDIENTE_DE_EVIDENCIA`     | capacitación administrativa candidata; debe confirmarse cómo se registra actualmente                          |
| `CAP-16.01` a `CAP-16.11` | aplicación del hecho respaldado | `REQUIERE_DIVIDIR_RESULTADO` | el documento de compra queda con ORIGO, el laboral con ANIMA/VISO, el productivo con FOGO y así sucesivamente |
| `CAP-17.01` a `CAP-17.04` | `numera`                        | `CANDIDATA_CON_FRONTERA`     | definición, recopilación validada, reporte y análisis transversal                                             |
| `CAP-17.05`               | `pulso` + `numera`              | `REQUIERE_DIVIDIR_RESULTADO` | PULSO gobierna ventas; NUMERA gobierna análisis consolidado                                                   |
| `CAP-17.06`               | `nexo` + `numera`               | `REQUIERE_DIVIDIR_RESULTADO` | NEXO gobierna existencias; NUMERA analiza efecto económico                                                    |
| `CAP-17.07`               | `fogo` + `numera`               | `REQUIERE_DIVIDIR_RESULTADO` | FOGO gobierna producción; NUMERA analiza costo y rendimiento consolidado                                      |
| `CAP-17.08`               | `pulso`                         | `CANDIDATA_CON_FRONTERA`     | servicio y clientes; NUMERA podrá consumir medidas consolidadas                                               |
| `CAP-17.09`               | `numera`                        | `CANDIDATA_FUERTE`           | costos y rentabilidad                                                                                         |
| `CAP-17.10` a `CAP-17.12` | `numera`                        | `CANDIDATA_CON_FRONTERA`     | seguimiento transversal sin apropiarse de los hechos operativos                                               |
| `CAP-18.01` a `CAP-18.12` | aplicación afectada             | `REQUIERE_DIVIDIR_RESULTADO` | cada aplicación recupera y reconcilia su información; SHELL solo coordina acceso cuando corresponda           |

---

#### 10. Qué significa `REQUIERE_DIVIDIR_RESULTADO`

No implica crear dos copias del mismo registro.

Ejemplos:

```text
Venta confirmada
→ PULSO gobierna pedido, pago y entrega

Ingreso y rentabilidad resultantes
→ NUMERA gobierna clasificación y análisis financiero
```

```text
Producción terminada
→ FOGO gobierna orden, lote y rendimiento

Existencia disponible
→ NEXO gobierna cantidad y ubicación después de recibir el resultado
```

La separación exacta de información y eventos se realizará en `CAP-MAP-007` a `CAP-MAP-009`.

---

#### 11. Registro mínimo de cada candidatura

| Campo                       | Contenido                                         |
| --------------------------- | ------------------------------------------------- |
| Código de subcapacidad      | identificador canónico                            |
| Grupo de trabajo            | resultado empresarial al que pertenece            |
| Aplicación candidata        | un código del catálogo o estado sin candidata     |
| Registro principal esperado | hecho que debería gobernar                        |
| Razón                       | por qué coincide con el propósito canónico        |
| Frontera                    | qué no debe gobernar                              |
| Estado                      | valor del apartado 4                              |
| Evidencia                   | documento, pantalla, observación o regla aprobada |
| Duda                        | pregunta puntual pendiente                        |
| Destino                     | tarea que resolverá la duda                       |

---

#### 12. Dudas que permanecen visibles

| Código         | Duda concreta                                                               | Quién puede responder                                   | Evidencia esperada                         | Destino                      |
| -------------- | --------------------------------------------------------------------------- | ------------------------------------------------------- | ------------------------------------------ | ---------------------------- |
| `D-CAP004-001` | ¿Dónde se registra actualmente una decisión de Gerencia y dónde se corrige? | Gerencia o auxiliar administrativa                      | nombre del documento, carpeta o pantalla   | `CAP-MAP-005`, `CAP-MAP-008` |
| `D-CAP004-002` | ¿Dónde se calcula y conserva actualmente el pago laboral?                   | Contabilidad                                            | nombre del archivo, proveedor o aplicación | `CAP-MAP-005`, `CAP-MAP-008` |
| `D-CAP004-003` | ¿Dónde se guardan inspecciones y acciones de seguridad?                     | responsable SST o Gerencia                              | formato o ubicación usada                  | `CAP-MAP-005`                |
| `D-CAP004-004` | ¿Cómo se separa hoy un traslado entre sedes de una entrega al cliente?      | despachador, domiciliario o cajero                      | ejemplo de ambos registros                 | `CAP-MAP-007`, `CAP-MAP-009` |
| `D-CAP004-005` | ¿Dónde se recibe, asigna y cierra una solicitud de soporte tecnológico?     | persona que atiende soporte                             | nombre del chat, papel o herramienta       | `CAP-MAP-005`                |
| `D-CAP004-006` | ¿Quién puede corregir un documento cuando contiene un error?                | trabajador que crea el documento y responsable del área | ejemplo sin datos sensibles                | `CAP-MAP-006`                |
| `D-CAP004-007` | ¿Qué parte de AURA existe y se usa actualmente?                             | Gerencia o Mercadeo                                     | nombre de ruta, pantalla o tarea utilizada | auditoría de AURA            |
| `D-CAP004-008` | ¿Qué se hace en cada aplicación cuando deja de funcionar?                   | trabajador usuario de la aplicación                     | pasos observados durante una falla         | `CAP-MAP-015`                |

Estas dudas no se eliminan al aprobar la candidatura. Se conservan hasta obtener evidencia.

##### 12.1. Lista acumulada de preguntas dirigidas al usuario

Las dudas que requieran una decisión o confirmación directa del usuario se marcarán como `RESPONDE_USUARIO` durante `CAP-MAP-004` a `CAP-MAP-015`.

Al cerrar `CAP-MAP-015`, y antes de avanzar a la etapa siguiente, se entregará una sola lista consolidada con estas reglas:

1. cada número contendrá una sola duda;
2. cada duda admitirá una sola respuesta;
3. se indicará el formato esperado: `SÍ/NO`, una opción, un nombre, una fecha, un número o una frase corta;
4. no se mezclarán dos decisiones en la misma pregunta;
5. las preguntas para trabajadores, Contabilidad u otros responsables permanecerán en listas separadas;
6. ninguna pregunta respondida desaparecerá: respuesta, fecha y decisión resultante quedarán registradas en el plan.

---

#### 13. Autocuestionario para trabajadores

Se enviará un bloque separado por cada trabajo que la persona realice.

```text
CAP004-USO — [NOMBRE DEL TRABAJO]

Ejemplo del nombre del trabajo:
“Recibir una compra de proveedor” o “Cerrar la caja”.

Cuando haces este trabajo, ¿dónde escribes la información POR PRIMERA VEZ?

Marca UNA:
[ ] En ANIMA
[ ] En VISO
[ ] En NEXO
[ ] En FOGO
[ ] En ORIGO
[ ] En PULSO
[ ] En NUMERA
[ ] En AURA
[ ] En Vento Pass
[ ] En WhatsApp
[ ] En una hoja de cálculo
[ ] En papel
[ ] No escribo nada
[ ] En otro lugar
[ ] NO SÉ

Si marcaste “otro lugar”, escribe el nombre que ves:
________________________________

Si cometiste un error, ¿dónde lo corriges?
________________________________

¿En qué lugar miras para saber si el trabajo quedó terminado?
________________________________

Si debes copiar lo mismo en otro lugar, escribe dónde:
________________________________

Ejemplo:
“El pedido llega por WhatsApp, lo registro en PULSO y miro en PULSO si quedó pagado”.

No envíes nombres de clientes, contraseñas, números de tarjeta ni información
privada.
```

---

#### 14. Autocuestionario para responsable del área

```text
CAP004-CONTROL — [NOMBRE DEL RESULTADO]

Ejemplo:
“Compra recibida”, “lote terminado”, “venta pagada” o “turno trabajado”.

Para confirmar que [NOMBRE DEL RESULTADO] es correcto, ¿qué revisas?

Marca TODAS:
[ ] Una pantalla o aplicación
[ ] Un documento
[ ] Un mensaje
[ ] Una hoja de cálculo
[ ] Un papel
[ ] Pregunto a otra persona
[ ] No existe una revisión definida
[ ] NO SÉ

Nombre exacto de la pantalla, documento o archivo:
________________________________

Si está incorrecto, ¿quién solicita la corrección?
Escribe el cargo, no el nombre de la persona:
________________________________

¿Dónde se hace la corrección?
________________________________

¿Qué señal te permite saber que ya quedó corregido?
________________________________
```

---

#### 15. Regla para resolver contradicciones

Si dos personas indican aplicaciones distintas:

1. no se escogerá la respuesta del cargo más alto automáticamente;
2. se comparará dónde nace el registro;
3. se verificará dónde se corrige;
4. se comprobará cuál conserva el estado final;
5. se registrará si existe una copia manual;
6. se marcará la candidatura como `PENDIENTE_DE_EVIDENCIA` hasta reconciliarla.

La aplicación más visible no necesariamente será la propietaria.

---

#### 16. Lo que queda decidido

1. Las 217 subcapacidades tienen una candidatura consultable mediante familia más excepción.
2. ORIGO es candidata principal para compras y proveedores.
3. NEXO es candidata principal para inventario, logística interna y activos.
4. FOGO es candidata principal para producción.
5. PULSO es candidata principal para pedidos, ventas, caja y entrega al cliente.
6. NUMERA es candidata principal para finanzas, costos y análisis económico.
7. VISO y ANIMA quedan separados entre administración laboral y registro personal u operativo.
8. AURA conserva la candidatura de mercadeo, pero permanece diferida.
9. PASS se limita a resultados gobernados directamente por la identidad o acción del cliente.
10. SHELL se limita a entrada, navegación y coordinación; no hereda todos los dominios.
11. Documentos, análisis y continuidad conservan propiedad por resultado y no por conveniencia.
12. Toda candidatura incierta mantiene una duda y una guía concreta para resolverla.
13. Esta tarea no cambia código, datos, permisos ni aplicaciones.

---

#### 17. Criterios de aceptación

`CAP-MAP-004` podrá aprobarse cuando:

- grupo de trabajo, aplicación, repositorio y aplicación consumidora estén separados;
- todas las subcapacidades tengan candidatura o estado explícito;
- las candidaturas respeten el catálogo canónico;
- SHELL y `vento-shell` no se confundan;
- las fronteras ANIMA/VISO, NEXO/FOGO, ORIGO/NEXO, PULSO/NUMERA y NEXO/PULSO estén documentadas;
- no se haya creado una aplicación nueva para ocultar una brecha;
- las candidaturas inciertas tengan una pregunta observable;
- `CAP-MAP-005` permanezca como única continuidad inmediata.

---

#### 18. Resultado y continuidad

Con la aprobación quedará una primera distribución de propiedad funcional para orientar la auditoría de sistemas y la remodelación, sin convertirla todavía en arquitectura definitiva.

La continuidad será exclusivamente:

```text
CAP-MAP-005
— Definir aplicaciones y sistemas consumidores
```

`CAP-MAP-005` identificará qué otras aplicaciones, plataformas, archivos o personas necesitan consultar o utilizar cada resultado sin duplicar su propiedad.


### ✅ CAP-MAP-005 — Definir aplicaciones y sistemas consumidores

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Dependencias cumplidas:** `CAP-MAP-001` a `CAP-MAP-004`
**Propósito:** identificar qué aplicaciones, plataformas o medios necesitan consultar o utilizar el resultado de cada capacidad sin duplicar su propiedad
**No define todavía:** responsables humanos, información exacta intercambiada, fuente de verdad, integraciones, permisos, funcionamiento sin conexión ni implementación

---

#### 1. Resultado de esta tarea

Cada una de las 217 subcapacidades quedará relacionada con:

1. su aplicación propietaria candidata definida en `CAP-MAP-004`;
2. las aplicaciones VENTO que necesitan utilizar su resultado;
3. las plataformas externas que intervienen;
4. los archivos, mensajes o papeles que actualmente actúan como medios auxiliares;
5. el motivo por el cual cada consumidor necesita el resultado;
6. el estado de certeza del vínculo;
7. una pregunta concreta cuando el consumidor actual no esté confirmado.

Esta tarea identifica necesidades de uso. No autoriza copias, accesos ni integraciones.

---

#### 2. Qué es un consumidor

Un consumidor es una aplicación, plataforma o medio que necesita un resultado producido y gobernado en otro lugar.

Ejemplos:

```text
ORIGO gobierna una compra recibida
→ NEXO necesita conocer qué producto fue aceptado para registrar existencias
→ NUMERA necesita conocer la obligación económica
```

```text
PULSO gobierna una venta
→ NEXO necesita conocer la salida de existencias
→ NUMERA necesita conocer el ingreso y el pago
```

Consumir no significa convertirse en propietario ni poder corregir directamente el registro original.

---

#### 3. Elementos que no son consumidores

No se registrarán como consumidores:

- una persona o cargo; se tratará en `CAP-MAP-006`;
- una tabla de base de datos;
- una biblioteca de código;
- un repositorio;
- Supabase por el solo hecho de almacenar información;
- una pantalla dentro de la misma aplicación propietaria;
- una copia de respaldo;
- una sede o área;
- un dispositivo;
- una impresión que solo reproduce información para consulta momentánea.

Un papel, archivo o chat sí se registrará cuando actualmente sea necesario para que otra parte del trabajo continúe.

---

#### 4. Tipos de consumidor

| Tipo                  | Significado                                                                             |
| --------------------- | --------------------------------------------------------------------------------------- |
| `VENTO_INTERNO`       | otra aplicación del catálogo VENTO                                                      |
| `EXTERNO_COMERCIAL`   | plataforma de pedidos, venta, mensajería o relación con clientes                        |
| `EXTERNO_EMPRESARIAL` | sistema de banco, autoridad, proveedor, asesor u otro tercero                           |
| `MEDIO_MANUAL`        | WhatsApp, hoja de cálculo, archivo, carpeta o papel utilizado para continuar el trabajo |
| `SIN_CONSUMIDOR`      | el resultado puede permanecer únicamente en su propietaria                              |
| `POR_CONFIRMAR`       | existe una necesidad probable, pero no hay evidencia suficiente                         |

---

#### 5. Estados del vínculo

| Estado                     | Significado                                                                   |
| -------------------------- | ----------------------------------------------------------------------------- |
| `CONFIRMADO_ACTUAL`        | existe evidencia de que el consumidor se usa hoy                              |
| `OBSERVADO_PARCIAL`        | se conoce el consumidor, pero no el alcance completo                          |
| `CANDIDATO_OBJETIVO`       | el consumidor se propone para el modelo futuro                                |
| `TEMPORAL_HASTA_REEMPLAZO` | medio actual que deberá conservarse durante una transición                    |
| `PENDIENTE_DE_EVIDENCIA`   | falta una respuesta u observación                                             |
| `NO_APLICA`                | no necesita consumir ese resultado                                            |
| `NO_AUTORIZADO_A_DUPLICAR` | puede consultar el resultado, pero no crear una segunda versión independiente |

Un mismo vínculo podrá tener estado actual y estado objetivo separados.

---

#### 6. Catálogo inicial de posibles consumidores

##### 6.1. Aplicaciones VENTO

| Código   | Aplicación |
| -------- | ---------- |
| `shell`  | Vento OS   |
| `anima`  | ANIMA      |
| `viso`   | VISO       |
| `nexo`   | NEXO       |
| `fogo`   | FOGO       |
| `origo`  | ORIGO      |
| `pulso`  | PULSO      |
| `numera` | NUMERA     |
| `aura`   | AURA       |
| `pass`   | Vento Pass |

##### 6.2. Plataformas y medios ya observados

| Código provisional | Nombre                                              | Clasificación                                                  |
| ------------------ | --------------------------------------------------- | -------------------------------------------------------------- |
| `EXT-RAPPI`        | Rappi                                               | plataforma externa de pedidos y entrega                        |
| `EXT-SHOPIFY`      | Shopify                                             | plataforma externa de comercio                                 |
| `EXT-MANYCHAT`     | ManyChat                                            | mensajería o automatización comercial                          |
| `MED-WHATSAPP`     | WhatsApp                                            | mensajería utilizada para solicitudes y coordinación           |
| `LEG-MAKOS`        | Makos                                               | sistema operativo actual mencionado en respuestas y documentos |
| `MED-HOJA`         | hoja de cálculo                                     | medio manual estructurado                                      |
| `MED-PAPEL`        | papel, comanda o formato impreso                    | medio manual físico                                            |
| `MED-ARCHIVO`      | archivo o carpeta compartida                        | medio documental                                               |
| `EXT-BANCO`        | banco o portal bancario por identificar             | sistema empresarial externo                                    |
| `EXT-AUTORIDAD`    | portal o medio de una autoridad por identificar     | sistema empresarial externo                                    |
| `EXT-PROVEEDOR`    | portal, correo o medio de proveedor por identificar | sistema empresarial externo                                    |

La presencia en esta lista no demuestra uso activo. Cada vínculo necesita su propio estado.

---

#### 7. Regla de consumo mínimo

Un consumidor solo deberá recibir lo necesario para continuar su propio trabajo.

Para cada vínculo deberá responderse:

1. ¿Qué resultado necesita?
2. ¿Para qué lo necesita?
3. ¿Necesita verlo o actuar a partir de él?
4. ¿Debe conocer cambios posteriores?
5. ¿Qué ocurriría si no lo recibe?
6. ¿Puede consultar el original o necesita una copia controlada?

Los campos exactos se definirán en `CAP-MAP-007` y las comunicaciones en `CAP-MAP-009`.

---

#### 8. Regla de cobertura de las 217 subcapacidades

Cada subcapacidad heredará los consumidores base de su familia, salvo que aparezca en el apartado 10.

```text
CONSUMIDORES DE LA SUBCAPACIDAD
=
CONSUMIDORES BASE DE LA FAMILIA
+
EXCEPCIONES ESPECÍFICAS
```

Un consumidor base no recibirá automáticamente todos los datos de la familia. Solo declara una necesidad empresarial que deberá detallarse posteriormente.

---

#### 9. Mapa base por familia

| Familia                           | Propietaria candidata           | Consumidores VENTO candidatos                                                            | Externos o medios por confirmar                      | Motivo principal                                             |
| --------------------------------- | ------------------------------- | ---------------------------------------------------------------------------------------- | ---------------------------------------------------- | ------------------------------------------------------------ |
| `CAP-01` Gobierno                 | `viso`                          | `shell` y aplicaciones afectadas por la regla                                            | documentos, archivos o actas actuales                | aplicar estructura, decisiones y límites vigentes            |
| `CAP-02` Personas                 | `viso` / `anima`                | aplicaciones que requieren contexto laboral: `nexo`, `fogo`, `origo`, `pulso` y `numera` | archivos laborales actuales                          | conocer vinculación, sede, área, turno o novedad necesaria   |
| `CAP-03` Seguridad y cumplimiento | `viso`                          | `anima` y aplicación del área afectada                                                   | formatos, documentos y portales de autoridad         | prevenir, reportar y demostrar cumplimiento                  |
| `CAP-04` Productos y conocimiento | `nexo` / `fogo` / `pulso`       | `origo`, `nexo`, `fogo`, `pulso`, `aura` y `pass` cuando aplique                         | Rappi, Shopify, ManyChat y Makos                     | comprar, producir, ofrecer y vender el mismo producto        |
| `CAP-05` Compras                  | `origo`                         | `nexo` y `numera`; `fogo` cuando la necesidad nazca de producción                        | proveedor, WhatsApp, hoja o documento                | recibir existencias y reconocer obligación económica         |
| `CAP-06` Inventario               | `nexo`                          | `origo`, `fogo`, `pulso` y `numera`                                                      | Makos, hojas, papel o WhatsApp actuales              | conocer disponibilidad, consumo, traslado y valor            |
| `CAP-07` Activos                  | `nexo`                          | `viso` y `numera`                                                                        | archivos, hojas y proveedores de mantenimiento       | conocer custodia, disponibilidad, costo y condición          |
| `CAP-08` Producción               | `fogo`                          | `nexo`, `pulso` y `numera`                                                               | hojas, papel y WhatsApp actuales                     | actualizar existencias, disponibilidad de venta y costo      |
| `CAP-09` Ventas                   | `pulso`                         | `nexo`, `fogo`, `numera`, `aura` y `pass` cuando aplique                                 | Rappi, Shopify, ManyChat, WhatsApp y Makos           | preparar, descontar existencias, cobrar, entregar y analizar |
| `CAP-10` Clientes                 | `pulso` / `pass`                | `aura` y aplicaciones que atiendan una solicitud autorizada                              | Rappi, Shopify, ManyChat y WhatsApp                  | atender, comunicar y conservar preferencias autorizadas      |
| `CAP-11` Entregas                 | `nexo` / `pulso`                | `numera` y la aplicación propietaria del pedido o traslado                               | Rappi, mensajería y WhatsApp                         | confirmar custodia, recepción, devolución y costo            |
| `CAP-12` Finanzas                 | `numera` / `pulso`              | `viso` y aplicaciones que deban conocer aprobación o conciliación                        | bancos, autoridades, hojas y archivos                | pagar, conciliar, controlar costos y reportar                |
| `CAP-13` Instalaciones            | `nexo`                          | `viso` y `numera`                                                                        | proveedores, WhatsApp, hojas y formatos              | atender riesgos, reparaciones, servicios y costos            |
| `CAP-14` Mercadeo                 | `aura` / `pulso`                | `pass`, `pulso` y `numera` para resultados autorizados                                   | Rappi, Shopify, ManyChat, WhatsApp y medios públicos | publicar, aplicar promoción y medir resultado                |
| `CAP-15` Tecnología               | propietaria según resultado     | `shell`, `viso`, `nexo` y aplicación afectada                                            | WhatsApp, hojas, archivos y proveedores              | administrar acceso, activo, solicitud, falla o cambio        |
| `CAP-16` Información              | aplicación del hecho respaldado | consumidores autorizados del mismo hecho                                                 | archivos, carpetas, correo, papel y autoridades      | conservar, localizar y compartir evidencia necesaria         |
| `CAP-17` Análisis                 | `numera` y aplicación del hecho | `viso`, `aura` y aplicación del área evaluada                                            | hojas y reportes actuales                            | convertir hechos confiables en decisiones y mejoras          |
| `CAP-18` Continuidad              | aplicación afectada             | `shell` y aplicaciones dependientes                                                      | WhatsApp, papel, hojas y respaldos autorizados       | operar durante una falla y reconciliar lo ocurrido           |

---

#### 10. Excepciones y fronteras específicas

##### 10.1. Personas y contexto laboral

| Subcapacidades            | Consumidor                                 | Necesidad                                         | Frontera                                                  |
| ------------------------- | ------------------------------------------ | ------------------------------------------------- | --------------------------------------------------------- |
| `CAP-02.05` y `CAP-02.06` | `anima`                                    | mostrar asignación y turno al trabajador          | ANIMA no redefine la asignación aprobada en VISO          |
| `CAP-02.07`               | `viso`                                     | revisar asistencia y novedades                    | VISO consulta o administra; no crea una segunda marcación |
| `CAP-02.07` y `CAP-02.08` | aplicaciones operativas                    | comprobar contexto laboral cuando sea obligatorio | no reciben historia laboral completa                      |
| `CAP-02.12`               | `numera`                                   | calcular o registrar efecto económico laboral     | alcance actual `PENDIENTE_DE_EVIDENCIA`                   |
| `CAP-02.13`               | todas las aplicaciones laborales afectadas | cerrar accesos correspondientes                   | cada aplicación conserva su autorización interna          |

##### 10.2. Producto, compra, inventario y producción

| Subcapacidades            | Consumidor                                       | Necesidad                                                                 | Frontera                                      |
| ------------------------- | ------------------------------------------------ | ------------------------------------------------------------------------- | --------------------------------------------- |
| `CAP-04.01` a `CAP-04.04` | `origo`, `fogo` y `pulso`                        | usar identificación, presentación y componentes coherentes                | no crean catálogos independientes             |
| `CAP-04.05` y `CAP-04.06` | `nexo` y `numera`                                | conocer componentes, rendimiento y efecto sobre existencias o costo       | no modifican la receta                        |
| `CAP-04.07`               | Rappi, Shopify, ManyChat y otros medios de venta | mostrar oferta disponible                                                 | reciben solo oferta autorizada para ese medio |
| `CAP-05.07` a `CAP-05.10` | `nexo`                                           | preparar y registrar recepción aceptada                                   | NEXO no aprueba ni corrige la compra          |
| `CAP-05.08` a `CAP-05.12` | `numera`                                         | reconocer obligación, diferencia o devolución                             | NUMERA no altera cantidades recibidas         |
| `CAP-06.05`               | `origo`, `fogo` y `pulso`                        | consultar disponibilidad necesaria para comprar, producir o vender        | consulta no equivale a reserva                |
| `CAP-06.07` a `CAP-06.11` | `fogo`, `pulso` o `numera` según origen          | conocer consumo, salida o traslado confirmado                             | no recrean el movimiento                      |
| `CAP-08.08` a `CAP-08.14` | `nexo`                                           | recibir cantidad liberada, consumos y diferencias que afectan existencias | NEXO no modifica el lote productivo           |
| `CAP-08.09` y `CAP-08.14` | `numera`                                         | calcular costo y rendimiento consolidado                                  | NUMERA no sustituye el cierre productivo      |

##### 10.3. Venta, cliente y entrega

| Subcapacidades            | Consumidor                                             | Necesidad                                                            | Frontera                                                 |
| ------------------------- | ------------------------------------------------------ | -------------------------------------------------------------------- | -------------------------------------------------------- |
| `CAP-09.02` a `CAP-09.05` | Rappi, Shopify, ManyChat o WhatsApp cuando sean origen | enviar solicitud y recibir confirmación correspondiente              | la plataforma externa no crea una venta interna paralela |
| `CAP-09.06` y `CAP-09.07` | `fogo` o pantalla de preparación que se confirme       | conocer qué debe prepararse y su prioridad                           | no cobra ni modifica condiciones comerciales             |
| `CAP-09.08` y `CAP-09.09` | `numera`                                               | reconocer venta, ingreso y pago confirmados                          | NUMERA no reabre la caja                                 |
| `CAP-09.08`               | `nexo`                                                 | registrar efecto confirmado sobre existencias                        | no recrea el pedido                                      |
| `CAP-09.13`               | Rappi, Shopify, ManyChat y WhatsApp                    | intercambiar estados necesarios del pedido                           | cada medio se valida separadamente                       |
| `CAP-09.14`               | `aura` y `numera`                                      | seguimiento comercial y económico de empresa, evento o catering      | no administran la ejecución del pedido                   |
| `CAP-10.01` y `CAP-10.02` | `pass`                                                 | permitir al cliente administrar información y autorizaciones propias | no expone notas internas ni datos laborales              |
| `CAP-10.03` a `CAP-10.09` | medio por el cual llegó la solicitud                   | responder por el mismo medio cuando sea necesario                    | la respuesta oficial permanece asociada al caso interno  |
| `CAP-11.07` a `CAP-11.12` | aplicación propietaria del pedido o traslado           | conocer estado, recepción y novedad                                  | no cambia la custodia sin confirmación                   |
| `CAP-11.12`               | Rappi u otro tercero                                   | recibir datos mínimos de entrega y devolver resultado                | no recibe información financiera o personal innecesaria  |

##### 10.4. Finanzas, mercadeo y análisis

| Subcapacidades            | Consumidor                                           | Necesidad                                                   | Frontera                                                 |
| ------------------------- | ---------------------------------------------------- | ----------------------------------------------------------- | -------------------------------------------------------- |
| `CAP-12.02`               | `numera`                                             | conocer cierres y diferencias confirmadas de caja           | no opera la caja                                         |
| `CAP-12.04` y `CAP-12.05` | banco, proveedor o cliente cuando corresponda        | emitir o recibir pago y confirmación                        | intercambio externo sujeto a autorización posterior      |
| `CAP-12.07`               | `pulso` y medios de venta                            | resolver diferencias entre pedido, venta, pago y entrega    | la conciliación no reescribe el pedido sin procedimiento |
| `CAP-12.08`               | `origo` y `nexo`                                     | resolver diferencias entre compra, recepción y obligación   | NUMERA conserva la conciliación económica                |
| `CAP-12.13`               | autoridad aplicable                                  | presentar información obligatoria                           | contenido y método pendientes de evidencia               |
| `CAP-14.03` a `CAP-14.06` | Rappi, Shopify, ManyChat, WhatsApp y medios públicos | publicar contenido o aplicar promoción                      | solo reciben versión aprobada y vigente                  |
| `CAP-14.10`               | `numera` y `pulso`                                   | comparar gasto, ventas y resultado promocional              | AURA no recrea ventas ni costos                          |
| `CAP-17.05` a `CAP-17.09` | `numera`                                             | consolidar hechos de PULSO, NEXO, FOGO y otras propietarias | conserva referencia al hecho original                    |

##### 10.5. Tecnología, documentos y continuidad

| Subcapacidades            | Consumidor                                           | Necesidad                                 | Frontera                                              |
| ------------------------- | ---------------------------------------------------- | ----------------------------------------- | ----------------------------------------------------- |
| `CAP-15.01`               | cada aplicación laboral                              | aplicar accesos aprobados                 | la aplicación conserva sus controles internos         |
| `CAP-15.02` a `CAP-15.04` | aplicación o trabajador que usa el equipo            | conocer disponibilidad y novedad          | no obtiene propiedad del activo                       |
| `CAP-15.05`               | `shell`                                              | mostrar catálogo, disponibilidad y acceso | SHELL no administra funciones internas                |
| `CAP-15.06` a `CAP-15.09` | aplicación afectada y medio de soporte por confirmar | reportar, atender, probar y cerrar        | no existe consumidor canónico confirmado              |
| `CAP-16.01` a `CAP-16.11` | consumidor autorizado del hecho original             | consultar o aportar evidencia necesaria   | no se crea un archivo maestro paralelo sin control    |
| `CAP-18.03` a `CAP-18.05` | `shell` cuando afecte acceso al ecosistema           | informar indisponibilidad y alternativa   | SHELL no reconcilia datos internos de otra aplicación |
| `CAP-18.06` a `CAP-18.11` | aplicaciones dependientes del resultado recuperado   | reanudar y comprobar continuidad          | cada propietaria valida su propia información         |

---

#### 11. Relación actual frente a relación objetivo

Cada vínculo se registrará en dos columnas:

| Columna             | Pregunta                                                                     |
| ------------------- | ---------------------------------------------------------------------------- |
| Consumidor actual   | ¿Qué aplicación, plataforma, archivo, chat o papel utiliza hoy el resultado? |
| Consumidor objetivo | ¿Qué aplicación debería utilizarlo cuando se remodele el flujo?              |

No se eliminará un consumidor actual hasta demostrar:

1. que su función fue reemplazada;
2. que la información histórica necesaria fue conservada;
3. que los usuarios pueden continuar trabajando;
4. que las excepciones tienen tratamiento;
5. que existe reversión o alternativa proporcional al riesgo.

---

#### 12. Registro mínimo de cada vínculo consumidor

| Campo                 | Contenido                                  |
| --------------------- | ------------------------------------------ |
| Subcapacidad          | código canónico                            |
| Propietaria candidata | aplicación de `CAP-MAP-004`                |
| Consumidor            | aplicación, plataforma o medio             |
| Tipo                  | valor del apartado 4                       |
| Uso esperado          | acción empresarial que necesita realizar   |
| Resultado requerido   | descripción sin definir todavía campos     |
| Estado actual         | valor del apartado 5                       |
| Estado objetivo       | valor del apartado 5                       |
| Evidencia             | pantalla, mensaje, documento u observación |
| Riesgo si no recibe   | efecto operativo concreto                  |
| Riesgo de duplicación | qué versión paralela podría producirse     |
| Duda                  | pregunta única pendiente                   |
| Destino               | tarea posterior                            |

---

#### 13. Dudas operativas pendientes

| Código         | Pregunta única                                                           | Quién puede responder                         | Respuesta esperada                     | Destino       |
| -------------- | ------------------------------------------------------------------------ | --------------------------------------------- | -------------------------------------- | ------------- |
| `D-CAP005-001` | ¿En qué aplicación se registra hoy por primera vez una venta presencial? | cajero                                        | un nombre                              | `CAP-MAP-008` |
| `D-CAP005-002` | ¿En qué aplicación se registra hoy por primera vez una compra?           | responsable de compras                        | un nombre                              | `CAP-MAP-008` |
| `D-CAP005-003` | ¿Dónde consulta cocina los pedidos pendientes?                           | cocinero o responsable                        | un nombre de pantalla, papel o medio   | `CAP-MAP-007` |
| `D-CAP005-004` | ¿Dónde consulta producción lo que debe fabricar?                         | responsable de producción                     | un nombre de pantalla, archivo o medio | `CAP-MAP-007` |
| `D-CAP005-005` | ¿Dónde se consulta actualmente el saldo de inventario?                   | responsable de bodega o sede                  | un nombre                              | `CAP-MAP-008` |
| `D-CAP005-006` | ¿Qué medio se usa actualmente para reportar una falla tecnológica?       | cualquier trabajador usuario                  | una opción                             | `CAP-MAP-015` |
| `D-CAP005-007` | ¿Qué aplicación recibe el cierre de caja para conciliación?              | cajero o Contabilidad                         | un nombre o `NINGUNA`                  | `CAP-MAP-008` |
| `D-CAP005-008` | ¿Dónde se consulta el estado de una entrega al cliente?                  | cajero, responsable de pedidos o domiciliario | un nombre                              | `CAP-MAP-007` |

---

#### 14. Decisiones ya resueltas que no deben volver a preguntarse

| Asunto   | Decisión o hecho vigente                                                                                                          | Estado                             | Evidencia canónica                                      |
| -------- | --------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------- | ------------------------------------------------------- |
| Makos    | es un sistema operativo actual y se tratará como solución temporal hasta que PULSO cubra, valide y migre el flujo correspondiente | `RESUELTA_POR_EVIDENCIA_Y_ROADMAP` | auditoría E1, contrato temporal Makos y `INT-SALES-002` |
| Shopify  | recibe los pedidos principales de Vaila Vainilla y se conservará durante la transición hasta que exista reemplazo validado        | `RESUELTA_POR_EVIDENCIA`           | auditoría E1 de Vaila Vainilla                          |
| Rappi    | recibe pedidos de Vento Café y Saudo y se conservará durante la transición hasta que exista reemplazo validado                    | `RESUELTA_POR_EVIDENCIA`           | auditoría E1 de pedidos Rappi                           |
| ManyChat | recibe pedidos directos y domicilios de Vento Café y se conservará durante la transición hasta que exista reemplazo validado      | `RESUELTA_POR_EVIDENCIA`           | auditoría E1 de pedidos directos                        |
| WhatsApp | funciona como medio operativo informal y se conservará únicamente mientras sus funciones no hayan sido reemplazadas y verificadas | `RESUELTA_POR_EVIDENCIA`           | auditoría E1 de operación real                          |
| AURA     | permanece en el catálogo, asociada al trabajo administrativo de mercadeo y diferida en el roadmap                                 | `RESUELTA_POR_DECISION_CANONICA`   | catálogo canónico y BLOQUE W                            |

`CAP-MAP-005` no genera preguntas `RESPONDE_USUARIO`.

##### 14.1. Puerta obligatoria antes de preguntar al usuario

Una duda solo podrá marcarse `RESPONDE_USUARIO` después de comprobar, en este orden:

1. si ya fue respondida por el usuario;
2. si una tarea aprobada contiene la respuesta;
3. si una auditoría, documento, artefacto, código o configuración aporta evidencia suficiente;
4. si una decisión canónica previa permite resolverla;
5. si la respuesta puede obtenerse de un trabajador o responsable funcional;
6. si realmente requiere una decisión exclusiva del usuario.

Si existe respuesta suficiente, se registrará como hecho o decisión con su evidencia y no se volverá a preguntar.

La lista final excluirá:

- preguntas repetidas;
- preguntas cuya respuesta pueda inferirse de una decisión aprobada;
- preguntas técnicas comprobables mediante inspección;
- preguntas que deba contestar otro responsable;
- preguntas que no cambien ninguna decisión.

---

#### 15. Autocuestionario para identificar consumidores actuales

Se enviará un bloque por cada resultado que el trabajador reciba de otra persona o sistema.

```text
CAP005-RECIBO — [NOMBRE DEL RESULTADO]

Ejemplos:
“Pedido confirmado”, “compra recibida” o “turno asignado”.

¿Dónde ves [NOMBRE DEL RESULTADO] para poder continuar tu trabajo?

Marca UNA:
[ ] ANIMA
[ ] VISO
[ ] NEXO
[ ] FOGO
[ ] ORIGO
[ ] PULSO
[ ] NUMERA
[ ] AURA
[ ] Vento Pass
[ ] Makos
[ ] Rappi
[ ] Shopify
[ ] ManyChat
[ ] WhatsApp
[ ] Hoja de cálculo
[ ] Papel
[ ] Otra
[ ] No lo recibo
[ ] NO SÉ

Si marcaste “otra”, escribe el nombre:
________________________________

¿Qué haces después de verlo?
Marca UNA:
[ ] Preparo algo
[ ] Entrego algo
[ ] Registro información
[ ] Cobro o pago
[ ] Reviso y apruebo
[ ] Corrijo una diferencia
[ ] Solo lo consulto
[ ] Otra acción

Si marcaste “otra acción”, escribe una frase:
________________________________

Si no recibes esa información, ¿puedes terminar el trabajo?
[ ] Sí
[ ] No
[ ] Algunas veces
[ ] NO SÉ

No envíes contraseñas, nombres de clientes, datos bancarios ni información
privada.
```

---

#### 16. Regla para copias manuales

Cuando una persona copie información entre dos lugares, se registrará:

1. dónde apareció primero;
2. dónde se volvió a escribir;
3. quién necesita la copia, sin asignar todavía responsabilidad formal;
4. qué permite hacer la copia;
5. qué ocurre si se omite;
6. cómo se detecta una diferencia;
7. si la copia debe conservarse temporalmente durante la remodelación.

La copia manual será evidencia de una necesidad de consumo, no prueba de que ambos lugares sean propietarios.

---

#### 17. Lo que queda decidido

1. Las 217 subcapacidades tienen consumidores consultables mediante familia más excepción.
2. Propietaria, consumidora, plataforma externa y medio manual permanecen separados.
3. Las plataformas externas no se convertirán en propietarias internas.
4. Los consumidores recibirán únicamente el resultado necesario.
5. Las relaciones actuales y objetivo se documentarán por separado.
6. Makos, WhatsApp, hojas y papel podrán conservarse temporalmente hasta validar su reemplazo.
7. No se eliminará un medio actual únicamente porque exista una aplicación futura.
8. Las copias manuales se registrarán como brechas o transiciones.
9. Los actores humanos se definirán en `CAP-MAP-006`.
10. La información exacta y su fuente de verdad se definirán en `CAP-MAP-007` y `CAP-MAP-008`.
11. Solo las dudas no resueltas después de agotar evidencia podrán acumularse bajo `RESPONDE_USUARIO`.
12. Esta tarea no crea integraciones, accesos ni cambios de sistema.

---

#### 18. Criterios de aceptación

`CAP-MAP-005` podrá aprobarse cuando:

- todas las subcapacidades tengan una regla de consumidores;
- aplicación propietaria y consumidora estén separadas;
- sistemas actuales, futuros, externos y manuales tengan estados distintos;
- se documenten las relaciones principales entre compras, inventario, producción, ventas y finanzas;
- las copias manuales no se confundan con fuentes definitivas;
- las plataformas externas no reciban información innecesaria;
- las dudas operativas indiquen quién puede responderlas sin conocimientos técnicos;
- no se repitan preguntas ya resueltas por auditorías, decisiones, código, configuración o respuestas anteriores;
- toda eventual pregunta reservada para el usuario haya superado la puerta de deduplicación y tenga una sola respuesta esperada;
- `CAP-MAP-006` permanezca como única continuidad inmediata.

---

#### 19. Resultado y continuidad

Con la aprobación quedará definido quién necesita utilizar cada resultado empresarial, sin decidir todavía quién realiza, supervisa o aprueba el trabajo.

La continuidad será exclusivamente:

```text
CAP-MAP-006
— Identificar actor iniciador, ejecutor, supervisor y aprobador
```

`CAP-MAP-006` identificará funciones humanas y responsabilidades observadas o candidatas sin confundir persona, cargo, rol operativo o permiso.

### ✅ CAP-MAP-006 — Identificar actor iniciador, ejecutor, supervisor y aprobador

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Dependencias cumplidas:** `CAP-MAP-001` a `CAP-MAP-005`
**Propósito:** identificar qué función humana, tercero, sistema o evento inicia, ejecuta, supervisa y aprueba cada capacidad
**No define todavía:** personas asignadas permanentemente, cargos objetivo, permisos, montos de aprobación, reglas técnicas, información intercambiada ni implementación

---

#### 1. Resultado de esta tarea

Cada una de las 217 subcapacidades quedará relacionada con:

1. quién o qué origina la necesidad;
2. quién realiza materialmente el trabajo;
3. quién revisa el estado o resultado;
4. quién autoriza la decisión cuando realmente se necesita autorización;
5. el estado actual de cada responsabilidad;
6. las funciones temporales, rotativas, compartidas o vacantes;
7. la pregunta específica que permita resolver una responsabilidad todavía no confirmada.

La asignación se realizará por función, no por nombre de una persona.

---

#### 2. Cuatro participaciones obligatorias

| Código | Participación | Pregunta que responde                                                         |
| ------ | ------------- | ----------------------------------------------------------------------------- |
| `INI`  | iniciador     | ¿Quién o qué hace que el trabajo deba comenzar?                               |
| `EJE`  | ejecutor      | ¿Quién realiza el trabajo o registra el resultado?                            |
| `SUP`  | supervisor    | ¿Quién revisa que el trabajo ocurra correctamente?                            |
| `APR`  | aprobador     | ¿Quién autoriza una decisión, gasto, excepción, corrección o efecto sensible? |

Cada subcapacidad tendrá los cuatro campos, aunque alguno contenga:

- `NO_REQUIERE_APROBACIÓN`;
- `NO_REQUIERE_SUPERVISIÓN_SEPARADA`;
- `PROCESO_AUTOMÁTICO`;
- `POR_IDENTIFICAR`;
- `FUTURA_SIN_ACTOR`.

No se inventará un aprobador únicamente para llenar una casilla.

---

#### 3. Participaciones adicionales que no deben perderse

Aunque el mapa principal utilice cuatro campos, también se conservarán cuando sean relevantes:

| Código | Participación                                           |
| ------ | ------------------------------------------------------- |
| `DPR`  | responde por el resultado general                       |
| `REV`  | comprueba cantidades, documentos o resultado            |
| `CUS`  | custodia dinero, bienes, documentos o accesos           |
| `REG`  | incorpora la operación a un sistema o soporte           |
| `REC`  | recibe el resultado o continúa el trabajo               |
| `COR`  | modifica, ajusta o revierte                             |
| `ESC`  | resuelve situaciones fuera de la autoridad ordinaria    |
| `AUD`  | revisa posteriormente mediante conciliación o auditoría |
| `EXT`  | participa como cliente, proveedor, técnico o tercero    |
| `SYS`  | aplicación o servicio que ejecuta una función técnica   |

Ejecutar, aprobar, custodiar, registrar y corregir no significan lo mismo.

---

#### 4. Estados de responsabilidad

| Estado             | Significado                                                       |
| ------------------ | ----------------------------------------------------------------- |
| `CONFIRMADA`       | la responsabilidad se conoce con evidencia suficiente             |
| `PROVISIONAL`      | existe una identificación inicial que debe contrastarse           |
| `TEMPORAL`         | una persona o función cubre transitoriamente otra responsabilidad |
| `ROTATIVA`         | cambia según turno, sede, área o disponibilidad                   |
| `COMPARTIDA`       | participan varias funciones sin un único ejecutor                 |
| `VACANTE`          | la responsabilidad existe, pero no tiene titular habitual         |
| `IMPLÍCITA`        | se ejerce por costumbre sin declaración formal                    |
| `POR_IDENTIFICAR`  | la evidencia actual no permite determinarla                       |
| `FUTURA_SIN_ACTOR` | la capacidad todavía no opera                                     |

Los estados AS-IS no se presentarán como diseño objetivo.

---

#### 5. Familias de actores ya confirmadas por la auditoría

| Código | Función reconocible                                    |
| ------ | ------------------------------------------------------ |
| `F01`  | gobierno y propiedad                                   |
| `F02`  | Gerencia General                                       |
| `F03`  | gerencia o supervisión de sede                         |
| `F04`  | coordinación de operaciones                            |
| `F05`  | administración y Contabilidad                          |
| `F06`  | marketing, comercial y atención de medios de venta     |
| `F07`  | caja, mostrador y venta directa                        |
| `F08`  | servicio de salón y mesas                              |
| `F09`  | operación integral de sede pequeña                     |
| `F10`  | producción especializada                               |
| `F11`  | bodega y abastecimiento                                |
| `F12`  | logística y transporte                                 |
| `F13`  | recepción en sede                                      |
| `F14`  | servicios generales                                    |
| `F15`  | custodia de activos y puntos externos                  |
| `F16`  | responsable de operación asociada, como Vaila Vainilla |
| `F17`  | proveedores, técnicos y prestadores externos           |
| `F18`  | clientes y empresas compradoras                        |
| `F19`  | plataformas, aplicaciones y medios                     |
| `F20`  | apoyo rotativo o sustitución temporal                  |
| `F21`  | proceso autónomo de un sistema                         |

Estas familias describen funciones observadas. No equivalen automáticamente a cargos, permisos ni cuentas de usuario.

---

#### 6. Reglas obligatorias

1. Se registrará la función y no el nombre de la persona.
2. Cuando una persona cubra varias funciones, cada función se registrará por separado.
3. Una cobertura temporal no se convertirá en responsabilidad permanente.
4. Una responsabilidad vacante no desaparecerá del mapa.
5. Un sistema puede iniciar o ejecutar una operación técnica, pero no asumir responsabilidad empresarial humana.
6. Un cliente o proveedor puede iniciar un proceso sin convertirse en dueño del proceso interno.
7. Realizar una acción no implica poder aprobarla o corregirla.
8. Supervisar no implica tener permiso para modificar.
9. Las acciones ordinarias podrán usar `NO_REQUIERE_APROBACIÓN`.
10. Descuentos, anulaciones, pagos, ajustes, bajas, contrataciones y excepciones deberán revisar si necesitan aprobación separada.
11. La concentración de iniciación, ejecución, aprobación y custodia se registrará como hallazgo.
12. Esta tarea documenta AS-IS y formula candidaturas; no concede autoridad.

---

#### 7. Regla de cobertura de las 217 subcapacidades

Cada subcapacidad heredará los actores base de su familia, salvo que aparezca en el apartado 9.

```text
ACTORES DE LA SUBCAPACIDAD
=
ACTORES BASE DE LA FAMILIA
+
EXCEPCIÓN ESPECÍFICA
```

Las excepciones reemplazan únicamente el campo indicado. Los demás campos continúan heredados.

---

#### 8. Mapa base por familia

| Familia                           | `INI` iniciador                                      | `EJE` ejecutor                                       | `SUP` supervisor                                  | `APR` aprobador                                                      |
| --------------------------------- | ---------------------------------------------------- | ---------------------------------------------------- | ------------------------------------------------- | -------------------------------------------------------------------- |
| `CAP-01` Gobierno                 | F01 o F02                                            | F01, F02 o F05                                       | F01                                               | F01 cuando la decisión sea reservada                                 |
| `CAP-02` Personas                 | F02, F03 o trabajador según caso                     | F05, F02, F03 o trabajador                           | F02 y F03                                         | F02; F01 en decisiones reservadas                                    |
| `CAP-03` Seguridad y cumplimiento | trabajador, F03, F04, F14 u obligación externa       | responsable del área, F03, F04, F05 o F14            | F02, F03 o responsable designado                  | F02; F01 cuando corresponda a política o riesgo mayor                |
| `CAP-04` Productos y conocimiento | F06, F07, F10, F11, F16 o F02                        | responsable de catálogo, F10 o responsable comercial | F04, F06 o F02                                    | F02 o responsable autorizado del frente                              |
| `CAP-05` Compras                  | área solicitante, F10, F11, F03 o F04                | F02, F04 o F05 según compra                          | F02                                               | F02 según evidencia actual                                           |
| `CAP-06` Inventario               | área que necesita entrada, salida, traslado o conteo | F11; actualmente también F04, F10, F13 o F20         | F04 y responsable del lugar                       | no requiere en movimientos ordinarios; excepciones `POR_IDENTIFICAR` |
| `CAP-07` Activos                  | usuario, custodio, F03, F04 o F15                    | F04, F15, custodio o F17                             | F02, F03 o F04                                    | F02 para compra, baja, venta o disposición                           |
| `CAP-08` Producción               | necesidad de sede, plan, stock o F04                 | F10 y apoyos F20                                     | responsable productivo y F04                      | no requiere para ejecución ordinaria; F04 o F02 para excepción       |
| `CAP-09` Ventas                   | F18, plataforma F19 o F06                            | F07, F08, F09 o F16                                  | F03, F07 o F16 según frente                       | no requiere para venta ordinaria; excepción sensible por identificar |
| `CAP-10` Clientes                 | F18 o medio F19                                      | F06, F07, F08, F09 o F16                             | F03, F06 o F16                                    | responsable del frente para compensación o excepción                 |
| `CAP-11` Transporte               | pedido, remisión, F03, F11 o F16                     | F11, F12, F13 y apoyos F20                           | F04 y responsable receptor                        | F04 o F03 para cambios y excepciones                                 |
| `CAP-12` Finanzas                 | venta, compra, obligación, F02 o F05                 | F05; F07 o F09 para caja                             | F02 y F05                                         | F02, F01 o usuario bancario autorizado según acción                  |
| `CAP-13` Instalaciones            | cualquier trabajador, F03, F04 o F14                 | F14, F04 o F17                                       | F03 o F04                                         | F02 cuando genere contratación o gasto                               |
| `CAP-14` Mercadeo                 | F01, F02, F06 o F16                                  | F06                                                  | F01, F02, F06 o F16 según frente                  | responsable de marca o frente cuando requiera aprobación             |
| `CAP-15` Tecnología               | cualquier usuario o sistema F21                      | F04 actualmente, F17 o sistema F21                   | F02 o responsable funcional                       | según riesgo; situación actual concentrada en F04                    |
| `CAP-16` Información              | actor que produce el hecho o solicita información    | actor del área, F05 o custodio autorizado            | responsable del área y F02 cuando sea transversal | autoridad del documento para compartir, eliminar o corregir          |
| `CAP-17` Análisis                 | F01, F02, F03 o responsable del área                 | F05 o responsable analítico del área                 | F02 o dueño del resultado                         | F01 o F02 cuando se convierta en decisión                            |
| `CAP-18` Continuidad              | trabajador afectado, supervisor, tercero o sistema   | equipo del área afectada, F04, F17 o F21             | F03, F04 o F02                                    | F02 o F01 para alternativas de alto impacto                          |

---

#### 9. Excepciones específicas basadas en la auditoría

##### 9.1. Personas, turnos y asistencia

| Subcapacidad | Campo     | Actor                                                                 | Estado                       | Evidencia o frontera                                                 |
| ------------ | --------- | --------------------------------------------------------------------- | ---------------------------- | -------------------------------------------------------------------- |
| `CAP-02.02`  | `EJE`     | F02 para filtrar; apoyo administrativo cuando aplique                 | `CONFIRMADA`                 | revisión de hojas de vida                                            |
| `CAP-02.02`  | `APR`     | F01 y F02                                                             | `CONFIRMADA_PARCIAL`         | aprobación de candidato y prueba                                     |
| `CAP-02.03`  | `EJE`     | F17 para formalización documental después de decisión interna         | `CONFIRMADA`                 | abogados externos                                                    |
| `CAP-02.06`  | `EJE`     | F02 y F03 de Vento Café                                               | `CONFIRMADA`                 | creación actual de horarios                                          |
| `CAP-02.06`  | `APR`     | las mismas funciones según su operación                               | `CONFIRMADA`                 | publicación actual en VISO                                           |
| `CAP-02.07`  | `INI/EJE` | trabajador                                                            | `CONFIRMADA`                 | el trabajador registra su entrada o salida                           |
| `CAP-02.07`  | `SYS`     | ANIMA acepta y conserva la marcación                                  | `CONFIRMADA`                 | no sustituye supervisión humana                                      |
| `CAP-02.08`  | `COR/APR` | por identificar para correcciones de asistencia y horario             | `POR_IDENTIFICAR`            | auditoría dejó el flujo pendiente                                    |
| `CAP-02.12`  | `EJE/SUP` | F02 y F05                                                             | `CONFIRMADA_PARCIAL`         | preparación y revisión de información laboral                        |
| `CAP-02.12`  | `APR`     | usuario bancario autorizado para ejecutar pago                        | `CONFIRMADA`                 | control bancario externo                                             |
| `CAP-02.13`  | `INI/APR` | F02 para altas; no existe iniciador obligatorio confirmado para bajas | `CONFIRMADA_PARCIAL/AUSENTE` | la solicitud de baja depende actualmente del descubrimiento informal |
| `CAP-02.13`  | `EJE`     | F04 actualmente desactiva cuentas                                     | `CONFIRMADA_PARCIAL`         | ejecución manual posterior                                           |

##### 9.2. Compras, recepción e inventario

| Subcapacidad              | Campo     | Actor                                                 | Estado                | Evidencia o frontera                                    |
| ------------------------- | --------- | ----------------------------------------------------- | --------------------- | ------------------------------------------------------- |
| `CAP-05.01` y `CAP-05.02` | `INI`     | responsables de áreas, F03, F10 o F11                 | `COMPARTIDA`          | faltantes y avisos de las áreas                         |
| `CAP-05.01`               | `EJE/APR` | F02 consolida la necesidad                            | `CONFIRMADA`          | preguntas y experiencia                                 |
| `CAP-05.05` y `CAP-05.06` | `EJE/APR` | F02                                                   | `CONFIRMADA`          | acepta precios, cambios y decisión de compra            |
| `CAP-05.07`               | `EJE`     | F02 o apoyo administrativo autorizado                 | `CONFIRMADA_PARCIAL`  | pedido enviado por Gerencia o apoyo                     |
| `CAP-05.08` y `CAP-05.09` | `EJE`     | F04 en segundo piso; F10 en primer piso               | `TEMPORAL/COMPARTIDA` | recepción según ubicación                               |
| `CAP-05.09`               | `REV`     | quien recibe compara visualmente y contra factura     | `CONFIRMADA_PARCIAL`  | control manual                                          |
| `CAP-05.10`               | `APR`     | por identificar para rechazo o diferencia             | `POR_IDENTIFICAR`     | no existe procedimiento confirmado                      |
| `CAP-06.01` a `CAP-06.07` | `EJE`     | F11; cobertura actual F04 y áreas F10                 | `VACANTE/TEMPORAL`    | Bodega no tiene titular habitual                        |
| `CAP-06.07`               | `APR`     | no existe aprobación confirmada para retiro ordinario | `POR_IDENTIFICAR`     | actualmente hay acceso físico libre                     |
| `CAP-06.08` a `CAP-06.11` | `EJE`     | F11, F12 y F13                                        | `COMPARTIDA/ROTATIVA` | origen, conductor y receptor                            |
| `CAP-06.12`               | `EJE`     | F11 y responsables del lugar                          | `PROVISIONAL`         | conteo físico                                           |
| `CAP-06.13` y `CAP-06.14` | `APR/COR` | por identificar                                       | `POR_IDENTIFICAR`     | ajustes, merma y disposición sin segregación suficiente |

##### 9.3. Producción, despacho y transporte

| Subcapacidad              | Campo     | Actor                                        | Estado                   | Evidencia o frontera                                          |
| ------------------------- | --------- | -------------------------------------------- | ------------------------ | ------------------------------------------------------------- |
| `CAP-08.01` a `CAP-08.05` | `INI`     | solicitudes de sedes, stock observado y plan | `COMPARTIDA/IMPLÍCITA`   | no existe un único propietario integral                       |
| `CAP-08.02` a `CAP-08.05` | `EJE/SUP` | responsables productivos y F04               | `DEPENDIENTE_DE_PERSONA` | cantidades y prioridades usan experiencia                     |
| `CAP-08.06` a `CAP-08.14` | `EJE`     | subfamilia F10 correspondiente               | `CONFIRMADA`             | Panadería, Repostería, Pastelería, Galletería, Cocina o Barra |
| `CAP-08.07` y `CAP-08.10` | `SUP`     | responsable del área y F04                   | `CONFIRMADA`             | revisión productiva                                           |
| `CAP-08.12` y `CAP-08.13` | `APR`     | responsable productivo; escalamiento a F04   | `PROVISIONAL`            | liberación, rechazo o reproceso requiere formalización        |
| `CAP-11.04` a `CAP-11.06` | `EJE`     | F11, F12 y apoyos F20                        | `COMPARTIDA`             | carga y transferencia de custodia                             |
| `CAP-11.07`               | `EJE`     | F12                                          | `CONFIRMADA`             | conductor                                                     |
| `CAP-11.09`               | `EJE/REC` | F12 entrega y F13 recibe                     | `ROTATIVA`               | receptor varía según sede y turno                             |
| `CAP-11.10`               | `APR`     | F04 o F03 según origen y destino             | `PROVISIONAL`            | faltantes, daños y devoluciones                               |
| `CAP-11.11`               | `SUP`     | F04                                          | `CONFIRMADA`             | cierre y novedades de recorrido                               |

##### 9.4. Pedidos, venta, caja y clientes

| Subcapacidad              | Campo     | Actor                                                                         | Estado               | Evidencia o frontera                       |
| ------------------------- | --------- | ----------------------------------------------------------------------------- | -------------------- | ------------------------------------------ |
| `CAP-09.02`               | `INI`     | F18, Rappi, ManyChat, Shopify o comunicación directa                          | `CONFIRMADA`         | origen depende de la forma de pedido       |
| `CAP-09.02` a `CAP-09.07` | `EJE`     | F08 para mesas; F07 para caja, mostrador y plataformas; F09 en sedes pequeñas | `CONFIRMADA_PARCIAL` | funciones cambian por sede                 |
| `CAP-09.05`               | `APR/COR` | caja y supervisión; aprobador exacto por identificar                          | `POR_IDENTIFICAR`    | corrección, anulación y devolución         |
| `CAP-09.08` a `CAP-09.10` | `EJE`     | F07 o F09                                                                     | `CONFIRMADA`         | registro, cobro y soporte de venta         |
| `CAP-09.09`               | `EJE`     | cualquier trabajador puede procesar tarjeta; F07 registra el pago             | `COMPARTIDA`         | doble intervención actual                  |
| `CAP-09.09`               | `APR`     | cliente autoriza el pago; caja confirma registro                              | `CONFIRMADA_PARCIAL` | datáfono y aviso verbal                    |
| `CAP-09.11`               | `EJE`     | F08; apoyo eventual F07                                                       | `CONFIRMADA`         | servicio de mesa                           |
| `CAP-09.12` y `CAP-09.13` | `EJE`     | F07 o F09                                                                     | `CONFIRMADA`         | mostrador, Rappi y pedidos directos        |
| `CAP-09.14`               | `EJE/SUP` | F06; F16 para Vaila Vainilla                                                  | `CONFIRMADA`         | catering, empresa y frente asociado        |
| `CAP-09.15`               | `EJE`     | F07 o F09                                                                     | `CONFIRMADA`         | cierre de caja y jornada                   |
| `CAP-09.15`               | `SUP`     | F03 y revisión posterior F05                                                  | `PROVISIONAL`        | cierre, efectivo y Contabilidad            |
| `CAP-10.03` a `CAP-10.05` | `EJE`     | función que atiende el medio: F06, F07, F08, F09 o F16                        | `PROVISIONAL`        | debe conservarse el origen de la solicitud |
| `CAP-10.04` y `CAP-10.05` | `APR`     | responsable de sede o frente; escalamiento F02                                | `PROVISIONAL`        | reclamo, devolución o compensación         |

##### 9.5. Finanzas, activos, instalaciones y mercadeo

| Subcapacidad                            | Campo     | Actor                                              | Estado               | Evidencia o frontera                              |
| --------------------------------------- | --------- | -------------------------------------------------- | -------------------- | ------------------------------------------------- |
| `CAP-07.03` a `CAP-07.06`               | `CUS/EJE` | F15 o usuario del activo                           | `PROVISIONAL`        | custodia no implica propiedad                     |
| `CAP-07.07` a `CAP-07.09`               | `INI`     | usuario, custodio, F03 o F04                       | `CONFIRMADA_PARCIAL` | necesidad por falla o mantenimiento               |
| `CAP-07.10`                             | `APR`     | F02 o F01 según valor y efecto                     | `PROVISIONAL`        | baja, venta, descarte o reemplazo                 |
| `CAP-12.02`                             | `EJE`     | F07 o F09                                          | `CONFIRMADA`         | apertura, operación y cierre de caja              |
| `CAP-12.02`                             | `CUS`     | F07 durante turno; F02 recibe o custodia excedente | `CONFIRMADA`         | conteo y cierre físico                            |
| `CAP-12.03`                             | `EJE/APR` | usuario bancario autorizado                        | `CONFIRMADA`         | ejecución bancaria                                |
| `CAP-12.01` y `CAP-12.04` a `CAP-12.15` | `EJE`     | F05                                                | `CONFIRMADA_PARCIAL` | Contabilidad y administración                     |
| `CAP-12.07` y `CAP-12.08`               | `SUP/AUD` | F05 y F02 según materia                            | `PROVISIONAL`        | conciliación posterior                            |
| `CAP-13.03`                             | `INI/APR` | F02 para contratar técnico                         | `CONFIRMADA`         | contacto directo                                  |
| `CAP-13.03`                             | `EJE`     | F17                                                | `CONFIRMADA`         | técnico externo                                   |
| `CAP-13.03`                             | `REV`     | F02 o usuario del recurso                          | `CONFIRMADA_PARCIAL` | aceptación visual no formalizada                  |
| `CAP-13.04`                             | `EJE`     | F14 y cada área sobre su estación                  | `CONFIRMADA`         | servicios generales no sustituye cuidado del área |
| `CAP-14.03` a `CAP-14.05`               | `INI`     | F01, F02, F06 o F16                                | `CONFIRMADA`         | solicitud de contenido                            |
| `CAP-14.03` a `CAP-14.05`               | `EJE`     | F06                                                | `CONFIRMADA`         | creación y publicación                            |
| `CAP-14.03`                             | `APR`     | F01, F02 o F16 para publicación permanente         | `CONFIRMADA_PARCIAL` | historias pueden publicarse sin aprobación previa |
| `CAP-14.08` y `CAP-14.09`               | `EJE/SUP` | F06; F16 cuando aplique a Vaila Vainilla           | `CONFIRMADA`         | comercial, catering y eventos                     |

##### 9.6. Tecnología, información, análisis y continuidad

| Subcapacidad              | Campo         | Actor                                                     | Estado                   | Evidencia o frontera                                        |
| ------------------------- | ------------- | --------------------------------------------------------- | ------------------------ | ----------------------------------------------------------- |
| `CAP-15.01`               | `INI/APR`     | F02 solicita y autoriza alta                              | `CONFIRMADA_PARCIAL`     | baja obligatoria todavía ausente                            |
| `CAP-15.01`               | `EJE`         | F04 crea o desactiva cuentas actualmente                  | `CONFIRMADA_PARCIAL`     | ejecución manual                                            |
| `CAP-15.02` a `CAP-15.04` | `CUS`         | usuario, sede o F15                                       | `PROVISIONAL`            | ubicación y custodia requieren inventario                   |
| `CAP-15.06` y `CAP-15.07` | `INI`         | cualquier usuario afectado                                | `CONFIRMADA`             | reporte por WhatsApp o verbal                               |
| `CAP-15.06` a `CAP-15.09` | `EJE/SUP/APR` | F04 concentra actualmente priorización, cambio y prueba   | `DEPENDIENTE_DE_PERSONA` | no se presenta como modelo objetivo                         |
| `CAP-15.10`               | `APR`         | F02                                                       | `PROVISIONAL`            | licencias, contratos y costos                               |
| `CAP-16.01` a `CAP-16.11` | actores       | se heredan del proceso cuyo hecho se documenta            | `COMPARTIDA`             | no existe un único actor documental para todos los dominios |
| `CAP-17.01` a `CAP-17.12` | `INI/SUP`     | F01, F02 o responsable del área                           | `PROVISIONAL`            | análisis se activa por necesidad de decisión                |
| `CAP-17.01` a `CAP-17.12` | `EJE`         | F05 o responsable funcional que prepara el análisis       | `PROVISIONAL`            | distribución exacta pendiente por tipo de medida            |
| `CAP-18.03`               | `INI`         | usuario, tercero o sistema que detecta la falla           | `CONFIRMADA`             | no necesita aprobación para reportar                        |
| `CAP-18.04` a `CAP-18.06` | `EJE/SUP`     | F04 y responsable del área afectada                       | `PROVISIONAL`            | priorización por impacto                                    |
| `CAP-18.05`               | `APR`         | F02 para alternativa empresarial sensible                 | `PROVISIONAL`            | operación mínima                                            |
| `CAP-18.07` a `CAP-18.09` | `EJE/REV`     | actor que trabajó durante la falla y responsable del área | `PROVISIONAL`            | registro y reconciliación posterior                         |

---

#### 10. Concentraciones y vacíos que deben conservarse

| Hallazgo                                                                            | Estado AS-IS               |
| ----------------------------------------------------------------------------------- | -------------------------- |
| F04 cubre parcialmente Bodega además de operaciones y soporte                       | `TEMPORAL/CONCENTRADA`     |
| Bodega tiene responsabilidad real sin titular habitual                              | `VACANTE`                  |
| la demanda y planificación productiva no tienen un dueño integral                   | `COMPARTIDA/IMPLÍCITA`     |
| correcciones de pago, horarios y asistencia carecen de aprobador confirmado         | `POR_IDENTIFICAR`          |
| caja puede ejecutar, aprobar y corregir algunas acciones dentro de la misma función | `CONCENTRADA/PARCIAL`      |
| F02 concentra necesidad, aprobación y negociación de varias compras                 | `CONCENTRADA`              |
| soporte tecnológico concentra priorización, ejecución, prueba y aprobación en F04   | `DEPENDIENTE_DE_PERSONA`   |
| recepción de remisiones en sedes depende del trabajador disponible                  | `ROTATIVA`                 |
| retiro de Bodega no tiene aprobación o custodia suficiente                          | `AUSENTE/POR_IDENTIFICAR`  |
| varias operaciones usan cuentas compartidas y no identifican al ejecutor real       | `SIN_IDENTIDAD_INDIVIDUAL` |

Registrar estos hallazgos no significa aprobarlos como diseño futuro.

---

#### 11. Cuándo se necesita realmente aprobación

No se exigirá aprobación separada para cada acción ordinaria.

Se evaluará aprobación específica cuando la acción:

- comprometa dinero;
- cambie una obligación;
- modifique una venta ya confirmada;
- altere inventario sin movimiento ordinario;
- descarte o transfiera un activo;
- cambie un horario o una marcación registrada;
- cree o retire un acceso;
- publique contenido permanente o sensible;
- compense a un cliente;
- acepte una diferencia;
- elimine o comparta información protegida;
- active una alternativa durante una falla importante.

La definición de permisos y condiciones técnicas corresponde a `CAP-MAP-010`.

---

#### 12. Registro mínimo por subcapacidad

| Campo                       | Contenido                                             |
| --------------------------- | ----------------------------------------------------- |
| Código                      | subcapacidad canónica                                 |
| `INI`                       | función, tercero, sistema o evento iniciador          |
| `EJE`                       | función ejecutora                                     |
| `SUP`                       | función supervisora o estado sin supervisión separada |
| `APR`                       | función aprobadora o `NO_REQUIERE_APROBACIÓN`         |
| Participaciones adicionales | revisor, custodio, receptor, corrector u otra         |
| Sede o área                 | vínculo de `CAP-MAP-003`                              |
| Estado por actor            | valor del apartado 4                                  |
| Evidencia                   | auditoría, documento, pantalla u observación          |
| Concentración               | funciones incompatibles reunidas en el mismo actor    |
| Sustitución                 | actor habitual y actor temporal, si aplica            |
| Duda                        | una pregunta única no resuelta                        |
| Destino                     | auditoría o tarea posterior                           |

---

#### 13. Preguntas pendientes de validación operativa

Estas preguntas provienen de vacíos expresamente registrados en la auditoría; no repiten hechos confirmados.

| Código         | Pregunta de una sola respuesta                                                  | Quién puede responder                      | Formato esperado            |
| -------------- | ------------------------------------------------------------------------------- | ------------------------------------------ | --------------------------- |
| `D-CAP006-001` | ¿Qué función autoriza actualmente cambiar una solicitud de remisión ya enviada? | responsable de sede o área solicitante     | un cargo, `NADIE` o `NO SÉ` |
| `D-CAP006-002` | ¿Qué función autoriza actualmente rechazar mercancía con diferencias?           | persona que recibe proveedores             | un cargo, `NADIE` o `NO SÉ` |
| `D-CAP006-003` | ¿Qué función autoriza actualmente ajustar una diferencia de inventario?         | responsable de inventario o sede           | un cargo, `NADIE` o `NO SÉ` |
| `D-CAP006-004` | ¿Qué función autoriza actualmente corregir un medio de pago registrado?         | cajero o responsable de sede               | un cargo, `NADIE` o `NO SÉ` |
| `D-CAP006-005` | ¿Qué función autoriza actualmente cambiar un horario publicado?                 | persona que administra horarios            | un cargo, `NADIE` o `NO SÉ` |
| `D-CAP006-006` | ¿Qué función autoriza actualmente corregir una marcación de asistencia?         | trabajador o persona que revisa asistencia | un cargo, `NADIE` o `NO SÉ` |
| `D-CAP006-007` | ¿Qué función autoriza actualmente una devolución al cliente?                    | cajero o responsable de sede               | un cargo, `NADIE` o `NO SÉ` |
| `D-CAP006-008` | ¿Qué función autoriza actualmente una compensación al cliente?                  | cajero o responsable de sede               | un cargo, `NADIE` o `NO SÉ` |

Las respuestas se incorporarán a los campos correspondientes y conservarán fecha y evidencia.

---

#### 14. Autocuestionario breve para cualquier acción

Antes de enviarlo se reemplazará `[ACCIÓN]` por una acción concreta, por ejemplo: “cambiar un medio de pago” o “rechazar mercancía”.

```text
CAP006-ACTOR — [ACCIÓN]

Responde únicamente sobre lo que ocurre actualmente.

¿Quién realiza [ACCIÓN]?

Marca UNA:
[ ] Yo
[ ] Cajero
[ ] Mesero
[ ] Responsable de sede
[ ] Gerencia General
[ ] Administración
[ ] Contabilidad
[ ] Coordinación de Operaciones
[ ] Responsable de Bodega
[ ] Responsable de Producción
[ ] Conductor
[ ] Proveedor o técnico
[ ] El sistema lo hace automáticamente
[ ] Otra función
[ ] NADIE
[ ] NO SÉ

Si marcaste “otra función”, escribe el cargo o trabajo, no el nombre:
________________________________
```

Se enviarán mensajes separados para:

```text
¿Quién pide que comience [ACCIÓN]?
¿Quién realiza [ACCIÓN]?
¿Quién revisa el resultado de [ACCIÓN]?
¿Quién autoriza [ACCIÓN] antes de que produzca efecto?
```

Cada mensaje admite una sola respuesta. No se agruparán las cuatro preguntas en una sola respuesta.

---

#### 15. Preguntas reservadas para el usuario

Después de revisar respuestas anteriores, auditorías, controles documentados y decisiones canónicas:

```text
CAP-MAP-006
→ 0 preguntas RESPONDE_USUARIO
```

Los vacíos restantes son hechos operativos observables y deben responderlos las personas que ejecutan o supervisan actualmente las acciones.

---

#### 16. Puerta de deduplicación

Antes de crear una nueva pregunta se verificará:

1. respuesta previa del usuario;
2. auditoría de actores;
3. inventario de controles sensibles;
4. matrices de roles y permisos ya aprobadas;
5. proceso ordinario y excepciones documentadas;
6. código o configuración cuando el comportamiento sea comprobable;
7. posibilidad de respuesta por observación directa.

Una pregunta resuelta se convertirá en evidencia; no permanecerá como pendiente.

---

#### 17. Lo que queda decidido

1. Las 217 subcapacidades tienen actores consultables mediante familia más excepción.
2. Iniciador, ejecutor, supervisor y aprobador permanecen separados.
3. No todas las acciones necesitan aprobación.
4. Las familias de actores AS-IS se reutilizan sin convertirlas automáticamente en cargos futuros.
5. Las coberturas temporales, rotativas, compartidas y vacantes permanecen visibles.
6. Los sistemas y terceros pueden participar, pero no asumir responsabilidad empresarial humana.
7. Las acciones sensibles conservan sus controles y vacíos reales.
8. Los nombres personales existentes en la auditoría no se convierten en estructura permanente.
9. Los vacíos operativos se consultan con quien observa el trabajo.
10. `CAP-MAP-006` no genera preguntas para el usuario.
11. Los permisos se definirán en `CAP-MAP-010`.
12. Esta tarea no cambia asignaciones, accesos, cargos ni procesos.

---

#### 18. Criterios de aceptación

`CAP-MAP-006` podrá aprobarse cuando:

- todas las subcapacidades tengan los cuatro campos de participación;
- una ausencia de aprobación esté expresada y no ocultada;
- se conserven estados confirmado, provisional, temporal, rotativo, compartido, vacante y por identificar;
- los actores ya confirmados por la auditoría no vuelvan a preguntarse;
- los controles sensibles de compras, inventario, producción, caja, pagos, personal, marketing y tecnología estén incluidos;
- las concentraciones AS-IS no se presenten como diseño objetivo;
- cada duda pendiente tenga una sola respuesta y un observador capaz de responderla;
- no se confundan actor, cargo, persona, aplicación o permiso;
- `CAP-MAP-007` permanezca como única continuidad inmediata.

---

#### 19. Resultado y continuidad

Con la aprobación quedará identificado quién activa, realiza, revisa y autoriza cada capacidad según la evidencia actual, sin inventar una estructura futura ni repetir auditorías ya resueltas.

La continuidad será exclusivamente:

```text
CAP-MAP-007
— Identificar información de entrada y resultado producido
```

`CAP-MAP-007` definirá qué información necesita cada capacidad para comenzar y qué resultado informativo produce, sin decidir todavía su fuente de verdad definitiva.
